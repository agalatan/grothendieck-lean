<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/LEAN_STAGE2_DESIGN.md (17 November 2026, 01:35 Bucharest time: the plan of record); the Lean worker of claude-b9ee. Only this line was added. -->
# Stage 2 in Lean: design note against the real certificate (identity tail, target 5000/7009)

claude-b9ee Lean worker, issue #183; written 16 Nov 2026, 22:55 Bucharest; plan of record since the coordinator's decisions of
16 Nov 23:00; brought up to date 17 Nov 01:35 (§2 state, §5 measured costs, §6 directions, §7 decisions, new §9–§16). Witness (ε, ν) = (191/250, 47/2000), hat units ε̂ = 25/31,
ν̂ = 47/1953. Read with `STAGE0_FINAL.md` of this folder. Labels: **L** read in the Lean sources (branch `claude-b9ee/identity-tail-kernel`, head 17b9a1279; kernel provisionally frozen at b9689ee90, §9),
**R** read in the records and generators of this folder, **M** measured today (scripts and outputs in
`/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/lean-stage2/`), **E** estimate.
The plateau tables (t ≥ 0.74) are final; the tables of t ≤ 0.72 are being redone (§6). No Lean was written for the layouts.

## 0. Three results that change the plan

1. **No piece kind needs a new coverage lemma (L, M).** Every live piece of the final tables is a product of one or two
   intervals or half-lines in τ₂ = v₂·m, τ₃ = v₃·m (v₂ on block 2 = coordinates 6, 7, 10; v₃ on block 3 = 8, 9, 11). That is
   the input format of today's `capCoverOK` (`Grothe/LowerAnalytic/CapCoverDefs.lean`), which is sound for any such list
   (`capCover_sound`, `CapCover.lean`). A one-to-one port of `capCoverOK` accepts **all 397 distinct route-M records behind
   the 420 localised entries of the 22 final tables (9,599 live pieces), 0 failures** (`lean-stage2/covercheck.py`, `cover.log`). Rings, ring
   boxes, ring halves, box halves and corner delegation are layouts of the *generator*; Lean sees a piece list and decides
   coverage exactly. STAGE0_FINAL's "coverage proofs are the new work" does not hold.
2. **The ν-kernel prototype is not enough: its price rule loses 3·10⁻⁴ to 4·10⁻³ per cap (M).** The certificate prices each
   cell by the minimiser of (d₂+d₃)/2 + (d₃σ + d₂τ + 2νρ)/(2(d₂d₃ − ν²)) (`nucells.dual_prices_fast`, damped Newton). The
   Lean prototype (`CapsKNu` and my port `GrotheCapsKernel/CapCheckNu.lean`) uses the Newton start √σ + ν, √τ + ν. Re-running
   21 stored nodes and pieces of row 0.845 with both rules (`pricerule.py`): the dual rule reproduces the stored values to
   4·10⁻¹⁵; the start rule is higher by 0 (anchored, s = 0), 3.4·10⁻⁴ (anchored, s = 0.1), 1.8·10⁻³ (anchored, s = 1.05),
   1.4–1.6·10⁻³ (centre, slab and box pieces without variance) and 2.6–4.1·10⁻³ (pieces with variance, far pieces, global
   pieces). Three Newton steps still leave up to 2·10⁻⁶; undamped steps leave up to 2·10⁻⁴. The table margin is 2·10⁻⁹
   and the binding rows have 6–8·10⁻⁵. So the kernel must run the same iteration to convergence (§2, K1).
   **The cell means matter too (M).** For route-M and global pieces the generator averages |L+p|², |L−p|², Re((L+p)(L−p)‾)
   over 2×2 Gauss points of a cell, unweighted (anchored nodes use table means); the Lean kernel takes exact
   Gaussian-weighted means from its moment tables. With weighted means in the
   generator (a model of the kernel) the pieces without variance move by at most 4·10⁻¹⁰ where they bind (the prices are
   then optimal, so the effect is of second order), but the 14 sampled pieces **with variance vectors move by −1.7·10⁻⁷ to
   +2.5·10⁻⁷**, a hundred times the margin (the three binding ones moved down, others up: the sign is not controlled).
   All 481 `global` entries and the `routem2v` nodes bind on such pieces. So K1 has to compute the cell means as the
   generator does, not only the iteration.
3. **One Lean check per (table entry, piece): 10,639 pieces, not 9,601 (M).** 213 table entries take their cap from the
   certificate of a *neighbouring* node (its quadratics evaluated at the entry's s: global 180, routem2v 22, routem1 9,
   routem2 2). Lean checks a piece at one s, so those pieces are checked again at the entry's s. Every one of the 2,472
   `quad:` entries has a record with complete recipes whose value is below the table cap by 2.000–2.001·10⁻⁹
   (`tablesrc.py`). Several records exist per (kind, s), and 7 of the lowest ones have no recipes (early generator): the
   table must name the record behind each entry.
   **Now settled (certificate worker, `PROGRESS.md` §6):** binding files `s0c/tables/bind_<t>.json` (format
   `table-binding-1`) name the record and the live pieces behind every entry of the 20 final tables: **16,368 (entry, piece)
   checks** over 2,722 entries (1,567 anchored, 329 global, 276 `routem1`, 143 `routem2`, 75 `routem2v`, 78 `routem2q`,
   254 chord), 2,340 distinct records, 13,025 live pieces; 206 entries use a neighbour's record; the 303 mirror pieces
   (closed half-planes τ₂ ≤ 0 or τ₃ ≤ 0) are dropped from the bindings after an exact coverage check without them.

## 1. Piece kinds and layouts of the final tables

Table sources (22 tables, 2,766 nodes; `counts.py`): `anchored` 1,571, `global` 481, `routem1` 249, `routem2` 119, `routem2v` 52
(420 localised nodes), `chord` 294. Plateau (15 tables, t ≥ 0.74): V = 1,293, G = 274, 405 localised nodes with 10,504 pieces
(213 at 1024 cells). Small t (7 tables): V = 278, G = 207, 15 localised nodes, 135 pieces; these are being replaced (§6).

**Common record of a piece (R):** `recipe = {y (12 floats, the anchor in the coordinates of sa + My), var (0–4 variance
vectors), nq (256 or 1024 angular cells), cons: [{v, lo, hi | None, lam, mu}]}`, v = ±v₂ or ±v₃ of the node (`details.v2`,
`details.v3`). **Inequality checked for every piece, whatever its kind (L):** exact LDLᵀ with nonnegative pivots of
`N − Σ_c S_c`, N = (cap + capPad)·e₀e₀ᵀ + diag(0, M) − Pᵀ T⁺ P (`pieceNc`, `pieceOKc`, `CapConstrDefs.lean`), where T⁺ is the
Loewner upper bound of the enclosure of the integrated cell majorant for the prices of (y, var), and S_c is the matrix of
λ(τ − lo)(hi − τ) + μ(τ − lo) (`Cons.sMat`; λ = 0 for a half-line). It gives J(y, s) − capPad ≤ cap on the region
(`Jpot_le_of_nodeOKc`, `CapConstr.lean`, today at ν = 0). **Coverage statement for every localised node (L):**
`capCoverOK ds P = true` for ds = [0, v₂, v₃] and the constraint lists P; then every fibre point lies in the orbit of a piece
under S_c, S_− (`capCover_sound`), and `pot ≤ cap` follows from `Jpot_cj`, `Jpot_ng` (`pot_le_of_pieces`).

| kind (table entries for nodes; live pieces of the 397 records for piece kinds) | region | Lean today |
|---|---|---|
| `anchored` node (1,571) | whole fibre, symmetric anchor, grid 1600×256 | `nodeOK`, `rangeOK`, `nodeCap_of_rangeOK` (`CapRows.lean`) |
| `global` piece (481) | whole fibre, anchor + 1–4 variance vectors | the same check: a recipe with `var` (`Recipe`, `priceCP`) |
| `centre` 244, `slab` 1,708, `far` 506, `farring` 404 | one interval of τ_d | one-constraint pieces, rows 12–15 (2,421 today) |
| `halfspace` 550 | τ_d ≥ 0.384 | half-line pieces (594 today) |
| `box` 5,219, `boxhalf` 578, `ringbox` 330 | interval × interval | two-constraint pieces (5,400 today) |
| `ringhalf` 60 | interval × (interval or half-line) | the same shape; `Cons.ok` treats each constraint alone |
| `qbox` of `routem2q` (small t, in production) | [lo, hi or ∞) × [lo, hi or ∞) in the quadrant τ₂, τ₃ ≥ 0 | the same shape |
| `chord` node (294) | cap from two vertex nodes | `chordOK`, `rowPot_le_chord`, `capChords_check` (`CapAssembly.lean`) |

What the coordinator's list becomes in Lean:
- **Rings, ring boxes bisected on failure, box halves:** piece shapes that exist. Bisection only changes which pieces are
  live; superseded pieces are not emitted.
- **Corner delegation and its completeness guard:** no Lean statement. `capCoverOK` tests one rational sample per cell of the
  endpoint partition of ℝ × [0, ∞)², so an incomplete delegation would fail the fact of that node (it does not, M).
