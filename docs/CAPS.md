# The node caps of the lower bound

The rows of the lower-bound certificate use the fibre potentials of their visible sectors only through upper bounds at
finitely many nodes, the **node caps**. This file says what the node caps state, how Lean proves them, where their data
and their generator are, and what they cost. The mathematics of the lower bound is in [overview.tex](overview.tex)
(CI builds `OVERVIEW.pdf` from it), the proof chain in [LEAN_DETAILS.md](LEAN_DETAILS.md), the native facts in
[LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md).

## The statement

The witness is `T = P₁,₀ − e·P₂,₁ + ν(Id − P₁,₀ − P₂,₁)` with `(e, ν) = (191/250, 47/2000)`. In hat units its weight is
`ε̂ = (e + ν)/(1 − ν) = 25/31` (the weight `ε` of the rows, `Grothe/Lower/RowDataTypes.lean`) and its tail is
`ν̂ = ν/(1 − ν) = 47/1953` (`capNu`, `Grothe/LowerAnalytic/CapCommon.lean`).

A row has forcing parameters `(ℓ, β)`, an even block `E`, an odd gate block `R` (`rowR`, `Grothe/Lower/RowGateData.lean`)
and a coupling `a = (1 + b₁, b₂, b₃)`. Its fibre potential with the tail `ν` is (`pot`, `Jpot`,
`Grothe/LowerAnalytic/FibreSup.lean`)

    Ψ(s) = sup_y [ ∫ (Ψ_ν(L + p, L − p) − ν) dγ − yᵀMy ],    p = B·(My + s a),    L(z) = z(ℓ + β(|z|² − 2)),

over the twelve real coordinates `y` of the fibre (`Fib`), with the basis `B = (1, |z|² − 1, z²/√2, z, z(|z|² − 2)/√2, z̄)`
of the visible sectors, `M = diag(E, E, R, R, εI₂)` and the pair potential (`psiT`, `CapMajorant.lean`)

    Ψ_ν(A, B) = sup_{|f| = |g| = 1} Re(f̄A) + Re(ḡB) + ν Re(f̄g),    Ψ_0(A, B) = |A| + |B|.

For every `ν` the potential is convex, even and Lipschitz in `s` (`pot_convexOn`, `pot_neg`, `pot_lip`, `capsHold_pot`);
these are theorems. The node caps are the remaining finite information:

* `TailNodeCaps ν` (`Grothe/LowerAnalytic/RowGaussian.lean`): for every row `k` of `rowData` and every node `(s, c)` of its
  cap table, `Ψ_k(s) − capPad ≤ c`, with `capPad = 10⁻¹¹`;
* `tailNodeCaps_cert : TailNodeCaps (nuHat (47/2000))` (`Grothe/LowerAnalytic/CapNodes.lean`) proves it for the 14 rows;
* `lower_target` (`Grothe/MainResult.lean`) is `lowerTarget_of_tailNodeCaps tailNodeCaps_cert`. The hypothesis enters
  through `lower_bound_of_tailNodeCaps`, `witnessCap_cert` and the shared reduction `reductionHyp_of_nodeCaps`.

The mass row uses the explicit quadratic and affine branches of its potential. Lean checks the spectral
majorant on each branch, then checks the chords between certified scales throughout the fourth-moment
range. Both checks run in the kernel. [Mass row](../Grothe/Lower/Cert/MassRow.lean).

## The tables

Each row has a cap table of nodes `0 = s₀ < s₁ < …` with rational caps `cᵢ`: up to `s = 30` for the rows 0.4 and 0.6, up
to `s = 6` for the others. The 14 tables have 2,012 entries. 1,774 are certified by a record of their own (a node
certificate of one of the kinds below), and 238 are chord nodes: their caps follow from two vertex nodes by the convexity
of `Ψ`.

Every vertex node is checked at its table cap lowered by `capLow = 10⁻¹²` (`NodeCapNu`, `CapRowsNu.lean`). The table caps
are rounded up at `10⁻¹²` one by one, so the chord of two table caps can exceed the cap of a chord node by less than
`10⁻¹²`, while the chord of the lowered caps cannot (`chordOKLow`, `nodeCaps_of_vertexCapsNu`).

## The kinds of node certificates

**Whole-fibre nodes**, on the `1600 × 256` polar grid of `[0, 8]` (`capGrids`). A recipe gives an anchor in the twelve
fibre coordinates, and the checker prices every cell of the grid from it:

* *anchored* nodes: the cell prices come from the Gaussian-weighted means of the cell (the moment tables);
* *global* nodes: an anchor with variance vectors; the cell prices come from the unweighted means over the `2 × 2` Gauss
  points of the cell.

The range facts check consecutive whole-fibre nodes of a row (`rangeOKNu`, `CapRangeNuDefs.lean`); `nodeCapNu_of_rangeOK`
turns them into node caps through `pot_le_of_nodeOKNu`.

