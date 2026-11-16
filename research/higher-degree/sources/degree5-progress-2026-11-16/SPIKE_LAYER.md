<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/spike-layer/SPIKE_LAYER.md, 16 November 2026; claude-b9ee research worker. -->
# The spike layer on the degree-5 flank rows: formulation, decomposition, numerics, plan

Research worker for claude-b9ee, 16 November 2026 (issue #453). Labels: **P** proof on paper (here, short),
**C** certified, **N** numerical (floating point). Nothing here is certified. Scripts are in this folder; big-droplet logs in
`big_logs/`, JSON results in `big_res/` and `res/`.

## 0. Answer in brief

- **The excess is additive over coordinates (N, to 0.2 %).** On the additive spike class (every remote coordinate carries
  a spike and its same-coordinate companions), the excess is exactly `−D_G(Γ) + Σ_j Δ_j` (P). Here `D_G ≥ 0` is the deficit
  of the configuration's Gaussianisation, and it depends only on second-order aggregates `Γ`. The `Δ_j` are Lindeberg swap
  gains. Numerically each `Δ_j` equals the single-coordinate swap gain in a purely Gaussian background, to about 1e-7.
  The interaction between non-Gaussian coordinates is below 2e-6 in total for 8 spikes.
- **A few heavy coordinates plus a Gaussian bulk do not capture it.** The plateau is a collective effect of about 10
  coordinates with influence 3e-3 each. Each one has a large gross swap gain (6.5e-5 at N = 8) and a small net gain
  (about 1e-5). Gaussianising the light ones costs their whole gross gain. The excess at N = 8 is 7.4e-5, against
  −4.5e-4 after full Gaussianisation.
- **What works instead is telescoping plus exact single-coordinate net gains.** The net gain `Ψ(c, u)` of adding one
  spike of amplitude `c` in a Gaussian background of cubic energy `u` is a single-coordinate problem. Its dimension does
  not depend on any threshold.
  - Light coordinates: `Ψ(c, 0) < 0` for `c < c_*` = 0.021, 0.024 and 0.027 at t = 0.86, 0.87 and 0.88. In a
    background, `0 < Ψ ≤ 3c⁴` for c ≤ 0.025. Deleting the light ones costs ≤ 3τ·u_L: 1e-5 at τ = 1e-4.
  - Heavy coordinates are summed by dynamic programming over the background state.
  - The background state is the cubic energy u **and the companion aggregates**. A one-variable programme over u, fed by
    Ψ in a background with the one-spike companion level, gives 1.58e-4, which is not attained (§2.4).
- **Exact sizes (additive class).**
  - One spike: 1.95e-5, 1.755e-5 and 1.50e-5 at t = 0.86, 0.87 and 0.88.
  - Best symmetric many-spike configuration at t = 0.87: 8.21e-5 (12 spikes, c = 0.05).
  - t = 0.86 runs about 13 % higher, so about 9e-5.
  - A two-coordinate cluster with cross terms gives 3.88e-5, against 3.02e-5 for two spikes.
- **Verdict: a certified cap of about 1.1–1.3e-4 (§5).** 1.2e-4 is borderline. The cross-coordinate structures are the
  unquantified part.
- Results are in §§2–3, the certification plan in §4 and the budget in §5.

---------------------------------------------------------------------------------------------------------------------

## 1. Formulation (Q1)

### 1.1 The row functional and the additive spike class

Flank row (ℓ, β, b_A, b_B as in `k5_attack.py`, c₅ = 0), ε₁ = 0.848926, η = 0.281576:

    Λ₅ = E|L + G₅ + G₃ − C| + E|L + G₅ − G₃ + C| − ‖G₃‖²/ε₁ − ‖G₅‖²/η + k_q‖q‖²,   k_q = (b_A² + b_B²)/η,
    L = z₁(ℓ + β(|z₁|² − 2)),  C = b_A q(|z₁|² − 1) + b_B q̄ z₁²/√2,  q = z₁-free part of G₃.

S is the supremum over d5k's Gaussian family. At t ∈ [0.86, 0.88] the Gaussian residual is useless (σ* ≈ 0), so
`S = Λ₅(q = 0, ν₅*)` up to a bulk gain below 3e-7: 1.383840861, 1.396336661 and 1.407680366 at t = 0.86, 0.87 and 0.88.

**Additive spike class 𝒜.**
- Each remote coordinate z_j carries a vector v_j ∈ ℂ¹⁶ on the 16 Wick columns supported on (z₁, z_j) with z_j-degree ≥ 1:
  `e_s = :z₁^{a₁} z̄₁^{b₁}: · :z_j^{a} z̄_j^{b}: / norm`.
  - 5 cubic columns, with (a₁ + a, b₁ + b) = (2, 1); the spike is H₂,₁(z_j).
  - 11 quintic columns, with (a₁ + a, b₁ + b) = (3, 2).
- Plus ν₃H₂,₁(z₁), ν₅H₃,₂(z₁) and the bulk σW, m_A W(|z₁|² − 1), m_B W̄z₁²/√2.
- Influence of coordinate j: τ_j = ‖v_j‖². Spike energy: c_j² = |v_{j,spike}|². Remote cubic energy: u = Σ c_j² + σ².

### 1.2 Exact structure (P)

(a) **Reduction to |z₁|.** Every term has charge one under the joint rotation of all coordinates. So E over z₁ reduces
to E over r = |z₁| with z₁ = r real, and the remote coordinates keep their law.

(b) **Sums of independent 2-D vectors.** At fixed r, the two integrands are |a_±(r) + Y_±| with

    a_± = L(r) + ν₅H₃,₂(r) ± ν₃H₂,₁(r),
    Y_± = Σ_j X_{j,±}(r; z_j) + B_±(r; W).

Here X_{j,±} = (quintic part) ± (cubic part − C-part) of coordinate j, and B_± = αW + γW̄ is Gaussian. Hence Λ₅ depends on
the configuration only through
- the 2-D laws of the per-coordinate vectors X_{j,±}(r; ·), and
- the bulk covariance.

This is what makes exact many-coordinate numerics possible (§2.3: FFT convolution of 2-D laws, per r).

(c) **Excess identity.** Let X^G be the Gaussianisation: the same 2×2 covariance at every (r, ±). Equivalently, every
remote chaos type of every coordinate gets its own independent Gaussian driver, as in k5's `--diffuse ext`. Then

    Excess(v) := Λ₅(v) − S = −D_G(v) + Σ_j Δ_j,
    D_G(v) := S − Λ₅(v^G),
    Δ_j := E[Φ(T_j + X_j) − Φ(T_j + X_j^G)],   T_j = Σ_{i<j} X_i^G + Σ_{i>j} X_i + B   (Lindeberg hybrids).

- D_G depends on v only through the aggregate covariances Γ(r, ±) = Σ_j Cov X_{j,±}(r) and the (additive) costs.
- D_G ≥ 0 is "Gaussian domination on the extended Gaussian family". That is a finite-dimensional Gaussian statement, N
  on every point tested here.

(d) **Third-order structure.**
- Rotating z_j multiplies the column with remote type (a, b) by e^{i(a−b)θ}. So a third moment of the per-coordinate
  vector is nonzero only if the remote charges sum to 0.
- **The pure spike (charge ±1, also through C) has all third moments 0.** Hence a spike alone gains nothing at third
  order, in line with (K-a) and with the k5 finding that a spike alone loses.
- The leading swap gain is c_j²·(companion of even remote charge): Δ_j ≈ c_j² Σ_s d_{j,s} κ_s K_s(r, Γ) + O(τ_j²). The
  key moments for H = :w² w̄:/√2 are:

      E[(:|w|⁴:/2)|H|²] = 5,   E[(|w|² − 1)|H|²] = 3,   E[conj(:w³w̄:/√6) H²] = 12/√6 = 4.90.

  All three are 0 for Gaussians.
- The corresponding companions are exactly the ones the optimiser selects:
  - z₁:|z_j|⁴:/2 (remote charge 0);
  - H₂,₁(z₁)(|z_j|² − 1) and z₁(|z_j|² − 1) (charge 0);
  - z̄₁:z_j³z̄_j: and z̄₁z_j² (charge 2);
  - :z₁z̄₁²:z_j² (charge 2) and z₁³z̄_j² (charge −2).

  The charge-1 companion (|z₁|² − 1)z_j, the largest cubic one, has no third moment with two spike factors.
  It couples to a charge-2 companion together with the spike, E[z·conj(z²)·H] = √2. It also couples to the spike
  pair at fourth order, through the cumulant κ(z, z̄, H, H̄) = E|z|²|H|² − 1 = 3, which acts as a reduced quadratic
  cost.
- The quadratic costs ‖d‖²/η, ‖d‖²/ε₁ of the companions are paid in D_G. Maximising c²dK − κd² over d gives a
  per-coordinate net of order K²c⁴/(4κ).

(e) **Telescoping (deletion) identity.** Order the coordinates and let H_j be the first j of them, with ν₃, ν₅ and the
bulk re-optimised at every stage. Since sup f − sup g ≤ sup(f − g),

    Excess = Σ_j [sup Λ₅(H_j) − sup Λ₅(H_{j−1})] + [sup Λ₅(H₀) − S]
           ≤ Σ_j ψ(v_j; H_{j−1}),
    ψ(v; H) := sup_{ν, bulk} Λ₅(H + v) − sup_{ν, bulk} Λ₅(H).

- The last bracket is ≤ 0.
- Replacing H_{j−1} by its Gaussianisation changes ψ by an interaction term, numerically tiny (§2.3).
- This gives Ψ(c, u): the supremum of ψ over the companions of a spike of amplitude c, in a Gaussian background of cubic
  energy u.

### 1.3 The worst profile (N, §2)

- **Shape.** N ≈ 8–20 identical spikes of amplitude c ≈ 0.04–0.055, so u ≈ 0.025–0.036. Each carries the same companion
  vector, of relative sizes 0.05c (z₁:|z_j|⁴:), 0.04–0.05c ((|z₁|² − 1)z_j), 0.035c (H₂,₁(z₁)(|z_j|² − 1)) and
  0.035c (z̄₁:z_j³z̄_j:). Also ν₅ ≈ 0.046–0.049 and a small bulk σ ≈ 0.005–0.01.
- **The excess is a sum of many small net gains.** The best single coordinate gives 1.75e-5. Ten coordinates give
  7.8e-5, each contributing a net of about 0.8e-5.
- **So the excess does NOT depend only on a few heavy coordinates plus a Gaussian bulk.** It depends on all spikes above
  c_* ≈ 0.024, individually, and on the aggregate through D_G.

---------------------------------------------------------------------------------------------------------------------

## 2. Numerics (Q3)

Tools, all FLOAT and all exact in the sense of deterministic quadrature (no sampling):
- `k1.py`: one heavy coordinate. Quadrature over r = |z₁| (Gauss–Legendre panels), z_j polar and W polar, with analytic
  gradient and L-BFGS.
- `k2.py`: two heavy coordinates, by outer sums over two polar grids, optionally with the 44 cross columns.
- `fftev.py`: N spikes, of which k are exact and N − k Gaussianised, plus the bulk.
  - At each r, the 2-D law of one spike term is put on a 1024² grid by a moment-preserving 3×3 stencil.
  - The law is convolved k times by FFT and smoothed by the exact Gaussian characteristic function.
  - It is integrated against |a + y| by Parseval, with an adjoint gradient.
  - **Validated against `k1.py`:** a one-spike value agrees to 4·10⁻⁸ (n = 1024, h = 0.004), and S agrees to 10⁻¹⁵
    (`val1.py`).
  - **r-grid dependence:** 2.6·10⁻⁸ between 96 and 192 r-nodes for N = 3, but 2.4·10⁻⁶ at 48 r-nodes. So the 48-node
    numbers below carry about ±2·10⁻⁶.
  - **The coarse grid is exploitable.** At 48 r-nodes a Gaussian residual σ = 0.025 appears to gain +3.2·10⁻⁶ over S,
    in both `k1.py` and the Fourier code (`res/extgauss_t87.json`). At 192–384 r-nodes it loses −2.0·10⁻⁶. An
    optimiser finds such artefacts, so every reported maximum uses ≥ 96 r-nodes, or a background that smooths the cone.
- `swap.py`: Ψ(c, u). `mspk.py`: many-spike values and replacement profiles. `k1scan.py`: Ψ(c, 0) by exact quadrature.
  `meanfield.py`: dynamic programming.

### 2.1 One heavy coordinate, exact (k = 1)

The supremum over the 16 columns plus ν₃, ν₅ is taken at grids up to 576 r-nodes × 12288 z-nodes. **The number that
counts is the converged excess.**

| row | converged excess (this work) | k5 quadrature (60×48 grid) | maximiser |
|---|---|---|---|
| t = 0.86 | **+1.95·10⁻⁵** | 1.77·10⁻⁵ | c = 0.065, ν₅ = 0.053 |
| t = 0.87 | **+1.755·10⁻⁵** | 1.61 / 1.55·10⁻⁵ | same structure |
| t = 0.88 | **+1.50·10⁻⁵** | 1.38·10⁻⁵ | same structure |

- The maximiser's companions are (|z₁|² − 1)z_j 0.0046, z₁:|z_j|⁴:/2 0.0039, H₂,₁(z₁)(|z_j|² − 1) 0.0024,
  z̄₁:z_j³z̄_j:/√6 0.0022, :z₁z̄₁²:z_j²/2 0.0013 and z₁²z̄_j/√2 0.0010.
- **Grid dependence.** At t = 0.87 the converged value is 1.755·10⁻⁵ ± 0.02·10⁻⁵. With 48 r-nodes it was 2.29·10⁻⁵
  instead of 1.75·10⁻⁵: the |z₁|-direction needs about 200 nodes. The k5 values were under-resolved in |z₁|.
- **The bulk.** Its gain at q = 0 is below 3·10⁻⁷ on these rows (k5 σ-profile). In the many-spike optima σ ≈ 0.002–0.01.

### 2.2 Single-coordinate net gain in zero background, Ψ(c, 0) (`k1scan.py`, exact)

This is the supremum over the 15 companions and ν₃, ν₅, at a fixed spike amplitude c, minus S.

| c | 0.010 | 0.015 | 0.020 | 0.025 | 0.030 | 0.035 | 0.040 | 0.050 | 0.060 | 0.070 | 0.080 | 0.090 | 0.100 | 0.120 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| t = 0.86 (10⁻⁶) | −0.12 | −0.22 | −0.06 | +0.77 | +2.13 | +4.03 | +6.52 | +13.2 | +18.6 | +18.5 | +7.82 | −19.0 | −67.2 | −250 |
| t = 0.87 (10⁻⁶) | −0.23 | −0.47 | −0.50 | +0.10 | +1.21 | +2.84 | +5.07 | +11.3 | +16.6 | +16.7 | +6.95 | −18.3 | −64.1 | −239 |
| t = 0.88 (10⁻⁶) | −0.28 | −0.59 | −0.71 | −0.24 | +0.71 | +2.14 | +4.13 | +9.79 | +14.3 | +13.8 | +3.28 | −22.6 | −68.7 | −243 |

- **A single light spike is net-negative.** Below c_* = 0.021, 0.024 and 0.027 at t = 0.86, 0.87 and 0.88, the best
  companions cannot pay for the spike: Ψ ≈ −a₂c² with a₂ ≈ 1.2·10⁻³, 2.3·10⁻³ and 2.8·10⁻³. This is the
  slope of the Gaussian q-direction, which is almost flat on these rows.
- **Above c_*,** Ψ ≈ (1.5–2.7)c⁴ up to c ≈ 0.05.
- **Per unit cubic energy,** the best ratio is max Ψ/c² ≈ 4.6·10⁻³ (t = 0.87, c ≈ 0.055–0.06).
- **Large spikes lose** (c ≥ 0.09).

### 2.3 The many-spike family, exact: values, Gaussianisation, swap profile (`mspk.py`, t = 0.87)

The configurations are k5's polished Monte-Carlo optima of the symmetric N-spike ansatz (`symspikes`, per-spike vector
= SYM coefficients/√N, bulk kept). All values below are exact Fourier evaluations; none are fresh-sample estimates.

