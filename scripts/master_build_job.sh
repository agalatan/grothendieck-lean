#!/usr/bin/env bash
# The local master build job (laptop). Started only by scripts/sync_master.sh, in its own process group, in the main
# checkout; never run it by hand.
#   1. `lake build Grothe` of master in the main checkout's .lake/build (incremental);
#   2. on success, record the commit in .lake/build/built-commit;
#   3. publish a consistent snapshot .lake/master-cache: an APFS copy-on-write clone of .lake/build (instant; shares
#      disk blocks until later builds change files), swapped in by rename. Worktrees clone the snapshot
#      (scripts/clone_master_build.sh), never the live .lake/build, which a later build may be rewriting.
set -euo pipefail
MAIN=/Users/alingalatan/workspaces/grothe
cd "$MAIN"
rm -f .lake/build/built-commit
lake build Grothe
COMMIT=$(git rev-parse HEAD)
echo "$COMMIT" > .lake/build/built-commit
rm -rf .lake/master-cache.new
cp -c -R .lake/build .lake/master-cache.new
if [ -d .lake/master-cache ]; then mv .lake/master-cache .lake/master-cache.old; fi
mv .lake/master-cache.new .lake/master-cache
rm -rf .lake/master-cache.old
echo "published .lake/master-cache for master $COMMIT"
