# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

> **1.401697049825 < K_G^ℂ < 1.404598149218**
>
> and, with **no hypothesis at all** (every step proved in Lean): **K_G^ℂ ≤ 1.404909409**

The two sharp bounds rest on explicitly stated analytic and computer-assisted inputs;
the displayed fully formal bound rests on nothing outside Lean (see below).

A separate **written unconditional refinement gives K_G^ℂ < 1.40489844**,
using Heilman–Jones–Malavolta's published construction and numerical estimates.
The new polynomial power check, infinite-suffix saving and normalized score
arithmetic are proved in Lean. The published Gaussian construction and directed
integration facts remain outside this repository's end-to-end formalization.
See the [proof and verification record](data/scalar-tail-refinement/PROOF.md).

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
| Oct 2026 | **this repository** | **1.401697049825 < K** | **K < 1.404598149218** |
| Oct 2026 | this repository, fully formal (no hypothesis) | | K ≤ 1.404909409 |

Haagerup's integral 1/γ† = 1.4045759…, γ† = ∫₀^{π/2} cos²t (1+sin²t)^{−1/2} dt, has been
proposed as the exact value; it lies inside the interval, 2.22·10⁻⁵ below our upper bound.

## What is proved, and under which assumptions

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V over all finite-dimensional complex Hilbert spaces. All three headline
theorems conclude a statement about the constant itself.

**Lower bound** — `Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data :
NodeCaps → IsGrothendieckBound K → 1.401697049825 < K`
(`Grothe/Research/RefinedCoverResult.lean`).

The witness is the operator T = P₁,₀ − (149/200)·P₂,₁ on L² of the complex Gaussian measure
(projections onto the linear and the cubic Wick chaos). Lean proves: the transfer from the
norm of T to finite matrices; the value of T on vector-valued test functions; the exact
reduction of ⟨f, Tg⟩ for every pair of unimodular functions to 19 one-variable row
inequalities; all analytic facts about the law of the cubic residual (moment bounds, Stein and
spectral cuts, the contraction-Gram budgets, the sixth-moment Wick identity); and the finite
certificate that combines them (351 existing mixed-node certificates, two additional pure-row law nodes, three mixed-source Young nodes, and a cover of the parameter space by
10,762 boxes, checked by 14 single-threaded `native_decide` facts). The **only hypothesis**, `NodeCaps`, states that 19 explicit
one-variable functions Ψ_r (defined in Lean as suprema of finite-dimensional Gaussian
integrals) lie below stored rational values at their tabulated nodes. Those caps are certified
by exact-arithmetic computations outside Lean; moving them inside is work in progress.

The joint sixth-moment/Stein budgets are also formalized in
`Grothe/LowerAnalytic/JointSixth.lean`, `Grothe/Lower/Reserve.lean` and
`Grothe/LowerAnalytic/JointBudget.lean`. They retain the shared tensor constraints. The certificate bank contains 44 joint-moment node
certificates, each checked on its certified kurtosis range and connected to the Gaussian
cubic by `Grothe/LowerAnalytic/JointContractions.lean`. Five of those nodes use the
stronger Young budget transported by an exact identity; the cover contains 10,762 boxes.
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
precompiled kernel `GrotheCapsKernel/CapCheck.lean`, one `native_decide` fact per range of nodes (`capRangeKK_j`,
four per row, one module `CapRowKK.lean` per row; no parallel tasks). Hence
`lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401697049825 < K`, where **`CapsRest`** comprises the vertex caps
of the rows 0.84, 0.845, 0.85, 0.855 and any excluded-node caps of the other rows. The exclusion lists are currently empty.

**Node caps: a separate build target, replayed by CI from a verified cache.**
The 15 `CapRowKK.lean` modules contain the 60 single-threaded `native_decide`
range facts for rows 0–11 and 16–18. They import `CapRangeDefs` and
`CapRecipeData`: the rational row, gate, chord and recipe data and numerical
checker, independently of the Gaussian analysis and lower certificate.
There is one build target, `Grothe`: it builds range-check soundness in
`CapRows`, convexity assembly in `CapAssembly` (`CapHull` is a compatibility
import), the heavy facts, and `CapNodes`, which contains the 15 row-assembly
proofs and `lower_bound_of_capsRest`.

