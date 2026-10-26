# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).

**Published scalar-tail refinement.**
`Grothe/Haagerup/ScalarTailRefinement.lean` proves an arbitrary finite-power
Wiener composition bound and its signed supported-suffix consequence. Its
single native fact checks the degree-592 polynomial `P₅^16`, with norm at most
`581/1000`. The omitted outer indices start at 67, so their norms are bounded
by `(581/1000)^8` times the old estimate. Exact rational arithmetic includes the
unchanged published slope, prefix, finite-block tail, other tails and selector
mass, and accepts the reciprocal `1.40489844`.
`wallis_tail_bound` proves the fixed phase-tail estimate at 67, combining
the exact terms 67--119 with `tsum_haagCoeff_tail_le 120` and π ≤ 355/113.
Its rational comparison uses proof-producing `decide +kernel`; this adds
no native axiom. `refined_score_of_published_budgets` therefore needs only
the published slope, prefix, finite-block, other-tail and selector-mass
inequalities. Their Gaussian interpretation is not formalized here.
The theorem concludes a normalized score inequality, not
`IsGrothendieckBound`. The general Wallis-parameterized transfer remains
available as `refined_score_of_published_inputs`.
The corresponding written unconditional corollary uses HJM's proved inputs.
All four pinned public non-regeneration verifiers pass; the accepted integral
tables were hash-checked, not regenerated. See
[`data/scalar-tail-refinement/PROOF.md`](../data/scalar-tail-refinement/PROOF.md).
The exact certificate JSON and generator reproduce the module byte for byte.

**Phase errors and transported certificates.**
`Grothe/Upper/ResponseGeometry.lean` proves eight statements: the exact
disk support-defect identity, normalized-distance and weighted support-loss
bounds (including zero moduli), kernel and block-energy transport under an
explicit intertwining hypothesis, finite and countable energy comparisons
after aligning the anchor, and the zero full-spectrum price of a pure orbit.
The countable bound is `2*norm(x)*e+e^2` when `norm(y-Ux)<=e`; it assumes
Bessel's inequality for the transported blocks. It does not assume that an
arbitrary rotation preserves the coordinate bidegrees of the actual kernel.
`Grothe/Haagerup/PhaseGeometry.lean` proves three all-index statements:
`4*(n+1)*(n+2)*haagR(n+1)>=1`, the resulting harmonic lower bound, and
non-summability of `(2*k+1)*haagCoeff k`. These eleven results use only
standard axioms. The Gaussian phase-orbit differentiation argument and
numerical response integrals are not formalized by these modules.
Neither endpoint nor its hypotheses change.
The written argument is in [response-geometry.tex](response-geometry.tex).

**Global spherical-dual research interface.** `Grothe/LowerAnalytic/SphericalTransfer.lean`
proves the signed finite and countable coefficient-defect bound, a positive factorization
controlling the inverse cubic Jacobi multipliers, their exact binomial recurrence and
all-index monotonicity, and the uniform omitted-multiplier allowance
`cubic_tail_32_12 : 12 < r → cubicAmp 32 r (149/200) < 419/5000000000`.
The exact value at index 13 is `17513/209010560960`, checked in the kernel without
`native_decide`. `global_cap_from_truncation` states the conditional cap assembly.
The analytic Gaussian random-restriction/spherical harmonic bridge is a paper proof;
neither that bridge nor a numerical spherical norm cap is proved by this module.
It introduces no hypothesis into either existing endpoint and changes neither bound.


**Binding-relaxation audit.** `Grothe/Lower/PrimalAudit.lean` proves finite
primal-versus-dual separation for a fixed table and cut bank: nonnegative atom
weights satisfying the cuts force every pointwise dual majorant to cost at least
the primal score. Both theorems are kernel-checked without numerical axioms.
The four concrete atomic laws in [the binding audit](BINDING_AUDIT_2026-10-23.md)
are checked externally with exact rational arithmetic; this module does not
formalize their numerical data, realize them as Gaussian cubics, or change an endpoint.

