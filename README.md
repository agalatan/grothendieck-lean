# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4, Mathlib) for bounds on the complex Grothendieck
constant `K_G^ℂ`.

## Bounds

| | lower | upper |
|---|---|---|
| literature (Heilman–Jones–Malavolta, [arXiv:2609.25462](https://arxiv.org/abs/2609.25462), Sept 2026) | 1.4 | 1.404898554746 |
| this repository (`master`, machine-checked) | **1.4009320536** | **1.404896257347** |

Both bounds use the Heilman–Jones–Malavolta framework. The upper bound comes from a
49-branch mixture of Gaussian rounding kernels: 30 scalar branches (Haagerup's phase kernel
composed with rational preprocessors), 18 preprocessed copies of the origin kernel and one
preprocessed copy of a second origin kernel with a modified phase polynomial, with 2048 retained
mixed coefficients and polarized energy tail bounds. The lower bound comes from the Gaussian
witness `T = P₁,₀ − ε·P₂,₁`, `ε = 7400323787/10¹⁰`, with an operator-norm cap
`B = 7138104931/10¹⁰` certified by 47 retained-square support rows (coupled, pointwise and
shifted profiles with global polynomial majorants) and a 116-interval scalar envelope.

For context, the real constant currently satisfies 1.773 ≤ K_G ≤ 1.7799
([arXiv:2610.10477](https://arxiv.org/html/2610.10477)).

## What is proved in Lean

`IsGrothendieckBound K` (in `Grothe/Transfer.lean`) means `V(A) ≤ K·C(A)` for every finite
complex matrix `A`, where `C(A)` is the optimum over unimodular scalars and `V(A)` the optimum
over unit vectors in finite-dimensional complex Hilbert spaces; i.e. `K_G^ℂ ≤ K`.

* **Upper bound** — `Grothe.complex_grothendieck_upper : … → IsGrothendieckBound (1404896257347/10¹²)`.
  Proved: the transfer inequality (tensor powers), validity and mixing of rounding kernels,
  admissibility of every polynomial preprocessor and composition on the disc, Haagerup's
  coefficients with the Wallis-type estimate `hₙ < 1/(4(n+¼)(n+1))`, the positive-majorant tails
  of the scalar branches, the polarized Cauchy–Schwarz energy tail of the origin kernels, the
  remainder transport, and the finite certificate: a sound fixed-point interval checker
  (`GrotheKernel/`, 2⁻¹²⁸ outward rounding, soundness proved in `Grothe/Upper/IntervalSound.lean`)
  evaluating all 49 branch compositions through index 2047 and the weighted margin.
  Hypotheses (not formalized): domination of Haagerup's phase kernel and of the two origin
  kernels, containment of the truncated radial coefficient integrals in the data boxes (Arb
  quadrature), the first-order coefficient structure of the origin kernels with their
  polarized energy caps, and the Cauchy tails of nine scalar branches.
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
13 minutes on 8 cores, 40 minutes sequentially); CI (`.github/workflows/lean.yml`) builds everything on every push to `master`,
forbids `sorry`, and checks the axiom report. The generated data modules come from research
archives that are not part of the repository; the generators are in `tools/`.
