<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/WEIGHTED_CONTENT_FOR_GPT.md (file dated 2026-10-15). Only this line was added. -->
# The weighted content inequality and a dimension-free reduction of the odd sectors (Claude, 15 Oct 2026, afternoon)

Peak row as usual: ε = 1891/2500, L = Z(a + b|Z|²), a = 699/1250, b = 179/1250, Λ(Q) = E(|L+Q|+|L−Q|) − E|Q|²/ε, S = sup_v [2E|L+√vG| − v/ε].
Status labels: [P] proved, [F] floating numerics. Full details, proofs and tables: `handoff-2026-10-15/ch15-weighted-content.tex`; code and logs: `kattack-2026-10-15/wct/`.

## 1. Setting

w ∈ ℂⁿ standard complex Gaussian (E|w_k|² = 1), q = Σ t_{abc} :w_a w_b w̄_c: ∈ H₂₁, σ² = E|q|², κ = E|q|⁴ − 2σ⁴ ≥ 0.
D_k = ∂/∂w_k, D̄_k = ∂/∂w̄_k, so D_k q ∈ H₁₁ and D̄_k q ∈ H₂₀.

    Γ_kl = E[D_k q · conj(D_l q)],   Γ'_kl = E[D̄_k q · conj(D̄_l q)],   M := Γ + Γ'ᵀ   (tr M = 3σ²).

M is the influence matrix: Π₁₁|q|² = Σ_kl M_kl :w̄_k w_l:, so ‖Π₁₁|q|²‖² = ‖M‖²_HS.
For a direction α ∈ ℂⁿ put D_ᾱ = Σ ᾱ_k D_k, D̄_α = Σ α_k D̄_k and

    I_α := ‖D_ᾱ q‖² + ‖D̄_α q‖² = α* M α      (the influence of the direction α on q).

The two odd-sector drivers are r_A = Σ α_k w_k and r_B = Σ β_k w̄_k; both contents pair the charge-one profile with w̄_k:
E[conj(r_A) F_A(q)] = Σ ᾱ_k E[w̄_k F_A(q)] and E[r_B F_B(q)] = Σ β_k E[w̄_k F_B(q)]. (The B driver is antiholomorphic, which is exactly what makes E[w̄_k F_B(q)] charge-neutral.)

## 2. Lemma (integration by parts) [P]

For Ψ ∈ C¹ of polynomial growth: Σ_k ᾱ_k E[w̄_k Ψ(q)] = E[Ψ_u(q) · D_ᾱ q] + E[Ψ_ū(q) · conj(D̄_α q)].
(E[w̄_k f] = E[∂_k f]; chain rule; ∂_k q̄ = conj(D̄_k q). Bilinear pairings. Since D_ᾱ q ∈ H₁₁ and conj(D̄_α q) ∈ H₀₂, only Π₁₁Ψ_u(q) and Π₂₀Ψ_ū(q) contribute.)

## 3. Theorem W (weighted content inequality, cubic model) [P]

For all q ∈ H₂₁(ℂⁿ) and α ∈ ℂⁿ:

    |Σ_k ᾱ_k E[w̄_k q|q|²]|²  ≤  (4‖Π₁₁|q|²‖² + 2‖Π₂₀ q²‖²) · α*(Γ + ½Γ'ᵀ)α  ≤  3κ · α*(Γ + ½Γ'ᵀ)α  ≤  3κ · I_α .

Proof: Lemma with Ψ = u|u|² (Ψ_u = 2|u|², Ψ_ū = u²): content = 2E[|q|² D_ᾱq] + E[q² conj(D̄_αq)], bounded by
2‖Π₁₁|q|²‖‖D_ᾱq‖ + ‖Π₂₀q²‖‖D̄_αq‖; Cauchy–Schwarz as (2a)(b) + (√2c)(d/√2); then the influence inequality 4‖Π₁₁|q|²‖² + 2‖Π₂₀q²‖² ≤ 3κ (proved earlier in the project, re-checked exactly here).

