# Lean development: detailed inventory

This file lists, module by module, what the Lean development proves and which inputs enter as data. The short version is in [README.md](../README.md); the mathematics is explained in [OVERVIEW.pdf](../OVERVIEW.pdf).


`IsGrothendieckBound K` (`Grothe/Transfer.lean`) states V(A) ≤ K · C(A) for every finite
complex matrix, with V taken over all finite-dimensional complex Hilbert spaces.

**Upper bound.** `Grothe.fresh_upper : DirectHyps E EX → IsGrothendieckBound (438936500000000000000000/312499512981434072227643)`,
and `Grothe.upper_value_lt` shows this is below 1.404598989011 (`Grothe/Upper/PolynomialBridge.lean`).
Here E and EX are the energy tables of the rounding T = F₀·P₃(φ), P₃(x) = 1 + ix − x²/2 − ix³/6
(disk-valued, since |P₃(x)|² = 1 − x⁴(3 − x²)/36 ≤ 1 for |φ| < 1), and of its polynomial
truncation X = F₀ + v.

* Proved from scratch: the transfer inequality via tensor powers and its residual form
  K ≤ 1/(c − ‖H − c·t‖); the ℓ¹ contraction and linearity of the kernel composition; that the
  head through degree 501 depends only on energies with n + 3m ≤ 501; the evaluation of the
  head of the stored table of the truncation (21,168 exact dyadic entries) by a sound
  fixed-point interval checker (`GrotheKernel/`, soundness in
  `Grothe/Upper/IntervalSound.lean`); the tail bound by Cauchy–Schwarz from a weighted
  square-sum bound; the assembly of the budgets; and the endpoint arithmetic.
* Explicit hypotheses (fields of `DirectHyps E EX`, not formalized): `valid` (the kernel of E is
  the dominated correlation kernel of the smoothed rounding T); `summable`, `summableX`,
  `parityX` (summability of both tables, odd total degrees of EX); `compare`:
  Σ|E − EX| ≤ 1065637497/10¹⁵ (the energy-difference / mixed-cutoff inequality applied directly
  to T − X with Hermite cutoffs 181, 91, 51, the bound |φ| < 1, a Bargmann Hilbert–Schmidt
  estimate, directed coefficient enclosures and the exact norm ‖v‖ < 1/100; the source value is
  1.06563749615·10⁻⁶; archived with its scripts in the research folder
  `handoff/research-third-decimal/upper-polynomial-bridge-20261022/`); `energy_close`: the
  stored energies are within 6847009/(5·10¹⁷) of EX in ℓ¹; `hardy`: the weighted square-sum
  bound 7/4 at radius 4149/4000 for the kernel of T itself (a Gaussian weighted Schur estimate
  valid for every bounded rounding, plus a 65,580-arc contour certificate with mean 1.72879),
  which Lean turns into the tail bound 36748/10¹² beyond degree 501.
* **How much rests on these hypotheses.** Of the total residual 554771095509/(5·10¹⁷)
  ≈ 1.10954·10⁻⁶, the assumed comparison bound 1065637497/10¹⁵ is 96.04%, the tail from
  `hardy` (36748/10¹²) 3.31%, the computation verified in Lean (headCapQ = 7143/10¹²) 0.64%,
  and the assumed energy-table error 6847009/(5·10¹⁷) 0.001%. The source's bound on |φ| is
  0.99999963 against the required 1. The bound therefore depends almost entirely on the
  external analysis behind the comparison hypothesis.
* **Independent replay.** The source computations were replayed on a different machine: the
  nodal table and the Taylor centre arrays were regenerated bit for bit, and the kernel head,
  contour tail, comparison and endpoint pass on the regenerated data (energy table reproduced
  to 1.2·10⁻¹⁶ in ℓ¹ under a different linear-algebra library). This is reproduction, not
  formal verification.

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
`lower_bound_of_nodeCaps : NodeCaps → IsGrothendieckBound K → Llow < K` composes everything:
**the only remaining hypothesis of the lower bound is `NodeCaps`**, the node caps
Ψ_r(r_k) − 10⁻¹¹ ≤ c_k of the 19 certified potentials (exact-arithmetic certificates outside Lean).

