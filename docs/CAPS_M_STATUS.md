# Caps, route M (rows 12–15, t = 0.84–0.855): status and how to continue

Branch `work/caps-m` (base `c1d2e6e` of `work/lower-caps2`). Goal: shrink the remaining cap hypothesis
(`CapsRest`, see `CapNodes.lean` on `work/lower-caps2`) to nothing on rows 12–15. Those rows have 396 nodes
each; their caps come from three sources:
1. chord nodes (`capChords`, already handled by `CapAssembly`);
2. anchored-quadratic caps (route A), certified by the existing node checker `nodeOK`;
3. localised caps (route M, MIDCAPS) at s ∈ [0.2, 0.42] ∪ [0.525, 0.6], certified by piece lists.

Background: `handoff/research-third-decimal/PLAN_CAPS.md` (§1 routes, §5 interfaces) and
`handoff/lower-stein/cert-0745{d,e}/MIDCAPS*.md`. `handoff/` is git-ignored; it lives in the main checkout
on the Mac and is mirrored in part on the droplet.

## 1. What is proved (all on this branch, no `sorry`, each module compiled on the droplet)

* `Grothe/LowerAnalytic/CapCover.lean`
  * constraints `Cons` (`lo ≤ v·vec(M y) ≤ hi`, multipliers `lam`, `mu`); `pieceSet`;
  * `tau` symmetry lemmas (`tau_cj_re/im`, `tau_ng_re/im`); `exists_orbit_rep`;
  * one-dimensional samples `cands` / `sample_exists`;
  * the decidable check `capCoverOK ds P` and its soundness `capCover_sound`: every `y` lies in the
    `S_c`/`S_-` orbit of some piece.
* `Grothe/LowerAnalytic/CapConstr.lean`
  * the S-lemma matrices `Cons.sMat` (`qf_sMat`, `qf_sMat_nonneg`);
  * `pieceNc` and `pieceOKc` (enclosure check + multiplier check + exact LDL of N − ΣS);
  * `Jpot_le_of_pieceOKc` (J ≤ cap on the piece region);
  * `nodeOKc` with `Jpot_le_of_nodeOKc` (prices and enclosures from a recipe on a grid, as `nodeOK`);
  * `pot_le_of_pieces` (cover + all pieces ⇒ Ψ(s) − capPad ≤ c);
  * string parsers `parseCons`, `parsePiece`, `parseDirs`.
* `Grothe/LowerAnalytic/CapPieceNodes.lean`
  * `pieceGrids` = [(400,128,1/50), (1600,256,1/200), (1600,1024,1/200)];
  * `pieceNodeOK` (SEQUENTIAL; project rule: no `Task.spawn` under `native_decide`);
  * `nodeCap_of_pieceNodeOK : pieceNodeOK … x = true → NodeCap x.1 x.2.1`.
* `Grothe/LowerAnalytic/CapPiece.lean`: refactor, `Jpot_le_of_qfN` (pointwise form), and
  `pot_le_of_pieceOK` as a corollary.
* `tools/gen_cap_pieces.py`
  * `json OUT.json` extracts, for every vertex node of rows 12–15 that has a MIDCAPS certificate, the
    certificate with the fewest pieces: 358 nodes, 16,719 pieces. Each piece is (nq, float slack,
    recipe, constraints on ±d_k).
  * `lean PIECES.json GRIDS.json` writes `Grothe/LowerAnalytic/CapPieceData.lean`
    (`capPieceNodes`). GRIDS.json gives, per node "k:i", the grid index of each piece.

Not yet done:
* the data module `CapPieceData.lean` and the native facts over it;
* the integration into `CapNodes.lean` (`CapsRest` minus the piece nodes). A suggested form is
  `ExclCaps` split as excluded = piece nodes ∪ rest, with
  `∀ x ∈ capPieceNodes, NodeCap x.1 x.2.1` from range facts.

## 2. Diagnostics so far (droplet `yo`, `~/grothe-capsm`)

