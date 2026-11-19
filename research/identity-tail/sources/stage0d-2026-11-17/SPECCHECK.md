<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/speccheck/SPECCHECK.md (17 November 2026); the speccheck worker of claude-b9ee. Only this line was added. -->
# SPECCHECK: independent check of the three spectral rows of the identity-tail certificate

claude-b9ee speccheck worker, 17 November 2026, 01:08–01:50 Europe/Bucharest. Laptop, one process at a time.
Folder: `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/speccheck/`.

**Verdict.** The three spectral rows pass: every node, every piece of every sweep, the cover of every x-cell, and the
row constants. The constants I recompute exactly are the certificate's, to the last digit. No node fails, and
no disagreement with the certificate files affects a number.

| row (file) | nodes | pieces | exact check (Lean replica) | Sturm (2nd method) | constant recomputed | equals the certificate's |
|---|---|---|---|---|---|---|
| mass row λ = 1/2 (`cert_mass_0.5.json`) | 1078 | 231,917 | PASS, 15 s | PASS, 289 s | max = S − 10⁻¹¹ exactly (S = 0.165606335315) | yes: S = max + 10⁻¹¹ |
| row 0.4 (`cert_row_0.4b.json`) | 1011 | 195,757 | PASS, 13 s | PASS, 250 s | bound at t₀ = 2/5: 0.689780757737345… | yes: the C of `ROW_CONSTANTS.txt`, exactly |
| row 0.6 (`cert_row_0.6.json`) | 1316 | 254,646 | PASS, 17 s | PASS, 334 s | bound at t₀ = 3/5: 0.693971383018067… | yes: the C of `ROW_CONSTANTS.txt`, exactly |
| the pruned versions (`*_pruned.json`) | 136, 180, 204 | 28,935, 35,135, 39,648 | PASS, 2–3 s each | PASS, 38–47 s each | the same three maxima, exactly | yes |

What was read: the Lean files below (master `bf6fc7c91`), `PROGRESS.md` (the statement and §7), and the format note
`final/SPEC_CERT_FORMAT.md` for the file layout. **Not read:** `verify_spec.py`, `gen_spec.py` and every other script
of the certificate. Lean files transcribed (SHA-256, first 16 hex digits):
`Lower/Basic.lean` 8ce61f56c3ddf687, `Lower/Poly.lean` 63f0d540d9da89e8, `Lower/Sweep.lean` f278b2c93b3ca3c3,
`Lower/Cuts.lean` 73988d43b7da0b23, `Lower/Law.lean` 2392a869e61aa227, `Lower/Rows.lean` 2112a44e2780fa6b,
`Lower/Mixed.lean` 9cab6b974ae27e78, `Lower/Moment.lean` 589ca2ed467e6768, `LowerAnalytic/WitnessCap.lean`
39e0cb9ee12ff311.

