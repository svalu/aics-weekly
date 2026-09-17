# AICS Weekly

엑셀로 돌리던 팀 주간 업무 관리를 웹앱으로 옮긴 것. 각자 다른 양식으로
셀을 채우는 대신, 정해진 칸에 적으면 팀 전체가 한 화면에서 보인다.

- **주간보고** — 프로젝트별로 금주 / 차주 / 이슈를 적고, 팀 전체를 한눈에. 한 사람만 크게 보기도 된다
- **Action Tracker** — 액션 아이템, 담당자, Target Date, 지연일 자동 계산
- **Sales 파이프라인** — 딜 단계 · 금액 · 석수와 날짜별 진행내역
- **고객 미팅 로그** — 주차별 미팅과 Net New 비중(목표 30%) 자동 집계
- **팀 설정** — 팀원, 프로젝트, 투입 인력, Ground Rule

Next.js 16 + Supabase(Postgres). 로그인은 사내 이메일만 넣으면 되고
비밀번호가 없다.

> **이 저장소의 데이터는 전부 지어낸 것입니다.**
> 팀원 이름을 빼면 고객사 · 담당자 · 금액 · 미팅 내용 · 액션 · 주간보고 본문은
> 실제와 아무 관계가 없습니다. 자세한 건 아래 [데이터](#데이터) 참고.

---

## 바로 돌려보기

```bash
npm install
echo LOCAL_DB=1 > .env.local
npm run dev
```

`http://localhost:3100` 을 열면 끝. 로그인 화면에서 아무 이름이나 고르면 들어간다.

Supabase 계정도, 설정도 필요 없다. 브라우저용 Postgres(PGlite)가 프로세스 안에서
뜨면서 `supabase/schema.sql` + `supabase/seed.demo.sql` 을 자동으로 적용한다.
데이터는 `.localdb/` 에 쌓이고, 지우면 처음부터 다시 만들어진다.

---

## 팀에서 같이 쓰기 (Supabase)

### 1. 프로젝트 만들기

[supabase.com](https://supabase.com) 에서 새 프로젝트 생성.
한국에서 쓸 거면 Region 은 **Northeast Asia (Seoul)**.

### 2. SQL 실행

Supabase 대시보드 → **SQL Editor** 에서 순서대로.

1. `supabase/schema.sql` — 테이블과 인덱스
2. `supabase/seed.demo.sql` — 데모 데이터 (실데이터로 시작하려면 건너뛴다)

### 3. 키 넣기

**Project Settings → API** 에서 두 값을 복사해 `.env.local` 에 넣는다.

```
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxx.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOi...
```

`LOCAL_DB` 줄은 지우고 재시작.

### 4. 팀원 등록

앱의 **팀 설정** 화면에서 이메일을 실제 주소로 바꾼다. 그 주소가 곧 로그인 계정이다.

### 5. 배포

```bash
npx vercel
```

또는 GitHub 저장소를 Vercel 에 연결하고 위 환경변수 두 개를 넣는다.

---

## 로그인에 대해

비밀번호가 없다. 이메일을 넣으면 등록된 팀원인지 확인하고 쿠키를 심는 게 전부다.
사내에서 빠르게 쓰려고 일부러 이렇게 뒀다.

**링크를 아는 사람은 누구나 내용을 보고 고칠 수 있다.** 실제 데이터를 넣고
운영할 거라면 배포 주소를 외부에 공유하지 말고, 필요하면 Google OAuth 등으로
바꿔서 쓰는 걸 권한다.

`service_role` 키는 서버에서만 쓰이고 브라우저로 내려가지 않는다. 모든 읽기 ·
쓰기는 서버 컴포넌트와 서버 액션을 거치고, 테이블에는 RLS 가 켜져 있어
익명 키로는 아무것도 읽히지 않는다.

---

## 데이터

이 저장소에 들어있는 건 `supabase/seed.demo.sql` 하나뿐이고, 내용은 전부 지어낸 것이다.

| | |
|---|---|
| 팀원 이름 | 실제 |
| 이메일 | `@example.com` |
| 고객사 · 담당자 | 지어낸 것 |
| 금액 · 석수 | 지어낸 것 |
| 주간보고 · 액션 · 미팅 내용 | 지어낸 것 |

다시 만들려면:

```bash
python scripts/make_demo_seed.py
```

난수 시드가 고정돼 있어 몇 번을 돌려도 같은 결과가 나온다.

### 실제 데이터를 쓸 때

원본 엑셀이 있다면 `doc/` 에 두고:

```bash
python scripts/extract.py        # → supabase/seed.sql
```

`doc/`, `supabase/seed.sql`, `scripts/emails.local.json` 은 `.gitignore` 에 걸려
있어 저장소에 올라가지 않는다. 실제 이메일은 `scripts/emails.local.json` 에
`{"이름": "주소"}` 형태로 두면 `extract.py` 가 읽어간다
(`scripts/emails.local.example.json` 참고).

커밋 전에 확인:

```bash
python scripts/leak_check.py
```

원본 엑셀에서 고객사명 · 담당자 실명 · 금액을 뽑아 저장소에 올라갈 파일을 훑고,
하나라도 나오면 종료 코드 1 을 낸다.

`extract.py` 가 읽는 시트:

| 시트 | 들어가는 곳 |
|---|---|
| `Weekly 주간회의 9월(Tech)` | `projects`, `project_members` |
| `Weekly 주간회의 9월(개인_Tech)` | `weekly_reports` |
| `Action Tracker` | `action_items` |
| `Weekly 주간회의(Sales)` | `deals`, `deal_updates` |
| `Sales Activity` | `meetings` |
| `Ground Rule` | `ground_rules` |

---

## 구조

```
src/
  app/
    (app)/            로그인해야 보이는 화면
      page.tsx          개요 대시보드
      weekly/           주간보고 (팀 전체 · 개인)
      actions/          Action Tracker
      deals/            Sales 파이프라인
      meetings/         고객 미팅 로그
      team/             팀 · 프로젝트 설정
    login/            이메일만 넣는 로그인
    api/logout/
  components/         UI · 폼 · 셸
  lib/
    db.ts               Supabase 또는 로컬 PGlite 선택
    local-db.ts         미리보기용 Postgres 대역
    session.ts          쿠키 기반 세션
    actions.ts          서버 액션 (모든 쓰기)
    week.ts             주차 계산
    version.ts          앱 버전 · 변경 이력
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

오른쪽 아래 배지에 표시된다. 올릴 때는 `src/lib/version.ts` 의
`APP_VERSION` 과 `CHANGELOG` 를 함께 고친다.
