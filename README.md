# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.401692002039 < K_G^ℂ < 1.404598989011**

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
| Oct 2026 | **this repository** | **1.401692002039 < K** | **K < 1.404598989011** |

Haagerup's integral 1/γ† = 1.4045759…, γ† = ∫₀^{π/2} cos²t (1+sin²t)^{−1/2} dt, has been
proposed as the exact value; it lies inside the interval, 2.31·10⁻⁵ below our upper bound.

## What is proved, and under which assumptions

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V over all finite-dimensional complex Hilbert spaces. Both headline
theorems conclude a statement about the constant itself.

**Lower bound** — `Grothe.LowerAnalytic.lower_bound_of_nodeCaps :
NodeCaps → IsGrothendieckBound K → 1.401692002039 < K`
(`Grothe/LowerAnalytic/Reduction.lean`).

The witness is the operator T = P₁,₀ − (149/200)·P₂,₁ on L² of the complex Gaussian measure
(projections onto the linear and the cubic Wick chaos). Lean proves: the transfer from the
norm of T to finite matrices; the value of T on vector-valued test functions; the exact
reduction of ⟨f, Tg⟩ for every pair of unimodular functions to 19 one-variable row
inequalities; all analytic facts about the law of the cubic residual (moment bounds, Stein and
spectral cuts, the contraction-Gram budgets, the sixth-moment Wick identity); and the finite
certificate that combines them (336 node certificates and a cover of the parameter space by
7,939 boxes, one `native_decide`). The **only hypothesis**, `NodeCaps`, states that 19 explicit
one-variable functions Ψ_r (defined in Lean as suprema of finite-dimensional Gaussian
integrals) lie below stored rational values at their tabulated nodes. Those caps are certified
by exact-arithmetic computations outside Lean; moving them inside is work in progress.

The joint sixth-moment/Stein budgets are also formalized in
`Grothe/LowerAnalytic/JointSixth.lean`, `Grothe/Lower/Reserve.lean` and
`Grothe/LowerAnalytic/JointBudget.lean`. They retain shared tensor constraints;
the stronger joint-moment numerical certificate is not yet integrated into the endpoint.
The strengthened parameter family and exact majorant-transport rule are proved too
(`JointSixth.gram_j_eta`, `JointSixth.gram_j2_shifted`, `Grothe/Lower/MomentLift.lean`).

**Upper bound** — `Grothe.fresh_upper :
DirectHyps E EX → IsGrothendieckBound (438936500000000000000000/312499512981434072227643)`,
and `Grothe.upper_value_lt` shows this is below 1.404598989011
(`Grothe/Upper/PolynomialBridge.lean`).

The rounding is T = F₀·P₃(φ): a smoothed two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. Since
|P₃(x)|² = 1 − x⁴(3 − x²)/36 ≤ 1 for |φ| < 1, T is a disk-valued (hence admissible) rounding.
Its correlation kernel H is compared with c·t through the kernel of a polynomial truncation
X = F₀ + v, and the bound is 1/(c − ‖H − c·t‖) with residual at most 554771095509/(5·10¹⁷).
Lean proves the transfer inequality (via tensor powers), the composition and locality of the
kernel, the evaluation of the head of the kernel through degree 501 from 21,168 stored energies
by a verified interval checker, the tail bound and the endpoint arithmetic. The structure
`DirectHyps E EX` (tables E of the rounding T and EX of the truncation X) collects what is
**assumed**:

| field | content | share of the residual |
|---|---|---|
| `valid`, `summable`, `summableX`, `parityX` | the tables are the energies of the actual rounding and truncation | — |
| `compare` | Σ\|E − EX\| ≤ 1065637497/10¹⁵ (external computer-assisted comparison lemma) | 96.04% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of EX | 0.001% |
| `hardy` | weighted square sum ≤ 7/4 at radius 4149/4000, giving the tail 36748/10¹² beyond degree 501 | 3.31% |

The head, computed in Lean (`head_check`), is 7143/10¹², 0.64% of the total
554771095509/(5·10¹⁷).

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus exactly two `native_decide` facts,
`Grothe.head_check` (the upper head) and `Grothe.Lower.cert_check` (the lower certificate).
Everything else is kernel-checked. No `sorry`. The axiom report `scratch/Axioms.lean`
(140 theorems) is verified in CI by `scripts/check_axioms.py`.

The full module-by-module inventory is in [docs/LEAN_DETAILS.md](docs/LEAN_DETAILS.md).

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality in its residual form |
| `Grothe/Upper/`, `GrotheKernel/` | upper bound: residual algebra, Hardy tail, kernel composition, interval evaluator and its soundness, head check, final theorem |
| `Grothe/Lower/` | lower certificate: positivity checks, Stein cuts and law budgets, rows, mixtures, the box cover, the endpoint, the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis: the witness on L²(γ_n), integration by parts, chaos projections, spectral budgets, circular cubics, the Wick multigraph expansion and sixth cumulant, contraction tensors, the fibre potentials and the per-row reduction, `lower_bound_of_nodeCaps` |
| `Grothe/Lower/RowData*.lean`, `Grothe/Lower/MixedData.lean`, `Grothe/Upper/Data.lean` | generated certificate data |
| `tools/` | generators of the data modules and numerical cross-checks |
| `scratch/Axioms.lean`, `scripts/check_axioms.py` | the axiom report and its check |
| `docs/` | `LEAN_DETAILS.md` (inventory) and `overview.tex` (source of `OVERVIEW.pdf`) |

About 28,000 lines of hand-written Lean and 11,000 lines of generated data.

## Building

```sh
lake exe cache get   # Mathlib v4.34.1 (toolchain leanprover/lean4:v4.34.1)
lake build
lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py
```

A full build takes about 20 minutes on 8 cores; the two native checks dominate. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
`axiom`, `implemented_by`, `extern` and `unsafe`, and checks the axiom report.

## How this was made

The numerical constructions and certificates were produced in a collaboration between several
AI research systems; this Lean development checks them. The mathematical write-up, the
certificate replays and the research history are kept outside the repository. The overview
explains which steps are machine-checked and which rest on external certificates.
