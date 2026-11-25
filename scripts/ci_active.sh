#!/usr/bin/env bash
# Your CI jobs that are queued or running (AGENTS.md section 8: at most 2 per agent at a time).
#   scripts/ci_active.sh <agent-id> [<branch> ...]
# Counts proof checks on every branch signed by the agent, any extra legacy branches, and its cloud jobs (run
# titles "cloud <agent-id>-..."), each cloud shard as one job. Prints them and the total; exits 1 if starting
# CI_NEED more jobs (default 1) would exceed the limit of 2.
set -euo pipefail
REPO=agalatan/grothendieck-lean
[ $# -ge 1 ] || { echo "usage: ci_active.sh <agent-id> [<branch> ...]" >&2; exit 2; }
id=$1; shift
gh run list --repo "$REPO" --limit 100 --json databaseId,status,headBranch,workflowName,displayTitle,createdAt |
python3 -c '
import json, os, re, subprocess, sys
agent = sys.argv[1]
signed = re.compile(r"^(?:claude|codex|gemini)-[0-9a-f]{4}/")
legacy = {ref for ref in sys.argv[2:] if ref != "master" and not signed.match(ref)}
total = 0
for r in json.load(sys.stdin):
    if r["status"] == "completed":
        continue
    cloud = r["workflowName"] == "Cloud job" and r["displayTitle"].startswith(f"cloud {agent}-")
    branch = r["headBranch"]
    check = r["workflowName"] == "Lean proof check" and (
        branch.startswith(agent + "/") or branch in legacy
    )
    if not (cloud or check):
        continue
    n = 1
    if cloud:  # each shard is a job
        jobs = json.loads(subprocess.run(["gh", "api", f"repos/agalatan/grothendieck-lean/actions/runs/{r['"'"'databaseId'"'"']}/jobs",
                                          "--jq", "[.jobs[] | select(.name | startswith(\"shard\")) | select(.status != \"completed\")] | length"],
                                         capture_output=True, text=True).stdout or "1")
        n = max(1, jobs)
    total += n
    print(f"  {r['"'"'databaseId'"'"']}  {r['"'"'createdAt'"'"'][5:16]}  {r['"'"'status'"'"']:11}  {n} job(s)  {r['"'"'headBranch'"'"']}  {r['"'"'displayTitle'"'"'][:60]}")
need = int(os.environ.get("CI_NEED", "1"))
print(f"{total} CI job(s) of {agent} queued or running (limit 2)")
sys.exit(1 if total + need > 2 else 0)
' "$id" "$@"
