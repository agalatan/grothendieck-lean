# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).

`Grothe.Statement.main_bounds` (`Grothe/MainResult.lean`) proves `1.4020217618 < K_G^ℂ ≤ 1.404556392` (in Lean `14020217618/10000000000` and `1404556392/1000000000`), without hypotheses. The lower half is the exact endpoint `sparse_stein_endpoint` rounded strictly downward; the upper half is `Grothe.UpperSeven.constant_le`. The upper-only module `Grothe/UpperResult.lean` has three theorems: `Grothe.UpperSeven.bound` ($V(A)\le[10^{27}/711968565817136711740669035]\,C(A)$ for every finite complex matrix $A$; the factor is $1.4045563919697\ldots$), `constant_le` (the same, rounded up to nine decimals, for the constant) and `constant_lt_inv_gammaDagger` ($K_G^{\mathbb C}<1/\gamma^\dagger$). The scalar and vector suprema of the six-channel library are definitionally equal to those in `Grothe.Statement`. [Upper entrypoint](../Grothe/UpperResult.lean) · [Combined statement](../Grothe/MainResult.lean).

The seventh channel and its proof are in `Grothe/UpperSelector/`. The Gaussian field gives a dominated radial kernel in `Transfer.lean`. The recurrence for signed Fourier moments, the clipped binomial preprocessor and the phase masses feed `PhysicalColumn.lean`, which bounds error in the whole Wiener series. `NumericWitness.lean` evaluates the mixed head and selector allowance from Lean definitions in one native comparison. `Bound.lean` combines this with the six analytic tail bounds and proves `Haagerup.AngularSelector.isBound`.

The smoothed cell, phase and reflected tiger channels share the analytic transfer in `Grothe/UpperSix/Haagerup/Transfer.lean`. The finite data are checked against the evaluators in `Grothe/UpperSix/HaagerupKernel/`. The certificate for these six channels is `Grothe/UpperSixExact/`. `Parameters.lean` holds the polynomial of the first channel, the target slope and the caps. `Head.lean` checks the weighted head together with six lower bounds on the linear coefficients: the phase channel contributes 321 coefficients, from exact Haagerup moments, and each of the five cell channels 251. `Contour.lean` checks disk positivity and the circle mean for the first channel. `Bound.lean` subtracts the squared contributions of the linear coefficients from the Hardy estimates, which gives the tail caps, and proves `Haagerup.SixChannelExact.isBound`.

The article `haagerup-article/` is frozen and has its own Lean package under `haagerup-article/anc`, which proves the article's statement; they do not quote the bounds of this repository. [Article's Lean package](../haagerup-article/anc/README.md).

The earlier `upper_below_tight` proof (`Grothe/UpperTightFinal.lean`, `K_G^ℂ < 1.404599395362`) uses one Gaussian rounding and imports the shared Gaussian phase identity and Laplace modules under `Grothe/Haagerup/`. Its budgets, quadrature, and auxiliary refinements are documented below.

**Reading this inventory.** Most paragraphs describe one module or one result.
Where a paragraph says that a result takes an estimate as a hypothesis, or that
it gives no numerical bound, this describes that result; it is not an open
input of the main theorems, which have no hypotheses. The generated root imports both the seven-channel proof used by
`Grothe/MainResult.lean` and the independent single-channel proof. A module called
*archived* below is kept outside the libraries, in `abandonware/`
(`abandonware/README.md`) unless the text names `miscellaneous/`; it is not
built or checked. The value `1.404598149141` is the
target the rounding was designed for. The conditional theorem towards it,
`fresh_upper_rounder` (K_G^ℂ ≤ 500000000000000000/355973699960428191 <
1.404598148840, from fourteen finite-band Gaussian estimates that are not
proved), is archived; the theorem without hypotheses exhibits a bound below
`1.404599395362`.

**Different head lengths in a mixture.** A channel with a list of length $m$ encloses its true coefficients up to index $m-1$. The finite head sum pads that list with zeros. The error between the polynomial and the true kernel costs at most the channel’s absolute tail from $m$, multiplied by its mixture weight. The theorem also covers an empty list. [Lean transfer theorem](../Grothe/UpperSixExact/VariableCutoff.lean).

**Tight certified upper budget.** `UpperTightPanelTotals` checks the existing panel-cap sums
in Lean's kernel against `8·10⁻¹⁵`, `16·10⁻¹⁵` and `1131·10⁻¹⁵`. The same accepted
shards supply their analytic interpretation. Adding the existing `10⁻¹⁵` tail/gap reserve
and the exact dyadic table excursions gives the low-band radii; the already certified
inner-product thresholds give the whole-source radii. The comparison uses the seven
linear-piece radii and charges the four unsplit sources once in its quadratic term.

**Longer polynomial prefixes in the actual comparison.** `Upper/PolynomialHeadTail`
proves that dilating a polynomial by `r ≥ 1` bounds its coefficient tail after index
`L` by `r⁻ᴸ` times the dilated Wiener norm. `ImprovedHeadWeight` applies this to
`Pⁿ (Q/X)ᵐ`: the unchanged interval operations enclose the first 51 unshifted
coefficients, and the remaining coefficients have the uniform bound
`(10049/10000)^501 · (10023/10000)^167 / (3/2)^51 ≤ 2·10⁻⁸`.
The resulting `improvedWeight` is capped by both one and the previous
21-coefficient cost. The bound concerns each polynomial's retained coefficient
cost; it is separate from the infinite Hardy tail of the rounding kernel.
The new finite fact `Grothe.Upper.improved_high_mass_native` recomputes the
weighted table masses and checks square-root ceilings `0.091510352921874` for
both high bands above 51 and `0.198919845892412` for the high band above 11,
all within `headIdx 501`.
Each checked mass retains the original table-error allowance `energyErrQ`.
The four low-band caps follow from the pointwise decrease in cost.
`tools/gen_improved_head_weight.py` reproduces the mass ceilings; Lean independently
recomputes the interval costs and weighted masses from the stored polynomials and energies.
`UpperTightComparison` uses these actual masses and the tighter source radii.

**Gaussian-amplitude Hardy bound.** `GaussianPair` evaluates a positive Gaussian
pair integral, and `GaussianAmplitude` applies it to the explicit amplitude
left in the `L*L` argument. For `A=(I-R²)⁻¹`, `B=A-jI`, `C=RA`,
`Z=Re B`, `T=Z-Re(C) Z⁻¹ Re(C)` and
`E=(Re(C) Z⁻¹ Re(C)+Im(C) Z⁻¹ Im(C))/2`, the pair correlation satisfies
`|H|² ≤ [16 j² |det(I-R²)|² det Z det(T+jI) det(T+2E+jI)]⁻¹`
under the existing positive-definiteness gates. `SchurMainGaussian` proves
this for measurable disk-valued responses. `HardyGaussianCheck` bounds it
by `(513 + 297cos²θ − 204cos⁴θ)/500` over all four closed halves of
the two circle charts, with outward 128-bit interval arithmetic and a
depth-bounded covering proof. Its exact angular average is `117/100`, using
the circle means `1/2` and `3/8` of `cos²θ` and `cos⁴θ`. The native
acceptance is applied in `HardyGaussian`, using the interval soundness proved by
`HardyGaussianSound`; holomorphy and Parseval then yield
`HardyReal.hardy_GT_gaussian` for the actual rounding.
`UpperTightFinal` uses this budget and deducts the forced linear energy,
certifying the single-channel tail `219549168/10¹⁶`.

**Single-channel endpoint assembly.** `upper_below_tight` combines the port-fact bundles
`PortFacts.j1FactsOf/j2FactsOf/j3FactsOf`, the covered-set twisted remainders
`TightTwist.remainder1/2/3`, the longer-prefix weighted comparison, and the table
accuracy `Final.hclose_final`. Both the mass comparison and finite-head transfer
use the existing `energyErrQ` allowance. `UpperHead` accepts the certified
coefficient-cost family. `HeadHardy` deducts the linear coefficient's forced weighted
energy from the Gaussian-amplitude Hardy budget `117/100` at radius `4149/4000`, giving
the infinite tail `219549168/10¹⁶`. The exact reciprocal `tightValueQ` is
`1.40459939536120707492… < 1.404599395362`.

Each twisted remainder comes from the 21 shard facts and the total fact of its
power (`TwistEllCheck.remainder_of_prodShards`); the tighter total facts bound
the actual sums by `tightPanelRadiusQ`. `TwistEllipseMassSound` supplies the step
from acceptance to the actual vector: every accepted disk, in Y, K or automatic
mode, bounds the squared norm of the actual descended vector on the whole disk
by its upper endpoint (`norm_descendedVector_sq_le_diskM2`), so an accepted
certificate bounds it on its closed Bernstein ellipse by its mass cap
(`norm_descendedVector_sq_le_massCap`). `hclose_final` combines the thirteen
energy facts (`Facts.hclose_of_facts_quad`) with `quadHyp_of_parts`: the tail,
the omitted-pair fact and `EllCheck.quadRemainderHyp`. The new high-mass check
is the only additional native acceptance fact in the coefficient-prefix refinement.

**Energy quadrature remainder.** `UpperQuad/QuadEllipseFacts/All.lean` proves
`EllCheck.quadRemainderHyp`: the squared error between the covered Gaussian
coefficient integrals and the full production Gauss sums is at most
`(1.5·10⁻¹²)²`, with no analytic premise. The proof identifies the entire
conditional-coefficient extension, bounds its finite coefficient mass off the
real axis, combines it with a complex Mehler bound, and applies the Banach-space
Bernstein-ellipse remainder theorem to the actual production panels.
The interval checker certifies the plans in `data/quad-checker/ellipse-plans.txt`;
`tools/gen_quad_ellipse_plans.py --check` verifies their Lean representation, and
`tools/gen_quad_ellipse_facts.py` reproduces the sharded native checks and assembly.
The canonical panel-error sum is below `1.04·10⁻¹²`; reflection gives the full
`1.5·10⁻¹²` bound. The axiom audit is covered by the standard axioms and registered
native facts. This closes the remainder premise in `QuadDecomp.quadHyp_of_parts`.
The twisted source bounds are proved separately (the following paragraphs).

**Twisted panel assembly.** `UpperQuad/TwistPanelRemainder.lean` identifies the
covered twisted discrepancy with the sum of the actual production panel errors
in the Euclidean space of all modes `q < Q`, `c ≤ q + 1`, `d ≤ q`.
`TwistPanels.remainder_of_ellipses` proves `TwistRemainderHyp j ρ` for
`j ∈ {1,2,3}` from a complex extension on each panel, differentiability on the
closed Bernstein ellipse, its boundary norm cap, and the sum of the resulting
Gauss remainder bounds. The real-slice identities are required only at positive
arguments; continuity includes zero. The sum uses every production panel and
the full graded vector, with no reflection factor. Actual extensions, caps and
their numerical sum are inputs to this theorem; the modules below supply them.

