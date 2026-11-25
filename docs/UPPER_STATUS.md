# Upper bound: formalisation status and next steps (cold-start notes)

This file documents the older single-channel upper proof (`K_G^ℂ < 1.404599395362`), which is still in the tree. The upper bound of the main theorem `main_bounds` comes from the six-channel proof in `Grothe/UpperSix/` and `Grothe/UpperSixExact/` instead: Lean proves `K_G^ℂ ≤ 1.404556407` (`1404556407/1000000000`, `Grothe.UpperSix.constant_le`), and a separate estimate of the phase integral shows that this rational is strictly below Haagerup's value `1/γ†` (`constant_lt_inv_gammaDagger`). [Upper result](../Grothe/UpperResult.lean) · [Six-channel build and audit](../README.md#building).

## Earlier single-channel construction

The single-channel upper bound is **K_G^ℂ < 1.404599395362**, without
hypotheses: `Grothe.Statement.upper_below_tight` in
[`UpperTightFinal.lean`](../Grothe/UpperTightFinal.lean). The combined statement `main_bounds` in
[`MainResult.lean`](../Grothe/MainResult.lean) uses the six-channel bound instead.

The sharper target **K_G^ℂ < 1.404598149141** has only a conditional route,
archived in [`abandonware/`](../abandonware/README.md) and not built:
`fresh_upper_rounder` gives `K_G^ℂ ≤ 500000000000000000/355973699960428191 < 1.404598148840`
from fourteen original Gaussian finite-band error inequalities, which are not
all proved, and the energy-table discrepancy bound `6847009/(5·10^17)`, which
`Final.hclose_final` proves for the actual frozen response.

The single-channel proof uses six certified low-band and whole-source estimates,
tighter arithmetic budgets, and the Gaussian-amplitude Hardy bound (budget `117/100`) with a linear-energy
deduction. Its entrypoint is `upper_below_tight`, and the energy-table accuracy
`Final.hclose_final` is in [`UpperClose.lean`](../Grothe/UpperClose.lean). The generated root includes this proof alongside the six-channel proof used by
`MainResult.lean`. Alternative single-channel formulations are in [the committed archive](../miscellaneous/other-bounds/README.md)
and in [`abandonware/`](../abandonware/README.md).

Sections 1 and 4 describe this single-channel construction. Sections 2, 3 and 5 retain
construction history and the original sharper-target plan, with completed
steps identified. Their old costs, residual shares and proposed tolerances
are not the current theorem's budget or a schedule of remaining work.

Build only changed modules locally. Full builds, including all node caps, run
through the repository proof-check workflow; see `AGENTS.md` for worktree and delivery rules.

The combined tree includes the concrete rounder, the phase cover, the refined
Hardy tail and the holomorphic-kernel definitions. Use an owned worktree and
an owned directory for light droplet builds; the shared package cache can be read
without copying it. CI routes a full build to the droplet runner when no verified
cache matches the node-cap sources.

## 1. What is proved

### Single-channel assembly

`upper_below_tight` uses the same concrete rounding `GT` and accepted
production certificates through this chain:

1. `UpperTightPanelTotals` checks the actual panel-cap sums in Lean's kernel:
   `8·10^-15`, `16·10^-15`, and `1131·10^-15`. The accepted production shards
   give `TightTwist.remainder1/2/3`; each full quadrature allowance retains
   the existing `10^-15` tail and gap reserve.
2. `TightTwist.six_of_facts` in `UpperTightSix.lean` (namespace
   `Grothe.UpperQuad.TightTwist`) uses the original port-fact bundles,
   exact center energies, phase moments and dyadic table excursions to
   derive the three low-band and three whole-source error bounds.
3. `UpperTightComparison` combines those radii with tighter square-root
   ceilings for the same certified reference-band masses.
   `Final.hclose_final` supplies the actual energy-table accuracy.
4. `UpperHead` gives the finite kernel residual. `HeadHardy` deducts the
   forced linear coefficient's weighted square from the proved Hardy
   budget `117/100` at radius `4149/4000` (`HardyReal.hardy_GT_gaussian`,
   `UpperChaos/HardyGaussian.lean`: the Schur estimate that retains the
   Gaussian amplitude, with a certified quartic angular majorant and its exact
   circle average), giving tail `219549168/10^16`.
