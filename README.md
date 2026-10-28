# The complex Grothendieck constant, in Lean

A Lean 4 + Mathlib development targeting these bounds on the complex
Grothendieck constant:

$$1.401697117301 < K_G^{\mathbb{C}} < 1.404598149141$$

Both bounds rest on explicitly stated analytic and computer-assisted inputs; see
[what is proved](#what-is-proved).

**The only active upper-bound target is $K_G^{\mathbb C}<1.404598149141$.**
Both endpoints are **work in progress**. For the upper endpoint, fourteen actual
Gaussian finite-band estimates and energy-table discrepancy at most
`6847009/(5·10^17)` still need Lean proofs. The direct-kernel route instead needs
a proved numerical head estimate. Our own numerical obligations are not accepted
external inputs. A bound is **done** only when its complete Lean proof and final
verification pass. The active work now prioritizes the upper endpoint.

**New here? Read [OVERVIEW.pdf](OVERVIEW.pdf)** — an explanation of the problem, the two
constructions, what exactly the computer checks, the new inequalities and obstructions found along
the way, and why the remaining gap is hard.

## The constant

For a complex matrix $A = (a_{ij})$ compare two optimisation problems: over unimodular scalars,

$$C(A) = \sup_{|\varepsilon_i| = |\delta_j| = 1} \Big| \sum_{i,j} a_{ij} \, \overline{\varepsilon_i} \, \delta_j \Big|,$$

and over unit vectors in a complex Hilbert space,

$$V(A) = \sup_{\lVert x_i \rVert = \lVert y_j \rVert = 1} \Big| \sum_{i,j} a_{ij} \, \langle x_i, y_j \rangle \Big|.$$

Grothendieck's inequality (1953) says that $V(A) \le K \cdot C(A)$ for a universal constant $K$,
independent of the matrix size and of the Hilbert-space dimension. The smallest such $K$ is the
complex Grothendieck constant $K_G^{\mathbb{C}}$. Its exact value is unknown, as is that of the real
constant $K_G^{\mathbb{R}}$. The inequality governs tensor norms, absolutely summing operators, the
approximation ratio of semidefinite relaxations of quadratic optimisation, and the gap between
classical and quantum correlations in two-party Bell experiments (real case).

## What is proved

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V over all finite-dimensional complex Hilbert spaces. The headline
theorems conclude a statement about the constant itself.

**Lower bound** — `Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data :
NodeCaps → IsGrothendieckBound K → 1.401697117301 < K`
(`Grothe/Research/RefinedCoverResult.lean`).

The witness is the operator T = P₁,₀ − (149/200)·P₂,₁ on L² of the complex Gaussian measure
(projections onto the linear and the cubic Wick chaos). Lean proves: the transfer from the
norm of T to finite matrices; the value of T on vector-valued test functions; the exact
reduction of ⟨f, Tg⟩ for every pair of unimodular functions to 19 one-variable row
inequalities; all analytic facts about the law of the cubic residual (moment bounds, Stein and
spectral cuts, the contraction-Gram budgets, the sixth-moment Wick identity); and the finite
certificate that combines them (351 existing mixed-node certificates, two additional pure-row law nodes, three mixed-source Young nodes, and a cover of the parameter space by
10,909 boxes, checked by single-threaded `native_decide` facts). The **only hypothesis**, `NodeCaps`, states that 19 explicit
one-variable functions Ψ_r (defined in Lean as suprema of finite-dimensional Gaussian
integrals) lie below stored rational values at their tabulated nodes. Those caps are certified
by exact-arithmetic computations outside Lean; moving them inside is work in progress.

Lower cut soundness is organized by specialization: ordinary spectral cuts use the
general shifted-cut theorem, ordinary and joint Gram budgets use the signed-reserve
theorem, and all Stein and spectral node majorants use one admissible-cut integration lemma.

For the circular cubic residual,
`LowerAnalytic/CircularFourth.lean` replaces the previous pair cap of 62 in the
Gaussian reduction with the sharp bound `E|q|⁴ ≤ 44 (E|q|²)²`, using the existing complex contraction
identities and Hilbert–Schmidt inequalities. The one-coordinate Wick cubic
attains 44. The fourth-moment improvement alone does not change the Grothendieck endpoint; see
[`docs/CIRCULAR_FOURTH_MOMENT.md`](docs/CIRCULAR_FOURTH_MOMENT.md) for the
analytic argument and its consequences. The tensor and scalar estimates for
both joint sixth-moment bounds are shared in `LowerAnalytic/JointSixthCore.lean`.
The production cuts and parameterized refinements use the same proof through
their real-to-complex normalization identities.

The node-cap proof infrastructure is in Lean (`Grothe/LowerAnalytic/Cap*.lean`):
the 505 chord nodes follow from the vertex caps by convexity (`nodeCaps_of_vertexCaps`, `capChords_check`);
a vertex cap Ψ_r(s) − 10⁻¹¹ ≤ c is proved from an anchored-pair majorant with dyadic cell prices on a uniform
polar grid, verified interval enclosures of the integrated coefficient matrix (`CapTables.lean`), a Loewner bound
and an exact LDLᵀ check (`pot_le_of_nodeOK`); the per-node price recipes (`CapRecipeData.lean`) are checked by the
precompiled kernel `GrotheCapsKernel/CapCheck.lean`, one `native_decide` fact per range of nodes (`capRangeKK_j`,
four per row, one module `CapRowKK.lean` per row; no parallel tasks). Hence
`lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401697117301 < K`, where **`CapsRest`** comprises the vertex caps
of the rows 0.84, 0.845, 0.85, 0.855 and any excluded-node caps of the other rows. The exclusion lists are currently empty.

**Node caps: included in `Grothe`, replayed by CI from a verified cache.**
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
`ComparisonInputs → energy_close → IsGrothendieckBound (500000000000000000/355973699960428191)`,
and `Grothe.upper_value_lt` shows this is below 1.404598148840
(`Grothe/UpperChaos/GroupedRounder.lean`).
The abstract `DirectHyps` interface uses the sharper Hardy budget below; the
concrete rounding proves it from the existing arc checks, so its Gaussian
comparison and energy-table inputs are unchanged. This stronger conditional
arithmetic provides margin toward the existing target; the Gaussian inputs
still require proofs.

The target `K < 1.404598149141` is **work in progress**. One completed supporting
calculation is `ProfileFirstGaussianCell`: Lean proves the exact integral of
the squared degree-one Laguerre component against `exp(-s)` on `[0,1]`, and
encloses it in `[0.054391816192, 0.054391816194]` using Mathlib's proved
exponential bounds. The remaining profile and response estimates require further work.

LeanCert is a pinned dependency. `UpperChaos/LeanCertPilot.lean` uses its
dyadic interval integrator to enclose a conditional Gaussian slice integral
on `[0,1]` in `[1,5/4]`. The explicit 16-cell certificate uses `decide +kernel`;
the slice is identified with the actual affine Gaussian phase integral.
This supporting calculation adds no native checker. The production Gaussian
error estimates needed for `1.404598149141` remain work in progress.

A proposed direct route, `Grothe.UpperChaos.DirectSample.upper_of_actual_head`,
derives the same sharp rational bound from an explicit finite-head estimate for
the actual kernel. That numerical head estimate remains unproved; the route
does not by itself establish an unconditional bound.

The rounding is the smoothing G_T of T = F₀·P₃(φ): a two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. It is **defined in Lean**
from the stored data (`Grothe/UpperChaos/Rounder.lean`). Lean proves that G_T is measurable, charge one and
disk-valued: |P₃(x)|² = 1 − x⁴(3 − x²)/36 and |φ| < 1 everywhere (`phi_abs_lt_one`, from φ² ≤ 99/100: an exact
bisection cover of a box in 512 cubes with a first-order expansion of the exponential, plus an analytic far field;
native facts `phi_cover_check_0`–`5`). |φ| < 1 is also the input the external comparison argument relies on. Its correlation kernel H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ, with the odd
preprocessors of degrees 41 and 15 (Wiener norms ≤ 1, auxiliary linear coefficient zero), is compared with c·t,
c = 7119483103461/10¹³, through the kernel of a truncation X, and the bound is 1/(c − ‖H − c·t‖) with residual
at most 455212621809/(5·10¹⁷).
Lean proves the complex Gaussian chaos calculus on ℂ² (`Grothe/UpperChaos/`: Hermite basis, completeness,
Parseval, the Mehler formula for L² functions, charge selection, energies → kernel), hence the structural facts
(validity, summability, parity) for G_T and X; the transfer inequality; the evaluation of the head of the kernel
through degree 501 from 21,168 stored energies by a verified interval checker; the tail bound and the endpoint
arithmetic. Tensor completeness follows from one-coordinate completeness by Fubini and
fibrewise Cauchy–Schwarz; the Gaussian mixing law follows from product characteristic functions.
The standard complex Gaussian, planar presentation, rotation invariance and radial-moment
reduction are shared in `LowerAnalytic/ComplexGaussianCore.lean`. The upper proof imports this foundation independently of the lower row certificates.

The exact phase-moment route clears arbitrary rational coefficient denominators,
multiplies the resulting integer polynomial, and integrates its monomials by
finite Gaussian sums (`PhaseMomentCheck`, `PhaseMomentEval`).
`integral_phiT_pow_even` in `ConcretePhaseMoments` identifies every even moment with
this calculation from the actual `phaseTerms` and damping parameter; it needs
no phase-cover premise. The separate single-threaded checks `PhaseMoment2`,
`PhaseMoment4`, and `PhaseMoment6` compare the computed moments with exact
rational targets, approximately 2.56852947444587·10⁻⁶, 5.71439509703932·10⁻¹⁰,
and 1.68238736430120·10⁻¹¹. `PhaseMomentNorms` identifies these values with the
squared norms of the three Taylor sources. Individual comparison-band errors
and the stored-energy accuracy remain separate obligations: these total
energies alone do not discharge `ComparisonInputs` or `energy_close`, and the
headline bounds are unchanged. Exact targets and reproduction instructions are
in [`data/phase-moments/`](data/phase-moments/README.md).

`PhaseRadialTail` also proves
`∫_{‖z₁‖² > 50} φ² dγ₂ < (5·10⁻¹⁵)²` for the actual production phase.
`RestrictedPhaseMoments` expresses this integral as `exp(-155)` times an
exact rational factor, checked directly from `phaseTerms` by
`phase_cutoff_factor_check`. A degree-twelve Taylor bound at 5 gives
`exp(-155) < 148⁻³¹`. `TaylorRadialTail.norm_source_fifty_lt` converts this
to an `L²(γ₂)` norm below `5·10⁻¹⁵` for every positive Taylor source restricted
to that event, using `|φ| < 1`. The comparison-band coefficient enclosures
remain open.

`CapturedTail` supplies the orthogonal tail argument: from disjoint captured
bands, subtract the sum of their separately certified energies
`max(0, lower_i − error_i)²` from the total moment. `TaylorErrorEnergy` gives
the alternative whole-error identity using one inner product with the
approximant. These interfaces retain the required coefficient-norm and
integral bounds as hypotheses.

The inherited Taylor coefficient files and frozen correction are preserved in
[`data/taylor-approximants/`](data/taylor-approximants/README.md), with their
original hashes. `HermiteFinite` identifies norms of finite normalized Hermite
expansions with rational sums of coefficient squares. `GradedHermite` provides
injective charge-one indexing and direct coefficient lookup. `TaylorBandCheck`
certifies the complete third approximant's 6,552 coefficients through degree 51:
its total norm, all four captured band norms, and its vanishing degree tail.
`GradedHermiteFn` supplies its continuous, charge-one pointwise representative.
`ThirdCapturedTail` derives the existing third-order tail cap from four explicit
finite-band Gaussian error bounds, using the exact sixth phase moment and the
captured center energies. Those Gaussian error bounds remain hypotheses.
The first and second centers and frozen correction also have exact dyadic
representations. `TaylorRounding.norm_roundingDifference_le` proves
‖c₁+c₂/2+c₃/6−v‖ ≤ 10⁻¹⁸ by recomputing the common-denominator integer energy.
`TaylorFirstBandNorms` and `TaylorSecondBandNorms` certify the six and four
remaining captured band norms from the same exact arrays. `FirstSecondCapturedTail`
derives the other two high-tail caps. `TaylorCenterFunctions` gives the concrete
pointwise functions and discharges the rounding comparison piece.

`fresh_upper_concrete_taylor` instantiates the target upper-bound implication with these fixed
centers. Its Gaussian inputs are six first-order, four second-order and four
third-order finite-band error inequalities, with the explicit caps in
`TaylorTailData`, together with the concrete kernel-energy table accuracy.
The rounding and three high-tail caps follow internally. The slightly tighter
finite-band caps are necessary to preserve precision in the captured-energy
subtraction; their Gaussian validity remains open.
`Haagerup/PhaseLaplace` gives an analytic representation of complex phase as a
Gaussian Laplace mixture, including its value at zero. It proves integrability,
a uniform absolute-integral bound, and the affine completion-of-squares identity.
`PhaseLaplaceFubini` proves absolute integration and exchange of the parameter
with any integrable source. `TaylorInnerLaplace` applies it to the actual Taylor
inner products. `ConditionalGaussianPhase` evaluates affine-kernel Gaussian
monomials by finite shifted Wick sums, retaining their inverse-rate mass.
`ConditionalGaussianPolynomial` extends the evaluation and integrability
results to the existing `CPoly` representation by its finite monomial support.
`ConditionalGaussianBase` preserves the cancellation in the zeroth moment:
the conditional bracket is exactly `alpha*z/beta^2`. `ConditionalGaussianTail`
proves an integrated auxiliary tail at `‖z‖ ≥ r₀ > 0`, bounded by
`4/(3*alpha*r₀^3) * T^(-3/2)`. It is uniform in the real profile coefficient,
including its zeros. Bounds for the full polynomial-weighted sources, the
radial endpoint and certified numerical integration remain open.

`GradedHermitePhaseSlice` expresses each actual Taylor source as a polynomial
in the conditional coordinate times its exact Gaussian damping.
`TaylorConditionalGaussian` evaluates that conditional integral by the finite
Wick sum, with rate `alpha=1+j*phaseEpsQ` and no Taylor factorial inserted.
`TaylorInnerFubini` justifies the product integration at every positive
auxiliary parameter. `TaylorWickReduction.inner_gradedHermite_hpow_eq_wick`
then writes the actual inner product as the iterated auxiliary and
first-coordinate Gaussian integral of this finite evaluator.
`SoftPhaseLaplace` expresses each finite softened Gaussian mixture as the
existing Laplace kernels, with termwise integrability explicit for integration.
`ShiftedMomentRecurrence` preserves the affine cancellation at every mixed
degree. `RadialDampedMoments` evaluates real radial powers above exponent
`-2`, including the locally integrable singularities needed by joint tails.
The full-source tail constants and certified quadrature remain open; these
analytic identities change neither numerical endpoint nor its hypotheses.

Lean also proves a selected-spectrum comparison: the error is split
into 18 pieces with specified degree supports and norm caps. Each piece pairs
only with X's energy in its selected band, weighted by the retained coefficient cost. The quadratic error is
grouped into the rounding remainder and three Taylor orders: within each group the bands are disjoint, so the
component norms combine in quadrature before the groups are added by the triangle inequality.
A native check derives every band radius from the stored table and its accuracy
allowance. Lean proves every coefficient cost with outward interval polynomial arithmetic.
A kernel-checked rational ledger assembles the grouped quadratic cost. No new Gaussian input is used.
The weighted comparison is at most 851922301/10¹⁵.
The concrete theorem's remaining **inputs** are:

| hypothesis | content | share of the residual |
|---|---|---|
| `hfirst`, `hsecond`, `hthird` | fourteen finite-band Gaussian error inequalities for the fixed Taylor sources and centers; Lean derives the rounding and three tail caps, decomposition and supports | 93.57% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of E(X) | 0.001% |

The head, computed in Lean (`head_check`), is 28153/10¹², 3.09% of the total
455212621809/(5·10¹⁷). The Hardy tail beyond degree 501, 303362486/10¹⁶ (3.33%), is **proved**: the weighted
square sum is ≤ 1737972/1000000 at radius 4149/4000 (`HardyReal.hardy_GT_tight`, below).

**The error decomposition is explicit** (`ComparisonPieces.lean`). With `T = F₀ + h₁ + h₂/2 + h₃/6`,
`hⱼ = (iφ)ʲF₀`, and the smoothing S as an `L²` contraction (`Smoothing.lean`: `Mx + NZ` is standard,
S is a contraction, `S T = G_T`), Lean defines for any charge-one `v, c₁, c₂, c₃` (the frozen correction and the
Hermite approximants) the 18 pieces `bandProj b_k (S srcₖ)` and proves that they sum to `G_T − X`,
`X = S(F₀ + v)` (`difference_pieces`), each supported in its band. `fresh_upper_pieces` is the sharp bound from
the 18 explicit norm bounds and the table accuracy of that X: `ComparisonInputs` is no longer an unspecified
decomposition, only 18 numeric norm statements about explicit `L²` objects (issue #39). They are stated on the
**unsmoothed** sources, `‖P_I srcₖ‖ ≤ εₖ`, the form the certificate bounds: S preserves the total degree
(`inner_smoothOp_hvec2_eq_zero`: S commutes with the Ornstein–Uhlenbeck smoothing, by a law identity, and that
smoothing has eigenvalue ρ^{|i|} on the mode i), so it commutes with every band projection and
`‖P_I S g‖ ≤ ‖P_I g‖` (`SmoothComm.lean`).

The Hardy tail first deducts the linear coefficient's weighted square,
forced by this weighted head comparison. This adds no Gaussian input.

**The Hardy tail, proved.** The kernel `H(t) = Σ hⱼ t^{2j+1}` of G_T continues holomorphically to a disc of
radius greater than 4149/4000, and its mean square on that circle is at most 1737972/1000000; Parseval then gives the
weighted square bound. `HardyHolo.lean` proves holomorphy (`differentiableOn_HholPair_Rt`), continuation and
Parseval; `SchurMain.lean` the Gaussian Schur bound of the continued kernel; five interval facts (`HardyArc*`)
the decay region and the circle-mean bound. `HardyReal.lean` identifies the series for real `t` with the
continued kernel: unfolding the smoothing, the Mehler pair `(MX + NZ, MY + NZ')` has the law of
`(U, RU + SW)` (`law_swap`, by characteristic functions), whose density on ℝ⁸ is the holomorphic kernel at the
real cross covariance `R = Rt t` (`integral_pair_eq_kHol`, by the Cholesky substitution). `hardy_GT_tight` is the
resulting `hardy` statement for the rounding of the certificate, and `fresh_upper_rounder` no longer assumes it.

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
Schur/Hardy replay are recorded alongside it (the Hardy input is now proved in Lean). The source coefficient-error
enclosures and table accuracy are inherited. Their identification
with the specified error pieces remains work in progress; Lean proves the selected
comparison from those pieces. The complete dependency ledger and exact replay
are in [`data/localized-comparison/PROOF.md`](data/localized-comparison/PROOF.md),
with a mathematical account in [`miscellaneous/other-bounds/tree/docs/localized-comparison.tex`](miscellaneous/other-bounds/tree/docs/localized-comparison.tex).
The native head computation remains part of the proof.

The other upper-bound developments are preserved in the committed
[weaker-bound archive](miscellaneous/other-bounds/README.md), outside the active Lean build.
Shared Gaussian phase and Laplace lemmas remain active dependencies of the target proof.

The repository-wide axiom audit permits `propext`, `Classical.choice`, `Quot.sound`,
and the `native_decide` facts pinned in `data/axioms/native.txt` (read by `scripts/check_axioms.py`):
`Grothe.head_check` (the upper head), `Grothe.UpperChaos.phi_cover_check_0`–`5` (the phase cover |φ| < 1),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.UpperChaos.phase_moment2_check`, `phase_moment4_check`, and
`phase_moment6_check` (the exact second, fourth and sixth moments of the production phase),
`Grothe.UpperChaos.phase_cutoff_factor_check` (its squared radial tail beyond radius-squared 50),
`Grothe.UpperChaos.hardy_arc_part_0`–`3` and `hardy_region_check` (the Hardy circle mean and decay region),
the eight chunks
`Grothe.Lower.certRows0`–`4` and `certBatches0`–`2` for the certified rows and mixed batches, the four
`Grothe.Research.RefinedLowerCheck.certRefinedBoxes0`–`3` chunks and
`certRefinedPartition` for the refined cover,
`Grothe.Research.LawNodeCheck.certLawNodes` for the five added unshifted law nodes,
`capChords_check` (the chord nodes of the cap tables) and the 60 range checks `capRangeKK_j` of the node caps.
Every native check is single-threaded code (no `Task.spawn`).
All other proofs are kernel-checked.
No `sorry`. The axiom report `scratch/Axioms.lean`
is verified in CI by `scripts/check_axioms.py`, including the node caps.
The report is `scratch/Axioms.lean`; its required declarations are listed in `data/axioms/required.txt` and the
allowlisted native facts in `data/axioms/native.txt` (the cap ranges, the Hardy checks and the others).
Normal `ready/*` delivery CI builds and audits the combined tree before merging it.

The full module-by-module inventory is in [docs/LEAN_DETAILS.md](docs/LEAN_DETAILS.md).

## Layout

| path | content |
|---|---|
| `Grothe/Transfer.lean` | `IsGrothendieckBound`, the transfer inequality in its residual form |
| `Grothe/Upper/`, `Grothe/Haagerup/`, `GrotheKernel/` | the target upper bound: shared Gaussian phase identity, residual algebra, Hardy tail, kernel composition, interval evaluator and its soundness, head check, final theorem |
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