| N | c per spike | u | exact excess | k5 MC (fresh) | D_G = −(fully Gaussianised) | first swap δ₁ | mean swap Σ Δ_j/N | interaction Σ Δ_j − Nδ₁ |
|---|---|---|---|---|---|---|---|---|
| 1 | 0.066 | 0.0044 | 1.755·10⁻⁵ (§2.1) | 1.80 ± 0.37 | 1.20·10⁻⁴ | 1.38·10⁻⁴ | — | — |
| 2 | 0.0555 | 0.0062 | 2.73·10⁻⁵ | 2.85 ± 0.46 | 1.41·10⁻⁴ | 8.41·10⁻⁵ | 8.43·10⁻⁵ | +0.4·10⁻⁶ |
| 3 | 0.0622 | 0.0116 | 4.25·10⁻⁵ | 4.64 ± 0.54 | 2.82·10⁻⁴ | 1.081·10⁻⁴ | 1.082·10⁻⁴ | +0.5·10⁻⁶ |
| 8 | 0.0540 | 0.0233 | 7.36·10⁻⁵ | 8.07 ± 0.82 | 4.48·10⁻⁴ | 6.50·10⁻⁵ | 6.52·10⁻⁵ | +1.7·10⁻⁶ |
| 10 | 0.0529 | 0.0280 | 7.78·10⁻⁵ | 7.97 ± 1.0 | 5.05·10⁻⁴ | 5.81·10⁻⁵ | 5.83·10⁻⁵ | +2.7·10⁻⁶ |
| 20 | 0.0422 | 0.0356 | 8.00·10⁻⁵ | 7.20 ± 1.2 | 4.49·10⁻⁴ | 2.64·10⁻⁵ | 2.65·10⁻⁵ | +2.0·10⁻⁶ |
| 40 | 0.032 | 0.041 | 5.43·10⁻⁵ | 4.32 ± 1.3 | 3.93·10⁻⁴ | 1.12·10⁻⁵ | 1.12·10⁻⁵ | +0.8·10⁻⁶ |

