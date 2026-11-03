#!/usr/bin/env bash
# Review a ready/ delivery (AGENTS.md §7a). The verdict is a commit status on the delivery's current tip, so it is
# bound to exactly the reviewed commit: a new push needs a new review.
#
#   scripts/review.sh <ready-branch> approve <reviewer-id> "<one-line summary>"
#   scripts/review.sh <ready-branch> block   <reviewer-id> "<one-line reason>"
#
# The reviewer must come from the other side: a claude-… delivery is reviewed by a codex-… reviewer and vice versa
# (the landing step checks this). Put the full review (every suggestion) in a comment on the delivery's issue; the
# author answers each one. An approval of a delivery whose check is already green lands it (review-land.yml).
set -euo pipefail

[ $# -eq 4 ] || { sed -n '2,10p' "$0"; exit 2; }
branch=${1#origin/}; verdict=$2; reviewer=$3; summary=$4
case "$branch" in ready/*) ;; *) echo "not a ready/ branch: $branch" >&2; exit 2 ;; esac
case "$verdict" in approve) state=success ;; block) state=failure ;; *) echo "verdict: approve or block" >&2; exit 2 ;; esac
[[ "$reviewer" =~ ^(claude|codex)-[0-9a-f]{4}$ ]] || { echo "reviewer id like codex-7f3a or claude-b21e" >&2; exit 2; }
author=${branch#ready/}; author=${author%%-*}            # claude or codex
[ "$author" != "${reviewer%%-*}" ] || { echo "a $author delivery is reviewed by the other side" >&2; exit 2; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
sha=$(git ls-remote origin "refs/heads/${branch}" | cut -f1)
[ -n "$sha" ] || { echo "no remote branch $branch" >&2; exit 2; }
desc="[${reviewer}] ${verdict}: ${summary}"
gh api -X POST "repos/${repo}/statuses/${sha}" -f state="$state" -f context="Independent review" \
  -f description="${desc:0:140}" >/dev/null
echo "${verdict} recorded on ${branch} at ${sha:0:12}: ${desc:0:140}"
