#!/usr/bin/env bash
# Review a pull request (AGENTS.md §7a). The verdict is a commit status on exactly the commit you reviewed, named
# explicitly, so it can never apply to a commit you did not read.
#
#   scripts/review.sh <branch> <sha> approve <reviewer-id> "<one-line summary>"
#   scripts/review.sh <branch> <sha> block   <reviewer-id> "<one-line reason>"
#   scripts/review.sh <branch> <sha> hold    <reviewer-id> "<what is being checked, how long>"
#
# hold: a review that takes longer (a replay, an independent recomputation) puts the PR on HOLD: the label HOLD and a
# signed comment. No PR with the label HOLD lands (scripts/land_ready.sh refuses it, like RFC/WIP), whatever other
# approvals it has. The holder's own verdict (approve or block) removes the label; only the holder or the user removes
# it otherwise. A hold is for a review actually running: give a verdict as soon as it is done.
#
# <branch> is the PR's branch, <agent-id>/<topic>; <sha> is the full 40-hex commit you reviewed (the PR's head when
# you read it). If the branch has moved past that commit the script refuses: review the new commit instead. The
# reviewer must come from a different agent family (/land checks this).
# Write the full review (every suggestion) as PR comments; the author answers each one, then
# lands with `/land <agent-id>` on the PR.
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/agent_ids.sh"

[ $# -eq 5 ] || { sed -n '2,12p' "$0"; exit 2; }
branch=${1#origin/}; sha=$2; verdict=$3; reviewer=$4; summary=$5
author=${branch%%/*}
if [[ "$branch" != */?* ]] || ! is_agent_id "$author"; then
  echo "not an <agent-id>/<topic> branch: $branch" >&2
  exit 2
fi
[[ "$sha" =~ ^[0-9a-f]{40}$ ]] || { echo "give the full 40-hex commit you reviewed (git rev-parse origin/$branch)" >&2; exit 2; }
case "$verdict" in approve) state=success ;; block) state=failure ;; hold) state="" ;; *) echo "verdict: approve, block or hold" >&2; exit 2 ;; esac
is_agent_id "$reviewer" || { echo "reviewer id like codex-7f3a, claude-b21e or gemini-3e2a" >&2; exit 2; }
is_independent_reviewer "$author" "$reviewer" || { echo "the reviewer must be from a different agent family" >&2; exit 2; }

repo=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
tip=$(git ls-remote origin "refs/heads/${branch}" | cut -f1)
[ -n "$tip" ] || { echo "no remote branch $branch" >&2; exit 2; }
if [ "$tip" != "$sha" ]; then
  echo "refused: $branch has moved to ${tip:0:12}; you reviewed ${sha:0:12}. Review the current commit." >&2; exit 3
fi
pr=$(gh pr list --head "$branch" --state open --json number --jq '.[0].number // empty' 2>/dev/null || true)
hold_marker="[${reviewer}] HOLD"
if [ "$verdict" = hold ]; then
  [ -n "$pr" ] || { echo "no open pull request for $branch" >&2; exit 2; }
  gh label create HOLD --color B60205 --description "A review is in progress: do not land (scripts/review.sh hold)" >/dev/null 2>&1 || true
  gh pr edit "$pr" --add-label HOLD >/dev/null
  gh pr comment "$pr" --body "${hold_marker}: a longer review is in progress at \`${sha:0:12}\` (${summary}). **This PR must not land until I post my verdict**; the label HOLD makes /land refuse it. I remove the hold with my verdict." >/dev/null
  echo "hold placed on PR #$pr (${branch} at ${sha:0:12})"
  exit 0
fi
desc="[${reviewer}] ${verdict}: ${summary}"
gh api -X POST "repos/${repo}/statuses/${sha}" -f state="$state" -f context="Independent review" \
  -f description="${desc:0:140}" >/dev/null
echo "${verdict} recorded on ${branch} at ${sha:0:12}: ${desc:0:140}"
# the holder's verdict lifts the holder's hold (another reviewer's hold stays)
if [ -n "$pr" ] && gh pr view "$pr" --json labels --jq '[.labels[].name] | index("HOLD") != null' | grep -qx true \
   && gh pr view "$pr" --json comments --jq '.comments[].body' | grep -qF "$hold_marker"; then
  gh pr edit "$pr" --remove-label HOLD >/dev/null
  gh pr comment "$pr" --body "[${reviewer}] Hold lifted: my verdict (${verdict}) is recorded at \`${sha:0:12}\`." >/dev/null
  echo "hold lifted on PR #$pr"
fi