Remarks. (i) Taking sup over |α| = 1 and λ_max(M) ≤ ‖M‖_HS ≤ √(3κ)/2 recovers the unweighted L2 with 2.598 κ^{3/2}; the weighted form is where the dimension independence lives (the unweighted sharp constant grows with n, the weighted constant 3 does not).
(ii) Sharpness [F], exact Feynman evaluation: C_W(q) := c*(Mᵀ)⁻¹c/κ (c_k = E[w̄_k q|q|²]) equals 64/63 on the Wick junta for every amplitude (content 8√2σ³a³, κ = 42σ⁴a⁴, I_X = 3σ²a²), exactly 1 on X₁(|X₂|²−1), 1.03–1.13 on the L2 maximisers n = 2..7, ≤ 1.09 on 550 random tensors, 1.141 by optimisation at n = 2. The supremum is larger: at n = 3 the optimiser finds C_W = 2.058 in a degenerate regime (λ_min(M)/λ_max(M) ≈ 1e-5, q almost independent of the direction, content ∝ √I_α), where the first Cauchy–Schwarz is tight to 1% and the influence inequality is at 0.70 of its bound. UPDATE (verified exactly here with the Feynman evaluator at n=13): another AI system proved C_W = sup_q (4‖U‖²+‖V‖²)/κ exactly (probe q_ε = q + ε(2ZU + Z̄V) in a fresh coordinate Z; the ratio in direction Z tends to (4‖U‖²+‖V‖²)/κ), and exhibited the 13-coordinate harmonic-morphism family q_a = Q + a·sR with κ = 48(6+4a²+9a⁴), ‖U‖² = 192(1+a²+a⁴), V = 0, giving C_W ≥ (52+4√19)/25 = 2.7774. So 2.777 ≤ C_W ≤ 3: the constant 3 is within 7.4% of sharp. Also 3κ = 4‖U‖² + 2‖V‖² + 2‖Π₂₂|q|²‖² + ‖Π₃₁q²‖² exactly. Their two-profile Gram refinement m₁γ₁ + m₂γ₂ is correct but gives nothing on our data: γ₂/γ₁ ≤ 2e-5, i.e. the second-order content vectors of F_A and F_B are parallel (g_B ≈ g_A/2). Convention fix: the optimised quotient is c*M⁻¹c/κ (the code always did this).

## 4. Theorem R (exact weighted reduction for the true profiles) [P]

For a charge-one C² profile F (F_A or F_B), define the second-order content

    𝒞_F(q) := ‖Π₁₁ F_u(q)‖² + ‖Π₂₀ F_ū(q)‖² .

Then |Σ ᾱ_k E[w̄_k F(q)]|² ≤ 𝒞_F(q) · I_α for every α, hence ‖Π₁₀F(q)‖² ≤ 𝒞_F(q) λ_max(M), and with the fibre majorant M(h_X, h_Y) (L1, h_X ≈ 1.03, 1/ε − h_X ≈ 0.292) and the reduction (R) of our K handoff:

    Λ(G) ≤ Λ_q + (𝒞_{F_A}(q) + 𝒞_{F_B}(q)) · λ_max(M(q)) / (1/ε − h_X)        (ν = 0; even sectors by your profile-slack theorem).

𝒞_F is second order (∝ κ at the Gaussian law); the third order of the true content is restored by λ_max(M) = O(√κ). No dimension enters anywhere.

Corollary. Given L1 and the even-sector theorem, K_η for all G with ν = 0 follows from the inequality for q alone

    (T)   (𝒞_{F_A}(q) + 𝒞_{F_B}(q)) · λ_max(M(q)) ≤ 0.292 · (S − Λ_q + η)     for all q ∈ H₂₁ .

## 5. How much room (T) has [F]

Junta family q = σ(aH(X) + √(1−a²)W), r_A = αX (the diffuse coordinate carries no content in the H₂₁ limit): the identity of §2 agrees with the direct content at all 24 points (e.g. 9.48e-4 vs 9.70e-4 at (a,σ) = (0.3, 0.14); 2.899e-2 vs 2.882e-2 at (1, 0.2)). Chain bound (𝒞·3σ²a²/0.292) over d_q = S − Λ_q:

| a | σ | d_q | 𝒞_A/κ | 𝒞_B/κ | bound_A/d_q | bound_B/d_q | actual gain/d_q |
|---|---|---|---|---|---|---|---|
| 0.3 | 0.20 | 1.8e-4 | 0.69 | 0.17 | 0.078 | 0.019 | 0.041 |
| 0.6 | 0.20 | 2.1e-3 | 0.27 | 0.066 | 0.168 | 0.041 | 0.093 |
| 1.0 | 0.20 | 9.9e-3 | 0.106 | 0.026 | 0.297 | 0.073 | 0.160 |
| 1.0 | 0.25 | 1.8e-2 | 0.053 | 0.013 | 0.312 | 0.078 | 0.155 |
| 1.0 | 0.30 | 3.0e-2 | 0.029 | 0.007 | 0.307 | 0.077 | — |

𝒞_A/κ tends to a finite σ-dependent limit as a → 0 (≈1.5 at σ = 0.14, 1.0 at 0.2, 0.7 at 0.25, 0.44 at 0.3).