**Joint response Gram lift.** `Grothe/LowerAnalytic/ResponseGram.lean` proves
the shared residual Gram interval for nested orthogonal projections, a sharp
scalar cross-coefficient interval using an orthogonal reflection, elimination
of all scalar completions, factored PSD prices, finite moment-support assembly,
pointwise weighted alignment, a modulus cutoff error, cross-inner-product
perturbation, exact scalar disc support and attainment, and explicit
near-maximizer price accounting, and the complex two-disc dual price bound.
Its sixteen theorems use only standard axioms.
`Grothe/LowerAnalytic/TwoDisc.lean` adds seven theorems: exact factored-slack
soundness, the universal factored support bound, four sharp local support
bounds, and attainment of all four. `Grothe/LowerAnalytic/QuadraticFeatures.lean`
adds the finite Wick decomposition, Hilbert-space probe closure, and two rational
remainder budgets for centered and affine quadratic features. All eleven new
theorems also use only standard axioms. The general SDP rank-one argument,
Gaussian response application and modified bilinear-operator
interface are written proofs in [the lift report](JOINT_RESPONSE_LIFT_2026-10-23.md).
The droplet diagnostics are floating-point exploration, not numerical data
theorems. This module does not establish a uniform lifted norm cap or alter
either endpoint.

**Common Stein kernels.** `Grothe/Lower/SteinFusion.lean` adds six results:
the exact perspective variance identity, its fusion inequality, the unit-price
fusion identity and inequality, the specialization to the existing spectral-cut
cell formula (including zero), and simultaneous orthogonal projection of both
kernels preserving every retained moment while decreasing both norms.
The universal merged-cut expectation remains an application of the existing
`Grothe.Lower.spec_of_inputs`. The finite-feature Schur equivalence and the
genuine-cubic floor for every convex mixture of the nineteen frozen tables
are paper proofs with external exact/directed checks, as recorded in
[the common-kernel reassessment](COMMON_STEIN_REASSESSMENT_2026-10-23.md).
The table floor is not a lower bound on the original witness norm.

**Original-noise replica and full-tail screen.**
`Grothe/LowerAnalytic/ReplicaState.lean` proves seven results: the two-coordinate
Gram realization (five identities/inequalities), the exact gap produced by
giving a distributional Gaussian coordinate the wrong chaos grade, and its
strictness. `Grothe/Upper/KernelScreen.lean` proves the absolute weighted-tail
bound, the necessary single-kernel full-score bound, the finite priced
screen, and the all-index admissibility of its induced witness multipliers.
The screen is affine in response columns, so common prices can screen
their mixtures before tail coefficients are recovered. These eleven results use
only standard axioms. The invariant-space classification, original Gaussian
conditioning, and extraction of the mixed Hermite coefficients are written
arguments, not formalized here. Numerical integral values are not Lean inputs
and no new endpoint follows. See [the replica report](SYMMETRIC_RESPONSE_REPLICAS_2026-10-23.md).

**Common signed-tail prices and cubic Gaussian-phase separator.**
`Grothe/Upper/SpectralScreen.lean` adds seven results: a finite front/geometric
tail certificate for all indices, pricing the common signed tail before taking
absolute values, the resulting full-score inequality, affine enclosure errors,
assembly over finite response mixtures, the single coefficient-l1 error allowance
for every admissible price (`l1_anchor_price_bound`), and the 1-Lipschitz lower
bound for the complete score (`full_score_l1_lower`). This lets an exchange retain
the incumbent's signed coefficients and pay its error once across all sampled
correlations. `tools/incumbent_exchange.py` exports those coefficients from the
committed data and replays their finite polynomial composition using Arb.
The phase-perturbation oracle in `tools/incumbent_phase_exchange.py` remains
floating discovery; its kernel integrals and optimizer output are not certificates.
`Grothe/Upper/CubicPhaseScreen.lean`
adds ten public results checking the two positive triangle polynomials, the
complex-phase modulus comparison, a degree-seven scalar polynomial cap, and
the full-score implication from the explicit low-coefficient identity.
These results use only standard axioms, without new native facts. The complete
Gaussian-family application and coefficient extraction remain written analytic
steps. No numerical response integral is certified by these modules. See
[the separator report](CUBIC_PHASE_SEPARATOR_2026-10-23.md).


