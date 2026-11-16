<!-- Verbatim from the delivery conjecture-K-influence-calculus-v2.zip (NOTE2.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# Influence calculus for the content of a remote cubic

*A second representation of the content, through the influence functions of q, and a content bound in law
functionals that falls with concentration.*

> **Erratum (v2; see `ADDENDUM.md` §1).**
> - Theorem 9 with the caps alone is bound (F) of `CONTENT_LEMMA_D5.md` §3.4, with the same proof. Only the
>   constraint on λ₁² + λ₂² is new.
> - Theorem 7(b)'s constant 3/4 is superseded by the sharp 1/2 (`ADDENDUM.md`, Corollary 13.1).
> - §7, items 1–2, are corrected there. Author: Claude (this session), 16 November 2026. Sequel to
`sources/antiholomorphic-stein-2026-11-16/NOTE.md` (KAS; ledger 6.3.20–6.3.25), whose notation is kept. Labels as in
the ledger: **P** complete written proof (here: author only), **C** exact computation with a replay script (on
random rational instances), **N** floating point only.

## 0. Notation

y = (y₁, …, y_n) independent standard complex Gaussians, ⟨F, G⟩ = E[F̄G], ∂_j = ∂/∂y_j, ∂̄_j = ∂/∂ȳ_j,
E[ȳ_jF] = E[∂_jF], E[y_jF] = E[∂̄_jF]. q ∈ H₂,₁(ℂⁿ) is a remote cubic, u = E|q|², V = |q|², Q = q²,
a = Σ_j ∂_jq·∂̄_jq, c₂ = Σ_j|∂̄_jq|², x = c₂ − u, δ = E|q|⁴ − 2u², χ = δ/u². For a profile h the content is
c[h] = Π₁[q·h(V)], with ⟨y_e, c[h]⟩ = E[ȳ_e q h(V)] for y_e = Σ_j e_j y_j.

For e ∈ ℂⁿ put

    ∂_e = Σ_j ē_j ∂_j,    ∂̄_e = Σ_j e_j ∂̄_j     (so E[ȳ_eF] = E[∂_eF], and ∂_eF̄ = conj(∂̄_eF)).

The **influence functions** of q in the direction e are ∂_eq ∈ H₁,₁ and ∂̄_eq ∈ H₂,₀. The **influence matrices** are

    J₁[a, b] = E[∂_aq·conj(∂_bq)],     I₂[a, b] = E[conj(∂̄_aq)·∂̄_bq].

Both are Hermitian and positive semidefinite, tr J₁ = ⟨q, N₁q⟩ = 2u and tr I₂ = ⟨q, N₂q⟩ = u, and for |e| = 1

    ‖∂_eq‖² = ⟨e, J₁e⟩ ≤ λ₁ := λ_max(J₁) ≤ 2u,     ‖∂̄_eq‖² = ⟨e, I₂e⟩ ≤ λ₂ := λ_max(I₂) ≤ u.

For the Wick monomial q = c·X(|X|² − 2)/√2: λ₁ = 2u, λ₂ = u. For N independent equal Wick blocks: λ₁ = 2u/N,
λ₂ = u/N.

## 1. The directional identity

**Theorem 6.** Let h ∈ C¹[0, ∞), real or complex, with h and h′ of polynomial growth. For every q ∈ H₂,₁(ℂⁿ) and
every e ∈ ℂⁿ,

    E[ȳ_e·q·h(V)] = E[∂_eq·(vh)′(V)] + E[q²·conj(∂̄_eq)·h′(V)]
                  = ⟨conj(∂_eq), P₁,₁[(vh)′(V)]⟩ + ⟨∂̄_eq, P₂,₀[q²·h′(V)]⟩,

where (vh)′(v) = h(v) + v·h′(v).

*Proof.* Φ = q·h(V) is C¹ on ℂⁿ with Φ, ∇Φ of polynomial growth (at points with V = 0 the chain rule holds because
∇V = 0 there). Gaussian integration by parts gives E[ȳ_eΦ] = E[∂_eΦ], and
∂_eΦ = ∂_eq·h(V) + q·h′(V)·(q̄·∂_eq + q·∂_eq̄) = ∂_eq·(h + Vh′)(V) + q²·h′(V)·conj(∂̄_eq). Since conj(∂_eq) ∈ H₁,₁ and
∂̄_eq ∈ H₂,₀, only the projections P₁,₁ and P₂,₀ of the two radial factors enter. ∎
**[P; C for h(v) = vᵐ, m ≤ 3 (check J1); N at the peak profiles: relative error ≤ 3.5·10⁻⁵ on five two-variable
cubics, `results/identity.log`]**

Call A_h = P₁,₁[(vh)′(V)] and B_h = P₂,₀[q²·h′(V)] the **shadows** of the profile. They are the second-chaos parts
of a real radial function and of a charge-two radial function. With the linear maps 𝒟₁e = conj(∂_eq) and
𝒟₂e = ∂̄_eq from ℂⁿ to H₁,₁ and H₂,₀, Theorem 6 reads c[h] = 𝒟₁*A_h + 𝒟₂*B_h, and ‖𝒟₁‖² = λ₁, ‖𝒟₂‖² = λ₂.

**Corollary 6.1.** ‖c[h]‖ ≤ √λ₁·‖A_h‖ + √λ₂·‖B_h‖. **[P]**

Remarks.
(i) *No Gaussian floor.* Both factors of each term vanish in the diffuse limit: the influences because the energy is
spread, the shadows because a radial function of a Gaussian has no second-chaos part in the coordinates. The bound
6.3.25 has a floor: for a Gaussian law Ω_e = (3/4)(E[Vk′])²/u in every direction (`CONTENT_LEMMA_D5.md` §11.3).
(ii) *Exact on juntas.* For the Wick monomial H₁,₁ and H₂,₀ restricted to the coordinate are one-dimensional, so
each pairing is an equality; the corollary is an equality when the two terms have the same phase, which they have at
the peak profiles (N: ratio 1.00 for the raw and the tilted profile at u = 0.02 and 0.0463). Same for equal
independent Wick blocks (N: H(X) + H(Y), ratio 1.00–1.02).
(iii) *What it loses.* Only the alignment of the shadows with the ranges of 𝒟₁, 𝒟₂: for X(|Y|² − 1) the shadow A_h
has a large component along |X|² − 1, which 𝒟₁ does not see (N: ratio 2.8–4.1).
(iv) The real form of the first step is formula (8) in the proof of 11.29 (and (21) of KMA `PROOFS.md` after a second
integration by parts). What is used here and not there is the pairing with the influence matrices, and Theorems 7
and 9.

## 2. The second-chaos shadow of |q|² is the influence matrix

**Theorem 7.** For every q ∈ H₂,₁(ℂⁿ):

(a) ⟨:y_aȳ_b:, V⟩ = E[∂_a∂̄_bV] = I₂[a, b] + J₁[a, b]. So P₁,₁|q|² = Σ_{a,b} M[a, b]·:y_aȳ_b: with M = I₂ + J₁,
    a positive semidefinite matrix of trace 3u, and ‖P₁,₁|q|²‖² = ‖M‖²_HS.

(b) λ₁² + λ₂² ≤ ‖J₁‖²_HS + ‖I₂‖²_HS ≤ ‖M‖²_HS = ‖P₁,₁|q|²‖² ≤ (3/4)·δ.

*Proof.* (a) {:y_aȳ_b: = y_aȳ_b − δ_ab} is an orthonormal basis of H₁,₁, and
E[conj(:y_aȳ_b:)F] = E[ȳ_ay_bF] − δ_abEF = E[∂_a(y_bF)] − δ_abEF = E[y_b∂_aF] = E[∂̄_b∂_aF]. For F = V = q̄q:
∂_a∂̄_bV = ∂_aq̄·∂̄_bq + ∂_aq·∂̄_bq̄ + q̄·∂_a∂̄_bq + q·∂_a∂̄_bq̄. The last two have mean zero: ∂_a∂̄_bq ∈ H₁,₀ and
conj(∂_a∂̄_bq̄) ∈ H₁,₀ are orthogonal to q. And ∂_aq̄ = conj(∂̄_aq), ∂̄_bq̄ = conj(∂_bq).
(b) tr(J₁I₂) ≥ 0 for positive semidefinite matrices, so ‖M‖²_HS ≥ ‖J₁‖²_HS + ‖I₂‖²_HS, and a Hilbert–Schmidt norm
dominates the largest eigenvalue. The last inequality is the second identity of 6.3.21,
δ = ⅔‖P₂,₀q²‖² + ⅓‖P₃,₁q²‖² + (4/3)‖P₁,₁|q|²‖² + ⅔‖P₂,₂|q|²‖². ∎ **[P; C: checks J2–J4]**

So a cubic with fourth excess χ has no direction with influence above u·√(3χ/4): **λ₁² + λ₂² ≤ (3/4)χu²**. (The
converse direction, a large fourth cumulant without influential coordinates, is ledger 3.21(c).) The constant 3/4 is
not attained in any example: ‖P₁,₁|q|²‖²/δ is 3/14 on the Wick monomial, 1/2 on X²Ȳ, and between 0.21 and 0.38 on the
random cubics of the exact checker and of `results/identity.log`.

**Theorem 8 (the leading tensor).** Theorem 6 with h(v) = v gives, for every unit e,

    E[ȳ_e·q·|q|²] = 2⟨conj(∂_eq), P₁,₁|q|²⟩ + ⟨∂̄_eq, P₂,₀(q²)⟩.

Hence ‖Π₁(q|q|²)‖ ≤ 2√λ₁·‖P₁,₁|q|²‖ + √λ₂·‖P₂,₀q²‖, and

    ‖Π₁(q|q|²)‖² ≤ (3λ₁ + (3/2)λ₂)·[(4/3)‖P₁,₁|q|²‖² + (2/3)‖P₂,₀q²‖²] ≤ min{(15/2)·u·δ, (3√15/4)·δ^{3/2}}.

*Proof.* (2√λ₁·α + √λ₂·β)² ≤ (3λ₁ + (3/2)λ₂)((4/3)α² + (2/3)β²) by Cauchy–Schwarz; the bracket is at most δ by 6.3.21;
3λ₁ + (3/2)λ₂ ≤ (15/2)u, and 3λ₁ + (3/2)λ₂ ≤ (3√5/2)(λ₁² + λ₂²)^{1/2} ≤ (3√5/2)(3δ/4)^{1/2} by Theorem 7(b). ∎ **[P]**

On the Wick monomial the unsquared inequality is an equality (128u³ after squaring; the Cauchy–Schwarz step then
gives 130u³). The leading tensor of 6.3.12 thus sees
only the two low components P₁,₁|q|² and P₂,₀q² of the fourth-moment decomposition; the top components P₃,₁q² and
P₂,₂|q|² enter δ and the deficit but not the leading content. The constant 3√15/4 = 2.905 (2.734 if the two
constraints are optimised jointly, N) is weaker than the (3√6/4) = 1.837 that 6.3.12 records as **R**; the proof here
is five lines.

## 3. A content bound in law functionals

**Theorem 9.** (With the caps alone this is (F) of `CONTENT_LEMMA_D5.md` §3.4; the constraint (3/4)δ may be
replaced by δ/2, `ADDENDUM.md` Corollary 13.1.) Let h ∈ C¹[0, ∞) with h, h′ of polynomial growth, and put

    s_A = sd[(vh)′(V)] = min_m ‖(vh)′(V) − m‖₂,      s_B = ‖V·h′(V)‖₂ = (E[V²|h′(V)|²])^{1/2}.

For every q ∈ H₂,₁(ℂⁿ), in every dimension,

    ‖c[h]‖ ≤ √λ₁·s_A + √λ₂·s_B,      with  λ₁ ≤ 2u,  λ₂ ≤ u,  λ₁² + λ₂² ≤ (3/4)δ.

In particular

    (a)  ‖c[h]‖² ≤ u·(√2·s_A + s_B)²,
    (b)  ‖c[h]‖² ≤ (3δ/4)^{1/2}·(s_A^{4/3} + s_B^{4/3})^{3/2}.

*Proof.* Corollary 6.1 and Bessel: constants are orthogonal to H₁,₁, so ‖A_h‖ ≤ ‖(vh)′(V) − m‖₂ for every m, and
‖B_h‖ ≤ ‖q²h′(V)‖₂. The constraints are §0 and Theorem 7(b). (b) is Hölder with exponents 4 and 4/3:
√λ₁s_A + √λ₂s_B ≤ (λ₁² + λ₂²)^{1/4}(s_A^{4/3} + s_B^{4/3})^{3/4}. ∎ **[P]**

What kind of bound this is.
- s_A and s_B depend on the **law of |q|²** only; s_A² is a concave functional of the law and s_B² a linear one. The
  cubic enters otherwise through u and δ. So a law layer can carry Theorem 9 as it carries 11.49: per profile and
  energy cell it needs upper caps of E[((vh)′(V) − m)²] and E[V²h′(V)²].
- It uses **no Stein pair and no supremum over the radius**. The saturation of the profile at large |q| is kept
  inside s_A and s_B; that is what a Taylor or leading-tensor argument loses (ledger §14, items 21–22).
- It **falls with concentration**: for χ ≥ 20/3 the caps λ₁ ≤ 2u, λ₂ ≤ u are the only active constraints and the
  bound is (a), which does not depend on δ; for χ < 20/3 the constraint λ₁² + λ₂² ≤ (3/4)δ is active and the bound is
  at most (b), of order δ^{1/2}. Against a bound γ·δ of the type 11.49 it therefore wins at high kurtosis and loses
  near the Gaussian, where s_A, s_B keep their Gaussian values while δ → 0.

## 4. The shadows through the Stein pair

The Bessel step of Theorem 9 keeps a Gaussian floor in s_A, s_B. The shadows themselves do not have one. Two exact
representations, in the style of 6.3.23:

**Proposition 10 (second shadow).** Let η be continuous of polynomial growth and m = 𝒦_uη = E η(· + uτ). For every
w ∈ H₂,₀,

    E[w̄·q²·η(V)] = E[w̄·a·(vm)′(V)] + E[w̄·q²·m′(V)·x].

So with k = 𝒦_uh (k′ = 𝒦_uh′): ‖B_h‖ ≤ ‖(vk′)′‖_∞·‖a‖ + ‖vk″‖_∞·‖x‖ ≤ (‖(vk′)′‖²_∞ + ½‖vk″‖²_∞)^{1/2}·δ^{1/2}.

*Proof.* Lemma 1 of KAS (6.3.20) with G = w̄·q·m(V); w̄ is antiholomorphic, so ∂_jw̄ = 0 and
Σ_j∂_jG·∂̄_jq = w̄·a·m(V) + w̄·q·m′(V)(q̄a + qc₂) = w̄·a·(vm)′(V) + w̄·q²·m′(V)·c₂. Subtract u·E[w̄q²m′(V)] and use
m − um′ = η. The norm bound uses ‖a‖² + 2‖x‖² ≤ δ (6.3.21). ∎ **[P; C for m(v) = vᵏ, k ≤ 2 (check J5)]**

**Proposition 11 (first shadow).** Let ψ ∈ C¹[0, ∞) be real with ψ, ψ′ of polynomial growth, K = 𝒦_uψ − E ψ(uτ)
(so K(0) = 0) and ρ = K/v. For every w ∈ H₁,₁,

    E[w̄·ψ(V)] = E[q̄·ρ(V)·Σ_j conj(∂̄_jw)·∂̄_jq] + E[w̄·x·K′(V)] + E[w̄·q̄²·a·ρ′(V)].

*Proof.* Lemma 1 with G = w̄·q̄·ρ(V): Σ_j∂_jG·∂̄_jq = q̄ρ(V)Σ_j∂_jw̄·∂̄_jq + w̄c₂(vρ)′(V) + w̄q̄²aρ′(V), with
∂_jw̄ = conj(∂̄_jw). So E[w̄K(V)] − u·E[w̄K′(V)] equals the right side, and K − uK′ = ψ − Eψ(uτ), whose constant is
orthogonal to w. ∎ **[P; C for ψ(v) = vᵐ, m ≤ 3 (check J6)]**

With w̄ replaced by 1 the first term disappears and Proposition 11 is the deficit representation 6.3.24. With a
second-chaos weight the first term stays: it is the mixed Malliavin covariance of w and q, the pairing of the radial
function q·ρ(V) with the cubic q_w = Σ_j conj(∂̄_jw)∂̄_jq. It is of the size of the influence matrix (for constant ρ
it is ρ·⟨w, I₂⟩), not of the Stein pair. So the first shadow has no bound "sup-norm × Stein pair" of the kind of
Proposition 10; its near-Gaussian smallness comes from the influence matrix (Theorem 7).

At the peak Proposition 10 is below the Bessel value of s_B only for χ < 0.9–1.4 (N, `results/prop10.log`): it does
not help in the band.

## 5. A sixth-moment cut from the spectral method

**Proposition 12.** For every q ∈ H₂,₁(ℂⁿ): E|q|⁶ ≥ (3/2)·(E|q|⁴)²/E|q|². Equivalently, with κ₆ᶜ = E|q|⁶ − 6u³ − 9uδ
as in ledger 3.19: κ₆ᶜ ≥ (3/2)·χ(χ − 2)·u³. Equality for a Gaussian law.

*Proof.* Let X = Re q, an element of the real third Wiener chaos, L the real Ornstein–Uhlenbeck generator and
Γ = |∇X|², so that LX = −3X and E[Xφ(X)] = ⅓E[φ′(X)Γ]. For the polynomial P(t) = t³ − ct the variable P(X) lies in
the chaoses of order at most 9, hence E[Γ·P′(X)²] = E|∇P(X)|² = ⟨P(X), −LP(X)⟩ ≤ 9·E[P(X)²]. By the Stein identity
with φ = ∫₀ P′², E[Γ·P′(X)²] = 3·E[X·∫₀^X P′(t)²dt] = 3·((9/5)m₆ − 2c·m₄ + c²m₂), where m_k = E X^k; and
E[P(X)²] = m₆ − 2c·m₄ + c²m₂. So (6/5)m₆ − 4c·m₄ + 2c²m₂ ≥ 0 for every real c, that is m₄² ≤ (3/5)m₂m₆. Since q is
circular, m₂ = u/2, m₄ = (3/8)E|q|⁴ and m₆ = (5/16)E|q|⁶. ∎ **[P; C on instances (`check_sixth_moment.py`)]**

This is the case k = 3 of the moment-matrix inequality of Azmoodeh, Malicet, Mijoule and Poly (arXiv:1305.6579,
Theorem 3.1; their Proposition 3.1 is the real inequality), re-derived here. It is a lower cut on the sixth moment,
1.5 times the Cauchy–Schwarz one, valid for every cubic; the ledger's sixth-moment input (3.4) is an upper bound. The
same method with polynomials of degree k gives a positive semidefinite matrix in the moments up to 2k.

## 6. Numbers (N; peak row; `results/`)

**Theorem 6 and Corollary 6.1 with exact shadows** (`identity.log`, grid 44×40, u = 0.0463; "C²" is ‖c‖²):

| cubic | χ | raw: C²/D | raw: Cor. 6.1 / D | tilt: C²/D | tilt: Cor. 6.1 / D | 6.3.25 at e*, raw / tilt (KAS) |
|---|---|---|---|---|---|---|
| Wick monomial | 42 | 0.0876 | 0.0876 (×1.00) | 0.0114 | 0.0114 (×1.00) | 0.112 / 0.0164 |
| best tensor of 6.4.2 | 40.0 | 0.0876 | 0.0884 (×1.01) | 0.0115 | 0.0116 (×1.01) | 0.124 / 0.0193 |
| mixed | 33.4 | 0.0840 | 0.0994 (×1.18) | 0.0113 | 0.0143 (×1.27) | 0.150 / 0.0256 |
| H(X) + H(Y) | 21 | 0.0653 | 0.0659 (×1.01) | 0.0099 | 0.0101 (×1.02) | 0.153 / 0.0294 |
| X(\|Y\|² − 1) | 16 | 0.0410 | 0.1400 (×3.42) | 0.0061 | 0.0252 (×4.11) | 0.165 / 0.0349 |

The Bessel step of Theorem 9 costs a factor 1.9–2.9 in ‖A_h‖² and 1.7–3.6 in ‖B_h‖² on these cubics.

**Theorem 9 against 11.49** (tilt 3/5; T9 is the bound of Theorem 9 with the caps optimised; γ is the coefficient
of 11.49 at the energy). With the shadows of a Gaussian law, T9/δ at χ = 1, 2, 4, 8, 12, 16, 24
(`gausslaw.log`):

| u | γ of 11.49 | T9/δ |
|---|---|---|
| 0.009 | 0.0502 | 0.0633, 0.0448, 0.0316, 0.0198, 0.0132, 0.0099, 0.0066 |
| 0.02 | 0.0441 | 0.1020, 0.0721, 0.0509, 0.0318, 0.0212, 0.0159, 0.0106 |
| 0.03 | 0.0375 | 0.1187, 0.0840, 0.0592, 0.0370, 0.0247, 0.0185, 0.0123 |
| 0.0463 | 0.0325 | 0.1280, 0.0905, 0.0638, 0.0399, 0.0266, 0.0200, 0.0133 |

With the law of the Wick monomial (χ = 42): T9/δ = 0.0075, 0.0058, 0.0049, 0.0040 at the four energies, 6.7 to 8.1
times below γ. With Gaussian shadows T9 = γδ at χ ≈ 1.6, 5.4, 7.9 and 9.8 for u = 0.009, 0.02, 0.03 and 0.0463;
above that T9 is the smaller.

With each cubic's **own law** (`scan_tilt.log`, `scan_raw.log`; five families and 400 random two-variable cubics per
energy, grid 28×24; two-variable cubics have χ ≥ 9.7 in these samples). Largest values over the random cubics, per
kurtosis band:

