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

## 3. The library `GrotheQuadKernel`

Mathlib-free, `precompileModules = true` (its own `[[lean_lib]]`, like `GrotheCapsKernel`, so
that changes to it never invalidate the heavy node-cap modules). Modules:

| module | content | mirrors on master |
|---|---|---|
| `Basic` | floating dyadic intervals `[lo·2^e, hi·2^e]` normalised to `P` mantissa bits: outward `+ − × ÷ √ exp`, powers, comparisons, fixed-point export, binary64 decoding, decimal rendering | `GrotheCapsKernel.Basic` (fixed-point, `K = 128`) |
| `Seed` | `π` by Machin; `J₀(x) = Σₙ (−x)ⁿ (2n)!/(4ⁿ (n!)³ (n+1))` through 800 terms with tail ≤ `|t_{N+1}|/(1 − x/(N+3))` for `x < 150`, the Watson form `(2/√(πx)) Σ_{n≤70} c_n (2n)!/(4ⁿ n!) x^{−n}` with the error `(2/π)[Γ(N+3/2) x^{−N−3/2} + (4/x)e^{−x}]` for `x ≥ 150`; `S(A)`; the ratio backward recurrence from `r_H ∈ [0,1]` | `OriginalPositiveMoment.moment 0`, `seedScalar`, `PositiveRatio.backward` |
| `Pairs` | zero row, forward charge recurrence over the triangle `c+d ≤ D`, selection of the stored canonical set (`c ≤ d+1`, `d ≤ 265`: 35,777 pairs in `(c+d, c)` order; prefix `c+d ≤ D` for a node of cutoff `D`), sign twist, transport radius | `normalizedCoefficient_zero_row_step`, `normalizedCoefficient_forward`, `conditional_canonical_pairs.npy` |
| `Gauss` | Legendre `P_n` by the three-term recurrence, sign-change check of the integer root brackets (over `2^640`), weights `2(1−x²)/(n² P_{n−1}(x)²)`, physical panels, Gauss sums, Laguerre rows and `ψ_{k,m}(s)` | `Q0LegendreInteger.realPair`, `Q0LegendreRule01…64.brackets`, `Q0LegendreWeight.weight`, `Q0GaussPhysical.panelNode/panelWeight`, `RadialLaguerre.radialFactor` |
| `Profile` | `vprof s` (Laguerre `α = −½`, `nrmHalf`), `κ = √(1+a²)`, the sign and the shift `√s/(κ|v|)` | `Rounder.vprof`, `F0ConditionalEvaluator.profileShift/profileSign` |
| `Contract` | the block layout of the committed raw array (252 square blocks, 5,365,627 entries), the node factors `ψ_{k,j}(s) e^{−s} W`, the exact fixed-point accumulation `raw[k,j,c] += F_{k,j} · I_{c,d}` | `ProductionF0Radial.baseGradedCoefficient_eq_radial`, `raw_canonical_blocks.npy` |
| `Compare` | ℓ¹ / ℓ² / max distance of enclosures to a dyadic table; Bessel sum | `energyTable`, `raw_canonical_blocks.npy` |

Driver: the native executable `quadrun` (`QuadRun.lean`, `[[lean_exe]]` in `lakefile.toml`, not a
default target): `rules` (checks the 64 bracket rules), `node <ordinal>`, `shard <i> <n> <dir>`,
`merge <n> <dir>`. Inputs (`tools/quad_gen_partition.py`): `data/quad-checker/panels.txt` (the
1,289 panels of `sourcePanels`), `cutoffs.txt` (`conditional_cutoffs.npy`), `profile.txt`
(`profileQ`, `aQ`); the 2,080 brackets are regenerated from the Lean sources into
`handoff/quad-checker/rules.txt`. Validation module: `Grothe/UpperQuad/Row227Check.lean` (`#eval`
only; excluded from the `Grothe` root through `data/root-imports-exclude.txt`). Comparison:
`tools/quad_compare_raw.py`.

## 4. Validation at the row-227 node (measured, 4 November 2026)

