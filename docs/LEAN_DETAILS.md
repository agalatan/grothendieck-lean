# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).

The proved interval is `1.401700037873 < K_G^ℂ < 1.404599395362` (`main_bounds`,
`Grothe/MainResult.lean`). The lower endpoint is a theorem without hypotheses
(`lower_target`), and so is the upper endpoint (`upper_below_tight`,
`Grothe/UpperTightFinal.lean`). The upper proof imports the shared Gaussian
phase identity and Laplace modules under `Grothe/Haagerup/`.

**Reading this inventory.** Most paragraphs describe one module or one result.
Where a paragraph says that a result takes an estimate as a hypothesis, or that
it gives no numerical bound, this describes that result; it is not an open
input of the main theorems, which have no hypotheses. Every module under
`Grothe/` is in the import closure of `Grothe/MainResult.lean`. A module called
*archived* below is kept outside the libraries, in `abandonware/`
(`abandonware/README.md`) unless the text names `miscellaneous/`; it is not
built or checked. The value `1.404598149141` is the
target the rounding was designed for. The conditional theorem towards it,
`fresh_upper_rounder` (K_G^ℂ ≤ 500000000000000000/355973699960428191 <
1.404598148840, from fourteen finite-band Gaussian estimates that are not
proved), is archived; the theorem without hypotheses exhibits a bound below
`1.404599395362`.

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
certifying tail `219549168/10¹⁶` and the new `main_bounds` endpoint.

**Upper endpoint assembly.** `upper_below_tight` combines the port-fact bundles
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
The production cover and Gaussian endpoint are unchanged.

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
`Grothe/UpperClose.lean`) and the Hardy tail. The public `UpperTarget`
threshold remains `1.4046`; `main_bounds` uses `upper_below_tight` and the
stricter threshold `1.404599395362`.

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

