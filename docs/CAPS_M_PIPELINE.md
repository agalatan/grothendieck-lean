# Caps of rows 12–15: the Lean pipeline for localised (route M) caps

This is track C of `docs/CAPS_ROADMAP.md`. Branch: `claude/caps-m-pipeline`. This file lets anyone continue cold.

## What it does

Rows 12–15 (t = 0.84–0.855) have nodes whose caps are *localised*. The fibre space of the node is split into
constrained pieces, covered modulo the symmetries S_c and S_-, and each piece carries its own S-lemma quadratic
certificate. This pipeline turns such a node into a Lean theorem:

```
nodeCap_<k>x<i> : (bounds of the excluded pieces) → NodeCap k i
```

`NodeCap k i` is `rowPot k s_i − capPad ≤ c_i`, the same statement as `ExclCaps` / `VertexCapsRow`. With no
excluded pieces it is unconditional, apart from the native facts.

## Modules

| module | layer | content |
|---|---|---|
| `Grothe/LowerAnalytic/CapPieceRange.lean` | computation | `pieceGrids`, `pieceTables`, `pieceList`, `pieceCheck`, `pieceCoverOK` (grid indices + `capCoverOK`), `pieceOneOK` (one piece), `pieceRangeOK x lo hi` (pieces lo..hi−1, sequential), `pieceNodeOK` (all at once) |
| `Grothe/LowerAnalytic/CapPieceNodes.lean` | soundness | `NodeCap`, `PieceCap k i cs` (the bound of J on one piece region), `pieceCons`, `nodeCap_of_pieceCaps` (cover + every piece ⇒ node), `pieceCap_of_pieceOneOK`, `pieceOneOK_of_range`, `nodeCap_of_ranges` (cover + range facts + bounds of excluded pieces ⇒ node), `nodeCap_of_pieceNodeOK` |
| `Grothe/LowerAnalytic/CapPieces/D<k>x<i>.lean` | data (generated, no imports) | `pieceNode_<k>x<i>`: directions and encoded pieces `grid;recipe;constraints` |
| `…/CapPieces/C<k>x<i>.lean` | native fact (generated) | `pieceCover_<k>x<i> : pieceCoverOK … = true` |
| `…/CapPieces/R<k>x<i>_<n>.lean` | native fact (generated) | `pieceRange_<k>x<i>_<n> : pieceRangeOK … lo hi = true`, one per chunk of checked pieces |
| `…/CapPieces/N<k>x<i>.lean` | theorem (generated) | `nodeCap_<k>x<i>` |

The soundness rests on `CapConstr` (`nodeOKc`, `Jpot_le_of_nodeOKc`) and `CapCover` (`capCoverOK`,
`capCover_sound`), which are already on master. It also uses `Jpot_le_of_mem_symOrbit` from `CapSymmetry`.

There are no threads: each range fact is sequential, and parallelism comes only from lake building the `R…` modules
as separate processes.

## Generator and data (canonical inputs in `data/caps-m-pieces/`)

```sh
# 1. piece lists of every vertex node of rows 12–15 that has a MIDCAPS certificate (358 nodes, 16,719 pieces).
#    Needs handoff/ (main checkout on the Mac). Already done: data/caps-m-pieces/pieces.json (11 MB).
GROTHE_HANDOFF=/Users/alingalatan/workspaces/grothe/handoff python3 tools/gen_cap_pieces.py json data/caps-m-pieces/pieces.json
# 2. the Lean modules of the nodes listed in sel.json
python3 tools/gen_cap_pieces.py nodes data/caps-m-pieces/pieces.json data/caps-m-pieces/sel.json
```

`sel.json` holds, per node `"k:i"`:
- `excl`: the pieces left out, i.e. the failing ones; they become hypotheses of `nodeCap_<k>x<i>`;
- `chunk`: pieces per range fact;
- `grids` (optional): a grid index per piece. The default comes from the piece's `nq`: 256 → 1 (1600 × 256),
  1024 → 2 (1600 × 1024), anything else → 0 (400 × 128).

The generated modules are reproducible byte for byte from these two files; never edit them by hand.

## Test (23 Oct): nodes 14:150 and 14:200

The excluded pieces are the failures found by track B (`data/caps-m/pd3-results.txt` on `work/caps-m`):
- 14:150: piece 0;
- 14:200: pieces 0–6, 12, 18, 24, 30.

The generated modules are `D/C/N14x150` with `R14x150_0..1`, and `D/C/N14x200` with `R14x200_0..10`.

**Results (23 Oct, laptop, single-threaded facts, load ~5–7 from other agents):**

| node | coverage fact | range facts | node theorem |
|---|---|---|---|
| 14:150 | 75 s | 2 facts (4 + 4 pieces, 1600 × 1024): 546 s, 582 s | `nodeCap_14x150` builds, 46 s |
| 14:200 | 85 s | 11 facts (31 pieces): 286–747 s each, 17.5 min wall in parallel | `nodeCap_14x200` builds, 52 s |

- Cost is about 2.3 min per piece on 1600 × 1024 and about 1 min on 1600 × 256.
- `#print axioms nodeCap_14x150`: `propext`, `Classical.choice`, `Quot.sound`, `pieceCover_14x150`,
  `pieceRange_14x150_0/1`. 14:200 is analogous, with its 12 facts. `nodeCap_of_ranges` uses only the 3 standard
  axioms.