Inputs (copied read-only from `big:/root/claude-b9ee-capsnu2/` into `input/`; the hashes agree with big's files):

| file | SHA-256 |
|---|---|
| `stein/rows_direct/spec/cert_mass_0.5.json` | `7ab9cff3bf100fb2a4856db95dd4300e793bd052731c0c5559fe84da290213ce` |
| `stein/rows_direct/spec/cert_row_0.4b.json` | `f2d0d1caefde99386a59cbe6ecb50022a8ad5f59b463b5d6411c764a895400e8` |
| `stein/rows_direct/spec/cert_row_0.6.json` | `6a542f9aefa70b26397f1218ab7335918d8c6f68d376c46d25b298968d52239f` |
| `s0c/tables_v2/table_0.4.json` (= `stein/rows_small/table_0.4_v2.json`, named in the certificate) | `a6f2848143fa4677a173187a88ded5d5c9ffb8ee4ca68c67dd461380d256791d` |
| `stein/rows_small/table_0.6_ext.json` | `0cc0a3534d309e565d4ebf53e34cb69e2a38cafb69436040cd145bc4530f9113` |
| `stein/rows_direct/spec/cert_mass_0.5_pruned.json` | `f3fe6535d0ae45a05907d103d327c12cd53180604ee2a57f73159d8c70999f28` |
| `stein/rows_direct/spec/cert_row_0.4b_pruned.json` | `cd3c2e5297802e5a4a89b2197c32537ec512ffc46172a3cdb939777cc118f300` |
| `stein/rows_direct/spec/cert_row_0.6_pruned.json` | `7f6efa7eb63adcf5368e3c019526f336773b3163c54461440569f60178463819` |
| `final/ROW_CONSTANTS.txt` | `791764065ab82e375bd4b935c53d34bbfe5d7007848761c9e9ff798f0ec4559f` |

## 1. What a spectral node certifies (from the Lean definitions)

**Data.** A mesh `vs = [v₁, …, v_K]` with 0 < v₁ < … < v_K (`meshOK 0 vs`), knots t_k = v_k². Knot values
z = (z₀, …, z_{K−1}); φ is the continuous piecewise-linear function with φ(t_k) = z_k for k < K, φ(t_K) = 0 and φ = 0
on [t_K, ∞), and Φ(u) = ∫₀ᵘ φ (`cutCells`: on mesh cell k, φ = A + Bu and Φ = e₀ + Au + (B/2)u²). Parameters
λ > 0, μ > 0, ν ≥ 0, t, β. The **spectral cut** (`specCellG`, `specG`):

  G(u) = f²/λ + g²/μ + Φ(u) − φ(u) + (ν/3 − 2t)(u² − 2),  f = −(φ + β)/2 + (2t + λ/3)u,
  g = −(φ − Φ/u)/2 + (t + μ/3 − ν/2)u  (φ − Φ/u read as 0 at u = 0).

A majorant y = `MPoly` (a₀, a₁, a₂, a₄, a₆), y(v) = a₀ + a₁v + a₂v² + a₄v⁴ + a₆v⁶ (the certificate stores
[y0, y1, y2, y3, y4] = [a₀, a₂, a₄, a₆, a₁]). A table of node caps (r_k, c_k), r₀ = 0 < r₁ < …, and a slope `smax`.
`CapsHold Ψ table smax` means: Ψ convex on [0, ∞), Ψ(r_k) ≤ c_k, and Ψ(s′) ≤ Ψ(s) + smax(s′ − s) for 0 ≤ s ≤ s′.

**The pointwise statement** (`checkSWit table smax vs w` with `w.bud = .sep`; soundness `checkSWit_sound`, through
`major_sound`, `sweep_sound`, `specG_cell`, `posCert_sound`, `posOn_sound`, `tailOn_sound`). If λ > 0, μ > 0, ν ≥ 0,
a₁ ≥ 0, a₆ ≥ 0 and `sweepTop τ smax y.list (specPolys vs z λ μ t β ν) vs table` holds, then for every Ψ with
`CapsHold Ψ table smax`:

  (N)  Ψ(τv) + G(v²) ≤ y(v)  for every v ≥ 0.

The sweep walks through the common refinement of the mesh {v_k} and the abscissae {r_k/τ}. On a piece it bounds
Ψ(τv) by the chord of the two table nodes around τv (convexity) and beyond the last node by the line of slope smax
(Lipschitz), and certifies v^sh·(y(v) − c₀ − c₁v) − v^sh·G(v²) ≥ 0, a polynomial of degree ≤ 10 (`pieceP`; sh = 0 on
the first mesh cell, 4 elsewhere; `specPolyV` is v^sh·G(v²) on the cell), by the Bernstein criterion `posCert` in
integer arithmetic with up to 9 bisections (`posOn`), and on the last piece [r_last/τ, ∞) by Taylor coefficients
with up to 16 doublings (`tailOn`). The sweep requires r_last/τ ≥ v_K (all mesh points passed before the last node).

**The law statement** (`TB.specNode`, `node_fn_of_cut`, `moment_poly`, `MPoly.J_endpoint`). For every probability
space and U ≥ 0 with `Moments μ U x` (E U = 1, E U² = 2 + x² with 0 ≤ x ≤ 31/4, E U³ ≤ 6 + 9x² + C₆x³,
E√U ≤ ρ = 973612157/10⁹) and `SteinCut μ U` (its field `spec`: E G(U) ≥ 0 for every such cut), (N) at v = √U and
integration give

  E Ψ(τ√U) ≤ E y(√U) − E G(U) ≤ a₀ + ρa₁ + a₂ + a₄(2 + x²) + a₆(6 + 9x² + C₆x³) = `y.J 0 1 x`,

using a₁ ≥ 0 for E√U ≤ ρ and a₆ ≥ 0 for the bound on E U³. On an x-cell [x_lo, x_hi] ⊂ [0, ∞) the maximum over x is
at an end (a₆ ≥ 0): V := max(y.J(x_lo), y.J(x_hi)) (`nodeW`).

## 2. From nodes to the row bound

**A cell** [x_lo, x_hi] carries σ-nodes 0 = σ₀ < σ₁ < … < σ_m with σ_m ≥ δρ. The node σ₀ = 0 is not stored: its
value is V₀ = c₀, because Ψ(0) ≤ c₀ (`TB.zero`, the first table node has r₀ = 0). For σ ∈ [σ_i, σ_{i+1}], convexity of
σ ↦ Ψ(σ√U(ω)) for every ω gives E Ψ(σ√U) ≤ the chord of V_i and V_{i+1} (`TB.chord`), so

  E Ψ(σ√U) − κσ² ≤ chordMax(V_i, V_{i+1}, κ, σ_i, σ_{i+1})

(`chord_le_chordMax`: the exact maximum of a concave quadratic on an interval, endpoint or vertex). **A row**: x-cells
chained from 0 to ≥ 31/4. Hence, with cap := the maximum over cells and chords:

  (R)  for every law with `Moments` and `SteinCut`, every Ψ with `CapsHold Ψ table smax` and every σ ∈ [0, δρ]:
       E Ψ(σ√U) − κσ² ≤ cap.

This is `RowBound` of `Rows.lean`, with spectral nodes and the zero node in place of Stein nodes and moment rectangles.
Every step is a Lean lemma on master; the row-level check that assembles them for spectral nodes (the analogue of
`checkCell`/`cell_sound`/`rowBound_of_check`) is not in Lean yet. My checker implements that assembly as just
described.

**Cap rows (0.4, 0.6).** The node-cap tables cap Ψ − capPad, capPad = 10⁻¹¹ (the convention of the tables, as in the
hypotheses `CapsHold (Ψ − capPad)` of `Mixed.lean`), so (R) gives E Ψ(σ√U) − κσ² ≤ cap + 10⁻¹¹. The row constant is
C = 2β²/ε̂ + cap + 10⁻¹¹ and the bound at t₀ is t₀² − 2ℓt₀ + C. That (R) for these tables and these (ℓ, β, δ, κ, E, R, b)
gives the row inequality V̂ ≤ t² − 2ℓt + C − ε̂‖Qh + (β/ε̂)v‖² is the row reduction (hypothesis H1) and the node caps
(H2); neither is part of this check (§5).

**Mass row.** Ψ(s) = φ_c(s/δ) with δ = 3/4, c = 2ν̂ + λ = 2141/3906, φ_c(r) = ε̂²r²/c for r ≤ c/ε̂ and 2ε̂r − c beyond,
and the certificate's σ is σ′ = δσ. `CapsHold Ψ table smax` holds: φ_c is convex (its derivative 2ε̂²r/c, then 2ε̂, is
nondecreasing and continuous at c/ε̂, where both pieces equal c), its slope is at most 2ε̂, so Ψ is (2ε̂/δ)-Lipschitz with
2ε̂/δ = 200/93 ≤ smax = 2151/1000, and the caps were checked exactly: c_k ≥ φ_c(r_k/δ) at all 136 table nodes. For
σ ∈ [0, ρ] put σ′ = δσ ∈ [0, δρ]; then Ψ(σ′√U) = φ_c(σ√U) and κσ′² = κδ²σ² ≤ ε̂σ², because κδ² ≤ ε̂ (checked:
ε̂/δ² − κ = 19/69750000000 > 0), so

  E φ_c(σ√U) − ε̂σ² ≤ E Ψ(σ′√U) − κσ′² ≤ cap  for every σ ∈ [0, ρ] and every admissible law.

