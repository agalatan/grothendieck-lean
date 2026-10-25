# Upper bound: formalisation status and next steps (cold-start notes)

The sharper conditional upper bound is described below. The independent hypothesis-free
route now proves `Grothe.haagerup_bound : IsGrothendieckBound (1404951/1000000)`.
Its finite-power contraction, complete residual and weighted infinite tail are documented in
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

    K_G^ℂ ≤ 500000000000000000/355973697533655491  (< 1.404598158416)

for the concrete rounding `GT` (smoothed `F₀·P₃(φ)` built from `Grothe/Upper/Data.lean`), assuming only

* `ComparisonInputs`: the exact spectrally supported Gaussian error decomposition and inherited component norm caps; Lean derives its selected-head energy comparison,
* `energy_close`: `Σ_{n+3m≤501} |energy X − energyTable| ≤ energyErrQ`,
* `hardy`: `Σ_{n<J} kernelCoeff(energy GT)_n² (4149/4000)^{2(2n+1)} ≤ 7/4`,

for some charge-one `X ∈ L²(gaussC ⊗ gaussC)` (the smoothed truncation of `F₀ + v`; its correction vector `v` lives
in `handoff/upper-residual/global_norm/frozen_taylor_correction_D201.npz`, not in Lean).
Axioms: standard + `head_check` + `comparison_check` + `phi_cover_check` (native). The structural fields of the old
`DirectHyps` (`valid`, `summable`, `summableX`, `parityX`) and `|P₃(φ)| ≤ 1` (via `phiBound : φ² ≤ 3`)
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
| PhiHorner, PhiDense, PhiCover, PhiCoverData, PhiCoverCheck, PhiBound | phase cover `φ² ≤ 3` (checker `GrotheKernel/PhiCheck.lean`, generator `tools/gen_phi_cover.py`) |
| HardyKernel | holomorphic Gaussian kernel and certificate covariance definitions; no discharge of `hardy` yet |

The sharper tail reserves the linear coefficient's weighted square from the
same `7/4` budget before Cauchy–Schwarz (`hardy_budget_after_linear`,
`linear_lower`, `tail_le`). It changes no numerical premise. The complete
endpoint for the preceding preprocessors passed the full build and axiom audit in
[run 39901871873](https://github.com/agalatan/grothendieck-lean/actions/runs/39901871873);
the current degree-41/15 preprocessors come from `data/upper-preprocess/`.
The affected upper modules have fresh warning-as-error coverage, including
the head, selected-band comparison and phase-cover native facts. The combined
endpoint report uses 17 of 84 registered native facts (14 lower plus those
three upper facts). Logs and source guards are in
`data/upper-preprocess/verification/`; the preceding CI run is historical
evidence only. `HardyKernel` fixes definitions and does not
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

Proposed Lean version (not built): same structure as `PhiCheck` with `leafOK` replaced by the
first-order exponential model; needs a tight rational upper bound of `e^{−x}` at non-integer x (Taylor
sum lower bound `e^{x} ≥ Σ_{k≤K} x^k/k!` with K ≈ 2x+20, or a table of `e^{−j/64}` enclosures) and of
`e^{y}` for small y (`e^y ≤ 1/(1−y)`). ~1.5·10⁵ leaves × ~10 ms ⇒ ~25 min native; split by the first 3
bisection levels into 8 modules / 8 native facts of ~3 min each (no Task.spawn).

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
Progress: `Grothe/UpperChaos/HardyKernel.lean` fixes the definitions (`Sym2C`, `detIm`, `Amat`, `Cmat`,
`kExp`, `kHol`, `Hhol`, `Rt`); integrability and holomorphy remain unproved. Next: 1(a).

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
