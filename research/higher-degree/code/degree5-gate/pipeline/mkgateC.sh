#!/bin/bash
cd $HOME/claude-b9ee-gate/pkg; rm -rf gate_gC; cp -R gate gate_gC; rm -rf gate_gC/out gate_gC/regress
/home/agalatan/claude-b9ee-gate/venv/bin/python - <<P
import json
rows = sorted([json.loads(l) for l in open("thresholds/games/gC/rows_all.lines") if l.strip()], key=lambda r: r["t"])
assert len(rows) == 20
open("gate_gC/rows5.lines", "w").write("\n".join(json.dumps({k: r[k] for k in ("t", "l", "beta", "bA", "bB", "sig", "nu5", "branch", "row", "plain", "driver")}) for r in rows) + "\n")
P
