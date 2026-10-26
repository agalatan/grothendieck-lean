#!/usr/bin/env bash
# The local master build job (laptop). Started only by scripts/sync_master.sh --build, in its own process group;
# never run it by hand.
# It builds in its own worktree, $BUILDER (detached, never edited by anyone), so that syncing the main checkout never
# changes sources under a running build. Each round:
#   1. check out the current origin/master in $BUILDER;
#   2. build there (incremental) every module of the root Grothe except the node-cap rows CapRowKK and their assembly
#      CapNodes: those take about 21 CPU-hours cold and are verified by CI (droplet) only; nothing but the root
#      imports them, so every module an agent builds on the laptop starts warm;
#   3. on success, record the commit in $BUILDER/.lake/build/built-commit and publish a consistent snapshot
#      $MAIN/.lake/master-cache: an APFS copy-on-write clone (instant; shares disk blocks until later builds change
#      files), swapped in by rename. Worktrees clone the snapshot (scripts/clone_master_build.sh).
# If master moved during the round, it starts another round; otherwise it exits.
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
BUILDER=/Users/alingalatan/workspaces/grothe-master-build
if [ ! -d "$BUILDER" ]; then
  git -C "$MAIN" worktree add --detach "$BUILDER" origin/master
  mkdir -p "$BUILDER/.lake"
  ln -s "$MAIN/.lake/packages" "$BUILDER/.lake/packages"
  # seed from the newest build available, so the first round is incremental too
  if [ -d "$MAIN/.lake/master-cache" ]; then cp -c -R "$MAIN/.lake/master-cache" "$BUILDER/.lake/build"
  elif [ -d "$MAIN/.lake/build" ]; then cp -c -R "$MAIN/.lake/build" "$BUILDER/.lake/build"; fi
fi
cd "$BUILDER"
while true; do
  git -C "$MAIN" fetch -q origin
  TARGET=$(git -C "$MAIN" rev-parse origin/master)
  if [ "$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)" = "$TARGET" ]; then
    echo "master cache already current for $TARGET"; exit 0
  fi
  git checkout -q --detach "$TARGET"
  rm -f .lake/build/built-commit
  echo "building master $TARGET"
  # shellcheck disable=SC2046
  lake build $(sed -n 's/^import //p' Grothe.lean | grep -vE '^Grothe\.LowerAnalytic\.(CapRow[0-9]+|CapNodes)$')
  echo "$TARGET" > .lake/build/built-commit
  rm -rf "$MAIN/.lake/master-cache.new"
  cp -c -R .lake/build "$MAIN/.lake/master-cache.new"
  if [ -d "$MAIN/.lake/master-cache" ]; then mv "$MAIN/.lake/master-cache" "$MAIN/.lake/master-cache.old"; fi
  mv "$MAIN/.lake/master-cache.new" "$MAIN/.lake/master-cache"
  rm -rf "$MAIN/.lake/master-cache.old"
  echo "published $MAIN/.lake/master-cache for master $TARGET"
done
