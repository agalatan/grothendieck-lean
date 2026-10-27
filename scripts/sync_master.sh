#!/usr/bin/env bash
# Bring the local `master` up to date with GitHub (fast-forward only; never commits, never discards).
# Run it before starting work and before delivering. Safe to run from any worktree, by any agent.
# It ends with an audit of your remote branches (set AGENT_ID=<your id>; without it, every agent's): stale, red,
# green-but-unmerged, conflicting with master. Deal with every line about your branches.
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

owner_of() {  # the Agent-ID line of the newest commit on the branch that is not in master
  local b=$1 c id
  for c in $(git -C "$MAIN" rev-list --max-count=20 "origin/master..origin/$b" 2>/dev/null); do
    id=$(git -C "$MAIN" log -1 --format=%B "$c" | sed -n 's/^Agent-ID: *\([^ ]*\).*/\1/p' | head -1)
    [ -n "$id" ] && { echo "$id"; return; }
  done
  # a branch already in master: its tip commit
  id=$(git -C "$MAIN" log -1 --format=%B "origin/$b" | sed -n 's/^Agent-ID: *\([^ ]*\).*/\1/p' | head -1)
  echo "${id:-?}"
}

audit() {
  set +e +o pipefail   # a report: never abort the sync on one odd branch
  echo
  echo "================================ YOUR BRANCHES: AUDIT ================================"
  echo "Watch your branches until they are merged or deleted (AGENTS.md §7, §14):"
  echo " * red check            -> read the log, merge origin/master, fix, push again (same branch name);"
  echo " * ready/ green, unmerged -> a conflict with master or a workflow change: merge origin/master, resolve"
  echo "                           (regenerate generated files and OVERVIEW.pdf), push again; workflows: open a PR;"
  echo " * already in master    -> delete it: git push origin --delete <branch>;"
  echo " * abandoned            -> delete it, and say so in its issue."
  [ -n "$AGENT" ] && echo "Agent: $AGENT (set AGENT_ID=<your id> to see only yours)" ||
    echo "All agents (set AGENT_ID=<your id> to see only yours)"
  local runs=""
  command -v gh >/dev/null 2>&1 && runs=$(gh run list --workflow lean.yml --limit 200 \
    --json headBranch,headSha,conclusion,status,databaseId \
    --jq 'group_by(.headBranch) | map(max_by(.databaseId)) | .[] | "\(.headBranch) \(.headSha) \(.status) \(if (.conclusion // "") == "" then "-" else .conclusion end) \(.databaseId)"' \
    2>/dev/null || true)
  local found=0 b own line state behind note sha tip
  while read -r b; do
    [ -z "$b" ] && continue
    own=$(owner_of "$b")
    [ -n "$AGENT" ] && [ "$own" != "$AGENT" ] && continue
    found=1
    tip=$(git -C "$MAIN" rev-parse "origin/$b")
    note=""
    if git -C "$MAIN" merge-base --is-ancestor "$tip" origin/master; then
      echo "  $b [$own]: already in master -> delete it"; continue
    fi
    behind=$(git -C "$MAIN" rev-list --count "$tip..origin/master")
    line=$(echo "$runs" | awk -v b="$b" '$1 == b' | head -1)
    if [[ "$b" == cloud/* ]]; then state="cloud job branch (no proof check)"
    elif [ -z "$line" ]; then state="no proof check found"
    else
      read -r _ sha st concl id <<< "$line"
      if [ "$st" != completed ]; then state="check running (run $id)"
      elif [ "$concl" = success ]; then state="GREEN (run $id)"
      else state="RED: $concl (run $id)"; fi
      [ "$sha" != "$tip" ] && state="$state, for an older commit"
    fi
    if ! git -C "$MAIN" merge-tree --write-tree origin/master "$tip" >/dev/null 2>&1; then
      note="; CONFLICTS with master: $(git -C "$MAIN" merge-tree --write-tree --name-only origin/master "$tip" 2>/dev/null |
        sed -n '2,/^$/p' | grep -v '^$' | head -4 | tr '\n' ' ')"
    fi
    if [[ "$b" == ready/* ]] && [[ "$state" == GREEN* ]]; then
      if git -C "$MAIN" diff --name-only "origin/master...$tip" | grep -q '^\.github/workflows/'; then
        note="$note; changes .github/workflows: needs a pull request (the user merges)"
      elif [ -z "$note" ]; then
        note="; green but not merged: CI re-dispatches it if master moved; if it stays, look at the run's finish job"
      fi
    fi
    echo "  $b [$own]: $state, $behind behind master$note"
  done < <(git -C "$MAIN" branch -r --format='%(refname:short)' | sed -n 's#^origin/##p' | grep -vE '^(master|HEAD)$')
  [ "$found" = 0 ] && echo "  (no branches)"
  echo "======================================================================================="
}

if [ "${1:-}" = "--status" ]; then status; exit 0; fi

git -C "$MAIN" fetch --prune origin
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
