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
insert into members (id, email, name, part, role, is_admin, sort_order) values ('6866ecf9-1ab7-5a83-9c92-2649ee27fb99', 'kang.minjun@example.com', '강민준', null, '최고 리더', true, 10) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('3e7d0cce-18c3-595c-a11d-b6b75359d9ba', 'seo.jiwoo@example.com', '서지우', 'Sales', 'Biz 리더', true, 20) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('ceb72f0d-0af1-5097-876f-f8b3ce9aa1e5', 'park.hayoon@example.com', '박하윤', 'AICC', '솔루션 리더', true, 30) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('3d672815-bf04-55b8-ad3f-7ba68cbe1b78', 'jung.dohyun@example.com', '정도현', 'Sales', 'Sales', false, 40) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('892e19c8-d99c-5f64-8d0b-f0051bcbf5a1', 'choi.seoa@example.com', '최서아', 'Sales', 'PreSales', false, 50) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('224702b9-da24-5e80-9a08-666a0fc66251', 'yoon.gunwoo@example.com', '윤건우', 'AICC', 'PM', true, 60) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('3c2feb15-2696-5a07-b603-203b88b18be1', 'im.chaerin@example.com', '임채린', 'AICC', 'SA', false, 70) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('4d328b44-948a-5383-ba11-e8a6dc17a979', 'oh.siwoo@example.com', '오시우', 'AICC', 'SA', false, 80) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('4ba85010-2d2a-50e3-8210-1a347ba70b73', 'han.yerin@example.com', '한예린', 'AICC', 'SA', false, 90) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('de02961c-d3e2-5419-b4f3-86a820ba59dd', 'shin.taehyun@example.com', '신태현', 'AICC', 'SA', false, 100) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('e1d6ff3a-7b6b-57b1-a919-98d563ebd88a', 'bae.sua@example.com', '배수아', 'Development', '개발', false, 110) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('09d802bb-0614-546f-867d-28eda13c5c40', 'moon.jiho@example.com', '문지호', 'Development', '개발', false, 120) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('c28a7248-51ef-5e74-973f-13aba69da6e2', 'jo.eungyeol@example.com', '조은결', 'Development', '개발', false, 130) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('5a01dbec-f53c-5127-878a-6c8dab9b7c08', 'kwon.nayoon@example.com', '권나윤', 'Development', '개발', false, 140) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('8c874142-26a2-524b-bf99-c7f693fc7215', 'hwang.doyoon@example.com', '황도윤', 'Development', '기획', false, 150) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('fc094f1c-921e-503e-af1e-232bb6eec10f', 'ahn.soyul@example.com', '안소율', 'Development', '디자인', true, 160) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('f755746d-a3a1-58f8-997f-c8badc6ac142', 'nam.junseo@example.com', '남준서', null, null, false, 170) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('6e2522ce-22ae-5952-a15a-584881da3325', 'yoo.haram@example.com', '유하람', null, null, false, 180) on conflict (email) do nothing;
insert into members (id, email, name, part, role, is_admin, sort_order) values ('95019cc8-0030-52d6-b07a-04004b4b4dcc', 'go.ain@example.com', '고아인', null, null, false, 190) on conflict (email) do nothing;

-- ---------- Ground Rule ----------
insert into ground_rules (sort_order, body) values (10, '문서와 업무 방향성은 최종본으로 보고하지 말고, 초안부터 공유하며 맞춰 나간다.');
insert into ground_rules (sort_order, body) values (20, '외부에 나가는 문서(견적서, 제안서)는 제출 하루 전에 confirm 을 받고 진행한다.');
insert into ground_rules (sort_order, body) values (30, '회의는 사전에 이슈를 공유하고, 최소 인원으로 그 자리에서 종결시킨다.');
insert into ground_rules (sort_order, body) values (40, '모든 업무에 Target Date 를 정하고, 그 전에 자료를 공유한다.');
insert into ground_rules (sort_order, body) values (50, '고객에게 가는 문서는 우리가 하고 싶은 말이 아니라 고객 요구사항을 기준으로 쓴다.');
insert into ground_rules (sort_order, body) values (60, '기다리지 말고 한 번이라도 더 만나서 우리가 줄 수 있는 가치를 설득한다.');
insert into ground_rules (sort_order, body) values (70, '막히면 혼자 붙들지 말고 이슈로 올린다. 빨리 드러낼수록 싸게 해결된다.');

-- ---------- 프로젝트 ----------
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '0f5b9032-220f-5644-95fb-9c2294c03260', 'Relay Console 개발 P1-2', '프로젝트', (select id from members where name = '윤건우'), '2026-07-06', '2026-12-31', 10 where not exists (select 1 from projects where name = 'Relay Console 개발 P1-2');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '2981885f-3774-5165-bb68-ab14cd693aae', '한빛생명 장기 TM 시스템 고도화 분석/설계 사업', '프로젝트', (select id from members where name = '박하윤'), '2026-07-13', '2026-11-30', 20 where not exists (select 1 from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '2d689775-11af-52d4-ac96-9eabf33d37bd', '나래물류 Data Platform 장애대응 포탈 구축', '프로젝트', (select id from members where name = '문지호'), '2026-07-13', '2026-10-30', 30 where not exists (select 1 from projects where name = '나래물류 Data Platform 장애대응 포탈 구축');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'c91cbd7a-c52a-5cb7-b0fa-ead58c5b026e', '해든쇼핑 AICC 유지보수', '유지보수', (select id from members where name = '임채린'), '2026-08-10', '2026-10-09', 40 where not exists (select 1 from projects where name = '해든쇼핑 AICC 유지보수');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'ab129050-5a5a-5762-a02e-af71c7c4405e', '고객서비스 포털 및 컨택센터 운영 관리(GCC)', '유지보수', (select id from members where name = '안소율'), '2026-04-01', '2026-12-31', 50 where not exists (select 1 from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '9eee2d2c-45e9-57e6-8787-5518de2babf2', '정다운은행 상담챗봇', '유지보수', (select id from members where name = '배수아'), '2025-09-01', '2026-08-31', 60 where not exists (select 1 from projects where name = '정다운은행 상담챗봇');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'd849750d-7517-5469-986e-ca9c9e3c1736', '큰들체육회 상담챗봇', '유지보수', (select id from members where name = '배수아'), null, null, 70 where not exists (select 1 from projects where name = '큰들체육회 상담챗봇');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select '277a7bb0-c1e5-5325-852b-d78e68cae115', '초록마트 Relay Console 소개', 'Demo', (select id from members where name = '정도현'), null, null, 80 where not exists (select 1 from projects where name = '초록마트 Relay Console 소개');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'dc4059f3-4a7e-531e-a920-8b5027e6b40a', 'AICC Hands-on Workshop', '행사', (select id from members where name = '서지우'), null, null, 90 where not exists (select 1 from projects where name = 'AICC Hands-on Workshop');
insert into projects (id, name, kind, owner_id, start_date, end_date, sort_order) select 'd46e4f71-a6d4-5f8c-8e0f-d1012164e87e', 'Cloud Contact Center Competency', '문서작성', (select id from members where name = '황도윤'), null, null, 100 where not exists (select 1 from projects where name = 'Cloud Contact Center Competency');

-- ---------- 투입 인력 ----------
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '배수아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '안소율' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '윤건우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '조은결' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Relay Console 개발 P1-2' and m.name = '황도윤' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업' and m.name = '박하윤' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '나래물류 Data Platform 장애대응 포탈 구축' and m.name = '권나윤' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '나래물류 Data Platform 장애대응 포탈 구축' and m.name = '문지호' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '해든쇼핑 AICC 유지보수' and m.name = '임채린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '배수아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '안소율' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '윤건우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)' and m.name = '조은결' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '정다운은행 상담챗봇' and m.name = '배수아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '큰들체육회 상담챗봇' and m.name = '배수아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '배수아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '신태현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '정도현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = '초록마트 Relay Console 소개' and m.name = '한예린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '서지우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '신태현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '오시우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '임채린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '정도현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '최서아' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'AICC Hands-on Workshop' and m.name = '한예린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '신태현' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '오시우' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '임채린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '한예린' on conflict do nothing;
insert into project_members (project_id, member_id) select p.id, m.id from projects p, members m where p.name = 'Cloud Contact Center Competency' and m.name = '황도윤' on conflict do nothing;

-- ---------- 주간보고 ----------
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7c6dbbe6-17f6-5121-b5b5-38af43382157', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/25)
 : 3열 레이아웃 전환, 상단바 정돈(8/27)
 : 다크 모드 토큰 정리', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ef1df24b-0e5c-5991-8f88-968b1010ed2e', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2e94652a-a446-57be-8dc2-e911c2a52ad8', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9382aac1-4af7-529e-b756-b640f77e0f21', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/26)
 : 상담 이력 화면 와이어프레임(8/28)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'a55bd9ce-4de5-5f44-9051-48694207c8d6', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/31)
 : 상담 이력 화면 와이어프레임(9/4)', '', '' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd9bc4cfc-24e6-5d55-85b5-328b907cf6e6', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/9)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f1553ec0-5b52-5601-875b-3e7f76e75799', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'f79910ce-7534-5791-aa71-dfbe67199875', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(8/31)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/3)
 : 알림 센터 기능 개발(8/31)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '50a38579-4743-53c0-b15b-73e1884f4ae1', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '358913c2-a26f-5f55-b58d-685e56f38cec', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/16)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/17)
 : 알림 센터 기능 개발(9/16)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '56ae0f9b-417b-50c6-99a5-d6db3cdcd0e5', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ca3f0730-f792-5c80-9b87-9128f72fc986', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bd4d7ff9-8b41-5162-baa0-d3e67283acb9', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/9)
 : 상담 이력 화면 와이어프레임(9/11)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e5ae79dd-8a26-54d5-a0f0-e171f3c15d5a', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 워크플로우 자동화 개발(9/14)
