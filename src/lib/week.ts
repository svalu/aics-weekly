/** 주차 계산은 전부 한국시간(KST) 기준 월요일 시작. */

const KST_OFFSET_MIN = 9 * 60;

export function kstToday(): Date {
  const now = new Date();
  const utc = now.getTime() + now.getTimezoneOffset() * 60_000;
  const kst = new Date(utc + KST_OFFSET_MIN * 60_000);
  return new Date(kst.getFullYear(), kst.getMonth(), kst.getDate());
}

export function toISO(d: Date): string {
  const p = (n: number) => String(n).padStart(2, "0");
  return `${d.getFullYear()}-${p(d.getMonth() + 1)}-${p(d.getDate())}`;
}

export function fromISO(s: string): Date {
  const [y, m, d] = s.split("-").map(Number);
  return new Date(y, m - 1, d);
}

/** 그 날짜가 속한 주의 월요일 */
export function weekStart(d: Date = kstToday()): Date {
  const day = (d.getDay() + 6) % 7; // 월=0
  return new Date(d.getFullYear(), d.getMonth(), d.getDate() - day);
}

export function addWeeks(iso: string, n: number): string {
  const d = fromISO(iso);
  return toISO(new Date(d.getFullYear(), d.getMonth(), d.getDate() + n * 7));
}

export function currentWeek(): string {
  return toISO(weekStart());
}

/**
 * 그 주(월~금)가 어느 달에 속하는지. 기존 엑셀 관례를 따른다:
 * 주중 5일이 더 많이 걸친 달이 그 주의 달이다.
 * 예) 08/31~09/04 → 9월(4일), 09/28~10/02 → 9월(3일)
 */
function weekMonth(mon: Date): { year: number; month: number } {
  const tally = new Map<string, number>();
  for (let i = 0; i < 5; i++) {
    const d = new Date(mon.getFullYear(), mon.getMonth(), mon.getDate() + i);
    const key = `${d.getFullYear()}-${d.getMonth()}`;
    tally.set(key, (tally.get(key) ?? 0) + 1);
  }
  const [key] = [...tally.entries()].sort((a, b) => b[1] - a[1])[0];
  const [year, month] = key.split("-").map(Number);
  return { year, month };
}

/** 그 달의 몇 번째 주인지 (엑셀 관례) */
function weekOfMonth(mon: Date): number {
  const target = weekMonth(mon);
  let n = 1;
  let cur = new Date(mon.getFullYear(), mon.getMonth(), mon.getDate() - 7);
  while (true) {
    const m = weekMonth(cur);
    if (m.year !== target.year || m.month !== target.month) break;
    n++;
    cur = new Date(cur.getFullYear(), cur.getMonth(), cur.getDate() - 7);
  }
  return n;
}

/** '2026-09-14' → '9월 3주차 (09/14~09/18)' */
export function weekLabel(iso: string): string {
  const mon = fromISO(iso);
  const fri = new Date(mon.getFullYear(), mon.getMonth(), mon.getDate() + 4);
  const p = (n: number) => String(n).padStart(2, "0");
  const { month } = weekMonth(mon);
  return `${month + 1}월 ${weekOfMonth(mon)}주차 (${p(mon.getMonth() + 1)}/${p(
    mon.getDate()
  )}~${p(fri.getMonth() + 1)}/${p(fri.getDate())})`;
}

export function weekLabelShort(iso: string): string {
  const mon = fromISO(iso);
  const fri = new Date(mon.getFullYear(), mon.getMonth(), mon.getDate() + 4);
  const p = (n: number) => String(n).padStart(2, "0");
  return `${p(mon.getMonth() + 1)}/${p(mon.getDate())}~${p(fri.getMonth() + 1)}/${p(
    fri.getDate()
  )}`;
}

/** 최근 n주 (오래된 순) */
export function recentWeeks(n: number, endIso: string = currentWeek()): string[] {
  return Array.from({ length: n }, (_, i) => addWeeks(endIso, i - (n - 1)));
}

export function fmtDate(iso: string | null | undefined): string {
  if (!iso) return "—";
  const d = fromISO(iso.slice(0, 10));
  const p = (x: number) => String(x).padStart(2, "0");
  return `${d.getFullYear()}.${p(d.getMonth() + 1)}.${p(d.getDate())}`;
}

export function fmtDateShort(iso: string | null | undefined): string {
  if (!iso) return "—";
  const d = fromISO(iso.slice(0, 10));
  return `${d.getMonth() + 1}/${d.getDate()}`;
}

/** target_date 기준 남은/지난 일수. 음수면 지연. */
export function daysLeft(targetIso: string | null | undefined): number | null {
  if (!targetIso) return null;
  const t = fromISO(targetIso.slice(0, 10));
  const today = kstToday();
  return Math.round((t.getTime() - today.getTime()) / 86_400_000);
}
