#!/usr/bin/env bash
# Scoped public-source pilot; this does not run the complete energy family.
# Agent-ID: codex-8c4d.
set -euo pipefail
test "$#" -eq 0
test -n "${OUT:?Set OUT to an owned result directory}"
mkdir -p "$OUT/source-pilot-metrics"
export LEAN_NUM_THREADS=1

# Check the generic bridge before starting the more expensive actual source.
# Both targets enforce their transitive standard-three guards in Lean.
for target in \
  Grothe.UpperChaos.PackedDyadicLegacyDelimiter \
  Grothe.UpperChaos.TaylorFirstPackedChunk253Pilot; do
  printf 'Checking %s with warnings treated as errors\n' "$target"
  /usr/bin/time -v -o "$OUT/source-pilot-metrics/${target##*.}.time.txt" \
    lake --wfail build "$target"
  cat "$OUT/source-pilot-metrics/${target##*.}.time.txt"
done
printf 'Generic delimiter bridge and one actual460-record chunk passed; whole arrays and band consumers remain open.\n'
