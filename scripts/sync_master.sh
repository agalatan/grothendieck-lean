#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
# It ends with an audit of your remote branches (set AGENT_ID=<your id>; without it, every agent's): every branch you
# pushed, its check (red, green, running for hours), conflicts with master, its pull request (open, RFC/WIP, reviewed,
# green but not landed), branches already in master; each with an ACTION line. Deal with every ACTION line about your branches.
#   --build   afterwards, start the local master build job (scripts/master_build_job.sh: background, niced,
#             incremental, in its own worktree) unless it is running or the cache is current. It publishes the
#             snapshot .lake/master-cache that new worktrees clone (AGENTS.md §5). One job at a time (pid in
#             $MAIN/.lake/master-build.pid, log in $MAIN/.lake/master-build.log).
#   --status  only report the local build cache: which master commit it holds, and whether a build is running.
# During a freeze of master (a branch `staging` exists on GitHub, docs/FULL_BUILD_BATCH.md): it also fast-forwards
# the local `staging`, says so in a banner, and audits your branches against origin/staging instead of origin/master:
# base new work on origin/staging, merge origin/staging into your branches, target pull requests at staging.
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/agent_ids.sh"
MAIN=/Users/alingalatan/workspaces/grothe
PIDF="$MAIN/.lake/master-build.pid"
LOG="$MAIN/.lake/master-build.log"

running() { [ -f "$PIDF" ] && kill -0 "$(cat "$PIDF")" 2>/dev/null; }

start_build() {
  # run a private copy: syncs may change scripts/master_build_job.sh while bash is still reading it
  cp "$MAIN/scripts/master_build_job.sh" "$MAIN/.lake/master-build-job.sh"
  (cd "$MAIN" && bash -c 'set -m; nohup nice -n 15 bash .lake/master-build-job.sh > .lake/master-build.log 2>&1 & echo $! > .lake/master-build.pid')
  echo "started the master build job (pgid $(cat "$PIDF")); log $LOG"
}

status() {
  local head built
  head=$(git -C "$MAIN" rev-parse origin/master)
  built=$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)
  if [ "$built" = "$head" ]; then
    echo "local build cache (.lake/master-cache): master ${built:0:7}, current"
  elif [ -n "$built" ]; then
    echo "local build cache (.lake/master-cache): master ${built:0:7}; origin/master is ${head:0:7}"
  else
    echo "local build cache: none published yet"
  fi
  if running; then
    echo "master build running (pgid $(cat "$PIDF")), $(grep -oE '\[[0-9]+/[0-9]+\]' "$LOG" | tail -1)"
  fi
}

# The base branch: `staging` while master is frozen for a full build (it exists only then), else `master`.
base_branch() {
  if git -C "$MAIN" show-ref --verify --quiet refs/remotes/origin/staging 2>/dev/null; then echo staging; else echo master; fi
}
BASE=master

freeze_banner() {
  [ "$BASE" = staging ] || return 0
  echo
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  echo "!! MASTER IS FROZEN for a full build (docs/FULL_BUILD_BATCH.md on the batch branch; announcement on issue #225)."
  echo "!! Until the freeze ends, use STAGING instead of master everywhere:"
  echo "!!   - base new worktrees on origin/staging; merge origin/staging (not origin/master) into your branches;"
  echo "!!   - pull requests target staging: gh pr create --base staging, or gh pr edit <n> --base staging;"
  echo "!!   - /land does not work for staging: when your PR is approved at its head and green, ask claude-b9ee on the"
  echo "!!     PR to merge it into staging. Do not land anything on master."
  echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
}

# The agent whose branches the audit shows: AGENT_ID (e.g. AGENT_ID=claude-b9ee); empty = every agent.
AGENT="${AGENT_ID:-}"

owner_of() {  # the ID in the branch name (AGENTS.md §3), else the Agent-ID of its oldest commit not in master
  # (its creator: later commits may be another agent's, e.g. a janitor's merge of master)
  local b=$1 c id
  if [[ "$b" =~ ^($agent_id_re)/ ]]; then echo "${BASH_REMATCH[1]}"; return; fi
  if [[ "$b" =~ ^(ready|work|cloud)/($agent_id_re)- ]]; then echo "${BASH_REMATCH[2]}"; return; fi
  if [[ "$b" =~ ^$agent_kind_re/([0-9a-f]{4})- ]]; then echo "${BASH_REMATCH[1]}-${BASH_REMATCH[2]}"; return; fi
  for c in $(git -C "$MAIN" rev-list --reverse "origin/master..origin/$b" 2>/dev/null); do
    id=$(git -C "$MAIN" log -1 --format=%B "$c" | sed -n 's/.*Agent-ID: *\([A-Za-z]*-[0-9a-f]*\).*/\1/p' | head -1)
    [ -n "$id" ] && { echo "$id"; return; }
  done
  # a branch already in master: its tip commit
  id=$(git -C "$MAIN" log -1 --format=%B "origin/$b" | sed -n 's/.*Agent-ID: *\([A-Za-z]*-[0-9a-f]*\).*/\1/p' | head -1)
  echo "${id:-?}"
}

