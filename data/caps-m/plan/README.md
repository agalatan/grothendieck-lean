# Campaign plan for the route-M caps (rows 12–15), issue #16

Produced by `tools/caps_plan.py` (see `docs/CAPS_M_PIPELINE.md`, "Campaign plan").

* `exports/exp_*.jsonl`: piece matrices exported by Lean (`exportPiecesOn`) on a given grid
  (`g0` = 400×128, `g1` = 1600×256, `g2` = 1600×1024). The `ok` field is the Lean check `pieceOKc` itself.
* `solved/sol_*.json`: per piece `pass` (stored multipliers), `fixed` (new exact multipliers), `cap_up` (an
  exact feasible cap increase, without a minimality claim). `sol_overrides14_g2.json`: the row-14 results of #14 (`data/caps-m/overrides.json`).
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
The remaining count, maximum and both alternatives must be reported on #72. The user's
completion request authorizes wiring unchanged-cap certificates into `CapsRest` (#15);
any residual requiring changed mathematics still needs the user's decision first.

`tools/caps_centre_campaign.py run --agent-id codex-15b7 --manifest
data/caps-m/plan/centre-sweep-codex-15b7.json` runs the local search with one owned
child process at a time (start it in its own process group, per `AGENTS.md`). It
reuses completed exports, checks exact certificates on resume, and records raw
coverage separately from completed repair attempts. The progress file is
`centre-campaign-progress-codex-15b7.json`. A checkpoint pause exits with 75;
unresolved fine searches are retained while other centres continue. They prevent
the report from claiming a final remaining maximum.

The tested repair choices differ by stored grid: radial refinement to 3200×256
removes the increase at 12:280/103; angular refinement to 1600×1152 removes the
increase at 14:200/0. Both have exact zero-increase certificates in `solved/fine/`.
Finer grids need not improve a fixed price recipe: the 512- and 1152-angle trials
for 12:280/103 have exact common-constraint-kernel obstructions, recorded under
`solved/retry/`. These concern those exported matrices, not the analytic node
bound. `tools/caps_centre_retry.py` independently checks the rational witnesses
and can search for additional exact multiplier certificates without rebuilding a
grid.

The committed `checkpoint-codex-15b7.json` contains 72 completed centres, including
the 15 adopted historical records. Every completed centre has zero best residual;
the full 358-centre maximum is still unknown. The 15:155/0 and 15:186/0 finer-grid
solutions are also saved. Radial refinement also removes the stored-grid increases
at 14:274/117 and 14:276/137 (about 2.00e-7 and 6.43e-7 respectively), with exact
zero-increase solutions on 3200×256. `cover-baseline-codex-15b7.json` replays all 10,762 current
boxes with unchanged inputs and records the exact margin and lower endpoint.
Neither this baseline nor a partial sweep is a final caps verification.
The sensitivity audit uses Lean's depth-nine finite majorant check and binds
the generated mixed and law data byte for byte to their canonical JSON. It
distinguishes the inclusive global increase allowed by the current target
(`4.50e-14`) from the exclusive arithmetic limit for the current strict lower
endpoint (`3.07e-13`), separately from the endpoint rounding recipe.

All 38 centres stored on 1600×256 have now been assessed with zero best residual,
including the radial repairs. The 1600×1024 phase is still in progress; this
checkpoint contains 34 of its 320 centres, including 14 adopted historical records.
It was captured while the worker continued: only evidence belonging to completed
centres is backed up, and the current incomplete export is excluded.
`tools/caps_centre_checkpoint.py` makes this backup protocol reproducible. Its
default candidate/audit modes write nothing; snapshot replacement and signed
handoff output require explicit options. It validates hash pins, complete-node
identities, stored/fine provenance and observed grids, without claiming numerical
or native verification.

`tools/caps_rest_inventory.py` independently inventories the full remaining row
obligations without proving or wiring any cap. Its reproducible output is
`rest-inventory-codex-15b7.json` (`--check` compares without writing). Exact row,
chord and recipe bindings identify 1,258 vertices: 358 localised nodes with 16,719
pieces, plus 900 anchored candidates from the durable `node-recipes/recM_*.json`.
All anchored candidates remain explicitly unverified; the centre sweep alone
cannot establish `CapsRest`.