Node: ordinal 227 = panel 4 = [1, 2], order 62, rule 31; pinned midpoint shift
`A0 = midpoint/2¹⁰²⁴ = 4.14544319832035469501…` (`OriginalMomentSeedData`), within `2·10⁻¹⁸` of
the actual `profileShift` (`ConditionalSourceRow227Shift.actual_shift_midpoint_error`); the
profile is positive there (`profile_pos`). Reference: the saved binary64 row of the original Arb
pipeline (PR #298, `row227.bin`, SHA `85f6792a…`, 35,777 words).

| quantity | value |
|---|---|
| `x = A0²` | 17.18469931050049158687924140784251413463… |
| `J₀(x)` (Lean, P = 1024) | [0.2681438962793974168189443860339312096805, …806] |
| `S(A0)` | 0.98510795255444173677211517317997991425…, width 2⁻⁹⁹⁸ |
| Σ over the 35,777 pairs of `I²` (upper bound) | 0.99987720663246658925 (Bessel: ≤ 1) |
| Lean enclosures vs the 400-digit Python reference (`tools/quad_checker_reference.py`) | all 35,777 reference values inside their enclosures |
| Python reference vs saved row | max \|ref − saved\| = 1.308·10⁻¹⁷ (band c+d ≤ 49; the half-ulp of binary64 at 0.98 is 5.5·10⁻¹⁷); 9.7·10⁻²³ for 50 ≤ c+d ≤ 99 down to 1.6·10⁻²⁴ for c+d ≥ 500 |
| Lean enclosures vs the first 41 saved words (in Lean, `maxDistUpper`) | ≤ 1.309·10⁻¹⁷; ℓ¹ ≤ 2.032·10⁻¹⁷ |

Enclosure widths by band of c+d with the floating intervals: at P = 1024, 2⁻⁹⁹⁸ (c+d < 50) to
2⁻⁸⁶⁸ (c+d ≥ 500); at P = 512, 2⁻⁴⁸⁶ to 2⁻³⁵⁶; at P = 256, 2⁻²³⁰ to 2⁻¹⁰⁰. The loss over the
triangle is about 130 bits (relative), so P = 512 is ample.

**Precision finding (corrected).** The first version of the kernel used fixed-point intervals
(absolute grid 2⁻ᴷ); with it the top band had widths 2¹⁷⁵ at K = 512, which looked like an
amplification of 2⁶⁸⁷ by the forward recurrence. That was underflow of the tiny intermediate
values (the zero row decays like `A^d/√(d!)`), not conditioning: with floating intervals the
relative loss is 130 bits at this node, and at every node of the committed partition (shifts
from 1.5·10⁻¹⁰ to 3·10²⁷) P = 512 gives widths below 2⁻²⁹⁰ (§8).

## 5. Cost of the core (laptop, Apple Silicon, one core)

| step | measured |
|---|---|
| seed (series, 800 terms) + 2,531 ratios at P = 1024 | 42 ms |
| triangle `c+d ≤ 531` (71,288 recurrence entries), scalar, selection of 35,777 pairs, Bessel sum | 2.03 s at P = 1024, 1.37 s at P = 512, 1.19 s at P = 256 |
| node factors `ψ_{k,j}(s) e^{−s} W` for all 31,877 `(k, j)` at P = 1024 | ≈ 0.1 s |
| accumulation of one full node into the 5,365,627 raw entries (fixed scale 2¹²⁸, exact products) | 3.4 s (laptop), ≈ 4–5 s (yo) |
| Python reference (decimal, 400 digits, full row + comparisons) | 5.7 s |
| memory of one shard process (accumulators of 5.3M interval entries) | 0.8 GB |

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

## 7. What is not done

No theorem, no native fact, no change to any statement or data file on master. Not implemented:
the per-panel integrand bound `M` (S6c), the rotation and the energies (milestone 3), the root
windows of the planned partition. The `lakefile.toml` change moves the
node-caps digest (`scripts/caps_stamp.py` hashes it), so every push of this branch is
`[skip ci]`; the workflow lists (`LEAN_PATHS`, the `sorry` grep, `caps_stamp.PROJECT_ROOTS`) will
need `GrotheQuadKernel` added in a workflow PR merged by hand (AGENTS.md §9).

## 8. Milestone 2: the full node loop and contraction, validated against the committed raw array

Run of 4 November 2026 (`quadrun`, branch at `b8ae03747`): all 21,577 nodes of the committed
partition and the contraction into the 5,365,627 raw coefficients, on the big droplet (48 vCPU)
in 40 shards; the merged vector is `handoff/quad-checker/raw-final.txt` (277 MB, SHA-256
`8bc02c16bbd3b49db608d84397fffb27f4bb49b24439592506979fbd551365de`, enclosures `[lo, hi]/2^128`
in the committed block layout), the per-node records are `handoff/quad-checker/nodes/nodes-*.txt`;
committed summaries: `data/quad-checker/nodes-summary.json`, `data/quad-checker/raw-comparison.json`
(`tools/quad_nodes_summary.py`, `tools/quad_compare_raw.py`).

**Node loop.** Every node accepted a definite profile sign (11,216 negative); shifts from
`A = 1.49·10⁻¹⁰` (s = 99.5) to `3.06·10²⁷` (next to the first root gap), `x = A²` up to
`9.3·10⁵⁴`; 5,754 nodes used the series seed (x < 150), 15,823 the Watson form; cutoffs as
committed (11,255 full, 421,701,618 retained pairs in all). Precision: 21,528 nodes accepted at
P = 512 (widths of the widest canonical enclosure per node: 1,002 nodes below 2⁻⁵⁵⁰, 10,624 in
[2⁻⁵⁵⁰, 2⁻⁵⁰⁰), 2,585 in [2⁻⁵⁰⁰, 2⁻⁴⁵⁰), …, 412 in [2⁻¹⁰⁰, 2⁻⁷⁷]); 49 nodes with
x ∈ [150, 158) ran the whole ladder to P = 4096 and ended at width 2⁻⁷⁷…2⁻⁷⁹: that is the weak
tail bound `(4/x) e^(−x/2)` of the Watson form (precision-independent), since corrected to
`(4/x) e^(−x)` (node 771 now gives 2⁻¹⁵² at P = 512); the enclosures of the run are sound and
far below the 10⁻¹³ target. Bessel sums of the retained pairs: all ≤ 1 (minimum 0.938).

**Contraction and comparison with `data/retained-f0/raw_canonical_blocks.npy`** (SHA
`5992d33a…`). The committed blocks are row-major in the radial index `j` (hypothesis "j": max
midpoint difference 1.7·10⁻¹⁵ on blocks 1, 2, 100; hypothesis "c": 0.24). Over the 2,698,752
entries of the degree-501 triangle:

| quantity | excursion of the committed value from the enclosure | midpoint difference |
|---|---|---|
| maximum | 1.665·10⁻¹⁵ (index 63001: k = 1, j = 0, c = 0, the degree-one coefficient 0.8475…) | 1.665·10⁻¹⁵ |
| ℓ² | 1.761·10⁻¹⁵ | 1.761·10⁻¹⁵ |
| ℓ¹ | 1.326·10⁻¹⁴ | 1.326·10⁻¹⁴ |

Largest enclosure width 7.6·10⁻²⁸ (index 63503, k = 1); committed ℓ² norm 0.994707. The 2,666,875 "extra" entries
of the square blocks outside the triangle are computed values in the committed array too
(max 1.8·10⁻⁴) and agree to 2.7·10⁻¹⁹. By charge (count in the triangle, max excursion, max width):

| k | entries | max excursion | max width |
|---|---|---|---|
| 0 | 31626 | 3.33e-16 | 3.4e-29 |
| 1 | 31626 | 1.67e-15 | 7.6e-28 |
| 2 | 31375 | 9.71e-17 | 3.4e-29 |
| 3 | 31125 | 2.43e-17 | 2.7e-30 |
| 5 | 30628 | 3.90e-18 | 5.0e-32 |
| 10 | 29403 | 2.98e-19 | 1.6e-35 |
| 25 | 25878 | 5.93e-21 | 1.3e-37 |
| 50 | 20503 | 5.17e-25 | 1.2e-37 |
| 100 | 11628 | 7.89e-30 | 1.2e-37 |
| 150 | 5253 | 0.00e+00 | 2.4e-37 |
| 200 | 1378 | 0.00e+00 | 2.4e-37 |
| 251 | 1 | 0.00e+00 | 1.2e-37 |

**Entries beyond their binary64 half-ulp: 1,900,115 of 2,698,752.** They are explained by the
nature of the committed array, not by the checker: the archived contraction was binary64
(blocked BLAS dot products over up to 21,577 nodes, binary64 node centres), whose error is
*absolute*, about 10⁻¹⁹–10⁻¹⁵ per entry whatever the entry's size (its ledger, `REFINED_RAW_PROOF.md`,
bounds the whole vector by 4.65·10⁻¹² in ℓ²), while the half-ulp of a small entry is relative
(10⁻²⁶ for an entry of 10⁻¹⁰). Every excursion is at most 1.665·10⁻¹⁵ (7.5 ulp of the largest
coefficient, consistent with ≈ 2·10⁴ roundings), the ℓ² excursion 1.76·10⁻¹⁵ is 2,600 times
below the archived cap, and the excursions decay with the charge exactly like the entries
themselves (10⁻¹⁶ at k = 0, 10⁻²¹ at k = 25, 10⁻³⁰ at k = 100). The Arb replay's 5.7·10⁻¹⁸ ℓ²
reproduction measured the reproducibility of that binary64 pipeline, not its distance to the
exact values; the exact distance is what this run measures. No entry needs any other explanation.

