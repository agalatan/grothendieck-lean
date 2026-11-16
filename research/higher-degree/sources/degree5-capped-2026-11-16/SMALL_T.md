<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/SMALL_T.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Degree-5 game: a direct bound for small t (no K₅)

Research worker for claude-b9ee (issue #453), 16 November 2026. Game T = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ with
ε₁ = 39/50, η = 779/10000; target V := Re⟨f, Tg⟩ ≤ 500/701 = 0.71326676.
Labels: **P** proof on paper (here, author only); **C** exact or interval-certified computation (replayable, §7);
**N** floating point. Code and data: `smallt/` beside this file (§8).

## 0. Answer

**Theorem (P + C).** For every n and every pair of unimodular f, g on (ℂⁿ, Gaussian), with h = (f+g)/2,
k = (f−g)/2 and t = ‖P₁,₀h‖,

> **V ≤ (2/5)·t² + 7058083/10⁷,**

so **V < 500/701 for every t ≤ t₀ = 0.1365** (at t₀ the gap is 5.6·10⁻⁶; the exact crossing is 0.136551). No K₅,
no sector layer, no gate, no independence assumption.

- **Inputs.** The Lean moment inputs for circular cubics (E|q|⁴ ≤ 44‖q‖⁴, the sixth-moment bound with
  C₆ = 4045313/100000), the radius bound E|q| ≤ (95133/100000)‖q‖ (ledger 3.7) and the **scalar Stein family** of the
  same radius proof (`real-stein-radius.tex`, eq. (real-stein-square), P). Nothing else.
- **What changes for stage 2.** The rows t = 0, 0.05, 0.1 of `CERT_STAGE2.md` §3 (active on [0, 0.1141]) are no
  longer needed, and the row t = 0.125 only on [t₀, 0.1399]. **K₅ is still needed on [t₀, 0.886]**, i.e. at 29 of the
  32 rows, among them the nine law-aware rows t = 0.125, 0.15, …, 0.6 for which `CAPPED_GATE.md` §5(c) has no tools.
- **Idea 1 of the brief, quantified.** With moments + radius only, the coupling ‖Qk‖² ↔ ‖Rh‖² gives
  V ≤ (1−η)t² + 0.709587 (N, LP), i.e. room 3.7·10⁻³ at t = 0 (the brief needed 6·10⁻⁵) but only t ≤ 0.063. The law
  that saturates it has an **atom at |q| = 0 of mass 4.7 %**, a near-constant modulus elsewhere and a speck at
  |q|² ≈ 44. The scalar Stein family excludes that law (squared Stein discrepancy 0.95 against the allowed
  s/12 = 0.17); with it, at η' ≤ 0.4 the extremal laws have no mass below |q| ≈ 0.87‖q‖, and the same argument
  reaches t₀ = 0.1365.
- **Why it stops near 0.14 (N).** Every law-only bound must drop the pointwise relation Re(h k̄) = 0, i.e. the
  relative phase of the visible coordinate and the cubic (the parallelogram step |a+b| + |a−b| ≤ 2√(|a|²+|b|²)). Even
  with a remote (independent) cubic, the resulting row is 0.7155 at t = 0.2; with the worst coupling it is 0.7170.
  Beyond t ≈ 0.15 a direct argument needs phase or joint information between z₁ and the cubic, which is what the
  sector layer (K₅) provides.
- **Side findings.** (i) Stage 2's small-t law layer (moments + radius) is saturated by the same phantom laws. With
  the scalar Stein family added, the float law layer of the stage-2 rows t = 0.1 and 0.2 drops by 7.4·10⁻³ and
  1.5·10⁻² (N), i.e. their rooms would grow from 2.2·10⁻³ and 3.0·10⁻³ to about 9.6·10⁻³ and 1.8·10⁻² (§6). That
  matters for a small-t K₅: `CAPPED_GATE.md` §5(c) found the odd allowance alone at 103 % and 162 % of the old rooms;
  it would be about a quarter of the new ones. (ii) Stage 2
  uses ρ = 9513293/10⁷, but the largest of the thirteen Arb row bounds of the radius certificate is
  0.95132934139494945… (`RESULTS.json` in `gpt-reviews/real-stein-radius-20261021/…zip`), which is above
  9513293/10⁷. The proved statement is ρ ≤ 95133/100000 (or 9513294/10⁷). The difference (4·10⁻⁸) changes stage 2's
  numbers by about 10⁻⁷, but as written its law input is not covered. This note uses 95133/100000.

---------------------------------------------------------------------------------------------------------------------

## 1. The reduction (P)

Write P = P₁,₀, Q = P₂,₁, R = P₃,₂. For unimodular f, g, h = (f+g)/2, k = (f−g)/2 satisfy |h|² + |k|² = 1 pointwise,
and since T is self-adjoint (R1 of the design note)

    V = t² − ε₁‖Qh‖² + η‖Rh‖² − ‖Pk‖² + ε₁‖Qk‖² − η‖Rk‖²,   t = ‖Ph‖.

**Step 1.** Drop −‖Pk‖² and −η‖Rk‖². Ph, Qh, Rh are orthogonal pieces of h, so ‖Rh‖² ≤ ‖h‖² − t² − ‖Qh‖²:

    V ≤ (1−η)t² + η‖h‖² + ε₁‖Qk‖² − (ε₁+η)‖Qh‖² ≤ (1−η)t² + η‖h‖² + ε₁‖Qk‖².

**Step 2.** ‖h‖² ≥ ‖Ph‖² = t². For any η' ≥ η add (η' − η)(‖h‖² − t²) ≥ 0, and use ‖h‖² = 1 − ‖k‖²:

    V ≤ (1−η')t² + η' + ε₁‖Qk‖² − η'‖k‖².

**Step 3.** With G = ε₁Qk ∈ H₂,₁, ε₁‖Qk‖² = 2Re⟨G, k⟩ − ‖G‖²/ε₁ exactly. Since |k| ≤ 1,
2Re⟨G,k⟩ − η'E|k|² ≤ E sup_{0≤r≤1}(2|G|r − η'r²), and η' + sup_{0≤r≤1}(2br − η'r²) = 2b + (η' − b)₊²/η'. Hence

    V ≤ (1−η')t² + E[2|G| + (η' − |G|)₊²/η'] − ‖G‖²/ε₁.

**Step 4.** Write G = σq with ‖q‖₂ = 1 and R = |q|. Then

    V ≤ (1−η')t² + N(η'),   N(η') := sup_{σ≥0} [F(σ) − σ²/ε₁],   F(σ) := sup_q E g_σ(R),
    g_σ(r) = 2σr + (η' − σr)₊²/η',

the supremum over all q ∈ H₂,₁(ℂⁿ), all n, with ‖q‖₂ = 1.

- Nothing here uses charge one, the frame rotation, the sector decomposition or independence of anything.
- F is convex in σ (each g_σ(r) is convex in σ). This is used to pass from σ-nodes to all σ (§2).
- With η' = η (Step 2 void) this is the brief's idea 1: the k-side "mass" ‖k‖² that buys ‖Qk‖² is paid at the price
  η of the quintic room. Larger η' trades the t² coefficient against N.

## 2. The law problem and its certificate (C)

**Law inputs** for R = |q|, q ∈ H₂,₁(ℂⁿ), ‖q‖₂ = 1 (s := E R⁴ − 2):
- (L1) E R² = 1; (L2) 0 ≤ s ≤ 42; (L3) E R⁶ ≤ 6 + 9s + C₆s^{3/2}, C₆ = 4045313/100000 (Lean, ledger 3.4);
- (L4) E R ≤ ρ = 95133/100000 (ledger 3.7);
- (L5) **scalar Stein family**: for every even, continuous, piecewise-linear w that is constant beyond its last knot and
  every μ > 0, E Ψ_{w,μ}(R) ≤ μs/24, where Ψ_{w,μ}(r) = (2π)⁻¹∫ h_{w,μ}(r cos θ)dθ,
  h_{w,μ}(x) = xV_w(x) − w(x)/2 − w(x)²/(2μ), V_w(x) = ∫₀ˣ w. This is (real-stein-square) of the radius proof:
  X = Re q and Γ = ‖∇X‖²/3 satisfy E X V_w(X) = E Γ w(X), E Γ = 1/2 and Var Γ ≤ (2/9)κ₄(X) = s/12; complete the
  square in w (P, manuscript; the same status as ρ).

**Certificate at a node σ for an s-interval [s_a, s_b].** Rationals λ₀, λ₁, λ₂ (any sign), λ₃ ≥ 0, λ_ρ ≥ 0, μ > 0
and a w with knots 0, 0.05, …, 1.6, 1.8, 2, 2.3, 2.6, 3, 3.5, 4, 5, 6, 8, 10 such that

    Q(r) := λ₀ + λ₁r² + λ₂r⁴ + λ₃r⁶ + λ_ρ r + Ψ_{w,μ}(r) − g_σ(r) ≥ 0   for all r ≥ 0.

Taking expectations and (L1)–(L5): E g_σ(R) ≤ B(s) := λ₀ + λ₁ + λ₂(2+s) + λ₃(6+9s+C₆s^{3/2}) + λ_ρρ + μs/24,
which is convex in s, so F(σ) ≤ max(B(s_a), B(s_b)) for every law with s ∈ [s_a, s_b].
Away from σ ≈ 0.74 (σ ≤ 0.53 or σ ≥ 0.96) the Stein term is not needed (w = 0).

**Verification of Q ≥ 0 on [0, ∞)** (`smallt/cert.py`, `verify`), per certificate:
- Ψ_{w,μ} in closed form: on each knot interval h is a cubic, and the angular integrals are the primitives of
  uᵏ/√(1−u²), k ≤ 3 (arcsin and √ terms).
- [0, 30] is covered by cells. On a cell [a, b]: Q ≥ P(a) − L_P(b−a) + Ψ(a) − L_Ψ(b−a) − g(b), with g increasing,
  L_P an exact bound of |P′| and L_Ψ = (2/3.14159)·max_{x≤b}|h′(x)| with the maximum computed exactly (h′ is
  piecewise quadratic; |Ψ′(r)| ≤ (2/π)·max|h′| because ∫₀¹ u/√(1−u²)du = 1). Cells are bisected until the bound is
  positive.
- P(a), Ψ(a), g(b) are evaluated in vectorised interval arithmetic with outward rounding (`nextafter` after every
  operation; √ is IEEE-exact; arcsin is widened by 8 ulp, i.e. it assumes the libm/SIMD arcsin is accurate to 4 ulp).
- r ≥ 30: Ψ(r) ≥ w_K r²/2 + (2/π)(V_K − w_Kx_K)r − w_K/2 − w_K²/(2μ) − D·x_K/r, with D an exact bound of
  |h − h_quad| on [0, x_K] and P(|cos θ| < x_K/r) ≤ x_K/r. Then r·Q(r) is bounded below by an explicit rational
  degree-7 polynomial, checked positive on [30, ∞) exactly (coefficients in r − 30, else a Sturm count).
- B(s_a), B(s_b) are exact rationals (√s bounded by integer square roots).

**From nodes to all σ.** F is convex, so on [σ_i, σ_{i+1}] it lies below the chord of the certified F̂(σ_i); the
maximum of chord − σ²/ε₁ is computed exactly. Outside [σ_min, σ_max] = [0.05, 1.45]: F(σ) ≤ 2σρ + η' (since
(η' − σR)₊² ≤ η'²), and 2σρ + η' − σ²/ε₁ is monotone there.

## 3. Numbers

**Choice.** η' = 3/5, used as the double η'_d = 5404319552844595/2⁵³ = 0.59999999999999997780 (all certificates and
the assembly use this exact value; 1 − η'_d exceeds 2/5 by 2.2·10⁻¹⁷, absorbed below). By the dual values of §4,
t₀(η') is about 0.135 at η' = 0.55, 0.138 at 0.60 and 0.136 at 0.62, so 3/5 is close to the best choice.

**Nodes.** No Stein term at σ ∈ {0.05, 0.10, …, 0.50, 0.53} ∪ {0.96, 1.00, 1.05, …, 1.45} (polynomial certificates);
Stein certificates at σ ∈ {0.55, 0.58, 0.61, 0.64, 0.67, 0.70, 0.72, 0.73, 0.74, 0.76, 0.78, 0.81, 0.84, 0.87, 0.90,
0.93}.
s-partition: [0,1], [1,2], [2,3], then steps of ½ to 6, then [6,7], [7,8], [8,10], [10,14], [14,20], [20,42] at the
central nodes 0.70–0.78; [0,1], …, [5,6], [6,8], [8,12], [12,20], [20,42] elsewhere. The solver margin is
3·10⁻⁵ + 1.25·10⁻⁶ r⁴ (it keeps Q away from 0 so that the cell check terminates).

**Result (C).** 38 nodes, **412 certificates** (190 with a Stein term), 1.13·10⁸ verification cells, all passed.

| σ | Stein term | s-intervals | max_s F̂(σ) − σ²/ε₁ | attained on s ∈ | cells checked |
|---|---|---|---|---|---|
| 0.05 | no | 10 | 0.601047 | [20, 42] | 73,760 |
| 0.10 | no | 12 | 0.603921 | [31, 36.5] | 254,984 |
| 0.15 | no | 10 | 0.608704 | [12, 20] | 432,728 |
| 0.20 | no | 10 | 0.615426 | [6, 8] | 522,524 |
| 0.25 | no | 10 | 0.624076 | [3, 4] | 360,942 |
| 0.30 | no | 10 | 0.634650 | [2, 3] | 379,326 |
| 0.35 | no | 10 | 0.647149 | [0, 1] | 206,880 |
| 0.40 | no | 10 | 0.661571 | [0, 1] | 232,598 |
| 0.45 | no | 10 | 0.676973 | [0, 1] | 147,752 |
| 0.50 | no | 10 | 0.688499 | [0, 1] | 160,946 |
| 0.53 | no | 10 | 0.694922 | [0, 1] | 165,328 |
| 0.55 | yes | 10 | 0.688696 | [0, 1] | 4,036,250 |
| 0.58 | yes | 10 | 0.693054 | [1, 2] | 4,521,112 |
| 0.61 | yes | 10 | 0.697321 | [1, 2] | 5,048,258 |
| 0.64 | yes | 10 | 0.700927 | [2, 3] | 5,464,900 |
| 0.67 | yes | 10 | 0.703654 | [2, 3] | 5,819,744 |
| 0.70 | yes | 15 | 0.705211 | [3, 3.5] | 8,585,772 |
| 0.72 | yes | 15 | 0.705761 | [3.5, 4] | 8,609,612 |
| 0.73 | yes | 15 | 0.705789 | [4, 4.5] | 8,545,702 |
| 0.74 | yes | 15 | 0.705682 | [4, 4.5] | 8,397,796 |
| 0.76 | yes | 15 | 0.704856 | [4, 4.5] | 8,268,126 |
| 0.78 | yes | 15 | 0.703232 | [4.5, 5] | 8,368,456 |
| 0.81 | yes | 10 | 0.699215 | [4, 5] | 5,837,246 |
| 0.84 | yes | 10 | 0.692802 | [4, 5] | 6,188,170 |
| 0.87 | yes | 10 | 0.684083 | [4, 5] | 6,471,974 |
| 0.90 | yes | 10 | 0.673055 | [4, 5] | 6,542,306 |
| 0.93 | yes | 10 | 0.659720 | [4, 5] | 6,820,578 |
| 0.96 | no | 10 | 0.674143 | [1, 2] | 208,166 |
| 1.00 – 1.45 (10 nodes) | no | 10 each | 0.649736 → 0.092472 | [1, 2] | 2.3·10⁶ |

(σ = 0.10 needed two levels of s-splitting near s = 31–42. A run at σ = 0.71 was stopped unfinished; the binding cell
is [0.72, 0.73], so it is not needed. The duplicate nodes run on `big` (0.61, 0.81) agree with the laptop runs to
within 5·10⁻⁸.)

**Assembly (`smallt/assemble.py`, exact).**
- σ- and s-coverage checked; F̂ at every node is the maximum of its exact certified bounds.
- The worst cell is the chord on [0.72, 0.73]: max over σ of chord − σ²/ε₁ = **0.70580821…**. This is 2·10⁻⁵ above
  the largest node value; on a cell of width Δσ the excess is at most (Δσ)²/(4ε₁) = 3.2·10⁻⁵.
- Crude ends: 0.691928 on σ ≤ 0.05 and 0.663344 on σ ≥ 1.45.
- So N(η'_d) ≤ 0.70580821…, and with (1 − η'_d) ≤ 2/5 + 2.3·10⁻¹⁷ and t ≤ √π/2 < 1:
  **V ≤ (2/5)t² + 7058083/10⁷**, which is below 500/701 exactly when t² < (500/701 − 0.7058083)/(2/5) =
  0.0186462, i.e. t < 0.136551.

**Where the bound is tight.** The binding laws sit at σ ≈ 0.72–0.73 and s ≈ 3.5–4.5 (E|q|⁴ ≈ 6), the same
region as the radius extremum (the radius certificate's largest row bound is on s ∈ [4, 5]). For the Gaussian law
the same functional is 0.6850 at η' = 3/5 (and 0.6128 at η' = η), so the 2.1·10⁻² between that and N\* is the
price of the provable law inputs, not of the reduction.

## 4. Why the Stein family is needed: the phantom law (N)

**Moments + radius only.** The law problem of §1 with (L1)–(L4) is an LP over the law of R (`smallt/explore/lp0.py`,
`smallt/explore/lp0b.py`; R-grid to 20, σ-grid of step 0.0025, s ∈ {0.25, …, 42}).

| η' | N(η') with (L1)–(L4) | maximiser | t₀ from (1−η')t² + N(η') |
|---|---|---|---|
| η = 0.0779 | **0.709587** | σ = 0.7425, s = 2; R = 0 w.p. 0.047, R ≈ 0.99 w.p. 0.951, R ≈ 6.67 w.p. 0.0016 | **0.0632** |

- The atom at R = 0 is "free" small-ball mass: E R = ρ is still reached by the rest (Cauchy–Schwarz with mass 0.95),
  and the speck at R² ≈ 44.5 supplies E R⁴ = 4. The h-side puts its whole mass there and collects η·0.047 of quintic
  room. Without the speck, m = E R⁴ ≥ 2 would force the atom to cost E R.
- The same law (E√U at the radius cap plus a speck at U ≈ 40) is the worst law of stage 2's small-t law layer
  (`CERT_STAGE2.md` §4).
- For η' > η the atom gets paid η'·0.047 instead of η·0.047, so N(η') grows at once: the t² coefficient cannot be
  traded down. And for t > 0 the free atom also carries free visible projection: placed where |z₁| is largest it gives
  t ≈ 0.095 at no cost. The worst-coupling LP of (|z₁|, |q|) confirms it: every ℓ > 0 or visible-cubic penalty β ≠ 0 is
  worse than ℓ = β = 0 on t ∈ [0.06, 0.1] (`smallt/explore/jointlp.py`, `scan_lb_*.log`).
- **A better radius alone would help:** with E R ≤ ρ′ the same LP gives t₀ = 0.077 (ρ′ = 0.95), 0.142 (0.94),
  0.185 (0.93), 0.219 (0.92), 0.275 (0.90), 0.307 (√π/2).

**The Stein family excludes the phantom law.** At s = 2 its squared Stein discrepancy
sup_w (E[XV_w(X) − w(X)/2])²/E w(X)² is 0.946, against the allowed s/12 = 0.167. Already a ramp
to 1 at |x| ≈ 1.2 sees it: the speck makes E XV_w(X) far larger than E w(X)/2, which no near-Gaussian X allows. With (L5) the
extremal laws change completely (SDP with the hat basis of §2, `smallt/explore/stein_sdp.py`, `smallt/explore/nfun.py`):

| η' | 0.0779 | 0.15–0.40 | 0.50 | 0.55 | 0.60 | 0.65 | 0.70 |
|---|---|---|---|---|---|---|---|
| N(η'), primal SDP (R-grid ≤ 10) | 0.70272 | 0.70272 | 0.70273 | — | 0.70573 | — | 0.72484 |
| N(η'), dual on a grid, s ∈ {4, 4.75, 5.5} | — | — | 0.70500 | 0.70499 | 0.70555 | 0.70849 | 0.71476 |
| P(σR < η') at the primal optimum | 0 | 0 | 0.003 | — | 0.080 | — | 0.40 |

- For η' ≤ 0.4 the extremal law has no mass below R = 0.87; the free atom is gone, so η' can be raised to about
  0.6 before the small-ball term bites. That is what moves t₀ from 0.063 to about 0.14.
- The primal SDP restricts R to a grid up to 10 and underestimates; the dual values (and the certified ones, §3) are
  the relevant numbers. The worst s moves from 3.5 (primal) to 4–5 (dual).
- Sanity check of (L5) as implemented: one-variable H₂,₁, z₁z₂z̄₃, z₁²z̄₂, a three-monomial cubic and a 20-term
  diffuse cubic (Monte Carlo, 2·10⁶ samples) all satisfy it, with squared discrepancy 0.45–0.63 of s/12
  (`smallt/explore/sanity.py`).

## 5. Why the direct bound stops near t = 0.14 (N)

Three relaxations of increasing strength, all with the Stein law (L1)–(L5) for |G|:

| t | decoupled, §1 (best η') | joint law of (\|z₁\|, \|G\|), worst coupling, row with ℓ | same, \|G\| independent of z₁ | stage-2 K₅ row (moments + radius) |
|---|---|---|---|---|
| 0.10 | 0.7096 | **0.7059** (ℓ = 0.05) | — | 0.7106 |
| 0.20 | 0.7216 | 0.7170 (ℓ = 0.10) | 0.7155 (ℓ = 0.10) | 0.7083 |
| 0.30 | 0.7400 | 0.7374 (ℓ = 0.20) | — | 0.7002 |

(`smallt/explore/joint_sdp.py`: joint law on 30 equal-mass X-bins × about 180 R-points, η' = η, coarse (σ, s) search, so
these are indicative; decoupled column from the dual N(η') of §4; last column from `CERT_STAGE2.md` §3.)

- **The binding loss is the phase.** The pointwise maximum over (h, k) of 2Re(āh + b̄k) is |a+b| + |a−b| when
  h ⊥ k (Re hk̄ = 0, which holds for h, k built from unimodular f, g), but 2√(|a|²+|b|²) without it. A law-only bound
  cannot see the relative phase of z₁ and G, and the worst phase (π/2) is the parallelogram. Visible cubics such as
  iz₁(|w₁|² − 1) realise it exactly, but only with E|G| ≈ 0.65‖G‖.
- For a remote cubic the phase is uniform and the visible gain ℓ²|z₁|²/(2|G|) is half the parallelogram's
  ℓ²|z₁|²/|G|. That factor is why the K₅ row stays at 0.708 at t = 0.2 even with the phantom law layer, while every
  law-only row is above 0.715 there.
- **The coupling matters less than the phase.** With the Stein law, worst and independent couplings differ by
  1.5·10⁻³ at t = 0.2, against 3.8·10⁻³ of total overshoot.
- A 2-D (joint) certificate with ℓ > 0 would move t₀ from about 0.137 to about 0.16–0.17 at much higher cost. Beyond
  that a direct argument needs a lower bound on the relative phase, e.g. on
  E[|z₁|² sin²(arg G − arg z₁) φ(|G|)] = ½E[|z₁|²φ(|G|)] − ½Re E[z̄₁² ph(G)² φ(|G|)], i.e. on the H₂,₀-content of
  ph(G)²φ(|G|). That is a content statement of the K₅ kind.

## 6. Where the small-t rows stand

The final certificate is the envelope min(direct bound, stage-2 rows). With t₀ = 0.1365:

| stage-2 row (`CERT_STAGE2.md` §3) | active on | stage-2 room | after this note |
|---|---|---|---|
| t = 0 (Gaussian row) | [0, 0.0388] | 5.75·10⁻³ | not needed: the direct bound is ≤ 0.70641 there |
| t = 0.05 (law row) | [0.0388, 0.0758] | 2.50·10⁻³ | not needed |
| t = 0.1 (law row) | [0.0758, 0.1141] | 2.19·10⁻³ | not needed |
| t = 0.125 (law row) | [0.1141, 0.1399] | 2.19·10⁻³ | needed on [t₀, 0.1399] only |
| t = 0.15, 0.2, …, 0.6 (law rows) | [0.1399, 0.6470] | 2.31·10⁻³ – 2.01·10⁻² | unchanged: K₅ needed, no sector tools yet (`CAPPED_GATE.md` §5(c)) |
| t = 0.70, …, 0.886 (Gaussian rows) | [0.6470, 0.8862] | ≥ 3.82·10⁻⁴ | unchanged: K₅ needed, gate GO |

- So K₅ remains a hypothesis at 29 of the 32 rows. The unconditional part is now [0, t₀]; the "small-t" problem of
  `CAPPED_GATE.md` §6 item 10 shrinks to [t₀, 0.647].
- On [0, 0.0388] the direct bound (at most 0.70641) is already below the K₅-conditional stage-2 row there (up to 0.70752),
  because it uses the Stein family and stage 2's law layer does not. At t = 0 the two are 0.70581 and 0.70602.
- The t = 0.125 row on its remaining interval [0.1365, 0.1399] peaks at 0.71096 (room 2.31·10⁻³), so the smallest
  small-t room is now 2.31·10⁻³ (rows t = 0.125 and 0.15).
- **Suggestion for the remaining small-t rows.** Stage 2's law layer (`cert2/law2.py`) uses moments + radius, so its
  small-t rows were optimised against the phantom law of §4. Adding the scalar Stein family to that LP (as one more
  dual multiplier with a w-family, exactly as in §2) should lower C_r of every law-aware row, i.e. raise the rooms
  that a small-t K₅ argument may spend. `CAPPED_GATE.md` §5(c) found the odd-sector allowance alone at 103 % and
  162 % of the room at t = 0.1 and 0.2; larger rooms change that comparison.
- **How much (N, `smallt/explore/stage2_stein.py`).** For two stage-2 rows, with their own (ℓ, β, b_A, b_B) and node caps
  (`cert2/out/caps_*.json`), the float law layer G⁺ = sup_{σ,ν,law} E f_ν(σR) − κσ² − ν²/η:

  | row | G⁺, moments + radius (stage 2's LP) | G⁺, + Stein family (SDP) | drop | stage-2 room → room with Stein |
  |---|---|---|---|---|
  | t = 0.1 (law row) | 0.718241 (σ = 0.72, ν = 0, m = 4) | 0.710863 (σ = 0.75, ν = 0, s = 5) | 7.4·10⁻³ | 2.19·10⁻³ → ≈ 9.6·10⁻³ |
  | t = 0.2 (law row) | 0.757905 (σ = 0.72, ν = 0, m = 4) | 0.742547 (σ = 0.72, ν = 0, s = 5) | 1.54·10⁻² | 3.00·10⁻³ → ≈ 1.84·10⁻² |

  The Stein search is local (ν within 0.012 of the LP optimum, σ in steps of 0.03, s ∈ {1, …, 8, 10}), so the drops
  are indicative, and re-optimising the rows against the Stein law layer can only add to them. On these numbers the
  odd-sector allowance of `CAPPED_GATE.md` §5(c) (itself computed with the moment LP) would take about a quarter of
  the room at t = 0.1 and 0.2 instead of 103 % and 162 %. The A/B and quintic pure-cost failures listed there remain
  and would need their own allowances.

**What remains for small t, in order.**
1. Re-run stage 2's law layer with the Stein family (one more multiplier and a w-family per (σ, ν, m)-box, as in §2)
   and re-optimise the law-aware rows against it. Expected: rooms of about 10⁻² instead of 2·10⁻³ on [0.1, 0.3].
2. With those rooms, a lossy small-t K₅: the odd-sector allowance of `CAPPED_GATE.md` §5(c) is then about a quarter of
   the room at t = 0.1 and 0.2; the A/B and quintic pure-cost failures there still need allowances computed in the
   same law layer.
3. Or a direct route past t ≈ 0.14: a lower bound on the relative phase of z₁ and the cubic (§5), i.e. a bound on the
   H₂,₀-content of ph(G)²φ(|G|). A 2-D joint certificate (law of (|z₁|, |G|) with Stein) alone reaches only about
   0.16–0.17.
4. An Arb replay of the certificates of this note (§7).

## 7. What is proved, what is computed, what is assumed

- **P (this note, author only):** §1 (Steps 1–4), the reduction of each certificate to (L1)–(L5), convexity of F in σ,
  the crude ends, the angular primitives and the tail inequality of §2.
- **Inputs:** (L1)–(L3) Lean (ledger 3.4); (L4) ledger 3.7; (L5) the (real-stein-square) inequality of the radius
  proof, P in the manuscript, the same status as (L4). Nothing from the sector layer, no K₅, no gates.
- **C:** every certificate is verified from its stored floats (exact binary rationals): Q ≥ 0 on [0, 30] by
  interval cells, the tail exactly, B(s_a), B(s_b) and the chords in exact rational arithmetic; σ-coverage, s-coverage
  and the final N\* by `smallt/assemble.py`. **Replay:** `smallt/reverify.py` re-ran the verification of all 412
  certificates with the final code and recomputed every exact bound: **412 of 412 pass, every bound identical**
  (`replay/replay_*.log`, about 1.2 CPU-hours). (The final code fixes one edge case of
  the first runs: a cell end lying exactly on the double nearest to a knot that rounds up was treated as outside the
  knot. The replay is therefore the record.)
- **The one numerical assumption:** the interval evaluation uses IEEE double precision with outward `nextafter`
  rounding, exact square roots, and numpy's arcsin within 4 ulp (widened by 8). This is a standard libm property,
  not an Arb computation. An Arb replay (the closed form of Ψ is elementary) would remove it.
- **Not checked here:** the floating-point SOCP that chose the certificates (it only selects data); the numbers of
  §4–§5, which are N.

## 8. Files

All under `degree5-cert/smallt/` (copied from the scratch directory; runs on the laptop and on `big`, the folder
there deleted afterwards; about 9 CPU-hours in all, of which 4–5 on `big` with at most 8 processes).
- `cert.py`: certificate solver (cvxpy + Clarabel SOCP with grid refinement), vectorised interval arithmetic,
  closed-form Ψ, the rigorous `verify`, exact `bound_exact`.
- `run_node.py`, `launch.sh`: one σ-node over a partition of s ∈ [0, 42] (splitting intervals above the target).
- `assemble.py`: σ- and s-coverage, chords, crude ends, N\* and t₀ (exact).
- `out/node_*.json` (laptop runs) and `out_big/node_*.json` (runs on `big`): every certificate (λ, w, μ as floats, the
  exact bound, the verification record), the run logs `log_*.txt`, `assembled.json` and `used_files.txt` (the 38 node
  files the assembly uses); `replay/replay_*.log`: the replay of all 412 certificates (§7).
- `table.md`: the node table of §3.
- `explore/` (N, with their logs): `lp0.py`, `lp0b.py`, `farsig.py` (moment + radius LP), `stein_lp.py`,
  `stein_sdp.py`, `stein_scan.py`, `nfun.py`, `dualcert.py`, `sprofile*.py`, `knots_test*.py` (Stein law problem),
  `jointlp.py`, `scan_lb.py`, `indep.py`, `joint_sdp.py` (joint and independent couplings), `sanity.py` (Stein family
  on real cubics), `stage2_stein.py` (§6 side computation).
