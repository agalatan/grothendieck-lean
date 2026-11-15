<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_M1_TH.md (file dated 2026-10-21). Only this line was added. -->
# Prompt for the lower-bound GPT: the transverse even-sector inequality (TH)

Context: programme `PLAN_1402.md`, milestone M1 (even-sector elimination). Manuscript: `handoff-2026-10-15/`, Chapters 25, 36,
56–58. The IDE scripts referred to below are in `circular-mean-20261020/`.

## Setting (peak profile)
a = 699/1250, b = 179/1250, p = 2500/1891, L = Z(a + b|Z|²), T = |Z|², ℓ(T) = √T(a + bT).
Odd part O = q + (T−1)r_A + Z² r_B/√2 (q ∈ H₂₁(X), r_A ∈ H₁₀, r_B ∈ H₀₁, arbitrary coupling).
Even part E = ZY + Z̄W + νH(Z), with Y ∈ H₁₁(X), W ∈ H₂₀(X), ν ∈ ℂ, H(Z) = Z(T−2)/√2. Put w = L + O.

By X → −X, Λ(O+E) − Λ(O) = E[|w+E| + |w−E| − 2|w|] − p‖E‖². Its second variation at E = 0 is
2(E[(Im(w̄E))²/|w|³] − p‖E‖²).

**Target (TH):** E[(Im(w̄E))²/|w|³] ≤ (p − δ₀)‖E‖² for all odd O in the response-feasible domain (Ch. 25:
‖q‖² < 0.0463, ‖r_A‖² < 0.0328, ‖r_B‖² < 0.0185 at t ≥ 0.84, and the sector ellipsoid of §sector-rice-feasibility).

## What the IDE has established [F unless marked]
1. **Fibre form.** Conditioning on the remote values, write c = (q, r_A) and take r_B = 0 first. Then
   (Im(w̄E))²/|w|³ = (T/ℓ)·cᵀK(r)c, with r = |q + (T−1)r_A|/ℓ, c = (Re(y+ντ), Im(y+ντ), Re w′, Im w′),
   τ = (T−2)/√2, w′ = w·e^{−2i arg A}. The universal matrix is K(r) = mean_θ Im(P_k)Im(P_l)/|1+re^{iθ}|³,
   P_k = (1+re^{iθ})h_k, h ∈ {1, i, e^{−2iθ}, ie^{−2iθ}}. K(0) = diag(0, 1, ½, ½); K is log-singular only at r = 1.
2. **(Y,W) part, fibrewise.** φ′(ρ) = sup_q λ_max ∫e^{−T}(T/ℓ)RᵀK(r(T))R dT, with |r_A| = ρ. It is ≤ 1.19 on [0, 0.3], peaks at
   3.39 at ρ = 0.5 (a tangency band: q ≈ 0.65 phase-aligned with r_A), and is 1.26 at ρ = 1. Since r_A is rank one
   (r_A = √y X₁), multiplication by φ′(√y|X₁|) is block-diagonal on H₁₁ ⊕ H₂₀. Hence the (Y,W) part is
   ≤ max{E[(S−1)²φ′], E[(S²/2)φ′], E[Sφ′], E[φ′]}(√(yS))·‖(Y,W)‖², S ~ Exp(1). This holds for y ≲ 0.0284, any coupled q.
3. **Band stress test.** Families q = cH(X₁), r_A = 0.181X₁ (the largest feasible y) give an exact form ≤ 1.134 < p. The band
   is an artefact of the per-fibre supremum.
4. **ν block.** Fibrewise sup λ_max F_ν ≤ 1.238 < p (0.992 at O = 0). The ν-only step is fibrewise.
5. **The ν–Y cross term is the obstruction.** It equals ν·E_X[Y(X)ᵀG(c(X))], with G(c) = E_T[(T/ℓ)τ(K(r_c(T)) − K(0))]
   (2×2 in (Re, Im)). E[Y] = 0 removes the constant part −0.608 (the "(z,H)-plane 1.71 > p" coupling). On families the actual
   cross norm δ is 0.03–0.09, while sufficiency needs δ ≲ 0.06 (worst-case diagonal blocks) to 0.3 (family blocks). Crude
   bounds (sd, hypercontractive duality, worst-case laws) give δ ~ 0.5–1, because they allow spiky laws of |q|.

## Requested
(A) **A content lemma for δ = ‖Π_{H₁₁⊕H₂₀} G(c(·))‖** in the style of Ch. 56–57 (Malliavin integration by parts:
    Π₁₁f = ½E[DD̄f], with the influence h, the cumulant κ ≤ (50/3)eh, and the content of q and r_A). It should be explicit in
    (e, y, h, κ) and use the boundedness of G (|G| ≤ 1.09), so that δ ≤ ~0.06 on the feasible domain, or on a large
    explicit sub-region of it.
(B) **A band lemma.** For fixed remote coordinates other than X₁, S ↦ q is a polynomial of degree ≤ 3 in X₁, so it crosses
    the tangency band transversally. Show that the excess of the per-fibre bound over the q = 0 profile
    (≤ 1.167 for every y ≤ 0.04) is small after weighting by (S−1)²e^{−S}, for y up to 0.0328.
(C) Any cleaner global argument for (TH) or for (EE) itself that keeps the transverse structure. Note: the parallelogram
    linearisation E[|E|²/|w|] ≤ p‖E‖² is **false** on the feasible domain (1.3395 at O = 0.15H(X) + 0.1(T−1)X), and
    concavity along even directions (EC) is false at even bases.

Deliver [P] statements, rational replays [C] where constants are claimed, and a porting note. No endpoint claims.
