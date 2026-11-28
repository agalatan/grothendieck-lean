#!/usr/bin/env bash
# Final push of the janitor's locally prepared, checked two-parent staging merge.
# Usage: scripts/push_staging_merge.sh <pr-number> <full-reviewed-head-sha>
# Agent-ID: codex-062a
set -euo pipefail
scripts=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=scripts/agent_ids.sh
source "$scripts/agent_ids.sh"

die() { echo "staging merge refused: $*" >&2; exit 1; }
if [[ ${1:-} == --pre-push ]]; then
  shift
  # Git itself supplies both object IDs in this record. Its transport also
  # rejects a concurrent ref update after advertising the remote object ID.
  IFS= read -r update || die "missing push record"
  if IFS= read -r extra; then die "expected only the staging update"; fi
  if [[ -x "$STAGING_ORIGINAL_HOOK" ]]; then
    "$STAGING_ORIGINAL_HOOK" "$@" <<< "$update"
  fi
  read -r _ candidate remote_ref old extra <<< "$update"
  [[ "$remote_ref" == refs/heads/staging && "$candidate" == "$STAGING_MERGE" &&
     "$old" == "$STAGING_PARENT" && -z "$extra" ]] || die "staging moved, disappeared, or a different ref was requested"

  # Read the approval first, then the PR and its labels immediately before
  # returning control to Git. A final read failure must never permit the push.
  review=$(gh api "repos/{owner}/{repo}/commits/$STAGING_SOURCE/statuses?per_page=100" --paginate \
    --jq '.[] | select(.context == "Independent review") | [.state,.description] | @tsv')
  pr=$(gh pr view "$STAGING_PR" --json state,isDraft,isCrossRepository,baseRefName,baseRefOid,headRefName,headRefOid,labels)
  jq -e --arg base "$old" --arg head "$STAGING_SOURCE" '
    .state == "OPEN" and .isDraft == false and .isCrossRepository == false and
    .baseRefName == "staging" and .baseRefOid == $base and .headRefOid == $head and
    (.labels | type == "array" and all(.[]; (.name | type == "string")))
  ' <<< "$pr" >/dev/null || die "PR state, base, reviewed head, or labels could not be verified"
  blocked=$(jq -r '[.labels[].name | select(. == "RFC" or . == "WIP" or startswith("HOLD"))] | join(", ")' <<< "$pr")
  [[ -z "$blocked" ]] || die "PR #$STAGING_PR carries $blocked"
  branch=$(jq -er '.headRefName | select(contains("/"))' <<< "$pr")
  approved_reviewer "${branch%%/*}" "${review%%$'\n'*}" >/dev/null || die "no current independent approval of $STAGING_SOURCE"
  exit 0
fi

[[ $# == 2 && $1 =~ ^[1-9][0-9]*$ && $2 =~ ^[0-9a-f]{40}$ ]] || die "expected a PR number and full reviewed head SHA"
export STAGING_PR=$1 STAGING_SOURCE=$2
read -r STAGING_MERGE STAGING_PARENT source_parent extra <<< "$(git rev-list --parents -1 HEAD)"
[[ -n "$STAGING_PARENT" && "$source_parent" == "$STAGING_SOURCE" && -z "$extra" ]] || die "HEAD must merge the reviewed source as its second parent"
export STAGING_MERGE STAGING_PARENT

git diff --quiet HEAD -- || die "commit the prepared merge and generated files before pushing"
origin=$(git remote get-url --push --all origin)
[[ -n "$origin" && "$origin" != *$'\n'* ]] || die "expected one push URL for origin"
url=$(gh repo view "$origin" --json url --jq .url)
[[ "$url" == https://*/*/* ]] || die "cannot identify the GitHub repository of the push target"
export GH_REPO=${url#https://}

# Preserve the existing pre-push hook and its stdin. The temporary hook applies
# only to this push. Other worktrees and the repository config are untouched.
STAGING_ORIGINAL_HOOK=$(git rev-parse --path-format=absolute --git-path hooks/pre-push)
export STAGING_ORIGINAL_HOOK
hook_dir=$(mktemp -d)
trap 'rm -rf -- "$hook_dir"' EXIT
# Keep adjacent hooks (e.g. reference-transaction) and their helper files
# available under the same names during this push.
shopt -s nullglob dotglob
for existing in "${STAGING_ORIGINAL_HOOK%/*}"/*; do
  name=${existing##*/}
  [[ "$name" == pre-push || "$name" == . || "$name" == .. ]] || ln -s "$existing" "$hook_dir/$name"
done
export STAGING_PUSH_SCRIPT="$scripts/push_staging_merge.sh"
cat > "$hook_dir/pre-push" <<'HOOK'
#!/bin/sh
exec "$STAGING_PUSH_SCRIPT" --pre-push "$@"
HOOK
chmod +x "$hook_dir/pre-push"
git -c core.hooksPath="$hook_dir" -c push.followTags=false push --recurse-submodules=no origin "$STAGING_MERGE:refs/heads/staging"
bash "$scripts/hold_notice.sh" "$STAGING_PR" "$STAGING_MERGE"
