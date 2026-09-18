import Link from "next/link";
import { notFound } from "next/navigation";
import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import { carryOver } from "@/lib/actions";
import { currentWeek, addWeeks, weekLabel, fmtDate } from "@/lib/week";
import type { Member, Project, WeeklyReport } from "@/lib/types";
import { Avatar, PageHead, Card, StatusDot } from "@/components/ui";
import { WeekNav } from "@/components/week-nav";
import { WeeklyEditor } from "@/components/weekly-editor";
import { IconWarn, IconChevron } from "@/components/icons";

export const dynamic = "force-dynamic";

const EMPTY = { this_week: "", next_week: "", issues: "" };

export default async function MemberWeeklyPage({
  params,
  searchParams,
}: {
  params: Promise<{ memberId: string }>;
  searchParams: Promise<{ w?: string }>;
}) {
  const { memberId } = await params;
  const sp = await searchParams;
  const week = sp.w ?? currentWeek();
  const prev = addWeeks(week, -1);

  const me = await requireMember();
  const sb = db();

  const [{ data: memberRow }, { data: memberRows }] = await Promise.all([
    sb.from("members").select("*").eq("id", memberId).maybeSingle(),
    sb.from("members").select("*").eq("active", true).order("sort_order"),
  ]);
  if (!memberRow) notFound();

  const member = memberRow as Member;
  const roster = (memberRows ?? []) as Member[];
  const canEdit = me.id === member.id || me.is_admin;

  const [{ data: linkRows }, { data: projectRows }, { data: reportRows }] =
    await Promise.all([
      sb.from("project_members").select("project_id").eq("member_id", memberId),
      sb.from("projects").select("*").eq("active", true).order("sort_order"),
      sb
        .from("weekly_reports")
        .select("*")
        .eq("member_id", memberId)
        .in("week_start", [week, prev]),
    ]);

  const allProjects = (projectRows ?? []) as Project[];
  const linked = new Set((linkRows ?? []).map((r) => r.project_id as string));
  const reports = (reportRows ?? []) as WeeklyReport[];

  const thisWeek = reports.filter((r) => r.week_start === week);
  const lastWeek = reports.filter((r) => r.week_start === prev);

  // 보여줄 슬롯: 배정된 프로젝트 + 이번주에 이미 쓴 프로젝트 + '기타 업무'
  const slotIds = new Set<string>(linked);
  for (const r of thisWeek) if (r.project_id) slotIds.add(r.project_id);
  const slots: { project: Project | null }[] = allProjects
    .filter((p) => slotIds.has(p.id))
    .map((p) => ({ project: p }));
  slots.push({ project: null }); // 프로젝트에 안 묶이는 업무

  const find = (rows: WeeklyReport[], pid: string | null) =>
    rows.find((r) => (r.project_id ?? null) === pid);

  const carried = lastWeek.filter((r) => r.next_week.trim()).length;
  const canCarry =
    canEdit && carried > 0 && thisWeek.every((r) => !r.this_week.trim());

  const idx = roster.findIndex((m) => m.id === member.id);
  const prevMember = idx > 0 ? roster[idx - 1] : null;
  const nextMember = idx >= 0 && idx < roster.length - 1 ? roster[idx + 1] : null;

  return (
    <>
      <div className="mb-4">
        <Link
          href={`/weekly?w=${week}`}
          className="inline-flex items-center gap-1 text-[13px] font-medium text-ink-mute transition-colors hover:text-ink"
        >
          <IconChevron size={14} className="rotate-180" />
          팀 전체
        </Link>
      </div>

      <PageHead
        title={member.name}
        sub={`${[member.part, member.role].filter(Boolean).join(" · ")} · ${member.email}`}
        right={<WeekNav week={week} />}
      />

      {/* 사람 이동 */}
      <div className="no-scrollbar mb-5 flex items-center gap-2 overflow-x-auto pb-1">
        {roster.map((m) => (
          <Link
            key={m.id}
            href={`/weekly/${m.id}?w=${week}`}
            className={`flex shrink-0 items-center gap-2 rounded-pill py-1.5 pl-1.5 pr-3.5 transition-colors ${
              m.id === member.id
                ? "bg-ink text-white"
                : "bg-surface text-ink-soft hover:bg-canvas"
            }`}
          >
            <Avatar name={m.name} size={26} />
            <span className="text-[13px] font-semibold">{m.name}</span>
          </Link>
        ))}
      </div>

      {!canEdit ? (
        <div className="mb-4 rounded-2xl bg-canvas px-4 py-3 text-[13px] text-ink-mute">
          다른 사람의 보고는 읽기만 가능합니다.
        </div>
      ) : null}

      {canCarry ? (
        <form action={carryOver} className="mb-4">
          <input type="hidden" name="member_id" value={member.id} />
          <input type="hidden" name="week_start" value={week} />
          <input type="hidden" name="prev_week" value={prev} />
          <button
            type="submit"
            className="flex w-full items-center justify-between gap-3 rounded-card border border-brand-200 bg-brand-50 px-5 py-4 text-left transition-colors hover:bg-brand-100"
          >
            <span>
              <span className="block text-[13.5px] font-bold text-brand-700">
                지난주 &lsquo;차주 업무&rsquo; {carried}건을 이번 주로 가져오기
              </span>
              <span className="mt-0.5 block text-[12px] text-brand-700/75">
                빈 칸만 채웁니다. 이미 쓴 내용은 건드리지 않아요.
              </span>
            </span>
            <span className="btn-brand shrink-0 px-4 py-2">가져오기</span>
          </button>
        </form>
      ) : null}

      <div className="stagger grid gap-4 lg:grid-cols-[1fr_300px]">
        {/* 본문 — min-w-0 이 없으면 긴 프로젝트명이 격자 칸을 넓혀 버린다 */}
        <div className="min-w-0 space-y-3">
          {slots.map(({ project }) => {
            const row = find(thisWeek, project?.id ?? null);
            const lastRow = find(lastWeek, project?.id ?? null);
            const key = project?.id ?? "none";
            return (
              <div key={key}>
                <WeeklyEditor
                  memberId={member.id}
                  weekStart={week}
                  projectId={project?.id ?? null}
                  projectName={project?.name ?? "기타 업무"}
                  projectKind={project?.kind}
                  readOnly={!canEdit}
                  initial={
                    row
                      ? {
                          this_week: row.this_week,
                          next_week: row.next_week,
                          issues: row.issues,
                        }
                      : EMPTY
                  }
                />
                {lastRow && lastRow.next_week.trim() ? (
                  <details className="mt-1.5 rounded-2xl bg-canvas px-4 py-2.5">
                    <summary className="cursor-pointer text-[12px] font-semibold text-ink-mute">
                      지난주에 적은 차주 업무 보기
                    </summary>
                    <p className="prose-report mt-2">{lastRow.next_week}</p>
                  </details>
                ) : null}
              </div>
            );
          })}
        </div>

        {/* 사이드 */}
        <div className="space-y-3">
          <Card className="p-5">
            <p className="label">이번 주</p>
            <p className="text-[15px] font-bold">{weekLabel(week)}</p>
            <dl className="mt-4 space-y-2.5 text-[13px]">
              <div className="flex items-center justify-between">
                <dt className="text-ink-mute">작성한 항목</dt>
                <dd className="font-semibold">{thisWeek.length}건</dd>
              </div>
              <div className="flex items-center justify-between">
                <dt className="text-ink-mute">이슈</dt>
                <dd className="font-semibold">
                  {thisWeek.filter((r) => r.issues.trim()).length}건
                </dd>
              </div>
              <div className="flex items-center justify-between">
                <dt className="text-ink-mute">마지막 수정</dt>
                <dd className="font-semibold">
                  {thisWeek.length
                    ? fmtDate(
                        thisWeek
                          .map((r) => r.updated_at)
                          .sort()
                          .at(-1)!
                          .slice(0, 10)
                      )
                    : "—"}
                </dd>
              </div>
            </dl>
          </Card>

          {thisWeek.some((r) => r.issues.trim()) ? (
            <Card className="border border-[#FFD5D5] bg-[#FFF6F6] p-5 shadow-none">
              <p className="flex items-center gap-1.5 text-[13px] font-bold text-danger">
                <IconWarn size={15} /> 이슈 사항
              </p>
              <div className="mt-3 space-y-3">
                {thisWeek
                  .filter((r) => r.issues.trim())
                  .map((r) => (
                    <p key={r.id} className="prose-report text-ink-soft">
                      {r.issues}
                    </p>
                  ))}
              </div>
            </Card>
          ) : null}

          <Card className="p-5">
            <p className="label">담당 프로젝트</p>
            {slots.filter((s) => s.project).length === 0 ? (
              <p className="text-[13px] text-ink-mute">
                배정된 프로젝트가 없습니다. 팀 설정에서 연결할 수 있어요.
              </p>
            ) : (
              <ul className="space-y-2">
                {slots
                  .filter((s) => s.project)
                  .map(({ project }) => (
                    <li key={project!.id} className="flex items-start gap-2">
                      <span className="mt-1.5 h-1.5 w-1.5 shrink-0 rounded-full bg-brand-500" />
                      <span className="min-w-0">
                        <span className="block text-[13px] font-semibold leading-snug">
                          {project!.name}
                        </span>
                        {project!.start_date ? (
                          <span className="text-[11.5px] text-ink-mute">
                            {fmtDate(project!.start_date)} ~{" "}
                            {fmtDate(project!.end_date)}
                          </span>
                        ) : null}
                      </span>
                    </li>
                  ))}
              </ul>
            )}
            {me.is_admin ? (
              <Link
                href="/team"
                className="mt-4 block text-[12px] font-semibold text-brand-600 hover:underline"
              >
                프로젝트 배정 바꾸기
              </Link>
            ) : null}
          </Card>

          <div className="flex gap-2">
            {prevMember ? (
              <Link
                href={`/weekly/${prevMember.id}?w=${week}`}
                className="btn-outline flex-1"
              >
                ← {prevMember.name}
              </Link>
            ) : null}
            {nextMember ? (
              <Link
                href={`/weekly/${nextMember.id}?w=${week}`}
                className="btn-outline flex-1"
              >
                {nextMember.name} →
              </Link>
            ) : null}
          </div>
        </div>
      </div>
    </>
  );
}
