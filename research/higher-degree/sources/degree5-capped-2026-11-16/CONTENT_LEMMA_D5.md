<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CONTENT_LEMMA_D5.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# The order-1 (A/B) content lemma for the capped degree-5 rows

Research worker for claude-b9ee (issue #453), 16 November 2026: round 1 (§§1–7), round 2 (§§8–10, response
constraints and the band) and round 3 (§11, the antiholomorphic frame T3–T4 on the band). Labels:
- **P**: proof on paper (author only, this session); in §11 it means: given the package's T3–T4, which an independent
  review has confirmed;
- **C**: exact or interval-certified; here only the response caps of §8.2 (exact rational arithmetic);
- **N**: floating point (deterministic quadrature, LP/SOCP solvers).

Code and outputs: `content5/` beside this file (§7). Sources: `CAPPED_GATE.md` (§§1, 2, 4, 6), `SHARING_LEMMA.md`,
`research/conjecture-K/STATUS.md` (6.2–6.5, 11 (b)), `MONOGRAPH.md` §§2.5–2.6. Round 3:
`handoff/research-degree5/antiholomorphic-stein-2026-11-17/package/` (README.md, NOTE.md) and `REVIEW.md` beside it.

Game λ = (1, −0.78, 0.0779): p₁ = 1/0.78 = 1.2821, p₂ = 1/0.0779 = 12.837. Rows: `capgate/rows5.lines`; binding rows
t = 0.80–0.886.

## 0. Answer (current state)

1. **The lemma (§1).** For every remote cubic q of an actual response:
   G_AB(q) ≤ κ_AB(D(q) + V_sl(u)) + η_AB, with κ_AB + κ_h ≤ 1. Through a global A/B secant margin μ it is the content
   lemma ‖c_{A,s}‖² + ‖c_{B,t}‖² ≤ 4μκ_AB(D + V_sl), against **the same law's** gap to the benchmark.
2. **The retained tilt (11.12 at degree 5, P).**
   - ξ = −s r_A − t r_B turns the profiles into Γ_A + sΓ₀ and Γ_B + tΓ₀.
   - At (s, t) ≈ (0.4, 0.3) the true constant on every hard family falls from 0.30–0.72 to **0.058–0.10**: junta,
     spikes, X(|Y|² − 1), Wick + shared drivers, and a search over H₂,₁(ℂ²).
   - The pointwise A/B margin rises from 0.19–0.32 to 0.37–0.45 (N, §4).
3. **Response caps (§8; P, with exact checks C).** The degree-5 analogues of ledger 2.12a/2.12b hold with ε₁ = 39/50:
   - remote cap u ≤ 4ε₁²B(A − t);
   - total cubic energy ‖G₃‖² ≤ ε₁²[(3/2)(π/4 − t²) + B(A − t)];
   - at the active-interval ends the remote cap is 1.09–1.27 σ*² on t = 0.80–0.875 (1.46 at 0.88).
   - A law-dependent form also holds (P): **E ρ(λ²|q|²) ≥ t + λu/ε₁ for all λ**. It is linear in the law and enters
     the law layer directly.
   - Together they **remove every large-u failure** of round 1, and exclude the spiky end χ ≳ 30 near σ*².
4. **What closes now (N)**, with (S), (F), the Stein law layer, the caps and the law-dependent family, κ_AB = 0.82.
   Maximum excess in gain units, against the stage-2 room:

   | t | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 | 0.86 | 0.865 | 0.87 | 0.875 | 0.88 |
   |---|---|---|---|---|---|---|---|---|---|---|---|
   | excess | 1.8e-2 | 7.3e-3 | 2.5e-3 | 1.2e-3 | 9.0e-4 | 5.1e-4 | **1.7e-4** | **3e-5** | **≤ 0** | **≤ 0** | **≤ 0** |
   | room | 1.79e-3 | 7.52e-4 | 4.10e-4 | 3.82e-4 | 3.82e-4 | 3.94e-4 | 4.47e-4 | 5.42e-4 | 6.76e-4 | 8.51e-4 | 1.08e-3 |

   - **The lemma closes in its allowance form on t ≥ 0.86**: it uses at most 39 % of the room at 0.86 and 6 % at
     0.865, and nothing on t ≥ 0.87.
   - These use the pointwise A/B margin. With the conservative finite-amplitude conversion of §4.1 (μ = 0.359 at
     t = 0.86), t = 0.86 reaches 4.7·10⁻⁴, 104 % of its room, so the secant certificate (§10, item 2) decides that row.
   - **It stays open on t ≤ 0.855.** What is left is the moderate-kurtosis band u ≈ 0.8–1.05 σ*², χ ≈ 2–16.
   - Round 3 (§11, items 9–10) closes no further row.
5. **How much sharper (S) must be (§9.3, N).**
   - ×1.5 closes t = 0.855, and ×2 closes 0.845–0.85 outright.
   - ×2 brings 0.84 to 3.8·10⁻⁴, 92 % of its room.
   - 0.82 needs ×3 (1.7·10⁻⁴ of 7.5·10⁻⁴); 0.80 needs more than ×3.
   - This is the "2–3×" of the request.
6. **Where (S) loses in the band (§9.1).** On the spike family the total loss is 17–20×.
   - The dominant loss is the **projection** (×4–7): only the first-chaos part of (1/3)𝒟 : D²Ψ(Q) counts, while (S)
     bounds its whole L² norm.
   - Then the sup over radius (×1.6–2.4), the Stein budget (×1.42) and the operator norm (×1.2–1.3).
   - At the junta the radius loss is ×3.3 and the projection ×3.45.
7. **What was tried and why it fails (§9.2).**
   - Radial split (S)/(F): the Gaussian floor of (F).
   - Order-2 resolvent (F₂): exact on the junta, but its Hessian peaks at R → 0, ×110.
   - Conditioning on |q| plus a statistic: the inherited Stein inputs fix conditional means only, so the relaxation
     recovers sup N (P).
   - Gram dominance in (F): X·P(Y) has χ = 2 and dominance 1/2.
   - Budget: intrinsic to the law layer.
   - Laguerre expansion: tail-dominated.
8. **The missing step (§9.4, §10).** A first-chaos (projection-aware) bound for the resolvent remainder: contractions
   with the operator norm of 𝒟's chaos-2 part, plus a dominance split (spike layer for dominant directions). It is the
   degree-5, tilted form of ledger 6.3.18. The factor still needed is ×1.5–2 on t = 0.84–0.855, ×3 at 0.82, more at
   0.80, all with the pointwise margin.
   Round 3 gives the step a second, more concrete form: a certified majorant of the T4 quantity Ω at the content
   direction (items 9–10).
9. **The frame T3–T4 on the band (§11; N; nothing closed).**
   - T3, T2a and T2d hold at the tilted degree-5 profiles on everything tested: relative error at most 7.5·10⁻⁴, and
     10⁻⁵–10⁻⁶ with a diffuse bulk. The package's proofs were reviewed independently during the round (no gap).
   - Against the same cubic's deficit, δΩ at the content direction is at most 0.49, 0.38, 0.28, 0.28, 0.23, 0.21 of the
     allowance at t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855. So the frame has room: a majorant may be 2–5 times
     looser than Ω_{e*}.
   - With sup_e the shares are 1.03, 0.72, 0.46, 0.40, 0.35, 0.29: no room at 0.80. The supremum sits in the
     zero-content class (X²Ȳ) and is the wrong object; the lemma needs the content direction only.
   - T4 is 3–4× sharper than (S) on the band if Ω_{e*} can be bounded. Its own loss is ×1.3 on the junta and ×6–10 at
     low kurtosis. Its law-free corollary is no better than (S).
10. **What a majorant of Ω must achieve (§11.4–11.6).**
   - The natural target is the law functional Ω̂ = (3/2)E[V k′²] − (3/4)(E[V k′])²/u. A certified Ω_{e*} ≤ θΩ̂ keeps
     the row inside its room for θ up to 0.37, 0.64, 1.33, 1.88, 2.5 and about 3.7 (same six rows).
   - Measured: Ω_{e*} is at most 0.78, 0.86, 0.95, 0.98, 1.01, 1.04 times Ω̂ on cubics with content. So a constant θ
     has room on t = 0.84–0.855 (40 % at 0.84, 90 % at 0.845, a factor 2.5–3.5 above). It has none at 0.80–0.82, where the
     majorant must fall with concentration as Ω_{e*} does.
   - Proved (P, mine, given T4): θ = 1 in directions q does not depend on, and two Bessel majorants, M₁ (joint law)
     and (PM) (law layer). With (PM) the law-layer excess is 82 % of the room at t = 0.855 (pointwise μ) and
     1168 %, 1100 %, 603 %, 338 %, 181 % of it at t = 0.80, 0.82, 0.84, 0.845, 0.85.
   - **Open:** Ω_{e*} ≤ θΩ̂. It is not a perturbation of the orthogonal case: the cubic part of q k′(|q|²) alone gives
     up to 5× the Gaussian floor, and the quintic part cancels this at first order in the influence.
---------------------------------------------------------------------------------------------------------------------

## 1. The lemma, in the form CAPPED_GATE §6 needs

**Row data.** A capped row r = (t, ℓ, β, b_A, b_B, ν₅) (c₅ = 0). With z the visible coordinate and w the remote ones:

    L′(z) = z(ℓ + β(|z|² − 2)) + ν₅e₃₂(z),    D(z) = 1 − b_A e₁₁(z) − b_B e₂₀(z),
    A_±(q) = L′ ± (q(1 − b_A e₁₁) − b_B q̄ e₂₀)                       (= L′ ± sD after rotating q to s = |q| ≥ 0),
    ψ(s) = E_z[|A₊| + |A₋|],   B₅(u) = E ψ(√u |W|),   D(q) = B₅(u) − E ψ(|q|)   (u = E|q|²),
    cost(u) = k_q u + ν₅²/η,  k_q = p₁ − (b_A² + b_B²)/η,   S₅ = sup_u [B₅(u) − cost(u)],   V_sl(u) = S₅ − B₅(u) + cost(u) ≥ 0.

So D(q) + V_sl(u) = S₅ − Λ₅(q) is the gap of the q-only functional to the row's benchmark (it is ≥ −η_R by the remote
cap of the law layer).

**How the lemma feeds stage 2 (P).** Stage 2 uses K₅ only through the law layer's supremum G⁺ ≥ max(Λ₅(q), S₅).
- Suppose the A/B shells take κ_AB(D + V_sl) and all other sectors take κ_h(D + V_sl), with κ = κ_AB + κ_h ≤ 1.
- Then Λ̂₅(G) ≤ Λ₅(q) + κ(D + V_sl) + η = (1 − κ)Λ₅(q) + κS₅ + η ≤ G⁺ + η.
- This is the assembly 11.23 with V_sl in the role of the Gaussian slack.

**Profiles.** For the A shell (visible e₁₁, remote H₁,₀), the B shell (visible e₂₀, remote H₀,₁) and the auxiliary
direction "visible 1, remote H₁,₀":

    Γ_A(q) = E_z[ē₁₁(ph A₊ − ph A₋)] = Γ_A(|q|) ph q,   Γ_B(q) = E_z[ē₂₀(ph A₊ − ph A₋)] = Γ_B(|q|) conj(ph q),
    Γ₀(q)  = E_z[ph A₊ − ph A₋]       = Γ₀(|q|) ph q.

(P: the joint rotation z → e^{iφ}z, q → e^{iφ}q multiplies A_± by e^{iφ}; at real q the integrals are real by
z → z̄.) The **contents** are c_A(q) = Π_{H₁,₀}[Γ_A(|q|) ph q], c_B(q) = conj Π_{H₀,₁}[Γ_B(q)] = Π_{H₁,₀}[Γ_B(|q|) ph q],
c₀(q) = Π_{H₁,₀}[Γ₀(|q|) ph q], all of the ledger's form Π₁[q·h(|q|²)].

