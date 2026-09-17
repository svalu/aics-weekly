-- ============================================================
--  AICS Weekly · 데모 시드
--
--  팀원 이름만 실제이고 고객사 · 담당자 · 금액 · 미팅 내용 ·
--  액션 · 주간보고 본문은 전부 지어낸 것입니다.
--  실제 영업 데이터는 이 파일에 들어있지 않습니다.
--
--  scripts/make_demo_seed.py 로 생성 · schema.sql 다음에 실행
-- ============================================================
begin;

-- ---------- 팀원 ----------
insert into members (id, email, name, part, role, is_admin, sort_order) values ('c0662220-32f2-5730-a93c-ab10fd872f22', 'kang.kyungpyo@example.com', '강경표', null, '최고 리더', true, 10) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('da5a6b92-efc2-53f3-befc-49ba17419a23', 'min.kyungyoon@example.com', '민경윤', 'Sales', 'Biz 리더', true, 20) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('5a34eee5-656a-5cee-ad29-50e32eaa080f', 'lee.minwoo@example.com', '이민우', 'AICC', '솔루션 리더', true, 30) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('010eed92-691e-5ca6-8714-dbbb6176032d', 'lee.jinsoo@example.com', '이진수', 'Sales', 'Sales', false, 40) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('f2e78f81-1de6-5045-829e-36d0c2576e3c', 'ryu.haewon@example.com', '류해원', 'Sales', 'PreSales', false, 50) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('30faa942-7d92-5768-a795-8ccb17a13e23', 'lee.kiwon@example.com', '이기원', 'AICC', 'PM', true, 60) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('d1e6b931-b2b8-50ae-897e-9b3c3903d419', 'jeon.byungsoo@example.com', '전병수', 'AICC', 'SA', false, 70) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('c2713c87-2f55-5a62-8ac7-21504009d167', 'lee.hyunhaeng@example.com', '이현행', 'AICC', 'SA', false, 80) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('562877fc-38a0-5108-a264-28562a4a9cbc', 'oh.daesung@example.com', '오대성', 'AICC', 'SA', false, 90) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('f57deaa1-6095-50e3-89d8-5aba726d51e1', 'choi.changhyun@example.com', '최창현', 'AICC', 'SA', false, 100) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('cab5bee5-2380-5893-a521-0255e1cea62a', 'kim.sungwoo@example.com', '김성우', 'Development', '개발', false, 110) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('67b235b4-7113-5e79-8e03-b6d0ca90f9cf', 'jung.taeksoo@example.com', '정택수', 'Development', '개발', false, 120) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('1ae9058a-2a40-5a27-8346-def6503e4a7f', 'lee.sangmook@example.com', '이상묵', 'Development', '개발', false, 130) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('4f576dc9-6c77-509e-ad03-3c27db01c148', 'jung.jongho@example.com', '정종호', 'Development', '개발', false, 140) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('aa5a4509-6dff-53ca-85f3-89aee459d0a0', 'bang.heetae@example.com', '방희태', 'Development', '기획', false, 150) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('d9403e58-da5e-59ea-a22b-b5e38376df86', 'jang.yuseok@example.com', '장유석', 'Development', '디자인', true, 160) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('2b2f6f05-11e1-502c-b7e1-c6e0b25ae28d', 'kim.jingyu@example.com', '김진규', null, null, false, 170) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('3bc9315d-8aa7-52f9-ad33-d33d3b52c1ad', 'koo.changhyun@example.com', '구창현', null, null, false, 180) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('6073fbca-d12d-5db7-9a46-ebf663cca086', 'choi.jinyong@example.com', '최진용', null, null, false, 190) on conflict (email) do nothing;

-- ---------- Ground Rule ----------
insert into ground_rules (sort_order, body) values (10, '문서와 업무 방향성은 최종본으로 보고하지 말고, 초안부터 공유하며 맞춰 나간다.');
insert into ground_rules (sort_order, body) values (20, '외부에 나가는 문서(견적서, 제안서)는 제출 하루 전에 confirm 을 받고 진행한다.');
insert into ground_rules (sort_order, body) values (30, '회의는 사전에 이슈를 공유하고, 최소 인원으로 그 자리에서 종결시킨다.');
insert into ground_rules (sort_order, body) values (40, '모든 업무에 Target Date 를 정하고, 그 전에 자료를 공유한다.');
insert into ground_rules (sort_order, body) values (50, '고객에게 가는 문서는 우리가 하고 싶은 말이 아니라 고객 요구사항을 기준으로 쓴다.');
insert into ground_rules (sort_order, body) values (60, '기다리지 말고 한 번이라도 더 만나서 우리가 줄 수 있는 가치를 설득한다.');
insert into ground_rules (sort_order, body) values (70, '막히면 혼자 붙들지 말고 이슈로 올린다. 빨리 드러낼수록 싸게 해결된다.');

-- ---------- 프로젝트 ----------
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '0f5b9032-220f-5644-95fb-9c2294c03260', 'Relay Console 개발 P1-2', '프로젝트', (select id from members where name = '이기원'), '2026-07-06', '2026-12-31', 10 where not exists (select 1 from projects where name = 'Relay Console 개발 P1-2');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '2981885f-3774-5165-bb68-ab14cd693aae', '한빛생명 장기 TM 시스템 고도화 분석/설계 사업', '프로젝트', (select id from members where name = '이민우'), '2026-07-13', '2026-11-30', 20 where not exists (select 1 from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '2d689775-11af-52d4-ac96-9eabf33d37bd', '나래물류 Data Platform 장애대응 포탈 구축', '프로젝트', (select id from members where name = '정택수'), '2026-07-13', '2026-10-30', 30 where not exists (select 1 from projects where name = '나래물류 Data Platform 장애대응 포탈 구축');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'c91cbd7a-c52a-5cb7-b0fa-ead58c5b026e', '해든쇼핑 AICC 유지보수', '유지보수', (select id from members where name = '전병수'), '2026-08-10', '2026-10-09', 40 where not exists (select 1 from projects where name = '해든쇼핑 AICC 유지보수');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'ab129050-5a5a-5762-a02e-af71c7c4405e', '고객서비스 포털 및 컨택센터 운영 관리(GCC)', '유지보수', (select id from members where name = '장유석'), '2026-04-01', '2026-12-31', 50 where not exists (select 1 from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '9eee2d2c-45e9-57e6-8787-5518de2babf2', '정다운은행 상담챗봇', '유지보수', (select id from members where name = '김성우'), '2025-09-01', '2026-08-31', 60 where not exists (select 1 from projects where name = '정다운은행 상담챗봇');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'd849750d-7517-5469-986e-ca9c9e3c1736', '큰들체육회 상담챗봇', '유지보수', (select id from members where name = '김성우'), null, null, 70 where not exists (select 1 from projects where name = '큰들체육회 상담챗봇');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '277a7bb0-c1e5-5325-852b-d78e68cae115', '초록마트 Relay Console 소개', 'Demo', (select id from members where name = '이진수'), null, null, 80 where not exists (select 1 from projects where name = '초록마트 Relay Console 소개');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'dc4059f3-4a7e-531e-a920-8b5027e6b40a', 'AICC Hands-on Workshop', '행사', (select id from members where name = '민경윤'), null, null, 90 where not exists (select 1 from projects where name = 'AICC Hands-on Workshop');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'd46e4f71-a6d4-5f8c-8e0f-d1012164e87e', 'Cloud Contact Center Competency', '문서작성', (select id from members where name = '방희태'), null, null, 100 where not exists (select 1 from projects where name = 'Cloud Contact Center Competency');

-- ---------- 투입 인력 ----------
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '김성우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '방희태' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '이기원' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '이상묵' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '장유석' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업' and m.name = '이민우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '나래물류 Data Platform 장애대응 포탈 구축' and m.name = '정종호' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '나래물류 Data Platform 장애대응 포탈 구축' and m.name = '정택수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '해든쇼핑 AICC 유지보수' and m.name = '전병수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '김성우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '이기원' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '이상묵' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '장유석' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '정다운은행 상담챗봇' and m.name = '김성우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '큰들체육회 상담챗봇' and m.name = '김성우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '김성우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '오대성' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '이진수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '최창현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '류해원' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '민경윤' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '오대성' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '이진수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '이현행' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '전병수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '최창현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '방희태' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '오대성' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '이현행' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '전병수' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '최창현' on conflict do nothing;

-- ---------- 주간보고 ----------
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cd6152f1-459f-59f1-a985-c85ec729a99e', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/25)
 : 3열 레이아웃 전환, 상단바 정돈(8/27)
 : 다크 모드 토큰 정리', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '955918c9-23fb-54f2-9571-507d3178ce33', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '282bf0ff-d68c-5965-9b9f-740f834abaa5', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'fdf6449c-b585-5377-8060-229393e8b14d', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/26)
 : 상담 이력 화면 와이어프레임(8/28)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'b6087004-87da-59aa-b197-f1272264cae9', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/31)
 : 상담 이력 화면 와이어프레임(9/4)', '', '' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '937772d6-a12a-5d1d-b8ae-d8b626523118', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/9)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bc6dad5f-8440-59b6-95d2-b310aadbba13', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '310d8d7b-8a13-5120-9b02-5fa4483a19f3', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(8/31)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/3)
 : 알림 센터 기능 개발(8/31)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cf11f01c-3da3-5d25-b068-cd2724ffe819', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3a2319fe-f714-5f51-8722-68101f47e091', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/16)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/17)
 : 알림 센터 기능 개발(9/16)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c22952f1-9691-5720-872a-385d1c5d9a9d', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f678c188-551f-51dd-bd04-de4667a8ce2f', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f8fb7211-1834-5833-83d0-5a39914b2860', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/9)
 : 상담 이력 화면 와이어프레임(9/11)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1c83728c-0a8d-5273-92d5-44aaf984c458', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 워크플로우 자동화 개발(9/14)
