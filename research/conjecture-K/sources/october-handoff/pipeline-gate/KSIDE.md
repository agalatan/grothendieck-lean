<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/gate/KSIDE.md (file dated 2026-10-11). Only this line was added. -->
# The k-side of the reduction: where the gates lose, the exact row, and the lemma that replaces the gates
Worker G1, 2026-10-12.  Cubic witness T = P − εQ (P = P₁,₀, Q = P₂,₁).  Everything numerical is FLOAT (grids stated); the exact row (★K) is proved.

## 1. Setting
f, g unimodular, h = (f+g)/2, k = (f−g)/2, coordinates rotated so that Ph = t z₁, z = z₁, w = (z₂, …, z_n).
   Re⟨f,Tg⟩ = t² − ε‖Qh‖² − ‖Pk‖² + ε‖Qk‖².                                                              (1)
Two concave terms (−ε‖Qh‖², −‖Pk‖²) and one convex term (+ε‖Qk‖²).  HJM treat the h-side by (8.5):
   −ε‖Qh‖² ≤ 2Re E[conj(B) h] + ‖B‖²/ε   for the fixed B = β z(|z|²−2) = β√2·H(z₁) ∈ H₂,₁,  and  −2ℓt + 2ℓ Re E[z̄h] = 0.

## 2. The exact k-row (proved; three lines)
ε‖Qk‖² = 2Re⟨G, k⟩ − ‖G‖²/ε with G := εQk ∈ H₂,₁(ℂⁿ) (identity).  Drop −‖Pk‖² ≤ 0.  With L := ℓ z₁ + B = z₁(ℓ + β(|z₁|²−2)):
   Re⟨f,Tg⟩ ≤ t² − 2ℓt + ‖B‖²/ε + Re E[conj(L+G) f + conj(L−G) g] − ‖G‖²/ε ≤ t² − 2ℓt + 2β²/ε + E|L+G| + E|L−G| − ‖G‖₂²/ε.
Hence, for every real ℓ, β,
   sup_{f,g: ‖Ph‖ = t} Re⟨f,Tg⟩ ≤ t² − 2ℓt + 2β²/ε + sup_{G ∈ H₂,₁(ℂⁿ), ‖G‖₂ ≤ ερ} Λ_{ℓ,β}(G),      Λ(G) := E|L+G| + E|L−G| − ‖G‖₂²/ε.      (★K)
