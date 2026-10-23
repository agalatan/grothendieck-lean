# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.401695322458 < K_G^ℂ < 1.404598635371**
>
> and, with **no hypothesis at all** (every step proved in Lean): **K_G^ℂ ≤ 1.40578**

The two sharp bounds each rest on one explicitly stated family of externally certified numerical
inputs; the unconditional bound rests on nothing outside Lean (see below).

**New here? Read [OVERVIEW.pdf](OVERVIEW.pdf)** — an 8-page explanation of the problem, the two
constructions, what exactly the computer checks, the new inequalities and obstructions found along
the way, and why the remaining gap is hard.

## The constant

For a complex matrix A = (a_ij) compare two optimisation problems: over unimodular scalars,

    C(A) = sup |Σ a_ij · conj(ε_i) · δ_j|        over |ε_i| = |δ_j| = 1,

and over unit vectors in a complex Hilbert space,

    V(A) = sup |Σ a_ij · ⟨x_i, y_j⟩|            over ‖x_i‖ = ‖y_j‖ = 1.

Grothendieck's inequality (1953) says that V(A) ≤ K · C(A) for a universal constant K,
independent of the matrix size and of the Hilbert-space dimension. The smallest such K is the
complex Grothendieck constant K_G^ℂ. Its exact value is unknown, as is that of the real
constant K_G^ℝ. The inequality governs tensor norms, absolutely summing operators, the
approximation ratio of semidefinite relaxations of quadratic optimisation, and the gap between
classical and quantum correlations in two-party Bell experiments (real case).

