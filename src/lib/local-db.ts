import fs from "node:fs";
import path from "node:path";
import type { PGlite } from "@electric-sql/pglite";

/**
 * Supabase 없이 도는 모드.
 *
 * Supabase 환경변수가 없고 LOCAL_DB=1 이면 진짜 Postgres(PGlite · WASM)를
 * 프로세스 안에 띄우고 schema.sql + seed 를 한 번 실행한다.
 * supabase-js 의 쿼리 빌더 중 이 앱이 쓰는 부분만 흉내 낸다.
 *
 *   내 PC     — .localdb/ 에 저장. 껐다 켜도 남는다.
 *   서버리스  — 쓰기 가능한 디스크가 없으니 메모리에. 인스턴스가
 *              재활용되면 데모 데이터로 돌아간다. 테스트 배포용이다.
 *
 * 실제로 팀이 쓸 때는 Supabase 환경변수를 넣어 이 경로를 타지 않게 한다.
 */

type Row = Record<string, unknown>;
type Filter = { col: string; op: string; val: unknown };

/**
 * 서버 액션 번들과 페이지 번들이 각각 모듈을 따로 로드할 수 있다.
 * 그때마다 PGlite 를 새로 열면 같은 디렉터리를 두 인스턴스가 물어서
 * 한쪽 쓰기가 다른 쪽에 안 보인다. globalThis 에 하나만 둔다.
 */
const SHARED = Symbol.for("aics.local-db");
type Global = typeof globalThis & { [SHARED]?: Promise<PGlite> | null };
const g = globalThis as Global;

/** 디스크에 쓸 수 있는 환경인지. 서버리스에서는 보통 못 쓴다. */
function dataDir(): string | undefined {
  if (process.env.LOCAL_DB_MEMORY === "1") return undefined;
  if (process.env.VERCEL || process.env.AWS_LAMBDA_FUNCTION_NAME) return undefined;
  return path.join(process.cwd(), ".localdb");
}

async function boot(): Promise<PGlite> {
  // 프로덕션(Supabase)에서는 이 경로를 타지 않으므로 필요할 때만 불러온다
  const { PGlite: PG } = await import("@electric-sql/pglite");

  const dir = dataDir();
  const pg = dir ? new PG(dir) : new PG();
  await pg.waitReady;

  // 디렉터리가 있어도 앞선 시도가 중간에 깨졌을 수 있으니 테이블 유무로 판단한다
  const probe = await pg.query<{ t: string | null }>(
    "select to_regclass('public.members')::text as t"
  );
  if (probe.rows[0]?.t) return pg;

  // seed.sql(실제 데이터)이 있으면 그걸, 없으면 seed.demo.sql(가짜 데이터)을 쓴다.
  const root = path.join(process.cwd(), "supabase");
  const seed = process.env.LOCAL_DB_SEED
    ?? (fs.existsSync(path.join(root, "seed.sql")) ? "seed.sql" : "seed.demo.sql");

  for (const file of ["schema.sql", seed]) {
    const p = path.join(root, file);
    if (!fs.existsSync(p)) {
      console.warn(`[local-db] ${file} 을 찾지 못했습니다: ${p}`);
      continue;
    }
    await pg.exec(fs.readFileSync(p, "utf8"));
    console.log(`[local-db] ${file} 적용 완료 (${dir ? dir : "메모리"})`);
  }
  return pg;
}

function pg(): Promise<PGlite> {
  if (!g[SHARED]) {
    // 부팅이 실패하면 거절된 프로미스를 계속 물고 있지 않도록 비운다
    g[SHARED] = boot().catch((err) => {
      g[SHARED] = null;
      throw err;
    });
  }
  return g[SHARED];
}