**Cost.** big droplet, 40 shards under `nice`: 302 nodes/min on the full-cutoff nodes
(≈ 3.5 s per full node: ≈ 1.3 s triangle at P = 512, ≈ 2 s accumulation of 5.4·10⁶ exact
products), the whole partition in ≈ 55 min wall, 97,600 CPU-seconds ≈ 27 CPU-hours (the
per-node record's `ms` column folds the triangle into the accumulation column); 0.9 GB RSS per
shard; the merge of 40 shard files (one Lean process parsing 2.1·10⁸ decimal integers) ≈ 25 min.
On yo (8 vCPU, 6 shards) the rate was 0.57 nodes/s. The laptop single-node cost is in §5.

**What this establishes.** The checker reproduces the archived raw vector within the archived
pipeline's own floating-point error, with sound enclosures of width ≤ 7.6·10⁻²⁸, from the Lean
definitions of the nodes (`sourcePanels`, the `Q0LegendreRule` brackets, `panelNode`,
`panelWeight`), the profile (`vprof`, `profileShift`), the recurrences proved on master and the
committed cutoffs. Not yet done: the smoothing rotation and the 21,168 energies (milestone 3:
`productionSmoothedCoeff` with the saved rational matrices, then the ℓ¹ comparison with
`energyTable`, and the degree-one reference entries), the analytic parts (S2, S5, S6b/c, S8), and
the omitted-pair bound of the cutoffs, which this run inherits from the archived table.

## 9. Milestone 3: the smoothing rotation and the energies (design)

**Target.** The numerical content of `hclose` through master's reduction
`ProductionRetainedEnergy.original_energy_of_retained_source` (and its parametric form
`selected_energy_close_of_raw_error`): for a rational coefficient family `a0` of the F₀ head,

```
hraw   : ‖productionF0Head − gradedHermite 251 a0‖ ≤ δ
htable : Σ_{p ∈ headIdx 501} |energy (retainedSmoothed a0) p − energyTable p| ≤ ε
hclose follows with τ = (2·501/500 + 3Δ)Δ + ε,  Δ = δ + 4·10⁻¹⁵(501/500 + δ)
```

(`rawUpper = 4.8·10⁻¹²`, `ε = 3·10⁻¹²` in the concrete theorem; `τ = energyErrQ = 1.37·10⁻¹¹`).
Here `retainedSmoothed a0 = gradedHermite 251 (productionSmoothedCoeff (a0 + v))`, with
`v = frozenCorrectionCoeff` (grades `q < 91`, the 259,532 binary64 values of
`data/taylor-approximants/inputs/frozen_taylor_correction_D201.npz`, exact dyadics at 2⁻²⁰⁶), and
`productionSmoothedCoeff a q c d = (S_{q+1} · A_q · S_qᵀ)[c][d]` with the **saved rational
matrices** `S_n = productionSavedMatrixQ n` (`ProductionSmoothingRounding.lean`:
`savedEntryQ U V W D S n c e = ⌊√(S²·Num²/(D^{2n}·F))⌋/S`, `Num = matrixMomentNumerator U V W
(n−c) c (n−e) e`, `U, V, W = 990987078608458638622543, 29500621630600679093812,
903440112391457239941125`, `D = 10²⁴`, `S = 10²²`, `F = entryFactorial`), whose distance to the
true symmetric powers `Sym^n(M)` master bounds by `4·10⁻¹⁵` relative (`production_smoothing_error`).
`energy G (n, m)` sums `|⟨hvec2 i, G⟩|²` over `bideg i = (n, m)` (`Energy2.lean`); for the graded
mode `((q+1−c, q−d), (c, d))` the bidegree is `(2q+1−m, m)` with `m = c + d`, so
`energy (retainedSmoothed a0) (2q+1−m, m) = Σ_{c+d=m} (S_{q+1} A_q S_qᵀ)[c][d]²`, and the head is
`n + 3m ≤ 501` (21,168 bidegrees, all with `n + m` odd).

**Computation (milestone 3).**
1. `a0`: the F₀ head coefficients are the milestone-2 enclosures. The grade-`q` matrix `A_q`
   (`c ≤ q+1`, `d ≤ q`) is assembled from the raw blocks exactly as the archived finalizer did
   (`FINAL_ROTATION_AND_RESIDUAL_PROOF.md` §1): canonical `c ≤ d+1` from block `k = d+1−c`, row
   `j = q−d`, column `c` (`c−1` for `k = 0`); non-canonical `c > d+1` by the reflection
   `I_{c,d} = √((d+1)/c)·I_{d+1,c−1}` from block `k = c−d−1`, row `j = q+1−c`, column `d+1`
   (`F0ConditionalEvaluator.production_reflected_indices`; the sign exponent `c+d` is preserved);
   then `v` is added. Every entry is carried as the interval `[lo, hi]/2¹²⁸` of the raw run (the
   reflection factor as an outward dyadic enclosure), so the result holds for every `a0` in the
   box, in particular for the midpoints, and `hraw` for that `a0` costs the half-widths
   (ℓ² ≲ 10⁻²⁴) plus the analytic terms of §6.
2. The saved matrices `S_n`, `n ≤ 251`, are computed **exactly** from their definition (big
   integers, one `Nat.sqrt` per entry: 5,365,627 entries over `S = 10²²`), then enclosed at
   `2⁻¹²⁸`.
3. The rotation `D_q = (S_{q+1} A_q) S_qᵀ` in fixed-point interval arithmetic (products exact at
   `2⁻²⁵⁶`, sums rounded outward to `2⁻¹²⁸` after each product), the energies
   `E_q(m) = Σ_{c+d=m} D_q[c][d]²` at `2⁻²⁵⁶`, sharded by grade `q` on big (40 shards).
4. Comparison with `energyTable` (`data/upper-preprocess/certificate.json`, equal to the archived
   `X_energy_N501.npy`): the excursion `max(lo − t, t − hi, 0)` and the midpoint difference per
   bidegree; max, ℓ², ℓ¹ over the head and by bands of `m` and of `n + 3m`; the bound
   `Σ_{head} excursion` is the certified `htable` value for the midpoint `a0`; also the total
   mass `Σ_{all (n,m)} E` (`‖retainedSmoothed a0‖² ≤ (501/500 + δ)²`).

**What it discharges numerically / what stays analytic.** Numerically (with S1 + the exact
rational definitions): `htable` for the midpoint `a0` (the whole chain from the saved matrices
and `v` is finite rational arithmetic, enclosed); the half-width part of `hraw`. Analytic (stated
in §6, not yet proved): S2 (seed), S3/S4 (ratios, pairs), S5 (transport, not used: the recurrence
ran on the shift interval itself), S6a (brackets, verified numerically by sign changes but the
root-isolation theorem is on master), S6b/S6c (the Gauss–Legendre remainder and the integrand
bound: the only non-finite part of `hraw`, inherited from the archived `6.73·10⁻¹⁶` per raw
coefficient, i.e. `1.55·10⁻¹²` in ℓ²), the cutoffs' omitted-pair bound (`10⁻²⁷` per coefficient,
archived), S8 (root windows, not needed on the committed partition since the gaps are excluded
and the gap mass `1.64·10⁻¹⁶` is part of the archived remainder), S9 (exists on master).

