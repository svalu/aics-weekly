"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState, useTransition } from "react";
import { sendFeedback } from "@/lib/actions";
import { APP_VERSION } from "@/lib/version";
import { FEEDBACK_KINDS } from "@/lib/types";

/**
 * 베타 피드백 버튼. 화면 오른쪽 아래, 버전 배지 옆.
 * 누르면 작은 카드가 올라오고, 종류 하나 고르고 한두 줄 적어 보내면 끝.
 * 어느 화면에서 남겼는지(pathname)와 그때 버전을 같이 저장한다.
 */
export function FeedbackButton() {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const [kind, setKind] = useState<string>(FEEDBACK_KINDS[1]);
  const [body, setBody] = useState("");
  const [sent, setSent] = useState(false);
  const [pending, startTransition] = useTransition();

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    document.addEventListener("keydown", onKey);
    return () => document.removeEventListener("keydown", onKey);
  }, [open]);

  function submit() {
    if (!body.trim()) return;
    const fd = new FormData();
    fd.set("kind", kind);
    fd.set("body", body.trim());
    fd.set("page", pathname);
    fd.set("version", APP_VERSION);
    startTransition(async () => {
      await sendFeedback(fd);
      setSent(true);
      setBody("");
      setTimeout(() => {
        setSent(false);
        setOpen(false);
      }, 1600);
    });
  }

  return (
    <div className="relative">
      {open ? (
        <>
          <div className="pointer-events-auto fixed inset-0 z-40" onClick={() => setOpen(false)} />
          {/* 버튼 바로 위, 오른쪽 정렬로 뜬다 */}
          <div className="anim-pop pointer-events-auto absolute bottom-full right-0 z-50 mb-2 w-[min(360px,calc(100vw-1.5rem))] origin-bottom-right rounded-2xl bg-surface p-4 shadow-pop">
            {sent ? (
              <div className="py-6 text-center">
                <div className="mx-auto grid h-11 w-11 place-items-center rounded-full bg-[#DCF5E7] text-ok">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.4" strokeLinecap="round" strokeLinejoin="round">
                    <path d="m5 12.5 4.5 4.5L19 7" />
                  </svg>
                </div>
                <p className="mt-3 text-[14px] font-bold">고맙습니다</p>
                <p className="mt-0.5 text-[12.5px] text-ink-mute">의견이 잘 전달됐습니다.</p>
              </div>
            ) : (
              <>
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <p className="text-[14px] font-bold">베타 피드백</p>
                    <p className="mt-0.5 text-[12px] text-ink-mute">
                      불편한 점, 고장난 곳, 있으면 좋겠는 것. 짧아도 됩니다.
                    </p>
                  </div>
                  <span className="chip shrink-0 bg-brand-50 text-brand-700">v{APP_VERSION}</span>
                </div>

                <div className="mt-3 flex gap-1 rounded-pill bg-canvas p-1">
                  {FEEDBACK_KINDS.map((k) => (
                    <button
                      key={k}
                      type="button"
                      onClick={() => setKind(k)}
                      className={`pressable flex-1 rounded-pill py-1.5 text-[12.5px] font-semibold ${
                        kind === k ? "bg-surface text-ink shadow-sm" : "text-ink-mute hover:text-ink-soft"
                      }`}
                    >
                      {k}
                    </button>
                  ))}
                </div>

                <textarea
                  autoFocus
                  value={body}
                  onChange={(e) => setBody(e.target.value)}
                  onKeyDown={(e) => {
                    if ((e.ctrlKey || e.metaKey) && e.key === "Enter") submit();
                  }}
                  rows={4}
                  placeholder={
                    kind === "버그"
                      ? "어디서 무엇을 했을 때 어떻게 됐나요?"
                      : kind === "아이디어"
                        ? "이런 게 있으면 좋겠어요…"
                        : "이 부분이 불편해요…"
                  }
                  className="field mt-3 resize-none text-[13px] leading-relaxed"
                />

                <div className="mt-3 flex items-center justify-between gap-2">
                  <span className="truncate text-[11px] text-ink-mute" title={pathname}>
                    화면: {pathname}
                  </span>
                  <div className="flex shrink-0 items-center gap-1.5">
                    <Link
                      href="/feedback"
                      onClick={() => setOpen(false)}
                      className="rounded-pill px-3 py-2 text-[12.5px] font-semibold text-ink-mute hover:bg-canvas hover:text-ink"
                    >
                      모아 보기
                    </Link>
                    <button
                      type="button"
                      onClick={submit}
                      disabled={!body.trim() || pending}
                      className="btn-brand px-4 py-2 text-[13px]"
                    >
                      {pending ? "보내는 중…" : "보내기"}
                    </button>
                  </div>
                </div>
              </>
            )}
          </div>
        </>
      ) : null}

      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="pressable pointer-events-auto inline-flex h-8 items-center gap-1.5 rounded-pill bg-brand-500 px-3 text-[12px] font-bold text-white shadow-card hover:bg-brand-600"
        title="베타 피드백 남기기"
      >
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
          <path d="M21 12a8 8 0 0 1-8 8H4l1.6-3.2A8 8 0 1 1 21 12Z" />
        </svg>
        피드백
      </button>
    </div>
  );
}
