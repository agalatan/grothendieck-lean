<!-- Verbatim from the delivery conjecture-K-antiholomorphic-stein.zip (NOTE.md), 16 November 2026; a Claude session of the user, relayed by the user. Only this line was added. -->
# The antiholomorphic Stein calculus for remote cubics

*Content, deficit and the fourth cumulant of a cubic q ∈ H₂,₁ as linear and quadratic functionals of one
antiholomorphic Stein pair.* Author: Claude (this session), 16 November 2026. Status labels as in the ledger:
**P** complete written proof (here: by the author only, not yet re-derived by anyone else), **C** exact computation
with a replay script, **N** numerical only.

## 0. Notation

y = (y₁, …, y_n) are independent standard complex Gaussians (E|y_j|² = 1, E y_j² = 0), ⟨F, G⟩ = E[F̄G],
∂_j = ∂/∂y_j and ∂̄_j = ∂/∂ȳ_j (Wirtinger). Gaussian integration by parts: E[∂_jF] = E[ȳ_jF] and E[∂̄_jF] = E[y_jF]
for F ∈ C¹ with F and ∇F of polynomial growth. Hence ∂_j* = y_j − ∂̄_j and ∂̄_j* = ȳ_j − ∂_j, and

    N₁ = Σ_j ∂_j*∂_j,   N₂ = Σ_j ∂̄_j*∂̄_j,   H_{p,q} = {N₁ = p, N₂ = q}   (on polynomials).

Both number operators obey the same product rule
N_i(FH) = F·N_iH + H·N_iF − Γ(F, H), Γ(F, H) = Σ_j (∂_jF·∂̄_jH + ∂̄_jF·∂_jH), and Γ is the real carré du champ.

Throughout q ∈ H₂,₁(ℂⁿ) is a remote cubic with u = E|q|² > 0, and

    V = |q|²,  Q = q²,  F_k = ∂̄_kq ∈ H₂,₀,
    a  = Σ_j ∂_jq·∂̄_jq = ½Γ(q, q),     c₁ = Σ_j |∂_jq|²,   c₂ = Σ_j |∂̄_jq|² = Σ_k |F_k|²,   x = c₂ − u,
    δ  = E|q|⁴ − 2u²   (E q² = 0 by the charge).

(a, x) is the **antiholomorphic Stein pair** of q: it vanishes for an antiholomorphic linear form (q = ȳ₁ gives a = 0,
c₂ ≡ 1), and it is small for a diffuse cubic.

For a profile h: [0, ∞) → ℂ the **content** is c[h] = Π₁[q·h(V)] ∈ H₁,₀. For a unit vector e put
y_e = Σ_j e_j y_j; then ⟨y_e, c[h]⟩ = E[ȳ_e q h(V)] and ‖c[h]‖ = sup_e |E[ȳ_e q h(V)]| (ledger 6.2.4). The raw A-content
of the ledger is h = g, the tilted content is h_s = (g − g₀) − s(j₀ − j), the B-content is h = g_B.

The **radial transform** is (𝒦_u h)(v) = ∫₀^∞ e^{−t} h(v + ut) dt = E h(v + uτ), τ ~ Exp(1). For h continuous with
polynomial growth, k = 𝒦_u h is C¹, of polynomial growth, and k − u·k′ = h (differentiate
k(v) = u⁻¹e^{v/u}∫_v^∞ e^{−s/u}h(s) ds). If h ∈ C¹ then k′ = 𝒦_u(h′).

## 1. The antiholomorphic Stein identity

**Lemma 1.** Let q be a polynomial with N₂q = q (antiholomorphic degree one, e.g. q ∈ ⊕_p H_{p,1}). For every
G ∈ C¹ with G, ∇G of polynomial growth,

    E[G·q] = Σ_j E[∂_jG · ∂̄_jq].

If moreover N₁q = 2q, then also E[G·q] = ½ Σ_j E[∂̄_jG · ∂_jq].

