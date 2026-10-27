#!/usr/bin/env bash
# Agent-ID: codex-cf82. Isolated, bounded external-Arb computation; not a Lean check.
set -euo pipefail
: "${OUT:?cloud output directory required}"
[ "${NSHARDS:-1}" = 1 ] || { echo 'q0 certificate requires exactly one shard' >&2; exit 2; }
python3 -m pip install --quiet 'python-flint==0.9.0'
exec python3 tools/q0_cert/softened_q0_driver.py
