"use client";

import { saveAction, deleteAction } from "@/lib/actions";
import { ACTION_STATUSES, type ActionItem, type Member } from "@/lib/types";
import { Sheet, Field, Row } from "./sheet";
import { IconPlus } from "./icons";

const CATEGORIES = ["Sales", "Tech", "ALL"];

export function ActionForm({
  members,
  item,
  trigger,
}: {
  members: Member[];
  item?: ActionItem;
  trigger?: React.ReactNode;
}) {
  const editing = Boolean(item);
  const today = new Date().toISOString().slice(0, 10);

  return (
    <Sheet
      title={editing ? "액션 아이템 수정" : "액션 아이템 추가"}
      sub={editing ? item!.title : "누가, 언제까지, 무엇을"}
      trigger={
        trigger ?? (
          <span className="btn-dark">
            <IconPlus size={16} /> 추가
          </span>
        )
      }
    >
      {(close) => (
        <form
          action={async (fd) => {
            await saveAction(fd);
            close();
          }}
          className="space-y-4"
        >
          {item ? <input type="hidden" name="id" value={item.id} /> : null}

          <Field label="Action Item">
            <input
              name="title"
              required
              autoFocus={!editing}
              defaultValue={item?.title ?? ""}
              placeholder="무엇을 해야 하는지 한 줄로"
              className="field"
            />
          </Field>

          <Row>
            <Field label="구분">
              <select name="category" defaultValue={item?.category ?? "Sales"} className="field">
                {CATEGORIES.map((c) => (
                  <option key={c}>{c}</option>
                ))}
              </select>
            </Field>
            <Field label="고객명">
              <input
                name="customer"
                defaultValue={item?.customer ?? ""}
                placeholder="예: 가온손해보험"
                className="field"
              />
            </Field>
          </Row>

          <Row>
            <Field label="Owner">
              <select name="owner_id" defaultValue={item?.owner_id ?? ""} className="field">
                <option value="">미지정</option>
                {members.map((m) => (
                  <option key={m.id} value={m.id}>
                    {m.name}
                  </option>
                ))}
              </select>
            </Field>
            <Field label="Status">
              <select name="status" defaultValue={item?.status ?? "20.진행중"} className="field">
                {ACTION_STATUSES.map((s) => (
                  <option key={s}>{s}</option>
                ))}
              </select>
            </Field>
          </Row>

          <Row>
            <Field label="Open Date">
              <input
                type="date"
                name="open_date"
                defaultValue={item?.open_date ?? today}
                className="field"
              />
            </Field>
            <Field label="Target Date">
              <input
                type="date"
                name="target_date"
                defaultValue={item?.target_date ?? ""}
                className="field"
              />
            </Field>
          </Row>

          <Field label="Close Date" hint="완료로 바꾸면 비워둬도 오늘 날짜가 들어갑니다.">
            <input
              type="date"
              name="close_date"
              defaultValue={item?.close_date ?? ""}
              className="field"
            />
          </Field>

          <Field label="Progress Update" hint="진행하면서 한 줄씩 덧붙이세요.">
            <textarea
              name="progress_update"
              rows={6}
              defaultValue={item?.progress_update ?? ""}
              placeholder={"9/17 고객 미팅 완료\n9/18 견적 초안 전달"}
              className="field resize-y leading-relaxed"
            />
          </Field>

          <Field label="Remark">
            <input name="remark" defaultValue={item?.remark ?? ""} className="field" />
          </Field>

          <div className="flex items-center gap-2 pt-2">
            <button type="submit" className="btn-dark flex-1">
              저장
            </button>
            {editing ? (
              <button
                type="submit"
                formAction={async (fd) => {
                  await deleteAction(fd);
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
