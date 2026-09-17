"use server";

import { revalidatePath } from "next/cache";
import { db } from "@/lib/db";
import { currentMember } from "@/lib/session";

function str(fd: FormData, key: string) {
  const v = fd.get(key);
  return typeof v === "string" ? v.trim() : "";
}
function orNull(fd: FormData, key: string) {
  return str(fd, key) || null;
}

async function me() {
  const m = await currentMember();
  if (!m) throw new Error("로그인이 필요합니다.");
  return m;
}

/* ══════════ 주간보고 ══════════ */

export async function saveWeekly(fd: FormData) {
  const m = await me();
  const memberId = str(fd, "member_id") || m.id;
  const weekStart = str(fd, "week_start");
  const projectId = orNull(fd, "project_id");
  const payload = {
    this_week: str(fd, "this_week"),
    next_week: str(fd, "next_week"),
    issues: str(fd, "issues"),
    updated_by: m.id,
  };

  const sb = db();
  let q = sb
    .from("weekly_reports")
    .select("id")
    .eq("member_id", memberId)
    .eq("week_start", weekStart);
  q = projectId ? q.eq("project_id", projectId) : q.is("project_id", null);
  const { data: existing } = await q.maybeSingle();

  const empty = !payload.this_week && !payload.next_week && !payload.issues;

  if (existing) {
    if (empty) {
      await sb.from("weekly_reports").delete().eq("id", existing.id);
    } else {
      await sb.from("weekly_reports").update(payload).eq("id", existing.id);
    }
  } else if (!empty) {
    await sb.from("weekly_reports").insert({
      member_id: memberId,
      project_id: projectId,
      week_start: weekStart,
      ...payload,
    });
  }

  revalidatePath("/weekly");
  revalidatePath(`/weekly/${memberId}`);
  revalidatePath("/");
}

/** 지난주 '차주 업무'를 이번주 '금주 업무' 로 복사 */
export async function carryOver(fd: FormData) {
  const m = await me();
  const memberId = str(fd, "member_id") || m.id;
  const weekStart = str(fd, "week_start");
  const prev = str(fd, "prev_week");
  const sb = db();

  const { data: rows } = await sb
    .from("weekly_reports")
    .select("project_id, next_week")
    .eq("member_id", memberId)
    .eq("week_start", prev);

  for (const row of rows ?? []) {
    const carried = (row.next_week ?? "").trim();
    if (!carried) continue;

    let q = sb
      .from("weekly_reports")
      .select("id, this_week")
      .eq("member_id", memberId)
      .eq("week_start", weekStart);
    q = row.project_id ? q.eq("project_id", row.project_id) : q.is("project_id", null);
    const { data: cur } = await q.maybeSingle();

    if (cur) {
      if ((cur.this_week ?? "").trim()) continue; // 이미 쓴 건 건드리지 않는다
      await sb
        .from("weekly_reports")
        .update({ this_week: carried, updated_by: m.id })
        .eq("id", cur.id);
    } else {
      await sb.from("weekly_reports").insert({
        member_id: memberId,
        project_id: row.project_id,
        week_start: weekStart,
        this_week: carried,
        next_week: "",
        issues: "",
        updated_by: m.id,
      });
    }
  }

  revalidatePath("/weekly");
  revalidatePath(`/weekly/${memberId}`);
}

/* ══════════ 액션 트래커 ══════════ */

export async function saveAction(fd: FormData) {
  await me();
  const id = str(fd, "id");
  const row = {
    category: str(fd, "category") || "Sales",
    customer: orNull(fd, "customer"),
    title: str(fd, "title"),
    owner_id: orNull(fd, "owner_id"),
    status: str(fd, "status") || "20.진행중",
    progress_update: str(fd, "progress_update"),
    open_date: orNull(fd, "open_date"),
    target_date: orNull(fd, "target_date"),
    close_date: orNull(fd, "close_date"),
    remark: str(fd, "remark"),
  };
  if (!row.title) return;

  const sb = db();
  if (id) await sb.from("action_items").update(row).eq("id", id);
  else await sb.from("action_items").insert(row);

  revalidatePath("/actions");
  revalidatePath("/");
}

export async function setActionStatus(fd: FormData) {
  await me();
  const id = str(fd, "id");
  const status = str(fd, "status");
  if (!id || !status) return;
  const patch: Record<string, unknown> = { status };
  if (status.startsWith("50")) patch.close_date = new Date().toISOString().slice(0, 10);
  await db().from("action_items").update(patch).eq("id", id);
  revalidatePath("/actions");
  revalidatePath("/");
}

export async function deleteAction(fd: FormData) {
  await me();
  const id = str(fd, "id");
  if (!id) return;
  await db().from("action_items").delete().eq("id", id);
  revalidatePath("/actions");
  revalidatePath("/");
}

/* ══════════ 파이프라인 ══════════ */

export async function saveDeal(fd: FormData) {
  await me();
  const id = str(fd, "id");
  const row = {
    category: str(fd, "category") || "Sales",
    stage: str(fd, "stage") || "진행중",
    name: str(fd, "name"),
    customer: orNull(fd, "customer"),
    lead: orNull(fd, "lead"),
    sales_aws: orNull(fd, "sales_aws"),
    sales_mzc: orNull(fd, "sales_mzc"),
    period: orNull(fd, "period"),
    amount: orNull(fd, "amount"),
    seats: orNull(fd, "seats"),
    remark: str(fd, "remark"),
  };
  if (!row.name) return;

  const sb = db();
  if (id) await sb.from("deals").update(row).eq("id", id);
  else await sb.from("deals").insert(row);

  revalidatePath("/deals");
  revalidatePath("/");
}

