# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.40160592 < K_G^ℂ < 1.404599424**

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
| Oct 2026 | **this repository** | **1.40160592 < K** | **K < 1.404599424** |

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
  norm is capped by B = 713467303/10⁹ through 19 rows with coupling vectors and a scalar
  envelope. Each row bounds E Ψ(|q|) − κσ² over all residuals q, a normalised cubic chaos of
  bidegree (2,1): for small σ by moment rectangles, and beyond by nodes at which a polynomial
  majorizes the potential plus a nonnegative combination of Stein cuts, joined by convexity in
  σ. The inputs on the law of |q|² are the sixth-moment inequality
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
  truncation (Taylor remainder of exp(iφ) with Hermite cutoffs 181, 91, 51, the bound |φ| < 1,
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
value) and `Grothe.Lower.lower_endpoint : 1/B ≤ K → 140160592/10^8 < K`.

* Proved: positivity certificates in integer arithmetic; PSD gates by exact LᵀDL
  factorisations; the Stein cuts from their two analytic inputs, by a completion of squares,
  and their polynomial pieces; the majorant sweeps over 9,234 nodes; the moment-rectangle
  covers; the integration against the law of |q|²; the chords in σ; the bound of every row
  from its Gaussian reduction; the mixture envelope; and the endpoint.
* Explicit hypotheses (not formalized): the Gaussian reduction of each row to an integrated
  potential, V ≤ t² − 2ℓt + 2β²/ε + E Ψ(σ√U) − κσ² − ε‖Qh + βv/ε‖², including its coupling
  vector; the node caps, convexity and Lipschitz bound of each potential (exact-arithmetic
  certificates outside Lean: interval integration of Young-type price bounds, and, on the rows
  near the maximum, anchored quadratic bounds with the convex hull of the cap table; slack 10⁻¹¹); the moment bounds on the law of U = |q|²; the two analytic
  inputs of the Stein cuts for that law; and the transfer from the Gaussian operator to finite
  matrices.
* The two analytic inputs of the Stein cuts are, with w = Γ(q, q̄)/3 and c = Γ(q, q)/3, the
  fluctuation bound E w = 1, Var(w) + ½E|c|² ≤ (E|q|⁴ − 2)/3, and the integration by parts
  E[Φ(U) − φ(U)] = E[(w−1)φ(U) + Re(c q̄²/U)·(φ(U) − Φ(U)/U)] for piecewise-linear tests φ with
  primitive Φ. Both are proved in Lean: for real polynomials a, b in the third Gaussian chaos
  with E a² = E b² = ½ and E ab = 0, the law of a² + b² under the standard Gaussian measure
  satisfies them with no further hypothesis (`Grothe.LowerAnalytic.gaussian_steinInputs`).
  They remain hypotheses of the main theorem only because that theorem is stated for an
  abstract law of U, the Gaussian reduction being itself assumed.
* Also proved, as standalone lemmas in `Grothe/LowerAnalytic/`: the three-moment lemma, the
  scalar sixth-moment and first-moment certificates from their tensor hypotheses, the
  Schur-complement gate, and the square completion for the coupling vector.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus `native_decide` facts for the finite
exact computations (listed by `lake env lean scratch/Axioms.lean`; checked in CI). No `sorry`,
no warnings.

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality |
| `Grothe/Upper/` | residual transfer, kernel composition, interval soundness, head check, final theorem |
| `GrotheKernel/` | the fixed-point interval evaluator used by the head check |
| `Grothe/Lower/` | positivity certificates, gates, Stein cuts, row and envelope checkers, final theorems |
| `Grothe/Lower/RowData*.lean`, `Grothe/Upper/Data.lean` | generated certificate data |
| `Grothe/LowerAnalytic/` | analytic lemmas: Gaussian integration by parts, fluctuation bound, moment certificates |
| `tools/` | generators of the data modules from the research archives |
| `scratch/Axioms.lean`, `scripts/check_axioms.py` | the axiom report and its check |

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
```

The two long native checks (`Grothe/Upper/Final.lean`, `Grothe/Lower/RowCheck.lean`) run
their branches in parallel and take a few minutes each on 8 cores. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
and verifies the axiom report. The generated data modules come from the research archives (not
part of the repository); the generators are in `tools/`.
