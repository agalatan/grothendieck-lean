<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/literature/HIGHER_DEGREE.md, 15 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Higher-degree complex games: a scoping study

Literature worker for claude-b9ee, 15–16 November 2026.

**Status labels.**
- **READ**: read in the primary text this session (PDF converted to text).
- **ABS**: abstract only.
- **MEM**: from memory.
- **N (here)**: my floating-point computation; scripts in `checks/higher-degree/`, run with `/usr/local/bin/python3 -I`.
- **P (here)**: a short derivation of mine.
- **Repo**: a statement already in the repository, cited with its file.

**Notation.** Charge-one projections P_k = P_{k+1,k}. A game is λ = (1, λ₁, λ₂, …), with norm
N(λ) = sup_n ‖Σλ_k P_k‖_{∞→1}. A game of degree 2K+1 is one with λ_k = 0 for k > K.

## 0. Summary

1. **The degree ceilings are already known in the repository, and my independent search reproduces them.** The best
   game of each degree, as model values (Repo, `research/conjecture-K/sources/manuscript/legacy/ch4-ceilings.tex`, N):

   | degree | best lower bound | proved ceiling |
   |---|---|---|
   | 3 | 1.402258 | |
   | 5 | 1.40364–1.40365 | 1.4036705 (chirp responses) |
   | 7 | 1.404111 | 1.4044895 (chirp responses) |
   | 9 | about 1.4044, not converged | |

   - My graded-space best-response code reproduces degree 3 to 8 digits (1.40225812 at ε = 0.7564).
   - It reproduces degree 5 to about 10⁻⁵: model norm 0.7124376 at (λ₁, λ₂) = (−0.849, 0.2816), so 1/N = 1.40363.
   - The degree-5 optimum sits where the plain-phase response and the "driver" response tie.
2. **HJM-PD (arXiv:2610.10477) certifies the real degree-21 game with a reduction that does not transfer as is.** The
   pieces are: cyclic noise-stability bounds for the high degrees, a one-variable 44-moment reduction with PSD
   lifts, then min-cut certificates over ±1 signs (§1).
   - In the complex case the last step becomes a maximisation over unimodular phases, a complex-Grothendieck-type
     problem with no min-cut certificate.
   - Their certificate loses 2·10⁻³ in norm, 0.35%.
   - A complex degree-5 certificate must lose under 3.3·10⁻⁴ to reach 1.403, and under 9.9·10⁻⁴ just to beat the
     current Lean bound.
3. **HJM's complex paper (arXiv:2609.25462) contains no idea that would lower our upper bound** (§2).
   - Their lower bound is our row with a cruder substitute for Conjecture K.
   - Their upper bound mixes Haagerup-type kernels. It gains 5.4·10⁻⁶ in slope over Haagerup's γ_H; our rounding is
     already 1.585·10⁻⁴ above γ_H.
   - Our remaining distance to Haagerup's conjecture 1/γ† is in the slope (1.04·10⁻⁵), not in the residual.
4. **Recommendation** (§4). Weeks: the cubic-witness K route, or its identity-tail variant, which stays inside the
   existing row architecture. Months: degree-5 or degree-7 games, the only route to the third decimal, but with no
   working certificate architecture today. Start them as a calibrated prototype.

---------------------------------------------------------------------------------------------------------------------

## 1. Heilman–Jones–Malavolta, "Primal/dual method for the Grothendieck constant", arXiv:2610.10477v1 (7 Oct 2026). READ

### 1.1 Duality (their §2.1, Thm 2.2, Cor 2.3, Prop 2.4)

**Objects.**
- A Hermite projection game is Q = Σ q_mΠ_m with q₁ = 1, |q_m| ≤ 1, and q_m = 0 for even m.
- Its value is v_n(q) = OPT(Q) = sup over f, g: ℝⁿ → {±1} of ⟨f, Qg⟩, and v∞ = sup_n v_n.
- A Krivine scheme μ is a distribution on pairs of odd Boolean functions. Its kernel is H_μ(t) = Σ c_m(μ)tᵐ with
  c_m = E⟨Π_m f, Π_m g⟩.

**Theorem 2.2.**

    1/K_G = sup_{c ∈ C} (c₁ − Σ_{odd m≥3}|c_m|) = inf_{q ∈ Q} v∞(q),   and the infimum is attained.

