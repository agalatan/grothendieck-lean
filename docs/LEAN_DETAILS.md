# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).

The sole target interval is `1.401697117301 < K < 1.404598149141`.
Both endpoints are work in progress; [PROOF_STATUS.md](PROOF_STATUS.md) lists
the remaining project-specific Lean obligations. Shared Gaussian
phase identity and Laplace modules under `Grothe/Haagerup/` remain necessary.

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
`JointSixth.lean` uses the same identities and core for its invariant adapters
and capped/η refinements. No positivity of the symmetrized contraction
operator is assumed.

Weaker upper-bound variants, their data and their historical verification records
are preserved in [the committed archive](../miscellaneous/other-bounds/README.md).
They are outside the active build and current axiom policy.

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
`norm_hpow_three_sq`. These are total energies; sharp band-tail estimates also
need certified captured Hermite energy and approximation errors.
The targets in `data/phase-moments/targets.json` are expected exact values,
not integral assumptions: each numerical leaf computes from the production
phase. `python3 tools/gen_phase_moment_data.py --check` verifies source binding
and reproduces the generated targets without expanding polynomial powers.
Neither `ComparisonInputs` nor `energy_close` is discharged by total energies
alone, and no headline bound changes.

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
not use an external radial-coefficient table. This radial tail does not
certify the remaining finite comparison-band coefficients.

`TaylorRadialTail` uses `‖hpow j‖² = φ^(2j) ≤ φ²` for `j > 0` to transfer
this bound to all positive Taylor sources. `norm_source_fifty_lt` states
the resulting norm below `5/10^15` for the event indicator in the original
`Lp ℂ 2 mu2` space. Thus the existing smoothing and band-projection
contractions can apply without changing measures. This step uses the proved
phase cover and introduces no further numerical check.

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
results formalize both tail routes, without certifying the remaining Gaussian
inner-product enclosures or the approximant coefficient data.

**Finite Taylor centers.** The original three approximant arrays and frozen
correction are preserved under `data/taylor-approximants/inputs/`, with a
hash manifest. `HermiteFinite` gives the exact coefficients, total norm and
projected norms of any finite rational expansion in the normalized tensor
Hermite basis. `GradedHermite` proves injectivity of the charge-one coordinates
`((q+1-c,q-d),(c,d))` and reindexes energies as bounded triple sums, with direct
coefficient lookup. `PackedDyadic` strictly decodes signed mantissa/exponent
records and proves the common-denominator sum-of-squares identity.
`TaylorBandData` retains all 6,552 third-approximant coefficients through degree
51 as exact binary64 dyadics. `thirdCenter_decode_check` verifies parsing and
size; `thirdCenter_energy_check` checks the total and four band energies.
`norm_thirdCenter_sq` and `norm_thirdCenterBand_sq` identify these targets with
actual Hermite norms. Rational lower and upper enclosures use kernel arithmetic;
charge-one support and the vanishing degree tail follow from generic indexing
lemmas. The source is unscaled: division by six occurs in the comparison source,
not in this center. All three centers now have finite band-norm certificates; Gaussian
error enclosures remain open, and stored error arrays are not treated as proofs.
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
their Gaussian validity remains unproved. This theorem removes a separate tail
hypothesis once these four finite-band error hypotheses are supplied.