*Proof.* E[Gq] = E[G·N₂q] = Σ_j ⟨Ḡ, ∂̄_j*∂̄_jq⟩ = Σ_j ⟨∂̄_jḠ, ∂̄_jq⟩ = Σ_j E[conj(∂̄_jḠ)·∂̄_jq], and
conj(∂̄_jḠ) = ∂_jG. The second identity is the same computation with N₁q = 2q and ∂_j*. ∎ **[P]**

The point of the first form: a *holomorphic* left factor is invisible to ∂̄, so for G = ȳ_e·(radial) or G = q̄·(radial)
the identity moves the whole nonlinearity onto one derivative of a radial function, and what multiplies it is a
polynomial built from (a, c₂).

## 2. The chaos structure of the Stein pair, and the complex fourth-moment identity

**Theorem 2.** For every q ∈ H₂,₁(ℂⁿ), in every dimension:

(a) a = P₂,₀Q + ½P₃,₁Q. In particular a ∈ H₂,₀ ⊕ H₃,₁, ‖a‖² = ‖P₂,₀Q‖² + ¼‖P₃,₁Q‖² and
    ⟨Q, a⟩ = ‖P₂,₀Q‖² + ½‖P₃,₁Q‖².

(b) c₁ + c₂ = (3 − N₂)V; c₂ ∈ H₀,₀ ⊕ H₁,₁ ⊕ H₂,₂, E c₂ = u, E c₁ = 2u, so x ∈ H₁,₁ ⊕ H₂,₂.

(c) ⟨V − c₂, c₂ − u⟩ = Σ_k ‖Σ_j F_j·∂_jF_k‖² = ‖P₃,₁a‖² = ¼‖P₃,₁Q‖².

(d) **(complex fourth-moment identity)**

        δ = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖².

    Consequently ‖a‖² + 2‖c₂ − u‖² = δ − ¾‖P₃,₁(q²)‖² ≤ δ, with equality iff P₃,₁(q²) = 0.

(e) δ = ⅔‖P₂,₀Q‖² + ⅓‖P₃,₁Q‖² + (4/3)‖P₁,₁V‖² + ⅔‖P₂,₂V‖².

(f) **(exact real Stein budgets)** 2‖Γ(q, q̄) − 3u‖² + ‖Γ(q, q)‖² = 6δ − ‖P₃,₁Q‖² − 2‖P₂,₂V‖², and
    ½‖Γ(q, q̄) − 3u‖² + ½‖Γ(q, q)‖² = 3δ − ½‖P₃,₁Q‖² − 2‖P₁,₁V‖² − (3/2)‖P₂,₂V‖².

*Proof.* (a) By the product rule, N₂(q²) = 2q·N₂q − Γ(q, q) = 2q² − 2a, so a = (1 − ½N₂)q². As q² has charge two
and antiholomorphic degree at most two, q² ∈ H₂,₀ ⊕ H₃,₁ ⊕ H₄,₂, and 1 − ½N₂ acts there by 1, ½, 0.

(b) N₂(q q̄) = q·N₂q̄ + q̄·N₂q − Γ(q, q̄) = 2V + V − (c₁ + c₂), since q̄ ∈ H₁,₂. Each F_k is a holomorphic polynomial of
degree two, so F_kF̄_k ∈ H₀,₀ ⊕ H₁,₁ ⊕ H₂,₂. E c₂ = Σ_j‖∂̄_jq‖² = ⟨q, N₂q⟩ = u and E c₁ = ⟨q, N₁q⟩ = 2u.

