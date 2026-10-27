# The complex Grothendieck constant, in Lean

Machine-checked certificates (Lean 4 + Mathlib) for the best currently known bounds on the
complex Grothendieck constant:

$$1.401697117301 < K_G^{\mathbb{C}} < 1.404598149141$$

Both bounds rest on explicitly stated analytic and computer-assisted inputs; see
[what is proved](#what-is-proved).

| year | who | lower bound | upper bound |
|---|---|---|---|
| 1953 | Grothendieck | | $K < \infty$ |
| 1984 | Davie | $1.33807 < K$ | |
| 1987 | Haagerup | | $K < 1.40490914$ |
| Sept 2026 | Guo, Fang, Lu ([arXiv:2609.07000](https://arxiv.org/abs/2609.07000)) | $1.35584631827168 < K$ | |
| Sept 2026 | Heilman, Jones, Malavolta ([arXiv:2609.25462](https://arxiv.org/abs/2609.25462)) | $1.4 < K$ | $K < 1.404898554746$ |
| Oct 2026 | **this repository** | $\mathbf{1.401697117301 < K}$ | $\mathbf{K < 1.404598149141}$ |

Haagerup's integral $1/\gamma^\dagger = 1.4045759\ldots$, where
$\gamma^\dagger = \int_0^{\pi/2} \cos^2 t \, (1+\sin^2 t)^{-1/2} \, dt$, has been proposed as the exact value;
it lies inside the interval, $2.22 \cdot 10^{-5}$ below our upper bound.

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
complex matrix, with V over all finite-dimensional complex Hilbert spaces. All three headline
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

The fourth-moment cap follows directly from the exact Wick identity and two
general tensor inequalities (`Chaos3.fourth_le`); no separate positivity
assumption on the expectation is needed. For the circular cubic residual,
`LowerAnalytic/CircularFourth.lean` replaces the previous pair cap of 62 in the
Gaussian reduction with the sharp bound `E|q|⁴ ≤ 44 (E|q|²)²`, using the existing complex contraction
identities and Hilbert–Schmidt inequalities. The one-coordinate Wick cubic
attains 44. The fourth-moment improvement alone does not change the Grothendieck endpoint; see
[`docs/CIRCULAR_FOURTH_MOMENT.md`](docs/CIRCULAR_FOURTH_MOMENT.md) for the
analytic argument and its consequences. The tensor and scalar estimates for
both joint sixth-moment bounds are shared in `LowerAnalytic/JointSixthCore.lean`.
The production cuts and parameterized refinements use the same proof through
their real-to-complex normalization identities.

The joint sixth-moment/Stein budgets are also formalized in
`Grothe/LowerAnalytic/JointSixth.lean`, `Grothe/Lower/Reserve.lean` and
`Grothe/LowerAnalytic/JointBudget.lean`. They retain the shared tensor constraints. The certificate bank contains 44 joint-moment node
certificates, each checked on its certified kurtosis range and connected to the Gaussian
cubic by `Grothe/LowerAnalytic/JointContractions.lean`. Five of those nodes use the
stronger Young budget transported by an exact identity; the cover contains 10,909 boxes.
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
`ComparisonInputs → energy_close → IsGrothendieckBound (500000000000000000/355973699884132991)`,
and `Grothe.upper_value_lt` shows this is below 1.404598149141
(`Grothe/UpperChaos/GroupedRounder.lean`).

A second conditional route, `Grothe.UpperChaos.fresh_upper_concrete_taylor_relaxed`,
allows total energy-table discrepancy at most `5/10^7` and still yields a rational
bound below `1.404599424`. It retains the fourteen Gaussian band-error hypotheses;
neither those estimates nor the relaxed energy-table bound is proved yet. An alternative
`Grothe.UpperChaos.Thirteen.fresh_upper_taylor_thirteen_bands` uses thirteen
Gaussian band hypotheses with the same relaxed table assumption; its conditional
rational bound is also below `1.404599424`.
`Grothe.UpperChaos.Twelve.fresh_upper_taylor_twelve_bands` instead uses twelve
Gaussian band hypotheses and the same table assumption, giving a rational bound
below `1.404599598`. Its third-source final band is bounded from the first
three by the exact sixth moment; the remaining inputs are not yet proved.

The rounding is the smoothing G_T of T = F₀·P₃(φ): a two-coordinate Gaussian phase rounding F₀ times the
cubic Taylor polynomial P₃(x) = 1 + ix − x²/2 − ix³/6 of a damped polynomial phase φ. It is **defined in Lean**
from the stored data (`Grothe/UpperChaos/Rounder.lean`). Lean proves that G_T is measurable, charge one and
disk-valued: |P₃(x)|² = 1 − x⁴(3 − x²)/36 and |φ| < 1 everywhere (`phi_abs_lt_one`, from φ² ≤ 99/100: an exact
bisection cover of a box in 512 cubes with a first-order expansion of the exponential, plus an analytic far field;
native facts `phi_cover_check_0`–`5`). |φ| < 1 is also the input the external comparison argument relies on. Its correlation kernel H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ, with the odd
preprocessors of degrees 41 and 15 (Wiener norms ≤ 1, auxiliary linear coefficient zero), is compared with c·t,
c = 7119483103461/10¹³, through the kernel of a truncation X, and the bound is 1/(c − ‖H − c·t‖) with residual
at most 455288917009/(5·10¹⁷).
Lean proves the complex Gaussian chaos calculus on ℂ² (`Grothe/UpperChaos/`: Hermite basis, completeness,
Parseval, the Mehler formula for L² functions, charge selection, energies → kernel), hence the structural facts
(validity, summability, parity) for G_T and X; the transfer inequality; the evaluation of the head of the kernel
through degree 501 from 21,168 stored energies by a verified interval checker; the tail bound and the endpoint
arithmetic. Tensor completeness follows from one-coordinate completeness by Fubini and
fibrewise Cauchy–Schwarz; the Gaussian mixing law follows from product characteristic functions.
The standard complex Gaussian, planar presentation, rotation invariance and radial-moment
reduction are shared in `LowerAnalytic/ComplexGaussianCore.lean`. The unconditional
upper proof imports this foundation independently of the lower row certificates.

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
`exp(-155) < 148⁻³¹`. This certifies the first-coordinate radial tail;
the comparison-band coefficient enclosures remain open.

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

`fresh_upper_concrete_taylor` instantiates the improved conditional bound with these fixed
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
| `hfirst`, `hsecond`, `hthird` | fourteen finite-band Gaussian error inequalities for the fixed Taylor sources and centers; Lean derives the rounding and three tail caps, decomposition and supports | 93.56% |
| `energy_close` | the stored energies are within 6847009/(5·10¹⁷) of E(X) | 0.001% |

The head, computed in Lean (`head_check`), is 28153/10¹², 3.09% of the total
455288917009/(5·10¹⁷). The Hardy tail beyond degree 501, 30488839/10¹⁵ (3.35%), is **proved**: the weighted
square sum is ≤ 7/4 at radius 4149/4000 (`HardyReal.hardy_GT`, below).

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
radius greater than 4149/4000, and its mean square on that circle is at most 7/4; Parseval then gives the
weighted square bound. `HardyHolo.lean` proves holomorphy (`differentiableOn_HholPair_Rt`), continuation and
Parseval; `SchurMain.lean` the Gaussian Schur bound of the continued kernel; five interval facts (`HardyArc*`)
the decay region and the circle mean (≈ 1.659). `HardyReal.lean` identifies the series for real `t` with the
continued kernel: unfolding the smoothing, the Mehler pair `(MX + NZ, MY + NZ')` has the law of
`(U, RU + SW)` (`law_swap`, by characteristic functions), whose density on ℝ⁸ is the holomorphic kernel at the
real cross covariance `R = Rt t` (`integral_pair_eq_kHol`, by the Cholesky substitution). `hardy_GT` is the
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
with the specified error pieces remains external; Lean proves the selected
comparison from those pieces. The complete dependency ledger and exact replay
are in [`data/localized-comparison/PROOF.md`](data/localized-comparison/PROOF.md),
with a mathematical account in [`docs/localized-comparison.tex`](docs/localized-comparison.tex).
The native head computation remains part of the proof.

**Unconditional upper bound.**
`Grothe.haagerup_bound : IsGrothendieckBound (1404909132791/1000000000000)`
(`Grothe/Haagerup/Power.lean`, assembled in `CanonicalProof.lean` with finite checks in `CanonicalCheck.lean`), with **no external hypothesis**.
Lean derives Haagerup's identity from the complex Hermite basis and Mehler formula,
with the Gaussian phase coefficients determined by a polynomial moment recurrence:
E[conj(phase⟨g,x⟩)·phase⟨g,y⟩] = Σ_k (π/4)(1/2)_k²/(k!(k+1)!) z|z|^{2k} with z = ⟨x,y⟩, and combines it
with a degree-41 preprocessor and 64 exact series terms. All orders of forward differences
of the normalized Haagerup coefficients are nonnegative, proved from a product of two
rising-factorial quotients. This gives a canonical resolvent expansion: the finite head
and ten correction terms are combined before taking absolute values.
The finite check encloses the first 165 coefficients with a cap of 368411/(5·10¹⁵).
A polynomial coefficient norm weighted by (3/2)ⁿ has cap 10¹³ and bounds all omitted
coefficients by 10⁻¹⁶, without an analytic-continuation input.
The estimate retains the actual Haagerup coefficients and forward differences
instead of replacing them all by one common cap.
The completed-head cap is 736823/10¹⁶ and the infinite-remainder cap is 2/10¹⁶,
giving a total normalized residual cap of 736825/10¹⁶. The proof factors powers
of the short seed RP¹⁷ inside the combined resolvent products before taking norms.
For each coefficient prefix, a power of X makes the finite boundary vanish exactly;
the general completion theorem needs no convergence-to-zero hypothesis.
The coefficient argument, resolvent identity, checker soundness and matrix transfer
are proved in Lean. Large convolutions are proved in continuation blocks of at most five left
coefficients. The generic `convI_append` identity preserves the original
outward arithmetic order; recurrence and exact input-binding lemmas recover
the four checker statements without a new numerical premise.
The focused audit policy requires 98 results using only the three standard axioms,
with **no native-check dependency**.
The degree-20 polynomial P and degree-64 resolvent R are generated from an exact
inverse-series recipe, with 60-bit dyadic normalization and rounding. See
[the complete proof and replay](docs/HAAGERUP_POWER.md), the
[CI acceptance receipt](docs/verification/haagerup-alternating-20261027/acceptance/README.md), and the
[historical candidate and repair checks](docs/verification/haagerup-alternating-20261027/README.md).
The sharper conditional bound above remains stronger.

**Toward a Lean proof of the HJM bound (epic #139).** `Grothe/HJM/Mixture.lean` proves the mixture bound
`K ≤ M/(q̂₀ − Σ_{k≥1}|q̂_k|)` for a weighted mixture `Σ w_r K_r` of dominated radial kernels with `Σ|w_r| ≤ M`
(`mixture_bound`; negative weights are free because domination survives absolutely convex combinations). The Cauchy
tails of the scalar branches 1–4 are proved (`Grothe/HJM/Cauchy*.lean`, `weighted_tails`:
`Σ_r |w_r| Σ_{n≥120} |k_{r,n}|` within HJM's budget `1.01718·10⁻¹¹`, with HJM's radii), from Haagerup's kernel
continued to the slit plane, a quadtree of complex interval boxes for the region, and Parseval on the circle.
Branch 5's tail beyond mode 120 is within HJM's published budgets (`branch5_tail`: modes 120–4987 of the phase
coefficients below 67 by one interval Horner evaluation, `finite67_check`, and the rest by `ScalarTailRefinement`). The assembly `hjm_bound_of_tables` (`Grothe/HJM/Assembly.lean`,
`HeadCheck.lean`) gives `IsGrothendieckBound 1.4048984303` from the six-branch mixture and the published ledger,
once the origin branch supplies its 120-coefficient table (`headOK`, #158) and its tail (#159).
`Grothe/HJM/Origin.lean` defines the asymmetric sixth branch from exact polynomial-phase
responses and proves domination of its full real radial coefficient series. The proof uses one
shared Gaussian driver, the charge-one Hermite expansion and conjugate-reflection symmetrization.
The endpoint cross product is exactly imaginary; its phase-phase term cancels before taking
absolute values. Bessel bounds the entire spatially omitted coefficient sequence by squared
energy `exp(-36)`. A rational Bernstein certificate proves `|P(s)|² ≥ 37/100` for all `s ≥ 0`.
`PhaseRotation` keeps the complex cross-coefficients: multiplying the second response by
any `ζ` with `|ζ| ≤ 1` gives a dominated branch with coefficients `Re(ζ aₙ)`, and `ζ = 1`
recovers the original mixture. `MixtureHead` converts a finite head and weighted branch-tail
budget into a bound. Under residual-energy caps `1.174`, `1.176`, `PhaseRotationTail`
bounds the rotated origin tail from mode 120 by `0.00025828 + 0.00252 |Im ζ|`.
This is a family of conditional certificates, not a new certified numerical endpoint.
The charge-one Hermite modes have an explicit radial polynomial and Gaussian integral
formula. The change to squared radius joins the Green identity to weighted
Parseval with the original chaos multiplier `2n+1`. The actual radial phases are
smooth through zero and their denominators exceed `1/250`. Exact polynomial
divided differences give continuous energy amplitudes at zero, integrable on every
finite panel. Explicit phase derivatives and polynomial growth prove global
Gaussian L², every-mode pairing integrability and the Green limit at infinity.
The actual endpoint-subtracted coefficients satisfy the full weighted-energy
identity with weights `(2n+1)²`, without additional analytic hypotheses; the
continuous energy amplitude at zero is `−3/2` times the phase derivative.
The signed Gaussian phase coefficient is `(-1)^n sqrt(haagCoeff n)`.
`OriginPhaseTail` bounds its inverse-degree-weighted suffix by `1/(48 N³)`.
`OriginTail` subtracts the visible energy before applying Cauchy–Schwarz and
gives an origin coefficient tail at mode 120 of at most `0.00025828`, conditional
on total energies at most `12.671`, `12.674` and visible energies at least
`11.497`, `11.498`. `OriginTailBudget.origin_tail_of_visible` supplies the
assembly's origin-tail hypothesis from these four numerical inequalities;
the exact weighted cap fits the existing budget without relaxing the ledger.
`Repriced` uses that smaller cap in the ledger directly: the published head
hypotheses and these four specific energy inequalities imply an exact bound
below `1.4048984278`. The head enclosure and energy inequalities remain
unproved inputs, so this is not an unconditional numerical bound.
`UnweightedRepriced` gives a conditional bound below `1.404898380143` from the same published head hypotheses and the two unweighted residual suffix norms at most `0.0021`. Those suffix bounds remain to be certified. The looser cap `0.00265` on each suffix already fits the repriced origin-tail budget.
For numerical enclosure, a nonnegative inverse-modulus
polynomial residual controls the phase error; uniform spatial error `ε` inside radius
`R` gives the joint squared coefficient budget `ε² + exp(-R²)` for all modes.
The generated `OriginPanels` certificates bind inverse-modulus polynomials
to the actual numerators on radii `[0,8]`. `OriginPanelBudget` bounds each
response's Gaussian `L²` approximation error by `1001/10^15`, pricing the
entire coefficient sequence jointly. The approximants are piecewise
polynomials, cut off at radius eight. Their Gaussian moment integrals still
need enclosures before they provide the origin coefficient table or visible
energy lower bounds.
`OriginWitnessData` gives two exact finite test vectors and verifies their
rational mass and weighted-mass bounds. They are candidates for certifying
visible energy by a single signed correlation per response; the needed
Gaussian correlation enclosures remain separate proof obligations.
The visible-energy interface uses one signed polynomial correlation per
response and the Gaussian `L²` approximation budget. The strengthened phase
tail permits the common numerical targets of total energy at most `12.7` and
visible energy at least `11.5` for each response. With those symmetric targets,
`Repriced` gives a conditional exact bound below `1.4048984302`; it inherits the
existing native scalar-tail checks. A signed polynomial moment
enclosure integrates each complete polynomial before bounding its Taylor
remainder; its concrete correlation checks and the total-energy enclosures
remain to be supplied.
These structural results introduce no native facts. The pinned 120-entry interval tables are
provenance data: their integral enclosures and the two numerical energy bounds still require
Lean proofs before the six-branch numerical bound follows. See [the origin certificate inventory](data/hjm/origin/README.md).

**Written unconditional refinement: K_G^ℂ < 1.4048984303.** For the unchanged
fifth scalar preprocessor in [HJM, Sections 5–6](https://arxiv.org/html/2609.25462v1),
exact arithmetic gives `||P₅^16||₁ < 581/1000`. Every omitted outer index
`j ≥ 67` receives the factor `(581/1000)^floor((2j+1)/16)`. Retaining these
weights through index 159 and bounding the remaining suffix at 160 reduces the
weighted outer-tail reserve to `1.42728e-10`, while
retaining the published prefix, complete finite-block tail, other tails and
exact selector mass. The resulting reciprocal is below `1.404898430299659`.

`Grothe/Haagerup/ScalarTailRefinement.lean` proves the finite power certificate,
the general signed suffix inequality and the rational score transfer with the
published numerical budgets explicit. `Haagerup/WallisTail.lean` identifies the
coefficient recurrence with Wallis products and proves the all-index bound
`h_j ≤ 1/((4j+1)(j+1))`. A rational telescoping majorant bounds every interval
and gives `Σ_{j≥K} h_j ≤ 1/(4K)` for every positive integer K. The weighted
estimate prices the twelve constant-weight blocks at
67–159 and the remaining suffix at 160; their bound is below the unchanged
exact ledger cap. The final score transfer has no tail premise.
The polynomial power is checked by `decide +kernel` using the same outward
interval arithmetic. All sixteen scalar-tail results now use only standard
axioms, with no native evaluation axiom.
The four pinned public verification stages were replayed
successfully, including directed energy integration and the complete head/tail
audit; the two accepted coefficient tables were hash-checked, not regenerated.
This is a written corollary of the published proof. `WEIGHTED_BUILD.json` records
the focused build of the earlier weighted-tail source at its pinned commit; it
does not certify subsequent revisions. The separate end-to-end unconditional
Lean theorem is `haagerup_bound`.
Exact inputs, the reproducible generator and all scope details are in
[`data/scalar-tail-refinement/`](data/scalar-tail-refinement/PROOF.md).

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
All other proofs, including the canonical finite checks, are kernel-checked.
No `sorry`. The axiom report `scratch/Axioms.lean`
is verified in CI by `scripts/check_axioms.py`, including the node caps.
The report is `scratch/Axioms.lean`; its required declarations are listed in `data/axioms/required.txt` and the
allowlisted native facts in `data/axioms/native.txt` (the cap ranges, the Hardy checks and the others).
The focused report `scratch/AxiomsPower.lean`, checked with `--haagerup-power`, allows
no native axioms for its 98 selected unconditional upper-bound results.
Normal `ready/*` delivery CI builds and audits the combined tree before merging it.

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
