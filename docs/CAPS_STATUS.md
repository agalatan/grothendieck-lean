# Node caps in Lean: status of branch `work/lower-caps2` (23 Oct 2026, ~05:00 EEST)

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

* **NOT YET VERIFIED: the 60 range facts.** Commit 9288964 compiles structurally (checked with the
  facts replaced by `sorry`: `vertexCapsRowKK`, `vertexCaps_of_capsRest`, `lower_bound_of_capsRest`
  elaborate). The full build was started on the droplet at 00:50 UTC 23 Oct (`yo:~/grothe-caps`,
  log `~/grothe-caps/full.log`, last line `EXIT <code>`); at 01:51 UTC no row module had finished yet
  (droplet load ~12 from other jobs). Check it: `ssh yo 'grep -a "CapRow\|EXIT\|error" ~/grothe-caps/full.log | grep -v warning'`.
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
