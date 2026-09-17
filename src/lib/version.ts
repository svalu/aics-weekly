/**
 * 앱 버전. 화면 오른쪽 아래에 표시된다.
 * 기능을 추가하거나 고칠 때 여기만 올리면 된다.
 */
export const APP_VERSION = "0.2";

/** 버전을 올릴 때마다 한 줄씩 위에 추가 */
export const CHANGELOG: { version: string; date: string; note: string }[] = [
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
