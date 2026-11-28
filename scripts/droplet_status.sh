#!/usr/bin/env bash
# One-screen status of the shared droplets (yo, and temporary droplets big and mega when up).
# Read-only: it never kills, modifies, or deletes anything.
# Run from the laptop:   scripts/droplet_status.sh [yo|big|mega ...]
# Shows: load, memory, disk (with the 3 GB floor of AGENTS.md section 12), CI runner state,
# the research share and ~/research-slots reservations on big and mega, active user jobs by folder (= owner),
# running Lean builds (with orphan detection), long-running wait loops, and the biggest build directories.
set -euo pipefail

if [ "$#" -gt 0 ]; then
  HOSTS=("$@")
else
  HOSTS=(yo big mega)
fi

inspect_host() {
  local host="$1"
  local timeout_s=15
  if [ "$host" != "yo" ]; then
    timeout_s=5
    if ! ssh -o BatchMode=yes -o ConnectTimeout="$timeout_s" "$host" true 2>/dev/null; then
      echo "================================================================================"
      echo "== $host: down / not provisioned"
      return 0
    fi
  fi

  echo "================================================================================"
  ssh -o BatchMode=yes -o ConnectTimeout="$timeout_s" "$host" bash -s -- "$host" <<'REMOTE'
set -u
ROLE="$1"
PROC_ROOT="${PROC_ROOT:-/proc}"
CGROUP_ROOT="${CGROUP_ROOT:-/sys/fs/cgroup}"
NCORES=$(nproc)
LOAD1=$(awk '{print $1}' "$PROC_ROOT/loadavg")
read -r TOTAL_GB USED_GB AVAIL_GB < <(free -g | awk '/^Mem:/{print $2, $3, $7}')

echo "== $ROLE ($(hostname), ${NCORES} vCPUs)  $(date -u '+%F %H:%M UTC')"
uptime | sed 's/^ */load: /'
printf "memory: %s GB used of %s GB, %s GB available\n" "$USED_GB" "$TOTAL_GB" "$AVAIL_GB"
df -h / | awk 'NR==2{print "disk: "$4" free of "$2" ("$5" used)"}'
avail_kb=$(df -k / | awk 'NR==2{print $4}')
[ "$avail_kb" -lt $((3*1024*1024)) ] && echo "WARNING: below the 3 GB floor (AGENTS.md section 12)"

echo; echo "== CI runner"
listener_pids=$(pgrep -x Runner.Listener || true)
worker_pids=$(pgrep -x Runner.Worker || true)
runner_online=0
if [ -n "$listener_pids" ]; then
  runner_online=1
  runners_desc=$(ps -o pid=,args= -p $listener_pids 2>/dev/null | awk '{printf "%s(pid %s) ", $2, $1}')
  if [ -n "$worker_pids" ]; then
    workers_desc=$(ps -o pid=,etimes= -p $worker_pids 2>/dev/null | awk '{printf "pid %s (%.1fh) ", $1, $2/3600}')
    echo "ONLINE (ACTIVE JOB: $workers_desc) — $runners_desc"
  else
    echo "ONLINE (idle, waiting for jobs) — $runners_desc"
  fi
elif [ "$ROLE" = "yo" ] && [ -f ~/actions-runner/runner.pid ] && kill -0 "$(cat ~/actions-runner/runner.pid)" 2>/dev/null; then
  runner_online=1
  echo "running (pgid $(cat ~/actions-runner/runner.pid)); last: $(grep -E 'Running job|completed with result' ~/actions-runner/runner.log 2>/dev/null | tail -1)"
else
  if [ "$ROLE" = "yo" ]; then
    echo "OFFLINE — restart with scripts/droplet_runner_setup.sh from the laptop"
  else
    echo "OFFLINE (no Runner.Listener process)"
  fi
fi

# Collect active user folders (under $HOME/*, excluding actions-runner* and grothe-caps)
user_jobs=$(
  PROC_ROOT="$PROC_ROOT" CGROUP_ROOT="$CGROUP_ROOT" python3 - "$HOME" <<'PY'
import os, sys

home = os.path.realpath(sys.argv[1])
proc_root = os.environ.get("PROC_ROOT", "/proc")
cg_root = os.environ.get("CGROUP_ROOT", "/sys/fs/cgroup")
groups = {}
for entry in (os.listdir(proc_root) if os.path.isdir(proc_root) else []):
    if not entry.isdigit():
        continue
    pid = int(entry)
    try:
        cwd = os.path.realpath(f"{proc_root}/{pid}/cwd")
    except OSError:
        continue
    if not cwd.startswith(home + "/"):
        continue
    rel = cwd[len(home) + 1:].split("/", 1)[0]
    if not rel or rel.startswith(".") or rel.startswith("actions-runner") or rel == "grothe-caps" or rel == "research-slots":
        continue
    try:
        with open(f"{proc_root}/{pid}/status", "r", encoding="utf-8", errors="replace") as fh:
            st = fh.read()
        with open(f"{proc_root}/{pid}/stat", "r", encoding="utf-8", errors="replace") as fh:
            stat_fields = fh.read().rsplit(")", 1)[1].split()
        pgid = int(stat_fields[2])
        rss_kb = 0
        anon_kb = 0
        cpus = "?"
        comm = "?"
        for line in st.splitlines():
            if line.startswith("Name:"):
                comm = line.split(":", 1)[1].strip()
            elif line.startswith("VmRSS:"):
                rss_kb = int(line.split()[1])
            elif line.startswith("RssAnon:"):
                anon_kb = int(line.split()[1])
            elif line.startswith("Cpus_allowed_list:"):
                cpus = line.split(":", 1)[1].strip()
        mem_max = "-"
        cg_id = None
        cg_cur_kb = None
        with open(f"{proc_root}/{pid}/cgroup", "r", encoding="utf-8", errors="replace") as fh:
            for line in fh:
                if line.startswith("0::"):
                    cg_rel = line.strip().split("::", 1)[1]
                    mx_path = f"{cg_root}{cg_rel}/memory.max"
                    cur_path = f"{cg_root}{cg_rel}/memory.current"
                    if os.path.exists(mx_path):
                        raw = open(mx_path).read().strip()
                        if raw != "max" and raw.isdigit():
                            mem_max = f"{int(raw) / (1024**3):.1f}G"
                            if os.path.exists(cur_path):
                                craw = open(cur_path).read().strip()
                                if craw.isdigit():
                                    cg_id = cg_rel
                                    cg_cur_kb = int(craw) // 1024
                    break
    except OSError:
        continue
    if comm in ("sshd", "systemd", "sd-pam"):
        continue
    rec = groups.setdefault(rel, {"rss_kb": 0, "anon_kb": 0, "cgroups": {}, "procs": 0, "cpus": set(), "mem_max": set(), "pgids": set(), "lean": 0})
    rec["rss_kb"] += rss_kb
    rec["anon_kb"] += anon_kb
    if cg_id is not None and cg_cur_kb is not None:
        rec["cgroups"][cg_id] = cg_cur_kb
    rec["procs"] += 1
    rec["cpus"].add(cpus)
    if mem_max != "-":
        rec["mem_max"].add(mem_max)
    rec["pgids"].add(pgid)
    if comm == "lean":
        rec["lean"] += 1

# Use cgroup memory.current when scoped, else RssAnon (avoids counting shared .olean mmaps N times across N lean procs)
def eff_kb(v):
    return max(v["anon_kb"], sum(v["cgroups"].values()))

total_eff_kb = sum(eff_kb(v) for v in groups.values())
print(f"TOTAL_MEM_GB={total_eff_kb / (1024**2):.2f}")
for rel in sorted(groups):
    v = groups[rel]
    cpus_s = ",".join(sorted(v["cpus"]))
    mm_s = ",".join(sorted(v["mem_max"])) if v["mem_max"] else "unbounded"
    lean_s = f", lean={v['lean']}" if v["lean"] else ""
    mem_s = f"anon={v['anon_kb']/(1024**2):.2f}G"
    if v["cgroups"]:
        mem_s += f" (cg={sum(v['cgroups'].values())/(1024**2):.2f}G)"
    print(f"USER|{rel}|procs={v['procs']}{lean_s}|cpus={cpus_s}|{mem_s}|MemoryMax={mm_s}")
PY
)
total_research_gb=$(printf "%s\n" "$user_jobs" | sed -n 's/^TOTAL_MEM_GB=//p')
user_lines=$(printf "%s\n" "$user_jobs" | grep '^USER|' || true)

if [ "$ROLE" = "big" ] || [ "$ROLE" = "mega" ]; then
  echo; echo "== Research share (AGENTS.md §12)"
  if [ "$runner_online" -eq 0 ]; then
    python3 - "$NCORES" "$LOAD1" "$TOTAL_GB" "$AVAIL_GB" "$total_research_gb" <<'PY'
import math, sys
ncores = int(sys.argv[1])
load1 = float(sys.argv[2])
total_gb = int(sys.argv[3])
avail_gb = int(sys.argv[4])
res_gb = float(sys.argv[5])
idle_cores = max(0.0, ncores - load1)
floor_ok = (idle_cores >= ncores / 4.0) and (avail_gb >= total_gb / 4.0)
half_cores = max(1, int(math.floor(idle_cores / 2.0)))
half_mem = max(1, avail_gb // 2)
if floor_ok:
    print(f"runner OFFLINE: new job may take <= {half_cores} cores and MemoryMax={half_mem}G "
          f"(idle ~{idle_cores:.1f}/{ncores} cores, {avail_gb}/{total_gb} GB avail; active user mem {res_gb:.2f} GB; Lean allowed)")
else:
    print(f"runner OFFLINE — WAIT (below 1/4 free floor): idle ~{idle_cores:.1f}/{ncores} cores, "
          f"{avail_gb}/{total_gb} GB avail; active user mem {res_gb:.2f} GB")
PY
  else
    if [ "$ROLE" = "mega" ]; then
      upper_range="16-31"; per_cap="48G"; agg_cap=$((TOTAL_GB / 2))
      slots=(16-23 24-31)
    else
      upper_range="24-47"; per_cap="16G on 24-31 and 32-39, 15G on 40-47"; agg_cap=$((TOTAL_GB / 2))
      slots=(24-31 32-39 40-47)
    fi
    echo "runner ONLINE (Lean FORBIDDEN): research half = cores $upper_range (8-core slots, MemoryMax=$per_cap, aggregate <= ${agg_cap} GB); active user mem ${total_research_gb} GB"
    printf "slots (~/research-slots):"
    for sl in "${slots[@]}"; do
      if [ -d ~/research-slots/"$sl" ]; then
        owner_raw=$(tr '\n' ' ' < ~/research-slots/"$sl"/owner 2>/dev/null | sed 's/  */ /g; s/^ //; s/ $//' || true)
        pg_cand=$(printf "%s" "$owner_raw" | awk '{print $2}')
        if [[ "$pg_cand" =~ ^[0-9]+$ ]] && [ -z "$(pgrep -g "$pg_cand" 2>/dev/null || true)" ]; then
          printf "  [%s: STALE (%s — pgid %s gone)]" "$sl" "$owner_raw" "$pg_cand"
        else
          printf "  [%s: RESERVED (%s)]" "$sl" "${owner_raw:-unknown}"
        fi
      else
        printf "  [%s: FREE]" "$sl"
      fi
    done
    echo
    # Flag any extra slot directories outside the standard list
    if [ -d ~/research-slots ]; then
      for d in ~/research-slots/*; do
        [ -d "$d" ] || continue
        bn=$(basename "$d")
        known=0
        for sl in "${slots[@]}"; do [ "$sl" = "$bn" ] && known=1; done
        [ "$known" -eq 0 ] && echo "  extra reservation dir: ~/research-slots/$bn ($(tr '\n' ' ' < "$d/owner" 2>/dev/null || true))"
      done
    fi
  fi
fi

echo; echo "== Active user jobs under ~ (owner folder, CPU mask, RSS, cgroup MemoryMax)"
if [ -n "$user_lines" ]; then
  printf "%s\n" "$user_lines" | awk -F'|' '{printf "  %-36s %-18s %-14s %-12s %s\n", $2, $3, $4, $5, $6}'
else
  echo "  (none)"
fi

echo; echo "== Lean builds by directory (owner), age of the oldest process"
if [ "$runner_online" -eq 1 ] && { [ "$ROLE" = "big" ] || [ "$ROLE" = "mega" ]; } && [ -n "$(pgrep -x lean || true)" ]; then
  echo "WARNING: lean processes running on $ROLE while CI runner is ONLINE (violates AGENTS.md §12 unless runner-owned)!"
fi
for p in $(pgrep -x lean || true); do
  dir=$(readlink -f /proc/$p/cwd 2>/dev/null || echo "?")
  mod=$(tr '\0' ' ' < /proc/$p/cmdline 2>/dev/null | grep -oE '[A-Za-z0-9_/]+\.lean' | head -1 || true)
  echo "$dir|$(ps -o etimes= -p $p 2>/dev/null | tr -d ' ')|$mod|$(ps -o ppid= -p $p 2>/dev/null | tr -d ' ')"
done | sort | awk -F'|' '
  NF>=4 && $1!="" { n[$1]++; if ($2+0>age[$1]) age[$1]=$2+0; mods[$1]=mods[$1] " " gensub(/.*\//,"","g",$3); if ($4==1) orphan[$1]++ }
  END { for (d in n) printf "%-62s %2d lean, oldest %5.1f h%s\n   %s\n", d, n[d], age[d]/3600,
                                (orphan[d] ? "  ORPHANS: " orphan[d] : ""), substr(mods[d],1,150) }'
[ -z "$(pgrep -x lean || true)" ] && echo "(none)"

echo; echo "== wait loops older than 6 h (possibly stale)"
ps -eo pid,etimes,args | awk '$2>21600 && /while kill -0|until |sleep [0-9]/ && !/awk/ {printf "%s  %.1f h  %s\n",$1,$2/3600,substr($0,index($0,$3),110)}' | head -10

echo; echo "== biggest build directories under ~ (delete your own .lake/build when your work is merged)"
du -sh ~/*/.lake/build ~/actions-runner*/_work/*/*/.lake/build ~/actions-runner*-work/*/*/.lake/build 2>/dev/null | sort -rh | head -8
REMOTE
}

for h in "${HOSTS[@]}"; do
  inspect_host "$h"
done
