"use client";

import { useEffect, useRef, useState, useTransition } from "react";
import { saveWeekly } from "@/lib/actions";

type Props = {
  memberId: string;
  weekStart: string;
  projectId: string | null;
  projectName: string;
  projectKind?: string;
  initial: { this_week: string; next_week: string; issues: string };
  readOnly?: boolean;
};

const TABS = [
  { key: "this_week", label: "금주 업무" },
  { key: "next_week", label: "차주 업무" },
  { key: "issues", label: "이슈 사항" },
] as const;

const PLACEHOLDER: Record<string, string> = {
  this_week: "- 이번 주에 한 일\n : 세부 내용 (~9/18)",
  next_week: "- 다음 주에 할 일",
  issues: "막힌 것, 도움이 필요한 것. 없으면 비워두세요.",
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
  const [tab, setTab] = useState<(typeof TABS)[number]["key"]>("this_week");
  const [draft, setDraft] = useState(initial);
  const [saved, setSaved] = useState<"idle" | "saving" | "done">("idle");
  const [, startTransition] = useTransition();
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const dirty = useRef(false);
  // 마지막으로 친 내용. 창을 닫거나 화면을 뜰 때 이 값을 흘려보낸다.
  const latest = useRef(draft);
  latest.current = draft;

  // 서버 쪽 값이 바뀌면(주차 변경 등) 초안을 맞춘다
  useEffect(() => {
    setDraft(initial);
    dirty.current = false;
    setSaved("idle");
  }, [initial.this_week, initial.next_week, initial.issues, weekStart, projectId]);

  function commit(next: typeof draft) {
    const fd = new FormData();
    fd.set("member_id", memberId);
    fd.set("week_start", weekStart);
    if (projectId) fd.set("project_id", projectId);
    fd.set("this_week", next.this_week);
    fd.set("next_week", next.next_week);
    fd.set("issues", next.issues);
    setSaved("saving");
    startTransition(async () => {
      await saveWeekly(fd);
      dirty.current = false;
      setSaved("done");
      setTimeout(() => setSaved((s) => (s === "done" ? "idle" : s)), 1800);
    });
  }

  function onChange(key: typeof tab, value: string) {
    const next = { ...draft, [key]: value };
    setDraft(next);
    dirty.current = true;
    if (timer.current) clearTimeout(timer.current);
    timer.current = setTimeout(() => commit(next), 900);
  }

  // 창을 닫거나 이 화면을 뜰 때 아직 안 보낸 입력을 흘리지 않도록.
  // deps 를 비워 두는 게 중요하다. draft 를 넣으면 글자를 칠 때마다
  // cleanup 이 돌면서 '한 글자 전' 값으로 저장해 버린다.
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

  const filled = (v: string) => v.trim().length > 0;

  return (
    <div className="rounded-card border border-ink-line bg-surface">
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
          {TABS.map((t) => (
            <button
              key={t.key}
              type="button"
              onClick={() => setTab(t.key)}
              className={`relative rounded-pill px-3 py-1.5 text-[12.5px] font-semibold transition-colors ${
                tab === t.key
                  ? "bg-surface text-ink shadow-sm"
                  : "text-ink-mute hover:text-ink-soft"
              }`}
            >
              {t.label}
              {filled(draft[t.key]) ? (
                <span
                  className={`ml-1.5 inline-block h-1.5 w-1.5 rounded-full align-middle ${
                    t.key === "issues" ? "bg-danger" : "bg-brand-500"
                  }`}
                />
              ) : null}
            </button>
          ))}
        </div>
      </div>

      <div className="p-4">
        {readOnly ? (
          draft[tab].trim() ? (
            <p className="prose-report">{draft[tab]}</p>
          ) : (
            <p className="py-6 text-center text-[13px] text-ink-mute">
              내용 없음
            </p>
          )
        ) : (
          <textarea
            value={draft[tab]}
            onChange={(e) => onChange(tab, e.target.value)}
            placeholder={PLACEHOLDER[tab]}
            spellCheck={false}
            className="autogrow w-full resize-none rounded-2xl bg-canvas p-4 text-[13px] leading-[1.75]
                       text-ink placeholder:text-ink-mute focus:ring-4 focus:ring-brand-500/10"
          />
        )}
      </div>

      {!readOnly ? (
        <div className="flex items-center justify-between px-4 pb-3 text-[11.5px] text-ink-mute">
          <span>자동 저장됩니다</span>
          <span
            className={`transition-opacity ${
              saved === "idle" ? "opacity-0" : "opacity-100"
            }`}
          >
            {saved === "saving" ? "저장 중…" : "저장됨"}
          </span>
        </div>
      ) : null}
    </div>
  );
}