The proof is Sion's minimax theorem: C is convex, Q is weak-* compact, the pairing is bilinear. Lemma 2.1 gives the
tensor-power step: OPT ≥ (c₁ − Σ|c_m|)·SDP.

**Corollary 2.3.** Games attain the lower bound (Raghavendra–Steurer 2009); Krivine schemes attain the upper bound
(Naor–Regev 2014).

**Prop 2.4 (complementary slackness).** A near-optimal μ concentrates on near-optimisers of Q.

**The complex version** is in the repository (Repo, `ch17-crossbound.tex` §complex-duality-proof, status P):

    1/K_G^ℂ = sup_{c∈C}(c₀ − Σ_{k≥1}|c_k|) = min_λ N(λ).

**Truncation (P here).** The same Sion argument on the compact convex set Q_{≤K} = {λ₀ = 1, |λ_k| ≤ 1, λ_k = 0 for
k > K} gives

    min_{λ ∈ Q≤K} N(λ) = sup_{c∈C} (c₀ − Σ_{1≤k≤K}|c_k|) =: 1/K_{2K+1}.

So the best lower bound from games of degree ≤ 2K+1 is the reciprocal of the best rounding that has to cancel only
the coefficients 1..K, with the tail free. K_{2K+1} increases in K and tends to K_G^ℂ.

### 1.2 Asymptotic Boolean functions (their §3)

- **Graded Gaussian space.** There are variables of every grade d; a grade-d variable stands for a normalised diffuse
  sum of He_d. Π_d is the projection onto graded degree d.
- **Thm 3.2 (Herry–Malicet–Poly 2024; Jones 2026).** The laws in H_d are closed, and graded polynomials are
  approximable by finitary ones.
- **Lemma 3.4.** For a finitely supported q, v∞(q) is attained by asymptotic Boolean functions. The optimisers can be
  taken as f = sign(p) with p ∈ H_{≤D}, because the best response is f = sign(Qg).

This is exactly the "dimension-limit model" of our ch4: a grade-1 complex variable W for the diffuse cubic, a grade-2
variable V for the diffuse quintic, and so on.

### 1.3 The heuristic primal/dual run (their §2.2, App. A)

- Alternation:
  - fix a pool R of response pairs and solve an LP for the game, min_q max_R Σ q_m c_m (their (2.5));
  - then search for new ∞-to-1 optimisers of q.
- Run statistics: degree D = 15, initialised at Q = Π₁; 92 iterations; |R| = 274 pairs; a side pool of 13,069
  asymptotic Boolean functions; 190 minutes with an AI system.
- Final game: (1, −0.879, 0.521, −0.311, 0.136, −0.049, −0.104, 0.126).
  - Primal value 0.5620595 against the pool, so K ≈ 1.779171.
  - Dual: a mixture of 8 rounding pairs, c₁ − Σ|c_m| ≈ 0.5618556, so K ≈ 1.7798167.
  - The gap is 6·10⁻⁴ in K.

### 1.4 The certified lower bound: game, rows, and the 44-dimensional reduction (their §4.1, App. B)

**The game** is a *different, simpler* one than the heuristic optimum, of degree 21 (table (4.1)):

    q = (1, −0.6545, −0.1599, 0.0478, 0.0865, 0.0764, 0.0723, −0.0044, −0.0581, −0.0414, 0.0167)

Theorem 4.1: v∞(q) ≤ 1000/1773.

**Proposition B.1 (the one-variable criterion).**
1. Take best-response symmetrised odd f, g, with h = (f + g)/2 and k = (f − g)/2. Rotate so that Π₁h = √(2/π)·x·z₁,
   with x ∈ [0, 1].
2. **Cyclic noise-stability bound.** For N ∈ {7, 9}, put σ_r = f(cos(rπ/N)U + sin(rπ/N)V). Then σ_{r+N} = −σ_r, and
   the correlation identity gives

       Σ_j w_j^(N) Σ_m cos^m(πj/N)·‖Π_m f‖² ≤ B_N := max over σ ∈ {±1}^N of (1/N)Σ_rΣ_j w_j σ_r σ_{r+j}.

   Average this over f and g, using (‖Π_m f‖² + ‖Π_m g‖²)/2 = ‖Π_m h‖² + ‖Π_m k‖². Then Γ_m = Σ_{N,j} w_j cos^m(πj/N)
   absorbs most of the high-degree game coefficients. The conditions are Γ_m ≥ 0 for m > 21 and 1 − Γ₁ > 0; the
   infinite part is checked exactly by (B.22).