**Upper bound.** The proved upper bound is `upper_below_tight` ("Upper endpoint
assembly" at the top of this file). The sharper value that the rounding was
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

**Finite-mixture certificate extension (PR #381).**
`Lower/BoxLookup.lean` decodes a selected cell or batch witness after indexing,
instead of parsing every unselected entry. `indexedBoxBound_eq` and
`indexedCompRefData_eq` prove exact equality with the original computations,
including malformed-input behavior and all source and range checks. This
optimization introduces no native fact or new mathematical assumption.
`Lower/FiniteMix.lean` defines finite binary expressions of certified components.
`MixTree.resolve_sound` preserves the common law and retained square;
`MixBox.bound_sound` applies the existing slab bound after mixing;
`mixCover_sound` reuses the existing complete partition checker; and
`mixCover_bound` yields the scalar bound from an accepted complete cover. The law bank
under `data/lower-refinement/` is exported by `gen_lower_refinement_lean.py` and
checked by `LowerRefinementCheck.certRefinementBatches` through the existing
`checkBatch` soundness theorem. That finite computation is registered in the
native axiom inventory. The complete 14,060-box replacement cover is exported by
`gen_lower_refinement_cover.py`. The four `certRefinedBoxes` facts and
`certRefinedPartition` now check this stronger cover in place of the old one.
`lower_bound_of_completed_refinement` connects its cap `0.7134194` to the
witness transfer; `lower_target` and `main_bounds` discharge the same node caps.
The new strict endpoint `1.401700037873` improves the preceding endpoint by
`0.000002920572`. All original source tables remain pinned and unchanged.
Targeted reproduction commands are in `data/lower-refinement/README.md`.

**Lower bound.** `Grothe.Research.LawNodeLower.profile_bound_of_law_nodes`
proves `V ≤ B` for an admissible scalar profile under the simultaneous
Gaussian reduction `SharedReduction`, from checked rows, mixed batches,
additional law nodes and a complete finite cover. The active certificate in
`RefinedCoverResult.lean` uses `LowerRefinementCoverData.bound = 0.7134194` and
the strict `endpoint = 1.401700037873`. `Grothe.Lower.transfer_lower` gives
`1/B ≤ K` from `TransferInputsL2 B`; `refinement_endpoint_lt_reciprocal` supplies
the exact strict comparison. `TransferInputsL2 B` asks, for every δ > 0,
for a finite measure space with an operator T on L², a scalar cap
‖⟨f, T g⟩‖ ≤ B over a.e. unimodular f, g, and families u, v in L² with
Σₗ|uₗ|² ≤ 1 and Σₗ|vₗ|² ≤ 1 a.e. and ‖Σ⟨uₗ, T vₗ⟩‖ ≥ 1 − δ.

**How the two halves fit.** The Gaussian witness is defined in Lean
(`Grothe/LowerAnalytic/Witness.lean`): on ℂⁿ = ℝ^{n+n} with the standard Gaussian measure,
H₁,₀ = span{zₗ}, H₂,₁ = (charge-one polynomials of degree ≤ 3) ⊓ H₁,₀ᗮ (the span of the Wick cubics
zₐz_b z̄_c − 2δ_ac z_b − 2δ_bc zₐ, which lie in it by the complex Wick identity
E[z̄ᵢzₐz_b z̄_c] = 4(δ_ia δ_bc + δ_ib δ_ac), `WickCubic.lean`),
and `witness n = P₁,₀ − εP₂,₁` (orthogonal projections, ε = 149/200). The **value half** of
`TransferInputsL2` is proved: for uₗ = zₗ/‖z‖, `norm_pairVal_witness : 1 − (1+ε)/(n+1) ≤ ‖Σₗ⟨uₗ, T uₗ⟩‖`
(from E‖z‖² = 2n, E‖z‖⁴ = 4n(n+1), E‖z‖ ≥ 2n/√(2(n+1)) and the orthogonality of the two chaos
ranges), and `transferInputs_of_witnessCap : (∀ n ≥ N, WitnessCap n B) → TransferInputsL2 B`, where
`WitnessCap n B` is the scalar cap ‖⟨f, T g⟩‖ ≤ B of `witness n` over a.e. unimodular f, g.
The **scalar-cap half** is reduced to the certificate (`WitnessCap.lean`): for unimodular f, g
with h = (f+g)/2, k = (f−g)/2, t = ‖P₁,₀h‖, the polarisation identity `VOf_eq`,
Re⟨f, Tg⟩ = t² − ε‖P₂,₁h‖² − ‖P₁,₀k‖² + ε‖P₂,₁k‖², is proved, and
`LawNodeLower.witnessCap_of_law_nodes_reduction` converts the checked
finite-cover profile bound into `WitnessCap n B` at its supplied cap `B`.
It applies `profile_bound_of_law_nodes` to V = Re⟨f, Tg⟩ (after a phase),
with the bound t ≤ 9/10 proved
(`tOf_le`: P₁,₀h is a complex Gaussian, so ‖P₁,₀h‖² = Re⟨h, P₁,₀h⟩ ≤ E|P₁,₀h| = (√π/2)‖P₁,₀h‖, by the
rotation invariance of the Gaussian measure and E√(x²+y²) = √(π/2) in `GaussianRadial.lean`) and the
crude row derived from ‖P₂,₁k‖ ≤ ρ, which is proved (`normQk_le_rho`, L3): P₂,₁k ∈ H₂,₁ is a
combination of Wick cubics (`exists_wick_repr`), its real and imaginary parts are polynomials a, b with
`Chaos3 a` and `Circular Jstd a b` for the standard complex structure (`WickChaos.lean`), so the
certified first-moment bound E√(a² + b²) ≤ ρ of `gaussian_moments` applies to P₂,₁k/‖P₂,₁k‖, and
‖P₂,₁k‖² = Re⟨k, P₂,₁k⟩ ≤ E|P₂,₁k| since |k| ≤ 1. That first-moment bound rests on the sixth-moment
inequality, which is proved for every circular cubic (all tensor facts, `Circular.tensorFacts`).
`ReductionHyp n f g` (a coupling vector v with ‖v‖² = 2 and `SharedReduction rowData V t (P₂,₁h) v`)
is proved for n ≥ 2 from the node caps of the 19 certified fibre potentials alone
(`reductionHyp_of_nodeCaps`, L4, `Grothe/LowerAnalytic/{Fibre,FibreRot,FibreHermite,FibrePotential,FibreSup,
PotentialReg,Tensor,Pieces,KSide,FibreIntegral,RowGaussian,Frame,Reduction}.lean`): a unitary frame moves
P₁,₀h to the visible coordinate ζ₀ = z₀/√2 (`exists_Cop_eq`); the Gaussian measure splits as
γ_ℂ ⊗ γ_{remote} (`split2`); the fibre potential Ψ_r(s) = sup_y [∫(|L + B·(My + sa)| + |L − B·(My + sa)|) − yᵀMy]
is defined exactly as certified (basis B = (1, |z|²−1, z²/√2, z, z(|z|²−2)/√2, z̄), M = diag(E,E,R,R,εI₂)),
bounds every fibre expression at a complex coupling u by Ψ_r(|u|) (`fibreExprC_le_pot`, rotation
invariance), and is convex, even and Lipschitz with the header constant smax via E||z|²−1| = 2/e
(`capsHold_rowPot`); ‖P₂,₁k‖² is bounded by the six remote projections of the fibre coefficients
(the six mixed pieces B_j ⊗ K_j of H₂,₁(n+1), `norm_sq_starProjection_H21_le`), ‖P₁,₀k‖² splits exactly,
and the gates E ⪰ 0, E ⪰ diag(−1,ε,ε), R ⪰ diag(−1,ε), R ⪰ diag(ε,0) (checked exactly, `rowData_gatesOK`,
`rowGates_ok`) give the k-side inequality (`kside`); the integrated fibre bound and the k-side
inequality give each row inequality with the residual p = Π_{H₂,₁}c₀, its circular law and the gate
variable X = Π_{H₂,₁}(c₀, c₁, conj c₂) (`sharedReduction_frame`).
`Grothe.Research.RefinedLowerCheck.lower_bound_of_completed_refinement :
NodeCaps → IsGrothendieckBound K → 1.401700037873 < K` composes everything
through `Grothe/Research/RefinedCoverResult.lean`:
**the only hypothesis of this intermediate theorem is `NodeCaps`**, the node caps
Ψ_r(r_k) − 10⁻¹¹ ≤ c_k of the 19 certified potentials. Lean proves `NodeCaps`
(the following paragraphs), so the headline theorem `lower_target`
(`Grothe/MainResult.lean`) has no hypothesis.

For compatibility with the cached cap assembly, the same target `Grothe` retains the
weaker theorem `lower_bound_of_capsRest :
CapsRest → IsGrothendieckBound K → 1.401697117301 < K` (`CapNodes.lean`) and
`capsRest : CapsRest` (`Grothe/MainResult.lean`). The fifteen
`CapRowKK` modules of rows 0–11 and 16–18 hold the single-threaded native range
facts of those rows, importing only the computation layer and recipe data.
`CapRows` proves range-check soundness, and `CapAssembly` proves the chord
check and convexity assembly. `CapNodes` contains the
row-assembly proofs of those fifteen rows, imports the assemblies of rows 12–15
(`CapRow12/Assembly.lean` to `CapRow15/Assembly.lean`) and proves
`lower_bound_of_capsRest`, which
composes `vertexCaps_of_capsRest`, `nodeCaps_of_vertexCaps` and the same
`lower_bound_of_refined_cover_data`. The latter is now a weaker consequence of
the new cover. `lower_target` uses the same node-cap assembly with
`lower_bound_of_completed_refinement` (through `lowerTarget_of_nodeCaps`).
This preserves the heavy cap-cache source boundary while promoting the stronger endpoint. The common
`NodeCaps` definition lives in `NodeCaps.lean`, independently of
`Reduction.lean`. There is one build target and one axiom report: the heavy
rows and `CapNodes` are part of `Grothe`.

The cache provenance boundary is derived from the shared active-row registry:
legacy ranges, selected Row12–15 finite leaves and the retained independent
Row14 repair checks. The computation closure is hashed together with direct
assembly/configuration roots and mathematical input projections.
This identifies the cached computation
sources, not every analytic dependency or compiled artifact. Lake checks
ordinary dependencies separately. The numerical checker is the independent
precompiled `GrotheCapsKernel` library (`Basic`, `CapPoly`, `CapCheck`);
its constants retain the `GrotheKernel` namespace. Other kernel checkers
stay outside that library, whose root is pinned because every importer
loads its shared object.

The runner's heavy CI job builds `Grothe` and checks the
axiom report before recording `.lake/build/caps-closure.sha` with
`scripts/caps_stamp.py --mark-cache`. Ordinary CI restores that cache and
calls `--check-cache` (the default). A match permits the build of `Grothe`
(replaying the heavy facts) and the axiom audit, including `CapNodes`; Lake reuses native results only when
its dependency hashes permit it. When no verified cache matches the
caps digest (part of the cache key), CI runs the same check on the droplet's
runner, which builds, audits, marks and saves the cache; a cache miss delays
a check but never fails it. After a merge that changed the caps, master's
check also runs there and finds the build in the runner's workspace. One runner
build supplies the verification and subsequent replay; no independent
manual droplet verification is required. The build and the report establish
verification; a read-only digest alone does not.

`capRowsDone` includes every row index. `CapsRest` retains any excluded-node
caps of the original range-checked rows; those exclusion lists are empty
(`capExcl_eq_nil`), so `capsRest : CapsRest` (`Grothe/MainResult.lean`) is
proved, and with it `lower_target : LowerTarget`.
Rows 0.84, 0.845, 0.85 and 0.855 (indices 12–15) have complete
localized-piece and anchor assemblies for canonical CI verification. Their
inputs retain the unchanged cap pad and exact rational grids. Row14 uses the
independent `nodeCap_14x150_done` proof and its full repair closure at node 150,
and the generated proofs for its other localized nodes and anchors. The
source renderer checks every input. `gen_cap_prepared_rows.py --check`
reproduces the complete sealed sources and applies the explicit
`noncentre-source-binding.json` layer for hash-bound multiplier repairs.
Row15 has a separate complete source binding. Its renderer requires exact
matrix replay for every selected centre, binds the full research lineage, and
reproduces the current writer with the shared coverage policy. Extending the
policy archives its previous bytes for the sealed Row12–14 reproduction; the
old sources and source seals remain unchanged.
This layer permits only ordered noncentre lambda/mu changes at zero additional
cap, with exact stored-matrix LDL replay. It preserves the recipes, grids,
constraint regions, piece order, all planned centres and the retained node
150 proof. Only named D modules may differ; coverage, range and assembly
sources must reproduce identically. Current native range checks are required
in addition to the stored-matrix replay. Because the cap affects only matrix
entry (0,0), a negative pivot in the cap-free principal block requires a repair
of that block; a larger cap alone cannot make the matrix positive semidefinite.
Bulk repair imports replay the current ordered multipliers against each exact
export before adding a patch. Passing pieces and existing repairs retain their
bytes when diagnostic batches overlap; a failing protected centre requires
separate validation.

The localized-piece predicates also have a computation-only layer:
`CapCoverDefs` holds rational constraints and finite coverage checks, and
`CapConstrDefs` holds constrained matrices, parsers and node checks.
`CapCoverFast` proves in `capCoverFastOK_eq` that discarding duplicate samples
and filtering pieces by the first two coordinates leaves the finite coverage
predicate unchanged. `capCoverOK_of_slices` reconstructs it from all slices
of the first candidate index, requiring a positive slice count. The generated
coverage modules use the policy in
`data/caps-m/plan/row-certificates/coverage-slicing.json`: large nodes have
one independently compiled native fact per slice and a pure coverage assembly.
Small nodes use the equivalent filtered check directly. The public
`pieceCover_…` propositions, range checks and soundness theorems remain
unchanged by slicing, which does not modify grids or multipliers. Every slice is registered as a computation leaf;
the bounded builder parallelizes modules, never threads inside a native check.
`CapPieceRange` imports these definitions and rational data; the semantic
regions and unchanged soundness proofs remain in `CapCover`, `CapConstr`
and `CapPieceNodes`. Generated coverage/range modules therefore avoid the
lower proof chain. The whole-row assemblies of rows 12–15 import all of them
(`CapPieces/`), and through these assemblies the Row12–15 sources feed `CapsRest`.
The shared active-row registry derives the computation closure, native facts
and proof imports from the selected inputs. CI first builds the finite leaves
in bounded single-threaded groups, then builds the full root and performs the
strict audit. Source reproduction is not a native verification receipt.

* Proved: positivity certificates in integer arithmetic; the pinned gate price of every row
  (trailing gate block positive definite, κδ² ≤ δ + gatePrice); the Stein cuts (summed, spectral and general spectral) from their analytic inputs, by completions of squares,
  and their polynomial pieces; the majorant sweeps over 9,237 nodes; the moment-rectangle
  covers; the integration against the law of |q|²; the chords in σ; the bound of every row
  from its Gaussian reduction; the mixtures of rows (the retained gate square mixes by an exact
  identity); the common-law certificate: 21 batches of 351 node certificates for mixed
  potentials of rows 0.84–0.855 (3 inherited batches/45 nodes with Stein cuts, 18 batches/306 nodes
  with spectral cuts on 74-, 90- and 161-knot test meshes, 136 of them using covariance order,
  and 118 citing a contraction-Gram certificate). Of those, 41 carry a joint sixth-moment
  budget. The finite checker verifies each signed reserve and both positive semidefinite
  2×2 matrices; the analytic bridge derives that same budget for the actual cubic.
  Joint nodes are restricted to their checked kurtosis range throughout the cover.
  The current partition of [0, 9/10] × [0, ρ] × [0, 31/4] has 14,060 closed boxes.
  It retains the preceding pure-row and mixed-source law nodes checked by
  `LawNodeCheck.certLawNodes` and adds 21 majorants checked by
  `LowerRefinementCheck.certRefinementBatches`. Finite convex mixtures retain the
  common gate square before repricing. The recursive coverage checker `treeCoverOK`,
  with proof `treeCoverOK_sound`, checks the full tree partition. Inherited components
  retain their original scale interpolation domains when restricted to smaller boxes.
  Lean also checks the endpoint and proves the Gaussian witness on L²(γ_n) with its value on z/‖z‖, the orthogonality of the
  chaos ranges, the polarisation identity of the scalar pairing, the bound ‖P₁,₀h‖ ≤ √π/2 for |h| ≤ 1
  (rotation invariance of the Gaussian measure, E√(x²+y²) = √(π/2)) and the transfer inputs from the
  scalar caps. The cover certificate uses five row checks and three mixed-batch checks from
  `Grothe/Lower/Cert/`, plus four refined-box chunks and a refined-partition
  check from `Grothe/Research/`, and the two additional law-bank checks. The four box
  chunks use size 3,515; the kernel verifies that they cover the actual list.
  These are single-threaded `native_decide` facts; the node caps add their own
  chord, range, anchor and piece checks (`data/axioms/native.txt` is the
  complete list). `LawNodeLower.lean` proves nine interfaces
  connecting checked extra batches and a complete cover to the same Gaussian reduction
  and transfer; `RefinedCoverResult.lean` supplies the current complete certificate.
* Inputs of the intermediate theorem `LawNodeLower.profile_bound_of_law_nodes` (all of them are derived in Lean: the node caps `NodeCaps` by `CapNodes.lean` and `capsRest`, the others by the chain ending in `lower_bound_of_completed_refinement`): the crude row V ≤ t² + ερ² − ε‖Qh‖² (`hcrude`; on paper it follows
  from ‖Qk‖ ≤ E|Qk/‖Qk‖| ≤ ρ, which uses the moment bounds also for the cubic Qk/‖Qk‖), with ‖v‖² = 2
  and 0 ≤ t ≤ 9/10; the simultaneous Gaussian reduction of the rows (`SharedReduction`): one residual p = Q_w c₁ with scale τ = ‖p‖₂ ≤ ρ and normalised law
  U = |p|²/τ² satisfying the moment bounds and the Stein inputs, one gate variable
  X = Q_w(c₁, c_A, conj c_B) with X₁ = p, and for every row its potential Ψ_r with the row inequality
  retaining the gate square, V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ√U) − δ_r τ² − E[X*N_r X + 2Re(conj p (g_r·X))] − ε‖Qh + βv/ε‖²; the node caps, convexity and Lipschitz bound of each potential (the node
  caps are proved in `Grothe/LowerAnalytic/Cap*.lean`: by convexity only the vertex nodes of the cap table need a
  cap; at a vertex node the anchored-pair majorant on a polar grid, verified interval tables and an exact LDLᵀ
  check bound the potential, and the localised nodes of rows 0.84–0.855 use a cover by constrained pieces
  (regions in the odd fibre directions, one S-lemma quadratic each); slack 10⁻¹¹); the moment bounds on the law of U = |q|²; the analytic
  inputs of the Stein cuts for that law. In the intermediate theorem `lower_bound_of_completed_refinement` all of these
  except the node caps (`NodeCaps`) are proved for the witness T = P₁,₀ − εP₂,₁ (see above); the headline theorem `lower_target` adds the proof of the node caps. The transfer itself (finite partitions,
  phase choices on cells, L² approximation by ball-valued simple functions, passage to the limit), the
  witness, its value ≥ 1 − (1+ε)/(n+1) on u(z) = z/‖z‖, the polarisation identity, the bound
  t ≤ √π/2 < 9/10, the identification of H₂,₁ with the circular cubic polynomials and the crude row
  ‖P₂,₁k‖ ≤ ρ from the certified first-moment bound are proved in Lean (`Grothe/Lower/Transfer*.lean`,
  `Grothe/LowerAnalytic/{GaussianRadial,Witness,WitnessCap,WickCubic,WickChaos}.lean`).
* The analytic inputs of the Stein cuts (`GramInputs`, extending `SteinInputs`) are, with
  w = Γ(q, q̄)/3, c = Γ(q, q)/3, X = w − 1, r = Re(c q̄²)/U, P = E[XU] and Q = E[rU]: E w = 1; the
  separate spectral budgets E X² ≤ (2/3)P and E r² ≤ (2/3)Q (gaps ‖U₄‖²/9 and ‖(q²)₄‖²/9 + E(|c|² − r²));
  the energy identity 2P + Q = E|q|⁴ − 2; the covariance order Q ≤ (E|q|⁴ − 2)/3, i.e. Q ≤ P; the
  integration by parts E[Φ(U) − φ(U)] = E[(w−1)φ(U) + r·(φ(U) − Φ(U)/U)] for piecewise-linear tests φ
  with primitive Φ; and the two universal law budgets of genuine circular cubics q ∈ H₂,₁ cited by the
  new spectral nodes (`Gram.lean`): for the coefficient tensor t of q = Σ t_abc :Z_a Z_b Z̄_c: with
  contractions N, H, B, W, Y and n = ‖N‖², h = ‖H‖², b = ‖B‖², y = ‖Y‖², z = tr(N Hᵀ), one has
  P = 16n + 4h + 16b/3 + 32y, Q = 64b/3 + 32y, E X² = (80n + 20h + 16b + 96y + 32z)/9,
  E|c|² = (128b + 96y)/9, the Gram matrices G₀ = Gram(N, Hᵀ) = [[n, z], [z, h]] and
  G₁ = Gram(D, C₊₊) = [[h, T], [T, (n + b + 2T)/4]], T = (3y − z)/2, are positive semidefinite, b ≤ n and
  y ≤ z; the *contraction-Gram budget* λ E X² + μ E r² ≤ a P + b₀ Q holds whenever rational node data
  (a, b₀, two PSD 2×2 matrices M₀, M₁, α, β ≥ 0) satisfy coefficientwise in (n, h, b, y, z)
  aP + b₀Q − λ E X² − μ E|c|² = tr(M₀G₀) + tr(M₁G₁) + α(n − b) + β(z − y) + Σ eⱼvⱼ with eⱼ ≥ 0
  (`gramCert`; simplest instance E X² + E r²/10 ≤ 34P/45 − Q/18), and the *coupled family*
  E X² ≤ a_s P − b_s Q, a_s = (s + 5)/9, b_s = (s + 1/2 − 3/s)/9, s ≥ 2, which is the instance
  λ = 9s, M₀ = (64, −16s, 4s²), α = 16(s² − 4) (`coupled_of_gram`).
  From them `steinCut_of_inputs` proves the summed cuts (the budgets added), the spectral cuts
  E[f²/λ + g²/μ + Φ − φ + (ν/3 − 2t)(U² − 2)] ≥ 0, f = −(φ+β)/2 + (2t + λ/3)U,
  g = −(φ − Φ/U)/2 + (t + μ/3 − ν/2)U, λ, μ > 0, ν ≥ 0, which equal a sum of squares plus
  λ((2/3)P − E X²) + μ((2/3)Q − E r²) + ν(χ/3 − Q), and the general spectral cuts of a node citing a
  budget, with the coefficients of U shifted by af = a/2 − λ/3 and ag = μ/3 − b₀/2 (or by the sums
  Σ ηⱼ(sⱼ − 1)/18, Σ ηⱼ(sⱼ + 1/2 − 3/sⱼ)/18 of the coupled family), whose expectation is the squares plus
  aP + b₀Q − λ E X² − μ E r². The inputs of `SteinInputs` are proved in Lean for the Gaussian law: for
  real polynomials a, b in the third Gaussian chaos with E a² = E b² = ½ and E ab = 0, the law of
  U = a² + b² under the standard Gaussian measure satisfies them
  (`Grothe.LowerAnalytic.gaussian_steinInputs`; the budgets from Ornstein–Uhlenbeck ladders in
  `SpectralBudget.lean`, the covariance order `covariance_order` in `Covariance.lean`, where
  P − Q = Σ Var(Γ(∂ᵢa, ∂ₖb) − Γ(∂ₖa, ∂ᵢb)) + ½‖T − Tᵀ‖² for the matrix T = Σᵢ ∂ᵢ∇²a ⊗ ∂ᵢ∇²b). The
  contraction-Gram budgets are derived in `GramBudget.lean` (`gaussian_gramInputs`) for every
  circular cubic: with the complex coefficient tensor t = 3P₊P₊P₋(f + ig) of
  the real kernels f = ∂³a/6, g = ∂³b/6 (P± = (1 ∓ iJ)/2 the projections of the complex structure J)
  and its contractions defined in Lean, the **proved** part is the spectral layer E X² = (4u₂ + u₄)/9,
  P = (2u₂ + u₄)/3, E|c|² = (4v₂ + v₄)/9, Q = (2v₂ + v₄)/3 for the chaos energies u₂ = ‖U₂‖²,
  u₄ = ‖U₄‖² of U − 1 and v₂, v₄ of q² (orthogonality of the chaos projections of `Influence.lean`),
  r² ≤ |c|², the Cauchy–Schwarz bound z² ≤ nh (G₀ ⪰ 0), the soundness of an accepted certificate
  on any scalars with these properties (`gram_budget_of_scalars`), and, in `GramTensor.lean` by
  finite sum manipulations for every tensor symmetric in its first two slots, the inequalities
  b ≤ n (Schatten–Hölder: b = Re Σ M_x M_{σx} ≤ ‖M‖² = n for the Gram matrix M of the slices
  t_{a·d}), y ≤ z (z = ‖W‖², y = ‖Sym W‖² = (z + 2T)/3 with T = Re⟨W^{(23)}, W⟩ ≤ z) and G₁ ⪰ 0
  (G₁ = Gram(D, C₊₊) with ‖D‖² = h, ⟨D, C₊₊⟩ = T, ‖C₊₊‖² = (n + b + 2T)/4, 2T = 3y − z);
  and, in `GramSpectral.lean`, the second-chaos identities u₂ = 16n + 4h + 16z and v₂ = 32b
  (`Circular.specU2_eq`, `Circular.specV2_eq`: a complex charge calculus on the slots of t — the
  kernel τ = f + ig of a circular pair has δτ = iτ, so τ = Sym t with t = 3P₊P₊P₋τ, and every
  contraction of two slots whose J-eigenvalues do not cancel vanishes — reduces the second
  derivatives ∂²Π₂|q|² = 36 Re Σ τ τ̄ and ∂²Π₂q² = 36 Σ τ τ to (H + 2N)/9 and 2B/9, and the
  Ornstein–Uhlenbeck ladder E X² = ½ Σ (∂²X)² gives the energies) and the fourth-chaos identities
  u₄ = 16n + 4h + 16b + 96y − 32z and v₄ = 96y (`Circular.specU4_eq`, `Circular.specV4_eq`:
  ∂⁴Π₄ = 108(Sym(f⋆g) + Sym(g⋆f)), the ladder E X² = (1/24) Σ (∂⁴X)², the sector expansions
  τ⋆τ = (W + W^{(34)} + W^{swP} + W^{swP(34)})/9 and τ⋆τ̄ = (D + 4 C^σ)/9, and a charge count of the
  pairings of permuted W, D, C: three of twelve survive for v₄, ten of sixty for u₄, each a Gram
  identity of `GramTensor.lean` up to reindexing); so **every tensor fact of the contraction-Gram
  budget is proved** and `gaussian_gramInputs` has no hypothesis beyond circularity;
  `tools/check_gram_facts.py` checks the identities numerically with the exact Lean definitions.
  `Grothe.LowerAnalytic.sharedReduction_of_gaussian` packages this law in
  `SharedReduction`: it discharges E U = 1, the integrability conditions, E U² ≥ 2, the cap E U² ≤ 44 ≤ 2 + (31/4)²
  (`Circular.gaussian_fourth_moment_le_44`, using the circular contraction identities),
  E√U ≤ ρ (derived from the other moment fields by `moments_of_three`) and all Stein inputs (including the spectral budgets and the covariance order). The
  residual q = a + ib is required to be *circular* (`Circular J a b`: J a complex structure on ℝ^d
  and D_J a = −b, D_J b = a for the rotation generator D_J = Σ Jⱼᵢ xⱼ∂ᵢ, i.e. D_J q = iq, the
  bidegree (2,1) condition); E b² = E a² and E ab = 0 follow. The sixth-moment bound
  E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2} is **false** for general real third-chaos pairs with
  E a² = E b² = ½, E ab = 0 (a = He₃(x₀)/√12, b = He₃(x₁)/√12 gives m = 47, E U³ = 13506 >
  12622.55); for circular q it is derived in `Circular.lean` (`sixth_moment_circular`,
  `Circular.gaussian_sixth`) from the scalar certificate `cumulant_bound`: the real cumulants of
  a are converted with E a⁴ = (3/8) E U², E a⁶ = (5/16) E U³ (from E D_J P = 0), E a² = 6‖f‖²
  for the kernel f = ∂³a/6, and the Cauchy–Schwarz inputs ‖SF‖² ≤ √s √T₄, ⟨FG, SF⟩ ≤ √V ‖SF‖ are
  proved. All thirteen tensor facts `TensorFacts` of the paper proof are proved
  (`Circular.tensorFacts`): the Wick identity κ₄ = 1296(s + 3h/2) for every cubic chaos
  (`Chaos3.wick4`), the Wick identity
  κ₆/46656 = (135/2)T₃ − 20V + (135/2)Q + (165/2)⟨D,U⟩ + 45‖U‖² for every cubic chaos
  (`Chaos3.wick6`, `WickSix.lean`: E F², E F⁴, E F⁶ are sums over closed cubic multigraphs,
  obtained by Gaussian integration by parts one edge at a time — `gval_step_cert` in
  `WickGraph.lean`, k·val(G) = Σ_t val(G + v₀t) with k = 3 − deg v₀ the chaos order of ∂_{w}F —
  along 69 + 15 + 3 certified steps on canonical partial graphs, `WickGraphData.lean`; the
  disconnected graphs factor and cancel in κ₆, and the five contractions expand through
  S = (C₀ + C₁ + C₂)/3 into 43 multigraph sums, each matched to one of the six connected cubic
  multigraphs on six vertices by a `decide`-checked relabelling; generated by
  `tools/gen_wick_graphs.py`, `tools/gen_wick_six.py`), and, in `CircularTensor.lean`, ‖G_anti‖² ≤ s/2 (`tenGa_le_half`), the charge-two block tt = h/6 − ‖M‖²/24
  ≤ h/6 (`tenTT_le_sixth`), the cubic trace V = tr G³ ≤ (s + 2η)√((s − η)/2), η = ‖G_anti‖²
  (`cubicTrace_circular`: G = G₀ + G₂ with G₀ commuting with J, the mixed traces vanish and
  2‖G₀u‖² ≤ ‖G₀‖²‖u‖² is Bessel's inequality for the pair u, Ju), the two sector quantities
  A₀ = ‖C₀ − θS₀‖² ≥ 0, A₂ = ‖C₂ − θS₂‖² ≥ 0 (`A0nn_circular`, `A2nn_circular`), and the two
  sums of squares h ≤ 37s/39 and 27h − 5s + 8η ≤ 216 tt (`sos1_circular`, `sos2_circular`: with
  B = (J₃f) ⋆ f the charge-one relation K₁₂C = C − (J₁ + J₂)B identifies the real avatars
  x₁ = (1 + K₁₃)(C₀ − J₁B₀)/2 and y = (1 − K₁₂)C₀ of the complex sectors (+,−,−,+) and (+,+,−,−);
  37s − 39h = (45/8)‖(1 − H)(1 − V)x₁‖² + 6‖sw24 y − (1 + H)(1 + V)x₁/4‖² + 12‖C₂ − VC₂‖² and
  216tt − 27h + 5s − 8η = 3‖(1 − H)x₁‖² + ‖G₀ − 3JM₀‖²/2, H, V the slot swaps (14), (23), the
  entries reduced to ‖C₀‖², ⟨C₀, K₁₂C₀⟩, ‖C₂‖², η and the tetrahedral Q(f,f,f,f)), and the
  block trace T₄ = ‖S²‖² ≤ h²/2 + 8h·tt − 48tt² (`trace4_circular`: S acts on pairs with the
  charge blocks S₀₀, S₀₂, S₂₀, S₂₂ of norms² 4tt, (h − 6tt)/2, (h − 6tt)/2, 2tt, S₂₂ commutes
  with the complex structure J ⊗ 1 since S has no charge four, and Hilbert–Schmidt
  submultiplicativity gains a factor 2 on the J-linear products), the block trace
  T₃ = ⟨S², S⟩ ≤ √tt (9h/2 − 17tt) (`trace3_circular`, the same block walks), the coupled G test
  Q = ⟨vec G, S vec G⟩ ≤ (2s − η)√tt + √(2η(s − η)(h − 6tt)) (`coupled_circular`: vec G splits
  into its J ⊗ J charge parts G₀, G_anti of norms² s − η, η, and S acts blockwise) and the
  charge split ‖U‖² = ⟨S², C⟩ ≤ θT₃ + √(A₀(3h²/8 + h·tt/2 + 3tt²/2)) + √(A₂(9h·tt − 54tt²))
  (`chargeSplit_circular`: C − θS has no charge four, so Cauchy–Schwarz in the two charge
  sectors against the blocks of S²), all through a real charge calculus (slot operators of J,
  the derivation δ with δf = −g, δg = f for the kernels of a, b, and the tetrahedral
  contraction); `Circular.chaos3_right` shows that b is a cubic chaos when a is.
  `reductionHyp_of_nodeCaps` (`Reduction.lean`) constructs the gate variable
  and per-row `RowShared` reduction from the node caps. The crude row follows
  from the proved bound `normQk_le_rho` in `WitnessCap.lean`.
* Also proved, as standalone lemmas in `Grothe/LowerAnalytic/`: the three-moment lemma, the
  scalar sixth-moment and first-moment certificates (the sixth-moment one from its tensor and
  cumulant hypotheses), and the exact form of
  the fluctuation bound (`Influence.lean`): for a circular cubic chaos q = a + ib the slack in
  Var(w) + ½E|c|² ≤ (E|q|⁴ − 2)/3 equals (2‖Π₂,₂|q|²‖² + ‖Π₃,₁q²‖²)/18, with the quartic identity
  3κ = 4‖Π₁,₁|q|²‖² + 2‖Π₂,₀q²‖² + 2‖Π₂,₂|q|²‖² + ‖Π₃,₁q²‖², the influence inequality
  4‖Π₁,₁|q|²‖² + 2‖Π₂,₀q²‖² ≤ 3κ, and the weighted bound on the first-chaos content of q|q|²
  along any direction by the influence of that direction.

## Module map (selected groups)

**`Grothe/UpperChaos/`: the upper bound for the concrete rounding**

| modules | content |
|---|---|
| `ComplexMoments`, `ComplexHermite`, `Mehler`, `Completeness`, `HermiteComplete`, `HermiteBasis`, `Charge` | one complex coordinate: E[zᵃz̄ᵇ] = δ a!, Hermite polynomials and orthogonality, Mehler for polynomials, density of polynomials in L²(stdGaussian d), Hilbert basis and Parseval, charge selection |
| `ProductComplete`, `HermiteC2`, `HermiteC2Basis`, `LawY`, `MehlerL2`, `Energy2`, `Kernel2` | two coordinates: tensor completeness from one-coordinate completeness by Fubini, Gaussian mixing law by characteristic functions, Mehler for L² functions, chaos energies by bidegree, the physical kernel of a charge-one function |
| `Realise2`, `Structural` | two-channel rounding with tensor-realised preprocessors (`rounding_diskKernel`); the structural fields (validity, summability, parity) as theorems |
| `TaylorPhase`, `Rounder` | \|P₃(x)\|² = 1 − x⁴(3 − x²)/36; the concrete rounding G_T from `Grothe/Upper/Data.lean` |
| `PhiHorner`, `PhiDense`, `PhiCover`, `PhiCoverData`, `PhiCoverCheck0`–`5`, `PhiCoverCheck`, `PhiBound` | φ² ≤ 99/100 everywhere (`phiT_sq_le`, hence `phi_abs_lt_one`: \|φ\| < 1; `phiBound` is the same bound as the rounding's `PhiBound`): 512 cubes of bisection trees (`phi_cover_check_0`–`5`), analytic far field; used by `upper_below_tight` |
| `EnergyBlock`, `LocalizedComparison` | actual Gaussian energies of error blocks; the selected-spectrum comparison |
| `HardyKernel`, `HolIntegral`, `HardyHolo`, `OddSeries`, `OddParseval` | holomorphic Gaussian kernel; dominated parametric integration; holomorphy for separate measurable disk-valued responses (`HholPair`); odd-series continuation and circle Parseval; `hardy_of_pair_inputs` and its incumbent specialization |
| `Gauss2`, `Sym2R`, `SchurTest`, `LstarL`, `SchurKernel`, `SchurBound`, `SchurIntegrability`, `SchurMain` | Gaussian integrals, weighted Schur test and kernel factorization; the Gaussian Schur bound for every measurable disk-valued response pair under its positive-definiteness gates (`norm_HholPair_sq_le`) |

The pair interface needs measurability and the pointwise disk bound on both
responses. Holomorphy uses the same open covariance-decay region (`KerPos`)
and does not need charge or conjugation symmetry. `hardy_of_pair_inputs`
additionally requires summable real odd coefficients, their identification
with the pair kernel for real correlations, and the pair's circle mean bound
at radius `4149/4000`. It concludes the existing partial weighted-square
inequality with budget `7/4`. These proofs introduce no numerical axioms.
The incumbent `differentiableOn_Hhol_Rt` and `hardy_of_inputs` retain their
statements and specialize the pair results. The Gaussian density/covariance
identification and the contour inputs are hypotheses of the pair interface;
for the incumbent rounding they are proved (`HardyReal.hreal_GT` and the checks below).
`SchurMain.norm_HholPair_sq_le` proves the Gaussian Schur bound for the same
response pairs under `j > 0`, `Z ≻ 0` and `T ≻ 0`. These structural theorems
alone do not discharge `hardy` for a changed rounding or improve an endpoint.
The region and circle inputs are checked in Lean with the precompiled interval
evaluator `GrotheKernel.HardyArc` (interval soundness `HardyArcSound`, circle
charts `HardyArcCircle`, data `HardyArcData`): `hardy_region_check` proves
`KerPos` on the disc of radius `51863/50000` (`HardyArcRegion`), and
`HardyGaussianCheck.charts_checked` bounds the Gaussian-amplitude expression by
`(513 + 297cos²θ − 204cos⁴θ)/500` on all four closed halves of the two charts of the circle
`|t| = 4149/4000` (soundness `HardyGaussianSound`). `HardyGaussian.hmean`
integrates the squared correlation `HardyArcCover.gF` over both charts, and
`HardyGaussian.hardy_of_real` (budget `117/100`) retains coefficient summability
(`hs`) and the real identification (`hreal`) as explicit inputs;
`HardyReal.lean` supplies both for G_T, giving `HardyReal.hardy_GT_gaussian`.

**`Grothe/LowerAnalytic/Cap*`: the node caps**

| modules | content |
|---|---|
| `CapCoord`, `CapLinAlg`, `CapMajorant`, `CapPolar` | real coordinates of the fibre variable; exact quadratic-form checks (Loewner bound, LDLᵀ); the anchored-pair majorant of \|L + p\| + \|L − p\|; polar cells of the complex Gaussian |
| `CapSym`, `CapGrid`, `CapGridT`, `CapGridOK`, `CapTables`, `CapTablesMk` | symbolic polynomials over ℚ(√2); cell prices on uniform polar grids and the exact cell decomposition of the integrated majorant; verified interval tables (`tablesOK_mk`) |
| `CapPiece`, `CapCheckSound` | node certificate soundness (`pot_le_of_pieceOK`, `pot_le_of_nodeOK`) for the precompiled checker `GrotheCapsKernel/CapCheck.lean` |
| `CapSymmetry`, `CapChordData` | the symmetries S_c, S_- of the fibre integral; chord nodes from vertex caps by convexity (`capChords_check`, `nodeCaps_of_vertexCaps`) |
| `CapRangeDefs`, `CapChords`, `CapRecipeData`, `CapRows`, `CapAssembly`, `CapRow00`–`CapRow11`, `CapRow16`–`CapRow18`, `CapNodes` | computation-only definitions and generated rational data; range-check soundness and convexity; the range facts of these fifteen rows, part of `Grothe`, verified on the runner and replayed by CI from its cache; the assembly `lower_bound_of_capsRest` |
| `CapCoverDefs`, `CapConstrDefs`, `CapPieceRange`; `CapCover`, `CapConstr`, `CapPieceNodes` | localised caps of rows 12–15 (route M): computable coverage and constrained-piece checks separated from symmetry, S-lemma and piece-node soundness (issue #12) |
| `CapRow12/`–`CapRow15/` (`Recipes`, `AnchorRangeNN`, `Assembly`), `CapPieces/` | rows 12–15: the anchor range facts and the row assemblies `vertexCapsRow12`–`vertexCapsRow15`; the generated per-node modules of the localised nodes (data `D…`, coverage `C…`, range facts `R…`, node theorems `N…`) |

**`Grothe/Lower/Cert/`: the row and mixed-batch certificate in eight single-threaded chunks.**
`Rows0`–`Rows4` and `Batches0`–`Batches2` each hold one `native_decide`
fact (`certRowsK`, `certBatchesK`); `Parts` holds the shared chunk definitions.
`LawNodeLower.certified_rows` and `certified_mixed_batches` assemble those
checks independently of a cover. The cover certificate of the lower bound uses these facts,
the additional law-node fact and the refined-cover facts; the node caps add
their chord, range, anchor and piece facts.
The complete registry of native facts is `data/axioms/native.txt` (cap ranges, the Gaussian circle check
and the decay region of the Hardy tail, and others); the default report
is `scratch/Axioms.lean`, with its required declarations in
`data/axioms/required.txt`. CI checks the report on every pushed branch, and on
the merged tree before a pull request lands.

The repository-wide axiom audit permits `propext`, `Classical.choice`, `Quot.sound`,
and the `native_decide` facts pinned in
`data/axioms/native.txt` (read by `scripts/check_axioms.py`). That file is the
complete list; the facts fall into the following groups. `Grothe.head_check` (the upper head),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.Upper.improved_high_mass_native` (the two complete high-band masses
for the 51-coefficient costs, including the inherited table-error allowance),
`Grothe.UpperChaos.phase_moment2_check`, `phase_moment4_check`, and
`phase_moment6_check` (the exact second, fourth and sixth moments of the production phase),
`Grothe.UpperChaos.phase_cutoff_factor_check` (the exact factor for its squared radial tail),
`Grothe.UpperChaos.HardyGaussianCheck.charts_checked` (the Gaussian circle cap of the Hardy tail),
`Grothe.UpperChaos.hardy_region_check` (its decay region),
`Grothe.UpperChaos.phi_cover_check_0`–`5`
(the phase cover |φ| < 1), `Grothe.LowerAnalytic.capChords_check` (the cap-table chord nodes),
and the eight chunks `Grothe.Lower.certRows0`–`4` and
`certBatches0`–`2` for the certified rows and mixed batches. The finite cover
has four box checks `certRefinedBoxes0`–`3`
and `certRefinedPartition` in `Grothe.Research.RefinedLowerCheck`, together with
`Grothe.Research.LawNodeCheck.certLawNodes` for the added pure-row batch.
The node-cap facts are the range checks `capRangeKK_j` of rows 0–11 and 16–18
and, for rows 12–15, the anchor ranges `rowKKAnchorRangeNN` and the piece
checks `pieceRange_…`, `pieceCover…` and `pieceRepair_…` of the localised nodes.
The remaining upper-bound facts are the stored-expansion checks
(`taylor_centers_decode_check`, `rounding_energy_check`,
`firstCenter_band_energy_check`, `secondCenter_band_energy_check`), the
energy-table facts `UpperQuad.Facts.gradeBlockNN`, `evenCheck` and
`omittedCheck`, the ellipse shards `UpperQuad.EllCheck.shardNN` of the energy
quadrature, the port facts `UpperQuad.PortFacts.jN…` of the three Taylor powers
and the twisted ellipse facts `UpperQuad.TwistEllCheck.Facts.jN…`.
Every native check is single-threaded (no `Task.spawn`). All
other accepted finite computations (the polynomial norms, the moment covers) use
proof-producing kernel reduction, including the canonical continuation-block checks.
The report is `lake env lean scratch/Axioms.lean`, checked in CI;
the node caps are in the same report. The generic response, cubic-ceiling
and quintic-transfer lemmas are archived under `miscellaneous/research/Grothe/`
and are not part of the build. No `sorry`,
no warnings.

The bank's 41 original joint-moment nodes are verified through the integrated
`JointData`/`jointCert` checker and `Circular.joint_sixth` analytic bridge in
`JointContractions.lean`. The 306 original spectral witnesses, 45 inherited Stein witnesses,
the two pure-row Stein witnesses, three mixed-source Young witnesses and 21
additional law majorants are combined in the 14,060-box finite-mixture cover. The cover needs no hypothesis beyond
`NodeCaps`, which is proved (`capsRest`).

**Preceding reproducible law-scale extension.** `data/lower-unshifted/` preserves the original
source snapshots, two pure-row and three mixed-source law certificates, and the complete
10,909-box cover. `tools/needle_fused_global.py --verify` replays its 388 binary
splits and 1,072 same-domain repricings from the immutable 10,521-box baseline.
The original node/group prefix is pinned. Added source references name existing
Stein or zero nodes; they introduce no new source cap.

`tools/needle_mixed_nodes.py` checks each mixed source, its Gram/Young budget,
kurtosis range and whole-half-line majorant. No historical fusion or LP file is
an acceptance input. The generator `tools/needle_unshifted_lean.py` independently
checks every law certificate, the original canonical reference map, every final
box and the guillotine partition. `--check` reproduces `LawNodeData.lean` and
`RefinedCoverData.lean` byte for byte. The original pure-row batch stays at index
21; the three mixed nodes form batch 22. No checker-core or heavy cap source changes.

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