So S(1/2) ≤ cap. No pad is needed for an explicit potential; the certificate's S is cap + 10⁻¹¹.

## 3. The three facts of the mass row (PROGRESS.md §7(e)), re-derived

Notation of `WitnessCap.lean`: for a unimodular pair (f, g), h = (f + g)/2, k = (f − g)/2, t = ‖P₁,₀h‖, Q = P₂,₁,
q = Qk, σ = ‖q‖, and `VhatOf` V̂ = t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂σ² − 2ν̂‖k‖², with Re⟪f, Tg⟫ = (1 − ν)V̂ + ν (`VOf_eq_hat`).
Let λ ≥ 0 and c = 2ν̂ + λ > 0.

1. **‖k‖² ≤ 1 − t².** ‖h‖² + ‖k‖² = 1 (`normSq_hOf_add_normSq_kOf`, parallelogram law), and t = ‖P₁,₀h‖ ≤ ‖h‖
   because P₁,₀ is an orthogonal projection. So ‖k‖² = 1 − ‖h‖² ≤ 1 − t². ✓
2. **The pointwise inequality.** For 0 ≤ y ≤ 1 and r ≥ 0: 2ε̂ry − cy² ≤ φ_c(r). If r ≤ c/ε̂:
   φ_c(r) − 2ε̂ry + cy² = c(y − ε̂r/c)² ≥ 0. If r ≥ c/ε̂: φ_c(r) − 2ε̂ry + cy² = 2ε̂r(1 − y) − c(1 − y²)
   = (1 − y)(2ε̂r − c(1 + y)) ≥ 0, since 2ε̂r ≥ 2c ≥ c(1 + y). (So φ_c(r) is exactly the maximum over y ∈ [0, 1].) ✓