- **Per-piece price variance (`AUTO_VAR`, `bpiece`) and block-1 base variance (`routem2v`):** entries of `recipe.var`
  (3,258 of 9,599 pieces have 1–4 vectors). Today's `Recipe` has the field and 22,316 of today's pieces use it. Prices are
  search data: soundness never looks at them.
- **`routem2q`:** two constraints per leaf, both with lo ≥ 0, non-symmetric anchors. The tiling of the closed quadrant is
  exactly what `capCoverOK` samples (q₂, q₃ ≥ 0). Nothing new, as long as its directions stay v₂ on block 2 and v₃ on block 3.
- **Mirror pieces:** 150 `ringbox` and 30 `ringhalf` pieces lie wholly at τ < 0 of an odd direction. Lean's cover only
  samples q₂, q₃ ≥ 0, and without these 180 pieces all 397 records still pass (M, `cover_nomirror.log`): the generator can
  drop them.

New in Lean is therefore only **ν** (the checker and its soundness) and the **data**.

## 2. Lean work, item by item

State of the branch `claude-b9ee/identity-tail-kernel` (b0011c6e0, pushed, not for landing; 17 Nov 01:00): **K1, K1′, S1, S2
and S3 are done and compile without warnings** (1,997 lines in seven modules): `GrotheCapsKernel/CapCheckNu.lean` (514: cell
check, seven interval weights, both rules of the cell means, `dualPrices`, `mkGridNu`, `matINu`); `CapCheckNuSound.lean`
(560: `majCell_of_cellOKNu`, `mem_cellWt`, `psiT_le_majPoly_of_cellOKNu`, `gridOKNu_mkGridNu` for both rules);
`CapPieceNu.lean` (186: `Jpot_le_qfNu`); `CapGridTNu.lean` (334: `TintNu_grid`); `CapCheckNuMat.lean` (270:
`bounds_matINu`); `CapNodeNuDefs.lean` (36: `nodeOKNu`, `nodeOKcNu`); `CapNodeNu.lean` (97: `pot_le_of_nodeOKNu`,
`Jpot_le_of_nodeOKcNu`, `pot_le_of_piecesNu`); `CapPiece.lean` and `CapConstr.lean` carry the S-lemma step for any enclosed
matrix (`Jpot_le_of_qfN_of_le`, `Jpot_le_of_pieceOKc_of_le`). The replay of 31 stored pieces passes (§12). **S4, D1 and the
piece-check saving are done too (§14; `CapRangeNuDefs.lean` 82 lines, `CapRowsNu.lean` 260): the chain from a native fact to
`TailNodeCaps (nuHat ν)` compiles. Open: the generator G (§15), the switch PR (§10, §11), the spectral row checker (§16);
K2 is not needed for the cost any more (§5).** "Closure" = the pinned files of `scripts/caps_stamp.py --list`: the
kernel library, the `…Defs` modules, row data, generated cap modules. The soundness modules are **not** in it (L).

