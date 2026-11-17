<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CONTENT_LEMMA_D5.md (17 November 2026, 02:15); a research worker of claude-b9ee. Only this line was added. -->
# The order-1 (A/B) content lemma for the capped degree-5 rows

Research worker for claude-b9ee (issue #453), 16 November 2026: round 1 (§§1–7), round 2 (§§8–10, response
constraints and the band), round 3 (§11, the antiholomorphic frame T3–T4 on the band) and round 4, part A (§12: the
energy band, the local representation, a split candidate). Labels:
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
     looser than Ω_{e*}. (Taken at u ∈ {0.85, 1}σ*²; round 4 finds the share smaller at lower energies,
     §12.3.)
   - With sup_e the shares are 1.03, 0.72, 0.46, 0.40, 0.35, 0.29: no room at 0.80. The supremum sits in the
     zero-content class (X²Ȳ) and is the wrong object; the lemma needs the content direction only.
   - T4 is 3–4× sharper than (S) on the band if Ω_{e*} can be bounded. Its own loss is ×1.3 on the junta and ×6–10 at
     low kurtosis. Its law-free corollary is no better than (S).
10. **What a majorant of Ω must achieve (§11.4–11.6).**
   - The natural target is the law functional Ω̂ = (3/2)E[V k′²] − (3/4)(E[V k′])²/u. A certified Ω_{e*} ≤ θΩ̂ keeps
     the row inside its room for θ up to 0.37, 0.64, 1.33, 1.88, 2.5 and about 3.7 (same six rows).
   - Measured at u ∈ {0.85, 1}σ*²: Ω_{e*} is at most 0.78, 0.86, 0.95, 0.98, 1.01, 1.04 times Ω̂ on cubics with
     content. (Corrected in round 4: these are not suprema over the band; both sides grow as u falls, see
     item 11.) So a constant θ
     has room on t = 0.84–0.855 (40 % at 0.84, 90 % at 0.845, a factor 2.5–3.5 above). It has none at 0.80–0.82, where the
     majorant must fall with concentration as Ω_{e*} does.
   - Proved (P, mine, given T4): θ = 1 in directions q does not depend on, and two Bessel majorants, M₁ (joint law)
     and (PM) (law layer). With (PM) the law-layer excess is 82 % of the room at t = 0.855 (pointwise μ) and
     1168 %, 1100 %, 603 %, 338 %, 181 % of it at t = 0.80, 0.82, 0.84, 0.845, 0.85.
   - **Open:** Ω_{e*} ≤ θΩ̂. It is not a perturbation of the orthogonal case: the cubic part of q k′(|q|²) alone gives
     up to 5× the Gaussian floor, and the quintic part cancels this at first order in the influence.
11. **Round 4, part A (§12; N; nothing closed).**
   - **The lemma lives on an energy band.** Above the cap (1.08–1.22σ*²) there is no response. Below u₀ = 0.37,
     0.43, 0.54, 0.58, 0.63, 0.70 σ*² the proved bounds (S), (F) leave no excess, because the energy slack V_sl(u)
     pays. In between, the content bound may be θ_room(u)·δΩ̂, which grows quickly as u falls. With one constant
     for all energies the inequality is false as u → 0.
   - **Corrected margins.** Largest sector ratio ‖c_X‖²/(δΩ̂_X) against θ_room(u) at the same energy, families and
     fresh searches: smallest margin 3.1, 4.3, 7.1, 7.9, 10.0, 14.1 on the six rows, always near σ*².
     Rows 0.80 and 0.82 have room.
   - **The local representation (6.3.26) as a bound** is better than 6.3.25 at the content direction by a factor
     0.59–1.0 on most two-variable cubics (worse by up to 1.6 on the junta at the upper energies of t = 0.80–0.82),
     and about equal in the diffuse limit (on paper).
   - **The split candidate** (self-interaction by 6.3.25, the rest by conditioning) is proved as an inequality but
     never beats 6.3.25 unsplit and exceeds the threshold on t ≤ 0.845. The searches point to the shared-driver
     class X·(α(|X|² − 2)/√2 + βe^{iψ}(|Y|² − 1)) as extremal. *Corrected in round 4, part B: extremal among
     two-variable cubics only, and the margins above are two-variable numbers (item 12).*
12. **Round 4, part B (§13; N; nothing closed; the margins shrink).**
   - **More variables give larger ratios.** t = 0.80: 0.1595, 0.1925, 0.2105, 0.2246, 0.2386, 0.2483, 0.2532, 0.2575, 0.2588, 0.2630, 0.2666, 0.2756 for n = 2, 3, … at
     0.85σ*² and 0.1367†, 0.1679, 0.1847, 0.1987, 0.2114, 0.2211, 0.2257, 0.2301, 0.2315, 0.2361, 0.2397, 0.2482 at σ*²; allowances 0.487 and 0.360, margins 1.8 and 1.4.
     The supremum over n is not known.
   - **The three-cluster family reduces exactly to the law of one scalar (§13.8; P).** Its ratio depends on the
     bulk only through G = c³|R₃(ω)|²/‖R₃‖²; κ = E G² (2 for a Gaussian bulk) decides: the smallest κ found is
     4/3, 1.58, 1.60, 1.71, 1.75, 1.80, 1.85 for c = 2, 3, 4, 5, 6, 8, 10, and with it the cubics give
     0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724 (0.85σ*²) and 0.2470, 0.2467, 0.2493, 0.2481, 0.2508, 0.2481, 0.2474 (σ*²) for c = 4, 5, 6, 7, 8, 9, 10.
     Proved: κ ≥ 2c²/(c + 1)²; with κ at that bound the formula (Gamma shape) stays under the allowance on t = 0.80
     (0.345 and 0.318 against 0.487 and 0.360).
   - **The pieces below 0.80 (§13.9).** On the covering rows everything found is under the allowance (factors
     1.30 at t = 0.70, 1.60 at t = 0.74); on the own rows possible-response cubics exceed it for t ≤ 0.74; at t = 0.70
     the proved bound on κ does not close the family.
   - **What the maximisers use.** A junta, a driver X with a cofactor whose eigenvalues form clusters, and a bulk
     R₃ on the cofactor's own variables: given those variables q is a Gaussian in X with non-zero conditional mean,
     and |R₃|² is positively correlated with the cofactor (Cov = Σ_j m_jK_jj ≈ 0.33). No class theorem covers it;
     with R₃ made independent of the cofactor the ratio falls by 17 to 48 %.
   - **The driver class alone** reduces to the law of the cofactor value (P), but its relaxation to arbitrary
     centred laws is false (two-point laws: 2.19 at t = 0.80), also with third-moment constraints (0.82).
   - **Families with 66 to 91 variables in closed form** give 0.249 and 0.224 at t = 0.80, below the finite
     maximisers. The text for outside sessions is `content5/PROBLEM_V2.md`.
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
| 10 | The band form of the lemma (§12.1): (L_c) for u ∈ [u₀, cap] with θ_row(u) ≤ θ_room(u) | **open**; N margins 3.1–14.1 (§12.2) | the same lemma as item 1, now with its energy range; below u₀ the proved bounds suffice (law-layer certificate of item 4 at the low energies) |
| 11 | The P statements of §12: the combined vector T and Ω^loc (6.3.26 as a bound), the two steps of (C-split), the Gaussian limit of Ω^loc | P, by me only | an independent review |

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

*Corrected in round 4 (§12.1): with one constant for all energies (L_c) is false as u → 0, and it is needed only on
the band [u₀, cap] of each row, with a threshold that depends on u. The lower end 0.5σ*² below was a grid choice.*

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
| largest measured Ω_{e*}/Ω̂ on cubics with content, at u ∈ {0.85, 1}σ*² only (§11.5) | 0.78 | 0.86 | 0.95 | 0.98 | 1.01 | 1.04 |
| largest ‖c‖²/(δΩ̂) measured at u ∈ {0.85, 1}σ*², A + B, fixed families only | 0.13 | 0.17 | 0.26 | 0.29 | 0.33 | 0.38 |

*Corrected in round 4: the last two rows are not suprema over the band. Both quantities grow as u falls, and so does
the threshold; the comparison must be made energy by energy (§12.2). The first two rows are the row minima of the
threshold, attained near σ*².*

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
at t = 0.80 and the last at 0.855. *Round 4: the energies are u ∈ {0.85, 1}σ*² only; values across the band are in
§12.2–12.3.*

| quantity | 0.80 | 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
|---|---|---|---|---|---|---|
| Ω_{e*}/Ω̂, cubics with content: smallest (junta) | 0.13 | 0.16 | 0.25 | 0.28 | 0.32 | 0.38 |
| Ω_{e*}/Ω̂, cubics with content: largest (one spike + bulk, c = 0.35) | 0.78 | 0.86 | 0.95 | 0.98 | 1.01 | 1.04 |
| sup_eΩ_e/Ω̂: largest (X²Ȳ, which has no content) | 0.83 | 1.01 | 1.26 | 1.34 | 1.43 | 1.54 |
| δΩ_{e*}/‖c‖², the loss of T4 at the content direction: range | 1.5–10 | 1.4–8.5 | 1.3–6.9 | 1.3–6.5 | 1.3–6.1 | 1.3–5.7 |
| M₁(e*)/Ω̂, cubics with content: range | 0.98–1.44 | 1.08–1.51 | 1.17–1.66 | 1.18–1.72 | 1.19–1.79 | 1.20–1.87 |

- A search at t = 0.84, u = 0.9σ*² (`t4theta.py`, started and stopped early): sup_eΩ_e/Ω̂ = 1.34 at c = 1, χ = 12;
  Ω_{e*}/Ω̂ = 1.22 at an X²Ȳ-like cubic with no content, and 1.10 at c = 0.7 with ‖c‖²/δ = 7·10⁻⁴.
- So on cubics whose content matters, Ω_{e*} ≤ 1.04·Ω̂ on everything tested at these two energies. It is a numerical
  observation. *Round 4: at 0.5σ*² the largest Ω_{e*}/Ω̂ on the same twelve cubics is
  0.91, 0.98, 1.07, 1.09, 1.17, 1.27 (rows 0.80, 0.82, 0.84, 0.845, 0.85, 0.855); the threshold there is larger too (§12.2).*
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

---------------------------------------------------------------------------------------------------------------------

## 12. Round 4, part A (16 November, evening): the energy band, the local representation, the split candidate

**Nothing in this section closes a row.** It corrects §11.4–11.5 (the measured constants were taken at too few
energies), states the lemma on its energy band, evaluates the local representation as a bound, and tests one
candidate for the general lemma.

Inputs, all reviewed:
- the review of codex-a786's class result,
  `handoff/research-degree5/codex-a786-content-law-2026-11-16/REVIEW.md` §§4.4–4.6, 5.3 (its scripts reproduce the
  logs `content5/out/t4fam_<k>.log` to every printed digit);
- the local content representation, `handoff/research-degree5/deficit-sign-2026-11-16/REPORT.md` §6.5 (Prop. 6.4,
  re-derived by the coordinator; K ledger 6.3.26 to appear), with the notation of its §6.2.

Labels as before. Everything is N unless marked; a search gives a lower bound on a supremum. Rows are
t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855; tilt (0.4, 0.3); κ_AB = 0.82; pointwise μ. "Ratio" means
‖c_X[h]‖²/(δ·Ω̂_X[h]) for a sector X ∈ {A, B}.
Code: `r4lib.py`, `r4_low.py`, `r4_theta.py`, `r4_ratio.py`, `r4_local.py`, `r4_split.py`, `r4_tables.py`,
`r4_xz.py`, `r4_rand.py`, `r4_kappa.py`, `r4_t4band.py`, `r4_md.py`, `sec12_text.py`, `r4_finalize.py`; outputs
`out/r4_*`. Laptop only, at most two single-threaded processes, about 1.5 CPU-hours.

### 12.1 The energies at which the content inequality is needed (A1a)

(S3-AB) asks, for every possible response: ‖c_{A,s}‖² + ‖c_{B,t}‖² ≤ 4μκ_AB·(D(q) + V_sl(u)) + 4μη_AB.
- D(q) ≥ 0 is the cubic's own deficit; it is of the order of δ.
- V_sl(u) = S₅ − B₅(u) + cost(u) is the energy slack. It does not depend on the cubic. It vanishes at u = σ*² and
  grows on both sides; V_sl(0⁺) = 7.0·10⁻³, 4.2·10⁻³, 2.1·10⁻³, 1.7·10⁻³, 1.3·10⁻³, 9.6·10⁻⁴ on the six rows.
- The content is at most a constant times δ, and δ ≤ 42u² (ledger 3.4).

So the energies split into three ranges.

1. **u > cap: nothing to prove.** No response has u above the cap of §8.2 (P + C): 1.22, 1.16, 1.14, 1.08, 1.09,
   1.11 σ*² on the six rows, at t_lo. The band never reaches 1.3σ*².
