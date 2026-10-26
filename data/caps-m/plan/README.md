# Campaign plan for the route-M caps (rows 12–15), issue #16

Produced by `tools/caps_plan.py` (see `docs/CAPS_M_PIPELINE.md`, "Campaign plan").

* `exports/exp_*.jsonl`: piece matrices exported by Lean (`exportPiecesOn`) on a given grid
  (`g0` = 400×128, `g1` = 1600×256, `g2` = 1600×1024). The `ok` field is the Lean check `pieceOKc` itself.
* `solved/sol_*.json`: per piece `pass` (stored multipliers), `fixed` (new exact multipliers), `cap_up` (smallest
  exact cap increase). `sol_overrides14_g2.json`: the row-14 results of #14 (`data/caps-m/overrides.json`).
* `nodes/<k>x<i>.json`: the plan per node (grid, multipliers, cap increase), sample nodes only so far.

Status 26 Oct: centre pieces of a 12-node sample on their stored grid (max cap increase 4.9e-10; 14:200 piece 0 from
#14: 2.59e-9); all pieces of 12:154, 12:184, 12:213, 13:154 on the coarse grid (passes iff stored slack ≳ 6e-5).

## Centre sweep and padding alternatives (#87, #72)

`centre-sweep-codex-15b7.json` records all 358 centres, their actual piece indices and stored grids,
and hashes of the computational sources and inputs. There are 320 centres on 1600×1024 and 38 on
1600×256. Fifteen stored-grid results have explicit historical reuse notes; the remaining campaign
has 306 fine-grid and 37 medium-grid exports. Scratch `CapPlanRuns` modules are generated locally
and are never committed.

`tools/caps_centre_sweep.py` prepares and validates resumable exports and exact multiplier searches.
`tools/caps_centre_repair.py` tries new multipliers and complete Cartesian interval partitions,
retaining exact rational LDL checks for every accepted child. `tools/caps_centre_fine.py` prepares
separate explicit-grid exports, labelled `3` with an exact `grid_spec`; these never count as
stored-grid evidence. The pilot, exports, solved records and repair trees live here. Search results
require final Lean verification through the CI caps runner before becoming certificate facts.

All `cap_up` values are **additional** to the unchanged baseline `capPad = 1e-11`. They are feasible
search results, not proofs of a necessary or minimal increase. The current refined cover's margin
is about `4.4997879522181144e-14`; the older `1.77e-8` margin cannot justify changing this cover.
No padding or cover change is made by these tools.

After the sweep and repair attempts, `tools/caps_cover_sensitivity.py` supports exact research
replays of the current cover and global-padding endpoint calculations. A per-node arithmetic replay
is conditional until every affected source certificate and hull/chord dependency has been checked.
The remaining count, maximum and both alternatives must be reported on #72 for the user's decision
before wiring the pieces into `CapsRest` (#15).
