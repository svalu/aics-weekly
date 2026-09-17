import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import { currentWeek, weekLabel } from "@/lib/week";
import type { Project, WeeklyReport } from "@/lib/types";
import { EasyWizard, type EasyProject } from "@/components/easy-wizard";
import { WeekNav } from "@/components/week-nav";

export const dynamic = "force-dynamic";

/**
 * 쉬운 주간보고.
 * 내게 배정된 프로젝트(+ 기타 업무)를 한 화면에 하나씩 묻는다.
 * 이미 적은 내용이 있으면 그대로 채워서 보여주고, 고치면 덮어쓴다.
 */
export default async function EasyPage({
  searchParams,
}: {
  searchParams: Promise<{ w?: string }>;
}) {
  const sp = await searchParams;
  const week = sp.w ?? currentWeek();
  const me = await requireMember();
  const sb = db();

  const [{ data: linkRows }, { data: projectRows }, { data: reportRows }] = await Promise.all([
    sb.from("project_members").select("project_id").eq("member_id", me.id),
    sb.from("projects").select("*").eq("active", true).order("sort_order"),
    sb.from("weekly_reports").select("*").eq("member_id", me.id).eq("week_start", week),
  ]);

  const linked = new Set((linkRows ?? []).map((r) => r.project_id as string));
  const reports = (reportRows ?? []) as WeeklyReport[];
  const all = (projectRows ?? []) as Project[];

  // 배정된 프로젝트 + 이미 이번 주에 쓴 프로젝트
  for (const r of reports) if (r.project_id) linked.add(r.project_id);
  const mine = all.filter((p) => linked.has(p.id));

  const find = (pid: string | null) => reports.find((r) => (r.project_id ?? null) === pid);

  const projects: EasyProject[] = [
    ...mine.map((p) => {
      const r = find(p.id);
      return {
        id: p.id,
        name: p.name,
        kind: p.kind,
        this_week: r?.this_week ?? "",
        next_week: r?.next_week ?? "",
        issues: r?.issues ?? "",
      };
    }),
    // 프로젝트에 안 묶이는 일. 배정된 게 하나도 없어도 이 칸은 있다.
    (() => {
      const r = find(null);
      return {
        id: null,
        name: "기타 업무",
        kind: undefined,
        this_week: r?.this_week ?? "",
        next_week: r?.next_week ?? "",
        issues: r?.issues ?? "",
      };
    })(),
  ];

  return (
    <>
      <div className="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="text-[34px] font-extrabold leading-tight tracking-[-0.025em]">
            쉬운 주간보고
          </h1>
          <p className="mt-1 text-[17px] text-ink-mute">
            {me.name}님, 질문에 한 줄씩만 답해 주시면 됩니다.
          </p>
        </div>
        <WeekNav week={week} />
      </div>

      <EasyWizard
        memberId={me.id}
        memberName={me.name}
        weekStart={week}
        weekLabel={weekLabel(week)}
        projects={projects}
      />
    </>
  );
}
