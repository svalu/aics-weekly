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
insert into members (email, name, part, role, is_admin, sort_order) values ('kang.kyungpyo@example.com', '강경표', null, '최고 리더', true, 10) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('min.kyungyoon@example.com', '민경윤', 'Sales', 'Biz 리더', true, 20) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('lee.minwoo@example.com', '이민우', 'AICC', '솔루션 리더', true, 30) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('lee.jinsoo@example.com', '이진수', 'Sales', 'Sales', false, 40) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('ryu.haewon@example.com', '류해원', 'Sales', 'PreSales', false, 50) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('lee.kiwon@example.com', '이기원', 'AICC', 'PM', true, 60) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('jeon.byungsoo@example.com', '전병수', 'AICC', 'SA', false, 70) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('lee.hyunhaeng@example.com', '이현행', 'AICC', 'SA', false, 80) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('oh.daesung@example.com', '오대성', 'AICC', 'SA', false, 90) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('choi.changhyun@example.com', '최창현', 'AICC', 'SA', false, 100) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('kim.sungwoo@example.com', '김성우', 'Development', '개발', false, 110) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('jung.taeksoo@example.com', '정택수', 'Development', '개발', false, 120) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('lee.sangmook@example.com', '이상묵', 'Development', '개발', false, 130) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('jung.jongho@example.com', '정종호', 'Development', '개발', false, 140) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('bang.heetae@example.com', '방희태', 'Development', '기획', false, 150) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('jang.yuseok@example.com', '장유석', 'Development', '디자인', true, 160) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('kim.jingyu@example.com', '김진규', null, null, false, 170) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('koo.changhyun@example.com', '구창현', null, null, false, 180) on conflict (email) do nothing;
insert into members (email, name, part, role, is_admin, sort_order) values ('choi.jinyong@example.com', '최진용', null, null, false, 190) on conflict (email) do nothing;

-- ---------- Ground Rule ----------
insert into ground_rules (sort_order, body) values (10, '문서와 업무 방향성은 최종본으로 보고하지 말고, 초안부터 공유하며 맞춰 나간다.');
insert into ground_rules (sort_order, body) values (20, '외부에 나가는 문서(견적서, 제안서)는 제출 하루 전에 confirm 을 받고 진행한다.');
insert into ground_rules (sort_order, body) values (30, '회의는 사전에 이슈를 공유하고, 최소 인원으로 그 자리에서 종결시킨다.');
insert into ground_rules (sort_order, body) values (40, '모든 업무에 Target Date 를 정하고, 그 전에 자료를 공유한다.');
insert into ground_rules (sort_order, body) values (50, '고객에게 가는 문서는 우리가 하고 싶은 말이 아니라 고객 요구사항을 기준으로 쓴다.');
insert into ground_rules (sort_order, body) values (60, '기다리지 말고 한 번이라도 더 만나서 우리가 줄 수 있는 가치를 설득한다.');
insert into ground_rules (sort_order, body) values (70, '막히면 혼자 붙들지 말고 이슈로 올린다. 빨리 드러낼수록 싸게 해결된다.');

-- ---------- 프로젝트 ----------
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select 'Relay Console 개발 P1-2', '프로젝트', (select id from members where name = '이기원'), '2026-07-06', '2026-12-31', 10 where not exists (select 1 from projects where name = 'Relay Console 개발 P1-2');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '한빛생명 장기 TM 시스템 고도화 분석/설계 사업', '프로젝트', (select id from members where name = '이민우'), '2026-07-13', '2026-11-30', 20 where not exists (select 1 from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '나래물류 Data Platform 장애대응 포탈 구축', '프로젝트', (select id from members where name = '정택수'), '2026-07-13', '2026-10-30', 30 where not exists (select 1 from projects where name = '나래물류 Data Platform 장애대응 포탈 구축');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '해든쇼핑 AICC 유지보수', '유지보수', (select id from members where name = '전병수'), '2026-08-10', '2026-10-09', 40 where not exists (select 1 from projects where name = '해든쇼핑 AICC 유지보수');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '고객서비스 포털 및 컨택센터 운영 관리(GCC)', '유지보수', (select id from members where name = '장유석'), '2026-04-01', '2026-12-31', 50 where not exists (select 1 from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '정다운은행 상담챗봇', '유지보수', (select id from members where name = '김성우'), '2025-09-01', '2026-08-31', 60 where not exists (select 1 from projects where name = '정다운은행 상담챗봇');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '큰들체육회 상담챗봇', '유지보수', (select id from members where name = '김성우'), null, null, 70 where not exists (select 1 from projects where name = '큰들체육회 상담챗봇');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select '초록마트 Relay Console 소개', 'Demo', (select id from members where name = '이진수'), null, null, 80 where not exists (select 1 from projects where name = '초록마트 Relay Console 소개');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select 'AICC Hands-on Workshop', '행사', (select id from members where name = '민경윤'), null, null, 90 where not exists (select 1 from projects where name = 'AICC Hands-on Workshop');
insert into projects (name, kind, owner_id, start_date, end_date, sort_order) select 'Cloud Contact Center Competency', '문서작성', (select id from members where name = '방희태'), null, null, 100 where not exists (select 1 from projects where name = 'Cloud Contact Center Competency');

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
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/25)
 : 3열 레이아웃 전환, 상단바 정돈(8/27)
 : 다크 모드 토큰 정리', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/26)
 : 상담 이력 화면 와이어프레임(8/28)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/31)
 : 상담 이력 화면 와이어프레임(9/4)', '', '' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/9)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(8/31)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/3)
 : 알림 센터 기능 개발(8/31)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/10)
 : 알림 센터 기능 개발(9/7)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/16)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/17)
 : 알림 센터 기능 개발(9/16)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(8/25)
 : 상담 이력 화면 와이어프레임(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/9)
 : 상담 이력 화면 와이어프레임(9/11)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 워크플로우 자동화 개발(9/14)