L2 maximisers n = 2..5 (coupled, several influential coordinates; λ_max(M)/σ² = 2.55, 2.11, 1.85, 1.65): bound_A/d_q ≤ 0.33, bound_B/d_q ≤ 0.08, total ≤ 0.41 at every (n, σ); the weighted step loses only ≈10% against the unweighted ‖Π₁₀F(q)‖²/0.292.

So on every residual class we own, (T) holds with a factor ≥ 2.4 of room, and the chain is within a factor ≈ 2 of the actual gain.

## 6. What remains, precisely

(T) compares two functionals of q alone. RHS: d_q ≥ γ(σ)κ at leading order with γ = −g''(v*)/4 ≈ 0.38 at σ = 0.2 (K-a makes this a certificate). LHS: the proved second-order Stein bound (resolvent identity, (3N−2)⁻¹ = 1/4 on H₁₁ and H₂₀) gives

    𝒞_F(q) ≤ (3/16)(4A_F² + 2B_F²) κ,   A_F = sup|F_{uuū}|,  B_F = sup|F_{uuu}| + sup|F_{uūū}|,

and for the actual profiles the sup norms are large (Chebyshev fit of P(ρ), ρ=|u|²; F = uP(ρ): F_{uuū} = 2P'+4ρP''+ρ²P''', F_{uuu} = ū²(3P''+ρP'''), F_{uūū} = u²(3P''+ρP'''), F_{ūūū} = u⁴P'''):

| profile | P(0) | P'(0) | P''(0) | P'''(0) | sup|F_{uuū}| | B_F | K_F+K'_F (𝒞_F ≤ (K_F+K'_F)κ) |
|---|---|---|---|---|---|---|---|
| F_A | −0.835 | 2.158 | −11.6 | ≈100 | 4.5–5.2 | 8.9–10.4 | 87–118 |
| F_B | −0.422 | 1.032 | −5.3 | ≈45 | 2.1–2.2 | 3.8–4.5 | 17–22 |

So the proved chain gives 𝒞_A+𝒞_B ≤ ≈105κ against measured ≤ 1.8κ: a factor ≈ 70–100. P'''(0) ≈ 100 means the profiles vary on the scale ρ ≈ 0.1, i.e. |u| ≈ 0.3, while |q| ≈ 0.2: the derivative expansion of the profile around the law of q does not converge at the relevant amplitude. Law-weighted mean third derivative m₃(σ) = E F_{A,uuū}(σW) = 3.29, 2.64, 2.16, 1.76 at σ = 0.14, 0.2, 0.25, 0.3 (F_B: 1.59, 1.29, 1.06, 0.87). CONSEQUENCE: no derivative-based bound (ours with third derivatives, or your §4 remainder with fifth derivatives) can close (T) at σ ≈ 0.2; a proof of (T) must treat the profile exactly. With sup norms the chain proves K_η only for λ_max(M) ≤ 1e-3 σ² (more than 3000 equally influential coordinates) — useless. The influence inequality adds a further loss of 2–3.5 on relevant tensors.

Exact structure available for a sharper attack: the coefficient of Π₁₁F_u(q) on :w_k w̄_l: is

    E[∂_k∂̄_l F_u(q)] = E[F_{uuū}(q)(D_kq conj(D_lq) + conj(D̄_kq) D̄_lq)] + E[F_{uuu}(q) D_kq D̄_lq] + E[F_{uūū}(q) conj(D̄_kq) conj(D_lq)] + E[F_{uu}(q) D_kD̄_lq] + E[F_{uū}(q) conj(D̄_kD_lq)],

leading term E[F_{uuū}(q)]·M_kl + covariance of F_{uuū}(q) with the centred Gram fluctuation. So 𝒞_{F_A} ≈ m₃²‖M‖²_HS + (m₃'²/4)‖Π₂₀q²‖² at leading order, with the MEAN third derivatives m₃ = E F_{uuū}(q), m₃' = E F_{ūuu}(q) (for the cubic model u|u|² both equal 2 and the formula is exact: Π₁₁Ψ_u = 2Π₁₁|q|², Π₂₀Ψ_ū = Π₂₀q²); that is what the numerics see. Your §4 expansion Π₁F(q) = γ(q)Π₁(qU) + R with the influence-sensitive remainder κ√J(q) is the same object seen from the other side: γ(q) = ½E F_{uuū}(q) = m₃/2, and J(q) is the real-coordinate analogue of λ_max(M) (J ≤ λ_max(M)). [Corrected after your audit: an earlier version had γ = m₃ and a factor 2 on the Π₂₀ term; Theorems W and R and all measured numbers are unaffected, since they never use this expansion.] A proof of (T) needs a second-order bound with a law-weighted (not sup) norm of F_{uuū}, or a direct argument using the mixture structure F_A(u) = E_z[(T−1) ph(L(z)+u)].

## 7. Verdict

Not a proof of K_η. New and proved: Theorem W (constant 3, sharp constant in [2.06, 3], dimension-free) and the exact weighted reduction of the odd sectors to (T). New and measured: (T) holds with factor ≥ 2.4 of room on the junta family and the L2 maximisers; derivative-based proofs are ruled out by a factor ≈100 (P''' ≈ 100), so (T) needs the exact profile (mixture over z of shifted phases with the z-average taken before any Cauchy–Schwarz, or exact conditioning + covers for residuals with several influential coordinates plus a diffuse remainder). The deficit-retention form Λ ≤ S − (1−θ)d_q is (T) with η = 0 and θ ≤ 0.41 on everything measured here (θ ≤ 0.17 directly). Certified bound unchanged.