export async function addDealUpdate(fd: FormData) {
  const m = await me();
  const dealId = str(fd, "deal_id");
  const body = str(fd, "body");
  if (!dealId || !body) return;
  await db().from("deal_updates").insert({
    deal_id: dealId,
    log_date: str(fd, "log_date") || new Date().toISOString().slice(0, 10),
    body,
    author_id: m.id,
  });
  revalidatePath("/deals");
  revalidatePath(`/deals/${dealId}`);
}

export async function deleteDealUpdate(fd: FormData) {
  await me();
  const id = str(fd, "id");
  if (!id) return;
  await db().from("deal_updates").delete().eq("id", id);
  revalidatePath("/deals");
}

/* ══════════ 미팅 로그 ══════════ */

export async function saveMeeting(fd: FormData) {
  const m = await me();
  const id = str(fd, "id");
  const row = {
    owner_id: orNull(fd, "owner_id") ?? m.id,
    week_start: orNull(fd, "week_start"),
    kind: str(fd, "kind") || "Net New",
    customer: str(fd, "customer"),
    contact: orNull(fd, "contact"),
    planned_date: orNull(fd, "planned_date"),
    purpose: str(fd, "purpose"),
    done: str(fd, "done"),
    actual_date: orNull(fd, "actual_date"),
    companions: str(fd, "companions"),
    notes: str(fd, "notes"),
  };
  if (!row.customer) return;

  const sb = db();
  if (id) await sb.from("meetings").update(row).eq("id", id);
  else await sb.from("meetings").insert(row);

  revalidatePath("/meetings");
  revalidatePath("/");
}

export async function deleteMeeting(fd: FormData) {
  await me();
  const id = str(fd, "id");
  if (!id) return;
  await db().from("meetings").delete().eq("id", id);
  revalidatePath("/meetings");
  revalidatePath("/");
}

/* ══════════ 베타 피드백 ══════════ */

export async function sendFeedback(fd: FormData) {
  const m = await me();
  const body = str(fd, "body");
  if (!body) return;
  await db().from("feedback").insert({
    member_id: m.id,
    kind: str(fd, "kind") || "불편",
    body,
    page: orNull(fd, "page"),
    version: orNull(fd, "version"),
  });
  revalidatePath("/feedback");
}

export async function setFeedbackStatus(fd: FormData) {
  const m = await me();
  if (!m.is_admin) throw new Error("관리자만 상태를 바꿀 수 있습니다.");
  const id = str(fd, "id");
  const status = str(fd, "status");
  if (!id || !status) return;
  await db().from("feedback").update({ status }).eq("id", id);
  revalidatePath("/feedback");
}

export async function deleteFeedback(fd: FormData) {
  const m = await me();
  const id = str(fd, "id");
  if (!id) return;
  // 본인 것이거나 관리자만 지울 수 있다
  let q = db().from("feedback").delete().eq("id", id);
  if (!m.is_admin) q = q.eq("member_id", m.id);
  await q;
  revalidatePath("/feedback");
}

/* ══════════ 팀 / 프로젝트 ══════════ */

export async function saveMember(fd: FormData) {
  const m = await me();
  if (!m.is_admin) throw new Error("관리자만 팀원을 고칠 수 있습니다.");
  const id = str(fd, "id");
  const row = {
    email: str(fd, "email").toLowerCase(),
    name: str(fd, "name"),
    part: orNull(fd, "part"),
    role: orNull(fd, "role"),
    is_admin: fd.get("is_admin") === "on",
    active: fd.get("active") === "on",
  };
  if (!row.email || !row.name) return;

  const sb = db();
  if (id) await sb.from("members").update(row).eq("id", id);
  else await sb.from("members").insert({ ...row, sort_order: 900 });

  revalidatePath("/team");
  revalidatePath("/weekly");
}

export async function saveProject(fd: FormData) {
  const m = await me();
  if (!m.is_admin) throw new Error("관리자만 프로젝트를 고칠 수 있습니다.");
  const id = str(fd, "id");
  const row = {
    name: str(fd, "name"),
    kind: str(fd, "kind") || "프로젝트",
    owner_id: orNull(fd, "owner_id"),
    start_date: orNull(fd, "start_date"),
    end_date: orNull(fd, "end_date"),
    active: fd.get("active") === "on",
  };
  if (!row.name) return;

  const sb = db();
  if (id) await sb.from("projects").update(row).eq("id", id);
  else await sb.from("projects").insert({ ...row, sort_order: 900 });

  revalidatePath("/team");
  revalidatePath("/weekly");
}

/** 한 사람이 어떤 프로젝트를 주간보고에 띄울지 */
export async function toggleProjectMember(fd: FormData) {
  await me();
  const projectId = str(fd, "project_id");
  const memberId = str(fd, "member_id");
  const on = fd.get("on") === "1";
  if (!projectId || !memberId) return;

  const sb = db();
  if (on) {
    await sb
      .from("project_members")
      .upsert({ project_id: projectId, member_id: memberId });
  } else {
    await sb
      .from("project_members")
      .delete()
      .eq("project_id", projectId)
      .eq("member_id", memberId);
  }
  revalidatePath("/weekly");
  revalidatePath(`/weekly/${memberId}`);
}
