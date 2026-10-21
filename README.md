# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.401674103 < K_G^ℂ < 1.404599424**

## The constant

For a complex matrix A = (a_ij) compare two optimisation problems: over unimodular scalars,

    C(A) = sup |Σ a_ij · conj(ε_i) · δ_j|        over |ε_i| = |δ_j| = 1,

and over unit vectors in a complex Hilbert space,

    V(A) = sup |Σ a_ij · ⟨x_i, y_j⟩|            over ‖x_i‖ = ‖y_j‖ = 1.

Grothendieck's inequality (1953) says that V(A) ≤ K · C(A) for a universal constant K,
independent of the matrix size and of the Hilbert-space dimension. The smallest such K is the
complex Grothendieck constant K_G^ℂ. Its exact value is unknown, as is that of the real
constant K_G^ℝ (real matrices, sign vectors). The inequality governs tensor norms, absolutely
summing operators, semidefinite relaxations of quadratic optimisation, and the gap between
classical and quantum correlations in two-party Bell experiments.

## How the bounds evolved

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | Grothendieck | | K < ∞ (the inequality itself) |
| 1984 | Davie | 1.33807 < K | |
| 1987 | Haagerup | | K < 1.40490913… (Gaussian phase rounding) |
| Sept 2026 | Guo, Fang, Lu ([arXiv:2609.07000](https://arxiv.org/abs/2609.07000)) | 1.35584631827168 < K | |
| Sept 2026 | Heilman, Jones, Malavolta ([arXiv:2609.25462](https://arxiv.org/abs/2609.25462)) | 1.4 < K | K < 1.404898554746 |
| Oct 2026 | **this repository** | **1.401674103 < K** | **K < 1.404599424** |

For orientation, the real constant has a longer numerical history: Krivine's upper bound
π / (2 log(1+√2)) = 1.78221… (1979) was shown to be non-optimal by Braverman, Makarychev,
Makarychev and Naor (2011); Davie and Reeds gave lower bounds near 1.677; and in 2026
computer-assisted certificates narrowed the interval to 1.773 ≤ K_G^ℝ ≤ 1.7799
([arXiv:2608.11158](https://arxiv.org/abs/2608.11158),
[arXiv:2610.10477](https://arxiv.org/html/2610.10477)).

Our bounds stay inside the Heilman–Jones–Malavolta framework and are the product of a
collaboration between several AI research systems (the numerical constructions and
certificates) and this Lean development (the machine-checked verification):

* **Upper bound.** A smoothed two-coordinate Gaussian rounding,
  phase(z + √(1+a²)·v(|z|²)·w) with a twelve-term Laguerre profile v, multiplied by a damped
  polynomial phase exp(iφ), φ = Im(z̄w)·exp(−21(|z|²+|w|²)/20)·P with P a polynomial in |z|²,
  |w|², Re(z̄w). Its correlation kernel is H(t) = Σ E[n,m]·p(t)ⁿ·(−τ(t))ᵐ, with p odd of degree
  101 and τ(t) = (t³ + a²t⁷)/(1 + a²), and it is compared directly with c·t, c = 625000/877873,
  through the kernel of a polynomial truncation of the rounding. The bound is
  1/(c − ‖H − c·t‖), with the residual at most 133/10⁸.
* **Lower bound.** The Gaussian witness T = P₁,₀ − ε·P₂,₁ with ε = 149/200, whose L^∞ → L¹
  norm is capped by B = 7134326/10⁷. Each of 19 rows bounds E Ψ(|q|) − κσ² over all residuals q,
  a normalised cubic chaos of bidegree (2,1): for small σ by moment rectangles, and beyond by nodes
  at which a polynomial majorizes the potential plus a nonnegative combination of Stein cuts, joined
  by convexity in σ (rows 0.84–0.855 use 396-node cap tables with anchored and localised quadratic
  caps). Near the maximum, t ∈ [0.847, 0.8545], the rows share one residual (a common law), and
  3,219 boxes in (t, τ, x) mix two rows or two joint node batches; elsewhere fixed mixtures of two
  row caps cover t ∈ [0, 9/10]. The inputs on the law of |q|² are the sixth-moment inequality
  E|q|⁶ ≤ 9m − 12 + 40.45313·(m−2)^{3/2}, the first-moment bound E|q| ≤ 0.973612157, and the
  Stein cuts, a family of inequalities E G(|q|²) ≥ 0 obtained from a fluctuation bound and a
  Gaussian integration by parts. Then K_G^ℂ ≥ 1/B.

## What exactly is proved in Lean

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Upper bound.** `Grothe.complex_grothendieck_upper : KernelHyps E EX E0 → IsGrothendieckBound (87787300000000/62499883242891)`,
and `Grothe.upper_value_lt` shows this is below 1.404599424. Here E, EX, E0 are the energy
tables of the rounding, of its polynomial truncation, and of the rounding without phase.

* Proved from scratch: the transfer inequality via tensor powers and its residual form
  K ≤ 1/(c − ‖H − c·t‖); the ℓ¹ contraction and linearity of the kernel composition; that the
  head through degree 501 depends only on energies with n + 3m ≤ 501; the evaluation of the
  head of the stored table of the truncation (21,168 exact dyadic entries) by a sound
  fixed-point interval checker (`GrotheKernel/`, soundness in
  `Grothe/Upper/IntervalSound.lean`); the tail bound by Cauchy–Schwarz from a weighted
  square-sum bound; the assembly of the budgets; and the endpoint arithmetic.
* Explicit hypotheses (not formalized): validity of the rounding kernel; summability and parity
  of the energies; the comparison Σ|E − EX| ≤ 2497/(2·10⁹) between the rounding and its
  truncation (the mixed Taylor/cutoff lemma, archived with its scripts in the research folder
  `handoff/upper-residual/global_norm/MIXED_TAYLOR_CUTOFF_LEMMA.md`; Taylor remainder of exp(iφ) with Hermite cutoffs 181, 91, 51, the bound |φ| < 1,
  a Bargmann Hilbert–Schmidt estimate, and directed coefficient enclosures); the weighted
  square-sum bound 7/4 at radius 259/250 for the rounding without phase (a Gaussian weighted
  Schur estimate plus a 65,536-arc contour certificate); and two table budgets below 3·10⁻¹¹.
* **How much rests on these hypotheses.** Of the total residual 133/10⁸, the assumed comparison
  bound is 93.9%, the tail hypothesis 5.4%, and the computation verified in Lean
  (7.1427·10⁻⁹) 0.54%. The margin is 2.3·10⁻⁹, and the source's bound on |φ| is 0.99999963
  against the required 1. The bound therefore depends almost entirely on the external analysis
  behind the comparison hypothesis.
* **Independent replay.** The source computations were replayed on a different machine: the
  nodal table and the Taylor centre arrays were regenerated bit for bit, and the kernel head,
  contour tail, comparison and endpoint pass on the regenerated data (energy table reproduced
  to 1.2·10⁻¹⁶ in ℓ¹ under a different linear-algebra library). This is reproduction, not
  formal verification.

**Lower bound.** `Grothe.Lower.lower_bound_data` (V ≤ B for every admissible scalar profile
value under the simultaneous Gaussian reduction `SharedReduction`), `Grothe.Lower.lower_endpoint : 1/B ≤ K → 1401674103/10^9 < K`, and the transfer
`Grothe.Lower.lower_bound_of_transferL2 : TransferInputsL2 B → IsGrothendieckBound K → 1401674103/10^9 < K`,
where `TransferInputsL2 B` asks, for every δ > 0, for a finite measure space with an operator T on L²,
a scalar cap ‖⟨f, T g⟩‖ ≤ B over a.e. unimodular f, g, and families u, v in L² with Σₗ|uₗ|² ≤ 1 and
Σₗ|vₗ|² ≤ 1 a.e. and ‖Σ⟨uₗ, T vₗ⟩‖ ≥ 1 − δ.

**How the two halves fit.** These are two separate Lean theorems. `TransferInputsL2 B` does not
name the operator, so read alone it already contains the claim; its intended instance is the
Gaussian witness T = P₁,₀ − εP₂,₁, for which the scalar cap is what `lower_bound_data` gives
*on paper* through the Gaussian reduction. No Lean theorem derives the scalar cap of that T from
`lower_bound_data`; formalising this link (the witness on Lᵖ, unitary invariance, the z₁ ⊗ w
splitting and the explicit potentials) is the main missing piece of the lower bound.

* Proved: positivity certificates in integer arithmetic; the pinned gate price of every row
  (trailing gate block positive definite, κδ² ≤ δ + gatePrice); the Stein cuts from their two analytic inputs, by a completion of squares,
  and their polynomial pieces; the majorant sweeps over 9,237 nodes; the moment-rectangle
  covers; the integration against the law of |q|²; the chords in σ; the bound of every row
  from its Gaussian reduction; the mixtures of rows (the retained gate square mixes by an exact
  identity); the common-law certificate: 37 batches of 425 joint Stein node certificates for mixed
  potentials of rows 0.84–0.86, and 3,219 boxes of the slab [0.847, 0.8545] × [0, ρ] × [0, 31/4]
  (source, joint and joint-mixture boxes, pinned gate price X₁ = p); one cover of t ∈ [0, 9/10] by 230 regions
  (227 cap boxes, fixed mixtures of two certified row caps including the crude row, and the 3 slab regions);
  and the endpoint. All finite exact checks of the lower certificate are one `native_decide` (`cert_check`).
* Explicit hypotheses (not formalized): the crude row V ≤ t² + ερ² − ε‖Qh‖² (`hcrude`; on paper it follows
  from ‖Qk‖ ≤ E|Qk/‖Qk‖| ≤ ρ, which uses the moment bounds also for the cubic Qk/‖Qk‖), with ‖v‖² = 2
  and 0 ≤ t ≤ 9/10; the simultaneous Gaussian reduction of the rows (`SharedReduction`): one residual p = Q_w c₁ with scale τ = ‖p‖₂ ≤ ρ and normalised law
  U = |p|²/τ² satisfying the moment bounds and the Stein inputs, one gate variable
  X = Q_w(c₁, c_A, conj c_B) with X₁ = p, and for every row its potential Ψ_r with the row inequality
  retaining the gate square, V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ√U) − δ_r τ² − E[X*N_r X + 2Re(conj p (g_r·X))] − ε‖Qh + βv/ε‖²; the node caps, convexity and Lipschitz bound of each potential (exact-arithmetic
  certificates outside Lean: interval integration of Young-type price bounds, and, on the rows
  near the maximum, anchored quadratic bounds and, on s ∈ [0.2, 0.4) ∪ [0.525, 0.6) of rows 0.84–0.855, localised anchored bounds
  (regions in the odd fibre directions, one S-lemma quadratic each, replayed in exact arithmetic), with the convex hull of
  the cap table; slack 10⁻¹¹); the moment bounds on the law of U = |q|²; the two analytic
  inputs of the Stein cuts for that law; and, for the transfer to finite matrices, the two Gaussian
  inputs of `TransferInputsL2`: the scalar cap of the witness T = P₁,₀ − εP₂,₁ over unimodular
  functions on Gaussian space and its value ≥ 1 − δ on u(z) = z/‖z‖ in large dimension. The
  transfer itself (finite partitions, phase choices on cells, L² approximation by ball-valued
  simple functions, passage to the limit) is proved in Lean (`Grothe/Lower/Transfer*.lean`).
* The two analytic inputs of the Stein cuts are, with w = Γ(q, q̄)/3 and c = Γ(q, q)/3, the
  fluctuation bound E w = 1, Var(w) + ½E|c|² ≤ (E|q|⁴ − 2)/3, and the integration by parts
  E[Φ(U) − φ(U)] = E[(w−1)φ(U) + Re(c q̄²/U)·(φ(U) − Φ(U)/U)] for piecewise-linear tests φ with
  primitive Φ. Both are proved in Lean for the Gaussian law: for real polynomials a, b in the third
  Gaussian chaos with E a² = E b² = ½ and E ab = 0, the law of U = a² + b² under the standard Gaussian
  measure satisfies them (`Grothe.LowerAnalytic.gaussian_steinInputs`).
  `Grothe.LowerAnalytic.lower_bound_gaussian` instantiates `lower_bound_data` with this law and
  discharges E U = 1, the integrability conditions, E U² ≥ 2, the cap E U² ≤ 62 ≤ 2 + (31/4)²
  (`gaussian_radU_cap`: E F⁴ ≤ 93 (E F²)² for every real third-chaos F, applied to a, b, a ± b),
  E√U ≤ ρ (derived from the other moment fields by `moments_of_three`) and both Stein inputs. Still
  assumed there: the sixth-moment bound E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2}, the gate variable and the per-row reduction
  (`RowShared`), and the crude row. `sixth_moment_complex` derives the sixth-moment bound from a
  cumulant bound, which is itself a hypothesis; it is not proved for the Gaussian law.
* Also proved, as standalone lemmas in `Grothe/LowerAnalytic/`: the three-moment lemma, the
  scalar sixth-moment and first-moment certificates (the sixth-moment one from its tensor and
  cumulant hypotheses), and the exact form of
  the fluctuation bound (`Influence.lean`): for a circular cubic chaos q = a + ib the slack in
  Var(w) + ½E|c|² ≤ (E|q|⁴ − 2)/3 equals (2‖Π₂,₂|q|²‖² + ‖Π₃,₁q²‖²)/18, with the quartic identity
  3κ = 4‖Π₁,₁|q|²‖² + 2‖Π₂,₀q²‖² + 2‖Π₂,₂|q|²‖² + ‖Π₃,₁q²‖², the influence inequality
  4‖Π₁,₁|q|²‖² + 2‖Π₂,₀q²‖² ≤ 3κ, and the weighted bound on the first-chaos content of q|q|²
  along any direction by the influence of that direction.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus exactly two `native_decide` facts:
`Grothe.head_check` (the upper head) and `Grothe.Lower.cert_check` (the lower certificate). All
other finite computations (the polynomial norms, the moment covers) are kernel-checked
(`decide +kernel`). The report is `lake env lean scratch/Axioms.lean`, checked in CI. No `sorry`,
no warnings.

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality in its residual form |
| `Grothe/Upper/` | residual algebra and Hardy tail, kernel composition, interval soundness, head check, final theorem |
| `GrotheKernel/` | the fixed-point interval evaluator used by the head check |
| `Grothe/Lower/` | positivity certificates, Stein cuts, rows, mixtures and boxes, the one cover of t ∈ [0, 9/10], the transfer to finite matrices, final theorems |
| `Grothe/Lower/RowData*.lean`, `Grothe/Upper/Data.lean` | generated certificate data |
| `Grothe/LowerAnalytic/` | analytic lemmas: Gaussian integration by parts, fluctuation bound, fourth-moment cap, moment certificates, the bridge `lower_bound_gaussian` |
| `tools/` | generators of the data modules from the research archives |
| `scratch/Axioms.lean`, `scripts/check_axioms.py` | the axiom report and its check |

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
```

The two long native checks (`Grothe/Upper/Final.lean`, `Grothe/Lower/RowCheck.lean`) run
their branches in parallel and take a few to twelve minutes each on 8 cores. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
and verifies the axiom report. The generated data modules come from the research archives (not
part of the repository); the generators are in `tools/`.