`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Upper bound.** `Grothe.UpperChaos.fresh_upper_rounder` proves
`IsGrothendieckBound (500000000000000000/355973699864771491)` for the concrete rounding,
given an L² charge-one truncation `X` and component-error inputs, table accuracy and Hardy.
`Grothe.upper_value_lt` shows this is below 1.404598149218 (`Grothe/UpperChaos/PhiBound.lean`).
The older table interface `Grothe.fresh_upper : DirectHyps E EX → IsGrothendieckBound (...)`
remains in `Grothe/Upper/PolynomialBridge.lean`.
The actual rounding is G_T, the smoothing of T = F₀·P₃(φ), P₃(x) = 1 + ix − x²/2 − ix³/6.
It is defined in `Grothe/UpperChaos/Rounder.lean`. Lean proves φ² ≤ 3 (`phiBound`), hence
|P₃(φ)|² = 1 − φ⁴(3 − φ²)/36 ≤ 1 and disk-valuedness of T and G_T. Here E is the actual
energy table of G_T and EX that of X. The kernel is H(t) = Σ E[n,m] p(t)ⁿ(−τ(t))ᵐ with the preprocessors
p(t) = t·P(t²) (`pList`, degree 41) and −τ(t) = t·Q(t²) (`qList`, degree 15), both of Wiener norm ≤ 1 and Q(0) = 0, so
that both are realised by tensor powers (`Grothe/Upper/Realise.lean`); they do not enter the
energies, and are chosen to make the kernel nearly linear. The slope is c = 7119483103461/10¹³.

* Proved from scratch: the complex Gaussian Hermite basis on ℂ², completeness, Parseval,
  the L² Mehler formula, charge selection, energy summability and the energies-to-kernel
  identity (`Grothe/UpperChaos/`); measurability, charge one and disk-valuedness of G_T;
  the transfer inequality via tensor powers and its residual form
  K ≤ 1/(c − ‖H − c·t‖); the ℓ¹ contraction and linearity of the kernel composition; that the
  head through degree 501 depends only on energies with n + 3m ≤ 501; the evaluation of the
  head of the stored table of the truncation (21,168 exact dyadic entries) by a sound
  fixed-point interval checker (`GrotheKernel/`, soundness in
  `Grothe/Upper/IntervalSound.lean`); the tail bound by Cauchy–Schwarz from a weighted
  square-sum bound; the assembly of the budgets; and the endpoint arithmetic.
* The selected comparison is proved in `Grothe/UpperChaos/LocalizedComparison.lean`.
  `ComparisonInputs` records an exact shared-coordinate error decomposition,
  total-chaos supports and component L² norm bounds. From the inherited Gaussian
  enclosures at cutoffs 181, 91, 51, these are the smoothed mixed-Taylor errors
  and frozen-vector rounding error. Their identification with the supplied
  approximation and their Gaussian norm enclosures remain external. Lean proves
  `Σ_(p in headIdx 501) w(p) |E(p)-EX(p)| ≤ 13311891/(15625·10⁹)` from them, using
  `2 Σ A_r e_r + (Σ e_r)²`, with `A_r²` enclosing `Σ w(p)² EX(p)` on its band.
  `HeadWeight.lean` proves `w(p)` bounds the retained coefficient mass of each
  preprocessed block; all costs lie in `[0,1]`. Its interval extraction reuses
  the existing sound power and convolution routines. No Gaussian input is added.
  The finite Hermite blocks are identified with the
  actual Gaussian energies in `EnergyBlock.lean`. The native `comparison_check`
  proves all 18 band radii from the stored table and `energyErrQ`, and checks the
  rational comparison budget. Neither a near-linear kernel nor the final head
  residual is assumed by this interface.
* Other explicit inputs: `energy_close`, the stored energies are within
  6847009/(5·10¹⁷) of EX on `headIdx 501` in ℓ¹; and `hardy`, the weighted
  square-sum bound 7/4 at radius 4149/4000 for the kernel of G_T itself.
  The latter uses the inherited Gaussian Schur analysis and the recorded
  65,594-arc directed contour. The concrete theorem also takes X ∈ L² and
  charge-one equivariance. Validity, summability, parity, and the phase cover
  for the actual rounding are derived.
* **Residual ledger.** The total is 455308278509/(5·10¹⁷), approximately
  9.10617·10⁻⁷. The selected comparison contributes 93.56%, the native finite
  head 3.09%, the Hardy tail 3.35%, and the table error about 0.0015%.
  These percentages describe allowances, not fractions of the proof left
  unformalized. The Gaussian component-error inputs remain the main numerical
  limitation. Full scope, source bindings and reproduction commands are in
  `data/localized-comparison/PROOF.md`; `docs/localized-comparison.tex` gives
  the mathematical argument.
* The same weighted head bound forces `h₀ ≥ slopeQ − headResidualQ`.
  `hardy_budget_after_linear` deducts its weighted square from `7/4`;
  exact kernel arithmetic proves tail `30488839/10¹⁵`.
* **Independent replay.** The source computations were replayed on a different machine: the
  nodal table and the Taylor centre arrays were regenerated bit for bit, and the kernel head,
  contour tail, comparison and endpoint pass on the regenerated data (energy table reproduced
  to 1.2·10⁻¹⁶ in ℓ¹ under a different linear-algebra library). This is reproduction, not
  formal verification.

**Unconditional upper bound.** `Grothe.haagerup_bound : IsGrothendieckBound (1404909543/1000000000)`
(`Grothe/Haagerup/Power.lean`), with no hypothesis. The analysis is in
`Grothe/Haagerup/`: tilted one-dimensional Gaussian integrals (`Gauss1D`); the correlated pair integral
E[conj U·V·e^{−u|U|²−v|V|²}] = 2z/Δ² (`GaussG`); the Euler representation |a|⁻¹ = π^{−1/2}∫t^{−1/2}e^{−t|a|²}dt
with its Fubini swap (`Euler`); the Beta integrals J_k and Haagerup's coefficients
(2/π)(k+1)4^k J_k² = (π/4)(1/2)_k²/(k!(k+1)!) (`BetaJ`, `Series`); four real-orthonormal coordinates of the
standard Gaussian are independent standard Gaussians, by characteristic functions (`Law`); the reduction to
two complex Gaussians, the radial identity and the phase rounding as a disk-valued rounding
(`Identity`: `integral_phase_pair`, `Phi2_radial`, `haagerup_disk`, `haagerup_dominated`). Disk-valued
roundings are dominated (`Grothe/Upper/Disk.lean`); polynomial preprocessors are realised by tensor powers
(`Realise.lean`) and composed with radial kernels (`Compose.lean`). The degree-29 preprocessor and degree-64 approximate inverse are
generated from `data/haagerup-resolvent/certificate.json`. The coefficient norm is exactly one;
the fourth-power norm is at most 998903/10⁶. A single sequential native check verifies the complete
1,024-term composition (radial cutoff 29,696), the power norm, inverse defect ≤10⁻¹²,
combined-seed norm ≤249/500, and the infinite signed-tail budget. The normalized residual caps are
95/10⁹ for the finite part and 174/10⁹ for the entire infinite tail.
`Grothe/Upper/ResolventTail.lean` proves the finite inverse-defect estimate, geometric-prefix bound,
Abel summation, coefficient-locality passage to the full suffix, seed power bound and checker
soundness. `Grothe/Upper/PowerTail.lean` supplies the power contraction and coherent-boundary
obstruction. The phase identity, residual and tensor transfer yield K ≤ 1.404909543 with no external
inputs. The single numerical fact is `Grothe.HaagerupPower.check._native.native_decide.ax_1_1`.


**Lower bound.** `Grothe.Lower.lower_bound_data` (V ≤ B for every admissible scalar profile
value under the simultaneous Gaussian reduction `SharedReduction`), `Grothe.Lower.lower_endpoint : 1/B ≤ K → 1401692002039/10^12 < K`, and the transfer
`Grothe.Lower.lower_bound_of_transferL2 : TransferInputsL2 B → IsGrothendieckBound K → 1401692002039/10^12 < K`,
where `TransferInputsL2 B` asks, for every δ > 0, for a finite measure space with an operator T on L²,
a scalar cap ‖⟨f, T g⟩‖ ≤ B over a.e. unimodular f, g, and families u, v in L² with Σₗ|uₗ|² ≤ 1 and
Σₗ|vₗ|² ≤ 1 a.e. and ‖Σ⟨uₗ, T vₗ⟩‖ ≥ 1 − δ.

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
`witnessCap_of_reduction : (∀ unimodular f g with Re⟨f,Tg⟩ ≥ 0, ReductionHyp n f g) → WitnessCap n Bcap`
applies `lower_bound_data` to V = Re⟨f, Tg⟩ (after a phase) with the bound t ≤ 9/10 proved
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
NodeCaps → IsGrothendieckBound K → 1.401697049825 < K` composes everything
through `Grothe/Research/RefinedCoverResult.lean`:
**the only remaining hypothesis of this default-target theorem is `NodeCaps`**, the node caps
Ψ_r(r_k) − 10⁻¹¹ ≤ c_k of the 19 certified potentials (exact-arithmetic certificates outside Lean).