| profile, u | χ band | largest C²/D (truth) | largest T9/D | largest γδ/D (11.49) |
|---|---|---|---|---|
| tilt, 0.02 | [8, 16) | 0.0083 | 0.1006 | 0.1275 |
| | [16, 24) | 0.0115 | 0.0696 | 0.1549 |
| | [24, 42] | 0.0119 | 0.0496 | 0.1890 |
| tilt, 0.0463 | [8, 16) | 0.0094 | 0.1244 | 0.1473 |
| | [16, 24) | 0.0117 | 0.0920 | 0.1878 |
| | [24, 42] | 0.0118 | 0.0655 | 0.2385 |
| raw, 0.02 | [8, 16) | 0.0425 | 0.4673 | — |
| | [16, 24) | 0.0622 | 0.3352 | — |
| | [24, 42] | 0.0684 | 0.2465 | — |
| raw, 0.0463 | [8, 16) | 0.0589 | 0.6498 | — |
| | [16, 24) | 0.0820 | 0.4860 | — |
| | [24, 42] | 0.0873 | 0.3546 | — |

- Tilt: T9 is below γδ on 100 % of the random cubics at u = 0.02 and on 96 % at u = 0.0463. The largest value of
  min(T9, γδ)/D over them is 0.0997 and 0.1152, against 0.1890 and 0.2385 for γδ/D alone. On the Wick monomial
  T9/D = 0.0254 and 0.0300, against γδ/D = 0.1924 and 0.2426 and the truth 0.0117 and 0.0114.