No gate, no matrix, no δ.  (In HJM's language this is δ = ε with the residual being the WHOLE of εQk, not only its z₁-free part.)
Critical points of Λ are self-consistent: ∇Λ = 0 ⇔ G = εQ[(phase(L+G) − phase(L−G))/2].
Decompose G by its dependence on z₁:   G = q(w) + r_A(w)A(z₁) + r_B(w)B(z₁) + r_z(w) z₁ + ν H(z₁) + r_z̄(w) z̄₁,
   q ∈ H₂,₁(w), r_A ∈ H₁,₀(w), r_B ∈ H₀,₁(w), r_z ∈ H₁,₁(w), ν ∈ ℂ, r_z̄ ∈ H₂,₀(w)   (these are ε times the shells of HJM's c₁, c_A, c_B, c_z, c_H, c_z̄
   that carry the true weight ε).  If only q is present, Λ = E_w Φ₀(|q|) − σ²/ε with the EXPLICIT one-variable potential
   Φ₀(s) := E_z[|L + s| + |L − s|] = 2 E_U[ m(√U (ℓ + β(U−2)), s) ],   m(x, s) = (2/π)(x+s) E_ell(4xs/(x+s)²)   (U ~ Exp(1)),
a one-dimensional integral of a complete elliptic integral: no supremum over multipliers, hence no price layer.

## 3. The Gaussian ideal of (★K) is the model norm
Gaussian ideal: G = σW, W a standard complex Gaussian independent of z₁ (diffuse limit of σN^{-1/2}Σ_j H(w_j)).
   S(ℓ,β) := sup_σ { E_W Φ₀(σ|W|) − σ²/ε },      D″(t) := t² + min_{ℓ,β} [ S(ℓ,β) + 2β²/ε − 2ℓt ].
kmodel.py / kmodel2.py (radial Gauss–Legendre, exact to 1e-14 at s = 0, converged to 1e-8 at the optimum):
     ε        max_t D″(t)   at t     optimal (ℓ, β, σ*)            1/max
     0.7564   0.713135     0.845    (0.8456, 0.1432, 0.201)       1.402259      (exact-model norm of the witness: 0.713136)
     0.75     0.713183     0.850    (0.8488, 0.1448, 0.20)        1.402166
     0.745    0.713288     0.855    (0.8534, 0.1467, 0.20)        1.401957
   profile at ε = 0.7564:  t = 0.80 0.711274 | 0.82 0.712548 | 0.83 0.712926 | 0.84 0.713115 | 0.845 0.713135 | 0.85 0.713103 | 0.86 0.712875 | 0.87 0.712417
   (Worker D5's D′(t), the best a row of the present type can reach, same model: 0.71132 at 0.80, 0.71314 at 0.84.)
   The adversary's constant ν (the H(z₁)-component of G) and our optional multiplier λ for −|⟨k,z⟩|² are both optimal at 0
   (σ = 0.2031: ν = 0.05 → −2.9e-3, ν = 0.05i → −1.1e-3; λ = ±0.02 → +4.5e-4), so the two-parameter row (ℓ, β) already attains the norm.
   HJM-type gated rows in the same Gaussian ideal (Worker D5): 0.71207 / 0.71329 at t = 0.80 / 0.84 at ε = 0.7564; Worker V's best high-δ row at
   ε = 0.75, t = 0.84: 0.713322 against D″ = 0.713052 (delta_check.log).  So the gates cost 1.5e-4 – 2.7e-4 at the peak and 8e-4 at t = 0.80,
   and (★K) costs 0.

## 4. Where exactly the gates lose
HJM bound the convex term fibrewise: ε‖Qk‖² − ‖Pk‖² ≤ E_w[ξ*Eξ + ζ*Rζ + ε|d|²] + δ‖Q_wc₁‖² − ⟨Q_wξ,NQ_wξ⟩, with E ⪰ diag(−1,ε,ε), E ⪰ 0, N ⪰ 0,
R ⪰ diag(−1,ε), R ⪰ diag(ε,0).  A quadratic form of the fibre coefficients, integrated over w, charges EVERY w-chaos shell of every coefficient, while the
truth charges one shell of each (Π₂,₁c₁, Π₁,₀c_A, Π₀,₁c_B, Π₁,₁c_z, Π₀,₀c_H, Π₂,₀c_z̄).  Equivalently (writing the quadratic forms as suprema over
multipliers m(w)): the gates let the multiplier be an ARBITRARY function of w, while (★K) forces it into the right chaos (G ∈ H₂,₁(ℂⁿ)).
In the Gaussian ideal the fibre maximiser k*_s = (phase(L+s) − phase(L−s))/2 has (profiles.py, ε = 0.7564, row of t = 0.845)
   c₁(s) = 1.432 s + …,   c_A(s) = −0.835 s + Δ_A(s),   c_B(s) = −0.422 s + Δ_B(s),   c_z = c_H = c_z̄ ≡ 0 (odd in s, even charge),
   Δ_A(s)/s² = 0.21, 0.31, 0.39, 0.52 and Δ_B(s)/s² = 0.10, 0.15, 0.19, 0.25 at s = 0.1, 0.15, 0.2, 0.3   (non-analytic at 0: Δ ~ s|s|).
The W-linear parts are refunded by HJM's coupling b; the gate E₂₂, E₃₃ ≥ ε still pays for the NONLINEAR parts Δ_A(σW), Δ_B(σW) (true weight 0:
they lie in w-chaos of order ≥ 9), and E₁₁ ≥ ε − δ pays for the nonlinear part of c₁.  E|Δ_A(σW)|² = 1.5e-4, 9.4e-4, 6.4e-3 at σ = 0.14, 0.2, 0.3
(2.3e-4 at 0.2 after the best linear refund).  That is the 1.5e-4 … 8e-4 gate loss; a scheme with δ = ε, E = diag(0,ε,ε) and no R/d-gates
(gatex.py) has Gaussian ideal 0.713519 (ε = 0.7564) and 0.713480 (ε = 0.75), i.e. worse than HJM's optimised off-diagonal E (0.71329):
no rearrangement of gates removes the loss; one has to stop charging the wrong shells.

## 5. The lemma
**Conjecture K (Gaussian domination).**  Let a(u) = ℓ + β(u−2) with ℓ > 2β > 0, L(z) = z₁ a(|z₁|²), ε > 0, and for G ∈ H₂,₁(ℂⁿ)
   Λ(G) = E|L+G| + E|L−G| − ‖G‖₂²/ε   (expectations under the standard Gaussian measure of ℂⁿ).   Then for all n and all G ∈ H₂,₁(ℂⁿ)
        Λ(G) ≤ S(ℓ,β) := sup_{σ ≥ 0} { E|L + σW| + E|L − σW| − σ²/ε },   W a standard complex Gaussian independent of z₁.
Needed range: ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16] (the rows with t ∈ [0.80, 0.87]); elsewhere the rows have slack.
**Weak form K_η:**  Λ(G) ≤ S(ℓ,β) + η.   K_η for η = 1.0e-4 already gives the 1.402 bound (below).
**Sufficient decomposition (what a proof has to do).**  With G = q + G_mix as in §2 and x² = E|q|⁴/‖q‖⁴ − 2:
   (K-a)  q-only:  E_wΦ₀(|q|) − σ²/ε ≤ S − c₁(x)   for q ∈ H₂,₁(w).   Float: this already follows from the moment data of the certificate
          (E U = 1, E U² = 2 + x², the C₆ bound): xscan.py (ε = 0.7564, row of t = 0.845) gives the slack
              x      0.05    0.1     0.2     0.3     0.45    0.6     0.8     1.0     1.3     1.6     2.0     3.0     5.0     7.75
              c₁(x)  0       −2e-6   1.2e-5  2.5e-5  3.9e-5  4.8e-5  7.2e-5  1.2e-4  2.3e-4  3.9e-4  6.4e-4  1.3e-3  1.8e-3  2.0e-3
          (moment LP alone, the conic Stein solver fell back to it at almost every point; the cuts are not needed), and the value of the q-only row
          over all (σ, x) is 0.713115, 0.713133, 0.713096 at t = 0.84, 0.845, 0.85 (Gaussian ideals 0.713115, 0.713135, 0.713103; stein_phi.py).  Reason: Φ₀ is majorised by a polynomial in s² with negative s⁴-coefficient touching at the
          Gaussian law, and the Gaussian has the smallest fourth moment.  So the residual-law layer is lossless for the exact potential.
   (K-b)  mixed components:  Λ(q + G_mix) ≤ E_wΦ₀(|q|) − σ²/ε + R(q),  with R(q) ≤ c₁(x) + η.   First-order terms: only r_A and r_B couple (the profiles
          c_z, c_H, c_z̄ of the q-only maximiser vanish), through the FIRST-CHAOS CONTENT of an odd nonlinear function of the cubic chaos,
              ‖Π₁,₀[Δ_A(q)]‖² and ‖Π₀,₁[Δ_B(q)]‖²,    Δ_A(u) = c_A(u) − γ_A u  (charge one, |Δ_A(u)| ≤ 0.6 |u|²),
          which vanish for the Gaussian limit and are small when q has no influential coordinate (Stein: E[w̄_j F(q)] = E[F_u(q)∂_jq + F_ū(q)∂_j q̄]).
          Second-order terms: the Hessians of G_mix ↦ E_z|L+q+G_mix| + E_z|L−q−G_mix| at the q-only point are (profiles.py, stab.py, s = 0 … 0.3)
              A: 1.00–0.70,  B: 0.38–0.40,  z: 1.19–1.04 (imaginary direction), H: 0.99–0.78,  z̄: 0.60–0.65,   all below 1/ε = 1.322.
          (A pointwise test with a CONSTANT multiplier of z₁ jointly with ν is unstable, +2.6e-2, but a constant multiple of z₁ is not in H₂,₁:
           r_z has mean zero.  HJM handle the same direction by the off-diagonal entries of R.)
   A crude treatment of (K-b) (Cauchy–Schwarz with the full norm E|Δ_A(q)|², i.e. content θ = 1) costs 7e-4 at σ = 0.2: it is the gate again.
   The lemma has to show that the content θ is ≲ 0.1 for laws near the maximiser and grows slower than the slack c₁(x).
