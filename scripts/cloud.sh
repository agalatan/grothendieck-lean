#!/usr/bin/env bash
# Run a job in the cloud (GitHub Actions, .github/workflows/cloud.yml): Lean builds/checks or committed scripts, with
# optional sharding. See AGENTS.md section 4d.
#
#   scripts/cloud.sh [options] lean   <Module> [<Module> ...]   build Lean modules (e.g. native_decide facts)
#   scripts/cloud.sh [options] check                            the full proof check of the branch, no merge
#   scripts/cloud.sh [options] script <path> [args ...]         a committed .py / .sh / .cpp
#   scripts/cloud.sh fetch <run-id> [dir]                       download the results of an earlier run
#   scripts/cloud.sh list                                       recent cloud runs
# Options:
#   --ref <branch>     the branch to run (default: the current branch; it must be pushed and up to date)
#   --shards <N>       parallel jobs (1-32, default 1): lean deals modules round-robin; scripts get SHARD/NSHARDS
#   --runner droplet   script jobs only: the droplet (more memory, no 6-hour limit), one job at a time
#   --timeout <min>    minutes per shard (default 120)
#   --no-wait          print the run and return immediately (then: scripts/cloud.sh fetch <run-id>)
# Results land in <repo>/handoff/cloud/<id>/<shard>/ (log.txt, summary.json and whatever the job wrote to $OUT).
# The exit status is 0 iff every shard succeeded.
set -euo pipefail
REPO=agalatan/grothendieck-lean
TOP=$(git rev-parse --show-toplevel)

die() { echo "cloud.sh: $*" >&2; exit 2; }

fetch() {  # fetch <run-id> <dir>
  local run=$1 dir=$2
  mkdir -p "$dir"
  gh run download "$run" --repo "$REPO" -D "$dir" >/dev/null 2>&1 || true
  local ok=0 n=0
  for d in "$dir"/cloud-*; do
    [ -d "$d" ] || continue
    n=$((n + 1))
    local sh=${d##*-}
    mv "$d" "$dir/$sh" 2>/dev/null || true
    local st
    st=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("status","?"))' "$dir/$sh/summary.json" 2>/dev/null || echo "?")
    local sec
    sec=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("seconds","?"))' "$dir/$sh/summary.json" 2>/dev/null || echo "?")
    echo "  shard $sh: status $st, ${sec}s  ($dir/$sh/log.txt)"
    [ "$st" = 0 ] || ok=1
  done
  [ "$n" -gt 0 ] || { echo "  no results downloaded (the run may have failed before producing any; see the run page)"; ok=1; }
  return $ok
}

case "${1:-}" in
  fetch)
    [ $# -ge 2 ] || die "usage: cloud.sh fetch <run-id> [dir]"
    fetch "$2" "${3:-$TOP/handoff/cloud/run-$2}"; exit $? ;;
  list)
    gh run list --repo "$REPO" --workflow cloud.yml --limit 20 \
      --json databaseId,displayTitle,status,conclusion,createdAt \
      --jq '.[] | "\(.databaseId)  \(.createdAt[5:16])  \(.status) \(.conclusion // "")  \(.displayTitle)"'
    exit 0 ;;
esac

ref=$(git -C "$TOP" branch --show-current)
shards=1 runner=hosted timeout=120 wait=1
while [ $# -gt 0 ]; do
  case "$1" in
    --ref) ref=$2; shift 2 ;;
    --shards) shards=$2; shift 2 ;;
    --runner) runner=$2; shift 2 ;;
    --timeout) timeout=$2; shift 2 ;;
    --no-wait) wait=0; shift ;;
    lean|check|script) break ;;
    *) die "unknown option or kind: $1" ;;
  esac
done
kind=${1:-}; [ -n "$kind" ] || die "missing kind (lean, check or script)"; shift
targets="$*"
case "$kind" in
  lean) [ -n "$targets" ] || die "lean needs module names" ;;
  script) [ -n "$targets" ] || die "script needs a path" ;;
esac
[ -n "$ref" ] || die "no branch (detached HEAD?): pass --ref <branch>"

# the branch must be pushed, and the remote tip must be what you mean to run
git -C "$TOP" fetch -q origin "$ref" 2>/dev/null || die "branch $ref is not on GitHub: push it first"
if [ "$ref" = "$(git -C "$TOP" branch --show-current)" ] && \
   [ "$(git -C "$TOP" rev-parse HEAD)" != "$(git -C "$TOP" rev-parse "origin/$ref")" ]; then
  die "your HEAD differs from origin/$ref: push first (the job runs the pushed commit)"
fi
if [ "$kind" = script ]; then
  path=${targets%% *}
  git -C "$TOP" cat-file -e "origin/$ref:$path" 2>/dev/null || die "$path is not committed on origin/$ref"
fi

id="${AGENT_ID:-$(whoami)}-$(date -u +%Y%m%d%H%M%S)-$RANDOM"
gh workflow run cloud.yml --repo "$REPO" --ref "$ref" -f id="$id" -f kind="$kind" -f targets="$targets" \
  -f shards="$shards" -f runner="$runner" -f timeout="$timeout" >/dev/null
# find the run by its unique id (it appears within a few seconds)
run=""
for _ in $(seq 1 30); do
  run=$(gh run list --repo "$REPO" --workflow cloud.yml --limit 30 --json databaseId,displayTitle \
        --jq ".[] | select(.displayTitle | startswith(\"cloud $id \")) | .databaseId" | head -1)
  [ -n "$run" ] && break
  sleep 3
done
[ -n "$run" ] || die "dispatched $id but could not find its run; see: scripts/cloud.sh list"
url="https://github.com/$REPO/actions/runs/$run"
echo "cloud job $id: $kind on $ref, $shards shard(s), runner $runner"
echo "  run $run  $url"
if [ "$wait" = 0 ]; then echo "  results later: scripts/cloud.sh fetch $run"; exit 0; fi

gh run watch "$run" --repo "$REPO" --interval 30 >/dev/null 2>&1 || true
concl=$(gh run view "$run" --repo "$REPO" --json conclusion --jq .conclusion)
echo "  conclusion: $concl"
dir="$TOP/handoff/cloud/$id"
fetch "$run" "$dir"
