# The quadrature checker for the energy table (`hclose`), design and status

*Issue #303 (task of #21 under the relaxed goal K < 1.4046). Agent-ID: claude-b9ee. Written at
master `b886bb57`, 4 November 2026. This document is the design record: the soundness
obligations are stated here as precise statements because `sorry` stubs are not allowed in the
repository; nothing below is proved unless it names a theorem on master.*

## 1. What is being discharged

`fresh_upper_concrete_taylor` (`Grothe/UpperTarget.lean`) assumes

```
hclose : ∑ p ∈ headIdx 501, |energy X p − energyTable p| ≤ energyErrQ
```

with `X = smoothFn (F₀ + v)` concrete on master, `energyTable` the 21,168 binary64 entries of
`data/upper-preprocess/certificate.json`, and `energyErrQ = 6847009/(5·10¹⁷) = 1.37·10⁻¹¹`.
Master reduces it (`ProductionRetainedEnergy.original_energy_of_retained_source`) to two premises
about a rational coefficient family `a0` of the F₀ head (degree ≤ 501):

```
hraw   : ‖productionF0Head − gradedHermite 251 a0‖ ≤ rawUpper          (ℓ² of the raw vector)
htable : ∑ p ∈ headIdx 501, |energy (retainedSmoothed a0) p − energyTable p| ≤ 3·10⁻¹²
```