**Exact Taylor rounding.** `TaylorFirstData`, `TaylorSecondData` and
`TaylorFrozenData` preserve the first center through degree 181, the second
center through degree 91 and the frozen correction through degree 181. The
original frozen input's coefficients above degree 181 are exactly zero; the
source generator checks them before retaining the shorter vector. The third
center reuses `TaylorBandData` without duplicating its coefficients.
`PackedDyadicChunks` parses bounded chunks strictly and supplies a proved
integer fold. `GradedHermiteLinear` proves coefficient linearity and zero
extension between graded supports. `TaylorCenters` defines the actual centers
and their rounding difference. At common scale 2^206, the numerator is
`6*A1 + 3*A2 + A3 - 6*V`, with explicit grade restrictions for the shorter
centers and third integers rescaled by 2^101. `TaylorRounding` identifies its
integer sum of squares with the actual squared Hermite norm. Its arithmetic
leaf recomputes that sum from the source lookups; a separate leaf verifies
successful decoding and sizes. Kernel arithmetic then proves the 10^-18
rounding cap. Input hashes, exact arithmetic targets and byte-for-byte
reproduction are recorded under `data/taylor-approximants/`. This certificate
does not use any Gaussian integration-error premise.

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
`Grothe.UpperChaos.fresh_upper_concrete_taylor` in `GroupedRounder.lean` assembles all eighteen pieces
and concludes the target upper-bound implication from only `hfirst` (six
finite errors), `hsecond` (four), `hthird` (four), and `hclose` for the energies
of the actual `Xfun frozenCorrectionFn`. No separate rounding, tail,
representative or charge-one premise remains. These fourteen Gaussian
inequalities and the energy-table accuracy remain unproved inputs.

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
`1/rate`, including for rates below one. `AffineGaussianSquare` centers the
conditional density without dividing by the radial profile. For arbitrary
complex `z`, real `a`, positive `alpha,t`, put `beta=alpha+a^2*t` and
`mu=-(a*t/beta)*z`. `ConditionalGaussianPhase` proves the exact conditional
monomial formula: the scalar factor
`t^(-1/2)*exp(-alpha*t*normSq(z)/beta)` multiplies
`z*M(p,q;beta,mu) + a*M(p+1,q;beta,mu)`. The finite moment `M` includes its
`1/beta` mass. The measure conversion, translation, integrability and factorial
scaling are all explicit. Certified auxiliary and radial tails for the complete
sources, and numerical integration accuracy, remain separate obligations.

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

`RationalUnitWickProduction` and `RationalUnitQuadrature` compile the actual
unit-mode source and its Gaussian Wick evaluation into rational polynomials.
`UnitSquaredQuadrature.taylorQuadratureKernel_unit_eq_squared` removes the
radius square root from that polynomial form. For nonnegative cells,
`RationalUnitProductionCell.unit_production_cell_mem_of_model` transfers a
pointwise normalized-square polynomial enclosure to the production cell
integral, proving its imaginary part zero. The model enclosure is an explicit
hypothesis and the cell integral excludes the outer `1 / sqrt(pi)` factor;
no numerical cell certificate or improper-integral bound is claimed.

`ShiftedMomentRecurrence` proves
`M(p+1,q)=mu*M(p,q)+(q/beta)*M(p,q-1)` by finite binomial algebra, including
`q=0` and zero mean. Before norms are taken, the affine bracket becomes
`(alpha*z/beta)*M(p,q)+(a*q/beta)*M(p,q-1)`.
The base-moment cancellation below is a specialization of this recurrence.
`RadialDampedMoments` proves the Gamma formula and integrability for
`norm(z)^q * exp(-(rate-1)*normSq(z))` whenever `q>-2` and `rate>0`.
This includes negative radial exponents without imposing a positive radial
cutoff. The full-source tail constants, radial reduction and
certified quadrature budgets remain open.

`ConditionalGaussianBase` identifies the first shifted moments and combines
the zeroth-moment bracket before estimating it: it is exactly
`alpha*z/beta^2`. For `‖z‖ ≥ r₀ > 0`, `ConditionalGaussianTail` bounds the norm
of the conditional Gaussian expectation by
`2/(alpha*r₀^3) * t^(-5/2)`. Its integral above any `T>0` is at most
`4/(3*alpha*r₀^3) * T^(-3/2)`. The scalar majorant in
`RealGaussianKernelTail` follows from `y^2*exp(-y) ≤ 2` and works for every
positive `beta`, so no lower bound on the radial profile is needed. These
results concern the base moment away from the radial origin; they do not
certify the full polynomial-weighted Taylor sources or the remaining budgets.

