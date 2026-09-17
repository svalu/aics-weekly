# -*- coding: utf-8 -*-
"""
공개 저장소용 데모 시드를 만든다.

팀원 이름만 실제이고, 고객사·담당자·금액·미팅 내용·액션·주간보고 본문은
전부 지어낸 것이다. 실제 영업 데이터는 이 파일에 들어가지 않는다.

  python scripts/make_demo_seed.py   →  supabase/seed.demo.sql

난수 시드를 고정해서 몇 번을 돌려도 같은 결과가 나온다.
"""
import io, os, random
from datetime import date, datetime, timedelta

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "supabase", "seed.demo.sql")

rnd = random.Random(20260917)

# ── 팀원 (이름만 실제, 이메일은 example.com) ──────────────
TEAM = [
    ("강경표", None, "최고 리더", True),
    ("민경윤", "Sales", "Biz 리더", True),
    ("이민우", "AICC", "솔루션 리더", True),
    ("이진수", "Sales", "Sales", False),
    ("류해원", "Sales", "PreSales", False),
    ("이기원", "AICC", "PM", True),
    ("전병수", "AICC", "SA", False),
    ("이현행", "AICC", "SA", False),
    ("오대성", "AICC", "SA", False),
    ("최창현", "AICC", "SA", False),
    ("김성우", "Development", "개발", False),
    ("정택수", "Development", "개발", False),
    ("이상묵", "Development", "개발", False),
    ("정종호", "Development", "개발", False),
    ("방희태", "Development", "기획", False),
    ("장유석", "Development", "디자인", True),
    ("김진규", None, None, False),
    ("구창현", None, None, False),
    ("최진용", None, None, False),
]
ROMAN = {
    "강경표": "kang.kyungpyo", "민경윤": "min.kyungyoon", "이민우": "lee.minwoo",
    "이진수": "lee.jinsoo", "류해원": "ryu.haewon",
    "이기원": "lee.kiwon", "전병수": "jeon.byungsoo", "이현행": "lee.hyunhaeng",
    "오대성": "oh.daesung", "최창현": "choi.changhyun",
    "김성우": "kim.sungwoo", "정택수": "jung.taeksoo", "이상묵": "lee.sangmook",
    "정종호": "jung.jongho", "방희태": "bang.heetae", "장유석": "jang.yuseok",
    "김진규": "kim.jingyu", "구창현": "koo.changhyun", "최진용": "choi.jinyong",
}

# ── 지어낸 고객사 ─────────────────────────────────────────
COMPANIES = [
    "한빛생명", "가온손해보험", "미래로카드", "청람증권", "두레캐피탈",
    "온누리항공", "별빛여행", "나래물류", "해든쇼핑", "초록마트",
    "정다운은행", "바로콜", "이음테크", "새롬정보", "큰들BPO",
    "달빛커머스", "고운손해보험", "푸른여객", "한결에너지", "소담스토어",
    "너울테크", "마루정보통신", "밝음저축은행", "터전홀딩스", "아람소프트",
    "빛나컴퍼니", "우듬지리테일", "슬기로운여행", "다올物流", "하늘담운수",
]
COMPANIES = [c.replace("物流", "물류") for c in COMPANIES]

PARTNERS = ["아람소프트", "새롬정보", "이음테크", "마루정보통신", "너울테크"]
CLOUD = ["AWS", "클라우드파트너"]

# ── 지어낸 담당자 ─────────────────────────────────────────
CONTACTS = [
    "김하늘", "이서준", "박지우", "최민재", "정예린", "강도윤", "조서윤",
    "윤지호", "임채원", "한수아", "오시현", "신다온", "배준영", "문가람",
    "서愛", "홍윤слав",
]
CONTACTS = [c for c in CONTACTS if all("가" <= ch <= "힣" for ch in c)]