**Degree-one reference (explicit caveat).** `data/retained-f0/degree-one-table.json` records
the two grade-0 energies `(1,0)` and `(0,1)` recomputed on master from the *committed* raw words
(flat indices 0 and 63001), the frozen correction and the saved matrix `S_1` with an exact
residual `7.5·10⁻¹⁷` against the table; that reference is an exact-arithmetic replay of the
committed inputs, not an independent evaluation of the integrals. Milestone 3 reproduces these
two entries from the milestone-2 enclosures (which differ from the committed words by
`3.3·10⁻¹⁶` and `1.67·10⁻¹⁵`), so its degree-one energies differ from the table at the
`10⁻¹⁵` level by construction; this is reported, not hidden, in §10.

## 10. Milestone 3: results of the rotation and the energy comparison

Run of 4 November 2026 (branch at `908385dd3`, big droplet, 24 niced shards sharing the machine
with another job): the 252 saved matrices `S_0 … S_251` computed exactly (`quadrun smat`;
`S_251` alone is 63,504 entries of 20,000-bit arithmetic, ≈ 2 min uncontended; the whole set
≈ 2 CPU-hours), then the 251 grades rotated (`quadrun rotate`: ≈ 35 s to read the 277 MB raw
vector per shard, 5.6–7.6 s per large grade, ≈ 10 CPU-minutes in all, ≈ 3 min wall). Output:
63,252 bidegrees `(n, m)` with enclosures at `2⁻²⁵⁶` (`handoff/quad-checker/en/energy-*.txt`);
comparison `data/quad-checker/energy-comparison.json` (`tools/quad_compare_energy.py`, exact
rationals).