- 단위 테스트 보강
- 정적 분석 경고 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-24', '- 디자인
 : 상담 모드 인터랙션 정리 - 인라인 편집(8/26)
 : 3열 레이아웃 전환, 상단바 정돈(8/28)
 : 다크 모드 토큰 정리', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-08-31', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/2)
 : 상담 이력 화면 와이어프레임(9/3)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-07', '- Relay Console P1-2 개발
 : 옴니채널
 > 통계 화면 기획(9/7)
 > 채널별 집계 추가 - 메일 · 게시판 · 채팅(9/11)
 : 알림 센터 기능 개발(9/7)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Relay Console 개발 P1-2'), '2026-09-14', '- 기획
 : 주요 페이지 정리(알림, 워크플로우, 상담원 현황)
 : 캔버스 모드 흐름 확정(9/15)
 : 상담 이력 화면 와이어프레임(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-08-31', '- 분석 단계 산출물 고객 검토 및 보완(9/3)
- 설계 단계 산출물 작성 내부 리뷰
- 이슈 · 리스크 관리
- 고객 요구사항 대응', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이민우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '한빛생명 장기 TM 시스템 고도화 분석/설계 사업'), '2026-09-07', '- 요구사항 정의서 내부 검토 및 고객 전달 준비(9/9)
- 화면 시안 리뷰
  > 내부 리뷰 2차(9/9)
  > 현업 설명 및 확정(9/10)
- 시스템 아키텍처 분석(9/10)', '', '' from members m where m.name = '이민우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '정종호';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/4)
- 일괄 재실행 설정 화면 정리', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '정종호';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/10)
- 일괄 재실행 설정 화면 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '정종호';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 파이프라인 API 수정
 : 실패 작업의 부모 · 조부모 파티션 확인 로직 추가(9/17)
- 일괄 재실행 설정 화면 정리', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '정종호';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-24', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/26)', '', '' from members m where m.name = '정택수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-08-31', '- 장애 포털 dev 환경 고객 대상 오픈
 : SSO 적용
 : 원천 소스 담당자 매핑(8/31)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '정택수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-07', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/10)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '정택수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '나래물류 Data Platform 장애대응 포탈 구축'), '2026-09-14', '- 비용 대시보드 화면 개발
- 자동 승격 로직 검증 및 테스트
- 실사용자 피드백 반영(9/18)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '' from members m where m.name = '정택수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-24', '- 고도화 요구사항 인터뷰 2차(8/25)
- 공수 산정 정리', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-08-31', '- 고도화 요건 분석(9/1)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '해든쇼핑 AICC 유지보수'), '2026-09-07', '- 고도화 요건 분석(9/9)
- 신규 번호 추가 반영
- 오프라인 매장 오픈 대응(9/10)', '', '' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/24 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/1)
- 리드 데이터 연동 확장 미팅(9/4)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 검색 기능 운영 서버 이전(9/9 ~ 9/11)
- 프론트 테마 테스트 환경 구성', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- 검색 기능 운영 서버 이전(9/16 ~ 9/17)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- 검색 기능 운영 서버 이전(8/26 ~ 8/27)
- 프론트 테마 테스트 환경 구성', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/18)', '' from members m where m.name = '이기원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 리소스 · 접속 통계 보고서 상신(9/2)
- 리드 데이터 연동 확장 미팅(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- 리소스 · 접속 통계 보고서 상신(9/9)
- 리드 데이터 연동 확장 미팅(9/10)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '이상묵';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-24', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-08-31', '- 검색 기능 운영 서버 이전(8/31 ~ 9/4)
- 프론트 테마 테스트 환경 구성', '', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-07', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '고객서비스 포털 및 컨택센터 운영 관리(GCC)'), '2026-09-14', '- SMS 발신 계정 연동 추가 작업
- 월 정기 점검 준비', '', '' from members m where m.name = '장유석';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-08-24', '- 삭제 배치 테스트 및 작업계획서 전달(8/28)
- 월 정기 점검', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-07', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/8)
 : 정기 점검 때 함께 반영 예정', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '정다운은행 상담챗봇'), '2026-09-14', '- 채팅 상담 내역 3개월 이후 삭제 배치 추가(9/15)
 : 정기 점검 때 함께 반영 예정', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-24', '- 월 정기 점검(8/26)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-08-31', '- 월 정기 점검(9/2)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-07', '- 월 정기 점검(9/9)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '큰들체육회 상담챗봇'), '2026-09-14', '- 월 정기 점검(9/14)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/4)', '' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '김성우';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/27)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/4)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/11)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/18)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-24', '- 데모 시연 준비(8/28)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-08-31', '- 데모 시연 준비(9/3)
 : 통화 시나리오 스크립트 작성 및 테스트', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-07', '- 데모 시연 준비(9/10)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = '초록마트 Relay Console 소개'), '2026-09-14', '- 데모 시연 준비(9/17)
 : 통화 시나리오 스크립트 작성 및 테스트', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '류해원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '류해원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '류해원';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/27)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '민경윤';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/3)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '민경윤';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '민경윤';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '민경윤';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 참가자 팔로우업(8/28)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 발표 및 실습 지원(9/15)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/8)
 : 발표 자료 정리
 : 데모 환경 구축', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '이진수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/26)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/17)', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-24', '- 워크샵 발표 및 실습 지원(8/25)
 : 발표 자료 정리
 : 데모 환경 구축', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 발표 및 실습 지원(9/2)
 : 발표 자료 정리
 : 데모 환경 구축', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 발표 및 실습 지원(9/7)
 : 발표 자료 정리
 : 데모 환경 구축', '', '' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/18)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-08-31', '- 워크샵 참가자 팔로우업(9/4)
