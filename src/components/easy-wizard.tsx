"use client";

import Link from "next/link";
import { useEffect, useRef, useState, useTransition } from "react";
import { saveWeekly } from "@/lib/actions";

/**
 * 쉬운 주간보고.
 *
 * 한 화면에 질문 하나. 큰 글씨, 큰 버튼, "다음" 만 누르면 끝난다.
 * 컴퓨터가 익숙하지 않은 분도 막히지 않도록:
 *   - 한 번에 하나만 묻는다 (프로젝트 하나 × 금주/차주/이슈)
 *   - 한 줄에 하나씩 적으면 된다. 형식은 우리가 맞춘다
 *   - "다음" 을 누를 때마다 저장된다. 중간에 나가도 남는다
 *   - 어디까지 했는지 항상 보인다 (3 / 7)
 *
 * 저장 형식은 상세 편집기와 같다 (- 제목 /  : 상세). 여기서는 줄 앞에
 * 공백을 두면 바로 위 줄의 상세로 저장돼, 두 화면을 오가도 깨지지 않는다.
 */

type Field = "this_week" | "next_week" | "issues";

export type EasyProject = {
  id: string | null; // null = 기타 업무
  name: string;
  kind?: string;
  this_week: string;
  next_week: string;
  issues: string;
};

type Step = { project: EasyProject; field: Field };

const QUESTION: Record<Field, { title: string; help: string; example: string; optional: boolean }> = {
  this_week: {
    title: "이번 주에 무슨 일을 하셨나요?",
    help: "한 줄에 하나씩 적어 주세요. 짧아도 괜찮습니다.",
    example: "예) 고객 미팅 준비\n예) 견적서 초안 작성",
    optional: false,
  },
  next_week: {
    title: "다음 주에는 무엇을 하실 예정인가요?",
    help: "아직 정해지지 않았으면 비워 두고 다음으로 가셔도 됩니다.",
    example: "예) 고객사 방문\n예) 제안서 마무리",
    optional: true,
  },
  issues: {
    title: "막히는 일이나 도움이 필요한 일이 있나요?",
    help: "없으면 비워 두세요. 있으면 편하게 적어 주세요.",
    example: "예) 담당자 연락이 안 됩니다\n예) 장비가 부족합니다",
    optional: true,
  },
};

const FIELD_ORDER: Field[] = ["this_week", "next_week", "issues"];

/** 저장 텍스트(- 제목 /  : 상세) → 쉬운 화면용 줄 텍스트 */
function toLines(text: string): string {
  return text
    .replace(/\r/g, "")
    .split("\n")
    .filter((l) => l.trim())
    .map((l) => {
      if (/^\s*[:>》]/.test(l)) return "  " + l.replace(/^\s*[:>》]\s?/, "").trimEnd();
      return l.replace(/^\s*[-•·▶■□◦※]\s?/, "").trimEnd();
    })
    .join("\n");
}

/** 쉬운 화면 줄 텍스트 → 저장 텍스트. 앞에 공백이 있으면 윗줄의 상세 */
function fromLines(text: string): string {
  const out: string[] = [];
  for (const raw of text.replace(/\r/g, "").split("\n")) {
    if (!raw.trim()) continue;
    if (/^\s/.test(raw) && out.length) out.push(` : ${raw.trim()}`);
    else out.push(`- ${raw.trim()}`);
  }
  return out.join("\n");
}

