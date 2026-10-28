#!/usr/bin/env bash
# Replay actual first/second-center grade checks and final strict audit in one
# workspace, limiting each Lake invocation to one bounded grade target.
# This script does not certify any Gaussian approximation error.
# Agent-ID: codex-8c4d.
set -euo pipefail

if [ "$#" -gt 1 ] || { [ "$#" -eq 1 ] && [ "$1" != '--plan' ]; }; then
  printf 'Usage: %s [--plan]\n' "$0" >&2
  exit 2
fi

# All raw checks precede bindings: the latter import the full source arrays.
# Sequential commands share the same .lake/build; no cross-job cache is assumed.
plan() {
  local q
  for q in $(seq 0 90); do
    printf 'Grothe.UpperChaos.TaylorFirstIntegerGrade%03dCheck\n' "$q"
  done
  for q in $(seq 0 45); do
    printf 'Grothe.UpperChaos.TaylorSecondIntegerGrade%03dCheck\n' "$q"
  done
  for q in $(seq 0 90); do
    printf 'Grothe.UpperChaos.FirstCenterGrade%03dBinding\n' "$q"
  done
  for q in $(seq 0 45); do
    printf 'Grothe.UpperChaos.SecondCenterGrade%03dBinding\n' "$q"
  done
  printf '%s\n' 'Grothe.UpperChaos.FirstSecondKernelBandEnergy'
}

if [ "${1:-}" = '--plan' ]; then
  plan
  exit 0
fi

# Thresholds apply to the workspace filesystem where Lake writes its cache.
# Validate only during actual execution; --plan remains a pure listing.
MIN_FREE_GIB="${MIN_FREE_GIB:-3}"
START_MIN_FREE_GIB="${START_MIN_FREE_GIB:-4}"
for setting in MIN_FREE_GIB START_MIN_FREE_GIB; do
  value="${!setting}"
  if [[ ! "$value" =~ ^[0-9]+$ ]] || [[ ! "$value" =~ [1-9] ]]; then
    printf '%s must be a positive integer number of GiB\n' "$setting" >&2
    exit 2
  fi
done

test "$(cat lean-toolchain)" = 'leanprover/lean4:v4.34.1'
lean --version
test -n "${OUT:?Set OUT to an owned result directory}"
mkdir -p "$OUT/first-second-energy-metrics"

# Persist the exact available and required byte counts before deciding. A low
# disk condition exits before launching Lake and leaves the existing cache alone.
disk_check() {
  local gib="$1" label="$2" file="$3" status=0
  python3 - "$gib" "$label" > "$file" <<'PYDISK' || status=$?
import shutil
import sys

threshold = int(sys.argv[1]) * 1024 ** 3
free = shutil.disk_usage('.').free
ok = free >= threshold
print(f'check={sys.argv[2]} free_bytes={free} minimum_bytes={threshold} status={"ok" if ok else "insufficient"}')
if not ok:
    sys.exit(3)
PYDISK
  cat "$file"
  return "$status"
}

if ! disk_check "$START_MIN_FREE_GIB" startup "$OUT/first-second-energy-metrics/startup.disk.txt"; then
  printf 'Stopping before build: less than %s GiB free in the workspace.\n' "$START_MIN_FREE_GIB" >&2
  exit 3
fi
python3 tools/gen_taylor_first_second_integers.py --full --check
python3 tools/gen_first_second_grade_bindings.py --check
python3 tools/gen_first_second_grade_energy_targets.py --check
python3 - <<'PY'
import json
from pathlib import Path
import subprocess

for package in json.loads(Path('lake-manifest.json').read_text())['packages']:
    if package['type'] != 'git':
        raise SystemExit('Unexpected package kind')
    revision = subprocess.check_output(
        ['git', '-C', str(Path('.lake/packages') / package['name']), 'rev-parse', 'HEAD'],
        text=True).strip()
    if revision != package['rev']:
        raise SystemExit('Dependency revision differs: ' + package['name'])
print('All dependency revisions match the committed manifest.')
PY

# Lean's supported runtime limit applies to Lake and its compiler children.
# Keep a small default; callers may explicitly select a positive value.
export LEAN_NUM_THREADS="${LEAN_NUM_THREADS:-1}"
case "$LEAN_NUM_THREADS" in
  ''|*[!0-9]*) printf 'LEAN_NUM_THREADS must be a positive integer\n' >&2; exit 2 ;;
esac
if [ "$LEAN_NUM_THREADS" -lt 1 ]; then
  printf 'LEAN_NUM_THREADS must be a positive integer\n' >&2
  exit 2
fi
printf 'LEAN_NUM_THREADS=%s\n' "$LEAN_NUM_THREADS"

snapshot() {
  printf 'utc=%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  if command -v free >/dev/null 2>&1; then free -m; fi
  for file in /sys/fs/cgroup/memory.current /sys/fs/cgroup/memory.max /sys/fs/cgroup/memory.events; do
    if [ -r "$file" ]; then
      printf '%s: ' "$file"
      cat "$file"
    fi
  done
  df -h .
}

index=0
while IFS= read -r target; do
  index=$((index + 1))
  stem=$(printf '%03d-%s' "$index" "${target##*.}")
  metric="$OUT/first-second-energy-metrics/$stem"
  printf '\n[%d/275] %s\n' "$index" "$target"
  snapshot > "$metric.before.txt"
  if ! disk_check "$MIN_FREE_GIB" "$target" "$metric.disk.txt"; then
    printf 'Stopping before %s: less than %s GiB free in the workspace.\n' "$target" "$MIN_FREE_GIB" >&2
    exit 3
  fi
  start=$SECONDS
  status=0
  if [ "$(uname -s)" = 'Linux' ] && [ -x /usr/bin/time ]; then
    /usr/bin/time -v -o "$metric.time.txt" lake --wfail build "$target" || status=$?
    cat "$metric.time.txt"
  else
    lake --wfail build "$target" || status=$?
    printf 'elapsed_seconds=%s (maximum RSS unavailable on this platform)\n' "$((SECONDS-start))" | tee "$metric.time.txt"
  fi
  snapshot > "$metric.after.txt"
  printf 'target=%s status=%s elapsed_seconds=%s\n' "$target" "$status" "$((SECONDS-start))"
  if [ "$status" -ne 0 ]; then
    printf 'Stopping at the first failed target: %s\n' "$target" >&2
    exit "$status"
  fi
done < <(plan)

if [ "$index" -ne 275 ]; then
  printf 'Unexpected plan size: %s targets\n' "$index" >&2
  exit 1
fi
printf 'All 274 grade targets and final strict-audit target passed in one workspace.\n'
