#!/usr/bin/env bash
# Land a pull request whose landing check is green (AGENTS.md §7; run by lean.yml's finish job in a land=true run,
# which land.yml dispatches on the author's `/land`). It binds everything to the request: the PR number and head
# commit the author asked to land, the master commit the check merged with, and the tree the check verified.
#
# Inputs: INFO = path of the merge-info file written by the green check (data only, strict key=value lines:
# base, source, tree = 40-hex; lean = true|false; pr = number); BRANCH (<agent-id>/<topic>); PR and SHA (the request
# as dispatched by land.yml); CHECK_RUN (this run); GH_TOKEN, GITHUB_REPOSITORY, GITHUB_SERVER_URL.
set -euo pipefail
: "${INFO:?}" "${BRANCH:?}" "${PR:?}" "${SHA:?}" "${CHECK_RUN:?}"
check_url="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${CHECK_RUN}"

# 0. the merge record is data: exactly five well-formed lines, never executed
field() { grep -E "^$1=$2\$" "$INFO" | head -1 | cut -d= -f2; }
base=$(field base '[0-9a-f]{40}'); source=$(field source '[0-9a-f]{40}'); tree=$(field tree '[0-9a-f]{40}')
lean=$(field lean '(true|false)'); pr=$(field pr '[0-9]+')
if [ -z "$base$source$tree$lean$pr" ] || [ "$(grep -cE '^(base|source|tree|lean|pr)=' "$INFO")" != 5 ] \
   || [ "$(wc -l < "$INFO")" != 5 ]; then
  echo "::error::malformed merge record"; cat "$INFO"; exit 1
fi
[ "$source" = "$SHA" ] || { echo "::error::the check tested ${source:0:12} but the request named ${SHA:0:12}"; exit 1; }
[ "$pr" = "$PR" ] || { echo "::error::the check recorded PR #${pr} but the request named #${PR}"; exit 1; }

# 1. the PR is still the one requested: open, not draft/RFC/WIP, this branch at this commit, into master
prj=$(gh pr view "$PR" --json state,isDraft,labels,headRefName,headRefOid,baseRefName,isCrossRepository)
pstate=$(jq -r .state <<< "$prj"); phead=$(jq -r .headRefOid <<< "$prj"); pbranch=$(jq -r .headRefName <<< "$prj")
labels=$(jq -r '[.labels[].name] | join(",")' <<< "$prj")
if [ "$pstate" != OPEN ] || [ "$(jq -r .isDraft <<< "$prj")" != false ] || [ "$(jq -r .baseRefName <<< "$prj")" != master ] \
   || [ "$(jq -r .isCrossRepository <<< "$prj")" != false ] || [ "$pbranch" != "$BRANCH" ] \
   || [[ ",${labels}," == *,RFC,* ]] || [[ ",${labels}," == *,WIP,* ]]; then
  echo "::notice::PR #${PR} is checked green but not landed: it is no longer an open, landable PR of ${BRANCH} into master (state ${pstate}, labels '${labels}')"; exit 0
fi
if [ "$phead" != "$source" ]; then
  echo "::notice::PR #${PR} moved from the checked ${source:0:12} to ${phead:0:12}: land the new commit with a new /land"; exit 0
fi

# 1b. the PR serves a task issue (AGENTS.md §1): its description names at least one open issue labelled `type: task`
body=$(gh pr view "$PR" --json body --jq .body)
task_ok=0
for n in $(grep -oiE '(closes|fixes|resolves|refs) #[0-9]+' <<< "$body" | grep -oE '[0-9]+' | sort -u); do
  if gh api "repos/${GITHUB_REPOSITORY}/issues/${n}" --jq '[.state, ([.labels[].name] | index("type: task") != null)] | @tsv' 2>/dev/null \
     | grep -q $'^open\ttrue$'; then task_ok=1; fi
done
if [ "$task_ok" != 1 ]; then
  echo "::notice::PR #${PR} is checked green but not landed: its description names no open issue labelled 'type: task' (write Closes #n or Refs #n; an epic alone does not count, AGENTS.md §1)"; exit 0
