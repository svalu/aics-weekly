"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState, type ReactNode } from "react";
import { Avatar } from "./ui";
import {
  IconGrid,
  IconCalendar,
  IconTarget,
  IconBriefcase,
  IconUsers,
  IconSettings,
  IconLogout,
  IconChevron,
  Logo,
} from "./icons";
import type { Member } from "@/lib/types";
import { APP_VERSION, CHANGELOG } from "@/lib/version";

const NAV = [
  { href: "/", label: "개요" },
  { href: "/weekly", label: "주간보고" },
  { href: "/actions", label: "액션" },
  { href: "/deals", label: "파이프라인" },
  { href: "/meetings", label: "미팅" },
  { href: "/team", label: "팀" },
];

const RAIL = [
  { href: "/", label: "개요", Icon: IconGrid },
  { href: "/weekly", label: "주간보고", Icon: IconCalendar },
  { href: "/actions", label: "액션 트래커", Icon: IconTarget },
  { href: "/deals", label: "파이프라인", Icon: IconBriefcase },
  { href: "/meetings", label: "미팅 로그", Icon: IconUsers },
  { href: "/team", label: "팀 설정", Icon: IconSettings },
];

function isActive(pathname: string, href: string) {
  return href === "/" ? pathname === "/" : pathname.startsWith(href);
}

export function Shell({ me, children }: { me: Member; children: ReactNode }) {
  const pathname = usePathname();
  const [menu, setMenu] = useState(false);

  return (
    <div className="min-h-screen p-2.5 sm:p-4">
      <div className="mx-auto flex max-w-[1500px] gap-3">
        {/* 좌측 아이콘 레일 */}
        <aside className="sticky top-4 hidden h-[calc(100vh-2rem)] w-[62px] shrink-0 flex-col items-center rounded-card bg-surface py-5 shadow-card lg:flex">
          <Link href="/" className="mb-7">
            <Logo size={34} />
          </Link>
          <nav className="flex flex-1 flex-col items-center gap-1.5">
            {RAIL.map(({ href, label, Icon }) => {
              const on = isActive(pathname, href);
              return (
                <Link
                  key={href}
                  href={href}
                  title={label}
                  className={`group relative grid h-10 w-10 place-items-center rounded-xl transition-colors ${
                    on
                      ? "bg-ink text-white"
                      : "text-ink-mute hover:bg-canvas hover:text-ink"
                  }`}
                >
                  <Icon size={19} />
                  <span className="pointer-events-none absolute left-[52px] z-30 hidden whitespace-nowrap rounded-lg bg-ink px-2.5 py-1.5 text-xs font-medium text-white group-hover:block">
                    {label}
                  </span>
                </Link>
              );
            })}
          </nav>
          <form action="/api/logout" method="post">
            <button
              type="submit"
              title="로그아웃"
              className="grid h-10 w-10 place-items-center rounded-xl text-ink-mute transition-colors hover:bg-canvas hover:text-danger"
            >
              <IconLogout size={19} />
            </button>
          </form>
        </aside>

        {/* 본문 */}
        <div className="min-w-0 flex-1 rounded-card bg-surface shadow-card">
          {/* 상단바 */}
          <header className="sticky top-0 z-20 flex flex-wrap items-center gap-3 rounded-t-card border-b border-ink-line/70 bg-surface/95 px-4 py-3 backdrop-blur sm:px-6">
            <Link href="/" className="flex items-center gap-2 lg:hidden">
              <Logo size={30} />
            </Link>

            <nav className="order-3 -mx-1 flex w-full items-center gap-0.5 overflow-x-auto px-1 sm:order-2 sm:mx-0 sm:w-auto sm:flex-1 sm:justify-center sm:px-0">
              {NAV.map(({ href, label }) => (
                <Link
                  key={href}
                  href={href}
                  className={`nav-pill shrink-0 ${
                    isActive(pathname, href) ? "nav-pill-active" : ""
                  }`}
                >
                  {label}
                </Link>
              ))}
            </nav>

            <div className="order-2 ml-auto flex items-center gap-2 sm:order-3 sm:ml-0">
              <div className="relative">
                <button
                  onClick={() => setMenu((v) => !v)}
                  className="flex items-center gap-2.5 rounded-pill border border-ink-line py-1.5 pl-1.5 pr-3 transition-colors hover:bg-canvas"
                >
                  <Avatar name={me.name} size={30} />
                  <span className="hidden text-left leading-tight sm:block">
                    <span className="block text-[13px] font-semibold">{me.name}</span>
                    <span className="block max-w-[150px] truncate text-[11px] text-ink-mute">
                      {me.email}
                    </span>
                  </span>
                  <IconChevron
                    size={14}
                    className={`text-ink-mute transition-transform ${
                      menu ? "rotate-90" : ""
                    }`}
                  />
                </button>

                {menu ? (
                  <>
                    <div
                      className="fixed inset-0 z-30"
                      onClick={() => setMenu(false)}
                    />
                    <div className="absolute right-0 z-40 mt-2 w-56 overflow-hidden rounded-2xl bg-surface p-1.5 shadow-pop">
                      <div className="px-3 py-2.5">
                        <p className="text-sm font-semibold">{me.name}</p>
                        <p className="truncate text-xs text-ink-mute">{me.email}</p>
                        <p className="mt-1 text-[11px] text-ink-mute">
                          {[me.part, me.role].filter(Boolean).join(" · ")}
                        </p>
                      </div>
                      <Link
                        href={`/weekly/${me.id}`}
                        onClick={() => setMenu(false)}
                        className="block rounded-xl px-3 py-2 text-sm text-ink-soft hover:bg-canvas"
                      >
                        내 주간보고
                      </Link>
                      <Link
                        href="/team"
                        onClick={() => setMenu(false)}
                        className="block rounded-xl px-3 py-2 text-sm text-ink-soft hover:bg-canvas"
                      >
                        팀 설정
                      </Link>
                      <form action="/api/logout" method="post">
                        <button
                          type="submit"
                          className="w-full rounded-xl px-3 py-2 text-left text-sm text-danger hover:bg-canvas"
                        >
                          로그아웃
                        </button>
                      </form>
                    </div>
                  </>
                ) : null}
              </div>
            </div>
          </header>

          <main className="px-4 py-6 sm:px-6 sm:py-8">{children}</main>
        </div>
      </div>

      <VersionBadge />
    </div>
  );
}

