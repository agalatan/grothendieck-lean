#!/usr/bin/env bash
# One-screen status of the shared droplet (ssh yo). Read-only: it never kills or deletes anything.
# Run from the laptop:   scripts/droplet_status.sh
# Shows: load, memory, disk (with the 3 GB floor of AGENTS.md section 5), the CI runner, every running Lean build
# grouped by directory (= owner) with its age, orphaned lean processes (parent died: ppid 1, they keep writing
# .olean files and must be stopped by their owner), long-running wait loops, and the biggest build directories.
set -euo pipefail
ssh -o ConnectTimeout=15 yo bash -s <<'REMOTE'
set -u
echo "== $(hostname)  $(date -u '+%F %H:%M UTC')"
uptime | sed 's/^ */load: /'
free -g | awk '/^Mem:/{printf "memory: %s GB used of %s GB, %s GB available\n",$3,$2,$7}'
df -h / | awk 'NR==2{print "disk: "$4" free of "$2" ("$5" used)"}'
avail_kb=$(df -k / | awk 'NR==2{print $4}')
[ "$avail_kb" -lt $((3*1024*1024)) ] && echo "WARNING: below the 3 GB floor (AGENTS.md section 5)"

echo; echo "== CI runner"
if [ -f ~/actions-runner/runner.pid ] && kill -0 "$(cat ~/actions-runner/runner.pid)" 2>/dev/null; then
  echo "running (pgid $(cat ~/actions-runner/runner.pid)); last: $(grep -E 'Running job|completed with result' ~/actions-runner/runner.log 2>/dev/null | tail -1)"
else
  echo "NOT running — restart with scripts/droplet_runner_setup.sh from the laptop"
fi

echo; echo "== Lean builds by directory (owner), age of the oldest process"
for p in $(pgrep -x lean); do
  dir=$(readlink -f /proc/$p/cwd 2>/dev/null)
  mod=$(tr '\0' ' ' < /proc/$p/cmdline | grep -oE '[A-Za-z0-9_/]+\.lean' | head -1)
  echo "$dir|$(ps -o etimes= -p $p | tr -d ' ')|$mod|$(ps -o ppid= -p $p | tr -d ' ')"
done | sort | awk -F'|' '
  { n[$1]++; if ($2>age[$1]) age[$1]=$2; mods[$1]=mods[$1] " " gensub(/.*\//,"","g",$3); if ($4==1) orphan[$1]++ }
  END { for (d in n) printf "%-62s %2d lean, oldest %5.1f h%s\n   %s\n", d, n[d], age[d]/3600,
                                (orphan[d] ? "  ORPHANS: " orphan[d] : ""), substr(mods[d],1,150) }'
[ -z "$(pgrep -x lean)" ] && echo "(none)"

echo; echo "== wait loops older than 6 h (possibly stale)"
ps -eo pid,etimes,args | awk '$2>21600 && /while kill -0|until |sleep [0-9]/ && !/awk/ {printf "%s  %.1f h  %s\n",$1,$2/3600,substr($0,index($0,$3),110)}' | head -10

echo; echo "== biggest build directories under ~ (delete your own .lake/build when your work is merged)"
du -sh ~/*/.lake/build ~/actions-runner/_work/*/*/.lake/build 2>/dev/null | sort -rh | head -8
REMOTE
