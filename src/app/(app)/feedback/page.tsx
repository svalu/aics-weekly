import { db } from "@/lib/db";
import { requireMember } from "@/lib/session";
import { setFeedbackStatus, deleteFeedback } from "@/lib/actions";
import { listFeedback, usingBlob } from "@/lib/feedback-store";
import { fmtDate } from "@/lib/week";
import { FEEDBACK_STATUSES, type Member } from "@/lib/types";
import { Avatar, PageHead, Card, Empty, StatusDot } from "@/components/ui";

export const dynamic = "force-dynamic";

/**
 * 베타 피드백 모아 보기.
 * 관리자는 전부, 나머지는 자기가 남긴 것만 본다.
 * 저장소는 feedback-store 가 고른다(Blob 또는 DB).
 */
export default async function FeedbackPage() {
  const me = await requireMember();

  const [list, { data: memberRows }] = await Promise.all([
    listFeedback(me.is_admin ? {} : { memberId: me.id }),
    db().from("members").select("*"),
  ]);
  const nameOf = new Map(((memberRows ?? []) as Member[]).map((m) => [m.id, m.name]));

  const fresh = list.filter((f) => f.status === "새 의견").length;
  const tone = (s: string) => (s === "반영함" ? "ok" : s === "확인함" ? "info" : "brand");
  const kindTone = (k: string) =>
    k === "버그" ? "bg-[#FFE4E4] text-danger" : k === "아이디어" ? "bg-[#DDEBFF] text-[#1D4ED8]" : "bg-canvas text-ink-soft";

  return (
    <>
      <PageHead
        title="베타 피드백"
        sub={
          (me.is_admin
            ? `${list.length}건 · 아직 안 본 것 ${fresh}건`
            : `${me.name}님이 남긴 의견 ${list.length}건`) +
          (usingBlob() ? " · 영구 저장(Blob)" : " · DB 저장")
        }
      />

      <Card className="overflow-hidden">
        {list.length === 0 ? (
          <Empty
            title="아직 남긴 의견이 없습니다"
            hint="오른쪽 아래 '피드백' 버튼으로 남길 수 있어요."
          />
        ) : (
          <ul className="stagger divide-y divide-ink-line/60">
            {list.map((f) => (
              <li key={f.id} className="flex flex-wrap items-start gap-4 px-6 py-5">
                <div className="flex w-[150px] shrink-0 items-center gap-2">
                  <Avatar name={f.member_id ? nameOf.get(f.member_id) ?? "?" : "?"} size={30} />
                  <div className="min-w-0">
                    <p className="truncate text-[13px] font-bold">
                      {f.member_id ? nameOf.get(f.member_id) ?? "—" : "—"}
                    </p>
                    <p className="text-[11px] tabular-nums text-ink-mute">
                      {fmtDate(f.created_at)}
                    </p>
                  </div>
                </div>

                <div className="min-w-[240px] flex-1">
                  <div className="flex flex-wrap items-center gap-1.5">
                    <span className={`chip ${kindTone(f.kind)}`}>{f.kind}</span>
                    {f.page ? (
                      <span className="text-[11.5px] text-ink-mute">{f.page}</span>
                    ) : null}
                    {f.version ? (
                      <span className="text-[11.5px] text-ink-mute">· v{f.version}</span>
                    ) : null}
                  </div>
                  <p className="prose-report mt-2 text-ink">{f.body}</p>
                </div>

                <div className="flex shrink-0 items-center gap-2">
                  {me.is_admin ? (
                    <form action={setFeedbackStatus} className="flex items-center gap-1.5">
                      <input type="hidden" name="id" value={f.id} />
                      <StatusDot tone={tone(f.status)}>{f.status}</StatusDot>
                      <select
                        name="status"
                        defaultValue={f.status}
                        className="rounded-pill border border-ink-line bg-surface px-2.5 py-1 text-[12px]"
                      >
                        {FEEDBACK_STATUSES.map((s) => (
                          <option key={s}>{s}</option>
                        ))}
                      </select>
                      <button type="submit" className="btn-outline px-3 py-1.5 text-[12px]">
                        바꾸기
                      </button>
                    </form>
                  ) : (
                    <StatusDot tone={tone(f.status)}>{f.status}</StatusDot>
                  )}
                  <form action={deleteFeedback}>
                    <input type="hidden" name="id" value={f.id} />
                    <button
                      type="submit"
                      className="rounded-pill px-2.5 py-1.5 text-[12px] text-ink-mute hover:bg-[#FFE4E4] hover:text-danger"
                    >
                      삭제
                    </button>
                  </form>
                </div>
              </li>
            ))}
          </ul>
        )}
      </Card>
    </>
  );
}