3. **Remainder.** ⟨f, Qg⟩ ≤ B + (1 − Γ₁)(2/π)x² + Σ_m [α_m‖Π_m h‖² + β_m‖Π_m k‖²], with α_m = q_m − Γ_m and
   β_m = −q_m − Γ_m.
4. **One-variable reduction.**
   - Split the coordinates into S (the z₁ direction) and Y.
   - For each Y, the slices u = f(·, Y), v = g(·, Y) have moment vector
     M(Y) = (E_S[ψ_j(S)u], E_S[ψ_j(S)v]) for j = 0…21, a vector in ℝ⁴⁴.
   - Expand in Hermite functions of Y; index η has total degree 2j + p + |η|.
   - PSD dominations D_{p,r}(α) ⪯ H_p + εI and D_{p,r}(β) ⪯ K_p + εI for 1 ≤ r ≤ 21, and a Schur condition at
     r = 0, give ⟨f, Qg⟩ ≤ E_Y F(M(Y)) + Φ(x). Here F(M) = Mᵀ R M + ℓᵀM with R ⪰ 0, and Φ is convex in x.
   - It therefore suffices that F(M) ≤ C on feasible moments and C + max_{∂I}Φ ≤ v*, row by row, on a cover of
     x ∈ [0, 1].

**Our analogue.** Their "rows" are our t-rows (x is our t up to √(2/π)). The Γ-bound plus the PSD lift plays the part
of our remote-law analysis and node caps: it controls the remote, high-degree energy *without any law-of-chaos input*.

### 1.5 Finite certification and its size (their App. B.2)