export function EasyWizard({
  memberId,
  memberName,
  weekStart,
  weekLabel,
  projects,
}: {
  memberId: string;
  memberName: string;
  weekStart: string;
  weekLabel: string;
  projects: EasyProject[];
}) {
  const steps: Step[] = projects.flatMap((p) => FIELD_ORDER.map((field) => ({ project: p, field })));

  const [idx, setIdx] = useState(0);
  const [done, setDone] = useState(false);
  // 프로젝트별 세 칸의 현재 값 (쉬운 화면용 줄 텍스트)
  const [values, setValues] = useState<Record<string, Record<Field, string>>>(() =>
    Object.fromEntries(
      projects.map((p) => [
        p.id ?? "none",
        {
          this_week: toLines(p.this_week),
          next_week: toLines(p.next_week),
          issues: toLines(p.issues),
        },
      ])
    )
  );
  const [saving, setSaving] = useState<"idle" | "saving" | "saved">("idle");
  const [, startTransition] = useTransition();
  const areaRef = useRef<HTMLTextAreaElement>(null);

  const step = steps[idx];
  const key = step ? (step.project.id ?? "none") : "none";
  const current = step ? values[key][step.field] : "";

  // 화면이 바뀌면 바로 쓸 수 있게 커서를 넣어 준다
  useEffect(() => {
    const el = areaRef.current;
    if (!el) return;
    el.focus();
    const len = el.value.length;
    el.setSelectionRange(len, len);
  }, [idx]);

  function setCurrent(v: string) {
    setValues((prev) => ({ ...prev, [key]: { ...prev[key], [step.field]: v } }));
  }

  /** 지금 프로젝트의 세 칸을 모두 저장한다 */
  function save(projectKey: string, projectId: string | null) {
    const v = values[projectKey];
    const fd = new FormData();
    fd.set("member_id", memberId);
    fd.set("week_start", weekStart);
    if (projectId) fd.set("project_id", projectId);
    fd.set("this_week", fromLines(v.this_week));
    fd.set("next_week", fromLines(v.next_week));
    fd.set("issues", fromLines(v.issues));
    setSaving("saving");
    startTransition(async () => {
      await saveWeekly(fd);
      setSaving("saved");
      setTimeout(() => setSaving((s) => (s === "saved" ? "idle" : s)), 1500);
    });
  }

  function next() {
    save(key, step.project.id);
    if (idx + 1 >= steps.length) setDone(true);
    else setIdx(idx + 1);
  }

  function prev() {
    if (idx > 0) setIdx(idx - 1);
  }

  /** 이 프로젝트는 이번 주에 한 일이 없을 때 — 세 칸 다 건너뛴다 */
  function skipProject() {
    const nextIdx = steps.findIndex((s, i) => i > idx && s.project !== step.project);
    save(key, step.project.id);
    if (nextIdx === -1) setDone(true);
    else setIdx(nextIdx);
  }

  /* ── 다 끝났을 때 ─────────────────────────────────────── */
  if (done || steps.length === 0) {
    const filled = projects.filter((p) => {
      const v = values[p.id ?? "none"];
      return v.this_week.trim() || v.next_week.trim() || v.issues.trim();
    });
    return (
      <div className="anim-pop mx-auto max-w-[640px] rounded-[28px] bg-surface px-8 py-12 text-center shadow-card sm:px-14">
        <div className="mx-auto grid h-20 w-20 place-items-center rounded-full bg-[#DCF5E7] text-ok">
          <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round">
            <path d="m5 12.5 4.5 4.5L19 7" />
          </svg>
        </div>
        <h1 className="mt-7 text-[32px] font-extrabold leading-tight tracking-[-0.02em]">
          다 됐습니다, {memberName}님
        </h1>
        <p className="mt-3 text-[18px] leading-relaxed text-ink-soft">
          {weekLabel} 주간보고가 저장되었습니다.
          <br />
          {steps.length === 0
            ? "배정된 프로젝트가 없어 적을 칸이 없었습니다."
            : filled.length
              ? `${filled.length}개 업무를 적으셨습니다.`
              : "이번 주에는 적은 내용이 없습니다."}
        </p>
        <div className="mt-10 grid gap-3 sm:grid-cols-2">
          <button
            type="button"
            onClick={() => {
              setDone(false);
              setIdx(0);
            }}
            className="btn-outline h-16 text-[17px]"
          >
            다시 보기 · 고치기
          </button>
          <Link href={`/weekly/${memberId}?w=${weekStart}`} className="btn-dark h-16 text-[17px]">
            내 보고 확인하기
          </Link>
        </div>
        <Link
          href="/"
          className="mt-6 inline-block text-[15px] font-semibold text-ink-mute underline-offset-4 hover:text-ink hover:underline"
        >
          처음 화면으로
        </Link>
      </div>
    );
  }

  /* ── 질문 화면 ─────────────────────────────────────────── */
  const q = QUESTION[step.field];
  const isLast = idx === steps.length - 1;
  const projectStepNo = FIELD_ORDER.indexOf(step.field) + 1;

  return (
    <div className="mx-auto max-w-[760px]">
      {/* 진행 상태 */}
      <div className="mb-6 flex items-center justify-between gap-4">
        <div className="flex flex-1 items-center gap-1.5">
          {steps.map((_, i) => (
            <span
              key={i}
              className={`h-2 flex-1 rounded-pill transition-colors duration-300 ${
                i < idx ? "bg-brand-500" : i === idx ? "bg-ink" : "bg-ink-line"
              }`}
            />
          ))}
        </div>
        <span className="shrink-0 text-[17px] font-bold tabular-nums text-ink-soft">
          {idx + 1} <span className="font-medium text-ink-mute">/ {steps.length}</span>
        </span>
      </div>

      <div key={idx} className="anim-rise rounded-[28px] bg-surface p-7 shadow-card sm:p-10">
        {/* 어느 프로젝트인지 */}
        <div className="flex flex-wrap items-center gap-2">
          {step.project.kind ? (
            <span className="rounded-pill bg-canvas px-3 py-1 text-[13px] font-semibold text-ink-mute">
              {step.project.kind}
            </span>
          ) : null}
          <span className="text-[17px] font-bold text-ink-soft">{step.project.name}</span>
          <span className="ml-auto text-[13px] font-semibold text-ink-mute">
            {projectStepNo} / 3 번째 질문
          </span>
        </div>

        {/* 질문 */}
        <h1 className="mt-5 text-[28px] font-extrabold leading-[1.25] tracking-[-0.02em] sm:text-[32px]">
          {q.title}
        </h1>
        <p className="mt-3 text-[17px] leading-relaxed text-ink-soft">{q.help}</p>

        {/* 답 */}
        <textarea
          ref={areaRef}
          value={current}
          onChange={(e) => setCurrent(e.target.value)}
          placeholder={q.example}
          spellCheck={false}
          rows={6}
          className="mt-6 min-h-[200px] w-full resize-y rounded-2xl border-2 border-ink-line bg-canvas px-5 py-4
                     text-[19px] leading-[1.7] text-ink placeholder:text-ink-mute
                     focus:border-brand-500 focus:bg-surface focus:ring-4 focus:ring-brand-500/15"
        />

        {/* 버튼 */}
        <div className="mt-7 grid gap-3 sm:grid-cols-[1fr_2fr]">
          <button
            type="button"
            onClick={prev}
            disabled={idx === 0}
            className="btn-outline h-16 text-[18px] disabled:opacity-30"
          >
            ← 이전
          </button>
          <button type="button" onClick={next} className="btn-dark h-16 text-[19px]">
            {isLast ? "완료" : q.optional && !current.trim() ? "비워 두고 다음 →" : "다음 →"}
          </button>
        </div>

        <div className="mt-5 flex flex-wrap items-center justify-between gap-3 text-[15px]">
          {step.field === "this_week" ? (
            <button
              type="button"
              onClick={skipProject}
              className="font-semibold text-ink-mute underline-offset-4 hover:text-ink hover:underline"
            >
              이번 주엔 이 업무를 안 했어요 → 건너뛰기
            </button>
          ) : (
            <span />
          )}
          <span
            className={`font-semibold text-ok transition-opacity ${
              saving === "idle" ? "opacity-0" : "opacity-100"
            }`}
          >
            {saving === "saving" ? "저장하는 중…" : "저장됐습니다 ✓"}
          </span>
        </div>
      </div>

      <p className="mt-6 text-center text-[15px] leading-relaxed text-ink-mute">
        &ldquo;다음&rdquo; 을 누를 때마다 저장됩니다. 중간에 나가도 적은 내용은 남아 있어요.
      </p>
    </div>
  );
}