- 단위 테스트 보강
- 정적 분석 경고 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '017975c6-f6ee-56d7-ac99-69e2fe944fe9', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/26)
 : 3열 레이아웃 전환, 상단바 정돈(8/28)
 : 다크 모드 토큰 정리', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'af5b4d36-3f09-5d9a-a4d0-1ebdf4a275b7', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6a5c24e2-ee5a-5254-9672-4d9637048b11', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e8b3e32c-1b30-56d0-9b00-57edde9aed9b', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/15)
 : 상담 이력 화면 와이어프레임(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd3fff1f1-a076-562e-87f9-458f3d79afd2', m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-08-31', '- 분석 단계 산출물 고객 검토 및 보완(9/3)
- 설계 단계 산출물 작성 내부 리뷰
- 이슈 · 리스크 관리
- 고객 요구사항 대응', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이민우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2b8195b4-0f98-5eb6-bfd3-862d3ea70785', m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-09-07', '- 요구사항 정의서 내부 검토 및 고객 전달 준비(9/9)
- 화면 시안 리뷰
  > 내부 리뷰 2차(9/9)
  > 현업 설명 및 확정(9/10)
- 시스템 아키텍처 분석(9/10)', '', '' from members m where m.name = '이민우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '487406d9-761a-532b-b18c-ad9099e98f62', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '정종호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9f62379a-7eff-52d9-b1d9-49a008d5e6b7', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/4)
- 일괄 재실행 설정 화면 정리', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '정종호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6c380499-138b-52a1-bfd6-809e129e344b', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/10)
- 일괄 재실행 설정 화면 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '정종호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ceeac478-9824-5480-8d31-57ab2ad7194c', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/17)
- 일괄 재실행 설정 화면 정리', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '정종호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'dfd96e09-6d3c-5d89-a8eb-8f3eb4f92898', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '', '' from members m where m.name = '정택수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6054496e-7747-5373-a9e1-c9f0c01d7799', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/31)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '정택수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '99d51490-3324-545d-a715-78600fa6650e', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/10)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '정택수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '450a6d44-ccbc-5ab1-afef-45b128208eae', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/18)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '' from members m where m.name = '정택수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3c394ecf-70a7-5351-8cc3-b0935c0d9621', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-24', '- 고도화 요구사항 인터뷰 2차(8/25)
- 공수 산정 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '430b86e8-d7c1-5487-b15b-67e75f612abf', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-31', '- 고도화 요건 분석(9/1)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd602f716-8c4f-59f4-a1ca-06d6d5ae387c', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-09-07', '- 고도화 요건 분석(9/9)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/10)', '', '' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8dcfd686-ff35-50ea-ba65-3caaa0b591c8', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/24 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '28556728-6033-5d7b-95fc-09006de8e448', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/1)
- 리드 데이터 연동 확장 미팅(9/4)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '590b0fad-2b13-5560-83a5-8cae251ee4df', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 검색 기능 운영 서버 이전(9/9 ~ 9/11)
- 프론트 테마 테스트 환경 구성', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '06320a53-3246-5445-9c61-02e7cb80fbd6', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- 검색 기능 운영 서버 이전(9/16 ~ 9/17)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5ea66448-7749-520f-87aa-db315494c89c', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/26 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'a40807b4-a4f8-5d78-ab69-0d8b5786d0d6', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '71afbacf-cb1b-5372-86fb-4a386fa7bb17', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/18)', '' from members m where m.name = '이기원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ed56088b-31fc-58e6-97ac-e673abbf5bd8', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/2)
- 리드 데이터 연동 확장 미팅(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8beb8327-1a3c-597e-b8be-9f1f6ec1e0e3', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 리소스 · 접속 통계 보고서 상신(9/9)
- 리드 데이터 연동 확장 미팅(9/10)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6449b6b3-872e-5290-8d81-a97d15e162f4', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '이상묵';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6cdc15ad-830c-5af1-83af-e7c8b73ef825', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '376fef38-f99c-5653-8ddd-7a32c2a2054c', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 검색 기능 운영 서버 이전(8/31 ~ 9/4)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'b3d7dc4f-411f-5c62-ae55-4f0d598132eb', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7465bae4-909d-586f-8fac-3fc20c2f8cd1', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '장유석';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c7db0a66-6854-5368-b968-cd3896ff0f51', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-08-24', '- 삭제 배치 테스트 및 작업계획서 전달(8/28)
- 월 정기 점검', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bd3dcb6f-fd7b-51b9-8f61-e8395ce48f2e', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-07', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/8)
 : 정기 점검 때 함께 반영 예정', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '95d2285b-e34d-5d18-8d7c-d0705674a803', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-14', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/15)
 : 정기 점검 때 함께 반영 예정', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'b5722db8-825b-564a-bcd4-412f52c80a1b', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-24', '- 월 정기 점검(8/26)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f0c79518-e102-5a81-8948-0f0f9be1a7c6', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-31', '- 월 정기 점검(9/2)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '72a1ae07-f9da-5b1c-b2a2-2ced859d8e87', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-07', '- 월 정기 점검(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'abdbbd45-0f38-543b-9255-0e2c9c207540', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-14', '- 월 정기 점검(9/14)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8687ad7f-1729-5bc6-aac1-d97711afd1dd', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8bad54f3-5ae4-5de7-a364-753b5bc0efd9', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3113f49c-ae70-5747-a7ba-744a60ca434f', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '김성우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7112b4b1-fad3-5fde-90d8-78df0b3973b8', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/27)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'dcd80b96-f854-5cba-bea0-bc6cd3b5227b', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd770c3d3-cf5d-5c1b-a113-6b78a14c51b2', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '0a958dd6-0754-5256-95a2-a543e784733c', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '504e3640-1221-559f-a94a-c216c18e674d', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f59faa76-7435-5626-a61e-509f220e3d5a', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '854892a1-6ad5-57fb-9ebd-81a77e42649d', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/11)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '653c5c3b-9c6c-5cf5-91fd-b0f5ce27ecf9', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/18)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '886524a5-b296-5f9d-b62c-8de562c00569', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4a6b0dab-d0b2-5555-9db4-db6892ae3268', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5956c75b-0275-532d-9eb0-1cd6b9c3ce6e', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bf701232-632e-5af0-916d-b22ae3319028', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ed841ba6-4d5e-5f7c-9c1b-18a2a2728c66', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '류해원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8d558726-6908-59e1-8140-71454805931b', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '류해원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd9cc32d3-2499-5135-b7a4-b25f89fc72d2', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '류해원';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c1d11305-64fd-52ad-b8ff-39f396f4e654', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/27)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '민경윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5760300e-8ea8-58dd-b11a-68e6f06268df', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/3)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '민경윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '888a7edd-95f2-5acc-a5f9-c1629dbf093b', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '민경윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '81f55d15-0f1f-5df1-a135-9827f51cbdaf', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '민경윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '370a3891-bef4-5c63-b31b-b6200cf5af9f', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/28)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5a3d4772-95b8-57ad-92d5-b76664cc30b2', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2f88213b-33e8-5c73-9650-26d7b5377f60', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '765fac09-5278-5f74-a13d-3d69842f5080', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '26085bfd-3610-5d03-bc6e-2e4b21817e62', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'a1ba801f-d983-5463-ac01-a3365371df4d', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'fabefbc6-291e-5167-a17a-0f85dba9ff11', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'b0e53559-cf12-5a66-8950-5405f087f3dc', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '45fa4a44-10f9-5550-b758-ff9f3d2f508e', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1c61db56-082a-5b0b-9e88-bc3f927a2d96', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/25)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '67654b0a-0f07-589b-a928-02a1b03449f1', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cc73be3d-3ea4-5744-8d35-16a8b508dfca', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/7)
 : 발표 자료 정리
 : 데모 환경 구축', '', '' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3dc86e5f-662d-5c80-8a27-c156134703c4', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2fccec4e-492c-55f6-a106-eb6fd53c5970', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '15fd7a7b-5fa9-5c35-ad66-4c355bed2f8f', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f86e1f82-9e55-5db4-bcf0-eb1f70e7c353', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '21d49f1b-0e7b-5808-8faa-00cb5c1300b7', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd88c55ec-beac-5f75-a17d-6d94916a7643', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c0306c54-edac-5106-8cc8-ad28213e1a6c', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '방희태';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7c07a391-f6f6-5648-8642-ff931bccd021', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e3671aae-74c7-51ff-9dcc-dab4236208ff', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cdd4ffff-bac0-5c99-b2bb-4733f509e9cd', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '59191ccd-2f1a-5a9b-bb20-19ca239c9cd7', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9f651ee6-2a0b-5b74-ab42-91a989e4c07e', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3ae5228f-396c-5226-89e0-71fa0e9e8468', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '10c9677a-444f-5fe8-90b8-6d7efea91882', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/17)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '68bf1ec9-bb53-577d-b7c2-4abea1ee4239', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/27)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7683e092-fa97-553e-95b4-83158ae98eda', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '24d858f9-d44d-54b8-9ab3-2b3f2f820d98', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '32e21e1d-b765-5c6c-a61f-7763590c435d', m.id, null, '2026-08-24', '- 발표 자료 작성(8/24)