The k5 MC column is in units of 10⁻⁵. The N = 2 and N = 10 rows were recomputed with 96 r-nodes. The N = 20 and 40 rows use 48 r-nodes. With few spikes and
48 r-nodes the error reaches −4·10⁻⁶ (N = 2: 2.31 → 2.73·10⁻⁵); with ten or more spikes it is below 4·10⁻⁷.

- **The Monte-Carlo numbers are confirmed** within their standard errors. The symmetric family's plateau is
  **7.4–8.0·10⁻⁵ for N = 8–20** (t = 0.87), falling to 5.4·10⁻⁵ at N = 40.
- **The excess is additive.**
  - The swap increments E_{N,k} − E_{N,k−1} are constant in k to 10⁻⁷. At N = 8 they run 6.501, 6.510, 6.515, 6.521,
    6.526, 6.531, 6.536 and 6.541·10⁻⁵.
  - So Excess = Nδ₁ − D_G + I, with a positive interaction I ≤ 3·10⁻⁶ on the whole family.
  - The gross swap gain scales as δ ≈ (7–10)c⁴. D_G grows like the aggregate.
  - The excess is the small difference of two quantities 5–10 times larger than itself.
- **Heavy + Gaussian bulk is far off.** Keeping only k spikes exact and Gaussianising the rest gives, at N = 20 with
  k = 10, −1.85·10⁻⁴ against the true +8.0·10⁻⁵. The replacement error, 10 × 2.65·10⁻⁵, is ≈ 8τ·u_light, with constant
  about 8. That is the O(τ) Lindeberg error made explicit, and it is too large at every useful τ (§3).