- 후속 미팅 일정 조율', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-07', '- 워크샵 참가자 팔로우업(9/11)
- 후속 미팅 일정 조율', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'AICC Hands-on Workshop'), '2026-09-14', '- 워크샵 참가자 팔로우업(9/17)
- 후속 미팅 일정 조율', '', '' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/28)', '' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '방희태';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(9/10)', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/18)', '- 테스트 시나리오 보강
- 배포 준비', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/28)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-14', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/17)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '전병수';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-24', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(8/27)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-08-31', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/3)', '- 테스트 시나리오 보강
- 배포 준비', '- 고객사 담당자 휴가로 검토 일정이 한 주 밀림' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, (select id from projects where name = 'Cloud Contact Center Competency'), '2026-09-07', '- 인증 문서 작성
 : 정기 미팅 목요일 16시
 : 사례 증적 정리(9/11)', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-08-24', '- 발표 자료 작성(8/24)
- 데모 영상 편집(8/28)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-09-07', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '오대성';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-08-24', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 금주 미완료 건 이어서 진행
- 산출물 내부 리뷰(8/27)', '' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-08-31', '- 주간 보고 취합
- 포캐스팅 업데이트 지원', '- 고객 검토 의견 반영
- 다음 단계 일정 수립', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-09-07', '- 발표 자료 작성(9/9)
- 데모 영상 편집(9/10)', '', '- 분석용 장비가 부족해 일정이 밀릴 수 있음. 증설 검토 필요' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-09-14', '- 발표 자료 작성(9/15)
- 데모 영상 편집(9/18)', '- 후속 미팅 일정 조율
- 견적 초안 작성', '' from members m where m.name = '이현행';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-08-31', '- 발표 자료 작성(9/2)
- 데모 영상 편집(9/4)', '- 테스트 시나리오 보강
- 배포 준비', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';
insert into weekly_reports (member_id, project_id, week_start, this_week, next_week, issues) select m.id, null, '2026-09-14', '- 발표 자료 작성(9/14)
- 데모 영상 편집(9/17)', '', '- 연동 규격이 확정되지 않아 개발 착수가 대기 중' from members m where m.name = '최창현';

