#!/usr/bin/env bash
# Land a checked ready/ delivery (AGENTS.md §7): recreate exactly the checked merge, require an approving review of
# exactly the checked source commit, fast-forward master to the merge. Used by lean.yml (finish, right after a green
# check) and by review-land.yml (when the approval arrives after the check).
#
# Run in a full checkout with a ./merge-info file from the green check (base, source, tree, lean).
# Environment: GH_TOKEN, GITHUB_REPOSITORY, GITHUB_SERVER_URL, BRANCH (ready/...), CHECK_RUN (id of the green check).
set -euo pipefail

. ./merge-info; rm -f merge-info
: "${base:?}" "${source:?}" "${tree:?}" "${lean:?}" "${BRANCH:?}" "${CHECK_RUN:?}"
check_url="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${CHECK_RUN}"

# 1. the delivery must not have moved since it was checked (a new push gets its own check and review)
tip=$(git ls-remote origin "refs/heads/${BRANCH}" | cut -f1)
if [ -z "$tip" ]; then echo "${BRANCH} no longer exists: nothing to land"; exit 0; fi
if [ "$tip" != "$source" ]; then
  echo "::notice::${BRANCH} moved from the checked ${source:0:12} to ${tip:0:12}: its own check lands it"; exit 0
fi

# 2. an approving review of exactly this commit, by the other side (scripts/review.sh)
author=${BRANCH#ready/}; author=${author%%-*}
review=$(gh api "repos/${GITHUB_REPOSITORY}/commits/${source}/statuses?per_page=100" \
  --jq '[.[] | select(.context == "Independent review")] | first // empty | "\(.state)\t\(.description)"')
state=${review%%$'\t'*}; desc=${review#*$'\t'}
reviewer=$(sed -nE 's/^\[((claude|codex)-[0-9a-f]{4})\].*/\1/p' <<< "$desc")
if [ "$state" != success ] || [ -z "$reviewer" ] || [ "${reviewer%%-*}" = "$author" ]; then
  if [ "$state" = failure ]; then why="blocked by review: ${desc}"; else why="awaiting an approving review from the other side"; fi
  gh api -X POST "repos/${GITHUB_REPOSITORY}/statuses/${source}" -f state=pending -f context="Landing" \
    -f description="Checked green; ${why:0:110}" -f target_url="$check_url" >/dev/null || true
  echo "::notice::${BRANCH} is checked green but not landed: ${why}"; exit 0
fi

# 3. recreate exactly the checked merge
git config user.name "grothe-ci"; git config user.email "grothe-ci@users.noreply.github.com"
git config merge.ours.driver true   # OVERVIEW.pdf merge=ours (.gitattributes): CI rebuilds it
git fetch -q origin master "$source"
git checkout -q -B merge-candidate "$base"
git merge -q --no-ff --no-edit "$source" -m "Merge ${BRANCH} (CI auto-merge)"
python3 tools/gen_root_imports.py > /dev/null
git diff --quiet || git commit -q -a -m "Regenerate root imports and sorted lists after merging ${BRANCH} (CI)"
[ "$(git rev-parse 'HEAD^{tree}')" = "$tree" ] || { echo "::error::the recreated merge differs from the checked tree"; exit 1; }

if [ "$(git rev-parse merge-candidate)" = "$base" ]; then
  echo "${BRANCH} is already contained in master: deleting it"; git push origin --delete "${BRANCH}" || true; exit 0
fi

# 4. fast-forward master; fails if master moved since the check
if git push origin merge-candidate:master; then
  merged=$(git rev-parse merge-candidate)
  git push origin --delete "${BRANCH}" || true
  if [ "$lean" = true ]; then
    ctx="Lean proof check (verified before merge)"; d="Built and checked as ${BRANCH} merged into master"
  else
    ctx="Lean proof check (no proof change)"; d="No Lean-relevant file changed; proofs are those of ${base:0:12}"
  fi
  gh api -X POST "repos/${GITHUB_REPOSITORY}/statuses/${merged}" -f state=success -f context="$ctx" \
    -f description="$d" -f target_url="$check_url" >/dev/null || true
  gh api -X POST "repos/${GITHUB_REPOSITORY}/statuses/${source}" -f state=success -f context="Landing" \
    -f description="Landed as ${merged:0:12}; reviewed by ${reviewer}" -f target_url="$check_url" >/dev/null || true
  # a workflow-token push does not trigger GitHub's "Closes #n" handling: close them here
  for n in $(git log --format=%B "$base"..merge-candidate \
             | grep -oiE '(close[sd]?|fix(e[sd])?|resolve[sd]?) +#[0-9]+' | grep -oE '[0-9]+' | sort -u); do
    gh issue close "$n" --comment "Closed by ${BRANCH} (CI auto-merge ${merged:0:7}, reviewed by ${reviewer})" || true
  done
  # the workflow-token push starts no run on master: dispatch master's check (saves the master cache), the PDF
  # rebuild and the conflict sweep
  gh workflow run lean.yml --ref master || true
  gh workflow run overview.yml --ref master || true
  gh workflow run ready-sweep.yml --ref master || true
  echo "landed ${BRANCH} as ${merged:0:12} (reviewed by ${reviewer})"
else
  git fetch -q origin master
  if [ "$(git rev-parse origin/master)" != "$base" ]; then
    # not a failure: the delivery is fine, it has to be checked against the new master (the approval stays valid:
    # it is bound to the source commit, which did not change)
    echo "::notice::master moved since the check: re-dispatched ${BRANCH} against the new master"
    gh workflow run lean.yml --ref "${BRANCH}"; exit 0
  elif git diff --name-only "$base" merge-candidate | grep -q '^\.github/workflows/'; then
    echo "::error::The push was refused because this delivery changes .github/workflows and the token may not"
    echo "::error::update workflows. Add the MERGE_TOKEN secret (see AGENTS.md section 9) or merge it with a PR."
  else
    echo "::error::The push to master was refused for another reason (see above). Not retrying."
  fi
  exit 1
fi
