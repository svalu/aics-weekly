"use client";

import { saveMember, saveProject, toggleProjectMember } from "@/lib/actions";
import { PROJECT_KINDS, type Member, type Project } from "@/lib/types";
import { Sheet, Field, Row } from "./sheet";
import { IconPlus } from "./icons";

const PARTS = ["Sales", "AICC", "Development"];
const ROLES = [
  "최고 리더",
  "Biz 리더",
  "솔루션 리더",
  "PM",
  "SA",
  "Sales",
  "PreSales",
  "개발",
  "기획",
  "디자인",
];

export function MemberForm({
  member,
  trigger,
}: {
  member?: Member;
  trigger?: React.ReactNode;
}) {
  const editing = Boolean(member);
  return (
    <Sheet
      title={editing ? `${member!.name} 수정` : "팀원 추가"}
      sub="이메일이 곧 로그인 계정입니다"
      trigger={
        trigger ?? (
          <span className="btn-dark">
            <IconPlus size={16} /> 팀원 추가
          </span>
        )
      }
    >
      {(close) => (
        <form
          action={async (fd) => {
            await saveMember(fd);
            close();
          }}
          className="space-y-4"
        >
          {member ? <input type="hidden" name="id" value={member.id} /> : null}

          <Row>
            <Field label="이름">
              <input
                name="name"
                required
                autoFocus={!editing}
                defaultValue={member?.name ?? ""}
                className="field"
              />
            </Field>
            <Field label="이메일" hint="이 주소로 로그인합니다">
              <input
                name="email"
                type="email"
                required
                defaultValue={member?.email ?? ""}
                placeholder="name@mz.co.kr"
                className="field"
              />
            </Field>
          </Row>

          <Row>
            <Field label="파트">
              <select name="part" defaultValue={member?.part ?? ""} className="field">
                <option value="">미지정</option>
                {PARTS.map((p) => (
                  <option key={p}>{p}</option>
                ))}
              </select>
            </Field>
            <Field label="역할">
              <select name="role" defaultValue={member?.role ?? ""} className="field">
                <option value="">미지정</option>
                {ROLES.map((r) => (
                  <option key={r}>{r}</option>
                ))}
              </select>
            </Field>
          </Row>

          <div className="space-y-2 rounded-2xl bg-canvas px-4 py-3.5">
            <label className="flex items-center gap-2.5 text-[13px] font-medium">
              <input
                type="checkbox"
                name="active"
                defaultChecked={member?.active ?? true}
                className="h-4 w-4 accent-brand-500"
              />
              활성 (로그인 및 주간보고 대상)
            </label>
            <label className="flex items-center gap-2.5 text-[13px] font-medium">
              <input
                type="checkbox"
                name="is_admin"
                defaultChecked={member?.is_admin ?? false}
                className="h-4 w-4 accent-brand-500"
              />
              관리자 (팀·프로젝트 설정, 남의 보고 수정 가능)
            </label>
          </div>

          <button type="submit" className="btn-dark w-full">
            저장
          </button>
        </form>
      )}
    </Sheet>
  );
}

export function ProjectForm({
  project,
  members,
  assigned = [],
  trigger,
}: {
  project?: Project;
  members: Member[];
  assigned?: string[];
  trigger?: React.ReactNode;
}) {
  const editing = Boolean(project);
  const on = new Set(assigned);

  return (
    <Sheet
      title={editing ? project!.name : "프로젝트 추가"}
      sub="주간보고에 이 이름으로 칸이 생깁니다"
      trigger={
        trigger ?? (
          <span className="btn-dark">
            <IconPlus size={16} /> 프로젝트 추가
          </span>
        )
      }
    >
      {(close) => (
        <div className="space-y-7">
          <form
            action={async (fd) => {
              await saveProject(fd);
              close();
            }}
            className="space-y-4"
          >
            {project ? <input type="hidden" name="id" value={project.id} /> : null}

            <Field label="프로젝트명">
              <input
                name="name"
                required
                autoFocus={!editing}
                defaultValue={project?.name ?? ""}
                className="field"
              />
            </Field>

            <Row>
              <Field label="구분">
                <select name="kind" defaultValue={project?.kind ?? "프로젝트"} className="field">
                  {PROJECT_KINDS.map((k) => (
                    <option key={k}>{k}</option>
                  ))}
                </select>
              </Field>
              <Field label="Owner">
                <select name="owner_id" defaultValue={project?.owner_id ?? ""} className="field">
                  <option value="">미지정</option>
                  {members.map((m) => (
                    <option key={m.id} value={m.id}>
                      {m.name}
                    </option>
                  ))}
                </select>
              </Field>
            </Row>

            <Row>
              <Field label="시작일">
                <input
                  type="date"
                  name="start_date"
                  defaultValue={project?.start_date ?? ""}
                  className="field"
                />
              </Field>
              <Field label="종료일">
                <input
                  type="date"
                  name="end_date"
                  defaultValue={project?.end_date ?? ""}
                  className="field"
                />
              </Field>
            </Row>

            <label className="flex items-center gap-2.5 rounded-2xl bg-canvas px-4 py-3.5 text-[13px] font-medium">
              <input
                type="checkbox"
                name="active"
                defaultChecked={project?.active ?? true}
                className="h-4 w-4 accent-brand-500"
              />
              활성 (끝난 프로젝트는 꺼두세요)
            </label>

            <button type="submit" className="btn-dark w-full">
              저장
            </button>
          </form>

          {editing ? (
            <div className="border-t border-ink-line pt-6">
              <h3 className="text-[15px] font-bold">투입 인력</h3>
              <p className="mt-0.5 text-[12.5px] text-ink-mute">
                켠 사람의 주간보고에 이 프로젝트 칸이 생깁니다.
              </p>
              <div className="mt-4 grid gap-1.5 sm:grid-cols-2">
                {members.map((m) => {
                  const active = on.has(m.id);
                  return (
                    <form key={m.id} action={toggleProjectMember}>
                      <input type="hidden" name="project_id" value={project!.id} />
                      <input type="hidden" name="member_id" value={m.id} />
                      <input type="hidden" name="on" value={active ? "0" : "1"} />
                      <button
                        type="submit"
                        className={`flex w-full items-center justify-between rounded-2xl px-4 py-2.5 text-[13px] font-medium transition-colors ${
                          active
                            ? "bg-brand-50 text-brand-700"
                            : "bg-canvas text-ink-mute hover:bg-ink-line/60"
                        }`}
                      >
                        {m.name}
                        <span className="text-[11px] font-bold">
                          {active ? "투입" : "＋"}
                        </span>
                      </button>
                    </form>
                  );
                })}
              </div>
            </div>
          ) : null}
        </div>
      )}
    </Sheet>
  );
}