-- ---------- Action Tracker ----------
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (1, 'Tech', '큰들BPO', '계약 조건 검토', (select id from members where name = '이기원'), '50.Close', '9/10 1차 검토 완료. 보완 사항 정리 중', '2026-09-08', '2026-10-08', '2026-10-07', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (2, 'Sales', '소담스토어', '워크샵 일정 수립', (select id from members where name = '장유석'), '50.Close', '', '2026-08-05', '2026-08-12', '2026-08-08', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (3, 'Sales', '두레캐피탈', '고객사 담당자 재확인', (select id from members where name = '전병수'), '20.진행중', '8/7 1차 검토 완료. 보완 사항 정리 중', '2026-08-05', '2026-09-10', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (4, 'Sales', '마루정보통신', '견적 초안 작성 및 내부 검토', (select id from members where name = '이현행'), '50.Close', '9/8 1차 검토 완료. 보완 사항 정리 중', '2026-09-06', '2026-09-13', '2026-09-14', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (5, 'Sales', '다올물류', '고객사 담당자 재확인', (select id from members where name = '김진규'), '50.Close', '7/31 1차 검토 완료. 보완 사항 정리 중', '2026-07-29', '2026-08-05', '2026-08-09', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (6, 'Sales', '푸른여객', '경쟁사 동향 정리', (select id from members where name = '김진규'), '20.진행중', '', '2026-08-23', '2026-08-23', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (7, 'Tech', '고운손해보험', '협업 가능 여부 결과 보고', (select id from members where name = '민경윤'), '50.Close', '8/31 고객 전달 완료
9/4 회신 대기', '2026-08-29', '2026-09-28', '2026-10-01', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (8, 'Tech', '새롬정보', '유지보수 범위 협의', (select id from members where name = '이민우'), '50.Close', '8/4 1차 검토 완료. 보완 사항 정리 중', '2026-08-02', '2026-08-23', '2026-08-22', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (9, 'ALL', '달빛커머스', '오퍼링 자료 최신화', (select id from members where name = '장유석'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-09-25', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (10, 'Sales', '이음테크', '오퍼링 자료 최신화', (select id from members where name = '민경윤'), '20.진행중', '', '2026-07-17', '2026-09-21', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (11, 'ALL', '한빛생명', '사전조사 양식 전달', (select id from members where name = '이현행'), '50.Close', '7/4 내부 리뷰 진행. 다음 주 재논의', '2026-07-02', '2026-07-12', '2026-07-16', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (12, 'Sales', '우듬지리테일', '차세대 일정 확인', (select id from members where name = '구창현'), '99.Drop', '8/23 고객 전달 완료
8/27 회신 대기', '2026-08-21', '2026-09-04', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (13, 'Tech', '큰들BPO', '협업 가능 여부 결과 보고', (select id from members where name = '이상묵'), '20.진행중', '8/9 1차 검토 완료. 보완 사항 정리 중', '2026-08-07', '2026-09-13', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (14, 'Tech', '하늘담운수', '견적 초안 작성 및 내부 검토', (select id from members where name = '오대성'), '20.진행중', '', '2026-07-30', '2026-08-29', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (15, 'Tech', '두레캐피탈', '계약 조건 검토', (select id from members where name = '이상묵'), '99.Drop', '', '2026-09-08', '2026-09-18', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (16, 'ALL', '우듬지리테일', '경쟁사 동향 정리', (select id from members where name = '이진수'), '20.진행중', '8/17 1차 검토 완료. 보완 사항 정리 중', '2026-08-15', '2026-08-18', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (17, 'Tech', '고운손해보험', '사전조사 양식 전달', (select id from members where name = '방희태'), '50.Close', '', '2026-08-16', '2026-09-06', '2026-09-09', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (18, 'Sales', '초록마트', '견적 초안 작성 및 내부 검토', (select id from members where name = '방희태'), '99.Drop', '', '2026-08-08', '2026-09-07', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (19, 'Tech', '빛나컴퍼니', '워크샵 일정 수립', (select id from members where name = '최창현'), '10.대기', '', '2026-08-04', '2026-08-25', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (20, 'Sales', '미래로카드', '운영 이관 계획 수립', (select id from members where name = '정종호'), '20.진행중', '9/5 1차 검토 완료. 보완 사항 정리 중', '2026-09-03', '2026-09-26', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (21, 'ALL', '두레캐피탈', '오퍼링 자료 최신화', (select id from members where name = '최진용'), '50.Close', '', '2026-07-03', '2026-07-10', '2026-07-13', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (22, 'Sales', null, '오퍼링 자료 최신화', (select id from members where name = '방희태'), '50.Close', '9/13 1차 검토 완료. 보완 사항 정리 중', '2026-09-11', '2026-09-21', '2026-09-26', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (23, 'Sales', '청람증권', '워크샵 일정 수립', (select id from members where name = '방희태'), '50.Close', '', '2026-07-29', '2026-08-28', '2026-08-25', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (24, 'Sales', '터전홀딩스', '오퍼링 자료 최신화', (select id from members where name = '장유석'), '50.Close', '', '2026-07-18', '2026-08-08', '2026-08-09', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (25, 'Sales', '온누리항공', '고객사 담당자 재확인', (select id from members where name = '류해원'), '10.대기', '', '2026-07-02', '2026-07-09', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (26, 'Sales', '별빛여행', '차세대 일정 확인', (select id from members where name = '민경윤'), '50.Close', '', '2026-08-24', '2026-09-07', '2026-09-10', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (27, 'Sales', '소담스토어', '연동 규격 확인', (select id from members where name = '이현행'), '20.진행중', '', '2026-08-28', '2026-09-17', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (28, 'Sales', '한결에너지', '운영 이관 계획 수립', (select id from members where name = '이진수'), '50.Close', '8/23 1차 검토 완료. 보완 사항 정리 중', '2026-08-21', '2026-09-20', '2026-09-17', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (29, 'Sales', '다올물류', '계약 조건 검토', (select id from members where name = '최진용'), '20.진행중', '9/12 내부 리뷰 진행. 다음 주 재논의', '2026-09-10', '2026-09-12', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (30, 'Sales', '터전홀딩스', '데모 환경 준비', (select id from members where name = '김성우'), '50.Close', '9/2 고객 전달 완료
9/6 회신 대기', '2026-08-31', '2026-09-07', '2026-09-07', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (31, 'Sales', '정다운은행', '워크샵 팔로우업', (select id from members where name = '전병수'), '50.Close', '8/20 내부 리뷰 진행. 다음 주 재논의', '2026-08-18', '2026-09-01', '2026-09-07', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (32, 'Sales', '밝음저축은행', '오퍼링 자료 최신화', (select id from members where name = '강경표'), '50.Close', '', '2026-09-08', '2026-09-18', '2026-09-15', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (33, 'ALL', '하늘담운수', '워크샵 팔로우업', (select id from members where name = '장유석'), '50.Close', '7/22 1차 검토 완료. 보완 사항 정리 중', '2026-07-20', '2026-07-25', '2026-07-26', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (34, 'Tech', '하늘담운수', '연동 규격 확인', (select id from members where name = '이현행'), '50.Close', '', '2026-08-27', '2026-09-10', '2026-09-12', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (35, 'Sales', '다올물류', '데모 환경 준비', (select id from members where name = '구창현'), '50.Close', '7/9 1차 검토 완료. 보완 사항 정리 중', '2026-07-07', '2026-07-21', '2026-07-22', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (36, 'Sales', '초록마트', '사전조사 양식 전달', (select id from members where name = '이현행'), '99.Drop', '7/20 내부 리뷰 진행. 다음 주 재논의', '2026-07-18', '2026-07-28', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (37, 'Sales', '나래물류', '연동 규격 확인', (select id from members where name = '정종호'), '20.진행중', '7/13 1차 검토 완료. 보완 사항 정리 중', '2026-07-11', '2026-09-29', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (38, 'Tech', '슬기로운여행', '견적 초안 작성 및 내부 검토', (select id from members where name = '최창현'), '10.대기', '9/13 내부 리뷰 진행. 다음 주 재논의', '2026-09-11', '2026-09-16', null, '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (39, 'Sales', '달빛커머스', '사전조사 양식 전달', (select id from members where name = '방희태'), '50.Close', '', '2026-09-07', '2026-09-28', '2026-10-03', '');
insert into action_items (seq, category, customer, title, owner_id, status, progress_update, open_date, target_date, close_date, remark) values (40, 'Tech', '터전홀딩스', '경쟁사 동향 정리', (select id from members where name = '이진수'), '20.진행중', '7/10 고객 전달 완료
7/14 회신 대기', '2026-07-08', '2026-08-30', null, '');

-- ---------- Sales 파이프라인 ----------
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (1, 'Sales', '보류', 'AICC 차세대 구축 사업', '달빛커머스', '민경윤', '', '정예린', '', '', '200석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-06-30', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (2, 'Sales', '진행중', '콜봇 도입', '바로콜', '류해원', '', '신다온', '', '견적 산출 전 정보 수집 단계', '200석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-09', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ((select id from dl), '2026-07-26', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (3, 'Sales', '진행중', '콜봇 도입', '빛나컴퍼니', '민경윤', '', '', '', '', '50석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-08-07', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ((select id from dl), '2026-09-01', '- 프로젝트 기간 확정
 : 착수 준비 진행');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (4, 'Sales', '진행중', '상담 화면 통합 구축', '하늘담운수', '민경윤', '', '배준영', '', '견적 산출 전 정보 수집 단계', '6석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-08', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ((select id from dl), '2026-07-24', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ((select id from dl), '2026-08-14', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ((select id from dl), '2026-08-26', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (5, 'Sales', '진행중', '콜봇 도입', '이음테크', '류해원', '', '윤지호', '', '', '200석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-11', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ((select id from dl), '2026-07-20', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ((select id from dl), '2026-07-26', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ((select id from dl), '2026-08-28', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (6, 'Sales', '진행중', '유지보수', '별빛여행', '민경윤', '박지우', '', '', '견적 산출 전 정보 수집 단계', '10석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-06-28', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ((select id from dl), '2026-07-05', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ((select id from dl), '2026-07-14', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ((select id from dl), '2026-07-31', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (7, 'Sales', '진행중', 'AICC 구축 사업', '마루정보통신', '이진수', '강도윤', '조서윤', '', '', '60석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-08-21', '- 우선협상대상자 선정
 : 계약 절차 진행 중'),
  ((select id from dl), '2026-09-03', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (8, 'Sales', '보류', '콜봇 도입', '푸른여객', '민경윤', '', '윤지호', '', '', '200석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-08-11', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (9, 'Sales', '진행중', '콜봇 도입', '두레캐피탈', '류해원', '임채원', '오시현', '', '', '60석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-01', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ((select id from dl), '2026-08-06', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (10, 'Sales', '계약진행중', 'AICC 차세대 구축 사업', '우듬지리테일', '류해원', '', '', '2026.07.13 ~ 2026.11.30', 'PS : 4.49억', '10석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-08-01', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ((select id from dl), '2026-08-18', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ((select id from dl), '2026-08-18', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (11, 'Sales', '진행중', '상담 화면 통합 구축', '밝음저축은행', '민경윤', '신다온', '강도윤', '', '견적 산출 전 정보 수집 단계', '200석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-14', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (12, 'Sales', '보류', '콜봇 도입', '한결에너지', '이진수', '', '박지우', '', '견적 산출 전 정보 수집 단계', '10석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-15', '- 프로젝트 기간 확정
 : 착수 준비 진행'),
  ((select id from dl), '2026-07-29', '- 고객 담당자 변경
 : 인수인계 후 재협의 예정'),
  ((select id from dl), '2026-08-20', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정'),
  ((select id from dl), '2026-08-22', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (13, 'Sales', '진행중', '유지보수', '슬기로운여행', '류해원', '', '', '', '견적 산출 전 정보 수집 단계', '8석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-21', '- 내부 검토 회의
 : 투입 인력 및 일정 확정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (14, 'Sales', '보류', '유지보수', '나래물류', '이진수', '김하늘', '오시현', '', '', '16석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-08-17', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (15, 'Sales', '계약진행중', 'AICC 구축 사업', '큰들BPO', '류해원', '', '', '2026.07.13 ~ 2026.11.30', 'PS : 3.54억', '6석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-09-05', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (16, 'Sales', '진행중', 'IPCC 구축 사업', '청람증권', '민경윤', '', '', '', '', '8석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-23', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ((select id from dl), '2026-08-22', '- 내부 검토 회의
 : 투입 인력 및 일정 확정'),
  ((select id from dl), '2026-08-26', '- 고객사 방문
 : 오퍼링 소개 및 현황 파악
 : 예상 견적 요청으로 필요 사항 문의 예정'),
  ((select id from dl), '2026-09-06', '- 우선협상대상자 선정
 : 계약 절차 진행 중');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (17, 'Sales', '진행중', 'AICC 구축 사업', '미래로카드', '이진수', '윤지호', '', '', '', '400석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-30', '- 견적 2개안 제출
 : 1안 기본형, 2안 고도화 포함'),
  ((select id from dl), '2026-08-06', '- 일정 연기 요청
 : 다음 분기 재논의'),
  ((select id from dl), '2026-09-08', '- 사전조사 양식 전달
 : 회신 후 견적 산출 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (18, 'Sales', '진행중', '상담 화면 통합 구축', '너울테크', '류해원', '김하늘', '', '', '견적 산출 전 정보 수집 단계', '16석', '') returning id)
insert into deal_updates (deal_id, log_date, body) values
  ((select id from dl), '2026-07-14', '- 프로젝트 기간 확정
 : 착수 준비 진행');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (1, '내부업무', '진행중', '오퍼링 자료 정비', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '') returning id)
insert into deal_updates (deal_id, log_date, body) values ((select id from dl), '2026-09-03', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (2, '내부업무', '진행중', '콜드콜 방안 수립', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '') returning id)
insert into deal_updates (deal_id, log_date, body) values ((select id from dl), '2026-08-21', '- 1차 초안 공유
 : 다음 주 리뷰 예정');
with dl as (insert into deals (seq, category, stage, name, customer, lead, sales_aws, sales_mzc, period, amount, seats, remark) values (3, '내부업무', '진행중', '파트너 채널 정리', null, '민경윤, 이진수, 류해원', '', '', '', '', '', '') returning id)
insert into deal_updates (deal_id, log_date, body) values ((select id from dl), '2026-09-08', '- 1차 초안 공유
 : 다음 주 리뷰 예정');

-- ---------- 고객 미팅 로그 ----------
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (1, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '나래물류', '임채원', '2026-08-14', '상담 화면 통합 협의', 'Y', '2026-08-14', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (2, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '새롬정보', '신다온', '2026-08-11', '진행 사항 점검', 'Y', '2026-08-11', '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (3, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '푸른여객', '강도윤', '2026-08-13', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-15', '전병수', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (4, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '이음테크', '', '2026-08-12', '시장 동향 공유', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (5, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '터전홀딩스', '', '2026-08-10', '콜봇 개발 관련 협의', 'Y', '2026-08-10', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (6, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '빛나컴퍼니', '', '2026-08-13', '워크샵 참가 여부 확인', 'Y', '2026-08-13', '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (7, (select id from members where name = '류해원'), '2026-08-10', 'Existing', '정다운은행', '조서윤', '2026-08-12', '견적 협의 및 데모', 'Y', '2026-08-14', '이진수, 전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (8, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '빛나컴퍼니', '배준영', '2026-08-14', '차세대 진행 일정 확인', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (9, (select id from members where name = '류해원'), '2026-08-10', 'Net New', '새롬정보', '윤지호', '2026-08-12', '유지보수 협의', 'Y', '2026-08-15', '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (10, (select id from members where name = '류해원'), '2026-08-10', 'Net New', '마루정보통신', '', '2026-08-13', '콜봇 개발 관련 협의', 'N/A', null, '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (11, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '소담스토어', '임채원', '2026-08-11', '워크샵 참가 여부 확인', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (12, (select id from members where name = '민경윤'), '2026-08-10', 'Net New', '달빛커머스', '김하늘', '2026-08-12', '협업 가능 여부 파악', 'Y', '2026-08-12', '이진수, 전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (13, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '가온손해보험', '', '2026-08-10', '초도 미팅, 요구사항 확인', 'Y', '2026-08-10', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (14, (select id from members where name = '민경윤'), '2026-08-10', 'Existing', '미래로카드', '최민재', '2026-08-11', 'AICC 도입 계획 체크', 'N/A', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (15, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '우듬지리테일', '문가람', '2026-08-13', '진행 사항 점검', 'Y', '2026-08-13', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (16, (select id from members where name = '류해원'), '2026-08-10', 'Existing', '너울테크', '', '2026-08-13', 'AICC 도입 계획 체크', 'Y', '2026-08-18', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (17, (select id from members where name = '이진수'), '2026-08-10', 'Net New', '별빛여행', '', '2026-08-11', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-11', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (18, (select id from members where name = '이진수'), '2026-08-10', 'Existing', '새롬정보', '', '2026-08-14', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-15', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (19, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-21', '상담 화면 통합 협의', 'N/A', null, '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (20, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '나래물류', '신다온', '2026-08-19', '상담 화면 통합 협의', 'Y', '2026-08-20', '', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (21, (select id from members where name = '류해원'), '2026-08-17', 'Net New', '이음테크', '신다온', '2026-08-17', '협업 가능 여부 파악', 'Y', '2026-08-17', '전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (22, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '소담스토어', '박지우', '2026-08-18', '상담 화면 통합 협의', 'Y', '2026-08-18', '류해원', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (23, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '별빛여행', '', '2026-08-17', 'AICC 도입 계획 체크', 'Y', '2026-08-20', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (24, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '새롬정보', '', '2026-08-19', '초도 미팅, 요구사항 확인', 'Y', '2026-08-19', '전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (25, (select id from members where name = '이진수'), '2026-08-17', 'Existing', '청람증권', '', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '이진수, 전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (26, (select id from members where name = '이진수'), '2026-08-17', 'Net New', '소담스토어', '', '2026-08-20', '차세대 진행 일정 확인', 'Y', '2026-08-25', '전병수', '내년 상반기 사업 협업 요청. 담당자 재확인 예정');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (27, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '청람증권', '강도윤', '2026-08-19', '제품 소개 및 고객사 현황 파악', 'Y', '2026-08-23', '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (28, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '너울테크', '오시현', '2026-08-18', '협업 가능 여부 파악', 'Y', '2026-08-24', '전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (29, (select id from members where name = '민경윤'), '2026-08-17', 'Net New', '초록마트', '윤지호', '2026-08-18', '차세대 진행 일정 확인', 'Y', '2026-08-18', '', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (30, (select id from members where name = '이진수'), '2026-08-17', 'Existing', '새롬정보', '오시현', '2026-08-18', '초도 미팅, 요구사항 확인', 'Y', '2026-08-18', '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (31, (select id from members where name = '민경윤'), '2026-08-17', 'Net New', '온누리항공', '임채원', '2026-08-17', '초도 미팅, 요구사항 확인', 'Y', '2026-08-21', '이진수, 전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (32, (select id from members where name = '이진수'), '2026-08-17', 'Net New', '달빛커머스', '', '2026-08-21', '시장 동향 공유', 'Y', '2026-08-21', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (33, (select id from members where name = '류해원'), '2026-08-17', 'Existing', '하늘담운수', '신다온', '2026-08-18', '상담 화면 통합 협의', 'Y', '2026-08-18', '이진수, 전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (34, (select id from members where name = '민경윤'), '2026-08-17', 'Existing', '초록마트', '', '2026-08-17', '시장 동향 공유', 'Y', '2026-08-22', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (35, (select id from members where name = '류해원'), '2026-08-17', 'Net New', '우듬지리테일', '한수아', '2026-08-20', '워크샵 참가 여부 확인', 'Y', '2026-08-24', '류해원', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (36, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '새롬정보', '오시현', '2026-08-24', '초도 미팅, 요구사항 확인', 'Y', '2026-08-24', '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (37, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '한결에너지', '', '2026-08-26', '차세대 진행 일정 확인', 'Y', '2026-09-01', '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (38, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '온누리항공', '윤지호', '2026-08-26', '워크샵 참가 여부 확인', 'Y', '2026-08-26', '이진수, 전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (39, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '두레캐피탈', '배준영', '2026-08-25', '견적 협의 및 데모', 'N', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (40, (select id from members where name = '이진수'), '2026-08-24', 'Net New', '큰들BPO', '', '2026-08-26', '차세대 진행 일정 확인', 'N', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (41, (select id from members where name = '민경윤'), '2026-08-24', 'Existing', '나래물류', '', '2026-08-24', '차세대 진행 일정 확인', 'Y', '2026-08-27', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (42, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '고운손해보험', '오시현', '2026-08-26', 'AICC 도입 계획 체크', 'Y', '2026-08-26', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (43, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '마루정보통신', '', '2026-08-24', '진행 사항 점검', 'Y', '2026-08-24', '', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (44, (select id from members where name = '류해원'), '2026-08-24', 'Net New', '온누리항공', '임채원', '2026-08-28', '진행 사항 점검', 'Y', '2026-08-28', '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (45, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '한결에너지', '박지우', '2026-08-28', '상담 화면 통합 협의', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (46, (select id from members where name = '민경윤'), '2026-08-24', 'Net New', '슬기로운여행', '', '2026-08-24', '진행 사항 점검', 'Y', '2026-08-24', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (47, (select id from members where name = '민경윤'), '2026-08-24', 'Existing', '고운손해보험', '', '2026-08-25', '시장 동향 공유', 'N', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (48, (select id from members where name = '류해원'), '2026-08-24', 'Existing', '이음테크', '', '2026-08-25', '협업 가능 여부 파악', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (49, (select id from members where name = '민경윤'), '2026-08-31', 'Net New', '터전홀딩스', '', '2026-09-02', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-02', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (50, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '밝음저축은행', '', '2026-09-01', '시장 동향 공유', 'Y', '2026-09-01', '류해원', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (51, (select id from members where name = '류해원'), '2026-08-31', 'Existing', '큰들BPO', '문가람', '2026-08-31', '차세대 진행 일정 확인', 'Y', '2026-08-31', '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (52, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '두레캐피탈', '', '2026-09-03', '시장 동향 공유', 'N', null, '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (53, (select id from members where name = '이진수'), '2026-08-31', 'Existing', '정다운은행', '최민재', '2026-08-31', '시장 동향 공유', 'Y', '2026-08-31', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (54, (select id from members where name = '민경윤'), '2026-08-31', 'Existing', '하늘담운수', '신다온', '2026-09-02', '초도 미팅, 요구사항 확인', 'Y', '2026-09-02', '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (55, (select id from members where name = '류해원'), '2026-08-31', 'Net New', '한빛생명', '', '2026-09-03', '초도 미팅, 요구사항 확인', 'Y', '2026-09-03', '이진수, 전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (56, (select id from members where name = '류해원'), '2026-08-31', 'Net New', '한결에너지', '이서준', '2026-09-01', '진행 사항 점검', 'Y', '2026-09-05', '전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (57, (select id from members where name = '이진수'), '2026-08-31', 'Net New', '빛나컴퍼니', '박지우', '2026-08-31', 'AICC 도입 계획 체크', 'Y', '2026-08-31', '', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (58, (select id from members where name = '이진수'), '2026-08-31', 'Existing', '우듬지리테일', '정예린', '2026-09-02', '견적 협의 및 데모', 'N', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (59, (select id from members where name = '민경윤'), '2026-08-31', 'Existing', '두레캐피탈', '오시현', '2026-09-02', '협업 가능 여부 파악', 'Y', '2026-09-02', '전병수', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (60, (select id from members where name = '민경윤'), '2026-08-31', 'Net New', '고운손해보험', '', '2026-09-01', '제품 소개 및 고객사 현황 파악', 'N', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (61, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '다올물류', '윤지호', '2026-09-08', '콜봇 개발 관련 협의', 'N', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (62, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '한빛생명', '김하늘', '2026-09-10', '시장 동향 공유', 'Y', '2026-09-15', '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (63, (select id from members where name = '민경윤'), '2026-09-07', 'Net New', '너울테크', '', '2026-09-08', '워크샵 참가 여부 확인', 'Y', '2026-09-08', '류해원', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (64, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '청람증권', '신다온', '2026-09-08', '시장 동향 공유', 'Y', '2026-09-13', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (65, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '하늘담운수', '', '2026-09-10', '초도 미팅, 요구사항 확인', 'Y', '2026-09-10', '전병수', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (66, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '별빛여행', '', '2026-09-09', '워크샵 참가 여부 확인', 'Y', '2026-09-09', '전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (67, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '큰들BPO', '조서윤', '2026-09-07', '협업 가능 여부 파악', 'N/A', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (68, (select id from members where name = '민경윤'), '2026-09-07', 'Existing', '푸른여객', '', '2026-09-11', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-11', '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (69, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '나래물류', '강도윤', '2026-09-07', '제품 소개 및 고객사 현황 파악', 'Y', '2026-09-07', '전병수', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (70, (select id from members where name = '이진수'), '2026-09-07', 'Net New', '다올물류', '', '2026-09-09', '차세대 진행 일정 확인', 'Y', '2026-09-09', '전병수', '자체 솔루션 사용 중이며 신규 구축 의지는 낮음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (71, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '소담스토어', '', '2026-09-09', '유지보수 협의', 'Y', '2026-09-09', '류해원', '상담석 20석 규모, 장비 노후화로 내년 교체 검토');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (72, (select id from members where name = '이진수'), '2026-09-07', 'Existing', '고운손해보험', '', '2026-09-09', '차세대 진행 일정 확인', 'Y', '2026-09-13', '이진수, 전병수', '클라우드 전환 계획은 아직 없음. AI 기능에는 관심 있음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (73, (select id from members where name = '류해원'), '2026-09-07', 'Existing', '너울테크', '', '2026-09-11', '콜봇 개발 관련 협의', 'Y', '2026-09-16', '류해원', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (74, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '이음테크', '조서윤', '2026-09-16', '시장 동향 공유', '', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (75, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '미래로카드', '', '2026-09-14', '협업 가능 여부 파악', 'N', null, '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (76, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '우듬지리테일', '', '2026-09-18', 'AICC 도입 계획 체크', 'Y', '2026-09-23', '이진수, 전병수', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (77, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '가온손해보험', '최민재', '2026-09-16', '견적 협의 및 데모', '', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (78, (select id from members where name = '이진수'), '2026-09-14', 'Existing', '큰들BPO', '신다온', '2026-09-16', 'AICC 도입 계획 체크', '', null, '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (79, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '고운손해보험', '문가람', '2026-09-17', '상담 화면 통합 협의', 'Y', '2026-09-23', '류해원', '파트너 협업 가능. SaaS 형태 제휴는 가능하나 SI 는 어려움');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (80, (select id from members where name = '민경윤'), '2026-09-14', 'Net New', '한결에너지', '오시현', '2026-09-17', '차세대 진행 일정 확인', 'Y', '2026-09-17', '류해원', '데모 일정 재협의 예정. 다음 달 초 재방문');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (81, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '너울테크', '', '2026-09-18', '초도 미팅, 요구사항 확인', '', null, '', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (82, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '바로콜', '강도윤', '2026-09-15', '유지보수 협의', '', null, '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (83, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '하늘담운수', '', '2026-09-15', '워크샵 참가 여부 확인', 'Y', '2026-09-15', '', '아웃소싱 운영 중이라 직접 도입 결정권 없음');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (84, (select id from members where name = '민경윤'), '2026-09-14', 'Existing', '새롬정보', '', '2026-09-17', '초도 미팅, 요구사항 확인', '', null, '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (85, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '새롬정보', '', '2026-09-16', '워크샵 참가 여부 확인', '', null, '이진수, 전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (86, (select id from members where name = '이진수'), '2026-09-14', 'Net New', '미래로카드', '', '2026-09-18', '시장 동향 공유', 'Y', '2026-09-18', '전병수', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (87, (select id from members where name = '류해원'), '2026-09-14', 'Net New', '정다운은행', '', '2026-09-17', '워크샵 참가 여부 확인', '', null, '류해원', '');
insert into meetings (seq, owner_id, week_start, kind, customer, contact, planned_date, purpose, done, actual_date, companions, notes) values (88, (select id from members where name = '류해원'), '2026-09-14', 'Existing', '정다운은행', '', '2026-09-14', '시장 동향 공유', 'N', null, '', '');

commit;