**Agreement with `energyTable` over the 21,168 head bidegrees `n + 3m ≤ 501`:**

| quantity | excursion of the table value from the enclosure | midpoint difference |
|---|---|---|
| maximum | 2.723·10⁻¹⁵ at `(1, 0)` | 2.723·10⁻¹⁵ |
| ℓ² | 2.730·10⁻¹⁵ | 2.730·10⁻¹⁵ |
| **ℓ¹ = Σ_{head} excursion = the certified `htable` value** | **3.116·10⁻¹⁵** | 3.116·10⁻¹⁵ |

Largest enclosure width 2.2·10⁻²⁸. By band of `m` (max / ℓ² / ℓ¹ of the excursion):
`m < 20`: 2.72·10⁻¹⁵ / 2.73·10⁻¹⁵ / 3.12·10⁻¹⁵ (4,740 entries); `20 ≤ m < 40`: 1.1·10⁻²¹ /
8.9·10⁻²¹ / 2.7·10⁻¹⁹; `40 ≤ m < 60`: 2.0·10⁻²² / 7.0·10⁻²² / 8.8·10⁻²¹; `60 ≤ m < 80`: 6.4·10⁻²⁶;
`80 ≤ m < 100`: 1.7·10⁻³¹; `m ≥ 100`: below 3.5·10⁻³³. By band of `n + 3m`: `< 100`: 2.72·10⁻¹⁵
(867 entries, the whole budget); `100–199`: 2.3·10⁻²⁰ max, 1.0·10⁻¹⁸ ℓ¹; `200–299`: 3.2·10⁻²¹;
`300–399`: 7.5·10⁻²²; `400–499`: 5.2·10⁻²²; `500–501`: 2.6·10⁻²². Masses: the head enclosure
`[0.998823203657, 0.998823203657]` equals the table's head mass `0.998823203657` to the digits
shown; all 63,252 computed bidegrees sum to at most `0.998996120728` (`‖retainedSmoothed a0‖² ≤
(501/500)²` holds with a wide margin).

