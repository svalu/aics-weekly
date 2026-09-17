"use client";

import { useEffect, useRef, useState, useTransition } from "react";
import { saveWeekly } from "@/lib/actions";

/**
 * 주간보고 입력기.
 *
 * 한 칸에 자유롭게 쓰는 대신 "제목 + 상세" 항목 단위로 쓴다.
 * 저장은 기존 엑셀 관례 그대로 텍스트로 한다:
 *
 *   - 제목
 *    : 상세 1
 *    : 상세 2
 *
 * 그래서 예전에 쓴 보고도 그대로 읽히고, 다른 곳에서 텍스트로 봐도 읽힌다.
 *
 * 키보드만으로 끝까지 쓸 수 있게:
 *   Tab            제목 → 상세 → 다음 항목 제목 (없으면 새로 만든다)
 *                  마지막 빈 항목에서 Tab → 다음 섹션(차주 → 이슈)으로
 *   Enter (제목)   상세로 내려간다
 *   Ctrl+Enter     새 항목 추가
 *   Backspace      빈 항목에서 → 항목 삭제, 이전 항목으로
 */

type Section = "this_week" | "next_week" | "issues";
type Item = { id: string; title: string; detail: string };
type Draft = Record<Section, Item[]>;

const SECTIONS: { key: Section; label: string; hint: string }[] = [
  { key: "this_week", label: "금주 업무", hint: "이번 주에 한 일" },
  { key: "next_week", label: "차주 업무", hint: "다음 주에 할 일" },
  { key: "issues", label: "이슈 사항", hint: "막힌 것, 도움이 필요한 것" },
];

let seq = 0;
const newId = () => `i${Date.now().toString(36)}${(seq++).toString(36)}`;
const blank = (): Item => ({ id: newId(), title: "", detail: "" });

const TITLE_MARK = /^\s*[-•·▶■□◦※]\s?/;
const DETAIL_MARK = /^\s*[:>》]\s?/;

/** 저장된 텍스트 → 항목 목록 */
function parse(text: string): Item[] {
  const items: Item[] = [];
  for (const raw of text.replace(/\r/g, "").split("\n")) {
    if (!raw.trim()) continue;
    if (DETAIL_MARK.test(raw) && items.length) {
      const cur = items[items.length - 1];
      const line = raw.replace(DETAIL_MARK, "").trimEnd();
      cur.detail = cur.detail ? `${cur.detail}\n${line}` : line;
      continue;
    }
    items.push({
      id: newId(),
      title: raw.replace(TITLE_MARK, "").replace(DETAIL_MARK, "").trim(),
      detail: "",
    });
  }
  return items;
}

/** 항목 목록 → 저장용 텍스트. 빈 항목은 버린다. */
function serialize(items: Item[]): string {
  return items
    .filter((it) => it.title.trim() || it.detail.trim())
    .map((it) => {
      const head = `- ${it.title.trim()}`;
      const lines = it.detail
        .split("\n")
        .map((l) => l.trim())
        .filter(Boolean)
        .map((l) => ` : ${l}`);
      return [head, ...lines].join("\n");
    })
    .join("\n");
}

const isBlank = (i: Item) => !i.title.trim() && !i.detail.trim();

/**
 * 편집 중에는 목록 끝에 항상 빈 항목 하나를 둔다 — 다음 걸 바로 쓸 자리.
 * 렌더할 때 즉석에서 만들면 id 가 매번 바뀌어 포커스가 날아가므로
 * 상태 안에서 관리한다. 중간의 빈 항목은 정리한다.
 */
function withTrailingBlank(list: Item[]): Item[] {
  const kept = list.filter((i, idx) => !isBlank(i) || idx === list.length - 1);
  if (!kept.length || !isBlank(kept[kept.length - 1])) kept.push(blank());
  return kept;
}

function fromInitial(initial: Record<Section, string>): Draft {
  return {
    this_week: withTrailingBlank(parse(initial.this_week)),
    next_week: withTrailingBlank(parse(initial.next_week)),
    issues: withTrailingBlank(parse(initial.issues)),
  };
}

