#!/usr/bin/env bash
# Review a pull request (AGENTS.md §7a). The verdict is a commit status on exactly the commit you reviewed, named
# explicitly, so it can never apply to a commit you did not read.
#
#   scripts/review.sh <branch> <sha> approve <reviewer-id> "<one-line summary>"
#   scripts/review.sh <branch> <sha> block   <reviewer-id> "<one-line reason>"
#
# <branch> is the PR's branch, <agent-id>/<topic>; <sha> is the full 40-hex commit you reviewed (the PR's head when
# you read it). If the branch has moved past that commit the script refuses: review the new commit instead. The
# reviewer must come from the other side: a claude-… branch is reviewed by a codex-… reviewer and vice versa
# (/land checks this). Write the full review (every suggestion) as PR comments; the author answers each one, then
# lands with `/land <agent-id>` on the PR.
set -euo pipefail

[ $# -eq 5 ] || { sed -n '2,12p' "$0"; exit 2; }
branch=${1#origin/}; sha=$2; verdict=$3; reviewer=$4; summary=$5
[[ "$branch" =~ ^(claude|codex)-[0-9a-f]{4}/ ]] || { echo "not an <agent-id>/<topic> branch: $branch" >&2; exit 2; }
[[ "$sha" =~ ^[0-9a-f]{40}$ ]] || { echo "give the full 40-hex commit you reviewed (git rev-parse origin/$branch)" >&2; exit 2; }
case "$verdict" in approve) state=success ;; block) state=failure ;; *) echo "verdict: approve or block" >&2; exit 2 ;; esac
[[ "$reviewer" =~ ^(claude|codex)-[0-9a-f]{4}$ ]] || { echo "reviewer id like codex-7f3a or claude-b21e" >&2; exit 2; }
author=${branch%%-*}                                     # claude or codex
[ "$author" != "${reviewer%%-*}" ] || { echo "a $author delivery is reviewed by the other side" >&2; exit 2; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
tip=$(git ls-remote origin "refs/heads/${branch}" | cut -f1)
[ -n "$tip" ] || { echo "no remote branch $branch" >&2; exit 2; }
if [ "$tip" != "$sha" ]; then
  echo "refused: $branch has moved to ${tip:0:12}; you reviewed ${sha:0:12}. Review the current commit." >&2; exit 3
fi
desc="[${reviewer}] ${verdict}: ${summary}"
gh api -X POST "repos/${repo}/statuses/${sha}" -f state="$state" -f context="Independent review" \
  -f description="${desc:0:140}" >/dev/null
echo "${verdict} recorded on ${branch} at ${sha:0:12}: ${desc:0:140}"