- F is convex, so the maximum over feasible M reduces to sign patterns.
- Discretise S ∈ [−9, 9]: 36 intervals, each split into panels with quadratic interpolation. The error is bounded by
  ∫|p − I₂p| ≤ (1/96)∫|p'''|; Gaussian tails by Cauchy–Schwarz.
- Round to integers: scale by 2⁴⁴, with rounding errors charged explicitly.
- Certify max over σ ∈ {±1}^{N_sign} of an integer quadratic P(σ) ≤ U by min-cut/max-flow graph bounds, sign fixing
  (a coordinatewise-median argument), and branch and bound with two linear forms and nonnegative quadratic
  corrections.
- **Size.**
  - 35 rows, all passing; the largest payoff bound is 0.564015352833 < v* = 1000/1773 − 10⁻⁹.
  - 384-bit outward-rounded interval arithmetic, LDLᵀ pivots, and an exact rational tail check.
  - The abstract speaks of "thousands of numerical inequalities". Verifier: `python verify.py --lower --workers 4`
    (github.com/christophsjones/RealGrothendieck).
- **Certification loss.** 1/1.773 − 0.5620595 ≈ 1.96·10⁻³ in norm, 0.35%. This is partly because they certified a
  simpler game than their best one.

**Upper bound (Thm 4.2), for completeness.** A mixture of 32 rounding pairs (31 polynomial preprocessings and one
special function F*), with tails bounded above degree 681. Result: c₁ − Σ|c_m| > 0.5618315, so K_G < 1.779893.

### 1.6 What transfers to the complex case (P here, assessment)

- **Duality and truncation transfer** (1.1).
- **The cyclic bound transfers.** For charge-one unimodular f and real correlation ρ = cos θ,
  E[f(X)·conj(f(Y))] = Σ_k ρ^(2k+1)‖P_k f‖². Hence

      Σ_j w_j Σ_k cos^(2k+1)(πj/N)·‖P_k f‖² ≤ B_N^ℂ := max over unimodular anti-periodic (σ_r) of (1/N)Σ_rΣ_j w_j Re(σ_r·conj(σ_{r+j})).

  This is a maximisation on a torus of dimension ≤ 8, certifiable by interval branch and bound. A complex
  correlation e^(iφ)cos θ only multiplies the identity by e^(iφ), so it adds nothing. Value: these bounds couple the
  degrees (boundedness acts on the whole noise-stability profile), which is exactly what our ch4 and WHY_THE_GAP say
  a degree-5 certificate needs.
- **The one-variable reduction transfers formally,** with a complex S and bookkeeping by bidegree and charge in
  Y. The moment vector grows to about 2 × 21 complex moments (84 real) at degree 5 and 2 × 36 (144 real) at degree 7,
  against 44 in their real degree-21 case. The PSD lift in Y is unchanged in principle.
  - Their reduction keeps both slices u, v jointly. So the h/k shared-phase obstruction of WHY_THE_GAP, which defeats
    the gated rows that treat the two sides separately, does not by itself defeat it.
- **The final sign maximisation does not transfer.** After discretising S ∈ ℂ (a 2D grid), the maximisation of a convex
  quadratic over feasible moments is a maximisation over **unimodular phases** at the grid points. This is a complex
  quadratic program on a high-dimensional torus, the complex Grothendieck problem again. The min-cut/sign-fixing
  certificate has no analogue, and an SDP relaxation has an integrality gap of the size we are trying to measure. A
  new idea is needed, for example exploiting the charge structure, or branch and bound in a low-dimensional radial ×
  angular-Fourier parametrisation of the slices.
- **The precision gap is the real issue.** Their real certificate loses 0.35% of the norm. Our degree-3 rows lose about
  1.3·10⁻⁴ (cap 0.7134193 against model 0.713288 at ε = 0.745), that is 0.018%. A complex degree-5 certificate needs
  a loss below 3.3·10⁻⁴ (0.046%) to reach 1.403.

---------------------------------------------------------------------------------------------------------------------

## 2. Heilman–Jones–Malavolta, "Sharper bounds for the complex Grothendieck constant", arXiv:2609.25462v1. READ (full text)

### 2.1 Lower bound (§7–8): our row, with a crude substitute for Conjecture K

- The witness is T = P₁,₀ − (37/50)P₂,₁. (7.1): the vector solution g = z/‖z‖ gives vector value → 1.
- **(7.2), the row identity.** Re⟨f, Tg⟩ = t² − ε‖Qh‖² + ε‖Qk‖² − ‖Pk‖². This is our exact row.
- **(8.5).** Completing the square, −ε‖Qh‖² ≤ 2Re E[βz(U−2)h] + 2β²/ε, gives the multiplier L = z(ℓ + β(U − 2)).
  These are our dropped square and our L.
- **(8.1)–(8.4), sector energies.** k is decomposed over the visible functions 1, A = U−1, B = z²/√2, z,
  H = z(U−2)/√2, z̄. These are our sectors: remote, A-shell, B-shell, the odd z·Q, d·H and z̄·P.
  - The energies are charged to PSD "profile" matrices E (3×3) and R (2×2), which play the part of our sector costs.
  - Only a fraction δ < ε of the remote cubic energy is kept: q := δQ_w c₁, with ‖q‖ ≤ δρ.
- **(8.7)–(8.8), the scalar potential.**
  Ψ(ω) = 2β²/ε + sup over f₀, g₀: ℂ → S(ℂ) of [E(k₀) + 2Re E[L̄h₀] + 2Re E[ω̄k₀]].
  - Ψ depends only on |ω|; it is convex and 2-Lipschitz.
  - Re⟨f, Tg⟩ ≤ t² − 2ℓt + E_w Ψ(|q|) − σ²/δ.
  - **This is their substitute for Conjecture K.** It uses only moments of q (E U² = m ∈ [2, 62];
    E U³ ≤ 9m − 12 + 50(m−2)^(3/2)) and polynomial majorants a₀ + a₁s + a₂s² + a₄s⁴ + a₆s⁶ of Ψ, on a rectangle
    cover in (σ, x).
  - The node values of Ψ come from a 12-dimensional quadratic with D_j ≻ 0 checks.
  - 9 certified rows (ℓᵢ, Cᵢ).
- **Result.** Cap 2857/4000 = 0.71425 against our 0.7134193.
- **Moment inputs** are all weaker than ours: 62 against our sharp 44 for E U²; 50 against C₆ = 40.45 for the sixth
  moment; E|q| ≤ 49/50 against 0.95133.
- No Stein cuts, law bank or mixtures.

### 2.2 Upper bound (§2–6): the two-stage mixed rounding

- **Haagerup's phase identity.** E[ph(X)·conj(ph(Y))] = h(z) = z(π/4)₂F₁(1/2, 1/2; 2; |z|²).
- **Allowable preprocessors** ρ = Σc_k t^(2k+1) with Wiener norm ≤ 1, realised by tensor feature maps (Lemma 3.5).
  The kernel is K_ρ = h∘ρ^phys.
- **Lemma 3.6 (repairing a nonlinear kernel).** If q = at + r with ‖r‖_A ≤ δ < a, inverse preprocessing η = q⁻¹(Γt),
  Γ ≤ a − δ, yields a linear kernel Γz.
- **The scheme (5.2)–(5.9).**
  - Five preprocessings ρ₁…ρ₅, perturbations of Haagerup's ρ* = h⁻¹(γ_H t); ρ₅ has terms up to degree 75.
  - A sixth non-phase kernel K_org = (K_{F,G} + K_{F#,G#})/2, with F = ph(z)f(|z|²) and G = ph(z)g(|z|²). Here
    f = u·ph(s + δA), with u = P/|P| for a degree-9 complex polynomial P, and the cancellation f(0)g(0) = i is exact.
  - Weights w = (0.98354, 0.012417, 0.003031, 0.000594, 0.0000169, 0.000398).
  - K_G^ℂ ≤ Σw/(q̂₀ − Σ_{k≥1}|q̂_k|), with 120 coefficients exact and an analytic tail.

### 2.3 Could it lower our upper bound 1.404599395362? (N here, from `docs/UPPER_STATUS.md` and `docs/overview.tex`)

- **Our rounding.** A single smoothed two-coordinate phase rounding, F₀ = ph(z + √(1+a²)·v(|z|²)·w) times a cubic
  Taylor phase factor, with preprocessors of degree 41 and 15.
  - Slope c = 0.7119483103461 and residual δ = 1.5422·10⁻⁶ give 1/(c − δ) = 1.404599395361.
  - With zero residual it would give 1/c = 1.404596353. The repository's own October analysis says removing the
    whole residual buys 1.82·10⁻⁶.
- **Haagerup's conjecture** is γ† = 0.711958659778 (1/γ† = 1.404575934664). So γ† − c = 1.035·10⁻⁵: **the remaining
  distance is in the slope.**
- **HJM's mixture** reaches effective slope 0.711795166, a gain of 5.36·10⁻⁶ over γ_H = 0.711789807. Our rounding is
  already 1.585·10⁻⁴ above γ_H.
- So **HJM's construction cannot lower our bound.** Their *mixing principle* (several preprocessings plus one non-phase
  kernel, combined in an LP so that residual coefficients cancel) is the generic dual move, since Krivine mixtures
  attain 1/K by duality. Applied to our rounding it could at best move the slope by an amount of the order they
  gained (about 5·10⁻⁶), that is about 10⁻⁵ in K.
- The repository already tried mixtures and tail-priced separation banks for the upper side
  (`research/higher-degree/sources/quintic-projection-2026-10-23/QUINTIC_REASSESSMENT_2026-10-23.md` §4–6). The best diagnostic, 0.71160976,
  stayed below the incumbent net score 0.71194718.
- The whole room to 1/γ† is 2.35·10⁻⁵ if Haagerup's conjecture holds. The upper side is not where the third decimal
  will move, unless K_G^ℂ is far below 1/γ†, which only a complex primal/dual search can indicate.

---------------------------------------------------------------------------------------------------------------------

## 3. Complex higher-degree games T = Σ_k λ_k P_{k+1,k}

### 3.1 What duality says at degree 3, 5, 7, 9

By the truncated duality of 1.1, the best degree-(2K+1) lower bound K_{2K+1} is 1/sup_c(c₀ − Σ_{1≤k≤K}|c_k|).

| degree | best game (model, Repo ch4 N) | model norm | lower bound 1/N | proved ceiling |
|---|---|---|---|---|
| 3 | ε = 0.7564 | 0.7131355 | **1.402258** | 1.4022581233 (Repo `docs/overview.tex`, P,C) |
| 5 | (1, −0.848926, +0.281576) | 0.7124293–0.7124328 | **1.40364–1.40365** | 1.4036705 (chirp, P,C); 1.4041091 (closed form πa/4) |
| 5 + identity tail | (1, −0.864, 0.338; ν ≈ −0.015) | 0.712375–0.712404 | ≈ 1.40370 | — (Repo tailgames README) |
| 7 | (1, −0.906596, 0.541570, −0.242531) | 0.7121946 | **1.404111** | 1.4044895 (chirp, P,C) |
| 9 | not converged | 0.71204–0.71205 | ≈ 1.40441–1.40444 | — |

- Reaching Haagerup's 1/γ† = 1.4045759 needs games of degree ≥ 9 (Repo `docs/overview.tex`, "Why the gap is hard").
- The degree-7 and degree-9 values may be optimistic: their second variation shows instability in richer
  adversary classes (ch4 §wval).
- "K₅" (Gaussian-grade domination at degree 5) fails numerically at its flank rows by +1.55·10⁻⁵ (Repo MONOGRAPH
  ch4 item 12.3). That is small against a 10⁻⁴ budget, but it is not exact.

### 3.2 Cheap heuristic evaluations

- **(a) The Haagerup-kernel composition (P, Repo ch4).**
  - h(t) = (π/4)(t + t³/8 + 3t⁵/64 + 25t⁷/1024 + …). Take ρ(t) = at − (a³/8)t³ with a + a³/8 = 1, so a = 0.906795303.
    Then the cubic and quintic coefficients of h∘ρ vanish.
  - This gives N ≥ πa/4 = 0.7121954 for every degree-≤5 game, a ceiling of 1.4041091. With a⁷/1024 added to the
    budget, degree 7 gets 1.4046904.
  - A one-line upper estimate, not a value.
- **(b) The graded-space best response, rank-7 at degree 5.** These are the model values above; my independent code
  is in 3.3.
- **(c) The row structure.** For the cubic game, K with the Gaussian benchmark S reproduces the model norm exactly. A
  degree-5 row ("multi-grade fibre") is the repository's open problem 2 in `docs/overview.tex`.

### 3.3 Independent numerical primal search (N here; `checks/higher-degree/`)

- **Model.** Charge-one responses f = ph(X + c₆V) with X = Σ c_e e on the orthonormal basis
  - e₀ = z (degree 1);
  - e₁ = z(|z|² − 2)/√2 and e₂ = W (degree 3);
  - e₃ = z(|z|⁴ − 6|z|² + 6)/(2√3), e₄ = W(|z|² − 1), e₅ = z²W̄/√2, and V (degree 5).
  Here z, W and V are independent standard complex Gaussians of grades 0, 1 and 2.
- **Method.** V is averaged in closed form: E ph(a + cV) = ph(a)M(|a|/|c|) with
  M(ρ) = (√π/2)ρe^(−ρ²/2)(I₀ + I₁)(ρ²/2), and ⟨f, V⟩ = (ph c/2)·E N(|X|/|c|) with N(ρ) = √π e^(−ρ²/2)I₀(ρ²/2), by
  Gaussian integration by parts. Both formulas were verified. z is fixed real by the charge-one symmetry. Gauss–Legendre
  panels in |z| and |W|, a trapezoid rule in arg W. Alternating best response f = ph(Tg), g = ph(Tf).
- **Degree 3.** W is averaged in closed form, leaving a 1D radial quadrature.
  - ε = 0.7564: v = 0.713135467, 1/v = **1.40225812**. Repo: 0.7131355 and 1.4022581233.
  - ε = 0.745: v = 0.713291. Repo: "genuine response > 0.71329".
- **Degree 5, at the repository's frozen game (0.853, 0.2911).**
  - v = 0.7124882 on the 96 × 72 × 32 grid and 0.7124814 on the 144 × 108 × 48 grid, so 1/v ≈ 1.40354.
  - Repo: 0.7124497, from a frozen rational pair (Sobol estimate); my responses are slightly better.
  - The optimiser never uses V, as the repository also found ("W₅, W₇ are never used").
- **Degree 5, 3×3 scan.** ε ∈ {0.835, 0.849, 0.863}, γ ∈ {0.268, 0.2816, 0.295}.
  - The minimum is at (0.849, 0.2816): v = 0.7124376, so **1/v = 1.40363**.
  - That is within 8·10⁻⁶ of the repository's corrected 0.7124293.
  - At ε = 0.835 the plain-phase response dominates; its value π/4 − επ/32 + γ·3π/256 is matched to 5·10⁻⁶.
  - **The optimum sits at the crossing of the plain-phase and driver branches**, so a certificate must handle at
    least two active response families.
- I did not run degree 7. The graded-(4,3) sector adds a grade-3 variable and about eight more basis functions:
  z(|W|² − 1), z̄W², V(|z|² − 1), z²V̄, and the radial variants. The repository's 1.404111 stands.

---------------------------------------------------------------------------------------------------------------------

## 4. Recommendation: which route gives the larger certifiable improvement in the next few weeks?

| | **A. Conjecture K at the cubic witness** | **B. Degree-5/7 games, following HJM-PD** |
|---|---|---|
| room above the current 1.4017003 | target 1.402 (+3.0·10⁻⁴); hard ceiling 1.402258 (+5.6·10⁻⁴); identity tail lifts the ceiling to 1.40248 | degree 5: up to about 1.40365 (+1.9·10⁻³); degree 7: up to 1.40411 (+2.4·10⁻³) |
| precision needed | certificate within 1.3·10⁻⁴ of model norm 0.7131355 (ε ≈ 0.756) | within 3.3·10⁻⁴ of 0.71243 to reach 1.403; within 9.9·10⁻⁴ just to beat 1.4017 |
| state | row machinery, node caps and law bank all exist in Lean; many sector pieces proved (STATUS §1) | no working certificate: gated rows and support functions both lose about 2·10⁻² at degree 5 (Repo WHY_THE_GAP, ch5) |
| what is missing | (★)/(P_Ψ), the compact (P) box; then the other response regions at ε = 1891/2500 (8.7), and the consumer and Lean statement | a multi-grade-fibre certificate. The HJM-PD transplant still needs (i) complex cyclic bounds B_N^ℂ, (ii) a one-complex-variable moment reduction (84 real moments at degree 5), (iii) a certificate for the phase maximisation (no min-cut analogue) |
| main risks | open analytic pieces with 10⁻⁵–10⁻⁴ budgets; the (★) central region; a long consumer and Lean tail; capped forever at 1.40226 (1.40248 with the tail) | the complex phase-maximisation step; the certificate precision (HJM-PD's real loss is about 6× too large); two active response branches at the optimum; K₅ is only approximate (+1.55·10⁻⁵) |
| infrastructure | existing CI and caps pipeline; interval certificates for (★) and (P) (idea 1 of `IDEAS.md`) | a complex primal/dual engine (pieces exist: `eng9.py`, `pd_engine.py`, the tailgames code, `checks/higher-degree/`); new row and node-cap code for degree-5 sectors; an interval branch-and-bound for B_N^ℂ and for phase maxima |

**Recommendation.**
1. **For a certifiable gain within weeks, route A is the only realistic one.** Its value is small and capped. The
   identity-tail variant (Repo STATUS §10; memory "node-cap upgrade to 1.402") stays inside the existing row
   architecture: the potential |A| + |B| becomes a 3×3 correlation SDP Ψ_ν. It raises the ceiling from 1.40226 to
   1.40248 at little extra cost, so it should be part of route A.
2. **Route B is the only route to the third decimal, but in weeks it can deliver a calibrated prototype, not a bound.**
   The cheapest decisive experiment is to build the complex HJM-PD-style certificate first **on the cubic game**, where
   the model norm is known exactly (0.7131355), and measure its loss.
   - If the loss is ≤ 1.3·10⁻⁴, it matches the existing rows, and the same code applied to the degree-5 game
     (1, −0.849, 0.2816) would give about 1/(0.71243 + loss), roughly 1.4034.
   - If the loss is ≥ 10⁻³, route B needs a different architecture, and the effort should stay on A.
3. **Do the complex primal/dual search** (overview open problem 3; my code shows the graded model is cheap at
   degree ≤ 5). It decides whether K_G^ℂ is near 1/γ† (then the upper side is finished, and all remaining value is on
   the lower side) or well below it (then mixtures on the upper side matter).
