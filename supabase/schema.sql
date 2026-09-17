-- ============================================================
--  AICS Weekly · Supabase schema
--  Supabase 대시보드 > SQL Editor 에 통째로 붙여넣고 실행하세요.
-- ============================================================

-- gen_random_uuid() 는 Postgres 13+ 코어 함수라 별도 확장이 필요 없습니다.

-- ---------- 팀원 ----------
create table if not exists members (
  id          uuid primary key default gen_random_uuid(),
  email       text not null unique,
  name        text not null,
  part        text,                       -- Sales / AICC / Development
  role        text,                       -- Sales, PreSales, PM, SA, 개발, 기획, 디자인
  is_admin    boolean not null default false,
  active      boolean not null default true,
  sort_order  int not null default 100,
  created_at  timestamptz not null default now()
);

-- ---------- 프로젝트(주간보고의 묶음 단위) ----------
create table if not exists projects (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  kind        text not null default '프로젝트',  -- 프로젝트/유지보수/Demo/행사/문서작성/내부업무
  owner_id    uuid references members(id) on delete set null,
  start_date  date,
  end_date    date,
  active      boolean not null default true,
  sort_order  int not null default 100,
  created_at  timestamptz not null default now()
);

create table if not exists project_members (
  project_id uuid not null references projects(id) on delete cascade,
  member_id  uuid not null references members(id) on delete cascade,
  primary key (project_id, member_id)
);

-- ---------- 주간보고 ----------
-- 한 사람이 한 주에 프로젝트별로 한 칸씩 쓴다.
create table if not exists weekly_reports (
  id          uuid primary key default gen_random_uuid(),
  member_id   uuid not null references members(id) on delete cascade,
  project_id  uuid references projects(id) on delete set null,
  week_start  date not null,             -- 해당 주 월요일
  this_week   text not null default '',
  next_week   text not null default '',
  issues      text not null default '',
  updated_by  uuid references members(id) on delete set null,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

create unique index if not exists weekly_reports_uniq
  on weekly_reports (member_id, week_start, (coalesce(project_id, '00000000-0000-0000-0000-000000000000'::uuid)));
create index if not exists weekly_reports_week_idx on weekly_reports (week_start desc);

-- ---------- Action Tracker ----------
create table if not exists action_items (
  id              uuid primary key default gen_random_uuid(),
  seq             int,
  category        text not null default 'Sales',   -- Sales / Tech / ALL
  customer        text,
  title           text not null,
  owner_id        uuid references members(id) on delete set null,
  status          text not null default '20.진행중', -- 10.대기 / 20.진행중 / 50.완료 / 99.Drop
  progress_update text default '',
  open_date       date,
  target_date     date,
  start_date      date,
  close_date      date,
  remark          text default '',
  created_at      timestamptz not null default now(),
  updated_at      timestamptz not null default now()
);
create index if not exists action_items_status_idx on action_items (status, target_date);

-- ---------- Sales 파이프라인 ----------
create table if not exists deals (
  id          uuid primary key default gen_random_uuid(),
  seq         numeric,
  category    text not null default 'Sales',      -- Sales / 내부업무
  stage       text not null default '진행중',      -- 진행중/홀딩/보류/계약진행중/계약완료/Drop
  name        text not null,                      -- 프로젝트명
  customer    text,
  lead        text,
  sales_aws   text,
  sales_mzc   text,
  period      text,                               -- '2026.07.13 ~ 2026.11.30' 같은 자유 표기
  amount      text,
  seats       text,
  remark      text default '',
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- 딜 진행내역 (엑셀의 [20260722] 블록을 한 줄씩 쪼갠 것)
create table if not exists deal_updates (
  id        uuid primary key default gen_random_uuid(),
  deal_id   uuid not null references deals(id) on delete cascade,
  log_date  date,
  body      text not null,
  author_id uuid references members(id) on delete set null,
  created_at timestamptz not null default now()
);
create index if not exists deal_updates_deal_idx on deal_updates (deal_id, log_date desc);

-- ---------- 고객 미팅 로그 ----------
create table if not exists meetings (
  id           uuid primary key default gen_random_uuid(),
  seq          int,
  owner_id     uuid references members(id) on delete set null,
  week_start   date,                       -- 예정 주 월요일
  kind         text not null default 'Net New',  -- Net New / Existing
  customer     text not null,
  contact      text,
  planned_date date,
  purpose      text default '',
  done         text default '',            -- Y / N / N/A / ''
  actual_date  date,
  companions   text default '',
  notes        text default '',
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);
create index if not exists meetings_week_idx on meetings (week_start desc);

-- ---------- Ground Rule ----------
create table if not exists ground_rules (
  id         uuid primary key default gen_random_uuid(),
  sort_order int not null default 100,
  body       text not null
);

-- ---------- updated_at 자동 갱신 ----------
create or replace function touch_updated_at() returns trigger as $$
begin
  new.updated_at = now();
  return new;
end $$ language plpgsql;

do $$
declare t text;
begin
  foreach t in array array['weekly_reports','action_items','deals','meetings'] loop
    execute format('drop trigger if exists %I_touch on %I', t, t);
    execute format('create trigger %I_touch before update on %I for each row execute function touch_updated_at()', t, t);
  end loop;
end $$;

-- ---------- RLS ----------
-- 이 앱은 비밀번호 없는 사내 이메일 로그인이고 모든 쓰기는 서버(Service Role)를 통해서만 일어납니다.
-- anon 키로는 아무것도 못 읽게 잠급니다.
do $$
declare t text;
begin
  foreach t in array array['members','projects','project_members','weekly_reports',
                           'action_items','deals','deal_updates','meetings','ground_rules'] loop
    execute format('alter table %I enable row level security', t);
  end loop;
end $$;
