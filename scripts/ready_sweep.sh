#!/usr/bin/env bash
# Report every open pull request whose branch does not merge into the current master (run by .github/workflows/ready-sweep.yml
# after each move of master; harmless to run by hand). Each conflict goes through scripts/ready_conflict_notice.sh,
# which comments once per branch commit, so a sweep after every merge does not repeat itself.
# DRY_RUN=1 prints the comments instead of posting them.
set -u
cd "$(git rev-parse --show-toplevel)"
git fetch -q --prune origin master
found=0
for branch in $(gh pr list --state open --limit 200 --json headRefName,isCrossRepository \
                  --jq '.[] | select(.isCrossRepository | not) | .headRefName'); do
  git fetch -q origin "+refs/heads/${branch}:refs/remotes/origin/${branch}" || continue
  ref="origin/${branch}"
  git merge-base --is-ancestor "$ref" origin/master && continue   # already in master
  # OVERVIEW.pdf is merge=ours (.gitattributes), as in CI's own merge. merge-tree prints the merged tree, then
  # (on a conflict) the conflicting files, then an empty line
  out=$(git -c merge.ours.driver=true merge-tree --write-tree --name-only origin/master "$ref" 2>/dev/null) && continue
  files=$(printf '%s\n' "$out" | sed -n '2,/^$/p' | sed '/^$/d')
  [ -n "$files" ] || continue
  found=$((found + 1))
  scripts/ready_conflict_notice.sh "$branch" $files
done
echo "open pull requests in conflict with master: $found"