Step 1, the cheap win: anchored proposal recipes for the non-chord nodes of rows 12–15.
* Recipe: m from `proposal_m.propose(row, s)` (`~/grothe-cx/t4/pkg`), v0 = m + s·a in coordinates
  0..2, no variance, scale 1. Files: `~/grothe-cx/t4/pkg/recM_<t>.json`, all vertex nodes.
  `recS_<t>.json` (in the Mac scratch only; regenerate by filtering out the piece nodes) holds the
  900 vertex nodes without a MIDCAPS certificate.
* Grid 0 (400 × 128): **every node fails**, at all s. The anchored stored caps need the fine grid.
  (The previous worker found the same for rows 16–18; their recipes all use grid 1.)
* Grid 1 (1600 × 256), every 8th vertex node (45 per row): all nodes pass except the window nodes:
  * row 12 fails at 128..208, 240, 248, 272, 280, 288;
  * row 13 fails at 128..224, 240, 272, 280;
  * row 14 fails at 136..224, 280, 288;
  * row 15 fails at 144..224, 248, 280, 288.

  These are s ≈ 0.18–0.42 and 0.5–0.6, exactly the MIDCAPS windows plus a few nodes just below 0.2.
  Cost ≈ 55 s per node per core.
* Not yet run: the full grid-1 sweep of the 900 non-piece vertex nodes (data prepared as
  `CapDiagDataS`/`CapDiagS`, see §4). About 900 × 55 s ≈ 14 CPU-hours.
  For the near-window failures, try the generator's retries: variance factor amplitude ×
  (17/20, −1/20, 53/100) on coordinates (6, 7, 10), and price scale 2^e.

Step 2: route M pieces. The question is whether the Lean price rule (cell-RMS from the polar moments)
reproduces the MIDCAPS caps, which were made with exactint's 2 × 2 point-RMS prices and have float
slack only 1e-12 .. 2e-12 at the binding piece (plus capPad 1e-11).
* Run `CapPDiag` on nodes 14:150 (9 pieces, nq 1024), 14:200 (42 pieces, nq 256/1024) and
  14:280 (167 pieces, nq 256): grid forced to 0, then the stored grid (without 280).
* RESULT (pd3, sequential, master sources; raw output `data/caps-m/pd3-results.txt`):
  * node 14:150 (s = 9/40, one-direction format, 9 pieces on 1600 × 1024): coverage OK, 8/9 pieces pass;
    piece 0 (the centre slab |τ₃| ≤ 3/1000) fails.
  * node 14:200 (s = 7/20, two-direction format, 42 pieces on 1600 × 1024 / 1600 × 256): coverage OK,
    31/42 pass; pieces 0–6, 12, 18, 24, 30 fail (the boxes touching the centre interval I₀ in τ₂ or τ₃).
  * node 14:280 (s = 11/20, 167 pieces, coarse 400 × 128 forced): coverage OK, 154/167 pass; fail 0, 1, 2, 5, 6,
    31, 32, 36, 98, 99, 103, 104, 129. On the stored grid (1600 × 256) only 0, 5, 98, 103 fail.
  * The failing pieces are the ones near the maximiser, where the float slack is ~1e-12.
* (superseded) STATUS when this file was written: still running on the droplet (lean pid 1457251, log
  `~/grothe-capsm/pdiag2.log`). The droplet was oversubscribed by other sessions (load ≈ 12), so
  it was very slow. The result lines start with `node 14:…` (grep `info:`).
  * If the stored-grid run passes at the binding pieces: generate CapPieceData and run.
  * If it fails by ~1e-11 .. 1e-9: the binding pieces need prices closer to exactint's.
    * Option (a): add a recipe variant to `GrotheCapsKernel/CapCheck.lean` that computes the 2 × 2 point-RMS
      prices exactly as `cert-0745e/tools/exactint.py: ExactSetup.prices`. Floats are allowed:
      prices are search data, and soundness never depends on them.
    * Option (b): re-optimise the multipliers λ, μ of the binding piece in Lean's own price setting.
* Expected cost:
  * 1600 × 1024 is ~4× the 1600 × 256 node cost (~4 min per piece);
  * ~360 binding pieces (float slack < 1e-6);
  * ~3,500 with slack < 1e-4 (grid 1);
  * ~13,000 with larger slack (try grid 0 first, ~5 s each).

  Roughly 25 + 50 + 20 CPU-hours.

