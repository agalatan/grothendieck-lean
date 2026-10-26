#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
#   --build   afterwards, (re)start a background, niced, incremental `lake build Grothe` of master in the main
#             checkout, so that its .lake/build stays current: new worktrees clone it (AGENTS.md §2). It never
#             starts a second one (pid in $MAIN/.lake/master-build.pid, log in $MAIN/.lake/master-build.log).
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
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
  PIDF="$MAIN/.lake/master-build.pid"
  if [ -f "$PIDF" ] && kill -0 "$(cat "$PIDF")" 2>/dev/null; then
    echo "master build already running (pgid $(cat "$PIDF")); log $MAIN/.lake/master-build.log"
  elif [ "$WT" != "$MAIN" ]; then
    echo "the main checkout is not on master; not building it" >&2
  else
    cd "$MAIN" && bash -c 'set -m; nohup nice -n 15 lake build Grothe > .lake/master-build.log 2>&1 & echo $! > .lake/master-build.pid'
    echo "started master build in the main checkout (pgid $(cat "$PIDF")); log $MAIN/.lake/master-build.log"
  fi
fi
