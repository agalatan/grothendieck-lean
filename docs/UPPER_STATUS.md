# Upper bound: formalisation status and next steps (cold-start notes)

The sharper conditional upper bound is described below. The independent hypothesis-free
route now proves `Grothe.haagerup_bound : IsGrothendieckBound (1404909409/1000000000)`.
Its polynomial resolvent, complete residual and signed infinite tail are documented in
`docs/HAAGERUP_POWER.md`;
that theorem does not require any of the analytic inputs listed here.

Build only changed modules locally. Run full builds on the droplet (`ssh yo`) or in CI;
see `AGENTS.md` for worktree and delivery rules.

The combined tree includes the concrete rounder, the phase cover, the refined
Hardy tail and the holomorphic-kernel definitions. Use an owned worktree and
an owned droplet directory for builds; the shared package cache can be read
without copying it. Use targeted module builds; full builds run on the droplet or in CI.

## 1. What is proved

Headline `Grothe.UpperChaos.fresh_upper_rounder` (`Grothe/UpperChaos/PhiBound.lean`):

    K_G^ℂ ≤ 500000000000000000/355973699864771491  (< 1.404598149218)

for the concrete rounding `GT` (smoothed `F₀·P₃(φ)` built from `Grothe/Upper/Data.lean`), assuming only

* `ComparisonInputs`: the exact spectrally supported Gaussian error decomposition and inherited component norm caps; Lean derives its weighted selected-head energy comparison (with coefficient costs proved from the preprocessors),
* `energy_close`: `Σ_{n+3m≤501} |energy X − energyTable| ≤ energyErrQ`,
* `hardy`: `Σ_{n<J} kernelCoeff(energy GT)_n² (4149/4000)^{2(2n+1)} ≤ 7/4`,

for some charge-one `X ∈ L²(gaussC ⊗ gaussC)` (the smoothed truncation of `F₀ + v`; its correction vector `v` lives
in `handoff/upper-residual/global_norm/frozen_taylor_correction_D201.npz`, not in Lean).
Axioms: standard + `head_check` + `comparison_check` + `phi_cover_check_0`–`5` (native). The structural fields of the old
`DirectHyps` (`valid`, `summable`, `summableX`, `parityX`) and `|P₃(φ)| ≤ 1` (via `phi_abs_lt_one : |φ| < 1`)
are theorems.  Module map (all in `Grothe/UpperChaos/`):

| module | content |
|---|---|
| TaylorPhase | `|P₃(x)|² = 1 − x⁴(3−x²)/36` |
| ComplexMoments, ComplexHermite, Mehler, Completeness, HermiteComplete, HermiteBasis, Charge | one complex coordinate: moments, Hermite orthogonality, Mehler (polynomials), completeness (`poly_complete`), Hilbert basis, charge selection |
| GaussC2, HermiteC2, HermiteC2Basis | ℂ²: `gaussC ⊗ gaussC` = image of std Gaussian on ℝ⁴, tensor Hermite basis, Parseval |
| LawY, MehlerL2 | law of ρX + σW, Mehler for L² functions on ℂ² (`mehler_L2`) |
| Energy2, Kernel2 | energies by bidegree, parity, kernel = `radialKernel (bivarKernel P Q (energy G))` |
| Realise2, Structural | two-channel Gaussian rounding ⇒ `DiskKernel`; `structural_fields`, `fresh_upper_of_rounding` |
| Rounder | `vprof`, `F0`, `phiT`, `Tround`, `GT`; measurable, charge one, disk-valued under `PhiBound` |
| PhiHorner, PhiDense, PhiCover, PhiCoverData, PhiCoverCheck0–5, PhiCoverCheck, PhiBound | phase cover `φ² ≤ 99/100`, `|φ| < 1` (checker `GrotheKernel/PhiCheck.lean`, generator `tools/gen_phi_abs_cover.py`, data `data/phi-abs-cover/trees.json`) |
| HardyKernel | holomorphic Gaussian kernel and certificate covariance definitions; no discharge of `hardy` yet |