const ident = (s: string) => '"' + s.replace(/"/g, '""') + '"';

function whereClause(filters: Filter[], params: unknown[]): string {
  if (filters.length === 0) return "";
  const parts = filters.map((f) => {
    switch (f.op) {
      case "eq":
        params.push(f.val);
        return `${ident(f.col)} = $${params.length}`;
      case "neq":
        params.push(f.val);
        return `${ident(f.col)} <> $${params.length}`;
      case "gte":
        params.push(f.val);
        return `${ident(f.col)} >= $${params.length}`;
      case "lte":
        params.push(f.val);
        return `${ident(f.col)} <= $${params.length}`;
      case "ilike":
        params.push(f.val);
        return `${ident(f.col)} ILIKE $${params.length}`;
      case "is":
        return `${ident(f.col)} IS ${f.val === null ? "NULL" : f.val ? "TRUE" : "FALSE"}`;
      case "in": {
        const arr = (f.val as unknown[]) ?? [];
        if (arr.length === 0) return "FALSE";
        const slots = arr.map((v) => {
          params.push(v);
          return `$${params.length}`;
        });
        return `${ident(f.col)} IN (${slots.join(", ")})`;
      }
      default:
        return "TRUE";
    }
  });
  return " WHERE " + parts.join(" AND ");
}

/**
 * PGlite 는 date/timestamp 를 JS Date 로 돌려주지만 Supabase(PostgREST)는
 * 문자열로 준다. 앱 코드가 양쪽에서 똑같이 동작하도록 문자열로 맞춘다.
 */
const DATE_OID = 1082;

function serialize(row: Row, fields: { name: string; dataTypeID: number }[]): Row {
  const oid = new Map(fields.map((f) => [f.name, f.dataTypeID]));
  const out: Row = {};
  for (const [k, v] of Object.entries(row)) {
    out[k] =
      v instanceof Date
        ? oid.get(k) === DATE_OID
          ? v.toISOString().slice(0, 10)
          : v.toISOString()
        : v;
  }
  return out;
}

class Query implements PromiseLike<{ data: Row[] | Row | null; error: null }> {
  private filters: Filter[] = [];
  private orderBy: { col: string; asc: boolean; nullsFirst: boolean }[] = [];
  private single = false;

  constructor(
    private table: string,
    private mode: "select" | "insert" | "update" | "delete" | "upsert",
    private payload?: Row | Row[]
  ) {}

  select() {
    return this;
  }
  eq(col: string, val: unknown) {
    this.filters.push({ col, op: "eq", val });
    return this;
  }
  neq(col: string, val: unknown) {
    this.filters.push({ col, op: "neq", val });
    return this;
  }
  gte(col: string, val: unknown) {
    this.filters.push({ col, op: "gte", val });
    return this;
  }
  lte(col: string, val: unknown) {
    this.filters.push({ col, op: "lte", val });
    return this;
  }
  ilike(col: string, val: unknown) {
    this.filters.push({ col, op: "ilike", val });
    return this;
  }
  is(col: string, val: unknown) {
    this.filters.push({ col, op: "is", val });
    return this;
  }
  in(col: string, val: unknown[]) {
    this.filters.push({ col, op: "in", val });
    return this;
  }
  order(col: string, opts?: { ascending?: boolean; nullsFirst?: boolean }) {
    this.orderBy.push({
      col,
      asc: opts?.ascending !== false,
      nullsFirst: opts?.nullsFirst ?? false,
    });
    return this;
  }
  maybeSingle() {
    this.single = true;
    return this;
  }
  limit() {
    return this;
  }

  private build(): { sql: string; params: unknown[] } {
    const params: unknown[] = [];
    const t = ident(this.table);

    if (this.mode === "select") {
      let sql = `SELECT * FROM ${t}${whereClause(this.filters, params)}`;
      if (this.orderBy.length) {
        sql +=
          " ORDER BY " +
          this.orderBy
            .map(
              (o) =>
                `${ident(o.col)} ${o.asc ? "ASC" : "DESC"} NULLS ${
                  o.nullsFirst ? "FIRST" : "LAST"
                }`
            )
            .join(", ");
      }
      return { sql, params };
    }

    if (this.mode === "insert" || this.mode === "upsert") {
      const rows = Array.isArray(this.payload) ? this.payload : [this.payload as Row];
      const cols = Object.keys(rows[0] ?? {});
      const tuples = rows.map(
        (r) =>
          "(" +
          cols
            .map((c) => {
              params.push(r[c]);
              return `$${params.length}`;
            })
            .join(", ") +
          ")"
      );
      const conflict =
        this.mode === "upsert" ? " ON CONFLICT DO NOTHING" : "";
      return {
        sql: `INSERT INTO ${t} (${cols.map(ident).join(", ")}) VALUES ${tuples.join(
          ", "
        )}${conflict} RETURNING *`,
        params,
      };
    }

    if (this.mode === "update") {
      const row = this.payload as Row;
      const sets = Object.keys(row).map((c) => {
        params.push(row[c]);
        return `${ident(c)} = $${params.length}`;
      });
      return {
        sql: `UPDATE ${t} SET ${sets.join(", ")}${whereClause(
          this.filters,
          params
        )} RETURNING *`,
        params,
      };
    }

    return {
      sql: `DELETE FROM ${t}${whereClause(this.filters, params)} RETURNING *`,
      params,
    };
  }

  async run() {
    const { sql, params } = this.build();
    const client = await pg();
    if (process.env.LOCAL_DB_TRACE === "1" && this.mode !== "select") {
      console.log("[local-db]", sql, JSON.stringify(params).slice(0, 200));
    }
    try {
      const res = await client.query<Row>(sql, params as never[]);
      const rows = (res.rows ?? []).map((r) => serialize(r, res.fields));
      return { data: this.single ? (rows[0] ?? null) : rows, error: null };
    } catch (err) {
      console.error(
        "[local-db]",
        sql,
        err instanceof Error ? err.message : String(err)
      );
      return { data: this.single ? null : [], error: null };
    }
  }

  then<R1 = { data: Row[] | Row | null; error: null }, R2 = never>(
    onFulfilled?: ((v: { data: Row[] | Row | null; error: null }) => R1 | PromiseLike<R1>) | null,
    onRejected?: ((reason: unknown) => R2 | PromiseLike<R2>) | null
  ): PromiseLike<R1 | R2> {
    return this.run().then(onFulfilled, onRejected);
  }
}

export function localClient() {
  return {
    from(table: string) {
      return {
        select: () => new Query(table, "select"),
        insert: (payload: Row | Row[]) => new Query(table, "insert", payload),
        upsert: (payload: Row | Row[]) => new Query(table, "upsert", payload),
        update: (payload: Row) => new Query(table, "update", payload),
        delete: () => new Query(table, "delete"),
      };
    },
  };
}