Under the relaxed goal the table tolerance may grow to about 4·10⁻⁸ and the raw ℓ² cap to about
2·10⁻⁸ (the allocation copied on #303; it must be re-derived from the coupled three-band budget
of #295/#299 before it is adopted). The checker is the computation behind both premises.

## 2. The computation (mirrors the archived certificate, `handoff/upper-residual/`)

For each raw coefficient (degree `q+1, q`; auxiliary `c, d`):

```
C_{q;c,d} = ∫₀^∞ e^{−s} · ψ_{k,m}(s) · sign(v(s))^{c+d} · I_{c,d}(A(s)) ds,
   k = d+1−c, m = q−d,  A(s) = √s / (√(1+a²) |v(s)|),
   ψ_{k,m}(s) = (−1)^m √(m!/(m+k)!) s^{k/2} L_m^{(k)}(s)     (RadialLaguerre.radialFactor)
   I_{c,d}(A) = canonicalCoefficient A (c,d)                   (F0ConditionalEvaluator)
```

(`ProductionF0Radial.baseGradedCoefficient_eq_radial`, `RadialLaguerre.conj_primary_laguerre`,
`F0ConditionalEvaluator.coefficient_eq_signed`). The conditional coefficients are real for real
`A` and follow from the seed and two recurrences proved on master:

```
I_{0,0}(A) = S(A) = (√π/2)·A·J₀(A²),  J₀(x) = (4/π)∫₀^{π/2} cos²t e^{−x sin²t} dt
I_{0,d+1}  = −A · r_d · I_{0,d} / √(d+1),      r_d = J_{d+1}(A²)/J_d(A²) ∈ (0,1]
I_{c+1,d}  = (A√(d+1) I_{c,d+1} + (d+1−c) I_{c,d}) / (A√(c+1))
```

(`ConditionalSeedNormalization`, `F0ConditionalSeedRecurrence`, `ConditionalCoefficientCharge`,
`OriginalPositiveMoment.ratio_backward_enclosure`). The integral over `s` is a sum of
Gauss–Legendre panel sums plus an analytic remainder; the raw vector is rotated by the smoothing
matrices (`ProductionSmoothingApprox`) and contracted into the 21,168 energies (`Energy2`), and
the ℓ¹ distance to `energyTable` is formed.

## 3. The library `GrotheQuadKernel` (this milestone)

Mathlib-free, `precompileModules = true` (its own `[[lean_lib]]`, like `GrotheCapsKernel`, so
that changes to it never invalidate the heavy node-cap modules). Five modules:

| module | content | mirrors on master |
|---|---|---|
| `Basic` | fixed-point intervals at an explicit precision `K` (grid 2⁻ᴷ): outward `+ − × ÷ √`, `exp` (positive series + reciprocal), powers, rescaling, binary64 decoding, decimal rendering | `GrotheCapsKernel.Basic` (fixed `K = 128`) |
| `Seed` | `J₀(x) = Σₙ (−x)ⁿ (2n)!/(4ⁿ (n!)³ (n+1))` through `N` with tail ≤ `|t_{N+1}|/(1 − x/(N+3))`; `S(A)` from a rational π enclosure; the ratio backward recurrence from `r_H ∈ [0,1]` | `OriginalPositiveMoment.moment 0`, `seedScalar`, `PositiveRatio.backward` |
| `Pairs` | zero row, forward charge recurrence over the triangle `c+d ≤ D`, selection of the stored canonical set (`c ≤ d+1`, `d ≤ 265`: 35,777 pairs in `(c+d, c)` order), sign twist, transport radius `(√(c+1)+√(d+1))·ρ` | `normalizedCoefficient_zero_row_step`, `normalizedCoefficient_forward`, `conditional_canonical_pairs.npy` |
| `Gauss` | Legendre `P_n` by the three-term recurrence, sign-change check of root brackets, weights `2(1−x²)/(n² P_{n−1}(x)²)`, the physical panel map, the Gauss sum, Laguerre rows and `ψ_{k,m}(s)` | `Q0LegendreInteger.realPair`, `Q0LegendreWeight.weight`, `Q0GaussPhysical.panelNode/panelWeight`, `RadialLaguerre.radialFactor` |
| `Compare` | ℓ¹ / ℓ² / max distance of enclosures to a dyadic table; Bessel sum | `energyTable`, `raw_canonical_blocks.npy` |

Consumer: `Grothe/UpperQuad/Row227Check.lean` (`#eval` only; excluded from the `Grothe` root
through `data/root-imports-exclude.txt` because it writes `handoff/quad-checker/row227-lean.txt`
during its build). Data and provenance: `data/quad-checker/`.

## 4. Validation at the row-227 node (measured, 4 November 2026)

Node: ordinal 227 = panel 4 = [1, 2], order 62, rule 31; pinned midpoint shift
`A0 = midpoint/2¹⁰²⁴ = 4.14544319832035469501…` (`OriginalMomentSeedData`), within `2·10⁻¹⁸` of
the actual `profileShift` (`ConditionalSourceRow227Shift.actual_shift_midpoint_error`); the
profile is positive there (`profile_pos`). Reference: the saved binary64 row of the original Arb
pipeline (PR #298, `row227.bin`, SHA `85f6792a…`, 35,777 words).

| quantity | value |
|---|---|
| `x = A0²` | 17.18469931050049158687924140784251413463… |
| `J₀(x)` (Lean, K = 1024, 200 terms) | [0.2681438962793974168189443860339312096805, …806] |
| `S(A0)` | [0.98510795255444173677170…, 0.98510795255444173677326…], width 2⁻⁷⁰ (the 20-digit π enclosure) |
| Σ over the 35,777 pairs of `I²` (upper bound) | 0.99987720663246658926 (Bessel: ≤ 1) |
| Lean enclosures vs the 400-digit Python reference (`tools/quad_checker_reference.py`) | all 35,777 reference values inside their enclosures; max width 1.57·10⁻²¹ |
| Python reference vs saved row | max \|ref − saved\| = 1.308·10⁻¹⁷ (band c+d ≤ 49; the half-ulp of binary64 at 0.98 is 5.5·10⁻¹⁷); 9.7·10⁻²³ for 50 ≤ c+d ≤ 99 down to 1.6·10⁻²⁴ for c+d ≥ 500 |
| Lean enclosures vs the first 41 saved words (in Lean, `maxDistUpper`) | ≤ 1.309·10⁻¹⁷; ℓ¹ ≤ 2.033·10⁻¹⁷ |

Enclosure widths by band of c+d at K = 1024: 2⁻⁷⁰ (c+d < 50), 2⁻⁸⁹ (50–99), …, 2⁻⁹⁵ (≥ 500):
the π enclosure dominates; the rounding noise is below it.

**Precision finding.** The forward charge recurrence amplifies rounding: at K = 512 the
enclosures of the top band have width 2¹⁷⁵ and at K = 256 width 2⁴³¹ (useless), while K = 1024
is clean. So at this node (A ≈ 4.1) the amplification over the triangle is about 2⁶⁸⁷ ≈ 10²⁰⁷
(consistent with the archived replay: 1024-bit arithmetic, widths ≤ 10⁻¹⁰⁰), and the recurrence
must run at K ≈ 1024 regardless of the 2⁻⁵⁰ output precision. The output is then rescaled to
K = 128 for the contraction. (Alternatives if this ever matters: the Euler-identity seeds of the
archived pipeline with its contiguous recurrence, or a backward/Miller direction; not needed at
the measured cost.)

## 5. Cost (laptop, Apple Silicon, one core, `#eval` on the precompiled library)

| step | measured |
|---|---|
| seed series (200 terms) + 831 ratios at K = 1024 | 6 ms |
| triangle `c+d ≤ 531` (71,288 recurrence entries), scalar, selection of 35,777 pairs, Bessel sum, K = 1024 | 2.50 s |
| the same at K = 512 / 256 (unsound widths, timing only) | 1.58 s / 1.41 s |
| Python reference (decimal, 400 digits, full row + comparisons) | 5.7 s |
| memory of one node at K = 1024 | ≈ 71,288 × 2 × 1024-bit integers ≈ 20 MB (transient) |

Estimate for the full run (per-node conditional coefficients only): 21,577 nodes × 2.5 s ≈ 15
CPU-hours on the original partition; ≈ 2,000 nodes × 2.5 s ≈ 1.4 CPU-hours on the planned
partition. The contraction (not yet implemented): 5.3·10⁶ raw coefficients × ≈ 2,000 nodes ≈
10¹⁰ multiply-adds at K = 128; at 0.2–0.5 µs per boxed `Int` operation that is 0.5–1.5 CPU-hours,
shardable by raw charge `k`. The rotation and the 21,168 energies are a few minutes. Total under
5 CPU-hours per full run as estimated on #21, split into ≈ 10 `native_decide` facts.

## 6. Soundness obligations (statements; the Lean proofs are the next milestones)

Notation: `x ∈ a` means `a.lo ≤ x · 2^K ≤ a.hi` for an `Ival a` at precision `K`.

- **S1 (interval arithmetic).** For `addI, subI, negI, mulZ, mulN, divN, mulI K, sqI K, divI K,
  sqrtI K, invI K, powI K, rescale K K', ofRat K, ofDyadic K, word64ToIval K`: if the inputs
  contain the real operands (and the divisor interval is positive where required) then the
  result contains the real result. For `expPosI K N a`: `0 ≤ x ∈ a`, `x < N + 2` ⇒ `exp x ∈
  expPosI K N a`; `expNegI` likewise for `exp (−x)`. (As `Grothe/Upper/IntervalSound.lean` for
  the caps kernel.)
- **S2 (seed).** For `x ≥ 0`, `N + 3 > x`:
  `|OriginalPositiveMoment.moment 0 x − Σ_{n ≤ N} (−x)ⁿ (2n)!/(4ⁿ (n!)³ (n+1))| ≤ |t_{N+1}(x)|/(1 − x/(N+3))`,
  hence `moment 0 x ∈ seedJ0I K N xI` for `x ∈ xI`; and `seedScalar A ∈ seedScalarI K N piI aI`
  for `A ∈ aI`, `π ∈ piI` (`canonicalCoefficient_zero_zero`). For large `x` (root windows) the
  Watson form `J₀(x) = (2/π)∫₀¹ t^{−1/2}(1−t)^{1/2} e^{−xt} dt` with the binomial tail ≤ `t^{N+1}`
  (the coefficients of `(1−t)^{1/2}` after the first are negative and sum to −1) replaces the
  series; not implemented in this milestone.
- **S3 (ratios).** `OriginalPositiveMoment.ratio h x ∈ (ratiosI K xI H)[h]` for `h < H`,
  `x ∈ xI`, `x ≥ 0` (from `ratio_backward_enclosure` and S1).
- **S4 (pairs).** (a) For real `A`, `(canonicalCoefficient A (c,d)).im = 0` for all `c, d`
  (`canonicalCoefficient_zero_row_im` and induction over `canonicalCoefficient_forward`).
  (b) For `A ∈ aI`, `A > 0`, and `(c,d)` the `i`-th canonical pair of `canonicalPairs D dMax`:
  `(canonicalCoefficient A (c,d)).re ∈ (canonicalTriangleI K scalar negSign 0 aI ratios D dMax)[i]`
  when `seedScalar A ∈ scalar` and the ratios satisfy S3 (and the sign twist matches
  `profileSign`, `coefficient_eq_signed`).
- **S5 (transport).** `|canonicalCoefficient A i − canonicalCoefficient A₀ i| ≤ (√(c+1)+√(d+1))·|A−A₀|`
  from `d/dA I_{c,d} = √(c+1) I_{c+1,d} + √(d+1) I_{c,d+1}` and `|I_{c,d}| ≤ 1`
  (`sum_sq_canonicalCoefficient_le_one`); this justifies the `rho` widening of
  `canonicalTriangleI` and lets the recurrence run at a thin midpoint.
- **S6 (Gauss–Legendre).** (a) If `ruleOK K n bs` then `P_n` has exactly one root `x_i` in each
  bracket, `x_i ∈ ⟨bs[i].lo, bs[i].hi⟩`, and `Q0LegendreWeight.weight (n−1) x_i ∈ weightI K n
  ⟨bs[i].lo, bs[i].hi⟩`; the physical node and weight of `panelNodesWeights` contain
  `panelNode lo hi x_i` and `panelWeight lo hi (n−1) x_i`. (b) For `f` analytic on the Bernstein
  ellipse `E_ρ` of `[l, h]` with `|f| ≤ M` there:
  `|∫_l^h f − Σᵢ W_i f(s_i)| ≤ 4 (h−l) M ρ^{−(2n−1)} / (ρ − 1)` for the `n`-point rule
  (Chebyshev coefficients `|a_k| ≤ 2Mρ^{−k}`, exactness through degree `2n−1`, tail sum; the
  exponent is the corrected indexing of #21). (c) For the integrand
  `e^{−s} ψ_{k,m}(s) I_{c,d}(A(s))`: `|ψ_{k,m}(s)| ≤ τ^{−n/2}(1−τ²)^{−1/2} exp(τ(Re√s)²/(1+τ) +
  τ(Im√s)²/(1−τ))` (Mehler, τ = 99/100), `|I_{c,d}(A)| ≤ exp((Im A)² + √(2(c+d)) |Im A|)` for
  complex `A`, and `A(s)` analytic on panels where `Re((1+a²) vprof(s)²) > 0` on `E_ρ`.
- **S7 (comparison).** `x ∈ a`, `t ∈ T` ⇒ `|x − t| ≤ distUpper a T / 2^K`; summed, `l1Upper`.
  The raw vector enters `hraw` through the radial identity and the omitted modes through Bessel
  (`sum_sq_canonicalCoefficient_le_one`, `F0ConditionalNode`).
- **S8 (root windows; reviewer codex-2ca4's statement on #21).** `W = [r−w, r+w]`, root
  `ξ ∈ [r−ε, r+ε]` certified (`ProfileRootScreen`/`ProfileRootSound`), `|vprof′| ≤ D` on `W`,
  `κ = √(1+a²)`, `a = r − w`: the signed linear model `1 + (t/2)(w − w̄)`, `t = κ v(s)/√s`,
  has squared L² residual ≤ `(25 κ⁴ D⁴ e^{−a}/a²)(2w⁵/5 + 4w³ε² + 2wε⁴)` over the window
  (`ZeroProfilePhaseLinearization.norm_phaseSliceLp_sub_linear`,
  `Q0ConditionalLinearError.coefficient_linear_error_sq_le`); the retained modes integrate in
  closed form against the radial basis; the replacement theorem connects the window model to
  the saved table.
- **S9 (assembly).** On master: `original_energy_of_retained_source`, the smoothing matrices
  within `4·10⁻¹⁵` (`ProductionSmoothingApprox`), Parseval (`Energy2`). The checker's rotation
  uses the saved rational matrices exactly.

## 7. What this milestone does not do

No theorem, no native fact, no change to any statement or data file on master. Not implemented:
the large-`A` seed (Watson form), the per-panel integrand bound `M` (S6c), the contraction over
all nodes, the rotation and the energies, the root windows. The `lakefile.toml` change moves the
node-caps digest (`scripts/caps_stamp.py` hashes it), so every push of this branch is
`[skip ci]`; the workflow lists (`LEAN_PATHS`, the `sorry` grep, `caps_stamp.PROJECT_ROOTS`) will
need `GrotheQuadKernel` added in a workflow PR merged by hand (AGENTS.md §9).