The separate `GrotheCaps` target supplies `lower_bound_of_capsRest :
CapsRest → IsGrothendieckBound K → Llow < K` (`CapNodes.lean`). It assembles 60 single-threaded
native range checks for 15 rows, while the chord nodes follow from vertex caps by convexity
(`CapHull.lean`, `capChords_check`). `CapsRest` comprises the vertex caps of rows
0.84, 0.845, 0.85, 0.855 and any excluded-node caps of the other rows; the exclusion lists
are currently empty. This heavy target is not built by default CI. Its source stamp is
checked separately by `scripts/caps_stamp.py`. The recorded stamp verifies all 60
range facts on the droplet and matches this branch's unchanged 140-file closure.
The four remaining rows still require `CapsRest`.

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
  The refined partition of [0, 9/10] × [0, ρ] × [0, 31/4] has 10,762 closed boxes.
  It retains the existing certified node potentials and their valid ranges, and adds two
  pure-row law-scale nodes for row 14 using the original unshifted source table and Stein cuts.
  Their one appended batch passes `LawNodeCheck.certLawNodes`. Adaptive binary
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
* Inputs of the intermediate theorem `lower_bound_data` (all of them are now derived in Lean, except the node caps `NodeCaps`, by the chain ending in `lower_bound_of_refined_cover_data`): the crude row V ≤ t² + ερ² − ε‖Qh‖² (`hcrude`; on paper it follows
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
  `Grothe.LowerAnalytic.lower_bound_gaussian` instantiates `lower_bound_data` with this law and
  discharges E U = 1, the integrability conditions, E U² ≥ 2, the cap E U² ≤ 62 ≤ 2 + (31/4)²
  (`gaussian_radU_cap`: E F⁴ ≤ 93 (E F²)² for every real third-chaos F, applied to a, b, a ± b),
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
  contraction); `Circular.chaos3_right` shows that b is a cubic chaos when a is. The remaining inputs of
  `lower_bound_gaussian` (the gate variable, the per-row reduction `RowShared`, the crude row) are discharged by
  `reductionHyp_of_nodeCaps` (`Reduction.lean`) from the node caps alone.
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
| `GaussC2`, `HermiteC2`, `HermiteC2Basis`, `LawY`, `MehlerL2`, `Energy2`, `Kernel2` | two coordinates: ℂ² as ℝ⁴, tensor Hermite basis, law of ρX + √(1−\|ρ\|²)W, Mehler for L² functions, chaos energies by bidegree, the physical kernel of a charge-one function |
| `Realise2`, `Structural` | two-channel rounding with tensor-realised preprocessors (`rounding_diskKernel`); the structural fields (validity, summability, parity) as theorems |
| `TaylorPhase`, `Rounder` | \|P₃(x)\|² = 1 − x⁴(3 − x²)/36; the concrete rounding G_T from `Grothe/Upper/Data.lean` |
| `PhiHorner`, `PhiDense`, `PhiCover`, `PhiCoverData`, `PhiCoverCheck`, `PhiBound` | φ² ≤ 3 everywhere: bisection-tree cover (`phi_cover_check`), analytic far field, `phiBound`, headline `fresh_upper_rounder` |
| `EnergyBlock`, `LocalizedComparison` | actual Gaussian energies of error blocks; the selected-spectrum comparison |
| `HardyKernel` | definitions for the Hardy-tail proof (holomorphic Gaussian kernel; issue #18) |

**`Grothe/LowerAnalytic/Cap*`: the node caps**

| modules | content |
|---|---|
| `CapCoord`, `CapLinAlg`, `CapMajorant`, `CapPolar` | real coordinates of the fibre variable; exact quadratic-form checks (Loewner bound, LDLᵀ); the anchored-pair majorant of \|L + p\| + \|L − p\|; polar cells of the complex Gaussian |
| `CapSym`, `CapGrid`, `CapGridT`, `CapGridOK`, `CapTables`, `CapTablesMk` | symbolic polynomials over ℚ(√2); cell prices on uniform polar grids and the exact cell decomposition of the integrated majorant; verified interval tables (`tablesOK_mk`) |
| `CapPiece`, `CapCheckSound` | node certificate soundness (`pot_le_of_pieceOK`, `pot_le_of_nodeOK`) for the precompiled checker `GrotheKernel/CapCheck.lean` |
| `CapSymmetry`, `CapHull`, `CapChordData` | the symmetries S_c, S_- of the fibre integral; chord nodes from vertex caps by convexity (`capChords_check`, `nodeCaps_of_vertexCaps`) |
| `CapRecipeData`, `CapRows`, `CapRow00`–`CapRow18`, `CapNodes` | recipes (generated from `data/cap-recipes/`); `rangeOK` and its soundness; 60 range facts `capRangeKK_j` (target `GrotheCaps`, not built by CI; stamp `docs/CAPS_VERIFIED.txt`); `lower_bound_of_capsRest` |
| `CapCover`, `CapConstr`, `CapPieceNodes` | localised caps of rows 12–15 (route M): coverage by constrained pieces up to S_c, S_-; the S-lemma bound on a piece; piece-node checks (issue #12) |

**`Grothe/Lower/Cert/`: the original lower certificate in 13 single-threaded chunks.** `Rows0`–`Rows4`, `Batches0`–`Batches2`,
`Boxes0`–`Boxes3` and `Partition` each hold one `native_decide` fact (`certRowsK`, `certBatchesK`, `certBoxesK`,
`certPartition`); `Parts` holds the shared definitions; `Grothe/Lower/RowCheck.lean` assembles them into `cert_check`.
The active refined endpoint uses the eight original row/batch facts, one law-node
fact and five refined-cover facts (14 native inputs). The original cover remains
in the default development; the complete registry has 25 native facts outside
the separate 60 cap-range facts. There are 493 axiom-report entries.

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus the `native_decide` facts pinned in
`data/axioms/native.txt` (read by `scripts/check_axioms.py`): `Grothe.head_check` (the upper head),
`Grothe.Upper.comparison_check` (the selected-band masses and comparison budget),
`Grothe.HaagerupPower.check` (the finite residual, power norm, inverse defect, combined seed and signed tail of the unconditional upper bound),
`Grothe.ScalarTailRefinement.power_check` (the scalar sixteenth-power norm), `Grothe.UpperChaos.phi_cover_check`
(φ² ≤ 3), `Grothe.LowerAnalytic.capChords_check` (the cap-table chord nodes),
and the 13 chunks `Grothe.Lower.certRows0`–`4`,
`certBatches0`–`2`, `certBoxes0`–`3`, `certPartition` of the lower certificate (assembled into
`Grothe.Lower.cert_check`). The refined cover additionally has four box checks `certRefinedBoxes0`–`3`
and `certRefinedPartition` in `Grothe.Research.RefinedLowerCheck`, together with
`Grothe.Research.LawNodeCheck.certLawNodes` for the added pure-row batch.
The separate caps target additionally uses 60 range checks
`capRangeKK_j`. Every native check is single-threaded (no `Task.spawn`). All
other finite computations (the polynomial norms, the moment covers) are kernel-checked
(`decide +kernel`). The report is `lake env lean scratch/Axioms.lean`, checked in CI;
the separate caps report is `scratch/AxiomsCaps.lean`. The generic response, cubic-ceiling
and quintic-transfer lemmas add no native facts or endpoint hypotheses. No `sorry`,
no warnings.

**Coupled-image and chord arithmetic.** `Grothe/Research/CoupledMajorizer.lean`
proves seven public facts: a zero-safe complex Young modulus majorizer and its
exact-price form, a common two-image update with opposite signs, finite
weighted assembly, diagonal square completion, finite descent and strict
descent. `Grothe/Research/SemiconvexChord.lean` proves six public facts: lifted
chord correction, the profile square identity, same-second-moment expectation
assembly, gate reassembly, mesh allowance and its checked rational value.
All 13 declarations are imported by `Grothe.lean`, printed in
`scratch/Axioms.lean` and required by `scripts/check_axioms.py`; the targeted
report can be checked with `--research`. They use only `propext`,
`Classical.choice`, `Quot.sound`, with no additional native facts. They do not
prove Gaussian curvature, response extraction, a saddle exchange or an
all-dimensional cover. No endpoint or endpoint hypothesis is changed.
See [RESEARCH_AUDIT.md](RESEARCH_AUDIT.md) for the external proof and replay scope.



**Joint sixth-moment budgets (formalized).** `Grothe/LowerAnalytic/JointSixth.lean`
proves the two parameterized bounds J2/J3 for every genuine circular cubic, including the
normalization of the real cubic kernel and its five complex contraction invariants.
`Grothe/Lower/Reserve.lean` accepts a signed linear reserve against those same invariants;
`Grothe/LowerAnalytic/JointBudget.lean` proves `joint_sixth_budget`, combining the finite
reserve certificate and J3 with the actual spectral quantities of the cubic on a checked
kurtosis range. These proofs use only the standard logical axioms. They do not add a
hypothesis to the headline lower theorem. The bank's 41 original joint-moment nodes are verified through the integrated
`JointData`/`jointCert` checker and `Circular.joint_sixth` analytic bridge in
`JointContractions.lean`. The 306 original spectral witnesses, 45 inherited Stein witnesses,
two new pure-row Stein witnesses and three new mixed-source Young witnesses
are combined in a 10,762-box cover. No extra hypothesis is added to `NodeCaps`.

`JointSixth.gram_j_eta` retains both bounds on the negative cumulant contraction;
`gram_j2_shifted` improves the h₀ coefficient from 198+150/α to
198+150/(α+4/15) for α≥12/55. `joint_eta_budget` connects this family to the
same reserved Gram checker and actual spectral quantities, deriving the moment
bound internally. `Grothe/Lower/MomentLift.lean` proves the pointwise transport
and exact normalized price change −d C₆ x³ when the moment-cut weight increases
by d. An increased weight still requires an accepted budget certificate.

`Grothe/LowerAnalytic/MomentCone.lean` gives a homogeneous convex recipe for the
moment cost: two PSD2 determinant tests and three linear inequalities. It proves
both the actual cubic moment bound and soundness of an exact rational checker,
including node range and positive-multiplier checks. The moment parameters can
therefore be optimized jointly with the contraction-Gram budget, rather than
searched on an outer grid. This is a sufficient certificate cone, not an exact
characterization of actual response laws. Its two concrete check examples are
proved by kernel arithmetic; no native axiom is added.


`Grothe/LowerAnalytic/MomentConeBoundary.lean` proves the exact scalar optimum
inside this sufficient cone. For positive moment weight w and positive s-cost A,
the least h-cost B is

- 11781w/32 + 18225w²/(4A) when 11A ≤ 360w;
- 198w + 22500w²/(A+40w) when 11A ≥ 360w.

The two formulas agree at the boundary. `Feasible.boundary_lower` proves necessity;
`boundary_attained` gives explicit positive-diagonal feasible points achieving it.
The first branch recovers J3, and the second is the shifted family. Thus searching
the eta/beta parameters cannot improve on this envelope. This optimality concerns
the moment-cost recipe; genuine response feasibility remains a stronger condition.

`boundary_moment` and `boundary_node` connect the optimized boundary directly to
the actual circular cubic and to a moment correction on a checked node range.

`exists_feasible_iff` identifies the boundary epigraph exactly with projection of
the positive-diagonal cost cone. `boundaryCheck` is a three-rational exact checker;
`boundaryChecked_node` proves soundness for the actual circular cubic, including
the positive-multiplier and kurtosis-range conditions. The four auxiliary conic
variables need not be retained in a moment-cost certificate.

**Reproducible law-scale extension.** `data/lower-unshifted/` contains the original
source snapshots, two pure-row and three mixed-source law certificates, and the complete
10,762-box cover. `tools/needle_fused_global.py --verify` replays its 241 binary
splits and 280 same-domain repricings from the immutable 10,521-box baseline.
The original node/group prefix is pinned. Added source references name existing
Stein or zero nodes; they introduce no new source cap.

`tools/needle_mixed_nodes.py` checks each mixed source, its Gram/Young budget,
kurtosis range and whole-half-line majorant. No historical fusion or LP file is
an acceptance input. The generator `tools/needle_unshifted_lean.py` independently
checks every law certificate, the original canonical reference map, every final
box and the guillotine partition. `--check` reproduces `LawNodeData.lean` and
`RefinedCoverData.lean` byte for byte. The original pure-row batch stays at index
21; the three mixed nodes form batch 22. No checker-core or heavy cap source changes.