**What is known / evidence (FLOAT).**
   1. n = 2 (z₁ and one ORDINARY coordinate z₂; G = Σ c_i e_i over the six-dimensional H₂,₁(ℂ²); lowdim.py, 40 starts, grid 132×132×48):
      sup Λ = 1.3649281 (c = 0.055·H(z₂) + 0.006·z₂A(z₁)) against S = 1.3669130: the Gaussian wins by 2.0e-3.  (Λ(0) = 1.3647895.)
   2. Junta + diffuse (lowdim2.py): G = σ_W W + Σ c_i e_i(z₁,z₂), 13 real parameters, W integrated analytically: every start (junta weights up to
      0.18, all mixed components r_A, r_B, r_z, r_z̄, ν switched on, random starts) converges back to c = 0, σ_W = 0.2009, Λ = S to 1e-12
      (23 starts at ε = 0.7564, (ℓ,β) = (0.8456, 0.1432); 20 starts each at ε = 0.745, (0.8534, 0.1467) and at the flank row ε = 0.7564, (0.76, 0.1192):
      excess over the Gaussian value +1e-12, +1e-10, +8e-12).
      Adding an ordinary cubic component to a Gaussian residual lowers Λ faster than its leak into the mixed components can raise it.
   3. q-only residuals of arbitrary law: (K-a) above.
   4. The Gaussian point is a strict local maximum in all mixed directions (Hessians above).
   5. Consistency: (★K) with K is equivalent to "sup_n‖T_n‖ = norm of the three-coordinate Gaussian model", which the certified cap confirms to 1.7e-4
      at ε = 0.745 (0.713288 ≤ ‖T‖ ≤ 0.71352729) and GPT's coupled two-coordinate searches did not contradict for the degree-5 analogue.
   Not tested: residuals with several influential coordinates of comparable size; n ≥ 3 ordinary coordinates; G_mix components in more than one
   remote coordinate.  The elementary inequality |a+g| ≤ |a| + Re(g·conj(phase a)) + |g|²/(2|a|) (valid for all complex a ≠ 0, g) gives a global
   quadratic majorant with constants E[|D|²/|L+s|] = 2.0 (A), 0.76 (B), 1.19 (z), 0.99 (H): enough for B, z, H, z̄, NOT for A (2.0 > 1.322),
   where the factor ½ of the phase average has to be kept.

