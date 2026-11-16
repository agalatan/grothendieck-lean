#!/usr/bin/env bash
# scripts/lake_failfast.sh
# Run a build command and stop it at the first failed module.
#
#   scripts/lake_failfast.sh lake build Grothe --log-level=warning
#
# Lake keeps building after a module fails (it has no fail-fast option), so a broken module near the start of a long
# build is reported only at the end. This wrapper runs the command in its own process group, streams its output, and
# at the first failure line (`✖ ...`) lets the error details through for a few seconds, then kills the whole group
# (lean children included) and exits 1. Otherwise it exits with the command's own status.
set -u
GRACE=${FAILFAST_GRACE:-5}
log=$(mktemp)
pid=""
tailpid=""

# Job control below deliberately gives the build its own process group. CI cancels
# this wrapper's group, so forward cancellation to the build's group as well.
# Always clean up descendants, even if their parent already exited. A child that
# ignores TERM must not leave the wrapper waiting forever after a failed module.
# Agent-ID: codex-9c42. Refs #486.
cleanup() {
  local rc=$? attempt
  trap - EXIT
  trap '' INT TERM
  if [ -n "$pid" ]; then
    kill -TERM -- "-$pid" 2>/dev/null || true
    for attempt in {1..20}; do
      kill -0 -- "-$pid" 2>/dev/null || break
      sleep 0.1
    done
    kill -KILL -- "-$pid" 2>/dev/null || true
    wait "$pid" 2>/dev/null || true
  fi
  if [ -n "$tailpid" ]; then
    kill "$tailpid" 2>/dev/null || true
    wait "$tailpid" 2>/dev/null || true
  fi
  rm -f "$log"
  exit "$rc"
}
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM
set -m
"$@" > "$log" 2>&1 &
pid=$!
set +m
tail -n +1 -f "$log" &
tailpid=$!
failed=0
while kill -0 "$pid" 2>/dev/null; do
  if grep -q '^✖' "$log"; then
    sleep "$GRACE"
    failed=1
    break
  fi
  sleep 2
done
# Do not wait for a failing child before cleanup has stopped its process group.
# Also catch a failure line emitted just before a command exits successfully.
if grep -q '^✖' "$log"; then failed=1; fi
if [ "$failed" = 1 ]; then
  sleep 1
  echo "::error::stopped at the first failed module (fail fast); see the ✖ line above"
  exit 1
fi
wait "$pid"; rc=$?
sleep 1
exit "$rc"