- **The deletion profile behaves the same way.** Removing spikes one at a time from the N = 8 optimum, at fixed ν₅ and
  bulk, gives increments +2.2·10⁻⁵ and +2.7·10⁻⁵ per spike. The first increment, +4.4·10⁻⁵, also corrects the ν₅
  mismatch (`dels.py`, partial).

### 2.4 Net gains in a background, the telescoping sum, and the mean-field cap (t = 0.87)

**(a) Ψ(c, u) in a "k1-shaped" Gaussian background.** `swap.py` with n = 512 and 48 r-nodes; the background is
smoothing, and its grid accuracy is ±2·10⁻⁷. The background is 10 Gaussianised copies of the one-spike optimum, scaled to
cubic energy u. Values are in units of 10⁻⁶, with the u = 0 row from §2.2.

| u \ c | 0.030 | 0.040 | 0.050 | 0.060 | 0.070 |
|---|---|---|---|---|---|
| 0 | +1.21 | +5.07 | +11.3 | +16.6 | +16.7 |
| 0.01 | +2.06 | +6.39 | +11.9 | +15.8 | +13.5 |
| 0.02 | +2.36 | +6.21 | +10.8 | +12.5 | +7.31 |
| 0.03 | +2.14 | +5.14 | +8.14 | +7.51 | −1.30 |
| 0.04 | +1.34 | +3.17 | +4.02 | +0.47 | −12.5 |
| 0.05 | — | +0.31 | −1.39 | −8.40 | — |

- **Small spikes gain from a background.** Ψ(0.03, u) doubles from u = 0 to u = 0.02: the Gaussian background smooths
  the cone of |L| at z₁ = 0.
