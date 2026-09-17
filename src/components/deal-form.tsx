"use client";

import { saveDeal, addDealUpdate, deleteDealUpdate } from "@/lib/actions";
import { DEAL_STAGES, type Deal, type DealUpdate } from "@/lib/types";
import { fmtDate } from "@/lib/week";
import { Sheet, Field, Row } from "./sheet";
import { IconPlus } from "./icons";

export function DealForm({
  deal,
  updates = [],
  trigger,
}: {
  deal?: Deal;
  updates?: DealUpdate[];
  trigger?: React.ReactNode;
}) {
  const editing = Boolean(deal);
  const today = new Date().toISOString().slice(0, 10);

  return (
    <Sheet
      wide
      title={editing ? deal!.name : "딜 추가"}
      sub={editing ? [deal!.customer, deal!.stage].filter(Boolean).join(" · ") : undefined}
      trigger={
        trigger ?? (
          <span className="btn-dark">
            <IconPlus size={16} /> 딜 추가
          </span>
        )
      }
    >
      {(close) => (
        <div className="space-y-7">
          <form
            action={async (fd) => {
              await saveDeal(fd);
              close();
            }}
            className="space-y-4"
          >
            {deal ? <input type="hidden" name="id" value={deal.id} /> : null}

            <Field label="프로젝트명">
              <input
                name="name"
                required
                autoFocus={!editing}
                defaultValue={deal?.name ?? ""}
                placeholder="예: AICC 구축 사업"
                className="field"
              />
            </Field>

            <Row>
              <Field label="고객사">
                <input name="customer" defaultValue={deal?.customer ?? ""} className="field" />
              </Field>
              <Field label="단계">
                <select name="stage" defaultValue={deal?.stage ?? "진행중"} className="field">
                  {DEAL_STAGES.map((s) => (
                    <option key={s}>{s}</option>
                  ))}
                </select>
              </Field>
            </Row>

            <Row>
              <Field label="구분">
                <select
                  name="category"
                  defaultValue={deal?.category ?? "Sales"}
                  className="field"
                >
                  <option>Sales</option>
                  <option>내부업무</option>
                </select>
              </Field>
              <Field label="Lead">
                <input name="lead" defaultValue={deal?.lead ?? ""} className="field" />
              </Field>
            </Row>

            <Row>
              <Field label="Sales (AWS)">
                <input name="sales_aws" defaultValue={deal?.sales_aws ?? ""} className="field" />
              </Field>
              <Field label="Sales (MZC)">
                <input name="sales_mzc" defaultValue={deal?.sales_mzc ?? ""} className="field" />
              </Field>
            </Row>

            <Row>
              <Field label="기간" hint="자유 표기. 예: 2026.07.13 ~ 2026.11.30">
                <input name="period" defaultValue={deal?.period ?? ""} className="field" />
              </Field>
              <Field label="예상/수주 금액">
                <input
                  name="amount"
                  defaultValue={deal?.amount ?? ""}
                  placeholder="PS : 3.2억"
                  className="field"
                />
              </Field>
            </Row>

            <Row>
              <Field label="석수">
                <input
                  name="seats"
                  defaultValue={deal?.seats ?? ""}
                  placeholder="400석"
                  className="field"
                />
              </Field>
              <Field label="비고">
                <input name="remark" defaultValue={deal?.remark ?? ""} className="field" />
              </Field>
            </Row>

            <button type="submit" className="btn-dark w-full">
              저장
            </button>
          </form>

          {editing ? (
            <div className="border-t border-ink-line pt-6">
              <h3 className="text-[15px] font-bold">진행내역</h3>
              <p className="mt-0.5 text-[12.5px] text-ink-mute">
                날짜별로 쌓입니다. 엑셀의 [20260722] 블록을 대신합니다.
              </p>

              <form action={addDealUpdate} className="mt-4 space-y-2.5">
                <input type="hidden" name="deal_id" value={deal!.id} />
                <div className="flex gap-2">
                  <input
                    type="date"
                    name="log_date"
                    defaultValue={today}
                    className="field w-auto shrink-0"
                  />
                  <button type="submit" className="btn-brand shrink-0">
                    기록 추가
                  </button>
                </div>
                <textarea
                  name="body"
                  rows={3}
                  required
                  placeholder={"- 고객사 방문\n : 견적 2개안 제출 예정"}
                  className="field resize-y leading-relaxed"
                />
              </form>

              <div className="mt-5 space-y-2">
                {updates.length === 0 ? (
                  <p className="rounded-2xl bg-canvas px-4 py-5 text-center text-[13px] text-ink-mute">
                    아직 기록이 없습니다.
                  </p>
                ) : (
                  updates.map((u) => (
                    <div key={u.id} className="group rounded-2xl bg-canvas px-4 py-3">
                      <div className="flex items-center justify-between">
                        <span className="text-[12px] font-bold text-brand-600 tabular-nums">
                          {fmtDate(u.log_date)}
                        </span>
                        <form action={deleteDealUpdate}>
                          <input type="hidden" name="id" value={u.id} />
                          <button
                            type="submit"
                            className="text-[11.5px] text-ink-mute opacity-0 transition-opacity hover:text-danger group-hover:opacity-100"
                          >
                            삭제
                          </button>
                        </form>
                      </div>
                      <p className="prose-report mt-1">{u.body}</p>
                    </div>
                  ))
                )}
              </div>
            </div>
          ) : null}
        </div>
      )}
    </Sheet>
  );
}
