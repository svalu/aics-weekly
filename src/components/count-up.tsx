"use client";

import { useEffect, useRef, useState } from "react";

/**
 * 숫자가 0 에서 목표값까지 차오르는 연출.
 *
 * 처음 상태는 0 이 아니라 실제 값이다. 서버에서 그린 HTML 과 자바스크립트가
 * 아직 안 붙은 순간에도 올바른 숫자가 보여야 하기 때문이다. 화면에 붙은 뒤
 * 애니메이션이 가능할 때만 0 으로 되돌려 다시 센다.
 *
 * reduced-motion 이거나 rAF 가 돌지 않는 환경(가려진 탭 등)에서는 그냥
 * 실제 값을 보여준다.
 */
export function CountUp({
  value,
  duration = 700,
  className,
}: {
  value: number;
  duration?: number;
  className?: string;
}) {
  const [shown, setShown] = useState(value);
  const started = useRef(false);

  useEffect(() => {
    if (started.current) return;
    started.current = true;

    const reduce = window.matchMedia?.("(prefers-reduced-motion: reduce)").matches;
    if (reduce || value === 0) return;

    setShown(0);

    const t0 = performance.now();
    let raf = 0;
    let done = false;
    const tick = (now: number) => {
      const p = Math.min(1, (now - t0) / duration);
      // ease-out cubic: 처음엔 빨리, 끝에서 부드럽게 멈춘다
      const eased = 1 - Math.pow(1 - p, 3);
      setShown(Math.round(value * eased));
      if (p < 1) raf = requestAnimationFrame(tick);
      else done = true;
    };
    raf = requestAnimationFrame(tick);

    // 안전장치: 화면을 그리지 않는 환경에서는 rAF 가 오지 않아 0 에 멈춘다.
    // 그때는 애니메이션을 포기하고 실제 값으로 되돌린다.
    const backstop = setTimeout(() => {
      if (!done) {
        cancelAnimationFrame(raf);
        setShown(value);
      }
    }, duration + 400);

    return () => {
      cancelAnimationFrame(raf);
      clearTimeout(backstop);
    };
  }, [value, duration]);

  return (
    <span className={className} style={{ fontVariantNumeric: "tabular-nums" }}>
      {shown.toLocaleString()}
    </span>
  );
}
