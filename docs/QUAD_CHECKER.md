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
