# Node caps in Lean: status (23 Oct 2026, ~10:00 EEST; merged into master from work/lower-caps2)

Goal: discharge `NodeCaps`, the only hypothesis of `Grothe.LowerAnalytic.lower_bound_of_nodeCaps`
(lower bound K_G^ℂ > Llow). The design and the four cap routes (P, A, M, H) are in
`handoff/research-third-decimal/PLAN_CAPS.md` (git-ignored; §1–§8). This file is the self-contained summary.

## Headline on this branch

`Grothe.LowerAnalytic.lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → Llow < K`
(`Grothe/LowerAnalytic/CapNodes.lean`). `CapsRest` = the vertex caps of the rows NOT in
`capRowsDone` (rows 12–15 = t 0.84, 0.845, 0.85, 0.855) plus the caps at excluded nodes of the
certified rows (all exclusion lists are currently EMPTY).

Proved (no sorry): chord nodes from vertex caps by convexity (`CapHull`, native fact `capChords_check`);
the anchored-pair majorant and node checker with soundness (`CapMajorant`, `CapPiece`, `CapPolar`,
`CapSym`, `CapGrid`, `CapGridT`, `CapGridOK`, `CapCheckSound`: `pot_le_of_nodeOK`); verified tables
(`CapTables`, `CapTablesMk`: `tablesOK_mk`); range check `rangeOK` + soundness `nodeCap_of_rangeOK`
(`CapRows.lean`).

Finite computation: one `native_decide` fact per range of 49 nodes, `capRangeKK_j` (j = 0..3) in
`Grothe/LowerAnalytic/CapRowKK.lean` for KK ∈ {00..11, 16, 17, 18} → **60 native facts** (+ `capChords_check`,
`head_check`, `cert_check`), all pinned in `scripts/check_axioms.py`. No `Task.spawn` in the cap checks:
each range is checked sequentially; lake runs the 15 row modules in separate processes.

## What is verified and what is not

* **VERIFIED: all 60 range facts pass** (no excluded nodes). `lake build GrotheCaps` of master 4304b22 on
  the droplet (`yo:~/grothe-caps`, log `caps2.log`), 23 Oct 02:48–06:48 UTC: wall 239 min 41 s, CPU 1269 min,
  every module single-threaded, load ~12 from other jobs. Per row module (s): rows 0–8 (coarse grid)
  2255, 2322, 2355, 2594, 2727, 2807, 3593, 3029, 6005; rows 9, 10, 11, 16, 17, 18 (fine grid)
  9940, 9782, 9409, 9884, 10377, 10069. `lake env lean scratch/AxiomsCaps.lean | python3
  scripts/check_axioms.py --caps`: OK (60 range facts + capChords_check + the cert_check chunks).
  Stamp `docs/CAPS_VERIFIED.txt` = sha256 fe2ea85d…f16eea over 140 files (unchanged by master up to 9233765).
* Evidence that every node passes (indicative only, it ran with `Task.spawn`, see below): #eval diagnostics
  of `nodeCheck` over all 196 nodes of each of the 15 rows (Mac rows 0–8, 17, 18; droplet rows 9–11, 16)
  reported failures only at row 3 node 0 and row 6 node 0; both fixed (below). Fine-grid nodes took
  ~9 s each, coarse ~5 s, with 8 parallel tasks on 8 cores.
* Two hand patches of the generated `CapRecipeData.lean` (the recipe JSON inputs of
  `tools/gen_cap_recipes.py` were in a lost scratch directory; the Lean file is now the only copy of the recipes):
  row 3 node 0 uses the recipe of node 1 on grid 1 (1600×256); row 6 node 0 uses its own recipe on grid 1.

## Why no parallel tasks (soundness concern)

Two full builds of the earlier single fact `capRows_check` (all nodes as `Task.spawn` tasks inside one
`native_decide`) aborted with SIGABRT after 33 and 105 min: macOS crash reports
(`~/Library/Logs/DiagnosticReports/lean-2026-10-23-0247*.ips`, `-0322*.ips`) show
`malloc: pointer being freed was not allocated` in `lean::mpz::~mpz` called from `GrotheKernel.mulI`
inside `angSumSW` (shared interval tables, big integers). That is a reference-count race / memory
corruption in compiled code run by `native_decide`; a run that does not crash could still be corrupted.
Unresolved cause (suspects: values reached inside tasks through constants or extracted closed terms that are
not marked multi-threaded). The integrator therefore asked for single-threaded checks only.
**The facts on master also use `Task.spawn`** (`Grothe/Lower/Basic.lean:20` `allPar`,
`Grothe/Lower/Support.lean:72–74` for `cert_check`, `GrotheKernel/Table.lean:86` for `head_check`); same concern.