- **Large spikes lose to it.** The convex Gaussian q-deficit dominates.
- **The best rate falls with the background.** max_c Ψ/c² ≈ 4.7·10⁻³ (u ≤ 0.01), 4.3·10⁻³ (0.02), 3.3·10⁻³ (0.03),
  1.6·10⁻³ (0.04) and ≈ 0 at u = 0.05.
- **The bulk never helps in these backgrounds:** σ* = 0 at u = 0, 0.01, 0.02 and 0.03. So the small-spike gains are
  genuine, not a bulk effect.

**(b) The dynamic programme on this table gives V(0) = 1.58·10⁻⁴, with 17 spikes and final u = 0.040 (`meanfield.py`).
It is NOT attained.**
- The exact telescoping increments of an actual symmetric configuration fall much faster with u. The configuration uses
  the spike vector that is optimal at (c = 0.05, u = 0.02), with ν₅ re-optimised at each N (Fourier, n = 512, 96
  r-nodes):

  | N | 1 | 2 | 4 | 6 | 8 | 10 | 12 | 13 | 16 |
  |---|---|---|---|---|---|---|---|---|---|
  | u | 0.0025 | 0.005 | 0.010 | 0.015 | 0.020 | 0.025 | 0.030 | 0.0325 | 0.040 |
  | exact excess (10⁻⁵) | 0.91 | 2.25 | 4.15 | 5.79 | 7.06 | 7.89 | **8.21** | 8.17 | 7.13 |
  | increment ψ_N (10⁻⁶) | 9.1 | 13.3 | 9.4 | 7.8 | 5.8 | 3.6 | 1.0 | −0.4 | −5.1 |

- At equal u, the increments are smaller than the table's Ψ(0.05, u) by 3·10⁻⁶ (u = 0.01), 6·10⁻⁶ (0.02) and
  8.5·10⁻⁶ (0.03).
- **Cause:** the table's background has the one-spike companion level, |d|/c = 0.11. The many-spike optima carry
  |d|/c ≈ 0.08. The background's Gaussianised companion noise smooths |·| for the next spike, and its cost was sunk
  earlier.
- **So Ψ depends materially on the background's companion aggregate, not only on u.** A consistent mean-field programme
  must carry the even-charge companion energies of the background as state variables (2–4 more dimensions). The
  one-variable DP above is an inconsistent overestimate. The true supremum of the additive class lies between the
  symmetric value 8.2·10⁻⁵ and 1.58·10⁻⁴; the non-symmetric checks are in §2.6.
- **The exact symmetric curve above peaks at 8.21·10⁻⁵ (N = 12, c = 0.05, u = 0.030) at t = 0.87.** That is above every
  k5 candidate. The increments decrease about linearly in u and vanish at u ≈ 0.032: the mean-field picture, with
  plateau ≈ ∫ψ.

### 2.5 Two heavy coordinates, and the cross-coordinate structures (`k2eval.py`, exact outer sums, t = 0.87)

Grid: 96 r-nodes × (48 radial × 40 angular)² per remote pair. The bulk of the k5 candidates (|W| ≤ 0.013) is dropped.

| configuration (k5 polished MC optimum, d = 3) | k5 MC fresh | **exact excess** |
|---|---|---|
| symmetric two-spike family (`symspikes`, N = 2) | 2.85 ± 0.46·10⁻⁵ | **2.73·10⁻⁵** (Fourier, 96 r-nodes) |
| general two-spike family (`spikes`, two different 16-vectors) | 3.27 ± 0.45·10⁻⁵ | **3.02·10⁻⁵** |
| full family (all 78 junta columns, cross terms included) | 5.04 ± 0.76·10⁻⁵ | **3.88·10⁻⁵** |

- The full-family optimum is not two spikes. Its remote cubic is mostly the two-coordinate monomial z₂²z̄₃/√2
  (coefficient 0.0925), plus (|z₂|² − 1)z₃ 0.031, (|z₃|² − 1)z₂ 0.023 and z₃²z̄₂ 0.022, with cross-coordinate
  quintic companions.
- On these candidates, **cross-coordinate structures add ≈ 0.9·10⁻⁵ at two coordinates** (exact), against the 1.7·10⁻⁵
  the Monte Carlo suggested.
- Per unit cubic energy, the X²Ȳ cluster earns 3.88·10⁻⁵/0.0106 ≈ 3.7·10⁻³. The best single spike earns
  1.75·10⁻⁵/0.0044 ≈ 4.0·10⁻³. So clusters are comparable to spikes, not much better.
- The full-space plateau is therefore plausibly the additive-class cap plus at most a few 10⁻⁵ (unmeasured beyond two
  coordinates).

### 2.6 Heavy-part maxima for k = 1–4 heavy coordinates, and non-symmetric profiles

**Exact heavy-part maxima at t = 0.87** (k identical exact spikes, no Gaussianised copies, bulk off). Two families:
- `kred.py`, reduced: the spike amplitude c, a common scale κ on the one-spike companion vector, and ν₅. Nelder–Mead,
  2 starts, Fourier n = 512 with 96 r-nodes, bias about +5·10⁻⁷ at k = 1.
- `mspk.py --opt`, full: L-BFGS on all 16 columns plus ν₃, ν₅ and the bulk, n = 768 with 96 r-nodes, from the k5
  candidates.

