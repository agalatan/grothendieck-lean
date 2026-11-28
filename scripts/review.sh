#!/usr/bin/env bash
# Review a pull request (AGENTS.md §7a). The verdict is a commit status on exactly the commit you reviewed, named
# explicitly, so it can never apply to a commit you did not read.
#
#   scripts/review.sh <branch> <sha> approve <reviewer-id> "<one-line summary>"
#   scripts/review.sh <branch> <sha> block   <reviewer-id> "<one-line reason>"
#   scripts/review.sh <branch> <sha> hold    <reviewer-id> "<what is being checked, how long>"
#
# hold: a review that takes longer (a replay, an independent recomputation) puts the PR on hold: the label
# HOLD:<reviewer-id> (one per reviewer) and a signed comment. No PR with a HOLD label lands (scripts/land_ready.sh
# refuses it, like RFC/WIP, and checks again just before it pushes master), whatever other approvals it has. Each
# reviewer's verdict (approve or block) removes only that reviewer's label. If the PR is no longer open when the
# hold is placed, the command says so (exit 4): the landing won. A hold is for a review actually running.
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
hold_label="HOLD:${reviewer}"   # one label per reviewer: each verdict lifts only its own hold
if [ "$verdict" = hold ]; then
  [ -n "$pr" ] || { echo "no open pull request for $branch" >&2; exit 2; }
  gh label create "$hold_label" --color B60205 \
    --description "${reviewer} is reviewing: do not land until its verdict (scripts/review.sh hold)" >/dev/null 2>&1 || true
  gh pr edit "$pr" --add-label "$hold_label" >/dev/null   # the label is the hold; the comment only explains it
  if [ "$(gh pr view "$pr" --json state --jq .state 2>/dev/null || echo UNKNOWN)" != OPEN ]; then
    echo "too late: PR #$pr is no longer open (it landed or was closed before the hold); review it after the fact" >&2
    exit 4
  fi
  gh pr comment "$pr" --body "[${reviewer}] HOLD: a longer review is in progress at \`${sha:0:12}\` (${summary}). **This PR must not land until my verdict**: the label \`${hold_label}\` makes the landing refuse it. My verdict removes it." >/dev/null \
    || echo "warning: the hold is placed (label ${hold_label}) but its comment failed; run the command again to add it" >&2
  echo "hold placed on PR #$pr (${branch} at ${sha:0:12}): label ${hold_label}"
  exit 0
fi
desc="[${reviewer}] ${verdict}: ${summary}"
gh api -X POST "repos/${repo}/statuses/${sha}" -f state="$state" -f context="Independent review" \
  -f description="${desc:0:140}" >/dev/null
echo "${verdict} recorded on ${branch} at ${sha:0:12}: ${desc:0:140}"
# the verdict lifts this reviewer's own hold, if it has one; other reviewers' holds stay
if [ -n "$pr" ] && [ "$(gh pr view "$pr" --json labels --jq "[.labels[].name] | index(\"${hold_label}\") != null" 2>/dev/null)" = true ]; then
  gh pr edit "$pr" --remove-label "$hold_label" >/dev/null
  gh pr comment "$pr" --body "[${reviewer}] Hold lifted: my verdict (${verdict}) is recorded at \`${sha:0:12}\`." >/dev/null || true
  echo "hold ${hold_label} lifted on PR #$pr"
fi