- 단위 테스트 보강
- 정적 분석 경고 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9745fbe9-c9ef-5c11-bebc-bc4d3e9069be', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/26)
 : 3열 레이아웃 전환, 상단바 정돈(8/28)
 : 다크 모드 토큰 정리', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7e374d96-2f9f-5a0f-ab98-8cc0a90ccb99', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '982e447e-ac4a-5dae-9585-19c798912d54', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd268c22c-b6bc-5ad5-813f-07465759259c', m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/15)
 : 상담 이력 화면 와이어프레임(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '440a2978-f902-54e5-8dc0-8a997df44dbd', m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-08-31', '- 분석 단계 산출물 고객 검토 및 보완(9/3)
- 설계 단계 산출물 작성 내부 리뷰
- 이슈 · 리스크 관리
- 고객 요구사항 대응', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '박하윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c85c9167-8779-5f3a-9d70-4a227482fe3f', m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-09-07', '- 요구사항 정의서 내부 검토 및 고객 전달 준비(9/9)
- 화면 시안 리뷰
  > 내부 리뷰 2차(9/9)
  > 현업 설명 및 확정(9/10)
- 시스템 아키텍처 분석(9/10)', '', '' from members m where m.name = '박하윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2c3ef2f3-3494-5060-8be4-3e4f934f54f1', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '권나윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '90111c92-7691-5880-928c-2ccc1f99e93d', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/4)
- 일괄 재실행 설정 화면 정리', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '권나윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '53104cfb-4bd0-53c9-b1c9-87f2a2f1afbc', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/10)
- 일괄 재실행 설정 화면 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '권나윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5ebf9fd6-d3a1-56fb-b9af-eef6aa557206', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/17)
- 일괄 재실행 설정 화면 정리', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '권나윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9b318cb4-43ec-5cd7-9385-9585025b07b5', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '', '' from members m where m.name = '문지호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '18c9c6ed-df63-5ced-a48c-25f9990e7d5a', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/31)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '문지호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9eeb3252-3a26-5bd6-bd5b-6596f4be813a', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/10)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '문지호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '3ac3fa62-a205-521a-a28a-232bde0a9f03', m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/18)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '' from members m where m.name = '문지호';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e05b3817-5627-5e17-a687-bb9c23db6463', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-24', '- 고도화 요구사항 인터뷰 2차(8/25)
- 공수 산정 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c7b983cc-2dc7-5558-9ac1-5ff3ec4839cc', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-31', '- 고도화 요건 분석(9/1)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '35f9f7b9-c476-5507-be38-375e17e79647', m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-09-07', '- 고도화 요건 분석(9/9)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/10)', '', '' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '77f35117-fd52-570a-af46-9bd2c2784868', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/24 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4ba8f974-4b82-5f72-a0e6-83a385eed88b', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/1)
- 리드 데이터 연동 확장 미팅(9/4)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'c151c1f9-a03c-5f10-a85f-e18f7bbab8c5', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 검색 기능 운영 서버 이전(9/9 ~ 9/11)
- 프론트 테마 테스트 환경 구성', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cade18e8-3c29-595f-bf68-d71a77224982', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- 검색 기능 운영 서버 이전(9/16 ~ 9/17)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '0a2cdb9e-18c7-5cc3-9515-ab08171890cb', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/26 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6954a985-126c-5494-bb32-37b1568141d2', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ff0ec657-43bf-5b54-9458-2f598d253772', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/18)', '' from members m where m.name = '안소율';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '8c3ff6cd-03fc-5b57-b948-90388614bc7f', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/2)
- 리드 데이터 연동 확장 미팅(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ddf04929-58a6-5f9f-95cc-e7d3e536c823', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 리소스 · 접속 통계 보고서 상신(9/9)
- 리드 데이터 연동 확장 미팅(9/10)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7d7f7918-054f-5487-82f0-1279c943782b', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '윤건우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e6c391bb-4e52-5910-8003-b5846d896c79', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '21883a39-03fc-5966-a7f9-ede4932863c8', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 검색 기능 운영 서버 이전(8/31 ~ 9/4)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1e8c4a95-3f2d-5852-a3f8-63a69091bb71', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '46642206-d2e9-5e5d-b3df-f7737e9fbb9e', m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '조은결';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5b45f4a7-6559-5d30-aad9-19908b8f4e86', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-08-24', '- 삭제 배치 테스트 및 작업계획서 전달(8/28)
- 월 정기 점검', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9031f5ee-0e01-570f-9dd8-d14739d2eb25', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-07', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/8)
 : 정기 점검 때 함께 반영 예정', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd337038e-ab08-5110-bafb-916fe9748de4', m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-14', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/15)
 : 정기 점검 때 함께 반영 예정', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'a369a963-3854-5b08-9ad4-167dcd4fc307', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-24', '- 월 정기 점검(8/26)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e4ed775a-32ae-5740-a110-b90e4d08918d', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-31', '- 월 정기 점검(9/2)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9960bd6e-6faa-590a-a33b-041ef3754b30', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-07', '- 월 정기 점검(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bad51852-6444-505d-8c14-d39dce2a442e', m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-14', '- 월 정기 점검(9/14)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'a03dcc6c-72f3-5f16-a51e-c45e282ba66a', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '65ce21b0-9046-5974-8b6a-f588cb54943c', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '86885b33-f5a6-5d79-b9be-16b495bb951c', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '배수아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7f0a7fa7-8499-5e95-b3b1-a8e531bbaa2d', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/27)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '71f89d01-408c-5fa9-b86e-a8b4ed4a6a7a', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6e47215a-a2c0-5467-b4f6-1523fcf6ad19', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '175241f6-ddc3-537a-bd9b-fd1fefa11f27', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4a9ac727-72b8-51b9-9fa0-c152565a4957', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '57c33c66-6055-5c8a-a7a4-6996d33fe7bb', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5730dfcb-e3ed-509c-9aaa-a9efae2c5fd0', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/11)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '13d4d81b-b6be-5719-b97e-d66ad057043e', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/18)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'da8f639d-5714-500d-ab0b-e8ed73ec5b29', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1dd87d3a-bc54-5959-aaf4-4c75be6d9220', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2dbc7dd4-4795-5f62-8afd-aae31cf41d32', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '564a35c7-c0f3-54b6-95fe-e10661f2b154', m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '6a680463-77e4-5d1d-8415-f8519c4dcb5b', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '서지우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7fc32aaf-8689-5950-bf44-954807f5b5e8', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '서지우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ce279fc8-b71f-5959-a681-e6df692622de', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '서지우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7bb23645-b4bc-5bbc-9475-f6d86f7fa837', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/27)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7cfee11d-f713-52ad-8cd2-a895efb0ee36', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/3)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2d0f3d41-0af9-59a1-b46e-c00323043849', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'cddb9fe0-fa0f-5297-b857-85205a5bf483', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2e4e479c-70ca-529b-8e76-9515fbb699b0', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/28)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4ff3e0a0-930a-52f3-887a-bf5ce98f3b08', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2c321def-fedc-5847-ae51-30a01be98c6c', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9df11628-74a4-564e-9d05-66a3f641faf8', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'fcc41583-725a-5c1c-8b44-2e0c0adf9be3', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '4f3f06d8-a7fd-5ae1-9560-798318f9edc0', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e03517fa-b2ff-5416-a9b6-04d9d074f360', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '20d06ec0-35e1-5e8d-8950-4f1aff9ee036', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bc53fff4-715c-5c63-840f-0c6d24e00066', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '정도현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e3cf58ca-b748-5c80-9d77-d5da50fd97ee', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/25)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '최서아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bc9a3c78-6d98-52b7-8e09-56339a456b1c', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '최서아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '149ad7f2-084c-5e30-9cf3-591ae4d5e9e0', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/7)
 : 발표 자료 정리
 : 데모 환경 구축', '', '' from members m where m.name = '최서아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e533b215-4491-5ec7-8ef2-6dc1e33ff752', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '최서아';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e000f514-359d-5608-9fb2-e64e39ed06a7', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '19295f9a-6fb4-5e5e-9a2e-14d8cf41433c', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '7090f9f7-0945-5c92-98ab-6e89dd27ec05', m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e0167edd-79f2-5e60-910b-7b9894376f54', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '654dac43-7cf5-5f57-8e94-b0ab294b2dd8', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'fd75ed55-8e3a-51b7-aa4c-3a0b173caf0c', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e82bacf4-d31e-543b-9b09-7e53b607b3c4', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '93083eb3-567d-54fa-913d-c0cac48a97d4', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e4811156-267d-5bc1-b555-d53fa651bcbb', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'e5d302f9-98f3-5acf-a854-72add3f90776', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '임채린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '5cb3e1a9-674b-521e-971d-4ff484a51a88', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'df44b1d1-a6d2-5f3b-bb77-43b613ee2b0c', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'abc004af-e8b9-5c60-8eea-1a390d3583f3', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/17)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'bb71b523-7681-5197-8571-5538fd6109bf', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/27)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1230cba6-15d8-5e47-a1b8-5fa9bfa147b1', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '2e711fcc-f150-5e11-b4a3-017ef7336132', m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '황도윤';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '27a4a915-1402-5045-a0d6-22edaed53477', m.id, null, '2026-08-24', '- 발표 자료 작성(8/24)