| k | reduced family | full L-BFGS | k5 candidate, exact | increment (reduced) |
|---|---|---|---|---|
| 1 | 1.81·10⁻⁵ (c = 0.069), exact quadrature **1.755·10⁻⁵** | — | 1.80 ± 0.37 (MC) | — |
| 2 | **3.11·10⁻⁵** (c = 0.064, κ = 0.97) | stopped | 2.73 (sym), 3.02·10⁻⁵ (general) | 1.30·10⁻⁵ |
| 3 | **4.26·10⁻⁵** (c = 0.062, κ = 0.94) | stopped | 4.25·10⁻⁵ | 1.15·10⁻⁵ |
| 4 | **5.14·10⁻⁵** (c = 0.060, κ = 0.92) | stopped | 4.18·10⁻⁵ (scaled N = 3 start) | 0.88·10⁻⁵ |

- The full L-BFGS runs (n = 768, 96 r-nodes, about 60–80 s per gradient on the shared droplet) did not finish in the
  time budget and were stopped; "stopped" in the table means no result.
- **The per-coordinate increment falls** from 1.75 to 1.30, 1.15 and 0.88·10⁻⁵ as the background grows. The optimal c
  and κ drift down slowly.
- **Other rows,** from the ratios on identical configurations: t = 0.86 ≈ 1.11–1.14 × (one spike 1.95/1.755; N = 8
  candidate 8.37/7.36·10⁻⁵); t = 0.88 ≈ 0.85 ×.

**Non-symmetric profiles** (`mgroup.py`: two groups of identical spikes with the one-spike companion shape, independent
scales and ν₅, Nelder–Mead, n = 768, 96 r-nodes):
- 3 + 6 spikes converge to equal scales (0.806, 0.800): 5.31·10⁻⁵.
- 2 + 8 spikes also converge to equal scales (0.8186, 0.8185): 5.62·10⁻⁵.
- **Grading the spikes does not help** within this family. Its values are low only because the one-spike companion
  level, |d|/c = 0.11, is too heavy for many spikes; the best many-spike shape has |d|/c ≈ 0.08 (§2.4).
- Together with the exact telescoping of §2.4(b), this supports **sup over the additive class ≈ symmetric optimum ≈
  8.2·10⁻⁵ at t = 0.87** (about 9.2·10⁻⁵ at t = 0.86). The one-variable mean-field value 1.58·10⁻⁴ is an artefact.

---------------------------------------------------------------------------------------------------------------------

## 3. The influence decomposition (Q2)

### 3.1 As posed: heavy coordinates jointly exact, light ones by Lindeberg replacement

Split at τ. The heavy set H has |H| ≤ u/τ. The exact identity (P) is

    Excess(v) = Excess(v_H ⊕ v_L^G) + Σ_{j∈L} Δ_j .

The first term is a heavy problem with a Gaussian bulk; the second is the replacement error.

**(a) The replacement error is the gross swap gain, which is large.**
- Each light coordinate contributes Δ_j ≈ δ(c_j) ≈ (7–10)c_j⁴ (§2.3). So the error is ≈ 9τ·u_L, an O(τ) bound whose
  constant is about 9 per unit of light cubic energy.
- With u_L up to 0.04: **R(τ) ≈ 3.6·10⁻⁴·(τ/10⁻³).** Getting R ≤ 2·10⁻⁵ needs τ ≤ 6·10⁻⁵, hence up to
  0.045/6·10⁻⁵ ≈ 750 heavy coordinates.
- The cancellation that keeps the true excess small is lost. It is between this swap gain and the light coordinates'
  own companion costs, which sit inside D_G of the heavy problem.

**(b) The heavy problem is too large for any useful τ.**
- The plateau is carried by about 10 spikes with τ_j ≈ 3·10⁻³. A heavy set that contains them needs τ ≤ 3·10⁻³. That is
  a joint problem in 10–15 coordinates: 160–240 complex parameters and a 20–30 real-dimensional integral.
- Quadrature is impossible there. Monte Carlo cannot resolve 10⁻⁶. The Fourier method works only because the spike
  class is additive.

**(c) Generic invariance constants are far worse.**
- A Mossel–O'Donnell–Oleszkiewicz or Lindeberg bound needs C³ test functions. Φ = |a + y| is a cone at a = 0, with
  a = 0 at z₁ = 0, so it has no intrinsic smoothing scale.
- Smoothing at scale s costs O(s) and gives ‖D⁴Φ_s‖ ~ s⁻³. The fourth-order remainder per coordinate is then about
  (C/24)·s⁻³·E|X|⁴, with E|H|⁴ = 44 (the circular fourth-moment equality case).
- Even with the full background (s² ≈ u ≈ 0.03) this is about 400c⁴C per coordinate, against a true net gain of at most
  2.7c⁴. **No choice of τ certifies ≤ 1.2·10⁻⁴ this way.**

### 3.2 What works: telescoping with exact single-coordinate net gains

By §1.2(e),

    Excess ≤ Σ_j Ψ(c_j, u_{j−1}) + I,
    Ψ(c, u) := sup_{companions, ν} [value with one spike of amplitude c in a Gaussian background of cubic energy u]
               − sup_ν [background alone],
    I = interaction (background non-Gaussianity).

**(i) Light coordinates.**
- **In zero background they are exactly non-positive:** Ψ(c, 0) ≤ 0 for c ≤ c_*(0) = 0.021, 0.024 and 0.027 (§2.2),
  with Ψ ≈ −a₂c² + A₄c⁴, a₂ ≈ 1.2–2.8·10⁻³ and A₄ ≈ 2–4.
