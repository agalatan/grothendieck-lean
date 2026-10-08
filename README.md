# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

$$1.4010028168 \;<\; K_G^{\mathbb C} \;<\; 1.404896257347 .$$

## The constant

For a complex matrix $A=(a_{ij})$ compare two optimisation problems: over unimodular scalars,

$$C(A)=\sup_{|\varepsilon_i|=|\delta_j|=1}\Bigl|\sum_{ij}a_{ij}\,\overline{\varepsilon_i}\,\delta_j\Bigr|,$$

and over unit vectors in a complex Hilbert space,

$$V(A)=\sup_{\|x_i\|=\|y_j\|=1}\Bigl|\sum_{ij}a_{ij}\langle x_i,y_j\rangle\Bigr| .$$

Grothendieck's inequality (1953) says that $V(A)\le K\,C(A)$ for a universal constant $K$,
independent of the matrix size and of the Hilbert-space dimension. The smallest such $K$ is
the complex Grothendieck constant $K_G^{\mathbb C}$. Its exact value is unknown. The same
question for real matrices and sign vectors defines the real constant $K_G^{\mathbb R}$, which
is also unknown. The inequality governs tensor norms, absolutely summing operators,
semidefinite relaxations of quadratic optimisation, and the gap between classical and quantum
correlations in two-party Bell experiments.

## How the bounds evolved

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | Grothendieck | | $K_G^{\mathbb C} < \infty$ (the inequality itself) |
| 1984 | Davie | $1.33807 < K_G^{\mathbb C}$ | |
| 1987 | Haagerup | | $K_G^{\mathbb C} < 1.40490913\ldots$ (Gaussian phase rounding) |
| Sept 2026 | Guo, Fang, Lu ([arXiv:2609.07000](https://arxiv.org/abs/2609.07000)) | $1.35584631827168 < K_G^{\mathbb C}$ | |
| Sept 2026 | Heilman, Jones, Malavolta ([arXiv:2609.25462](https://arxiv.org/abs/2609.25462)) | $1.4 < K_G^{\mathbb C}$ | $K_G^{\mathbb C} < 1.404898554746$ |
| Oct 2026 | **this repository** | $\mathbf{1.4010028168 < K_G^{\mathbb C}}$ | $\mathbf{K_G^{\mathbb C} < 1.404896257347}$ |

For orientation, the real constant has a longer numerical history: Krivine's upper bound
$\pi/(2\log(1+\sqrt2)) = 1.78221\ldots$ (1979) was shown to be non-optimal by Braverman,
Makarychev, Makarychev and Naor (2011); Davie and Reeds gave lower bounds near $1.677$; and in
2026 computer-assisted certificates narrowed the interval to $1.773 \le K_G^{\mathbb R} \le 1.7799$
([arXiv:2608.11158](https://arxiv.org/abs/2608.11158),
[arXiv:2610.10477](https://arxiv.org/html/2610.10477)).

Our bounds stay inside the Heilman–Jones–Malavolta framework and are the product of a
collaboration between several AI research systems (the numerical constructions and
certificates) and this Lean development (the machine-checked verification):

* **Upper bound.** A mixture of 49 Gaussian rounding kernels: 30 scalar branches (Haagerup's
  phase kernel composed with rational preprocessors), 18 preprocessed copies of an origin
  kernel, and one preprocessed copy of a second origin kernel with a modified phase polynomial;
  2048 retained mixed coefficients and polarized energy estimates for the tails.
* **Lower bound.** The Gaussian witness $T = P_{1,0} - \varepsilon P_{2,1}$ with
  $\varepsilon = 7400323787/10^{10}$, whose $L^\infty\to L^1$ norm is capped by
  $B = 2855097757/(4\cdot10^9)$ through 67 profiles (sources, averaged shifted sources,
  pointwise joins and shared-moment joins, each with global polynomial majorants and a
  moment-rectangle cover), 68 retained-square support rows and a 118-cell scalar envelope, using
  the sixth-moment inequality $\mathbb E|q|^6 \le 9m - 12 + 40.8205\,(m-2)^{3/2}$ and the
  first-moment bound $\mathbb E|q| \le 0.97382085$ for normalised cubic chaos. Then
  $K_G^{\mathbb C} \ge 1/B$.

## What exactly is proved in Lean

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states $V(A)\le K\cdot C(A)$ for every
finite complex matrix, with $V$ taken over all finite-dimensional complex Hilbert spaces.

* **Upper bound** — `Grothe.complex_grothendieck_upper : … → IsGrothendieckBound (1404896257347/10¹²)`.
  Proved from scratch: the transfer inequality via tensor powers, validity and mixing of rounding
  kernels, admissibility of polynomial preprocessors and composition on the disc, Haagerup's
  coefficients with the Wallis-type estimate $h_n < 1/(4(n+\tfrac14)(n+1))$, the positive-majorant
  tails of the scalar branches, the polarized Cauchy–Schwarz energy tail, remainder transport, and
  the finite certificate itself, evaluated by a sound fixed-point interval checker
  (`GrotheKernel/`, $2^{-128}$ outward rounding, soundness proved in
  `Grothe/Upper/IntervalSound.lean`).
  Explicit hypotheses (not formalized): domination of Haagerup's phase kernel and of the two
  origin kernels (Haagerup's Gaussian identity), containment of the truncated radial coefficient
  integrals in the data boxes (Arb quadrature), the first-order coefficient structure of the
  origin kernels with their energy caps, and the Cauchy tails of nine scalar branches.
* **Lower bound** — `Grothe.Lower.lower_bound_data` ($V \le B$ for every admissible scalar
  profile value) and `Grothe.Lower.lower_endpoint : 1/B \le K \to 7005014084/(5\cdot10^9) < K$.
  Proved: Bernstein bounds (univariate and bivariate), PSD gates by exact $L^TDL$
  factorisations, rectangle covers, all profile caps, chord domination of all physical
  polynomials, the $\varepsilon$-transfer and dilation of support rows, the fixed-mixture
  envelope, the three-moment lemma, the scalar sixth-moment and first-moment certificates, the
  variance and retained-square identities, joint convexity and argument allocation, and the
  Schur-complement gate.
  Explicit hypotheses (not formalized): the Gaussian profile reduction
  $V\le F_i(t)-\varepsilon\|Qh+\beta_i v/\varepsilon\|^2$, the node caps of the potentials
  (Gaussian price enclosures), the tensor and Wick identities behind the sixth-moment bound, and
  the transfer from the Gaussian operator to finite matrices.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus `native_decide` facts for the finite
exact computations (listed by `lake env lean scratch/Axioms.lean`; checked in CI). No `sorry`,
no warnings.

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
```

The two long native checks (`Grothe/Upper/Value.lean`, `Grothe/Lower/ProfileCheck.lean`) run
their branches in parallel and take a few minutes each on 8 cores. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
and verifies the axiom report. The generated data modules come from the research archives (not
part of the repository); the generators are in `tools/`.
