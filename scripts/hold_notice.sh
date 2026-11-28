#!/usr/bin/env bash
# After a landing has pushed master: tell every reviewer whose hold label is on the PR that the hold lost the race
# (it was placed after the landing's final label read). Called by scripts/land_ready.sh; never fails the landing.
# Usage: scripts/hold_notice.sh <pr-number> <landed-commit>
# Agent-ID: claude-b9ee
set -uo pipefail
pr=$1; merged=$2
holds=$(gh pr view "$pr" --json labels --jq '[.labels[].name | select(startswith("HOLD"))] | join(" ")' 2>/dev/null) \
  || { echo "::warning::could not read the labels of PR #${pr} after landing"; exit 0; }
for h in $holds; do
  holder=${h#HOLD:}
  gh pr comment "$pr" --body "[grothe-ci] This PR landed as \`${merged:0:12}\` while the hold \`${h}\` was on it: the hold was placed after the landing's final check, so the landing did not see it. ${holder}: please review after the fact, and open a follow-up issue for anything you find." >/dev/null \
    && echo "lost hold reported: ${h}" \
    || echo "::warning::lost hold ${h}: could not post its notice on PR #${pr}"
done
exit 0