## 3. Droplet layout (`ssh yo`)

* `~/grothe-capsm`: this branch's sources plus a private `.lake`. All hardlinks to `~/grothe-caps`
  were broken (copied); `.lake/packages` is the shared Mathlib.
  It is NOT a git repo: sync sources with
  `rsync -c` / `scp` of `.lean`/`.py` files to `/home/agalatan/grothe-capsm/` (absolute path).
  * Diagnostic modules (not in `Grothe.lean`, not committed):
    `Grothe/LowerAnalytic/CapDiag0/1.lean` + `CapDiagData*.lean` (node recipes on a forced grid),
    `CapPDiag.lean` + `CapPDiagData.lean` (pieces).
  * They are run by `lake build Grothe.LowerAnalytic.<Module>`; the `#eval` output appears as `info:`
    lines in the log.
  * WARNING: they still use `Task.spawn` inside `#eval`. New diagnostics must be sequential and
    parallelised by several modules.
* `~/grothe-cx/t4/pkg`: anchored generator (`table_generator.py`, `proposal_m.py`),
  `propM.py` (the per-node proposal recipes), `recM_<t>.json`.
* `~/grothe-cx/wc/wcert`: P lifts (`plift.py`); `row_e_<t>.json` (the cert-0745e rows);
  `plM_<t>{a,b}.json` (P lifts for rows 12–15). These are useless here: P caps sit ~5e-5 above the
  stored caps on these rows.
* Polling: wait on pids (`while kill -0 PID; do sleep 20; done`), never
  `pgrep -f` / `pkill -f` patterns. When restarting a build, kill the orphaned `lean` child by pid too.

## 4. How to rerun

```sh
# pieces JSON (Mac, main checkout has handoff/)
GROTHE_HANDOFF=/Users/alingalatan/workspaces/grothe/handoff python3 tools/gen_cap_pieces.py json /tmp/pieces.json
# per-node anchored proposal recipes (droplet)
cd ~/grothe-cx/t4/pkg && ~/grothe-cx/venv/bin/python propM.py ~/grothe-cx/wc/wcert/row_e_0.84.json vert_M.json 0.84 recM_0.84.json
# Lean data for node recipes: tools/gen_cap_recipes.py ROW:recipes.json[:EXCL] (recipes need k, g=1, v0, var, scale)
# build + check one module on the droplet
cd ~/grothe-capsm && export PATH=$HOME/.elan/bin:$PATH && lake build Grothe.LowerAnalytic.CapPieceNodes
```

## 5. Why pieces fail, and the fix (25–26 Oct)

**Mechanism (verified, `data/caps-m/pdmA.log`, `pdmB.log`).** Every failing piece of 14:150 and 14:200 carries a
two-sided centre constraint `|τ| ≤ 3/1000`. On those pieces the cap margin is fine (the Schur complement at the cap
entry is ≥ 0), but the cap-free 12 × 12 block of `N − Σ S_c` has a pivot ≈ −5e-6 … −1e-5: the S-lemma multiplier λ of
the centre constraint is a hair too small. Raising λ makes the block PSD but costs cap (λ·(3/1000)² enters the cap
entry), so a uniform scaling is a bad trade: the exact grid search (`tools/caps-m-diag/CapPDH.lean`,
`data/caps-m/pdH.log`) found for 14:150 piece 0 λ × 1.01 → Δcap 1e-8, × 1.05 → 1e-7, × 1 → no Δcap works.