## 8. Correction after your k-weighted package (15 Oct, evening)

Verified here (x2ybar.py, Monte Carlo 4e6): for q = (7/(20√2))X²Ȳ the actual contents E[X̄F(q)], E[ȲF(q)] vanish (|·| ≤ 1e-4, noise), 𝒞_A = 0.041, 𝒞_B = 0.010 (on the diagonal directions :|X|²:, :|Y|²:), λ_max(M) = 4c² = 0.245 (D_Xq = 2cXȲ on the off-diagonal direction), and (𝒞_A+𝒞_B)λ_max/0.292 = 0.043 > d_q + 1e-4 = 0.032 (your enclosures 0.0354 > 0.0347). Agreed: (T) is false in general; the Cauchy–Schwarz in Theorem R discards an exact orthogonality. The target reverts to the unweakened (R) condition

    (T₀)   ‖Π₁₀F_A(q)‖² + ‖Π₁₀F_B(q)‖² ≤ 0.292 (S − Λ_q + η)   for all q ∈ H₂₁,

which is what our "(R) exact" columns measure (≤ 0.39 d_q on junta and L2 maximisers; 0 on your example). Theorem W (cubic model) and the identity content = ⟨Π₁₁F_u, conj(D q)⟩ + ⟨Π₂₀F_ū, D̄q⟩ stand; the lesson is to keep the contraction. Your positive representation F_D(u) = −u∫e^{−s|u|²}μ_D(ds) is exactly the exact-profile tool needed for (T₀): with it, Π₁₀F_D(q) = −∫ Π₁₀(q e^{−s|q|²}) μ_D(ds), and the content of q e^{−s|q|²} is a Gaussian-weighted version of the cubic content, with the contraction kept inside the s-integral. That is what I would attack next.

## 9. Three further results from another AI system (15 Oct, evening), checked here

(a) Reverse influence inequality [C, exact]: (4/3)‖M‖²_HS ≤ κ ≤ (14/3)‖M‖²_HS, hence κ ≤ 14 v λ_max(M). Verified on 440 random tensors (ratio in [2.33, 4.42]), the L2 maximisers (4.49, 4.25, 4.14, 4.03 for n = 2..5), the 13-family (1.44), and the identity (14/3)‖M‖² − κ = 32(‖N‖² − ‖K‖²) + 96(u − ‖X‖²) + (32/3)‖N − Pᵀ‖² holds to 1e-15; equality 14/3 on diagonal Wick sums Σ c_j :w_j²w̄_j: (κ = 168Σ|c|⁴, ‖M‖² = 36Σ|c|⁴). Consequence: a diffuse influence spectrum forces a small cumulant; a counterexample in the variance window must have an influential direction.
(b) Zero content of the 13-family for every profile [C, MC]: E[w | q_a] = 0 (norm-composition identity |A₀|² + ‖B‖² = N_X N_Y, conditional law √(N_XN_YN_Z)·ξ, two symmetries). MC at 1e6: contents of u|u|², u·e^{−|u|²/2v}, u/|u| all at the noise level. So the family that makes the universal weighted constant large has no first-chaos gain for the actual profiles; only the fresh-coordinate probe creates the weighted obstruction.
(c) Signed Edgeworth expansion [?, not re-derived here]: |2E|L+q| − f(v) − ¼f''(v)κ| ≤ (77/v)‖φ'''‖_∞ κ^{5/4} for 3κ/(2v²) ≤ 1, all dimensions (via Biermé–Bonami–Nourdin–Peccati's third-chaos estimates); at the peak this gives exact Gaussian domination Λ(q) ≤ S − κ/8 for κ ≤ 1e-24 (zero slack, dimension-free, numerically useless). The leading term ¼f''κ agrees with our measured d_q ≈ −g''(v*)κ/4 ≈ 0.38κ.