(c) Lemma 1 with G = q̄·x: ⟨V, x⟩ = E[q·q̄x] = Σ_j E[(∂_jq̄ x + q̄ ∂_jx)∂̄_jq] = E[c₂x] + T, where
Σ_j ∂_jq̄·∂̄_jq = c₂ and T = E[q̄ Σ_j ∂_jc₂·∂̄_jq]. Since E[c₂x] = ‖x‖² = ⟨c₂, x⟩, we get ⟨V − c₂, x⟩ = T. Now
∂_jc₂ = Σ_k ∂_jF_k·F̄_k (the F_k are holomorphic, so ∂_jF̄_k = 0), hence T = Σ_k ⟨qF_k, W_k⟩ with
W_k = Σ_j F_j ∂_jF_k ∈ H₃,₀. For every w ∈ H₃,₀, Lemma 1 with G = w̄F_k gives ⟨w, qF_k⟩ = Σ_j E[w̄ ∂_jF_k F_j] =
⟨w, W_k⟩, so P₃,₀(qF_k) = W_k and T = Σ_k ‖W_k‖². Finally, on H_{p,1} one has ‖G‖² = ⟨G, N₂G⟩ = Σ_k‖∂̄_kG‖², and
∂̄_kP₃,₁a = P₃,₀∂̄_ka with ∂̄_ka = Σ_j ∂_jF_k·F_j + Σ_j ∂_jq·∂̄_k∂̄_jq = W_k (q has antiholomorphic degree one). So
‖P₃,₁a‖² = Σ_k‖W_k‖² = T, and ‖P₃,₁a‖² = ¼‖P₃,₁Q‖² by (a).

(d) Lemma 1 with G = q̄V: E|q|⁴ = Σ_j E[(∂_jq̄ V + q̄(q̄∂_jq + q∂_jq̄))∂̄_jq] = 2E[Vc₂] + E[q̄²a]. By (a),
E[q̄²a] = ⟨Q, a⟩ = ‖P₂,₀Q‖² + ½‖P₃,₁Q‖². By (c), E[Vc₂] = u² + ⟨V − u, x⟩ = u² + ‖x‖² + ¼‖P₃,₁Q‖². Subtract 2u².

(e) The second form of Lemma 1 with G = q̄V gives E|q|⁴ = E[Vc₁] + ½⟨Q, a⟩, i.e. δ = ⟨V − u, c₁ − 2u⟩ + ½⟨Q, a⟩;
the proof of (d) gives δ = 2⟨V − u, c₂ − u⟩ + ⟨Q, a⟩. Take ⅔ of the first plus ⅓ of the second:
δ = ⅔⟨Q, a⟩ + ⅔⟨V − u, (c₁ + c₂) − 3u⟩, and by (b) (c₁ + c₂) − 3u = (3 − N₂)(V − u), which acts by 2, 1, 0 on
H₁,₁, H₂,₂, H₃,₃. Insert (a).

(f) Γ(q, q̄) = c₁ + c₂ and Γ(q, q) = 2a. By (b) and (a) the left side is
2‖2P₁,₁V + P₂,₂V‖² + 4‖P₂,₀Q‖² + ‖P₃,₁Q‖² = 8‖P₁,₁V‖² + 2‖P₂,₂V‖² + 4‖P₂,₀Q‖² + ‖P₃,₁Q‖²; subtract from 6δ given by (e).
The second left side is ½‖2P₁,₁V + P₂,₂V‖² + 2‖a‖² = 2‖P₁,₁V‖² + ½‖P₂,₂V‖² + 2‖P₂,₀Q‖² + ½‖P₃,₁Q‖²; subtract from 3δ. ∎
**[P; C: all of (a)–(f) checked in exact rational arithmetic on random cubics in n = 1, 2, 3,
`scripts/check_identities_exact.py`]**

*Wick monomial check.* For q = c·X(|X|² − 2)/√2: ‖P₂,₀Q‖² = 8u², ‖P₃,₁Q‖² = 24u², ‖x‖² = 5u², ‖a‖² = 14u²,
‖P₁,₁V‖² = 9u², ‖P₂,₂V‖² = 25u², and (d) reads 42u² = 8u² + 24u² + 10u²; (e) reads 42u² = (16 + 24 + 36 + 50)u²/3;
(f) reads 178u² = 252u² − 24u² − 50u² and 58.5u² = 126u² − 12u² − 18u² − 37.5u².

