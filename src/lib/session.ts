import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { db } from "./db";
import type { Member } from "./types";

const COOKIE = "aics_member";

/** 현재 로그인한 사람. 없으면 null. */
export async function currentMember(): Promise<Member | null> {
  const jar = await cookies();
  const id = jar.get(COOKIE)?.value;
  if (!id) return null;
  const { data } = await db().from("members").select("*").eq("id", id).maybeSingle();
  return (data as Member) ?? null;
}

/**
 * 로그인한 사람을 돌려주고, 없으면 로그인으로 보낸다.
 * layout 과 page 는 병렬로 렌더되므로 layout 의 redirect 만 믿으면
 * page 쪽이 null 을 만나 크래시 로그를 남긴다. page 에서는 이걸 쓴다.
 */
export async function requireMember(): Promise<Member> {
  const m = await currentMember();
  if (!m) redirect("/login");
  return m;
}

export async function setSession(memberId: string) {
  const jar = await cookies();
  jar.set(COOKIE, memberId, {
    httpOnly: true,
    sameSite: "lax",
    path: "/",
    maxAge: 60 * 60 * 24 * 90,
    secure: process.env.NODE_ENV === "production",
  });
}

export async function clearSession() {
  const jar = await cookies();
  jar.delete(COOKIE);
}

/** 이메일로 팀원을 찾는다. 대소문자·공백 무시. */
export async function findByEmail(email: string): Promise<Member | null> {
  const clean = email.trim().toLowerCase();
  if (!clean) return null;
  const { data } = await db()
    .from("members")
    .select("*")
    .ilike("email", clean)
    .maybeSingle();
  return (data as Member) ?? null;
}
