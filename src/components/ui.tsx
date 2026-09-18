import Link from "next/link";
import type { ReactNode } from "react";
import { CountUp } from "./count-up";

/* ── 아바타 ──────────────────────────────────────────── */
const AVATAR_TONES = [
  "bg-brand-100 text-brand-700",
  "bg-[#DDEBFF] text-[#1D4ED8]",
  "bg-[#DCF5E7] text-[#0F7C43]",
  "bg-[#F3E4FF] text-[#7126B5]",
  "bg-[#FFECC7] text-[#96650A]",
  "bg-[#E4E7EC] text-[#3B3A34]",
];

export function toneFor(seed: string) {
  let h = 0;
  for (let i = 0; i < seed.length; i++) h = (h * 31 + seed.charCodeAt(i)) >>> 0;
  return AVATAR_TONES[h % AVATAR_TONES.length];
}

export function Avatar({
  name,
  size = 34,
  className = "",
}: {
  name: string;
  size?: number;
  className?: string;
}) {
  const initials = name.length > 2 ? name.slice(-2) : name;
  return (
    <span
      className={`inline-flex shrink-0 items-center justify-center rounded-full font-semibold ${toneFor(
        name
      )} ${className}`}
      style={{ width: size, height: size, fontSize: Math.round(size * 0.36) }}
      title={name}
    >
      {initials}
    </span>
  );
}

/* ── 카드 ────────────────────────────────────────────── */
export function Card({
  children,
  className = "",
}: {
  children: ReactNode;
  className?: string;
}) {
  return <section className={`card ${className}`}>{children}</section>;
}

export function CardHead({
  title,
  sub,
  right,
}: {
  title: ReactNode;
  sub?: ReactNode;
  right?: ReactNode;
}) {
  return (
    <div className="flex items-start justify-between gap-4 px-6 pt-5">
      <div className="min-w-0">
        <h2 className="text-[17px] font-bold tracking-[-0.01em]">{title}</h2>
        {sub ? <p className="mt-0.5 text-[13px] text-ink-mute">{sub}</p> : null}
      </div>
      {right ? <div className="shrink-0">{right}</div> : null}
    </div>
  );
}

/* ── KPI 타일 ────────────────────────────────────────── */
export function Stat({
  label,
  value,
  delta,
  note,
  icon,
  accent = false,
  href,
}: {
  label: string;
  value: ReactNode;
  delta?: { dir: "up" | "down" | "flat"; text: string };
  note?: string;
  icon?: ReactNode;
  accent?: boolean;
  href?: string;
}) {
  const body = (
    <div
      className={`flex h-full flex-col justify-between rounded-card p-4 sm:p-5 ${
        accent ? "bg-brand-500 text-white" : "bg-surface shadow-card"
      } ${href ? "liftable hover:shadow-pop" : ""}`}
    >
      <div className="flex items-start justify-between gap-2">
        <span
          className={`text-[12.5px] font-semibold sm:text-[13px] ${
            accent ? "text-white/90" : "text-ink-soft"
          }`}
        >
          {label}
        </span>
        {icon ? (
          <span
            className={`grid h-7 w-7 shrink-0 place-items-center rounded-xl sm:h-8 sm:w-8 ${
              accent ? "bg-white/20 text-white" : "bg-canvas text-ink-soft"
            }`}
          >
            {icon}
          </span>
        ) : null}
      </div>
      <div className="mt-5 sm:mt-6">
        <div
          className={`text-[26px] font-extrabold leading-none tracking-[-0.02em] sm:text-[30px] ${
            accent ? "text-white" : "text-ink"
          }`}
        >
          {typeof value === "number" ? <CountUp value={value} /> : value}
        </div>
        <div className="mt-2 flex flex-wrap items-center gap-x-2 gap-y-1 sm:mt-2.5">
          {delta ? (
            <span
              className={`chip ${
                accent
                  ? "bg-white/20 text-white"
                  : delta.dir === "up"
                    ? "bg-[#DCF5E7] text-ok"
                    : delta.dir === "down"
                      ? "bg-[#FFE4E4] text-danger"
                      : "bg-canvas text-ink-mute"
              }`}
            >
              {delta.dir === "up" ? "▲" : delta.dir === "down" ? "▼" : "•"} {delta.text}
            </span>
          ) : null}
          {note ? (
            <span
              className={`text-xs ${accent ? "text-white/80" : "text-ink-mute"}`}
            >
              {note}
            </span>
          ) : null}
        </div>
      </div>
    </div>
  );
  return href ? (
    <Link href={href} className="block h-full">
      {body}
    </Link>
  ) : (
    body
  );
}

/* ── 상태 배지 ───────────────────────────────────────── */
const DOT: Record<string, string> = {
  ok: "bg-ok",
  warn: "bg-warn",
  danger: "bg-danger",
  info: "bg-info",
  mute: "bg-ink-mute",
  brand: "bg-brand-500",
};

export function StatusDot({
  tone = "mute",
  children,
}: {
  tone?: keyof typeof DOT;
  children: ReactNode;
}) {
  return (
    <span className="inline-flex items-center gap-1.5 whitespace-nowrap text-[13px] font-medium text-ink-soft">
      <span className={`h-[7px] w-[7px] rounded-full ${DOT[tone]}`} />
      {children}
    </span>
  );
}

export function actionTone(status: string): keyof typeof DOT {
  if (status.startsWith("50")) return "ok";
  if (status.startsWith("20")) return "warn";
  if (status.startsWith("99")) return "mute";
  return "info";
}

export function stageTone(stage: string): keyof typeof DOT {
  if (stage === "계약완료") return "ok";
  if (stage === "계약진행중") return "brand";
  if (stage === "진행중") return "info";
  if (stage === "홀딩" || stage === "보류") return "warn";
  return "mute";
}

/* ── 빈 상태 ─────────────────────────────────────────── */
export function Empty({
  title,
  hint,
  action,
}: {
  title: string;
  hint?: string;
  action?: ReactNode;
}) {
  return (
    <div className="flex flex-col items-center justify-center gap-3 px-6 py-16 text-center">
      <div className="grid h-12 w-12 place-items-center rounded-2xl bg-canvas text-ink-mute">
        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
          <path d="M4 7h16M4 12h10M4 17h7" strokeLinecap="round" />
        </svg>
      </div>
      <p className="text-sm font-semibold text-ink-soft">{title}</p>
      {hint ? <p className="max-w-sm text-[13px] text-ink-mute">{hint}</p> : null}
      {action}
    </div>
  );
}

/* ── 섹션 헤더(페이지 상단) ──────────────────────────── */
export function PageHead({
  title,
  sub,
  right,
}: {
  title: string;
  sub?: string;
  right?: ReactNode;
}) {
  return (
    <div className="mb-5 flex flex-wrap items-end justify-between gap-3 sm:mb-6 sm:gap-4">
      <div className="min-w-0">
        <h1 className="text-[25px] font-extrabold leading-tight tracking-[-0.025em] sm:text-[34px]">
          {title}
        </h1>
        {sub ? (
          <p className="mt-1 text-[13.5px] text-ink-mute sm:text-[15px]">{sub}</p>
        ) : null}
      </div>
      {right ? (
        <div className="flex w-full flex-wrap items-center gap-2 sm:w-auto">{right}</div>
      ) : null}
    </div>
  );
}