`lower_bound_of_refined_cover_data` proves
the lower bound with the hypothesis `NodeCaps`. The additional law nodes
use the original source caps and existing Stein cuts; they add no Gaussian premise.
Their inputs are in `data/lower-unshifted/`; `tools/needle_unshifted_lean.py --check`
replays every new node, every final box, the old canonical reference map and the full partition,
and reproduces both generated Lean data files byte for byte.
The current cover uses adaptive binary splits and repriced row mixtures. Its
forest ledger replays from immutable starting inputs, preserving inherited
scale interpolation domains; see `data/lower-unshifted/README.md`.

The cache provenance hash covers 53 files: the 48 local computation modules
reachable from the heavy row modules, plus `CapNodes.lean`,
`GrotheCapsKernel.lean`, `lean-toolchain`, `lake-manifest.json` and `lakefile.toml`.
The five extras are hashed directly; their imports are not traversed. This
replaces the former 140-file boundary. Changes confined to analytic soundness
or the lower certificate outside this set do not invalidate the computation
hash; Lake still checks ordinary proof dependencies. This hash identifies the
cached computation sources, not every analytic dependency or build artifact.
The numerical checker has its own precompiled library, `GrotheCapsKernel`
(`Basic`, `CapPoly`, `CapCheck`, retaining the `GrotheKernel` Lean namespace),
so other kernel checkers do not replace its shared object. Its root is pinned
because importers load that library's shared object.