2. **Low energies: V_sl pays, with proved bounds.**
   - u ≤ 0.1σ*²: the slack alone is four to six times the proved content bound. The last column below is
     (γ_A + γ_B)(u)·42u²/(4μκ_AB·V_sl(u)) at 0.1σ*², with γ from (S) of §3.3 and δ ≤ 42u²; it falls roughly like u²
     below that. With D ≥ 0 this would be a law-free proof. D ≥ 0 is itself a statement of the law layer (the Stein
     layer gives D ≥ d_St·δ, §4.3), so the certified form is the next line.
   - Up to u₀: the test of §8.4 with the proved bounds only, (S) and (F) with the Stein layer and (R1), has no
     excess (`r4_low.py`; χ ∈ {2, 8, 16, 30, 42}). Entries: largest excess as a share of the stage-2 room.

| t | cap/σ*² | u/σ*² = 0.1 | 0.2 | 0.3 | 0.4 | 0.5 | 0.6 | 0.7 | excess reaches 0 at | reaches the room at | (S)·42u² against the slack alone, at 0.1σ*² |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 1.22 | -252 % | -177 % | -81 % | +32 % | +160 % | +298 % | +447 % | 0.37 | 0.45 | 0.24 |
| 0.82 | 1.16 | -365 % | -278 % | -175 % | -46 % | +96 % | +259 % | +438 % | 0.43 | 0.50 | 0.20 |
| 0.84 | 1.14 | -334 % | -264 % | -198 % | -127 % | -41 % | +72 % | +186 % | 0.54 | 0.62 | 0.17 |
| 0.845 | 1.08 | -287 % | -227 % | -175 % | -119 % | -62 % | +19 % | +107 % | 0.58 | 0.69 | 0.16 |
| 0.85 | 1.09 | -223 % | -177 % | -137 % | -101 % | -61 % | -19 % | +42 % | 0.63 | 0.79 (with §8.4) | 0.15 |
| 0.855 | 1.11 | -162 % | -129 % | -100 % | -76 % | -53 % | -26 % | +0 % | 0.70 | 0.94 (with §8.4) | 0.15 |

   At 0.8σ*² the same test gave +207 %, +106 %, +35 % at t = 0.845, 0.85, 0.855 (§8.4), so the room is reached at
   0.79σ*² and 0.94σ*² on the last two rows. On this range V_sl(u) ≈ V_sl(0⁺)·(1 − u/σ*²)² within 15 %.
3. **The band [u₀, cap]: here, and only here, an unproved content bound is needed.**
   - u₀ = 0.37, 0.43, 0.54, 0.58, 0.63, 0.70 σ*² if the proved bounds must leave no excess;
   - u₀ = 0.45, 0.50, 0.62, 0.69, 0.79, 0.94 σ*² if they may use the whole stage-2 room.

**Why round 3 started at 0.5σ*².** It was the lower end of my grid, not a property of the rows. The correct lower
ends are the u₀ above: lower than 0.5σ*² at t = 0.80 and 0.82, higher on the other rows.

**The allowance as a function of u.** In the band, write the open inequality as ‖c_X‖² ≤ θ·δ·Ω̂_X and ask, at each
energy, for the largest θ that keeps the row inside its room (θ_room(u)) or leaves no excess (θ₀(u)), in the test of
§11.4 (b) restricted to that energy (`r4_theta.py`). The tables of §12.2 give both. They grow quickly as u falls,
because V_sl grows. The single row constants of §11.4 (0.37, …, 3.7) are the minima of θ_room(u), attained near σ*².

**The correct statement.** For a row, for u ∈ [u₀, cap], for every remote cubic that is a possible response, and
for X = A, B:

    (L_c, band)    ‖c_X(q)‖² ≤ θ_row(u)·δ(q)·Ω̂_X(law of |q|),     θ_row(u) ≤ θ_room(u).

- With one constant for all u > 0 the inequality is **false** (REVIEW §4.5): as u → 0 the ratio of a smooth profile
  tends to that of h(v) = v, which is 256/63 on the junta and 16/(3(m + 3)) on X·P_m. The band excludes that range,
  and below the band nothing is asked.

### 12.2 The measured ratio across the band, and the corrected margins (A1b)

**Corrected in round 4, part B (§13): the ratios and margins of this section are two-variable numbers.** With more
variables the largest ratios found on t = 0.80 are 0.2761 (0.85σ*²) and 0.2505 (σ*²), margins 1.8 and 1.4; on
t = 0.82 the margins are {0.913 / b82a:.1f} and {0.657 / b82b:.1f}. The upper rows were searched to n = 4 only; with the three-cluster
family of §13.8 their margins are 3.8 and more.

- Families: the twelve cubics of §11.3 at u/σ*² ∈ {0.3, 0.4, 0.5, 0.7, 0.85, 1} (`r4_ratio.py fam`; (R1) is tested
  for the cubics without bulk, and those that are not possible responses at an energy are left out there).
- Fresh searches for the largest sector-A ratio (`r4_ratio.py search`): Nelder–Mead over the six complex
  coefficients of the core, four starts (junta, H(X) + H(Y), X(|Y|² − 1), random), c ∈ {1, 0.8}, at the energies
  named in the tables. The B ratio is below the A ratio on every case.
- My evaluator reproduces the reviewer's table (REVIEW §4.4) at 0.5σ*², sector A, to the digits printed there.
- In the tables the ratio is the largest over the families, the searches and the scan of §12.4 that were run at
  that energy (at 0.6σ*²: the families only), possible responses only.

