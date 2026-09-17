/**
 * 페이지 전환 애니메이션.
 *
 * layout 은 라우트가 바뀌어도 그대로 남지만 template 은 이동할 때마다
 * 새로 마운트된다. 그래서 여기에 등장 애니메이션을 걸면 모든 화면 전환이
 * 같은 리듬으로 흘러간다. (주차 이동처럼 쿼리만 바뀌는 경우도 포함)
 */
export default function Template({ children }: { children: React.ReactNode }) {
  return <div className="anim-page">{children}</div>;
}
