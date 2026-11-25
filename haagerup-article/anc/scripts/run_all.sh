#!/usr/bin/env bash
# Run the reproduction scripts 01-07 in order; stop at the first failure.
#
#   ./run_all.sh                 everything, with the long option of 04 (--all: about 12 minutes on one core)
#   ./run_all.sh --quick         the default options only (about 3 minutes)
#   ./run_all.sh --jobs 4        worker processes for 04 (the output does not depend on it)
#   ./run_all.sh --save          also write each output to expected_output/ (overwrites the reference outputs)
#   PYTHON=/path/to/python ./run_all.sh     choose the interpreter (default: python3)
#
# Prints one PASS/FAIL line per script and the total time.  The output of each script is compared with
# expected_output/; a difference is reported but is not a failure (see README.md, "Comparing with the
# reference outputs").  The scripts are not part of the proof and the Lean package does not use them.
set -u
cd "$(dirname "$0")" || exit 2
PY="${PYTHON:-python3}"
export PYTHONDONTWRITEBYTECODE=1
QUICK=0
JOBS=1
SAVE=0
while [ $# -gt 0 ]; do
  case "$1" in
    --quick) QUICK=1 ;;
    --save) SAVE=1 ;;
    --jobs) shift; JOBS="${1:?--jobs needs a number}" ;;
    -h|--help) sed -n '2,13p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "unknown option: $1" >&2; exit 2 ;;
  esac
  shift
done

total_start=$(date +%s)
status=0

run() {  # run <reference name> <script> [arguments...]
  local ref="$1"; shift
  local script="$1"; shift
  local start out code secs note=""
  start=$(date +%s)
  out=$("$PY" "$script" "$@")
  code=$?
  secs=$(( $(date +%s) - start ))
  if [ "$SAVE" = 1 ] && [ "$code" = 0 ]; then
    mkdir -p expected_output && printf '%s\n' "$out" > "expected_output/$ref.txt"
  fi
  if [ -f "expected_output/$ref.txt" ]; then
    if printf '%s\n' "$out" | diff -q - "expected_output/$ref.txt" > /dev/null; then
      note="output identical to expected_output/$ref.txt"
    else
      note="output DIFFERS from expected_output/$ref.txt"
    fi
  fi
  if [ "$code" = 0 ]; then
    printf 'PASS  %-28s %4ds  %s  [%s]\n' "$script $*" "$secs" "$(printf '%s\n' "$out" | tail -n 1)" "$note"
  else
    printf '%s\n' "$out"
    printf 'FAIL  %-28s %4ds  (exit status %s)\n' "$script $*" "$secs" "$code"
    status=1
  fi
  return "$code"
}

{
  run 01_certificate_arithmetic 01_certificate_arithmetic.py &&
  run 02_gamma_dagger 02_gamma_dagger.py &&
  run 03_cell_maps 03_cell_maps.py &&
  if [ "$QUICK" = 1 ]; then
    run 04_overlaps 04_overlaps.py --jobs "$JOBS"
  else
    run 04_overlaps_all 04_overlaps.py --all --jobs "$JOBS"
  fi &&
  run 05_head 05_head.py &&
  run 06_tails 06_tails.py &&
  run 07_alternating_sums 07_alternating_sums.py
} || status=1

echo "total time: $(( $(date +%s) - total_start )) s"
if [ "$status" = 0 ]; then echo "ALL PASS"; else echo "STOPPED AT THE FIRST FAILURE"; fi
exit "$status"
