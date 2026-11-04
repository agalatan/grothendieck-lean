#!/usr/bin/env bash
# Check the retained parser and complete actual-byte source certificate.
# Agent-ID: codex-8c4d.
set -euo pipefail

targets=(
  Grothe.UpperChaos.PackedDyadicStructuralChecks
  Grothe.UpperChaos.PackedDyadicSourceAssembly
  Grothe.UpperChaos.TaylorFirstPackedChunk253LegacyLeaf000
  Grothe.UpperChaos.TaylorFirstPackedChunk253Pilot
)

if [ "${1:-}" = '--plan' ] && [ "$#" -eq 1 ]; then
  printf '%s\n' "${targets[@]}"
  exit 0
fi
if [ "$#" -ne 0 ]; then
  printf 'Usage: %s [--plan]\n' "$0" >&2
  exit 2
fi

python3 tools/gen_first_second_packed_pilot.py --check
lake build --wfail "${targets[@]}"