**Entries outside tolerance.** None against any tolerance of the reduction: the only excursion
above `10⁻¹⁵` is the degree-one energy `(1, 0)` (table `0.71815943001876215`, enclosure
`0.71815943001876492`, 2.72·10⁻¹⁵), and it is exactly the effect of the milestone-2 raw
difference at the largest coefficient (`k = 1, j = 0, c = 0`: `0.8475`, differing from the
committed word by 1.67·10⁻¹⁵; the energy is the square of the rotated coefficient, so
`2 · 0.847 · 0.99 · 1.67·10⁻¹⁵ ≈ 2.8·10⁻¹⁵`), i.e. the archived pipeline's binary64 error in that
word, not an error of the checker; `(0, 1)` differs by 1.8·10⁻¹⁶ for the same reason
(`data/retained-f0/degree-one-table.json`, which replays the *committed* words exactly, has the
residual 1.4·10⁻¹⁶ against the table: the two statements are consistent, see §9's caveat).

**Against the reduction's tolerances.** `original_energy_of_retained_source` needs
`htable ≤ 3·10⁻¹²`: measured `3.116·10⁻¹⁵`, a factor 960 below. Through the parametric
`selected_energy_close_of_raw_error` with `δ` = the half-widths of the raw enclosures (ℓ² ≤
`2·10⁻²⁷`) plus the inherited analytic remainder (`1.55·10⁻¹²`, §6) — `Δ = δ + 4·10⁻¹⁵(501/500 + δ)
≈ 1.55·10⁻¹²` — the energy budget `τ ≥ (2·501/500 + 3Δ)Δ + ε ≈ 3.1·10⁻¹² + 3.1·10⁻¹⁵` is 4.4 times
below `energyErrQ = 1.369·10⁻¹¹`; the relaxed budget of #21 (`4·10⁻⁸`) is three orders of
magnitude away. So the table is accurate at the `10⁻¹⁵` level, and the whole numerical content
of `hclose` is now reproduced by the checker; what separates this from a Lean proof of `hclose`
is the list of analytic obligations of §6 (S1–S6, the omitted-pair bound of the cutoffs) and the
native facts that would evaluate the checker.

## 11. Milestone 4: the Lean bridge from the executable checker to `hclose` (design)

### 11.1 The statement chain

All executable definitions live in the precompiled, Mathlib-free `GrotheQuadKernel`; every
soundness theorem lives in `Grothe/UpperQuad/` (Mathlib + the kernel's definitions, kernel-checked,
no `native_decide` until step 4). Inputs are Lean literals generated from the committed data
(`tools/quad_gen_partition.py --lean`, to be added: `Grothe/UpperQuad/Data/Panels.lean`,
`Cutoffs.lean`, `Profile.lean`, provenance in `data/quad-checker/README.md`), each tied to master
by a kernel-checked equality (`panelsData = sourcePanels` with the brackets of
`Q0LegendreRuleNN.brackets`, `profileData.coeffs = profileQ`, `profileData.a = aQ`, by `decide`
or `rfl` on the literals).

```
-- membership of a real number in a floating dyadic interval (Grothe/UpperQuad/IntervalSound.lean)
def mem (x : ℝ) (a : Ival) : Prop := (a.lo : ℝ) * 2^a.e ≤ x ∧ x ≤ (a.hi : ℝ) * 2^a.e

-- (A) node layer, GrotheQuadKernel.Contract: for a node range [lo, hi) the kernel returns the
--     accumulated contribution to the raw vector; the theorem (Grothe/UpperQuad/NodeSound.lean):
theorem nodeRange_sound (hS2 : SeedHyp) (hS6 : GaussHyp) … (i : Nat) (hi : lo ≤ i < hi) :
    ∀ k j c, memFx (Σ_{nodes i' ∈ [lo,hi)} W_{i'} · e^{−s_{i'}} · radialFactor k j s_{i'} ·
               profileSign s_{i'} ^ (c+d) · (canonicalCoefficient (profileShift s_{i'}) (c, d)).re)
             (rangeAccumulator inputs lo hi)[k, j, c]
--     i.e. the exact Gauss–Legendre partial sum of every raw coefficient over the nodes of the
--     range lies in the kernel's fixed-point interval (sign and cutoff as committed).

-- (B) assembly, GrotheQuadKernel.Rotate: from the total accumulator R (the sum of the ranges,
--     exact integer addition) the kernel checks, for the midpoint family a0 := mid R (a
--     computable rational function of the committed inputs, hence a Lean definition, no data):
--       (B1) rawDistOK R δ : Bool    -- Σ_{k,j,c in the triangle} (half-width)² ≤ δ²
--       (B2) energyOK R v table ε : Bool   -- S_n exact, D_q, Σ_{head} |E − table| ≤ ε
--     with theorems energyOK_sound : energyOK … = true → htable (midpoint a0) ≤ ε, and
--     rawDistOK_sound : … → ‖gradedHermite 251 a0 − (exact Gauss sums)‖ ≤ δ.

-- (C) the analytic layer (hypotheses, Grothe/UpperQuad/Bridge.lean): the exact Gauss sums
--     differ from productionF0Head by the quadrature remainder, the omitted pairs and the gaps:
--       hQuad : ‖productionF0Head − (exact Gauss sums as gradedHermite)‖ ≤ ρ      -- S6b, S6c, cutoffs
--     together with the seed/ratio/pair facts that the node layer needs (S2–S4 as hypotheses
--     on the real functions, discharged when proved).

-- (D) the top theorem (Grothe/UpperQuad/Bridge.lean):
theorem hclose_of_checks (hranges : ∀ r ∈ ranges, rangeAccumulator … = partial r)
    (hraw : rawDistOK R δ = true) (htab : energyOK R v table ε = true)
    (hQuad : …) (hS2 hS3 hS4 hS6a : …)
    (hbudget : (2·501/500 + 3Δ)Δ + ε ≤ energyErrQ, Δ = δ + ρ + 4·10⁻¹⁵(501/500 + δ + ρ)) :
    ∑ p ∈ headIdx 501, |energy X p − energyTable p| ≤ energyErrQ
--   by selected_energy_close_of_raw_error (ProductionRetainedEnergy.lean) with a0 := mid R.
```

Obligations that become theorems in this milestone: **S1** (all of it: `norm`, `addI`,
`mulI`, `divI`, `sqrtI`, `expPosI` given the series tail lemma, `powI`, the fixed-point export
and `word64`), **S4b** given S3 (the pair enclosure as the reflection of the proved recurrences
`normalizedCoefficient_zero_row_step` / `_forward` through S1), **S6a** (a sign change of `P_n`
on a bracket gives a root in it, by the intermediate value theorem on the recurrence
polynomial; the bracket is the node's enclosure and `weightI` encloses `panelWeight`),
**S7** (the comparison), the block layout (the index map of `Contract` equals
`gradedMode`/`production_reflected_indices`) and the rotation (`mulSA`/`mulBT` enclose the
rational products `S_{q+1} A S_qᵀ` of `productionSmoothedCoeff`, with `savedEntryNum` equal to
`productionSavedEntryQ` by `decide`-free unfolding of the shared definition), hence **(B)**.
Obligations that stay explicit hypotheses: **S2** (the two seed enclosures: the series tail
needs `Real.exp`-type bounds beyond Mathlib's `|x| ≤ 1` lemma; the Watson form needs the Beta
integral), **S3** is on master (`ratio_backward_enclosure`) and is used, **S5** not needed (the
recurrence runs on the shift interval), **S6b/S6c** (the Bernstein-ellipse remainder and the
integrand bound: the only genuinely analytic part of `hraw`, `ρ ≈ 1.55·10⁻¹²` inherited), the
cutoffs' omitted-pair bound (`10⁻²⁷` per coefficient, archived), **S8** not needed on the
committed partition. The isolation theorem for the brackets (a sign change gives *a* root; that
it is *the* root `Q0GaussSelectedChoice` uses needs the uniqueness `all_unique` of master's
`Q0LegendreRuleNN`, which exists) is reused from master.

### 11.2 Sharding the native facts (the open design decision)

The raw vector is additive over nodes but the energies are not, so node-range facts need their
partial sums as Lean terms. Three options, costed with the milestone-2/3 measurements
(≈ 20 CPU-h for the nodes, ≈ 2 CPU-h for the saved matrices, 10 CPU-min for the rotation):
1. **One fact per node range, partial sums committed as data** (the `CapTablesData` pattern):
   each range fact checks `rangeAccumulator ⊆ partial_r` against a committed dyadic table; the
   final fact adds the tables exactly and runs (B). Data size is the problem: the full partial is
   2.7·10⁶ triangle entries per range; restricted to the entries above `10⁻²⁰` (≈ 5·10⁵) at
   2⁻⁶⁰ with per-block bounds for the rest, ≈ 5 MB per range, 8 ranges ≈ 40 MB of committed
   data (the committed raw array is 43 MB). Facts: 8 × 2.5 CPU-h + 1 × 2.5 CPU-h.
2. **Output sharding with recomputation**: fact `k`-band recomputes every node's triangle and
   accumulates only its charge blocks; no new data; cost `(#facts) × 8 h + 12 h`: 4 facts of
   ≈ 11 CPU-h each. Too long per fact for the hosted runners (6 h), acceptable only on the droplet.
3. **One sequential fact** (≈ 22 CPU-h): simplest statement, droplet only, no sharding; the
   cap rows precedent is 21 CPU-h in 15 facts.
Recommendation: option 1 with 8 node ranges and the compact partial tables, unless the user
prefers to avoid 40 MB of data, in which case option 2 on the droplet. Step 4 of this milestone
(the row-227 fact) measures the `native_decide` overhead before the choice is made.

### 11.3 Workflow and script changes needed (for a hand-merged workflow PR)

```
.github/workflows/lean.yml
  LEAN_PATHS:  add  GrotheQuadKernel/|GrotheQuadKernel\.lean$|QuadRun\.lean$
  HEAVY_TREE:  add  GrotheQuadKernel/
  sorry grep (both occurrences, and the one in cloud.yml):
     … Grothe GrotheKernel GrotheCapsKernel GrotheQuadKernel Grothe.lean GrotheKernel.lean GrotheCapsKernel.lean GrotheQuadKernel.lean QuadRun.lean …
scripts/caps_stamp.py
  PROJECT_PREFIXES: add "GrotheQuadKernel."      PROJECT_ROOTS: add "GrotheQuadKernel"
  EXTRA: add "GrotheQuadKernel.lean"
scripts/test_caps_stamp.py
  the fixtures that enumerate the libraries (lines 39, 132, 177–181): add GrotheQuadKernel
```
`tools/gen_root_imports.py` already lists the four libraries (`LIBS`). `lakefile.toml` already
has the library and the `quadrun` executable (not a default target).
