"use client";

import { useRouter, usePathname, useSearchParams } from "next/navigation";
import { addWeeks, currentWeek, weekLabel } from "@/lib/week";

export function WeekNav({ week }: { week: string }) {
  const router = useRouter();
  const pathname = usePathname();
  const params = useSearchParams();

  function go(next: string) {
    const sp = new URLSearchParams(params.toString());
    if (next === currentWeek()) sp.delete("w");
    else sp.set("w", next);
    const qs = sp.toString();
    router.push(qs ? `${pathname}?${qs}` : pathname);
  }

  const isNow = week === currentWeek();

  return (
    <div className="flex items-center gap-1 rounded-pill border border-ink-line bg-surface p-1">
      <button
        onClick={() => go(addWeeks(week, -1))}
        className="grid h-8 w-8 place-items-center rounded-full text-ink-mute transition-colors hover:bg-canvas hover:text-ink"
        aria-label="이전 주"
      >
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="m15 6-6 6 6 6" />
        </svg>
      </button>
      <span className="min-w-[168px] text-center text-[13px] font-semibold tabular-nums">
        {weekLabel(week)}
      </span>
      <button
        onClick={() => go(addWeeks(week, 1))}
        className="grid h-8 w-8 place-items-center rounded-full text-ink-mute transition-colors hover:bg-canvas hover:text-ink"
        aria-label="다음 주"
      >
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <path d="m9 6 6 6-6 6" />
        </svg>
      </button>
      {!isNow ? (
        <button
          onClick={() => go(currentWeek())}
          className="ml-1 rounded-pill bg-canvas px-3 py-1.5 text-[12px] font-semibold text-ink-soft transition-colors hover:bg-ink-line"
        >
          이번 주
        </button>
      ) : null}
    </div>
  );
}