fi

# 2. an approving review of exactly this commit, by the other side (scripts/review.sh)
author=${BRANCH%%-*}
review=$(gh api "repos/${GITHUB_REPOSITORY}/commits/${source}/statuses?per_page=100" \
  --jq '[.[] | select(.context == "Independent review")] | first // empty | "\(.state)\t\(.description)"')
state=${review%%$'\t'*}; desc=${review#*$'\t'}
reviewer=$(sed -nE 's/^\[((claude|codex)-[0-9a-f]{4})\].*/\1/p' <<< "$desc")
if [ "$state" != success ] || [ -z "$reviewer" ] || [ "${reviewer%%-*}" = "$author" ]; then
  echo "::notice::PR #${PR} is checked green but not landed: no approving review of ${source:0:12} by the other side (${desc:-none})"; exit 0
fi

# 3. recreate exactly the checked merge
git config user.name "grothe-ci"; git config user.email "grothe-ci@users.noreply.github.com"
git config merge.ours.driver true   # OVERVIEW.pdf merge=ours (.gitattributes): CI rebuilds it
git fetch -q origin master "$source"
git checkout -q -B merge-candidate "$base"
git merge -q --no-ff --no-edit "$source" -m "Merge ${BRANCH} (PR #${PR}, landed by CI)"
python3 tools/gen_root_imports.py > /dev/null
git diff --quiet || git commit -q -a -m "Regenerate root imports and sorted lists after merging ${BRANCH} (CI)"
[ "$(git rev-parse 'HEAD^{tree}')" = "$tree" ] || { echo "::error::the recreated merge differs from the checked tree"; exit 1; }

# the branch is deleted only if its tip is still the landed commit (a lease): a push meanwhile keeps it
delete_branch() { git push origin --delete "${BRANCH}" --force-with-lease="refs/heads/${BRANCH}:${source}" \
  || echo "::notice::${BRANCH} moved after landing: left in place for its author"; }

if [ "$(git rev-parse merge-candidate)" = "$base" ]; then
  echo "${BRANCH} is already contained in master"; delete_branch; exit 0
fi

# 4. fast-forward master; fails if master moved since the check
if git push origin merge-candidate:master; then
  merged=$(git rev-parse merge-candidate)
  delete_branch
  if [ "$lean" = true ]; then
    ctx="Lean proof check (verified before merge)"; d="Built and checked as PR #${PR} merged into master"
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
    gh issue close "$n" --comment "Closed by PR #${PR} (landed as ${merged:0:7}, reviewed by ${reviewer})" || true
  done
  # the workflow-token push starts no run on master: dispatch master's check (saves the master cache), the PDF
  # rebuild and the conflict sweep
  gh workflow run lean.yml --ref master || true
  gh workflow run overview.yml --ref master || true
  gh workflow run ready-sweep.yml --ref master || true
  gh pr comment "$PR" --body "[grothe-ci] Landed as \`${merged:0:12}\` (reviewed by ${reviewer}): ${check_url}" || true
  echo "landed ${BRANCH} (PR #${PR}) as ${merged:0:12} (reviewed by ${reviewer})"
else
  git fetch -q origin master
  if [ "$(git rev-parse origin/master)" != "$base" ]; then
    # not a failure: the delivery is fine, it has to be checked against the new master (the approval stays valid:
    # it is bound to the source commit, which did not change)
    echo "::notice::master moved since the check: re-dispatched PR #${PR} against the new master"
    gh workflow run lean.yml --ref "${BRANCH}" -f land=true -f pr="${PR}" -f sha="${source}"; exit 0
  elif git diff --name-only "$base" merge-candidate | grep -q '^\.github/workflows/'; then
    echo "::error::The push was refused because this delivery changes .github/workflows and the token may not"
    echo "::error::update workflows. Add the MERGE_TOKEN secret (AGENTS.md §9), or Alin merges the PR by hand."
  else
    echo "::error::The push to master was refused for another reason (see above). Not retrying."
  fi
  exit 1
fi
