import { redirect } from "next/navigation";
import { currentMember } from "@/lib/session";
import { isConfigured } from "@/lib/db";
import { Shell } from "@/components/shell";

export const dynamic = "force-dynamic";

export default async function AppLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  if (!isConfigured()) redirect("/login");
  const me = await currentMember();
  if (!me) redirect("/login");
  return <Shell me={me}>{children}</Shell>;
}
