# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.401695322458 < K_G^ℂ < 1.404598161566**
>
> and, with **no hypothesis at all** (every step proved in Lean): **K_G^ℂ ≤ 1.404909543**

The two sharp bounds rest on explicitly stated analytic and computer-assisted inputs;
the unconditional bound rests on nothing outside Lean (see below).

**New here? Read [OVERVIEW.pdf](OVERVIEW.pdf)** — an explanation of the problem, the two
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
| Oct 2026 | **this repository** | **1.401695322458 < K** | **K < 1.404598161566** |
| Oct 2026 | this repository, fully formal (no hypothesis) | | K ≤ 1.404909543 |

Haagerup's integral 1/γ† = 1.4045759…, γ† = ∫₀^{π/2} cos²t (1+sin²t)^{−1/2} dt, has been
proposed as the exact value; it lies inside the interval, 2.22·10⁻⁵ below our upper bound.

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
8,756 boxes, checked by 13 single-threaded `native_decide` chunks). The **only hypothesis**, `NodeCaps`, states that 19 explicit
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

The node-cap proof infrastructure is in Lean (`Grothe/LowerAnalytic/Cap*.lean`):
the 505 chord nodes follow from the vertex caps by convexity (`nodeCaps_of_vertexCaps`, `capChords_check`);
a vertex cap Ψ_r(s) − 10⁻¹¹ ≤ c is proved from an anchored-pair majorant with dyadic cell prices on a uniform
polar grid, verified interval enclosures of the integrated coefficient matrix (`CapTables.lean`), a Loewner bound
and an exact LDLᵀ check (`pot_le_of_nodeOK`); the per-node price recipes (`CapRecipeData.lean`) are checked by the
precompiled kernel `GrotheKernel/CapCheck.lean`, one `native_decide` fact per range of nodes (`capRangeKK_j`,
four per row, one module `CapRowKK.lean` per row; no parallel tasks). Hence
`lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → Llow < K`, where **`CapsRest`** comprises the vertex caps
of the rows 0.84, 0.845, 0.85, 0.855 and any excluded-node caps of the other rows. The exclusion lists are currently empty.