`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Upper bound.** `Grothe.UpperChaos.fresh_upper_rounder` proves
`IsGrothendieckBound (500000000000000000/355973699960428191)` for the concrete rounding,
given an L² charge-one truncation `X`, component-error inputs and table accuracy (the Hardy input is proved).
`Grothe.upper_value_lt` shows this is below 1.404598148840 (`Grothe/UpperChaos/GroupedRounder.lean`).
The endpoint proof is **work in progress**. The supporting module
`Grothe/UpperChaos/ProfileFirstGaussianCell.lean` is complete: its
`profile_first_gaussian_cell_exact` identifies the actual squared `lagHalf 1`
integral on `[0,1]` with `5/4 - (13/4) * exp(-1)`, and
`profile_first_gaussian_cell_enclosure` places it between
`54391816192/10^12` and `54391816194/10^12`. The proof uses an explicit
antiderivative and `Real.exp_one_near_20`, with no native checker.
Both theorems are included in the axiom report. This finite cell is one input
to the remaining profile and Gaussian response estimates.

`Grothe/UpperChaos/LeanCertPilot.lean` uses LeanCert pinned at
`7f91b6eb3567437f6cfac03ed279706603ee22f4`, with the existing Lean/Mathlib versions.
Its `unitBaseSlice_integral_enclosure` proves
`1 ≤ ∫ u in 0..1, 2*exp(-u²/(1+u²))/(1+u²)² ≤ 5/4`.
The proof applies `integral_bounds_of_check_dyadic` to an explicit 16-cell
`checkIntegralBoundsDyadicFull` certificate, checked by `decide +kernel`.
This checks reciprocal domains as well as interval bounds; continuity proves
integrability separately. `unitBaseSlice_eq_conditional_base` identifies the
integrand, for `u > 0`, with `2*u` times the norm of the actual affine Gaussian
phase-Laplace integral. Both theorems are in the axiom report and introduce
no native facts. The module imports only `LeanCert.Validity.IntegrationDyadic`
from LeanCert. The production Gaussian error estimates remain work in progress.

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
proved finite-domain reduction, not a certificate for the remaining quadrature.

`ProductionCompactLaplace` includes the radial restriction `‖u.1‖² ≤ 80`.
The existing exact Gaussian tail theorem and `exp(-80)=exp(-40)²` give radial
L² error at most `10⁻¹⁷`, reusing the same LeanCert certificate.
`norm_compactLaplaceError_cutoff_lt` proves that softening, radial truncation
and auxiliary truncation together cost less than `5·10⁻¹⁵` for every Taylor
order, with no new numerical premise. Its smoothed band-projection corollary
retains the original Gaussian measure and all omitted modes.

`ProfileAdaptiveSource.norm_profileRetainedError_lt` permits an auxiliary
endpoint of `100` on any measurable subset of the small-profile region,
while retaining `2⁵³` elsewhere. The extra removed source has L² norm at
most `3·10⁻¹⁷`; softening, radial truncation and both auxiliary omissions
jointly remain below `5·10⁻¹⁵`. `profileRadialRegion_subset_smallProfile`
accepts squared-radius certificates `s ≥ 1/16` and `|κ(s)| ≤ 1/100`, so a
finite union of certified rational intervals needs no exact root locations.
The same reserve controls all pairings and smoothed band projections. These
results introduce no native facts and inherit the existing phase-cover leaves.
`ProfileIntervalQuadrature.inner_profileRetained_eq_intervalQuadrature`
binds a finite disjoint union of half-open radial intervals to the actual
Gaussian pairing, by subtracting their compact-source corrections.
`ProfileIntervalBands` proves charge one for this source and identifies its
finite coefficient residual with the exact band energy. Its final transfer
adds the source reserve once per band, using the common
`norm_projOn_chargeOne_sub_graded_sq` identity also used by the full compact
rectangle. The numerical retained-energy certificates remain to be supplied.
`ProductionRectangleAssembly.inner_profileRetained_eq_mesh` combines these
identities with the checked continuous unit-mode evaluator: the coefficient
is a sum of retained radial-strip rectangles, with endpoint `100` on selected
strips and `2⁵³` elsewhere. `inner_profileRetained_eq_reciprocalMesh` splits
each auxiliary interval at one and rewrites its tail with `x=1/u` and Jacobian
`x⁻²`. `ReciprocalQuadrature` proves the substitution for arbitrary complex
integrands on positive finite intervals. The reciprocal endpoints are
`1/100` and `2⁻⁵³`, so no value or regularity assertion at zero is needed.
The actual production kernel is identified with the continuous evaluator on
rectangle interiors; the auxiliary-zero boundary contributes no extra term.
`ReciprocalQuadraturePartition.rectangleIntegral_reciprocal_eq_sum` proves
complete finite cell coverage at positive reciprocal boundaries by applying
the original-kernel partition to their inverses. It requires no extension
of the reciprocal kernel through zero. Its norm theorem sums certified
cell radii over the entire rectangle.
`ProductionMeshEnclosure.norm_inner_profileRetained_sub_meshCenters_le`
then combines regular and reciprocal strip enclosures with the Gaussian
normalization to bound the actual retained pairing. The source approximation
reserve is still applied only at the band-transfer stage. Numerical cell
and band-energy estimates remain to be supplied.
`SmallProfileMesh` fixes seven radial strips, with the short auxiliary
endpoint on strips 1, 3, and 5. `selected_rows_checked` uses `decide +kernel`
on the existing centered Horner evaluator; `profile_on_selected` transports
the checks to the actual normalized profile. The resulting fixed source
satisfies the original `5e-15` reserve without an assumed profile estimate.
Its exact pairing is the full reciprocal mesh, and `norm_band_error_le`
leaves only the finite retained-energy certificate and degree conditions.
The rational cuts are generated by `tools/gen_small_profile_mesh.py` from
`data/small-profile-mesh/certificate.json`; `--check` verifies the generated
Lean data without evaluating any analytic claim.
`SmallProfileSeparation` checks eight additional centered-Horner rows and
their complete coverage of the gaps between the original profile neighborhoods
and the selected tubes. Combining these checks with the existing outer-profile
theorem gives `|κ(s)| > 1/1000` on every closed nonselected strip. Consequently
`α x² + κ(s)² > 10⁻⁶` for `α ≥ 0`, uniformly in the reciprocal coordinate.
The gap data share the same tracked input and generator as the radial cuts;
the checker uses kernel reduction and introduces no native facts.

`LocalAffineSquareIntegralBounds` supplies both affine integration orders with
`ContinuousOn` restricted to the actual closed cell. Coordinate clamping
extends the integrand continuously without changing any cell integral.
`RetainedMeshReality` proves the imaginary parts of the complete normalized
mesh coefficients vanish, so real enclosures control their complex norm.
`ChargeBandEnclosure` subtracts the stored Hermite center, forms the rational
residual radius `|center-target|+radius`, and bounds the selected Parseval sum.
`SmallProfileBandEnclosure.norm_band_error_le_real_enclosure` applies this
finite rational energy to the concrete source, adding `5e-15` once per band.
`norm_band_error_le_cap` reserves this amount before squaring, preserving
the original rational cap. The actual coefficient enclosures and numerical
energy inequality still need
to be supplied for each of the fourteen original band tolerances.

`ConcreteRetainedBands` fixes the actual first-, second-, and third-order
sources and their stored center lengths 91, 46, and 26. The finite coefficient
cutoff for each band is `(bandHi+1)/2`; kernel reduction checks its degree
coverage and that the original cap exceeds the shared reserve. The three
error-family transfers need only complete retained coefficient enclosures
and their rational energy checks. They leave factorial scaling to the
existing comparison decomposition.



The alternative `Grothe.UpperChaos.DirectSample.upper_of_actual_head` derives
the same rational bound from an explicit finite-head estimate of the actual
kernel. `upper_of_finite_sample_bounds` reduces that estimate to complex
coefficient enclosures and a numerical head check. Those enclosures and the
head check remain to be proved; this route is work in progress.
The table interface `Grothe.fresh_upper` is in `Grothe/Upper/GroupedBridge.lean`;
it takes `DirectHyps E EX` and the sharper grouped comparison bound.
Its Hardy field uses the `1737972/1000000` budget, proved for the concrete
rounding by the existing arc certificates and `Real.pi_gt_d20`; the concrete
Gaussian comparison and table-accuracy hypotheses are unchanged.
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

The separate `RadialRepair.lean` proves the exact complement identity
`(1−q) S₆(q)² = 1−C₆(q)`, with C₆(q) = q⁷ times a polynomial with seven
positive coefficients. It certifies the polynomial disk map
`z ↦ z S₆(1−normSq z)` and its degree-39 phase specialization; no new
`native_decide` fact is used. `radial_gap_sq_le` proves
`(1−‖P₃(x)‖)² ≤ x⁶/1225` for x² ≤ 1. `KernelStability.lean` proves
`Σ |E_H−E_G| ≤ (‖H‖₂+‖G‖₂)‖H−G‖₂` and transports this through any
same feasible P,Q to all physical coefficients of charge-one responses. `RadialCeiling.lean`
integrates the pointwise gap and proves `radial_kernel_ceiling`, with explicit
phase-domain, radial-gap, integrability and sixth-moment premises. This theorem
applies to diagonal response kernels. `HardyHolo` supplies holomorphy and Hardy
assembly for separate responses along the fixed covariance path `Rt`.
Applying the energy-coefficient realization to a response pair still needs
signed cross moments rather than a nonnegative energy table. Retuned
preprocessors need matching covariance and contour inputs. The concrete
Gaussian moment and a score for the new rounder are not proved here, and the
headline endpoints are unchanged.

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
* The selected comparison is proved in `Grothe/UpperChaos/GroupedComparison.lean`.
  `ComparisonInputs` records an exact shared-coordinate error decomposition,
  total-chaos supports and component L² norm bounds. From the inherited Gaussian
  enclosures at cutoffs 181, 91, 51, these are the smoothed mixed-Taylor errors
  and frozen-vector rounding error. The general interface leaves these inputs
  abstract; `fresh_upper_concrete_taylor` uses the fixed Taylor centers
  and assumes their fourteen finite-band Gaussian error bounds. Lean proves
  `Σ_(p in headIdx 501) w(p) |E(p)-EX(p)| ≤ 851922301/10¹⁵` from them, using
  `2 Σ A_r e_r + (Σ_g √(Σ_{r∈I_g} e_r²))²`, with `A_r²` enclosing
  `Σ w(p)² EX(p)` on its band. The four groups consist of the rounding remainder
  and the three Taylor orders; bands within each group are disjoint.
  The generic grouping inequality and its rational budget are kernel checked.
  `HeadWeight.lean` proves `w(p)` bounds the retained coefficient mass of each
  preprocessed block; all costs lie in `[0,1]`. Its interval extraction reuses
  the existing sound power and convolution routines. No Gaussian input is added.
  The finite Hermite blocks are identified with the
  actual Gaussian energies in `EnergyBlock.lean`. The native `comparison_check`
  proves all 18 band radii from the stored table and `energyErrQ`; the sharper
  group budget is checked separately. Neither a near-linear kernel nor the final head
  residual is assumed by this interface.
* Other explicit input: `energy_close`, the stored energies are within
  6847009/(5·10¹⁷) of EX on `headIdx 501` in ℓ¹. The Hardy input (the
  weighted square-sum bound 1737972/1000000 at radius 4149/4000 for the kernel of G_T) is
  **proved**: `HardyReal.hardy_GT_tight`. The concrete theorem also takes X ∈ L² and
  charge-one equivariance. Validity, summability, parity, and the phase cover
  for the actual rounding are derived. `HardyHolo.lean` now proves
  `hardy_of_inputs` from positive kernel decay on a disc of radius greater
  than 4149/4000, identification of the real odd series with the continued
  kernel, and its circle mean bound ≤ 7/4. Holomorphy, continuation,
  Parseval, the decay region and the circle mean are proved, and
  `hardy_of_real` (`HardyStep4.lean`) derives the `hardy` statement for every
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
* **Residual ledger.** The total is 455212621809/(5·10¹⁷), approximately
  9.10425·10⁻⁷. The selected comparison contributes 93.57%, the native finite
  head 3.09%, the Hardy tail 3.33%, and the table error about 0.0015%.
  These percentages describe allowances, not fractions of the proof left
  unformalized. The Gaussian component-error inputs remain the main numerical
  limitation. Full scope, source bindings and reproduction commands are in
  `data/localized-comparison/PROOF.md`; `miscellaneous/other-bounds/tree/docs/localized-comparison.tex` gives
  the mathematical argument.
* The same weighted head bound forces `h₀ ≥ slopeQ − headResidualQ`.
  `hardy_budget_after_linear` deducts its weighted square from `1737972/1000000`;
  exact kernel arithmetic proves tail `303362486/10¹⁶`.
* **Independent replay.** The source computations were replayed on a different machine: the
  nodal table and the Taylor centre arrays were regenerated bit for bit, and the kernel head,
  contour tail, comparison and endpoint pass on the regenerated data (energy table reproduced
  to 1.2·10⁻¹⁶ in ℓ¹ under a different linear-algebra library). This is reproduction, not
  formal verification.

**Lower bound.** `Grothe.Research.LawNodeLower.profile_bound_of_law_nodes`
proves `V ≤ B` for an admissible scalar profile under the simultaneous
Gaussian reduction `SharedReduction`, from checked rows, mixed batches,
additional law nodes and a complete finite cover. The active certificate in
`RefinedCoverResult.lean` uses `refinedB = 0.713420886479` and the strict
endpoint `refinedL = 1.401697117301`. `Grothe.Lower.transfer_lower` gives
`1/B ≤ K` from `TransferInputsL2 B`; `refined_endpoint_lt_reciprocal` supplies
the exact strict comparison. `TransferInputsL2 B` asks, for every δ > 0,
for a finite measure space with an operator T on L², a scalar cap
‖⟨f, T g⟩‖ ≤ B over a.e. unimodular f, g, and families u, v in L² with
Σₗ|uₗ|² ≤ 1 and Σₗ|vₗ|² ≤ 1 a.e. and ‖Σ⟨uₗ, T vₗ⟩‖ ≥ 1 − δ.

**How the two halves fit.** The Gaussian witness is now defined in Lean
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
`Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data :
NodeCaps → IsGrothendieckBound K → 1.401697117301 < K` composes everything
through `Grothe/Research/RefinedCoverResult.lean`:
**the only remaining hypothesis of this theorem is `NodeCaps`**, the node caps
Ψ_r(r_k) − 10⁻¹¹ ≤ c_k of the 19 certified potentials (exact-arithmetic certificates outside Lean).

The same single target `Grothe` also proves `lower_bound_of_capsRest :
CapsRest → IsGrothendieckBound K → 1.401697117301 < K` (`CapNodes.lean`). Its 15
`CapRowKK` modules retain the 60 unchanged single-threaded native range facts
for rows 0–11 and 16–18, importing only the computation layer and recipe data.
`CapRows` proves range-check soundness, and `CapAssembly` proves the chord
check and convexity assembly (`CapHull` is a compatibility import). `CapNodes` contains the
15 unchanged row-assembly proofs and the final `CapsRest` theorem, which
composes `vertexCaps_of_capsRest`, `nodeCaps_of_vertexCaps` and the same
`lower_bound_of_refined_cover_data`. The common
`NodeCaps` definition lives in `NodeCaps.lean`, independently of
`Reduction.lean`. There is one build target and one axiom report: the heavy
rows and `CapNodes` are part of `Grothe`.

The cache provenance boundary is 53 files: 48 local computation modules,
plus `CapNodes.lean`, `GrotheCapsKernel.lean`, `lean-toolchain`,
`lake-manifest.json` and `lakefile.toml`. Those five extras are hashed directly,
without traversing their imports. This identifies the cached computation
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

`CapsRest` still comprises the vertex caps of rows 0.84, 0.845, 0.85,
0.855 and any excluded-node caps of the other rows; the exclusion lists
are empty. The rows 12–15 computation campaign and final wiring remain
separate work.

The localized-piece predicates also have a computation-only layer:
`CapCoverDefs` holds rational constraints and finite coverage checks, and
`CapConstrDefs` holds constrained matrices, parsers and node checks.
`CapPieceRange` imports these definitions and rational data; the semantic
regions and unchanged soundness proofs remain in `CapCover`, `CapConstr`
and `CapPieceNodes`. Generated coverage/range modules therefore avoid the
lower proof chain. They are excluded from the root until a proof uses
them, and are not yet wired into `CapsRest`.

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
  The refined partition of [0, 9/10] × [0, ρ] × [0, 31/4] has 10,909 closed boxes.
  It retains the existing certified node potentials and their valid ranges, and adds two
  pure-row law-scale nodes for row 14 using the original unshifted source table and Stein cuts.
  Their one appended batch passes `LawNodeCheck.certLawNodes`. The recursive
  coverage-only checker `treeCoverOK`, with proof `treeCoverOK_sound`, checks
  the full tree partition. Adaptive binary
  subdivisions and reoptimized row mixtures use the same certified bank. Seventy
  additional reference labels expose existing source-table nodes, without adding
  a law certificate or a source cap. Inherited components retain their original
  scale interpolation domains when restricted to smaller boxes.
  Lean also checks the endpoint and proves the Gaussian witness on L²(γ_n) with its value on z/‖z‖, the orthogonality of the
  chaos ranges, the polarisation identity of the scalar pairing, the bound ‖P₁,₀h‖ ≤ √π/2 for |h| ≤ 1
  (rotation invariance of the Gaussian measure, E√(x²+y²) = √(π/2)) and the transfer inputs from the
  scalar caps. The headline uses five row checks and three mixed-batch checks from
  `Grothe/Lower/Cert/`, plus four refined-box chunks and a refined-partition
  check from `Grothe/Research/`, and the additional law-batch check. The four box
  chunks use size 2,631; the kernel verifies that they cover the actual list.
  These are 14 single-threaded `native_decide` facts. `LawNodeLower.lean` proves nine interfaces
  connecting checked extra batches and a complete cover to the same Gaussian reduction
  and transfer. `RefinedLower.lean` specializes the interface to no additional batches;
  `RefinedCoverResult.lean` supplies the current complete certificate.
* Inputs of the intermediate theorem `LawNodeLower.profile_bound_of_law_nodes` (all of them are now derived in Lean, except the node caps `NodeCaps`, by the chain ending in `lower_bound_of_refined_cover_data`): the crude row V ≤ t² + ερ² − ε‖Qh‖² (`hcrude`; on paper it follows
  from ‖Qk‖ ≤ E|Qk/‖Qk‖| ≤ ρ, which uses the moment bounds also for the cubic Qk/‖Qk‖), with ‖v‖² = 2
  and 0 ≤ t ≤ 9/10; the simultaneous Gaussian reduction of the rows (`SharedReduction`): one residual p = Q_w c₁ with scale τ = ‖p‖₂ ≤ ρ and normalised law
  U = |p|²/τ² satisfying the moment bounds and the Stein inputs, one gate variable
  X = Q_w(c₁, c_A, conj c_B) with X₁ = p, and for every row its potential Ψ_r with the row inequality
  retaining the gate square, V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ√U) − δ_r τ² − E[X*N_r X + 2Re(conj p (g_r·X))] − ε‖Qh + βv/ε‖²; the node caps, convexity and Lipschitz bound of each potential (exact-arithmetic
  certificates outside Lean: interval integration of Young-type price bounds, and, on the rows
  near the maximum, anchored quadratic bounds and, on s ∈ [0.2, 0.4) ∪ [0.525, 0.6) of rows 0.84–0.855, localised anchored bounds
  (regions in the odd fibre directions, one S-lemma quadratic each, replayed in exact arithmetic), with the convex hull of
  the cap table; slack 10⁻¹¹); the moment bounds on the law of U = |q|²; the analytic
  inputs of the Stein cuts for that law. In the headline theorem `lower_bound_of_refined_cover_data` all of these
  except the node caps (`NodeCaps`) are proved for the witness T = P₁,₀ − εP₂,₁ (see above). The transfer itself (finite partitions,
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

**`Grothe/UpperChaos/`: the sharp upper bound for the concrete rounding**

| modules | content |
|---|---|
| `ComplexMoments`, `ComplexHermite`, `Mehler`, `Completeness`, `HermiteComplete`, `HermiteBasis`, `Charge` | one complex coordinate: E[zᵃz̄ᵇ] = δ a!, Hermite polynomials and orthogonality, Mehler for polynomials, density of polynomials in L²(stdGaussian d), Hilbert basis and Parseval, charge selection |
| `ProductComplete`, `HermiteC2`, `HermiteC2Basis`, `LawY`, `MehlerL2`, `Energy2`, `Kernel2` | two coordinates: tensor completeness from one-coordinate completeness by Fubini, Gaussian mixing law by characteristic functions, Mehler for L² functions, chaos energies by bidegree, the physical kernel of a charge-one function |
| `Realise2`, `Structural` | two-channel rounding with tensor-realised preprocessors (`rounding_diskKernel`); the structural fields (validity, summability, parity) as theorems |
| `TaylorPhase`, `Rounder` | \|P₃(x)\|² = 1 − x⁴(3 − x²)/36; the concrete rounding G_T from `Grothe/Upper/Data.lean` |
| `PhiHorner`, `PhiDense`, `PhiCover`, `PhiCoverData`, `PhiCoverCheck0`–`5`, `PhiCoverCheck`, `PhiBound` | φ² ≤ 99/100 everywhere (`phiT_sq_le`, hence `phi_abs_lt_one : |φ| < 1`; `phiBound` is the same bound as the rounding's `PhiBound`): 512 cubes of bisection trees (`phi_cover_check_0`–`5`), analytic far field, headline `fresh_upper_rounder` |
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
identification and exact contour inputs remain separate obligations.
`SchurMain.norm_HholPair_sq_le` proves the Gaussian Schur bound for the same
response pairs under `j > 0`, `Z ≻ 0` and `T ≻ 0`. These structural theorems
alone do not discharge `hardy` for a changed rounding or improve an endpoint.
`HardyArc*` checks the region and circle inputs in Lean: the precompiled
interval evaluator `GrotheKernel.HardyArc` bounds the Schur value on
rational boxes, four `native_decide` facts (`hardy_arc_part_0..3`) cover the
circle `|t| = 4149/4000` with mean at most `1737972/1000000`, and `hardy_region_check`
proves `KerPos` on the disc of radius `51863/50000`. `hardy_region_and_mean`
assembles both, and `hardy_of_real` retains coefficient summability (`hs`)
and the real identification (`hreal`) as explicit inputs.

**`Grothe/LowerAnalytic/Cap*`: the node caps**

| modules | content |
|---|---|
| `CapCoord`, `CapLinAlg`, `CapMajorant`, `CapPolar` | real coordinates of the fibre variable; exact quadratic-form checks (Loewner bound, LDLᵀ); the anchored-pair majorant of \|L + p\| + \|L − p\|; polar cells of the complex Gaussian |
| `CapSym`, `CapGrid`, `CapGridT`, `CapGridOK`, `CapTables`, `CapTablesMk` | symbolic polynomials over ℚ(√2); cell prices on uniform polar grids and the exact cell decomposition of the integrated majorant; verified interval tables (`tablesOK_mk`) |
| `CapPiece`, `CapCheckSound` | node certificate soundness (`pot_le_of_pieceOK`, `pot_le_of_nodeOK`) for the precompiled checker `GrotheCapsKernel/CapCheck.lean` |
| `CapSymmetry`, `CapHull`, `CapChordData` | the symmetries S_c, S_- of the fibre integral; chord nodes from vertex caps by convexity (`capChords_check`, `nodeCaps_of_vertexCaps`) |
| `CapRangeDefs`, `CapChords`, `CapRecipeData`, `CapRows`, `CapAssembly`, `CapRow00`–`CapRow11`, `CapRow16`–`CapRow18`, `CapNodes` | computation-only definitions and generated rational data; range-check soundness and convexity; 60 range facts in `Grothe`, verified on the runner and replayed by CI from its cache; final `lower_bound_of_capsRest` assembly |
| `CapCoverDefs`, `CapConstrDefs`, `CapPieceRange`; `CapCover`, `CapConstr`, `CapPieceNodes` | localised caps of rows 12–15 (route M): computable coverage and constrained-piece checks separated from symmetry, S-lemma and piece-node soundness (issue #12) |

**`Grothe/Lower/Cert/`: the row and mixed-batch certificate in eight single-threaded chunks.**
`Rows0`–`Rows4` and `Batches0`–`Batches2` each hold one `native_decide`
fact (`certRowsK`, `certBatchesK`); `Parts` holds the shared chunk definitions.
`LawNodeLower.certified_rows` and `certified_mixed_batches` assemble those
checks independently of a cover. The active endpoint uses these eight facts,
one additional law-node fact and five refined-cover facts (14 native inputs).
The complete registry of native facts is `data/axioms/native.txt` (cap ranges, Hardy facts — four arc parts and
the region — and others); the default report is `scratch/Axioms.lean`, with its required declarations in
`data/axioms/required.txt`. Delivery CI checks the combined tree.

The repository-wide axiom audit permits `propext`, `Classical.choice`, `Quot.sound`,
and the `native_decide` facts pinned in
`data/axioms/native.txt` (read by `scripts/check_axioms.py`): `Grothe.head_check` (the upper head),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.UpperChaos.phase_moment2_check`, `phase_moment4_check`, and
`phase_moment6_check` (the exact second, fourth and sixth moments of the production phase),
`Grothe.UpperChaos.phase_cutoff_factor_check` (the exact factor for its squared radial tail),
`Grothe.UpperChaos.hardy_arc_part_0`–`3` and `hardy_region_check` (the Hardy circle mean and decay region),
`Grothe.UpperChaos.phi_cover_check_0`–`5`
(the phase cover |φ| < 1), `Grothe.LowerAnalytic.capChords_check` (the cap-table chord nodes),
and the eight chunks `Grothe.Lower.certRows0`–`4` and
`certBatches0`–`2` for the certified rows and mixed batches. The finite cover
has four box checks `certRefinedBoxes0`–`3`
and `certRefinedPartition` in `Grothe.Research.RefinedLowerCheck`, together with
`Grothe.Research.LawNodeCheck.certLawNodes` for the added pure-row batch.
The same `Grothe` target also includes 60 range checks
`capRangeKK_j`. Every native check is single-threaded (no `Task.spawn`). All
other accepted finite computations (the polynomial norms, the moment covers) use
proof-producing kernel reduction, including the canonical continuation-block checks.
The report is `lake env lean scratch/Axioms.lean`, checked in CI;
the node caps are in the same report. The generic response, cubic-ceiling
and quintic-transfer lemmas add no native facts or endpoint hypotheses. No `sorry`,
no warnings.

The bank's 41 original joint-moment nodes are verified through the integrated
`JointData`/`jointCert` checker and `Circular.joint_sixth` analytic bridge in
`JointContractions.lean`. The 306 original spectral witnesses, 45 inherited Stein witnesses,
two new pure-row Stein witnesses and three new mixed-source Young witnesses
are combined in a 10,909-box cover. No extra hypothesis is added to `NodeCaps`.

**Reproducible law-scale extension.** `data/lower-unshifted/` contains the original
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