function VersionBadge() {
  const [open, setOpen] = useState(false);
  const latest = CHANGELOG[0];

  return (
    <div className="pointer-events-none fixed bottom-3 right-3 z-40 flex flex-col items-end gap-2">
      {open ? (
        <div className="pointer-events-auto w-[min(320px,calc(100vw-1.5rem))] rounded-2xl bg-surface p-4 shadow-pop">
          <p className="text-[13px] font-bold">변경 이력</p>
          <ul className="mt-2.5 space-y-2.5">
            {CHANGELOG.map((c) => (
              <li key={c.version} className="flex gap-2.5">
                <span className="chip shrink-0 bg-canvas text-ink-soft">v{c.version}</span>
                <span className="min-w-0">
                  <span className="block text-[12px] leading-snug text-ink-soft">
                    {c.note}
                  </span>
                  <span className="text-[11px] text-ink-mute">{c.date}</span>
                </span>
              </li>
            ))}
          </ul>
        </div>
      ) : null}

      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        title={`v${APP_VERSION} · ${latest?.note ?? ""}`}
        className="pointer-events-auto rounded-pill bg-ink/70 px-2.5 py-1 text-[11px] font-semibold
                   tabular-nums text-white/80 backdrop-blur transition-colors hover:bg-ink hover:text-white"
      >
        v{APP_VERSION}
      </button>
    </div>
  );
}
