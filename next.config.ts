import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // PGlite 는 WASM 을 들고 다녀서 번들러가 아니라 런타임에서 그대로 불러온다
  serverExternalPackages: ["@electric-sql/pglite"],

  // Supabase 없이 도는 모드에서 런타임에 읽는 파일들.
  // 코드에서 참조되는 게 아니라 fs 로 읽기 때문에 명시해야 배포본에 들어간다.
  outputFileTracingIncludes: {
    "/**": ["./supabase/*.sql"],
  },
};

export default nextConfig;