- An adversarial search over two-variable cubics (random starts and Nelder–Mead; lower bounds on suprema;
  `search.log`): the largest T9/D found is 0.1052 (u = 0.02) and 0.1290 (u = 0.0463), both at χ = 9.2, on cubics
  with almost no content (C²/D ≤ 0.0003); there γδ/D is 0.0967 and 0.1033. The largest min(T9, γδ)/D found is 0.1002
  (χ = 9.9) and 0.1161 (χ = 10.6), at the crossover T9 = γδ. Cubics in more variables reach smaller χ; they are not
  sampled here.
- Raw: T9/D is 0.143 (u = 0.02) and 0.185 (u = 0.0463) on the Wick monomial and grows to 0.47 and 0.65 at χ ≈ 10.
- T9 ≥ C² on every cubic evaluated (a consistency check of the proof, not a proof).

## 7. What this gives, and what it does not

1. **[Corrected in `ADDENDUM.md` §1: this is (F) of `CONTENT_LEMMA_D5.md` §3.4 plus one constraint.]** **A proved content bound** (Theorem 9), for every cubic, every dimension and every C¹ profile, in
   law functionals and δ. For the tilt 3/5 it is below 11.49 on the high-kurtosis side (table above, and every
   two-variable cubic sampled at u = 0.02), by a factor up to 8 at the junta. It is above 11.49 near the Gaussian.
   A certificate can take the smaller of the two on each (u, χ) cell.
