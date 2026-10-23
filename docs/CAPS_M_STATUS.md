# Caps, route M (rows 12–15, t = 0.84–0.855): status and how to continue

Branch `work/caps-m` (base `c1d2e6e` of `work/lower-caps2`). Goal: shrink the remaining cap hypothesis
(`CapsRest`, see `CapNodes.lean` on `work/lower-caps2`) to nothing on rows 12–15. Those rows have 396 nodes
each; their caps come from three sources:
1. chord nodes (`capChords`, already handled by `CapHull`);
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
* STATUS when this file was written: still running on the droplet (lean pid 1457251, log
  `~/grothe-capsm/pdiag2.log`). The droplet was oversubscribed by other sessions (load ≈ 12), so
  it was very slow. The result lines start with `node 14:…` (grep `info:`).
  * If the stored-grid run passes at the binding pieces: generate CapPieceData and run.
  * If it fails by ~1e-11 .. 1e-9: the binding pieces need prices closer to exactint's.
    * Option (a): add a recipe variant to `GrotheKernel/CapCheck.lean` that computes the 2 × 2 point-RMS
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
