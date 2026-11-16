<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/literature/ROUTE_B_EXPERIMENT.md, 15 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Route B experiment: an HJM-PD-style relaxation of complex charge-one games

Literature worker for claude-b9ee, 16 November 2026. Labels:
- **P (here)**: derivation in this file, not reviewed.
- **N**: floating point, scripts in `checks/route-b/` (run with `/usr/local/bin/python3 -I`), numerical code in
  `checks/higher-degree/`.

No certificate is claimed.

**Games.** The cubic game is T = P₀ − εP₁ with P_k = P_{k+1,k} and ε = 1891/2500; its model norm is 0.7131355. The
degree-5 game is (1, −0.849, +0.2816), with model norm 0.7124376 on my grid.

## 0. Verdict: no-go for an HJM-PD transplant

| relaxation | cubic game: loss | degree-5 game: loss | needed |
|---|---|---|---|
| HJM-PD transplant, uniform PSD lift (no absorption possible, §1.2) | ≥ 1.94·10⁻² at the model optimiser; relaxation value ≥ 0.77514 (loss ≥ 6.2·10⁻²) | ≥ 2.54·10⁻² at the optimiser | ≤ 1.3·10⁻⁴ (cubic, for 1.402); ≤ 3.3·10⁻⁴ (degree 5, for 1.403) |
| refined: Y-linear shells exact, lift only on the remote residual | ≥ 1.34·10⁻⁴ at the optimiser; relaxation value ≥ 0.71529 (loss ≥ 2.15·10⁻³) | ≥ 9.8·10⁻³ at the optimiser | same |