- **In a background the a₂c² loss disappears**, because the background smooths the cone at z₁ = 0.
  - With the one-spike companion level: Ψ(0.025, u) = +0.84 and +1.14·10⁻⁶ at u = 0.01 and 0.02, and Ψ(0.020, u) =
    +0.16 and +0.41·10⁻⁶. At u = 0.02, Ψ(0.015) = +0.07·10⁻⁶ (`swap.py`, rows `swl_*`).
  - So Ψ(c, u) ≤ A c⁴ with A ≈ 3 for c ≤ 0.025.
- **The light part therefore costs O(τ), with an explicit numerical constant:**

      Σ_{c_j² ≤ τ} ψ_j ≤ A·τ·u_L ≤ 3τ·u_L.

  This is 10⁻⁵ at τ = 10⁻⁴ with u_L ≤ 0.033.
- **The trade-off is benign here.** Heavy coordinates are never treated jointly, so lowering τ only extends the Ψ-table
  down to c = √τ = 0.01. It does not enlarge any joint problem. **Choose τ = 10⁻⁴: light error ≤ 10⁻⁵.**
  - This replaces the Gaussian-replacement error of §3.1, ≈ 9τu_L. The deletion error is about 3 times smaller and,
    unlike it, is not cancelled against costs hidden elsewhere.