2. **[Corrected in `ADDENDUM.md` §5: the band's binding cells are at χ ≥ 10, where Theorem 9 is (F).]** **For the degree-5 band** (`higher-degree/STATUS.md` 4.19). Theorem 9 applies verbatim to the tilted profiles
   h_{A,s}, h_{B,t}, with two more law functionals per sector. It is χ-aware, which rows t = 0.80–0.82 need, and the
   largest excesses reported there sit at χ = 12–16 (`CONTENT_LEMMA_D5.md` §11.4), where the degree-3 analogue is
   1.2–1.6 times below 11.49 (Gaussian shadows, u = 0.0463). Whether that closes a row is not computed: the
   degree-5 profiles are not in the repository.
3. **For the raw inequality** (6.3.18): no. Theorem 9 gives 0.185·D at the junta law at u = 0.0463 and up to 0.65·D
   at χ ≈ 10 (N). Corollary 6.1 with exact shadows is exact at the junta end, which Cauchy–Schwarz on the Stein pair
   is not (item 91), but it reaches 0.14·D on X(|Y|² − 1).
4. **What is still missing** is the same step in a sharper form: the alignment of the shadows with the influence
   operators. In the leading order the content is the contraction of the coefficient tensor with the influence matrix
   (Theorems 7, 8); at finite amplitude the influence matrix is replaced by the profile-weighted shadows A_h, B_h.
   A bound for 𝒟₁*A_h that keeps this contraction, instead of ‖𝒟₁‖·‖A_h‖, is the phase-aware statement.