**Localised nodes** (route M). The fibre space is covered, up to the two symmetries `S_c`, `S_−` of the potential
(`Jpot_cj`, `Jpot_ng`, `CapSymmetry.lean`), by pieces cut out by one to three linear constraints `lo ≤ τ ≤ hi` (or a
half-line) in the directions `d₀`, `v₂`, `v₃` of the node, with `τ = d·vec(My)`; `v₂` lives on the odd real block
(coordinates 6, 7, 10) and `v₃` on the odd imaginary block (8, 9, 11). The coverage is checked exactly
(`pieceCoverFastOK`, equal to `capCoverOK` by `capCoverFastOK_eq`; sound by `capCover_sound`, `CapCover.lean`): one
rational sample per cell of the partition of the constraint values. Each piece carries its own price recipe and an
S-lemma certificate: subtracting the nonnegative forms `λ(τ − lo)(hi − τ) + μ(τ − lo)` from the quadratic form of the
majorant leaves a matrix with an exact `LDLᵀ` factorisation with nonnegative pivots (`nodeOKcNu`, `Jpot_le_of_nodeOKcNu`).
`nodeCapNu_of_ranges` assembles a node from its coverage fact and its piece facts. The pieces use the Gauss-point means
of the cells, on `1600 × 256` or `1600 × 1024`; the three-direction pieces of row 0.4 use `400 × 128` (`pieceGrids`,
`CapPieceRange.lean`). The records name their layout: one direction (`routem1`), two directions (`routem2`; `routem2v`
with a base variance; `routem2q`, quadrant trees), three directions (`routem3q`, row 0.4).

**Chord nodes**: `chordOKLow` checks `chord(c_a − 10⁻¹², c_b − 10⁻¹²)(sᵢ) ≤ cᵢ` for two vertex nodes `s_a < sᵢ < s_b`;
convexity gives the cap.

## The checker

The checker is `GrotheCapsKernel/CapCheckNu.lean`, in the precompiled library `GrotheCapsKernel` (Mathlib-free; its
constants keep the `GrotheKernel` namespace). It shares the interval arithmetic (`Basic.lean`), the symbolic polynomials
(`CapPoly.lean`) and the polar cells with the checker without a tail (`CapCheck.lean`).

1. **Prices.** On each cell the generator's dual objective `(d₂ + d₃)/2 + (d₃σ₊ + d₂σ₋ + 2νρ)/(2(d₂d₃ − ν²))`, with the
   cell means `σ₊`, `σ₋`, `ρ` of `|L + p|²`, `|L − p|²` and `Re((L + p)(L − p)‾)` by one of the two rules above, is
   minimised by the generator's damped Newton iteration (`dualPrices`). The recipes are stored as the exact rationals of
   the generator's doubles, so the Lean prices reproduce the generator's. The prices are dyadic (`d = D/2⁵⁰`), with a
   correction coefficient `g = G/2¹⁰⁰`, the largest one the exact cell inequality allows (`gNum`). Prices are search data:
   every grid built from a recipe passes the cell check (`gridOKNu_mkGridNu`), so no run-time cell check is needed.
2. **Pointwise majorant.** On a cell with prices `d₂, d₃ > ν` and ring bound `rl ≥ |L|`, with `Δ = d₂d₃ − ν²`,

       Ψ_ν(L + p, L − p) ≤ (d₂ + d₃)/2 + c_L|L|² + c_P|p|² + 2t_d x − (g/16)(4x − c₀ − c₁|L|²)²,    x = Re(p L̄),

   `c_L = (d₂ + d₃ + 2ν)/(2Δ)`, `c_P = (d₂ + d₃ − 2ν)/(2Δ)`, `t_d = (d₃ − d₂)/(2Δ)`, and an exact centre `c₀, c₁`: a
   rank-one correction of the anchored-pair majorant (`anchored_pair_nu`, `psiT_le_majPoly`, `CapMajorant.lean`; for the
   checker `psiT_le_majPoly_of_cellOKNu`, `CapCheckNuSound.lean`). Outside the grid the prices are `d₂ = d₃ = 1`.
3. **Integration.** With `p = B·v` the majorant integrates to a quadratic form in `(1, v)`, `v ∈ ℝ¹²`: the fibre integral
   is at most `qf T 13 (1, v)` (`Jpot_le_qfNu`, `CapPieceNu.lean`), with the coefficients `T = TintNu` decomposed exactly
   over the cells (`TintNu_grid`, `CapGridTNu.lean`). The kernel matrix `matINu` encloses them (`bounds_matINu`,
   `CapCheckNuMat.lean`), from the seven cell weights enclosed at `2⁻¹²⁸` and verified interval tables of the Gaussian
   moments of the cells (`TablesOK`, `tablesOK_mk`).
4. **Exact certificate.** With `v = vec(My + sa)` and `T` replaced by a Loewner upper bound of its enclosure,
   `c + capPad − (qf T 13 (1, v) − yᵀMy)` is a quadratic form in `(1, y)` with a `13 × 13` rational matrix. An exact
   `LDLᵀ` factorisation with nonnegative pivots shows that it is nonnegative, i.e. `J(y, s) − capPad ≤ c` for every `y`
   (`Jpot_le_of_qfN_of_le`, `CapPiece.lean`), or on the region of a piece after the S-lemma terms
   (`Jpot_le_of_pieceOKc_of_le`, `CapConstr.lean`).

