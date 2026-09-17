import { createClient, SupabaseClient } from "@supabase/supabase-js";
import { localClient } from "./local-db";

/**
 * 이 앱은 비밀번호 없는 사내 이메일 로그인이고, 모든 읽기/쓰기는
 * 서버 컴포넌트와 서버 액션에서만 일어난다. 그래서 브라우저에는
 * 키를 내려보내지 않고 서버에서 Service Role 키만 쓴다.
 *
 * LOCAL_DB=1 이고 Supabase URL 이 없으면 로컬 PGlite 를 쓴다(미리보기 전용).
 * local-db 모듈을 import 만 해두는 건 값이 싸다. 실제 Postgres 인스턴스는
 * localClient() 로 첫 쿼리가 나갈 때 만들어진다.
 */

const url = () => process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = () =>
  process.env.SUPABASE_SERVICE_ROLE_KEY ?? process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

export const isLocal = () => process.env.LOCAL_DB === "1" && !url();

let cached: SupabaseClient | null = null;
let cachedLocal: SupabaseClient | null = null;

export function db(): SupabaseClient {
  if (isLocal()) {
    // 이 앱이 쓰는 쿼리만 흉내 내는 대역. 타입만 맞춰 끼운다.
    cachedLocal ??= localClient() as unknown as SupabaseClient;
    return cachedLocal;
  }

  if (cached) return cached;
  const u = url();
  const k = key();
  if (!u || !k) {
    throw new Error(
      "Supabase 환경변수가 없습니다. .env.local 에 NEXT_PUBLIC_SUPABASE_URL 과 SUPABASE_SERVICE_ROLE_KEY 를 넣어주세요."
    );
  }
  cached = createClient(u, k, { auth: { persistSession: false } });
  return cached;
}

export function isConfigured() {
  return isLocal() || Boolean(url() && key());
}