# ── 지어낸 프로젝트 ───────────────────────────────────────
PROJECTS = [
    ("Relay Console 개발 P1-2", "프로젝트", "이기원",
     ["김성우", "이상묵", "방희태", "장유석"], date(2026, 7, 6), date(2026, 12, 31)),
    ("한빛생명 장기 TM 시스템 고도화 분석/설계 사업", "프로젝트", "이민우",
     ["이민우"], date(2026, 7, 13), date(2026, 11, 30)),
    ("나래물류 Data Platform 장애대응 포탈 구축", "프로젝트", "정택수",
     ["정택수", "정종호"], date(2026, 7, 13), date(2026, 10, 30)),
    ("해든쇼핑 AICC 유지보수", "유지보수", "전병수",
     ["전병수"], date(2026, 8, 10), date(2026, 10, 9)),
    ("고객서비스 포털 및 컨택센터 운영 관리(GCC)", "유지보수", "장유석",
     ["장유석", "이상묵", "김성우", "이기원"], date(2026, 4, 1), date(2026, 12, 31)),
    ("정다운은행 상담챗봇", "유지보수", "김성우",
     ["김성우"], date(2025, 9, 1), date(2026, 8, 31)),
    ("큰들체육회 상담챗봇", "유지보수", "김성우", ["김성우"], None, None),
    ("초록마트 Relay Console 소개", "Demo", "이진수",
     ["김성우", "최창현", "오대성"], None, None),
    ("AICC Hands-on Workshop", "행사", "민경윤",
     ["류해원", "이진수", "전병수", "이현행", "오대성", "최창현"], None, None),
    ("Cloud Contact Center Competency", "문서작성", "방희태",
     ["전병수", "이현행", "오대성", "최창현"], None, None),
]

GROUND_RULES = [
    "문서와 업무 방향성은 최종본으로 보고하지 말고, 초안부터 공유하며 맞춰 나간다.",
    "외부에 나가는 문서(견적서, 제안서)는 제출 하루 전에 confirm 을 받고 진행한다.",
    "회의는 사전에 이슈를 공유하고, 최소 인원으로 그 자리에서 종결시킨다.",
    "모든 업무에 Target Date 를 정하고, 그 전에 자료를 공유한다.",
    "고객에게 가는 문서는 우리가 하고 싶은 말이 아니라 고객 요구사항을 기준으로 쓴다.",
    "기다리지 말고 한 번이라도 더 만나서 우리가 줄 수 있는 가치를 설득한다.",
    "막히면 혼자 붙들지 말고 이슈로 올린다. 빨리 드러낼수록 싸게 해결된다.",
]