- So both nodes are certified **modulo their excluded (failing) pieces**: `hex` is the bound of J on piece 0
  (14:150) and on pieces 0–6, 12, 18, 24, 30 (14:200).
- The test ran on the laptop, not the droplet. The droplet was below the free space needed for a fresh dependency
  build (≥ 3 GB floor), and track B's 14:280 diagnostic was running there.
- `CapPieceRange` / `CapPieceNodes` are imported by `Grothe.lean`, so CI builds them. The generated
  `CapPieces/*` modules are not yet imported anywhere: build them explicitly with
  `lake build Grothe.LowerAnalytic.CapPieces.N<k>x<i>`.

## How to continue

1. **When track B fixes failing pieces** (finer grid, re-optimised price, or a raised cap): put the fix in the
   inputs:
   - a new grid in `sel.json` `grids`;
   - a new recipe in `pieces.json`, through the extraction or a small patch script kept in `tools/`;
   - or a new cap in the row data, which is track B's decision.

   Remove the pieces from `excl` and regenerate. A node with empty `excl` gives an unconditional `NodeCap`.
2. **More nodes:** add them to `sel.json`.
   - Costs are about 4 min per piece on 1600 × 1024, about 1 min on 1600 × 256, and seconds on 400 × 128, all
     single-threaded.
   - Choose `chunk` so that each range fact takes 10–20 min.
   - Build only on the droplet, as a process group (`AGENTS.md` §5), one heavy build at a time.
3. **Wiring into `CapsRest` (after track A merges):**
   - Track A splits `CapRows` / `CapHull` / `CapNodes` into a computation layer (`CapRangeDefs`, `CapNodeDefs`,
     `RowGateData`, …) and an assembly layer (`CapAssembly`).
   - Then move `CapPieceRange`'s imports to the computation layer (`RowGateData` for `rowR`, and A's
     data-only row modules). Split the computable parts of `CapConstr` / `CapCover` (`nodeOKc`, `pieceOKc`,
     `capCoverOK`, the parsers) into a `…Defs` module, so the `R…` facts no longer import the lower chain.
   - In `CapNodes` / `CapAssembly`, shrink `CapsRest`: for rows 12–15, the nodes with a `nodeCap_<k>x<i>`
     theorem drop out of the hypothesis. Add their excluded-piece bounds as an explicit hypothesis, or nothing
     once `excl` is empty.
   - Then add the `C…`/`R…` facts to `scripts/check_axioms.py` (NATIVE), the `N…` modules to `GrotheCaps.lean`,
     re-verify `GrotheCaps` on the droplet, and re-stamp.
4. **Today the closure is heavy:** `CapPieceNodes` imports `CapRows` (for `gridAdm`) and `CapConstr` imports the
   fibre modules, which on the current master pull in `RowGates` → `RowReduction` → the whole lower certificate.
   So a build from scratch recompiles the 13 certificate chunks (about 40–75 min each, single-threaded). Track A
   fixes this.

## Campaign plan: cheapest grid and multipliers per piece (#16)

`tools/caps_plan.py` decides, before the expensive native checks run, on which grid each piece is checked and with
which S-lemma multipliers:

1. `gen-select PIECES.json GRID OUTDIR BATCH centre|all` (optional env `CAPS_NODES="k:i ..."`, `CAPS_TAG`) writes
   throwaway modules `Grothe/LowerAnalytic/CapPlanRuns/Run_*.lean` (never committed) that export the piece matrices
   on grid `GRID` with the checker's own functions (`exportPiecesOn`, `CapExport.lean`). Build them with
   `lake build <module>`: the `#eval` runs at build time with the precompiled kernel.
2. `solve EXPORT.jsonl OUT.json`: per piece `pass` (stored multipliers), `fixed` (new exact multipliers from
   `tools/caps_lmi.py`), or `cap_up` (smallest exact cap increase).
3. `plan PIECES.json SOLVED_DIR OUT_DIR` writes `data/caps-m/plan/<k>x<i>.json` (per piece: chosen grid, multipliers,
   cap increase) and prints the cost and the cap-increase maximum.

Findings so far (26 Oct):
* Every node has exactly one piece with slack ≈ 1e-12 (the two-sided centre constraint |τ| ≤ 3/1000). These 358
  pieces are the only candidates for a cap increase; they must stay on their stored grid (on 1600×256 they need
  ≈ +3e-6, far above the cover slack 1.77e-8).
* Non-centre pieces with stored slack ≳ 1e-4 pass on the coarse 400×128 grid even when stored on 1600×1024; pieces
  with slack ≲ 3e-5 need ≈ 2–5e-5 more cap there and keep a finer grid.

**How the generator should consume the plan:** `tools/gen_cap_pieces.py nodes` already accepts per-node `"grids"`
(grid index per piece) in `sel.json`; take them from `data/caps-m/plan/<k>x<i>.json`, and replace the multipliers of
the pieces marked `fixed` in the piece strings (as `tools/caps_lmi.py apply` does). A `cap_up` piece raises nothing
per node: the global `capPad` (#72) is set to the maximum `cap_up` of the sweep plus a margin.