**Node caps: a separate build target, checked by CI through the build cache.** The 15 row modules `CapRowKK.lean`
(60 single-threaded `native_decide` range facts, about 21 CPU-hours) and `lower_bound_of_capsRest` live in the target
`GrotheCaps`. They are built on the droplet's self-hosted CI runner, which then runs both axiom reports, records the hash
of every source they depend on next to the build (`scripts/caps_stamp.py --mark-cache`) and saves the build cache. Every
CI run restores that cache: when the recorded hash matches the current sources, CI builds `GrotheCaps` (Lean replays the
verified modules) and checks `scratch/AxiomsCaps.lean`; when it does not, CI dispatches the rebuild to the droplet
instead of attempting it (see `AGENTS.md` §4). So CI checks `lower_bound_of_capsRest`, whose only hypothesis
**`CapsRest`** is the vertex caps of the rows 0.84, 0.845, 0.85, 0.855 (work in progress, epic #12).

**Upper bound** — `Grothe.UpperChaos.fresh_upper_rounder`, for an L² charge-one truncation `X`, proves
`ComparisonInputs → energy_close → hardy → IsGrothendieckBound (500000000000000000/355973696735190991)`,
and `Grothe.upper_value_lt` shows this is below 1.404598161566
(`Grothe/UpperChaos/PhiBound.lean`; the table interface is `Grothe.fresh_upper` in `Grothe/Upper/PolynomialBridge.lean`).

The rounding is the smoothing G_T of T = F₀·P₃(φ): a two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. It is **defined in Lean**
from the stored data (`Grothe/UpperChaos/Rounder.lean`). Lean proves that G_T is measurable, charge one and
disk-valued: |P₃(x)|² = 1 − x⁴(3 − x²)/36 and φ² ≤ 3 everywhere (`phiBound`, an exact bisection cover of a box plus an
analytic far field; native fact `phi_cover_check`). Its correlation kernel H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ, with the odd
preprocessors of degrees 41 and 15 (Wiener norms ≤ 1, auxiliary linear coefficient zero), is compared with c·t,
c = 7119483103461/10¹³, through the kernel of a truncation X, and the bound is 1/(c − ‖H − c·t‖) with residual
at most 458437859009/(5·10¹⁷).
Lean proves the complex Gaussian chaos calculus on ℂ² (`Grothe/UpperChaos/`: Hermite basis, completeness,
Parseval, the Mehler formula for L² functions, charge selection, energies → kernel), hence the structural facts
(validity, summability, parity) for G_T and X; the transfer inequality; the evaluation of the head of the kernel
through degree 501 from 21,168 stored energies by a verified interval checker; the tail bound and the endpoint
arithmetic. It also proves a selected-spectrum comparison: the error is split
into 18 pieces with specified degree supports and norm caps. Each piece pairs
only with X's energy in its selected band, weighted by the retained coefficient cost; the quadratic error is paid once.
A native check derives every band radius from the stored table and its accuracy
allowance. Lean proves every coefficient cost with outward interval polynomial arithmetic.
The weighted comparison is at most 13311891/(15625·10⁹).
What remains **input**:

| hypothesis | content | share of the residual |
|---|---|---|
| `ComparisonInputs` | exact error decomposition, spectral supports and inherited Gaussian component norm caps; Lean derives the selected comparison | 92.92% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of E(X) | 0.001% |
| `hardy` | weighted square sum ≤ 7/4 at radius 4149/4000, giving the tail 36748/10¹² beyond degree 501 | 4.01% |

The head, computed in Lean (`head_check`), is 28153/10¹², 3.07% of the total
458437859009/(5·10¹⁷).

The current parameters and all 21,168 exact energies are in
`data/upper-preprocess/certificate.json`; `python3 tools/gen_upper_data.py`
regenerates the Lean data. The directed head and the fresh 65,594-arc Gaussian
Schur/Hardy replay are recorded alongside it. The source coefficient-error
enclosures, table accuracy and Hardy input are inherited. Their identification
with the specified error pieces remains external; Lean proves the selected
comparison from those pieces. The complete dependency ledger and exact replay
are in [`data/localized-comparison/PROOF.md`](data/localized-comparison/PROOF.md),
with a mathematical account in [`docs/localized-comparison.tex`](docs/localized-comparison.tex).
The native head computation remains part of the proof.

**Unconditional upper bound** — `Grothe.haagerup_bound : IsGrothendieckBound (1404909543/1000000000)`
(`Grothe/Haagerup/Power.lean`, with the finite check in `Grothe/Haagerup/PowerCheck.lean`), with **no hypothesis**.
Lean proves Haagerup's identity for the Gaussian phase rounding,
E[conj(phase⟨g,x⟩)·phase⟨g,y⟩] = Σ_k (π/4)(1/2)_k²/(k!(k+1)!) z|z|^{2k} with z = ⟨x,y⟩, and combines it
with a degree-29 preprocessor and 1,024 exact series terms. A finite polynomial approximate inverse
retains cancellation across the complete infinite suffix. Its inverse defect and a short combined
product give a normalized tail cap of 174·10⁻⁹; the complete finite residual cap is 95·10⁻⁹.
The general signed Abel/resolvent theorem and coefficient-locality argument are proved in
`Grothe/Upper/ResolventTail.lean`. The Gaussian identity, tensor realization, checker soundness,
infinite tail and final transfer are all proved in Lean, with one pinned numerical check and no
external analytic hypotheses. Exact data in `data/haagerup-resolvent/certificate.json` reproduce the
Lean certificate byte for byte. See [the complete proof and replay](docs/HAAGERUP_POWER.md).
The sharper conditional bound above remains stronger.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus the `native_decide` facts pinned in `scripts/check_axioms.py`:
`Grothe.head_check` (the upper head), `Grothe.UpperChaos.phi_cover_check` (the phase cover φ² ≤ 3),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.HaagerupPower.check` (the residual, power norm, inverse defect, combined seed and signed tail), the 13 chunks `Grothe.Lower.certRows0`–`4`, `certBatches0`–`2`, `certBoxes0`–`3`, `certPartition` of the lower
certificate (assembled into `Grothe.Lower.cert_check`),
`capChords_check` (the chord nodes of the cap tables) and the 60 range checks `capRangeKK_j` of the node caps.
Every native check is single-threaded code (no `Task.spawn`).
Everything else is kernel-checked. No `sorry`. The axiom report `scratch/Axioms.lean`
is verified in CI by `scripts/check_axioms.py`; the separate caps report is `scratch/AxiomsCaps.lean`.

Joint-response proof interfaces retain shared Gram constraints, exact two-disc
support, quadratic-feature closure and common Stein tests before completing
squares. These add 35 selected results checked with standard axioms. The
finite primal interface also makes explicit when a relaxed law obstructs a
certificate without representing an actual Gaussian response.

An exact five-mode symmetry reduction and an original-noise replica model
preserve the shared drivers and chaos grades of a restricted response family.
Eleven supporting algebra/series theorems use only standard axioms. The Gaussian
conditioning and invariant-space classification are written proofs; numerical
response searches are exploratory. See [the replica report](docs/SYMMETRIC_RESPONSE_REPLICAS_2026-10-23.md).

A linear separator excludes the entire Gaussian-phase cubic-preprocessor
family, including complex phases and convex mixtures, from improving the current
upper score: its reciprocal score is at most 0.71186, below the incumbent
0.7119473934. Seventeen additional Lean results check the polynomial separator,
common signed-tail prices, error propagation, and finite-mixture assembly.
The Gaussian-family application is a written proof with an explicit Lean
low-coefficient interface. An incumbent's coefficient-l1 error is paid once
for every admissible spectral price; the complete score has the same error
allowance. The numerical pool screens and phase-perturbation searches remain uncertified;
none of these research interfaces changes either endpoint.
See [the separator proof and trust boundary](docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md).

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

A full build takes about 20 minutes on 8 cores; the native checks dominate. CI
(`.github/workflows/lean.yml`) builds everything on every push to `master`, forbids `sorry`,
`axiom`, `implemented_by`, `extern` and `unsafe`, and checks the axiom report.

## How this was made

The numerical constructions and certificates were produced in a collaboration between several
AI research systems; this Lean development checks them. The mathematical write-up, the
certificate replays and the research history are kept outside the repository. The overview
explains which steps are machine-checked and which rest on external certificates.