**The losses are lower bounds** (each "relaxation value" is attained by an explicit feasible configuration, so the
relaxation's actual upper bound is at least this large). They come *before* any loss from the phase-maximisation
step, which can only add to them.

**The dominant source is the uniform lift: it cannot tell the degrees of the remote coordinates apart.**
- At the cubic optimiser it charges the A- and B-contents of the visible coordinate (1.53·10⁻² and 3.98·10⁻³) as if
  they were cubic, although in the optimiser they pair only with degree-5 remote terms.
- With the shells handled exactly, it still charges the whole remote average k̄ = E_S k as if it were cubic. A
  constant-modulus remote driver, which is not a cubic chaos element, then gains 2.15·10⁻³.
- **Refinements in the HJM-PD spirit do not help.**
  - The complex cyclic absorption carries no information (Proposition A), so more rotated copies give nothing.
  - Higher S-moment orders or finer phases do not touch the lift's blindness to the remote degree.
- **Fixing the lift means resolving the remote degree,** that is, tracking the remote residual and its law
  explicitly. That is the repository's own row architecture (rows, potential Ψ, law of the remote cubic, Stein cuts),
  extended to a multi-grade fibre. It is not HJM-PD.

---------------------------------------------------------------------------------------------------------------------

## 1. The complex analogue of the HJM-PD relaxation, step by step

### 1.1 Starting point (P, standard)

- For unimodular charge-one f, g, put h = (f+g)/2 and k = (f−g)/2, so |h|² + |k|² = 1. Then
  Re⟨f, Tg⟩ = Σ_k q_k(‖P_k h‖² − ‖P_k k‖²).
- Rotate so that P₀h = t·z₁. Split the coordinates into S = z₁ and the remote Y.
- For each Y, the slices h_Y = h(·, Y) and k_Y = k(·, Y) are functions of one complex variable. Their moments are
  m_pq(·) = E_S[··conj(ψ_pq(S))], with ψ_pq the normalised complex Hermite (Laguerre) functions of bidegree (p, q).
- **Charge bookkeeping.** A moment of S-charge p − q pairs with remote functions of charge 1 − (p − q). The total
  bidegree is (p + p_Y, q + q_Y). The slice at e^(iθ)Y is e^(iθ)·(slice at Y)(e^(−iθ)·). So E_Y m_pq = 0 unless
  p − q = 1, and |m_pq|² depends only on |Y-driver|.

### 1.2 Step A, cyclic absorption: the complex version is void (Proposition A; P here, N check)

- **The HJM-PD inequality, complexified.** Put σ_r = f(cos(rπ/N)U + sin(rπ/N)V). Then σ_{r+N} = −σ_r and
  E σ_r·conj(σ_{r+j}) = Σ_k cos^(2k+1)(πj/N)·‖P_k f‖². So for real weights w,

      Σ_k Γ_k a_k ≤ B^ℂ(w),   Γ_k = Σ_j w_j cos^(2k+1)(πj/N),   a_k = ‖P_k f‖².

- **Proposition A.** B^ℂ(w), the maximum over unimodular anti-periodic sequences of
  (1/N)Σ_rΣ_j w_j Re(σ_r·conj(σ_{r+j})), equals the top eigenvalue λ_max = max_m Σ_j w_j cos((2m+1)πj/N). Moreover the
  inequality is implied by Parseval (Σ a_k = 1).
- **Proof.**
  - The form is anti-circulant, so its eigenvectors are the Fourier modes e^(iπ(2m+1)r/N). These are unimodular, so
    the Rayleigh bound is attained: B^ℂ = λ_max.
  - cos^(2k+1)θ = 4^(−k)Σ_i C(2k+1, i)·cos((2k+1−2i)θ) is a convex combination of cos((2m+1)θ), m ≤ k. Hence
    Γ_k ≤ λ_max for every k, and Σ_k Γ_k a_k ≤ max_k Γ_k ≤ B^ℂ. ∎
- **Check (N, `cyclic_check.py`).** For N = 5, 7, 9 and random signed weights, coordinate ascent over phases returns
  exactly λ_max. The real ±1 maximum is strictly smaller in 4 of 6 cases.
- **Consequence.** In the real case, sign sequences cannot realise the Fourier modes; the max-cut gap is where
  HJM-PD's Γ-absorption gets its strength. Complex unimodular sequences realise them, so the circulant configurations
  carry nothing.
- Non-circulant configurations would give genuine constraints only through finite complex Grothendieck gaps (a complex
  quadratic maximisation for each constraint). For the absorption to repair the lift (Γ₁ ≈ ε with slack ≤ 10⁻⁴ at the
  optimiser), such a constraint would have to be nearly as strong as the game inequality itself.

### 1.3 Step B: one-variable reduction with PSD lifts (choices made here)

- **The lift.** Each positive coefficient of the game is dominated, moment by moment, uniformly over remote degree,
  exactly as in HJM-PD (B.7), with H, K ⪰ 0.
  - The pure-S part (η = 0) is kept exactly, via the Schur and linear-multiplier device of their (B.7)–(B.9).
  - **k-side, cubic game.** The coefficient β₁ = +ε is charged on every remote degree of the k-moments that can
    reach total degree 3: (0,0) (remote cubic), (1,1) (A-shell) and (2,0) (B-shell).
  - **h-side.** Negative coefficients beyond η = 0 are dropped (H = 0).
  - **Degree-5 game.** The h-side has α₂ = +γ. It is charged on the h-moments (1,0), (0,1), (2,1), (1,2), (3,0) over
    every remote degree, minus the pure-S means. The k-side degree-5 terms (β₂ = −γ < 0) are dropped.
- **The refined version** treats the Y-linear (shell) projections exactly, as the repository's rows do, and lifts only
  the remote residual.
- **What is computed.** The losses *at the model optimiser*: the relaxation's objective at the optimiser's slice
  distribution minus the true value. Each is a lower bound on the relaxation's loss.
  - Also the value of the relaxation maximised over two explicit feasible families of slice distributions: ω = σW
    with W a Gaussian driver, and ω = r·ph(W) with constant modulus. Slices are ph(L(S) ± ω), with L = S(a + b|S|²)
    free.
  - Each such maximum is a lower bound on the relaxation's upper bound.

### 1.4 Step C: maximisation over unimodular phases (specified, not implemented: not needed for the verdict)

- **Implementable relaxation.** Discretise S ∈ ℂ into M cells, with u and v constant on each cell. The convex
  quadratic F(moments) then becomes a Hermitian quadratic form in 2M unit phases, and the moments are linear in the
  phases.
  - **Upper bound:** the complex MAXQP SDP over 2M × 2M Hermitian PSD matrices with unit diagonal (rank relaxation).
  - **Discretisation error:** the interpolation bound analogous to their (B.16), plus Gaussian tails.
- **Certification would need** either a provably small SDP gap for this structured instance (a small-rank structure,
  which is plausible, could make the SDP tight), or interval branch and bound over phase boxes. For M ≈ 10³ the SDP has
  about 4·10⁶ entries: heavy but feasible with structure; the branch and bound is infeasible beyond small M.
- Min-cut and sign fixing have no analogue.

---------------------------------------------------------------------------------------------------------------------

## 2. Numerical results (N)

### 2.1 Validation

- **Cubic optimiser** (1D best response): f, g = ph(L(z) ± σW) with L = z(0.661669 + 0.169166|z|²), σ = 0.239349.
  Model v = 0.713135467.
- From the slice moments, t² − ε|E m₂₁(h)|² + ε|⟨k̄, W⟩|² = 0.713135478, an agreement of 1.1·10⁻⁸.
  - t = 0.844443, E m₂₁(h) = −0.267083, true remote cubic energy 0.0714007.
- **Degree-5 optimiser** (grid best response): the slice-moment value 0.71243113 against the best-response value
  0.71243758. The difference is quadrature error between two grids.

### 2.2 Cubic game (ε = 1891/2500): losses at the optimiser and relaxation values

| item | value |
|---|---|
| lift overcount, remote (non-cubic part of k̄, weight ε) | 1.34·10⁻⁴ |
| lift overcount, A-shell (E\|m₁₁(k)\|² = 0.02024, weight ε) | 1.531·10⁻² |
| lift overcount, B-shell (E\|m₂₀(k)\|² = 0.00526, weight ε) | 3.98·10⁻³ |
| **pure lift: loss at the optimiser** | **1.94·10⁻²** (objective 0.732552) |
| pure lift: best over the Gaussian-driver family | ≥ 0.759459 (loss ≥ 4.63·10⁻²) |
| pure lift: best over the constant-modulus family | ≥ 0.775139 (loss ≥ 6.20·10⁻²) |
| **refined (exact shells): loss at the optimiser** | **1.34·10⁻⁴** (0.7132695) |
| refined: best over the Gaussian-driver family | ≥ 0.7132964 (loss ≥ 1.61·10⁻⁴) |
| refined: best over the constant-modulus family | ≥ 0.7152852 (loss ≥ 2.15·10⁻³) |

The constant-modulus remote driver ω = r·ph(W) is not a cubic chaos element: only π/4 of its energy is cubic. The
lift cannot see this; the repository's remote-law machinery (moments, Stein cuts) can.

### 2.3 Degree-5 game (1, −0.849, +0.2816)

| item | value |
|---|---|
| k-side lift overcount (weight ε): remote / A / B | 7.5·10⁻⁵ / 1.691·10⁻² / 6.27·10⁻³ |
| h-side lift overcount (weight γ, degree-5 slots, pure-S means removed) | 2.14·10⁻³ |
| dropped k-side degree-5 energy (γ·‖P₂k‖² of W(\|z\|² − 1) and z²W̄) | 7.58·10⁻³ |
| **pure lift: loss at the optimiser** | **≥ 2.54·10⁻²** |
| **exact shells: loss at the optimiser** | **≥ 9.8·10⁻³** |

### 2.4 Runtime and sizes

- **Runtime.**
  - One loss evaluation at an optimiser takes 6 to 15 s: an S-grid of 84 × 12 radial × 256 angular nodes, and 240 or
    80 nodes in |W|.
  - A family optimisation takes 35 to 60 s (Nelder–Mead, 3 parameters).
  - The cyclic check takes seconds.
- **Size of a full implementation.**
  - S-moments up to bidegree sum 3 (cubic) or 5 (degree 5): 10 or 21 complex moments per slice, so 40 or 84 real
    moments for the pair.
  - The phase step needs about 10³ to 10⁴ S-cells.
  - It was not built, because the lower bounds above already exceed the budget by factors of about 80 to 480 (pure lift)
    and 1 to 30 (exact shells).

---------------------------------------------------------------------------------------------------------------------

## 3. Which step loses, and do refinements help?

- **Step A (absorption).** It cannot lose or gain anything with circulant configurations (Prop. A). More rotated
  copies, larger N, or signed weights change nothing: B^ℂ = λ_max always.
- **Step B (lift).** This is the dominant loss.
  - Of the 1.94·10⁻² at the cubic optimiser, 99% comes from the shells, where the visible A- and B-contents pair with
    *degree-5* remote terms but are charged at the cubic weight.
  - Exact shells remove that. The remaining remote overcount is 1.34·10⁻⁴ at the optimiser; it exceeds 2·10⁻³ against
    feasible non-chaos remote laws.
  - A higher S-moment order does not change the remote degree. Finer S-cells do not either.
  - What would help is splitting each moment's remote function by degree (linear, cubic, …), which is to say not
    lifting.
- **Step C (phases).** Not evaluated. It only adds to the loss.

---------------------------------------------------------------------------------------------------------------------

## 4. Recommendation: no-go for "route B following HJM-PD"; a concrete next step

- **No-go.** Route B via the HJM-PD architecture is excluded at the precision needed. Even the most favourable variant
  loses ≥ 1.34·10⁻⁴ on the cubic game, where the target budget for 1.402 is 1.3·10⁻⁴. Over feasible configurations it
  loses ≥ 2.15·10⁻³. At degree 5 it loses ≥ 9.8·10⁻³, against a budget of 3.3·10⁻⁴.
- **Route B is not dead, but its certificate must be the repository's architecture.** That means rows with an explicit
  remote residual whose *law* is controlled (moments, Stein cuts, law bank), extended to a **multi-grade fibre**: one
  remote cubic W feeding the cubic sector and the two degree-5 mixed sectors W(|z|² − 1) and z²W̄, as in
  `docs/overview.tex` open problem 2.
- **Concrete next step**, cheap and in the same spirit as this experiment:
  1. Evaluate the degree-5 row functional at the peak of the degree-5 game: visible z, a remote driver ω feeding
     the three sectors, with K₅'s Gaussian benchmark.
  2. Take its supremum over remote laws that satisfy the *existing* cubic-law constraints (EU² ≤ 44, the sixth-moment
     bound, Stein cuts).
  3. Measure the gap to the Gaussian benchmark. That gap is the analogue of the 1.3·10⁻⁴ that the cubic rows achieve.
     K₅'s known flank violation is +1.55·10⁻⁵ (MONOGRAPH ch4 item 12.3).
  - **If the gap is ≤ 2·10⁻⁴,** a degree-5 certificate near 1.4033 is plausible, and route B is worth a build.
  - **If the law constraints let constant-modulus-like remote laws through** at the 10⁻³ level, as the lift does here,
    stop and stay on route A.
