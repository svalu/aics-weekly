import Link from "next/link";
import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import {
  currentWeek,
  addWeeks,
  weekLabel,
  weekLabelShort,
  recentWeeks,
  fmtDate,
  daysLeft,
  kstToday,
} from "@/lib/week";
import type { ActionItem, Deal, Meeting, Member, Project, WeeklyReport } from "@/lib/types";
import {
  Avatar,
  Card,
  CardHead,
  Stat,
  StatusDot,
  Empty,
  actionTone,
  stageTone,
} from "@/components/ui";
import {
  IconCalendar,
  IconWarn,
  IconSpark,
  IconBriefcase,
  IconArrowUpRight,
  IconCheck,
} from "@/components/icons";

export const dynamic = "force-dynamic";

const OPEN = ["10.대기", "20.진행중"];

function greeting() {
  const h = Number(
    new Intl.DateTimeFormat("en-GB", {
      hour: "2-digit",
      hour12: false,
      timeZone: "Asia/Seoul",
    }).format(new Date())
  );
  if (h < 6) return "늦었습니다";
  if (h < 12) return "좋은 아침입니다";
  if (h < 18) return "안녕하세요";
  return "고생 많았습니다";
}

export default async function OverviewPage() {
  const me = await requireMember();
  const week = currentWeek();
  const prev = addWeeks(week, -1);
  const weeks = recentWeeks(8);
  const sb = db();

  const [
    { data: memberRows },
    { data: projectRows },
    { data: reportRows },
    { data: actionRows },
    { data: dealRows },
    { data: meetingRows },
  ] = await Promise.all([
    sb.from("members").select("*").eq("active", true).order("sort_order"),
    sb.from("projects").select("*"),
    sb.from("weekly_reports").select("*").gte("week_start", weeks[0]),
    sb.from("action_items").select("*"),
    sb.from("deals").select("*"),
    sb.from("meetings").select("*").gte("week_start", weeks[0]),
  ]);

  const members = (memberRows ?? []) as Member[];
  const projects = new Map((projectRows ?? []).map((p) => [p.id, p as Project]));
  const reports = (reportRows ?? []) as WeeklyReport[];
  const actions = (actionRows ?? []) as ActionItem[];
  const deals = (dealRows ?? []) as Deal[];
  const meetings = (meetingRows ?? []) as Meeting[];
  const nameOf = new Map(members.map((m) => [m.id, m.name]));

  /* ── 주간보고 ── */
  const thisWeek = reports.filter((r) => r.week_start === week);
  const writers = new Set(thisWeek.map((r) => r.member_id));
  const missing = members.filter((m) => !writers.has(m.id));
  const lastWriters = new Set(
    reports.filter((r) => r.week_start === prev).map((r) => r.member_id)
  );
  const issues = thisWeek.filter((r) => r.issues.trim());
  const myReports = thisWeek.filter((r) => r.member_id === me.id);

  const weeklyByWeek = weeks.map((w) => ({
    week: w,
    n: new Set(reports.filter((r) => r.week_start === w).map((r) => r.member_id)).size,
  }));
  const maxWeekly = Math.max(1, ...weeklyByWeek.map((x) => x.n), members.length);

  /* ── 액션 ── */
  const openActions = actions.filter((a) => OPEN.includes(a.status));
  const overdue = openActions
    .filter((a) => {
      const d = daysLeft(a.target_date);
      return d !== null && d < 0;
    })
    .sort((a, b) => (daysLeft(a.target_date) ?? 0) - (daysLeft(b.target_date) ?? 0));
  const dueSoon = openActions
    .filter((a) => {
      const d = daysLeft(a.target_date);
      return d !== null && d >= 0 && d <= 7;
    })
    .sort((a, b) => (daysLeft(a.target_date) ?? 0) - (daysLeft(b.target_date) ?? 0));
  const myActions = openActions.filter((a) => a.owner_id === me.id);

  /* ── 파이프라인 ── */
  const sales = deals.filter((d) => d.category !== "내부업무");
  const won = sales.filter((d) => d.stage === "계약완료");
  const closing = sales.filter((d) => d.stage === "계약진행중");

  /* ── 미팅 ── */
  const wkMeetings = meetings.filter((m) => m.week_start === week);
  const netNew = wkMeetings.filter((m) => m.kind === "Net New").length;
  const netNewRatio = wkMeetings.length ? netNew / wkMeetings.length : 0;

  const meetingByWeek = weeks.map((w) => {
    const rows = meetings.filter((m) => m.week_start === w);
    return {
      week: w,
      nn: rows.filter((m) => m.kind === "Net New").length,
      ex: rows.filter((m) => m.kind !== "Net New").length,
    };
  });
  const maxMeeting = Math.max(1, ...meetingByWeek.map((x) => x.nn + x.ex));

  const today = kstToday();
  const dayLabel = new Intl.DateTimeFormat("ko-KR", {
    month: "long",
    day: "numeric",
    weekday: "long",
    timeZone: "Asia/Seoul",
  }).format(today);

  return (
    <>
      {/* 인사 */}
      <div className="mb-7">
        <h1 className="text-[34px] font-extrabold leading-tight tracking-[-0.025em]">
          {greeting()}, {me.name}님
        </h1>
        <p className="mt-1 text-[15px] text-ink-mute">
          {dayLabel} · {weekLabel(week)}
        </p>
      </div>

      {/* KPI */}
      <div className="stagger mb-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
        <Stat
          label="이번 주 보고"
          value={`${writers.size}/${members.length}`}
          icon={<IconCalendar size={16} />}
          note={missing.length ? `${missing.length}명 미작성` : "전원 작성 완료"}
          delta={
            missing.length === 0
              ? { dir: "up", text: "100%" }
              : { dir: "flat", text: `${Math.round((writers.size / members.length) * 100)}%` }
          }
          href="/weekly"
        />
        <Stat
          label="지연된 액션"
          value={overdue.length}
          icon={<IconWarn size={16} />}
          accent={overdue.length > 0}
          note={`진행중 ${openActions.length}건 중`}
          href="/actions?v=overdue"
        />
        <Stat
          label="이번 주 미팅"
          value={wkMeetings.length}
          icon={<IconSpark size={16} />}
          delta={{
            dir: netNewRatio >= 0.3 ? "up" : "down",
            text: `Net New ${Math.round(netNewRatio * 100)}%`,
          }}
          note="목표 30%"
          href="/meetings"
        />
        <Stat
          label="파이프라인"
          value={sales.length}
          icon={<IconBriefcase size={16} />}
          note={`계약완료 ${won.length} · 진행 ${closing.length}`}
          href="/deals"
        />
      </div>

      <div className="stagger grid gap-4 xl:grid-cols-[1.35fr_1fr]">
        {/* ── 왼쪽 ── */}
        <div className="space-y-4">
          {/* 내 할 일 */}
          <Card className="overflow-hidden">
            <CardHead
              title="내 할 일"
              sub={`${me.name}님이 지금 신경 쓸 것`}
              right={
                <Link href={`/weekly/${me.id}`} className="btn-dark px-4 py-2 text-[13px]">
                  주간보고 쓰기
                </Link>
              }
            />
            <div className="mt-4 grid gap-3 px-6 pb-6 sm:grid-cols-2">
              <div className="rounded-2xl bg-canvas p-4">
                <p className="text-[12px] font-semibold text-ink-mute">이번 주 보고</p>
                <p className="mt-1.5 text-[24px] font-extrabold leading-none">
                  {myReports.length}
                  <span className="ml-1 text-[13px] font-semibold text-ink-mute">건</span>
                </p>
                <p className="mt-1.5 text-[12px] text-ink-mute">
                  {myReports.length === 0
                    ? "아직 시작 안 했습니다"
                    : myReports.some((r) => !r.next_week.trim())
                      ? "차주 업무가 비어 있는 칸이 있어요"
                      : "금주·차주 모두 채웠습니다"}
                </p>
              </div>
              <div className="rounded-2xl bg-canvas p-4">
                <p className="text-[12px] font-semibold text-ink-mute">내 액션</p>
                <p className="mt-1.5 text-[24px] font-extrabold leading-none">
                  {myActions.length}
                  <span className="ml-1 text-[13px] font-semibold text-ink-mute">건</span>
                </p>
                <p className="mt-1.5 text-[12px] text-ink-mute">
                  {myActions.filter((a) => (daysLeft(a.target_date) ?? 1) < 0).length > 0
                    ? `${myActions.filter((a) => (daysLeft(a.target_date) ?? 1) < 0).length}건 지연`
                    : "지연 없음"}
                </p>
              </div>
            </div>
          </Card>

          {/* 주간보고 현황 */}
          <Card className="overflow-hidden">
            <CardHead
              title="주간보고 작성 현황"
              sub="최근 8주 · 주차별 작성 인원"
              right={
                <Link
                  href="/weekly"
                  className="inline-flex items-center gap-1 text-[13px] font-semibold text-ink-soft hover:text-ink"
                >
                  전체 보기 <IconArrowUpRight size={14} />
                </Link>
              }
            />
            <div className="px-6 pb-2 pt-5">
              <div className="flex h-[170px] items-stretch gap-2">
                {weeklyByWeek.map(({ week: w, n }) => {
                  const h = (n / maxWeekly) * 100;
                  const now = w === week;
                  return (
                    <div key={w} className="flex flex-1 flex-col items-center gap-1.5">
                      <span className="text-[11px] font-bold tabular-nums text-ink-mute">
                        {n || ""}
                      </span>
                      <div className="relative flex w-full flex-1 items-end overflow-hidden rounded-lg bg-canvas">
                        <div
                          className={`bar-grow w-full rounded-lg ${
                            now ? "bg-brand-500" : "bg-ink"
                          }`}
                          style={{
                            height: `${Math.max(h, 2)}%`,
                            animationDelay: `${weeks.indexOf(w) * 45}ms`,
                          }}
                        />
                      </div>
                      <span
                        className={`text-[10.5px] tabular-nums ${
                          now ? "font-bold text-brand-600" : "text-ink-mute"
                        }`}
                      >
                        {weekLabelShort(w).split("~")[0]}
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>
            <div className="mx-6 mb-6 mt-3 rounded-2xl bg-canvas px-4 py-3">
              {missing.length === 0 ? (
                <p className="text-[13px] font-semibold text-ok">
                  이번 주 전원 작성 완료
                </p>
              ) : (
                <>
                  <p className="text-[12px] font-semibold text-ink-mute">
                    아직 안 쓴 사람 {missing.length}명
                  </p>
                  <div className="mt-2 flex flex-wrap gap-1.5">
                    {missing.map((m) => (
                      <Link
                        key={m.id}
                        href={`/weekly/${m.id}`}
                        className="inline-flex items-center gap-1.5 rounded-pill bg-surface py-1 pl-1 pr-2.5 transition-shadow hover:shadow-card"
                      >
                        <Avatar name={m.name} size={20} />
                        <span className="text-[12px] font-semibold">{m.name}</span>
                        {lastWriters.has(m.id) ? null : (
                          <span className="text-[10px] text-ink-mute">2주째</span>
                        )}
                      </Link>
                    ))}
                  </div>
                </>
              )}
            </div>
          </Card>

          {/* 미팅 추이 */}
          <Card className="overflow-hidden">
            <CardHead
              title="고객 미팅 추이"
              sub="Net New 대 Existing"
              right={
                <div className="flex items-center gap-3 text-[11.5px] font-semibold">
                  <span className="inline-flex items-center gap-1.5">
                    <span className="h-2.5 w-2.5 rounded-full bg-brand-500" /> Net New
                  </span>
                  <span className="inline-flex items-center gap-1.5">
                    <span className="h-2.5 w-2.5 rounded-full bg-ink" /> Existing
                  </span>
                </div>
              }
            />
            <div className="px-6 pb-6 pt-5">
              <div className="flex h-[170px] items-stretch gap-2">
                {meetingByWeek.map(({ week: w, nn, ex }) => {
                  const total = nn + ex;
                  const h = (total / maxMeeting) * 100;
                  return (
                    <div key={w} className="flex flex-1 flex-col items-center gap-1.5">
                      <span className="text-[11px] font-bold tabular-nums text-ink-mute">
                        {total || ""}
                      </span>
                      <div className="relative flex w-full flex-1 items-end overflow-hidden rounded-lg bg-canvas">
                        <div
                          className="bar-grow flex w-full flex-col justify-end overflow-hidden rounded-lg"
                          style={{
                            height: `${Math.max(h, 2)}%`,
                            animationDelay: `${weeks.indexOf(w) * 45 + 200}ms`,
                          }}
                        >
                          {nn > 0 ? (
                            <div
                              className="w-full bg-brand-500"
                              style={{ height: `${(nn / Math.max(total, 1)) * 100}%` }}
                            />
                          ) : null}
                          {ex > 0 ? (
                            <div
                              className="w-full bg-ink"
                              style={{ height: `${(ex / Math.max(total, 1)) * 100}%` }}
                            />
                          ) : null}
                        </div>
                      </div>
                      <span
                        className={`text-[10.5px] tabular-nums ${
                          w === week ? "font-bold text-brand-600" : "text-ink-mute"
                        }`}
                      >
                        {weekLabelShort(w).split("~")[0]}
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>
          </Card>
        </div>

        {/* ── 오른쪽 ── */}
        <div className="space-y-4">
          {/* 지연 액션 */}
          <Card className="overflow-hidden">
            <CardHead
              title="지금 밀린 것"
              sub={`지연 ${overdue.length}건 · 7일 내 마감 ${dueSoon.length}건`}
              right={
                <Link
                  href="/actions"
                  className="inline-flex items-center gap-1 text-[13px] font-semibold text-ink-soft hover:text-ink"
                >
                  전체 <IconArrowUpRight size={14} />
                </Link>
              }
            />
            {overdue.length === 0 && dueSoon.length === 0 ? (
              <div className="px-6 py-10 text-center">
                <span className="inline-grid h-11 w-11 place-items-center rounded-2xl bg-[#DCF5E7] text-ok">
                  <IconCheck size={20} />
                </span>
                <p className="mt-3 text-[13.5px] font-semibold text-ink-soft">
                  밀린 액션이 없습니다
                </p>
              </div>
            ) : (
              <div className="mt-3 divide-y divide-ink-line/60">
                {[...overdue, ...dueSoon].slice(0, 7).map((a) => {
                  const d = daysLeft(a.target_date)!;
                  return (
                    <Link
                      key={a.id}
                      href="/actions"
                      className="flex items-start gap-3 px-6 py-3.5 transition-colors hover:bg-canvas/60"
                    >
                      <span
                        className={`mt-1 h-2 w-2 shrink-0 rounded-full ${
                          d < 0 ? "bg-danger" : "bg-warn"
                        }`}
                      />
                      <span className="min-w-0 flex-1">
                        <span className="block text-[13px] font-semibold leading-snug">
                          {a.title}
                        </span>
                        <span className="mt-0.5 block text-[11.5px] text-ink-mute">
                          {[a.customer, a.owner_id ? nameOf.get(a.owner_id) : null]
                            .filter(Boolean)
                            .join(" · ")}
                          {" · "}
                          {fmtDate(a.target_date)}
                        </span>
                      </span>
                      <span
                        className={`shrink-0 whitespace-nowrap text-[11.5px] font-bold ${
                          d < 0 ? "text-danger" : "text-warn"
                        }`}
                      >
                        {d < 0 ? `${Math.abs(d)}일 지연` : d === 0 ? "오늘" : `D-${d}`}
                      </span>
                    </Link>
                  );
                })}
              </div>
            )}
          </Card>

          {/* 이슈 */}
          <Card className="overflow-hidden">
            <CardHead title="이번 주 이슈" sub="주간보고에 올라온 것" />
            {issues.length === 0 ? (
              <Empty title="올라온 이슈가 없습니다" />
            ) : (
              <div className="mt-3 divide-y divide-ink-line/60">
                {issues.slice(0, 5).map((r) => (
                  <Link
                    key={r.id}
                    href={`/weekly/${r.member_id}`}
                    className="block px-6 py-3.5 transition-colors hover:bg-canvas/60"
                  >
                    <div className="flex items-center gap-2">
                      <Avatar name={nameOf.get(r.member_id) ?? "?"} size={22} />
                      <span className="text-[12.5px] font-bold">
                        {nameOf.get(r.member_id)}
                      </span>
                      <span className="truncate text-[11.5px] text-ink-mute">
                        {r.project_id ? projects.get(r.project_id)?.name : "기타 업무"}
                      </span>
                    </div>
                    <p className="mt-1.5 line-clamp-3 whitespace-pre-wrap text-[12.5px] leading-snug text-ink-soft">
                      {r.issues}
                    </p>
                  </Link>
                ))}
              </div>
            )}
          </Card>

          {/* 주목할 딜 */}
          <Card className="overflow-hidden">
            <CardHead
              title="주목할 딜"
              sub="계약 진행 · 완료"
              right={
                <Link
                  href="/deals"
                  className="inline-flex items-center gap-1 text-[13px] font-semibold text-ink-soft hover:text-ink"
                >
                  전체 <IconArrowUpRight size={14} />
                </Link>
              }
            />
            {[...closing, ...won].length === 0 ? (
              <Empty title="해당하는 딜이 없습니다" />
            ) : (
              <div className="mt-3 divide-y divide-ink-line/60">
                {[...closing, ...won].slice(0, 5).map((d) => (
                  <Link
                    key={d.id}
                    href="/deals"
                    className="flex items-center gap-3 px-6 py-3.5 transition-colors hover:bg-canvas/60"
                  >
                    <span className="min-w-0 flex-1">
                      <span className="block text-[13px] font-bold">
                        {d.customer || d.name}
                      </span>
                      <span className="block truncate text-[11.5px] text-ink-mute">
                        {d.name}
                        {d.seats ? ` · ${d.seats}` : ""}
                      </span>
                    </span>
                    <span className="shrink-0 text-right">
                      <StatusDot tone={stageTone(d.stage)}>{d.stage}</StatusDot>
                      {d.amount ? (
                        <span className="mt-0.5 block whitespace-pre-line text-[11.5px] font-bold text-brand-600">
                          {d.amount.split("\n")[0]}
                        </span>
                      ) : null}
                    </span>
                  </Link>
                ))}
              </div>
            )}
          </Card>

          {/* 최근 액션 */}
          <Card className="overflow-hidden">
            <CardHead title="최근 닫힌 액션" sub="완료된 것들" />
            {actions.filter((a) => a.status.startsWith("50")).length === 0 ? (
              <Empty title="아직 없습니다" />
            ) : (
              <div className="mt-3 divide-y divide-ink-line/60">
                {actions
                  .filter((a) => a.status.startsWith("50") && a.close_date)
                  .sort((a, b) => (b.close_date ?? "").localeCompare(a.close_date ?? ""))
                  .slice(0, 4)
                  .map((a) => (
                    <div key={a.id} className="flex items-start gap-3 px-6 py-3">
                      <span className="mt-0.5 shrink-0">
                        <StatusDot tone={actionTone(a.status)}>{""}</StatusDot>
                      </span>
                      <span className="min-w-0 flex-1">
                        <span className="block truncate text-[12.5px] font-semibold">
                          {a.title}
                        </span>
                        <span className="text-[11px] text-ink-mute">
                          {a.owner_id ? nameOf.get(a.owner_id) : "—"} ·{" "}
                          {fmtDate(a.close_date)}
                        </span>
                      </span>
                    </div>
                  ))}
              </div>
            )}
          </Card>
        </div>
      </div>
    </>
  );
}