5. `UpperTightFinal` applies the transfer theorem with
   `tightResidualQ ≈ 1.5422479692227238e-6`. Its exact reciprocal `tightValueQ`
   is approximately `1.404599395361207`, strictly below `1.404599395362`.

The comparison allowance is approximately `1.4921263584047238e-6`; the
stored-table head allowance is `28153/10^12`, and the table allowance remains
`6847009/(5·10^17)`. No Gaussian or table-accuracy premise is left open in
this assembly. The tighter totals and budget arithmetic use kernel
reduction; the inherited native acceptance facts remain recorded in
[`data/axioms/native.txt`](../data/axioms/native.txt) and the theorem audit in
[`scratch/Axioms.lean`](../scratch/Axioms.lean).

### Module map

The structural fields of `DirectHyps` (`valid`, `summable`, `parityX`) and
`|P₃(φ)| ≤ 1` (via `phi_abs_lt_one : |φ| < 1`) are theorems. Modules, all in
`Grothe/UpperChaos/`:

| module | content |
|---|---|
| TaylorPhase | `|P₃(x)|² = 1 − x⁴(3−x²)/36` |
| ComplexMoments, ComplexHermite, Mehler, Completeness, HermiteComplete, HermiteBasis, Charge | one complex coordinate: moments, Hermite orthogonality, Mehler (polynomials), completeness (`poly_complete`), Hilbert basis, charge selection |
| ProductComplete, HermiteC2, HermiteC2Basis | ℂ²: tensor completeness by Fubini and one-coordinate completeness, tensor Hermite basis, Parseval |
| LawY, MehlerL2 | law of ρX + σW by product characteristic functions, Mehler for L² functions on ℂ² (`mehler_L2`) |
| Energy2, Kernel2 | energies by bidegree, parity, kernel = `radialKernel (bivarKernel P Q (energy G))` |
| Realise2, Structural | two-channel Gaussian rounding ⇒ `DiskKernel`; `structural_fields` |
| Rounder | `vprof`, `F0`, `phiT`, `Tround`, `GT`; measurable, charge one, disk-valued under `PhiBound` |
| PhiHorner, PhiDense, PhiCover, PhiCoverData, PhiCoverCheck0–5, PhiCoverCheck, PhiBound | phase cover `φ² ≤ 99/100`, `|φ| < 1` (checker `GrotheKernel/PhiCheck.lean`, generator `tools/gen_phi_abs_cover.py`, data `data/phi-abs-cover/trees.json`) |
| HardyKernel, HardyReal | holomorphic Gaussian kernel and certificate covariance definitions; `HardyReal.hreal_GT`, the real identification of the kernel of `GT` |
| HardyArcSound, HardyArcCircle, HardyArcData, HardyArcRegion, HardyArcRegionCheck, HardyArcCover | interval soundness of the precompiled checker `GrotheKernel/HardyArc.lean`, the circle charts, the checker data, the region of holomorphy (`hardy_region_check`), and the squared correlation `gF` on the circle |
| GaussianAmplitude, GaussianPair, SchurMainGaussian, HardyGaussianCheck, HardyGaussianFacts, HardyGaussianSound, HardyGaussian | the Schur estimate that retains the Gaussian amplitude, its exact check on the four closed halves of the two circle charts, and `HardyReal.hardy_GT_gaussian` (budget `117/100`), the Hardy input of `upper_below_tight` |

The endpoint reserves linear energy from the proved Hardy budget before
Cauchy–Schwarz: `HeadHardy` deducts it from the Gaussian-amplitude budget `117/100`
(`HardyReal.hardy_GT_gaussian`).
`HardyKernel` supplies definitions; the Gaussian-amplitude circle check and the
region check supply the proved numerical Hardy inputs.

