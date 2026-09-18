"use client";

import { saveMeeting, deleteMeeting } from "@/lib/actions";
import type { Meeting, Member } from "@/lib/types";
import { Sheet, Field, Row } from "./sheet";
import { IconPlus } from "./icons";

const DONE = [
  { v: "", label: "예정" },
  { v: "Y", label: "Y · 만남" },
  { v: "N", label: "N · 연기/취소" },
  { v: "N/A", label: "N/A · 무산" },
];

export function MeetingForm({
  members,
  meeting,
  defaultWeek,
  defaultOwnerId,
  trigger,
}: {
  members: Member[];
  meeting?: Meeting;
  defaultWeek?: string;
  defaultOwnerId?: string;
  trigger?: React.ReactNode;
}) {
  const editing = Boolean(meeting);

  return (
    <Sheet
      title={editing ? "미팅 수정" : "미팅 추가"}
      sub={editing ? meeting!.customer : "예정이든 완료든 여기에 남깁니다"}
      trigger={
        trigger ?? (
          <span className="btn-dark">
            <IconPlus size={16} /> 미팅 추가
          </span>
        )
      }
    >
      {(close) => (
        <form
          action={async (fd) => {
            await saveMeeting(fd);
            close();
          }}
          className="space-y-4"
        >
          {meeting ? <input type="hidden" name="id" value={meeting.id} /> : null}

          <Row>
            <Field label="고객사">
              <input
                name="customer"
                required
                autoFocus={!editing}
                defaultValue={meeting?.customer ?? ""}
                className="field"
              />
            </Field>
            <Field label="고객 담당자">
              <input name="contact" defaultValue={meeting?.contact ?? ""} className="field" />
            </Field>
          </Row>

          <Row>
            <Field label="Owner">
              <select
                name="owner_id"
                defaultValue={meeting?.owner_id ?? defaultOwnerId ?? ""}
                className="field"
              >
                <option value="">미지정</option>
                {members.map((m) => (
                  <option key={m.id} value={m.id}>
                    {m.name}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="구분">
              <select name="kind" defaultValue={meeting?.kind ?? "Net New"} className="field">
                <option>Net New</option>
                <option>Existing</option>
              </select>
            </Field>
          </Row>

          <Row>
            <Field label="예정 주" hint="그 주 월요일">
              <input
                type="date"
                name="week_start"
                defaultValue={meeting?.week_start ?? defaultWeek ?? ""}
                className="field"
              />
            </Field>
            <Field label="예상일자">
              <input
                type="date"
                name="planned_date"
                defaultValue={meeting?.planned_date ?? ""}
                className="field"
              />
            </Field>
          </Row>

          <Field label="예상 미팅 내용">
            <textarea
              name="purpose"
              rows={2}
              defaultValue={meeting?.purpose ?? ""}
              placeholder="예: AICC 도입 계획 체크"
              className="field resize-y"
            />
          </Field>

          <Row>
            <Field label="수행 여부">
              <select name="done" defaultValue={meeting?.done ?? ""} className="field">
                {DONE.map((d) => (
                  <option key={d.v} value={d.v}>
                    {d.label}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="실제 미팅일자">
              <input
                type="date"
                name="actual_date"
                defaultValue={meeting?.actual_date ?? ""}
                className="field"
              />
            </Field>
          </Row>

          <Field label="동행자">
            <input
              name="companions"
              defaultValue={meeting?.companions ?? ""}
              placeholder="정도현, 임채린"
              className="field"
            />
          </Field>

          <Field label="미팅 내용" hint="끝나고 나서 결과를 적습니다.">
            <textarea
              name="notes"
              rows={5}
              defaultValue={meeting?.notes ?? ""}
              className="field resize-y leading-relaxed"
            />
          </Field>

          <div className="flex items-center gap-2 pt-2">
            <button type="submit" className="btn-dark flex-1">
              저장
            </button>
            {editing ? (
              <button
                type="submit"
                formAction={async (fd) => {
                  await deleteMeeting(fd);
                  close();
                }}
                className="btn-outline text-danger hover:bg-[#FFE4E4]"
              >
                삭제
              </button>
            ) : null}
          </div>
        </form>
      )}
    </Sheet>
  );
}