3. **The law-layer bound.** E φ_c(σ√U) − ε̂σ² ≤ S(λ) for σ ∈ [0, ρ] and every law with `Moments` and `SteinCut`:
   this is what the certificate gives (§2), checked here for λ = 1/2.

**Assembly.** Q is an orthogonal projection, so Re⟪k, Qk⟫ = ‖Qk‖² = σ², and Re⟪k, q⟫ = ∫ Re(conj(k(x))·q(x)) dγ. Hence

  ε̂σ² − c‖k‖² = ∫ [2ε̂ Re(conj(k)q) − c|k|²] dγ − ε̂σ² ≤ ∫ [2ε̂|q||k| − c|k|²] dγ − ε̂σ² ≤ ∫ φ_c(|q|) dγ − ε̂σ²,

by Re(conj(a)b) ≤ |a||b| and fact 2 with y = |k(x)| ≤ 1 (`norm_kOf_le`, a.e.) and r = |q(x)|. For σ > 0,
U = |q|²/σ² has |q| = σ√U, so ∫φ_c(|q|) dγ − ε̂σ² = E φ_c(σ√U) − ε̂σ² ≤ S(λ) by fact 3, since σ ≤ ρ
(`normQk_le_rho`) and U satisfies `Moments` and `SteinCut` (Lean theorems for the law of a normalised cubic, through
`exists_wick_repr`, `gaussian_moments`, `gaussian_gramInputs`, `steinCut_of_inputs`, as PROGRESS.md §7(b) says; I
checked that these names exist on master, not their exposure for q = `QkOf`). For σ = 0 the bracket is φ_c(0) = 0, and
cap ≥ 0 anyway (the first chord starts at the zero node, value c₀ = 0). With fact 1 and λ ≥ 0,

  ε̂σ² − 2ν̂‖k‖² = (ε̂σ² − c‖k‖²) + λ‖k‖² ≤ S(λ) + λ(1 − t²),

