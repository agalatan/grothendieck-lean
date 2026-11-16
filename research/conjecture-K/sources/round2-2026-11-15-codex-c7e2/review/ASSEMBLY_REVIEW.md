<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/review/ASSEMBLY_REVIEW.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/review/ASSEMBLY_REVIEW.md -->
# Independent review of the full-cubic near-Gaussian assembly

Reviewed the final absolute-fourth-excess version of `../FULL_NEAR_GAUSSIAN_K.md`, together with the projection, raw-content, uniform-Hessian, fractional-Taylor, and explicit smooth-Edgeworth arguments. Review date:15 November2026. This is a mathematical review, not a Lean formalization or an independently evaluated numerical threshold.

## Verdict

No blocking gap found. On every bounded energy range U≤M, the argument proves strict same-total-variance Gaussian domination for the **whole** H₂,₁ cubic whenever its **absolute** fourth excess Δ(G) is below a positive, dimension-independent threshold. The statement is uniform over a compact set of strictly positive profiles. The radial penalty reduction gives raw Conjecture K in a normalized fourth-excess cone at every amplitude, uniformly over prices p≥p₀>0.

It does not establish full K at arbitrary fourth excess. The final threshold has not been numerically assembled. The proof no longer depends on the2025 total-variation Edgeworth theorem or a sixth-moment bound: the new smooth expansion has an explicit remainder proved from Gaussian calculus and a finite tensor-matching argument.

## Checks

1. **Projection bounds.** Independently derived in `PROJECTION_AND_COMPACTNESS.md`: V≤(√3/2)√Δ and δ(q)≤(5/2)Δ. The final theorem uses these absolute bounds directly; it requires neither u>0 nor a normalized remote-kurtosis cutoff.

2. **Remote coefficient.** The explicit smooth expansion has leading correction δB''(u)/4 and error at most C_Rδ^(3/2). Jensen applied to the Gaussian mixing variance gives −B''(u)/4≥2d with d=√π/[32(max E|L|²+M)^(3/2)]. At δ≤δ_R=[d/(C_R+1)]² the error is below dδ, so the deficit is at least dδ. This is valid down to u=0; if q=0 both sides vanish. The explicit Γ₅ expansion and its constants were independently reviewed in `SMOOTH_EDGEWORTH_REVIEW.md`.

3. **First variation.** Visible parity kills Q,P,ν. The A/B contents obey squared bounds K_Aδ^(3/2), K_Bδ^(3/2), by the reviewed real resolvent and circular averaging. Cauchy–Schwarz gives exactly 2√(K_A+K_B)δ^(3/4)√V. The B angular identity uses conjugate phase; its rotation factor and normalization were checked independently.

4. **Uniform Hessian.** The mixed-contraction identity and carré-du-champ expansion imply asymptotic independence of the remote Gaussian limit from the finite vector of normalized linear/quadratic coefficient fields. Their own limit may be non-Gaussian. The conditional Stein argument handles this correctly. The bounded planar density of L±q and hypercontractivity provide the stated uniform integrability of singular Hessians. At u→0, q→0 in L²; the limit is the positive zero-buffer matrix. Compactness of profiles with a,b>0 makes its minimum, and the corresponding minima at all u∈[0,M], strictly positive.

   The subsequently added quantitative §8 was also checked. Visible integration expresses each Hessian matrix coefficient as the convolution of D²|·| with a polynomial-weighted Schwartz pushforward density. Transferring derivatives to that density gives bounded first and second shift derivatives. The partial Gaussian OU resolvent, with the coefficient vector held fixed, and the exact componentwise third-chaos integration-by-parts identity give a Hessian error bounded by C[δ^(1/4)+δ^(1/2)]V. The derivative estimates do not divide by the Gaussian variance, so the same argument is valid at zero variance. This supplies a direct alternative to the compactness proof; the derivative constants have not been numerically evaluated.

5. **Cutoff convention.** The final main proof consistently uses absolute δ(q) cutoffs. The Hessian cutoff δ_H is chosen with strict slack, allowing the displayed closed condition δ(q)≤δ_H. No conversion through u or χ(q) remains.

6. **Finite-amplitude remainder.** The separate Taylor proof gives a paired remainder at most 430(min a)^(−3/2)V^(5/4). Its pointwise interpolation, weighted-density constants, orthonormal visible basis, and vector hypercontractivity were independently checked. Arbitrary sharing between q and the coefficient fields is permitted.

7. **Matching the total variance.** The price used by the Hessian theorem is B'(u), not the final fixed p. The inverse mixing moments E R⁻¹=a⁻² and E R⁻²=a⁻⁴(1+4b/a) imply the stated uniform bound on |B''| even at zero. Thus B(u)+B'(u)V−B(u+V)≤JV²/2. This repairs the sign problem that would arise from imposing p≥B'(u) below the optimal Gaussian variance.

8. **Absorption and final absolute threshold.** Young's inequality with coefficient κ/8 gives 2√Cδ^(3/4)√V≤κV/8+(8C/κ)δ^(3/2). At δ≤δ₀=[dκ/(16(C+1))]², the latter coefficient is at most dδ/2. The chosen V₀ spends another κV/8 on both Taylor errors. The resulting inequality is exactly F(G)−B(U)≤−dδ/2−κV/4. Equation(14) is correct: Δ_*≤(2V₀/√3)² ensures V≤V₀, while Δ_*≤2min(δ₀,δ_R,δ_H)/5 ensures all three remote cutoffs. When q=0, δ=0 and the strict visible loss remains. For nonzero remote q its fourth excess is positive, so every nonzero finite cubic satisfying the theorem has a strict loss.

9. **All amplitudes.** The paired norm is 2-Lipschitz along a unit L² ray. For s≥t≥1/p, Λ_p(sH)−Λ_p(tH)≤(s−t)[2−p(s+t)]≤0. Rescaling to min(s,1/p) preserves normalized fourth excess and puts the energy below M=p₀⁻². Setting χ_*=Δ_*/M² then gives Δ=χU²≤Δ_* after rescaling. This proves the all-amplitude corollary; it does not extend same-variance domination itself beyond the energy range used in the first theorem.

10. **Original profile box and zero optimizer.** Its a,b ranges lie in a compact subset of a,b>0, and p≥25/19. The proof never assumes an interior Gaussian optimizer; the corner with optimizer zero is therefore included. Extending the same strict-visible-cost proof to b=0 would be invalid, because the tangential Q cost then vanishes.

## Interpretation

The theorem excludes counterexample sequences whose normalized total fourth excess tends to zero, including sequences in growing dimension with arbitrary shared visible-sector drivers. This is stronger than the earlier fixed-block local theorem and remote-only cone. It leaves a genuine non-Gaussian range; the compactness and influence observations do not turn that range into a bounded-dimensional optimization or prove the global conjecture.