**t = 0.80** (band from 0.37σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.20 (below the band) | — | — | 0.500 | 0.450 | 0.490 | junta H(X) | — |
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.351 | 0.313 | 0.344 | H(X) + H(Y) | > 50 |
| 0.40 | 3.63 | 10.36 | 0.320 | 0.282 | 0.313 | search (no bulk, χ = 16) | 32.4 |
| 0.50 | — | 2.80 | 0.262 | 0.226 | 0.255 | search (no bulk, χ = 16) | 10.7 |
| 0.60 | — | 1.33 | 0.185 | 0.155 | 0.180 | H(X) + H(Y) | 7.2 |
| 0.70 | — | 0.84 | 0.191 | 0.161 | 0.186 | shared driver, α = 0.62, β = 0.78, ψ = 0.37π (scan of §12.4) | 4.4 |
| 0.85 | 0.33 | 0.49 | 0.160 | 0.131 | 0.155 | shared driver, α = 0.62, β = 0.79, ψ = 0.39π (scan of §12.4) | 3.1 |
| 1.00 | 0.24 | 0.36 | 0.082 | 0.069 | 0.080 | spike + bulk, c = 0.5 | 4.4 |

**t = 0.82** (band from 0.43σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.455 | 0.412 | 0.447 | junta H(X) | > 50 |
| 0.40 | 8.46 | > 50 ((F) suffices) | 0.419 | 0.375 | 0.411 | search (no bulk, χ = 17) | > 50 |
| 0.50 | 3.12 | 5.18 | 0.345 | 0.305 | 0.338 | search (no bulk, χ = 17) | 15.0 |
| 0.70 | — | 1.46 | 0.255 | 0.219 | 0.249 | shared driver, α = 0.63, β = 0.78, ψ = 0.35π (scan of §12.4) | 5.7 |
| 0.85 | 0.65 | 0.91 | 0.213 | 0.180 | 0.208 | shared driver, α = 0.62, β = 0.78, ψ = 0.36π (scan of §12.4) | 4.3 |
| 1.00 | 0.47 | 0.66 | 0.112 | 0.095 | 0.109 | spike + bulk, c = 0.5 | 5.9 |

**t = 0.84** (band from 0.54σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.673 | 0.599 | 0.660 | junta H(X) | > 50 |
| 0.40 (below the band) | — | — | 0.586 | 0.534 | 0.578 | shared driver, α = 0.69, β = 0.73, ψ = 0.23π (scan of §12.4) | — |
| 0.50 | 7.44 | 23.95 | 0.488 | 0.440 | 0.480 | search (no bulk, χ = 18) | 49.1 |
| 0.70 | — | 3.69 | 0.366 | 0.324 | 0.359 | shared driver, α = 0.65, β = 0.76, ψ = 0.31π (scan of §12.4) | 10.1 |
| 0.85 | — | 2.19 | 0.309 | 0.269 | 0.302 | search (no bulk, χ = 16) | 7.1 |
| 1.00 | — | 1.44 | 0.173 | 0.143 | 0.168 | spike + bulk, c = 0.85 | 8.3 |

**t = 0.845** (band from 0.58σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.755 | 0.676 | 0.742 | junta H(X) | > 50 |
| 0.40 (below the band) | — | — | 0.648 | 0.593 | 0.639 | shared driver, α = 0.70, β = 0.72, ψ = 0.20π (scan of §12.4) | — |
| 0.50 (below the band) | 10.49 | > 50 ((F) suffices) | 0.542 | 0.491 | 0.533 | search (no bulk, χ = 19) | > 50 |
| 0.70 | — | 5.00 | 0.409 | 0.364 | 0.401 | shared driver, α = 0.65, β = 0.76, ψ = 0.28π (scan of §12.4) | 12.2 |
| 0.85 | 1.85 | 2.73 | 0.345 | 0.304 | 0.338 | search (no bulk, χ = 17) | 7.9 |
| 1.00 | — | 2.01 | 0.198 | 0.164 | 0.193 | spike + bulk, c = 0.85 | 10.2 |

**t = 0.85** (band from 0.63σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.841 | 0.787 | 0.832 | junta H(X) | > 50 |
| 0.40 (below the band) | — | — | 0.722 | 0.665 | 0.712 | shared driver, α = 0.71, β = 0.71, ψ = 0.16π (scan of §12.4) | — |
| 0.50 (below the band) | 15.66 | > 50 ((F) suffices) | 0.607 | 0.553 | 0.598 | shared driver, α = 0.69, β = 0.73, ψ = 0.22π (scan of §12.4) | > 50 |
| 0.70 | — | 7.37 | 0.460 | 0.413 | 0.452 | shared driver, α = 0.66, β = 0.75, ψ = 0.27π (scan of §12.4) | 16.0 |
| 0.85 | — | 3.91 | 0.390 | 0.347 | 0.383 | search (no bulk, χ = 17) | 10.0 |
| 1.00 | — | 2.67 | 0.230 | 0.193 | 0.224 | spike + bulk, c = 0.85 | 11.6 |

**t = 0.855** (band from 0.70σ*²):

| u/σ*² | θ₀(u) | θ_room(u) | ratio, sector A | sector B | summed | maximiser of A | θ_room(u)/largest ratio |
|---|---|---|---|---|---|---|---|
| 0.30 (below the band) | > 50 | > 50 ((F) suffices) | 0.960 | 0.906 | 0.951 | junta H(X) | > 50 |
| 0.40 (below the band) | — | — | 0.812 | 0.755 | 0.803 | shared driver, α = 0.72, β = 0.69, ψ = 0.00π (scan of §12.4) | — |
| 0.50 (below the band) | 21.71 | > 50 ((F) suffices) | 0.686 | 0.633 | 0.678 | shared driver, α = 0.70, β = 0.71, ψ = 0.19π (scan of §12.4) | > 50 |
| 0.70 | — | 13.86 | 0.525 | 0.476 | 0.517 | shared driver, α = 0.67, β = 0.74, ψ = 0.24π (scan of §12.4) | 26.4 |
| 0.85 | — | 6.29 | 0.447 | 0.401 | 0.439 | search (no bulk, χ = 18) | 14.1 |
| 1.00 | — | 4.09 | 0.271 | 0.231 | 0.264 | spike + bulk, c = 0.85 | 15.1 |

Summary:

| t | band of the open inequality, u/σ*² | smallest margin θ_room(u)/ratio, possible responses | at u/σ*² | maximiser there | the same if cubics excluded by (R1) are counted | row constant of round 3 against the largest ratio in the band |
|---|---|---|---|---|---|---|
| 0.80 | [0.37, 1.22] | 3.1 | 0.85 | shared driver, α = 0.62, β = 0.79, ψ = 0.39π (scan of §12.4) | 2.6 | 1.2 |
| 0.82 | [0.43, 1.16] | 4.3 | 0.85 | shared driver, α = 0.62, β = 0.78, ψ = 0.36π (scan of §12.4) | 3.6 | 1.5 |
| 0.84 | [0.54, 1.14] | 7.1 | 0.85 | search (no bulk, χ = 16) | 5.4 | 2.7 |
| 0.845 | [0.58, 1.08] | 7.9 | 0.85 | search (no bulk, χ = 17) | 6.7 | 4.6 |
| 0.85 | [0.63, 1.09] | 10.0 | 0.85 | search (no bulk, χ = 17) | 7.9 | 5.4 |
| 0.855 | [0.70, 1.11] | 14.1 | 0.85 | search (no bulk, χ = 18) | 10.5 | 7.0 |

- **Both sides grow as u falls, and the threshold grows faster.** On every row the smallest margin is therefore near
  σ*², not at the low end of the band: 3.1, 4.3, 7.1, 7.9, 10.0, 14.1 on the six rows, at u/σ*² = 0.85 on each.
- **At and above σ*²** the maximisers are not possible responses (R1). If they are counted all the same, the
  smallest margins become 2.6, 3.6, 5.4, 6.7, 7.9, 10.5. The row minimum of the threshold (0.37, 0.64, 1.33, 1.88, 2.5,
  3.7, from §11.4, attained just above σ*²) against the ratio at σ*² gives 2.7, 3.5, 5.0, 6.3, 7.4, 9.5.
- **Rows 0.80 and 0.82 still have room.** Their smallest energy-matched margins are 3.1 and 4.3. The reviewer's 1.7
  and 2.2 compare the ratio at 0.5σ*² with the row constant, which belongs to σ*². At 0.5σ*² itself:
  t = 0.80, θ_room = 2.80 against a largest ratio of 0.262: margin 10.7;
  t = 0.82, θ_room = 5.18 against a largest ratio of 0.345: margin 15.0.
  Had one constant been required over the whole band, the margins would be the last column of the summary (1.2 and
  1.5 on these two rows); it is not required.
- **The worst cubics are not the four families.** Every search ends at a shared-driver cubic
  X·(α(|X|² − 2)/√2 + βe^{iψ}(|Y|² − 1)) with α ≈ 0.6–0.7, β ≈ 0.7–0.8 and a relative phase ψ ≈ 0.2–0.35π: a junta and
  a rank-one cofactor on the same driver X (the family "Wick + shared" at another point). Its ratio is about 20 %
  above that of H(X) + H(Y). With a bulk (c = 0.8) the maximum is lower. The rows "scan of §12.4" maximise over
  (α, β, ψ) directly.
- The margins are against searches over two core variables with at most a diffuse bulk, from four starts: lower
  bounds on the suprema. They use the larger sector (A) and the pointwise μ.

### 12.3 The local representation as a bound (A2)

**Statement used (6.3.26; REPORT Prop. 6.4).** With k(v, c) = E_τ h(v + cτ), F = ∂̄q, W_k = (F·∇)F_k:

    E[ȳ_e q h(V)] = ⟨y_e q ∂_vk(V, c₂), a⟩ + Σ_k ⟨y_e F_k ∂_ck(V, c₂), W_k⟩.

**The bound (P, mine; same Cauchy–Schwarz as 6.3.25).** a = a₂,₀ + a₃,₁ with a₂,₀ = P₂,₀q², a₃,₁ = ½P₃,₁q², and
W_k = ∂̄_ka₃,₁ (REVIEW of the package, T2c). So the two pairings with the (3,1) part combine into one vector:

    c_e = ⟨P₂,₀G₁, a₂,₀⟩ + ⟨T, a₃,₁⟩,     G₁ = y_e q ∂_vk,   T = P₃,₁G₁ + Σ_k ȳ_k⋄P₃,₀(y_e F_k ∂_ck),
    |c_e|² ≤ (‖P₂,₀G₁‖·b₁ + ½‖T‖·b₂)² ≤ (δ − 2‖c₂ − u‖²)·Ω^loc_e,     Ω^loc_e = ‖P₂,₀G₁‖² + ¼‖T‖²,

with b₁ = ‖P₂,₀q²‖, b₂ = ‖P₃,₁q²‖ and b₁² + b₂² = δ − 2‖c₂ − u‖². The middle expression is the bound "with the true
component norms".

**Checks (N).** On 220 cases the representation agrees with the direct content to 3e-03 (relative), the
pairing through the projections and T to the same accuracy, and b₁² + b₂² + 2‖c₂ − u‖² = δ to 5e-06.

**Evaluation** (`r4_local.py`): two-variable cubics without bulk, at each sector's content direction, summed over
A and B, in units of δΩ̂. Largest over the cases at each energy:

| t | u/σ*² | truth: ‖c‖² | 6.3.25: δΩ_{e*} | 6.3.26: (δ − 2‖c₂−u‖²)Ω^loc_{e*} | 6.3.26 with the true component norms | 6.3.26 / 6.3.25: range over the cases | share of the allowance: 6.3.25, 6.3.26 |
|---|---|---|---|---|---|---|---|
| 0.80 | 0.35 | 0.35 | 0.93 | 0.65 | 0.65 | 0.61–0.96 | 0.160, 0.124 |
| 0.80 | 0.50 | 0.26 | 0.84 | 0.58 | 0.58 | 0.59–1.09 | 0.250, 0.202 |
| 0.80 | 0.70 | 0.19 | 0.75 | 0.52 | 0.51 | 0.59–1.30 | 0.345, 0.286 |
| 0.80 | 0.85 | 0.15 | 0.71 | 0.49 | 0.48 | 0.59–1.45 | 0.390, 0.334 |
| 0.80 | 1.00 | 0.13 | 0.67 | 0.47 | 0.45 | 0.59–1.59 | 0.417, 0.373 |
| 0.82 | 0.35 | 0.46 | 1.01 | 0.73 | 0.72 | 0.62–0.90 | 0.126, 0.095 |
| 0.82 | 0.50 | 0.34 | 0.92 | 0.64 | 0.64 | 0.62–0.97 | 0.198, 0.152 |
| 0.82 | 0.70 | 0.25 | 0.83 | 0.58 | 0.57 | 0.62–1.11 | 0.263, 0.212 |
| 0.82 | 0.85 | 0.21 | 0.78 | 0.54 | 0.54 | 0.61–1.22 | 0.302, 0.247 |
| 0.82 | 1.00 | 0.18 | 0.74 | 0.51 | 0.51 | 0.61–1.33 | 0.329, 0.275 |
| 0.84 | 0.35 | 0.64 | 1.23 | 0.87 | 0.86 | 0.63–0.88 | 0.095, 0.071 |
| 0.84 | 0.50 | 0.48 | 1.03 | 0.74 | 0.73 | 0.62–0.90 | 0.150, 0.110 |
| 0.84 | 0.70 | 0.36 | 0.93 | 0.66 | 0.66 | 0.62–0.95 | 0.200, 0.151 |
| 0.84 | 0.85 | 0.30 | 0.88 | 0.62 | 0.62 | 0.63–1.01 | 0.225, 0.174 |
| 0.84 | 1.00 | 0.26 | 0.84 | 0.59 | 0.58 | 0.63–1.09 | 0.242, 0.193 |
| 0.845 | 0.35 | 0.71 | 1.31 | 0.93 | 0.92 | 0.64–0.88 | 0.087, 0.067 |
| 0.845 | 0.50 | 0.53 | 1.08 | 0.78 | 0.76 | 0.63–0.89 | 0.138, 0.101 |
| 0.845 | 0.70 | 0.40 | 0.97 | 0.69 | 0.69 | 0.62–0.92 | 0.184, 0.137 |
| 0.845 | 0.85 | 0.34 | 0.92 | 0.64 | 0.64 | 0.62–0.97 | 0.208, 0.158 |
| 0.845 | 1.00 | 0.29 | 0.87 | 0.61 | 0.61 | 0.63–1.03 | 0.224, 0.175 |
| 0.85 | 0.35 | 0.78 | 1.41 | 1.00 | 0.99 | 0.64–0.88 | 0.079, 0.062 |
| 0.85 | 0.50 | 0.60 | 1.17 | 0.83 | 0.82 | 0.63–0.89 | 0.125, 0.091 |
| 0.85 | 0.70 | 0.45 | 1.01 | 0.72 | 0.72 | 0.62–0.90 | 0.169, 0.124 |
| 0.85 | 0.85 | 0.38 | 0.95 | 0.68 | 0.68 | 0.62–0.93 | 0.190, 0.142 |
| 0.85 | 1.00 | 0.33 | 0.91 | 0.64 | 0.64 | 0.63–0.98 | 0.206, 0.157 |
| 0.855 | 0.35 | 0.88 | 1.52 | 1.08 | 1.07 | 0.65–0.88 | 0.072, 0.057 |
| 0.855 | 0.50 | 0.68 | 1.27 | 0.90 | 0.89 | 0.63–0.88 | 0.113, 0.082 |
| 0.855 | 0.70 | 0.52 | 1.06 | 0.76 | 0.75 | 0.63–0.89 | 0.152, 0.111 |
| 0.855 | 0.85 | 0.44 | 1.00 | 0.71 | 0.71 | 0.62–0.90 | 0.172, 0.127 |
| 0.855 | 1.00 | 0.38 | 0.95 | 0.68 | 0.68 | 0.62–0.93 | 0.187, 0.140 |

By cubic, all rows and energies:

| cubic | 6.3.26 / 6.3.25 | 6.3.25 / truth | 6.3.26 (true norms) / truth | budget share (δ − 2‖c₂−u‖²)/δ |
|---|---|---|---|---|
| H(X) + H(Y) | 0.88–1.02 | 1.70–3.67 | 1.47–3.76 | 0.76 |
| Wick + shared | 0.79–1.04 | 1.38–2.43 | 1.07–2.45 | 0.75 |
| X(\|Y\|² − 1) | 0.69–0.76 | 2.20–7.35 | 1.59–4.96 | 0.63 |
| junta H(X) | 0.82–1.59 | 1.24–1.60 | 1.00–2.48 | 0.76 |
| random | 0.62–0.71 | 2.26–4.38 | 1.46–3.05 | 0.67 |
| search maximiser found at 0.40σ*² | 0.65–0.72 | 1.71–3.12 | 1.20–2.04 | 0.65–0.67 |
| search maximiser found at 0.50σ*² | 0.63–0.82 | 1.35–3.16 | 1.05–1.97 | 0.64–0.71 |
| search maximiser found at 0.85σ*² | 0.59–0.76 | 1.48–3.23 | 1.10–1.83 | 0.62–0.67 |

Verdict:
- **It is better than 6.3.25 at the content direction on the cofactor types everywhere, and on the junta-like
  types except at the upper energies of the lower rows.** Ratio of the two bounds: 0.69–0.76 on X(|Y|² − 1),
  0.62–0.71 on the random cubic, 0.79–1.04 on Wick + shared, 0.88–1.02 on H(X) + H(Y), 0.82–1.59 on the junta
  (above 1 at t = 0.80 from 0.5σ*², at t = 0.82 from 0.7σ*², at t = 0.84–0.845 near σ*²), and 0.59–0.82 on the search
  maximisers of §12.2.
- The largest value over the cases falls from 1.52 to 1.08 (units of δΩ̂; t = 0.855, u = 0.35σ*²), a factor 0.71: the
  binding case for both is X(|Y|² − 1).
- Where the gain comes from: the budget, δ − 2‖c₂ − u‖² = 0.62–0.76 of δ on these cubics, and the single vector T.
  With the true component norms the bound equals the truth on the junta wherever the two pairings have the same
  sign (in one variable the two chaos spaces are one-dimensional); where they cancel it overshoots (range
  1.00–2.48; the largest at t = 0.80, σ*²).
- **Not evaluated with a diffuse bulk** (it needs two-dimensional smoothing tables in (|q|, c₂); §12.5). On paper
  (P, a sketch), in the Gaussian limit: c₂ → u and T → (c₀ + κ₂)·y_e⋄q with κ₂ = E[∂_ck(V, u)]. Both c₀ and κ₂ equal
  E[(G/2)h′(uG)], G ~ Gamma(2); numerically κ₂/c₀ = 1.000 ± 0.001 on the six rows (`r4_kappa.py`). So Ω^loc → c₀²u,
  which is 4/3 of the floor of 6.3.25; the budget factor is 0.76 for a spike and 0.63 for X(|Y|² − 1) + bulk, and
  the ratio of the two bounds tends to 1.02 and 0.83. At the low-kurtosis end, where Ω_{e*}/Ω̂ of 6.3.25 is largest,
  the local bound is about equal to it: **it does not lower the maximum over the hard families.**
- As a route it has the status of 6.3.25: it needs a certified majorant of Ω^loc at the content direction. It has
  a smaller budget and no pairing with c₂ − u.

### 12.4 A candidate for the general lemma: the split at the content direction (A3)

**The candidate.** At the content direction e (X′ = y_e, Y′ the orthogonal coordinates) write q = S + C:
- S, self-interaction in X′: the span of H(X′), X′²·conj(ℓ(Y′)) and (|X′|² − 1)·L(Y′);
- C, the cofactor part: X′·Q(Y′) + conj(X′)·F(Y′) + R(Y′).

The Stein fields of 6.3.23 split as (a, x) = (a_S, x_S) + (a_R, x_R), where (a_S, x_S) are the fields of the cubic S
alone and (a_R, x_R) the rest (cross terms and the fields of C). Then (P, mine; both steps are the reviewed ones
applied to a part of the fields):

    c_e[h] = E[ȳ_e k′(V)(q̄ a_S + q x_S)] + E[k′(V)·M_R(V)],       M_R(v) = E[ȳ_e(q̄ a_R + q x_R) | V = v],
    |first term|²  ≤ δ_S·Ω_e[h],            δ_S = E|S|⁴ − 2(E|S|²)²        (6.3.25 with the budget of S),
    |second term|² ≤ θ_R·δ·Ω̂[h],           θ_R = (2/(3δ))·(E[|M_R(V)|²/V] + |E M_R|²/u)   (the dual form, REVIEW §5.3).

    (C-split)    ‖c[h]‖² ≤ δ·Ω̂[h]·R_split,       R_split = (√((δ_S/δ)·Ω_{e*}/Ω̂) + √θ_R)².

- For S = q it is 6.3.25; for C = q it is the sharp profile-free constant θ*(q, e) of REVIEW §5.3.
- **What the law program would have to carry:** three numbers that are not functions of the law of |q|: the budget
  share δ_S/δ, a majorant of Ω_{e*}/Ω̂ for the self part, and θ_R, that is the conditional field M_R(V). The first
  could be a new scalar; the other two need new lemmas (a majorant of Ω at a self-interaction direction; a
  conditional-sign bound for a general cofactor, of which the class result is the case X·P_m).

**Test** (`r4_split.py`; conditional expectations given V by 200 quantile bins; two-variable cubics without bulk;
u/σ*² ∈ {0.35, 0.5, 0.7, 0.85, 1}; both sectors). In units of δΩ̂:

| cubic (t = 0.84, sector A) | u_S/u | δ_S/δ | truth at u/σ*² = 0.35, 0.50, 0.70, 0.85, 1.00 | 6.3.25 alone | θ*(q, e*) alone | θ_R | split |
|---|---|---|---|---|---|---|---|
| H(X) + ½X(\|Y\|² − 1) | 0.80 | 0.85 | 0.61, 0.43, 0.31, 0.25, 0.21 | 0.79, 0.58, 0.44, 0.37, 0.33 | 4.48 | 0.06 | 1.15, 0.92, 0.75, 0.67, 0.61 |
| H(X) + H(Y) | 0.25 | 0.13 | 0.55, 0.42, 0.31, 0.26, 0.22 | 1.00, 0.81, 0.67, 0.60, 0.55 | 2.41 | 1.33 | 2.27, 2.17, 2.08, 2.04, 2.01 |
| Wick + shared | 0.91 | 0.99 | 0.58, 0.41, 0.29, 0.23, 0.20 | 0.83, 0.62, 0.46, 0.39, 0.34 | 4.66 | 0.00 | 0.92, 0.70, 0.54, 0.46, 0.41 |
| X(\|Y\|² − 1) | 0.00 | 0.00 | 0.45, 0.35, 0.26, 0.22, 0.19 | 1.14, 1.03, 0.94, 0.89, 0.85 | 1.57 | 1.57 | 1.57, 1.57, 1.57, 1.57, 1.57 |
| X(\|Y\|² − 1) + 0.3H(X) | 0.08 | 0.02 | 0.54, 0.42, 0.32, 0.27, 0.23 | 0.90, 0.77, 0.67, 0.63, 0.59 | 2.09 | 1.84 | 2.18, 2.16, 2.13, 2.12, 2.12 |
| junta H(X) | 1.00 | 1.00 | 0.58, 0.41, 0.29, 0.23, 0.19 | 0.73, 0.52, 0.37, 0.30, 0.25 | 4.99 | 0.00 | 0.73, 0.52, 0.37, 0.30, 0.25 |
| random | 0.61 | 0.69 | 0.51, 0.38, 0.29, 0.24, 0.21 | 1.24, 1.02, 0.84, 0.75, 0.68 | 2.53 | 0.06–0.10 | 1.38, 1.20, 1.06, 0.99, 0.93 |
| search maximiser found at 0.50σ*² | 0.45 | 0.46 | 0.65, 0.49, 0.36, 0.31, 0.26 | 1.00, 0.80, 0.65, 0.58, 0.53 | 2.96 | 0.67 | 2.23, 2.03, 1.86, 1.78, 1.72 |
| search maximiser found at 0.85σ*² | 0.41 | 0.42 | 0.63, 0.48, 0.37, 0.31, 0.27 | 1.07, 0.87, 0.71, 0.64, 0.58 | 2.61 | 0.74 | 2.34, 2.15, 1.98, 1.90, 1.84 |

| t | largest truth | largest 6.3.25 alone | largest split | smallest split / (6.3.25 alone) | cases where a proved step is violated |
|---|---|---|---|---|---|
| 0.80 | 0.36 | 0.94 | 2.13 | 1.00 | 0 of 100 |
| 0.82 | 0.47 | 1.02 | 2.15 | 1.00 | 0 of 100 |
| 0.84 | 0.65 | 1.24 | 2.34 | 1.00 | 0 of 90 |
| 0.845 | 0.71 | 1.32 | 2.41 | 1.00 | 0 of 90 |
| 0.85 | 0.79 | 1.42 | 2.46 | 1.00 | 0 of 90 |
| 0.855 | 0.89 | 1.53 | 2.52 | 1.00 | 0 of 90 |

- **Consistency.** The two proved steps hold on all 560 evaluations, and the two pieces add up to the content (largest
  T3 error 5e-03).
- **(C-split) does not survive.** It is never below 6.3.25 unsplit: the ratio of the two is 1.00 on the pure junta
  and up to 5.1. Its largest value is 2.13, 2.15, 2.34, 2.41, 2.46, 2.52 on the six rows.
- **Against the threshold of §12.2, energy by energy** (largest (C-split)/θ_room(u) over the band):
  5.8, 3.2, 1.5, 1.1, 0.8, 0.5 at t = 0.80, …, 0.855. Below 1 only on t = 0.85–0.855, where 6.3.25 unsplit is
  smaller still (0.34, 0.23 of the threshold).
- **The obstruction, with numbers** (t = 0.84, u = 0.85σ*², sector A):
  1. *The conditioning step is profile-free.* On the rank-one cofactor X(|Y|² − 1) it gives θ_R = 1.57 (REVIEW §4.6:
     1.547 sharp), where 6.3.25 gives 0.89, 6.3.26 gives 0.62 and the truth is 0.22. No profile-free constant is
     below 4/3 there (the ratio of h(v) = v), and the thresholds near σ*² on t ≤ 0.84 are below 4/3.
  2. *The content direction does not separate cores from cofactors.* H(X) + H(Y) has content direction
     (X + Y)/√2; there u_S/u = 0.25 and δ_S/δ = 0.13, so most of a sum of two juntas counts as cofactor, with
     θ_R = 1.33 against a truth of 0.26.
  3. *The triangle inequality between the two pieces.* Random cubic: the pieces are 0.48 and 0.09, (C-split) is
     0.99, 6.3.25 unsplit 0.75.
- **What the searches point to instead.** The maximisers of the ratio are shared-driver cubics q = √u·X·Z with
  Z = α(|X|² − 2)/√2 + βe^{iψ}(|Y|² − 1) (§12.2). In that class the content is √u·E[|X|²·Z·h(u|X|²|Z|²)]: the junta
  and the cofactor are one object, and the conditioning of the class result would become a bound on the conditional
  mean of the phase of Z given (|X|², |Z|), with the profile kept. A scan of the class over (α, β, ψ) (`r4_xz.py`)
  gives the rows "scan" of §12.2. As a candidate:

      (C-XZ)   on the band, the sector ratio of every remote cubic is at most its supremum over the shared-driver class.

  Its right side is one number per row and energy, so the law program needs nothing new; the supremum over the
  class is a two-dimensional integral per (α, β, ψ) and can be certified. **It is a conjecture read off the searches,
  not a consequence of the split**, and the reduction of a general cubic to the class is the open step.
  Support (N): the four-start searches (0.5σ*² and 0.85σ*² on every row) all end in the class; and from random starts
  only (`r4_rand.py`, eight at t = 0.80 and eight at t = 0.84, u = 0.85σ*²) no run ends above the class value
  (0.1595 and 0.3088): seven end within 0.5 % of it, at unitary rotations of the class, the others below. Rank m > 1
  cofactors (X·P_m) were not scanned here; REVIEW §4.2 has them below m = 1.
  **Corrected in round 4, part B (§13): (C-XZ) is false beyond two variables.** Cofactors with two or three complex
  eigenvalues exceed the class value (0.1780, 0.1833 against 0.1595 at t = 0.80, 0.85σ*²), and cubics in 3 to 10
  variables reach 0.1925 to 0.2761; their maximisers have a part free of the content direction (§13.5).

### 12.5 What was not done

- **A2 with a diffuse bulk.** Only two-variable cubics without bulk were evaluated; the diffuse limit is on paper
  only (§12.3).
- **Searches.** Two core variables, c ∈ {1, 0.8}, four starts, sector A, at 0.5σ*² and 0.85σ*² (and 0.4σ*² at
  t = 0.80, 0.82). (R1) is checked on the maximiser, not imposed during the search.
- **Thresholds.** θ_room(u) on five energies per row (eight at t = 0.80, 0.82), χ ∈ {2, 8, 16, 30, 42}, by
  bracketing and linear interpolation; nothing between σ*² and the cap beyond the row minimum of round 3.
- **The low end u₀** is interpolated on a grid of 0.1σ*², with the same five values of χ. The scan of the
  shared-driver class was not run at 0.6σ*².
- **A3.** One candidate tested, and it fails; (C-XZ) is a conjecture from searches over two core variables. No
  cofactor of rank above one and no cubic in three or more variables was tested.
- `big` and `yo` were not used. Nothing was committed, pushed or posted.

---------------------------------------------------------------------------------------------------------------------

## 13. Round 4, part B (16 November, night): the driver class, more variables, families with many variables

**Nothing in this section closes a row, and two statements of §12 are corrected: (C-XZ) is false beyond two
variables, and the margins of §12.2 are two-variable numbers.** With more variables the largest sector-A ratio is
higher: 0.2761 at 0.85σ*² and 0.2505 at σ*² on t = 0.80, against allowances 0.487 and 0.360 (factors
1.76 and 1.44; they were 3.1 and 2.6 in two variables). The largest values belong to a family with three clusters
of c variables (n = 3c + 1) that reduces exactly to the law of one scalar (§13.8); with the bulk of smallest
fourth-moment ratio found its values for c = 4, 5, 6, 7, 8, 9, 10 are 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724 at 0.85σ*² and
0.2470, 0.2467, 0.2493, 0.2481, 0.2508, 0.2481, 0.2474 at σ*². The supremum over the number of variables is not known.

- The text for outside sessions is `content5/PROBLEM_V2.md`: the coordinator's edition with my corrections and the
  consolidated update of this round. It is the single source for the hand-out; its §3 has the tables below.
- Labels as before; everything is N unless marked. A search gives a lower bound on a supremum, up to the accuracy
  of its quadrature. Present game (1, −39/50, 779/10000); the rows of the game A of the sibling worker were not used.
- Machines: the laptop until 19:50 (two processes behind a load guard); then `big`, cores 32–47, folder
  `/root/claude-b9ee-content6` (copied to `content5/out/big/`).

### 13.1 The classes

Fix a unit direction e, X = y_e, R = |X|², and let Y be the orthogonal coordinates. Write h₂(R) = (R − 2)/√2, so that
X·h₂(R) is the junta H(X). Every cubic of energy u is uniquely

    q = √u·[α·X·h₂(R) + X²·conj(ℓ(Y)) + (R − 1)·L(Y) + X·Q(Y) + X̄·F(Y) + R₃(Y)],

with ℓ, L linear, Q ∈ H₁,₁(Y), F ∈ H₂,₀(Y), R₃ ∈ H₂,₁(Y).
- **Class H** (ledger 3.26): q vanishes on {X = 0}, that is L = 0 and R₃ = 0.
- **Driver class 𝒟**: in addition ℓ = 0 and F = 0:

      q = √u·X·Z,     Z = α·h₂(R) + Q(Y),     α ≥ 0,   α² + ‖Q‖² = 1.

  The cofactor Q = Y*MY − tr M is any element of H₁,₁(Y) in any number of variables. For a normal matrix M it is
  Q = Σ_j m_j(T_j − 1) with complex eigenvalues m_j and independent T_j = |Y_j|² ~ Exp(1); the rank is the number of m_j.
- The extremal family of §12.2 is 𝒟 with a cofactor of rank one, m = βe^{iψ}.

### 13.2 What the quantities become on 𝒟 (B2 (a); P)

Given Y the cubic is a function of X alone, q = √u·X·(α·h₂(R) + w) with w = Q(Y). Hence:

1. **Content.** For a direction e′ orthogonal to X, ȳ_{e′}·q·h(V) is X times a function of (R, Y), so c_{e′} = 0. The
   content direction is X for every profile, and

       c_X[h] = √u·E[R·Z·h(u·R·|Z|²)] = √u·∫ g(w) dμ_Q(w),      g(w) = E_R[R·(α·h₂(R) + w)·h(u·R·|α·h₂(R) + w|²)],

   where μ_Q is the law of the complex number Q.
2. **Budget.** V = u·R·|Z|² and δ = u²(∫ m₄ dμ_Q − 2), with the polynomial

       m₄(w) = E_R[R²·|α·h₂(R) + w|⁴] = 44α⁴ + 32√2·α³·Re w + 4α²·(4(Re w)² + 2|w|²) + 4√2·α·|w|²·Re w + 2|w|⁴.

   For a normal cofactor: E(Re Q)² = Σ(Re m_j)², E[|Q|²·Re Q] = 2Σ|m_j|²·Re m_j,
   E|Q|⁴ = 2β⁴ + |Σm_j²|² + 6Σ|m_j|⁴ (β² = Σ|m_j|²). So

       χ = 40α⁴ + 2 + Σ_j [16α²(Re m_j)² + 8√2·α·|m_j|²·Re m_j + 12|m_j|⁴] + 2|Σ_j m_j²|²  ≥  2 + 40α⁴,

   each bracket being at least 10|m_j|⁴. (Checks: 42 at the junta, 16 at X(|Y|² − 1), 16.02 at the test cubic "worst".)
3. **Law functional.** Ω̂[h] = (3/2)∫A₂ dμ_Q − (3/4)(∫A₁ dμ_Q)²/u, with A_i(w) = E_R[V·k′(V)^i] at V = u·R·|α·h₂(R) + w|².
4. **So the ratio on 𝒟 is a function of (α, u) and of the law μ_Q only**, through the four one-dimensional kernels
   g, m₄, A₁, A₂ of w ∈ ℂ:

       r_h(q) = |∫g dμ_Q|² / (u·(∫m₄ dμ_Q − 2)·Ω̂).

   Two cofactors with the same law on ℂ give the same ratio, in any dimension.
5. **Stein fields.** c₂ = u·(α²R²/2 + R·N_Q) and a = u·X²·(α²(R − 1) + α·Q/√2 + Γ_Q), with N_Q = Σ_j|∂̄_jQ|² and
   Γ_Q = Σ_j ∂_jQ·∂̄_jQ (for a normal cofactor N_Q = Σ|m_j|²T_j, Γ_Q = Σm_j²T_j).
6. **Ω_X and Ω^loc_X are not functions of μ_Q.** They contain the projections of functions of (Q, N_Q, Γ_Q) onto
   H₁,₁(Y) and H₂,₂(Y). At rank one they are two-dimensional integrals (the numbers of §12.3).

**Answer to "is there a closed or one-dimensional form".** The integration over the driver is one-dimensional and
explicit, as for the radius. What is left is an integral of the kernels against the law of the cofactor value on ℂ,
and this cannot be closed as it was for the radius: there one Cauchy–Schwarz in R under the weight |X| sufficed,
because the integrand was positive. Here g changes sign, and the cancellation E Q = 0 has to be kept.

**Class H in general (P).** Given Y, q = √u·(α·X·h₂(R) + s̄·X² + w·X + f·X̄) with (s, w, f) = (ℓ(Y), Q(Y), F(Y)). Now
|q|² depends on the phase of X, the content has components along Y, and the kernels are functions on ℂ³ that also
involve the gradients of ℓ, Q, F. In two variables the searches of §12.2 over all six coefficients end in 𝒟 (N).

### 13.3 The landscape inside 𝒟 (N)

- Rank one (the two-variable family of §12.2) is **not** extremal in 𝒟. Sector A, t = 0.80, 0.85σ*²: equal eigenvalues
  of rank 1, 2, 3, 4, 8, 21: 0.1595, 0.1707, 0.1725, 0.1723, 0.1696, 0.1660; free complex eigenvalues: rank two
  0.1780 (a conjugate pair 0.625e^{±0.24πi}, α = 0.47), rank three 0.1833 (0.533e^{±0.28πi} and 0.500, α = 0.43); a
  Gaussian cofactor 0.1628. At t = 0.84: 0.3087 (rank one), 0.3331 (rank two), 0.2911 (Gaussian).
- Rank one against rank two on every row at 0.7, 0.85, 1.0 σ*² (`b2_table.py`): 0.80: 0.1915/0.2120, 0.1595/0.1780,
  0.1367†/0.1536; 0.82: 0.2551/0.2782, 0.2134/0.2349, 0.1835†/0.2034†; 0.84: 0.3665/0.3911, 0.3088/0.3331,
  0.2669†/0.2903; 0.845: 0.4086/0.4331, 0.3452/0.3699, 0.2990†/0.3231†; 0.85: 0.4603/0.4841, 0.3902/0.4148,
  0.3387†/0.3633†; 0.855: 0.5255/0.5476, 0.4472/0.4712, 0.3894†/0.4140 († not a possible response by (R1)).

### 13.4 The relaxation over cofactor laws (P for the lemma, N for the values)

- **Convexity (P).** At fixed (α, u) the content and δ are linear in the law μ of the cofactor value and Ω̂ is
  concave; for every λ > 0 and phase φ the functional 2Re(e^{−iφ}c_X) − λθδ − Ω̂/λ is convex in μ, and (T) on 𝒟 is its
  nonpositivity. Under k linear constraints its supremum is attained on laws with at most k + 1 atoms.
- **With E Z = 0 and E|Z|² fixed only, (T) is false.** α = 0 and Z ∈ {s, −1/s} with probabilities 1/(1 + s²),
  s²/(1 + s²): as s → 1 the law of V tends to the exponential law and the ratio tends to 2u·c₀²/Ω̂(Gauss) (P),
  c₀ = E[V k′(V)]/u at the Gaussian law: 2.19, 2.34, 2.47, 2.51, 2.54, 2.56 on the six rows at σ*²
  (`b2_twopoint.py`). At χ = 2, 8, 16 on t = 0.80: 1.65, 0.96, 0.61 (the cofactor X(|Y|² − 1), χ = 16, has 0.094).
  For h(v) = v the ratio is 8/3 for every s (P).
- **With the third-moment constraints** |E Z²Z̄|², |E Z³|² ≤ (2/3)·s₂·k₂₂ and k₂₂ ≤ 6s₂² (s₂ = E|Z|²,
  k₂₂ = E|Z|⁴ − 2s₂² − |E Z²|²; valid for every normal second-chaos cofactor, by Cauchy–Schwarz between Σm²m̄, Σ|m|²,
  Σ|m|⁴), laws with 4 to 6 atoms give at least 0.89 and 0.82 at t = 0.80 (0.85σ*², σ*²; allowances 0.49, 0.36), 1.02
  and 0.95 at t = 0.82 (0.91, 0.66), 1.19 and 1.13 at t = 0.84 (2.2, 1.44) (`b2_relax.py`). (R1) does not cut these
  laws. So the relaxation fails on t = 0.80, 0.82 and is not refuted at t = 0.84. The true values in 𝒟 are 4 to 5
  times smaller: atomic laws are far from chaos laws, and moment constraints do not see it.

### 13.5 General cubics in n = 3, …, 13 variables, and the three-cluster family beyond (N)

Searches: all of H₂,₁(ℂⁿ) for n ≤ 8 with analytic gradients (`b2_gen3.py`, `b2_gen5.py`, `b2_gen7.py`; δ exact;
the other integrals on a fitting sample; the value quoted is on independent samples), and reduced families
(`b2_bip.py`, `b2_fam.py`). Largest values by n, with the measured values on two independent samples, the value on
the fitting sample ("fit": biased upward, never to be quoted), the fourth excess, the energy shares of the parts
relative to the content direction, and the values of the full searches:

| t | u/σ*² | n | largest ratio A | two independent samples | fit | χ | junta | X·Q | R₃ | where found | full searches |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.85 | 3 | 0.1925 | — | 0.1926 (2^18) | 9.27 | 0.239 | 0.490 | 0.271 | full | 0.1925, 0.1925, 0.1925, 0.1925 |
| 0.80 | 0.85 | 4 | 0.2105 | — | — | 7.06 | 0.182 | 0.463 | 0.355 | full | 0.2105, 0.2104, 0.2101, 0.2100 |
| 0.80 | 0.85 | 5 | 0.2246 | 0.2247, 0.2246 | 0.2254 (2^20) | 5.57 | 0.154 | 0.463 | 0.383 | bipartite (2,2) | 0.2246, 0.2245, 0.2245, 0.2244 |
| 0.80 | 0.85 | 6 | 0.2386 | 0.2387, 0.2384 | 0.2428 (2^20) | 4.53 | 0.124 | 0.398 | 0.476 | full | 0.2386, 0.2376, 0.2365, 0.2364 |
| 0.80 | 0.85 | 7 | 0.2483 | 0.2485, 0.2482 | 0.2505 (2^20) | 3.84 | 0.109 | 0.386 | 0.506 | clusters 2,2,2 | 0.2474, 0.2474, 0.2472 |
| 0.80 | 0.85 | 8 | 0.2532 | 0.2531, 0.2532 | 0.2613 (2^20) | 3.36 | 0.099 | 0.374 | 0.527 | bipartite (3,4) | 0.2525, 0.2515 |
| 0.80 | 0.85 | 9 | 0.2575 | 0.2575, 0.2575 | 0.2660 (2^20) | 3.01 | 0.091 | 0.363 | 0.546 | bipartite (3,5) | — |
| 0.80 | 0.85 | 10 | 0.2588 | — | — | 2.83 | 0.089 | 0.366 | 0.545 | clusters 3,3,3, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 11 | 0.2630 | 0.2628, 0.2632 | 0.2799 (2^20) | 2.48 | 0.079 | 0.338 | 0.583 | bipartite (4,6) | — |
| 0.80 | 0.85 | 12 | 0.2666 | 0.2664, 0.2669 | 0.2793 (2^20) | 2.29 | 0.075 | 0.331 | 0.594 | clusters 4,3,4 | — |
| 0.80 | 0.85 | 13 | 0.2756 | 0.2750, 0.2761 | — | 2.06 | 0.071 | 0.312 | 0.617 | clusters 4,4,4, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 16 | 0.2739 | 0.2742, 0.2736 | — | 1.77 | 0.066 | 0.304 | 0.630 | clusters 5,5,5, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 19 | 0.2748 | 0.2743, 0.2752 | — | 1.50 | 0.060 | 0.287 | 0.653 | clusters 6,6,6, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 22 | 0.2743 | — | — | 1.34 | 0.058 | 0.277 | 0.665 | clusters 7,7,7, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 25 | 0.2761 | 0.2757, 0.2766 | — | 1.17 | 0.053 | 0.261 | 0.687 | clusters 8,8,8, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 28 | 0.2734 | — | — | 1.08 | 0.052 | 0.256 | 0.692 | clusters 9,9,9, bulk of smallest κ (§13.8) | — |
| 0.80 | 0.85 | 31 | 0.2731 | 0.2732, 0.2730 | — | 0.99 | 0.050 | 0.248 | 0.702 | clusters 10,10,10, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 3 | 0.1679 | — | 0.1682 (2^18) | 9.04 | 0.231 | 0.489 | 0.279 | full | 0.1679, 0.1679, 0.1679, 0.1679 |
| 0.80 | 1.00 | 4 | 0.1847 | — | 0.1870 (2^18) | 6.86 | 0.175 | 0.456 | 0.368 | full | 0.1847, 0.1847, 0.1845, 0.1844 |
| 0.80 | 1.00 | 5 | 0.1987 | — | 0.2043 (2^18) | 5.36 | 0.139 | 0.431 | 0.427 | full | 0.1987, 0.1983, 0.1982, 0.1982 |
| 0.80 | 1.00 | 6 | 0.2114 | 0.2114, 0.2115 | 0.2157 (2^20) | 4.40 | 0.118 | 0.391 | 0.488 | full | 0.2114, 0.2110, 0.2108 |
| 0.80 | 1.00 | 7 | 0.2211 | — | — | 3.73 | 0.103 | 0.383 | 0.515 | clusters 2,2,2, bulk of smallest κ (§13.8) | 0.2206, 0.2205, 0.2202 |
| 0.80 | 1.00 | 8 | 0.2257 | 0.2261, 0.2253 | 0.2308 (2^20) | 3.28 | 0.094 | 0.374 | 0.532 | bipartite (3,4) | 0.2253, 0.2252 |
| 0.80 | 1.00 | 9 | 0.2301 | 0.2302, 0.2300 | 0.2377 (2^20) | 2.93 | 0.085 | 0.360 | 0.555 | bipartite (3,5) | — |
| 0.80 | 1.00 | 10 | 0.2315 | — | — | 2.74 | 0.084 | 0.361 | 0.556 | clusters 3,3,3, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 11 | 0.2361 | 0.2361, 0.2362 | 0.2505 (2^20) | 2.41 | 0.075 | 0.332 | 0.592 | bipartite (4,6) | — |
| 0.80 | 1.00 | 12 | 0.2397 | 0.2395, 0.2399 | 0.2510 (2^20) | 2.21 | 0.070 | 0.326 | 0.604 | clusters 4,3,4 | — |
| 0.80 | 1.00 | 13 | 0.2482 | 0.2477, 0.2487 | — | 1.98 | 0.066 | 0.306 | 0.627 | clusters 4,4,4, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 16 | 0.2470 | 0.2474, 0.2467 | — | 1.70 | 0.061 | 0.299 | 0.640 | clusters 5,5,5, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 19 | 0.2482 | 0.2478, 0.2487 | — | 1.45 | 0.056 | 0.280 | 0.663 | clusters 6,6,6, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 22 | 0.2481 | — | — | 1.29 | 0.054 | 0.271 | 0.675 | clusters 7,7,7, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 25 | 0.2505 | 0.2501, 0.2509 | — | 1.12 | 0.049 | 0.255 | 0.696 | clusters 8,8,8, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 28 | 0.2481 | — | — | 1.04 | 0.048 | 0.250 | 0.701 | clusters 9,9,9, bulk of smallest κ (§13.8) | — |
| 0.80 | 1.00 | 31 | 0.2479 | 0.2480, 0.2479 | — | 0.95 | 0.047 | 0.242 | 0.712 | clusters 10,10,10, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 3 | 0.2493 | — | — | 9.76 | 0.256 | 0.491 | 0.253 | full | 0.2493 |
| 0.82 | 0.85 | 4 | 0.2685 | — | — | 7.42 | 0.199 | 0.463 | 0.337 | full | 0.2685 |
| 0.82 | 0.85 | 5 | 0.2835 | — | 0.2878 (2^20) | 5.87 | 0.165 | 0.462 | 0.371 | full | 0.2835, 0.2835, 0.2833 |
| 0.82 | 0.85 | 6 | 0.2975 | 0.2975, 0.2976 | 0.3042 (2^20) | 4.81 | 0.138 | 0.407 | 0.452 | full | 0.2975, 0.2964, 0.2961 |
| 0.82 | 0.85 | 7 | 0.3075 | — | — | 4.10 | 0.122 | 0.396 | 0.482 | clusters 2,2,2, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 8 | 0.3060 | 0.3067, 0.3053 | 0.3110 (2^20) | 3.84 | 0.119 | 0.414 | 0.467 | clusters 2,3,2 | — |
| 0.82 | 0.85 | 10 | 0.3172 | — | — | 3.04 | 0.100 | 0.376 | 0.523 | clusters 3,3,3, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 13 | 0.3314 | — | — | 2.23 | 0.081 | 0.324 | 0.595 | clusters 4,4,4, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 16 | 0.3295 | — | — | 1.92 | 0.075 | 0.317 | 0.608 | clusters 5,5,5, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 19 | 0.3305 | — | — | 1.64 | 0.070 | 0.299 | 0.631 | clusters 6,6,6, bulk of smallest κ (§13.8) | — |
| 0.82 | 0.85 | 25 | 0.3290 | — | — | 1.29 | 0.062 | 0.273 | 0.666 | clusters 8,8,8, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 3 | 0.2179 | — | — | 9.49 | 0.247 | 0.491 | 0.263 | full | 0.2179 |
| 0.82 | 1.00 | 4 | 0.2367 | — | — | 7.23 | 0.189 | 0.462 | 0.347 | full | 0.2367 |
| 0.82 | 1.00 | 5 | 0.2525 | — | 0.2558 (2^20) | 5.67 | 0.155 | 0.438 | 0.407 | full | 0.2525, 0.2511, 0.2505 |
| 0.82 | 1.00 | 6 | 0.2646 | 0.2647, 0.2646 | 0.2669 (2^20) | 4.67 | 0.131 | 0.425 | 0.444 | bipartite (2,3) | — |
| 0.82 | 1.00 | 7 | 0.2752 | — | — | 3.96 | 0.115 | 0.391 | 0.494 | clusters 2,2,2, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 8 | 0.2735 | 0.2739, 0.2730 | 0.2786 (2^20) | 3.69 | 0.111 | 0.411 | 0.478 | clusters 2,3,2 | — |
| 0.82 | 1.00 | 10 | 0.2855 | — | — | 2.92 | 0.094 | 0.371 | 0.535 | clusters 3,3,3, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 13 | 0.3005 | — | — | 2.13 | 0.076 | 0.317 | 0.607 | clusters 4,4,4, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 16 | 0.2993 | — | — | 1.84 | 0.071 | 0.309 | 0.620 | clusters 5,5,5, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 19 | 0.3010 | — | — | 1.56 | 0.065 | 0.292 | 0.644 | clusters 6,6,6, bulk of smallest κ (§13.8) | — |
| 0.82 | 1.00 | 25 | 0.3008 | — | — | 1.22 | 0.057 | 0.266 | 0.677 | clusters 8,8,8, bulk of smallest κ (§13.8) | — |

- Sequences on t = 0.80 for n = 2, 3, …: 0.1595, 0.1925, 0.2105, 0.2246, 0.2386, 0.2483, 0.2532, 0.2575, 0.2588, 0.2630, 0.2666, 0.2756 at 0.85σ*² and
  0.1367†, 0.1679, 0.1847, 0.1987, 0.2114, 0.2211, 0.2257, 0.2301, 0.2315, 0.2361, 0.2397, 0.2482 at σ*². On t = 0.82: 0.2134, 0.2493, 0.2685, 0.2835, 0.2975, 0.3075, 0.3075, 0.3172, 0.3314 and
  0.1835†, 0.2179, 0.2367, 0.2525, 0.2646, 0.2752, 0.2752, 0.2855, 0.3005.
- Accuracy: spread between independent samples of one cubic 0.03–0.27 % (n = 4), 0.10–0.26 % (n = 5), 0.1–0.4 %
  (n = 6 to 10). Fitting bias in the full searches with 2^20 points: 1.4 %, 1.8 %, 3.8 %, 5.2 % for n = 5, 6, 7, 8
  (3.3 % and 7 % for n = 5, 6 with 2^18). The first report of the n = 5, 6 values quoted the fit (0.231, 0.253,
  0.204); the values are 0.2246, 0.2386, 0.1987.
- **Structure.** Relative to the content direction X: q = a·H(X) + X·Q(y) + R₃(y); the parts X²·conj(ℓ),
  (|X|² − 1)·L, conj(X)·F carry at most 0.002 of the energy. Q is normal to within 0.03; for n ≥ 5 its eigenvalues
  come in clusters of equal values; in suitable coordinates R₃ consists of monomials y_a y_b ȳ_c with three
  different variables, all of which carry eigenvalues (n = 7: clusters 0.27e^{−0.23πi}, 0.27e^{0.23πi}, 0.20, two
  variables each, one variable of each cluster in every monomial). n = 3 in closed form (t = 0.80, 0.85σ*²):
  0.49·H(X) + 0.57e^{0.26πi}·X(|y₁|² − 1) + 0.40e^{−0.20πi}·X(|y₂|² − 1) + 0.52·y₂²ȳ₁/√2 (ratio 0.1905).
- **Reduced families.** Bipartite (clusters A, B; R₃ = Σ_{c∈A}(ȳ_c·P_c(y_B) + y_c·N_c(y_B))): equal to the full maxima
  for n = 3, 4, 5 and 0.3 % below for n = 6; three clusters with R₃ on monomials across clusters: equal for n = 7;
  all monomials with three different variables: equal for n = 7, below for n ≤ 6. Each gives lower bounds further
  out (table). `content5/ref/bipartite.py` is a self-contained version for the hand-out.
- **(I), (II) at the content direction** on the three-variable cubics (`b2_ref3.py`; t = 0.80, σ*², per δ): rank-two
  driver cubic: truth 0.0177, (I) 0.0493, (II) 0.0319; three-variable maximiser: 0.0198, 0.0473, 0.0306; allowance
  0.0425. On t = 0.82 (I) exceeds the allowance at σ*² on the cofactor cubic only, and (II) is below it on all seven
  test cubics (smallest factor 1.27).

### 13.6 What the maximisers use (P for the identities, N for the numbers)

- Given y, q = √u·[X·(a·h₂(|X|²) + z) + r] with (z, r) = (Q(y), R₃(y)). The law of V and the content along X depend
  on y only through (z, |r|²): the ratio is a functional of a and of the joint law of (Q(y), |R₃(y)|²).
- Cov(Q, |R₃|²) = Σ_j m_j·K_jj with K_jj = Σ_μ |B_μ|²·deg_j(μ) ≥ 0 and Σ_j K_jj = 3‖R₃‖² (P: (|y_j|² − 1) is diagonal on
  Wick monomials of one bidegree, with eigenvalue the degree in y_j, ȳ_j). Measured: 0.285, 0.331, 0.332, 0.330 for
  n = 3, …, 6, real and positive in the phase of the junta; correlation coefficient 0.45–0.54. Check at n = 3 from the
  coefficients: 0.2835e^{−0.02πi}.
- Surgery (`b2_surgery.py`; t = 0.80, 0.85σ*²; every variant renormalised; δ by quadrature here, values good to 1 %):

| n | maximiser | R₃ on an independent copy of y | R₃ → independent Gaussian | without R₃ | without junta | no junta, R₃ independent | X·Q alone |
|---|---|---|---|---|---|---|---|
| 3 | 0.193 | 0.160 | 0.154 | 0.172 | 0.133 | 0.089 | 0.121 |
| 4 | 0.210 | 0.153 | 0.153 | 0.176 | 0.148 | 0.066 | 0.116 |
| 5 | 0.223 | 0.154 | 0.160 | 0.185 | 0.158 | 0.066 | 0.117 |
| 6 | 0.238 | 0.139 | 0.154 | 0.181 | 0.173 | 0.049 | 0.108 |
| 7 | 0.247 | 0.129 | 0.150 | 0.180 | 0.182 | 0.041 | 0.101 |

  An independent bulk lowers the ratio; the dependent one raises it. The classes of the theorems have a bulk on fresh
  variables (independent of every cofactor) and no junta.

### 13.7 Families with many variables whose ratio is a two-dimensional integral

J shared variables with one eigenvalue m, S = Σ|y_j|² ~ Gamma(J), W a standard complex Gaussian:
q = √u·[X·(a·h₂(|X|²) + m(S − J)) + σ(S)·W].
(a) Limit model (P: a limit of cubics): bulk b·ȳ_j·Γ_j with Γ_j the Gaussian limit of a diffuse holomorphic
quadratic in fresh variables; σ² = b²S. (b) Genuine cubics in 1 + J + J(J+1)/2 variables: bulk g·P_cd(y)·conj(L_cd),
c ≤ d, with fresh variables L_cd; σ² = g²S²/2 exactly. Content along X only (P). Code `b2_limit.py` (tables of the
Gaussian smoothing; checked against the driver-class code, 0.1596/0.1594 and 0.1777/0.1775, and against a direct
simulation, 0.2110/0.2101), `b2_limgam.py`, `b2_limgam2.py`. Largest ratio over the parameters, t = 0.80:

| J | 1 | 2 | 3 | 4 | 5 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 30 | 40 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| (a), 0.85σ*² | 0.2101 | 0.2359 | 0.2429 | 0.2439 | 0.2421 | 0.2398 | 0.2332 | 0.2281 | — | 0.2171 | — | 0.2040 | — | — |
| (a), σ*² | 0.1867 | 0.2116 | 0.2187 | 0.2200 | 0.2187 | 0.2169 | 0.2113 | — | — | — | — | — | — | — |
| (b), 0.85σ*² | — | 0.2041 | 0.2223 | 0.2330 | — | 0.2440 | 0.2481 | 0.2492 | 0.2492 | — | 0.2458 | 0.2425 | 0.2318 | 0.2238 |
| (b), σ*² | — | — | — | 0.2066 | — | 0.2176 | 0.2221 | 0.2237 | 0.2241 | — | 0.2218 | 0.2191 | 0.2102 | — |

- (a) peaks at J = 4, (b) near J = 10 to 12 (66 to 91 variables); both then fall. All maximisers are possible
  responses. With unequal parameters at J = 2, with two clusters, or with an added independent bulk nothing is gained.
  Without the junta (a = 0), (a) gives at most 0.203.
- (a) is reached slowly by genuine cubics: Γ replaced by a quadratic in K = 2, 4, 8 fresh variables at the J = 1
  maximiser gives 0.152, 0.178, 0.190 against 0.210.
- For a = 0 both are centred conditionally Gaussian mixtures (P): given y, q ~ N_ℂ(0, uS′) with S′ = |Z|² + σ², and
  c_X = √u·E[Z·Φ_u(S′)], Φ_u(s) = E[(vh)′(u s τ)], δ = 2u²·Var S′. They differ from the classes of the theorems only in
  the term σ²(y), a bulk variance that depends on the cofactor variables: E[Z·σ²] = J·m·b² in (a), m·g²·J(J+1) in (b).
- The finite maximisers of §13.5 are above both families: their R₃ has three eigenvalue-carrying variables per
  monomial (covariance with the cofactor 3 × mean eigenvalue × bulk energy, against 2 in (b) and 1 in (a)).

### 13.8 The three-cluster family: an exact reduction to the law of one scalar (P), and what decides its supremum (N)

Written on 17 November, 00:10 to 01:30 (Bucharest), after the searches with clusters 4,4,4.

**Reduction (P).** Three clusters of c cofactor variables (n = 3c + 1), S_k = Σ_{j∈k}|y_j|². Assume (H1) the eigenvalue
is constant on each cluster, and (H2) R₃ is supported on the 3c³ monomials y_a y_b ȳ_c with a, b, c in three different
clusters. By (H2) R₃ is homogeneous of degree one in each cluster: R₃(y) = (S₁S₂S₃)^{1/2}·R₃(ω), with ω uniform on the
product of the three unit spheres and independent of (S₁, S₂, S₃). So q has the law of

    q = √u·[X·A + σ·√G·e^{iψ}],   A = a·h₂(|X|²) + Σ_k m_k(S_k − c),   σ² = s_R·S₁S₂S₃/c³,   a² + cΣ_k|m_k|² + s_R = 1,

with |X|² ~ Exp(1), S_k ~ Gamma(c), ψ uniform, G = c³|R₃(ω)|²/‖R₃‖² (E G = 1), all independent. Then
V = u(|X|²|A|² + σ²G + 2|X||A|σ√G cos φ), c_X = √u·E[(|X|²A + (A/|A|)|X|σ√G cos φ)·h(V)], the content is along X,
δ = u²(E[|X|⁴|A|⁴ + 4|X|²|A|²σ² + κσ⁴] − 2) with κ = E G² = (c/(c+1))³·E|R₃|⁴/(E|R₃|²)²: the ratio is an integral over
five moduli and one angle and depends on R₃ **only through the law of G**. κ = 2 for a bulk that is Gaussian given
the cluster sums, κ = 1 for a fixed modulus.

*Why the content is along X (P).* Average ȳ_j·q·h(V) over the phase of X first: with a = √u·X·A and r = √u·R₃,
E_φ[(a e^{iφ} + r)·h(|a e^{iφ} + r|²)] = r·Ψ(|a|, |r|) with Ψ real (rotate φ; reflect φ). So
c_j = E[ȳ_j·R₃·Ψ̃(|X|, S, |R₃|)]. For y_j in cluster k take another cluster k′ and the map y^{(k′)} → −y^{(k′)}: it
preserves the law, S and |R₃|, fixes ȳ_j, and changes the sign of R₃ (every monomial is of degree one in every
cluster). The integrand is odd under it, so c_j = 0. The same averaging gives the formula for c_X.

**The searches found this structure (N; `b2_condlaw.py`).** At the search maximisers for c = 2, 3, 4 (0.85σ*²):
eigenvalues constant on clusters to 1–8 %; E[|R₃|² | all moduli] = s_R·S₁S₂S₃/c³ to 1 % (relative squared error
0.002, 0.012, 0.010); Cov(Z, |R₃|²) = s_R·Σ_k m_k to 1 %; κ = 1.3342, 1.5914, 1.6186. The three types of monomial
(which cluster carries the conjugate) are anti-correlated in energy: E[|t_k|²|t_l|²] is 0.49 to 0.85 of the product
of the conditional means, which brings κ below the value of one type.

**Models against the searches (N).** A Gaussian bulk (G exponential; `b2_limprod.py`) and a Gamma law for G with
the measured κ (`b2_limshape.py`), each maximised over (a, m_k, s_R), t = 0.80:

| c | search 0.85σ*² | Gaussian bulk | Gamma, measured κ | search σ*² | Gaussian bulk | Gamma, measured κ |
|---|---|---|---|---|---|---|
| 2 | 0.2483 | 0.2231 | 0.2489 | 0.2209 | 0.1966 | 0.2232 |
| 3 | 0.2575 | 0.2371 | 0.2586 | 0.2310 | 0.2103 | 0.2307 |
| 4 | 0.2715 | 0.2445 | 0.2738 | 0.2402 | 0.2178 | 0.2405 |

The Gaussian bulk is 8 to 11 % low (it peaks at c = 8: 0.2505, 0.2513, 0.2479 at 0.85σ*² and 0.2244, 0.2259, 0.2238
at σ*² for c = 6, 8, 12); the Gamma law with the measured κ agrees to 0.1–1 %.

**The bulk of smallest κ (N; `b2_kappa.py`: exact fourth moments by the class Quartic, L-BFGS from 2 to 9 random
starts; the smallest value found, an upper bound of the infimum).**

| c | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
|---|---|---|---|---|---|---|---|---|---|---|
| smallest κ found | 1.0000 | 1.3333 | 1.5800 | 1.6000 | 1.7057 | 1.7481 | 1.7930 | 1.7997 | 1.8329 | 1.8476 |
| (2 − κ)·c | 1.00 | 1.33 | 1.26 | 1.60 | 1.47 | 1.51 | 1.45 | 1.60 | 1.50 | 1.52 |
| one type alone, 2(1 + 3/c)/(1 + 1/c)³ | 1.0000 | 1.4815 | 1.6875 | 1.7920 | 1.8519 | 1.8892 | 1.9141 | 1.9314 | 1.9440 | 1.9534 |
| κ at the search maximiser (0.85σ*²) | — | 1.3342 | 1.5914 | 1.6186 | — | — | — | — | — | — |

One type alone has κ ≥ 2(1 + 3/c)/(1 + 1/c)³ with equality for tensors whose three flattenings have flat singular
values (P: E|T(ω)|⁴ = 2(‖T‖⁴ + Σ_k Tr G_k²)/(c(c+1))³ with G_k the Gram matrices of the flattenings). For c = 2 the
value 4/3 is attained by R₃ = z₂(x̄₁y₁ + x̄₂y₂) + z̄₁(x₁y₂ − x₂y₁) (P, by |⟨x, y⟩|² + |x∧y|² = |x|²|y|²: on the unit
spheres |R₃|² = (1 − t)p + t(1 − p) + 2√(t(1 − t)p(1 − p))·cos ψ with p, t uniform on [0, 1], so E|R₃|² = 1/2 and
E|R₃|⁴ = 1/3). That 4/3 is the minimum, and every value for c ≥ 3 (8/5 to ten digits at c = 4), is the optimiser's
finding, not proved. The search maximisers have κ within 0.1 %, 0.7 %, 1.2 % of these values.

**A lower bound (P): κ ≥ 2c²/(c + 1)² for every cubic of the family** (0.89, 1.28, 1.58, 1.70, 1.77 at c = 2, 4, 8, 12,
16). Proof. Write R₃ = t₁ + t₂ + t₃ by type. The types have different characters under the phases of the clusters, so
E|R₃|⁴ = Σ_k E|t_k|⁴ + 4Σ_{k<l} E|t_k|²|t_l|² (Gaussian expectations). (i) E|t_k|²|t_l|² ≥ E|t_k|²·E|t_l|²: with the
fourth moments of the spheres the left side is (c(c+1))⁻³ times a sum of eight contractions of the two tensors
(each mode "straight" or "swapped"); ‖T_k‖²‖T_l‖² and three others are non-negative (traces of products of
positive semi-definite Gram matrices, or sums of squares), and each of the remaining four is bounded in modulus by
one of those three (Cauchy–Schwarz: Σ_{kn} E_{kn} conj(E_{nk}) ≥ −‖E‖²). It is also Theorem 1.1 of Malicet, Nourdin,
Peccati, Poly, J. Funct. Anal. 270 (2016), arXiv:1503.02154, with d = 2, applied to real and imaginary parts
(checked by the coordinator). (ii) E|t_k|⁴ = 2(‖T_k‖⁴ + Σ_j Tr G_j²) ≥ 2(1 + 3/c)(E|t_k|²)². With w_k the weights of
the types, E|R₃|⁴ ≥ (2 + (6/c)Σ_k w_k²)(E|R₃|²)² ≥ (2 + 2/c)(E|R₃|²)², and κ = (c/(c+1))³·E|R₃|⁴/(E|R₃|²)². ∎
Numerically (c = 2, 3; 12 starts) the minimum of the ratio in (i) is 1.000000 and that in (ii) is 2(1 + 3/c) to six
digits: each inequality is attained, not both at once. So κ → 2 in this family, at a rate between 1.26/c and 4/c.

**The formula at the proved bound (N; G of Gamma shape; `b2_limshape.py`, tag "low").** t = 0.80, c = 2, 3, 4, 5, 6, 7, 8, 10, 12, 16, 24, 40:
0.285, 0.333, 0.341, 0.345, 0.345, 0.345, 0.343, 0.338, 0.334, 0.323, 0.304, 0.275 at 0.85σ*² and 0.258, 0.305, 0.313, 0.317, 0.318, 0.318, 0.317, 0.313, 0.309, 0.300, 0.282, 0.257 at σ*²
(κ = 1 where the bound is below 1). The largest are 0.345 and 0.318: below the allowances 0.487 and 0.360 by 1.41
and 1.13. Two-point laws of G with the same two moments (`b2_twoG.py`): G ∈ {0, κ} gives 0.3238 (c = 6) and 0.3219
(c = 12) at σ*², G = 1 ± √(κ − 1) gives 0.3180 and 0.3150 (Gamma: 0.3181, 0.3092). The supremum over all laws of G
with these two moments (three atoms suffice, by the convexity of §13.4) was started (`b2_atomG.py`) and stopped
for the low rows; it is not computed.

**Cubics with that bulk (N; `b2_kfam.py`, checked by `b2_kfam_check.py`).** R₃ = √s_R × the minimiser; only
(a, m₁, m₂, m₃, s_R) optimised (8 real parameters, nothing fitted to a sample); the law of G from 2^20 samples
(24-node Gauss rule of the empirical measure); product quadrature in the moduli. In brackets: the same cubic
evaluated directly in 3c + 1 variables on two independent samples of 2^21 points.

| t | u/σ*² | c = 2 (n = 7) | c = 3 (n = 10) | c = 4 (n = 13) | c = 5 (n = 16) | c = 6 (n = 19) | c = 7 (n = 22) | c = 8 (n = 25) | c = 9 (n = 28) | c = 10 (n = 31) | allowance | allowance / largest |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.85 | 0.2483 | 0.2588 | 0.2743 (0.2756) | 0.2736 (0.2739) | 0.2758 (0.2748) | 0.2743 | 0.2766 (0.2761) | 0.2734 | 0.2724 (0.2731) | 0.487 | 1.76 |
| 0.80 | 1.00 | 0.2211 | 0.2315 | 0.2470 (0.2482) | 0.2467 (0.2470) | 0.2493 (0.2482) | 0.2481 | 0.2508 (0.2505) | 0.2481 | 0.2474 (0.2479) | 0.36 | 1.44 |
| 0.82 | 0.85 | 0.3075 | 0.3172 | 0.3314 | 0.3295 | 0.3305 | — | 0.3290 | — | — | 0.913 | 2.75 |
| 0.82 | 1.00 | 0.2752 | 0.2855 | 0.3005 | 0.2993 | 0.3010 | — | 0.3008 | — | — | 0.657 | 2.18 |
| 0.84 | 0.85 | 0.4014 | 0.4074 | 0.4177 | 0.4130 | 0.4113 | — | 0.4053 | — | — | 2.19 | 5.24 |
| 0.84 | 1.00 | 0.3614 | 0.3692 | 0.3814 | 0.3780 | 0.3775 | — | 0.3735 | — | — | 1.44 | 3.78 |
| 0.845 | 0.85 | 0.4347 | 0.4390 | 0.4474 | 0.4416 | 0.4388 | — | 0.4310 | — | — | 2.73 | 6.10 |
| 0.845 | 1.00 | 0.3921 | 0.3986 | 0.4093 | 0.4049 | 0.4035 | — | 0.3979 | — | — | 2 | 4.89 |
| 0.85 | 0.85 | 0.4743 | 0.4763 | 0.4823 | 0.4752 | 0.4710 | — | 0.4611 | — | — | 3.91 | 8.11 |
| 0.85 | 1.00 | 0.4287 | 0.4333 | 0.4421 | 0.4365 | 0.4338 | — | 0.4264 | — | — | 2.7 | 6.11 |
| 0.855 | 0.85 | 0.5227 | 0.5215 | 0.5243 | 0.5155 | 0.5097 | — | 0.4972 | — | — | 6.29 | 12.00 |
| 0.855 | 1.00 | 0.4735 | 0.4755 | 0.4815 | 0.4744 | 0.4703 | — | 0.4604 | — | — | 4.1 | 8.51 |

Every cubic checked directly is a possible response (R1). The searches with 205 coefficients were low by 1.5 % and
3 % at c = 4 (0.2715 and 0.2402).

**Sensitivity to κ (N).** With G ~ Gamma(k)/k, k = 1/(κ − 1), and κ = 1.6: 0.3019, 0.3330 at c = 6, 8 (t = 0.80,
0.85σ*²; 0.2752 at c = 6 at σ*²), against 0.2758, 0.2766 with the smallest κ found; κ = 1.6 at c = 12 would give
0.4956, above the allowance, but it is excluded by the bound (1.704). (2 − κ)·c has stayed between 1.26 and 1.60 for
the c computed. Open: the value of κ_min(c) between the proved bound and the values found, and the laws of G beyond
their second moment.

Hand-out scripts: `content5/ref/kappa.py` (explicit cubic, minimisation of κ, the formula, the direct check),
`content5/ref/clusters.py` (the search), `content5/ref/bulk/` (the minimisers).

### 13.9 The pieces below 0.80 (17 November, 01:25 to 02:30; N)

Scope change of 17 November (coordinator, from the degree-5 worker): the certificate needs the content inequality on
the pieces t ∈ [0.70, 0.80) too. Profiles in kit format with exact derivatives, t_lo, the cap and the allowance lists:
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-newcap-2026-11-16/profiles_low/` (covering rows
copied to `content5/kit/profiles_low/`). Code: `content5/code/b2_lowr.py` (validated on the kit row 0.80: 0.1595,
0.2743 / 0.2756 as stored), table `b2_lowtab.py`. Each search is run free and then with (R1) at the file's t_lo
(penalty, then checked on independent samples). u* below is σ*² of the row in the file.

**Covering rows at the binding energy of each piece** (cluster cubics: formula, direct check in brackets; † the
two-variable maximum is not a possible response; ‡ limits of cubics):

| piece t | covering row t′ | u* of that row | t_lo | u_cap/u* | binding u/u* | θ_room there | θ_room at u/u* nearby | largest ratio found (possible responses) | θ_room / largest | smallest factor over the energies run (at u/u*) |
|---|---|---|---|---|---|---|---|---|---|---|
| 0.78 | 0.82 | 0.06825 | 0.7749 | 1.724 | 1.448 | 0.5232 | 1.400: 0.545, 1.500: 0.523 | 0.2417 (clusters 8,8,8) | 2.17 | 2.17 (1.448) |
| 0.76 | 0.81 | 0.07812 | 0.7549 | 1.776 | 1.456 | 0.4000 | 1.400: 0.414, 1.496: 0.412 | 0.2167 (clusters 8,8,8) | 1.85 | 1.85 (1.456) |
| 0.74 | 0.80 | 0.08787 | 0.7349 | 1.818 | 1.455 | 0.3141 | 1.400: 0.325, 1.500: 0.323 | 0.1962 (clusters 8,8,8) | 1.60 | 1.60 (1.455) |
| 0.72 | 0.79 | 0.09752 | 0.7149 | 1.854 | 1.492 | 0.2587 | 1.409: 0.263, 1.529: 0.267 | 0.1749 (clusters 8,8,8) | 1.48 | 1.44 (1.400) |
| 0.70 | 0.79 | 0.09752 | 0.6949 | 2.070 | 1.612 | 0.2190 | 1.537: 0.225, 1.656: 0.222 | 0.1650 (clusters 8,8,8) | 1.33 | 1.30 (1.449) |

| piece t (row t′) | u/u* | θ_room | n = 2, all cubics† | (1,2), n = 4 | (2,2), n = 5 | (2,3), n = 6 | 2,2,2, n = 7 | c = 4, n = 13 | c = 6 | c = 8, n = 25 | c = 10 | driver J = 1 + bulks‡ | driver J = 2 + bulks‡ | Gamma G at the proved κ, c = 4, 6, 8 (model) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.78 (0.82) | 1.448 | 0.5232 | 0.1295 | 0.1762 | 0.1895 | 0.2018 | 0.2118 | 0.2376 (0.2387) | 0.2400 | 0.2417 | 0.2384 | 0.1791 | — | 0.3037, 0.3081, 0.3073 |
| 0.76 (0.81) | 1.456 | 0.4000 | 0.1101 | 0.1535 | 0.1659 | 0.1775 | 0.1871 | 0.2118 (0.2128) | 0.2146 | 0.2167 | 0.2141 | 0.1579 | — | 0.2765, 0.2816, 0.2810 |
| 0.74 (0.80) | 1.455 | 0.3141 | 0.0956 | 0.1361 | 0.1475 | 0.1585 | 0.1678 | 0.1910 (0.1919) | 0.1938 | 0.1962 | 0.1939 | 0.1414 | 0.1626 | 0.2548, 0.2594, 0.2589 |
| 0.72 (0.79) | 1.492 | 0.2587 | 0.0819 | 0.1100 | 0.1295 | 0.1397 | 0.1479 | 0.1699 (0.1706) | 0.1725 | 0.1749 | 0.1730 | 0.1251 | — | 0.2318, 0.2360, 0.2353 |
| 0.70 (0.79) | 1.612 | 0.2190 | 0.0760 | 0.1117 | 0.1215 | 0.1313 | 0.1394 | 0.1601 (0.1609) | 0.1626 | 0.1650 | 0.1632 | 0.1178 | 0.1359 | 0.2210, 0.2248, 0.2242 |

**Own rows** (the row tuned at t itself):

| piece t | own row: u* | binding u/u* | θ_room there | largest ratio found (possible responses) | θ_room / largest | smallest n found above the allowance |
|---|---|---|---|---|---|---|
| 0.78 | 0.10704 | 0.900 | 0.3499 | 0.2282 (clusters 8,8,8) | 1.53 | none |
| 0.76 | 0.12574 | 0.891 | 0.2326 | 0.1981 (clusters 8,8,8) | 1.17 | none |
| 0.74 | 0.14398 | 0.894 | 0.1605 | 0.1711 (clusters 8,8,8) | 0.94 | n = 13: clusters 4,4,4, 0.1659 |
| 0.72 | 0.16174 | 0.894 | 0.1144 | 0.1484 (clusters 8,8,8) | 0.77 | n = 13: clusters 4,4,4, 0.1437 |
| 0.70 | 0.17904 | 0.878 | 0.0845 | 0.1306 (clusters 8,8,8) | 0.65 | n = 4: bipartite (1,2), 0.0868 |

**Findings.** (1) On the own rows the inequality with the allowance is false: possible-response cubics exceed it
(table) for t ≤ 0.74, from four variables on at t = 0.70. (2) On the covering rows it holds for everything found: the
smallest value of allowance/(largest ratio) over the energies run is 1.30 at t = 0.70 (at 1.449 u*: allowance 0.2323,
ratio 0.1787) and 1.60 at t = 0.74; by energy (u/u*: factor): t = 0.70: 1.035: 1.43, 1.242: 1.31, 1.449: 1.30, 1.500: 1.31, 1.537: 1.31, 1.612: 1.33, 1.656: 1.37; t = 0.72: 1.298: 1.47, 1.400: 1.44, 1.492: 1.48; t = 0.74: 1.400: 1.62, 1.455: 1.60, 1.500: 1.68. (3) At these energies (1.4 to 1.65 σ*² of the covering row) the
largest ratios in two and three variables are not possible responses and no possible response was found near them;
from n = 4 on the maximisers are possible responses without penalty. (4) The proved bound on κ does not close the
three-cluster family at t = 0.70: the Gamma formula at the bound exceeds the allowance by up to 2.6 % at 1.612 u* and
3.4 % at 1.449 u* (it is below it for c = 3 and c = 16). The κ at which
it reaches the allowance, per c, at the energy of the smallest allowance (1.612 u*):

| c | 3 | 4 | 5 | 6 | 8 | 10 | 12 | 16 |
|---|---|---|---|---|---|---|---|---|
| κ*(c): the formula equals θ_room = 0.2190 | bound suffices | 1.285 | 1.402 | 1.483 | 1.591 | 1.658 | 1.705 | bound suffices |
| proved lower bound | 1.125 | 1.280 | 1.389 | 1.469 | 1.580 | 1.653 | 1.704 | 1.772 |
| formula at the proved bound | 0.2136 | 0.2210 | 0.2239 | 0.2248 | 0.2242 | 0.2219 | 0.2194 | 0.2133 |
| smallest κ found (2 − 1.6/c beyond c = 10) | 1.580 | 1.600 | 1.706 | 1.748 | 1.800 | 1.848 | 1.875 | 1.906 |
| formula at that κ | 0.1475 | 0.1605 | 0.1604 | 0.1628 | 0.1654 | 0.1635 | 0.1620 | 0.1590 |

at the energy of the smallest factor (1.449 u*):

| c | 3 | 4 | 5 | 6 | 8 | 10 | 12 | 16 |
|---|---|---|---|---|---|---|---|---|
| κ*(c): the formula equals θ_room = 0.2323 | bound suffices | 1.290 | 1.407 | 1.488 | 1.596 | 1.662 | 1.708 | bound suffices |
| proved lower bound | 1.125 | 1.280 | 1.389 | 1.469 | 1.580 | 1.653 | 1.704 | 1.772 |
| formula at the proved bound | 0.2281 | 0.2360 | 0.2392 | 0.2402 | 0.2397 | 0.2372 | 0.2347 | 0.2281 |
| smallest κ found (2 − 1.6/c beyond c = 10) | 1.580 | 1.600 | 1.706 | 1.748 | 1.800 | 1.848 | 1.875 | 1.906 |
| formula at that κ | 0.1602 | 0.1739 | 0.1739 | 0.1764 | 0.1790 | 0.1770 | 0.1753 | 0.1720 |

and at t = 0.74 (1.455 u*):

| c | 4 | 6 | 8 | 12 |
|---|---|---|---|---|
| κ*(c): the formula equals θ_room = 0.3141 | bound suffices | bound suffices | bound suffices | bound suffices |
| proved lower bound | 1.280 | 1.469 | 1.580 | 1.704 |
| formula at the proved bound | 0.2548 | 0.2594 | 0.2589 | 0.2535 |
| smallest κ found (2 − 1.6/c beyond c = 10) | 1.600 | 1.748 | 1.800 | 1.875 |
| formula at that κ | 0.1911 | 0.1937 | 0.1964 | 0.1921 |

The class "driver with J ≤ 2 cofactor variables + Gaussian bulks" (limits of cubics; it contains a spike with a
bulk) gives 0.1178 (J = 1) and 0.1359 (J = 2) at t = 0.70 and 0.1414, 0.1626 at t = 0.74 among possible responses:
below the cluster cubics.

The text for outside sessions with these rows is `content5/PROBLEM_V3.md`.

### 13.10 What was not done

- No upper bound: nothing here bounds the supremum over the number of variables. The searches for n ≥ 8 are local,
  few, and mostly in families chosen by hand.
- The richer limit object (a finite core plus terms F_k(y)·W_k with Gaussian W_k) was sampled through (a) and (b)
  only; no hybrid of a finite core with Gaussian terms was optimised.
- Rows 0.84 to 0.855 were searched to n = 4 only (the three-cluster family of §13.8 was evaluated there); t = 0.82
  to n = 10.
- κ was minimised from 2 to 9 random starts only, for c ≤ 10; the proved lower bound 2c²/(c + 1)² is far from the
  values found; other bulk structures (four clusters, unequal clusters, bipartite) were not analysed through their
  conditional laws; the three-atom supremum over the law of G was not computed.
- On the pieces below 0.80: one energy per piece for t = 0.76, 0.78, three for t = 0.72, 0.74, seven for t = 0.70 (the
  scan with the largest cubic only); sector A only; no search over all cubics beyond two variables on those rows.
- (I) and (II) were not computed on maximisers with four or more variables.
- The tables of §8.4, §11.4, §12.1, §12.2 were **not** recomputed with a direct Γ′ and a finer grid of χ (the review
  found the spline derivative of Γ wrong by up to 3.7·10⁻² at small radii, θ_room 0.6 to 8 % too low, and the grid
  χ ∈ {2, 8, 16, 30, 42} missing the binding values 14 and 36). The published allowances are on the safe side.
- Nothing was committed, pushed or posted.