*Remark (the budget factors).* With Q = (Re q, Im q), Γ_ab its real carré du champ and 𝒟 = Γ − (3u/2)I:
the first left side of (f) is E[(tr 𝒟)² + 2‖𝒟‖²_F], the budget "≤ 6δ" of
`sources/received-2026-11-15-tilted-sector/content_profile_proof.md` (3), used for 11.30 ((2/25)δ) and 11.41/11.49
(the shifted resolvent); the second is E‖𝒟‖²_F = Σ_{a,b} Var Γ_ab, the budget "≤ 3δ" of the proof of 11.29
(`REPORT_localization_history.md` §3.2, (6)–(7)). The change of variables is checked in §6. (f) gives both exact
defects. On the Wick monomial 6δ/(6δ − defect) = 252/178 = 1.4157… (the "budget factor ×1.4" of the degree-5 notes,
issue #453) and 3δ/(3δ − defect) = 126/58.5 = 2.154…. The antiholomorphic representation below uses (d), whose budget
is exact.

## 3. Content as a linear functional of the Stein pair

**Theorem 3 (content representation).** Let h: [0, ∞) → ℂ be continuous with polynomial growth and k = 𝒦_u h. For
every q ∈ H₂,₁(ℂⁿ), every n and every unit e ∈ ℂⁿ,

    E[ȳ_e·q·h(V)] = E[ȳ_e·k′(V)·(q̄·a + q·(c₂ − u))]
                  = ⟨y_e q·conj(k′(V)), a⟩ + ⟨y_e q̄·conj(k′(V)), c₂ − u⟩.

*Proof.* Lemma 1 with G = ȳ_e k(V) (∂_jȳ_e = 0 and ∂_jV = q̄∂_jq + q∂_jq̄):
E[ȳ_e q k(V)] = E[ȳ_e k′(V)(q̄a + q c₂)]. Subtract u·E[ȳ_e q k′(V)] and use k − uk′ = h. ∎ **[P; C for h(v) = vᵐ,
m ≤ 3, exactly; N for the peak profiles g and h_{3/5}, `numerics/mono.py`, `numerics/twovar.py`]**

Remarks. (i) Only N₂q = q, E c₂ = u and the definitions enter; the profile may be complex. So the theorem covers every
first-chaos content Π₁[q·h(|q|²)] of a remote cubic: the raw, tilted and retained A- and B-contents at degree 3, and
the A/B-shell contents of the degree-5 row for whatever radial profile they have. The transform 𝒦_u is
one-dimensional; no two-dimensional resolvent appears.
(ii) For h(v) = v one has k′ ≡ 1, so the leading tensor of ledger 6.3.12 and item 21 is exactly
E[ȳ_e q|q|²] = ⟨y_e q, a⟩ + ⟨y_e q̄, c₂ − u⟩.
(iii) The phase of q enters through a, i.e. by (a) through the low chaos of q² (phase doubled), paired with the
explicit test functions y_e q k′(V) and y_e q̄ k′(V).

**Theorem 4 (projected content bound).** In the setting of Theorem 3 put G_e = y_e q·conj(k′(V)),
G′_e = y_e q̄·conj(k′(V)) and

    Ω_e = ‖P₂,₀G_e‖² + ¼‖P₃,₁G_e‖² + ½‖P₁,₁G′_e‖² + ½‖P₂,₂G′_e‖².

Then |E[ȳ_e q h(V)]|² ≤ δ·Ω_e, hence ‖c[h]‖² ≤ δ·sup_e Ω_e. Dropping the projections,
Ω_e ≤ (3/2)·E[|y_e|²·V·|k′(V)|²] ≤ (3/2)·sup_v v|k′(v)|².

*Proof.* By Theorem 2(a),(b), ⟨G_e, a⟩ = ⟨P₂,₀G_e, P₂,₀Q⟩ + ½⟨P₃,₁G_e, P₃,₁Q⟩ and
⟨G′_e, x⟩ = ⟨P₁,₁G′_e, P₁,₁x⟩ + ⟨P₂,₂G′_e, P₂,₂x⟩. Cauchy–Schwarz in ℝ⁴ with weights (1, 1, 2, 2) on
(‖P₂,₀Q‖, ‖P₃,₁Q‖, ‖P₁,₁x‖, ‖P₂,₂x‖), whose weighted square sum is δ by Theorem 2(d), gives the first claim. For the
second, ‖P₂,₀G‖² + ‖P₃,₁G‖² ≤ ‖G‖², ‖P₁,₁G′‖² + ‖P₂,₂G′‖² ≤ ‖G′‖², and ‖G_e‖² = ‖G′_e‖² = E[|y_e|²V|k′(V)|²]. ∎ **[P]**

## 4. The deficit as a linear functional of the same pair

**Theorem 5 (deficit representation).** Let φ: [0, ∞) → ℝ be C¹ with φ, φ′ of polynomial growth, B_φ(u) = E φ(uτ),
K = 𝒦_uφ and γ(v) = (B_φ(u) − K(v))/v (γ ∈ C¹[0, ∞) because K(0) = B_φ(u) and K ∈ C²). For every q ∈ H₂,₁,

    B_φ(u) − E φ(V) = −E[(c₂ − u)·K′(V)] + E[q̄²·a·γ′(V)].

With φ(v) = 2E_{z₁}|L + √v| the left side is the same-variance deficit D(q) of the ledger (1.8).

*Proof.* Lemma 1 with G = q̄γ(V): E[Vγ(V)] = E[c₂(γ + Vγ′)(V)] + E[q̄²aγ′(V)] = −E[c₂K′(V)] + E[q̄²aγ′(V)], since
Vγ = B_φ − K. Also uE[(Vγ)′(V)] = −uE[K′(V)]. Subtract: E[Vγ − u(Vγ)′](V) = B_φ − E(K − uK′)(V) = B_φ − Eφ(V). ∎
**[P; C for φ(v) = vᵐ, m ≤ 3, exactly; N at the peak (agreement 10⁻⁶ relative on five two-variable cubics)]**

So content and deficit are both linear in the one antiholomorphic Stein pair (a, c₂ − u), with test functions
y_e q k′(V), y_e q̄ k′(V) for the content and q² γ′(V), K′(V) for the deficit; and their natural size, δ, is the
exact quadratic form of Theorem 2(d).

## 5. What the bound of Theorem 4 sees (numerics, label N)

Peak row, profiles recomputed independently (`numerics/prof.py`; j₀, g₀, B₀ and S agree with ledger 1.4/3.14 to
≥ 12 digits). Ratios are of squared content to δ or to D.

**Wick monomial** (`results/mono.log`): Theorem 3 reproduces the true content to 10⁻⁵; the projected bound is within
**1.23–1.44×** of the truth at u = 0.009 … 0.0463 (raw and tilt 3/5); the unprojected bound loses 3–11×. At
u = 0.0463: raw C²/D = 0.0876, δΩ/D = 0.112; tilt C²/D = 0.0114, δΩ/D = 0.0164. Each of the four projected
pairings is perfectly aligned there (cosine 1.00); the whole 1.28× is the cross-component weighting.

**Two variables** (`results/twovar.log`, u = 0.0463, grid 44×40; every identity of §§2–4 re-checked by quadrature):

| cubic | χ | raw C²/D | raw δΩ/D (loss) | tilt C²/D | tilt δΩ/D (loss) |
|---|---|---|---|---|---|
| monomial | 42 | 0.0876 | 0.112 (×1.28) | 0.0114 | 0.0164 (×1.44) |
| best tensor of 6.4.2 | 40.0 | 0.0876 | 0.124 (×1.41) | 0.0115 | 0.0193 (×1.69) |
| mixed | 33.4 | 0.0840 | 0.150 (×1.79) | 0.0113 | 0.0256 (×2.28) |
| H(X) + H(Y) | 21 | 0.0653 | 0.153 (×2.34) | 0.0099 | 0.0294 (×2.98) |
| X(\|Y\|² − 1) | 16 | 0.0410 | 0.165 (×4.02) | 0.0061 | 0.0349 (×5.70) |

**Survey of all of H₂,₁(ℂ²)** (`results/survey_*.json`, `results/fine_eval_*.log`; random starts and Nelder–Mead, so
lower bounds on suprema): see the README for the table. At u = 0.0463 the largest δΩ_e/D found is **0.229** for the raw
profile and **0.047–0.048** for the tilt 3/5 (two searches), both at χ ≈ 17–18, where the truth is 0.033 and 0.006
(losses ×6.9 and ×8.2–8.5).
The largest C²/D found is 0.0876 (raw) and 0.0121 (tilt). At the extremal tensors the alignment cosines of the four
pairings are 0.68, 0.30, 0.59, 0.17 (raw) and 0.59, 0.26, 0.56, 0.15 (tilt) for H₂,₀, H₃,₁, H₁,₁, H₂,₂: the loss sits
in the two top components.

**The law-free and law-aware forms do not help by themselves.** (3/2)sup_v v k′(v)² at the tilt is 0.0443 at
u = 0.0463 and 0.0600 at u = 0.009, against the certified γ = 0.0325 and 0.0502 of ledger 11.49. The gain is in the
projection, not in the radial transform.

## 6. Consequences, and what is still missing

1. **A sharp, exact budget.** Every content bound that pairs (a, c₂ − u) with test functions can use δ exactly
   (Theorem 2(d)); the real chains lose the factors of Theorem 2(f) (1.42 and 2.15 on the monomial).
   Change of variables for (f): with y_j = (G_{2j−1} + iG_{2j})/√2 and Q = (Re q, Im q), Γ_real = Γ,
   tr 𝒟 = Γ(q, q̄) − 3u and Γ(q, q) = Γ₁₁ − Γ₂₂ + 2iΓ₁₂. For 𝒟 = [[α, β], [β, γ]]:
   (tr 𝒟)² + 2‖𝒟‖²_F = 3α² + 3γ² + 2αγ + 4β² = 2(Γ(q, q̄) − 3u)² + |Γ(q, q)|², and
   2‖𝒟‖²_F = 2α² + 2γ² + 4β² = (Γ(q, q̄) − 3u)² + |Γ(q, q)|². The second identity is also checked by Monte Carlo in
   real coordinates (agreement to 10⁻⁷).
2. **Route (B), degree 5.** Theorem 3 applies verbatim to the degree-5 A/B contents with their (complex) radial
   profile and a one-dimensional transform. Theorem 4 has no supremum over the radius and no budget loss; its only
   loss is the degree-≤4 Cauchy–Schwarz. At degree 3 with the tilt, the largest δΩ_e/D found on H₂,₁(ℂ²) is 0.048,
   about 6× below the 0.3 of 11.50 (a search over two variables, not a bound). The degree-5 profiles and the band rows are not in the repository, so the degree-5 effect
   is not computed here.
3. **Route (A), raw content with κ ≈ 0.10: an obstruction to this route.** Theorem 4 with exact projections gives
   δΩ_e ≥ 0.229·D on a two-variable cubic at u = 0.0463 (N). So the raw content inequality with κ < 0.229 cannot be
   proved by Cauchy–Schwarz on the antiholomorphic Stein pair, even with exact low-chaos projections and an exact
   budget. A proof must use the alignment in the top components P₃,₁ and P₂,₂, i.e. the third-order contraction
   structure behind the δ^{3/2} size of the leading tensor (6.3.12), at finite amplitude.
4. **The missing lemma, common to both routes:** a computable majorant of sup_e Ω_e (or of the four pairings) in
   terms of quantities a (u, χ) certificate can handle. Ω_e is the squared dual norm of the radial function k′(V)
   against the polynomials w̄ y_e q + w̄′ y_e q̄ with w ∈ H₂,₀ ⊕ H₃,₁, w′ ∈ H₁,₁ ⊕ H₂,₂ — the same kind of object as
   the content itself, one chaos level lower and with a smoothed profile. Iterating Lemma 1 on these pairings is the
   natural next step.