For historical provenance, the endpoint with preceding preprocessors passed
[run 39901871873](https://github.com/agalatan/grothendieck-lean/actions/runs/39901871873).
That receipt is not evidence for the current source tree. The current degree-41/15
preprocessors come from `data/upper-preprocess/`; current build evidence is the
proof check of the exact branch or merged commit. Older gap and source guards
are retained in `miscellaneous/other-bounds/tree/data/upper-preprocess/verification/`.

## 2. `|φ| < 1`: proved input and construction history

The original sharper-target component-error argument uses `|φ| < 1` (operator norm of
multiplication by iφ). The following external experiments and October receipts
record how the phase cover was developed; the production Lean proof is §2b.
The float search gave sup|φ| ≈ 0.96725, a margin of about 3%. The external
certificate was: `handoff/upper-residual/phi-cover/phi_cover_exact.py` (python-flint, exact integer Taylor
shifts + arb; run on the droplet `~/grothe-cx/venv/bin/python phi_cover_exact.py phase.json 98/100 8`),
log `phi_cover_exact.log` in the same folder.  Model per box: exact Taylor shift of S, first-order
model of the exponential (`P1 = S(1 − ε(hU+hV))` exact, remainder `(ε rs)²/2 e^{ε rs}`), quadratic bound for
UV − W², arb for exp.

**§2a Result (2026-10-23): |φ| < 0.98995 everywhere.** U+V < 60: φ² < 0.98 on all 149,433 leaves
(296,888 evaluated boxes, max leaf bound 0.979999754, 3115 s on 8 processes); U+V ≥ 60: |φ| ≤ 0.0559.
The original handoff stored the script, log and README in the git-ignored
`handoff/upper-residual/phi-cover/` directory. The preserved script is
`tools/phi_cover_exact.py`; these external receipts are construction history,
not substitutes for the production Lean checks below.

**§2b In Lean (2026-10-26): `phi_abs_lt_one : ∀ u, |phiT u| < 1`** from `phiT_sq_le : φ² ≤ 99/100`.
Leaf test (`GrotheKernel.leafOK`): either the exponential at the lower corner with `|S| ≤ |B|_r`, or the
first-order model `e^{−ε h} S = S(1 − ε h) + S R`, `|R| ≤ a²/2 + 2a³/9` (`Real.exp_bound`, n = 3), with the
exponential at the centre bounded by `(10⁹/2718281828)^n · 720 den⁶/T₆(f)`; `UV − W²` bounded by a corner and
a centre formula. The root box is split into 512 cubes (`phiSplit`), each with its own tree; 119,077 checked
leaves; six single-threaded native facts `phi_cover_check_0`–`5` (the cube containing the maximiser holds 76,004
leaves, ≈ 12 min; the others ≤ 3 min). Far field `U + V ≥ 60`: `|φ| ≤ 1/10` (`far_sound`). This replaces the
earlier `φ² ≤ 3` cover.

## 3. `hardy` (N4): completed construction and historical plan

Source certificate: `tools/verify_upper_hardy.py`, with the full current preprocessing,
contour data and analytic input in `data/upper-preprocess/` (see its README). Kernel `H(t) = Σ_j h_j t^{2j+1}`, `h = kernelCoeff(energy GT)`.
The incumbent Hardy input is proved. The original route (from §6f of the planning note
`PLAN_UPPER.md`, which is not in the repository) was:

1. **Holomorphic continuation.** For complex symmetric 2×2 `R` with `I ± Re R ≻ 0` define
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
Construction record (begun by claude/hardy on 26 October, with subsequent completions):

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
  (circle) the mean of `|Hhol (Rt z)|²` over `‖z‖ = 4149/4000` is `≤ 7/4`. The pair version
  `hardy_of_pair_inputs_budget` takes any bound on the circle mean as the budget.
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
  real odd-series identification and numerical contour inputs must match any
  new response pair's smoothing and preprocessing data. For the incumbent `GT`,
  the identification is proved in step 1(b) below.
- **3 Gaussian Schur bound — proved** (`claude/hardy-2`). `SchurMain.norm_HholPair_sq_le`: for `B = A − jI`
  (`j > 0`), `Z = Re B`, `T = Z − Cr Z⁻¹ Cr`, `E = (Cr Z⁻¹ Cr + Ci Z⁻¹ Ci)/2`, `W = 2T + E`, under the gates
  `Z ≻ 0`, `T ≻ 0`: `‖HholPair F G R‖² ≤ 1/(64 j⁴ |det(I − R²)|² det Z det W)` for all measurable `‖F‖, ‖G‖ ≤ 1`
  (bound (1) of `GAUSSIAN_SCHUR_TAIL_PROOF.md`; the gates `Z ± Cr ≻ 0` there are equivalent to `Z ≻ 0, T ≻ 0`).
  Tools: `Gauss2` (2-D Gaussian integrals with complex linear term), `SchurTest` (weighted Schur test),
  `LstarL` (the `L*L` identity), `Sym2R` (2×2 forms; the weight inequality by a square-root-free identity),
  `SchurKernel` (exact `‖M₁‖`), `SchurBound` (ℝ⁴ factorization and Schur), `SchurIntegrability`.
- **4 region and circle mean — proved.** `GrotheKernel/HardyArc.lean` evaluates the Schur expressions of
  step 3 on rational boxes (`gatesOK` checks `Z ≻ 0`, `T ≻ 0`), with the circle `|t| = 4149/4000` in two
  rational charts. `HardyArcRegionCheck` (`hardy_region_check`, one `native_decide`, about 9 s on a
  GitHub-hosted runner) proves positive kernel decay (`KerPos`) on the disc of radius
  `51863/50000 > 4149/4000` by a quadtree of complex boxes. The circle mean is bounded with the Gaussian
  amplitude retained (`SchurMainGaussian`): `HardyGaussianCheck.charts_checked` (one `native_decide`) bounds the
  resulting determinant expression by `(513 + 297cos²θ − 204cos⁴θ)/500` on all four closed halves
  of the two charts. `HardyGaussian.hmean` integrates it exactly to the circle mean `117/100`. The soundness proofs are in `HardyArcSound`,
  `HardyArcCircle`, `HardyArcCover`, `HardyArcRegion` and `HardyGaussianSound`; **`HardyGaussian.hardy_of_real`**
  gives the `hardy` statement with budget `117/100` for every measurable disk-valued pair from the real
  identification (step 1(b)) for summable coefficients.
- **1(b) real identification — proved** (`claude/hardy-real`). `HardyReal.hreal_GT`, hence
  `HardyReal.hardy_GT_gaussian`: the `hardy` statement with budget `117/100` for the rounding,
  with no hypothesis beyond the proved `PhiBound`; `upper_below_tight` uses it.
  Modules: `HardyRealAlg` (exponent identity), `HardyRealKernel`,
  `HardyRealGauss` (`mu2` in the coordinates of `HholPair`), `HardyRealSubst`, `HardyRealDensity` (density of
  `(U, RU + SW)` is `kHol R`), `HardyRealCov`, `HardyRealLaw` (law swap), `HardyReal` (assembly).
- **Former plan of 1(b), for reference:**
  1(b) the real identification: for real `R`, `kHol R` is the density of the Gaussian pair with cross covariance
  `R` (two real copies), and smoothing by `M`, `N` turns `E[conj GT(X) GT(Y)]` (diagonal correlations
  `p(t), −τ(t)`) into `Hhol (Rt t)`; then `Bm_polyKernel` gives the series with `h = kernelCoeff (energy GT)`.
  This required Gaussian-law identification on `ℝ⁸` (density ↔ covariance,
  pushforward by linear maps), subsequently completed by the modules above.
  The generic `HardyGaussian.hardy_of_real` exposes `hreal` and coefficient summability
  `hs` as inputs; the incumbent specialization supplies both.

## 4. Remaining work toward the original sharper target

* The fourteen original finite-band Gaussian caps are not all proved; the
  conditional theorem that assumes them, `fresh_upper_concrete_taylor`, is
  archived in `abandonware/` (not built).
  The error decomposition, supports and actual centers are formalized.
  `ComparisonInputs` is still a conditional interface for arbitrary `G, X`;
  the single-channel theorem uses a different seven-piece comparison
  with proved low-band and whole-source radii.
* The actual table accuracy is **proved**, not an open quadrature project:
  `Final.hclose_final` combines the accepted energy facts with the full
  quadrature remainder, tail and omitted-pair bounds. It supplies the table
  input to `upper_below_tight`.
* Every even phase moment is identified with a finite rational calculation on
  the production phase (`integral_phiT_pow_even` in `ConcretePhaseMoments`).
  `PhaseMoment2`, `PhaseMoment4`, `PhaseMoment6` and `PhaseMomentNorms` provide
  the three Taylor-source total energies. Exact targets and reproduction
  instructions are in [data/phase-moments](../data/phase-moments/README.md).
  Total energies alone do not prove the original band-error caps.
* The recovered approximants and frozen correction have matching hashes in
  `data/taylor-approximants/inputs/`. Their exact center norms and bands,
  the complete third-center support through degree 51, and the `10^-18`
  rounding norm cap are certified. `TaylorTailData` states the original
  finite-band errors from which the sharper tails would follow; those
  error targets must not be confused with established numerical enclosures.
  The omitted-input Hilbert–Schmidt route, archived in `abandonware/`, is a
  separate way to seek those bounds, not an assumption of `main_bounds`.
* The lower endpoint is also closed: `main_bounds` in `MainResult.lean`
  gives `1.4019109461 < K_G^ℂ` from the certificate of the witness with an identity
  tail (`sharp_lower_endpoint`) and the node caps of its rows
  (`tailNodeCaps_cert`); see [LEAN_DETAILS.md](LEAN_DETAILS.md) and
  [CAPS.md](CAPS.md).

## 5. Historical `ComparisonInputs` plan for the original sharper caps

*Issue #20. Written from the master sources (`Grothe/UpperChaos/LocalizedComparison.lean`,
`Grothe/Upper/ComparisonData.lean`, `data/localized-comparison/{recipe.json,PROOF.md}`,
`miscellaneous/other-bounds/tree/docs/localized-comparison.tex`) and the inherited certificate (laptop archive
`handoff/upper-residual/global_norm/`: `MIXED_TAYLOR_CUTOFF_LEMMA.md`, `GAUSSIAN_POLYNOMIAL_NORM.md`,
`certify_taylor_comparison.py`, `taylor_comparison_result.json`). The error decomposition,
spectral support, concrete center data and phase moments are now implemented.
The plan below records the original eighteen-piece route and its old cost
estimates. The single-channel proof uses the six certified
inputs and grouped comparison in §1; the original finer Gaussian caps remain
separate targets.*

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
- the earlier overlap budget `C = 106490963/(125000·10⁹)`; grouping disjoint
  bands within each Taylor order tightens this to `851922301/10¹⁵`.

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

