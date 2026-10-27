#!/usr/bin/env bash
# Report every ready/ branch that does not merge into the current master (run by .github/workflows/ready-sweep.yml
# after each move of master; harmless to run by hand). Each conflict goes through scripts/ready_conflict_notice.sh,
# which comments once per branch commit, so a sweep after every merge does not repeat itself.
# DRY_RUN=1 prints the comments instead of posting them.
set -u
cd "$(git rev-parse --show-toplevel)"
git fetch -q --prune origin master '+refs/heads/ready/*:refs/remotes/origin/ready/*'
found=0
for ref in $(git for-each-ref --format='%(refname:short)' 'refs/remotes/origin/ready/'); do
  branch=${ref#origin/}
  git merge-base --is-ancestor "$ref" origin/master && continue   # already in master
  # OVERVIEW.pdf is merge=ours (.gitattributes), as in CI's own merge. merge-tree prints the merged tree, then
  # (on a conflict) the conflicting files, then an empty line
  out=$(git -c merge.ours.driver=true merge-tree --write-tree --name-only origin/master "$ref" 2>/dev/null) && continue
  files=$(printf '%s\n' "$out" | sed -n '2,/^$/p' | sed '/^$/d')
  [ -n "$files" ] || continue
  found=$((found + 1))
  scripts/ready_conflict_notice.sh "$branch" $files
done
echo "ready/ branches in conflict with master: $found"