**Gain.** G_AB(q) = sup over remote linear r_A, r_B of [Λ̂₅(q + e₁₁r_A + e₂₀ r̄_B) − Λ₅(q)], where Λ̂₅ is the retained
functional of §3.1 (Λ̂₅ ≤ Λ₅; with Λ₅ in place of Λ̂₅ this is the gate's gain).

**The lemma (S3-AB, same-law form).** On every binding row (t = 0.80–0.886), for every remote cubic q ∈ H₂,₁(w) in any
number of remote coordinates,

    (S3-AB)   G_AB(q) ≤ κ_AB·(D(q) + V_sl(u)) + η_AB,      κ_AB + κ_h ≤ 1,

where κ_h is what the quintic shells take (≤ 0.16 exact, ≤ 0.18 in the decoupled chain; CAPPED_GATE §2) and η_AB is 0
or a part of the row's stage-2 room (3.8·10⁻⁴ at t = 0.845–0.85). I use κ_AB = 0.82 below.

**Factorisation (the form a proof takes).** With tilts (s, t) and a global secant margin μ_{s,t} (§3.2):

    G_AB(q) ≤ [‖c_{A,s}(q)‖² + ‖c_{B,t}(q)‖²] / (4μ_{s,t}),    c_{A,s} = c_A + s·c₀,   c_{B,t} = c_B + t·c₀,

so (S3-AB) follows from the **content lemma**

    (CL)   ‖c_{A,s}(q)‖² + ‖c_{B,t}(q)‖² ≤ 4μ_{s,t} κ_AB (D(q) + V_sl(u)) + 4μ_{s,t} η_AB.

The gate's form is s = t = 0 with μ = μ_chain = (1 − ρ_AB(0))p₁ (0.257 at t = 0.84). The constant "0.30–0.42" quoted in
the task is Σκ* of the exact coupled model; the A/B part of it is 0.10–0.34, and the decoupled chain's is 0.17–0.72
(CAPPED_GATE §2(a), (b)).

---------------------------------------------------------------------------------------------------------------------

## 2. Transfer of 11.49–11.51 and of 6.3, step by step

| ledger step | what it is | transfers? | the capped rows (N unless marked) |
|---|---|---|---|
| 11.12 tilt identity | Λ̂(q + (T−1)r) ≤ 2E\|L + q + (T−1+s)r\| − p‖q‖² − (p − s²)‖r‖² | **yes, verbatim (P, §3.1)**, now with two tilts: ξ = −s r_A − t r_B, penalty ‖s r_A + t r_B‖² (cross term kept, as in BUDGET_AUDIT §1 of #426) | the gate did not use it; it is the decisive change (§4.1) |
| 11.13 local cost k(s) | 0.320 → 0.607 at the cubic peak | yes (same expansion) | pointwise margin μ_{s,t} = λ_min(C_{s,t} − M(q)) over all \|q\| ≤ 3: **0.257 untilted → 0.431 at (s, t) = (0.4, 0.3)** (t = 0.84; §4.1) |
| 11.32/11.33/11.37/11.39 global secant | Rem ≤ (13/20)\|ρ\|², four regions, 102,104 boxes | method yes; certificate new per row | two complex directions (A and B tilted together) plus w: the five-parameter compact region of the cubic's joint secant (J) of #426, which is open there. Here the margin is large (true contents are 6–12× below the budget, §4.2), so a crude secant suffices |
| 11.40 gain ≤ C²/k | integrate the secant, complete the square | **yes (P)**, given the secant | gives the factorisation of §1 |
| 11.29 Frobenius structural bound | ‖Π₁[q h(\|q\|²)]‖² ≤ (3/4)δ E m_h(\|q\|²) | yes (P, profile-free) | useless here: E m_h is 10–20 per unit δ (h′ ≈ 2–3.5), over 100× the true content |
| 11.30 uniform bounds | (2/25)δ; range-centred (19321/10⁶)u; 1/50; 3δ^{3/2} | yes in method | the range-centred branch is superseded by the variance bound (F) of §3.4, 2.8× the truth on the junta |
| 11.31 zero-content class | Π₁F(q) = 0 for q = Σ a X_iX_j conj(Y_k) over independent blocks | **yes, verbatim (P)**: every radial profile, tilted or not | includes X²Ȳ, XYZ̄ and the shared drivers X·P(Y, Z) with P of charge 0 in a separate block |
| 11.41/11.49 shifted resolvent, energy-dependent γ | ‖c‖² ≤ (2/3)δ sup_R N_{Ψ_u}(R), Ψ_u = ∫e^{t/3}P_tΦ | **identity yes (P, profile-free)**; the scalar reduction to the 1-D source m(x) and the barrier k_u **no**: the visible variable enters as L′ + qD(z) − b_B q̄ e₂₀, not as L + q, so the phase identity does not reduce the profile to one real variable. The radial resolvent ψ_u must be enclosed in 2-D (Rice/Bessel kernels; C per row) | at u = σ*², t = 0.84: untilted γ_A = 0.568, γ_B = 0.168 (14× the junta's 0.041 + 0.012); tilted (0.4, 0.3): 0.238 + 0.044 (17× the true family sup 0.016) |
| 11.43/11.50 content against deficit | 178 boxes; Hermite caps of h(v) = 2E\|L + √v\|; 119 Stein duals; chords | method yes (same Lean law inputs, Ψ₅ in place of h; caps need h⁗ ≤ 0 for ψ(√v), not checked) | law layer at u = σ*², t = 0.84: d = D/δ ≥ 0.056 (moments) / **0.070 (Stein)** at χ = 42, 0.107 at χ = 8, 0.143 at χ = 2 (saturated: 21 → 78 tests change it by < 2 %). The junta itself has 0.114 |
| 11.51 assembly | κ = 56730/59009 < 1, η = 1.9·10⁻⁵ | yes (P), 11.23 with V_sl in place of the Gaussian slack | — |
| 6.3.1 moment theorem | E\|P\|⁶ ≤ 37pE\|P\|⁴ − 68p³ | yes (profile-free) | — |
| 6.3.2–6.3.4 X·P, Gaussian-factor class | κ = 0.22, 0.239 | method yes: for q = X·P(Y) content and deficit are functionals of the law of P, a genuine same-law family; kernels new | the tilted ratio of X(\|Y\|² − 1) is in §4.2 |
| 6.3.5–6.3.6, 6.3.13–6.3.15 Wick/self-interaction families | 0.23, 9/40; open strips | method yes, constants new | Wick + shared driver: §4.2 |
| 6.3.9 mixed-character neighbourhood | C(p+h)² ≤ (6/25)D(p+h) for ‖h‖² ≤ D(p)/90 | method yes (perturbation with the off-character weight) | a neighbourhood only |
| 6.3.11/6.3.12 δ^{3/2} bounds | ‖c‖² ≤ Kδ^{3/2} | yes in method | helps only for χ ≲ (γ/(Ku))², i.e. χ < 0.05 here |
| 6.3.18 general cubic | open | **open here too** | §5 |
| 6.5.1 Gaussian-marginal obstruction | law + orthogonality + radial tests cannot suffice | yes, as a constraint: every bound below uses the Wick structure (E‖Dq‖² = 3u split as 2u + u, Stein inputs) | — |

**Constants that change, in one line each.** Cost p = 1.3221 → p₁ = 1.2821 (and k_q = 1.2391 at t = 0.84 after the
multiplier refund); the cubic profile 2E|L + √v| → ψ(√v) with L′ and the z-dependent multiplier D; local cost
k(3/5) = 0.4467 → μ_{0.4,0.3} = 0.431 (pointwise, not yet a secant); content coefficients 0.0325–0.0502 → 0.28 (tilted,
u = σ*²); deficit coefficient 0.3 → 4μκ = 1.41 (tilted); law-layer floor d ≥ 0.11 (what the cubic cover needed at
χ = 42) → 0.070 available (Stein) at the capped peak.

---------------------------------------------------------------------------------------------------------------------

## 3. Proofs (P) of the pieces, and what each one still needs

### 3.1 The retained row and the tilt identity (11.12 at degree 5)

**Claim (P).** Let Λ̂₅(G₃, G₅) = min_{ξ ∈ H₁,₀} {‖ξ‖² + E|L′ + G₅ + (G₃ − C) − ξ| + E|L′ + G₅ − (G₃ − C) + ξ|}
− ‖G₃‖²/ε₁ − ‖G₅‖²/η, with ξ in the first chaos of all coordinates. Then the exact row R2 of `DEGREE5_CERT_DESIGN.md`
§1 holds with Λ̂₅ in place of Λ₅, Λ̂₅ ≤ Λ₅, and K₅ for Λ̂₅ suffices for stage 2.

*Proof.* In R2 the step (ii) drops −‖Pk‖² ≤ 0. Keep it instead: −‖Pk‖² = min_ξ [‖ξ‖² − 2Re⟨ξ, k⟩] over ξ ∈ H₁,₀. The
term −2Re⟨ξ, k⟩ joins 2Re⟨G₃ − C, k⟩ of steps (iii)–(iv), so the k-pairing becomes 2Re⟨G₃ − C − ξ, k⟩, and step (v)
gives the two norms with G₃ − C − ξ. Taking ξ = 0 recovers Λ₅. The q-only part of the stage-2 certificate bounds
Λ₅(q) ≥ Λ̂₅(q), so nothing else changes. ∎ (This is ledger 2.10a at degree 5.)

**Tilt identity (P).** For a remote cubic q and remote linear r_A, r_B, take ξ = −s r_A − t r_B (s, t real). L′ is odd
in z (e₃₂ is odd), and q − C(q) + (e₁₁ + s)r_A + e₂₀ r̄_B + t r_B is even, so the two norms are equal and

    Λ̂₅(q + e₁₁r_A + e₂₀ r̄_B) ≤ 2E|L′ + q − C(q) + (e₁₁ + s)r_A + e₂₀ r̄_B + t r_B| − ‖q‖²/ε₁ − ν₅²/η
                                  − p₁(‖r_A‖² + ‖r_B‖²) + ‖s r_A + t r_B‖².  ∎

The first variation of the right side at r = 0 is Re⟨r_A, c_A + s c₀⟩ + Re⟨r_B, c_B + t c₀⟩ (the B pairing:
conj(e₂₀ r̄_B + t r_B) = ē₂₀ r_B + t r̄_B, and Re[r_B Γ_B(q)] = Re[r̄_B conj Γ_B(q)] with conj Γ_B(q) = Γ_B(|q|) ph q).
The quadratic cost is the Hermitian form C_{s,t} = [[p₁ − s², −st], [−st, p₁ − t²]] ⊗ I.

### 3.2 Gain bounded by content (11.40 at degree 5)

**Claim (P, conditional on a certificate).** Suppose that for all w, ρ_A, ρ_B ∈ ℂ, with
f(w, ρ) = E_z|L′ + w(1 − b_A e₁₁) − b_B w̄ e₂₀ + (e₁₁ + s)ρ_A + e₂₀ ρ̄_B + tρ_B| (the visible expression at a remote
point where q = w),

    2[f(w, ρ) − f(w, 0) − ⟨∇_ρ f(w, 0), ρ⟩] ≤ ρ* M_sec ρ,      μ_{s,t} := λ_min(C_{s,t} − M_sec) > 0.

Then G_AB(q) ≤ [‖c_{A,s}(q)‖² + ‖c_{B,t}(q)‖²]/(4μ_{s,t}) for every remote cubic q and every sharing.

*Proof.* As 11.40: apply the inequality at w = q(y), ρ = (r_A(y), r_B(y)), integrate over the remote variables; the
linear term is the first variation of §3.1 because r_A, r_B are in the first chaos; complete the square,
sup_r [Re⟨r, c⟩ − μ‖r‖²] = ‖c‖²/(4μ). ∎

The certificate is new work (the gate's item 6, now tilted). N: the pointwise (zero-amplitude) margins are in §4.1;
the finite-amplitude secant is at most that.

### 3.3 The structural bound (S): 11.49 transferred

**Claim (P).** For every remote cubic q with u > 0 and every radial equivariant Φ(x) = ph(x)Γ(|x|) such that Φ, DΦ,
D²Φ have at most polynomial growth,

    (S)   ‖Π₁Φ(q)‖² ≤ (2/3) δ · sup_R N_{Ψ_u}(R),   N = max{(3A² − 2AB + 3B²)/8, B²},  A = ψ_u″, B = (ψ_u/R)′,

where Ψ_u = ∫₀^∞ e^{t/3} P_t Φ dt = ph(x) ψ_u(|x|), P_t the planar OU semigroup with invariant complex variance u.

*Proof.* `content_profile_proof.md` §§1–3 (TILT) uses only the chaos structure of q (the exact Stein budget
E[(tr𝒟)² + 2‖𝒟‖²_F] ≤ 6δ, the identity Π₁Φ(Q) = Π₁[(1/3)𝒟 : D²Ψ(Q)] and the operator norm (4)), not the profile. ∎
For computation, ψ_u solves (u/2)(ψ″ + ψ′/R − ψ/R²) − Rψ′ + ψ/3 = −Γ, so A = (2/u)(Rψ′ − ψ/3 − Γ) − ψ′/R + ψ/R² needs
only ψ_u and ψ_u′ (N check: the identity reproduces the junta's content to 3 %, `losscheck.py`).

**Regularity.** The cubic proof gets bounded D²Φ from a signed planar density. Here Γ is a z-average of
ph(L′ + qD − b_B q̄ e₂₀); bounded second derivatives need the same density argument for the law of L′/D (D can vanish
only for |z|² ≳ 20). Not checked: open, routine.

### 3.4 A new law-functional bound (F)

**Claim (P).** For every remote cubic q ∈ H₂,₁ (any dimension, any sharing) and Φ(x) = x h(|x|²) = ph(x)Γ(|x|) with Φ
∈ C¹ and polynomial growth, with V = |q|², S = |q|,

    (F)   ‖Π₁Φ(q)‖ ≤ √(2u · Var a(V)) + √(u · E[V²h′(V)²]),
          a(V) = h + Vh′ = (Γ′(S) + Γ(S)/S)/2,   V h′(V) = (Γ′(S) − Γ(S)/S)/2.

*Proof.* Let ℓ = Σ a_i w_i be a unit holomorphic linear form; ‖Π₁Φ(q)‖ = sup_ℓ |E[ℓ̄ Φ(q)]|. Gaussian integration by
parts gives E[ℓ̄ F] = E[∂_ā F], ∂_ā = Σ ā_i ∂/∂w_i. The chain rule with the Wirtinger derivatives Φ_x = a(|x|²),
Φ_x̄ = x²h′(|x|²) gives

    E[ℓ̄ Φ(q)] = E[a(V) ∂_ā q] + E[q² h′(V) ∂_ā q̄].

E ∂_ā q = 0 because q ⊥ H₁,₀, so the first term equals E[(a(V) − E a(V)) ∂_ā q]. E[q²h′(V)] = 0 (charge 2), so the
second needs no centring. By Cauchy–Schwarz each term is at most the product of the L² norms, and
E|∂_ā q|² = a*G₁a ≤ λ_max(G₁) ≤ tr G₁ = Σ_i E|∂_i q|² = 2u, E|∂_ā q̄|² ≤ tr G₂ = Σ_i E|∂̄_i q|² = u (holomorphic and
antiholomorphic degrees 2 and 1). ∎

(F) uses exactly the Wick facts that 6.5.1 says must enter (E‖Dq‖² = 3u, split by degree). Both factors are law
functionals of |q|, so (F) can be paired with the deficit of the same law in one convex program (Var is concave in
the law). It is sharp in shape for one-coordinate juntas (G₁ has rank one there) and has a Gaussian floor: for a
Gaussian law it is ≈ 5·10⁻³ (t = 0.84), while the content and the deficit both vanish.

### 3.5 The combination principle

For each (u, χ), the content lemma (CL) holds for every admissible law (moments, sixth-moment cap, Stein inputs of
ledger 3.4) if

    max_law [ min(F_A, S_A) + min(F_B, S_B) − 4μκ(D + V_sl) ] ≤ 4μη,

and by the minimax theorem (concave in the law, linear in the weights) this is
min_{θ_A, θ_B ∈ [0,1]} max_law [θ_A F_A + (1 − θ_A) S_A + θ_B F_B + (1 − θ_B) S_B − 4μκ(D + V_sl)]: a finite family of
SOCPs, certifiable by duals as in 11.50 (the F terms add one quadratic multiplier). This is exactly 11.50's structure,
with (F) in place of its range branch (19321/10⁶)u. N results: §4.3.
---------------------------------------------------------------------------------------------------------------------

## 4. Numbers (N)

Quadrature: z on 512 radial × 512 angular nodes (profiles on 707 values of s ∈ [0, 6], linear/constant beyond), the
junta and spike families by 1-D Gauss–Legendre in T = |y|² with the bulk smoothed by a 2-D Gaussian rule, two-variable
cubics on a 3-D rule (692,224 nodes; reproduces the 1-D junta to 10⁻⁵). The untilted numbers reproduce the gate
(ρ_AB(0) = 0.7999 at t = 0.84; junta content per δ 0.0407 + 0.0121, D/δ 0.114; chain κ*_AB 0.72/0.58/0.47 at
t = 0.80/0.82/0.84). The resolvent code reproduces the junta's content through the identity of §3.3 to 3 %.

### 4.1 The tilt and the A/B cost margin

μ is λ_min(C_{s,t} − M(q)) minimised over |q| ≤ 3 (zero amplitude). The finite-amplitude ratio is
sup R/(ρ*C_{s,t}ρ) over 16 directions, amplitudes up to 6 and |q| ≤ 2–3 (`secant_tilt.py`), the analogue of the gate's
`abfin.py`. A margin is (1 − ratio)·λ_min(C_{s,t}).

| t | μ untilted | chosen tilt (s, t) | μ tilted | finite-amplitude ratio, tilted (untilted, from the gate) |
|---|---|---|---|---|
| 0.80 | 0.189 | (0.4, 0.3) | 0.367 | 0.727 at \|q\| = 0.8 (0.853) |
| 0.82 | 0.223 | (0.4, 0.3) | 0.400 | — (0.828) |
| 0.84 | 0.257 | (0.4, 0.3) | 0.431 | **0.700 at \|q\| = 0.8 (0.802)**: margin ≈ 0.31 |
| 0.85 | 0.273 | (0.4, 0.3) | 0.446 | — |
| 0.86 | 0.281 | (0.5, 0.2) | 0.415 | 0.638 at \|q\| = 0: margin ≈ 0.36 |
| 0.88 | 0.322 | (0.5, 0.2) | 0.446 | — (0.751) |

- The tilt was chosen to minimise the δ-route coefficient (γ_A + γ_B)/(4μ) on the grid s, t ∈ {0, 0.1, …, 0.6}.
- The truth prefers (0.5, 0.2–0.3), within 5 %.
- μ collapses for s ≥ 0.6 or t ≥ 0.5: there the retained penalty eats the cost, as in the cubic's k(s).

### 4.2 The true constant on the hard families

Ratio = (‖c_{A,s}‖² + ‖c_{B,t}‖²)/(4μ(D + V_sl)), maximised over the energy σ ∈ [0.02, 0.6] (and the spike amplitude),
with the pointwise μ of §4.1. Multiply the tilted columns by about 1.4 (t = 0.84) or 1.15 (t = 0.86) for the
finite-amplitude margin.

| t | junta, untilted | **junta, tilted** | spike c·H(y) + bulk, tilted (c) | X(\|Y\|² − 1) | Wick + shared, X[(\|X\|²−2)/√2·cos θ + e^{iφ} sin θ (\|Y\|²−1)] | X²Ȳ | **all of H₂,₁(ℂ²), search** (χ at the max) |
|---|---|---|---|---|---|---|---|
| 0.80 | 0.721 | **0.098** | 0.090 (0.95) | 0.047 | 0.097 | 0 | **0.102** (25.6) |
| 0.82 | 0.582 | **0.091** | 0.084 (0.95) | 0.046 | 0.091 | 0 | **0.094** (26.0) |
| 0.84 | 0.473 | **0.083** | 0.078 (0.95) | 0.044 | 0.083 | 0 | **0.085** (27.9) |
| 0.85 | 0.425 | **0.078** | 0.074 (0.95) | 0.042 | 0.078 | 0 | **0.080** (28.4) |
| 0.86 | 0.392 | **0.071** | 0.068 (0.95) | 0.038 | 0.071 | 0 | **0.073** (28.5) |
| 0.88 | 0.299 | **0.058** | 0.054 (0.95) | 0.029 | 0.057 | 0 | **0.058** (42.0) |

- The search over all six complex coefficients (Nelder–Mead, 6 starts per row) ends at a junta with a small
  shared-driver admixture, 0–4 % above the junta. This is the same picture as the cubic, where the optimum sits next
  to the Wick monomial (ledger 6.4.2).
- **The tilt cancels most of the junta's content.** At t = 0.84, along y: c_A = 0.0629, c_B = 0.0342,
  c₀ = −0.0651. So c_A + 0.4c₀ = 0.0369 and c_B + 0.3c₀ = 0.0147, and the squared content falls by 3.2×.
- **Spike family at t = 0.84, u = σ*², tilted.** The true content per δ is 0.0031 (c = 0.1), 0.0126 (c = 0.3),
  0.0164 (c = 0.6–0.7) and 0.0162 (junta), against D/δ = 0.381, 0.284, 0.182–0.160 and 0.114.

### 4.3 The δ-route of 11.49/11.50 and the combination with (F), at u = σ*²

Columns:
- γ: the transferred structural bound (S), sup over R.
- d: D/δ from the law layer at fixed χ (moments; moments + Stein).
- "fail": (γ_A + γ_B)/(4μ·0.82·d_St). The δ-route closes at that χ iff this is ≤ 1.
- "excess": max over admissible laws of [min(F_A, S_A) + min(F_B, S_B) − 4μ·0.82·(D + V_sl)]/(4μ), in gain units, at
  the worst χ.

| t | γ_A, γ_B (tilted) [untilted sum] | (γ_A+γ_B)/(4μ) [untilted] | d_mom (χ = 42) | d_St (χ = 1 / 8 / 42) | junta D/δ | fail (χ = 1 / 8 / 42) | band where (F, S) fail | **excess** | stage-2 room |
|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.221, 0.043 [0.725] | 0.180 [0.961] | 0.032 | 0.078 / 0.063 / 0.043 | 0.081 | 2.8 / 3.5 / 5.2 | χ ≥ 0.05 | **1.9·10⁻²** | 1.79·10⁻³ |
| 0.82 | 0.229, 0.044 [0.729] | 0.171 [0.818] | 0.041 | 0.111 / 0.080 / 0.053 | 0.094 | 1.9 / 2.6 / 4.0 | χ ≥ 0.2 | **7.5·10⁻³** | 7.52·10⁻⁴ |
| 0.84 | 0.238, 0.045 [0.736] | 0.164 [0.717] | 0.056 | 0.157 / 0.107 / 0.069 | 0.114 | 1.27 / 1.87 / 2.90 | 0.5 ≤ χ ≤ 30 | **2.5·10⁻³** | 4.10·10⁻⁴ |
| 0.85 | 0.241, 0.045 [0.739] | 0.160 [0.676] | 0.068 | 0.189 / 0.127 / 0.082 | 0.129 | 1.04 / 1.54 / 2.39 | 1 ≤ χ ≤ 16 | **1.0·10⁻³** | 3.82·10⁻⁴ |
| 0.86 | 0.186, 0.077 [0.745] | 0.159 [0.664] | 0.088 | 0.229 / 0.156 / 0.102 | 0.150 | 0.85 / 1.24 / 1.91 | 4 ≤ χ ≤ 16 | **1.7·10⁻⁴** (≥ 1.1·10⁻³ at 1.6σ*²) | 4.47·10⁻⁴ |
| 0.88 | 0.197, 0.080 [0.768] | 0.155 [0.597] | 0.211 | 0.366 / 0.295 / 0.221 | 0.263 | 0.52 / 0.64 / 0.86 | none at u ≤ 0.05 | **≤ 0** (u ≤ 0.05) | 1.08·10⁻³ |

- **Energy.** Scans of the same test in u (`uscan_*.log`, χ ∈ {4, 8, 16, 30}), in gain units:

  | t | u = 0.6σ*² | 0.8σ*² | σ*² | 1.25σ*² | 1.6σ*² | larger u |
  |---|---|---|---|---|---|---|
  | 0.84 | — | +7.6·10⁻⁴ (0.7σ*²) | +2.5·10⁻³ | +4.1·10⁻³ | +6.5·10⁻³ | +1.2·10⁻² (u = 0.10 = 2.1σ*²) |
  | 0.86 | ≤ 0 | ≤ 0 | +1.7·10⁻⁴ | +5.0·10⁻⁴ | +1.1·10⁻³ | +1.9·10⁻³ (u = 0.055), +1.0·10⁻² (u = 0.12) |
  | 0.88 | — | — | ≤ 0 (u ≤ 0.05) | — | — | +1.6·10⁻⁴ (u = 0.065), +4.5·10⁻³ (u = 0.13) |

  The excess at large u comes from the bounds, not from the truth: the true junta ratio peaks near σ = 0.19–0.27
  (§4.2) and falls beyond it.
- **The law layer is saturated.** At t = 0.84, u = σ*², χ = 2/8/42:
  - 21 tests: 0.1403/0.1069/0.0687;
  - 48 exponential tests: 0.1424/0.1076/0.0699;
  - plus 30 rational tests: 0.1431/0.1077/0.0699;
  - a grid twice as fine: 0.1409/0.1073/0.0699.
- **Moments-only reproduces the gate:** d = 0.0558 at m = 44.
- **The losses of (S) on the junta** (t = 0.84, u = σ*²; `losscheck.py`):

  | | true content | L² norm of (1/3)𝒟 : D²Ψ | law-weighted E[N·S]/9 | (2/3)δ sup N |
  |---|---|---|---|---|
  | untilted A | 3.96·10⁻³ | 1.64·10⁻² | 1.42·10⁻² | 5.53·10⁻² |
  | tilted A, s = 0.4 | 1.36·10⁻³ | 4.70·10⁻³ | 4.95·10⁻³ | 2.31·10⁻² |

  In factors: the projection loses ×3.5, the sup over R ×4.7, the Stein budget ×1.4 (E S = 0.413 against 6δ = 0.584).
- **(F) on the junta.** At t = 0.84 it is 2.8× the true content (3.83·10⁻³ against 1.36·10⁻³ for tilted A). Its ratio to
  4μ(D + V_sl) is 0.24, so (F) alone closes the junta with κ = 0.24. For the Gaussian law at u = σ*² it gives
  F_A + F_B = 6.1·10⁻³, where the content is 0.
---------------------------------------------------------------------------------------------------------------------

## 5. The missing step, routes, effort (round 1; updated by §§8–10)

Round 2 removes the large-u part of ℬ with the response caps (§8), and pins the remaining band and the factor still
needed (§9). The list of open items is §10.

**Precisely what is missing.** On each binding row, a content bound for remote cubics whose (u, χ) lies in the
region ℬ where neither (S) nor (F) meets the deficit of the law layer.
- At t = 0.84 and u = σ*², ℬ is χ from about 0.5 to about 30.
- ℬ widens in χ, and its excess grows, as u increases past σ*² (§4.3).

In the structural form it would suffice to have, for every remote cubic,

    ‖c_{A,s}(q)‖² + ‖c_{B,t}(q)‖² ≤ γ′(u)·δ    with   γ′(σ*²) ≤ 4μκ·d_St(χ)   on ℬ,

i.e. γ′ ≈ 0.15 (pointwise μ) or ≈ 0.11 (secant μ) at χ = 8, t = 0.84: a factor 1.9–2.6 below the transferred resolvent
bound (0.28) and still 7–9 times above the largest true value found on all hard families (0.016). Equivalently: the
general-cubic content inequality of ledger 6.3.18, at degree 5 and with the tilt, but with a margin of about 10 instead
of the cubic's 2.7.

**Why the present tools cannot give it.**
- (S) loses on the junta a factor 3.5 in the projection (only the first-chaos part of (1/3)𝒟 : D²Ψ counts), 4.7 in
  replacing the law-weighted E[N_Ψ(|Q|)·(tr²𝒟 + 2‖𝒟‖²)] by sup_R N_Ψ · 6δ, and 1.4 in the Stein budget (`losscheck.py`).
  Its sup loss cannot be recovered inside the present law layer: the Stein inputs constrain the conditional *means*
  of the Stein variables given |q|, not their conditional second moments, so the relaxation may put all of the Stein
  energy where N_Ψ is largest.
- (F) has a Gaussian floor: it does not see the phase cancellation that makes the content of near-Gaussian cubics, and
  of shared drivers such as X·P(Y) with a charge-symmetric P (11.31), vanish. A Gram-dominance refinement
  (λ_max(G₁) instead of tr G₁) does not rescue it: X·P(Y) with P Gaussian-like has χ = 2 and λ_max(G₁)/tr G₁ = 1/2.
- The law layer is saturated (d_St changes by < 2 % from 21 to 78 Stein tests and a finer grid) and is 1.6× below the
  junta's own deficit at χ = 42, because the relaxation's extremal laws are "a concentrated bulk plus a far atom",
  which no cubic has.

**Routes.**
1. *Conditional Stein energy.* An inequality E[(tr𝒟)² + 2‖𝒟‖²_F | |q|] ≤ σ(|q|) with ∫σ ≤ 6δ-type control would turn
   (S) into a law functional and remove the factor 4.7. New chaos lemma; unknown.
2. *Second-order projection.* Apply Gaussian integration by parts once more to Π₁[(1/3)𝒟 : D²Ψ(Q)] (only its
   first-chaos part counts), aiming at the projection loss 3.5. Unknown.
3. *Families plus perturbation* (6.3.3, 6.3.4, 6.3.9 transferred): exact same-law theorems for X·P(Y), Gaussian-factor
   classes and Wick + shared drivers, and the mixed-character neighbourhood around them. Covers neighbourhoods of
   families, not ℬ. Weeks.
4. *Spike layer (SC)* (`spike-layer/SPIKE_CERT.md` §5.4): handles the additive spike class (no channel in this game,
   30–60 CPU-hours), not general cubics; it would remove the junta end, which (F) already handles.

**Effort for what does transfer** (per binding row, 14 rows): the tilted secant cover (the 11.39 analogue with two
complex directions; the capped margin allows a crude cover), the 2-D resolvent enclosures of ψ_u for the tilted A and B
profiles on about 10 energy cells, the Hermite caps of ψ(√v) (h⁗ ≤ 0 to be checked) and about 10² Stein duals with the
(F) branch. That is about one to two weeks and tens of CPU-hours, of the size of TILT. It proves (CL) outside ℬ only.
**Without a new lemma for ℬ the transfer does not give κ ≤ 1 on the binding rows.**

---------------------------------------------------------------------------------------------------------------------

## 6. What this changes in CAPPED_GATE §6

- **Round 2:** item 2 now closes in its allowance form on t ≥ 0.86. The response caps of §8 should join
  CAPPED_GATE's list as an input (P + C).

- Item 2 (S3-AB) should be stated for Λ̂₅ with the tilt (s, t) ≈ (0.4, 0.3): the true constant drops from 0.47 to
  about 0.08 (pointwise μ) / 0.12 (secant μ) at t = 0.84, and the cost margin rises from 0.26 to 0.43 (pointwise) / about
  0.31 (finite amplitude). Its status: open on ℬ; P + (C to do) outside it.
- K₅ as stage 2 states it has no energy restriction. A response-energy cap at degree 5 (the analogue of ledger 2.12a,
  P + C in the cubic) would shrink ℬ to u ≲ (cap), and is worth deriving first: it is cheap, and every route above
  gets worse with u.
- Item 6 (A/B pure cost) becomes the tilted secant; at t = 0.84 its finite-amplitude ratio is 0.70 (N, |q| ≤ 3,
  amplitudes ≤ 6), against 0.80 untilted.
- The exact coupled model (`spike2.py`) should be rerun with the tilted A/B directions (cheap), so that κ_h and the
  couplings are measured in the same frame.
- The fallback "(SC) per coordinate for spikes, (S3) only for the low-influence remainder" is still the only complete
  plan on the table for spiky laws; this note shows that (F) already covers the junta end, so the open part of (S3-AB)
  is the moderate-kurtosis band, which is not spiky.
---------------------------------------------------------------------------------------------------------------------

## 7. Files

Everything is in `content5/` beside this file (round-2 files at the end of the lists). Run from `content5/` as
`PYTHONPATH=code OMP_NUM_THREADS=1 /usr/local/bin/python3 code/<script> <args>` (NumPy 2.3.5, SciPy 1.17.1, CVXPY 1.8.1
with CLARABEL and HiGHS). The scripts read `rows5.lines` and `out/` from there. `prof.py k out/prof_k.npz` and then
`tilt.py k` must run before the others.
Rounds 1–2 ran on the laptop only, about 2 CPU-hours in total; for round 3 see the end of this section.

**Code** (`content5/code/`):
- `prof.py`: the row profiles ψ, Γ_A, Γ_B and the 4×4 A/B Hessian on 707 values of s, per row.
- `tilt.py`: adds Γ₀; builds the tilted pointwise cost matrices.
- `rowlib.py`: the row object (B₅, S₅, V_sl, cost), the junta, the spike family.
- `fam_scan.py`: untilted junta and spike scans (the gate's chain).
- `resolvent.py`: the structural bound (S), i.e. 11.49 transferred.
- `losscheck.py`: the resolvent identity checked on the junta, and the loss decomposition of (S).
- `lawstein.py`: the law layer (moments; moments + Stein inputs), as a discretised SOCP.
- `combo.py`: the combined (F, S) same-law test of §3.5.
- `combo_uscan.py`: its energy scans.
- `twovar.py`: all cubics in two remote variables.
- `secant_tilt.py`: the finite-amplitude A/B ratio, tilted.
- `rowsum.py`: the per-row driver behind §4.
- `final_junta.py`: junta maxima over σ ≤ 0.6.
- `tables.py`: prints the tables.
- Round 2: `respcap_exact.py` (the exact caps of §8.2, C), `rice.py` (the family (R1) in the law layer), `combo2.py`
  (the test of §8.4; `GAMMA_SCALE` divides γ for §9.3), `losscheck2.py` (§9.1), `rsplit.py` and `order2.py` (§9.2,
  attempts 1–2).

**Outputs** (`content5/out/`):
- `prof_k.npz`: profiles for row k of `rows5.lines` (k = 1…18 is t = 0.70 … 0.886, as in CAPPED_GATE §7).
- `fam_k.json`: untilted families.
- `rowsum_k.json` and `.log`: §4 per row, for k = 5, 7, 9, 11, 13, 17 (t = 0.80, 0.82, 0.84, 0.85, 0.86, 0.88).
- `uscan_*.log`: energy scans (USCAN86, USCAN88 and the extensions).
- `sec_*.log`: secant ratios.
- `mu_tilt_9.json`, `gres_9.json`: the t = 0.84 tilt and structural tables.
- Round 2: `combo2_*.log` and `.json` (§8.4 per row, `_fine` = finer t-cover, `_gs*` = scaled γ of §9.3),
  `tilt_16.log`.
- Round 3: `t4fam_k.json/.log` (§11.3 families), `t4edge_k` (the junta-like end at the edge of (R1)), `t4search_k*.log`
  (searches; suffix b, c, d = later runs), `t4m1_k` (M₁), `t4theta_9.log`, `combo3*_k_thθ.log` (§11.4 (b); tags f, e,
  g, h = finer or shifted grids), `combo4*_k_s1.0.log` (§11.4 (a)).

**Round 3 code** (`content5/code/`): `t4lib.py` (T3, T4, Ω at e*, sup_e and Ω_⊥, Ω̂, the ingredients of M₁), `t4fam.py`,
`t4edge.py`, `t4search.py`, `t4theta.py`, `t4m1.py`, `combo3.py` (law layer with θΩ̂), `combo4.py` (law layer with the
proved majorant (PM) and its coupling), `t4tables.py`, `assemble3.py`, `sec11_text.py`, `sec11.md`, `finalize.py`
(tables, template and text of §11; they expect the round-2 text beside them and are kept as a record), and the
queue scripts `*_lane.sh`, `lap_*.sh`, `big_launch.sh`.
Round-3 runs: the laptop, about 7 CPU-hours (up to 8 single-threaded processes until 14:25, at most 2 after);
from 14:27 the searches with c < 1 and two runs of `combo3.py` on `big`, about 3 CPU-hours, in
`/root/claude-b9ee-content5b` (at most 8 single-threaded processes; folder deleted at the end, outputs copied here).
---------------------------------------------------------------------------------------------------------------------

## 8. Response-side constraints for the capped game (round 2, 16 November)

### 8.1 Where K₅ is used

The stage-2 theorem (CERT_STAGE2 §1) bounds V = Re⟨f, Tg⟩ for each actual unimodular pair by the rows active at
that pair's t. So K₅ at row r is only needed for **actual responses** (G₃, G₅) = (ε₁Qk, ηRh) whose t = ‖P₁,₀h‖ lies
in the row's active interval [t_r⁻, t_r⁺] of `cert2/out/final_table.md` (P). Constraints proved for actual responses
may therefore restrict the cubics q in (S3-AB).

This is the cubic usage: 11.51 is stated for u ≤ 0.0463 because of 2.12a. It spends no discarded square of the row,
so nothing is counted twice.

### 8.2 The energy caps (2.12a/2.12b at degree 5)

Let |f|, |g| ≤ 1, h = (f+g)/2, k = (f−g)/2, P₁,₀h = tZ with t ≥ 0, G₃ = ε₁P₂,₁k with remote part q, u = ‖q‖² and
ρ(x) = E|Z + √x| = R e^{−x/2}[(1+x)I₀(x/2) + xI₁(x/2)].

**(R1) Rice support family (P).** For every λ ≥ 0,

    t + λu/ε₁ ≤ E ρ(λ²|q|²).

*Proof.* Take the k-slot test U = λq ∈ H₂,₁. Then ⟨U, k⟩ = ⟨U, G₃⟩/ε₁ = λu/ε₁, since q is the remote component of G₃,
and ⟨Z, h⟩ = t. With h = (f+g)/2 and k = (f−g)/2,

    t + λu/ε₁ = ½ Re E[conj(Z + λq) f + conj(Z − λq) g] ≤ ½ E(|Z + λq| + |Z − λq|) = E|Z + λq|.

The last equality uses Z → −Z, and conditionally on q, E_Z|Z + λq| = ρ(λ²|q|²). ∎

The quintic part of the game never enters: this is the cubic proof of 2.12a with ε → ε₁.

**(R2) Remote cap (P + C).** ρ(x) ≤ A + Bx, with A = 886762780/10⁹ and B = 432306903/10⁹ (the certified tangent at
x = 1/10; inherited C from A15R `foundations_exact.py`). Hence

    u ≤ 4ε₁²B(A − t).

*Proof.* Insert the tangent in (R1) and choose λ = 1/(2ε₁B). ∎

Using Jensen instead of the tangent, u ≤ ε₁² min_x (ρ(x) − t)²/x; this is the same to 10⁻³ relative on the band (N).
For a Gaussian q, (R1) is exactly u ≤ ε₁²(π/4 − t²) (P: E ρ(λ²u·Exp) = R√(1 + λ²u)).

**(R3) Total cubic energy (P + C).** The six-sector ellipsoid of 2.12b holds verbatim with ε₁:
E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7 ≤ ε₁²(π/4 − t²). Its proof uses only |f|, |g| ≤ 1, P₁,₀h = tZ and
G₃ = ε₁P₂,₁k. Hence

    ‖G₃‖² ≤ ε₁²[(3/2)(π/4 − t²) + B(A − t)].

**Exact checks (C).** `respcap_exact.py`: Fraction arithmetic, π < 355/113. Each t_lo is the stage-2 endpoint minus
10⁻⁴, which is safe because both caps decrease in t.

| row t | t_lo | remote cap: u < | total cubic energy < | σ*² (N) | cap/σ*² |
|---|---|---|---|---|---|
| 0.800 | 0.7849 | 0.107166 | 0.181323 | 0.08786 | 1.22 |
| 0.810 | 0.7987 | 0.092648 | 0.157749 | 0.07813 | 1.19 |
| 0.820 | 0.8116 | 0.079076 | 0.135399 | 0.06826 | 1.16 |
| 0.830 | 0.8246 | 0.065400 | 0.112568 | 0.05825 | 1.12 |
| 0.840 | 0.8347 | 0.054774 | 0.094618 | 0.04815 | 1.14 |
| 0.845 | 0.8423 | 0.046778 | 0.080988 | 0.04305 | 1.09 |
| 0.850 | 0.8475 | 0.041307 | 0.071601 | 0.03794 | 1.09 |
| 0.855 | 0.8522 | 0.036363 | 0.063074 | 0.03280 | 1.11 |
| 0.860 | 0.8573 | 0.030997 | 0.053777 | 0.02760 | 1.12 |
| 0.865 | 0.8624 | 0.025632 | 0.044431 | 0.02240 | 1.14 |
| 0.870 | 0.8674 | 0.020371 | 0.035223 | 0.01717 | 1.19 |
| 0.875 | 0.8724 | 0.015111 | 0.025969 | 0.01191 | 1.27 |
| 0.880 | 0.8776 | 0.009640 | 0.016297 | 0.00662 | 1.46 |
| 0.886 | 0.8825 | 0.004485 | 0.007138 | 0.00149 | 3.01 |

**The remote cap sits 9–22 % above σ*² on the binding band.** The Gaussian-ideal response nearly saturates (R1): at
t = t_r the Gaussian cap ε₁²(π/4 − t_r²) is 1.008σ*² at t = 0.84.

### 8.3 The law-dependent family (R1) in the law layer

For fixed u, (R1) is a family of linear constraints on the law of U = |q|²/u: E ρ(λ²uU) ≥ t_lo + λu/ε₁ for all λ.
I added 43 values of λ ∈ [0.1, 8] to the moment + Stein relaxation (`rice.py`).

- **What it sees (N).** Let T(u, χ) be the largest t that some admissible law of given (u, χ) allows. At t = 0.84 and
  u = σ*², T = 0.8404 (χ → 0), 0.8401 (χ = 1), 0.8387 (χ = 8), 0.8339 (χ = 42).
- So (R1) excludes the spiky end near σ*². It barely restricts moderate χ, because the χ-dependence enters only at
  order u²m.
- With the stage-2 endpoint t_lo, about χ ≥ 30 is excluded at u = σ*². A finer t-cover (t_lo = t_r) would exclude
  χ ≥ 2 at u ≥ σ*², but not at 0.9σ*².

### 8.4 Effect on (S3-AB)

Same test as §4.3: (S), (F), the Stein law layer, κ_AB = 0.82, the pointwise μ of the tilt. Now with u ≤ cap and the
family (R1) at t_lo, scanned over u ∈ {0.8, 0.9, 1, 1.05}σ*² and the cap, χ ∈ {1, 2, 4, 8, 16, 30} (`combo2.py`). The
excess is max_law[min(F, S) − 4μκ(D + V_sl)]/(4μ), in gain units; "none" means every admissible law there is
excluded or closes.

| t | t_lo | max excess | at (u/σ*², χ) | stage-2 room | verdict |
|---|---|---|---|---|---|
| 0.800 | 0.7850 | +1.8·10⁻² | (1.00, 30) | 1.79·10⁻³ | fails |
| 0.820 | 0.8117 | +7.3·10⁻³ | (1.00, 16) | 7.52·10⁻⁴ | fails |
| 0.840 | 0.8348 | +2.5·10⁻³ | (1.00, 16) | 4.10·10⁻⁴ | fails |
| 0.845 | 0.8424 | +1.2·10⁻³ | (0.90, 16) | 3.82·10⁻⁴ | fails |
| 0.850 | 0.8476 | +9.0·10⁻⁴ | (1.00, 16) | 3.82·10⁻⁴ | fails |
| 0.855 | 0.8523 | +5.1·10⁻⁴ | (1.00, 16) | 3.94·10⁻⁴ | fails (×1.3) |
| 0.860 | 0.8574 | +1.7·10⁻⁴ | (1.00, 16) | 4.47·10⁻⁴ | **closes in allowance form** |
| 0.865 | 0.8625 | +3.2·10⁻⁵ | (1.05, 8) | 5.42·10⁻⁴ | **closes in allowance form** |
| 0.870 | 0.8675 | ≤ 0 | — | 6.76·10⁻⁴ | **closes** |
| 0.875 | 0.8725 | ≤ 0 | — | 8.51·10⁻⁴ | **closes** |
| 0.880 | 0.8777 | ≤ 0 | — | 1.08·10⁻³ | **closes** |

- **All large-u failures of §4.3 disappear**: they were at u > cap. Every cell at u = cap is excluded by (R1).
- **(R1) closes the spiky end.** χ = 30 now gives −2.7·10⁻⁴ (t = 0.84) where §4.3 had +2.3·10⁻³.
- **A finer t-cover helps little** (`combo2_9_fine`, `combo2_11_fine`, t_lo = t_r). At t = 0.84, cells at u ≥ σ*² with
  χ ≥ 2 become infeasible, but 0.9σ*² still gives +1.9·10⁻³ (χ = 16). At t = 0.85 the maximum is still +6.9·10⁻⁴.
- **The band that is left.** It is u ∈ [0.8, 1.05]σ*² with χ ∈ [2, 16], on t ≤ 0.855.
- **Margin caveat.** All of this uses the pointwise A/B margin of §4.1. At t = 0.86, the conservative
  finite-amplitude conversion μ = 0.359 gives 4.7·10⁻⁴, against a room of 4.47·10⁻⁴.
---------------------------------------------------------------------------------------------------------------------

## 9. The band: where (S) loses, and what was tried (round 2)

### 9.1 The losses of (S) along the spike family

`losscheck2.py`: t = 0.84, u = σ*², tilted A (s = 0.4), q = σ(cH(y) + √(1 − c²)W) with a diffuse bulk W. In the
diffuse limit the bulk adds (3/2)(1 − c²)σ²I to Γ with no fluctuation, so 𝒟 depends on y only (P). Factors, in the
order of the proof of (S):

- **projection:** E|(1/3)𝒟 : D²Ψ(Q)|² against the true ‖Π₁Φ(q)‖²;
- **operator norm:** E[N·S]/9 against that L² norm;
- **sup over R:** sup N·E S against E[N·S];
- **budget:** 6δ against E S.

| c (χ) | true content/δ | projection | operator norm | sup over R | budget | total |
|---|---|---|---|---|---|---|
| 1.00 (42) | 0.0140 | 3.45 | 1.05 | 3.30 | 1.42 | 17.0 |
| 0.85 (21.9) | 0.0140 | 3.45 | 1.24 | 2.80 | 1.42 | 17.0 |
| 0.70 (10.1) | 0.0141 | 3.90 | 1.29 | 2.37 | 1.42 | 16.8 |
| 0.50 (2.6) | 0.0137 | 5.17 | 1.26 | 1.89 | 1.42 | 17.4 |
| 0.35 (0.63) | 0.0118 | 7.14 | 1.22 | 1.63 | 1.42 | 20.1 |

**In the band the projection is the dominant loss (×4–7), not the radius (×1.6–2.4).** The total stays at 17–20×.

### 9.2 Attempts, each N-tested at t = 0.84, u = σ*²

1. **Radial split between (S) and (F)** (`rsplit.py`). Write Γ = Γ₁ + Γ₂, with Γ₁ = Γφ + κR(1 − φ) (a smooth
   cutoff φ at R₀) and Γ₂ = Γ − Γ₁.
   - Then ‖c‖ ≤ √(γ(Γ₁)δ) + √((u/2)Var a₂) + √((u/4)E b₂²) (P).
   - γ(Γ₁) does drop: ×48 at R₀ = 0.15 down to ×1.5 at R₀ = 0.4.
   - But √F(Γ₂) on a Gaussian law is 0.023–0.075, against a budget of √(4μκ·D) ≈ 0.02 at χ = 1.
   - **Fails.** (F) has a Gaussian floor on any part of the profile that lives where the law lives.
2. **Order-2 resolvent, (F₂)** (`order2.py`). The identity Π₂g(Q) = Π₂[𝒟 : D²Ψ₂(Q)], Ψ₂ = (1/3)∫e^{2t/3}P_t g dt, is
   P (from Π₂ℒ = −2Π₂ and ℒΨ(Q) = 3T_uΨ(Q) + 𝒟 : D²Ψ(Q)).
   - It gives ‖c‖ ≤ √(2u)‖Π₂ a(|q|²)‖ + √u‖Π₂[q²h′(|q|²)]‖ with ‖Π₂ g‖² ≤ 6δ sup N_{Ψ₂}.
   - This is exact on the junta and has no Gaussian floor.
   - **Fails numerically by ×110–140:** the derivative profile a = (Γ′ + Γ/R)/2 has its Hessian peak at R → 0, where
     sup N_{Ψ₂} = 12–55.
3. **Conditioning on |q| plus one statistic** (e.g. the conditional phase variance, or the joint law of (U, X_c, r)).
   - The inherited Stein inputs are linear in the Stein variables, so they fix conditional means only. The second
     moments enter only through the totals E X_c² ≤ 2P/3 and E|c|² ≤ 2Q_c/3.
   - So any such relaxation may put all the conditional variance where N_Ψ is largest, and recovers sup N exactly (P).
   - It needs a new identity for conditional second moments; none is known.
4. **Gram dominance in (F).** Replace tr G₁ = 2u by λ_max(G₁).
   - λ_max(G₂)/u ≤ √(χ/2) is P: from P − Q_c ≥ 4‖H‖²_HS, so χ ≥ 8‖H‖²_HS.
   - The holomorphic analogue has no χ-control: X·P(Y) with a Gaussian-like charge-0 P has χ = 2 and
     λ_max(G₁)/tr G₁ = 1/2. Its content is exactly 0 (11.31), but (F) does not see the phase.
   - **Fails** on shared drivers.
5. **Budget (×1.42).** E S = 6δ − ‖Π₄|Q|²‖² − 2Σ‖Π₄Q_aQ_b‖² (P, from Var K = 2Cov(H, K) − ‖H₄‖²). The relaxation
   cannot see the fourth-chaos energies (they are the slack in E X_c² ≤ 2P/3), so this factor is intrinsic to the law
   layer.
6. **Polynomial (Laguerre) expansion of the profile.**
   - The content of q|q|² is an explicit contraction: on a spike it is 128c⁶σ⁶ (P).
   - But the linearised content overshoots the true one ×15 (c = 0.5) to ×58 (junta). The moments are dominated by the
     tails, where the profile saturates.
   - **Not usable.**

### 9.3 How much sharper (S) must be

Same test as §8.4, with γ_A, γ_B divided by a factor f (`GAMMA_SCALE`):

| t | factor f | max excess after dividing γ by f (gain units) | stage-2 room | verdict |
|---|---|---|---|---|
| 0.800 | 3 | +2.1·10⁻³ | 1.79·10⁻³ | still fails |
| 0.820 | 2 / 3 | +2.3·10⁻³ / +1.7·10⁻⁴ | 7.52·10⁻⁴ | closes at ×3 |
| 0.840 | 2 | +3.8·10⁻⁴ (at χ = 24; +1.7·10⁻⁴ for χ ≤ 16) | 4.10·10⁻⁴ | closes at ×2, 92 % of the room |
| 0.845 | 2 | ≤ 0 | 3.82·10⁻⁴ | closes |
| 0.850 | 2 | ≤ 0 | 3.82·10⁻⁴ | closes |
| 0.855 | 1.5 | ≤ 0 | 3.94·10⁻⁴ | closes |

(u ∈ {0.8, 0.9, 1, 1.05}σ*², χ ∈ {2, 4, 8, 16, 24, 30, 42}, with the response constraints of §8; pointwise μ. With a
finite-amplitude μ the factors grow by roughly the ratio of the margins, 10–30 %.)

### 9.4 What a proof of the band needs

- A bound on the first-chaos projection of (1/3)𝒟 : D²Ψ(Q) that uses its chaos structure.
  - The chaos-2 part of 𝒟 acts on the first- and third-chaos parts of D²Ψ(Q) through contractions. On spread cubics
    these are controlled by the operator norm of the contraction matrices, not their Hilbert–Schmidt norm.
  - That is the factor ×4–7 of §9.1.
- Turning this into a theorem needs two pieces:
  - a dominance–kurtosis inequality for the holomorphic contraction matrix (the analogue of item 4 for G₁, false as it
    stands because of X·P, so the phase must enter);
  - a split of q into dominant directions, treated per coordinate (the spike layer's (SC)), and a spread remainder.
- This is the degree-5 tilted form of ledger 6.3.18. I found no shortcut.
---------------------------------------------------------------------------------------------------------------------

## 10. Open items for (S3-AB), in order

| # | item | status | what it needs |
|---|---|---|---|
| 1 | Content bound on the band (u ≈ 0.8–1.05σ*², χ ≈ 2–16) for t ≤ 0.855, sharper than (S) by ×1.5 (0.855), ×2 (0.84–0.85), more at ≤ 0.82 | **open** (the real lemma) | a projection-aware bound (§9.4): contractions with the operator norm of 𝒟's chaos-2 part, a dominance–kurtosis inequality that uses the phase (X·P blocks the naive one), and a dominance split with the spike layer's (SC) for dominant directions. **Or, in the T4 frame (§11):** a certified majorant of Ω at the content direction, Ω_{e*} ≤ θΩ̂ with θ ≤ 1.33 (0.84), 1.88 (0.845), 2.5 (0.85), about 3.7 (0.855), and a χ-aware one at 0.80–0.82 (§11.4, §11.6) |
| 2 | Tilted global A/B secant per row (μ_{s,t}) | method of 11.39; certificate to do (C) | the 11.39 box cover with two complex directions. N: finite-amplitude ratio 0.70 (t = 0.84) and 0.64 (t = 0.86). With the conservative finite-amplitude conversion (μ = 0.359 at t = 0.86, 0.31 at t = 0.84) the t = 0.86 excess becomes 4.7·10⁻⁴, 104 % of the room (`combo2_13_musec.log`); an actual secant matrix should land between that and the pointwise 1.7·10⁻⁴ |
| 3 | The 2-D resolvent enclosures of (S) for the tilted A and B profiles, about 10 energy cells per row | P (identity), C to do | Arb enclosure of ψ_u and ψ_u′ via the Rice/Bessel kernels; the regularity of Γ (density of L′/D) |
| 4 | The law layer with (R1) and (F) as dual certificates (Stein duals plus a Rice multiplier plus one quadratic term) | P, C to do | the 11.50 machinery with ψ(√v) in place of h; check ψ(√v) has h⁗ ≤ 0 for the Hermite caps |
| 5 | Response caps (§8.2) | **P + C (done)** | — |
| 6 | Rerun the exact coupled model (`spike2.py`) in the tilted frame, to confirm κ_h ≤ 0.18 with the tilt | N, cheap | — |
| 7 | t = 0.886 | not run | expected as t = 0.88 |
| 8 | The P statements of §11: Ω_⊥ ≤ Ω̂, the majorants M₁ and (PM), the two moment identities for (|y_e|², V), the formula for F = c₀q | P, by me only | an independent review, as the package had |
| 9 | Law-layer certificate with (PM) at t = 0.855 | N: 82 % of the room, pointwise μ | worth doing only together with item 2: with the conservative μ the row would leave its room |

---------------------------------------------------------------------------------------------------------------------

## 11. The antiholomorphic frame T3–T4 on the band (round 3, 16 November)

**Nothing in this section closes a row.** It measures what the frame T3–T4 would give on t ∈ [0.80, 0.855] and
says what a majorant of Ω must achieve there.

Input: the package `handoff/research-degree5/antiholomorphic-stein-2026-11-17/package/` (README.md, NOTE.md).
- When these computations started its statements were unreviewed. The independent review landed during the round
  (`…/antiholomorphic-stein-2026-11-17/REVIEW.md`): L1, T2a–e, T3, T4 and T5 are confirmed, with no gap. It checked
  no degree-5 number (its §8).
- §11.2 is therefore the first check of T3 and T2 at the degree-5 profiles. It is numerical.

Everything below is N unless marked P. P means: proved on paper in this session, by me only, given T3–T4.
Code: `t4lib.py`, `t4fam.py`, `t4edge.py`, `t4search.py`, `t4theta.py`, `t4m1.py`, `combo3.py`, `combo4.py`;
outputs `t4*.log/json`, `combo3*`, `combo4*`; tables by `t4tables.py` and `assemble3.py`.

Notation of the package, for a remote cubic q with ‖q‖² = u:
- V = |q|², a = Σ_j ∂_jq·∂̄_jq, c₂ = Σ_j|∂̄_jq|², x = c₂ − u;
- for a radial profile Φ(z) = z·h(|z|²): k(v) = E h(v + uτ) with τ ~ Exp(1), so k − u k′ = h;
- F = q·k′(V); for a unit direction e: G_e = y_e F and G′_e = y_e F̄.

The three statements used:
- **T3:** E[ȳ_e q h(V)] = E[ȳ_e k′(V)(q̄ a + q x)].
- **T2d:** δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖x‖² (with T2a: a = P₂,₀q² + ½P₃,₁q²).
- **T4:** |E[ȳ_e q h(V)]|² ≤ δ·Ω_e, with Ω_e = ‖P₂,₀G_e‖² + ¼‖P₃,₁G_e‖² + ½‖P₁,₁G′_e‖² + ½‖P₂,₂G′_e‖².
  For a given q only the content direction e* = c/‖c‖ is needed: ‖c‖² ≤ δ·Ω_{e*} (REVIEW §2).

### 11.1 Implementation for the tilted capped profiles

- **Profiles.** h_{A,s}(v) = (Γ_A + sΓ₀)(√v)/√v and h_{B,t}(v) = (Γ_B + tΓ₀)(√v)/√v, from the row tables of §4, tilt
  (s, t) = (0.4, 0.3). The transform is one-dimensional: k by 64-point Gauss–Laguerre, and k′ = (k − h)/u.
- **Family.** q = σ(c·p(X, Y) + √(1 − c²)·W): p a normalised cubic of H₂,₁(ℂ²) (six complex coefficients), W a
  diffuse bulk. c = 1 is a plain two-variable cubic; p = H(X) is the one-spike family; c → 0 is the Gaussian.
- **Diffuse limit (P).** The bulk is a standard complex Gaussian of chaos grade (2, 1), independent of (X, Y).
  - Its own Stein pair vanishes in L², so a = σ²c²a_p, x = σ²c²(c₂,p − 1) and δ = c⁴σ⁴χ_p.
  - The projections of T4 reduce to an effective orthonormal basis: H₂,₀(X, Y); H₃,₁(X, Y) ⊕ {XW, YW}; H₁,₁(X, Y);
    H₂,₂(X, Y) ⊕ {X̄W, ȲW, XW̄, YW̄}.
  - All W-averages are one-dimensional smoothings of the radial tables (charges 0, 1, 2).
- **Directions.** Ω_e is a Hermitian form in e. Three values are reported, per sector and then summed over A and B:
  - at the sector's content direction e*;
  - the supremum over the core directions (a 2×2 eigenvalue);
  - the value at a direction orthogonal to q (a bulk or a fresh coordinate): Ω_⊥ = (3/2)‖P₁,₀F‖² + (3/4)‖P₂,₁F‖² (P).

  "sup_e" below is the larger of the last two.

### 11.2 Validation (N): T3, T2a and T2d hold on everything tested

- **T3.** The two sides are computed by different routes: the left side is the content of §4; the right side uses
  a, x and k′. They are compared as squared norms over the two core directions.

  | family | cases | largest relative error |
  |---|---|---|
  | two-variable cubics, no bulk: junta, Wick + shared, H(X) + H(Y), X(\|Y\|² − 1), random | 60 | 7.5·10⁻⁴ |
  | one spike with a diffuse bulk, c = 0.35, 0.5, 0.7, 0.85 | 48 | 5.6·10⁻⁵ |
  | two-variable core with a diffuse bulk, c = 0.6 | 24 | 4.7·10⁻⁶ |
  | search maximisers of §11.3 (c = 1, 0.8, 0.6, 0.5), re-evaluated on the fine grid | 81 | 6.0·10⁻⁴ |
  | X²Ȳ (the zero-content class of ledger 11.31) | 12 | both sides vanish to quadrature accuracy |

  Rows t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855; energies 0.85σ*² and σ*². The largest errors are at the
  junta-like end, from the kink of |H| in the 3-D rule; the coarse and fine rules agree to four digits.

- **T2a, T2d** on six two-variable cubics (junta, X(|Y|² − 1), X²Ȳ, three random):
  - δ against ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖x‖²: equal to 10⁻⁶ relative (values 42, 16, 10, 14.685169, 20.016041,
    17.140776);
  - a against P₂,₀q² + ½P₃,₁q²: L² distance below 10⁻⁹.
- The diffuse-bulk cases test T3 in a limit neither the package nor the review computed.

### 11.3 What T4 gives on the band, against the same cubic's deficit

All shares are of the allowance 4μκ_AB(D + V_sl), with the cubic's **own** deficit D, κ_AB = 0.82 and the pointwise μ
of §4: a share below 1 means the bound fits. A cubic is called possible if its law satisfies the response family
(R1) of §8.2 at the row.

**t = 0.84, u = 0.85σ*²** (all twelve are possible responses). Ω is summed over the A and B sectors; the last four
columns are shares of the allowance.

| cubic | χ | ‖c‖²/δ | Ω_{e*} | sup_eΩ_e | Ω̂(law) | M₁(e*) | share: ‖c‖² (truth) | share: δΩ_{e*} | share: δ·sup_eΩ_e | share: δM₁(e*) |
|---|---|---|---|---|---|---|---|---|---|---|
| junta H(X) | 42.0 | 0.0179 | 0.0234 | 0.0427 | 0.0807 | 0.1070 | 0.100 | 0.131 | 0.238 | 0.597 |
| Wick + shared drivers | 35.4 | 0.0189 | 0.0322 | 0.0620 | 0.0837 | 0.1179 | 0.100 | 0.171 | 0.328 | 0.624 |
| H(X) + H(Y) | 21.0 | 0.0204 | 0.0473 | 0.0473 | 0.0797 | 0.1182 | 0.081 | 0.188 | 0.188 | 0.470 |
| X(\|Y\|² − 1) | 16.0 | 0.0157 | 0.0634 | 0.0634 | 0.0717 | 0.1142 | 0.053 | 0.215 | 0.215 | 0.388 |
| X²Ȳ | 10.0 | 0.0000 | — | 0.0816 | 0.0650 | — | 0.000 | — | 0.216 | — |
| one spike + bulk, c = 0.85 | 21.9 | 0.0180 | 0.0463 | 0.0580 | 0.0901 | 0.1257 | 0.086 | 0.220 | 0.275 | 0.597 |
| one spike + bulk, c = 0.7 | 10.1 | 0.0181 | 0.0643 | 0.0699 | 0.0940 | 0.1326 | 0.072 | 0.255 | 0.277 | 0.525 |
| one spike + bulk, c = 0.5 | 2.6 | 0.0174 | 0.0823 | 0.0824 | 0.0952 | 0.1269 | 0.052 | 0.245 | 0.245 | 0.378 |
| one spike + bulk, c = 0.35 | 0.6 | 0.0147 | 0.0910 | 0.0910 | 0.0955 | 0.1156 | 0.032 | 0.199 | 0.199 | 0.253 |
| X(\|Y\|² − 1) + bulk, c = 0.6 | 2.1 | 0.0132 | 0.0844 | 0.0919 | 0.0933 | 0.1105 | 0.032 | 0.203 | 0.221 | 0.265 |
| random two-variable cubic | 19.3 | 0.0184 | 0.0575 | 0.0731 | 0.0778 | 0.1290 | 0.072 | 0.225 | 0.286 | 0.504 |
| random core + bulk, c = 0.6 | 2.4 | 0.0136 | 0.0872 | 0.0897 | 0.0937 | 0.1179 | 0.035 | 0.223 | 0.230 | 0.302 |

Ω̂ and M₁ are the law functional of §11.4 and the proved majorant of §11.6. X²Ȳ has no content, so no content direction.

**All band rows**: largest share of the allowance over the twelve cubics at u ∈ {0.85, 1}σ*², possible responses only;
and the junta-like end at the largest energy (R1) allows on the grid u/σ*² ∈ {0.85, 0.875, …, 1} (`t4edge.py`).
"—": not run.

| t | cases (possible) | ‖c‖² (truth) | δΩ_{e*} | δ·sup_eΩ_e | δM₁(e*) | junta at its largest possible u: u/σ*², δΩ_{e*}, δ·sup_eΩ_e | Wick + shared, same |
|---|---|---|---|---|---|---|---|
| 0.80 | 24 (16) | 0.121 | 0.486 | 0.805 | 1.344 | not possible on [0.85, 1]σ*² | 0.875, 0.273, 0.828 |
| 0.82 | 24 (16) | 0.111 | 0.384 | 0.542 | 0.954 | not possible on [0.85, 1]σ*² | 0.875, 0.219, 0.559 |
| 0.84 | 24 (18) | 0.100 | 0.283 | 0.328 | 0.624 | 0.875, 0.131, 0.247 | 0.900, 0.174, 0.349 |
| 0.845 | 24 (17) | 0.097 | 0.257 | 0.283 | 0.549 | — | — |
| 0.85 | 24 (17) | 0.093 | 0.231 | 0.243 | 0.477 | — | — |
| 0.855 | 24 (18) | 0.089 | 0.205 | 0.206 | 0.408 | — | — |

**Fresh search** (`t4search.py`): Nelder–Mead over the six complex coefficients of the core, three starts, for each
(c, u). Targets: the share δ·sup_eΩ_e, sup_eΩ_e itself and, in the later runs with c < 1, the share δΩ_{e*} (counted
only where the content is at least 0.5 % of the allowance). Maximisers are re-evaluated on the fine grid and tested
against (R1). All values are lower bounds on suprema. Several runs were stopped early (laptop load); every line of
the logs is a completed maximisation.

| t | c searched | maximisers (possible) | largest share δ·sup_eΩ_e: value (c, u/σ*², χ) | largest share δΩ_{e*}: value (c, χ) | largest sup_eΩ_e (c, χ) | largest truth |
|---|---|---|---|---|---|---|
| 0.80 | 1, 0.8, 0.5 | 14 (8) | 1.03 (1.0, 0.85, 36) | 0.47 (0.8, 11) | 0.127 (1.0, 30) | 0.107 |
| 0.82 | 1, 0.8, 0.5 | 14 (8) | 0.72 (1.0, 0.85, 35) | 0.37 (0.8, 11) | 0.114 (1.0, 29) | 0.095 |
| 0.84 | 1, 0.8, 0.6 | 17 (10) | 0.46 (1.0, 0.85, 33) | 0.28 (0.6, 4) | 0.105 (0.6, 1) | 0.083 |
| 0.845 | 1, 0.8 | 11 (6) | 0.40 (1.0, 0.85, 30) | 0.28 (0.8, 10) | 0.097 (1.0, 23) | 0.081 |
| 0.85 | 1, 0.8, 0.6 | 16 (10) | 0.35 (1.0, 0.85, 30) | 0.23 (0.6, 4) | 0.098 (0.6, 1) | 0.074 |
| 0.855 | 1, 0.8 | 9 (5) | 0.29 (1.0, 0.85, 29) | 0.21 (0.8, 9) | 0.088 (1.0, 18) | 0.070 |

What this shows:
- **Sharpness.** δΩ_{e*} is 1.3–1.5× the true content on the junta and 4.5–7× in the moderate band (up to 10× at
  t = 0.80, at low kurtosis). (S) was 17–20× there. So T4 would be 3–4× sharper than (S) on the band, **if Ω_{e*}
  could be bounded by something certified**. The review finds a loss of ×8.2–8.5 at degree 3 on its band.
- **What a majorant must achieve, at the content direction.** The largest share over the fixed families, the edge
  scans and the search is 0.49, 0.38, 0.28, 0.28, 0.23, 0.21
  at t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855. So a majorant of Ω at the content direction may be 2.1–4.9 times looser
  than Ω_{e*} itself, if it is compared with the same cubic's deficit.
- **With sup_e there is less room, and none at t = 0.80.** The largest shares are 1.03, 0.72, 0.46, 0.40, 0.35, 0.29. The
  supremum over e is taken at directions that carry little or no content (§11.5), so it is the wrong object.
- **Why the rest is lost.** For a Gaussian q, Ω_e = (3/4)(E[V k′])²/u for every e: 0.078 (A) + 0.015 (B) at
  t = 0.84, u = σ*². The band values are this floor (0.08–0.10), while the true content per δ is 0.013–0.018.
- **The law-free corollary is no better than (S).** (3/2)sup_v v k′² = 0.32 + 0.06 at t = 0.84, against 0.28 for
  (S). This matches the review's finding at degree 3 (0.0443 against 0.0325 for 11.49).

### 11.4 The law-layer form: excess per row, as in round 2

A certificate does not see the cubic, only the law layer of §8. So the test of §8.4 is repeated with (S) replaced by
T4 and a majorant of Ω_{e*} that the law layer can carry. Two majorants were run.

**(a) A proved majorant (PM).** For every cubic and every unit e (P, given T4):

    Ω_e ≤ (3/2)‖G_e‖² = (3/2)E[|y_e|²·V k′(V)²],      |y_e|² ~ Exp(1),
    0 ≤ E[(|y_e|² − 1)V] = ‖∂_eq‖² + ‖D̄_eq‖² ≤ 3u.

- The first step is Bessel (it is the package's law-aware corollary). The last identity is two integrations by
  parts; the bound 3u is ⟨q, (N₁ + N₂)q⟩.
- So ‖c_X‖² ≤ (3/2)δ·sup E[τ·V k′_X(V)²], the supremum over couplings of τ ~ Exp(1) with the law of V that satisfy
  0 ≤ E[(τ − 1)V] ≤ 3u. This is a concave functional of the law: a linear program in the coupling.
- Test (`combo4.py`): the convex program of §8.4 with this term, each sector with its own coupling (47 quantile
  bins of τ). Rows 0.80–0.85 also carry the second-moment identity of §11.6; it does not bind.

| t | cells with a law / cells run | largest excess with (PM): value (u/σ*², χ) | share of the room | round 2, with (S) |
|---|---|---|---|---|
| 0.80 | 13 / 15 | 2.1·10⁻² (1.05, 16) | 1168 % | 1.8·10⁻² |
| 0.82 | 10 / 12 | 8.3·10⁻³ (1, 16) | 1100 % | 7.3·10⁻³ |
| 0.84 | 30 / 36 | 2.5·10⁻³ (1.025, 16) | 603 % | 2.5·10⁻³ |
| 0.845 | 26 / 35 | 1.3·10⁻³ (1, 12) | 338 % | 1.2·10⁻³ |
| 0.85 | 28 / 40 | 6.9·10⁻⁴ (1, 16) | 181 % | 9.0·10⁻⁴ |
| 0.855 | 60 / 75 | 3.2·10⁻⁴ (1.04, 12) | 82 % | 5.1·10⁻⁴ |

Cells: u/σ*² from 0.8 or 0.9 to the cap and χ from 1 or 2 to 30; coarser at 0.80–0.82; refined at 0.855 near its
maximum, which sits on the edge of the response family (R1).

**(b) A law functional with a constant (L_c).** The functional is

    Ω̂(law) = (3/2)E[V k′(V)²] − (3/4)(E[V k′(V)])²/u,

concave in the law (k depends on u only), and the hypothesis is

    (L_c)   ‖c_X(q)‖² ≤ θ·δ(q)·Ω̂_X(law of |q|)     for X = A, B.

It follows from T4 if Ω_{e*} ≤ θΩ̂. **It is not proved for any θ the rows need**: the proved majorants correspond
to θ ≈ 3–4.5 (§11.6). The test (`combo3.py`) is the same program with T_X = δθΩ̂_X, on u/σ*² ∈ {0.5, …, cap} and
χ ∈ {1, …, 42}.

| t | round 2, with (S) | θ = 0.35 | θ = 0.5 | θ = 0.7 | θ = 1 | θ = 1.25 | θ = 1.4 | θ = 1.8 | θ = 2.2 | θ = 2.6 | θ = 3 | θ = 3.4 | room |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 1.8·10⁻² | 1.5·10⁻³ (82 %) | 4.3·10⁻³ (242 %) | — | 1.1·10⁻² (611 %) | 1.3·10⁻² (734 %) | — | — | — | — | — | — | 1.79·10⁻³ |
| 0.82 | 7.3·10⁻³ | — | **≤ 0** | 1.3·10⁻³ (166 %) | 2.7·10⁻³ (354 %) | 3.8·10⁻³ (503 %) | — | — | — | — | — | — | 7.52·10⁻⁴ |
| 0.84 | 2.5·10⁻³ | — | — | — | **≤ 0** | 2.7·10⁻⁴ (67 %) | 5.2·10⁻⁴ (127 %) | — | — | — | — | — | 4.10·10⁻⁴ |
| 0.845 | 1.2·10⁻³ | — | — | — | — | **≤ 0** | **≤ 0** | 3.3·10⁻⁴ (87 %) | 5.9·10⁻⁴ (155 %) | — | — | — | 3.82·10⁻⁴ |
| 0.85 | 9.0·10⁻⁴ | — | — | — | — | **≤ 0** | **≤ 0** | **≤ 0** | 1.9·10⁻⁴ (50 %) | 4.2·10⁻⁴ (109 %) | — | — | 3.82·10⁻⁴ |
| 0.855 | 5.1·10⁻⁴ | — | — | — | — | **≤ 0** | **≤ 0** | **≤ 0** | **≤ 0** | 1.1·10⁻⁴ (29 %) | 2.6·10⁻⁴ (65 %) | 3.4·10⁻⁴ (86 %) | 3.94·10⁻⁴ |

Entries: the largest excess in gain units (percentage of the stage-2 room), over all cells that some response law can
occupy. "≤ 0": no cell exceeds the allowance. "—": not run.

What a majorant must achieve in the law layer, read from the table:

| t | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
|---|---|---|---|---|---|---|
| largest θ run with no excess | none (0.35 already exceeds) | 0.5 | 1.0 | 1.4 | 1.8 | 2.2 |
| θ at which the excess reaches the room (interpolated; 0.855 extrapolated from θ = 3.0, 3.4) | 0.37 | 0.64 | 1.33 | 1.88 | 2.5 | about 3.7 |
| largest measured Ω_{e*}/Ω̂ on cubics with content (§11.5) | 0.78 | 0.86 | 0.95 | 0.98 | 1.01 | 1.04 |
| true constant of (L_c): largest ‖c‖²/(δΩ̂) measured | 0.13 | 0.17 | 0.26 | 0.29 | 0.33 | 0.38 |

- **t = 0.84–0.855: there is room for a constant θ.** A certified bound Ω_{e*} ≤ θΩ̂ would keep the row inside its
  room for θ up to 1.33, 1.88, 2.5 and about 3.7. The measured Ω_{e*} stays at or below 1.04·Ω̂. So the majorant
  may be looser than the measured values by 40 % at 0.84, 90 % at 0.845 and a factor 2.5–3.5 at 0.85–0.855.
- **t = 0.80–0.82: no constant θ works.** The row needs θ ≤ 0.37 and 0.64, but Ω_{e*}/Ω̂ reaches 0.78 and 0.86 at
  low kurtosis. A majorant must there fall with concentration, as Ω_{e*} does (0.13–0.19·Ω̂ on the junta): it must be
  aware of χ or of the influence of e*. The frame itself has room (§11.3); the law-layer pairing does not.
- **The proved majorant (PM) keeps only t = 0.855 inside its room (82 %).** It is below (S) at 0.85–0.855, about
  equal to it at 0.84–0.845 and above it at 0.80–0.82 (table (a)). A test with (S), (F) and (PM) together was not
  run; it can only be smaller than each.
- None of this closes a row. At 0.855 the 82 % is with the pointwise margin μ, and its maximum sits on the edge of
  the response family (R1), so finer cells may add a few per cent. With the conservative conversion of §4.1 it
  would exceed the room, as at t = 0.86 (§10, item 2).

### 11.5 How large Ω is against Ω̂ (N)

Fixed families of §11.3, both energies, all six rows (`t4fam_*.json`, `t4m1_*.json`); the first row is
at t = 0.80 and the last at 0.855:

| quantity | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
|---|---|---|---|---|---|---|
| Ω_{e*}/Ω̂, cubics with content: smallest (junta) | 0.13 | 0.16 | 0.25 | 0.28 | 0.32 | 0.38 |
| Ω_{e*}/Ω̂, cubics with content: largest (one spike + bulk, c = 0.35) | 0.78 | 0.86 | 0.95 | 0.98 | 1.01 | 1.04 |
| sup_eΩ_e/Ω̂: largest (X²Ȳ, which has no content) | 0.83 | 1.01 | 1.26 | 1.34 | 1.43 | 1.54 |
| δΩ_{e*}/‖c‖², the loss of T4 at the content direction: range | 1.5–10 | 1.4–8.5 | 1.3–6.9 | 1.3–6.5 | 1.3–6.1 | 1.3–5.7 |
| M₁(e*)/Ω̂, cubics with content: range | 0.98–1.44 | 1.08–1.51 | 1.17–1.66 | 1.18–1.72 | 1.19–1.79 | 1.20–1.87 |

- A search at t = 0.84, u = 0.9σ*² (`t4theta.py`, started and stopped early): sup_eΩ_e/Ω̂ = 1.34 at c = 1, χ = 12;
  Ω_{e*}/Ω̂ = 1.22 at an X²Ȳ-like cubic with no content, and 1.10 at c = 0.7 with ‖c‖²/δ = 7·10⁻⁴.
- So on cubics whose content matters, Ω_{e*} ≤ 1.04·Ω̂ on everything tested. It is a numerical observation.
- **sup_e is the wrong object.** It is attained in the zero-content class and exceeds Ω̂ by up to 54 %, growing
  with t. The lemma needs the content direction only.
- The loss of T4 at the content direction is ×1.3 on the junta and ×6–10 at low kurtosis, where the content is
  small. The review reports ×8.2–8.5 at degree 3.

### 11.6 The remaining lemma: what a certified majorant of Ω can be

**Structure (P).** F has U(1)-charge 1, so F = F₁,₀ + F₂,₁ + F₃,₂ + … with F_{m+1,m} ∈ H_{m+1,m}. Multiplication by y_e
is y_e·f = y_e⋄f + D̄_e f (Wick product plus the contraction D̄_e = Σ_j e_j∂̄_j). Hence

    P₂,₀G_e = y_e⋄F₁,₀ + D̄_eF₂,₁,        P₃,₁G_e = y_e⋄F₂,₁ + D̄_eF₃,₂,

and the same with F̄ for P₁,₁G′_e and P₂,₂G′_e. So Ω_e depends on q through three chaos components of the radial
function F = q k′(|q|²): its first-chaos content F₁,₀, its cubic part F₂,₁ ≈ c₀q (c₀ = E[V k′]/u) and its quintic
part F₃,₂. **Ω_e is not a function of the law of |q|.**

**What is proved (P, this session; given T4).**
1. *Orthogonal directions.* If q does not depend on y_e: Ω_e = Ω_⊥ = (3/2)‖F₁,₀‖² + (3/4)‖F₂,₁‖² ≤ Ω̂(law).
   - Proof: D̄_e vanishes and y_e⋄ is an isometry; ‖F₁,₀‖² + ‖F₂,₁‖² ≤ E[V k′²]; ‖F₂,₁‖² ≥ |⟨q, F⟩|²/u.
   - It says nothing about a content direction: the content vanishes in directions q does not depend on.
2. *All directions, joint law.* For every unit e,

       Ω_e ≤ M₁(e) := (3/2)E[|y_e|²V k′²] − (3/4)·|E[|y_e|²V k′] − E[conj(D̄_eq)·y_e q k′]|²/(u + ‖∂_eq‖²) − ½|E[ȳ_eF]|².

   - Proof: Bessel for G_e (chaoses (2,0), (3,1), …) and G′_e ((0,0), (1,1), (2,2), …), both of squared norm
     E[|y_e|²V k′²]; then ‖P₃,₁G_e‖² ≥ |⟨T, G_e⟩|²/‖T‖² with the test vector T = y_e⋄q, ‖T‖² = u + ‖∂_eq‖².
   - M₁ = Ω̂ when q does not depend on y_e.
3. *All directions, law layer.* The majorant (PM) of §11.4 (a): the first term of M₁, with the coupling relaxed.

Numbers for M₁ (`t4m1.py`; the twelve cubics, two energies, six rows):
- M₁(e) ≥ Ω_e on all 31 × 48 directions of a grid, in all 144 cases (smallest gap 7·10⁻⁴). This is a consistency
  check of the proof, not a proof.
- M₁(e*) is 0.98–1.87×Ω̂ on cubics with content, and sup_e M₁ is at most 2.18×Ω̂.
- Against the same cubic's deficit, δM₁(e*) is at most 1.34, 0.95, 0.62, 0.55, 0.48, 0.41 of the allowance at
  t = 0.80, …, 0.855 (possible responses). So the joint-law majorant would do on t ≥ 0.82 with the cubic's own
  deficit. It is not a law functional, so the law layer cannot carry it as it stands.

**Why it is not a perturbation of the orthogonal case (P for the formula).** If F were exactly c₀q, then

    Ω_e = (3/4)c₀²u·[1 + 2‖D̄_eq‖²/u + ‖∂_eq‖²/u],

which is up to 5 times the Gaussian floor (junta direction: 1 + 2 + 2).
- The measured values do not grow like this. At a spike with c = 0.35 the formula gives 1.49× the floor; the
  measured Ω_{e*} is 0.73–1.04×Ω̂ over the six rows. On the junta the formula gives 5× and the measured Ω_{e*} is
  0.13–0.45×Ω̂.
- So the quintic part F₃,₂ cancels the growth already at first order in the influence of e. (In D̄_eF the factor
  of D̄_eq is (v k′)′(V), not the constant c₀.)
- A proof of Ω_{e*} ≤ θΩ̂ must keep this cancellation. Bessel (M₁, PM) throws it away, and Cauchy–Schwarz in the
  influence is useless: |E[(|y_e|² − 1)g(V)]| ≤ sup√v|g′|·(‖∂_eq‖ + ‖D̄_eq‖) allows a 25–40 % correction only for
  directions with 1–2 % of the influence (sup√v|g′| = 0.63 for g = v k′² at t = 0.84, A sector).

**Form of a certificate.**
- *Right-hand side:* yes, a law functional with a few scalar integrals. Per row, sector and energy cell it is
  E[V k′²] and E[V k′] for Ω̂, or the coupling program for (PM). Both are concave terms of the law layer; k′ needs
  one 1-D transform of the tilted profile (Arb: a Laguerre quadrature of the Rice/Bessel tables of §10, item 3).
- *What has to be proved:* Ω_{e*} ≤ θ_row·Ω̂, or directly (L_c), with the θ_row of §11.4. This is not a law
  statement. It concerns the joint law of (|y_e|², |∂_eq|², |D̄_eq|², |q|²) at the content direction.

**How hard.**
- **The certificate arithmetic is easy.** Two integrals per cell, or one linear program; both are convex terms
  of the layer that §10, items 3–4 already has to certify.
- **The inequality is a real lemma, and it is open on all six rows.** What can be proved now:
  - θ = 1 in directions q does not depend on (useless for a content direction);
  - the Bessel majorants: M₁ is 1.0–2.2×Ω̂ on the cubics tested, and (PM) is 3–4.5×Ω̂ in the law layer
    (twice the coupling ratio E[τg]/E[g] = 1.5–2.2 at the extremal laws);
  - the law-free (3/2)sup v k′², which is 2.8–4.9×Ω̂ (Gaussian law, t = 0.80–0.855) and no better than (S).
- **What is needed** is θ ≤ 1.33 (0.84), 1.88 (0.845), 2.5 (0.85) and about 3.7 (0.855) to stay inside the room,
  and a χ-aware majorant at 0.80–0.82.
- **The gap is the first-order cancellation above.** It is the same projection problem as §9.4, now for one
  explicit radial function F = q k′(|q|²) in one direction. That is more concrete than the resolvent remainder of
  round 2, and the target is a known law functional with a measured margin. It is not easier in kind.
- **Three ways in,** in the order I would try them:
  1. *Keep the quintic part.* Bound ‖P₂,₀G_e‖² and ‖P₃,₁G_e‖² through D̄_eF = (D̄_eq)(v k′)′(V) + q²k″(V)·conj(∂_eq)
     instead of Bessel. The weights are (v k′)′ and v k″, one-dimensional profile integrals per row.
  2. *A joint law layer.* Carry the law of (|y_e|², |q|²) with more moment identities than the two used in (PM).
     The second-moment identity E[|y_e|⁴V] = 2u + 4E[(|y_e|² − 1)V] + ‖∂_e²q‖² + 4‖∂_eD̄_eq‖² (P) was tried: it does
     not bind (the 0.855 cell moves from 2.438·10⁻⁴ to 2.432·10⁻⁴).
  3. *A χ-aware split,* for 0.80–0.82: (F) covers the junta end at the law level already; the middle (χ ≈ 16–30
     near σ*²) needs Ω_{e*} ≤ θ(χ)Ω̂ with θ ≈ 0.4–0.6 there.
- Rows 0.85–0.855 are the nearest: there any certified majorant below 2.5·Ω̂ and about 3.7·Ω̂ would do, and (PM)
  already stays inside the room at 0.855 (82 %).

### 11.7 State after round 3

| t | round 2: excess with (S) | T4 at e*, own deficit: largest share of the allowance | T4 with sup_e, same | (PM), proved majorant: excess (share of room) | (L_c): θ with no excess; θ at the room | status |
|---|---|---|---|---|---|---|
| 0.80 | 1.8·10⁻² | 0.49 | 1.03 | 2.1·10⁻² (1168 %) | none; 0.37 | **open** |
| 0.82 | 7.3·10⁻³ | 0.38 | 0.72 | 8.3·10⁻³ (1100 %) | 0.50; 0.64 | **open** |
| 0.84 | 2.5·10⁻³ | 0.28 | 0.46 | 2.5·10⁻³ (603 %) | 1.00; 1.33 | **open** |
| 0.845 | 1.2·10⁻³ | 0.28 | 0.40 | 1.3·10⁻³ (338 %) | 1.40; 1.88 | **open** |
| 0.85 | 9.0·10⁻⁴ | 0.23 | 0.35 | 6.9·10⁻⁴ (181 %) | 1.80; 2.54 | **open** |
| 0.855 | 5.1·10⁻⁴ | 0.21 | 0.29 | 3.2·10⁻⁴ (82 %) | 2.20; about 3.7 (extrapolated) | **open**; inside the room with (PM), pointwise μ only |

- **No row of the band is closed by this round.** The rows t ≥ 0.86 of round 2 are unchanged.
- Reading: the frame has room at the content direction on every row (third column). The law layer has room for a
  constant θ on 0.84–0.855 only. The one proved majorant fits at 0.855 only, and only with the pointwise μ.
- Shares in columns 3–4 are lower bounds on suprema (families and searches); columns 5–6 are sampled cells.