| item | statement (Lean-like) | depends on | lines (E) | closure |
|---|---|---|---|---|
| K1 the generator's prices | `cellMeans` (Float): σ, τ, ρ of a cell = means of \|L+p\|² + e, \|L−p\|² + e, Re((L+p)(L−p)‾) − e, e = Σ\|B·f\|², by the generator's two rules: unweighted 2×2 Gauss points for every route-M and global piece (`midnu.SetupNu.moments`), table means for anchored nodes (`capnu.CapRow.cell_moments`; today's kernel rule plus ρ); a flag of the recipe selects. `dualPrices ν σ τ ρ` (12 damped Newton steps with 24 halvings, as `nucells.dual_prices_fast`); then `dyNum`, an integer repair of Δ ≤ 0, `gNum` | — (search code) | 160 | kernel |
| K1′ | `gridOKNu_mkGridNu` re-proved for that construction (cells with d ≤ ν get G = 0; Δ > 0 from the repair) | CapCheckNuSound | +60 | no |
| K2 compiled piece check | `pieceOKNu : row constants → s → cap → String → Bool` in the kernel: `QMat`, `enclOK`, `loewnerUp`, `ldlOK`, `pieceN`, `pieceNc`, `parsePiece` moved from the `…Defs` modules | their soundness lemmas (`CapLinAlg.lean`, `CapConstr.lean`) keep their statements | 250 moved | kernel |
| S1 integrated majorant | `Jpot_le_qfNu (hgd : gridOKNu gd ℓ β = true) (y) (s) : Jpot E R ℓ β a gd.nu y s ≤ qf (TintNu ℓ β gd) 13 (wOf ((M y).add (a.smul s)).vec) − Fib.quad E R y` | `psiT_le_majPoly_of_cellOKNu`, `majCell_one` (tail region d₂ = d₃ = 1), cells of `CapGrid.lean`, `integrable_Jtail` | 450 (today's `CapPiece.lean`: 543 for 4 weights) | no |
| S2 enclosure | `mem_matINu (hT : TablesOK …) (hpb : polyBoundsOKNu ℓ β = true) (hI : I < 13) (hJ : J < 13) : mem (TintNu ℓ β gd I J) (matINu …)[I][J]` | `integral_cell_poly`, `integral_tail_poly`, `mem_cellWt`, evaluation of `l4CP`, `l2uCP` | 600 (today: `CapGridT` 337 + `CapCheckSound` 452) | no |
| S3 piece and node | `Jpot_le_of_qfN`, `Jpot_le_of_pieceOKc`, `pot_le_of_pieceOK` restated over any `T` with `hT : ∀ y s, Jpot … ν y s ≤ qf T 13 … − quad y` (S-lemma and LDL do not see ν); then `pot_le_of_nodeOKNu`, `Jpot_le_of_nodeOKcNu`, `pot_le_of_piecesNu` | S1, S2, `capCover_sound` (unchanged), `Jpot_cj`, `Jpot_ng`, `bddAbove_Jpot` at ν (#484) | 250 | no |
| S4 assembly | `NodeCapNu`, `PieceCapNu`, `nodeCap_of_ranges`, `nodeCap_of_rangeOK`, `rowPot_le_chord` with ν; `tailNodeCaps_of_vertexCaps : (∀ k < rowData.length, VertexCapsRowNu ν̂ k) → TailNodeCaps ν̂` | `pot_convexOn` at ν (#484), `chordOK` | 200 | no |
| D1 checks for the native facts | `nodeOKNu`, `nodeOKcNu`, `rangeOKNu`, `pieceOneOKNu`, `pieceRangeOKNu` (thin, if K2 is done) | K1, K2 | 120 | yes |
| G generator | §3 | — | 500 (Python) | data |

About 1,700–1,900 new Lean lines after the 805 that exist; S1 and S2 are the bulk and are routine after today's chain.
**Freeze rule (L):** `GrotheCapsKernel` is one shared object; any later edit of a kernel module rebuilds every cap fact. K1, K2
and the cost changes of §5 therefore go in *before* the first row is built, and the Lean replay of §5 comes before the freeze.
**End state:** the ν = 0 checker (`cellOK`, `mkGrid`, `matI`) and its chain (`CapPiece`, `CapGridT`, `CapCheckSound`,
`CapGridOK` at ν = 0) are dead once the old rows go; at ν = 0 the dual prices are today's √σ, √τ and weights 5, 6 vanish.
I would delete them in the switch PR and give the ν-checker the plain names (repository rule: no superseded code).

## 3. Data path

The switch is one change of ε: `Grothe/Lower/RowDataTypes.lean` has `ε = 149/200`; the tail endpoint needs `epsHat e ν = ε`,
so **ε becomes 25/31** and every row, gate, cover and cap of today is replaced in the same PR (L).

| today | replaced by | generator input under `data/` |
|---|---|---|
| `Grothe/Lower/RowData01–19.lean`, `RowData.lean` (`tools/gen_lower_data.py`, 19 rows hard-coded) | the new rows; their `nodes` strings are the cap tables | `data/lower-rows/rowNN.json` from `stein/rows_cert[_fine]/<t>/cert1/row_<t>.json` + `rows1.json` |
| `RowGateData.lean`, `RowGates.lean`; `MixedData.lean`; `Cert/Rows0–4`, `Cert/Batches0–2` | the same modules for the new rows (chunk count follows the row count) | `data/row-gates.json`, `data/lower-mixed/` |
| `CapRecipeData.lean` + `CapRow00–11,16–18.lean` (4 range facts per row) | `CapRowKK/Recipes.lean` + `CapRowKK/AnchorRangeJJ.lean` for all rows (layout of rows 12–15), `rangeOKNu`; anchored and global nodes together (a global node is a recipe with `var`) | `data/tail-caps/<t>/nodes.json`: per node (i, grid, y, var), y = m₀ + s·a exact |
| `CapPieces/{D,C,R,N}<k>x<i>` (9,753 modules, 31,885 pieces), `CapPieceRange.lean` | the same four module kinds per localised node, ν-checks, 8–16 pieces per range module (§5): about 420·3 + 10,639/8 ≈ 2,600 modules | `data/tail-caps/<t>/pieces.json`: per node dirs (v₂, v₃) and live pieces (grid, y, var, cons) |
| `CapChordData.lean` (`tools/gen_cap_chords.py`) | the same from `src = chord:a-b` | `data/tail-caps/<t>/table.json` (+ its sha256 `FINAL_<t>`) |
| `CapRowKK/Assembly.lean`, `CapNodes.lean`, `Research/RefinedCoverResult.lean` | assembly per row → `TailNodeCaps ν̂` → `lower_bound_of_tail_nodes` with the new cover | — |
| `data/caps-m/` (365 MB), `data/caps-m-pieces/`, `data/cap-recipes/`, registry `row12-build.json` | deleted with the old rows; a new registry for the new closure | — |

- **Inputs are a selection, not the raw records.** The 22 `caps_<t>.jsonl` are 24 MB with superseded pieces, several records
  per node and float diagnostics. The generator input should be what Lean reads: for each table entry the one record that
  certifies it (named by line or hash by the certificate worker), live pieces only, exact strings. About 10 MB (E).
- **Reproducibility (§13):** floats are written as their shortest decimal and read as exact rationals (as today's D-modules);
  the generator is deterministic and has a `--check` mode like `gen_lower_data.py`.
- **Shared tooling to adapt (L):** `scripts/caps_stamp.py` hard-codes `CAP_ROWS`, the registry path and `CapRow12/Assembly`;
  `scripts/build_caps_batches.py` owns the registry (Codex tooling). Their change is part of the switch and needs its owner.

## 4. From a checked piece to `TailNodeCaps (nuHat ν)`

1. Native fact per range of pieces: `pieceRangeOKNu x lo hi = true` (and per node `pieceCoverFastOK x = true`, unchanged).
2. `gridOKNu_mkGridNu`: the grid that the check built passes the cell check, whatever the Float prices were (K1′).
3. S1: `Jpot … ν̂ y s ≤ qf (TintNu) (1, sa + My) − quad y` for all y, s. S2: `matINu` encloses `TintNu`.
4. S3: LDLᵀ of `N − ΣS` ⟹ `Jpot … ν̂ y s − capPad ≤ c` on the piece region (`PieceCapNu`).
5. `capCover_sound` + `Jpot_cj`, `Jpot_ng` + `bddAbove_Jpot` ⟹ `pot … ν̂ s − capPad ≤ c` (`NodeCapNu k i`).
6. Anchored and global nodes: `rangeOKNu` facts ⟹ the same statement by `pot_le_of_nodeOKNu` (no cover needed).
7. Chord nodes: `chordOK` (decidable on the row data) + convexity of s ↦ `pot … ν̂ s` ⟹ their caps.
8. S4: all nodes of all rows ⟹ `TailNodeCaps ((47/1953 : ℚ) : ℝ)`; `nuHat (47/2000) = 47/1953` by `norm_num`; then
   `lower_bound_of_tail_nodes` with `hcover`, `hextra` from the cover facts gives `1/((1 − ν)B + ν) ≤ K`.

## 5. Cost

Per piece at 1600×256 with the ν-kernel as it is (laptop CPU-s, CI mode; from the scratch-kernel logs): tables 13.3 (53 for
all five grids, shared by 4 pieces), prices 17.5, enclosure `matINu` 17.9, S-lemma check 15.6, rest 2: about 66, i.e. 160
vCPU-s in CI (factor 2.2–2.7). With the per-entry counts of §0: 75·1,571 + 160·(10,366 + 481 + 2.3·273) s ≈ **540 vCPU-h**
for the 22 present tables (490 with the 9,601 distinct pieces).

| saving | in Lean terms | per piece (E) |
|---|---|---|
| "interpreter saving 1" | `pieceNc` calls `pieceN` inside the closure of `QMat.ofFn 13`, so the 13×13 matrix with its double sums is rebuilt for each of the 169 entries; bind it once (`CapConstrDefs.lean`) | 15.6 → 1.5 (measured 14.25 → 0.135 for the matrix) |
| "interpreter saving 2" | `pieceRangeOK` evaluates `pieceTables` = the tables of all five `pieceGrids`; build only the grid(s) the module's pieces name (`CapPieceRange.lean`) | 13.3 → 2.3 |
| prices as the generator (K1) | `ringCellsNu` sums about 580 polar terms per cell and sign today; for pieces, four point evaluations of L, p, B·f per cell and the Newton iteration replace them (compiled Float code); for anchored nodes the radial factors can be summed per harmonic once per ring | 17.5 → about 3 |
| more pieces per module | 8–16 instead of 4 share one table build and one start-up | 2.3 → about 1 |
| compiled piece check (K2) | parsing, Loewner bound and LDLᵀ run in the interpreter today (`Grothe` is not precompiled) | 1.5 → about 0.3 |

The first two give 66 → 41 (the worker's "320 of 490"). All of them give about 22 s per piece, of which 18 is `matINu`:
about **180 vCPU-h** for the present tables. What remains is exact 128-bit interval arithmetic on 409,600 cells × 7 weights ×
18 harmonic sums; Python's midpoint-radius floats do the whole piece in 2.5 s (M, yo), and Lean cannot use Float for soundness.
Other levers: drop the 180 mirror pieces (−8 vCPU-h today); use the reflections for anchored nodes (a quarter of the cells);
enclose the weights at 2⁻⁶⁴ instead of 2⁻¹²⁸ if bignum multiplication dominates; check the small-t rows on a coarser grid (§6).

**Measured after K1 (17 Nov, §12; laptop seconds, one Lean process, per piece on 1600×256):** grid 2.4 with Gauss means
(11.6 with table means, the anchored nodes), `matINu` 24.5, piece check 16 (1.5 after the first saving of the table, which
is a `…Defs` change the coordinator has agreed for stage 2), tables 10 per module. So 28–30 s per piece and 38 per anchored
node once the saving is in; `matINu` is 85 % of a piece. The price code of the first K1 commit needed minutes per grid
(Float literals recomputed at every use, §9); that is gone. **Decision (coordinator, 17 Nov 01:10): no machine-word
intervals now**; to be looked at again only if the total of §13 exceeds about 400 vCPU-h.

**What I would measure first, in this order** (1 is done, §12; 2 is §13):
1. *Lean replay of about 30 stored pieces* with K1 in the kernel: one per kind, both grids, 0–4 variance vectors, an anchored
   node, and above all the binding pieces of `global` and `routem2v` nodes; for each the least cap at which it passes against
   its Python value. With K1 the differences that remain should be rounding only (dyadic prices at 2⁻⁵⁰ against doubles,
   exact intervals against outward floats, the exact floor of γ against a rounded-down double). It must pass within the
   2·10⁻⁹ margin before the kernel is frozen. One day with K1.
2. *Phase profile on a hosted runner* (4 vCPU) of one range module with 8 pieces after the savings: confirms 22 s and the factor.
3. *Share of `matINu` spent in bignum multiplication*: decides the 2⁻⁶⁴ idea.

## 6. What depends on the rows that are being redone (t ≤ 0.72)

- **Piece count and cost.** Present small-t tables: 135 pieces. `qtree.py` allows 80 leaves per node and is running on about
  174 nodes (58 chunks of 3): up to 13,900 pieces, more than the plateau (the first two nodes had 30 and 41 leaves, so 5,000
  to 7,000 is likely). At the upper end that is +620 vCPU-h with today's layout and about +200 with §5. Every total of §5 for
  the whole certificate waits for these tables.
- **Grid.** Those rows have margins of 7·10⁻³ to 1.7·10⁻² and leaf tolerances of 10⁻³. If their pieces are *generated* on the
  Lean grid 400×128 (8× fewer cells; `pieceGrids` index 0) their Lean cost falls by about 8× (E). **Decided: yes** (measured by
  the certificate worker: the caps lose 3·10⁻⁵ to 1.4·10⁻⁴, far inside those rows' margins; `PROGRESS.md` §6.3). The generator and Lean
  must use the same grid, so this has to be decided while the rows are produced. Python has moment tables for 1600×256 and
  1600×1024 only.
- **Directions (decided 16 Nov; L).** The low rows (t ∈ [0, 0.29]) use leaves that are products of **three** intervals:
  d₂ on block 2 (coordinates 6, 7, 10), d₃ on block 3 (8, 9, 11) and a third direction d₀ of arbitrary, mixed support,
  tiled over the whole line; 15–20 thousand more pieces, on the grid 400×128. **No new Lean lemma:** `capCoverOK ds P`
  asks `suppOK` only of `ds[1]` and `ds[2]`, puts no condition on `ds[0]`, and samples q₀ over the whole line and q₂, q₃ ≥ 0
  (`CapCoverDefs.lean`); `capCover_sound` has that check as its only hypothesis (`exists_orbit_rep`, `CapCover.lean`), and
  `pot_le_of_piecesNu` uses it unchanged. The generator must tile d₀ over both signs (the symmetries only fold q₂, q₃),
  and a piece then carries up to three constraints (`Cons.ok` treats each alone). What would still need a new lemma: two
  constrained directions inside one odd block.
- **Record format.** `routem2q` records have `psi_sym`, `details.tol`, leaves of kind `qbox`; no `superseded` flags (leaves
  only). The generator must take v₂, v₃ per node from the record (they come from the maximiser, not the symmetric anchor).
- **Row set.** 0.23 and 0.5 are dropped, 0.3 is a spare: the number of rows, the chunk facts `Cert/RowsK`, the row indices of
  every generated module and the chord data follow the final set. Nothing in §2 depends on it.
- **Node spacing.** 0.03 in s for these rows: more chord nodes or wider gaps between vertex nodes; `chordOK` needs both
  neighbours to be vertex nodes with certified caps.

## 7. Decisions (coordinator, 16 Nov 23:00 and 17 Nov 01:10)

1. **Price rule: K1 in the kernel, then the replay.** Done; the replay passes (§12). Conditions: platform determinism
   (met, §12) and the generator as frozen reference (§9).
2. **Kernel library:** the kernel branch, never merged into the other identity-tail branches, landed only in the switch
   PR; no new library (the lake files are pinned). **Provisionally frozen at b9689ee90** (17 Nov): no change to the price
   code, the cell means or the Float constants without re-running the 31-piece replay on two architectures.
3. **Deletions in the switch PR:** agreed as a plan; the list and its check are §10.
4. **Table → record binding, mirror pieces, small-t grid:** answered by the certificate worker (`PROGRESS.md` §6; §0.3,
   §6 here). Chord entries: at 72 of 254 the chord of the two table caps exceeds the chord node's cap by less than 10⁻¹²;
   the vertex nodes are therefore checked at cap − 10⁻¹² and `chordOK` is fed those lowered caps (S4).
5. **Registry and stamp script:** mine, in the switch PR, on master's versions; the new closure is §11, for comment first.
6. **Where the facts run:** GitHub-hosted runners (§13). No machine-word intervals now (§5).
7. **Piece-check saving** (`pieceNc` binds its matrix once): a `…Defs` change in the stage-2 work, soundness lemmas unchanged.
8. **Order of work from 17 Nov 01:10:** this note; S4 (assembly to `TailNodeCaps`) so that the chain from a checked piece
   compiles before the data arrive; the generator against the binding files; a row-level checker with spectral nodes for
   the direct row and row 0.4 (`PROGRESS.md` §7 of the certificate worker).

## 8. Evidence files

`/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/lean-stage2/`: `covercheck.py` +
`cover.log`, `cover_nomirror.log` (port of `capCoverOK` on the records behind every localised entry, with and without the mirror
pieces), `tablesrc.py` + `tablesrc.log` (record and slack
per entry), `counts.py` + `counts.log` (checks per row), `pricerule.py` + `pricerule_0.845.jsonl` (both price rules and
truncated iterations on 21 stored nodes and pieces of row 0.845; `pricerule_0.845_weighted.jsonl`: the dual rule on weighted
cell means; run on yo with the certificate's own generator modules).

## 9. The price code: the generator is the reference, frozen with the kernel (decision 1b)

K1 mirrors these functions (hashes checked on the laptop and on yo, 16 Nov 23:20; the certificate worker lists the same
hashes in its `PROGRESS.md` §6.3 and froze them at 23:10):

| what the kernel mirrors | Python function | file | sha256 |
|---|---|---|---|
| `dualPrices`, `dualObj` (12 Newton steps, 24 halvings, stop below 10⁻¹³ relative; start √σ + ν, √τ + ν; ν = 0: √σ, √τ) | `nucells.dual_prices_fast` | `caps-stage0c-2026-11-16/nucells.py` | e3215b70dc8f3122956dd83374358eb4e609356a117b7c1278b195b3b442cd4f |
| `gaussMeans`, `gaussPoint` (unweighted mean over 2×2 Gauss points of \|L+p\|² + e, \|L−p\|² + e, Re((L+p)(L−p)‾) − e) | `midnu.SetupNu.moments` | `caps-stage0-2026-11-15/midnu.py` | 396cb7588d8aa881fe5b42aef27122816da0563dc74d5c3d366ddbf0a06b8951 |
| the point values L(z), B_j(z) and the grid geometry (ring i = [ih, (i+1)h], angular cell j, Gauss offsets ±1/√3 of the half-widths) | `fullint.Setup.cellvals`, `Setup.__init__` (`rm`, `tm`) | `lower-stein/cert-0745d/tools/fullint.py` | 25d038a415e5b6bb9f5b26223fd57520310c842f85f10d8ae3fb840d7c687bb7 |
| `ringCellsNu` (table means: Gaussian-weighted σ, τ and ρ = 2⟨\|L\|²⟩ − (σ + τ)/2) | `capnu.CapRow.cell_moments` | `caps-stage0-2026-11-15/capnu.py` | 1480a265b83844bb401a14298a76b3f2519cbe2cacb21b874e85003247f3039a |
| `cellOfMeans` for pieces: prices → repair Δ ≤ 10⁻⁹ν² ⟹ both + 2ν → cell data | `midnu_x.SetupNuX.integrate_nu` | `caps-stage0c-2026-11-16/midnu_x.py` | fc7fc00da092f143bd035ed2a7b17ad7abdee6a53438f4155c91a3f2f3917951 |
| `cellOfMeans` for anchored nodes: prices × scale → the same repair | `nucert.certify_node` (lines 91–94) | `caps-stage0c-2026-11-16/nucert.py` | 43d63cb90c15d79d291db5f85ffa3e27fb091c22848b9ea8d352b3f011ba427d |

(Folders under `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/` and
`/Users/alingalatan/workspaces/grothe/handoff/`.) After the replay passes, neither side changes its price code without the other.

**Where the kernel deviates on purpose** (each only costs tightness, never soundness, and the replay measures the sum):
- prices are rounded down to multiples of 2⁻⁵⁰ (`dyNum`); the generator keeps doubles;
- the correction coefficient is the exact floor of the cell inequality at 2⁻¹⁰⁰ (`gNum`); the generator takes a rounded-down double;
- cos and sin of the Gauss angles are Taylor polynomials of degree 18/19 after reduction to |y| ≤ π/4 (no libm call);
- the kernel's angular cells start at −π, the generator's at 0: the same cells for even N, in another order;
- an exact repair `fixCell` (Δ ≤ 0 after rounding ⟹ both numerators `nuNum ν`), needed for `gridOKNu_mkGridNu`; it cannot
  trigger after the generator's own repair unless a price exceeds 10⁴.

**Platform (decision 1a).** The Float code uses +, −, ×, ÷ and sqrt only. Lean compiles the kernel's C with
`-ffp-contract=off` (read in the trace of `CapCheckNu.c.o` on yo: x86-64, clang of Lean 4.34.1), so no product feeds an
addition unrounded. The comparison of the price numerators between machines is in §12.

## 10. Deletions of the switch pull request (decision 3)

The switch PR replaces ε = 149/200 by 25/31 and with it every row, gate, cover and cap. What it deletes, by group:

1. **Generated data of the old certificate (whole files):** `Grothe/Lower/RowData01–19.lean` (regenerated under the same
   names), `CapRecipeData.lean`, `CapRow00–11,16–18.lean`, `CapRow12–15/*`, `CapPieces/*` (9,753 modules), the old
   `CapChordData.lean` content, `Research/RefinedCoverData.lean`, `RefinedCoverBoxes0–3`, `RefinedCoverParts`,
   `RefinedCoverPartition`, `LowerRefinementData`, `LowerRefinementCoverData`, `LawNodeData` as far as the new endpoint does
   not use their format; `data/caps-m/`, `data/caps-m-pieces/`, `data/cap-recipes/`, `data/cap-nodes/`.
2. **The checker without a tail (kernel, `GrotheCapsKernel/CapCheck.lean`):** `GridData` and its accessors, `majDq`, `cellOK`,
   `gridOK`, `natDist`, `majN`, `ringCells`, `mkGrid`, `wQ`, `wI`, `angSumC`, `angSumS`, `wmC`, `wmS`, `mCW`, `matI`, `entryOf`,
   `matOf`, `nwOf`, `polyBoundsOK`. Kept (the tail checker uses them): `absQ`, `rlb`, `two50`, `two100`, `Tables`, `Recipe`,
   `parseRat`, `parseRecipe`, `parseRecs`, `ratF`, `kqF`, `ivF`, `vecCP`, `priceCP`, `polarF`, `dyNum`, `rlNum`, `sumI`,
   `sqrt2I`, `ofKQ`, `angSumCW`, `angSumSW`, `polyI`, `tailPolyI`, `memo`, `memo3`, `get3`, `entryPolys`, `loQ`, `hiQ`.
3. **Its soundness chain:** in `CapPiece.lean` `Prices`, `nuF`, `dnuF`, `delF`, `c0F`, `hF`, `HF`, `Tz`, `Tint`, `priced_pair`,
   `pointwise_le_qf`, the `integrable_c0F/hF/HF/Tz/qf` group, `integral_qf`, `Jpot_le_qf`, `Jpot_le_of_qfN`,
   `pot_le_of_pieceOK`; in `CapGridT.lean` `majDq_cast`, `majD_mono`, `gridFun`, `gridPrices`, `Wts`, `TzW`, `cellWts`,
   `tailWts`, `TzW_mul`, `integral_TzW`, `Tz_eq_TzW`, `cellInd_mul_Tz`, `tailInd_mul_Tz`, `cellT`, `tailT`, `Tint_grid`; in
   `CapCheckSound.lean` `mem_wI`, `wmCr`, `wmSr`, `mem_wmC`, `mem_wmS`, `SW`, `SW_eq`, `sum_TzW`, `cwSpec`, `wmC_eq_mCW`,
   `wmS_eq_mCW`, `matI_eq`, `wmCr_natAbs`, `wmSr_neg`, `wmSr_pos`, `mem_cwSpec`, `polyBounds_of`, `mem_entryOf`, `Tz_symm`,
   `Tint_symm`, `matOf_getD`; in `CapGridOK.lean` everything but `dyNum_pos`, `dyNum_le`, `aFib_vec`; in `CapConstr.lean`
   `Jpot_le_of_pieceOKc`, `Jpot_le_of_nodeOKc`, `pot_le_of_pieces`; in `CapMajorant.lean` the anchored majorant without a tail
   (`majD`, `anchored_pair` and its lemmas) if the reachability list confirms that nothing else uses it.
4. **Checks and statements at ν = 0, replaced by their tail versions under the same names** (so that the registry and the
   generators keep their shapes, §11): `nodeOK`, `nodeOKc`, `rangeOK`, `nodeCheck`, `pieceCheck`, `pieceOneOK`, `pieceRangeOK`,
   `pieceNodeOK`, `pieceRepairOK`; `rowPot`, `NodeCap`, `PieceCap`, `VertexCapsRow`, `ExclCaps`, `VertexCaps`, `NodeCaps`,
   `nodeCap_of_rangeOK`, `nodeCap_of_ranges`, `nodeCaps_of_vertexCaps`, `rowPot_le_chord`; `CapPieceRepair(Defs).lean`,
   `CapExcluded.lean` (no repair and no exclusion in the new certificate).
5. **Corollaries at (ε, 0):** `VOf_frame`, `lower_bound_of_law_nodes`, `tailNodeCaps_zero` stays (sanity lemma), `Jpot_zero`
   and the statements `… 0 …` of FibreSup/FibreRot/FibreIntegral that only the old chain used.
6. **The 13 lemmas of the coordinator's dead-code list** (unused by name today, §13 of this note's hand-back).

**The check that nothing used is deleted:** a reachability list, not a name scan. A Lean script (run with
`lake env lean`, importing `Grothe.MainResult` after the switch) collects every constant reachable from the main theorems
(`Grothe.MainResult` and the headline list of `data/axioms/required.txt`) through types and proof terms, and prints the
declarations of `Grothe.Lower*`, `Grothe.LowerAnalytic*`, `Grothe.Research*` and the kernel that are not reached. The switch
PR deletes exactly that list (minus statements kept on purpose, each named in the PR), and CI's own build of
`Grothe.MainResult` is the proof that nothing reached was removed. I run the script before and after; its two lists go into
the PR description.

## 11. The new closure of the node caps (decision 7; for comment by the Codex side before I touch the scripts)

Today (`scripts/caps_stamp.py`, read at master e1307942d): the digest hashes, in this order,
(a) the Lean sources of the computation import closure of `TOPS` = the 15 legacy rows `CapRow00–11,16–18` + the 14
quadrature facts, and of the registry's `compute_roots` (9,040 leaves of rows 12–15); (b) directly, without following
imports: `CapNodes.lean`, `GrotheCapsKernel.lean`, `lean-toolchain`, `lake-manifest.json`, `lakefile.toml`, the registry's
`direct_hash_roots` (row assemblies, coverage assemblies, the retained proof); (c) the registry's cache projection
(`data/caps-m/plan/row-certificates/row12-build.json`, format `caps-bounded-build-v2`).

After the switch:
- **Row list.** No legacy rows (`CAP_ROWS = []`, `data/cap-nodes/rows.txt` and its `--size 49` profile gone). Every row of the
  new certificate is an *active row* of the registry, with the layout rows 12–15 have today: `CapRowKK/Recipes.lean`,
  `CapRowKK/AnchorRangeJJ.lean` (anchored and global nodes), `CapPieces/{D,C,R,N}<k>x<i>…` (localised nodes),
  `CapRowKK/Assembly.lean` with `theorem vertexCapsRowK : VertexCapsRow K`. No retained proof (`retained_proofs = []`).
- **Roots.** `compute_roots` = every module with a native fact: the anchor ranges, the range modules `R…`, the coverage
  facts `C…` (and their slices). `pure_roots` = their computation imports: the kernel (`Basic`, `CapPoly`, `CapCheck`,
  `CapCheckNu`), `RowDataTypes`, the row data, the `…Defs` modules (with the tail checks), `CapTablesData`, the `D…` and
  `Recipes` modules. `direct_hash_roots` = `CapNodes.lean`, the row assemblies, the node theorems `N…` as today.
- **Registry path.** `data/tail-caps/build.json`, same format; per row `anchors`, `pieces`, `selection`,
  `generation_config` under `data/tail-caps/<t>/`, produced by the generator from the binding files `bind_<t>.json`.
- **What `--digest` must hash.** The same three groups: (a) closure of the 14 quadrature facts and of all `compute_roots`;
  (b) `CapNodes.lean`, `GrotheCapsKernel.lean`, the three lake files, the `direct_hash_roots`; (c) the registry projection.
  New compared with today: `GrotheCapsKernel/CapCheckNu.lean` and the tail `…Defs` enter (a) through the imports of the
  leaves; `RowDataTypes.lean` changes (ε).
- **Hard-coded assumptions of the scripts that the switch touches** (found by reading; the list is for the owner to
  correct): `CAP_ROWS`, `ROW_TOPS`, `BUILD_REGISTRY`, `ROW_ASSEMBLY` and the v1 branch in `caps_stamp.py`; the legacy-row
  profile, the retained proof `node14x150`, `OLD_ROWS`, `REGISTRY`, `DIRECT` in `build_caps_batches.py`; `ROWS` in
  `tools/gen_cap_pieces.py`. Regular expressions for `vertexCapsRowK : VertexCapsRow K`, `nodeCap_… : NodeCap k i` and the
  anchor grid literal stay valid **if the tail versions keep today's declaration names and module layout** (§10, group 4);
  that is the reason to rename instead of adding `…Nu` names in the switch.
- `leaf_cost` in `build_caps_batches.py` reads the grids of a leaf's pieces from the selection file: the new selection
  files carry the grid per piece (400×128, 1600×256, 1600×1024), so the cost-sorted plan keeps working.

## 12. The replay of 31 stored pieces: PASS (17 Nov 2026, 01:02)

**What ran.** For each piece the harness (`Grothe/Replay/Harness.lean` of the scratch branch; a copy is in
`lean-stage2/replay/`) calls the kernel exactly as a piece fact will (`mkGridNu` with the piece's rule of the cell means,
`matINu`, `polyBoundsOKNu`, the real `pieceOKc` at cap + `capPad`) and also computes the **least cap the check accepts**:
the check matrix is N₀ + cap·e₀e₀ᵀ, so with index 0 eliminated last the last pivot of the exact LDLᵀ is cap − capMin.
The 31 pieces: 5 anchored nodes (rows 0.845, 0.74, 0.6), 5 `global` pieces with 1–4 variance vectors (one from a
neighbour's record), `routem1` centre, slab and halfspace, 6 `routem2` pieces, 11 `routem2v` pieces (among them a mirror
ring box, a piece with four variance vectors and two from neighbours' records), and two pieces on 1600×1024.
Kernel: b9689ee90. Machine: yo (x86-64), all 31; laptop (arm64, macOS), six of them; a hosted runner (x86-64), all 31.

**Result.** All 31 are accepted. Lean's least cap is **below** the generator's value in every case, by 1.65·10⁻¹² to
1.47·10⁻¹¹ (6.6·10⁻⁸ for one piece that the table takes from a neighbour's record): exact rational intervals are slightly
tighter than the generator's outward floats, and the dyadic rounding of the prices costs less than that. None of the
2·10⁻⁹ table margin is used: at the binding pieces cap + pad − (Lean's least cap) is 2.012·10⁻⁹ to 2.025·10⁻⁹.

| piece (row t, node s, source, kind, variance vectors) | Lean − generator (10⁻¹²) | cap + pad − Lean | hash of the price numerators (yo) | laptop |
|---|---|---|---|---|
| 0.845 s=43/100 routem2 box 1024 nv=0 | -14.664 | 2.025e-09 | 273170821456419718 |  |
| 0.845 s=2/5 routem2 halfspace nv=2 | -7.085 | 0.02117 | 845440692010622049 |  |
| 0.845 s=27/50 routem2v ringhalf nv=2 | -9.803 | 0.003957 | 448502299525835767 |  |
| 0.74 s=1/100 routem1 slab 1024 nv=0 | -13.201 | 2.023e-09 | 144755078796701570 |  |
| 0.845 s=2/5 routem2 far nv=1 | -7.124 | 0.00124 | 487154201778449310 |  |
| 0.845 s=27/50 routem2v ringbox mirror nv=2 | -9.413 | 0.003331 | 1919074607434766255 |  |
| 0.845 s=59/100 routem2v box binding nv=1 | -13.311 | 2.024e-09 | 2129314413731336007 |  |
| 0.845 s=0 anchored | -1.870 | 2.013e-09 | 848408719102718262 |  |
| 0.6 s=43/50 anchored | -1.651 | 2.012e-09 | 67400955965438473 |  |
| 0.845 s=79/100 global binding nv=1 | -10.975 | 2.022e-09 | 1667467392529544454 |  |
| 0.845 s=3/10 routem1 halfspace nv=1 | -6.714 | 0.02108 | 1934598006548228983 |  |
| 0.845 s=27/50 routem2v box binding nv=1 | -8.661 | 2.019e-09 | 1955681385927678890 | same |
| 0.845 s=27/50 routem2v halfspace nv=3 | -7.850 | 0.01527 | 126779898838032146 | same |
| 0.74 s=22/25 anchored | -1.783 | 2.012e-09 | 1187874885706797398 |  |
| 0.845 s=19/25 global binding nv=2 | -9.995 | 2.021e-09 | 1132351540361866652 |  |
| 0.845 s=3/10 routem1 slab nv=0 | -6.658 | 6.21e-06 | 612614924440518629 |  |
| 0.845 s=2/5 routem2 boxhalf nv=0 | -7.582 | 0.0001236 | 451518013055903174 |  |
| 0.845 s=27/50 routem2v ringbox nv=2 | -9.414 | 0.003331 | 1515570243864009135 | same |
| 0.845 s=53/100 routem2v(from 27/50) box binding nv=1 | -65836.171 | 6.785e-08 | 494249160404616607 |  |
| 0.845 s=1/10 anchored | -1.953 | 2.012e-09 | 185458971730096079 | same |
| 0.845 s=31/50 global binding nv=4 | -9.127 | 2.019e-09 | 1353450160082660251 | same |
| 0.845 s=3/10 routem1 centre binding nv=0 | -6.645 | 2.017e-09 | 209692933143528337 | same |
| 0.845 s=21/20 anchored | -2.251 | 2.013e-09 | 570561380592178337 |  |
| 0.845 s=63/100 global(from 16/25) binding nv=4 | -9.115 | 2.02e-09 | 1127737081813445799 |  |
| 0.845 s=2/5 routem2 box nv=0 | -7.323 | 3.6e-06 | 2181768567671545798 |  |
| 0.845 s=27/50 routem2v far nv=2 | -9.356 | 0.002274 | 1769516793508319069 |  |
| 0.84 s=29/50 routem2v(from 59/100) halfspace four variance vec | -8.303 | 0.01812 | 1540776629717646359 |  |
| 0.86 s=11/20 global binding nv=3 | -8.103 | 2.019e-09 | 1234416781963569490 |  |
| 0.845 s=2/5 routem2 box binding nv=0 | -7.347 | 2.018e-09 | 833749129404647959 |  |
| 0.845 s=27/50 routem2v farring nv=2 | -8.536 | 0.0007005 | 837873135990503288 |  |
| 0.845 s=27/50 routem2v boxhalf nv=1 | -8.915 | 8.984e-05 | 127584284517196368 |  |

(Full lines with timings: `lean-stage2/replay/results/yo_final_kernel_b9689ee90.txt`; `summarize.py` makes the table.)

**Platforms (the coordinator's condition a).** The six pieces run on the laptop (an anchored node, a `global` piece with four
variance vectors, a `routem1` centre, a binding `routem2v` box, a ring box, a halfspace with three variance vectors) give
**the same hash of all 3 × 409,600 price numerators, the same number of cells with G = 0 and the same least cap to 10⁻¹⁸**
as on yo. The bits of the 14 Float constants equal Python's correctly rounded doubles on both machines, and the hashes of
the cosines and sines of the Gauss angles agree. Reason, read in the compile traces of `CapCheckNu.c.o` on both machines:
Lean's clang compiles the kernel's C with `-ffp-contract=off` on arm64 as on x86-64, so no product is fused into an
addition; the code uses +, −, ×, ÷, sqrt, floor and abs only. No rounding step had to be added to the iteration.
The first kernel (45adba50e), which has the same table-means code, gave the same hashes for the anchored nodes on yo and
on a hosted runner (`replay/results/cloud_43962137263_firstkernel_82f668f70_cancelled/`).

**The hosted runner** (cloud job 43974535505, kernel b9689ee90): all 31 accepted, and **all 31 identical to yo**
(hash of the price numerators, cells with G = 0, least cap to 10⁻¹⁸): three machines, two architectures. The job took
1,190 s after the cache restore, with four Lean processes on the 4 vCPUs. Its phase times are in §13
(`replay/results/hosted_final_kernel_b9689ee90.txt`, `replay/results/cloud_43974535505_final_kernel/`).

**Consequence.** The kernel is provisionally frozen at b9689ee90 (coordinator, 17 Nov 01:10): its price code, cell means
and Float constants change only together with the generator files of §9 and a new run of this replay on two architectures.
The replay is cheap now: `lake build Grothe.Replay.RPD Grothe.Replay.RP00 … RP05` took 15 minutes on five shared cores of yo.

## 13. Where the native facts run: GitHub-hosted runners (decision 8)

**How row 12's 1,307 leaves went through CI** (read in `.github/workflows/lean.yml` and `scripts/build_caps_batches.py` at
master bf6fc7c91). The route job finds no verified cache for the caps digest and sets `caps_build`. The job `caps_shards`
runs once per label of the repository variable `CAPS_SHARDS` (`["big","mega"]`), each on that self-hosted machine: it takes
`leaves[i::n]` of the plan (`build_caps_batches.py --plan`, the groups that are not `pure`), builds them in the machine's
persistent workspace (`lake build <modules> --wfail`), packs `.lake/build/lib/lean/Grothe/LowerAnalytic/CapPieces` and
uploads it as `caps-shard-<label>-<run id>` (kept 1 day). The `build` job (droplet) unpacks the shards into its own
`.lake/build` and runs the bounded build and `lake build Grothe`: a leaf whose Lake trace matches (source, imports,
toolchain, and the hash of the kernel library file) is replayed, any other is built there. Then the checks, the marker
`.lake/build/caps-closure.sha`, and the cache.

**What a hosted runner changes.** 4 vCPUs, 16 GB, 6 hours per job, no workspace that survives the job, 85 GB of disk.
So: (1) nothing can be "found already built": every job starts from the master cache (14.3 GB today, 12 minutes to
restore) plus what the run itself hands over; (2) the kernel library must be the *same file* in every job, because each
leaf's trace records its hash: one job builds it and the others download it; (3) a job that dies loses at most its own
share (the three runs lost on 16 Nov, #490, died of memory with 11 GB modules; a leaf here holds 1.9–2.5 GB resident,
measured on yo, so four fit).

**Layout.**

| job | runs on | does | hands over |
|---|---|---|---|
| route | hosted, seconds | as today; for a caps run it also bins the plan's leaves by cost into shards of at most 4.5 h (`build_caps_batches.py --plan --shards-by-cost`, new) and emits the matrix | the shard lists |
| prefix (1) | hosted, ≤ 15 min | restores the master cache; builds the kernel library and every module the leaves import that the cache does not hold (`pure_roots`: the `…Defs` modules, row data, `Recipes`, `D…`) | artifact `caps-prefix-<run id>`: the files it built (kernel `.so`, `.olean`, `.ilean`, `.trace`, `.hash`) |
| shard k (N of them, `max-parallel` 2) | hosted, ≤ 5 h | restores the master cache and the prefix; `lake build <its leaves> --wfail` with four Lean processes | artifact `caps-shard-<k>-<run id>`: its leaves' outputs |
| build | hosted | restores cache, prefix and all shards; **asserts that every leaf replays** (`lake build <leaves> --no-build` fails if one is not up to date) before `lake build Grothe`, which then compiles only the node theorems `N…`, the row assemblies and `CapNodes` (elaboration, minutes); the checks; the marker; saves the verified cache | cache, and for a landing run the tree handoff |

- **Leaves.** One native fact per module, over a list of checks that share the tables of one grid. A module is filled by
  measured cost up to 30 minutes (the limit asked for is 40): about 24 pieces on 1600×256, 6 on 1600×1024, 200 on 400×128,
  20 anchored or global nodes. Leaves import only the prefix, never each other. The per-node cover facts (`C…`, cheap) are
  grouped per row. The generator writes the cost of every leaf into the selection file, as `leaf_cost` reads it today.
- **Changes to the workflow** (not mine to make: for the owner of `lean.yml`): `caps_shards` gets `runs-on: ubuntu-latest`,
  a numeric matrix from the route job instead of machine labels, `max-parallel`, the cache-restore and prefix-download
  steps, and artifact retention of 7 days instead of 1 (a run lasts longer than a day, below); a `prefix` job; the
  `--no-build` assertion in `build`. The self-hosted path can stay beside it for a machine that exists.

**Size of the run.** Per check, measured in the replay (§12; laptop seconds, one Lean process): grid 2.4 (Gauss means) or
11.6 (table means, anchored), enclosure `matINu` 24.5, piece check 16 today and 1.5 once `pieceNc` binds its matrix once
(§5, a `…Defs` change, not a kernel change), tables 10 per module. **Measured on a hosted runner** (cloud job 43974535505, four Lean
processes on the 4 vCPUs, seconds per process): Gauss grid 4.8, table-means grid 28, `matINu` 54 on 1600×256 and 173–224 on
1600×1024, tables 21–23 per module; the piece check was still the old one there (36–41) and is 0.35–0.40 on yo with the
saving. Alone on the runner a process needs 32 for `matINu`, so four processes deliver 2.4 times the work of one.

| part | checks | vCPU-s each | vCPU-h |
|---|---|---|---|
| anchored nodes (1,567, table means) and global nodes (329, Gauss means) on 1600×256 | 1,896 | 84 and 61 | 42 |
| localised pieces on 1600×256 | 14,259 | 61 | 242 |
| localised pieces on 1600×1024 | 213 | 220 | 13 |
| pieces on 400×128 of the low rows (three-interval leaves; the count is the coordinator's upper estimate, the spectral rows may need far fewer) | 15,000–20,000 | 8.5 (E: an eighth of the cells) | 35–47 |
| **total** (the first three lines are the 16,368 checks of the 20 final tables: 297) | | | **about 335–345** |

A shard job delivers 4 vCPUs × 4.7 h = 18.8 vCPU-h. So **18–19 jobs** (16 for the 20 final tables); wall time **45–50 hours
at two jobs at a time**, 23–25 at four, 15–17 at six (GitHub allows 20 concurrent jobs on a public repository; two is our
own rule). `matINu` is 89 % of a piece now: exact 128-bit interval arithmetic, 409,600 cells × 7 weights × 13 harmonics × 2.
Machine-word intervals at 2⁻⁶⁴ would cut it, with a new soundness proof of the enclosure in the kernel; **decided
(coordinator, 17 Nov 01:10): not now**, to be looked at again only above about 400 vCPU-h. The total is below that.

**Artifacts.** A leaf's outputs are small: today's range module has `.olean` 7.9 KB, `.ilean` 1.0 KB, `.trace` 3.1 KB
(measured in `/Users/alingalatan/workspaces/grothe/.lake/master-cache`); the recipes live in the data modules of the
prefix. A shard of 45 leaves is under 1 MB; the prefix (kernel library, `…Defs`, the data modules of 20 tables) 30–60 MB
(E); all artifacts of a run under 100 MB. The 14 GB are the master cache, restored by every job (after the switch it
loses the 9,753 old piece modules).

**Trust (AGENTS.md §10).** The rule there: a cached `native_decide` result is not re-executed, so only CI writes what
later runs replay. A leaf built in a shard job is covered by the same three facts as a shard of row 12 was:
1. *Who built it:* a job of the `lean.yml` run itself, from the pushed commit (for a landing run: the pinned merge), on a
   runner that GitHub creates and destroys. No agent can reach it; a droplet is weaker in this respect.
2. *Who may read it:* the artifact name carries the run id and only the `build` job of the same run downloads it.
   Nothing is taken from another run, from a cloud job (`scripts/cloud.sh`, which stays advice) or from a private machine.
3. *What makes it count:* the `build` job's own Lake compares each leaf's trace with the sources it checked out, the
   imports it restored, the toolchain and the kernel library it downloaded from the prefix job; `--no-build` turns a
   mismatch into a failure instead of a silent six-hour rebuild. Only after its green checks does `build` write the
   marker for the digest and save the cache that the route of later runs accepts as "verified".
What §10 needs added: a row "shard and prefix artifacts `caps-…-<run id>`, 7 days | the jobs of one caps run of
`lean.yml` | the `build` job of the same run", and in "who writes caches" the words "droplet checks" become "caps runs
(on whatever runner CI assigns)". The step-by-step of a PR that changes the node caps keeps its shape: branch checks fail
at once with "needs a caps run"; the author dispatches `-f mode=caps` once when the PR is otherwise ready (it is the run
of this section and it saves the branch's verified cache); `/land` then replays on a hosted runner; master's check takes
the tree handoff.

**Where it could fail, exactly.**
- *The 6-hour limit:* not with leaves of 30 minutes and shards binned to 4.5 h. A lost shard is re-run alone ("re-run
  failed jobs" keeps the run id, so the other artifacts stay valid while they are retained).
- *Disk:* no (15 GB of 85).
- *Trace portability:* it is what today's shard path already relies on between two machines; the one new requirement is
  the single kernel library (prefix job). To be tested once on a two-leaf run before the real one.
- *Our own limit of two CI jobs:* a caps run at `max-parallel` 2 holds both slots of its author for two days. Either the run
  counts as one job (a rule change for the coordinator and the user), or the author does nothing else in CI meanwhile.
- *Master moving during the run* does not matter for the caps run (it checks the branch); the landing check afterwards
  needs the same digest, i.e. no change of the caps closure on master in between (as today).

## 14. S4 and D1 as built (17 Nov 01:25): from the range facts to `TailNodeCaps (nuHat ν)`

On the kernel branch, compiled without warnings on yo; all theorems on the three standard axioms, except the one corollary
that cites today's native chord fact `capChords_check`.

- **`CapRangeNuDefs.lean`** (computation only; it will be in the caps closure). `capLow = 10⁻¹²`;
  `nodeCheckNu`, `rangeOKNu nu k recs grids excl lo hi` with `recs : List (ℕ × ℕ × Bool × Recipe)` = (node, grid index, rule of
  the cell means, recipe): anchored nodes carry `false` (table means), global nodes `true` (Gauss means);
  `pieceOneOKNu`, `pieceRangeOKNu nu x lo hi` on today's node record `x = (k, i, directions, pieces)` with Gauss means;
  `chordNodeOKLow`, `chordOKLow`. **Every vertex node and every piece is checked at its table cap minus `capLow`.**
  The tables of the piece grids are thunks (`pieceThunks`): a module of pieces on one grid builds one table, not five
  ("interpreter saving 2" of §5 without a proof obligation).
- **The piece-check saving** (§5, "interpreter saving 1"): `pieceNc` is now `pieceNcOf Mq (pieceN …) cs`, so the matrix of the
  unconstrained check is tabulated once; one line of `qf_pieceNc` changed, no statement did (`CapConstrDefs.lean`,
  `CapConstr.lean`). Measured on yo, same six pieces, same hashes and least caps: the piece check 39–59 s → 0.35–0.40 s.
- **`CapRowsNu.lean`** (soundness): `NodeCapNu nu k i` (Ψ_ν(sᵢ) − capPad ≤ cᵢ − capLow), `VertexCapsRowNu`, `ExclCapsNu`,
  `PieceCapNu`; `nodeCapNu_of_rangeOK` (a range fact gives the caps of its whole-fibre nodes; the nodes of `excl` are the
  localised ones); `pieceCapNu_of_pieceOneOK`, `nodeCapNu_of_pieceCaps`, `nodeCapNu_of_ranges` (coverage fact + the piece
  checks of all pieces of a node give its cap; no excluded pieces any more), `pieceOneOKNu_of_range`;
  `pot_sub_convexOn` (any tail); **`tailNodeCaps_of_vertexCaps`**: the chord check against the lowered caps and
  `∀ k < rowData.length, VertexCapsRowNu nu k` give `TailNodeCaps (nu : ℝ)`; `tailNodeCaps_nuHat` puts it in the form
  `TailNodeCaps (nuHat ν)` that `sharedReduction_frame` and `lower_bound_of_tail_nodes` take (`nuHat ν = nu`, by `norm_num`
  for ν = 47/2000, nu = 47/1953).
- In `CapNodeNu.lean` the all-pieces lemma is now semantic: `pot_le_of_pieceBoundsNu` (cover + a bound of `J` on every
  region ⟹ the bound of Ψ_ν, for any real tail); it replaces `pot_le_of_piecesNu`.
- **Why the lowering needs no change of the tables:** a chord node's cap c_k satisfies chord(c_a, c_b)(s_k) − 10⁻¹² ≤ c_k in
  the binding (72 of 254 fail without the 10⁻¹²). Lean proves Ψ − capPad ≤ c − capLow at both ends (2·10⁻⁹ of room, §12),
  convexity gives the chord of the lowered caps at s_k, and `chordOKLow` compares exactly that with c_k. For today's rows
  `chordOKLow` follows from `chordOK` (`capChordsLow_check`), so the statement is already hypothesis-free on the present data.
- Smoke test on the repository's rows at the tail 0 (yo, `scratch/NuRange.lean` of the dev folder): `rangeOKNu 0 3 … 0 2 = true`
  with table means, i.e. the tail checker accepts nodes 0 and 1 of today's row 3 at their caps lowered by 10⁻¹²
  (166 s with the tables; today's `rangeOK` on the same two nodes: `true`, 147 s).
- **What is still to write for stage 2 in Lean:** nothing between a fact and `TailNodeCaps`. Open: the generated modules
  (§15), the switch of ε (25/31) with its deletions (§10), the registry (§11), and the spectral row checker (§16).

## 15. The generator, against the binding files (design)

`tools/gen_tail_caps.py`, the successor of `gen_cap_nodes.py`, `gen_cap_pieces.py` and `gen_cap_chords.py`; its prototype is
`lean-stage2/replay/mkreplay2.py`, which already turns stored records into the strings the kernel reads (the 31 replayed
pieces went through it, neighbours' records included).

**Input, committed under `data/tail-caps/<t>/`** (a selection made once from the certificate folder by
`tools/select_tail_caps.py`, which checks every hash): `table.json` (the final table, with its `FINAL_<t>` hash),
`bind.json` (the worker's `bind_<t>.json`, format `table-binding-1`: per entry `i, s, cap, src, record`; per record `line,
sha256, kind, s, nq, pieces, v2, v3`), `records.jsonl` (exactly the bound lines of `caps_<t>.jsonl`, each verified against
its sha256; 2,340 records, about 10–15 MB for the 20 tables).

**Output** (generated, byte-reproducible, `--check` mode), per row K with table t:

| module | content | from |
|---|---|---|
| `CapRowKK/Recipes.lean` | `capRecsKK : List (ℕ × ℕ × Bool × String)` (node, grid, rule, recipe) for the anchored (`false`) and global (`true`) entries; `capExclKK` = the localised entries | entries with `src` anchored / `quad:` of kind global; the record's own `recipe` |
| `CapRowKK/AnchorRangeJJ.lean` | `rangeOKNu nuHatQ K (parseRecsNu capRecsKK) capGrids capExclKK lo hi = true := by native_decide`, about 20 nodes each | cost-binned |
| `CapPieces/D<K>x<i>.lean` | the node record `(K, i, [d₀, v₂, v₃], pieces)`; a piece = `grid;recipe;constraints` at the **entry's** s | `records[..].v2, v3`, `details.plist[j]` for j in `pieces` (mirror pieces already dropped) |
| `CapPieces/C<K>x<i>.lean` | `pieceCoverFastOK x = true` (slices for the large low-row nodes) | — |
| `CapPieces/R<K>x<i>_<J>.lean` | `pieceRangeOKNu nuHatQ x lo hi = true`; the pieces of a node are ordered by grid, a module holds one grid and at most 30 minutes (about 24 pieces on 1600×256, 6 on 1600×1024, 200 on 400×128) | measured costs of §13 |
| `CapPieces/N<K>x<i>.lean` | `NodeCapNu nuHatQ K i` by `nodeCapNu_of_ranges` | — |
| `CapRowKK/Assembly.lean` | `VertexCapsRowNu nuHatQ K` from the range theorems and the `N…` theorems (`ExclCapsNu`) | — |
| `CapChordData.lean`, `CapNodes.lean` | chords from `src = chord:a-b`; `chordOKLow` fact; `TailNodeCaps (nuHat ν)` by `tailNodeCaps_nuHat` | `table.json` |
| `data/tail-caps/build.json` | the registry of §11 with the cost of every leaf | — |

**Rules.** Floats are written as their shortest decimal and read as exact rationals, as today. Before writing anything the
generator re-checks with fractions, and stops on the first failure: the hash of every bound record and of every table;
for every (entry, piece) q_piece(s_entry) + 2·10⁻⁹ ≤ cap; for every chord entry the lowered-chord inequality; for every
record the cover without mirror pieces (`covercheck.py`, a port of `capCoverOK`). Names and layout are today's (`D/C/R/N`,
`CapRowKK/…`), so the registry's patterns and `build_caps_batches.py` keep working (§11).

**What it still needs from the certificate side:** the record format of the low rows (three constraints per leaf, d₀ in
`dirs`; `parseCons` already takes the direction index 0), the final row set and its numbering, and for anchored nodes on
400×128 the radial count as a parameter of the tables (`PROGRESS.md` §6.3, "two lines, not done").

## 16. A row checker with spectral nodes (the direct row, row 0.4)

**Built (17 Nov 01:45):** `Grothe/Lower/SpecRows.lean` on `claude-b9ee/identity-tail-specrows` (71bce5354): `SpNode`,
`SpNode.ok`, `SCell`, `checkSCell`, `parseSCell`, `checkSpecCells`, `checkSpecRow`; `swit_tb`, `spNode_tb`, `chord_goal`,
`scell_sound`, `rowBound_of_specCells`, `RowFacts`, `rowFacts_of_checkRow`, `rowFacts_of_checkSpecRow`. Tested on mixed
batches 19 and 10 (`lean-stage2/specrows/`). What follows is the design as written before.

Read: `Grothe/Lower/Rows.lean` (`checkRow`, `checkCell`, `node_tb`, `chord_sound`, `cell_sound`, `rowBound_of_check`),
`Grothe/Lower/Mixed.lean` (`SWit`, `checkSWit`, `checkSWit_sound`, `checkBatch`, `batch_sound`), `Grothe/Lower/Law.lean`
(`TB`, `TB.zero`, `TB.node`, `TB.specNode`, `TB.chord`), and §7 of the certificate worker's `PROGRESS.md`.

**What exists.** A row cell today is a chain of σ-pieces: moment rectangles and chords of consecutive *cut* nodes; a cut
node is certified by `checkNode` and turned into `TB μ U Ψ σ (nodeW n xlo xhi)` by `node_tb` (`TB.node` + the endpoint rule
`MPoly.J_endpoint`); `chord_sound` joins two such bounds by `TB.chord` and pays the price κσ² with `chord_le_chordMax`.
For the mixed tables a *spectral* witness is certified by `checkSWit` (majorant y, one spectral cut z, λ, μ, t, β, ν;
`sweepTop` against the node table) and `batch_sound` turns it into `TNodeOK` = `TB μ U Φ τ (y.J 0 1 x)` through
`TB.specNode`. Nothing of `chord_sound` looks inside a node: it uses the two `TB` facts, 0 ≤ σ_p < σ_n and the numbers
`nodeW`.

**What I would add (one new module `Grothe/Lower/SpecRows.lean`, nothing existing changes):**
1. `swit_tb`: from `checkSWit nodes smax vs w = true` with `w.bud = .sep`, `Moments`, `SteinCut`, `CapsHold`, a valid mesh
   and x ∈ [xlo, xhi], 0 ≤ xlo: `TB μ U Ψ w.tau (max (w.y.Jq 0 1 xlo) (w.y.Jq 0 1 xhi))`. Proof: the `.sep` case of
   `checkSWit_sound`, `TB.specNode`, `.mono` with `J_endpoint` (y.a6 ≥ 0 is in `checkSWit`). 15 lines; the same three lines
   that `batch_sound` has, plus the endpoint rule of `node_tb`.
2. `chord_sound_tb`: `chord_sound` stated for two abstract nodes (τ_p, W_p), (τ_n, W_n) with their `TB` facts instead of
   two `SNode`s. Its proof is the body of `chord_sound` from the line `simp only [chordOK …]` on. 15 lines. (The zero node
   is `TB.zero` with Ψ(0) ≤ the table's first cap, as `zeroNode` of `Mixed.lean` has it.)
3. `SCell` (xlo, xhi, rectangles, spectral witnesses in increasing τ), `checkSCell` = `checkCell` with `checkSWit` in
   place of `checkNode`, a test that every witness cites the separable budget, and the chord test on `(w.tau, swW w)`;
   `scell_sound` = `cell_sound` with 1 and 2. 60 lines.
4. `checkSpecRow` (mesh, chain of x-cells over [0, 31/4], cells in parallel) and `specRowBound_of_check : … → RowBound r`
   — the same statement `RowBound` that every consumer of a row uses today. For **row 0.4** the record is a `Row` whose
   cells are spectral: its check is `checkRow` with `checkSCell` for the cell part and the gate part unchanged, so the
   gates, the mixtures and the cover see an ordinary row (if a mixed table cites one of its nodes, `rowTNode` needs the
   spectral analogue of `checkRow_node`, 20 lines). For the **direct row** there is no gate: `checkSpecRow` alone, with
   delta, kappa, smax and the table of Ψ(s) = φ(4s/3) as the worker lists them.
   About 150–200 lines in all, no new analysis; the Bernstein sweep (`sweepTop`, `specPolys`) is today's code.
5. The rest of the direct row is not checker code: the pointwise inequality (a) of the worker's §7 (60–100 lines),
   `CapsHold` for the explicit convex Ψ, the law of w = `QkOf` with its `Moments` and `SteinCut` exposed (today
   `norm_starProjection_H21_le_rho` keeps only ‖w‖ ≤ ρ), and the row (0, 0, D) in place of the crude row in the cover.

**Cost of the fact** (worker's sizes: 51 x-cells, 608 spectral nodes, about 135 Bernstein pieces of degree ≤ 10 per
node, mesh of 83 knots): of the order of the mixed batches of today (a `checkSWit` there has the same shape); it runs in
`Grothe.Lower`, outside the caps kernel and the caps closure, in several `native_decide` facts by cell range.