# ── 주간보고 문장 조각 ────────────────────────────────────
THIS_WEEK = {
    "Relay Console 개발 P1-2": [
        "- Relay Console P1-2 개발\n : 옴니채널\n > 통계 화면 기획({d1})\n > 채널별 집계 추가 - 메일 · 게시판 · 채팅({d2})\n : 알림 센터 기능 개발({d1})",
        "- 기획\n : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)\n : 캔버스 모드 흐름 확정({d1})\n : 상담 이력 화면 와이어프레임({d2})",
        "- 디자인\n : 상담 모드 인터랙션 정리 - 인라인 편집({d1})\n : 3열 레이아웃 전환, 상단바 정돈({d2})\n : 다크 모드 토큰 정리",
        "- 워크플로우 자동화 개발({d1})\n- 단위 테스트 보강\n- 정적 분석 경고 정리({d2})",
    ],
    "한빛생명 장기 TM 시스템 고도화 분석/설계 사업": [
        "- 요구사항 정의서 내부 검토 및 고객 전달 준비({d1})\n- 화면 시안 리뷰\n  > 내부 리뷰 2차({d1})\n  > 현업 설명 및 확정({d2})\n- 시스템 아키텍처 분석({d2})",
        "- 분석 단계 산출물 고객 검토 및 보완({d2})\n- 설계 단계 산출물 작성 내부 리뷰\n- 이슈 · 리스크 관리\n- 고객 요구사항 대응",
    ],
    "나래물류 Data Platform 장애대응 포탈 구축": [
        "- 장애 포털 dev 환경 고객 대상 오픈\n : SSO 적용\n : 원천 소스 담당자 매핑({d1})",
        "- 파이프라인 API 수정\n : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가({d2})\n- 일괄 재실행 설정 화면 정리",
        "- 비용 대시보드 화면 개발\n- 자동 승격 로직 검증 및 테스트\n- 실사용자 피드백 반영({d2})",
    ],
    "해든쇼핑 AICC 유지보수": [
        "- 고도화 요건 분석({d1})\n- 신규 번호 추가 반영\n- 오프라인 매장 오픈 대응({d2})",
        "- 고도화 요구사항 인터뷰 2차({d1})\n- 공수 산정 정리",
    ],
    "고객서비스 포털 및 컨택센터 운영 관리(GCC)": [
        "- 검색 기능 운영 서버 이전({d1} ~ {d2})\n- 프론트 테마 테스트 환경 구성",
        "- 리소스 · 접속 통계 보고서 상신({d1})\n- 리드 데이터 연동 확장 미팅({d2})",
        "- SMS 발신 계정 연동 추가 작업\n- 월 정기 점검 준비",
    ],
    "정다운은행 상담챗봇": [
        "- 채팅 상담 내역 3개월 이후 삭제 배치 추가({d1})\n : 정기 점검 때 함께 반영 예정",
        "- 삭제 배치 테스트 및 작업계획서 전달({d2})\n- 월 정기 점검",
    ],
    "큰들체육회 상담챗봇": ["- 월 정기 점검({d1})"],
    "초록마트 Relay Console 소개": [
        "- 데모 시연 준비({d2})\n : 통화 시나리오 스크립트 작성 및 테스트",
    ],
    "AICC Hands-on Workshop": [
        "- 워크샵 발표 및 실습 지원({d1})\n : 발표 자료 정리\n : 데모 환경 구축",
        "- 워크샵 참가자 팔로우업({d2})\n- 후속 미팅 일정 조율",
    ],
    "Cloud Contact Center Competency": [
        "- 인증 문서 작성\n : 정기 미팅 목요일 16시\n : 사례 증적 정리({d2})",
    ],
    None: [
        "- 사내 교육 수강\n- 오퍼링 자료 최신화({d1})",
        "- 발표 자료 작성({d1})\n- 데모 영상 편집({d2})",
        "- 주간 보고 취합\n- 포캐스팅 업데이트 지원",
    ],
}
NEXT_WEEK = [
    "- 금주 미완료 건 이어서 진행\n- 산출물 내부 리뷰({d2})",
    "- 고객 검토 의견 반영\n- 다음 단계 일정 수립",
    "- 테스트 시나리오 보강\n- 배포 준비",
    "- 후속 미팅 일정 조율\n- 견적 초안 작성",
    "",
    "",
]
ISSUES = [
    "",
    "",
    "",
    "",
    "- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요",
    "- 고객사 담당자 휴가로 검토 일정이 한 주 밀림",
    "- 연동 규격이 확정되지 않아 개발 착수가 대기 중",
]

MEETING_PURPOSES = [
    "제품 소개 및 고객사 현황 파악", "AICC 도입 계획 체크", "진행 사항 점검",
    "견적 협의 및 데모", "협업 가능 여부 파악", "차세대 진행 일정 확인",
    "상담 화면 통합 협의", "콜봇 개발 관련 협의", "유지보수 협의",
    "초도 미팅, 요구사항 확인", "워크샵 참가 여부 확인", "시장 동향 공유",
]
MEETING_NOTES = [
    "", "", "",
    "상담석 20석 규모, 장비 노후화로 내년 교체 검토",
    "클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음",
    "자체 솔루션 사용 중이며 신규 구축 의지는 낮음",
    "파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움",
    "내년 상반기 사업 협업 요청. 담당자 재확인 예정",
    "아웃소싱 운영 중이라 직접 도입 결정권 없음",
    "데모 일정 재협의 예정. 다음 달 초 재방문",
]
ACTION_TITLES = [
    "견적 초안 작성 및 내부 검토", "사전조사 양식 전달", "데모 환경 준비",
    "협업 가능 여부 결과 보고", "제안 방안 수립", "워크샵 일정 수립",
    "워크샵 팔로우업", "연동 규격 확인", "유지보수 범위 협의",
    "고객사 담당자 재확인", "오퍼링 자료 최신화", "경쟁사 동향 정리",
    "차세대 일정 확인", "계약 조건 검토", "운영 이관 계획 수립",
]
ACTION_PROGRESS = [
    "", "",
    "{m}/{d} 1차 검토 완료. 보완 사항 정리 중",
    "{m}/{d} 고객 전달 완료\n{m2}/{d2} 회신 대기",
    "{m}/{d} 내부 리뷰 진행. 다음 주 재논의",
]
DEAL_NAMES = [
    "AICC 구축 사업", "IPCC 구축 사업", "AICC 차세대 구축 사업",
    "콜봇 도입", "AICC 제안", "유지보수", "상담 화면 통합 구축",
]
STAGES = ["진행중"] * 8 + ["계약진행중", "계약완료", "계약완료", "홀딩", "홀딩", "보류"]
DEAL_UPDATE_BODIES = [
    "- 고객사 방문\n : 오퍼링 소개 및 현황 파악\n : 예상 견적 요청으로 필요 사항 문의 예정",
    "- 사전조사 양식 전달\n : 회신 후 견적 산출 예정",
    "- 견적 2개안 제출\n : 1안 기본형, 2안 고도화 포함",
    "- 내부 검토 회의\n : 투입 인력 및 일정 확정",
    "- 고객 담당자 변경\n : 인수인계 후 재협의 예정",
    "- 우선협상대상자 선정\n : 계약 절차 진행 중",
    "- 프로젝트 기간 확정\n : 착수 준비 진행",
    "- 일정 연기 요청\n : 다음 분기 재논의",
]