and dropping −‖Pk‖² ≤ 0:

  **V̂ ≤ (1 − λ)t² + λ + S(λ) − ε̂‖Qh‖².** ✓

Integrability: φ_c(r) ≤ 2ε̂r and q ∈ L². For λ > 0 and every ℓ, (1 − λ)t² ≤ t² − 2ℓt + ℓ²/λ
(λt² − 2ℓt + ℓ²/λ = (√λ t − ℓ/√λ)² ≥ 0), so the mass row is the ordinary row (ℓ, 0, λ + S + ℓ²/λ), tangent at
t = ℓ/λ, with the retained square −ε̂‖Qh‖² untouched. The five tangent rows of `final/recheck/rows_mass_0.5.json`
satisfy C = λ + S + ℓ²/λ exactly (checked).

## 4. Method

- **`speccheck.py`** transcribes, function by function, `addLq`, `negL`, `shiftUp`, `shiftS`, `commonDen`, `posCert`
  (integer arithmetic, the head test and the reversed shifted list), `posOn` (depth 9), `shiftL`, `taylorNonneg`,
  `tailOn` (16 doublings, `posOn` depth 7), `cutCells`/`cutAux`, `specPolyV`, `specPolys`, `shOf`, `pieceP`, `slope`,
  `nextStep`, `sweep`/`sweepTop` (the same pieces in the same order, the same fuel), `MPoly.list`, `MPoly.Jq`,
  `nodeW`, `quadVal`, `quadMax`, `chordMax`, `Sym3.psdOK`, `Sym2.psdOK`, `gatePrice`. Standard library only;
  every decision in Python integers or `fractions.Fraction`. It also checks the mesh (exact square roots, `meshOK`),
  the table (`nodesSorted`, `headZero`; for a cap row the SHA-256 and the nodes and caps of the table file; for the
  mass row c_k ≥ φ_c(r_k/δ), κ ≤ ε̂/δ², smax ≥ 2ε̂/δ), the x-chain and the σ-chains.
- **`test_speccheck.py`**: `shiftS` and `shiftL` equal literal transcriptions of the recursive Lean definitions (300
  and 200 random cases); `specPolyV` equals v^sh·G(v²) computed from the definition of `specCellG`, and `cutCells`
  equals φ and Φ computed independently, on 20 random meshes at 8 points of every cell; the positivity tests reproduce
  known signs; on 1500 random polynomials `posOn` never accepts what the Sturm method rejects.
- **`mutation_test.py`** (three nodes per row): lowering y₀ by twice the located minimum of the slack makes the node
  inequality false at an exactly evaluated point, and the checker rejects the node, in all nine cases.
- **`sturm_check.py`**: a second positivity method for every piece of every node: exact Sturm sequences (number of
  distinct real roots in the piece, sign at the ends; for the tail, at infinity). No Bernstein coefficients.
- `run_all.sh` runs everything; logs in `logs/`, one result file per row (`logs/result_*.json`: header checks, the
  per-cell maxima, the exact constants, timings).

## 5. Results, and what is not checked

**Both positivity methods accept every piece.** The Lean-replica check (Bernstein, Lean's depths) and the Sturm
check accept all 682,320 pieces of the 3405 nodes of the full certificates and all 103,718 pieces of the 520 nodes of
the pruned ones. No piece has a real root of the checked polynomial in its interval (Sturm count 0 everywhere), so
every node inequality holds strictly on every piece. No fallback decision was needed.

**The pruned certificates** (`*_pruned.json`, the files a Lean checker would read according to the format note) pass
both checks and give exactly the same maxima as the full ones, hence the same S and C. They contain the two
"repaired" nodes of the format note (mass row, cell 2, node 0, and row 0.6, cell 9, node 0, with y₀ on a long
denominator); both pass.

**Lean's own depths suffice.** The deepest bisection any piece needed is 7 (Lean's `posOn` in the sweep allows 9),
and no tail needed a doubling (every tail passes `taylorNonneg` at r_last/τ). So, if my transcription is faithful,
Lean's `checkSWit` as defined accepts every node of the three certificates. Bernstein tests: 279,363 + 231,366 +
296,926 `posCert` calls (pieces plus bisections).

