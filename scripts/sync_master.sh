#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
#   --build   afterwards, start the local master build job (scripts/master_build_job.sh: background, niced,
#             incremental, in its own worktree) unless it is running or the cache is current. It publishes the
#             snapshot .lake/master-cache that new worktrees clone (AGENTS.md §5). One job at a time (pid in
#             $MAIN/.lake/master-build.pid, log in $MAIN/.lake/master-build.log).
#   --status  only report the local build cache: which master commit it holds, and whether a build is running.
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
PIDF="$MAIN/.lake/master-build.pid"
LOG="$MAIN/.lake/master-build.log"

running() { [ -f "$PIDF" ] && kill -0 "$(cat "$PIDF")" 2>/dev/null; }

start_build() {
  # run a private copy: syncs may change scripts/master_build_job.sh while bash is still reading it
  cp "$MAIN/scripts/master_build_job.sh" "$MAIN/.lake/master-build-job.sh"
  (cd "$MAIN" && bash -c 'set -m; nohup nice -n 15 bash .lake/master-build-job.sh > .lake/master-build.log 2>&1 & echo $! > .lake/master-build.pid')
  echo "started the master build job (pgid $(cat "$PIDF")); log $LOG"
}

status() {
  local head built
  head=$(git -C "$MAIN" rev-parse origin/master)
  built=$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)
  if [ "$built" = "$head" ]; then
    echo "local build cache (.lake/master-cache): master ${built:0:7}, current"
  elif [ -n "$built" ]; then
    echo "local build cache (.lake/master-cache): master ${built:0:7}; origin/master is ${head:0:7}"
  else
    echo "local build cache: none published yet"
  fi
  if running; then
    echo "master build running (pgid $(cat "$PIDF")), $(grep -oE '\[[0-9]+/[0-9]+\]' "$LOG" | tail -1)"
  fi
}

if [ "${1:-}" = "--status" ]; then status; exit 0; fi

git -C "$MAIN" fetch --prune origin
# where is master checked out, if anywhere?
WT=$(git -C "$MAIN" worktree list --porcelain | awk '/^worktree /{w=$2} /^branch refs\/heads\/master$/{print w}')
if [ -z "$WT" ]; then
  git -C "$MAIN" fetch origin master:master            # not checked out: move the ref directly (ff only)
elif [ -z "$(git -C "$WT" status --porcelain --untracked-files=no)" ]; then
  git -C "$WT" merge --ff-only origin/master           # checked out and clean: fast-forward the tree
else
  echo "master is checked out in $WT with local changes: not touching it. Report this to the user." >&2
  exit 1
fi
echo "master = $(git -C "$MAIN" rev-parse --short master) (origin/master = $(git -C "$MAIN" rev-parse --short origin/master))"
if [ "${1:-}" = "--build" ]; then
  if running; then
    echo "master build job already running (pgid $(cat "$PIDF")); log $LOG"
  elif [ "$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)" = "$(git -C "$MAIN" rev-parse origin/master)" ]; then
    echo "local build cache already current"
  else
    start_build
  fi
fi