const hasContent = (items: Item[]) => items.some((i) => !isBlank(i));

type Props = {
  memberId: string;
  weekStart: string;
  projectId: string | null;
  projectName: string;
  projectKind?: string;
  initial: Record<Section, string>;
  readOnly?: boolean;
};

export function WeeklyEditor({
  memberId,
  weekStart,
  projectId,
  projectName,
  projectKind,
  initial,
  readOnly = false,
}: Props) {
  const [section, setSection] = useState<Section>("this_week");
  const [draft, setDraft] = useState<Draft>(() => fromInitial(initial));
  const [saved, setSaved] = useState<"idle" | "saving" | "done">("idle");
  const [, startTransition] = useTransition();

  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const dirty = useRef(false);
  const latest = useRef(draft);
  latest.current = draft;

  // 포커스 예약: 항목을 새로 만든 뒤 렌더가 끝나면 그 칸으로 간다
  const [focusReq, setFocusReq] = useState<{ id: string; field: "title" | "detail" } | null>(null);
  const fieldRefs = useRef(new Map<string, HTMLInputElement | HTMLTextAreaElement>());
  const refKey = (id: string, field: "title" | "detail") => `${id}:${field}`;

  useEffect(() => {
    if (!focusReq) return;
    const el = fieldRefs.current.get(refKey(focusReq.id, focusReq.field));
    if (el) {
      el.focus();
      // 커서를 끝으로
      const len = el.value.length;
      try {
        el.setSelectionRange(len, len);
      } catch {
        /* input type 에 따라 실패할 수 있다 */
      }
    }
    setFocusReq(null);
  }, [focusReq, draft, section]);

  // 서버 값이 바뀌면(주차 이동 등) 초안을 다시 맞춘다
  useEffect(() => {
    setDraft(fromInitial(initial));
    dirty.current = false;
    setSaved("idle");
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [initial.this_week, initial.next_week, initial.issues, weekStart, projectId]);

  function commit(d: Draft) {
    const fd = new FormData();
    fd.set("member_id", memberId);
    fd.set("week_start", weekStart);
    if (projectId) fd.set("project_id", projectId);
    fd.set("this_week", serialize(d.this_week));
    fd.set("next_week", serialize(d.next_week));
    fd.set("issues", serialize(d.issues));
    setSaved("saving");
    startTransition(async () => {
      await saveWeekly(fd);
      dirty.current = false;
      setSaved("done");
      setTimeout(() => setSaved((s) => (s === "done" ? "idle" : s)), 1800);
    });
  }

  function update(next: Draft) {
    setDraft(next);
    dirty.current = true;
    if (timer.current) clearTimeout(timer.current);
    timer.current = setTimeout(() => commit(next), 900);
  }

  // 창을 닫거나 화면을 뜰 때 아직 안 보낸 입력을 흘리지 않도록 (deps 비움 - 중요)
  useEffect(() => {
    function flush() {
      if (!dirty.current) return;
      if (timer.current) clearTimeout(timer.current);
      commit(latest.current);
    }
    window.addEventListener("beforeunload", flush);
    return () => {
      window.removeEventListener("beforeunload", flush);
      flush();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  /* ── 항목 조작 ─────────────────────────────────────── */
  const items = draft[section];
  // 상태가 이미 끝에 빈 항목을 보장하므로 그대로 보여준다
  const shown = items;

  function setItems(sec: Section, list: Item[]) {
    update({ ...draft, [sec]: withTrailingBlank(list) });
  }

  function patch(id: string, field: "title" | "detail", value: string) {
    setItems(section, items.map((i) => (i.id === id ? { ...i, [field]: value } : i)));
  }

  function insertAfter(id: string): string {
    const idx = items.findIndex((i) => i.id === id);
    const fresh = blank();
    const list = [...items];
    list.splice(idx + 1, 0, fresh);
    setItems(section, list);
    return fresh.id;
  }

  function remove(id: string) {
    const idx = items.findIndex((i) => i.id === id);
    setItems(section, items.filter((i) => i.id !== id));
    const prev = items[idx - 1];
    if (prev) setFocusReq({ id: prev.id, field: "detail" });
  }

  function goNextSection(): boolean {
    const i = SECTIONS.findIndex((s) => s.key === section);
    const next = SECTIONS[i + 1];
    if (!next) return false;
    setSection(next.key);
    // 다음 섹션도 끝에 빈 항목이 보장되므로 첫 칸은 항상 있다
    setFocusReq({ id: draft[next.key][0].id, field: "title" });
    return true;
  }

  /* ── 키보드 ─────────────────────────────────────────── */
  function onTitleKey(e: React.KeyboardEvent<HTMLInputElement>, it: Item, isLast: boolean) {
    if (e.key === "Enter" && !e.ctrlKey && !e.metaKey) {
      e.preventDefault();
      setFocusReq({ id: it.id, field: "detail" });
      return;
    }
    if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) {
      e.preventDefault();
      setFocusReq({ id: insertAfter(it.id), field: "title" });
      return;
    }
    if (e.key === "Tab" && !e.shiftKey && isLast && !it.title && !it.detail) {
      // 빈 마지막 항목에서 Tab → 다음 섹션으로 흘러간다
      if (goNextSection()) e.preventDefault();
      return;
    }
    if (e.key === "Backspace" && !it.title && !it.detail && shown.length > 1) {
      e.preventDefault();
      remove(it.id);
    }
  }

  function onDetailKey(e: React.KeyboardEvent<HTMLTextAreaElement>, it: Item, idx: number) {
    if (e.key === "Tab" && !e.shiftKey) {
      e.preventDefault();
      const next = shown[idx + 1];
      if (next) setFocusReq({ id: next.id, field: "title" });
      else setFocusReq({ id: insertAfter(it.id), field: "title" });
      return;
    }
    if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) {
      e.preventDefault();
      setFocusReq({ id: insertAfter(it.id), field: "title" });
      return;
    }
    if (e.key === "Backspace" && !it.detail && !it.title && shown.length > 1) {
      e.preventDefault();
      remove(it.id);
    }
  }

  const sec = SECTIONS.find((s) => s.key === section)!;

  return (
    <div className="rounded-card border border-ink-line bg-surface">
      {/* 머리 */}
      <div className="flex flex-wrap items-center gap-2 border-b border-ink-line px-4 py-3">
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2">
            {projectKind ? (
              <span className="chip bg-canvas text-ink-mute">{projectKind}</span>
            ) : null}
            <h3 className="truncate text-[14px] font-bold">{projectName}</h3>
          </div>
        </div>
        <div className="flex items-center gap-1 rounded-pill bg-canvas p-1">
          {SECTIONS.map((s) => (
            <button
              key={s.key}
              type="button"
              onClick={() => setSection(s.key)}
              className={`pressable relative rounded-pill px-3 py-1.5 text-[12.5px] font-semibold ${
                section === s.key
                  ? "bg-surface text-ink shadow-sm"
                  : "text-ink-mute hover:text-ink-soft"
              }`}
            >
              {s.label}
              {hasContent(draft[s.key]) ? (
                <span
                  className={`ml-1.5 inline-block h-1.5 w-1.5 rounded-full align-middle ${
                    s.key === "issues" ? "bg-danger" : "bg-brand-500"
                  }`}
                />
              ) : null}
            </button>
          ))}
        </div>
      </div>

      {/* 본문 */}
      <div key={section} className="anim-fade p-4">
        {readOnly ? (
          hasContent(items) ? (
            <ul className="space-y-3">
              {items.filter((it) => !isBlank(it)).map((it) => (
                <li key={it.id} className="flex gap-3">
                  <span className="mt-[7px] h-1.5 w-1.5 shrink-0 rounded-full bg-brand-500" />
                  <div className="min-w-0">
                    <p className="text-[13.5px] font-semibold leading-snug">{it.title}</p>
                    {it.detail ? (
                      <p className="prose-report mt-1 border-l-2 border-ink-line pl-3">
                        {it.detail}
                      </p>
                    ) : null}
                  </div>
                </li>
              ))}
            </ul>
          ) : (
            <p className="py-6 text-center text-[13px] text-ink-mute">내용 없음</p>
          )
        ) : (
          <ol className="space-y-2">
            {shown.map((it, idx) => {
              const isLast = idx === shown.length - 1;
              const empty = !it.title && !it.detail;
              return (
                <li
                  key={it.id}
                  className={`group rounded-2xl transition-colors ${
                    empty && isLast ? "bg-transparent" : "bg-canvas"
                  }`}
                >
                  <div className="flex items-start gap-2 px-3 pt-2.5">
                    <span
                      className={`mt-[11px] h-1.5 w-1.5 shrink-0 rounded-full transition-colors ${
                        empty ? "bg-ink-line" : "bg-brand-500"
                      }`}
                    />
                    <input
                      ref={(el) => {
                        if (el) fieldRefs.current.set(refKey(it.id, "title"), el);
                        else fieldRefs.current.delete(refKey(it.id, "title"));
                      }}
                      value={it.title}
                      onChange={(e) => patch(it.id, "title", e.target.value)}
                      onKeyDown={(e) => onTitleKey(e, it, isLast)}
                      placeholder={
                        idx === 0 && empty
                          ? `${sec.hint} — 한 줄로`
                          : empty
                            ? "다음 항목 (Tab 으로 넘어와요)"
                            : ""
                      }
                      spellCheck={false}
                      className="w-full bg-transparent py-1.5 text-[13.5px] font-semibold text-ink placeholder:font-medium placeholder:text-ink-mute"
                    />
                    {!empty ? (
                      <button
                        type="button"
                        tabIndex={-1}
                        onClick={() => remove(it.id)}
                        title="항목 삭제"
                        className="pressable mt-1 grid h-6 w-6 shrink-0 place-items-center rounded-full text-ink-mute opacity-0 hover:bg-ink-line hover:text-danger group-hover:opacity-100 focus:opacity-100"
                      >
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round">
                          <path d="M6 6l12 12M18 6 6 18" />
                        </svg>
                      </button>
                    ) : null}
                  </div>

                  {/* 상세: 빈 마지막 항목에서는 제목을 치기 전까지 숨긴다 */}
                  {!(empty && isLast) ? (
                    <div className="flex gap-2 px-3 pb-2.5 pl-[22px]">
                      <span className="mt-1 w-0.5 shrink-0 rounded-full bg-ink-line" />
                      <textarea
                        ref={(el) => {
                          if (el) fieldRefs.current.set(refKey(it.id, "detail"), el);
                          else fieldRefs.current.delete(refKey(it.id, "detail"));
                        }}
                        value={it.detail}
                        onChange={(e) => patch(it.id, "detail", e.target.value)}
                        onKeyDown={(e) => onDetailKey(e, it, idx)}
                        placeholder="세부 내용 · 여러 줄 가능 · Tab 으로 다음 항목"
                        spellCheck={false}
                        rows={1}
                        className="autogrow-sm w-full resize-none bg-transparent py-1 text-[13px] leading-[1.7] text-ink-soft placeholder:text-ink-mute"
                      />
                    </div>
                  ) : null}
                </li>
              );
            })}
          </ol>
        )}
      </div>

      {!readOnly ? (
        <div className="flex items-center justify-between px-4 pb-3 text-[11.5px] text-ink-mute">
          <span className="hidden sm:inline">
            <kbd className="rounded bg-canvas px-1.5 py-0.5 font-sans">Tab</kbd> 다음 칸 ·{" "}
            <kbd className="rounded bg-canvas px-1.5 py-0.5 font-sans">Enter</kbd> 상세로 ·{" "}
            <kbd className="rounded bg-canvas px-1.5 py-0.5 font-sans">Ctrl+Enter</kbd> 새 항목 · 자동 저장
          </span>
          <span className="sm:hidden">자동 저장됩니다</span>
          <span className={`transition-opacity ${saved === "idle" ? "opacity-0" : "opacity-100"}`}>
            {saved === "saving" ? "저장 중…" : "저장됨"}
          </span>
        </div>
      ) : null}
    </div>
  );
}