`UpperQuad/CanonicalShellBound.lean` bounds one canonical coefficient of total
degree `m` by `2 √θ √(m!) (√8 θ / ‖A‖)^m`, where
`θ = ‖A‖² / Re(A²)` and `Re(A²) > 0`. Its shell norm sum includes the
`m + 1` pairs of that degree. These bounds use only the standard axioms; the
panel assembly inherits the registered phase-cover facts and introduces no
new native fact.

`TwistKVector` applies this shell estimate to the finite twisted factorization.
Outputs of degree at most `D` use the common input triangle through `D + 35*j`.
If their squared matrix-column energies are at most `E * N2(m)`, the squared
output norm is at most
`4 * E * theta * (sum_m (m+1) * sqrt(m! * N2(m)) * z^m)^2`, with
`theta = norm(A)^2 / Re(A^2)` and
`z = sqrt(8) * theta / (sqrt(rate(j)) * norm(A))`.
The canonical domain is `Re(A^2) > 0`. Padding and the Euclidean triangle
inequality introduce no output-mode count; Gaussian scaling introduces no
additional inverse-rate factor. Concrete column and disk-geometry bounds
are substituted in the next module to obtain the certificate's K majorant.

`TwistKEnvelope` supplies that substitution for the actual production columns.
It identifies the finite factorization with the Gaussian-shift coefficients,
uses the checker's rational column parameters, and bounds the actual full
vector by `primaryBoundSq * coarseKSq`. Its geometric inputs are the same
`Slo`, `X`, and `Y` coordinate bounds as for Y, together with
`Re(shift^2) > 0`, an upper bound on `norm(shift)^2 / Re(shift^2)`, and a
positive lower bound on `norm(shift)^2`. No matrix-column premise remains.

`TwistRadialVector` supplies this assembly with the actual descended radial
components. Its complete vector is analytic wherever `vC(s) ≠ 0`, including
zero; the real slice equals `twistIntegrand`. The squared norm is bounded by
the radial finite-Mehler factor times the conditional coefficient energy.
Its Y specialization uses the coupled Gaussian-translation estimate with no
mode-count factor. The signed continuation shift and the disk-geometry shift
differ only by a sign, so their squared norms, imaginary squares and complex
squares agree.

`GaussianShiftEnvelope` and `TwistYEnvelope` turn these pointwise estimates into
the explicit Y expression used by the numerical certificate. For any `r² = s`,
the assumptions `Slo ≤ Re(s)`, `Re(r)² ≤ X`, `Im(r)² ≤ Y`, and
`Im(shift(r))² ≤ B2`, with `t, eta ∈ (0,1)` and `|sigma| = 1`, bound the actual
full vector by the radial Gaussian, degree-`Dout` Mehler factor, degree-`35*j`
phase factor, and Gaussian translation factor. The adapter also converts
a nonnegative squared cap to the norm cap required by the panel theorem.
It has no interval-checker dependency or additional native fact; geometric
certificate soundness and the complete accepted panel sum are supplied by
`TwistEllipseYVectorSound`, `TwistEllipseMassSound` and `TwistEllipseAssembly`.

`TwistEllipseYVectorSound` connects a successful `diskM2` evaluation in Y mode
to the actual descended vector on the complete disk. The returned interval
contains one common squared-norm bound, uniformly for every real panel sign
of absolute value one. Its upper endpoint therefore supplies the norm cap
after a squared-cap comparison. The proof includes the fallback to the full
shift norm when the angle-defect evaluation fails, and the accepted profile
separation excludes zeros throughout the disk. `TwistEllipseSignedGeometry`
also transports the accepted lower-norm and angle witnesses to the actual
signed continuation shift for K consumers. The K and automatic modes are
covered by `norm_descendedVector_sq_le_diskM2` in `TwistEllipseMassSound`;
certificate acceptance and the panel sum are the shard and total facts.

`TwistProfileSign` proves constancy of the production profile sign on any
zero-free closed real interval. `TwistRadialPanels` fixes the sign at each
panel's left endpoint and proves `remainder_of_descended_ellipses` from only
profile nonvanishing throughout each closed ellipse, boundary norm caps for
the actual vector, and the summed numerical remainder bound. Analyticity,
square-root descent and real-slice identification are supplied by the proof.
The profile and norm certificates and their accepted total are supplied by
`TwistCertificateRemainder` (below) and `TwistEllipseMassSound`.

`TwistEllipseAssembly` connects finite shard checks to every production panel.
All shards use the same power and certificate array; explicit index coverage
and the checked array length rule out missing panels and default entries.
The executable rational total equals the real sum of the corresponding error
caps. Overlapping shards do not duplicate terms in this sum. This supplies
the finite coverage and budget interface. The acceptance facts are the native
checks of `UpperQuad/TwistEllipseFacts/`; the analytic interpretation of an
accepted certificate is `norm_descendedVector_sq_le_massCap`.

`TwistEllipsePanelGeometry` transports accepted plan geometry and strict
profile separation on every covering disk to the whole closed Bernstein
ellipse. It proves that the profile is nonzero there and that the checker
sign agrees with the physical sign throughout the real panel, including
the left endpoint used by `TwistRadialPanels`. This geometry layer uses only
the standard axioms; it assumes neither an untwisted integrand bound nor
a numerical norm cap.

`TwistCertificateRemainder` extracts closed-ellipse nonvanishing and the
exact real Gauss error from certificate acceptance. With complete acceptance
and the checked total, its `remainder_of_certificates_of_mass_bounds` proves
the actual `TwistRemainderHyp`; its only additional analytic input is that
the certificate's squared mass cap bounds the actual descended vector on
the ellipse boundary. Geometry, analyticity, real-slice identification,
Gauss exactness and summation are supplied internally.

