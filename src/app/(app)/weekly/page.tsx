import Link from "next/link";
import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import { currentWeek, weekLabelShort, addWeeks } from "@/lib/week";
import type { Member, Project, WeeklyReport } from "@/lib/types";
import { Avatar, PageHead, Card, Empty, StatusDot } from "@/components/ui";
import { WeekNav } from "@/components/week-nav";
import { IconArrowUpRight, IconWarn } from "@/components/icons";

export const dynamic = "force-dynamic";

export default async function WeeklyPage({
  searchParams,
}: {
  searchParams: Promise<{ w?: string; part?: string }>;
}) {
  const sp = await searchParams;
  const week = sp.w ?? currentWeek();
  const me = await requireMember();
  const sb = db();

  const [{ data: memberRows }, { data: projectRows }, { data: reportRows }] =
    await Promise.all([
      sb.from("members").select("*").eq("active", true).order("sort_order"),
      sb.from("projects").select("*").order("sort_order"),
      sb
        .from("weekly_reports")
        .select("*")
        .in("week_start", [week, addWeeks(week, -1)]),
    ]);

  const members = (memberRows ?? []) as Member[];
  const projects = new Map((projectRows ?? []).map((p) => [p.id, p as Project]));
  const reports = (reportRows ?? []) as WeeklyReport[];

  const thisWeek = reports.filter((r) => r.week_start === week);
  const lastWeek = reports.filter((r) => r.week_start !== week);

  const byMember = new Map<string, WeeklyReport[]>();
  for (const r of thisWeek) {
    const list = byMember.get(r.member_id) ?? [];
    list.push(r);
    byMember.set(r.member_id, list);
  }
  const lastByMember = new Map<string, number>();
  for (const r of lastWeek) {
    lastByMember.set(r.member_id, (lastByMember.get(r.member_id) ?? 0) + 1);
  }

  const parts = ["Sales", "AICC", "Development"];
  const activePart = sp.part && parts.includes(sp.part) ? sp.part : null;
  const shown = activePart ? members.filter((m) => m.part === activePart) : members;

  const written = members.filter((m) => (byMember.get(m.id) ?? []).length > 0).length;
  const issueCount = thisWeek.filter((r) => r.issues.trim()).length;

  const qs = (extra: Record<string, string | null>) => {
    const p = new URLSearchParams();
    if (week !== currentWeek()) p.set("w", week);
    if (activePart) p.set("part", activePart);
    for (const [k, v] of Object.entries(extra)) {
      if (v === null) p.delete(k);
      else p.set(k, v);
    }
    const s = p.toString();
    return s ? `/weekly?${s}` : "/weekly";
  };

  return (
    <>
      <PageHead
        title="주간보고"
        sub={`${written}/${members.length}명 작성 · 이슈 ${issueCount}건`}
        right={
          <>
            <WeekNav week={week} />
            <Link href={`/weekly/${me.id}?w=${week}`} className="btn-dark">
              내 보고 쓰기
            </Link>
          </>
        }
      />

      {/* 파트 필터 */}
      <div className="mb-5 flex flex-wrap items-center gap-1.5">
        <Link
          href={qs({ part: null })}
          className={`pill ${
            !activePart ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
          }`}
        >
          전체 {members.length}
        </Link>
        {parts.map((p) => {
          const n = members.filter((m) => m.part === p).length;
          if (!n) return null;
          return (
            <Link
              key={p}
              href={qs({ part: p })}
              className={`pill ${
                activePart === p
                  ? "bg-ink text-white"
                  : "bg-surface text-ink-soft hover:bg-canvas"
              }`}
            >
              {p} {n}
            </Link>
          );
        })}
      </div>

      {shown.length === 0 ? (
        <Card>
          <Empty title="이 파트에 팀원이 없습니다" />
        </Card>
      ) : (
        <div className="stagger grid gap-3 md:grid-cols-2 xl:grid-cols-3">
          {shown.map((m) => {
            const rows = byMember.get(m.id) ?? [];
            const hasIssue = rows.some((r) => r.issues.trim());
            const isMe = m.id === me.id;
            const lastCount = lastByMember.get(m.id) ?? 0;

            return (
              <Link
                key={m.id}
                href={`/weekly/${m.id}?w=${week}`}
                className={`liftable group flex flex-col rounded-card border bg-surface p-5 hover:shadow-pop ${
                  isMe ? "border-brand-300 ring-1 ring-brand-200" : "border-ink-line"
                }`}
              >
                <div className="flex items-start gap-3">
                  <Avatar name={m.name} size={40} />
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-1.5">
                      <span className="truncate text-[15px] font-bold">{m.name}</span>
                      {isMe ? (
                        <span className="chip bg-brand-50 text-brand-700">나</span>
                      ) : null}
                    </div>
                    <p className="truncate text-[12px] text-ink-mute">
                      {[m.part, m.role].filter(Boolean).join(" · ")}
                    </p>
                  </div>
                  <IconArrowUpRight
                    size={16}
                    className="mt-1 text-ink-line transition-colors group-hover:text-ink-mute"
                  />
                </div>

                <div className="mt-4 min-h-[86px] flex-1 space-y-2">
                  {rows.length === 0 ? (
                    <div className="flex h-full flex-col justify-center rounded-2xl bg-canvas px-4 py-5 text-center">
                      <p className="text-[12.5px] font-semibold text-ink-mute">
                        아직 안 썼습니다
                      </p>
                      {lastCount > 0 ? (
                        <p className="mt-0.5 text-[11px] text-ink-mute">
                          지난주엔 {lastCount}건 작성
                        </p>
                      ) : null}
                    </div>
                  ) : (
                    rows.slice(0, 3).map((r) => {
                      const p = r.project_id ? projects.get(r.project_id) : null;
                      const first =
                        r.this_week.split("\n").find((l) => l.trim()) ?? "(차주/이슈만)";
                      return (
                        <div key={r.id} className="rounded-2xl bg-canvas px-3.5 py-2.5">
                          <p className="truncate text-[12px] font-semibold text-ink-soft">
                            {p?.name ?? "기타 업무"}
                          </p>
                          <p className="mt-0.5 line-clamp-2 text-[12px] leading-snug text-ink-mute">
                            {first.replace(/^[-·•\s]+/, "")}
                          </p>
                        </div>
                      );
                    })
                  )}
                  {rows.length > 3 ? (
                    <p className="px-1 text-[11.5px] text-ink-mute">
                      외 {rows.length - 3}건
                    </p>
                  ) : null}
                </div>

                <div className="mt-4 flex items-center justify-between border-t border-ink-line pt-3">
                  {rows.length > 0 ? (
                    <StatusDot tone="ok">{rows.length}건 작성</StatusDot>
                  ) : (
                    <StatusDot tone="mute">미작성</StatusDot>
                  )}
                  {hasIssue ? (
                    <span className="chip bg-[#FFE4E4] text-danger">
                      <IconWarn size={12} /> 이슈
                    </span>
                  ) : null}
                </div>
              </Link>
            );
          })}
        </div>
      )}

      <p className="mt-6 text-center text-[12px] text-ink-mute">
        {weekLabelShort(week)} 주차 · 카드를 누르면 그 사람 보고를 크게 봅니다
      </p>
    </>
  );
}
