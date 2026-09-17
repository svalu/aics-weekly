import { db } from "./db";
import type { Feedback } from "./types";

/**
 * 피드백 저장소.
 *
 * 프로덕션은 메모리 DB 라 인스턴스가 재활용되면 데이터가 사라진다.
 * 피드백만은 진짜로 남아야 하니 BLOB_READ_WRITE_TOKEN 이 있으면
 * Vercel Blob(비공개 스토어)에 JSON 파일 하나씩으로 쌓는다.
 * 토큰이 없으면(로컬 등) 기존대로 DB 테이블을 쓴다.
 *
 * Blob 쪽은 feedback/<created_at>-<id>.json 한 파일 = 한 건.
 * 상태 변경은 같은 경로에 덮어쓰기, 삭제는 del.
 */

const PREFIX = "feedback/";

export const usingBlob = () => Boolean(process.env.BLOB_READ_WRITE_TOKEN);

async function blob() {
  return await import("@vercel/blob");
}

function pathFor(f: Pick<Feedback, "id" | "created_at">) {
  return `${PREFIX}${f.created_at.replace(/[:.]/g, "-")}-${f.id}.json`;
}

/* ── 읽기 ─────────────────────────────────────────────── */

export async function listFeedback(opts: { memberId?: string } = {}): Promise<Feedback[]> {
  if (!usingBlob()) {
    let q = db().from("feedback").select("*").order("created_at", { ascending: false });
    if (opts.memberId) q = q.eq("member_id", opts.memberId);
    const { data } = await q;
    return (data ?? []) as Feedback[];
  }

  const { list, get } = await blob();
  const out: Feedback[] = [];
  let cursor: string | undefined;
  do {
    const page = await list({ prefix: PREFIX, cursor, limit: 1000 });
    for (const b of page.blobs) {
      const res = await get(b.pathname, { access: "private" });
      if (!res) continue;
      try {
        out.push(JSON.parse(await new Response(res.stream).text()) as Feedback);
      } catch {
        /* 깨진 파일은 건너뛴다 */
      }
    }
    cursor = page.hasMore ? page.cursor : undefined;
  } while (cursor);

  const filtered = opts.memberId ? out.filter((f) => f.member_id === opts.memberId) : out;
  return filtered.sort((a, b) => b.created_at.localeCompare(a.created_at));
}

async function getOne(id: string): Promise<Feedback | null> {
  const all = await listFeedback();
  return all.find((f) => f.id === id) ?? null;
}

/* ── 쓰기 ─────────────────────────────────────────────── */

export async function addFeedback(input: {
  member_id: string;
  kind: string;
  body: string;
  page: string | null;
  version: string | null;
}): Promise<void> {
  if (!usingBlob()) {
    await db().from("feedback").insert(input);
    return;
  }
  const { put } = await blob();
  const f: Feedback = {
    id: crypto.randomUUID(),
    created_at: new Date().toISOString(),
    status: "새 의견",
    ...input,
  };
  await put(pathFor(f), JSON.stringify(f), {
    access: "private",
    addRandomSuffix: false,
    contentType: "application/json",
  });
}

export async function updateFeedbackStatus(id: string, status: string): Promise<void> {
  if (!usingBlob()) {
    await db().from("feedback").update({ status }).eq("id", id);
    return;
  }
  const f = await getOne(id);
  if (!f) return;
  const { put } = await blob();
  await put(pathFor(f), JSON.stringify({ ...f, status }), {
    access: "private",
    addRandomSuffix: false,
    contentType: "application/json",
    allowOverwrite: true,
  });
}

/** memberId 를 주면 그 사람 것일 때만 지운다(관리자는 undefined) */
export async function removeFeedback(id: string, onlyOfMember?: string): Promise<void> {
  if (!usingBlob()) {
    let q = db().from("feedback").delete().eq("id", id);
    if (onlyOfMember) q = q.eq("member_id", onlyOfMember);
    await q;
    return;
  }
  const f = await getOne(id);
  if (!f) return;
  if (onlyOfMember && f.member_id !== onlyOfMember) return;
  const { del } = await blob();
  await del(pathFor(f));
}