- 데모 영상 편집(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'fa075aa7-75e0-50db-8aa8-e841afb5d3c5', m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '1a18e896-1916-5e64-a0e2-303d63213b34', m.id, null, '2026-09-07', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '한예린';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '15831460-9829-55f7-b957-81e6f707ba5a', m.id, null, '2026-08-24', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ed7c75a9-b2d2-5b5f-accf-af8e6d217ad3', m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'd6573c1d-0d98-515a-af6b-e7a48faae27f', m.id, null, '2026-09-07', '- 발표 자료 작성(9/9)
- 데모 영상 편집(9/10)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '82c94025-e8ca-55dd-90fc-4a9e78e0d44a', m.id, null, '2026-09-14', '- 발표 자료 작성(9/15)
- 데모 영상 편집(9/18)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '오시우';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select 'ca058a89-8acb-5a3e-b7e3-7d28dd0a2d42', m.id, null, '2026-08-31', '- 발표 자료 작성(9/2)
- 데모 영상 편집(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '신태현';
insert into weekly_reports (id, member_id, project_id, week_start, this_week, next_week, issues) select '9329910a-4a84-56bf-83f2-ae741bb95c4f', m.id, null, '2026-09-14', '- 발표 자료 작성(9/14)
- 데모 영상 편집(9/17)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '신태현';

-- ---------- Action Tracker ----------
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('e8396645-737c-5430-8810-3937e3f0a919', 1, 'Tech', '큰들BPO', '계약 조건 검토', (select id from members where name = '윤건우'), '50.Close', '9/10 1차 검토 완료. 보완 사항 정리 중', '2026-09-08', '2026-10-08', '2026-10-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ac57c418-100e-5f51-a086-b8ee2a5a0f4e', 2, 'Sales', '소담스토어', '워크샵 일정 수립', (select id from members where name = '안소율'), '50.Close', '', '2026-08-05', '2026-08-12', '2026-08-08', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1692b4b9-cae7-5d12-aa0b-73b856907acb', 3, 'Sales', '두레캐피탈', '고객사 담당자 재확인', (select id from members where name = '임채린'), '20.진행중', '8/7 1차 검토 완료. 보완 사항 정리 중', '2026-08-05', '2026-09-10', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1652bad9-dfd6-5be3-a9ed-f3fede15b4eb', 4, 'Sales', '마루정보통신', '견적 초안 작성 및 내부 검토', (select id from members where name = '오시우'), '50.Close', '9/8 1차 검토 완료. 보완 사항 정리 중', '2026-09-06', '2026-09-13', '2026-09-14', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('3c8bbf67-5894-5bcc-8374-05003a63dcd2', 5, 'Sales', '다올물류', '고객사 담당자 재확인', (select id from members where name = '남준서'), '50.Close', '7/31 1차 검토 완료. 보완 사항 정리 중', '2026-07-29', '2026-08-05', '2026-08-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('5f49cb7e-f509-5b87-b48b-91338cb1a0f3', 6, 'Sales', '푸른여객', '경쟁사 동향 정리', (select id from members where name = '남준서'), '20.진행중', '', '2026-08-23', '2026-08-23', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('94239715-8e3c-505d-b7da-fa6369627771', 7, 'Tech', '고운손해보험', '협업 가능 여부 결과 보고', (select id from members where name = '서지우'), '50.Close', '8/31 고객 전달 완료
9/4 회신 대기', '2026-08-29', '2026-09-28', '2026-10-01', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('567d7d65-ef9b-5198-9c3f-4e9f498dddcf', 8, 'Tech', '새롬정보', '유지보수 범위 협의', (select id from members where name = '박하윤'), '50.Close', '8/4 1차 검토 완료. 보완 사항 정리 중', '2026-08-02', '2026-08-23', '2026-08-22', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('c335cb32-98cc-55ad-9f33-f0b88b38701d', 9, 'ALL', '달빛커머스', '오퍼링 자료 최신화', (select id from members where name = '안소율'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-09-25', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1e296b3c-2806-5fb5-bb77-827dac8d7842', 10, 'Sales', '이음테크', '오퍼링 자료 최신화', (select id from members where name = '서지우'), '20.진행중', '', '2026-07-17', '2026-09-21', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ba6deaa2-12c3-50c8-8b02-d166178fc66d', 11, 'ALL', '한빛생명', '사전조사 양식 전달', (select id from members where name = '오시우'), '50.Close', '7/4 내부 리뷰 진행. 다음 주 재논의', '2026-07-02', '2026-07-12', '2026-07-16', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('5f1856d2-b785-563e-9317-a010c955453a', 12, 'Sales', '우듬지리테일', '차세대 일정 확인', (select id from members where name = '유하람'), '99.Drop', '8/23 고객 전달 완료
8/27 회신 대기', '2026-08-21', '2026-09-04', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('68baa1c3-dbae-57a0-9f3b-c911200f7f94', 13, 'Tech', '큰들BPO', '협업 가능 여부 결과 보고', (select id from members where name = '조은결'), '20.진행중', '8/9 1차 검토 완료. 보완 사항 정리 중', '2026-08-07', '2026-09-13', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('53367df3-d8dc-5114-801b-f891b39b1ba5', 14, 'Tech', '하늘담운수', '견적 초안 작성 및 내부 검토', (select id from members where name = '한예린'), '20.진행중', '', '2026-07-30', '2026-08-29', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('f7443dc5-10b6-5b5b-91c2-0d845930bdc9', 15, 'Tech', '두레캐피탈', '계약 조건 검토', (select id from members where name = '조은결'), '99.Drop', '', '2026-09-08', '2026-09-18', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ac63ba09-9204-5228-b787-aaf1c02cd0bb', 16, 'ALL', '우듬지리테일', '경쟁사 동향 정리', (select id from members where name = '정도현'), '20.진행중', '8/17 1차 검토 완료. 보완 사항 정리 중', '2026-08-15', '2026-08-18', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('05a8514a-df1d-57d6-ae29-cfe6435a8a50', 17, 'Tech', '고운손해보험', '사전조사 양식 전달', (select id from members where name = '황도윤'), '50.Close', '', '2026-08-16', '2026-09-06', '2026-09-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('b77a5df4-e4f3-52b9-9e13-0629f60c6812', 18, 'Sales', '초록마트', '견적 초안 작성 및 내부 검토', (select id from members where name = '황도윤'), '99.Drop', '', '2026-08-08', '2026-09-07', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('ec9d5f37-9b4b-52ca-93bb-078f7bfcc2e6', 19, 'Tech', '빛나컴퍼니', '워크샵 일정 수립', (select id from members where name = '신태현'), '10.대기', '', '2026-08-04', '2026-08-25', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('4a0fea4c-946d-51ae-ab91-3887d4abb454', 20, 'Sales', '미래로카드', '운영 이관 계획 수립', (select id from members where name = '권나윤'), '20.진행중', '9/5 1차 검토 완료. 보완 사항 정리 중', '2026-09-03', '2026-09-26', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('eb76e81e-bb95-5831-9f4b-52fbd090329a', 21, 'ALL', '두레캐피탈', '오퍼링 자료 최신화', (select id from members where name = '고아인'), '50.Close', '', '2026-07-03', '2026-07-10', '2026-07-13', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('50965fea-3a1f-5566-baec-2fe074610348', 22, 'Sales', null, '오퍼링 자료 최신화', (select id from members where name = '황도윤'), '50.Close', '9/13 1차 검토 완료. 보완 사항 정리 중', '2026-09-11', '2026-09-21', '2026-09-26', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('886af624-f924-58f5-b43c-8350d6bd6400', 23, 'Sales', '청람증권', '워크샵 일정 수립', (select id from members where name = '황도윤'), '50.Close', '', '2026-07-29', '2026-08-28', '2026-08-25', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('d4cab019-d963-51d2-97d9-d3d3b3a6e10f', 24, 'Sales', '터전홀딩스', '오퍼링 자료 최신화', (select id from members where name = '안소율'), '50.Close', '', '2026-07-18', '2026-08-08', '2026-08-09', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('a1c85d8b-d6af-50ab-b193-07b12582bb30', 25, 'Sales', '온누리항공', '고객사 담당자 재확인', (select id from members where name = '최서아'), '10.대기', '', '2026-07-02', '2026-07-09', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('4cf0e329-1e07-527e-b020-2c8ad2c51ddf', 26, 'Sales', '별빛여행', '차세대 일정 확인', (select id from members where name = '서지우'), '50.Close', '', '2026-08-24', '2026-09-07', '2026-09-10', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('9215fbcc-5256-5ede-92d4-e205dda3bd08', 27, 'Sales', '소담스토어', '연동 규격 확인', (select id from members where name = '오시우'), '20.진행중', '', '2026-08-28', '2026-09-17', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('bce27130-639f-5569-97b8-83d935e327aa', 28, 'Sales', '한결에너지', '운영 이관 계획 수립', (select id from members where name = '정도현'), '50.Close', '8/23 1차 검토 완료. 보완 사항 정리 중', '2026-08-21', '2026-09-20', '2026-09-17', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('c680c9d1-878f-5a75-b5ed-588b7795f669', 29, 'Sales', '다올물류', '계약 조건 검토', (select id from members where name = '고아인'), '20.진행중', '9/12 내부 리뷰 진행. 다음 주 재논의', '2026-09-10', '2026-09-12', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('09a33c88-0341-53fe-b65c-45d6f834bf0d', 30, 'Sales', '터전홀딩스', '데모 환경 준비', (select id from members where name = '배수아'), '50.Close', '9/2 고객 전달 완료
9/6 회신 대기', '2026-08-31', '2026-09-07', '2026-09-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('3173309f-ca4c-53c0-92b5-eba198698e31', 31, 'Sales', '정다운은행', '워크샵 팔로우업', (select id from members where name = '임채린'), '50.Close', '8/20 내부 리뷰 진행. 다음 주 재논의', '2026-08-18', '2026-09-01', '2026-09-07', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('aadf0673-054c-59b0-94ee-f45c4a307b34', 32, 'Sales', '밝음저축은행', '오퍼링 자료 최신화', (select id from members where name = '강민준'), '50.Close', '', '2026-09-08', '2026-09-18', '2026-09-15', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('b0ce527c-dcfc-594d-95ce-bbf9b482773a', 33, 'ALL', '하늘담운수', '워크샵 팔로우업', (select id from members where name = '안소율'), '50.Close', '7/22 1차 검토 완료. 보완 사항 정리 중', '2026-07-20', '2026-07-25', '2026-07-26', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('64b0a724-ea20-5490-9ae8-69c3c6d21800', 34, 'Tech', '하늘담운수', '연동 규격 확인', (select id from members where name = '오시우'), '50.Close', '', '2026-08-27', '2026-09-10', '2026-09-12', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('fc7f5809-b69b-5102-af8c-4dca23cb497c', 35, 'Sales', '다올물류', '데모 환경 준비', (select id from members where name = '유하람'), '50.Close', '7/9 1차 검토 완료. 보완 사항 정리 중', '2026-07-07', '2026-07-21', '2026-07-22', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('1dc72200-cce1-5da9-9869-61ed3b751ead', 36, 'Sales', '초록마트', '사전조사 양식 전달', (select id from members where name = '오시우'), '99.Drop', '7/20 내부 리뷰 진행. 다음 주 재논의', '2026-07-18', '2026-07-28', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('be357549-ca9d-5c28-a57e-12a131b880c6', 37, 'Sales', '나래물류', '연동 규격 확인', (select id from members where name = '권나윤'), '20.진행중', '7/13 1차 검토 완료. 보완 사항 정리 중', '2026-07-11', '2026-09-29', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('037e2194-7dce-5d8d-bb08-2f01b26bc539', 38, 'Tech', '슬기로운여행', '견적 초안 작성 및 내부 검토', (select id from members where name = '신태현'), '10.대기', '9/13 내부 리뷰 진행. 다음 주 재논의', '2026-09-11', '2026-09-16', null, '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('2824526a-0fec-582a-bb05-03db5e9c5aac', 39, 'Sales', '달빛커머스', '사전조사 양식 전달', (select id from members where name = '황도윤'), '50.Close', '', '2026-09-07', '2026-09-28', '2026-10-03', '');
insert into action_items (id, seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values ('420a2d35-cec7-5152-b11c-f161a8ab969b', 40, 'Tech', '터전홀딩스', '경쟁사 동향 정리', (select id from members where name = '정도현'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-08-30', null, '');

-- ---------- Sales 파이프라인 ----------
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('921f7d94-5e88-5164-8041-2dedabad46ba', 1, 'Sales', '보류', 'AICC 차세대 구축 사업', '달빛커머스', '서지우', '', '임채원', '', '', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('642f402a-36bb-5ce0-bd6c-3ca1a6fc2c15', '921f7d94-5e88-5164-8041-2dedabad46ba', '2026-06-30', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('97aa170f-54cd-559c-ad81-29b0a433608b', 2, 'Sales', '진행중', '콜봇 도입', '바로콜', '최서아', '', '강도윤', '', '견적 산출 전 정보 수집 단계', '200석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60cce039-76e9-54e0-ad7b-558b814a4ff4', '97aa170f-54cd-559c-ad81-29b0a433608b', '2026-06-27', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정'),
  ('b9c6c33b-5207-568b-8cfb-459806140a70', '97aa170f-54cd-559c-ad81-29b0a433608b', '2026-07-09', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('8386c9b9-0bde-5e3a-a6d4-01a18abedd80', '97aa170f-54cd-559c-ad81-29b0a433608b', '2026-08-25', '- 일정 연기 요청
 : 다음 분기 재논의');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('998d3103-32cf-5025-81fa-6241ee5e583c', 3, 'Sales', '진행중', '유지보수', '빛나컴퍼니', '최서아', '', '배준영', '', '견적 산출 전 정보 수집 단계', '45석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('9996d70b-ec13-5350-973a-e23efa1261dd', '998d3103-32cf-5025-81fa-6241ee5e583c', '2026-07-16', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ('9c5525a1-8ea9-5c0c-9a3b-0e05f0c8ebb2', '998d3103-32cf-5025-81fa-6241ee5e583c', '2026-08-28', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('2f5db115-a19c-5a2e-b76d-f1a68464e9bb', '998d3103-32cf-5025-81fa-6241ee5e583c', '2026-09-08', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', 4, 'Sales', '보류', 'AICC 제안', '하늘담운수', '정도현', '', '윤지호', '', '', '30석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('c2b8f9dd-b3fc-5a26-8df2-3bfb659e6aec', '3bd2603f-8998-5c1b-80fc-bf59c8cfa3dc', '2026-08-16', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('7711dead-661b-551c-9d9a-be68c16508ef', 5, 'Sales', '진행중', 'AICC 제안', '이음테크', '정도현', '', '', '', '견적 산출 전 정보 수집 단계', '400석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('2f14786d-2fef-5cbf-90a6-0d9406b3091d', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-13', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('cdd6d205-95c1-5596-9117-2f4d8e1e9420', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-16', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ('28318be9-2f26-531b-be05-ff89baac3b70', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-07-31', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('0ba25821-62db-59e3-a0e2-7df1192e3bd6', '7711dead-661b-551c-9d9a-be68c16508ef', '2026-09-02', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('4d7f370a-df94-537b-8f38-fd9ce7fa9824', 6, 'Sales', '계약진행중', '콜봇 도입', '별빛여행', '서지우', '정예린', '강도윤', '2026.07.13 ~ 2026.11.30', 'PS : 5.96억', '60석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60a5c5bd-78fd-553e-82aa-ed98b5476657', '4d7f370a-df94-537b-8f38-fd9ce7fa9824', '2026-07-21', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('c3661fdb-6b69-5eb6-af03-9df7730c62df', 7, 'Sales', '홀딩', 'IPCC 구축 사업', '마루정보통신', '정도현', '최민재', '', '', '견적 산출 전 정보 수집 단계', '60석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('c25940d7-7cc2-5cad-abd7-8f877847a143', 'c3661fdb-6b69-5eb6-af03-9df7730c62df', '2026-07-22', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('db775c3f-9ff1-5caf-abd1-6763af2a3077', 'c3661fdb-6b69-5eb6-af03-9df7730c62df', '2026-07-26', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('8be838eb-21c4-53e7-b680-1fd302a571d6', 8, 'Sales', '진행중', '유지보수', '푸른여객', '정도현', '', '서다율', '', '견적 산출 전 정보 수집 단계', '360석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0d113f61-601d-5d74-ba9d-b68228c03f7e', '8be838eb-21c4-53e7-b680-1fd302a571d6', '2026-07-09', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('70a4c953-4385-58af-8b5a-f80006735651', 9, 'Sales', '계약완료', 'IPCC 구축 사업', '두레캐피탈', '정도현', '', '', '', 'PS : 1.95억', '50석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('1635d3b9-0b03-5f58-9e36-345e9bb3ddb9', '70a4c953-4385-58af-8b5a-f80006735651', '2026-07-04', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ('9572de75-4e82-5dc1-9d18-6d64ca7da2f6', '70a4c953-4385-58af-8b5a-f80006735651', '2026-07-16', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('85ca6440-d7ef-5de9-965e-1c5a7d68ba5a', '70a4c953-4385-58af-8b5a-f80006735651', '2026-08-11', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('c9d11012-64a2-5719-bb96-b3169750d41a', '70a4c953-4385-58af-8b5a-f80006735651', '2026-08-25', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('cf411634-a51f-50b5-98bc-79627b366454', 10, 'Sales', '홀딩', 'AICC 제안', '우듬지리테일', '서지우', '오시현', '', '', '', '30석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('60a4f77b-5913-5cbe-a928-4337112664db', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-06-30', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ('7322f8c4-4235-5009-8f74-c7e8a52b35f3', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-08-23', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ('a895eea1-3fa1-58b0-9095-6222b06bb041', 'cf411634-a51f-50b5-98bc-79627b366454', '2026-08-23', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('4ed88abe-4d28-571e-88ec-240708a2b9d1', 11, 'Sales', '홀딩', 'IPCC 구축 사업', '밝음저축은행', '최서아', '윤지호', '조서윤', '', '', '40석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0a460456-171c-5135-8244-e65b2161374a', '4ed88abe-4d28-571e-88ec-240708a2b9d1', '2026-07-19', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('a0903ff4-a6c1-5d20-84c7-e6d27e8bee7b', '4ed88abe-4d28-571e-88ec-240708a2b9d1', '2026-07-23', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ('0ecb37ba-7fd3-51b3-ad03-29beaa23567d', '4ed88abe-4d28-571e-88ec-240708a2b9d1', '2026-08-25', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('c32677b8-bded-5aa3-8a6b-9037c6566fb2', 12, 'Sales', '진행중', 'AICC 차세대 구축 사업', '한결에너지', '정도현', '', '강도윤', '', '', '45석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('05f5506c-ab7e-5517-a30b-d609374f0124', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-07-15', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ('efee3056-40bd-5c50-8480-d59a9eb73367', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-07-29', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ('e6cc4c28-afcc-5627-befd-d15e46870afd', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-08-20', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정'),
  ('d00128dd-3307-50a6-93e7-84952dd0d744', 'c32677b8-bded-5aa3-8a6b-9037c6566fb2', '2026-08-22', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('eb23d929-fc5e-5ceb-88ab-10eb87990be7', 13, 'Sales', '진행중', '유지보수', '슬기로운여행', '최서아', '', '', '', '견적 산출 전 정보 수집 단계', '8석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('e1c4248b-8093-542e-bb06-51df2990bcc7', 'eb23d929-fc5e-5ceb-88ab-10eb87990be7', '2026-07-21', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('74042c06-6799-5461-bc91-67d75f588627', 14, 'Sales', '보류', '유지보수', '나래물류', '정도현', '김하늘', '김하늘', '', '', '16석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('398a82f1-92e6-5040-9935-7e7eb46861c1', '74042c06-6799-5461-bc91-67d75f588627', '2026-08-09', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정'),
  ('1223e583-6aff-580e-a798-d1c4e087c25e', '74042c06-6799-5461-bc91-67d75f588627', '2026-09-04', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('24c6b019-eb54-5c16-8211-97631ef10594', 15, 'Sales', '홀딩', 'IPCC 구축 사업', '큰들BPO', '서지우', '신다온', '임채원', '', '견적 산출 전 정보 수집 단계', '45석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('692ef580-13c3-5ede-861d-1674769b27b3', '24c6b019-eb54-5c16-8211-97631ef10594', '2026-07-13', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ('43027520-4afa-52bd-808d-bb7e20996e94', '24c6b019-eb54-5c16-8211-97631ef10594', '2026-08-17', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('8dadcbaf-6767-5e86-a677-6d6461bf1986', 16, 'Sales', '진행중', '상담 화면 통합 구축', '청람증권', '서지우', '오시현', '조서윤', '', '', '50석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('d88a1b30-17fa-538f-819a-46ab7f9e9946', '8dadcbaf-6767-5e86-a677-6d6461bf1986', '2026-07-14', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('e486eac9-2be6-5df2-bd89-6cfc645a9599', 17, 'Sales', '진행중', '콜봇 도입', '미래로카드', '최서아', '', '', '', '견적 산출 전 정보 수집 단계', '45석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('77fda44c-af62-5f0c-9ac2-9e487c496d3e', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-07-25', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ('fcc36256-aa36-5338-93c9-ea5d0dd5f235', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-08-18', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ('ed116cfc-f9f9-555b-9648-de9551dd5c97', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-08-26', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ('387cda9d-ff53-515d-8a07-f2f34f4cb08c', 'e486eac9-2be6-5df2-bd89-6cfc645a9599', '2026-09-03', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('19d0ea8e-6150-5cd2-9b07-3c85a2cef59f', 18, 'Sales', '보류', 'AICC 구축 사업', '너울테크', '정도현', '', '', '', '', '6석', '');
insert into deal_updates (id, deal_id, log_date, body) values
  ('0bbb71c0-07ea-5836-917a-a75cab377972', '19d0ea8e-6150-5cd2-9b07-3c85a2cef59f', '2026-08-18', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('30ca3c3a-e034-5779-b5a5-c9bc19249392', 1, '내부업무', '진행중', '오퍼링 자료 정비', null, '서지우, 정도현, 최서아', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('a9f2d289-10e3-51c8-a654-e623a022842c', '30ca3c3a-e034-5779-b5a5-c9bc19249392', '2026-08-28', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('dbe55b2a-9fd2-5c90-9a56-014b3df96414', 2, '내부업무', '진행중', '콜드콜 방안 수립', null, '서지우, 정도현, 최서아', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('d338a56a-68dd-5221-b184-865d68adf644', 'dbe55b2a-9fd2-5c90-9a56-014b3df96414', '2026-08-15', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
insert into deals (id, seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values ('45c07324-fdc9-503a-9e2d-c31abb2bd8af', 3, '내부업무', '진행중', '파트너 채널 정리', null, '서지우, 정도현, 최서아', '', '', '', '', '', '');
insert into deal_updates (id, deal_id, log_date, body) values ('6f41ee8d-0298-5961-b61b-740cc317054f', '45c07324-fdc9-503a-9e2d-c31abb2bd8af', '2026-09-02', '- 1차 초안 공유
 : 다음 주 리뷰 예정');

-- ---------- 고객 미팅 로그 ----------
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('99efade5-b634-5a2e-87fc-2cc2802bdd56', 1, (select id from members where name = '최서아'), '2026-08-10', 'Net New', '한결에너지', '정예린', '2026-08-12', 'AICC 도입 계획 체크', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('69caa4f1-98d6-5637-a1de-d7a3fbc48bc2', 2, (select id from members where name = '서지우'), '2026-08-10', 'Net New', '바로콜', '문가람', '2026-08-11', 'AICC 도입 계획 체크', 'Y', '2026-08-12', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('bfcea4b5-8364-5295-b0d5-93b2b75b154e', 3, (select id from members where name = '최서아'), '2026-08-10', 'Net New', '빛나컴퍼니', '', '2026-08-12', '차세대 진행 일정 확인', 'Y', '2026-08-12', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('88144c40-b052-5c58-aa9d-2dde9620d335', 4, (select id from members where name = '최서아'), '2026-08-10', 'Existing', '푸른여객', '조서윤', '2026-08-13', '진행 사항 점검', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('120ad3ad-8cf5-5dfd-a045-4f29f8566da9', 5, (select id from members where name = '서지우'), '2026-08-10', 'Net New', '가온손해보험', '서다율', '2026-08-13', '초도 미팅, 요구사항 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5dedbabd-a8a9-5e14-aa12-fff6085d9b55', 6, (select id from members where name = '서지우'), '2026-08-10', 'Existing', '밝음저축은행', '윤지호', '2026-08-12', '차세대 진행 일정 확인', 'Y', '2026-08-12', '', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('316e7c6a-7f34-5f6a-8461-1eb11714dcea', 7, (select id from members where name = '서지우'), '2026-08-10', 'Existing', '밝음저축은행', '', '2026-08-11', '워크샵 참가 여부 확인', 'Y', '2026-08-11', '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('49bab10f-2b9b-5fe1-8d2d-c8d5ecd6cd29', 8, (select id from members where name = '서지우'), '2026-08-10', 'Existing', '너울테크', '', '2026-08-10', '협업 가능 여부 파악', 'Y', '2026-08-10', '임채린', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f58289c6-e81f-5e2f-a080-1cd1e6205427', 9, (select id from members where name = '정도현'), '2026-08-10', 'Existing', '마루정보통신', '문가람', '2026-08-14', '초도 미팅, 요구사항 확인', 'Y', '2026-08-14', '최서아', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d6d7810a-99b2-5d62-81a1-711c08e4012a', 10, (select id from members where name = '정도현'), '2026-08-10', 'Existing', '마루정보통신', '', '2026-08-13', '콜봇 개발 관련 협의', 'Y', '2026-08-13', '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8c6649bd-40c0-59c4-8447-90299badb3fc', 11, (select id from members where name = '정도현'), '2026-08-10', 'Net New', '해든쇼핑', '', '2026-08-11', '차세대 진행 일정 확인', 'Y', '2026-08-11', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3c83160a-185b-51f0-a9fd-f364d25ddd73', 12, (select id from members where name = '정도현'), '2026-08-10', 'Net New', '너울테크', '', '2026-08-10', '협업 가능 여부 파악', 'Y', '2026-08-10', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f1e173a3-d2ad-53c7-9fcd-502f232eeb13', 13, (select id from members where name = '서지우'), '2026-08-10', 'Existing', '두레캐피탈', '', '2026-08-12', '진행 사항 점검', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8e77d335-fc35-569e-a555-3327fe8bfd23', 14, (select id from members where name = '최서아'), '2026-08-10', 'Net New', '바로콜', '서다율', '2026-08-10', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-10', '최서아', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('00bccc3a-380f-5adc-80c2-030ea03cbb36', 15, (select id from members where name = '서지우'), '2026-08-17', 'Net New', '너울테크', '', '2026-08-20', 'AICC 도입 계획 체크', 'Y', '2026-08-25', '임채린', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3e17b90a-997b-5337-bfd9-7597561c5825', 16, (select id from members where name = '정도현'), '2026-08-17', 'Net New', '별빛여행', '', '2026-08-18', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-18', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('20dab872-f9c2-5ac5-83a2-1f889f4c8ef8', 17, (select id from members where name = '정도현'), '2026-08-17', 'Existing', '새롬정보', '', '2026-08-21', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-22', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f2ed03d2-978d-525e-850d-c1ea673438fa', 18, (select id from members where name = '최서아'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-21', '상담 화면 통합 협의', 'N/A', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('20ffa031-58c5-5908-bd76-d9d3484226d2', 19, (select id from members where name = '최서아'), '2026-08-17', 'Existing', '나래물류', '배준영', '2026-08-19', '진행 사항 점검', 'Y', '2026-08-20', '최서아', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('2b336811-46d0-5daf-8f06-0058b32634c9', 20, (select id from members where name = '서지우'), '2026-08-17', 'Net New', '이음테크', '임채원', '2026-08-17', '협업 가능 여부 파악', 'N/A', null, '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('009de5b0-5a36-50ac-b073-fc6abed73778', 21, (select id from members where name = '서지우'), '2026-08-17', 'Existing', '소담스토어', '정예린', '2026-08-18', '상담 화면 통합 협의', 'Y', '2026-08-18', '최서아', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('36c15bca-d351-5a74-8e4f-016b7f089721', 22, (select id from members where name = '최서아'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-17', 'AICC 도입 계획 체크', 'Y', '2026-08-20', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3b181da7-d9dc-59d8-8ec6-ee0d4a99d3fd', 23, (select id from members where name = '서지우'), '2026-08-17', 'Existing', '새롬정보', '', '2026-08-19', '초도 미팅, 요구사항 확인', 'Y', '2026-08-19', '임채린', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('87e83358-6852-581b-8899-50ce11941816', 24, (select id from members where name = '정도현'), '2026-08-17', 'Existing', '청람증권', '', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '정도현, 임채린', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7cc6e9c9-fcb2-5888-a574-2281cc38c955', 25, (select id from members where name = '정도현'), '2026-08-17', 'Net New', '소담스토어', '', '2026-08-20', '차세대 진행 일정 확인', 'Y', '2026-08-25', '임채린', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('31961c09-546e-5c92-b3e0-2cc56d1e4613', 26, (select id from members where name = '최서아'), '2026-08-17', 'Existing', '청람증권', '신다온', '2026-08-19', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-23', '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ddfd7c43-eacd-507e-9b27-d25cbdfbda49', 27, (select id from members where name = '서지우'), '2026-08-17', 'Existing', '너울테크', '임채원', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('cccdb395-6722-585c-a29e-33471ebc68fc', 28, (select id from members where name = '최서아'), '2026-08-17', 'Existing', '청람증권', '윤지호', '2026-08-18', '견적 협의 및 데모', 'Y', '2026-08-22', '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8efac19d-8c57-569f-ba67-c2b08c3a5054', 29, (select id from members where name = '서지우'), '2026-08-17', 'Net New', '큰들BPO', '', '2026-08-19', '초도 미팅, 요구사항 확인', 'N', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ea264e06-170b-5d0b-8994-1a06f02745f2', 30, (select id from members where name = '최서아'), '2026-08-17', 'Net New', '한빛생명', '오시현', '2026-08-21', '유지보수 협의', 'Y', '2026-08-21', '정도현, 임채린', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('4b800560-0944-53fb-8bd8-b5e19eb1ded8', 31, (select id from members where name = '정도현'), '2026-08-24', 'Net New', '달빛커머스', '', '2026-08-26', '시장 동향 공유', 'Y', '2026-08-26', '임채린', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('6615e7fc-3650-5e8a-993b-59712e3dbf5b', 32, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '하늘담운수', '배준영', '2026-08-25', '유지보수 협의', 'Y', '2026-08-25', '정도현, 임채린', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ad46ba42-e1db-527f-8bcf-3ef9cce84807', 33, (select id from members where name = '최서아'), '2026-08-24', 'Net New', '빛나컴퍼니', '오시현', '2026-08-26', '견적 협의 및 데모', 'Y', '2026-08-26', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('513577f7-e33f-5a8e-8d7d-3112d6337544', 34, (select id from members where name = '최서아'), '2026-08-24', 'Net New', '우듬지리테일', '배준영', '2026-08-25', '차세대 진행 일정 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('dc43756c-9b0d-598c-a268-911675af8fde', 35, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '새롬정보', '김하늘', '2026-08-24', '진행 사항 점검', 'Y', '2026-08-24', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('72cfef6f-e884-56d2-a70c-1ba0f604b98f', 36, (select id from members where name = '정도현'), '2026-08-24', 'Net New', '바로콜', '', '2026-08-28', '협업 가능 여부 파악', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a5e8008f-0d50-536d-9866-6e378282f4bb', 37, (select id from members where name = '정도현'), '2026-08-24', 'Net New', '온누리항공', '홍윤재', '2026-08-26', '워크샵 참가 여부 확인', 'Y', '2026-08-26', '정도현, 임채린', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b10aca22-3a8b-5582-b7bd-9d25950780f0', 38, (select id from members where name = '정도현'), '2026-08-24', 'Net New', '두레캐피탈', '조서윤', '2026-08-25', 'AICC 도입 계획 체크', 'N', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1f068fed-9deb-5ace-bbe5-e5af29c2d45b', 39, (select id from members where name = '서지우'), '2026-08-24', 'Net New', '아람소프트', '', '2026-08-27', '차세대 진행 일정 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e89e1c51-ba6c-57ae-883e-97ac6a14e58b', 40, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '나래물류', '', '2026-08-24', '차세대 진행 일정 확인', 'Y', '2026-08-27', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d284eb65-46b6-5bd3-a904-f91019b40c71', 41, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '고운손해보험', '박지우', '2026-08-26', '견적 협의 및 데모', 'Y', '2026-08-26', '정도현, 임채린', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e2b17f10-d463-55bd-8f10-7faf824ff8b8', 42, (select id from members where name = '정도현'), '2026-08-24', 'Net New', '정다운은행', '이서준', '2026-08-25', '협업 가능 여부 파악', 'Y', '2026-08-25', '최서아', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('080a4fb7-6372-5275-8233-a2acb98038e2', 43, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '빛나컴퍼니', '최민재', '2026-08-24', '유지보수 협의', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('324d2b1e-d69f-580f-bee2-dbb68a7d844b', 44, (select id from members where name = '서지우'), '2026-08-24', 'Existing', '온누리항공', '', '2026-08-24', '시장 동향 공유', 'N/A', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('663f2ed9-fe8f-5696-941c-f19f18b38c0d', 45, (select id from members where name = '정도현'), '2026-08-24', 'Existing', '두레캐피탈', '조서윤', '2026-08-26', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-26', '정도현, 임채린', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('72d8aa7d-3d08-5254-87d3-c0b3a5887edd', 46, (select id from members where name = '서지우'), '2026-08-24', 'Net New', '두레캐피탈', '', '2026-08-25', '진행 사항 점검', 'Y', '2026-08-25', '최서아', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('143ec067-3241-5ece-9bb8-297ee8d970a4', 47, (select id from members where name = '최서아'), '2026-08-24', 'Existing', '다올물류', '윤지호', '2026-08-28', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-28', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7496dbda-33f5-5cfb-88c1-b7d07c17c285', 48, (select id from members where name = '정도현'), '2026-08-24', 'Existing', '한결에너지', '정예린', '2026-08-25', '진행 사항 점검', 'Y', '2026-08-25', '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('13469735-7312-589b-b9bb-8e35859bb53d', 49, (select id from members where name = '정도현'), '2026-08-31', 'Existing', '아람소프트', '서다율', '2026-09-04', '견적 협의 및 데모', 'Y', '2026-09-09', '', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1b94f39b-e868-5f94-80b6-3e1baa0d74fb', 50, (select id from members where name = '정도현'), '2026-08-31', 'Existing', '이음테크', '오시현', '2026-09-02', '상담 화면 통합 협의', 'Y', '2026-09-06', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b73ad181-c3b9-55cd-bb07-adbc929b3256', 51, (select id from members where name = '서지우'), '2026-08-31', 'Net New', '너울테크', '임채원', '2026-09-01', '협업 가능 여부 파악', 'Y', '2026-09-06', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a4dd2031-e08c-5885-81b8-d28ea0c1104b', 52, (select id from members where name = '정도현'), '2026-08-31', 'Net New', '청람증권', '임채원', '2026-09-04', '진행 사항 점검', 'Y', '2026-09-04', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5ba464ba-73a0-5ef3-b873-7c146a16ec0a', 53, (select id from members where name = '최서아'), '2026-08-31', 'Existing', '나래물류', '', '2026-09-04', '초도 미팅, 요구사항 확인', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e2af2120-ef10-5285-be22-f30390f1a147', 54, (select id from members where name = '서지우'), '2026-08-31', 'Net New', '빛나컴퍼니', '', '2026-09-03', '시장 동향 공유', 'Y', '2026-09-03', '정도현, 임채린', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('805ecfc5-7ca7-5548-994c-7a60483ca8e9', 55, (select id from members where name = '정도현'), '2026-08-31', 'Existing', '빛나컴퍼니', '정예린', '2026-08-31', 'AICC 도입 계획 체크', 'Y', '2026-08-31', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('45803637-3a2c-5561-a633-79d6cb6bb9a8', 56, (select id from members where name = '정도현'), '2026-08-31', 'Existing', '우듬지리테일', '임채원', '2026-09-02', '견적 협의 및 데모', 'N', null, '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d2a23ad0-1c7c-570c-be07-006d58b50caa', 57, (select id from members where name = '서지우'), '2026-08-31', 'Existing', '두레캐피탈', '임채원', '2026-09-02', '협업 가능 여부 파악', 'Y', '2026-09-02', '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7c2042ff-d279-57b3-ae53-4c5fd9e007b8', 58, (select id from members where name = '정도현'), '2026-08-31', 'Net New', '나래물류', '', '2026-09-03', '시장 동향 공유', 'Y', '2026-09-03', '', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8e94ebf1-7084-5310-86f8-b63fe2080a29', 59, (select id from members where name = '서지우'), '2026-08-31', 'Net New', '하늘담운수', '한수아', '2026-09-03', '차세대 진행 일정 확인', 'N/A', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('5cd3ddfe-072d-5fa2-83af-d84f369a0cde', 60, (select id from members where name = '최서아'), '2026-08-31', 'Existing', '가온손해보험', '', '2026-09-04', 'AICC 도입 계획 체크', 'Y', '2026-09-04', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('13f5bad6-b659-5e0d-9dda-186f2fe8e0fa', 61, (select id from members where name = '서지우'), '2026-08-31', 'Net New', '한결에너지', '조서윤', '2026-09-02', '협업 가능 여부 파악', 'N/A', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('da1005a0-e670-58c7-bdec-19d60439d049', 62, (select id from members where name = '최서아'), '2026-08-31', 'Existing', '한결에너지', '', '2026-09-03', '상담 화면 통합 협의', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('fbb3962a-c6d1-5eee-a603-765e7f107274', 63, (select id from members where name = '서지우'), '2026-08-31', 'Existing', '고운손해보험', '최민재', '2026-09-04', '워크샵 참가 여부 확인', 'Y', '2026-09-10', '임채린', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('e960445a-5b10-5eaf-9dc8-aec7ac9e2106', 64, (select id from members where name = '서지우'), '2026-08-31', 'Existing', '새롬정보', '', '2026-09-02', '콜봇 개발 관련 협의', 'Y', '2026-09-02', '최서아', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('0bded900-114c-5a93-a407-ef8701aa48e4', 65, (select id from members where name = '최서아'), '2026-08-31', 'Existing', '두레캐피탈', '', '2026-09-02', 'AICC 도입 계획 체크', 'Y', '2026-09-02', '정도현, 임채린', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('018bf34b-f80a-59f7-9415-cb321b1dba3e', 66, (select id from members where name = '서지우'), '2026-09-07', 'Existing', '나래물류', '김하늘', '2026-09-07', '초도 미팅, 요구사항 확인', 'N/A', null, '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('9e93a810-95ec-54ea-a2de-60cb736bfeeb', 67, (select id from members where name = '서지우'), '2026-09-07', 'Net New', '너울테크', '윤지호', '2026-09-10', '상담 화면 통합 협의', 'Y', '2026-09-10', '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f7feb292-41a2-5624-b91f-6c9ad06d611c', 68, (select id from members where name = '최서아'), '2026-09-07', 'Net New', '너울테크', '', '2026-09-11', '워크샵 참가 여부 확인', 'Y', '2026-09-11', '임채린', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('67bad811-db21-52c4-96fb-2a962ad61298', 69, (select id from members where name = '최서아'), '2026-09-07', 'Net New', '나래물류', '오시현', '2026-09-11', '워크샵 참가 여부 확인', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('a0026480-27db-5670-9e64-c2c685a1c65c', 70, (select id from members where name = '서지우'), '2026-09-07', 'Existing', '초록마트', '', '2026-09-10', '워크샵 참가 여부 확인', 'Y', '2026-09-10', '정도현, 임채린', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('2d7a9518-a6e6-5d89-96ac-7469e91f2f12', 71, (select id from members where name = '최서아'), '2026-09-07', 'Existing', '너울테크', '배준영', '2026-09-11', '견적 협의 및 데모', 'N/A', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('437a0ddc-107e-5399-b6b9-76033b394cc3', 72, (select id from members where name = '정도현'), '2026-09-07', 'Existing', '터전홀딩스', '신다온', '2026-09-10', 'AICC 도입 계획 체크', 'Y', '2026-09-14', '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('0b50afad-d968-52f3-b0d0-7c05f4e6b398', 73, (select id from members where name = '최서아'), '2026-09-07', 'Net New', '이음테크', '', '2026-09-08', '차세대 진행 일정 확인', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('ac6aeeed-8d9b-5bb1-9cbe-f80184e7b7d3', 74, (select id from members where name = '최서아'), '2026-09-07', 'Net New', '바로콜', '오시현', '2026-09-11', '초도 미팅, 요구사항 확인', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('8fac81eb-db20-5022-bd82-39219f9f8aa5', 75, (select id from members where name = '서지우'), '2026-09-07', 'Net New', '마루정보통신', '', '2026-09-08', '워크샵 참가 여부 확인', 'Y', '2026-09-12', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('3912a9a4-8075-5d2e-8232-8e0b89fd1655', 76, (select id from members where name = '정도현'), '2026-09-07', 'Net New', '터전홀딩스', '', '2026-09-07', '콜봇 개발 관련 협의', 'Y', '2026-09-07', '임채린', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('977467fa-2f64-56a7-bd0a-4a8266aa7501', 77, (select id from members where name = '서지우'), '2026-09-07', 'Net New', '새롬정보', '홍윤재', '2026-09-10', '시장 동향 공유', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('7452a663-406f-5a2e-bbd9-7e2e4dead478', 78, (select id from members where name = '정도현'), '2026-09-07', 'Net New', '마루정보통신', '', '2026-09-11', '초도 미팅, 요구사항 확인', 'Y', '2026-09-14', '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('adfad7ae-5912-5c94-bd3c-b7cbfaf1a0af', 79, (select id from members where name = '최서아'), '2026-09-07', 'Existing', '해든쇼핑', '', '2026-09-11', '협업 가능 여부 파악', 'Y', '2026-09-11', '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1c9ef745-c481-5750-b967-9fda4b585295', 80, (select id from members where name = '서지우'), '2026-09-07', 'Existing', '정다운은행', '', '2026-09-08', '상담 화면 통합 협의', 'Y', '2026-09-08', '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('f6078ec7-a750-5443-8ab3-ed544be61831', 81, (select id from members where name = '서지우'), '2026-09-14', 'Net New', '너울테크', '', '2026-09-17', '진행 사항 점검', 'N', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('c38278ff-4e00-54b9-bd21-15e1788cc9b4', 82, (select id from members where name = '서지우'), '2026-09-14', 'Existing', '새롬정보', '', '2026-09-17', '초도 미팅, 요구사항 확인', '', null, '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('9695a352-4ff3-5b9d-9db7-08ca00dedee0', 83, (select id from members where name = '정도현'), '2026-09-14', 'Net New', '새롬정보', '', '2026-09-16', '워크샵 참가 여부 확인', '', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('b701f4f6-69eb-59c2-940c-8e48371d4967', 84, (select id from members where name = '정도현'), '2026-09-14', 'Net New', '미래로카드', '', '2026-09-18', '시장 동향 공유', 'Y', '2026-09-18', '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('830fe1a1-feab-583e-b9b4-e0fa420f41cf', 85, (select id from members where name = '최서아'), '2026-09-14', 'Net New', '정다운은행', '', '2026-09-17', '워크샵 참가 여부 확인', '', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('d8f381d4-be3e-5704-86be-8ecc20b6e71c', 86, (select id from members where name = '최서아'), '2026-09-14', 'Existing', '정다운은행', '', '2026-09-14', '시장 동향 공유', 'N', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('4d87c519-892c-59ce-b108-fecdbef1bf9e', 87, (select id from members where name = '서지우'), '2026-09-14', 'Existing', '온누리항공', '강도윤', '2026-09-18', '시장 동향 공유', 'N', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('232f4f28-dfa9-5f47-a678-f08a244f32da', 88, (select id from members where name = '정도현'), '2026-09-14', 'Net New', '마루정보통신', '', '2026-09-17', '상담 화면 통합 협의', '', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('766ea71c-02ff-5f99-9412-68caf60ac6e0', 89, (select id from members where name = '정도현'), '2026-09-14', 'Net New', '아람소프트', '', '2026-09-17', '유지보수 협의', '', null, '정도현, 임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('c9aa35b9-da3b-5dcd-bb23-4cd2210edb82', 90, (select id from members where name = '서지우'), '2026-09-14', 'Existing', '아람소프트', '배준영', '2026-09-15', '견적 협의 및 데모', '', null, '', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('2153c284-3abf-5682-b0d7-e5d436a0dd29', 91, (select id from members where name = '서지우'), '2026-09-14', 'Existing', '밝음저축은행', '', '2026-09-15', '진행 사항 점검', '', null, '최서아', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('42867986-8e98-5dd2-b26c-e9ce378805bf', 92, (select id from members where name = '서지우'), '2026-09-14', 'Net New', '빛나컴퍼니', '', '2026-09-18', '콜봇 개발 관련 협의', 'N', null, '임채린', '');
insert into meetings (id, seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values ('1d572d32-2b41-5196-bb02-0b172de66395', 93, (select id from members where name = '정도현'), '2026-09-14', 'Existing', '하늘담운수', '', '2026-09-17', '협업 가능 여부 파악', '', null, '', '');

commit;

