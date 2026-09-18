import Link from "next/link";
import { db } from "@/lib/db";
import { fmtDate } from "@/lib/week";
import { DEAL_STAGES, type Deal, type DealUpdate } from "@/lib/types";
import { PageHead, Card, Empty, StatusDot, stageTone, Stat } from "@/components/ui";
import { DealForm } from "@/components/deal-form";
import { IconBriefcase, IconCheck, IconSpark, IconClock } from "@/components/icons";

export const dynamic = "force-dynamic";

export default async function DealsPage({
  searchParams,
}: {
  searchParams: Promise<{ stage?: string; cat?: string }>;
}) {
  const sp = await searchParams;
  const sb = db();

  const [{ data: dealRows }, { data: updateRows }] = await Promise.all([
    sb.from("deals").select("*").order("seq", { nullsFirst: false }),
    sb.from("deal_updates").select("*").order("log_date", { ascending: false }),
  ]);

  const all = (dealRows ?? []) as Deal[];
  const updates = (updateRows ?? []) as DealUpdate[];
  const byDeal = new Map<string, DealUpdate[]>();
  for (const u of updates) {
    const list = byDeal.get(u.deal_id) ?? [];
    list.push(u);
    byDeal.set(u.deal_id, list);
  }

  const sales = all.filter((d) => d.category !== "내부업무");
  const cat = sp.cat === "내부업무" ? "내부업무" : "Sales";
  let list = all.filter((d) =>
    cat === "내부업무" ? d.category === "내부업무" : d.category !== "내부업무"
  );
  if (sp.stage) list = list.filter((d) => d.stage === sp.stage);

  const won = sales.filter((d) => d.stage === "계약완료");
  const closing = sales.filter((d) => d.stage === "계약진행중");
  const running = sales.filter((d) => d.stage === "진행중");
  const held = sales.filter((d) => d.stage === "홀딩" || d.stage === "보류");

  const totalSeats = sales.reduce((sum, d) => {
    const n = Number((d.seats ?? "").replace(/[^\d]/g, ""));
    return sum + (Number.isFinite(n) ? n : 0);
  }, 0);

  const qs = (extra: Record<string, string | null>) => {
    const p = new URLSearchParams();
    if (cat !== "Sales") p.set("cat", cat);
    if (sp.stage) p.set("stage", sp.stage);
    for (const [k, v] of Object.entries(extra)) {
      if (v === null) p.delete(k);
      else p.set(k, v);
    }
    const s = p.toString();
    return s ? `/deals?${s}` : "/deals";
  };

  return (
    <>
      <PageHead
        title="Sales 파이프라인"
        sub={`${sales.length}개 딜 · 누적 ${totalSeats.toLocaleString()}석`}
        right={<DealForm />}
      />

      <div className="stagger mb-5 grid grid-cols-2 gap-2.5 sm:gap-3 xl:grid-cols-4">
        <Stat
          label="계약완료"
          value={won.length}
          icon={<IconCheck size={16} />}
          note={won.map((d) => d.customer).filter(Boolean).slice(0, 2).join(", ") || undefined}
          href={qs({ stage: "계약완료", cat: null })}
        />
        <Stat
          label="계약진행중"
          value={closing.length}
          icon={<IconSpark size={16} />}
          accent={closing.length > 0}
          note="곧 떨어질 건"
          href={qs({ stage: "계약진행중", cat: null })}
        />
        <Stat
          label="진행중"
          value={running.length}
          icon={<IconBriefcase size={16} />}
          note="영업 활동 중"
          href={qs({ stage: "진행중", cat: null })}
        />
        <Stat
          label="홀딩 · 보류"
          value={held.length}
          icon={<IconClock size={16} />}
          note="깨우거나 정리할 건"
          href={qs({ stage: "홀딩", cat: null })}
        />
      </div>

      <div className="mb-4 flex flex-wrap items-center gap-1.5">
        <Link
          href={qs({ cat: null, stage: null })}
          className={`pill ${
            cat === "Sales" && !sp.stage
              ? "bg-ink text-white"
              : "bg-surface text-ink-soft hover:bg-canvas"
          }`}
        >
          Sales 전체 {sales.length}
        </Link>
        {DEAL_STAGES.map((s) => {
          const n = sales.filter((d) => d.stage === s).length;
          if (!n) return null;
          return (
            <Link
              key={s}
              href={qs({ stage: s, cat: null })}
              className={`pill ${
                sp.stage === s ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
              }`}
            >
              {s} <span className="opacity-60">{n}</span>
            </Link>
          );
        })}
        <span className="mx-1 h-5 w-px bg-ink-line" />
        <Link
          href={qs({ cat: "내부업무", stage: null })}
          className={`pill ${
            cat === "내부업무" ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
          }`}
        >
          내부업무 {all.filter((d) => d.category === "내부업무").length}
        </Link>
      </div>

      {list.length === 0 ? (
        <Card>
          <Empty title="해당하는 딜이 없습니다" hint="필터를 바꿔보세요." />
        </Card>
      ) : (
        <div className="stagger grid gap-3 lg:grid-cols-2">
          {list.map((d) => {
            const logs = byDeal.get(d.id) ?? [];
            const latest = logs[0];
            return (
              <DealForm
                key={d.id}
                deal={d}
                updates={logs}
                trigger={
                  <article className="liftable flex w-full cursor-pointer flex-col rounded-card border border-ink-line bg-surface p-5 text-left hover:shadow-pop">
                    <div className="flex items-start justify-between gap-3">
                      <div className="min-w-0">
                        <div className="flex flex-wrap items-center gap-2">
                          <h3 className="text-[16px] font-bold tracking-[-0.01em]">
                            {d.customer || d.name}
                          </h3>
                          <StatusDot tone={stageTone(d.stage)}>{d.stage}</StatusDot>
                        </div>
                        <p className="mt-0.5 text-[13px] text-ink-mute">{d.name}</p>
                      </div>
                      {d.seats ? (
                        <span className="chip shrink-0 bg-canvas text-ink-soft">
                          {d.seats}
                        </span>
                      ) : null}
                    </div>

                    {d.amount ? (
                      <p className="mt-3 whitespace-pre-line text-[15px] font-extrabold tracking-[-0.01em] text-brand-600">
                        {d.amount}
                      </p>
                    ) : null}

                    <dl className="mt-3 grid grid-cols-2 gap-x-4 gap-y-1.5 text-[12.5px]">
                      {d.lead ? (
                        <div className="flex gap-2">
                          <dt className="shrink-0 text-ink-mute">Lead</dt>
                          <dd className="truncate font-medium">{d.lead}</dd>
                        </div>
                      ) : null}
                      {d.sales_mzc ? (
                        <div className="flex gap-2">
                          <dt className="shrink-0 text-ink-mute">MZC</dt>
                          <dd className="truncate font-medium">{d.sales_mzc}</dd>
                        </div>
                      ) : null}
                      {d.sales_aws ? (
                        <div className="flex gap-2">
                          <dt className="shrink-0 text-ink-mute">AWS</dt>
                          <dd className="truncate font-medium">{d.sales_aws}</dd>
                        </div>
                      ) : null}
                      {d.period ? (
                        <div className="flex gap-2">
                          <dt className="shrink-0 text-ink-mute">기간</dt>
                          <dd className="truncate font-medium">{d.period}</dd>
                        </div>
                      ) : null}
                    </dl>

                    <div className="mt-auto pt-4">
                      {latest ? (
                        <div className="rounded-2xl bg-canvas px-4 py-3">
                          <p className="text-[11.5px] font-bold text-brand-600 tabular-nums">
                            {fmtDate(latest.log_date)} · 최근 진행
                          </p>
                          <p className="mt-1 line-clamp-3 whitespace-pre-wrap text-[12.5px] leading-snug text-ink-soft">
                            {latest.body}
                          </p>
                          {logs.length > 1 ? (
                            <p className="mt-1.5 text-[11.5px] text-ink-mute">
                              기록 {logs.length}건
                            </p>
                          ) : null}
                        </div>
                      ) : (
                        <p className="rounded-2xl bg-canvas px-4 py-3 text-[12.5px] text-ink-mute">
                          진행 기록 없음 · 눌러서 추가
                        </p>
                      )}
                    </div>
                  </article>
                }
              />
            );
          })}
        </div>
      )}
    </>
  );
}
