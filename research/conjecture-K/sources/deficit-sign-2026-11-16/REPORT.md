<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/deficit-sign-2026-11-16/REPORT.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
<!-- Saved by claude-b9ee on 16 November 2026 from the final message of its research worker, which was not allowed to write this file itself. The text is the worker's; its summary is placed as section 0, and "as you stated it" there reads "as stated in the brief". -->

# The sign of the same-variance deficit of a cubic chaos: the split of Theorem 5, exact structures, one new class

Research sub-agent of claude-b9ee, 16 November 2026, 14:20–16:55 Europe/Bucharest. Folder: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/deficit-sign-2026-11-16/`.

**Labels** (ledger §0). **P**: complete written proof here, author only. **C**: exact rational computation with a replay script, always on instances; the proofs carry the statements. **N**: floating point; a search gives lower bounds on a supremum only.

Notation of `antiholomorphic-stein-2026-11-17/package/NOTE.md`: q ∈ H₂,₁(ℂⁿ), u = E|q|², V = |q|², F_k = ∂̄_kq, a = Σ_j ∂_jq·∂̄_jq, c₁ = Σ|∂_jq|², c₂ = |F|², δ = E V² − 2u², χ = δ/u², K = Eφ(· + uτ), γ = (K(0) − K)/v, T₁ = −E[(c₂ − u)K′(V)], T₂ = E[Re(q̄²a)γ′(V)], D_φ = T₁ + T₂.

New here: J = c₁ − c₂; W_k = (F·∇)F_k = Σ_j F_j∂_jF_k; b = Σ_k F̄_kW_k = Σ_j F_j∂_jc₂.

Profiles: √v; Gaussian buffers φ_σ(v) = 2E|σW + √v| (φ₀ = 2√v); the peak profile (table `tab_peak.npz`, copied from the package's review); exponentials e_λ = 1 − e^{−λv}.

## 0. Summary

**Conjecture (C) as stated in the brief is false.** For φ = 1 − e^{−30v} and H = X[(|X|²−2) + i(|Y|²−1)]/√3, E e^{−30|H|²} = 0.0306073 < 1/31 (N; this is ledger §13 item 5). The right class is Gaussian-mixture profiles (√v, every buffer, every row by ledger 2.7).

**Question 1 (N).**
- √v: T₁ > 0 everywhere tested; **T₂ ≥ 0 is false**. On H₂,₁(ℂ²), T₁/D ∈ [0.561, 1.0015] and T₂/D ∈ [−0.00146, 0.439].
- Witness: q = cos θ·X²Ȳ/√2 + sin θ·X(|X|²+|Y|²−3)/√3 at θ = 0.2 has T₂ = −1.3287·10⁻⁴ (three grids), D = 0.24556.
- Peak row (u = 0.0463): T₁/D ∈ [0.5865, 1], T₂/D ∈ [0, 0.4135], with T₂ = 0 exactly when a ≡ 0.
- Exponential profiles: both signs fail.

**Proved (P, author only; exact instance checks C all pass).**
1. Rotation identity: E f(V) − f(0) = E[J f′(V)], J = Σ_j(|∂_jq|² − |∂̄_jq|²). Hence D_φ = −Cov(J, K′(V)), the Stein kernel of √(2/u)·Re q is E[J|F]/u, and C_F(α) = Cov(J/u, e^{−t}I₀(t)) with t = αV/u.
2. Every Lemma 1 split with G = q̄γ(V) is [D − sT₂] + sT₂, so for √v none has two signed terms.
3. P₃,₁(q²) = 0 ⇔ a ≡ 0 ⇔ DF·F ≡ 0. Then |q|² given c₂ = |∂̄q|² is exactly exponential, so D_φ = B_φ(u) − E B_φ(c₂) ≥ 0 for every concave φ, and every first-chaos content vanishes.
4. **Theorem H.** If q vanishes on a complex hyperplane (q = αX(|X|²−2) + X²·conj(ℓ(Y)) + X·Q(Y) + X̄·F(Y)), then for every σ ≥ 0, √π·√(σ²+u) − 2E|σW+q| ≥ |α|²a_σ + ‖ℓ‖²b_σ with explicit a_σ, b_σ > 0.
   - So D(q) > 0 at every row and energy, in every dimension.
   - The class contains the Wick monomial, every one-driver cubic (including the Laplace counterexample), H(X)+H(Y), and every trace-free cubic of ℂ².
   - General cubics get an explicit linear criterion in six component norms; the real analogue covers reflection-odd cubics at every buffer.
5. Exact comparison with the decoupled surrogate ⟨w, ∂̄q⟩: D_φ = 𝒥 + E[w₁·Re(q̄²a)] + E[w₂·Re(q̄b)], where 𝒥 = B_φ(u) − E B_φ(c₂) ≥ 0, w₁, w₂ ≥ 0 are explicit, and b = Σ_k F̄_k(F·∇)F_k. Also a path formula and a low-chaos identity.
6. Local content representation: E[ȳ_e q h(V)] = E[ȳ_e(k_v·q̄a + k_c·b)], k(v,c) = E h(v+cτ). The content is linear in (a, W) alone; c₂ − u drops out.

**Numerical (N).**
- Peak row: 𝒥, E[w₁Re(q̄²a)] and E[w₂Re(q̄b)] are all ≥ 0 on everything tested (two-variable searches: minima 0 at a ≡ 0; three variables: two starts). So D ≥ 𝒥 there.
- For √v and small buffers the last two terms go negative, so I found no split with signed terms for √v.
- The one-coordinate bound covers every sampled two-variable cubic (sup ≈ 0.986 for √v) and fails from n = 3.
- Local content Cauchy–Schwarz at the package's obstruction cubic: 0.128·D, against 0.173 (Theorem 4 with true norms) and 0.229; its own sup is ≥ 0.162, so it does not reach 0.15 either.

**False (witnesses in §7):** (C) for all Bernstein profiles; T₂ ≥ 0 for √v; T₁, T₂ ≥ 0 for exponentials; decoupling with constant one for √v; mean-residual-life and pointwise-Fourier forms; the smoothing sign via one-coordinate bounds.

**Next step.** Prove the two weighted contractions ≥ 0 for buffered weights (σ² ≥ c·u; numerically c ≈ 1 for both, 0.3 for their sum) using the low-chaos identity. That gives D ≥ 𝒥 at the peak row in every dimension, and with item 6 turns the content lemma into C² ≤ κ(D − 𝒥) on the pair (a, W).

## 1. Method

- `dslib.py`: cubics as tensors (q = Σ t_ijk y_iy_jȳ_k − 2Σ_j(Σ_i t_iji)y_j, E|q|² = 2‖t‖²), fields (V, c₁, c₂, Re q̄²a), gauge-reduced grids, profiles with K′, γ′. `dsn.py`: chunked three-variable grids and Monte Carlo. `hyper.py`: one-coordinate bounds.
- Every table re-checks Theorem 5 by direct quadrature.
- References: Wick monomial by 1-D adaptive quadrature (D_√ = 0.19540560, T₁ = 0.11615220, T₂ = 0.07925340); the package's D/δ = 0.1340 (u = 0.0463) and 0.2292 (u = 0.02) are reproduced.
- Accuracy: 10⁻⁷–10⁻⁴ relative in two variables (1.2·10⁶ points), 10⁻⁴–4·10⁻³ in three (6.7·10⁶ points).
- Exact checks: `x01_exact_identities.py`, `x02_exact_lowchaos.py` (with a verbatim copy of the package's `wick_exact.py`); all PASS.

## 2. The rotation identity (P + C)

**Proposition 2.1.** If N₁q = p·q, N₂q = p′·q, m = p − p′ (m = 1 on H₂,₁), then for f ∈ C²[0,∞) of polynomial growth

    m·(E f(V) − f(0)) = E[J·f′(V)],   J = Σ_j(|∂_jq|² − |∂̄_jq|²).          (2.1)

*Proof.* Lemma 1's two forms are p′E[Gq] = Σ_jE[∂_jG·∂̄_jq] and pE[Gq] = Σ_jE[∂̄_jG·∂_jq]. Subtract, with G = q̄γ(V), γ = (f − f(0))/v. The integrand is γJ + q̄γ′·q·J = J·(vγ)′(V). ∎

N₁ − N₂ generates the gauge rotation. On the Wick monomial J = dV/dr. C: (J1), k ≤ 4.

**Corollary 2.2.** E[J | V = v]·p_V(v) = P(V > v): the conditional mean of J is the inverse hazard rate of |q|². So (2.1) is law-level; what it adds is the pointwise representative J.

**Corollary 2.3.** D_φ = −E[(J − u)K′(V)] = −Cov(J, K′(V)). For every real θ, with s = (1 + θ)/2,

    D_φ = −E[(θc₂ + (1 − θ)c₁/2 − u)K′(V)] + s·T₂.                              (2.3)

θ = 1 is Theorem 5, θ = 1/3 the real Stein identity, θ = −1 the first formula. So every split from Lemma 1 with G = q̄γ(V) is [D − sT₂] + sT₂.

**Corollary 2.4.** E[q·g(Re q)] = ½E[J·g′(Re q)] and E[a + 2c₂ − c₁ | Re q] = 0. So F = √(2/u)·Re q has Stein kernel E[J | F]/u, and

    C_F(α) = E[(Γ − 1)e^{−αF²}] = E[(J/u − 1)·ι(αV/u)],   ι(t) = e^{−t}I₀(t),
    u·C_F(α) = E[(V − u)ι(t) + V e^{−t}I₁(t)],  t = αV/u.

*Proof.* Lemma 1 with G = g(Re q): E[gq] = ½E[g′(a + c₂)] = ¼E[g′(a + c₁)]; take twice the second minus the first; then average over the gauge. ∎

C: (J2), (J3). N (`t11_smoothing_J.log`): the two evaluations agree to 10⁻⁶; C_F < 0 for α ∈ [0.01, 300] on five cubics. The law-only kernel is codex-c7e2's "buffered inverse-moment" kernel; the J representation I did not find in the record.

**Corollary 2.5.** With N(λ) = (1 + λu)E e^{−λV} − 1 = −λCov(J, e^{−λV}) (N = λ²δ/2 + O(λ³); N(∞) = u·p_V(0) − 1):

    D_{φ_σ} = π^{−1/2}∫₀^{1/σ²} N(λ)λ^{−3/2}(1 − λσ²)^{1/2}(1 + λu)⁻¹ dλ,
    u·C_F(α) = −π⁻¹∫₀^{2β} N(λ)λ^{−3/2}(2β − λ)^{−1/2} dλ,   β = α/u.

E|q| = ½E[J/|q|] when the right side is integrable. The Laplace order, the buffer deficits and the smoothing sign are three families of positive functionals of N.

## 3. Question 1 (N)

### 3.1 Families (`t06_families.log`, `t07_sums_fourier.log`)

√v at u = 1; peak at u = 0.0463.

| cubic | χ | √v: D | T₁/D | T₂/D | peak: D | T₁/D | T₂/D |
|---|---|---|---|---|---|---|---|
| Wick monomial | 42 | 0.19540 | 0.594 | 0.406 | 1.2063·10⁻² | 0.607 | 0.393 |
| Z₀²·conj(Z₁) (a ≡ 0) | 10 | 0.25956 | 1.000 | 0.000 | 6.6065·10⁻³ | 1.000 | 0.000 |
| Z₀Z₁·conj(Z₂) (a ≡ 0) | 6 | 0.1892 | 1.00 | 0.000 | 4.6315·10⁻³ | 1.000 | 0.000 |
| H(Z₀) + H(Z₁) | 21 | 0.17930 | 0.653 | 0.348 | 8.7157·10⁻³ | 0.589 | 0.411 |
| item-5 cubic | 21.33 | 0.14616 | 0.915 | 0.085 | 8.2201·10⁻³ | 0.721 | 0.279 |
| X(\|Y\|²−1) | 16 | 0.23417 | 0.632 | 0.368 | 7.9401·10⁻³ | 0.650 | 0.350 |
| X(\|X\|²+\|Y\|²−3) | 26.67 | 0.18965 | 0.568 | 0.432 | 9.4566·10⁻³ | 0.590 | 0.410 |
| cyclic n = 2 | 13 | 0.2765 | 0.734 | 0.263 | 7.6358·10⁻³ | 0.598 | 0.402 |
| cyclic n = 3 | 6 | 0.18377 | 0.883 | 0.117 | 4.5660·10⁻³ | 0.817 | 0.183 |
| cyclic n = 5 (MC 3·10⁶) | 3.66 | 0.1309(4) | 0.848 | 0.155 | 3.09(6)·10⁻³ | 0.808 | 0.206 |
| H(Z₀)+H(Z₁)+H(Z₂) | 14 | 0.16018 | 0.642 | 0.358 | 6.9944·10⁻³ | 0.579 | 0.421 |
| Z₀(\|Z\|²−4), n = 3 | 20 | 0.18646 | 0.551 | 0.448 | 8.0865·10⁻³ | 0.578 | 0.422 |
| 12 random, n = 3 | 8.0–13.3 | 0.152–0.203 | 0.747–0.860 | 0.140–0.254 | 5.4–6.6·10⁻³ | 0.659–0.785 | 0.215–0.340 |

Identity error ≤ 3·10⁻⁴ in two variables (cyclic n = 2: 3·10⁻³, √v only), ≤ 4·10⁻³ in three.

Sums of N independent Wick monomials, √v, by an exact Hankel formula (formulas in the script header; N = 1 reproduces the direct values, N = 8 the Monte Carlo 0.1097(4), 0.612, 0.386):

| N | 1 | 2 | 3 | 4 | 6 | 8 | 12 | 16 | 24 | 32 | 64 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| E\|q_N\| | 0.69082 | 0.70694 | 0.72607 | 0.74039 | 0.76156 | 0.77662 | 0.79708 | 0.81058 | 0.82767 | 0.83820 | 0.85792 |
| D | 0.19540 | 0.17928 | 0.16016 | 0.14583 | 0.12467 | 0.10960 | 0.08915 | 0.07564 | 0.05856 | 0.04802 | 0.02831 |
| T₁/D | 0.594 | 0.653 | 0.642 | 0.634 | 0.622 | 0.613 | 0.600 | 0.591 | 0.579 | 0.571 | 0.555 |
| T₂/D | 0.406 | 0.348 | 0.358 | 0.366 | 0.378 | 0.387 | 0.400 | 0.409 | 0.421 | 0.429 | 0.445 |

The Gaussian limit of T₁/D is 11/21 = 0.524.

### 3.2 Searches over H₂,₁(ℂ²) (`search_n2_*.log`)

BFGS then Nelder–Mead on 5.8·10⁴ points, re-evaluated on 1.2·10⁶.

| profile | objective | starts | value at every start | χ |
|---|---|---|---|---|
| √v | min T₂/D | 4 | **−0.00146** (−0.00143, −0.00146, −0.00142, −0.00146) | 12.8–12.9 |
| √v | min T₁/D | 3 | **+0.5610** | 22.3 |
| peak | min T₂/D | 5 | **0.0000**, at X²Ȳ up to unitary equivalence | 10.00 |
| peak | min T₁/D | 4 | **+0.5865** | 21.9 |

The √v minimiser (tensor in `search_n2_sqrt_T2.json`, start 1) on three independent grids (`t03_check_min.py`): T₂ = −3.34354, −3.34385, −3.34268·10⁻⁴; D = 0.2291048. It is close to a ≡ 0 (E Re q̄²a = 1.485 against δ = 12.85).

**Explicit witness (`t10_T2_witness.log`).** q_θ = cos θ·X²Ȳ/√2 + sin θ·X(|X|²+|Y|²−3)/√3 has T₂ < 0 for 0 < θ ≤ 0.275. T₂/D = −2.55·10⁻⁴, −5.41·10⁻⁴, −3.21·10⁻⁴ at θ = 0.1, 0.2, 0.25, and +4.2·10⁻⁴ at 0.3. At θ = 0.2 the three grids give T₂ = −1.32869, −1.32866, −1.32830·10⁻⁴. This q vanishes on {X = 0}, so D > 0 is proved for it (§5).

**Why (`t04_hessian_a0.log`).** T₂ vanishes on {a ≡ 0}. Its first variation vanishes at every decoupled cubic Σ_k W̄_kF_k(Y): the integrand has W-charge ≥ 1 (P; C: (H1)). At q₀ = X²Ȳ/√2 the second variation along p = X(|X|²+|Y|²−3)/√3, the one direction of its torus block transversal to the U(2)-orbit, divided by D(q₀), is:

| √v | σ² = 0.01u | 0.03u | 0.1u | 0.3u | u | 4u | peak 0.0463 | peak 0.2 | peak 1 | peak 5 |
|---|---|---|---|---|---|---|---|---|---|---|
| **−0.0290** | **−0.0170** | +0.0024 | +0.055 | +0.159 | +0.374 | +0.769 | +0.817 | +0.464 | +0.200 | +0.058 |

The other blocks are positive (0.25–1.77). So T₂ ≥ 0 fails only for small buffers (σ² ≲ 0.027u at this point).

**Three variables, peak (`t05_*_peak.log`, `t05b_wxy_peak.log`).** Hessians of T₂ at W̄XY and W̄(X²+Y²): 22 eigenvalues in [0.44, 1.97]·D and 14 in [−6·10⁻³, 1.3·10⁻²]·D. The two lowest directions at W̄XY, re-evaluated directly, give +5.0·10⁻⁴ (scaling like ε⁴) and +1.3·10⁻⁴. No negative direction beyond the noise of the finite-difference assembly.

### 3.3 Exponential profiles (`t00_sanity.log`)

| cubic | λu | D_λ | T₁ | T₂ |
|---|---|---|---|---|
| monomial | 1 | +0.17266 | +0.11734 | +0.05532 |
| monomial | 30 | +0.02986 | **−0.02498** | +0.05484 |
| item-5 | 3 | +0.1031 | +0.1254 | **−0.0223** |
| item-5 | 10 | +0.0112 | +0.0444 | **−0.0333** |
| item-5 | 30 | **−0.00165** | +0.0140 | −0.0156 |
| item-5 | 100 | **−0.00096** | +0.0042 | −0.0051 |

### 3.4 Answer

- T₁ ≥ 0 and T₂ ≥ 0 separately: true (N) at the peak row and for σ² ≳ 0.03u; false for √v (T₂, by at most 1.5·10⁻³·D found).
- T₁ ≥ 0 alone says only T₂ ≤ D; it does not give D ≥ 0.
- By (2.3) no other member of that family helps. §6 has the split that works at the peak.

## 4. The class P₃,₁(q²) = 0 (P + C)

**Theorem 4.1.** For q ∈ H₂,₁, F = ∂̄q, these are equivalent: (1) P₃,₁(q²) = 0; (2) a ≡ 0; (3) q² ∈ H₄,₂; (4) DF(y)F(y) ≡ 0.

If they hold, then conditionally on c₂ = |F|², V is exponential with mean c₂. Consequently, for every concave φ, D_φ = B_φ(u) − E B_φ(|∂̄q|²) ≥ 0, T₂ = 0, T₁ = D, N(λ) = λE[(u − c₂)/(1 + λc₂)] ≥ 0, the smoothing sign holds, and (Prop. 6.4) every content Π₁[q·h(V)] vanishes.

*Proof.*
- (1)⇔(4): Theorem 2(c), ¼‖P₃,₁q²‖² = Σ‖W_k‖².
- (2)⇔(3): Theorem 2(a).
- (2)⇒(1): a = P₂,₀q² + ½P₃,₁q².
- (4)⇒(2): a = Σ_kȳ_kW_k − (F·∇)div F. F is quadratic, so F(y+z) = F(y) + DF(y)z + F(z). Differentiating DF(y)F(y) = 0 gives DF(F(y)) + DF(y)² = 0; applied to F(y), F(F(y)) = 0. So F(y + tF(y)) = F(y), and Φ_t = id + tF is a polynomial automorphism with inverse Φ_{−t}. Its Jacobian det(I + tDF) is a zero-free polynomial with polynomial reciprocal, hence ≡ 1, so tr DF = div F ≡ 0 and a ≡ 0.
- Conditional law: Lemma 1 with G = q̄γ(V)h(c₂) gives Σ_j∂_jG·F_j = h(c₂)c₂(vγ)′(V) + q̄²aγ′h + q̄γh′b = h(c₂)c₂(vγ)′(V). With γ = (1 − e^{−λv})/v: E[e^{−λV} | c₂] = 1/(1 + λc₂). ∎

C: (A0), (A1) on X²Ȳ, XYW̄, (X²+cY²)W̄, X²·conj(Y+2iW): E[V^kc₂^m] = k!·E[c₂^{k+m}].

The class contains every decoupled cubic Σ W̄_kF_k(Y). Whether it is strictly larger (quadratic quasi-translations not decoupled after a unitary change) I did not settle.

## 5. Cubics vanishing on a hyperplane (P; N checks)

### 5.1 Components relative to a direction

For a unit e, X = ⟨e, y⟩, r = |X|², every cubic is uniquely

    q = αX(|X|²−2) + X²·conj(ℓ(Y)) + (|X|²−1)L(Y) + X·Q(Y) + X̄·F(Y) + R(Y)
           (a)            (b)               (c)          (d)       (e)      (f)

Put A = |α|², B = ‖ℓ‖², L₂ = ‖L‖², C = ‖Q‖² + ‖F‖², R₂ = ‖R‖². The component norms are n_a = 2A, n_b = 2B, n_c = L₂, n_f = R₂, and u = 2A + 2B + L₂ + C + R₂. The Y-factors are pairwise orthogonal, so

    V̄_e(r) := E[|q|² | X] = r[A(r−2)² + Br + C] + L₂(r−1)² + R₂.           (5.1)

q vanishes on {X = 0} iff L = R = 0.

### 5.2 Tangent inequality

For concave φ, φ(V) ≤ φ(E) + φ′(E)(V − E) pointwise. With E = u·r (exponential, Eφ(E) = B_φ(u)):

    D_φ(q) ≥ −E_r[φ′(ur)(V̄_e(r) − ur)] = A·a_φ + B·b_φ + L₂·c_φ + R₂·d_φ,     (5.2)
    a_φ = −E_r[r(r²−4r+2)φ′(ur)],  b_φ = E_r[r(2−r)φ′(ur)],
    c_φ = −E_r[(r²−3r+1)φ′(ur)],   d_φ = E_r[(r−1)φ′(ur)].

Also D_φ ≥ B_φ(u) − E_rφ(V̄_e(r)) (Jensen), which is sharper. For φ′ = e^{−λv}, μ = λu:

    a = 2μ(2−μ)/(1+μ)⁴,  b = 2μ/(1+μ)³,  c = μ(1−μ)/(1+μ)³,  d = −μ/(1+μ)².      (5.3)

b_φ ≥ 0 for every concave φ; d_φ ≤ 0 always. Bernstein form of the buffers (from |z| = (2√π)⁻¹∫(1 − e^{−s|z|²})s^{−3/2}ds, λ = s/(1+sσ²)):

    φ_σ′(v) = π^{−1/2}∫₀^{1/σ²} λ^{−1/2}(1 − λσ²)^{1/2}e^{−λv} dλ.               (5.4)

**Lemma 5.1.** If φ′ = ∫λ^{−1/2}w(λ)e^{−λv}dλ with w ≥ 0 nonincreasing, w ≢ 0, then a_φ(u) > 0.

*Proof.* a_φ = 2u^{−1/2}∫f(μ)w(μ/u)dμ with f = μ^{1/2}(2−μ)(1+μ)⁻⁴, which is ≥ 0 on [0,2] and ≤ 0 after. So f·w(·/u) ≥ f·w(2/u), and ∫f·w ≥ w(2/u)·∫₀^∞f = w(2/u)·B(3/2, 5/2) = w(2/u)·π/16. If w(2/u) = 0, the support lies in [0, 2/u], where f ≥ 0. ∎

### 5.3 Theorem H

Let q vanish on a complex hyperplane: q = αX(|X|²−2) + X²·conj(ℓ(Y)) + X·Q(Y) + X̄·F(Y). For every σ ≥ 0,

    √π√(σ²+u) − 2E|σW + q| ≥ |α|²a_σ(u) + ‖ℓ‖²b_σ(u) ≥ 0,
    a_σ = π^{−1/2}∫₀^{1/σ²}λ^{−1/2}(1−λσ²)^{1/2}·2μ(2−μ)(1+μ)⁻⁴dλ > 0,
    b_σ = π^{−1/2}∫₀^{1/σ²}λ^{−1/2}(1−λσ²)^{1/2}·2μ(1+μ)⁻³dλ > 0   (μ = λu).

Hence D_φ(q) ≥ 0 for every φ = 2E|L + √v| with L a Gaussian scale mixture (ledger 2.7: every row, every energy). It is strict unless α = 0 and ℓ = 0, in which case q is conditionally Gaussian.

*Proof.* (5.2) with L₂ = R₂ = 0, (5.3), (5.4), Lemma 5.1. ∎

At σ = 0: E|q| ≤ (√π/2)√(u − |α|²/4 − ‖ℓ‖²/2) by Cauchy–Schwarz under the weight |X|. For one-driver cubics, E|q| ≤ (√π/2)E_Y√(|Q − α/2|² + (3/2)|α|²).

**Remarks.**
1. *Contents of the class.* The monomial. Every X[α(|X|²−2) + Q(Y)] with Q arbitrary in any number of variables; codex-c7e2's certificate covers the stronger inverse-moment inequality for one such cubic in a box of radius 1/500. H(X)+H(Y), which vanishes on X = −Y. Every trace-free cubic of H₂,₁(ℂ²): v ↦ T(v,v,v̄) is a section of a degree-one line bundle over ℂP¹, so it has a zero; the cyclic cubic vanishes on Y = −X. Not in the class: H(X₁)+H(X₂)+H(X₃), generic cubics in n ≥ 3.
2. *Closure.* If q₂ is an independent circular Gaussian scale mixture, q + q₂ satisfies the same bound (apply the theorem at buffer σ² + R, then Jensen).
3. *Other profiles.* Only a_φ(u) ≥ 0 is needed. So on the class E e^{−λ|q|²} ≥ 1/(1+λu) for λ ≤ 2/u. If ‖ℓ‖² ≥ |α|² this holds for all λ, and then D_φ ≥ 0 for every Bernstein φ and the smoothing sign holds.
4. *Record.* At σ = 0 this is the complex form of GPT's reflection proof (`sources/third-chaos-2026-11-16/gpt/reflection_proof.tex`). New: the complex class (two extra components) and every Gaussian buffer.

**N (`t09_hyperplane_check.log`, `t18_tangent_general.log`).**
- Closed forms of a_σ, b_σ against quadrature: six digits for σ²/u ∈ [10⁻³, 10²].
- Peak profile: a(u), b(u) > 0 for u ∈ [10⁻⁴, 10²]. At u = 0.0463: (a, b, c, d) = (0.16678, 0.10030, +0.04316, −0.05713).
- True D ≥ Jensen ≥ tangent > 0:

| cubic | √v | σ² = u | peak 0.0463 |
|---|---|---|---|
| monomial | 0.19540 ≥ 0.19536 ≥ 0.05539 | 0.21990 ≥ 0.21990 ≥ 0.09792 | 1.2063·10⁻² ≥ 1.2063·10⁻² ≥ 3.861·10⁻³ |
| item-5 | 0.14616 ≥ 0.08781 ≥ 0.03693 | 0.16450 ≥ 0.12727 ≥ 0.06528 | 8.220·10⁻³ ≥ 6.935·10⁻³ ≥ 2.574·10⁻³ |
| H(X)+H(Y) | 0.17930 ≥ 0.02245 ≥ 0.01385 | 0.17770 ≥ 0.03694 ≥ 0.02448 | 8.716·10⁻³ ≥ 1.852·10⁻³ ≥ 9.65·10⁻⁴ |

- Seven random class members (n = 2, 3): all OK. 32 random (cubic, direction) pairs for the general chain (5.2): no violation.

### 5.4 General cubics

D_φ ≥ ½n_a·a_φ + ½n_b·b_φ + n_c·c_φ + n_f·d_φ for every direction e.
- For √v: D > 0 if n_a/16 + n_b/8 ≥ n_c/4 + n_f/2.
- At the peak (u = 0.0463): D > 0 if 0.0834n_a + 0.0501n_b + 0.0432n_c ≥ 0.0571n_f.

Coverage of the Jensen form (ratio = min_e E_rφ(V̄_e)/B_φ(u); "< 1" proves D > 0):

| n | profile | cubics | result |
|---|---|---|---|
| 2 | √v | 1500 random | mean 0.912, max 0.980, none ≥ 1 |
| 2 | √v | 4 local searches | sup ≥ 0.98570, 0.98556, 0.98577, 0.98581 |
| 2 | peak 0.0463 | 1500 random + 1 local | max 0.99846; sup ≥ 0.998596 |
| 3 | √v | 150 random | mean 0.992, 33 % ≥ 1 |
| 4 | √v | 100 random | all ≥ 1 |

So it appears to cover H₂,₁(ℂ²) and fails from n = 3: it does not see R(Y). For N equal monomials and the symmetric direction, R₂/u = (N−1)(N−2)/N².

### 5.5 Real analogue (P; N check `t14_real_check.log`)

ψ_σ(v) = E|σG + √v| has ψ_σ′ = (2√π)⁻¹∫₀^{1/(2σ²)}λ^{−1/2}e^{−λv}dλ. For h = a·He₃(X) + X·Q(Y), u = E h²:

    √(2/π)√(σ²+u) − E|σG + h| ≥ (6a²/√(πu))·∫₀^{u/(2σ²)} μ^{1/2}(2−μ)(1+2μ)^{−7/2} dμ > 0.

It uses E[e^{−μX²}X²(X⁴−6X²+3)] = 12μ(μ−2)(1+2μ)^{−7/2} and ∫₀^∞ = 2^{−5/2}·(2/3). So reflection-odd real cubics satisfy the radius bound at every Gaussian buffer. Twelve (cubic, σ) cases checked.

### 5.6 What the method cannot give

The smoothing sign is E h_β(V) ≤ 0 with h_β = G_β − u·ι(β·), concave. The tangent step needs A·E_r[h_β′(ur)r(r²−4r+2)] ≤ 0. For exponentials this is 2μ(μ−2)/(1+μ)³, and against the arcsine weight at β → ∞ it integrates to +π/8. The Jensen form fails with the same first-order term near the conditionally Gaussian corner (V̄ = Cr + A·r(r−2)², A/C → 0). So neither one-coordinate bound gives the smoothing sign on this class, except when ‖ℓ‖² ≥ |α|².

## 6. Comparison with the decoupled surrogate (P + C for identities, N for signs)

### 6.1 The split

q̃ = ⟨w, F(y)⟩, with w an independent Gaussian vector, is conditionally Gaussian with variance c₂. So

    D_φ = 𝒥 + Δ,  𝒥 = B_φ(u) − E B_φ(|∂̄q|²) ≥ 0 (Jensen),  Δ = Eφ(|q̃|²) − Eφ(|q|²).

For large buffers 𝒥 ≈ (|B″|/2)‖c₂ − u‖² and Δ ≈ (|B″|/4)(‖P₂,₀q²‖² + ‖P₃,₁q²‖²): the two parts of the budget of Theorem 2(d).

### 6.2 Exact comparison ("local form of Theorem 5")

**Proposition 6.1.** For f ∈ C² of polynomial growth and Γ_f(v,c) = E_τ[f(v + cτ) − f(cτ)]/v:

    E f(|q|²) − E f(c₂τ) = E[Re(q̄²a)·∂_vΓ_f(V,c₂)] + E[Re(q̄b)·∂_cΓ_f(V,c₂)].

Here E Re(q̄²a) = ‖P₂,₀q²‖² + ½‖P₃,₁q²‖² and E Re(q̄b) = Σ‖W_k‖² = ¼‖P₃,₁q²‖². For concave φ:

    D_φ = 𝒥 + E[w₁(V,c₂)Re(q̄²a)] + E[w₂(V,c₂)Re(q̄b)],
    w₁ = ∫₀¹ s·E_τ|φ″|(sv + cτ) ds ≥ 0,   w₂ = ∫₀¹ E_τ[τ|φ″|(sv + cτ)] ds ≥ 0.

*Proof.* Lemma 1 with G = q̄Γ(V,c₂): Σ_j∂_jG·F_j = c₂∂_v(vΓ) + q̄²a·∂_vΓ + q̄b·∂_cΓ. And vΓ − c∂_v(vΓ) = f(v) − E f(cτ), because K_c = E f(· + cτ) solves K_c − cK_c′ = f. ∎

For e_λ: E e^{−λV} − E(1+λc₂)⁻¹ = λ²{E[Re(q̄²a)ψ₁(λV)/(1+λc₂)] + E[Re(q̄b)ψ₀(λV)/(1+λc₂)²]}, with ψ₁(t) = (1 − (1+t)e^{−t})/t², ψ₀(t) = (1 − e^{−t})/t.

C: (LOC), φ = v², v³. N: `t16_local_form.log`, identity error ≤ 2·10⁻⁴ (cyclic n = 2: ≤ 4·10⁻³).

### 6.3 Decoupling path

**Proposition 6.2.** For q_θ = ⟨cos θ·y + sin θ·w, F(y)⟩ − cos θ·div F (u and c₂ fixed along the path):

    d/dθ Eφ(|q_θ|²) = 2 tan θ·E[(−φ″)(V_θ)Re(q̄_θ²a(q_θ))],
    Δ_φ = 2∫₀^{π/2} tan θ·W_{−φ″}(q_θ)dθ,   W_w(q) = E[w(V)Re(q̄²a)].

*Proof.* Integrate by parts in the rotated variable w̃ = −sin θ·y + cos θ·w. Only F and div F depend on it, holomorphically, and the div F terms cancel. ∎

C: (PATH). w ≡ 1 gives W ≥ 0; w = e^{−V} at u = 1 is negative (ledger 11.6).

### 6.4 Low-chaos identity

**Proposition 6.3.** For w ∈ H₂,₀ and H(v,c) ∈ C¹:

    ⟨w, q²(H − c₂∂_vH)(V,c₂)⟩ = ⟨w, (H + V∂_vH)·a + q·∂_cH·b⟩.

With H = E_τg(v + cτ): P₂,₀(q²g(V)) is linear in (a, b). (Lemma 1 with G = w̄qH(V,c₂).) C: (LC).

This is the structure a proof of W_w ≥ 0 near a ≡ 0 must use; plain Cauchy–Schwarz gives √(E Re q̄²a), not E Re q̄²a. The H₃,₁ half needs one more application; not written.

### 6.5 Local content representation

**Proposition 6.4.** For h ∈ C¹, k(v,c) = E_τh(v + cτ):

    E[ȳ_e·q·h(V)] = E[ȳ_e·(∂_vk(V,c₂)·q̄·a + ∂_ck(V,c₂)·b)]
                  = ⟨y_e q ∂_vk, a⟩ + Σ_k⟨y_eF_k ∂_ck, W_k⟩   (h real).

*Proof.* Lemma 1 with G = ȳ_e k(V,c₂); k − c∂_vk = h. ∎

Compared with Theorem 3, the field c₂ − u has disappeared. The content is linear in (a, W), with budget ‖a‖² + Σ‖W_k‖² = ‖P₂,₀q²‖² + ½‖P₃,₁q²‖², which is at most δ − 2‖c₂ − u‖². For h = v: Π₁[q|q|²] = Π₁[q̄a + b].

Corollary: the content vanishes for every cubic with P₃,₁(q²) = 0. Content and D − 𝒥 are linear in the same pair (a, W).

C: (LCON), h = v, v², v³.

N (`t17_local_content.log`, peak u = 0.0463, identity error 10⁻¹¹–10⁻⁶). Cauchy–Schwarz with the true component norms on H₂,₀, H₃,₁ (for a) and H₃,₀ (for W), over D:

| cubic | raw: C²/D | local bound | Theorem 4 | tilt 3/5: C²/D | local bound |
|---|---|---|---|---|---|
| monomial | 0.0876 | 0.0901 | 0.112 | 0.0114 | 0.0195 |
| O1 maximiser (package) | 0.0334 | **0.1275** | 0.229; 0.173 with true norms (review §5) | 0.0052 | 0.0266 |
| item-5 | 0.0755 | 0.1031 | — | 0.0111 | 0.0185 |
| H(X)+H(Y) | 0.0653 | 0.1448 | 0.153 | 0.0099 | 0.0294 |
| X(\|Y\|²−1) | 0.0410 | 0.1174 | 0.165 | 0.0061 | 0.0238 |
| X²Ȳ + 0.3H(X) | 0.0158 | 0.0160 | — | 0.0023 | 0.0024 |

The two pairings add constructively (0.3–0.6 and 0.4–0.8 of C). Search for the largest local bound over H₂,₁(ℂ²) (`t17b_*.log`): raw ≥ 0.16176 (two starts, χ = 20.4); tilt ≥ 0.0346. Theorem 4 reaches 0.229 and 0.048. So this Cauchy–Schwarz does not give 0.15 for the raw content either; what it gives is the smaller budget.

### 6.6 Signs (N)

13 two-variable cubics (`t12a_sqrt.log`, `t12b_jensen_split.log`):

| profile | 𝒥/D | Δ/D | sign of Δ |
|---|---|---|---|
| √v | 0.60…1.40 | −0.40…+0.40 | negative: monomial −0.328, item-5 −0.395 |
| σ² = 0.1u | 0.62…1.16 | −0.156…+0.38 | negative on the monomial and item-5 |
| σ² = 0.3u | 0.62…1.00 | 0…+0.38 | ≥ 0 on all (monomial +0.065, item-5 +0.012) |
| σ² = u, 4u | 0.48…1.00 | 0…+0.52 | ≥ 0 |
| peak u = 0.02, 0.0463, 0.2 | 0.40…1.00 | 0…+0.60 | ≥ 0 |

The three terms 𝒥/D, E[w₁Re q̄²a]/D, E[w₂Re q̄b]/D (`t16_local_form.log`):

| cubic | σ² = 0.1u | σ² = 0.3u | σ² = u | peak 0.0463 |
|---|---|---|---|---|
| monomial | 1.097, +0.084, **−0.181** | 0.936, +0.128, **−0.064** | 0.758, 0.174, 0.068 | 0.548, 0.259, 0.194 |
| item-5 | 1.157, **−0.068**, **−0.088** | 0.988, +0.017, −0.005 | 0.815, 0.094, 0.091 | 0.619, 0.187, 0.194 |
| H(X)+H(Y) | 0.826, 0.172, 0.002 | 0.738, 0.191, 0.071 | 0.620, 0.226, 0.155 | 0.462, 0.304, 0.235 |
| X(\|Y\|²−1) | 0.795, 0.248, −0.043 | 0.765, 0.231, 0.004 | 0.703, 0.227, 0.070 | 0.583, 0.263, 0.154 |

Searches at the peak (u = 0.0463):
- Over H₂,₁(ℂ²): min Δ/D = 0.0000 (6 starts), min of each local term = 0.0000 (1 start each), all at X²Ȳ.
- Three variables: min Δ/D = +3·10⁻⁵, +4·10⁻⁵ at a ≈ 0 (2 starts, `t15_Delta.log`).
- Weighted contraction with w = −φ″: W_w/(w(0)·E Re q̄²a) ≥ 0.091 on H₂,₁(ℂ²) (5 starts, minimum near the monomial). It is ≥ 0 on the test cubics for σ² ≥ 0.3u and slightly negative on item-5 for σ² ≤ 0.1u (`t13_*.log`).

So at the peak row D = 𝒥 + two terms, all three ≥ 0 on everything tested, the first one proved. For √v none of the splits found has signed terms.

## 7. False statements

| # | statement | witness | label |
|---|---|---|---|
| F1 | D_φ ≥ 0 for every φ with completely monotone derivative | φ = e₃₀, q = X[(\|X\|²−2) + i(\|Y\|²−1)]/√3: 0.0306073 < 0.0322581 (ledger item 5) | N, re-verified |
| F2 | T₂ ≥ 0 for √v | q_θ, θ = 0.2: T₂ = −1.3287·10⁻⁴; minimum found −1.46·10⁻³·D | N, three grids |
| F3 | T₁ ≥ 0, T₂ ≥ 0 for Bernstein profiles | monomial, λu = 30: T₁ = −0.0250; item-5, λu = 3: T₂ = −0.0223 | N |
| F4 | a Lemma 1 mixture with G = q̄γ(V) has two signed terms for √v | (2.3) and F2 | P + N |
| F5 | E[c₂ \| V] nondecreasing | F3 | N |
| F6 | mean residual life of V is ≥ u (would give the smoothing sign) | it implies N ≥ 0; N(300/u) = −0.108 for item-5 | N |
| F7 | decoupling with constant one for √v, E\|q\| ≤ E\|⟨w, ∂̄q⟩\| | monomial: 0.6908 > 0.6267 | exact |
| F8 | Δ ≥ 0, or both local terms ≥ 0, at small buffers | σ² = 0.3u: monomial second local term −0.064·D; σ² = 0.1u: Δ = −0.097·D | N |
| F9 | one-coordinate bounds give the smoothing sign on the hyperplane class | §5.6: first-order coefficient +π/8 | P |
| F10 | the one-coordinate Jensen bound gives the sharp radius for generic cubics in n ≥ 3 | 33 % of random three-variable cubics | N |
| F11 | e^{ut²/4}·E J₀(t\|q\|) nondecreasing (pointwise Fourier form, complex) | monomial: E J₀(5\|q\|) = −0.0774 | N, adaptive quadrature |
| F12 | Cauchy–Schwarz on (a, W) gives the raw content constant 0.15 | sup ≥ 0.1618 on H₂,₁(ℂ²), u = 0.0463 | N |
| — | Hessian eigenvalue −3.4·10⁻³·D at W̄XY (peak) | finite-difference artefact; direct value +5·10⁻⁴ | N |

## 8. Status

- **P (author only):** Prop. 2.1, Cor. 2.2–2.5, (2.3); Theorem 4.1; (5.1)–(5.4), Lemma 5.1, Theorem H with remarks, §5.4, §5.5, §5.6; Prop. 6.1–6.4; vanishing first variation of T₂ at decoupled cubics.
- **C (instances):** `x01_exact_identities.log`, `x02_exact_lowchaos.log`.
- **N:** every table.
- **Not done:**
  - interval certificates of anything;
  - split searches beyond two variables, except Δ (two starts in three variables) and two Hessians;
  - the H₃,₁ half of Prop. 6.3;
  - flank and upper rows numerically (Theorem H covers them through ledger 2.7);
  - whether {a ≡ 0} is strictly larger than the decoupled class.

## 9. Next steps

1. **Weighted contractions for buffered weights.** Prove E[w₁(V,c₂)Re(q̄²a)] ≥ 0 and E[w₂(V,c₂)Re(q̄b)] ≥ 0 for φ_σ with σ² ≥ c·u, then mix over σ for the peak row. Tools: Prop. 6.3 and its analogues (each such pairing becomes a quadratic form in (a, W) with bounded coefficients), Theorem 2(d), hypercontractivity. A qualitative "σ² ≥ C·u, universal C" looks reachable; the work is in bringing C down to what the row needs (numerically c ≈ 1 suffices for both terms, 0.3 for their sum). The result would be D ≥ 𝒥 ≥ 0 at the peak row in every dimension.
2. **Content lemma on the pair (a, W).** By Prop. 6.4 and 6.1, content and D − 𝒥 are linear functionals of the same pair, and the mixture field c₂ − u has dropped out of both. The target becomes C² ≤ κ·(D − 𝒥). Cauchy–Schwarz alone is not enough (F12).
3. **Use Theorem H for one-driver cores** (ledger 6.3.16–6.3.19, 3.6): it gives D > 0 with an explicit margin at every row for all of them.
4. **Two variables.** The one-coordinate Jensen ratio has sup ≈ 0.986 (√v); an interval certificate would give exact remote K on H₂,₁(ℂ²) at every buffer from a one-dimensional integral.
5. **Smoothing sign.** Open even for X[α(|X|²−2) + Q(Y)]; by §5.6 it needs the fluctuation of |Q|², not its mean.

## 10. Files

In `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/deficit-sign-2026-11-16/`. Run with `OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 /usr/local/bin/python3 -I <script>` from that folder; each script has a `.log` unless noted.

| file | content |
|---|---|
| `dslib.py`, `dsn.py`, `hyper.py` | library |
| `tab_peak.npz`, `wick_exact.py` | copied from the antiholomorphic package (review replay; scripts) |
| `x01_exact_identities.py`, `x02_exact_lowchaos.py` | C: (J1)–(J3), (L1), (L2), (A0), (A1), (H1); (LC), (PATH), (LOC), (LCON) |
| `t00_sanity.py`, `t01_zfamily.py` | evaluator checks, items 5 and 11.6, exponential profiles, z-family |
| `t02_search.py` (`search_n2_*.json/.log`), `t03_check_min.py` (no log) | searches of §3.2 and the three-grid re-evaluation |
| `t04_hessian_a0.py`, `t05_hessian_n3.py`, `t05b_refine.py`, `hess_n3_*.npy` | second variation of T₂ |
| `t06_families.py`, `t07_sums_fourier.py` | tables of §3.1 |
| `t08_onecoord.py`, `t08b_onecoord_n2.py`, `t09_hyperplane_check.py`, `t18_tangent_general.py`, `t14_real_check.py` | §5 |
| `t10_T2_witness.py`, `t11_smoothing_J.py` | witness of F2; J-form of the smoothing function |
| `t12_jensen_split.py`, `t13_weighted_contraction.py`, `t15_search_n3_peak.py`, `t16_local_form.py`, `t16b_local_search.py` | §6.1–6.3, 6.6 |
| `t17_local_content.py`, `t17b_local_content_search.py` | §6.5 |