`CapturedTail.lean` formalizes the finite-family high-tail inequality, including
orthogonal Bessel and the separate reverse-triangle estimate for each band.
`TaylorErrorEnergy.lean` formalizes the whole-error identity and the alternative
one-inner-product band bound in §5.5. These are structural interfaces; the
concrete approximant norms are now certified. The original finer band-error
enclosures remain obligations of this sharper route; the current proof's
whole-source and low-band enclosures are already supplied by `UpperTightSix`.

### 5.3 Historical residual ledger of the original target

These are the original conditional target's allowances, not the current
`tightResidualQ` and not percentages of the proof left unfinished.
The decomposition shares below use the raw weighted-comparison residual
458421199009/(5·10¹⁷), before the forced linear-coefficient Hardy deduction.
The grouped refined residual is 455212621809/(5·10¹⁷); its linear comparison pieces are
identical. Each share below is the term 2·A_r·e_r divided by the raw residual;
the grouped quadratic term is about 0.009%.

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

### 5.4 Original work estimates and proof routes

The table preserves the initial plan's estimates. The decomposition, supports,
rounding check, moments and center norms are now implemented. Production
verified integration also exists; the still-unresolved question here is whether
the original finer band caps can be certified.

| field / item | kind | original Lean route | original cost estimate |
|---|---|---|---|
| `difference` | exact algebra, once the objects exist | define `c_j`, `v`, the 18 pieces and a concrete X = smoothing(F₀ + v) in Lean (`c_j` and `v` as generated data: about 260k + 35k + 6.6k + 354k dyadic coefficients); Taylor identity `F₀·P₃(φ) = T`; linearity of the smoothing | 2–4 w (data plumbing; overlaps #21, concrete X) |
| `support` | structural | `P_I`/`P_{>D}` are degree projections (Hermite basis `Grothe/UpperChaos/HermiteC2Basis.lean`); smoothing preserves total degree (Mehler, `mehler_L2`) | 1 w |
| `norm_le`, rounding piece | finite exact | single-threaded native check of `‖Σ c_j/j! − v‖² ≤ 10⁻³⁶` over the data | 2–3 d |
| `E φ^{2j}` (in the tails) | finite exact | the Laguerre-dilation formula (GAUSSIAN_POLYNOMIAL_NORM.md, eq. (4)): finite rational sums, exactly as `arb_norm.c` does | 1–2 w |
| `‖P_I c_j‖` (in the tails) | finite exact | sums of squares of the data | days |
| `HS_{j,I}` (omitted inputs) | finite exact | rectangular Hilbert–Schmidt bound in Laguerre form (finite Wick identity); exact rational check | 2 w |
| `1/(25·10⁹)`: coefficient enclosures of `B^jF₀ = iʲφʲF₀` | **analytic: verified integration** | rigorous Gaussian integrals of a phase function times polynomials. The plan predated the now-proved twisted quadrature; it proposed interval Taylor-model integration | months |
| propagation through `B^j` | analytic, small | `|φ| < 1` (#19) ⇒ `‖B^j‖ ≤ 1` | with #19 |

Everything except the coefficient enclosures is a finite exact computation, or structural.

### 5.5 Historical one-inner-product proposal for the tails

This section's numerical tradeoffs concern the original eighteen-band budget.
The current seven-piece comparison uses whole-source errors on grouped high
supports and separate low-band estimates, rather than charging each original
band the whole error.

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

### 5.5b Decomposition implementation record (`claude/comparison-pieces`)

`Smoothing.lean` (S as an `L²` contraction: `map_smooth`, `norm_smoothOp_le`, `smoothOp_toLp'`, mean preserved),
`BandProj.lean` (projections onto Hermite modes: coefficients, support, partition sums) and
`ComparisonPieces.lean` (Taylor split `Tround_eq`, the four sources, the 18 pieces, `difference_pieces`,
`comparisonInputs_of_norms`). The pieces are `P_I(S src)` (projection after smoothing), so
their supports hold by construction. The data `c_j`, `v` enter as charge-one parameters; plugging in the
certificate's data was the remaining part of that stage. The concrete frozen-source
instantiation is implemented in `comparisonInputs_taylorCenters` (`ConcreteTaylorUpper`) and
`ThreeBandRegrouping`. `SmoothComm.lean` proves that S preserves the total degree (it commutes
with the Ornstein–Uhlenbeck smoothing T_ρ, `law_comm`; T_ρ is diagonal with eigenvalue ρ^{|i|}, `OUOp.lean`), so
`P_I S = S P_I` and each piece is bounded by the band of its unsmoothed source.

### 5.6 Original ranked plan and estimates (historical)

| step | content | turns into Lean | residual made formal |
|---|---|---|---|
| 1 | concrete objects: `c_j`, `v`, X, the 18 pieces; prove `difference` and `support` | identification of the decomposition | 0% (removes the "identification" trust; `ComparisonInputs` becomes 18 explicit numeric norm statements) |
| 2 | finite exact parts: rounding norm, `E φ^{2j}`, `‖P_I c_j‖`, HS bounds | all non-integral numbers | 0% alone, a prerequisite for 3 and 4 |
| 3 | design spike, then verified 2-D integration of `I_j` (tail route §5.5) | t₁, t₂, t₃ | **≈ 86%** (with about +1.3% looser residual) |
| 4 | per-coefficient enclosures for the bands (`φʲF₀` against Hermite functions, degrees ≤ 181/91/51) | ε_{j,I} | the remaining ≈ 7% |

**Original timeline estimate (not a current schedule):**
- Steps 1–2: about 4–6 weeks of Lean, plus native checks of a few CPU-hours.
- Step 3: a 1–2 week spike to choose the integration method (interval Taylor models over the reduced 2-D domain,
  in `GrotheKernel`, single-threaded modules), then about 6–10 weeks.
- Step 4: months, and possibly not worth it. The bands carry 7%, and an alternative is to keep them as an isolated,
  replayed external certificate.

This schedule and its residual-share model are historical. They do not describe
remaining work for `main_bounds`, whose inputs are closed. The original finer
band caps remain the separate conditional target described in §4.

Historical task mapping (sub-issues of epic #17): step 1 → #39, step 2 → #40,
step 3 → #41. Consult the live issues for their current status.
