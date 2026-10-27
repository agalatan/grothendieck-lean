#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
# It ends with an audit of your remote branches (set AGENT_ID=<your id>; without it, every agent's): every branch you
# pushed, its check (red, green, running for hours), conflicts with master, green ready/ branches that did not merge,
# branches already in master; each with an ACTION line. Deal with every ACTION line about your branches.
#   --build   afterwards, start the local master build job (scripts/master_build_job.sh: background, niced,
#             incremental, in its own worktree) unless it is running or the cache is current. It publishes the
#             snapshot .lake/master-cache that new worktrees clone (AGENTS.md §5). One job at a time (pid in
#             $MAIN/.lake/master-build.pid, log in $MAIN/.lake/master-build.log).
#   --status  only report the local build cache: which master commit it holds, and whether a build is running.
set -euo pipefail
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

# The agent whose branches the audit shows: AGENT_ID (e.g. AGENT_ID=claude-b9ee); empty = every agent.
AGENT="${AGENT_ID:-}"

owner_of() {  # the ID in the branch name (AGENTS.md §3), else the Agent-ID of its oldest commit not in master
  # (its creator: later commits may be another agent's, e.g. a janitor's merge of master)
  local b=$1 c id
  if [[ "$b" =~ ^(ready|work|cloud)/((codex|claude)-[0-9a-f]{4})- ]]; then echo "${BASH_REMATCH[2]}"; return; fi
  if [[ "$b" =~ ^(codex|claude)/([0-9a-f]{4})- ]]; then echo "${BASH_REMATCH[1]}-${BASH_REMATCH[2]}"; return; fi
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
  local found=0 todo=0 b own line state behind conflict sha st concl id created tip todo_b action hours
  while read -r b; do
    [ -z "$b" ] && continue
    own=$(owner_of "$b")
    [ -n "$AGENT" ] && [ "$own" != "$AGENT" ] && continue
    found=1
    tip=$(git -C "$MAIN" rev-parse "origin/$b")
    if git -C "$MAIN" merge-base --is-ancestor "$tip" origin/master; then
      echo "  $b [$own]: already in master"
      echo "      -> ACTION: delete it: git push origin --delete $b (and its local branch and worktree, §14)"
      todo=$((todo + 1)); continue
    fi
    behind=$(git -C "$MAIN" rev-list --count "$tip..origin/master")
    conflict=""
    if ! git -C "$MAIN" -c merge.ours.driver=true merge-tree --write-tree origin/master "$tip" >/dev/null 2>&1; then
      conflict=$(git -C "$MAIN" -c merge.ours.driver=true merge-tree --write-tree --name-only origin/master "$tip" \
        2>/dev/null | sed -n '2,/^$/p' | grep -v '^$' | head -6 | tr '\n' ' ')
    fi
    line=$(echo "$runs" | awk -v b="$b" '$1 == b' | head -1)
    action=""
    if [[ "$b" == cloud/* ]]; then
      state="cloud job branch (no proof check)"
      action="delete it once its cloud jobs are done and their results saved (§11, §14)"
    elif [ -z "$line" ]; then
      state="no proof check found"
      action="a pushed branch should have a check: push again, or delete it if abandoned"
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
        action="read the log (gh run view $id --log-failed), merge origin/master, fix, push the same branch again"
      fi
      [ "$sha" != "$tip" ] && state="$state, for an older commit"
    fi
    if [ -n "$conflict" ]; then
      action="CONFLICT with master in: $conflict-> merge origin/master, resolve by understanding both sides, run python3 tools/gen_root_imports.py, push the same branch"
    elif [[ "$b" == ready/* ]] && [[ "$state" == GREEN* ]]; then
      if git -C "$MAIN" diff --name-only "origin/master...$tip" | grep -q '^\.github/workflows/'; then
        action="green but changes .github/workflows: CI cannot merge it; open a pull request (the user merges it)"
      else
        action="green but NOT merged: open its finish job (gh run view $id); if master moved, CI re-dispatched it; otherwise merge origin/master and push again"
      fi
    elif [[ "$b" != ready/* ]] && [[ "$b" != cloud/* ]] && [ -z "$action" ]; then
      action="a work branch: when the work is finished, deliver it as ready/<agent-id>-<topic>; delete it once its work is merged or abandoned"
    fi
    echo "  $b [$own]: $state, $behind behind master"
    if [ -n "$action" ]; then echo "      -> ACTION: $action"; todo=$((todo + 1)); fi
  done < <(git -C "$MAIN" branch -r --format='%(refname:short)' | sed -n 's#^origin/##p' | grep -vE '^(master|HEAD)$')
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
