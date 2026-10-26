#!/usr/bin/env bash
# Give a worktree master's compiled build, so that Lake rebuilds only what the branch changes (AGENTS.md §5).
#   scripts/clone_master_build.sh <worktree>            # worktree without a .lake/build yet
#   scripts/clone_master_build.sh --replace <worktree>  # delete the worktree's .lake/build first (refresh)
# It links the shared Lean packages and clones the published snapshot of the main checkout's master build
# (.lake/master-cache, written by scripts/master_build_job.sh) with `cp -c` (APFS copy-on-write: instant, no extra disk
# until files diverge). It never writes into the main checkout.
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
REPLACE=no
if [ "${1:-}" = "--replace" ]; then REPLACE=yes; shift; fi
if [ $# -ne 1 ]; then echo "usage: $0 [--replace] <worktree>" >&2; exit 2; fi
WT=$(cd "$1" && pwd -P)
if [ "$WT" = "$(cd "$MAIN" && pwd -P)" ]; then echo "refusing: $WT is the main checkout" >&2; exit 1; fi
COMMON=$(git -C "$WT" rev-parse --path-format=absolute --git-common-dir 2>/dev/null || true)
if [ -z "$COMMON" ] || [ "$(cd "$COMMON" && pwd -P)" != "$(cd "$MAIN/.git" && pwd -P)" ]; then
  echo "refusing: $WT is not a worktree of $MAIN" >&2; exit 1
fi
SRC="$MAIN/.lake/master-cache"
if [ ! -f "$SRC/built-commit" ]; then
  echo "no published master cache yet ($SRC); run scripts/sync_master.sh --build and wait for it" >&2; exit 1
fi
mkdir -p "$WT/.lake"
if [ ! -e "$WT/.lake/packages" ]; then ln -s "$MAIN/.lake/packages" "$WT/.lake/packages"; fi
if [ -e "$WT/.lake/build" ]; then
  if [ "$REPLACE" = yes ]; then rm -rf "$WT/.lake/build"
  else echo "refusing: $WT/.lake/build exists (use --replace to refresh it)" >&2; exit 1; fi
fi
cp -c -R "$SRC" "$WT/.lake/build"
BUILT=$(cat "$SRC/built-commit")
echo "cloned master build ${BUILT:0:7} into $WT/.lake/build"
BASE=$(git -C "$WT" merge-base HEAD "$BUILT" 2>/dev/null || true)
if [ "$BASE" != "$BUILT" ]; then
  echo "note: your branch does not contain ${BUILT:0:7}; Lake rebuilds whatever differs (still much less than a full build)"
fi