* Proved: positivity certificates in integer arithmetic; the pinned gate price of every row
  (trailing gate block positive definite, κδ² ≤ δ + gatePrice); the Stein cuts (summed, spectral and general spectral) from their analytic inputs, by completions of squares,
  and their polynomial pieces; the majorant sweeps over 9,237 nodes; the moment-rectangle
  covers; the integration against the law of |q|²; the chords in σ; the bound of every row
  from its Gaussian reduction; the mixtures of rows (the retained gate square mixes by an exact
  identity); the common-law certificate: 19 batches of 336 joint node certificates for mixed
  potentials of rows 0.84–0.855 (4 inherited batches/60 nodes with Stein cuts, 15 batches/276 nodes
  with one spectral cut each on 74-, 90- and 161-knot test meshes, 140 of them with ν > 0, i.e. using
  the covariance order, and 65 citing a contraction-Gram certificate: the exact node checker verifies
  identity (4) of the certificate coefficientwise, positivity of the two 2×2 matrices by diagonal and
  determinant, and the nonnegative remainders), and the partition of
  [0, 9/10] × [0, ρ] × [0, 31/4] into 7,939 closed boxes certified by 7,874 axis cuts (241 cap boxes:
  fixed mixtures of two certified row caps including the crude row; 1,072 boxes with one component
  and 6,562 mixing two, a component being a row or a mixture of two rows with four certified
  τ-nodes, chorded twice in τ, pinned gate price X₁ = p);
  and the endpoint; the Gaussian witness on L²(γ_n) with its value on z/‖z‖, the orthogonality of the
  chaos ranges, the polarisation identity of the scalar pairing, the bound ‖P₁,₀h‖ ≤ √π/2 for |h| ≤ 1
  (rotation invariance of the Gaussian measure, E√(x²+y²) = √(π/2)) and the transfer inputs from the
  scalar caps. All finite exact checks of the lower certificate are one `native_decide` (`cert_check`).
* Inputs of the intermediate theorem `lower_bound_data` (all of them are now derived in Lean, except the node caps `NodeCaps`, by the chain ending in `lower_bound_of_nodeCaps`): the crude row V ≤ t² + ερ² − ε‖Qh‖² (`hcrude`; on paper it follows
  from ‖Qk‖ ≤ E|Qk/‖Qk‖| ≤ ρ, which uses the moment bounds also for the cubic Qk/‖Qk‖), with ‖v‖² = 2
  and 0 ≤ t ≤ 9/10; the simultaneous Gaussian reduction of the rows (`SharedReduction`): one residual p = Q_w c₁ with scale τ = ‖p‖₂ ≤ ρ and normalised law
  U = |p|²/τ² satisfying the moment bounds and the Stein inputs, one gate variable
  X = Q_w(c₁, c_A, conj c_B) with X₁ = p, and for every row its potential Ψ_r with the row inequality
  retaining the gate square, V ≤ t² − 2ℓt + 2β²/ε + E Ψ_r(δ_r τ√U) − δ_r τ² − E[X*N_r X + 2Re(conj p (g_r·X))] − ε‖Qh + βv/ε‖²; the node caps, convexity and Lipschitz bound of each potential (exact-arithmetic
  certificates outside Lean: interval integration of Young-type price bounds, and, on the rows
  near the maximum, anchored quadratic bounds and, on s ∈ [0.2, 0.4) ∪ [0.525, 0.6) of rows 0.84–0.855, localised anchored bounds
  (regions in the odd fibre directions, one S-lemma quadratic each, replayed in exact arithmetic), with the convex hull of
  the cap table; slack 10⁻¹¹); the moment bounds on the law of U = |q|²; the analytic
  inputs of the Stein cuts for that law. In the headline theorem `lower_bound_of_nodeCaps` all of these
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

Axioms: `propext`, `Classical.choice`, `Quot.sound`, plus exactly two `native_decide` facts:
`Grothe.head_check` (the upper head) and `Grothe.Lower.cert_check` (the lower certificate). All
other finite computations (the polynomial norms, the moment covers) are kernel-checked
(`decide +kernel`). The report is `lake env lean scratch/Axioms.lean`, checked in CI. No `sorry`,
no warnings.



**Joint sixth-moment budgets (formalized).** `Grothe/LowerAnalytic/JointSixth.lean`
proves the two parameterized bounds J2/J3 for every genuine circular cubic, including the
normalization of the real cubic kernel and its five complex contraction invariants.
`Grothe/Lower/Reserve.lean` accepts a signed linear reserve against those same invariants;
`Grothe/LowerAnalytic/JointBudget.lean` proves `joint_sixth_budget`, combining the finite
reserve certificate and J3 with the actual spectral quantities of the cubic on a checked
kurtosis range. These proofs use only the standard logical axioms. They do not add a
hypothesis to the headline lower theorem. The present endpoint uses a refined cover of
7,939 boxes with the existing 276 spectral witnesses; the stronger external joint-moment
certificate still needs its complete finite-checker and cover integration.