def q(v):
    if v is None:
        return "null"
    if isinstance(v, bool):
        return "true" if v else "false"
    if isinstance(v, (int, float)):
        return str(v)
    if isinstance(v, (date, datetime)):
        return "'" + v.strftime("%Y-%m-%d") + "'"
    return "'" + str(v).strip().replace("'", "''") + "'"


def monday(d):
    return d - timedelta(days=d.weekday())


def fill(tpl, wk):
    """{d1} {d2} 를 그 주의 날짜로 바꾼다."""
    d1 = wk + timedelta(days=rnd.randint(0, 2))
    d2 = wk + timedelta(days=rnd.randint(3, 4))
    return (tpl
            .replace("{d1}", f"{d1.month}/{d1.day}")
            .replace("{d2}", f"{d2.month}/{d2.day}"))


def main():
    today = date(2026, 9, 17)
    cur = monday(today)
    weeks = [cur - timedelta(weeks=n) for n in range(3, -1, -1)]

    L = []
    W = L.append

    W("-- ============================================================")
    W("--  AICS Weekly · 데모 시드")
    W("--")
    W("--  팀원 이름만 실제이고 고객사 · 담당자 · 금액 · 미팅 내용 ·")
    W("--  액션 · 주간보고 본문은 전부 지어낸 것입니다.")
    W("--  실제 영업 데이터는 이 파일에 들어있지 않습니다.")
    W("--")
    W("--  scripts/make_demo_seed.py 로 생성 · schema.sql 다음에 실행")
    W("-- ============================================================")
    W("begin;")
    W("")

    # 팀원
    W("-- ---------- 팀원 ----------")
    for i, (name, part, role, admin) in enumerate(TEAM):
        W("insert into members (email, name, part, role, is_admin, sort_order) values "
          "({}, {}, {}, {}, {}, {}) on conflict (email) do nothing;".format(
              q(ROMAN[name] + "@example.com"), q(name), q(part), q(role),
              q(admin), (i + 1) * 10))
    W("")

    # Ground Rule
    W("-- ---------- Ground Rule ----------")
    for i, body in enumerate(GROUND_RULES):
        W("insert into ground_rules (sort_order, body) values ({}, {});".format(
            (i + 1) * 10, q(body)))
    W("")

    # 프로젝트
    W("-- ---------- 프로젝트 ----------")
    for i, (name, kind, owner, staff, sd, ed) in enumerate(PROJECTS):
        W("insert into projects (name, kind, owner_id, start_date, end_date, sort_order) "
          "select {}, {}, (select id from members where name = {}), {}, {}, {} "
          "where not exists (select 1 from projects where name = {});".format(
              q(name), q(kind), q(owner), q(sd), q(ed), (i + 1) * 10, q(name)))
    W("")
    W("-- ---------- 투입 인력 ----------")
    for name, _, owner, staff, _, _ in PROJECTS:
        for person in sorted(set(staff + [owner])):
            W("insert into project_members (project_id, member_id) "
              "select p.id, m.id from projects p, members m "
              "where p.name = {} and m.name = {} on conflict do nothing;".format(
                  q(name), q(person)))
    W("")

    # 주간보고
    W("-- ---------- 주간보고 ----------")
    n_reports = 0
    for pname, _, owner, staff, _, _ in PROJECTS:
        for person in sorted(set(staff + [owner])):
            for wk in weeks:
                if rnd.random() < 0.22:          # 가끔 빈 주
                    continue
                tw = fill(rnd.choice(THIS_WEEK[pname]), wk)
                nw = fill(rnd.choice(NEXT_WEEK), wk)
                iss = rnd.choice(ISSUES)
                n_reports += 1
                W("insert into weekly_reports (member_id, project_id, week_start, "
                  "this_week, next_week, issues) select m.id, "
                  "(select id from projects where name = {}), {}, {}, {}, {} "
                  "from members m where m.name = {};".format(
                      q(pname), q(wk), q(tw), q(nw), q(iss), q(person)))
    # 프로젝트에 안 묶이는 업무
    for person in ["오대성", "이현행", "최창현"]:
        for wk in weeks:
            if rnd.random() < 0.3:
                continue
            n_reports += 1
            W("insert into weekly_reports (member_id, project_id, week_start, "
              "this_week, next_week, issues) select m.id, null, {}, {}, {}, {} "
              "from members m where m.name = {};".format(
                  q(wk), q(fill(rnd.choice(THIS_WEEK[None]), wk)),
                  q(fill(rnd.choice(NEXT_WEEK), wk)), q(rnd.choice(ISSUES)), q(person)))
    W("")

    # 액션
    W("-- ---------- Action Tracker ----------")
    owners = [n for n, _, _, _ in TEAM]
    n_actions = 0
    for seq in range(1, 41):
        opened = cur - timedelta(days=rnd.randint(3, 75))
        target = opened + timedelta(days=rnd.choice([5, 7, 10, 14, 21, 30]))
        roll = rnd.random()
        if roll < 0.55:
            status, close = "50.Close", target + timedelta(days=rnd.randint(-4, 6))
        elif roll < 0.62:
            status, close = "99.Drop", None
        elif roll < 0.72:
            status, close = "10.대기", None
        else:
            status, close = "20.진행중", None
            # 진행중 몇 건은 일부러 지연시켜 대시보드가 살아 보이게 한다
            if rnd.random() < 0.35:
                target = today - timedelta(days=rnd.randint(2, 30))
            else:
                target = today + timedelta(days=rnd.randint(0, 12))
        pu = rnd.choice(ACTION_PROGRESS)
        if pu:
            a, b = opened + timedelta(days=2), opened + timedelta(days=6)
            pu = (pu.replace("{m}", str(a.month)).replace("{d}", str(a.day))
                    .replace("{m2}", str(b.month)).replace("{d2}", str(b.day)))
        n_actions += 1
        W("insert into action_items (seq, category, customer, title, owner_id, status, "
          "progress_update, open_date, target_date, close_date, remark) values "
          "({}, {}, {}, {}, (select id from members where name = {}), {}, {}, {}, {}, {}, {});".format(
              seq, q(rnd.choice(["Sales"] * 6 + ["Tech"] * 3 + ["ALL"])),
              q(rnd.choice(COMPANIES + ["Internal", None])),
              q(rnd.choice(ACTION_TITLES)), q(rnd.choice(owners)), q(status),
              q(pu), q(opened), q(target), q(close), q("")))
    W("")

    # 파이프라인
    W("-- ---------- Sales 파이프라인 ----------")
    leads = ["민경윤", "이진수", "류해원"]
    n_deals = 0
    picked = rnd.sample(COMPANIES, 18)
    for seq, company in enumerate(picked, start=1):
        stage = rnd.choice(STAGES)
        seats = rnd.choice([6, 8, 10, 16, 30, 40, 45, 50, 60, 200, 360, 400])
        amount = ""
        if stage in ("계약완료", "계약진행중"):
            amount = "PS : {:.2f}억".format(rnd.uniform(0.8, 11.0))
        elif rnd.random() < 0.3:
            amount = "견적 산출 전 정보 수집 단계"
        n_deals += 1
        W("with dl as (insert into deals (seq, category, stage, name, customer, lead, "
          "sales_aws, sales_mzc, period, amount, seats, remark) values "
          "({}, 'Sales', {}, {}, {}, {}, {}, {}, {}, {}, {}, '') returning id)".format(
              seq, q(stage), q(rnd.choice(DEAL_NAMES)), q(company),
              q(rnd.choice(leads)),
              q(rnd.choice(CONTACTS) if rnd.random() < 0.4 else ""),
              q(rnd.choice(CONTACTS) if rnd.random() < 0.6 else ""),
              q("2026.07.13 ~ 2026.11.30" if stage == "계약진행중" else ""),
              q(amount), q(f"{seats}석")))
        logs = []
        for k in range(rnd.randint(1, 4)):
            ld = cur - timedelta(days=rnd.randint(7, 80) - k * 5)
            logs.append((ld, rnd.choice(DEAL_UPDATE_BODIES)))
        logs.sort()
        W("insert into deal_updates (deal_id, log_date, body) values\n  " +
          ",\n  ".join("((select id from dl), {}, {})".format(q(d), q(b))
                       for d, b in logs) + ";")
    # 내부 업무
    for seq, name in enumerate(["오퍼링 자료 정비", "콜드콜 방안 수립", "파트너 채널 정리"], start=1):
        n_deals += 1
        W("with dl as (insert into deals (seq, category, stage, name, customer, lead, "
          "sales_aws, sales_mzc, period, amount, seats, remark) values "
          "({}, '내부업무', '진행중', {}, null, {}, '', '', '', '', '', '') returning id)".format(
              seq, q(name), q(", ".join(leads))))
        W("insert into deal_updates (deal_id, log_date, body) values "
          "((select id from dl), {}, {});".format(
              q(cur - timedelta(days=rnd.randint(5, 30))),
              q("- 1차 초안 공유\n : 다음 주 리뷰 예정")))
    W("")

    # 미팅
    W("-- ---------- 고객 미팅 로그 ----------")
    n_meet = 0
    seq = 0
    for wk in [cur - timedelta(weeks=n) for n in range(5, -1, -1)]:
        for _ in range(rnd.randint(12, 18)):
            seq += 1
            owner = rnd.choice(leads)
            kind = "Net New" if rnd.random() < 0.55 else "Existing"
            planned = wk + timedelta(days=rnd.randint(0, 4))
            if wk >= cur:
                done = rnd.choice(["", "", "Y", "N"])
            else:
                done = rnd.choice(["Y"] * 6 + ["N", "N/A"])
            actual = planned if done == "Y" and rnd.random() < 0.7 else (
                planned + timedelta(days=rnd.randint(1, 6)) if done == "Y" else None)
            n_meet += 1
            W("insert into meetings (seq, owner_id, week_start, kind, customer, contact, "
              "planned_date, purpose, done, actual_date, companions, notes) values "
              "({}, (select id from members where name = {}), {}, {}, {}, {}, {}, {}, {}, {}, {}, {});".format(
                  seq, q(owner), q(wk), q(kind), q(rnd.choice(COMPANIES)),
                  q(rnd.choice(CONTACTS) if rnd.random() < 0.5 else ""),
                  q(planned), q(rnd.choice(MEETING_PURPOSES)), q(done), q(actual),
                  q(rnd.choice(["", "", "전병수", "류해원", "이진수, 전병수"])),
                  q(rnd.choice(MEETING_NOTES) if done == "Y" else "")))
    W("")
    W("commit;")
    W("")

    io.open(OUT, "w", encoding="utf-8").write("\n".join(L) + "\n")
    print("생성:", OUT)
    print("  팀원        %d (이름만 실제)" % len(TEAM))
    print("  프로젝트    %d" % len(PROJECTS))
    print("  주간보고    %d" % n_reports)
    print("  액션아이템  %d" % n_actions)
    print("  딜          %d" % n_deals)
    print("  미팅        %d" % n_meet)


if __name__ == "__main__":
    main()
