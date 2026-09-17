import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import { fmtDate } from "@/lib/week";
import type { Member, Project } from "@/lib/types";
import { Avatar, PageHead, Card, CardHead, Empty } from "@/components/ui";
import { MemberForm, ProjectForm } from "@/components/team-forms";

export const dynamic = "force-dynamic";

export default async function TeamPage() {
  const me = await requireMember();
  const sb = db();

  const [{ data: memberRows }, { data: projectRows }, { data: linkRows }, { data: rules }] =
    await Promise.all([
      sb.from("members").select("*").order("sort_order"),
      sb.from("projects").select("*").order("sort_order"),
      sb.from("project_members").select("*"),
      sb.from("ground_rules").select("*").order("sort_order"),
    ]);

  const members = (memberRows ?? []) as Member[];
  const projects = (projectRows ?? []) as Project[];
  const active = members.filter((m) => m.active);
  const nameOf = new Map(members.map((m) => [m.id, m.name]));

  const assigned = new Map<string, string[]>();
  for (const l of linkRows ?? []) {
    const list = assigned.get(l.project_id as string) ?? [];
    list.push(l.member_id as string);
    assigned.set(l.project_id as string, list);
  }

  const guessed = members.filter(
    (m) => m.active && /^(min|lee|ryu|jung|kim|bang|jeon|oh|choi)\./.test(m.email)
  );

  return (
    <>
      <PageHead
        title="팀 설정"
        sub={`팀원 ${active.length}명 · 프로젝트 ${projects.filter((p) => p.active).length}개`}
        right={me.is_admin ? <MemberForm /> : undefined}
      />

      {!me.is_admin ? (
        <div className="mb-4 rounded-2xl bg-canvas px-5 py-4 text-[13px] text-ink-mute">
          읽기 전용입니다. 바꾸려면 관리자에게 요청하세요.
        </div>
      ) : null}

      {me.is_admin && guessed.length > 0 ? (
        <div className="mb-4 rounded-card border border-brand-200 bg-brand-50 px-5 py-4">
          <p className="text-[13.5px] font-bold text-brand-700">
            이메일 {guessed.length}건이 아직 추측값입니다
          </p>
          <p className="mt-1 text-[12.5px] text-brand-700/80">
            {guessed.map((m) => m.name).join(", ")} — 실제 주소로 바꿔야 그 사람이 로그인할
            수 있습니다. 아래에서 이름을 눌러 수정하세요.
          </p>
        </div>
      ) : null}

      <div className="stagger grid gap-4 lg:grid-cols-2">
        {/* 팀원 */}
        <Card className="overflow-hidden">
          <CardHead title="팀원" sub="이메일이 곧 로그인 계정" />
          <div className="mt-4 divide-y divide-ink-line/60">
            {members.map((m) => {
              const row = (
                <div
                  className={`flex w-full items-center gap-3 px-6 py-3.5 text-left transition-colors ${
                    me.is_admin ? "cursor-pointer hover:bg-canvas/60" : ""
                  } ${!m.active ? "opacity-45" : ""}`}
                >
                  <Avatar name={m.name} size={36} />
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-1.5">
                      <span className="text-[14px] font-bold">{m.name}</span>
                      {m.is_admin ? (
                        <span className="chip bg-ink text-white">관리자</span>
                      ) : null}
                      {!m.active ? (
                        <span className="chip bg-canvas text-ink-mute">비활성</span>
                      ) : null}
                    </div>
                    <p className="truncate text-[12px] text-ink-mute">{m.email}</p>
                  </div>
                  <span className="shrink-0 text-[12px] text-ink-mute">
                    {[m.part, m.role].filter(Boolean).join(" · ")}
                  </span>
                </div>
              );
              return me.is_admin ? (
                <MemberForm key={m.id} member={m} trigger={row} />
              ) : (
                <div key={m.id}>{row}</div>
              );
            })}
          </div>
        </Card>

        {/* 프로젝트 */}
        <Card className="overflow-hidden">
          <CardHead
            title="프로젝트"
            sub="주간보고 입력 칸이 여기서 정해집니다"
            right={me.is_admin ? <ProjectForm members={active} /> : undefined}
          />
          {projects.length === 0 ? (
            <Empty title="프로젝트가 없습니다" />
          ) : (
            <div className="mt-4 divide-y divide-ink-line/60">
              {projects.map((p) => {
                const staff = assigned.get(p.id) ?? [];
                const row = (
                  <div
                    className={`w-full px-6 py-3.5 text-left transition-colors ${
                      me.is_admin ? "cursor-pointer hover:bg-canvas/60" : ""
                    } ${!p.active ? "opacity-45" : ""}`}
                  >
                    <div className="flex items-start gap-2">
                      <span className="chip mt-0.5 shrink-0 bg-canvas text-ink-mute">
                        {p.kind}
                      </span>
                      <div className="min-w-0 flex-1">
                        <p className="text-[13.5px] font-bold leading-snug">{p.name}</p>
                        <p className="mt-0.5 text-[11.5px] text-ink-mute">
                          {p.owner_id ? `${nameOf.get(p.owner_id)} · ` : ""}
                          {p.start_date
                            ? `${fmtDate(p.start_date)} ~ ${fmtDate(p.end_date)}`
                            : "기간 미정"}
                        </p>
                      </div>
                    </div>
                    {staff.length > 0 ? (
                      <div className="mt-2.5 flex flex-wrap gap-1">
                        {staff.map((id) => (
                          <span key={id} className="chip bg-canvas text-ink-soft">
                            {nameOf.get(id) ?? "?"}
                          </span>
                        ))}
                      </div>
                    ) : (
                      <p className="mt-2 text-[11.5px] text-ink-mute">투입 인력 미지정</p>
                    )}
                  </div>
                );
                return me.is_admin ? (
                  <ProjectForm
                    key={p.id}
                    project={p}
                    members={active}
                    assigned={staff}
                    trigger={row}
                  />
                ) : (
                  <div key={p.id}>{row}</div>
                );
              })}
            </div>
          )}
        </Card>
      </div>

      {/* Ground Rule */}
      {(rules ?? []).length > 0 ? (
        <Card className="mt-4 overflow-hidden">
          <CardHead title="Ground Rule" sub="팀이 합의한 업무 원칙" />
          <ol className="mt-4 space-y-2.5 px-6 pb-6">
            {(rules ?? []).map((r, i) => (
              <li key={r.id as string} className="flex gap-3">
                <span className="grid h-6 w-6 shrink-0 place-items-center rounded-full bg-canvas text-[11px] font-bold text-ink-mute">
                  {i + 1}
                </span>
                <p className="text-[13.5px] leading-relaxed text-ink-soft">
                  {r.body as string}
                </p>
              </li>
            ))}
          </ol>
        </Card>
      ) : null}
    </>
  );
}
