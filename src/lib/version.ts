/**
 * 앱 버전. 화면 오른쪽 아래에 표시된다.
 * 기능을 추가하거나 고칠 때 여기만 올리면 된다.
 */
export const APP_VERSION = "0.5";

/**
 * 1.0 전까지는 베타다. 베타에서만 보이는 것(하단 피드백 버튼 등)은
 * 이 플래그로 게이트해서, 버전을 1.0 으로 올리는 순간 함께 사라진다.
 */
export const IS_BETA = APP_VERSION.startsWith("0.");

/**
 * 배지를 눌렀을 때 보이는 "이 앱은 어떻게 만들어졌나".
 * 베타 참여자가 궁금해할 만한 것만 짧게. 기술 용어는 한 줄 설명을 붙인다.
 */
export const ABOUT: { label: string; value: string; note?: string }[] = [
  { label: "무엇", value: "엑셀로 돌리던 팀 주간보고를 웹으로 옮긴 것", note: "각자 다른 양식 대신 정해진 칸에 적고, 팀 전체를 한 화면에서 본다" },
  { label: "화면", value: "Next.js 16 · React 19 · Tailwind", note: "브라우저에서 돌아가는 웹앱. 설치 없이 주소만 열면 된다" },
  { label: "데이터", value: "Postgres (PGlite) — 베타는 메모리", note: "서버가 재시작되면 데모 데이터로 돌아간다. 실제 운영 땐 Supabase 로 바꾼다" },
  { label: "피드백 저장", value: "Vercel Blob (비공개)", note: "여러분이 남긴 의견만은 지워지지 않고 남는다" },
  { label: "배포", value: "Vercel · 서울 리전", note: "저장하면 몇 초 안에 반영된다" },
  { label: "로그인", value: "이름만, 비밀번호 없음", note: "사내 테스트용이라 인증을 두지 않았다. 링크는 외부에 공유하지 마세요" },
  { label: "데모 데이터", value: "팀원 이름만 실제, 나머지는 전부 가짜", note: "고객사·금액·미팅 내용은 지어낸 것이다" },
  { label: "코드", value: "github.com/svalu/aics-weekly", note: "공개 저장소. 실제 데이터는 들어 있지 않다" },
];

/** 버전을 올릴 때마다 한 줄씩 위에 추가 */
export const CHANGELOG: { version: string; date: string; note: string }[] = [
  {
    version: "0.5",
    date: "2026-09-17",
    note: "이름으로 로그인. 피드백을 Vercel Blob 에 영구 저장해 서버가 재시작돼도 남는다. 배지를 누르면 이 앱 소개.",
  },
  {
    version: "0.4",
    date: "2026-09-17",
    note: "하단 베타 피드백 버튼 — 버그·불편·아이디어를 바로 남기고, /feedback 에서 모아 본다. 1.0 부터는 자동으로 사라진다.",
  },
  {
    version: "0.3",
    date: "2026-09-17",
    note: "쉬운 주간보고 메뉴 — 한 화면에 질문 하나, 큰 글씨·큰 버튼, 다음만 누르면 저장. 로그인 화면에 이 서버의 등록 도메인 안내.",
  },
  {
    version: "0.2.1",
    date: "2026-09-17",
    note: "표 행이나 카드에서 수정 패널을 열면 그 행 안에 갇히던 문제 수정.",
  },
  {
    version: "0.2",
    date: "2026-09-17",
    note: "주간보고를 제목+상세 항목으로 쓰고 Tab 만으로 다음 칸·다음 섹션으로 넘어감. 페이지 전환 · 순차 등장 · 패널 슬라이드 · 카운트업 모션. 서버리스에서 로그인이 풀리던 문제 수정.",
  },
  {
    version: "0.1",
    date: "2026-09-17",
    note: "첫 버전. 주간보고 · 액션 트래커 · 파이프라인 · 미팅 로그 · 팀 설정.",
  },
];
