#!/bin/bash
# On yo, in ~/claude-b9ee-gate/pkg: the tables of the model gate (4.16) for each game -> gate_summary.md (issue #713; N).
cd "$(dirname "$0")"; PY=$HOME/claude-b9ee-gate/venv/bin/python; : > gate_summary.md
for x in "gC 0.78 0.0779 the capped game (control)" "g081 0.81 0.165 the cap-0.81 game (outputs of 16 Nov 2026, NEWCAP)" "gB 0.82 0.194 game B" "gA 0.8493 0.2827 game A"; do
  set -- $x; g=$1; e=$2; h=$3; shift 3
  [ -d gate_$g/out ] || continue
  printf '### %s = (1, -%s, %s): %s\n\n' "$g" "$e" "$h" "$*" >> gate_summary.md
  (cd gate_$g && D5_E1=$e D5_ETA=$h $PY collect_gate.py exact >> ../gate_summary.md 2>&1); echo >> gate_summary.md
done
