# AICS Weekly

엑셀로 돌리던 팀 주간 업무 관리를 웹앱으로 옮긴 것. 각자 다른 양식으로
셀을 채우는 대신, 정해진 칸에 적으면 팀 전체가 한 화면에서 보인다.

- **주간보고** — 프로젝트별로 금주 / 차주 / 이슈. 제목 + 상세 항목으로 적고 Tab 만으로 다음 칸으로 넘어간다
- **쉬운 작성** — 한 화면에 질문 하나. 큰 글씨 · 큰 버튼으로, 컴퓨터가 익숙하지 않아도 끝까지 쓸 수 있다
- **Action Tracker** — 액션 아이템, 담당자, Target Date, 지연일 자동 계산
- **Sales 파이프라인** — 딜 단계 · 금액 · 석수와 날짜별 진행내역
- **고객 미팅 로그** — 주차별 미팅과 Net New 비중(목표 30%) 자동 집계
- **팀 설정** — 팀원, 프로젝트, 투입 인력, Ground Rule

Next.js 16 · React 19 · Tailwind. 데이터베이스는 앱 안에서 도는 Postgres(PGlite)라
따로 띄울 것이 없다. 휴대폰 화면까지 맞춰 뒀다.

> **이 저장소의 데이터는 전부 지어낸 것입니다.**
> 사람 이름 · 고객사 · 담당자 · 금액 · 미팅 내용 · 액션 · 주간보고 본문까지
> 실제와 아무 관계가 없습니다. 자세한 건 아래 [데이터](#데이터) 참고.

---

## 돌려보기

```bash
npm install
echo LOCAL_DB=1 > .env.local
npm run dev
```

`http://localhost:3100` 을 열면 끝. 로그인 화면에서 아무 이름이나 고르면 들어간다.

계정도 설정도 필요 없다. 서버가 뜰 때 `supabase/schema.sql` 과
`supabase/seed.demo.sql` 이 자동으로 적용된다. 데이터는 `.localdb/` 에 쌓이고,
지우면 처음부터 다시 만들어진다.

### 로그인

비밀번호가 없다. **이름이나 이메일**을 넣으면 등록된 사람인지 확인하고 쿠키를
심는 게 전부다. 빠르게 쓰려고 일부러 이렇게 뒀다.

링크를 아는 사람은 누구나 내용을 보고 고칠 수 있다. 실제 데이터를 넣고
운영할 거라면 Google OAuth 같은 인증을 앞에 두는 걸 권한다.

---

## 데이터

저장소에 들어 있는 건 `supabase/seed.demo.sql` 하나뿐이고, 내용은 전부 지어낸 것이다.

| | |
|---|---|
| 사람 이름 | 지어낸 것 |
| 이메일 | `@example.com` |
| 고객사 · 담당자 | 지어낸 것 |
| 금액 · 석수 | 지어낸 것 |
| 주간보고 · 액션 · 미팅 내용 | 지어낸 것 |

다시 만들려면:

```bash
python scripts/make_demo_seed.py
```

난수 시드가 고정돼 있어 몇 번을 돌려도 같은 결과가 나온다. 팀원 · 프로젝트의
id 도 이름에서 결정적으로 만들기 때문에, DB 를 다시 만들어도 링크와 로그인
쿠키가 그대로 살아 있다.

### 실제 데이터로 쓸 때

원본 엑셀이 있다면 `doc/` 에 두고:

```bash
python scripts/extract.py        # → supabase/seed.sql
```

실제 팀 명단과 이메일은 `scripts/roster.local.json` 에 둔다
(`scripts/roster.local.example.json` 참고). 파일이 없으면 엑셀의 Owner 칸에서
이름을 모아 쓴다.

`doc/`, `supabase/seed.sql`, `scripts/roster.local.json` 은 `.gitignore` 에 걸려
있어 저장소에 올라가지 않는다. 커밋 전에 한 번 확인한다:

```bash
python scripts/leak_check.py
```

원본 엑셀에서 고객사명 · 담당자 실명 · 금액을 뽑고, 여기에 `roster.local.json`
의 실제 이름까지 더해 저장소에 올라갈 파일을 훑는다. 하나라도 나오면 종료
코드 1 을 낸다.

`extract.py` 가 읽는 시트:

| 시트 | 들어가는 곳 |
|---|---|
| `Weekly 주간회의 9월(Tech)` | `projects`, `project_members` |
| `Weekly 주간회의 9월(개인_Tech)` | `weekly_reports` |
| `Action Tracker` | `action_items` |
| `Weekly 주간회의(Sales)` | `deals`, `deal_updates` |
| `Sales Activity` | `meetings` |
| `Ground Rule` | `ground_rules` |

### 팀에서 같이 쓰려면 (Supabase)

여럿이 동시에 쓰려면 DB 를 밖으로 빼야 한다.

1. [supabase.com](https://supabase.com) 에서 프로젝트를 만든다
2. SQL Editor 에 `supabase/schema.sql` → `supabase/seed.demo.sql` 순으로 실행
3. Project Settings → API 의 두 값을 `.env.local` 에 넣고 `LOCAL_DB` 줄은 지운다

```
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOi...
```

`service_role` 키는 서버에서만 쓰이고 브라우저로 내려가지 않는다. 모든 읽기 ·
쓰기는 서버 컴포넌트와 서버 액션을 거치고, 테이블에는 RLS 가 켜져 있어
익명 키로는 아무것도 읽히지 않는다.

테이블이 늘어난 버전으로 올릴 때는 `schema.sql` 을 다시 통째로 실행하면 된다.
전부 `if not exists` 라 이미 있는 건 건너뛴다.

---

## 구조

```
src/
  app/
    (app)/            로그인해야 보이는 화면
      page.tsx          개요 대시보드
      easy/             쉬운 주간보고 (질문 하나씩)
      weekly/           주간보고 (팀 전체 · 개인)
      actions/          Action Tracker
      deals/            Sales 파이프라인
      meetings/         고객 미팅 로그
      team/             팀 · 프로젝트 설정
      feedback/         베타 피드백 모아 보기
      template.tsx      화면 전환 애니메이션
      loading.tsx       뼈대(스켈레톤)
    login/            이름 또는 이메일만 넣는 로그인
    api/logout/
  components/         UI · 폼 · 셸
  lib/
    db.ts               Supabase 또는 로컬 PGlite 선택
    local-db.ts         PGlite 를 supabase-js 처럼 쓰게 하는 대역
    session.ts          쿠키 기반 세션
    actions.ts          서버 액션 (모든 쓰기)
    feedback-store.ts   피드백 저장 (Blob 또는 DB)
    week.ts             주차 계산
    version.ts          앱 버전 · 변경 이력 · 소개
supabase/
  schema.sql          테이블 정의
  seed.demo.sql       데모 데이터 (자동 생성)
scripts/
  make_demo_seed.py   데모 데이터 생성
  extract.py          엑셀 → seed.sql
  leak_check.py       실제 데이터 유출 검사
```

### 주차 계산

기존 엑셀 관례를 그대로 따른다 — **주중(월~금) 5일이 더 많이 걸친 달**이
그 주의 달이다. 그래서 `08/31~09/04` 는 "9월 1주차", `09/28~10/02` 는
"9월 5주차"가 된다.

### 버전

오른쪽 아래 배지에 표시된다. 누르면 이 앱 소개와 변경 이력이 나온다.
올릴 때는 `src/lib/version.ts` 의 `APP_VERSION` 과 `CHANGELOG` 를 함께 고친다.
`0.x` 인 동안은 베타로 보고 하단에 피드백 버튼이 뜬다.