**Twisted ellipse certificates.** `UpperQuad/TwistEllipseFacts/Checks.lean` imports
the source-indexed interval checks for all three production powers. Their exact
plans and caps are in `data/twist-ellipse/plans.json`; the generators
`gen_twist_ellipse_plans.py` and `gen_twist_ellipse_facts.py` reproduce the arrays,
range checks and native-fact registration manifest. The cap totals are checked
by kernel evaluation against the tight panel radii (`UpperTightPanelTotals`); the
native total checks against the earlier relaxed radii were removed on 15 November
2026 (#405).
The arithmetic soundness modules prove the phase, translation, column, K, primary
Mehler, disk-geometry, selection, maximum, and capped-error interfaces. The finite
checks use registered native facts. `TwistEllipseMassSound` connects these
expressions to the actual twisted vector, and
`TwistEllCheck.remainder_of_prodShards` assembles the analytic remainders
`TightTwist.remainder1/2/3`.

**Finite twisted-source bundles.**
`UpperQuad/PortFacts/Bundles.lean` packages the production table flags,
final checks, range facts and phase-degree theorem into `j1FactsOf`,
`j2FactsOf` and `j3FactsOf`. It uses the `FactsOf` interface from the
twisted evaluator's soundness bridge; it introduces no additional finite
computation or analytic hypothesis. All consumed fact modules are registered
in the generated root and in `data/axioms/native.txt`. `upper_below_tight`
uses these bundles through `TightTwist.six_of_facts`, together with the tighter
twisted remainders, the longer-prefix comparison and the energy-table accuracy
`Final.hclose_final`.

**Original Gauss polynomial exactness.** `Q0GaussExactness.lean` derives
degree-below-`2n` quadrature from Legendre recurrence, orthogonality and a
polynomial Bezout identity. `Q0GaussQPoly.lean` interprets LeanCert's rational
coefficient lists as real polynomials and proves the checker soundness.
`Q0GaussPolynomialOrder01` through `Order64` discharge these finite identities,
squared norms and leading coefficients with kernel reduction. The aggregate
`Q0GaussPolynomialCertificates.exactness` uses the actual recurrence and weight
formula for every production order. Its input is an injective family
of Legendre roots. `QuadRem.source_rule_exact`
(`UpperQuad/QuadRemainderRule.lean`) supplies the selected roots of every
production panel, and the analytic integration remainder is
`gauss_remainder_ellipse`. The reproducible witnesses and generator are in
`data/gauss-polynomial-certificates/` and `tools/gen_gauss_polynomial_certificates.py`.
The entire family is in the main root and is checked with the `Grothe` build.

**Shared proof foundations.** `LowerAnalytic/ComplexGaussianCore.lean` contains
`gaussC`, its planar presentation, rotation invariance and radial-moment reduction.
The phase and complex Hermite calculations import it without the lower row
certificates. The lower fibre theory uses the same declarations and normalization.
`LowerAnalytic/ComplexGaussianSymmetry.lean` has the invariance of `gaussC` under
z ↦ z̄ and z ↦ −z (`gaussC_map_conj`, `gaussC_map_neg`, `integral_gaussC_comp`). It
imports `ComplexGaussianCore` only: `F0ConditionalReality` and the lower fibre
symmetries (`CapSymmetry`) both use it, and no upper-bound module imports the witness
or the fibre chain of the lower bound.

`Lower/Stein.lean` derives `spec_of_inputs` from `gspec_of_vr` with zero shifts.
`Lower/Law.lean` proves `node_fn_of_cut` for any integrable cut with nonnegative
expectation; `TB.of_cut` applies it to Stein, spectral, general spectral and joint
nodes. The joint node retains its kurtosis-range premise.
`Lower/Gram.lean` proves `reserved_gram_budget` once for arbitrary signed reserves;
`gram_budget_of_scalars` and `gram_joint_of_scalars` specialize it through
`zero_reserve` and `joint_reserve_value`. Existing theorem statements and
certificate definitions are preserved.

`LowerAnalytic/CircularFourth.lean` proves the scale-invariant bound
`E |q|⁴ ≤ 44 (E |q|²)²` for circular third chaos, using the existing complex
contraction identities and Hilbert–Schmidt inequalities. It also proves the
sharp fluctuation range `x ≤ √42`. The bound 44 is attained by the normalized
one-coordinate Wick cubic; the analytic extremizer calculation and an
all-even-moment extension are in [CIRCULAR_FOURTH_MOMENT.md](CIRCULAR_FOURTH_MOMENT.md).
Those additional sharpness and higher-moment claims are not Lean theorems.
The law cells of the rows of the lower bound cover the larger range `x ≤ 31/4`.

`LowerAnalytic/JointSixthCore.lean` contains the common Hilbert–Schmidt,
cubic-trace, completed-square and scalar Young estimates, followed by the
circular J2/J3 inequalities. `JointContractions.lean` retains the general
tensor-to-Gram identities and specializes this core for `Circular.joint_sixth`.
`JointSixth.lean`, archived under `miscellaneous/research/Grothe/LowerAnalytic/`
and not built, uses the same identities and core for its invariant adapters
and capped/η refinements. No positivity of the symmetrized contraction
operator is assumed.

Weaker upper-bound variants, their data and their historical verification records
are preserved in [the committed archive](../miscellaneous/other-bounds/README.md).
They are outside the active build and current axiom policy.

**Source-node error ledger.** `Q0NodeMassLedger` holds only the shared scalar
inputs; `Q0NodeMassLedgerSharp` is the single norm-dependent ledger, at `26/25`.
`Q0NodeMassLedgerSharp.real_error_lt_cap`
transfers the exact rational ledger to a real error bound below `48/10^13`,
given the raw-error estimate, smoothing estimate and smoothing-vector norm.
The separate `sqrt_mass_lt_norm` lemma converts squared mass below `107/100`
to norm below `26/25`. These are arithmetic implications; they do not supply
the actual Gaussian input estimates or a floating-point operation model.
The definitions document the operation-path budget `749 = 2*32+10+675`,
the node/pair/raw-coordinate square-root allowances `147`, `179`, `2310`,
the primary block/family norm caps `18`, `197`, the reflection factor `10/7`,
and the separately allocated integration, omission and smoothing tolerances.
Their source-model and analytic justification must be supplied by the consumers;
these comments do not turn the historical numerical computation into a Lean input.
The energy-table accuracy of the final theorem (`Final.hclose_final`) does not
go through this ledger: it uses `selected_energy_close_of_raw_error` with the
error radius certified by the quadrature checker (`UpperQuad/Bridge.lean`).

**Archived source-table route.** The data-free error lemmas of a second route to
the energy table, through a saved table of binary64 conditional Hermite values
(`Q0ConditionalFiniteLaplace`, `Q0ConditionalSoftening`,
`Q0ConditionalLinearError`, `Q0ConditionalRetainedError`, `Q0FiniteVectorError`,
`Q0GaussSourcePanelMass`), are archived; the final theorem certifies the table
with the quadrature checker (`Final.hclose_final`).

**Exact Gaussian phase-moment interfaces.**
`DampedMoments` proves mixed complex Gaussian moments at every positive radial
scale. `InvariantMoments` integrates each monomial in the simultaneous-rotation
invariants by a finite balanced complex-monomial expansion. `PhaseMomentCheck`
proves exact integer convolution and common-denominator clearing for any finite
rational term list, including coefficients with odd denominators.
For `φ = D exp(-ε(U+V)) S`, it constructs `A=L*S`, where `L` is the full
common denominator. `integral_phaseOfTerms_pow` in `PhaseMomentEval` integrates
`A^(2j)` at rate `1+2jε` and divides by `L^(2j)`; finite Horner integration
supplies the integrability of every summand.
`ConcretePhaseMoments` specializes this identity to the actual `phaseTerms`
and `phaseEpsQ`: `integral_phiT_pow_even` equates every even moment with
`phaseMomentValue j`, without a phase-cover or external moment premise.
`TaylorMoments` and `ComparisonPieces` identify the even phase moments with
the total energy of every positive Taylor source.

`PhaseMoment2`, `PhaseMoment4`, and `PhaseMoment6` contain independent
single-threaded native equalities with `phaseMoment2Q`, `phaseMoment4Q`, and
`phaseMoment6Q`. The integral consequences are `integral_phiT_sq`,
`integral_phiT_pow_four`, and `integral_phiT_pow_six`. Their approximate values
are `2.56852947444587e-6`, `5.71439509703932e-10`, and `1.68238736430120e-11`.
`PhaseMomentNorms` combines these with the exact pointwise Taylor-source
identity to give `norm_hpow_one_sq`, `norm_hpow_two_sq`, and
`norm_hpow_three_sq`. These are total energies; band-tail estimates also
need captured Hermite energy and approximation errors. The three whole-error
estimates of `upper_below_tight` use these norms (`UpperTightSix.lean`).
The targets in `data/phase-moments/targets.json` are expected exact values,
not integral assumptions: each numerical leaf computes from the production
phase. `python3 tools/gen_phase_moment_data.py --check` verifies source binding
and reproduces the generated targets without expanding polynomial powers.
Total energies alone give neither `ComparisonInputs` nor `energy_close`.

`RestrictedWick` integrates balanced complex monomials on
`{(z₁,z₂) : 50 < ‖z₁‖²}`; `RestrictedPhaseMoments` applies the same finite
Horner evaluator to the production phase. `PhaseRadialTail` checks its exact
rational factor `B = cutPhasePowerMoment phaseTerms phaseEpsQ 50 1` directly,
with `0 ≤ B < 148^31 · (5/10^15)^2`. The separate kernel proof in
`PhaseTailExponential` bounds `exp(-155)` by `148⁻³¹`, using the Taylor
polynomial through degree twelve at 5. Thus
`integral_phiT_sq_radial_tail_lt` proves the actual restricted squared
integral is below `(5/10^15)^2`, without a numerical tail premise. The finite
factor check uses the registered `native_decide` trust extension; it does
not use an external radial-coefficient table. This radial tail gives no
estimate for the finite comparison-band coefficients.

`TaylorRadialTail` uses `‖hpow j‖² = φ^(2j) ≤ φ²` for `j > 0` to transfer
this bound to all positive Taylor sources. `norm_source_fifty_lt` states
the resulting norm below `5/10^15` for the event indicator in the original
`Lp ℂ 2 mu2` space. Thus the existing smoothing and band-projection
contractions can apply without changing measures. This step uses the proved
phase cover and introduces no further numerical check.

The concrete smoothing calculation is covered in all retained grades by
`FixedChaosSymmetricPower.actualEntry_gradedMode` and
`FixedChaosGradedAction.actualGradeMatrix_eq`: each grade uses the two-sided
matrix action `S_(q+1) C_q S_qᵀ`. `ProductionSmoothingRounding` constructs
rational entries by an integer square-root floor with a `10⁻²²` grid and
proves their error against the actual fixed smoothing parameters.
`ProductionSmoothingApprox.production_smoothing_error` then gives
`‖smoothOp A − savedOutput A‖ ≤ 4·10⁻¹⁵ ‖A‖` for `N ≤ 251`, using
orthogonality to aggregate all grades before taking the norm. These theorems
use only `propext`, `Classical.choice` and `Quot.sound`. They do not supply
the actual retained F₀ coefficient enclosures or the stored energy-table
comparison; in the final theorem both come from the quadrature checker
(`hclose_of_blocks` in `UpperQuad/Bridge.lean`), which applies
`selected_energy_close_of_raw_error` and, through it, this smoothing bound.
`CanonicalReconstructionNorm.full_head_reconstruction_norm_le` is a standalone
combinatorial bound for an abstract canonical/reflected index split: its
injective partner map and multipliers at most one give squared-norm growth
at most two, hence a norm factor below `10/7`. `ConditionalReconstruction`
applies that split to the actual conditional Gaussian coefficients and their
exact reflected completion; it contains no numerical reconstruction.

`FixedChaosSmoothing.baseGradedCoefficient_iterated` in
`ProductionF0Conditional` identifies every actual tensor coefficient with
its conditional Gaussian integral. `ProductionF0Head`
projects the actual base phase to total degree at most 501. Its complete
coefficient-error identity sums all 251 grades, and its selected smoothing
identity uses this degree projection, avoiding a commutation claim for the
nonrectangular energy head. `ProductionRetainedSource` inserts the actual
91-grade correction once before rational smoothing. `ProductionRetainedEnergy`
derives the smoothing-input norm from the raw-source error.
`FixedChaosSmoothing.baseGradedCoefficient_eq_radial` in `ProductionF0Radial`
then removes the first Gaussian angle from each bounded tensor coefficient.
It uses charge cancellation in the complete tensor integrand, including zero
profiles, and expresses the result with the actual conditional coefficient
at `sqrt(s)` and Gaussian density `exp(-s)` exactly once.
`norm_productionF0Head_sub_sq_radial` substitutes these integrals into the full
251-grade error identity. It assumes neither numerical quadrature nor equality
to a stored primary matrix. The final theorem starts from the unreduced
identity `norm_productionF0Head_sub_sq` (`UpperQuad/Bridge.lean`); its
quadrature error is the hypothesis `hQuad`, which `quadHyp_of_parts` proves.

`selected_energy_close_of_raw_error` (`ProductionRetainedEnergy`) propagates
arbitrary raw, projected and same-output table allowances to the selected
energy error; the final theorem uses it. The comparison for an arbitrary
piece-error family, `localized_comparison_with_errors` (`ComparisonTolerance`),
is archived.

`CapturedTail.norm_projOn_residual_sq_le_of_captured_family` subtracts
`Σ_i max(0, lower_i − error_i)²` from the total source energy. Its hypotheses
are pairwise disjoint captured mode sets, disjointness from the tail, vanishing
of the approximant on the tail, captured-norm lower bounds and per-band error
caps. The finite-family Bessel proof iterates orthogonal Pythagoras; it needs
neither complete coverage nor a mean-zero hypothesis. The companion
`norm_projOn_residual_le_of_captured_family` converts a squared-energy budget
to the norm cap required by the comparison decomposition.
`TaylorErrorEnergy.norm_hpow_sub_sq` instead expresses the whole approximation
error as the exact phase moment minus twice the real inner product plus the
approximant's squared norm. `norm_band_hpow_sq_le_of_inner` bounds any band
on which the approximant vanishes using those three scalar inputs. These
results formalize both tail routes; the Gaussian inner-product enclosures and
the approximant coefficient data are their hypotheses. The final theorem bounds
its three whole errors in the second way (`whole_of_inner` in
`UpperQuad/TwistSix.lean`), with the inner products bounded from the port facts.

`WholeCenterEnergies` identifies the complete squared norms of the original
centers with the exact sum of six first-center energies, the exact sum of four
second-center energies, and the existing total third-center energy. These exact
values remain in the three `norm_hpow_sub_sq` identities for the raw sources
`(i * phi)^j F0`; the coefficients and factorial scaling are unchanged.
The norm caps `0.00161`, `0.000024` and `0.0000036` are used only to specialize
`CompactTaylorQuadrature`'s complete `5e-15` source reserve. The resulting inner
product cutoff costs are `8.05e-18`, `1.2e-19` and `1.8e-20`, including softening
and both truncations once. The final theorem does not use this compact-interior
form: it takes the exact center energies and norm caps from this module and
bounds the inner products and the three low-band errors from the port facts and
the twisted quadrature remainders (`re_inner_ge_of_facts`, `band_le_of_facts`
in `UpperQuad/TwistBridge.lean`). The first
and second center adapters retain their respective registered native energy
facts; the whole-error and cutoff adapters also retain the existing phi-cover
facts. No new native fact is introduced.

**Finite Taylor centers.** The original three approximant arrays and frozen
correction are preserved under `data/taylor-approximants/inputs/`, with a
hash manifest. `HermiteFinite` gives the exact coefficients, total norm and
projected norms of any finite rational expansion in the normalized tensor
Hermite basis. `GradedHermite` proves injectivity of the charge-one coordinates
`((q+1-c,q-d),(c,d))` and reindexes energies as bounded triple sums, with direct
coefficient lookup. `PackedDyadic` strictly decodes signed mantissa/exponent
records and proves the common-denominator sum-of-squares identity.
`TaylorBandData` retains all 6,552 third-approximant coefficients through degree
51 as exact binary64 dyadics in its authoritative typed integer arrays.
`thirdCenter_source_check` proves the exact source size;
`thirdCenter_energy_check` checks the total and four band energies.
`norm_thirdCenter_sq` and `norm_thirdCenterBand_sq` identify these targets with
actual Hermite norms. Rational lower and upper enclosures use kernel arithmetic;
charge-one support and the vanishing degree tail follow from generic indexing
lemmas. The source is unscaled: division by six occurs in the comparison source,
not in this center. All three centers have finite band-norm certificates. These are
not Gaussian error enclosures, and stored error arrays are not treated as proofs.
`GradedHermiteFn` constructs continuous finite sums of the normalized Hermite
polynomials, proves their `MemLp` and `toLp` identities, and proves pointwise
charge-one rotation. The concrete adapter `thirdCenterFn` therefore satisfies
`ChargeFn` without a representative-identification assumption.

`ThirdCapturedTail.norm_piece17_thirdCenter_le` derives comparison piece 17's
existing cap from four explicit unscaled Gaussian band errors bounded by
`[47629771,353989726,4052571868,150654124859]/10^18`. The scalar inequalities
`thirdCapturedErrorQ_le_public` and `third_captured_tail_budget` use kernel
arithmetic; the latter retains the sum of four squared captured norm lower
bounds after subtracting their individual errors. These slightly tighter
premises are needed because six times the rounded public finite-band caps
loses too much precision in this subtraction. The original error allowances
are recorded in `data/localized-comparison/inputs/taylor_comparison_result.json`;
their Gaussian validity is not proved in Lean. This theorem removes a separate tail
hypothesis once these four finite-band error hypotheses are supplied; they are
among the fourteen hypotheses of `ConcreteTaylorUpper` (below).

**Exact Taylor rounding.** `TaylorFirstData`, `TaylorSecondData` and
`TaylorFrozenData` preserve the first center through degree 181, the second
center through degree 91 and the frozen correction through degree 181. The
original frozen input's coefficients above degree 181 are exactly zero; the
source generator checks them before retaining the shorter vector. The third
center reuses `TaylorBandData` without duplicating its coefficients.
`PackedDyadicChunks` parses the first and second centers strictly and supplies a
proved integer fold. The frozen witness uses named typed integer grades at scale
2^206, subdivided into at most 64 integers per array. `TaylorFrozenCoefficients`
defines the production lookups independently of Gaussian and Hermite proofs.
`FrozenSource.Sizes` proves the complete 259,532-entry size from all 91 grades;
`FrozenSourceBinding` proves the two actual degree-one coefficient values.
`GradedHermiteLinear` proves coefficient linearity and zero
extension between graded supports. `TaylorCenters` defines the actual centers
and their rounding difference. At common scale 2^206, the numerator is
`6*A1 + 3*A2 + A3 - 6*V`, with explicit grade restrictions for the shorter
centers and third integers rescaled by 2^101. `TaylorRounding` identifies its
integer sum of squares with the actual squared Hermite norm. Its arithmetic
leaf recomputes that sum from the source lookups; a separate leaf verifies
successful decoding of the packed centers; the frozen size uses the standard
source-size proof. Kernel arithmetic then proves the 10^-18
rounding cap. Input hashes, exact arithmetic targets and byte-for-byte
reproduction are recorded under `data/taylor-approximants/`. This certificate
does not use any Gaussian integration-error premise.

**Third-center energy without a native leaf.**
`ThirdCenterKernelEnergy.energy_check` identifies the complete stored third
center's integer grade sums with its exact total and projected rational energies
at denominator `2^210`. The public `thirdCenter_energy_check` uses this theorem.
The authoritative `thirdCenterInts` is the concatenation of named integer grade
arrays regenerated by `gen_taylor_third_integers.py` from the same pinned NPZ
input, with every dyadic coefficient and its order preserved. The source-size
theorem `thirdCenter_source_check` replaces the unused old text-decoding
statement. No equality with the old monolithic parser is assumed. Exact array
binding and all bounded part/grade sums are checked in Lean. Strict transitive
audits permit only `propext`, `Classical.choice`, and `Quot.sound` for these
results. This finite
energy identity does not establish a Gaussian comparison-band error or the
frozen-response table discrepancy.

**The concrete comparison interface.** `TaylorCenterBandData` stores integer
energies and rational norm enclosures for the first center's six bands and the
second center's four bands. Their two arithmetic leaves evaluate the actual
integer coefficient lookups through `PackedDyadic.gradedIntegerSum`.
`GradedHermiteIntegerEnergy` identifies these sums with projected squared norms
before any numerical enclosure is applied. All norm enclosures have width
10^-30, and the charge and omitted-degree supports are proved generically.

`TaylorTailData` is generated from the original error allowances and the
tracked `tail-recipe.json`. The unscaled caps are rounded upward at precisions
10^-21, 10^-19 and 10^-18 for powers one, two and three. Kernel-checked scalar
inequalities prove that they fit the public finite comparison caps and that
the captured-energy subtraction fits all three existing tail caps. The public
finite caps by themselves lose too much precision for these subtractions.
`tail-caps.json` records the exact source hashes and positive squared slacks;
it does not establish the Gaussian error inequalities.

`TaylorCenterFunctions` supplies canonical polynomial functions, `ChargeFn`
and `toLp` equalities for the first and second centers and frozen correction,
and identifies each Taylor comparison source with the corresponding scaled
`Lp` residual. It proves comparison piece zero's rounding cap.
`FirstSecondCapturedTail` derives pieces seven and twelve from their finite
Gaussian error families; `ThirdCapturedTail` supplies piece seventeen.
`comparisonInputs_taylorCenters` (`ConcreteTaylorUpper`) assembles all eighteen
pieces into `ComparisonInputs` for the actual rounding and
`Xfun frozenCorrectionFn` from only `hfirst` (six finite errors), `hsecond`
(four) and `hthird` (four), with no separate rounding, tail, representative or
charge-one premise. These fourteen Gaussian inequalities are not proved with
these caps. The conditional theorem built on them, `fresh_upper_concrete_taylor`
(a bound below `1.404598149141`), is archived (`GroupedRounder`);
`upper_below_tight` uses the three-band regrouping below instead.

`ThreeBandRegrouping` gives the regrouping that the final theorem uses: retain the lowest
bands `(0,51]`, `(0,51]`, `(0,11]`, and group each remaining spectral support
orthogonally. Its linear comparison uses rounding, three low-band errors and
three high-band errors; its quadratic term uses the rounding error and the
three whole Taylor errors, without adding the low errors again. The whole
raw-error hypotheses have radii `R₁`, `2 R₂`, `6 R₃`, where `R` is the existing
`comparisonGroupRadiusQ`. `UpperTightSix` proves the three whole-error bounds
with the smaller radii `tightScaledRQ` from the port facts and the twisted
quadrature remainders (`TightTwist.hwholeFirst_of_facts`,
`hwholeSecond_of_facts`, `hwholeThird_of_facts`).
`ThreeBandComparison` binds the regrouping to the actual frozen source and
the current energy table; `ThreeBandBudget` (`Grothe/Upper/`) holds its seven
bands. `upper_bound_tight` applies the regrouping with the tighter certified
radii (`localized_comparison_tight_three_band`, `UpperTightComparison`) and
passes the result to `TightEndpoint.endpoint_of_comparison` (`UpperTightFinal`),
which adds the head, the table error (`Final.hclose_final`,
`Grothe/UpperClose.lean`) and the Hardy tail.
The single-channel theorem `upper_below_tight` gives `K_G^ℂ < 1.404599395362`.

**Complex Gaussian shift.** `HermiteTranslation`, `HermiteTranslationAlgebra`
and `HermiteTranslationBessel` prove the finite Hermite translation bound
`exp(|delta|*sqrt(2D))`. Both formal variables move by the same displacement;
the first inner-product slot conjugates that displacement. There is no
mode-count factor in the resulting squared coefficient bound.
For `j > 0`, `0 < tau < 1`, a finite set of modes with total degree at most
`D`, and complex parameters `r` and `A = a + I*b`,
`GaussianShift.sum_coefficient_sq_le` proves

```
sum_i |J_i(r,A)|^2 <= exp(2*b^2 + 2*|b|*sqrt(2D))
  * tau^(-35*j) * (1-tau)^(-2)
  * exp(4*j*phaseEpsQ/(1-tau) * ((Im r)^2+b^2)).
```

The coefficient is identified exactly with a fixed-phase Gaussian integral.
Its integrand has an integrable bound `C*exp(normSq(w)/2)` uniformly over
bounded complex parameter sets. `HolomorphicIntegral` proves integration of
locally dominated analytic families using measurable difference quotients
and Cauchy's estimate. `GaussianShiftAnalytic` therefore proves analytic
dependence on each parameter and on bounded holomorphic substitutions on a
closed disk. The real production identity, for `s >= 0` and `vprof s != 0`,
is `twistCoef j s i = profileSign(s) * J_i(sqrt(s),
profileSign(s)*profileShift(s))`; the signed shift is essential on negative
profile intervals. This proves the analytic Y estimate. Profile domains,
contour suprema and the Gauss quadrature remainder are certified by the
twisted ellipse certificates described above. The
phase bounds inherit exactly the six registered phase-cover facts; the
translation and generic holomorphic integration results use standard axioms.

`TwistRadialExt.radial` uses the actual signed complex profile ratio
`r/(kappa*vC(r^2))`, the swapped primary Hermite indices
`(q-d,q+1-c)`, the fixed panel sign, and only the outside damping `exp(-r^2)`.
`TwistRadialReal` proves exact agreement with `twistIntegrand` at `r=sqrt(s)`
for every natural power, `s >= 0`, nonzero profile, and valid graded indices.
There is no additional `2r`, `pi`, or factorial factor in this `ds` integrand.
`GaussianShiftParity` and `TwistRadialParity` prove that the full component
is globally even in `r`, including its totalized values at profile zeros.
`EvenSquareDescentLocal` extends the square-descent tool to any point of a
globally even function. `TwistRadialDescent.analyticAt_descended` proves that
the resulting function of `s` is analytic wherever `vC(s) != 0`, for `j > 0`
and valid graded indices. This includes the origin if its profile is nonzero
and imposes no principal-square-root branch-cut condition. The real-slice
identity explicitly fixes the panel sign. Profile nonvanishing and contour
bounds on the required ellipses are certified separately
(`TwistEllipsePanelGeometry`, `TwistEllipseMassSound`).

**Finite twisted factorization.** `TwistFactorization.Jext` uses the explicit
normalized Hermite coefficients of
`nrm(c,d) * rescale(sqrt(lambda))(H(d,c) * Q_r^j)`, where
`lambda = 1 + j*phaseEpsQ`. Its finite support is `g+h <= c+d+35*j`.
Extraction at `(h,g)` pairs with `Uext(g,h,sqrt(lambda)*A)`; the matrix
coefficient already contains the single factor
`lambda^(-1) * exp(-j*phaseEpsQ*r^2)`. The polynomial `Q_r` includes `I`,
so no additional sign or factorial appears. The coefficient family and
finite extension are entire, and `Jext_real` identifies the literal integral
at real `r` and nonzero real signed `A`. `Jext_eq_gaussianShift` uses entire
uniqueness to identify this factorization with the preceding Gaussian
coefficient for every complex pair when `j > 0`.
`TwistMatrixBessel` identifies each matrix column with an actual Hermite
inner product. `sum_norm_matrixCoefficient_sq_le_production` bounds any
finite column by the production phase envelope times the normalized Hermite
dilation bound. Bessel adds no further inverse-rate factor. Profile
domains, contour suprema and the twisted quadrature remainders are supplied
by the twisted ellipse certificates (`TwistEllCheck.remainder_of_prodShards`).

**Analytic phase reduction.** `Grothe/Haagerup/PhaseLaplace.lean` proves
`ph(z) = (sqrt(pi):C)^(-1) * integral_{t>0} t^(-1/2) exp(-‖z‖²t) z dt`
from the Gamma integral. Keeping `z` inside the integral makes the kernel zero
at `z=0`. The module proves integrability for every complex argument and an
absolute integral bounded by `sqrt(pi)`, with equality for nonzero arguments.
It also proves the denominator-free affine completion of squares for
`alpha*‖w‖²+t*‖z+a*w‖²`. These standard analytic identities have no native numerical leaf.
`PhaseLaplaceFubini` proves joint measurability and absolute product
integrability for any measurable integrable weight and measurable phase
argument over an arbitrary SFinite measure. It then moves the positive Laplace
parameter outside the source integral.

`TaylorInnerLaplace.inner_hpow_eq_phaseLaplace` retains the actual `F0` argument
and `phiT`. Under `PhiBound` and a square-integrable charge-one source it
identifies the Taylor inner product with the absolutely integrable Laplace
mixture. Boundedness of the phase power and Holder's inequality establish
source integrability; no numerical integration premise is used.

`ShiftedDampedMoments` expands a translated mixed complex monomial and proves
the finite Wick formula at any positive radial rate. Its Gaussian mass is
`1/rate`, including for rates below one.
`LinearTiltedMoments.integral_linear_tilt` translates an arbitrary measurable
complex test function under the real linear tilt `2*Re(a*z)`. The translation
is `conj(a)/rate`, and the scalar factor is `exp(normSq a/rate)`.
`integral_mixed_moment` and `integral_finite_mixed_polynomial` then evaluate
mixed monomials and finite polynomials through `shiftedDampedMoment`; in
particular the zeroth moment is `exp(normSq a/rate)/rate`.
`integrable_mixed_moment` and `integrable_finite_mixed_polynomial` establish
integrability for every positive rate and fixed complex source using a
half-rate exponential majorant.

**Archived Hilbert–Schmidt route.** Exact Gaussian identities and source-norm
bounds for the Taylor multiplier operators are archived: independent-source
moments (`IndependentSource…`), coherent transforms and Fock coefficients
(`ActualTaylorCoherent`, `GaussianFockBessel`, `ScaledActualCoherentL2`,
`GateFockCoefficients`), coefficient jets (`…Jets`,
`PairJetPolynomialOperations`), bipartite kernels and their Gram evaluation
(`Bipartite…`, `QuadraticPolynomial…`), matrix tails and rectangle operators
(`Actual…`), the rational source-norm evaluator (`ActualSource…`,
`RationalChargeOrthogonality`, `RationalCovariance…`) and the Gaussian
parameter gates and masses (`OriginalHS…`). `upper_below_tight` bounds the
Taylor errors through the twisted quadrature (`UpperQuad/`).

`RadialLaguerre` identifies the actual production polynomial
`ev (r : ℂ) (H (m+k) m)` with
`(-1)^m * m! * r^k * L_m^k(r²)`, using the finite associated-Laguerre
coefficient formula. For `s ≥ 0`, the normalized `hfun (m+k,m) (√s)` is
`(-1)^m * (√s)^k * √(m!/(m+k)!) * L_m^k(s)`; conjugation leaves this real
radial value unchanged. Natural powers retain the zero-radius and zero-charge
cases.

`HermiteFallingFactorial` derives the finite production Hermite
expansion from commuting creation operators.

`AffineGaussianSquare` centers the
conditional density without dividing by the radial profile. For arbitrary
complex `z`, real `a`, positive `alpha,t`, put `beta=alpha+a^2*t` and
`mu=-(a*t/beta)*z`. `ConditionalGaussianPhase` proves the exact conditional
monomial formula: the scalar factor
`t^(-1/2)*exp(-alpha*t*normSq(z)/beta)` multiplies
`z*M(p,q;beta,mu) + a*M(p+1,q;beta,mu)`. The finite moment `M` includes its
`1/beta` mass. The measure conversion, translation, integrability and factorial
scaling are all explicit. Auxiliary and radial tails for the complete
sources and numerical integration accuracy are not part of these identities;
the final theorem treats them in the twisted quadrature (`UpperQuad/`).

`ConditionalGaussianPolynomial` evaluates any existing
`CPoly = MvPolynomial (Fin 2) ℂ` by its finite support and proves its
integrability against the affine phase kernel. The exact conditional integral
is the coefficient-weighted finite Wick sum. This uses the same polynomial
representation as the complex Hermite basis; it introduces no new coefficient
encoding or numerical integration assumption.

`GradedHermitePhaseSlice` constructs the actual center polynomial in the
second coordinate by fixing the first coordinate in each normalized tensor
Hermite mode. The invariant substitutions for `‖w‖²`, `Re(conj(z)*w)` and
`Im(conj(z)*w)` retain the complete `phaseTerms` list. Its source polynomial is
`conjP(centerSlice) * (i*D*S)^j`. The exact pointwise identity factors out
`exp(-j*epsilon*normSq(z))` and leaves the conditional damping
`exp(-(alpha-1)*normSq(w))`, where `alpha=1+j*epsilon`.
`TaylorConditionalGaussian` proves integrability and the exact finite Wick
evaluation of this production conditional integral for every positive auxiliary
parameter. The source is `(i*phiT)^j`; its Taylor factorial belongs to the later
linear combination and is not inserted into this identity.
`PhaseLaplaceBounded` gives a uniform kernel bound at each positive auxiliary
parameter, so multiplication preserves every integrable source.
`TaylorInnerFubini` uses it to justify product Fubini for the actual source at
every such parameter. `inner_gradedHermite_hpow_eq_wick` in
`TaylorWickReduction` combines these results with the canonical graded-center
representative and the absolute Laplace identity: the production inner product
is the iterated auxiliary and first-coordinate Gaussian integral of
`taylorConditionalWick`. No conditional-integration accuracy premise is used.

The unit-mode rational Wick compiler and its moment tables (`RationalUnit…`,
`RationalWick…`, `UnitSquared…`, `SharedWickMomentRecurrence`,
`SharedMomentTable`, `ShiftedMomentFactor`, `ReciprocalRate`) are archived with
the mesh route below.

`PositiveMomentTheta` defines the smooth angular moments
`M_h(x) = ∫₀^(π/2) sin(θ)^(2h) cos(θ)^2 exp(-x sin(θ)^2) dθ`, proves
they are positive, and bounds each consecutive ratio in `(0,1]`.
`PositiveMomentRecurrence` proves the three-term identity
`(h+1/2) M_h - (h+2+x) M_(h+1) + x M_(h+2) = 0` by integration by
parts. For `x ≥ 0`, `PositiveMomentRatio` expresses the consecutive ratio
as the `PositiveRatio.next` update, whose monotone finite backward interval
propagation is proved for a terminal interval in `[0,1]`.
`PositiveMomentBackward` identifies each angular ratio with a finite iteration
from its terminal ratio and encloses it using terminal bounds zero and one.
`OriginalMomentIntegrable` proves interval integrability of the original
integrand `t^(h-1/2) * sqrt(1-t) * exp(-x*t)` on `[0,1]`, including `h=0`.
`OriginalMomentSubstitutionLemmas` proves that this integrand is continuous
on the positive half-line and that `sin²` has the expected derivative and
maps the angular interval into `[0,1]`, with its interior mapped into `(0,1)`.
`OriginalMomentPullback` proves that the original integrand composed with
`sin²`, multiplied by its Jacobian, equals twice the angular density on the
open angular interval. `OriginalMomentSubstitution` handles the endpoints by
almost-everywhere equality and proves `J_h(x) = (4/π) * M_h(x)` for every
order and real parameter. `OriginalMomentRatios` transfers positivity and the
three-term recurrence to `J_h`; for `x ≥ 0`, its ratio satisfies the exact
continued-fraction update and finite backward enclosure from terminal `[0,1]`.

`OriginalMomentTaylorSeed` derives the actual integral estimate
`|J_0(x) - Σ_(n≤N) (-x)^n J_n(0)/n!| ≤ x^(N+1) J_(N+1)(0)/(N+1)!`
for every `x ≥ 0`. LeanCert's exponential Taylor remainder on `[-x,0]`
uses derivative bound one; integrating the pointwise remainder gives the next
original moment. The zero-parameter normalization and recurrence determine
each retained coefficient.

**Common scalar.** `ConditionalSeedNormalization`
defines the positive actual seed `S(A) = (sqrt(π)/2) * A * J_0(A²)` for `A > 0`
and the common normalization `U_i(A) = C_i(A) / S(A)`. It gives exact
reconstruction `C_i = S * U_i`, `U_(0,0) = 1`, the normalized zero-row and charge
recurrences, and the finite Bessel budget `Σ_i ‖U_i(A)‖² ≤ 1 / S(A)²`.

`MobiusGeometry`, `MobiusPowerAlgebra`, and `MobiusSeedPullback` establish
the substitution `v = t/(1+t)` and its pointwise integrand identity.
`MobiusFiniteSubstitution` proves the corresponding finite integral equality;
`MobiusEndpoint`, `MobiusImproperIntegrable`, and `MobiusImproperLimit` justify
the passage to the half-line. `MobiusSeedImproper` proves integrability and
`∫_(0,∞) (t/(1+t))^h * t^(-1/2) * exp(-x*t/(1+t))/(1+t)^2 dt = (π/2) J_h(x)`
for every order and real parameter. `OneSidedSeedFubini` combines the exact
affine Gaussian inner integral with absolute Fubini, and
`OneSidedSeedIntegral` evaluates the resulting half-line integral.
`OneSidedHermiteSeed.phase_hermite_zero_row` discharges the shifted-Wick
premise and supplies the normalized Gaussian coefficient
`(sqrt(π)/2) * A * (-A)^d * J_d(A²) / sqrt(d!)` for every real `A`.
`F0ConditionalSeed` identifies it with the actual canonical evaluator and
uses `F0ConditionalEvaluator.coefficient_eq_signed` for the production
coefficient at `s ≥ 0` with `vprof(s) ≠ 0`. The sign exponent is `d` and
vanishes at `d=0`; there is no second Hermite normalization.
`F0ConditionalSeedRecurrence` derives
`I_(0,d+1)(A) = (-A) * ratio d (A²) / sqrt(d+1) * I_(0,d)(A)`
for the actual canonical Gaussian integral, with positivity of `J_d`
discharged internally. It also proves the signed production recurrence and
that each canonical zero-row coefficient has zero imaginary part.
`F0ConditionalCoefficientBounds` represents the actual canonical coefficient
as an inner product against the bounded phase in `L²(gaussC)` and applies
Cauchy--Schwarz with the normalized Hermite basis to bound its norm by one.
The actual raising sum is bounded by `sqrt(c+1)+sqrt(d+1)`, which is strictly
below `35` when `c ≤ 266` and `d ≤ 265`. This does not establish a parameter
derivative formula or a single midpoint error allowance.
`F0ConditionalReality` obtains conjugation covariance of each normalized Hermite
function from its rational polynomial representation. The existing
`gaussC_map_conj` then proves that every actual canonical coefficient has zero
imaginary part. Direct conjugation symmetry of the actual production phase
proves reality of its coefficient for every real source parameter, including
profile zeros. The complex distance to any real
stored center is exactly the absolute real-part error; no numerical enclosure
is assumed in these identities.

The zero-profile saved-center bounds, the phase Taylor bounds (among them the
optimal global coefficient `2`, `phase_taylor_bound_iff`, and the cubic
refinement `q² + 2q³`) and the phase-stability estimate (`ZeroProfile…`,
`Haagerup/PhaseTaylor…`, `Haagerup/PhaseStability`) are archived.

`ShiftedMomentRecurrence` proves
`M(p+1,q)=mu*M(p,q)+(q/beta)*M(p,q-1)` by finite binomial algebra, including
`q=0` and zero mean. Before norms are taken, the affine bracket becomes
`(alpha*z/beta)*M(p,q)+(a*q/beta)*M(p,q-1)`.
The radial Gamma moments (`RadialDampedMoments`) and the base-moment tail bounds
built on this recurrence (`ConditionalGaussianBase`, `ConditionalGaussianTail`,
`RealGaussianKernelTail`) are archived.

`F0ConditionalNode.coefficient_eq_integral` and its Bessel bound refer to the
actual conditional phase. `F0ConditionalEvaluator.coefficient_eq_signed`
identifies its historical parameter as
`A = sqrt(s)/(sqrt(1+aQ²)*abs(vprof s))`, with the explicit assumptions
`s ≥ 0` and `vprof s ≠ 0`. `ConditionalNodeIndices.image_rows` and
`card_modes` select exactly 31,877 distinct degree-501 pairs from the larger
35,777-pair storage; a prefix substitution is not justified.
`ConditionalMomentReflection.integral_phase_H_reflection` proves the actual
unnormalized Gaussian identity by finite Stein/Ward recurrences and absolute
Fubini. `ConditionalCoefficientReflection.production_reflected_coefficient`
then proves the production lookup factor `sqrt((d+1)/c)` for `d+1<c` and a
nonzero profile. The normalized canonical identity holds at every real shift.
These results have standard-three-axiom audits. They supply no numerical
coefficient enclosure, root-gap estimate or floating reflection error.

`ConditionalMomentCharge` derives the charge identity for the actual phase
integrals from the finite shifted-moment identities and absolute Fubini.
`ConditionalCoefficientCharge` supplies its normalized form, writing `C_cd(A)`
for `canonicalCoefficient A (c,d)`:
`A*(sqrt(c+1)*C_(c+1,d) - sqrt(d+1)*C_(c,d+1)) = (d+1-c)*C_cd`.
The difference `d+1-c` is scalar subtraction, not truncated natural subtraction.
For positive `A`, rearranging this identity reconstructs each row from the
preceding row and the existing zero-row seeds. It requires no hypergeometric
diagonal recurrence. These exact identities do not certify the numerical seed,
parameter transport, stored-row errors or final energy-table agreement.

`F0ConditionalEvaluator.coefficient_zero_of_profile_zero` retains the constant
phase `ph(sqrt(s))` when `vprof s = 0` and proves that all modes other than
`(0,0)` vanish, including at `s = 0`. Thus the actual reflection identity
extends to every nonnegative radius without a nonzero-profile premise.
`ConditionalReconstruction.reconstruct_actual` identifies the exact reflected
completion with the actual coefficient vector. Its `canonical_top_eq_modes`
identifies the canonical half of the top rectangle with the existing 31,877
mathematical modes, preserving explicit lookup in the larger storage.
`weighted_top_norm_le_of_canonical_error` consumes a coupled canonical error
bound at explicit nonnegative nodes and weights and bounds the full exact
completion error by `10/7` times that bound. The canonical error and the
physical node/weight certificates are its hypotheses. Primary contraction,
floating reconstruction and table agreement are not part of this module.

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

Archived: the extension of every `IsGrothendieckBound` inequality to unit
vectors of any complex inner-product space (`TransferHilbert`); the attained
optima and the fixed-dimension test `isGrothendieckBound_iff_fixed_dim`
(`ScalarOpt`, `VectorOpt`); a quadratic dual with overlapping error budgets
(`QuadraticDual`); a Gram bound that keeps the imaginary correlation
(`PolarizedGram`); and a rational support-defect correction with its quartic
Newton contraction (`LowerAnalytic/JointDefect`, `LowerAnalytic/QuarticNewton`).

**Single-channel upper bound.** The theorem `upper_below_tight` uses the
assembly described above. The sharper value that the rounding was
designed for is conditional and archived: `fresh_upper_rounder`
(`UpperChaos/GroupedRounder`, with `UpperChaos/GroupedComparison` and
`Upper/GroupedBridge`) proves
`IsGrothendieckBound (500000000000000000/355973699960428191)`, which is below
`1.404598148840`, from fourteen finite-band Gaussian error estimates that are
not proved and the table accuracy.

`ProductionFiniteLaplace` defines `finiteLaplacePhase η T z` by integrating the
actual softened phase kernel over `[0,T]`, including the `1/sqrt π` factor.
It proves the exact omitted-tail identity and the uniform error
`‖softPhase η z - finiteLaplacePhase η T z‖ ≤ exp(-η²T)` for all complex `z`.
The finite Fubini identity `integral_mul_finiteLaplacePhase` connects this
response to the outer integral used by coefficient quadrature.

For the actual Taylor sources, `norm_finiteLaplaceError_le` gives the full
Gaussian L² error `(10/3)η + exp(-η²T)`. With `η=10⁻¹⁵` and `T=(2⁵³)²`,
`norm_finiteLaplaceError_cutoff_lt` proves this is below `5·10⁻¹⁵`, uniformly
in the Taylor order. `norm_projOn_smooth_finiteLaplaceError_cutoff_lt` transfers
the bound through actual smoothing and every Hermite-band projection.
`sqrt_finiteLaplaceCutoff` and `forty_le_scaled_finiteLaplaceCutoff` give the
rational regular-auxiliary endpoint `2⁵³` and preserve the exponential reserve.
`compactTaylorQuadratureValue_eq_dyadic` identifies the full production
rectangle as `[0,2⁵³] × [0,80]` with no irrational terminal cell.
`LeanCertAuxiliaryCutoff.exp_neg_forty_le` supplies the numerical tail bound
using the pinned checked dyadic evaluator at precision `-100`, Taylor depth
`20`, and `decide +kernel`; no native fact is introduced. This cutoff is a
proved finite-domain reduction, not a quadrature certificate.

`ProductionCompactLaplace` includes the radial restriction `‖u.1‖² ≤ 80`.
The existing exact Gaussian tail theorem and `exp(-80)=exp(-40)²` give radial
L² error at most `10⁻¹⁷`, reusing the same LeanCert certificate.
`norm_compactLaplaceError_cutoff_lt` proves that softening, radial truncation
and auxiliary truncation together cost less than `5·10⁻¹⁵` for every Taylor
order, with no new numerical premise. Its smoothed band-projection corollary
retains the original Gaussian measure and all omitted modes.

**Archived mesh route.** A second, incomplete way of certifying the band
estimates of the Taylor sources, by adaptive rectangle quadrature of a retained
source, is archived: the retained source and its mesh (`ProfileAdaptiveSource`,
`ProfileInterval…`, `ProductionRectangleAssembly`, `Reciprocal…`,
`ProductionMeshEnclosure`, `SmallProfile…`), the phase models
(`ProductionPhase…`, `PhasePolynomialStability`, `FixedZPhaseRemainder`), the
band transfers (`ChargeBandEnclosure`, `ConcreteRetainedBands`), the adaptive
rectangles (`Adaptive…`, `Rectangle…`) and the base-pair kernels
(`Q0BasePair…`, `Q0GaussianReality`).

`PhiProductionIdentity` contains the existing `phaseEps_eq` and `phiT_sq`
identities with their public names and statements unchanged. `PhiProductionDefs`
contains the unchanged `Sphase` and `phiT` definitions and continuity of the
phase polynomial, independently of structural head-table proofs. The identity
imports these definitions and the generic Gram-expression soundness module,
then audits both identities against the standard three
axioms, independently of the global phase-cover computation. The existing
`PhiBound` proof imports this identity and retains its numerical cover.
The shared `phase_gram_sq_sum` identity gives both the imaginary-square
substitution in `phiT_sq` and the derived `phase_gram_re_sq_le` constraint.
The latter is used by `PhiBound` and local leaf soundness, so the Gram
calculation is no longer repeated in those consumers.

`Q0LegendreInteger` evaluates the standard Legendre recurrence by scaled
integer arithmetic. The `Q0LegendreRule01` through `Q0LegendreRule64`
modules check the original rational brackets, endpoint signs and ordering;
the intermediate value theorem and degree exhaustion prove one unique root
in each bracket. The committed original rule data and
`tools/q0_quadrature/gen_legendre_rules.py --check` reproduce these sources.
This proves the roots; the weights and the exactness of the complete rules are
the Gauss certificates of the next paragraphs
(`Q0GaussPolynomialCertificates.exactness`).

`Q0GaussExactness.actual_recurrence_gauss_exactness` proves the shared
quadrature algebra for the same `polyPair` and `realPair` recurrence.
The proof integrates monomials and linear polynomial quotients, identifies
the root quotients with Mathlib's Lagrange basis, derives the original
weight formula from exact derivative and Bezout identities, and uses
polynomial division and orthogonality to prove exactness below twice the
rule order. The finite polynomial identities and actual selected roots
are explicit inputs of this theorem. The identities are supplied by the 64
order modules below, the selected roots and the affine transport to the
production panels by `QuadRem.source_rule_exact`
(`UpperQuad/QuadRemainderRule.lean`), and the analytic remainder by the
Bernstein-ellipse theorem; Python witnesses do
not discharge these inputs.

`Q0GaussQPoly` interprets LeanCert's executable `QPoly` operations in the
real polynomial argument. It proves soundness of the finite identity
checks, transports the coefficient recurrence to the actual `polyPair`
source, and closes the order-one pilot.
The exact input in `data/gauss-polynomial-certificates/certificate.json`
and `tools/gen_gauss_polynomial_certificates.py` reproduce the 64 order
modules and their aggregate consumer. Every finite arithmetic obligation
uses `decide +kernel`, including the squared norms and exact leading
coefficients. This complete finite family is imported by
the generated root `Grothe.lean` and checked with the `Grothe` build. The
selected node/weight bindings and the interval transport are
`QuadRem.source_rule_exact`; the analytic remainder is a separate theorem.

`UpperQuad.CentralDerivative`, an exact derivative stencil for real polynomials
of degree at most 35 from eighteen sample pairs (`abs_derivative_le`), is
archived.

`UpperQuad.PolynomialGaussianGrowth.norm_damped_eval_sq_le` gives a generic
complex growth bound for a polynomial times a Gaussian. If `P` has total degree
at most `N` and `‖P(z, conjugate z)‖ ≤ exp(ε |z|²)` for every complex `z`, then,
for `ε > 0`, `0 < τ < 1`, and arbitrary complex `r,x`,

```
‖P(r+i*x,r−i*x) exp(−ε(r²+x²))‖²
  ≤ τ^(−N) (1−τ)^(−2) exp(4ε((Im r)²+(Im x)²)/(1−τ)).
```

`PolynomialHermiteDegree` retains the degree cutoff in the finite Hermite
expansion; `PolynomialHermiteNorm` identifies the squared coefficient sum with
the actual Gaussian L² norm. `FinitePolynomialMehler` applies the formal complex
Mehler estimate. `PolynomialRescale` changes the rate to `ε(1+τ)/τ`, and
`GaussianGrowth` and `GaussianMehlerBound` prove the norm estimate and exact
cancellation of real-coordinate growth. These results use only standard axioms.
`PhasePolynomialComplex` instantiates this estimate for the actual production
phase. With real `y` fixed, the polynomial has degree at most 35; its coefficients
include `exp(−ε*y²)`. The existing checked term list supplies invariant degree
at most 17, and the global real phase bound supplies the Gaussian growth premise.
`phaseComplex_real` identifies the continuation with `phiT` on every real slice,
and `analyticAt_phaseComplex` proves joint complex analyticity. For every positive
integer `j`, `norm_phaseComplex_pow_sq_le` uses degree `35*j` and damping `j*ε`
directly, retaining one `(1−τ)^(−2)` factor. Its numerical dependencies are only
the existing registered phase-cover facts.

`PolynomialDilationNorm` integrates finite Mehler to bound dilation on Gaussian
L². For `L ≥ 1`, `0 < τ < 1`, and `(2*L−1)*τ < 1`, it proves

```
‖P(√L ·)‖² ≤ ‖P‖² * τ^(−N) / ((1−τ)*(1−(2*L−1)*τ)).
```

The normalized Hermite-column corollary has polynomial norm one and degree
`p+q`. These dilation estimates use only standard axioms. The contour
enclosures and the twisted quadrature remainder are supplied by the twisted
ellipse certificates.

`PhasePolynomialParity` proves that reversing `y`, `r`, and `x` together
preserves `phaseComplex`, and that reversing both formal Hermite arguments
multiplies the result by `(-1)^(p+q)`. These source identities use only standard
axioms and supply the parity factors for the origin argument.
`HermiteRadialVector.sum_radial_sq_le_cutoff` controls the full graded vector
with `q<Q`, `c≤q+1`, and `d≤q`. The map to primary and conditional Hermite
indices is injective into the product of the degree triangles `p+q≤2*Q−1`.
The squared vector norm is therefore at most the primary finite-Mehler bound
times the conditional coefficient square sum, with no mode-count factor.
This conversion includes the damping `exp(−r²)` and requires only `0<t<1`.
`TwistRadialVector` applies it to the analytic continuation of the conditional
coefficients; the resulting contour bounds are certified by the twisted
ellipse certificates.

`UpperQuad.EvenSquareDescent.analyticOnNhd_descend` handles the square-root
coordinate at the origin abstractly. For a complex Banach-valued function `F`
analytic on `‖r‖ < R`, with `R > 0` and `F(−r)=F(r)` on that ball, it proves
that `s ↦ F(Complex.sqrt s)` is analytic on `‖s‖ < R²`. The inverse-function
theorem for squaring supplies analyticity away from zero; continuity and the
removable-singularity theorem supply zero. `descend_sq` recovers `F(r)` at
`s=r²`, and uniform norm bounds transport unchanged on open or closed balls.
All these results use standard axioms. `TwistRadialParity`,
`TwistRadialAnalytic` and `TwistRadialDescent` supply the parity and
analyticity in `r` of the twisted integrand and apply this tool to it; the
contour bounds and the quadrature assembly are the twisted ellipse certificates.

`F0ConditionalNode` defines the actual radial slice of `F0` and its normalized
Hermite coefficients, proving Bessel's bound before aggregation over modes.
`ConditionalNodeIndices` identifies the contraction's selected pair set and
its injective charge-row lookup; the selection is not a prefix of the larger
stored table. `F0ConditionalEvaluator.coefficient_eq_signed` proves the actual
profile sign exponent `c+d` and positive-scale shift. Its production-index
theorems connect both canonical and reflected indices to that selected set.
`ConditionalMomentReflection.integral_phase_H_reflection` proves reflection
for the actual unnormalized phase integrals through the Gaussian moment
recurrences and the existing Laplace integral identity.
`F0ConditionalEvaluator.canonicalCoefficient_reflection` includes the Hermite
normalizers, and `production_reflected_coefficient` identifies the exact
production lookup: for `d + 1 < c`, the coefficient at `(c,d)` equals the
coefficient at `(d+1,c-1)` times `sqrt((d+1)/c)`. The latter theorem assumes
`s ≥ 0` and `vprof s ≠ 0`; the factor is at most one. Inline axiom guards
permit only the standard Lean axioms. These identities contain no estimate of
a numerical reflection error, of the quadrature mass or of a remainder.

The sample-ledger alternatives (`DirectSampleUpper`, `JointSampleLedger`: the
same conditional rational bound from a finite-head estimate of the actual
kernel) and the table interface `Grothe.fresh_upper` (`Upper/GroupedBridge`)
are archived with the conditional route.

The actual rounding is G_T, the smoothing of T = F₀·P₃(φ), P₃(x) = 1 + ix − x²/2 − ix³/6.
It is defined in `Grothe/UpperChaos/Rounder.lean`. Lean proves |φ| < 1 (`phi_abs_lt_one`, from
`phiT_sq_le : φ² ≤ 99/100`; checker `GrotheKernel/PhiCheck.lean`, soundness `Grothe/UpperChaos/PhiCover.lean`, 512 cubes and
119,077 checked leaves in `PhiCoverData.lean`, generated by `tools/gen_phi_abs_cover.py` from
`data/phi-abs-cover/trees.json`), which is `phiBound`, and
|P₃(φ)|² = 1 − φ⁴(3 − φ²)/36 ≤ 1 and disk-valuedness of T and G_T. Here E is the actual
energy table of G_T and EX that of X. The kernel is H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ with the preprocessors
p(t) = t·P(t²) (`pList`, degree 41) and −τ(t) = t·Q(t²) (`qList`, degree 15), both of Wiener norm ≤ 1 and Q(0) = 0, so
that both are realised by tensor powers (`Grothe/Upper/Realise.lean`); they do not enter the
energies, and are chosen to make the kernel nearly linear. The slope is c = 7119483103461/10¹³.

`KernelStability.lean` proves `Σ |E_H−E_G| ≤ (‖H‖₂+‖G‖₂)‖H−G‖₂` and transports
this through any same feasible P,Q to all physical coefficients of charge-one
responses. `HardyHolo` supplies holomorphy and Hardy assembly for separate
responses along the fixed covariance path `Rt`. A polynomial radial repair of
the disk map with its sixth-moment kernel ceiling (`RadialRepair`,
`RadialCeiling`) is archived.

* Proved from scratch: the complex Gaussian Hermite basis on ℂ², completeness, Parseval,
  the L² Mehler formula, charge selection, energy summability and the energies-to-kernel
  identity (`Grothe/UpperChaos/`); measurability, charge one and disk-valuedness of G_T;
  the transfer inequality via tensor powers and its residual form
  K ≤ 1/(c − ‖H − c·t‖); the ℓ¹ contraction and linearity of the kernel composition; that the
  head through degree 501 depends only on energies with n + 3m ≤ 501; the evaluation of the
  head of the stored table of the truncation (21,168 exact dyadic entries) by a sound
  fixed-point interval checker (`GrotheKernel/`; the cap checker and shared basics have their own
  precompiled library `GrotheCapsKernel/`; soundness in
  `Grothe/Upper/IntervalSound.lean`); the tail bound by Cauchy–Schwarz from a weighted
  square-sum bound; the assembly of the budgets; and the endpoint arithmetic.
* `ComparisonInputs` (`LocalizedComparison.lean`) records an exact
  shared-coordinate error decomposition, total-chaos supports and component L²
  norm bounds. From the inherited Gaussian enclosures at cutoffs 181, 91, 51,
  these are the smoothed mixed-Taylor errors and frozen-vector rounding error;
  `comparisonInputs_taylorCenters` (`ConcreteTaylorUpper`) supplies them from
  the fixed Taylor centers and their fourteen finite-band Gaussian error bounds,
  which are not proved. The grouped comparison
  `Σ_(p in headIdx 501) w(p) |E(p)-EX(p)| ≤ 851922301/10¹⁵` that follows from
  them (`localized_comparison_grouped`) is archived. It uses
  `2 Σ A_r e_r + (Σ_g √(Σ_{r∈I_g} e_r²))²`, with `A_r²` enclosing
  `Σ w(p)² EX(p)` on its band. The four groups consist of the rounding remainder
  and the three Taylor orders; bands within each group are disjoint.
  The generic grouping inequality (`quadratic_sum_le_grouped`,
  `Grothe/Upper/GroupedComparison.lean`) and its rational budget
  (`groupedCompareQ`, `Grothe/Upper/ComparisonGroups.lean`) are kernel checked.
  `HeadWeight.lean` proves `w(p)` bounds the retained coefficient mass of each
  preprocessed block; all costs lie in `[0,1]`. Its interval extraction reuses
  the existing sound power and convolution routines. No Gaussian input is added.
  The finite Hermite blocks are identified with the
  actual Gaussian energies in `EnergyBlock.lean`. The native `comparison_check`
  proves all 18 band radii from the stored table and `energyErrQ`; the sharper
  group budget is checked separately. Neither a near-linear kernel nor the final head
  residual is assumed by this interface.
* The table accuracy `energy_close` (the stored energies are within
  6847009/(5·10¹⁷) of EX on `headIdx 501` in ℓ¹) is a hypothesis of the general
  interface; for the actual truncation it is **proved** (`Final.hclose_final`).
  The Hardy input (the
  weighted square-sum bound 117/100 at radius 4149/4000 for the kernel of G_T) is
  **proved**: `HardyReal.hardy_GT_gaussian`. Validity, summability, parity, and the phase cover
  for the actual rounding are derived. `HardyHolo.lean` proves
  `hardy_of_pair_inputs_budget` from positive kernel decay on a disc of radius greater
  than 4149/4000, identification of the real odd series with the continued
  kernel, and a bound on its circle mean. Holomorphy, continuation,
  Parseval, the decay region and the circle mean (`HardyGaussian.hmean`) are proved, and
  `HardyGaussian.hardy_of_real` derives the `hardy` statement with budget 117/100 for every
  measurable disk-valued pair from summable real odd coefficients and their
  Gaussian-law identification. `HardyReal.hreal_GT` supplies that
  identification for G_T: unfolding the smoothing (`mehler_smoothed`), the
  Mehler pair `(MX + NZ, MY + NZ')` has the law of `(U, RU + SW)`
  (`HardyRealLaw.law_swap`: characteristic functions, `M² + N² = I`, and the
  covariance identity `HardyRealCov.cov_eq`), and its density on ℝ⁸ is
  `kHol R` at the real cross covariance `R = Rt t`
  (`HardyRealDensity.integral_pair_eq_kHol`: the explicit Cholesky factor of
  `I − R²`, the substitution `y = Rx + Sw`, and Fubini); `I − R² ≻ 0` since
  `‖M‖ ≤ 1` and `|p|, |q| ≤ t < 1` (`k11_kdet_pos`).
* **Residual ledger.** The residual of the proved bound `upper_below_tight` is
  `tightResidualQ = 1.54224796922272379448078027965090997314453125·10⁻⁶`: the
  longer-prefix comparison `tightThreeBandCompareQ`
  (`1.49212635840472379448078027965090997314453125·10⁻⁶`, 96.75%), the head
  `28153/10¹²` (1.83%), the Hardy tail `219549168/10¹⁶` (1.42%) and the table error
  `6847009/(5·10¹⁷)` (about 0.00089%).
  These percentages describe allowances, not fractions of the proof left
  unformalized. Full scope, source bindings and reproduction commands are in
  `data/localized-comparison/PROOF.md`; `miscellaneous/other-bounds/tree/docs/localized-comparison.tex` gives
  the mathematical argument.
* The certified weighted head bound forces `h₀ ≥ slopeQ − tightHeadResidualQ`.
  `HeadHardy` uses `hardy_budget_after_linear` to deduct its weighted square
  from the Gaussian-amplitude budget `117/100`; exact kernel arithmetic proves
  tail `219549168/10¹⁶`.
  This deduction is used by `upper_below_tight`.
* **Independent replay.** The source computations were replayed on a different machine: the
  nodal table and the Taylor centre arrays were regenerated bit for bit, and the kernel head,
  contour tail, comparison and endpoint pass on the regenerated data (energy table reproduced
  to 1.2·10⁻¹⁶ in ℓ¹ under a different linear-algebra library). This is reproduction, not
  formal verification.

**Lower bound.** `Grothe.Statement.sparse_stein_endpoint` applies `sparseSteinEndpoint_le_of_tailNodeCaps` to the witness node caps and the six-channel existence proof. It gives `200000000000000/142651138122623 ≤ K`. Rounding strictly downward gives the lower half of `main_bounds`. [Certificate](../Grothe/Lower/Cert/SparseEnvelope.lean) · [Matrix transfer](../Grothe/LowerAnalytic/SparseSteinBound.lean).

The two central rows use the fourth excess and residual scale of the same normalized circular cubic. Lean extracts eleven plain polynomials from the original rows and checks their majorants on the full nonnegative radius axis. The cut-dilation identity moves them to four target scales. The signed offset and the cubic moment bounds give fourteen additional ordinates across the shape intervals. [Dilation identity](../Grothe/Lower/CutDilation.lean) · [Moment bound for a transported node](../Grothe/Lower/SparseNodePricing.lean) · [Witnesses](../Grothe/LowerAnalytic/SparseWitnessData.lean).

For each of the nineteen common shape intervals the proof selects two expectation chords that bracket the actual scale. It checks nine mixture prices on their closed scale intersections, including shared endpoints. The outward grid bounds handle interior quadratic extrema. `SparseStein.actual_deductions` combines the expectation bounds and the Gaussian gate for both physical rows. Rows 06 and 07 supply a second gate deduction from quadratic majorants. The 38 amplitude cells then give $\hat B=70635503391/10^{11}$. [Central prices](../Grothe/LowerAnalytic/SparseSteinPrices.lean) · [Actual row inequalities](../Grothe/LowerAnalytic/SparseSteinRows.lean) · [Outer rows](../Grothe/LowerAnalytic/SparseOuterRows.lean) · [Amplitude envelope](../Grothe/Lower/SparseSteinEnvelope.lean).

`witnessCap_of_circular_profile` transports that cap through the phase reduction, the mass row and `circularReductionHyp_of_nodeCaps`. `transferInputs_of_witnessCap` and `transfer_lower` convert the resulting dimension-uniform witness into a lower bound for finite matrices. The node caps enter through `tailNodeCaps_cert`. The joint-price proof uses Lean’s standard axioms. The scalar-row part inherits the existing native checks on rows 01–07 and 10–14. [Node-cap proof](CAPS.md).

**Antiholomorphic Stein calculus and `93/100` cubic radius.** `Grothe/LowerAnalytic/AntiStein.lean` proves the two
radial antiholomorphic Stein identities (`antiStein_I`, `antiStein_II`), the Cauchy–Schwarz cone inequality
(`radAB_sq_le_radC1_mul_radC2`) and the exact contraction second-moment identities for circular cubics in $H_{2,1}$.
`Grothe/LowerAnalytic/RadiusRowCheck.lean`, `RadiusCheck.lean`, `RadiusRows/Row00.lean`–`Row22.lean` and
`SharpRadius.lean` certify $\mathbb{E}|q| \le (93/100)\|q\|_2$ (`first_moment_lt_93`, `norm_pres_le_93`) by 23
kernel-checked integer-Bernstein rows generated by `tools/gen_radius_data.py` from `data/cubic-radius/cert_N_final/`.
`Grothe/LowerAnalytic/AntiSteinRowCheck.lean`, `AntiSteinChunk.lean`, `AntiSteinRowSound.lean` and `NodeListParse.lean`
check and prove the soundness (`checkAntiCells_sound`) of the two tightened rows `0.835` and `0.845` generated by
`tools/gen_antistein_rows.py` from `data/antistein-rows/`, with zero new `native_decide` axioms.

**Uniform six-column ceiling.** `Grothe/UpperSixExact/ScoreCeiling.lean` checks a single rational dual vector against all six fixed coefficient lists and their established tail caps. `paid_six_score_le` covers every convex vector of real weights and every independent assignment of enclosed coefficients. `exists_paid_six_values` verifies that the family of assignments is nonempty. Cube feasibility, interval support and weak duality are kernel proofs. One separate native comparison, `Haagerup.SixChannelExact.sixDual_check`, evaluates the six interval heads. The main upper theorem has independent imports. [Score comparison](../Grothe/UpperSixExact/ScoreCeiling.lean).

The complete registry of native facts is `data/axioms/native.txt`; the default report
is `scratch/Axioms.lean`, with its required declarations in
`data/axioms/required.txt`. CI checks the report on every pushed branch, and on
the merged tree before a pull request lands.

The repository-wide axiom audit permits `propext`, `Classical.choice`, `Quot.sound`,
and the `native_decide` facts pinned in
`data/axioms/native.txt` (read by `scripts/check_axioms.py`). That file is the
complete list; the facts fall into the following groups. The six-channel upper proof
uses the `Haagerup.Data` cell-witness and overlap-table facts (`Haagerup.Data.tcell_rows_ok`,
`tcell_sos_ok`, `tig_mu_ok`, `tig_sos_ok`) and, from its certificate `Grothe/UpperSixExact/`, the weighted head with
the linear floors and the contour checks of the first channel (`Haagerup.SixChannelExact.head_and_floors_ok`,
`region_ok`, `mean_ok`). The disk and circle checks of the other five channels (`Haagerup.reg1_ok`–`reg5_ok`,
`Haagerup.mean1_ok`–`mean5_ok`) and the rational tail comparisons reduce directly in the kernel. The upper-six
allowlist is `data/axioms/modes/upper-six.native.txt`. The seven-channel root theorem adds the native
comparison `Haagerup.AngularSelector.NumericWitness.budgets_ok` for the signed mixed head and the full selector allowance.
The single-channel upper proof uses `Grothe.head_check` (the upper head),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.Upper.improved_high_mass_native` (the two complete high-band masses
for the 51-coefficient costs, including the inherited table-error allowance),
`Grothe.UpperChaos.phase_moment2_check`, `phase_moment4_check`, and
`phase_moment6_check` (the exact second, fourth and sixth moments of the production phase),
`Grothe.UpperChaos.phase_cutoff_factor_check` (the exact factor for its squared radial tail),
`Grothe.UpperChaos.HardyGaussianCheck.charts_checked` (the Gaussian circle cap of the Hardy tail),
`Grothe.UpperChaos.hardy_region_check` (its decay region),
`Grothe.UpperChaos.phi_cover_check_0`–`5`
(the phase cover |φ| < 1), the stored-expansion checks
(`taylor_centers_decode_check`, `rounding_energy_check`,
`firstCenter_band_energy_check`, `secondCenter_band_energy_check`), the
energy-table facts `UpperQuad.Facts.gradeBlockNN`, `evenCheck` and
`omittedCheck`, the ellipse shards `UpperQuad.EllCheck.shardNN` of the energy
quadrature, the port facts `UpperQuad.PortFacts.jN…` of the three Taylor powers
and the twisted ellipse facts `UpperQuad.TwistEllCheck.Facts.jN…`.
The lower-bound native facts are the row checks `Grothe.Lower.certRowSS`
and the node-cap facts in `Grothe.LowerAnalytic`: the range facts `rowKKAnchorRangeJJ`
of the whole-fibre nodes, the coverage facts `pieceCover_KKx<i>` and the piece facts
`pieceRange_KKx<i>_<J>` of the localised nodes, and the chord facts `chordsOKRowKK`.
Every native check is single-threaded (no `Task.spawn`). All
other accepted finite computations (the envelope `certEnvelope`, the polynomial norms, the moment covers, the positivity of
the row blocks `psdRowKK`) use proof-producing kernel reduction, including the canonical
continuation-block checks.
The report is `lake env lean scratch/Axioms.lean`, checked in CI;
the node caps are in the same report. The generic response, cubic-ceiling
and quintic-transfer lemmas are archived under `miscellaneous/research/Grothe/`
and are not part of the build. No `sorry`,
no warnings.

The actual tensor reconstruction in `ProductionF0Reconstruction` uses the
real-radius symmetry of the normalized primary Hermite factor and the proved
conditional reflection under the radial integral. Thus
`norm_productionF0Head_sub_le_canonical` bounds the complete Gaussian source
error by `10/7 * canonicalTensorErrorNorm a0 + tensorCompletionDefectNorm a0`.
The second term measures the actual rational output against exact mathematical
completion; its bound must certify floating operations. Neither a rational
coefficient family nor archived floating logs are required to satisfy an exact
irrational reflection identity. The module is imported by
`UpperQuad/QuadRemainderRadial.lean`.

`tensorCompletionDefectNorm_sq` reduces that actual rational-output defect
exactly to the sum of squared real reflection errors over the reflected halves
of all 251 grades. The canonical half contributes zero. A numerical producer
must bound this coupled sum for the same coefficient family; no exact floating
reflection or per-entry radius is inferred.

The structural packed-dyadic parser proofs (`PackedDyadicStructural`,
`PackedDyadicLegacyDelimiter`, `LegacySingleCharacterSplit`,
`PackedDyadicSourceAssembly`: a strict character-list reader equal to
`String.toNat?` and `String.toInt?`, and the composition of chunk parses) are
archived; the final theorems use the public `PackedDyadic` parser.
