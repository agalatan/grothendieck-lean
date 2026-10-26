#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
#   --build   afterwards, (re)start a background, niced, incremental `lake build Grothe` of master in the main
#             checkout, so that its .lake/build stays current: new worktrees clone it (AGENTS.md §2). It never
#             starts a second one (pid in $MAIN/.lake/master-build.pid, log in $MAIN/.lake/master-build.log).
#   --status  only report the local build cache: which master commit it holds, and whether a build is running.
# The build itself is scripts/master_build_job.sh: after `lake build Grothe` succeeds it records the commit in
# .lake/build/built-commit and publishes a consistent snapshot .lake/master-cache, which worktrees clone with
# scripts/clone_master_build.sh. A fast-forward of the main checkout while a build is running restarts that build
# (changing sources under a running build leaves it inconsistent).
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
PIDF="$MAIN/.lake/master-build.pid"
LOG="$MAIN/.lake/master-build.log"

running() { [ -f "$PIDF" ] && kill -0 "$(cat "$PIDF")" 2>/dev/null; }

start_build() {
  (cd "$MAIN" && bash -c 'set -m; nohup nice -n 15 bash scripts/master_build_job.sh > .lake/master-build.log 2>&1 & echo $! > .lake/master-build.pid')
  echo "started master build in the main checkout (pgid $(cat "$PIDF")); log $LOG"
}

status() {
  local head built
  head=$(git -C "$MAIN" rev-parse HEAD)
  built=$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)
  if [ "$built" = "$head" ]; then
    echo "local build cache (.lake/master-cache): master $(git -C "$MAIN" rev-parse --short HEAD), current"
  elif [ -n "$built" ]; then
    echo "local build cache (.lake/master-cache): master ${built:0:7}; the main checkout is at $(git -C "$MAIN" rev-parse --short HEAD)"
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
BEFORE=$(git -C "$MAIN" rev-parse master)
if [ -z "$WT" ]; then
  git -C "$MAIN" fetch origin master:master            # not checked out: move the ref directly (ff only)
elif [ -z "$(git -C "$WT" status --porcelain --untracked-files=no)" ]; then
  git -C "$WT" merge --ff-only origin/master           # checked out and clean: fast-forward the tree
else
  echo "master is checked out in $WT with local changes: not touching it. Report this to the user." >&2
  exit 1
fi
echo "master = $(git -C "$MAIN" rev-parse --short master) (origin/master = $(git -C "$MAIN" rev-parse --short origin/master))"
if [ "$WT" = "$MAIN" ] && [ "$(git -C "$MAIN" rev-parse master)" != "$BEFORE" ] && running; then
  # the sources changed under the running build: stop it with all its children and start again
  kill -- -"$(cat "$PIDF")" 2>/dev/null || true
  while pgrep -g "$(cat "$PIDF")" >/dev/null 2>&1; do sleep 1; done
  echo "master moved during the master build: restarting it"
  start_build
elif [ "${1:-}" = "--build" ]; then
  if running; then
    echo "master build already running (pgid $(cat "$PIDF")); log $LOG"
  elif [ "$WT" != "$MAIN" ]; then
    echo "the main checkout is not on master; not building it" >&2
  elif [ "$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)" = "$(git -C "$MAIN" rev-parse HEAD)" ]; then
    echo "local build cache already complete for this master"
  else
    start_build
  fi
fi