- 데모 영상 편집(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '41e0d4de-07aa-5c32-a1f5-f645e936264a', m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '528be9ca-e8d6-5fb3-a8d3-863df89ecc10', m.id, null, '2026-09-07', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4999ddd0-db6c-5617-920a-fcaf46770216', m.id, null, '2026-08-24', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '419e0b64-d026-5b6b-b067-b473bef5a750', m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'b3923647-7f8a-56bb-8a8e-51aa51ef17ea', m.id, null, '2026-09-07', '- 발표 자료 작성(9/9)
- 데모 영상 편집(9/10)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5289c5c1-23d7-5496-a76f-93f8f9b93d53', m.id, null, '2026-09-14', '- 발표 자료 작성(9/15)
- 데모 영상 편집(9/18)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이현행';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'dde73779-c90b-52f7-83cc-b67b05fb71d0', m.id, null, '2026-08-31', '- 발표 자료 작성(9/2)
- 데모 영상 편집(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4a233951-1ddc-52d2-b1f3-c1ea5c3df353', m.id, null, '2026-09-14', '- 발표 자료 작성(9/14)
- 데모 영상 편집(9/17)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';

-- ---------- Action Tracker ----------
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('e8396645-737c-5430-8810-3937e3f0a919', 1, 'Tech', '큰들BPO', '계약 조건 검토', (select id from members where name = '이기원'), '50.Close', '9/10 1차 검토 완료. 보완 사항 정리 중', '2026-09-08', '2026-10-08', '2026-10-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ac57c418-100e-5f51-a086-b8ee2a5a0f4e', 2, 'Sales', '소담스토어', '워크샵 일정 수립', (select id from members where name = '장유석'), '50.Close', '', '2026-08-05', '2026-08-12', '2026-08-08', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1692b4b9-cae7-5d12-aa0b-73b856907acb', 3, 'Sales', '두레캐피탈', '고객사 담당자 재확인', (select id from members where name = '전병수'), '20.진행중', '8/7 1차 검토 완료. 보완 사항 정리 중', '2026-08-05', '2026-09-10', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1652bad9-dfd6-5be3-a9ed-f3fede15b4eb', 4, 'Sales', '마루정보통신', '견적 초안 작성 및 내부 검토', (select id from members where name = '이현행'), '50.Close', '9/8 1차 검토 완료. 보완 사항 정리 중', '2026-09-06', '2026-09-13', '2026-09-14', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('3c8bbf67-5894-5bcc-8374-05003a63dcd2', 5, 'Sales', '다올물류', '고객사 담당자 재확인', (select id from members where name = '김진규'), '50.Close', '7/31 1차 검토 완료. 보완 사항 정리 중', '2026-07-29', '2026-08-05', '2026-08-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('5f49cb7e-f509-5b87-b48b-91338cb1a0f3', 6, 'Sales', '푸른여객', '경쟁사 동향 정리', (select id from members where name = '김진규'), '20.진행중', '', '2026-08-23', '2026-08-23', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('94239715-8e3c-505d-b7da-fa6369627771', 7, 'Tech', '고운손해보험', '협업 가능 여부 결과 보고', (select id from members where name = '민경윤'), '50.Close', '8/31 고객 전달 완료
9/4 회신 대기', '2026-08-29', '2026-09-28', '2026-10-01', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('567d7d65-ef9b-5198-9c3f-4e9f498dddcf', 8, 'Tech', '새롬정보', '유지보수 범위 협의', (select id from members where name = '이민우'), '50.Close', '8/4 1차 검토 완료. 보완 사항 정리 중', '2026-08-02', '2026-08-23', '2026-08-22', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('c335cb32-98cc-55ad-9f33-f0b88b38701d', 9, 'ALL', '달빛커머스', '오퍼링 자료 최신화', (select id from members where name = '장유석'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-09-25', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1e296b3c-2806-5fb5-bb77-827dac8d7842', 10, 'Sales', '이음테크', '오퍼링 자료 최신화', (select id from members where name = '민경윤'), '20.진행중', '', '2026-07-17', '2026-09-21', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ba6deaa2-12c3-50c8-8b02-d166178fc66d', 11, 'ALL', '한빛생명', '사전조사 양식 전달', (select id from members where name = '이현행'), '50.Close', '7/4 내부 리뷰 진행. 다음 주 재논의', '2026-07-02', '2026-07-12', '2026-07-16', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('5f1856d2-b785-563e-9317-a010c955453a', 12, 'Sales', '우듬지리테일', '차세대 일정 확인', (select id from members where name = '구창현'), '99.Drop', '8/23 고객 전달 완료
8/27 회신 대기', '2026-08-21', '2026-09-04', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('68baa1c3-dbae-57a0-9f3b-c911200f7f94', 13, 'Tech', '큰들BPO', '협업 가능 여부 결과 보고', (select id from members where name = '이상묵'), '20.진행중', '8/9 1차 검토 완료. 보완 사항 정리 중', '2026-08-07', '2026-09-13', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('53367df3-d8dc-5114-801b-f891b39b1ba5', 14, 'Tech', '하늘담운수', '견적 초안 작성 및 내부 검토', (select id from members where name = '오대성'), '20.진행중', '', '2026-07-30', '2026-08-29', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('f7443dc5-10b6-5b5b-91c2-0d845930bdc9', 15, 'Tech', '두레캐피탈', '계약 조건 검토', (select id from members where name = '이상묵'), '99.Drop', '', '2026-09-08', '2026-09-18', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ac63ba09-9204-5228-b787-aaf1c02cd0bb', 16, 'ALL', '우듬지리테일', '경쟁사 동향 정리', (select id from members where name = '이진수'), '20.진행중', '8/17 1차 검토 완료. 보완 사항 정리 중', '2026-08-15', '2026-08-18', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('05a8514a-df1d-57d6-ae29-cfe6435a8a50', 17, 'Tech', '고운손해보험', '사전조사 양식 전달', (select id from members where name = '방희태'), '50.Close', '', '2026-08-16', '2026-09-06', '2026-09-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('b77a5df4-e4f3-52b9-9e13-0629f60c6812', 18, 'Sales', '초록마트', '견적 초안 작성 및 내부 검토', (select id from members where name = '방희태'), '99.Drop', '', '2026-08-08', '2026-09-07', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ec9d5f37-9b4b-52ca-93bb-078f7bfcc2e6', 19, 'Tech', '빛나컴퍼니', '워크샵 일정 수립', (select id from members where name = '최창현'), '10.대기', '', '2026-08-04', '2026-08-25', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('4a0fea4c-946d-51ae-ab91-3887d4abb454', 20, 'Sales', '미래로카드', '운영 이관 계획 수립', (select id from members where name = '정종호'), '20.진행중', '9/5 1차 검토 완료. 보완 사항 정리 중', '2026-09-03', '2026-09-26', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('eb76e81e-bb95-5831-9f4b-52fbd090329a', 21, 'ALL', '두레캐피탈', '오퍼링 자료 최신화', (select id from members where name = '최진용'), '50.Close', '', '2026-07-03', '2026-07-10', '2026-07-13', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('50965fea-3a1f-5566-baec-2fe074610348', 22, 'Sales', null, '오퍼링 자료 최신화', (select id from members where name = '방희태'), '50.Close', '9/13 1차 검토 완료. 보완 사항 정리 중', '2026-09-11', '2026-09-21', '2026-09-26', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('886af624-f924-58f5-b43c-8350d6bd6400', 23, 'Sales', '청람증권', '워크샵 일정 수립', (select id from members where name = '방희태'), '50.Close', '', '2026-07-29', '2026-08-28', '2026-08-25', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('d4cab019-d963-51d2-97d9-d3d3b3a6e10f', 24, 'Sales', '터전홀딩스', '오퍼링 자료 최신화', (select id from members where name = '장유석'), '50.Close', '', '2026-07-18', '2026-08-08', '2026-08-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('a1c85d8b-d6af-50ab-b193-07b12582bb30', 25, 'Sales', '온누리항공', '고객사 담당자 재확인', (select id from members where name = '류해원'), '10.대기', '', '2026-07-02', '2026-07-09', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('4cf0e329-1e07-527e-b020-2c8ad2c51ddf', 26, 'Sales', '별빛여행', '차세대 일정 확인', (select id from members where name = '민경윤'), '50.Close', '', '2026-08-24', '2026-09-07', '2026-09-10', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('9215fbcc-5256-5ede-92d4-e205dda3bd08', 27, 'Sales', '소담스토어', '연동 규격 확인', (select id from members where name = '이현행'), '20.진행중', '', '2026-08-28', '2026-09-17', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('bce27130-639f-5569-97b8-83d935e327aa', 28, 'Sales', '한결에너지', '운영 이관 계획 수립', (select id from members where name = '이진수'), '50.Close', '8/23 1차 검토 완료. 보완 사항 정리 중', '2026-08-21', '2026-09-20', '2026-09-17', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('c680c9d1-878f-5a75-b5ed-588b7795f669', 29, 'Sales', '다올물류', '계약 조건 검토', (select id from members where name = '최진용'), '20.진행중', '9/12 내부 리뷰 진행. 다음 주 재논의', '2026-09-10', '2026-09-12', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('09a33c88-0341-53fe-b65c-45d6f834bf0d', 30, 'Sales', '터전홀딩스', '데모 환경 준비', (select id from members where name = '김성우'), '50.Close', '9/2 고객 전달 완료
9/6 회신 대기', '2026-08-31', '2026-09-07', '2026-09-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('3173309f-ca4c-53c0-92b5-eba198698e31', 31, 'Sales', '정다운은행', '워크샵 팔로우업', (select id from members where name = '전병수'), '50.Close', '8/20 내부 리뷰 진행. 다음 주 재논의', '2026-08-18', '2026-09-01', '2026-09-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('aadf0673-054c-59b0-94ee-f45c4a307b34', 32, 'Sales', '밝음저축은행', '오퍼링 자료 최신화', (select id from members where name = '강경표'), '50.Close', '', '2026-09-08', '2026-09-18', '2026-09-15', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('b0ce527c-dcfc-594d-95ce-bbf9b482773a', 33, 'ALL', '하늘담운수', '워크샵 팔로우업', (select id from members where name = '장유석'), '50.Close', '7/22 1차 검토 완료. 보완 사항 정리 중', '2026-07-20', '2026-07-25', '2026-07-26', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('64b0a724-ea20-5490-9ae8-69c3c6d21800', 34, 'Tech', '하늘담운수', '연동 규격 확인', (select id from members where name = '이현행'), '50.Close', '', '2026-08-27', '2026-09-10', '2026-09-12', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('fc7f5809-b69b-5102-af8c-4dca23cb497c', 35, 'Sales', '다올물류', '데모 환경 준비', (select id from members where name = '구창현'), '50.Close', '7/9 1차 검토 완료. 보완 사항 정리 중', '2026-07-07', '2026-07-21', '2026-07-22', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1dc72200-cce1-5da9-9869-61ed3b751ead', 36, 'Sales', '초록마트', '사전조사 양식 전달', (select id from members where name = '이현행'), '99.Drop', '7/20 내부 리뷰 진행. 다음 주 재논의', '2026-07-18', '2026-07-28', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('be357549-ca9d-5c28-a57e-12a131b880c6', 37, 'Sales', '나래물류', '연동 규격 확인', (select id from members where name = '정종호'), '20.진행중', '7/13 1차 검토 완료. 보완 사항 정리 중', '2026-07-11', '2026-09-29', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('037e2194-7dce-5d8d-bb08-2f01b26bc539', 38, 'Tech', '슬기로운여행', '견적 초안 작성 및 내부 검토', (select id from members where name = '최창현'), '10.대기', '9/13 내부 리뷰 진행. 다음 주 재논의', '2026-09-11', '2026-09-16', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('2824526a-0fec-582a-bb05-03db5e9c5aac', 39, 'Sales', '달빛커머스', '사전조사 양식 전달', (select id from members where name = '방희태'), '50.Close', '', '2026-09-07', '2026-09-28', '2026-10-03', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('420a2d35-cec7-5152-b11c-f161a8ab969b', 40, 'Tech', '터전홀딩스', '경쟁사 동향 정리', (select id from members where name = '이진수'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-08-30', null, '');

-- ---------- Sales 파이프라인 ----------
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('921f7d94-5e88-5164-8041-2dedabad46ba', 1, 'Sales', '보류', 'AICC 차세대 구축 사업', '달빛커머스', '민경윤', '', '정예린', '', '', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('642f402a-36bb-5ce0-bd6c-3ca1a6fc2c15', '921f7d94-5e88-5164-8041-2dedabad46ba', '2026-06-30', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('97aa170f-54cd-559c-ad81-29b0a433608b', 2, 'Sales', '진행중', '콜봇 도입', '바로콜', '류해원', '', '신다온', '', '견적 산출 전 정보 수집 단계', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60cce039-76e9-54e0-ad7b-558b814a4ff4', '97aa170f-54cd-559c-ad81-29b0a433608b', '2026-07-09', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('b9c6c33b-5207-568b-8cfb-459806140a70', '97aa170f-54cd-559c-ad81-29b0a433608b', '2026-07-26', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('998d3103-32cf-5025-81fa-6241ee5e583c', 3, 'Sales', '진행중', '콜봇 도입', '빛나컴퍼니', '민경윤', '', '', '', '', '50석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('9996d70b-ec13-5350-973a-e23efa1261dd', '998d3103-32cf-5025-81fa-6241ee5e583c', '2026-08-07', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('9c5525a1-8ea9-5c0c-9a3b-0e05f0c8ebb2', '998d3103-32cf-5025-81fa-6241ee5e583c', '2026-09-01', '- 프로젝트 기간 확정
 : 착수 준비 진행');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', 4, 'Sales', '진행중', '상담 화면 통합 구축', '하늘담운수', '민경윤', '', '배준영', '', '견적 산출 전 정보 수집 단계', '6석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('c2b8f9dd-b3fc-5a26-8df2-3bfb659e6aec', '3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', '2026-07-08', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ('6de784b7-8edc-5fdf-9411-34d6f1c8c4aa', '3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', '2026-07-24', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('68c29026-7d48-520c-ab54-772c156351bd', '3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', '2026-08-14', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('a198e0e1-019c-58c2-a60f-05c43a34e0fb', '3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', '2026-08-26', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('7711dead-661b-551c-9d9a-be68c16508ef', 5, 'Sales', '진행중', '콜봇 도입', '이음테크', '류해원', '', '윤지호', '', '', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('2f14786d-2fef-5cbf-90a6-0d9406b3091d', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-11', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ('cdd6d205-95c1-5596-9117-2f4d8e1e9420', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-20', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('28318be9-2f26-531b-be05-ff89baac3b70', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-26', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('0ba25821-62db-59e3-a0e2-7df1192e3bd6', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-08-28', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('4d7f370a-df94-537b-8f38-fd9ce7fa9824', 6, 'Sales', '진행중', '유지보수', '별빛여행', '민경윤', '박지우', '', '', '견적 산출 전 정보 수집 단계', '10석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60a5c5bd-78fd-553e-82aa-ed98b5476657', '4d7f370a-df94-537b-8f38-fd9ce7fa9824', '2026-06-28', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('8326cfd2-e776-5b3f-92f9-ffc7961379ee', '4d7f370a-df94-537b-8f38-fd9ce7fa9824', '2026-07-05', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ('1d6460c8-272d-52be-bfad-c595eac31013', '4d7f370a-df94-537b-8f38-fd9ce7fa9824', '2026-07-14', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ('59b18c95-d2fc-5a20-bbd6-bb67f371101a', '4d7f370a-df94-537b-8f38-fd9ce7fa9824', '2026-07-31', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('c3661fdb-6b69-5eb6-af03-9df7730c62df', 7, 'Sales', '진행중', 'AICC 구축 사업', '마루정보통신', '이진수', '강도윤', '조서윤', '', '', '60석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('c25940d7-7cc2-5cad-abd7-8f877847a143', 'c3661fdb-6b69-5eb6-af03-9df7730c62df', '2026-08-21', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ('db775c3f-9ff1-5caf-abd1-6763af2a3077', 'c3661fdb-6b69-5eb6-af03-9df7730c62df', '2026-09-03', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('8be838eb-21c4-53e7-b680-1fd302a571d6', 8, 'Sales', '보류', '콜봇 도입', '푸른여객', '민경윤', '', '윤지호', '', '', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0d113f61-601d-5d74-ba9d-b68228c03f7e', '8be838eb-21c4-53e7-b680-1fd302a571d6', '2026-08-11', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('70a4c953-4385-58af-8b5a-f80006735651', 9, 'Sales', '진행중', '콜봇 도입', '두레캐피탈', '류해원', '임채원', '오시현', '', '', '60석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('1635d3b9-0b03-5f58-9e36-345e9bb3ddb9', '70a4c953-4385-58af-8b5a-f80006735651', '2026-07-01', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('9572de75-4e82-5dc1-9d18-6d64ca7da2f6', '70a4c953-4385-58af-8b5a-f80006735651', '2026-08-06', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('cf411634-a51f-50b5-98bc-79627b366454', 10, 'Sales', '계약진행중', 'AICC 차세대 구축 사업', '우듬지리테일', '류해원', '', '', '2026.07.13 ~ 2026.11.30', 'PS : 4.49억', '10석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60a4f77b-5913-5cbe-a928-4337112664db', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-08-01', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ('7322f8c4-4235-5009-8f74-c7e8a52b35f3', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-08-18', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ('a895eea1-3fa1-58b0-9095-6222b06bb041', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-08-18', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('4ed88abe-4d28-571e-88ec-240708a2b9d1', 11, 'Sales', '진행중', '상담 화면 통합 구축', '밝음저축은행', '민경윤', '신다온', '강도윤', '', '견적 산출 전 정보 수집 단계', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0a460456-171c-5135-8244-e65b2161374a', '4ed88abe-4d28-571e-88ec-240708a2b9d1', '2026-07-14', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('c32677b8-bded-5aa3-8a6b-9037c6566fb2', 12, 'Sales', '보류', '콜봇 도입', '한결에너지', '이진수', '', '박지우', '', '견적 산출 전 정보 수집 단계', '10석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('05f5506c-ab7e-5517-a30b-d609374f0124', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-07-15', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('efee3056-40bd-5c50-8480-d59a9eb73367', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-07-29', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ('e6cc4c28-afcc-5627-befd-d15e46870afd', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-08-20', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정'),
  ('d00128dd-3307-50a6-93e7-84952dd0d744', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-08-22', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('eb23d929-fc5e-5ceb-88ab-10eb87990be7', 13, 'Sales', '진행중', '유지보수', '슬기로운여행', '류해원', '', '', '', '견적 산출 전 정보 수집 단계', '8석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('e1c4248b-8093-542e-bb06-51df2990bcc7', 'eb23d929-fc5e-5ceb-88ab-10eb87990be7', '2026-07-21', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('74042c06-6799-5461-bc91-67d75f588627', 14, 'Sales', '보류', '유지보수', '나래물류', '이진수', '김하늘', '오시현', '', '', '16석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('398a82f1-92e6-5040-9935-7e7eb46861c1', '74042c06-6799-5461-bc91-67d75f588627', '2026-08-17', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('24c6b019-eb54-5c16-8211-97631ef10594', 15, 'Sales', '계약진행중', 'AICC 구축 사업', '큰들BPO', '류해원', '', '', '2026.07.13 ~ 2026.11.30', 'PS : 3.54억', '6석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('692ef580-13c3-5ede-861d-1674769b27b3', '24c6b019-eb54-5c16-8211-97631ef10594', '2026-09-05', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('8dadcbaf-6767-5e86-a677-6d6461bf1986', 16, 'Sales', '진행중', 'IPCC 구축 사업', '청람증권', '민경윤', '', '', '', '', '8석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('d88a1b30-17fa-538f-819a-46ab7f9e9946', '8dadcbaf-6767-5e86-a677-6d6461bf1986', '2026-07-23', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ('1c8f5645-1b27-5c7e-a671-46dbc95861f6', '8dadcbaf-6767-5e86-a677-6d6461bf1986', '2026-08-22', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ('68c84703-d753-5115-bf71-169b3ea679de', '8dadcbaf-6767-5e86-a677-6d6461bf1986', '2026-08-26', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('e09b6171-db95-5af8-8b20-ba10eb8c6352', '8dadcbaf-6767-5e86-a677-6d6461bf1986', '2026-09-06', '- 우선협상대상자 선정
 : 계약 절차 진행 중');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('e486eac9-2be6-5df2-bd89-6cfc645a9599', 17, 'Sales', '진행중', 'AICC 구축 사업', '미래로카드', '이진수', '윤지호', '', '', '', '400석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('77fda44c-af62-5f0c-9ac2-9e487c496d3e', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-07-30', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('fcc36256-aa36-5338-93c9-ea5d0dd5f235', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-08-06', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ('ed116cfc-f9f9-555b-9648-de9551dd5c97', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-09-08', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('19d0ea8e-6150-5cd2-9b07-3c85a2cef59f', 18, 'Sales', '진행중', '상담 화면 통합 구축', '너울테크', '류해원', '김하늘', '', '', '견적 산출 전 정보 수집 단계', '16석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0bbb71c0-07ea-5836-917a-a75cab377972', '19d0ea8e-6150-5cd2-9b07-3c85a2cef59f', '2026-07-14', '- 프로젝트 기간 확정
 : 착수 준비 진행');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('30ca3c3a-e034-5779-b5a5-c9bc19249392', 1, '내부업무', '진행중', '오퍼링 자료 정비', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('a9f2d289-10e3-51c8-a654-e623a022842c', '30ca3c3a-e034-5779-b5a5-c9bc19249392', '2026-09-03', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('dbe55b2a-9fd2-5c90-9a56-014b3df96414', 2, '내부업무', '진행중', '콜드콜 방안 수립', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('d338a56a-68dd-5221-b184-865d68adf644', 'dbe55b2a-9fd2-5c90-9a56-014b3df96414', '2026-08-21', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('45c07324-fdc9-503a-9e2d-c31abb2bd8af', 3, '내부업무', '진행중', '파트너 채널 정리', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('6f41ee8d-0298-5961-b61b-740cc317054f', '45c07324-fdc9-503a-9e2d-c31abb2bd8af', '2026-09-08', '- 1차 초안 공유
 : 다음 주 리뷰 예정');

-- ---------- 고객 미팅 로그 ----------
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('99efade5-b634-5a2e-87fc-2cc2802bdd56', 1, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '나래물류', '임채원', '2026-08-14', '상담 화면 통합 협의', 'Y', '2026-08-14', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('69caa4f1-98d6-5637-a1de-d7a3fbc48bc2', 2, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '새롬정보', '신다온', '2026-08-11', '진행 사항 점검', 'Y', '2026-08-11', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('bfcea4b5-8364-5295-b0d5-93b2b75b154e', 3, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '푸른여객', '강도윤', '2026-08-13', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-15', '전병수', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('88144c40-b052-5c58-aa9d-2dde9620d335', 4, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '이음테크', '', '2026-08-12', '시장 동향 공유', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('120ad3ad-8cf5-5dfd-a045-4f29f8566da9', 5, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '터전홀딩스', '', '2026-08-10', '콜봇 개발 관련 협의', 'Y', '2026-08-10', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5dedbabd-a8a9-5e14-aa12-fff6085d9b55', 6, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '빛나컴퍼니', '', '2026-08-13', '워크샵 참가 여부 확인', 'Y', '2026-08-13', '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('316e7c6a-7f34-5f6a-8461-1eb11714dcea', 7, (select id from members where name = '류해원'), '2026-08-10', 'Existing', '정다운은행', '조서윤', '2026-08-12', '견적 협의 및 데모', 'Y', '2026-08-14', '이진수, 전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('49bab10f-2b9b-5fe1-8d2d-c8d5ecd6cd29', 8, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '빛나컴퍼니', '배준영', '2026-08-14', '차세대 진행 일정 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f58289c6-e81f-5e2f-a080-1cd1e6205427', 9, (select id from members where name = '류해원'), '2026-08-10', 'Net New', '새롬정보', '윤지호', '2026-08-12', '유지보수 협의', 'Y', '2026-08-15', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d6d7810a-99b2-5d62-81a1-711c08e4012a', 10, (select id from members where name = '류해원'), '2026-08-10', 'Net New', '마루정보통신', '', '2026-08-13', '콜봇 개발 관련 협의', 'N/A', null, '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8c6649bd-40c0-59c4-8447-90299badb3fc', 11, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '소담스토어', '임채원', '2026-08-11', '워크샵 참가 여부 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3c83160a-185b-51f0-a9fd-f364d25ddd73', 12, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '달빛커머스', '김하늘', '2026-08-12', '협업 가능 여부 파악', 'Y', '2026-08-12', '이진수, 전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f1e173a3-d2ad-53c7-9fcd-502f232eeb13', 13, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '가온손해보험', '', '2026-08-10', '초도 미팅, 요구사항 확인', 'Y', '2026-08-10', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8e77d335-fc35-569e-a555-3327fe8bfd23', 14, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '미래로카드', '최민재', '2026-08-11', 'AICC 도입 계획 체크', 'N/A', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('00bccc3a-380f-5adc-80c2-030ea03cbb36', 15, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '우듬지리테일', '문가람', '2026-08-13', '진행 사항 점검', 'Y', '2026-08-13', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3e17b90a-997b-5337-bfd9-7597561c5825', 16, (select id from members where name = '류해원'), '2026-08-10', 'Existing', '너울테크', '', '2026-08-13', 'AICC 도입 계획 체크', 'Y', '2026-08-18', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('20dab872-f9c2-5ac5-83a2-1f889f4c8ef8', 17, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '별빛여행', '', '2026-08-11', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-11', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f2ed03d2-978d-525e-850d-c1ea673438fa', 18, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '새롬정보', '', '2026-08-14', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-15', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('20ffa031-58c5-5908-bd76-d9d3484226d2', 19, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-21', '상담 화면 통합 협의', 'N/A', null, '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('2b336811-46d0-5daf-8f06-0058b32634c9', 20, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '나래물류', '신다온', '2026-08-19', '상담 화면 통합 협의', 'Y', '2026-08-20', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('009de5b0-5a36-50ac-b073-fc6abed73778', 21, (select id from members where name = '류해원'), '2026-08-17', 'Net New', '이음테크', '신다온', '2026-08-17', '협업 가능 여부 파악', 'Y', '2026-08-17', '전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('36c15bca-d351-5a74-8e4f-016b7f089721', 22, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '소담스토어', '박지우', '2026-08-18', '상담 화면 통합 협의', 'Y', '2026-08-18', '류해원', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3b181da7-d9dc-59d8-8ec6-ee0d4a99d3fd', 23, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-17', 'AICC 도입 계획 체크', 'Y', '2026-08-20', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('87e83358-6852-581b-8899-50ce11941816', 24, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '새롬정보', '', '2026-08-19', '초도 미팅, 요구사항 확인', 'Y', '2026-08-19', '전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7cc6e9c9-fcb2-5888-a574-2281cc38c955', 25, (select id from members where name = '이진수'), '2026-08-17', 'Existing', '청람증권', '', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '이진수, 전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('31961c09-546e-5c92-b3e0-2cc56d1e4613', 26, (select id from members where name = '이진수'), '2026-08-17', 'Net New', '소담스토어', '', '2026-08-20', '차세대 진행 일정 확인', 'Y', '2026-08-25', '전병수', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ddfd7c43-eacd-507e-9b27-d25cbdfbda49', 27, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '청람증권', '강도윤', '2026-08-19', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-23', '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('cccdb395-6722-585c-a29e-33471ebc68fc', 28, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '너울테크', '오시현', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8efac19d-8c57-569f-ba67-c2b08c3a5054', 29, (select id from members where name = '민경윤'), '2026-08-17', 'Net New', '초록마트', '윤지호', '2026-08-18', '차세대 진행 일정 확인', 'Y', '2026-08-18', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ea264e06-170b-5d0b-8994-1a06f02745f2', 30, (select id from members where name = '이진수'), '2026-08-17', 'Existing', '새롬정보', '오시현', '2026-08-18', '초도 미팅, 요구사항 확인', 'Y', '2026-08-18', '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('4b800560-0944-53fb-8bd8-b5e19eb1ded8', 31, (select id from members where name = '민경윤'), '2026-08-17', 'Net New', '온누리항공', '임채원', '2026-08-17', '초도 미팅, 요구사항 확인', 'Y', '2026-08-21', '이진수, 전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('6615e7fc-3650-5e8a-993b-59712e3dbf5b', 32, (select id from members where name = '이진수'), '2026-08-17', 'Net New', '달빛커머스', '', '2026-08-21', '시장 동향 공유', 'Y', '2026-08-21', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ad46ba42-e1db-527f-8bcf-3ef9cce84807', 33, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '하늘담운수', '신다온', '2026-08-18', '상담 화면 통합 협의', 'Y', '2026-08-18', '이진수, 전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('513577f7-e33f-5a8e-8d7d-3112d6337544', 34, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '초록마트', '', '2026-08-17', '시장 동향 공유', 'Y', '2026-08-22', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('dc43756c-9b0d-598c-a268-911675af8fde', 35, (select id from members where name = '류해원'), '2026-08-17', 'Net New', '우듬지리테일', '한수아', '2026-08-20', '워크샵 참가 여부 확인', 'Y', '2026-08-24', '류해원', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('72cfef6f-e884-56d2-a70c-1ba0f604b98f', 36, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '새롬정보', '오시현', '2026-08-24', '초도 미팅, 요구사항 확인', 'Y', '2026-08-24', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a5e8008f-0d50-536d-9866-6e378282f4bb', 37, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '한결에너지', '', '2026-08-26', '차세대 진행 일정 확인', 'Y', '2026-09-01', '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b10aca22-3a8b-5582-b7bd-9d25950780f0', 38, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '온누리항공', '윤지호', '2026-08-26', '워크샵 참가 여부 확인', 'Y', '2026-08-26', '이진수, 전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1f068fed-9deb-5ace-bbe5-e5af29c2d45b', 39, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '두레캐피탈', '배준영', '2026-08-25', '견적 협의 및 데모', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e89e1c51-ba6c-57ae-883e-97ac6a14e58b', 40, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '큰들BPO', '', '2026-08-26', '차세대 진행 일정 확인', 'N', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d284eb65-46b6-5bd3-a904-f91019b40c71', 41, (select id from members where name = '민경윤'), '2026-08-24', 'Existing', '나래물류', '', '2026-08-24', '차세대 진행 일정 확인', 'Y', '2026-08-27', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e2b17f10-d463-55bd-8f10-7faf824ff8b8', 42, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '고운손해보험', '오시현', '2026-08-26', 'AICC 도입 계획 체크', 'Y', '2026-08-26', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('080a4fb7-6372-5275-8233-a2acb98038e2', 43, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '마루정보통신', '', '2026-08-24', '진행 사항 점검', 'Y', '2026-08-24', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('324d2b1e-d69f-580f-bee2-dbb68a7d844b', 44, (select id from members where name = '류해원'), '2026-08-24', 'Net New', '온누리항공', '임채원', '2026-08-28', '진행 사항 점검', 'Y', '2026-08-28', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('663f2ed9-fe8f-5696-941c-f19f18b38c0d', 45, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '한결에너지', '박지우', '2026-08-28', '상담 화면 통합 협의', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('72d8aa7d-3d08-5254-87d3-c0b3a5887edd', 46, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '슬기로운여행', '', '2026-08-24', '진행 사항 점검', 'Y', '2026-08-24', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('143ec067-3241-5ece-9bb8-297ee8d970a4', 47, (select id from members where name = '민경윤'), '2026-08-24', 'Existing', '고운손해보험', '', '2026-08-25', '시장 동향 공유', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7496dbda-33f5-5cfb-88c1-b7d07c17c285', 48, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '이음테크', '', '2026-08-25', '협업 가능 여부 파악', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('13469735-7312-589b-b9bb-8e35859bb53d', 49, (select id from members where name = '민경윤'), '2026-08-31', 'Net New', '터전홀딩스', '', '2026-09-02', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-02', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1b94f39b-e868-5f94-80b6-3e1baa0d74fb', 50, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '밝음저축은행', '', '2026-09-01', '시장 동향 공유', 'Y', '2026-09-01', '류해원', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b73ad181-c3b9-55cd-bb07-adbc929b3256', 51, (select id from members where name = '류해원'), '2026-08-31', 'Existing', '큰들BPO', '문가람', '2026-08-31', '차세대 진행 일정 확인', 'Y', '2026-08-31', '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a4dd2031-e08c-5885-81b8-d28ea0c1104b', 52, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '두레캐피탈', '', '2026-09-03', '시장 동향 공유', 'N', null, '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5ba464ba-73a0-5ef3-b873-7c146a16ec0a', 53, (select id from members where name = '이진수'), '2026-08-31', 'Existing', '정다운은행', '최민재', '2026-08-31', '시장 동향 공유', 'Y', '2026-08-31', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e2af2120-ef10-5285-be22-f30390f1a147', 54, (select id from members where name = '민경윤'), '2026-08-31', 'Existing', '하늘담운수', '신다온', '2026-09-02', '초도 미팅, 요구사항 확인', 'Y', '2026-09-02', '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('805ecfc5-7ca7-5548-994c-7a60483ca8e9', 55, (select id from members where name = '류해원'), '2026-08-31', 'Net New', '한빛생명', '', '2026-09-03', '초도 미팅, 요구사항 확인', 'Y', '2026-09-03', '이진수, 전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('45803637-3a2c-5561-a633-79d6cb6bb9a8', 56, (select id from members where name = '류해원'), '2026-08-31', 'Net New', '한결에너지', '이서준', '2026-09-01', '진행 사항 점검', 'Y', '2026-09-05', '전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d2a23ad0-1c7c-570c-be07-006d58b50caa', 57, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '빛나컴퍼니', '박지우', '2026-08-31', 'AICC 도입 계획 체크', 'Y', '2026-08-31', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7c2042ff-d279-57b3-ae53-4c5fd9e007b8', 58, (select id from members where name = '이진수'), '2026-08-31', 'Existing', '우듬지리테일', '정예린', '2026-09-02', '견적 협의 및 데모', 'N', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8e94ebf1-7084-5310-86f8-b63fe2080a29', 59, (select id from members where name = '민경윤'), '2026-08-31', 'Existing', '두레캐피탈', '오시현', '2026-09-02', '협업 가능 여부 파악', 'Y', '2026-09-02', '전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5cd3ddfe-072d-5fa2-83af-d84f369a0cde', 60, (select id from members where name = '민경윤'), '2026-08-31', 'Net New', '고운손해보험', '', '2026-09-01', '제품 소개 및 고객사 현황 파악', 'N', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('13f5bad6-b659-5e0d-9dda-186f2fe8e0fa', 61, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '다올물류', '윤지호', '2026-09-08', '콜봇 개발 관련 협의', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('da1005a0-e670-58c7-bdec-19d60439d049', 62, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '한빛생명', '김하늘', '2026-09-10', '시장 동향 공유', 'Y', '2026-09-15', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('fbb3962a-c6d1-5eee-a603-765e7f107274', 63, (select id from members where name = '민경윤'), '2026-09-07', 'Net New', '너울테크', '', '2026-09-08', '워크샵 참가 여부 확인', 'Y', '2026-09-08', '류해원', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e960445a-5b10-5eaf-9dc8-aec7ac9e2106', 64, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '청람증권', '신다온', '2026-09-08', '시장 동향 공유', 'Y', '2026-09-13', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('0bded900-114c-5a93-a407-ef8701aa48e4', 65, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '하늘담운수', '', '2026-09-10', '초도 미팅, 요구사항 확인', 'Y', '2026-09-10', '전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('018bf34b-f80a-59f7-9415-cb321b1dba3e', 66, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '별빛여행', '', '2026-09-09', '워크샵 참가 여부 확인', 'Y', '2026-09-09', '전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('9e93a810-95ec-54ea-a2de-60cb736bfeeb', 67, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '큰들BPO', '조서윤', '2026-09-07', '협업 가능 여부 파악', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f7feb292-41a2-5624-b91f-6c9ad06d611c', 68, (select id from members where name = '민경윤'), '2026-09-07', 'Existing', '푸른여객', '', '2026-09-11', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-11', '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('67bad811-db21-52c4-96fb-2a962ad61298', 69, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '나래물류', '강도윤', '2026-09-07', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-07', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a0026480-27db-5670-9e64-c2c685a1c65c', 70, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '다올물류', '', '2026-09-09', '차세대 진행 일정 확인', 'Y', '2026-09-09', '전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('2d7a9518-a6e6-5d89-96ac-7469e91f2f12', 71, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '소담스토어', '', '2026-09-09', '유지보수 협의', 'Y', '2026-09-09', '류해원', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('437a0ddc-107e-5399-b6b9-76033b394cc3', 72, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '고운손해보험', '', '2026-09-09', '차세대 진행 일정 확인', 'Y', '2026-09-13', '이진수, 전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('0b50afad-d968-52f3-b0d0-7c05f4e6b398', 73, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '너울테크', '', '2026-09-11', '콜봇 개발 관련 협의', 'Y', '2026-09-16', '류해원', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ac6aeeed-8d9b-5bb1-9cbe-f80184e7b7d3', 74, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '이음테크', '조서윤', '2026-09-16', '시장 동향 공유', '', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8fac81eb-db20-5022-bd82-39219f9f8aa5', 75, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '미래로카드', '', '2026-09-14', '협업 가능 여부 파악', 'N', null, '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3912a9a4-8075-5d2e-8232-8e0b89fd1655', 76, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '우듬지리테일', '', '2026-09-18', 'AICC 도입 계획 체크', 'Y', '2026-09-23', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('977467fa-2f64-56a7-bd0a-4a8266aa7501', 77, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '가온손해보험', '최민재', '2026-09-16', '견적 협의 및 데모', '', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7452a663-406f-5a2e-bbd9-7e2e4dead478', 78, (select id from members where name = '이진수'), '2026-09-14', 'Existing', '큰들BPO', '신다온', '2026-09-16', 'AICC 도입 계획 체크', '', null, '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('adfad7ae-5912-5c94-bd3c-b7cbfaf1a0af', 79, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '고운손해보험', '문가람', '2026-09-17', '상담 화면 통합 협의', 'Y', '2026-09-23', '류해원', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1c9ef745-c481-5750-b967-9fda4b585295', 80, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '한결에너지', '오시현', '2026-09-17', '차세대 진행 일정 확인', 'Y', '2026-09-17', '류해원', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f6078ec7-a750-5443-8ab3-ed544be61831', 81, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '너울테크', '', '2026-09-18', '초도 미팅, 요구사항 확인', '', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('c38278ff-4e00-54b9-bd21-15e1788cc9b4', 82, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '바로콜', '강도윤', '2026-09-15', '유지보수 협의', '', null, '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('9695a352-4ff3-5b9d-9db7-08ca00dedee0', 83, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '하늘담운수', '', '2026-09-15', '워크샵 참가 여부 확인', 'Y', '2026-09-15', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b701f4f6-69eb-59c2-940c-8e48371d4967', 84, (select id from members where name = '민경윤'), '2026-09-14', 'Existing', '새롬정보', '', '2026-09-17', '초도 미팅, 요구사항 확인', '', null, '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('830fe1a1-feab-583e-b9b4-e0fa420f41cf', 85, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '새롬정보', '', '2026-09-16', '워크샵 참가 여부 확인', '', null, '이진수, 전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d8f381d4-be3e-5704-86be-8ecc20b6e71c', 86, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '미래로카드', '', '2026-09-18', '시장 동향 공유', 'Y', '2026-09-18', '전병수', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('4d87c519-892c-59ce-b108-fecdbef1bf9e', 87, (select id from members where name = '류해원'), '2026-09-14', 'Net New', '정다운은행', '', '2026-09-17', '워크샵 참가 여부 확인', '', null, '류해원', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('232f4f28-dfa9-5f47-a678-f08a244f32da', 88, (select id from members where name = '류해원'), '2026-09-14', 'Existing', '정다운은행', '', '2026-09-14', '시장 동향 공유', 'N', null, '', '');

commit;