**(ii) Heavy coordinates one at a time.**
- Each heavy coordinate is a single-coordinate problem: 15 companions plus ν₃, ν₅, and two background parameters
  (u, and the background's companion noise, which matters little).
- **Its dimension does not depend on τ.** The joint heavy problem is never solved. The worst sequence follows by dynamic
  programming over the background energy: V(u) = max(0, max_c[Ψ(c, u) + V(u + c²)]).

**(iii) The interaction I.** Numerically I is between 0 and +3·10⁻⁶ on the whole family N = 2–40 (§2.3). It is positive,
so the Gaussian-background telescoping underestimates by at most about 3·10⁻⁶.

**(iv) The cap.** cap ≈ V(0) + I_max + grid slack.
- **Caveat (§2.4).** Ψ also depends on the background's companion noise. A spike's Gaussianised companions smooth |·|
  for later spikes, so the DP state must include the even-charge companion aggregates.
- With the background at the one-spike companion level, the one-variable DP gives 1.58e-4, which is not attained.
- Exact symmetric configurations built from the stage-optimal vectors reach 8.2e-5 (t = 0.87).

---------------------------------------------------------------------------------------------------------------------

## 4. Certification plan for the spike layer (Q4)

**Scope.** The additive spike class on the flank rows t ∈ [0.86, 0.886], with the Gaussian bulk. Cross-coordinate
structures are a separate item (4.6).

**4.1 Paper pieces (P, short; done here in outline).**
- The r-reduction, §1.2(a).
- The telescoping inequality with ν and the bulk re-optimised at every stage, §1.2(e).
- The charge selection rules, §1.2(d). Only companions of even remote charge couple to the spike at third order, so the
  certified single-coordinate problem can drop or merely bound the rest.
- The light-coordinate sign Ψ ≤ 0 below c_*, a consequence of the certified table 4.2.

**4.2 The certified table Ψ̄(c, u, w) ≥ Ψ(c, u, w).** This is the main computation, on cells c ∈ [0.02, 0.10] ×
u ∈ [0, 0.05] × w, at each row of a t-cover of [0.86, 0.886].
- w is the background's companion aggregate: 2–3 numbers, the Gaussianised energies of the even-charge companion
  types (2,2), (1,1), (3,1)/(2,0).
- §2.4 shows that w moves Ψ by several 10⁻⁶ per spike.
- The DP state becomes (u, w), and each added coordinate moves w by its own companion energies.

Per cell:
- (a) **Concavity in the companions.** The integrand is convex in the companion vector d; the costs are −|d_s|²/η
  (quintic, 3.55) and −|d_s|²/ε₁ (cubic, 1.18).
  - Concavity holds if the curvature E[|∂_dX|²·(1/(2|a + Y|))] stays below the cost for every direction.
  - The quintic margin is comfortable: E[1/(2|a|)] ≈ 1.5 at f = 1.
  - **The cubic charge-0 and charge-2 directions must be checked** (z₁(|z_j|² − 1), z̄₁z_j²). If they are not concave,
    a small branch-and-bound over those 2 complex coordinates is needed.
- (b) **A dual bound at the numerical maximiser d̂:** sup ≤ f(d̂) + ½gᵀM⁻¹g, with g the certified gradient and M the
  concavity margin.
- (c) **Lipschitz bounds in (c, u) and in t** to cover the cell.
- **Integrals.** Per r, a 2-D integral over z_j of R(a + X(z); Σ_G), where R(b; Σ) = E|b + G_Σ| is the mean modulus of
  a 2-D Gaussian: Rice/Bessel in closed form if circular, otherwise a 1-D integral.
  - About 200 r-nodes × 3000 z-nodes suffice for 10⁻⁷ (the convergence study in §2.1).
  - Per cell: about 10⁶ interval special-function evaluations, times (value + gradient + curvature bound).
- **Cells.** About 16 × 10 per row in (c, u), times about 5–10 in w, and 3–4 rows: roughly 3000–6000 cells, so
  10¹⁰–10¹¹ interval evaluations. **Estimate: 300–3000 CPU-hours with Arb.** That is several node-cap rows. The Rice
  function needs a new verified kernel for a Lean port.

**4.3 The interaction bound |I| ≤ I₀.** Numerically I ∈ [0, 3·10⁻⁶] (§2.3). Two routes:
- (a) **Second-order Lindeberg** on the Gaussian-smoothed potential, with the smoothing taken from the certified
  background energy. A loose constant (factor 3–5) is affordable, since only I₀ ≈ 10⁻⁵ is needed.
- (b) **A cluster expansion.** Certify the pair term on a coarse grid; it is a two-coordinate problem, which is
  `k2.py`/FFT in a Gaussian background. Bound the higher clusters geometrically: in §2.3 the k-th swap increment grows
  linearly in k with slope ≈ 5·10⁻⁸ to 1.5·10⁻⁷, so pairs dominate.

This is the one genuinely analytic piece. Route (a) is preferred if its constants close.

**4.4 Dynamic programming.** V(0) from Ψ̄ by an exact max-plus recursion on a u-grid, with monotone rounding. Trivial
cost.

**4.5 The pieces it replaces.** K₅ on the flank rows; the "heavy + Gaussian bulk" reduction (not needed); generic
invariance principles (not needed).

**4.6 Open: cross-coordinate structures.**
- Two-coordinate cubics such as z_i²z̄_j and their quintic companions (k5's full d = 3 family) are not additive. The
  exact N = 2 value is in §2.5.
- They need either (a) a pair-cluster version of 4.2, where the added unit is a coordinate together with its cross terms
  to one earlier coordinate (a four-real-dimensional single-step problem, about 30× the cost of 4.2), or (b) an
  argument that cross structures are dominated by the remote-law layer. Their companions are cross terms too, so (b)
  needs the multi-grade fibre machinery of #453 item 3.

**4.7 Budget.** Certified cap ≈ V(0) + I₀ + grid slack (5·10⁻⁶) + cross structures; numbers in §5.

---------------------------------------------------------------------------------------------------------------------

## 5. What it adds up to (N)

**Size of the spike channel (exact values, additive class).**

| row | one spike | best symmetric many-spike value found | heavy maxima k = 2, 3, 4 (t = 0.87) |
|---|---|---|---|
| t = 0.86 | 1.95·10⁻⁵ | 8.90·10⁻⁵ (k5 N = 10 vector, unoptimised); 8.37·10⁻⁵ (N = 8) | — |
| t = 0.87 | 1.755·10⁻⁵ | **8.21·10⁻⁵** (N = 12, §2.4); k5 candidates 7.4–8.0·10⁻⁵ | see §2.6 |
| t = 0.88 | 1.50·10⁻⁵ | about 0.85 × the t = 0.87 value (by the one-spike ratio) | — |

- t = 0.86 is the worst flank row, about 12–14 % above t = 0.87 on the same configurations.
- Cross-coordinate clusters add about 0.9·10⁻⁵ at two coordinates (§2.5).
- Non-symmetric profiles: §2.6.

**Answer to "can the total cap be certified below about 1.2·10⁻⁴?"**
- The additive class alone at t = 0.86 is about 9·10⁻⁵ by the symmetric family. A consistent mean-field programme may
  add 1–2·10⁻⁵ for graded profiles (§2.6).
- The certificate adds the interaction allowance (≤ 3·10⁻⁶ numerically, perhaps 10⁻⁵ with a provable constant) and grid
  slack (about 5·10⁻⁶).
- Cross-coordinate structures add ≥ 10⁻⁵.
- **Estimate: a certified cap of 1.1–1.3·10⁻⁴.** 1.2·10⁻⁴ is reachable only if the cross-coordinate structures can be
  capped near their two-coordinate value, the interaction bound is tight, and the t-cover is fine near t = 0.86.
- **The posed architecture (heavy joint + Lindeberg light) cannot reach it at any τ (§3.1).** The telescoping
  architecture can, in principle (§3.2, §4). Its main costs are the certified Ψ-table with the background's companion
  aggregates as extra state variables, and the interaction bound.

---------------------------------------------------------------------------------------------------------------------

## 6. Files

All files are in this folder.

| file | contents |
|---|---|
| `spk.py` | core: rows, the 16 per-coordinate Wick columns, quadratures, per-coordinate terms, costs |
| `k1.py`, `k1scan.py`, `conv1.sh`, `conv2.sh` | one heavy coordinate, exact (with bulk), the Ψ(c, 0) scan, the grid-convergence study |
| `k2.py`, `k2eval.py` | two heavy coordinates by outer sums (cross columns optional, with their C-coupling); exact values of k5's d = 3 candidates |
| `fftev.py`, `val1.py` | the Fourier evaluator (k exact + N − k Gaussianised + bulk, adjoint gradient) and its validation against `k1.py` |
| `mspk.py`, `dels.py`, `mgroup.py`, `kred.py` | many-spike values, replacement and deletion profiles, polishing; non-symmetric group profiles; reduced-family heavy maxima (log: `logs/kred_t87.log`) |
| `swap.py`, `meanfield.py` | Ψ(c, u) in Gaussian backgrounds; the telescoping dynamic programme |
| `collect.py` | summary of the JSON results |
| `big_logs/`, `big_res/` | logs and JSON from the big droplet (`/root/claude-b9ee-spike-layer`, deleted after copying) |
| `res/` | local JSON (one-spike optima per row, the extended-Gaussian check) |