## 6. What the lemma gives
Cubic witness.  With K (or K_η) the certificate is: rows (ℓ, β) only; potential Φ₀ certified by one-dimensional interval integration; residual layer
by the existing moment rectangles; envelope over t.  Float values of the resulting cap:
     ε = 0.7564:  B = 0.713135 (+η)  →  K_G^ℂ ≥ 1.40226 (η = 0),  1.40206 (η = 1e-4);    target for 1.402: B ≤ 0.713267, i.e. η ≤ 1.3e-4.
     ε = 0.75:    B = 0.713183;   ε = 0.745:  B = 0.713288 (today's certified cap at 0.745: 0.71352729).
So the lemma is worth 2.4e-4 … 3.9e-4 in the cap (K: +0.0005 … +0.0008) and makes 1.402 reachable with the cubic witness; it removes the gate loss,
the residual-law loss AND the price layer in one stroke (the potential is explicit).  1.4023 is then the hard ceiling of the cubic witness.
Degree 5.  The same three lines give, for T = P − ε₁Q + ηR,
   V ≤ t² − 2ℓt + ‖B₃‖²/ε₁ + sup_{G₃ ∈ H₂,₁, G₅ ∈ H₃,₂} { E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η } + ‖C‖²/η,   L = ℓz₁ + B₃,
   (G₃ = ε₁Qk and G₅ = ηRh are the adversary's convex terms; B₃ and C ∈ H₃,₂ are ours, for −ε₁‖Qh‖² and −η‖Rk‖²; C may be coupled to the residual,
   C = q·(b_A A(z₁)) + conj(q)·(b_B B(z₁)), as HJM's coupling vector).  Its Gaussian ideal is Worker D5's flat profile D′(t) ≤ 0.71245 (K ≥ 1.4036),
   where the gated scheme loses 3–4e-3.  The corresponding conjecture K₅ is the same statement with the two-chaos perturbation; the h-side
   leakage is GPT's quintic leakage theorem, the k-side leakage is (K-b).  Margin to the 1.402 cap: 8.2e-4 instead of 1.3e-4.