The droplet's self-hosted CI runner builds `Grothe`, runs
the axiom report, then records the hash in `.lake/build/caps-closure.sha`
with `scripts/caps_stamp.py --mark-cache` and saves the build cache.
For Lean-relevant checks, ordinary CI restores that cache and calls
`scripts/caps_stamp.py --check-cache` (also the script's default). A match
permits the build of `Grothe`, which replays the heavy facts, and the axiom
audit, including the final `CapNodes` assembly; cached native results are reused subject to Lake's
dependency checks. A first CI job compares the caps source digest (part of the cache key) with the
verified caches; when none matches, the same check runs on the droplet's runner,
which builds, audits, records the marker and saves the cache, so a cache miss
delays a check but never fails it (`AGENTS.md` §8, §10). One runner build
supplies verification and later replay; do not run a separate manual droplet
verification. A read-only digest is not a verification record.
See `AGENTS.md` §8, §10 and `docs/CAPS_STATUS.md`.

`lower_bound_of_refined_cover_data` assumes `NodeCaps`.
`lower_bound_of_capsRest` reduces this to `CapsRest`: the vertex caps of rows
12–15 (t = 0.84, 0.845, 0.85, 0.855), plus any excluded-node caps of the
other rows. All exclusion lists are empty. Both lower theorems use the same
refined cover and endpoint; the second composes
`vertexCaps_of_capsRest`, `nodeCaps_of_vertexCaps` and
`lower_bound_of_refined_cover_data`. `NodeCaps.lean` defines the common cap
hypothesis without importing the Gaussian reduction. The cap computations,
recipes and row data are unchanged. The rows 12–15 piece checks likewise import
only rational data and computable definitions (`CapCoverDefs`,
`CapConstrDefs`, `CapPieceRange`); `CapCover`, `CapConstr` and `CapPieceNodes`
provide their soundness. Their generated facts and final `CapsRest` wiring
remain a separate campaign (generated piece modules are excluded from the
root until a proof uses them).

**Upper bound** — `Grothe.UpperChaos.fresh_upper_rounder`, for an L² charge-one truncation `X`, proves
`ComparisonInputs → energy_close → hardy → IsGrothendieckBound (500000000000000000/355973699864771491)`,
and `Grothe.upper_value_lt` shows this is below 1.404598149218
(`Grothe/UpperChaos/PhiBound.lean`; the table interface is `Grothe.fresh_upper` in `Grothe/Upper/PolynomialBridge.lean`).

The rounding is the smoothing G_T of T = F₀·P₃(φ): a two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. It is **defined in Lean**
from the stored data (`Grothe/UpperChaos/Rounder.lean`). Lean proves that G_T is measurable, charge one and
disk-valued: |P₃(x)|² = 1 − x⁴(3 − x²)/36 and |φ| < 1 everywhere (`phi_abs_lt_one`, from φ² ≤ 99/100: an exact
bisection cover of a box in 512 cubes with a first-order expansion of the exponential, plus an analytic far field;
native facts `phi_cover_check_0`–`5`). |φ| < 1 is also the input the external comparison argument relies on. Its correlation kernel H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ, with the odd
preprocessors of degrees 41 and 15 (Wiener norms ≤ 1, auxiliary linear coefficient zero), is compared with c·t,
c = 7119483103461/10¹³, through the kernel of a truncation X, and the bound is 1/(c − ‖H − c·t‖) with residual
at most 455308278509/(5·10¹⁷).
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
| `ComparisonInputs` | exact error decomposition, spectral supports and inherited Gaussian component norm caps; Lean derives the selected comparison | 93.56% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of E(X) | 0.001% |
| `hardy` | weighted square sum ≤ 7/4 at radius 4149/4000, giving the tail 30488839/10¹⁵ beyond degree 501 | 3.35% |

The head, computed in Lean (`head_check`), is 28153/10¹², 3.09% of the total
455308278509/(5·10¹⁷).

The Hardy tail first deducts the linear coefficient's weighted square,
forced by this weighted head comparison. This adds no Gaussian input.

`HardyHolo.lean` proves holomorphy and Hardy assembly for separate measurable
disk-valued left and right responses (`differentiableOn_HholPair_Rt`,
`hardy_of_pair_inputs`). The fixed covariance path `Rt` and its decay region
are shared; the real odd-series identification and circle mean bound remain
explicit inputs for each pair. The incumbent theorems specialize this
interface. Neither bound nor its remaining analytic hypotheses changes.

**Radial repair and its ceiling.** `UpperChaos/RadialRepair.lean` certifies the
polynomial disk map `z ↦ z S₆(1−|z|²)`, where S₆ is the degree-six binomial
truncation of `(1−q)⁻¹ᐟ²`. Its exact squared-modulus defect has nonnegative
coefficients and starts at q⁷. Applied to P₃, it gives a degree-39 polynomial
factor. Lean also proves `(1−|P₃(x)|)² ≤ x⁶/1225` for x² ≤ 1.
`UpperChaos/KernelStability.lean` bounds the **entire** physical coefficient
change of charge-one responses by `(‖G‖₂+‖H‖₂)‖H−G‖₂` for the same feasible preprocessors.
`radial_kernel_ceiling` combines these facts with an explicit sixth-moment
input. Thus restoring the modulus is quantitatively limited; it is not
automatically beneficial. These results change neither endpoint nor the
remaining hypotheses of the sharp bound. They do not identify the concrete
Gaussian phase moment or certify the new response's score.

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

**Fully formal unconditional upper bound** — `Grothe.haagerup_bound : IsGrothendieckBound (1404909409/1000000000)`
(`Grothe/Haagerup/Power.lean`, with the finite check in `Grothe/Haagerup/PowerCheck.lean`), with **no hypothesis**.
Lean derives Haagerup's identity from the complex Hermite basis and Mehler formula,
with the Gaussian phase coefficients evaluated by a finite Pochhammer identity:
E[conj(phase⟨g,x⟩)·phase⟨g,y⟩] = Σ_k (π/4)(1/2)_k²/(k!(k+1)!) z|z|^{2k} with z = ⟨x,y⟩, and combines it
with a degree-29 preprocessor and 1,024 exact series terms. A finite polynomial approximate inverse
retains cancellation across the complete infinite suffix. Its inverse defect and a short combined
product, followed by a second Abel summation using coefficient convexity, give a normalized
tail cap of 87.7·10⁻⁹; the complete finite residual cap is 95·10⁻⁹.
The general signed Abel/resolvent theorem and coefficient-locality argument are proved in
`Grothe/Upper/ResolventTail.lean`. The Gaussian identity, tensor realization, checker soundness,
infinite tail and final transfer are all proved in Lean, with one pinned numerical check and no
external analytic hypotheses. Exact data in `data/haagerup-resolvent/certificate.json` reproduce the
Lean certificate byte for byte. See [the complete proof and replay](docs/HAAGERUP_POWER.md).
The sharper conditional bound above remains stronger.

**Written unconditional refinement: K_G^ℂ < 1.40489844.** For the unchanged
fifth scalar preprocessor in [HJM, Sections 5–6](https://arxiv.org/html/2609.25462v1),
exact arithmetic gives `||P₅^16||₁ < 581/1000`. Every omitted outer index
`j ≥ 67` therefore receives a factor at most `(581/1000)^8`. This reduces its
weighted outer-tail reserve from about `6.31935e-8` to `8.20506e-10`, while
retaining the published prefix, complete finite-block tail, other tails and
exact selector mass. The resulting reciprocal is below `1.404898431637415`.

`Grothe/Haagerup/ScalarTailRefinement.lean` proves the finite power certificate,
the general signed suffix inequality and the rational score transfer with the
published numerical budgets explicit. The phase-tail estimate at index 67 is
proved by an exact split at 120 and the existing infinite-tail majorant;
it is no longer an assumption of `refined_score_of_published_budgets`.
The polynomial power is checked by `decide +kernel` using the same outward
interval arithmetic. All sixteen scalar-tail results now use only standard
axioms, with no native evaluation axiom.
The four pinned public verification stages were replayed
successfully, including directed energy integration and the complete head/tail
audit; the two accepted coefficient tables were hash-checked, not regenerated.
This is a written corollary of the published proof, with its new steps checked
in Lean. The end-to-end unconditional Lean theorem remains `haagerup_bound`.
Exact inputs, the reproducible generator and all scope details are in
[`data/scalar-tail-refinement/`](data/scalar-tail-refinement/PROOF.md).

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus the `native_decide` facts pinned in `data/axioms/native.txt` (read by `scripts/check_axioms.py`):
`Grothe.head_check` (the upper head), `Grothe.UpperChaos.phi_cover_check_0`–`5` (the phase cover |φ| < 1),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.HaagerupPower.check` (the residual, power norm, inverse defect, combined seed and signed tail),
the eight chunks
`Grothe.Lower.certRows0`–`4` and `certBatches0`–`2` for the certified rows and mixed batches, the four
`Grothe.Research.RefinedLowerCheck.certRefinedBoxes0`–`3` chunks and
`certRefinedPartition` for the refined cover,
`Grothe.Research.LawNodeCheck.certLawNodes` for the five added unshifted law nodes,
`capChords_check` (the chord nodes of the cap tables) and the 60 range checks `capRangeKK_j` of the node caps.
Every native check is single-threaded code (no `Task.spawn`).
Everything else is kernel-checked. No `sorry`. The axiom report `scratch/Axioms.lean`
is verified in CI by `scripts/check_axioms.py`.

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
0.7119473997. Seventeen additional Lean results check the polynomial separator,
common signed-tail prices, error propagation, and finite-mixture assembly.
The Gaussian-family application is a written proof with an explicit Lean
low-coefficient interface. An incumbent's coefficient-l1 error is paid once
for every admissible spectral price; the complete score has the same error
allowance. The numerical pool screens and phase-perturbation searches remain uncertified;
none of these research interfaces changes either endpoint.
See [the separator proof and trust boundary](docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md).
`Grothe/Research/` adds 13 kernel-checked facts for coupled complex modulus
majorizers, finite descent and semiconvex chord assembly. They use only the
three standard axioms above and add no native facts. Gaussian integration,
response extraction and global covers needed to apply these algebraic facts
remain separate obligations. The refined cover has its own complete finite
checks and retains `NodeCaps`. Their scope
and exact research replays are indexed in [docs/RESEARCH_AUDIT.md](docs/RESEARCH_AUDIT.md).

Forty-seven further Lean results address the geometry and integration of phase perturbations.
They prove the exact modulus-weighted support defect, comparison of an entire
energy spectrum after a common isometry, and invariance when the response and
correlation operator are transported together. Rotating only the response
does not preserve an anisotropic kernel. An all-index recurrence also proves
that the phase spectrum has infinite first degree moment, ruling out that
unweighted derivative budget. A polarized tail certificate bounds the entire
omitted energy change by the product of two approximation-error norms. Its
inputs can be enclosed as positive integrals of squared polynomial errors;
the approximants need not be exact Hermite projections. This avoids a
subtraction of almost equal moments in a numerical residual Gram matrix.
Two overlapping coordinate tests handle the actual shared Gaussian phase:
one keeps its argument uniformly away from zero, while an affine polar chart
makes its phase the angular coordinate. Lean proves the exact transformed
Gaussian density, the Bernstein range enclosure used for chart selection,
and that a symmetry-invariant cutoff preserves a disk-valued response and
costs at most its omitted mass in squared L2 distance.
An exact rational phase update is proved to have unit modulus for every real
phase field, with a cancellation-free increment formula.
Five radius-jet results prove carry-free coefficient indexing, exact radius
translation, and a finite polynomial bound on whole complex patches. They
support preserving radius–angle cancellations before interval evaluation.
Two transport-ceiling results bound what a homogeneous norm-distance
comparison can certify; they bound the certificate formula, not a new response's true score.
The response-update assembly now keeps the signed changes on retained blocks,
passes the positive-error tail price through a contractive smoothing and the
actual bivariate kernel, and connects the complete coefficient score to
the transfer theorem. Its nominal error can be assembled from the inherited
anchor error and finite weighted retained-data errors, each charged once.
These results introduce no numerical facts and change neither endpoint;
the compact response integrals still require certification.
The argument and the required intertwining condition are written in
[docs/response-geometry.tex](docs/response-geometry.tex).

The full module-by-module inventory is in [docs/LEAN_DETAILS.md](docs/LEAN_DETAILS.md).

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality in its residual form |
| `Grothe/Upper/`, `Grothe/Haagerup/`, `GrotheKernel/` | upper bounds: Haagerup's phase-rounding identity, residual algebra, Hardy tail, kernel composition, interval evaluator and its soundness, head check, final theorem |
| `GrotheCapsKernel/` | independent precompiled numerical cap checker and fixed-point basics |
| `Grothe/Lower/` | lower certificate: positivity checks, Stein cuts and law budgets, rows, mixtures, the box cover, the endpoint, the transfer to finite matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis: the witness on L²(γ_n), integration by parts, chaos projections, spectral budgets, circular cubics, the Wick multigraph expansion and sixth cumulant, contraction tensors, the fibre potentials and the per-row reduction |
| `Grothe/Research/` | coupled modulus majorizers, finite descent, semiconvex chord arithmetic and the refined global lower cover |
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

`lake build` builds the single target `Grothe`, heavy cap rows included
(about 21 CPU-hours cold; CI replays them from its verified cache). For
Lean-relevant pushes, CI builds it, checks the generated roots and axiom report, and forbids
`sorry`, `axiom`, `implemented_by`, `extern`, `unsafe` and `Task.spawn`.
When no verified cache matches the cap rows'
sources, the check runs on the droplet's runner instead of failing. A `ready/` run checks the branch merged with current master
before auto-merging; deliveries changing the workflow use a pull request
(`AGENTS.md` §9). Documentation-only changes may skip the Lean checks.

## How this was made

The numerical constructions and certificates were produced in a collaboration between several
AI research systems; this Lean development checks them. The mathematical write-up, the
certificate replays and the research history are kept outside the repository. The overview
explains which steps are machine-checked and which rest on external certificates.
