import Link from "next/link";
import { db } from "@/lib/db";
import { setActionStatus } from "@/lib/actions";
import { fmtDate, daysLeft } from "@/lib/week";
import type { ActionItem, Member } from "@/lib/types";
import {
  Avatar,
  PageHead,
  Card,
  Empty,
  StatusDot,
  actionTone,
  Stat,
} from "@/components/ui";
import { ActionForm } from "@/components/action-form";
import { IconTarget, IconClock, IconWarn, IconCheck } from "@/components/icons";

export const dynamic = "force-dynamic";

const OPEN = ["10.대기", "20.진행중"];

export default async function ActionsPage({
  searchParams,
}: {
  searchParams: Promise<{ v?: string; owner?: string; cat?: string }>;
}) {
  const sp = await searchParams;
  const view = sp.v ?? "open";
  const sb = db();

  const [{ data: itemRows }, { data: memberRows }] = await Promise.all([
    sb.from("action_items").select("*").order("target_date", { nullsFirst: false }),
    sb.from("members").select("*").eq("active", true).order("sort_order"),
  ]);

  const all = (itemRows ?? []) as ActionItem[];
  const members = (memberRows ?? []) as Member[];
  const nameOf = new Map(members.map((m) => [m.id, m.name]));

  const open = all.filter((a) => OPEN.includes(a.status));
  const overdue = open.filter((a) => {
    const d = daysLeft(a.target_date);
    return d !== null && d < 0;
  });
  const dueSoon = open.filter((a) => {
    const d = daysLeft(a.target_date);
    return d !== null && d >= 0 && d <= 7;
  });
  const closed = all.filter((a) => a.status.startsWith("50"));

  let list =
    view === "all"
      ? all
      : view === "overdue"
        ? overdue
        : view === "closed"
          ? closed
          : open;

  if (sp.owner) list = list.filter((a) => a.owner_id === sp.owner);
  if (sp.cat) list = list.filter((a) => a.category === sp.cat);

  // 지연 → 임박 → 나머지 순
  list = [...list].sort((a, b) => {
    const da = daysLeft(a.target_date);
    const dbv = daysLeft(b.target_date);
    if (da === null) return 1;
    if (dbv === null) return -1;
    return da - dbv;
  });

  const qs = (extra: Record<string, string | null>) => {
    const p = new URLSearchParams();
    if (view !== "open") p.set("v", view);
    if (sp.owner) p.set("owner", sp.owner);
    if (sp.cat) p.set("cat", sp.cat);
    for (const [k, v] of Object.entries(extra)) {
      if (v === null) p.delete(k);
      else p.set(k, v);
    }
    const s = p.toString();
    return s ? `/actions?${s}` : "/actions";
  };

  const VIEWS = [
    { key: "open", label: "진행중", n: open.length },
    { key: "overdue", label: "지연", n: overdue.length },
    { key: "closed", label: "완료", n: closed.length },
    { key: "all", label: "전체", n: all.length },
  ];

  return (
    <>
      <PageHead
        title="Action Tracker"
        sub="누가 언제까지 무엇을 하기로 했는지"
        right={<ActionForm members={members} />}
      />

      <div className="mb-5 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
        <Stat
          label="진행중"
          value={open.length}
          icon={<IconTarget size={16} />}
          note="아직 안 닫힌 항목"
          href={qs({ v: "open" })}
        />
        <Stat
          label="지연"
          value={overdue.length}
          icon={<IconWarn size={16} />}
          accent={overdue.length > 0}
          note="Target Date 초과"
          href={qs({ v: "overdue" })}
        />
        <Stat
          label="이번 주 마감"
          value={dueSoon.length}
          icon={<IconClock size={16} />}
          note="7일 이내"
        />
        <Stat
          label="완료"
          value={closed.length}
          icon={<IconCheck size={16} />}
          note={`전체 ${all.length}건 중`}
          href={qs({ v: "closed" })}
        />
      </div>

      {/* 필터 */}
      <div className="mb-4 flex flex-wrap items-center gap-1.5">
        {VIEWS.map((v) => (
          <Link
            key={v.key}
            href={qs({ v: v.key === "open" ? null : v.key })}
            className={`pill ${
              view === v.key ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
            }`}
          >
            {v.label} <span className="opacity-60">{v.n}</span>
          </Link>
        ))}
        <span className="mx-1 h-5 w-px bg-ink-line" />
        <Link
          href={qs({ owner: null })}
          className={`pill ${
            !sp.owner ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
          }`}
        >
          모든 담당자
        </Link>
        {members.map((m) => {
          const n = all.filter((a) => a.owner_id === m.id && OPEN.includes(a.status)).length;
          if (!n) return null;
          return (
            <Link
              key={m.id}
              href={qs({ owner: m.id })}
              className={`pill ${
                sp.owner === m.id
                  ? "bg-ink text-white"
                  : "bg-surface text-ink-soft hover:bg-canvas"
              }`}
            >
              {m.name} <span className="opacity-60">{n}</span>
            </Link>
          );
        })}
      </div>

      <Card className="overflow-hidden">
        {list.length === 0 ? (
          <Empty
            title="해당하는 항목이 없습니다"
            hint="필터를 바꾸거나 새 액션을 추가해보세요."
          />
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[920px] text-left">
              <thead>
                <tr className="border-b border-ink-line text-[12px] font-semibold text-ink-mute">
                  <th className="px-5 py-3.5 font-semibold">구분</th>
                  <th className="px-3 py-3.5 font-semibold">고객</th>
                  <th className="px-3 py-3.5 font-semibold">Action Item</th>
                  <th className="px-3 py-3.5 font-semibold">담당</th>
                  <th className="px-3 py-3.5 font-semibold">Target</th>
                  <th className="px-3 py-3.5 font-semibold">상태</th>
                  <th className="px-5 py-3.5" />
                </tr>
              </thead>
              <tbody>
                {list.map((a) => {
                  const d = daysLeft(a.target_date);
                  const isOpen = OPEN.includes(a.status);
                  const late = isOpen && d !== null && d < 0;
                  const soon = isOpen && d !== null && d >= 0 && d <= 3;
                  return (
                    <tr
                      key={a.id}
                      className="border-b border-ink-line/60 align-top transition-colors last:border-0 hover:bg-canvas/60"
                    >
                      <td className="px-5 py-4">
                        <span className="chip bg-canvas text-ink-mute">{a.category}</span>
                      </td>
                      <td className="px-3 py-4 text-[13px] font-medium">
                        {a.customer || "—"}
                      </td>
                      <td className="max-w-[420px] px-3 py-4">
                        <p className="text-[13.5px] font-semibold leading-snug">
                          {a.title}
                        </p>
                        {a.progress_update ? (
                          <p className="mt-1 line-clamp-2 text-[12px] leading-snug text-ink-mute">
                            {a.progress_update.split("\n").filter(Boolean).at(-1)}
                          </p>
                        ) : null}
                      </td>
                      <td className="px-3 py-4">
                        {a.owner_id ? (
                          <span className="inline-flex items-center gap-1.5">
                            <Avatar name={nameOf.get(a.owner_id) ?? "?"} size={24} />
                            <span className="text-[13px]">{nameOf.get(a.owner_id)}</span>
                          </span>
                        ) : (
                          <span className="text-[13px] text-ink-mute">미지정</span>
                        )}
                      </td>
                      <td className="whitespace-nowrap px-3 py-4">
                        <span className="text-[13px] tabular-nums">
                          {fmtDate(a.target_date)}
                        </span>
                        {late ? (
                          <span className="mt-0.5 block text-[11.5px] font-bold text-danger">
                            {Math.abs(d!)}일 지연
                          </span>
                        ) : soon ? (
                          <span className="mt-0.5 block text-[11.5px] font-bold text-warn">
                            {d === 0 ? "오늘 마감" : `${d}일 남음`}
                          </span>
                        ) : null}
                      </td>
                      <td className="px-3 py-4">
                        <StatusDot tone={actionTone(a.status)}>
                          {a.status.replace(/^\d+\./, "")}
                        </StatusDot>
                      </td>
                      <td className="whitespace-nowrap px-5 py-4 text-right">
                        <div className="inline-flex items-center gap-1">
                          {isOpen ? (
                            <form action={setActionStatus}>
                              <input type="hidden" name="id" value={a.id} />
                              <input type="hidden" name="status" value="50.Close" />
                              <button
                                type="submit"
                                title="완료 처리"
                                className="grid h-8 w-8 place-items-center rounded-full text-ink-mute transition-colors hover:bg-[#DCF5E7] hover:text-ok"
                              >
                                <IconCheck size={16} />
                              </button>
                            </form>
                          ) : null}
                          <ActionForm
                            members={members}
                            item={a}
                            trigger={
                              <span className="cursor-pointer rounded-pill px-3 py-1.5 text-[12.5px] font-semibold text-ink-soft transition-colors hover:bg-canvas">
                                수정
                              </span>
                            }
                          />
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </>
  );
}
