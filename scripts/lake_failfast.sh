#!/usr/bin/env bash
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
trap 'rm -f "$log"' EXIT
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
    kill -- -"$pid" 2>/dev/null
    break
  fi
  sleep 2
done
wait "$pid"; rc=$?
sleep 1; kill "$tailpid" 2>/dev/null; wait "$tailpid" 2>/dev/null
if [ "$failed" = 1 ]; then
  echo "::error::stopped at the first failed module (fail fast); see the ✖ line above"
  exit 1
fi
exit "$rc"