**Fix: re-optimise all multipliers of the piece jointly.** The multipliers enter the checked matrix linearly, so the
best (λ, μ) is a small SDP. The speed worker (#42) built this on master: `Grothe/LowerAnalytic/CapExport.lean` exports
`N`, `A_c`, `B_c` with the checker's own functions (≈ 3.5 min per piece, once), `tools/caps_lmi.py solve` solves the
SDP, refines to 60 digits and rounds to rationals with an exact LDL (seconds per piece); see `docs/SPEED_TOOLS.md`.
Results for the 16 pieces that fail on their stored grid (`data/caps-m-lmi/sol_*.json` on master; overrides in
`data/caps-m/overrides.json`):

| node | failing (stored grid) | fixed, Δcap = 0 | needs Δcap | Lean re-check of the new multipliers |
|---|---|---|---|---|
| 14:150 | 0 | 0 | — | 0 ✓ |
| 14:200 | 0–6, 12, 18, 24, 30 | 1–6, 12, 18, 24, 30 | 0: +2.59e-9 (`1614413203/623720731237510320`) | all ✓ (0 at its Δcap) |
| 14:280 | 0, 5, 98, 103 | all four | — | all ✓ |

All 16 new multiplier sets pass the Lean checker `nodeOKc`/`pieceOKc` (speed worker: 14:150/0, 14:200/1, 6,
14:280/0, 103; this branch: the other 11, `tools/caps-m-diag/CapPDV.lean`, `data/caps-m/pdV.log`, 27 min on the
droplet). So 15 of 16 failures are cured with no cap change; one piece needs +2.59e-9. Earlier fix ideas are superseded:
finer grids do not help (the defect is the multipliers, not the enclosure), and the λ-scaling grid is ~100× slower.

**Treatment of 14:200 piece 0 (decision).** The cover has `Bcap − max box = 0.7134218 − 0.71342178230 ≈ 1.77e-8` of
slack, and `capPad` enters every row constant linearly (`Row.env`: `C = 2β²/ε + cap + capPad`), so any uniform
increase would change the endpoint ledger and is outside the active target.
The historical repricing discussion is retained in `miscellaneous/other-bounds/`.
For the current target, certify the existing caps. Historical options:
1. raise `capPad` (`Grothe/Lower/Moment.lean`, now 1e-11) to the largest Δcap needed over ALL route-M nodes, with
   margin (e.g. 5e-9 if the full sweep stays ≤ 2.6e-9); one global change, re-checked by `cert_check` (CI) and one
   GrotheCaps rebuild + stamp (capPad is in the caps closure);
2. raise only the stored caps of the affected nodes (row data change, also re-checked by `cert_check`).
**Recommendation: option 1, decided after the fast sweep of all 358 route-M nodes** (export + `caps_lmi.py`, about
16,719 × 3.5 min ≈ 1,000 CPU-hours for the exports — far too much; export only the pieces that fail with their stored
multipliers, which the range facts of track C identify; at the row-14 rate of ~10% failing pieces that is ≈ 1,700
pieces ≈ 100 CPU-hours). If the sweep finds a Δcap above ~1e-8, fall back to option 2 for those nodes.

**Next steps (for whoever continues).**
1. Track C (`claude/caps-m-pipeline`, `docs/CAPS_M_PIPELINE.md`): read `data/caps-m/overrides.json` in
   `tools/gen_cap_pieces.py nodes` (replace the multipliers of the listed pieces), regenerate 14:150, 14:200, 14:280,
   and rebuild their range facts: 14:150 and 14:280 then have no excluded pieces; 14:200 keeps piece 0 until capPad
   is raised.
2. Sweep the other route-M nodes: run the range facts (or `exportPieces` with `ok`) to find failing pieces, export
   them, `caps_lmi.py solve`, add to `overrides.json`, re-check in Lean.
3. Decide capPad from the sweep's largest Δcap (above).

## 6. The anchor layer of rows 12–15: failures and repairs (4 Nov, claude-b9ee)

The first sharded caps run of PR #243 (41761936853) found every piece module true and 19 anchor-range facts false.
Per-node probes (one `native_decide` of `rangeOK k recipes grids exclusions i (i+1)` per node, droplet `yo`) give
**63 false anchor nodes**: row 12: 60, 100, 124, 126–136, 240, 242, 244, 246–248, 260, 300; row 13: 124, 128–138,
240, 242, 244, 245, 260; row 14: 100, 124, 130–138, 242, 244, 246, 247, 260; row 15: 242, 244, 246, 248, 250, 251,
260, 300. The stored anchors are the route-A proposals of `data/caps-m/node-recipes/recM_<t>.json` (`v0 = m + s·a`,
no variance factor, scale 1, grid 1); §2 already recorded that they fail just outside the MIDCAPS windows.

**Diagnosis** (exact export of the checker's matrix `N` with the functions of `nodeOK`, the same tables and grid):
* s ≈ 0.18–0.2 (31 nodes): the cap-free 12 × 12 block of `N` is slightly indefinite (−1e-4 … −2e-3). The variance
  factor `t·(17/20, −1/20, 53/100)` on the fibre coordinates (6, 7, 10), the retry family of rows 16–18
  (`data/cap-recipes/row16.json`), repairs them; the accepted window of `t` moves up with `s` (1/100 at s = 0.1825 …
  1/50 at s = 0.1975) and the Schur margin at the cap entry is 1e-6 … 3e-6 inside the window, 1e-11 at its upper edge
  (the stored caps of these nodes were evidently computed with exactly this factor at t = 1/50).
* s = 0.1, 0.15, 0.18, 0.6 (8 nodes): the stored recipe misses the cap by 3e-10 … 2e-7 on grid 1 and every variance
  factor or anchor perturbation makes it worse; on the fine grid (1600, 1024, 1/200) of the piece catalogue the same
  recipe passes with margin 1e-6 … 6e-6. These nodes keep their recipe and use grid index 2.
* s ∈ (0.42, 0.525) and s = 0.5 (24 nodes: the hull vertices 240–248 / 240–245 / 242–247 / 242–251 and 260 of each
  row; every other node there is a chord): **no anchored recipe reaches the stored cap.** The cap-free block of `N`
  is indefinite (eigenvalues to −0.5) for every variance amplitude below 1/10 and the best Schur margin is −4e-4 …
  −1.5e-3 (t = 3/20); the price scale, the piece directions of the localized centres, the imaginary-E-block
  direction of the centre pieces of node 270, transported anchors of the other branch of the proposal (`m` jumps
  between s = 0.47 and 0.5) and the fine grid change nothing. The caps there are cert-0745d values; the maximiser
  has two competing branches, which a single anchored quadratic cannot dominate: these nodes need localized
  (piece) certificates like the MIDCAPS windows, or a decision on their caps. They remain open.

**Repairs (39 nodes).** `data/caps-m/plan/anchor-repairs/repairs.json` lists the repaired recipes and grids;
`tools/nodecaps_anchor_repair.py bind` archives the historical anchor plans by content hash under
`data/caps-m/plan/anchor-repairs/original/`, writes the effective `row1k-anchors.json` (only the listed recipes,
grid indices, the appended fine grid and an `anchor_repairs` provenance block differ) and the binding
`anchor-repair-binding.json`; `tools/gen_cap_prepared_rows.py` reproduces the historical sources from the archives
and then renders the effective plans with the frozen renderers, so only `CapRow1k/Recipes.lean` and the anchor
manifests change (the range modules are byte-identical and are re-run by CI because they import the recipes).
Every repaired node was verified by its per-node `rangeOK` probe before the push. `tools/nodecaps_repin_retained.py`
re-pins the retained row-14 proof closure when master changes a module it imports (it did on 4 Nov).

**Localized pieces for the 24 hull vertices (4–5 Nov, user decision).** The nodes at s ∈ (0.42, 0.525) and s = 0.5
are certified by pieces like the MIDCAPS windows. Generator: the archived `handoff/lower-stein/cert-0745d/tools/midcaps3.py`
(τ₀ slices in the even direction, boxes and far slabs in the two odd directions; numpy + scipy, exact Fraction
certification of each piece), run on the droplets with the row files rebuilt from `Grothe/Lower/RowData1k.lean` and
`RowGateData.lean` (row 13 has no archived row file; the construction reproduces the archived rows 12, 14, 15 byte for
byte). Its default far-slab ladder `[T, 2T], [2T, 4T], [4T, ∞)` leaves one to three far slabs per node of row 15
3e-5 … 3e-4 above the stored cap; those slabs were bisected with the generator's own search (`refine_far.py`, research
tool in `handoff/anchor-repairs-20261104/`), after which every piece is below the stored cap (table). Under the checker's
cell prices 23 % of the pieces (3418 of 15165) fail with the generator's multipliers (the central boxes); their
S-lemma multipliers were re-optimised on the exported matrices (`CapExport`, `tools/caps_lmi.py`, Clarabel, exact LDL
verification) with no cap increase. One piece (node 15:248, the central box of the slice τ₀ ∈ [0.245331, 0.251331]) is
infeasible for every multiplier: the deficient direction of its matrix lies in the three fibre coordinates that only the
recipe's variance factor reaches (scaled eigenvalue −2.7e-5), so its variance row was scaled by 5/4 (the checker then
accepts the piece with the generator's own multipliers; factors 11/10 … 2 all pass, 9/10 fails). Every piece was
evaluated by Lean's `pieceOKc` in the export pass (≈ 47 s per piece, the bulk of the 35–95 min of wall time per node on
24–30 cores of the droplets) and the 246 coverage facts were built there before adoption; the 3803 range facts
(`CapPieces/R<k>x<i>_n`) are built by the CI caps run together with the 100 anchor ranges. Inputs:
`data/caps-m/plan/anchor-repairs/localized/row1k-new-pieces.json` (+ `provenance.json`);
the registry reads the combined files `data/caps-m/plan/row-certificates/localized/row1k-{pieces,selection}.json`
(canonical nodes plus the new ones); the anchor plans move the nodes to `localized_exclusions`;
`tools/nodecaps_anchor_repair.py bind`, `gen_cap_prepared_rows.py`, `build_caps_batches.py --write-registry` and
`nodecaps_anchor_repair.py register` regenerate the modules, assemblies, registry and axiom lists. With this, all 63
false anchor nodes are covered and the per-node `rangeOK` probes of the eight affected ranges (nodes 240–271 of rows
12–15) are true.