## How the bounds evolved

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | Grothendieck | | K < ∞ (the inequality itself) |
| 1984 | Davie | 1.33807 < K | |
| 1987 | Haagerup | | K < 1.40490913… (Gaussian phase rounding) |
| Sept 2026 | Guo, Fang, Lu ([arXiv:2609.07000](https://arxiv.org/abs/2609.07000)) | 1.35584631827168 < K | |
| Sept 2026 | Heilman, Jones, Malavolta ([arXiv:2609.25462](https://arxiv.org/abs/2609.25462)) | 1.4 < K | K < 1.404898554746 |
| Oct 2026 | **this repository** | **1.401695322458 < K** | **K < 1.404598635371** |
| Oct 2026 | this repository, fully formal (no hypothesis) | | K ≤ 1.40578 |

Haagerup's integral 1/γ† = 1.4045759…, γ† = ∫₀^{π/2} cos²t (1+sin²t)^{−1/2} dt, has been
proposed as the exact value; it lies inside the interval, 2.27·10⁻⁵ below our upper bound.

## What is proved, and under which assumptions

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V over all finite-dimensional complex Hilbert spaces. All three headline
theorems conclude a statement about the constant itself.

**Lower bound** — `Grothe.LowerAnalytic.lower_bound_of_nodeCaps :
NodeCaps → IsGrothendieckBound K → 1.401695322458 < K`
(`Grothe/LowerAnalytic/Reduction.lean`).

The witness is the operator T = P₁,₀ − (149/200)·P₂,₁ on L² of the complex Gaussian measure
(projections onto the linear and the cubic Wick chaos). Lean proves: the transfer from the
norm of T to finite matrices; the value of T on vector-valued test functions; the exact
reduction of ⟨f, Tg⟩ for every pair of unimodular functions to 19 one-variable row
inequalities; all analytic facts about the law of the cubic residual (moment bounds, Stein and
spectral cuts, the contraction-Gram budgets, the sixth-moment Wick identity); and the finite
certificate that combines them (351 node certificates and a cover of the parameter space by
8,756 boxes, one `native_decide`). The **only hypothesis**, `NodeCaps`, states that 19 explicit
one-variable functions Ψ_r (defined in Lean as suprema of finite-dimensional Gaussian
integrals) lie below stored rational values at their tabulated nodes. Those caps are certified
by exact-arithmetic computations outside Lean; moving them inside is work in progress.

The joint sixth-moment/Stein budgets are also formalized in
`Grothe/LowerAnalytic/JointSixth.lean`, `Grothe/Lower/Reserve.lean` and
`Grothe/LowerAnalytic/JointBudget.lean`. They retain the shared tensor constraints. The endpoint uses 41 joint-moment node
certificates, each checked on its certified kurtosis range and connected to the Gaussian
cubic by `Grothe/LowerAnalytic/JointContractions.lean`. Two of those nodes use the
stronger Young budget transported by an exact identity; the cover contains 8,756 boxes.
The strengthened parameter family and exact majorant-transport rule are proved too
(`JointSixth.gram_j_eta`, `JointSixth.gram_j2_shifted`, `Grothe/Lower/MomentLift.lean`).
`Grothe/LowerAnalytic/MomentConeBoundary.lean` proves the exact two-branch minimum
moment cost within the conic recipe, with explicit attaining points and its
application to genuine cubic moments on each node range.

A separate global research interface transfers finite Gaussian Hermite games to compact
spherical operators while preserving the same bounded response pair. The paper proof and
its computational limitations are in [docs/SPHERICAL_TRANSFER.md](docs/SPHERICAL_TRANSFER.md).
`Grothe/LowerAnalytic/SphericalTransfer.lean` proves the exact cubic multiplier tail and
signed cap assembly. The analytic bridge and a useful spherical norm cap are not formalized;
this interface changes neither endpoint.

**Upper bound** — `Grothe.UpperChaos.fresh_upper_rounder :
compare → energy_close → hardy → IsGrothendieckBound (500000000000000000/355973576656604491)`,
and `Grothe.upper_value_lt` shows this is below 1.404598635371
(`Grothe/UpperChaos/PhiBound.lean`; the table interface is `Grothe.fresh_upper` in `Grothe/Upper/PolynomialBridge.lean`).

The rounding is the smoothing G_T of T = F₀·P₃(φ): a two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. It is **defined in Lean**
from the stored data (`Grothe/UpperChaos/Rounder.lean`). Lean proves that G_T is measurable, charge one and
disk-valued: |P₃(x)|² = 1 − x⁴(3 − x²)/36 and φ² ≤ 3 everywhere (`phiBound`, an exact bisection cover of a box plus an
analytic far field; native fact `phi_cover_check`). Its correlation kernel H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ, with the odd
preprocessors p of degree 41 and τ(t) = αt³ + βt⁷ (Wiener norms ≤ 1), is compared with c·t,
c = 1779870886481/(25·10¹¹), through the kernel of a truncation X, and the bound is 1/(c − ‖H − c·t‖) with residual
at most 600639595509/(5·10¹⁷).
Lean proves the complex Gaussian chaos calculus on ℂ² (`Grothe/UpperChaos/`: Hermite basis, completeness,
Parseval, the Mehler formula for L² functions, charge selection, energies → kernel), hence the structural facts
(validity, summability, parity) for G_T and X; the transfer inequality; the evaluation of the head of the kernel
through degree 501 from 21,168 stored energies by a verified interval checker; the tail bound and the endpoint
arithmetic. What is **assumed** (numerical statements about G_T and X):

| hypothesis | content | share of the residual |
|---|---|---|
| `compare` | Σ\|E(G_T) − E(X)\| ≤ 1065637497/10¹⁵ (external computer-assisted comparison lemma) | 88.71% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of E(X) | 0.001% |
| `hardy` | weighted square sum ≤ 7/4 at radius 4149/4000, giving the tail 36748/10¹² beyond degree 501 | 3.06% |

The head, computed in Lean (`head_check`), is 98880/10¹², 8.23% of the total
600639595509/(5·10¹⁷).

**Unconditional upper bound** — `Grothe.haagerup_bound : IsGrothendieckBound (140578/100000)`
(`Grothe/Haagerup/Identity.lean`, with the finite check in `Grothe/Upper/Haagerup.lean`), with **no hypothesis**.
Lean proves Haagerup's identity for the Gaussian phase rounding,
E[conj(phase⟨g,x⟩)·phase⟨g,y⟩] = Σ_k (π/4)(1/2)_k²/(k!(k+1)!) z|z|^{2k} with z = ⟨x,y⟩, and combines it
with a cubic preprocessor, 4,000 exact series terms and a telescoping tail. The value K ≤ 1.40578 is
weaker than the certified bound above (and than Haagerup's 1.40491, which needs the full inverse series);
it is the best upper bound in this repository that rests on nothing outside Lean.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus exactly four `native_decide` facts,
`Grothe.head_check` (the upper head), `Grothe.UpperChaos.phi_cover_check` (the phase cover φ² ≤ 3),
`Grothe.haagerup_check` (the unconditional upper bound) and `Grothe.Lower.cert_check` (the lower certificate).
Everything else is kernel-checked. No `sorry`. The axiom report `scratch/Axioms.lean`
(227 theorems) is verified in CI by `scripts/check_axioms.py`.

The full module-by-module inventory is in [docs/LEAN_DETAILS.md](docs/LEAN_DETAILS.md).

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality in its residual form |
| `Grothe/Upper/`, `Grothe/Haagerup/`, `GrotheKernel/` | upper bounds: Haagerup's phase-rounding identity, residual algebra, Hardy tail, kernel composition, interval evaluator and its soundness, head check, final theorem |
| `Grothe/Lower/` | lower certificate: positivity checks, Stein cuts and law budgets, rows, mixtures, the box cover, the endpoint, the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis: the witness on L²(γ_n), integration by parts, chaos projections, spectral budgets, circular cubics, the Wick multigraph expansion and sixth cumulant, contraction tensors, the fibre potentials and the per-row reduction, `lower_bound_of_nodeCaps` |
| `Grothe/Lower/RowData*.lean`, `Grothe/Lower/MixedData.lean`, `Grothe/Upper/Data.lean` | generated certificate data |
| `tools/` | generators of the data modules and numerical cross-checks |
| `scratch/Axioms.lean`, `scripts/check_axioms.py` | the axiom report and its check |
| `docs/` | `LEAN_DETAILS.md` (inventory) and `overview.tex` (source of `OVERVIEW.pdf`) |

About 32,000 lines of hand-written Lean and 12,000 lines of generated data.

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py
```

A full build takes about 20 minutes on 8 cores; the three native checks dominate. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
`axiom`, `implemented_by`, `extern` and `unsafe`, and checks the axiom report.

## How this was made

The numerical constructions and certificates were produced in a collaboration between several
AI research systems; this Lean development checks them. The mathematical write-up, the
certificate replays and the research history are kept outside the repository. The overview
explains which steps are machine-checked and which rest on external certificates.