The sharper tail reserves the linear coefficient's weighted square from the
same `7/4` budget before Cauchy–Schwarz (`hardy_budget_after_linear`,
`linear_lower`, `tail_le`). It changes no numerical premise. The complete
endpoint for the preceding preprocessors passed the full build and axiom audit in
[run 39901871873](https://github.com/agalatan/grothendieck-lean/actions/runs/39901871873);
the current degree-41/15 preprocessors come from `data/upper-preprocess/`.
The current exact arithmetic and generated data replay pass. Full merged-tree
Lean validation is delegated to branch CI. Earlier targeted receipts were cleared
before collection and are not current build evidence. The explicit gap and source
guards are in `data/upper-preprocess/verification/`. `HardyKernel` does not
discharge the numerical Hardy premise.

## 2. `|φ| < 1` (input of the inherited coefficient-error argument)

The Gaussian component-error enclosures are external; their source proof uses `|φ| < 1` (operator norm of
multiplication by iφ). sup|φ| ≈ 0.96725 (float search), so the margin is ~3%.  Rigorous external
certificate: `handoff/upper-residual/phi-cover/phi_cover_exact.py` (python-flint, exact integer Taylor
shifts + arb; run on the droplet `~/grothe-cx/venv/bin/python phi_cover_exact.py phase.json 98/100 8`),
log `phi_cover_exact.log` in the same folder.  Model per box: exact Taylor shift of S, first-order
model of the exponential (`P1 = S(1 − ε(hU+hV))` exact, remainder `(ε rs)²/2 e^{ε rs}`), quadratic bound for
UV − W², arb for exp.

**§2a Result (2026-10-23): |φ| < 0.98995 everywhere.** U+V < 60: φ² < 0.98 on all 149,433 leaves
(296,888 evaluated boxes, max leaf bound 0.979999754, 3115 s on 8 processes); U+V ≥ 60: |φ| ≤ 0.0559.
The script, log and README are in `handoff/upper-residual/phi-cover/` (git-ignored; the main checkout of
the user's laptop) — the script is reproduced verbatim in `tools/phi_cover_exact.py` on this branch.

**§2b In Lean (2026-10-26): `phi_abs_lt_one : ∀ u, |phiT u| < 1`** from `phiT_sq_le : φ² ≤ 99/100`.
Leaf test (`GrotheKernel.leafOK`): either the exponential at the lower corner with `|S| ≤ |B|_r`, or the
first-order model `e^{−ε h} S = S(1 − ε h) + S R`, `|R| ≤ a²/2 + 2a³/9` (`Real.exp_bound`, n = 3), with the
exponential at the centre bounded by `(10⁹/2718281828)^n · 720 den⁶/T₆(f)`; `UV − W²` bounded by a corner and
a centre formula. The root box is split into 512 cubes (`phiSplit`), each with its own tree; 119,077 checked
leaves; six single-threaded native facts `phi_cover_check_0`–`5` (the cube containing the maximiser holds 76,004
leaves, ≈ 12 min; the others ≤ 3 min). Far field `U + V ≥ 60`: `|φ| ≤ 1/10` (`far_sound`). This replaces the
earlier `φ² ≤ 3` cover.

## 3. `hardy` (N4) — plan and progress

Source certificate: `tools/verify_upper_hardy.py`, with the full current preprocessing,
contour data and analytic input in `data/upper-preprocess/` (see its README). Kernel `H(t) = Σ_j h_j t^{2j+1}`, `h = kernelCoeff(energy GT)`.
Lean route (detailed in PLAN_UPPER.md §6f):

1. **Holomorphic continuation (next).** For complex symmetric 2×2 `R` with `I ± Re R ≻ 0` define
   `H(R) = ∫∫ T(x + iξ) conj T(y + iη) k_R(x,y) k_R(ξ,η)` (real 2-vectors), with the holomorphic Gaussian
   density `k_R(x,y) = (2π)^{-2} det(I−R²)^{-1/2} exp(−xᵀAx/2 − yᵀAy/2 + xᵀCy)`, `A = (I−R²)^{-1}`, `C = RA`;
   the product of the two copies carries `det(I−R²)^{-1}`, so no square-root branch is needed. Steps:
   (a) define `k_R` and prove integrability/holomorphy in `t` of `H(R'(t))`, `R'(t) = M diag(p(t), −τ(t)) M`,
   on a neighbourhood of `|t| ≤ 4149/4000` where `I ± Re R'(t) ≻ 0` (the arb certificate checks this per arc);
   (b) for real `t ∈ (−1, 1)`, `H(R'(t)) = E[conj GT(X) GT(Y)]` with diagonal correlations (Gaussian
   functoriality: smoothing by M ⇔ cross covariance M diag M) `= Σ_j h_j t^{2j+1}` (`Bm_polyKernel`);
   (c) identity theorem ⇒ the Taylor series of `H(R'(·))` at 0 is `Σ h_j t^{2j+1}`, convergent on the disc.
2. Parseval on the circle: `Σ |h_j|² r^{2(2j+1)} = (1/2π)∫|H(re^{iθ})|² dθ`.
3. Gaussian Schur lemma `|H(R)|² ≤ 1/[64 j⁴ |det(I−R²)|² det Z det W]` (operator norm of the kernel on L²).
4. Precompiled checker over the arcs (rational enclosures of cos/sin, 2×2 matrix arithmetic).
Progress (claude/hardy, 26 Oct):
- Definitions: `Grothe/UpperChaos/HardyKernel.lean` (`Sym2C`, `detIm`, `Amat`, `Cmat`, `kExp`, `kHol`, `Hhol`, `Rt`).
- **1(a) holomorphy — proved.** `HolIntegral.lean`: `differentiableOn_integral_exp` (a parametric integral
  `∫ c(q) g(t) exp(∑ₖ αₖ(t) mₖ(q))` with holomorphic `g, αₖ`, `‖c‖ ≤ 1`, `|mₖ| ≤ N` and pointwise decay
  `Re ≤ −λN` is holomorphic). `HardyHolo.lean`: `KerPos R λ` (real part of the 4×4 form
  `[[A, −C], [−C, A]]` dominates `λ|·|²`), `detIm_ne_zero_of_kerPos`, `kExp_add_eq_sum` (six coefficients ×
  six real quadratic weights), Gaussian integrability on `ℝ⁸`, and **`differentiableOn_Hhol_Rt`**: on any open set
  where `KerPos (Rt t) λ` holds for some `λ > 0`, `t ↦ Hhol (Rt t)` is holomorphic.
- **1(c)–(d) continuation — proved.** `OddSeries.lean`: `hasSum_odd_of_eqOn_real` (holomorphic on the disc of radius
  `r > 1` and equal to `∑ hⱼ t^{2j+1}` for real `0 < t < 1` ⇒ the series converges to `f` on the whole disc;
  identity theorem + uniqueness of power series), `summable_abs_of_hasSum_ball`.
- **2 Parseval — proved.** `OddParseval.lean`: `hasSum_parseval_odd`
  (`∑ 2π hⱼ² ρ^{2(2j+1)} = ∫₀^{2π} |f(ρe^{iθ})|²`), `sum_sq_le_of_mean_le` (the exact shape of `hardy`).
- **Assembly:** `hardy_of_inputs` (`HardyHolo.lean`) proves the `hardy` statement from three explicit inputs:
  (region) `KerPos (Rt t) λ`, `λ > 0`, on a disc of radius `r > 4149/4000`;
  (real identification, step 1(b)) `HasSum (hⱼ t^{2j+1}) (Hhol (Rt t))` for real `0 < t < 1`;
  (circle) the mean of `|Hhol (Rt z)|²` over `‖z‖ = 4149/4000` is `≤ 7/4`.
- **Separate responses:** `HholPair F G R` defines the continued correlation
  for independent left/right functions. `differentiableOn_HholPair_Rt`
  proves holomorphy for any measurable disk-valued pair on the same decay
  region; charge and conjugation symmetry are unnecessary for this step.
  `hardy_of_pair_inputs` assembles the weighted-square bound from that
  region, a real odd-series identification for the pair, and its circle
  mean bound. The incumbent results specialize these proofs without changing
  their statements. The written Schur inequality in
  `data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md` has universal
  disk-valued pair scope, now formalized by the Schur bound below. The
  Gaussian identification remains open. Reusing a numerical contour cover also
  requires matching its actual smoothing and preprocessing data.
- **3 Gaussian Schur bound — proved** (`claude/hardy-2`). `SchurMain.norm_HholPair_sq_le`: for `B = A − jI`
  (`j > 0`), `Z = Re B`, `T = Z − Cr Z⁻¹ Cr`, `E = (Cr Z⁻¹ Cr + Ci Z⁻¹ Ci)/2`, `W = 2T + E`, under the gates
  `Z ≻ 0`, `T ≻ 0`: `‖HholPair F G R‖² ≤ 1/(64 j⁴ |det(I − R²)|² det Z det W)` for all measurable `‖F‖, ‖G‖ ≤ 1`
  (bound (1) of `GAUSSIAN_SCHUR_TAIL_PROOF.md`; the gates `Z ± Cr ≻ 0` there are equivalent to `Z ≻ 0, T ≻ 0`).
  Tools: `Gauss2` (2-D Gaussian integrals with complex linear term), `SchurTest` (weighted Schur test),
  `LstarL` (the `L*L` identity), `Sym2R` (2×2 forms; the weight inequality by a square-root-free identity),
  `SchurKernel` (exact `‖M₁‖`), `SchurBound` (ℝ⁴ factorization and Schur), `SchurIntegrability`.
- **Remaining:**
  1(b) the real identification: for real `R`, `kHol R` is the density of the Gaussian pair with cross covariance
  `R` (two real copies), and smoothing by `M`, `N` turns `E[conj GT(X) GT(Y)]` (diagonal correlations
  `p(t), −τ(t)`) into `Hhol (Rt t)`; then `Bm_polyKernel` gives the series with `h = kernelCoeff (energy GT)`.
  This needs Gaussian-law identification on `ℝ⁸` (density ↔ covariance, pushforward by linear maps) — the largest
  remaining piece. 4: the region and circle inputs from the certificate — a precompiled exact checker over the 65,594 arcs (`KerPos` per arc via `I ± Re R ≻ 0`).

## 4. Other open items

* The Gaussian identification and norm bounds in `ComparisonInputs`, and
  `energy_close`, stay external (verified-quadrature projects). Lean derives
  the selected energy comparison from those inputs.
  The second, fourth and sixth phase moments are now exactly reproducible
  from the Lean phase data; see the continuation's
  [MOMENTS.md](../handoff/research-third-decimal/needle-20261023/MOMENTS.md).
  The other Hermite-tail and coefficient inputs are still separate obligations.
* The refined lower endpoint is `1.401697049825`, conditional on the same
  `NodeCaps`, through `Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data`.
  The separate `GrotheCaps` target now has a matching stamp for its 60 range
  facts; the four remaining rows still require `CapsRest`.

## 5. `ComparisonInputs`: formalisation plan

*Issue #20. Written from the master sources (`Grothe/UpperChaos/LocalizedComparison.lean`,
`Grothe/Upper/ComparisonData.lean`, `data/localized-comparison/{recipe.json,PROOF.md}`,
`docs/localized-comparison.tex`) and the inherited certificate (laptop archive
`handoff/upper-residual/global_norm/`: `MIXED_TAYLOR_CUTOFF_LEMMA.md`, `GAUSSIAN_POLYNOMIAL_NORM.md`,
`certify_taylor_comparison.py`, `taylor_comparison_result.json`). It is a plan; nothing below is implemented.*

### 5.1 What the hypothesis says

```lean
structure ComparisonInputs (G X : Lp ℂ 2 mu2) where
  piece      : ComparisonIndex → Lp ℂ 2 mu2                         -- 18 pieces
  difference : G - X = ∑ j, piece j
  norm_le    : ∀ j, ‖piece j‖ ≤ (comparisonBand j).error
  support    : ∀ j p, (comparisonBand j).contains p.1 p.2 = false → energy (piece j) p = 0
```

Lean already proves everything downstream of it:
- `localized_comparison` (the band inequality, Cauchy–Schwarz per band, quadratic error paid once);
- the radii `A_r` from the stored table with `energy_close`;
- the cost weights;
- the budget `C = 13311891/15625·10⁹`.

So the hypothesis is exactly three facts about one explicit decomposition of G_T − X:

1. an algebraic identity;
2. degree supports;
3. 18 rational norm bounds.

### 5.2 Where the 18 pieces come from

Write `B = ·iφ` and `T = F₀ + BF₀ + B²F₀/2 + B³F₀/6`, `X_raw = F₀ + v`.

- **The approximants:** an inherited arb certificate supplies finite Hermite vectors `c_j` (dyadic data), with cutoffs
  `D_j = 181, 91, 51`.
- **The pieces:**
  - for each Taylor power j, the band pieces `P_I(B^jF₀ − c_j)/j!`;
  - the high tail `P_{>D_j}(B^jF₀)/j!`;
  - the rounding piece `Σ_j c_j/j! − v`.
- **Smoothing:** the pieces are smoothed like G_T and X. Smoothing contracts L² and preserves total degree.

The norm bounds:
- **Finite bands:** `ε_{j,I} = 1/(25·10⁹) + (11/500)·HS_{j,I} + 10⁻¹⁸`.
  - `1/(25·10⁹)` is the arb quadrature error of the coefficients of `B^jF₀`.
  - `HS` is a rectangular weighted-Bargmann Hilbert–Schmidt bound for the omitted inputs.
  - The propagation through `B^j` uses `|φ| < 1` (operator norm ≤ 1; issue #19).
- **High tails:** `t_j² ≤ E φ^{2j} − Σ_I max(0, ‖P_I c_j‖ − ε_{j,I})²`.
  - This uses `|F₀| = 1`, orthogonality and the reverse triangle inequality.
  - `E φ^{2j}` is an exact Gaussian moment of a damped polynomial.
- **Rounding:** `‖Σ c_j/j! − v‖ ≤ 10⁻¹⁸`, checked against the frozen `v` (degree 201).

### 5.3 Who carries the residual

The decomposition shares below use the raw weighted-comparison residual
458437859009/(5·10¹⁷), before the forced linear-coefficient Hardy deduction.
The active refined residual is 455308278509/(5·10¹⁷); its comparison pieces are
identical. Each share below is the term 2·A_r·e_r divided by the raw residual;
the quadratic term (Σe_r)² is 0.01%.

| piece | e_r | A_r | share of residual |
|---|---|---|---|
| power 1, **high tail** (>181) | 7.28e-6 | 0.0394 | **62.51%** |
| power 2, **high tail** (>91) | 1.16e-6 | 0.0650 | **16.43%** |
| power 3, **high tail** (>51) | 3.55e-7 | 0.0915 | **7.09%** |
| power 1, bands 101–181 | 1.2e-8 … 1.5e-6 | 0.013–0.040 | 5.52% |
| power 2, bands 51–91 | 6e-9 … 1.1e-7 | 0.026–0.051 | 0.87% |
| power 3, bands 11–51 | 6e-11 … 2.5e-8 | 0.08–0.14 | 0.43% |
| low bands [0,51) (A ≈ 1) and rounding | ≤ 1.9e-10 | ≈ 1 | 0.05% |

**86% of the residual is the three high tails.** The low bands are tiny, but only because their coefficients are
known to about 10⁻¹¹: their `A_r ≈ 1` makes any looser bound expensive.

### 5.4 Each field: classification and how to prove it

| field / item | kind | Lean route | cost |
|---|---|---|---|
| `difference` | exact algebra, once the objects exist | define `c_j`, `v`, the 18 pieces and a concrete X = smoothing(F₀ + v) in Lean (`c_j` and `v` as generated data: about 260k + 35k + 6.6k + 354k dyadic coefficients); Taylor identity `F₀·P₃(φ) = T`; linearity of the smoothing | 2–4 w (data plumbing; overlaps #21, concrete X) |
| `support` | structural | `P_I`/`P_{>D}` are degree projections (Hermite basis `Grothe/UpperChaos/HermiteC2Basis.lean`); smoothing preserves total degree (Mehler, `mehler_L2`) | 1 w |
| `norm_le`, rounding piece | finite exact | single-threaded native check of `‖Σ c_j/j! − v‖² ≤ 10⁻³⁶` over the data | 2–3 d |
| `E φ^{2j}` (in the tails) | finite exact | the Laguerre-dilation formula (GAUSSIAN_POLYNOMIAL_NORM.md, eq. (4)): finite rational sums, exactly as `arb_norm.c` does | 1–2 w |
| `‖P_I c_j‖` (in the tails) | finite exact | sums of squares of the data | days |
| `HS_{j,I}` (omitted inputs) | finite exact | rectangular Hilbert–Schmidt bound in Laguerre form (finite Wick identity); exact rational check | 2 w |
| `1/(25·10⁹)`: coefficient enclosures of `B^jF₀ = iʲφʲF₀` | **analytic: verified integration** | rigorous Gaussian integrals of a phase function times polynomials. No Lean infrastructure exists for this; it needs interval Taylor-model integration | months |
| propagation through `B^j` | analytic, small | `|φ| < 1` (#19) ⇒ `‖B^j‖ ≤ 1` | with #19 |

Everything except the coefficient enclosures is a finite exact computation, or structural.

### 5.5 A cheaper route for the tails (86% of the residual)

Since `c_j` is supported in degree ≤ D_j, `P_{>D_j}(B^jF₀) = P_{>D_j}(B^jF₀ − c_j)`, hence

```
t_j ≤ ‖B^jF₀ − c_j‖,   ‖B^jF₀ − c_j‖² = E φ^{2j} − 2 Re⟨c_j, B^jF₀⟩ + ‖c_j‖².
```

- **What it needs:** `E φ^{2j}` and `‖c_j‖²` are finite and exact (§5.4). Only one integral per power remains,
  `I_j = ⟨c_j, φʲF₀⟩`, instead of all coefficients up to D_j.
- **Accuracy:** about 5·10⁻¹² absolute for j = 1 (t₁² ≈ 5.3·10⁻¹¹).
- **Cost in bound:** the new bound also contains the low-band errors (`t₁² + Σ_I ε_I²`), so the power-1 tail grows by
  about 2% (7.28e-6 → 7.43e-6). That is about +1.3% of the residual, about +2·10⁻⁸ on K.
- **Feasibility:** `F₀ = phase(z + κ v(|z|²) w)` has closed-form angular Fourier modes (hypergeometric, as in the
  Step-20 evaluator). By rotation invariance, `I_j` reduces to a 2-dimensional integral over `(|z|, |w|)`, with a
  known singular curve `|z| = κ v(|z|²)|w|`.

**It does not help the band pieces.** Bounding a band piece by the whole error ‖B^jF₀ − c_j‖ (≈ 7·10⁻⁶) instead of
its own error raises 2·A_I·e_I to about 1.3·10⁻⁶ in total for power 1. That would undo the comparison's gain over
the global bound, so the bands still need per-coefficient enclosures. They need only about 10⁻¹¹ (power 1, degrees
101–181) to 10⁻⁹ precision, on about 150k coefficients.

### 5.6 Ranked plan

| step | content | turns into Lean | residual made formal |
|---|---|---|---|
| 1 | concrete objects: `c_j`, `v`, X, the 18 pieces; prove `difference` and `support` | identification of the decomposition | 0% (removes the "identification" trust; `ComparisonInputs` becomes 18 explicit numeric norm statements) |
| 2 | finite exact parts: rounding norm, `E φ^{2j}`, `‖P_I c_j‖`, HS bounds | all non-integral numbers | 0% alone, a prerequisite for 3 and 4 |
| 3 | design spike, then verified 2-D integration of `I_j` (tail route §5.5) | t₁, t₂, t₃ | **≈ 86%** (with about +1.3% looser residual) |
| 4 | per-coefficient enclosures for the bands (`φʲF₀` against Hermite functions, degrees ≤ 181/91/51) | ε_{j,I} | the remaining ≈ 7% |

**Timeline:**
- Steps 1–2: about 4–6 weeks of Lean, plus native checks of a few CPU-hours.
- Step 3: a 1–2 week spike to choose the integration method (interval Taylor models over the reduced 2-D domain,
  in `GrotheKernel`, single-threaded modules), then about 6–10 weeks.
- Step 4: months, and possibly not worth it. The bands carry 7%, and an alternative is to keep them as an isolated,
  replayed external certificate.

Until step 3 lands, the share of the residual that is proved does not move. Steps 1–2 make the statement explicit and
checkable, which is still worth doing first: they are cheap, and steps 3–4 build on them.

Follow-up tasks (sub-issues of epic #17): step 1 → #39, step 2 → #40, step 3 → #41.