audit() {
  set +e +o pipefail   # a report: never abort the sync on one odd branch
  echo
  echo "================================ YOUR BRANCHES: AUDIT ================================"
  if [ -n "$AGENT" ]; then
    echo "Agent: $AGENT. Every branch you pushed is yours until it is on master or deleted (AGENTS.md §7, §14)."
  else
    echo "!! AGENT_ID is not set, so this lists EVERY agent's branches. Run it as"
    echo "!!   AGENT_ID=<your agent id> scripts/sync_master.sh"
    echo "!! (the ID you announced in your first reply) and act on the lines of YOUR branches."
  fi
  local runs=""
  command -v gh >/dev/null 2>&1 && runs=$(gh run list --workflow lean.yml --limit 200 \
    --json headBranch,headSha,conclusion,status,databaseId,createdAt \
    --jq 'group_by(.headBranch) | map(max_by(.databaseId)) | .[] | "\(.headBranch) \(.headSha) \(.status) \(if (.conclusion // "") == "" then "-" else .conclusion end) \(.databaseId) \(.createdAt | fromdateiso8601)"' \
    2>/dev/null || true)
  local prs=""
  command -v gh >/dev/null 2>&1 && prs=$(gh pr list --state open --limit 200 \
    --json number,headRefName,isDraft,labels,headRefOid \
    --jq '.[] | [.headRefName, .number, .isDraft, ([.labels[].name] | join(",") | if . == "" then "-" else . end), .headRefOid] | @tsv' \
    2>/dev/null || true)
  local found=0 todo=0 b own line state behind conflict sha st concl id created tip action hours pr prn prd prl prsha rev summary
  while read -r b; do
    [ -z "$b" ] && continue
    own=$(owner_of "$b")
    [ -n "$AGENT" ] && [ "$own" != "$AGENT" ] && continue
    found=1
    tip=$(git -C "$MAIN" rev-parse "origin/$b")
    if git -C "$MAIN" merge-base --is-ancestor "$tip" "origin/$BASE"; then
      echo "  $b [$own]: already in $BASE"
      echo "      -> ACTION: delete it: git push origin --delete $b (and its local branch and worktree, §14)"
      todo=$((todo + 1)); continue
    fi
    behind=$(git -C "$MAIN" rev-list --count "$tip..origin/$BASE")
    conflict=""
    if ! git -C "$MAIN" -c merge.ours.driver=true merge-tree --write-tree "origin/$BASE" "$tip" >/dev/null 2>&1; then
      conflict=$(git -C "$MAIN" -c merge.ours.driver=true merge-tree --write-tree --name-only "origin/$BASE" "$tip" \
        2>/dev/null | sed -n '2,/^$/p' | grep -v '^$' | head -6 | tr '\n' ' ')
    fi
    line=$(echo "$runs" | awk -v b="$b" '$1 == b' | head -1)
    action=""
    pr=$(echo "$prs" | awk -F '\t' -v b="$b" '$1 == b' | head -1); prn=""
    [ -n "$pr" ] && IFS=$'\t' read -r _ prn prd prl prsha <<< "$pr"
    sha=""; st=""; concl=""
    if [[ "$b" == cloud/* ]]; then
      state="cloud job branch (no proof check)"
      action="delete it once its cloud jobs are done and their results saved (§11, §14)"
    elif [ -z "$line" ]; then
      state="no proof check found"
      if [ -z "$prn" ]; then
        action="a pushed branch should have a check: push again, or delete it if abandoned"
      fi
    else
      read -r _ sha st concl id created <<< "$line"
      hours=$(( ($(date +%s) - created) / 3600 ))
      if [ "$st" != completed ]; then
        state="check running (run $id, started ${hours}h ago)"
        [ "$hours" -ge 2 ] && action="running or queued for ${hours}h: look at it (gh run view $id); a droplet check may be waiting behind others"
      elif [ "$concl" = success ]; then
        state="GREEN (run $id)"
      else
        state="RED: $concl (run $id)"
        action="read the log (gh run view $id --log-failed), merge origin/$BASE, fix, push the same branch again"
      fi
      [ "$sha" != "$tip" ] && state="$state, for an older commit"
    fi
    if [ -n "$conflict" ]; then
      action="CONFLICT with $BASE in: $conflict-> merge origin/$BASE, resolve by understanding both sides, run python3 tools/gen_root_imports.py, push the same branch"
    elif [[ "$b" == ready/* ]] || [[ "$b" == work/* ]]; then
      action="old-style branch name: rename it to ${own:-<agent-id>}/<topic> and open a pull request to land it (AGENTS.md §3, §7)"
    elif [ -n "$prn" ]; then
      rev=$(gh api "repos/{owner}/{repo}/commits/${prsha}/statuses?per_page=100" \
        --jq '[.[] | select(.context == "Independent review")] | first // empty | "\(.state)\t\(.description)"' 2>/dev/null || echo unavailable)
      summary=${rev/$'\t'/ }
      summary=${summary:-none}
      state="$state; PR #$prn${prl:+ [$prl]}; review: ${summary:0:60}"
      if [[ ",$prl," == *,HOLD,* ]]; then
        [ -z "$action" ] && action="PR #$prn is on HOLD: a reviewer's longer review is running; wait for its verdict (do not /land)"
      elif [[ ",$prl," == *,RFC,* ]] || [[ ",$prl," == *,WIP,* ]] || [ "$prd" = true ]; then
        [ -z "$action" ] && action="PR #$prn is RFC/WIP/draft: answer its review comments; remove the label when it is ready to land"
      elif [ "$prsha" != "$tip" ]; then
        action="PR #$prn moved after the fetch: sync again before acting"
      elif [ "$rev" = unavailable ]; then
        action="PR #$prn review status could not be read: retry the audit"
      elif [[ "$rev" == failure$'\t'* ]]; then
        action="PR #$prn is blocked by review: answer every comment, fix, push, ask for a new review"
      elif [ "$sha" != "$prsha" ]; then
        action="PR #$prn has no reported check for its current head: run 'gh workflow run lean.yml --ref $b' when a CI slot is available"
      elif approved_reviewer "$own" "$rev" >/dev/null; then
        if [ "$st" = completed ] && [ "$concl" = success ]; then
          if [ "$BASE" = staging ]; then
            action="PR #$prn is green and approved: master is frozen, so do not /land; target it at staging (gh pr edit $prn --base staging) and ask claude-b9ee on the PR to merge it into staging"
          else
            action="PR #$prn is green and approved: land it with a comment '/land ${own}' (AGENTS.md §7)"
          fi
        fi
      elif [ -z "$action" ]; then
        action="PR #$prn waits for a review by a different agent family (AGENTS.md §7a); answer any comments"
      fi
    elif [ -z "$action" ]; then
      action="no pull request: open one to land it (RFC/WIP labels if not finished), or delete the branch once it has served its purpose (§14)"
    fi
    echo "  $b [$own]: $state, $behind behind $BASE"
    if [ -n "$action" ]; then echo "      -> ACTION: $action"; todo=$((todo + 1)); fi
  done < <(git -C "$MAIN" branch -r --format='%(refname:short)' | sed -n 's#^origin/##p' | grep -vE '^(master|staging|HEAD)$')
  if [ "$found" = 0 ]; then
    echo "  (no branches)"
  elif [ "$todo" -gt 0 ]; then
    echo "!! $todo branch(es) above need action. Deal with every ACTION line of your branches before other work."
  else
    echo "  Nothing to do: your branches are checking or waiting to merge."
  fi
  echo "======================================================================================="
}

if [ "${1:-}" = "--status" ]; then status; exit 0; fi

git -C "$MAIN" fetch --prune origin
git -C "$MAIN" config merge.ours.driver true   # OVERVIEW.pdf merge=ours (.gitattributes): CI builds the PDF
# where is master checked out, if anywhere?
WT=$(git -C "$MAIN" worktree list --porcelain | awk '/^worktree /{w=$2} /^branch refs\/heads\/master$/{print w}')
if [ -z "$WT" ]; then
  git -C "$MAIN" fetch origin master:master            # not checked out: move the ref directly (ff only)
elif [ -z "$(git -C "$WT" status --porcelain --untracked-files=no)" ]; then
  git -C "$WT" merge --ff-only origin/master           # checked out and clean: fast-forward the tree
else
  echo "master is checked out in $WT with local changes: not touching it. Report this to the user." >&2
  exit 1
fi
echo "master = $(git -C "$MAIN" rev-parse --short master) (origin/master = $(git -C "$MAIN" rev-parse --short origin/master))"
BASE=$(base_branch)
if [ "$BASE" = staging ]; then
  SWT=$(git -C "$MAIN" worktree list --porcelain | awk '/^worktree /{w=$2} /^branch refs\/heads\/staging$/{print w}')
  if [ -z "$SWT" ]; then
    git -C "$MAIN" fetch origin staging:staging || echo "local staging could not be fast-forwarded (diverged?): look at it" >&2
  elif [ -z "$(git -C "$SWT" status --porcelain --untracked-files=no)" ]; then
    git -C "$SWT" merge --ff-only origin/staging || echo "staging in $SWT could not be fast-forwarded: look at it" >&2
  else
    echo "staging is checked out in $SWT with local changes: not touching it" >&2
  fi
  echo "staging = $(git -C "$MAIN" rev-parse --short origin/staging) (the base while master is frozen)"
fi
freeze_banner
if [ "${1:-}" = "--build" ]; then
  if running; then
    echo "master build job already running (pgid $(cat "$PIDF")); log $LOG"
  elif [ "$(cat "$MAIN/.lake/master-cache/built-commit" 2>/dev/null || true)" = "$(git -C "$MAIN" rev-parse origin/master)" ]; then
    echo "local build cache already current"
  else
    start_build
  fi
fi
audit
freeze_banner
