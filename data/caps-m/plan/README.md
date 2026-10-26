# Campaign plan for the route-M caps (rows 12–15), issue #16

Produced by `tools/caps_plan.py` (see `docs/CAPS_M_PIPELINE.md`, "Campaign plan").

* `exports/exp_*.jsonl`: piece matrices exported by Lean (`exportPiecesOn`) on a given grid
  (`g0` = 400×128, `g1` = 1600×256, `g2` = 1600×1024). The `ok` field is the Lean check `pieceOKc` itself.
* `solved/sol_*.json`: per piece `pass` (stored multipliers), `fixed` (new exact multipliers), `cap_up` (smallest
  exact cap increase). `sol_overrides14_g2.json`: the row-14 results of #14 (`data/caps-m/overrides.json`).
* `nodes/<k>x<i>.json`: the plan per node (grid, multipliers, cap increase), sample nodes only so far.

Status 26 Oct: centre pieces of a 12-node sample on their stored grid (max cap increase 4.9e-10; 14:200 piece 0 from
#14: 2.59e-9); all pieces of 12:154, 12:184, 12:213, 13:154 on the coarse grid (passes iff stored slack ≳ 6e-5).
