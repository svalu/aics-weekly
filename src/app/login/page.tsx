import { redirect } from "next/navigation";
import { currentMember, findByEmail, setSession } from "@/lib/session";
import { isConfigured, db } from "@/lib/db";
import { Logo } from "@/components/icons";
import { Avatar } from "@/components/ui";
import type { Member } from "@/lib/types";

export const dynamic = "force-dynamic";

async function signIn(formData: FormData) {
  "use server";
  const email = String(formData.get("email") ?? "");
  const member = await findByEmail(email);
  if (!member) {
    redirect(`/login?e=${encodeURIComponent(email)}`);
  }
  if (!member.active) {
    redirect(`/login?off=1`);
  }
  await setSession(member.id);
  redirect("/");
}

export default async function LoginPage({
  searchParams,
}: {
  searchParams: Promise<{ e?: string; off?: string }>;
}) {
  const sp = await searchParams;

  if (!isConfigured()) {
    return <SetupNotice />;
  }

  if (await currentMember()) redirect("/");

  const { data } = await db()
    .from("members")
    .select("*")
    .eq("active", true)
    .order("sort_order");
  const members = (data ?? []) as Member[];

  return (
    <div className="grid min-h-screen place-items-center p-5">
      <div className="w-full max-w-[880px] overflow-hidden rounded-[28px] bg-surface shadow-pop md:grid md:grid-cols-[1.05fr_1fr]">
        {/* 왼쪽: 로그인 */}
        <div className="p-8 sm:p-10">
          <Logo size={40} />
          <h1 className="mt-7 text-[30px] font-extrabold leading-tight tracking-[-0.025em]">
            AICS Weekly
          </h1>
          <p className="mt-2 text-[15px] text-ink-mute">
            회사 이메일만 넣으면 바로 들어갑니다. 비밀번호 없어요.
          </p>

          <form action={signIn} className="mt-7 space-y-3">
            <div>
              <label className="label" htmlFor="email">
                이메일
              </label>
              <input
                id="email"
                name="email"
                type="email"
                required
                autoFocus
                autoComplete="email"
                defaultValue={sp.e ?? ""}
                placeholder="name@mz.co.kr"
                className="field"
              />
            </div>
            {sp.e ? (
              <p className="rounded-2xl bg-[#FFE4E4] px-4 py-3 text-[13px] text-danger">
                <b>{sp.e}</b> 은(는) 등록된 팀원이 아닙니다. 아래 목록에서 본인을
                고르거나 관리자에게 이메일 등록을 요청하세요.
              </p>
            ) : null}
            {sp.off ? (
              <p className="rounded-2xl bg-[#FFECC7] px-4 py-3 text-[13px] text-[#96650A]">
                비활성화된 계정입니다. 관리자에게 문의하세요.
              </p>
            ) : null}
            <button type="submit" className="btn-dark w-full">
              들어가기
            </button>
          </form>

          <p className="mt-5 text-xs leading-relaxed text-ink-mute">
            사내에서만 쓰는 도구라 인증 절차가 없습니다. 링크를 아는 사람은 누구나
            내용을 보고 고칠 수 있으니 외부에 공유하지 마세요.
          </p>
        </div>

        {/* 오른쪽: 빠른 선택 */}
        <div className="border-t border-ink-line bg-paper p-8 sm:p-10 md:border-l md:border-t-0">
          <p className="label">팀원 바로 선택</p>
          {members.length === 0 ? (
            <p className="text-[13px] text-ink-mute">
              아직 등록된 팀원이 없습니다. <code>supabase/seed.sql</code> 을
              실행해주세요.
            </p>
          ) : (
            <div className="-mx-2 max-h-[420px] space-y-0.5 overflow-y-auto pr-1">
              {members.map((m) => (
                <form key={m.id} action={signIn}>
                  <input type="hidden" name="email" value={m.email} />
                  <button
                    type="submit"
                    className="flex w-full items-center gap-3 rounded-2xl px-2 py-2 text-left transition-colors hover:bg-surface"
                  >
                    <Avatar name={m.name} size={32} />
                    <span className="min-w-0 flex-1">
                      <span className="block text-[13px] font-semibold">{m.name}</span>
                      <span className="block truncate text-[11px] text-ink-mute">
                        {[m.part, m.role].filter(Boolean).join(" · ") || m.email}
                      </span>
                    </span>
                  </button>
                </form>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

function SetupNotice() {
  return (
    <div className="grid min-h-screen place-items-center p-6">
      <div className="w-full max-w-xl rounded-[28px] bg-surface p-9 shadow-pop">
        <Logo size={40} />
        <h1 className="mt-6 text-2xl font-extrabold tracking-[-0.02em]">
          Supabase 연결이 아직 안 됐습니다
        </h1>
        <p className="mt-2 text-[15px] text-ink-mute">
          프로젝트 루트에 <code>.env.local</code> 을 만들고 아래 값을 채워주세요.
        </p>
        <pre className="mt-5 overflow-x-auto rounded-2xl bg-canvas p-4 text-[12px] leading-relaxed text-ink-soft">
{`NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOi...`}
        </pre>
        <ol className="mt-5 list-decimal space-y-1.5 pl-5 text-[13px] text-ink-soft">
          <li>supabase.com 에서 프로젝트를 만든다</li>
          <li>SQL Editor 에 <code>supabase/schema.sql</code> 을 붙여넣고 실행</li>
          <li>이어서 <code>supabase/seed.sql</code> 실행 (이메일 먼저 수정)</li>
          <li>Settings → API 에서 URL 과 service_role 키를 복사</li>
          <li>개발 서버 재시작</li>
        </ol>
      </div>
    </div>
  );
}
