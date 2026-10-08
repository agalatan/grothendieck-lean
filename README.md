# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4, Mathlib) for bounds on the complex Grothendieck
constant `K_G^ℂ`.

## Bounds

| | lower | upper |
|---|---|---|
| literature (Heilman–Jones–Malavolta, [arXiv:2609.25462](https://arxiv.org/abs/2609.25462), Sept 2026) | 1.4 | 1.404898554746 |
| this repository (`master`, machine-checked) | **1.4009320536** | **1.404898359045958** |
| branch `upper-480` (slower check, merged last) | — | 1.404898357808 |

Both bounds use the Heilman–Jones–Malavolta framework: the upper bound from a mixture of six
Gaussian rounding kernels with 240 retained radial modes and a common polynomial preprocessor
(480 modes on the `upper-480` branch, whose check takes four times longer), the lower bound
from the Gaussian witness `T = P₁,₀ − ε·P₂,₁`, `ε = 7400323787/10¹⁰`, with an operator-norm cap
`B = 7138104931/10¹⁰` certified by 47 retained-square support rows (coupled, pointwise and
shifted profiles with global polynomial majorants) and a 116-interval scalar envelope.

For context, the real constant currently satisfies 1.773 ≤ K_G ≤ 1.7799
([arXiv:2610.10477](https://arxiv.org/html/2610.10477)).

## What is proved in Lean

`IsGrothendieckBound K` (in `Grothe/Transfer.lean`) means `V(A) ≤ K·C(A)` for every finite
complex matrix `A`, where `C(A)` is the optimum over unimodular scalars and `V(A)` the optimum
over unit vectors in finite-dimensional complex Hilbert spaces; i.e. `K_G^ℂ ≤ K`.

* **Upper bound** — `Grothe.complex_grothendieck_upper : … → IsGrothendieckBound (1404898359045958/10¹⁵)`.
  Proved: the transfer inequality (tensor powers), validity and mixing of rounding kernels,
  admissibility of the polynomial preprocessor and composition on the disc, Haagerup's
  coefficients with the Wallis-type estimate `hₙ < 1/(4(n+¼)(n+1))`, the weighted
  Cauchy–Schwarz energy tail, all tail reserves, and the finite certificate: a sound fixed-point
  interval checker (`GrotheKernel/`, 2⁻¹²⁸ outward rounding, soundness proved in
  `Grothe/Upper/IntervalSound.lean`) evaluating the 240 boxed mixture coefficients composed with
  the preprocessor through radial degree 57240.
  Hypotheses (not formalized): domination of the six kernels (Haagerup's Gaussian phase
  identity), containment of the truncated radial coefficient integrals in the data boxes (Arb
  quadrature), the scalar coefficient identification, the sixth kernel's first-order energy
  decomposition with its three energy caps, the Cauchy tails of kernels 1–4, and the finite
  part of the fifth tail.
* **Lower bound** — `Grothe.Lower.envelope_bound_data` (`V ≤ B` for every admissible scalar
  profile value) and `Grothe.Lower.lower_endpoint : 1/B ≤ K → 14009320536/10¹⁰ < K`.
  Proved: Bernstein bounds, PSD gates by exact `LᵀDL` factorizations, rectangle covers, all
  profile caps, chord domination of the physical polynomials, the ε-transfer and dilation of
  support rows, the fixed-mixture scalar envelope, the
  three-moment lemma, the `C₆` and `ρ` positivity certificates, the variance/retained-square
  identities, joint convexity and argument allocation, the Schur-complement gate.
  Hypotheses (not formalized): the Gaussian profile reduction `V ≤ Fᵢ(t) − ε‖Qh + βᵢv/ε‖²`, the
  lifted node caps of the potentials (Gaussian price enclosures), the Wick sixth-moment identity,
  and the transfer from the Gaussian operator to finite matrices.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus `native_decide` facts for the finite
exact computations (listed by `lake env lean scratch/Axioms.lean`; checked in CI).

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
```

`Grothe/Upper/Value.lean` evaluates the interval checker once by `native_decide` (about
20 minutes; about 80 on the `upper-480` branch); CI (`.github/workflows/lean.yml`) builds everything on every push to `master`,
forbids `sorry`, and checks the axiom report. The generated data modules come from research
archives that are not part of the repository; the generators are in `tools/`.
