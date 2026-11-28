#!/usr/bin/env bash
# Classify a refused push of a checked landing (called by scripts/land_ready.sh when master did not move).
# usage: land_push_refusal.sh <base> <merge-candidate> <file holding the push's stderr>
# Prints exactly one word:
#   workflow-permission   the delivery changes .github/workflows and GitHub refused the push for the token's
#                         missing workflow permission: a permission failure, not a failed check (AGENTS.md §9)
#   workflow-unexplained  the delivery changes .github/workflows, but the refusal message is not the permission one
#   other                 the delivery changes no workflow
# `git diff --quiet` with a pathspec (exit 1 = differences) avoids a pipe into `grep -q`, which under pipefail
# turns git's SIGPIPE into exit 141.
set -uo pipefail
base=$1; candidate=$2; errfile=$3
git diff --quiet "$base" "$candidate" -- .github/workflows
case $? in
  0) echo other; exit 0 ;;
  1) ;;
  *) echo "land_push_refusal: git diff failed" >&2; exit 2 ;;
esac
if grep -qiE "without .?workflows.? permission|refusing to allow .* to (create or update|update) workflow" "$errfile"; then
  echo workflow-permission
else
  echo workflow-unexplained
fi