| node | s | pieces | min slack below the stored cap | multipliers re-optimised | range facts | coverage facts |
|---|---|---|---|---|---|---|
| 12:240 | 9/20 | 502 | 3.0e-03 | 131 | 126 | 8 |
| 12:242 | 91/200 | 533 | 2.9e-03 | 126 | 134 | 9 |
| 12:244 | 23/50 | 566 | 2.6e-03 | 139 | 142 | 9 |
| 12:246 | 93/200 | 566 | 2.5e-03 | 127 | 142 | 9 |
| 12:247 | 187/400 | 566 | 2.3e-03 | 122 | 142 | 9 |
| 12:248 | 47/100 | 597 | 2.4e-03 | 131 | 150 | 10 |
| 12:260 | 1/2 | 1000 | 1.6e-03 | 180 | 250 | 16 |
| 13:240 | 9/20 | 535 | 2.9e-03 | 139 | 134 | 9 |
| 13:242 | 91/200 | 566 | 2.8e-03 | 134 | 142 | 9 |
| 13:244 | 23/50 | 597 | 2.5e-03 | 137 | 150 | 10 |
| 13:245 | 37/80 | 628 | 2.5e-03 | 144 | 157 | 10 |
| 13:260 | 1/2 | 691 | 1.3e-03 | 112 | 173 | 11 |
| 14:242 | 91/200 | 535 | 2.9e-03 | 131 | 134 | 9 |
| 14:244 | 23/50 | 566 | 2.8e-03 | 134 | 142 | 9 |
| 14:246 | 93/200 | 566 | 2.5e-03 | 130 | 142 | 9 |
| 14:247 | 187/400 | 597 | 2.5e-03 | 131 | 150 | 10 |
| 14:260 | 1/2 | 783 | 1.4e-03 | 133 | 196 | 13 |
| 15:242 | 91/200 | 690 | 2.0e-04 | 193 | 173 | 11 |
| 15:244 | 23/50 | 661 | 5.4e-05 | 182 | 166 | 11 |
| 15:246 | 93/200 | 566 | 2.9e-03 | 145 | 142 | 9 |
| 15:248 | 47/100 | 566 | 2.8e-03 | 133 | 142 | 9 |
| 15:250 | 19/40 | 597 | 2.6e-03 | 139 | 150 | 10 |
| 15:251 | 191/400 | 690 | 2.3e-03 | 151 | 173 | 11 |
| 15:260 | 1/2 | 1001 | 2.0e-03 | 194 | 251 | 16 |
| total | | 15165 | | 3418 (23 %) | 3803 | 246 |
