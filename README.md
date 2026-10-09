# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.40104026363 < K_G^ℂ < 1.404875854410**

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
| Oct 2026 | **this repository** | **1.40104026363 < K** | **K < 1.404875854410** |

For orientation, the real constant has a longer numerical history: Krivine's upper bound
π / (2 log(1+√2)) = 1.78221… (1979) was shown to be non-optimal by Braverman, Makarychev,
Makarychev and Naor (2011); Davie and Reeds gave lower bounds near 1.677; and in 2026
computer-assisted certificates narrowed the interval to 1.773 ≤ K_G^ℝ ≤ 1.7799
([arXiv:2608.11158](https://arxiv.org/abs/2608.11158),
[arXiv:2610.10477](https://arxiv.org/html/2610.10477)).

Our bounds stay inside the Heilman–Jones–Malavolta framework and are the product of a
collaboration between several AI research systems (the numerical constructions and
certificates) and this Lean development (the machine-checked verification):

* **Upper bound.** A mixture of 13 Gaussian rounding kernels: ten Haagerup phase roundings
  composed with polynomial preprocessors, and three two-coordinate roundings
  phase(Z·p(|Z|²) + W·q(|Z|²)), where Z is a Gaussian coordinate with correlation ρ(t) and W an
  independent coordinate carried by higher chaos (correlation σ(t) ≈ −0.34t³ − 0.66t⁷). Their
  kernels are Σ μ[n,m] ρ(t)ⁿσ(t)ᵐ with μ the chaos-mass table of the rounding, enclosed by
  rigorous quadrature on a 200×40 box; the mass outside the box is charged through ‖ρ‖²⁰¹ and
  ‖σ‖⁴¹. 2048 radial coefficients are retained.
* **Lower bound.** The Gaussian witness T = P₁,₀ − ε·P₂,₁ with ε = 7400323787/10¹⁰, whose
  L^∞ → L¹ norm is capped by B = 71375536161/10¹¹ through 31 profiles (17 sources, 10 averaged
  shifted sources and 4 shared-moment joins, each with global polynomial majorants and a
  moment-rectangle cover), 32 retained-square support rows and a 121-cell scalar envelope, using
  the sixth-moment inequality E|q|⁶ ≤ 9m − 12 + 40.45313·(m−2)^{3/2} (charge-separated tensor
  estimates) and the first-moment bound E|q| ≤ 0.973612157 for normalised cubic chaos. Then
  K_G^ℂ ≥ 1/B.

## What exactly is proved in Lean

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Upper bound.** `Grothe.complex_grothendieck_upper : … → IsGrothendieckBound (140487585441/10^11)`.

* Proved from scratch: the transfer inequality via tensor powers, validity and mixing of
  rounding kernels, admissibility of polynomial preprocessors and composition on the disc,
  Haagerup's coefficients with the Wallis-type estimate h_n < 1 / (4(n+¼)(n+1)), the
  positive-majorant tails, the two-coordinate composition Σ μ[n,m] ρⁿσᵐ with its coefficient
  enclosures and the tail bound for the part of the table outside the box, and the finite
  certificate itself, evaluated by a sound fixed-point interval checker (`GrotheKernel/`,
  outward rounding at 2⁻¹²⁸, soundness proved in `Grothe/Upper/IntervalSound.lean` and
  `Grothe/Upper/TwoCoordinate.lean`).
* Explicit hypotheses (not formalized): domination of Haagerup's phase kernel (Haagerup's
  Gaussian identity); validity of each two-coordinate rounding kernel (a Gaussian process with
  the stated correlations ρ, σ); the enclosures of the chaos-mass tables and the Parseval
  bounds on the mass outside the box (rigorous Arb quadrature); and the Cauchy tail estimate
  beyond 2048 coefficients for the five main Haagerup branches, which carry 99% of the
  mixture weight (numerically sup|𝔥∘ρ| ≈ 0.76 on the circle of radius 1.06 against the assumed
  bound 10).

**Lower bound.** `Grothe.Lower.lower_bound_data` (V ≤ B for every admissible scalar profile
value) and `Grothe.Lower.lower_endpoint : 1/B ≤ K → 140104026363/10^11 < K`.

* Proved: Bernstein bounds (univariate and bivariate), PSD gates by exact LᵀDL factorisations,
  rectangle covers, all profile caps, chord domination of all physical polynomials, the
  ε-transfer and dilation of support rows, the fixed-mixture envelope, the three-moment lemma,
  the scalar sixth-moment and first-moment certificates, the variance and retained-square
  identities, joint convexity and argument allocation, and the Schur-complement gate.
* Explicit hypotheses (not formalized): the Gaussian profile reduction
  V ≤ F_i(t) − ε‖Qh + β_i v/ε‖², the node caps of the potentials (Gaussian price enclosures),
  the tensor and Wick identities behind the sixth-moment bound, and the transfer from the
  Gaussian operator to finite matrices.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus `native_decide` facts for the finite
exact computations (listed by `lake env lean scratch/Axioms.lean`; checked in CI). No `sorry`,
no warnings.

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
```

The two long native checks (`Grothe/Upper/Final.lean`, `Grothe/Lower/ProfileCheck.lean`) run
their branches in parallel and take a few minutes each on 8 cores. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
and verifies the axiom report. The generated data modules come from the research archives (not
part of the repository); the generators are in `tools/`.