## How to rebuild

```
export PATH="$HOME/.elan/bin:$PATH"
lake exe cache get                 # Mathlib oleans
lake build                         # everything; the 15 CapRowKK modules dominate
lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py
```
Regenerate the row modules: `python3 tools/gen_cap_nodes.py [--size 49] 0 1 2 3 4 5 6 7 8 9 10 11 16 17 18`
(rows must match `capRowsData` in `CapRecipeData.lean`). To exclude failing nodes, edit the third
component of the row in `capRowsData` (they then become part of `CapsRest`).

Diagnose single nodes quickly (interpreted driver calling the precompiled kernel): a module inside
`Grothe/` (NOT `lake env lean`, which does not load the precompiled `GrotheKernel` dynlib) with
`#eval show IO Unit from do let Ts := capGrids.map fun G => mkTables G.1 G.2.1 G.2.2; IO.println (nodeCheck k (parseRecs capRecipesKK) capGrids Ts [] i)`,
built with `lake build Grothe.LowerAnalytic.TmpX` (delete it afterwards).

## Verification procedure for master (target GrotheCaps, outside CI)

Since master c8fc97e the 15 `CapRowKK` modules form the separate lean_lib `GrotheCaps`
(`GrotheCaps.lean`); CI does not build them but runs `python3 scripts/caps_stamp.py --check`, which
compares a sha256 of the import closure of the row modules + `CapNodes.lean` + `GrotheCaps.lean` (+
`lean-toolchain`, `lake-manifest.json`) with `docs/CAPS_VERIFIED.txt` (warning while absent, failure on mismatch).
To (re)verify, on a machine with ≥ 8 cores (droplet `yo`):
```
git archive <master commit> | tar -x -C <dir>   # or rsync -a --delete --exclude .lake <checkout>/ yo:~/grothe-caps/
cd <dir>; lake exe cache get
lake build GrotheCaps                            # several hours single-threaded per module (see timings)
lake env lean scratch/AxiomsCaps.lean | python3 scripts/check_axioms.py --caps
python3 scripts/caps_stamp.py --write "droplet yo, <date>, <wall time>"
```
then commit `docs/CAPS_VERIFIED.txt` on a branch (e.g. `work/caps-stamp`) and push it; the integrator merges.
Timing (droplet, load ~12 from other jobs, 23 Oct): row 7 (196 coarse-grid nodes, 4 ranges) took
4,562 s in one process, i.e. ~23 s per node; fine-grid rows are slower.

Suggested refactor (not done): the row modules import `CapHull` → `Reduction` → the whole lower
certificate, so any change in the lower chain changes the stamp and forces the multi-hour rebuild.
Make `CapRowKK` import only the checker and its soundness (`CapRows` without `CapHull`, i.e. move
`VertexCapsRow`/`ExclCaps` and `nodeCap_of_rangeOK` into a module that depends only on `rowData`,
`rowPot`, `CapCheckSound`, `CapTablesMk`, `CapGridOK`), and let `CapHull`/`CapNodes` do the combination
with `lower_bound_of_vertexCaps`.

## Droplet `ssh yo` (8 cores, 31 GB)

* `~/grothe-caps`: rsync copy of this worktree (no .git), elan installed in `~/.elan`, Mathlib cache fetched.
  Update with `rsync -a --delete --exclude .lake --exclude .git <worktree>/ yo:~/grothe-caps/`.
* `~/grothe-capsm`: another worker's copy (M route) — do not touch.
* Recipe search tools: `~/grothe-cx/wc/wcert/plift.py` (P lifts), `~/grothe-cx/t4/pkg/{table_generator,proposal_m}.py`
  (anchored recipes); Mac copies under `~/Documents/Codex/2026-10-10/plea/outputs/anchored-tables-20261011/`.
* Never `pkill -f PATTERN` over ssh (kills the ssh shell, and other workers' lake processes); kill by pid.

## Remaining work

1. Confirm the 60 range facts (droplet build), then a local full build + axiom check; commit "verified".
2. Rows 12–15 (t 0.84–0.855): their mid-range caps (s ∈ [0.2, 0.42] ∪ [0.525, 0.6]) are localised
   S-lemma caps (route M, ~9,000 pieces × ~1 min each in the current checker) — not ported; they stay in `CapsRest`.
   `CapSymmetry.lean` already provides `pot_le_of_cover` for the symmetric piece covers.
3. The README of this branch describes the state above; merge into master is the integrator's call
   (base of this branch is master e8d67b5; master has moved since — merge conflicts expected in
   README.md, scratch/Axioms.lean, scripts/check_axioms.py, Grothe.lean).
