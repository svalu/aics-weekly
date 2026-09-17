export type Member = {
  id: string;
  email: string;
  name: string;
  part: string | null;
  role: string | null;
  is_admin: boolean;
  active: boolean;
  sort_order: number;
};

export type Project = {
  id: string;
  name: string;
  kind: string;
  owner_id: string | null;
  start_date: string | null;
  end_date: string | null;
  active: boolean;
  sort_order: number;
};

export type WeeklyReport = {
  id: string;
  member_id: string;
  project_id: string | null;
  week_start: string;
  this_week: string;
  next_week: string;
  issues: string;
  updated_at: string;
};

export type ActionItem = {
  id: string;
  seq: number | null;
  category: string;
  customer: string | null;
  title: string;
  owner_id: string | null;
  status: string;
  progress_update: string;
  open_date: string | null;
  target_date: string | null;
  start_date: string | null;
  close_date: string | null;
  remark: string;
};

export type Deal = {
  id: string;
  seq: number | null;
  category: string;
  stage: string;
  name: string;
  customer: string | null;
  lead: string | null;
  sales_aws: string | null;
  sales_mzc: string | null;
  period: string | null;
  amount: string | null;
  seats: string | null;
  remark: string;
};

export type DealUpdate = {
  id: string;
  deal_id: string;
  log_date: string | null;
  body: string;
};

export type Meeting = {
  id: string;
  seq: number | null;
  owner_id: string | null;
  week_start: string | null;
  kind: string;
  customer: string;
  contact: string | null;
  planned_date: string | null;
  purpose: string;
  done: string;
  actual_date: string | null;
  companions: string;
  notes: string;
};

export type Feedback = {
  id: string;
  member_id: string | null;
  kind: string;
  body: string;
  page: string | null;
  version: string | null;
  status: string;
  created_at: string;
};

export const FEEDBACK_KINDS = ["버그", "불편", "아이디어"] as const;
export const FEEDBACK_STATUSES = ["새 의견", "확인함", "반영함"] as const;

export const ACTION_STATUSES = ["10.대기", "20.진행중", "50.Close", "99.Drop"] as const;
export const DEAL_STAGES = [
  "진행중",
  "계약진행중",
  "계약완료",
  "홀딩",
  "보류",
  "Drop",
] as const;
export const PROJECT_KINDS = [
  "프로젝트",
  "유지보수",
  "내부업무",
  "Demo",
  "행사",
  "문서작성",
] as const;