Soundness, in order: `CapCheckNuSound`, `CapGridTNu`, `CapCheckNuMat`, `CapPieceNu`, `CapNodeNu` (node and piece checks),
`CapRowsNu` (from the native facts to `TailNodeCaps`, `tailNodeCaps_nuHat`).

## The modules

All node-cap modules are generated by `tools/gen_tail_caps.py`; never edit them by hand. `KK` is the index of the row in
`rowData` (`00` for row 0.4, …, `13` for row 0.8875) and `i` the index of a node in its table.

| module | content |
|---|---|
| `CapCommon`, `CapCommonFacts` | the tail `capNu = 47/1953` and the grid of the whole-fibre nodes; `0 ≤ capNu < 1` |
| `CapRowKK/Data` | the cap data of the row: `capRowKK` (constants and cap table), `capRKK`, `capChordsKK`, `capRecsKK` (the recipes of its whole-fibre nodes), `capExclKK` (its localised nodes) |
| `CapRowKK/AnchorRangeJJ` | native range facts `rowKKAnchorRangeJJ`: `rangeOKNu` over consecutive whole-fibre nodes |
| `CapPieces/DKKx<i>` | the localised node `i`: its directions and pieces `grid;recipe;constraints` (`pieceNode_KKx<i>`, data only) |
| `CapPieces/CKKx<i>` | its coverage fact `pieceCover_KKx<i>` (`pieceCoverFastOK`) |
| `CapPieces/RKKx<i>_<J>` | its piece facts `pieceRange_KKx<i>_<J>` (`pieceRangeOKNu` over consecutive pieces, one grid per module) |
| `CapPieces/NKKx<i>` | its cap `nodeCap_KKx<i>` (`nodeCapNu_of_ranges`) |
| `CapRowKK/Assembly` | the caps of the localised nodes (`exclCapsRowKK`), the vertex caps (`vertexCapsRowKK`), the chord fact `chordsOKRowKK`, the positivity of `E` and `R` (`psdRowKK`, by kernel `decide`) and the caps of all nodes, `capsRowKK` |
| `CapRowKK/Bridge` | `capBridgeKK`: the cap data and the Stein row `rowSS` (`SS = KK + 1`, written by `tools/gen_lower_data.py`) have the same constants and node table (`rfl`) |
| `CapNodes` | `tailNodeCaps_cert` |

The fact modules import only computable definitions, the checker and rational data; the soundness modules and the row
assemblies stay outside their import closure, so a proof change does not invalidate the facts. Every native check is
sequential (no threads inside `native_decide`, `AGENTS.md` §13); the parallelism is between modules, which Lake builds as
separate processes. The generator lists the facts in `data/tail-caps/native.txt` (merged into `data/axioms/native.txt`).

## Data and generator

The inputs live in `data/tail-caps/`, with their sha256 in `data/tail-caps/SHA256SUMS`:

* `row_set.json`: the row set (per cap row its `t`, index, constants `θ`, `δ`, `κ`, `smax`; the mass row's `λ` and `S`;
  the envelope's maximum and margin);
* `<t>/table.json`: the cap table of row `t` (nodes, caps, sources);
* `<t>/bind.json`: the record and the live pieces behind every certified entry, the two ends of every chord entry;
* `<t>/records.jsonl`, `<t>/index.json`: the bound records.

`python3 tools/gen_tail_caps.py` checks every input with exact fractions before it writes anything, and stops at the
first failure: the value of every record is the maximum of its bound pieces at the entry's own `s` and stays `2·10⁻⁹`
below the cap; every chord entry has vertex ends and fits below its cap at the lowered caps; every constraint vector of a
piece is `±d₀`, `±v₂` or `±v₃` of its node. `--check` regenerates every file and compares it with the repository,
`--plan` prints the modules with their estimated costs, `--dry-run` runs the checks without writing. The generator
splits the node ranges and the pieces of a node into modules of about ten minutes each (its cost model, one Lean process
on an x86-64 machine). The Stein side of the rows (rows, mass row, gates, envelope and their checks) is written by
`tools/gen_lower_data.py` from `data/tail-rows/` and the same `row_set.json` and tables; the bridges tie the two sides
together.

## Cost and CI

The node-cap facts take about 340 CPU-hours, one Lean process per module; the piece facts dominate. They are part of the
single target `Grothe`. When their sources change, CI builds them on its heavy runner (the landing check of the pull
request, then master's check); otherwise it replays them from a verified build cache, whose key contains their source
digest (`scripts/caps_stamp.py --digest`; `AGENTS.md` §8, §10). Never build `CapNodes` or the cap rows on the laptop; to
test one node, build its modules alone, e.g. `lake build Grothe.LowerAnalytic.CapPieces.N00x0`.

`GrotheCapsKernel` is one precompiled shared object: a change to any of its modules recompiles every node-cap fact. The
caps closure also contains `lakefile.toml`, `lake-manifest.json` and `lean-toolchain` (`AGENTS.md` §13).
