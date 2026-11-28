#!/usr/bin/env bash
# Run a foreground research command in a reserved slot on big or mega (AGENTS.md §12).
# Start this wrapper in its own process group in your job directory. It records that PGID in job.pid.
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/agent_ids.sh"

if [ "$#" -lt 3 ] || ! is_agent_id "$1"; then
  echo "usage: $0 <agent-id> <core-slot> <command> [args ...]" >&2
  exit 2
fi
agent=$1
slot=$2
shift 2

# Use the machine's online CPU count, independent of the caller's taskset mask.
case "$(getconf _NPROCESSORS_ONLN):$slot" in
  32:16-23|32:24-31) cap=48 ;;            # mega
  48:24-31|48:32-39) cap=16 ;;            # big
  48:40-47)          cap=15 ;;            # big: 16 + 16 + 15 = 47 GiB
  *) echo "unsupported research slot $slot on this machine" >&2; exit 2 ;;
esac
read -r pgid < <(ps -o pgid= -p "$$")
if [ "$pgid" != "$$" ]; then
  echo "start the wrapper in its own process group (AGENTS.md §12)" >&2
  exit 2
fi

slots="$HOME/research-slots"
reservation="$slots/$slot"
mkdir -p -- "$slots"
mkdir -- "$reservation" || exit 1
owner="$agent $pgid $PWD"
if ! printf '%s\n' "$owner" > "$reservation/owner" || ! printf '%s\n' "$pgid" > job.pid; then
  rm -f -- "$reservation/owner"
  rmdir -- "$reservation"
  exit 1
fi

# Wait for the foreground command. If the wrapper is killed, leave the reservation for the
# status check rather than freeing its cores while a surviving process group is still active.
rc=0
systemd-run --user --scope --quiet -p "MemoryMax=${cap}G" -- taskset -c "$slot" "$@" || rc=$?
if [ "$(cat -- "$reservation/owner")" = "$owner" ]; then
  rm -- "$reservation/owner"
  rmdir -- "$reservation"
fi
exit "$rc"
