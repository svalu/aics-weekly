import Link from "next/link";
import { db } from "@/lib/db";
import { currentMember } from "@/lib/session";
import { currentWeek, weekLabel, fmtDateShort } from "@/lib/week";
import type { Meeting, Member } from "@/lib/types";
import { Avatar, PageHead, Card, Empty, StatusDot, Stat } from "@/components/ui";
import { WeekNav } from "@/components/week-nav";
import { MeetingForm } from "@/components/meeting-form";
import { IconUsers, IconSpark, IconCheck, IconTarget } from "@/components/icons";

export const dynamic = "force-dynamic";

/** 팀 Ground Rule: 고객 미팅의 30% 는 Net New */
const NET_NEW_GOAL = 0.3;

const doneTone = (v: string) =>
  v === "Y" ? "ok" : v === "N" ? "danger" : v === "N/A" ? "mute" : "info";
const doneLabel = (v: string) => (v ? v : "예정");

export default async function MeetingsPage({
  searchParams,
}: {
  searchParams: Promise<{ w?: string; owner?: string; all?: string }>;
}) {
  const sp = await searchParams;
  const week = sp.w ?? currentWeek();
  const showAll = sp.all === "1";
  const me = (await currentMember())!;
  const sb = db();

  const [{ data: meetingRows }, { data: memberRows }] = await Promise.all([
    sb.from("meetings").select("*").order("planned_date", { nullsFirst: false }),
    sb.from("members").select("*").eq("active", true).order("sort_order"),
  ]);

  const all = (meetingRows ?? []) as Meeting[];
  const members = (memberRows ?? []) as Member[];
  const nameOf = new Map(members.map((m) => [m.id, m.name]));

  const scope = showAll ? all : all.filter((m) => m.week_start === week);
  let list = scope;
  if (sp.owner) list = list.filter((m) => m.owner_id === sp.owner);

  const netNew = scope.filter((m) => m.kind === "Net New").length;
  const ratio = scope.length ? netNew / scope.length : 0;
  const held = scope.filter((m) => m.done === "Y").length;
  const planned = scope.filter((m) => !m.done).length;

  const qs = (extra: Record<string, string | null>) => {
    const p = new URLSearchParams();
    if (week !== currentWeek()) p.set("w", week);
    if (sp.owner) p.set("owner", sp.owner);
    if (showAll) p.set("all", "1");
    for (const [k, v] of Object.entries(extra)) {
      if (v === null) p.delete(k);
      else p.set(k, v);
    }
    const s = p.toString();
    return s ? `/meetings?${s}` : "/meetings";
  };

  return (
    <>
      <PageHead
        title="고객 미팅 로그"
        sub={showAll ? `전체 ${all.length}건` : weekLabel(week)}
        right={
          <>
            {!showAll ? <WeekNav week={week} /> : null}
            <MeetingForm members={members} defaultWeek={week} defaultOwnerId={me.id} />
          </>
        }
      />

      <div className="mb-5 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
        <Stat
          label="미팅"
          value={scope.length}
          icon={<IconUsers size={16} />}
          note={showAll ? "누적" : "이번 주"}
        />
        <Stat
          label="Net New"
          value={netNew}
          icon={<IconSpark size={16} />}
          accent
          delta={{
            dir: ratio >= NET_NEW_GOAL ? "up" : "down",
            text: `${Math.round(ratio * 100)}%`,
          }}
          note={`목표 ${NET_NEW_GOAL * 100}%`}
        />
        <Stat label="완료" value={held} icon={<IconCheck size={16} />} note="수행 Y" />
        <Stat
          label="예정"
          value={planned}
          icon={<IconTarget size={16} />}
          note="아직 결과 미입력"
        />
      </div>

      {/* Net New 비중 막대 */}
      <Card className="mb-4 px-6 py-5">
        <div className="flex items-baseline justify-between">
          <p className="text-[13px] font-semibold text-ink-soft">Net New 비중</p>
          <p className="text-[13px] tabular-nums text-ink-mute">
            <b className="text-[15px] text-ink">{netNew}</b> / {scope.length}건
          </p>
        </div>
        <div className="relative mt-3 h-2.5 rounded-pill bg-canvas">
          <div
            className={`h-full rounded-pill transition-all ${
              ratio >= NET_NEW_GOAL ? "bg-brand-500" : "bg-warn"
            }`}
            style={{ width: `${Math.min(100, ratio * 100)}%` }}
          />
          {/* 목표선은 막대 위에 올린다 */}
          <div
            className="absolute -top-1 h-[18px] w-0.5 rounded-pill bg-ink"
            style={{ left: `${NET_NEW_GOAL * 100}%` }}
            title="목표 30%"
          />
        </div>
        <p className="mt-2.5 text-[12px] text-ink-mute">
          Ground Rule 상 목표는 30%. 검은 눈금이 목표선입니다.
        </p>
      </Card>

      <div className="mb-4 flex flex-wrap items-center gap-1.5">
        <Link
          href={qs({ all: showAll ? null : "1" })}
          className={`pill ${
            showAll ? "bg-ink text-white" : "bg-surface text-ink-soft hover:bg-canvas"
          }`}
        >
          {showAll ? "전체 보는 중" : "전체 기간 보기"}
        </Link>
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
          const n = scope.filter((x) => x.owner_id === m.id).length;
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
            title={showAll ? "미팅 기록이 없습니다" : "이 주에 잡힌 미팅이 없습니다"}
            hint="오른쪽 위 '미팅 추가' 로 남겨보세요."
          />
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[980px] text-left">
              <thead>
                <tr className="border-b border-ink-line text-[12px] font-semibold text-ink-mute">
                  <th className="px-5 py-3.5 font-semibold">담당</th>
                  <th className="px-3 py-3.5 font-semibold">구분</th>
                  <th className="px-3 py-3.5 font-semibold">고객사</th>
                  <th className="px-3 py-3.5 font-semibold">예상 내용</th>
                  <th className="px-3 py-3.5 font-semibold">예정</th>
                  <th className="px-3 py-3.5 font-semibold">수행</th>
                  <th className="px-3 py-3.5 font-semibold">결과</th>
                  <th className="px-5 py-3.5" />
                </tr>
              </thead>
              <tbody>
                {list.map((m) => (
                  <tr
                    key={m.id}
                    className="border-b border-ink-line/60 align-top transition-colors last:border-0 hover:bg-canvas/60"
                  >
                    <td className="whitespace-nowrap px-5 py-4">
                      {m.owner_id ? (
                        <span className="inline-flex items-center gap-1.5">
                          <Avatar name={nameOf.get(m.owner_id) ?? "?"} size={24} />
                          <span className="text-[13px]">{nameOf.get(m.owner_id)}</span>
                        </span>
                      ) : (
                        <span className="text-[13px] text-ink-mute">—</span>
                      )}
                    </td>
                    <td className="px-3 py-4">
                      <span
                        className={`chip ${
                          m.kind === "Net New"
                            ? "bg-brand-50 text-brand-700"
                            : "bg-canvas text-ink-mute"
                        }`}
                      >
                        {m.kind}
                      </span>
                    </td>
                    <td className="px-3 py-4">
                      <p className="text-[13.5px] font-semibold">{m.customer}</p>
                      {m.contact ? (
                        <p className="text-[11.5px] text-ink-mute">{m.contact}</p>
                      ) : null}
                    </td>
                    <td className="max-w-[300px] px-3 py-4">
                      <p className="line-clamp-2 text-[12.5px] leading-snug text-ink-soft">
                        {m.purpose || "—"}
                      </p>
                      {m.companions ? (
                        <p className="mt-0.5 text-[11.5px] text-ink-mute">
                          동행 {m.companions}
                        </p>
                      ) : null}
                    </td>
                    <td className="whitespace-nowrap px-3 py-4 text-[13px] tabular-nums">
                      {fmtDateShort(m.planned_date)}
                    </td>
                    <td className="whitespace-nowrap px-3 py-4">
                      <StatusDot tone={doneTone(m.done)}>{doneLabel(m.done)}</StatusDot>
                      {m.actual_date ? (
                        <span className="mt-0.5 block text-[11.5px] tabular-nums text-ink-mute">
                          {fmtDateShort(m.actual_date)}
                        </span>
                      ) : null}
                    </td>
                    <td className="max-w-[280px] px-3 py-4">
                      <p className="line-clamp-3 whitespace-pre-wrap text-[12px] leading-snug text-ink-mute">
                        {m.notes || "—"}
                      </p>
                    </td>
                    <td className="whitespace-nowrap px-5 py-4 text-right">
                      <MeetingForm
                        members={members}
                        meeting={m}
                        trigger={
                          <span className="cursor-pointer rounded-pill px-3 py-1.5 text-[12.5px] font-semibold text-ink-soft transition-colors hover:bg-canvas">
                            수정
                          </span>
                        }
                      />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </>
  );
}
