"use client";

import { useEffect, useState, type ReactNode } from "react";

/**
 * 오른쪽에서 밀려나오는 편집 패널.
 * trigger 를 누르면 열리고, 안의 form 이 submit 되면 닫힌다.
 *
 * 닫을 때 바로 사라지지 않고 "closing" 상태를 거쳐 나가는 애니메이션이
 * 끝난 뒤 언마운트한다. 그래야 들어올 때와 나갈 때 리듬이 맞는다.
 */
export function Sheet({
  trigger,
  title,
  sub,
  children,
  wide = false,
}: {
  trigger: ReactNode;
  title: string;
  sub?: string;
  children: ReactNode | ((close: () => void) => ReactNode);
  wide?: boolean;
}) {
  const [state, setState] = useState<"closed" | "open" | "closing">("closed");
  const open = state !== "closed";

  const close = () => setState((s) => (s === "open" ? "closing" : s));

  // 백그라운드 탭처럼 애니메이션이 진행되지 않는 환경에서는 animationend 가
  // 오지 않는다. 그래도 패널이 남아 있으면 안 되니 시간이 지나면 강제로 닫는다.
  useEffect(() => {
    if (state !== "closing") return;
    const t = setTimeout(() => setState("closed"), 400);
    return () => clearTimeout(t);
  }, [state]);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && close();
    document.addEventListener("keydown", onKey);
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.removeEventListener("keydown", onKey);
      document.body.style.overflow = prev;
    };
  }, [open]);

  return (
    <>
      <button type="button" onClick={() => setState("open")} className="contents">
        {trigger}
      </button>

      {open ? (
        <div className="fixed inset-0 z-50 flex justify-end">
          <div
            className={`absolute inset-0 bg-ink/25 backdrop-blur-[2px] ${
              state === "closing" ? "backdrop-out" : "backdrop-in"
            }`}
            onClick={close}
          />
          <div
            onAnimationEnd={(e) => {
              // 자식 애니메이션이 아니라 패널 자신의 퇴장이 끝났을 때만
              if (state === "closing" && e.target === e.currentTarget) setState("closed");
            }}
            className={`relative flex h-full w-full flex-col bg-surface shadow-pop sm:m-3 sm:h-[calc(100%-1.5rem)] sm:rounded-card ${
              wide ? "sm:max-w-[760px]" : "sm:max-w-[520px]"
            } ${state === "closing" ? "sheet-out" : "sheet-in"}`}
          >
            <div className="flex items-start justify-between gap-4 border-b border-ink-line px-6 py-4">
              <div className="min-w-0">
                <h2 className="text-[17px] font-bold tracking-[-0.01em]">{title}</h2>
                {sub ? <p className="mt-0.5 text-[13px] text-ink-mute">{sub}</p> : null}
              </div>
              <button
                onClick={close}
                className="pressable grid h-8 w-8 shrink-0 place-items-center rounded-full text-ink-mute hover:bg-canvas hover:text-ink"
                aria-label="닫기"
              >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
                  <path d="M6 6l12 12M18 6 6 18" />
                </svg>
              </button>
            </div>
            <div className="flex-1 overflow-y-auto px-6 py-5">
              {typeof children === "function" ? children(close) : children}
            </div>
          </div>
        </div>
      ) : null}
    </>
  );
}

/** 폼 필드 묶음 */
export function Field({
  label,
  children,
  hint,
}: {
  label: string;
  children: ReactNode;
  hint?: string;
}) {
  return (
    <label className="block">
      <span className="label">{label}</span>
      {children}
      {hint ? <span className="mt-1 block text-[11.5px] text-ink-mute">{hint}</span> : null}
    </label>
  );
}

export function Row({ children }: { children: ReactNode }) {
  return <div className="grid gap-3 sm:grid-cols-2">{children}</div>;
}