**Where the maxima sit.** Mass row: x-cell [2.1, 2.15], chord σ′ ∈ [0.685, 0.69] (σ = 0.913…0.92). Row 0.4: x-cell
[0.8, 0.9], chord σ ∈ [0.55, 0.56]. Row 0.6: x-cell [0.1, 0.2], chord σ ∈ [0.46, 0.47].

**Header of the cap rows, as stated in `SPEC_CERT_FORMAT.md` §1(b)** (all hold, exactly): E ≻ 0,
E ⪰ diag(−1, ε̂, ε̂), R ≻ 0, R ⪰ diag(−1, ε̂), R ⪰ diag(ε̂, 0), 0 < δ < ε̂, ℓ ≥ 2β ≥ 0, N = E − diag(ε̂ − δ, 0, 0) ≻ 0,
0 < κ ≤ 1/δ − bᵀN⁻¹b, smax ≥ 2(|1 + b₁| + 0.7358|b₂| + 0.707107|b₃|); also the gate of Lean's `checkRow` with ε̂ for ε
(`gateOK N`, κδ² ≤ δ + gatePrice(N, δb)). These belong to the row reduction and to the potential; I checked the
arithmetic, not their derivation (the constants 0.7358 and 0.707107 in particular).

**Disagreements with the certificate files: none that changes a number.**
1. The 12-digit decimals of PROGRESS.md and of the format note are rounded: the exact bounds are
   0.6897807577373452… (row 0.4) and 0.6939713830180672… (row 0.6), above the printed 0.689780757737 and
   0.693971383018 by 3.5·10⁻¹³ and 6.7·10⁻¹⁴. The envelope does not use the decimals: `ROW_CONSTANTS.txt` and
   `final/recheck/rows_row_*.json` carry the exact C, which equals mine.
2. The mass row's S contains capPad, which an explicit potential does not need: S(1/2) ≤ S − 10⁻¹¹. Harmless.
3. `cert_row_0.4b.json` names its table `stein/rows_small/table_0.4_v2.json`, PROGRESS.md names
   `s0c/tables_v2/table_0.4.json`; both files exist on big with the SHA-256 recorded in the certificate.
4. The format note describes the verifier's Bernstein subdivision as "depth ≤ 7" and its tail as Taylor coefficients
   only; that matches what was needed here (depth 7, no doubling), within Lean's limits.

**Not checked here** (each is a separate hypothesis or input of the envelope):
- the node caps of the tables 0.4 and 0.6 (hypothesis H2; replayed separately by the replay worker), and the
  Lipschitz constants smax of those potentials;
- the row reduction of the tail witness for the cap rows (hypothesis H1: the retained square, the gates);
- the law facts `Moments` and `SteinCut` for U = |Qk|²/‖Qk‖² (Lean theorems according to PROGRESS.md §7(b));
- the envelope (`final/env_final_clean.json`) and the direct row (not used by the envelope);
- the bisection-depth claim depends on the faithfulness of my transcription; Lean itself has not run these nodes.

## 6. Run times (laptop, one process)

| step | time |
|---|---|
| self-tests (`test_speccheck.py`) | 0.4 s |
| exact check, mass row / row 0.4 / row 0.6 | 15 s / 13 s / 17 s |
| mutation tests, three rows | about 6 s in all |
| Sturm check, mass row / row 0.4 / row 0.6 | 289 s / 250 s / 334 s |
| pruned files: exact check / Sturm check | 2–3 s / 38–47 s each |

Whole run 01:25:35–01:43:18 (`logs/run_all.log`, `logs/run_pruned.log`), one Python process at a time, laptop load
4–8 from other work.
