/**
 * 화면이 준비되는 동안 보이는 뼈대.
 * 서버리스에서 DB 가 처음 뜰 때 몇 초 걸릴 수 있어서, 빈 화면 대신
 * 레이아웃 윤곽을 먼저 보여줘 기다리는 느낌을 줄인다.
 */
export default function Loading() {
  return (
    <div className="anim-fade" aria-busy="true" aria-label="불러오는 중">
      <div className="mb-7">
        <div className="skeleton h-9 w-72" />
        <div className="skeleton mt-3 h-4 w-52" />
      </div>

      <div className="mb-4 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
        {Array.from({ length: 4 }).map((_, i) => (
          <div key={i} className="skeleton h-[150px] rounded-card" />
        ))}
      </div>

      <div className="grid gap-4 xl:grid-cols-[1.35fr_1fr]">
        <div className="space-y-4">
          <div className="skeleton h-[220px] rounded-card" />
          <div className="skeleton h-[320px] rounded-card" />
        </div>
        <div className="space-y-4">
          <div className="skeleton h-[280px] rounded-card" />
          <div className="skeleton h-[240px] rounded-card" />
        </div>
      </div>
    </div>
  );
}
