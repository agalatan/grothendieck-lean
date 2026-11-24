# P2. A global secant inequality for a two-dimensional Gaussian integral, with the right dependence on the amplitude

**Summary.** For an explicit family of functions (w, ρ_A, ρ_B) ↦ E_z|Y(z; w) + d(z; ρ)| of three complex parameters
(z one complex Gaussian; Y and d explicit polynomials in z, z̄ with given real coefficients), prove a lower bound
for the margin m(w, ρ) = (quadratic cost) − (second-order Taylor remainder in ρ) that is valid for **all** (w, ρ) ∈ ℂ³,
and that near ρ = 0 is as large as the second-order analysis allows. Numerically the best constant bound
m ≥ μ|ρ|² holds only with μ ≈ 0.6–0.7 of the second-order value; the task is to certify a refined bound such as
m ≥ (μ₀ − b|ρ|)|ρ|², for about ten rows of constants.

This is the degree-5 analogue of an inequality ("premise (P)") that was proved at degree 3 by a certified cover of
ℂ³; the method should transfer.

Source record (not needed to do the work): ledger rows 4.16, 4.19 and §5 item 2 ("t ≥ 0.86", "the other pieces") of
`research/higher-degree/STATUS.md`; `sources/degree5-capped-2026-11-16/CONTENT_LEMMA_D5.md` §§3.1, 3.2, 4.1; the
degree-3 template `research/conjecture-K/sources/global-complex-P-gemini-c1de/PROOF.md` with
`research/conjecture-K/code/global-complex-P-gemini-c1de/` (repository `agalatan/grothendieck-lean`, master).

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point (a search gives
an upper bound of an infimum, never a lower bound); "author only" when nobody but the author has checked it.

---

## 1. Setting and notation

**One Gaussian.** z is a standard complex Gaussian (density π⁻¹e^{−|z|²}; T = |z|² ~ Exp(1), arg z uniform,
independent). ph(a) = a/|a|.

**Visible polynomials.** e₁₁(z) = T − 1, e₂₀(z) = z²/√2, e₃₂(z) = z(T² − 6T + 6)/√12.

**Constants.** ε₁ = 39/50, p₁ = 1/ε₁ = 50/39, η = 779/10000. Tilt σ_A = 2/5, σ_B = 3/10.

**Rows.** A row is (ℓ, β, b_A, b_B, ν₅). The rows of the problem (floating-point constants; for a certificate round
them to denominators 10⁶ and say so):

| row | ℓ | β | b_A | b_B | ν₅ | used for |
|---|---|---|---|---|---|---|
| 0.79 | 0.7516941250 | 0.1186447826 | −0.0449189246 | −0.0247617045 | 0.0077710644 | pieces t = 0.70, 0.72 |
| 0.80 | 0.7673894472 | 0.1236799552 | −0.0460847336 | −0.0252926861 | 0.0083652838 | piece 0.74, row 0.80 |
| 0.81 | 0.7833781762 | 0.1288429711 | −0.0472494177 | −0.0258300556 | 0.0089880800 | piece 0.76 |
| 0.82 | 0.7997556522 | 0.1341353557 | −0.0484474255 | −0.0263799069 | 0.0096459978 | piece 0.78, row 0.82 |
| 0.84 | 0.8336742323 | 0.1451512257 | −0.0509103813 | −0.0274955327 | 0.0110657063 | row 0.84 |
| 0.845 | 0.8423965207 | 0.1479890944 | −0.0515538219 | −0.0277772732 | 0.0114437474 | row 0.845 |
| 0.85 | 0.8512025455 | 0.1508568950 | −0.0521920307 | −0.0280612971 | 0.0118305960 | row 0.85 |
| 0.855 | 0.8601425872 | 0.1537794978 | −0.0528314583 | −0.0283620073 | 0.0122273631 | row 0.855 |

(Source: `research/higher-degree/code/degree5-content/rows5.lines`, one JSON object per line, and the key `row` of
`profiles_low/band_row_0.70.json` for 0.79. The rows 0.86–0.886 of the same file are wanted too, with the tilt
(1/2, 1/5) instead; they are less urgent.)

**The functions.** For w ∈ ℂ and ρ = (ρ_A, ρ_B) ∈ ℂ²:

    L′(z) = z(ℓ + β(T − 2)) + ν₅·e₃₂(z),
    Y(z; w) = L′(z) + w·(1 − b_A·e₁₁(z)) − b_B·w̄·e₂₀(z),
    d(z; ρ) = (e₁₁(z) + σ_A)·ρ_A + e₂₀(z)·conj(ρ_B) + σ_B·ρ_B,
    Rem(w, ρ) = 2·E_z[ |Y + d| − |Y| − Re(d·conj(ph Y)) ]          (≥ 0, since |·| is convex),
    𝒞(ρ) = (p₁ − σ_A²)|ρ_A|² + (p₁ − σ_B²)|ρ_B|² − 2σ_Aσ_B·Re(ρ_A·conj(ρ_B)) = p₁|ρ|² − |σ_Aρ_A + σ_Bρ_B|²,
    m(w, ρ) = 𝒞(ρ) − Rem(w, ρ).

𝒞 is a positive definite Hermitian form with eigenvalues p₁ − σ_A² − σ_B² = 1.0321 and p₁ = 1.2821.

**Symmetries (P; check them).** For real φ, (w, ρ_A, ρ_B) ↦ (e^{iφ}w, e^{iφ}ρ_A, e^{iφ}ρ_B) leaves Rem and 𝒞 invariant
(substitute z ↦ e^{iφ}z); complex conjugation of all three parameters does too (z ↦ z̄, all coefficients are real).
So one may take w = s ≥ 0 and Im ρ_A ≥ 0: five real dimensions.

**Second-order form.** M(s) is the real symmetric 4×4 matrix of the quadratic form
ρ ↦ 2·E_z[(Im(d·conj(ph Y)))²/(2|Y|)] at w = s in the coordinates (Re ρ_A, Im ρ_A, Re ρ_B, Im ρ_B); it is the Hessian
part of Rem at ρ = 0. C denotes the matrix of 𝒞 in the same coordinates. μ₀ := inf_{s ≥ 0} λ_min(C − M(s)).

**Where it comes from (not needed).** In a certificate for a lower bound on the complex Grothendieck constant, q is a
"remote cubic" (an element of the Wick chaos H₂,₁ of other Gaussian variables y), r_A, r_B are linear forms in y,
and a functional of (q, r_A, r_B) is bounded by integrating the pointwise inequality at w = q(y), ρ = (r_A(y), r_B(y)):

    gain(q) ≤ sup over linear forms r_A, r_B of [ Re⟨r_A, c_A⟩ + Re⟨r_B, c_B⟩ − E_y m(q(y), r(y)) ],

where c_A, c_B (the "contents") are fixed vectors determined by q. If m ≥ μ|ρ|² then gain ≤ (‖c_A‖² + ‖c_B‖²)/(4μ).
Everything downstream is proportional to the μ one can use.

---

## 2. The statements

**(T0) Second order (the easy part).** For each row: μ₀ ≥ the value in the table of §3 minus 0.005. This is a
one-parameter family of 4×4 eigenvalue bounds.

**(T1) A constant global margin.** For each row certify a number μ_glob with

    m(w, ρ) ≥ μ_glob·|ρ|²        for all (w, ρ) ∈ ℂ³,      |ρ|² = |ρ_A|² + |ρ_B|².

Numerically the best possible μ_glob is at most 0.210, 0.229, 0.247, 0.265, 0.301, 0.318 on the rows 0.79, 0.80,
0.81, 0.82, 0.84, 0.85 (§3). A certified μ_glob within 0.01 of these is the target.

**(T2) The refined margin (what the application really needs).** For each row certify (μ₀′, b) with

    m(w, ρ) ≥ (μ₀′ − b·|ρ|)·|ρ|²        for all (w, ρ) ∈ ℂ³,

with μ₀′ ≥ μ₀ − 0.005 and b as small as possible. Numerically (§3) b ≈ 0.47 is necessary and seems to suffice on
the row 0.79, and b ≈ 0.39 on the row 0.82; b = 1/2 would be a good certified value.

> **Why (T2) recovers the margin.** r(y) = (r_A(y), r_B(y)) is a complex Gaussian vector whatever its dependence on
> q, so with V = E|r|²: E|r|³ ≤ (E|r|⁴·E|r|²)^{1/2} ≤ √2·V^{3/2}. Hence E m(q, r) ≥ (μ₀′ − √2·b·√V)·V, and the optimal V in
> the gain bound is of order ‖c‖²/(4μ²) ≈ 10⁻³–10⁻², where √2·b·√V is 0.02–0.07 against μ₀ ≈ 0.35–0.45. (T1) alone
> loses 0.12–0.14.

**Other forms that would serve as well.** Any certified lower bound m(w, ρ) ≥ (μ₀′ − φ(|w|, |ρ|))·|ρ|² with an explicit
φ that vanishes at |ρ| = 0, for instance φ supported in |w| ≥ 1/2 (the table of §3 shows no loss at all for
|w| ≤ 1/2, |ρ| ≤ 0.3), or the degree-3 form m ≥ μ₀′|ρ|² − (a|w|² + b′|ρ|²)|ρ|². For the latter note the consumer's
cost: E[|q|²|r|²] ≤ 4·E|q|²·E|r|² is the only general bound, so a|w|²|ρ|² costs 4a·u per unit V with u = E|q|²
between 0.03 and 0.2; a must then be well below 0.1 to be useful, and the table of §3 suggests it cannot be.

**Allowance.** In the application the admissible error is relative: every 1 % lost in μ is 1 % lost in an
allowance whose smallest known safety factor is 1.30. So a certified statement with μ₀′ at 97 % of μ₀ and b ≤ 0.5
is fully satisfactory; (T1) alone (60–70 % of μ₀) is not enough on the rows 0.79–0.82 but would already be
progress on 0.84–0.855, where the safety factors are 3.8–12.

---

## 3. What is known

**Numerics computed for this file (N; the scripts `chk_sec2.py`, `chk_sec3.py`, `chk_sec6.py` in
`research/higher-degree/code/degree5-attack/checks/`; polar quadrature in z with
10⁵–3·10⁵ nodes, two grids agree to three digits; minimisation over the direction of ρ by Nelder–Mead from two
starts, so every entry is an upper bound of the true minimum).**

Second-order margin λ_min(C − M(s)) and μ₀:

| row | s = 0 | 0.2 | 0.5 | 0.75 | 1.0 | 1.125 | 1.5 | μ₀ (min over s ∈ [0, 3], step 0.05) |
|---|---|---|---|---|---|---|---|---|
| 0.79 | 0.351 | 0.368 | 0.400 | 0.471 | 0.369 | 0.367 | 0.494 | 0.3508 (at s = 0) |
| 0.82 | 0.400 | 0.415 | 0.448 | 0.506 | 0.424 | 0.409 | 0.498 | 0.3997 (at s = 0) |

and μ₀ = 0.3675 (0.80), 0.3837 (0.81), 0.4309 (0.84), 0.4460 (0.85) at s = 0. (The record has 0.367, 0.400, 0.431,
0.446 for 0.80, 0.82, 0.84, 0.85.) Note the second minimum near s ≈ 1.1, only 2–5 % above the value at s = 0.

Finite amplitude, row 0.79: min over the direction of ρ of m(s, ρ)/|ρ|² at |ρ| = τ:

| s \ τ | 0.03 | 0.06 | 0.10 | 0.15 | 0.20 | 0.30 | 0.40 | 0.60 | 1.00 |
|---|---|---|---|---|---|---|---|---|---|
| 0 | 0.351 | 0.353 | 0.356 | 0.363 | 0.371 | 0.394 | 0.421 | 0.480 | 0.519 |
| 0.25 | 0.372 | 0.373 | 0.377 | 0.383 | 0.392 | 0.414 | 0.428 | 0.476 | 0.407 |
| 0.50 | 0.400 | 0.402 | 0.406 | 0.413 | 0.423 | 0.448 | 0.317 | 0.258 | 0.365 |
| 0.625 | 0.427 | 0.426 | 0.435 | 0.420 | 0.410 | 0.286 | 0.220 | 0.247 | 0.396 |
| 0.75 | 0.468 | 0.447 | 0.407 | 0.354 | 0.299 | 0.221 | **0.214** | 0.288 | 0.450 |
| 0.875 | 0.386 | 0.362 | 0.330 | 0.290 | 0.258 | 0.234 | 0.261 | 0.356 | 0.501 |
| 1.00 | 0.350 | 0.333 | 0.311 | 0.290 | 0.278 | 0.291 | 0.335 | 0.434 | 0.532 |
| 1.125 | 0.355 | 0.346 | 0.336 | 0.330 | 0.334 | 0.368 | 0.417 | 0.493 | 0.571 |
| 1.25 | 0.389 | 0.386 | 0.386 | 0.392 | 0.405 | 0.448 | 0.493 | 0.536 | 0.592 |
| 1.50 | 0.497 | 0.503 | 0.514 | 0.530 | 0.548 | 0.516 | 0.535 | 0.573 | 0.588 |

On this grid max (μ₀ − m/τ²)/τ = 0.465 (row 0.79) and 0.387 (row 0.82; its table has the same shape, with minimum
0.266 at s = 0.75, τ = 0.4).

Global minima by a free search over (s, ρ) (ten starts): 0.210 (row 0.79, s = 0.75), 0.229 (0.80, s = 0.72,
ρ_A = 0.295, ρ_B = 0.268, both real), 0.247 (0.81), 0.265 (0.82, s = 0.74, ρ = (0.311, 0.282)), 0.301 (0.84, s = 0.77,
ρ = (0.328, 0.297)), 0.318 (0.85, s = 0.76, ρ = (0.345, 0.312)). The minimiser is real and aligned: w > 0, ρ_A ≈ 1.1ρ_B > 0,
|ρ| ≈ 0.40–0.47. Along that direction at s = 0.72 on the row 0.80, m/τ² = 0.546, 0.514, 0.467, 0.356, 0.257, 0.245,
0.364, 0.572 at τ = 0.01, 0.05, 0.1, 0.2, 0.3, 0.5, 0.8, 1.5: a linear loss in τ, a minimum near τ = 0.4, then recovery
(for large |ρ|, Rem grows linearly and 𝒞 quadratically).

**From the record (N).** The same quantity at two rows, with a 16-direction search: finite-amplitude ratio
Rem/𝒞 ≤ 0.727 at s = 0.8 on the row 0.80 and ≤ 0.700 on 0.84, converted to a margin (1 − ratio)·λ_min(C) ≈ 0.28 and
0.31. The record's allowances downstream were computed with μ₀, described there as "pointwise, not yet a secant".
Without the tilt (σ_A = σ_B = 0) the second-order margin is only 0.189–0.322 on the rows 0.80–0.88.

**The degree-3 precedent (P + C, independently replayed).** With L = z(a + bT) (a = 699/1250, b = 179/1250),
h = (T − 2/5)A + c₁B + z²B̄/√2 and Rem = 2E[|L + w + h| − |L + w| − Re(h·conj ph(L + w))], the inequality
Rem ≤ (p − 463/5000)S_r − (67/100)|A + ρ₀B|² − (2/25)|B − ρ₀A|² + (|w|²/2 + S_r)S_r, S_r = |A|² + |B|², holds on all of
ℂ³. There too the second-order ("zero-core") value could not be kept as a constant: the pointwise cost fell from
0.39 to 0.096 at |w| ≈ 0.67, |(A, B)| ≈ 0.53, which is why the statement carries the quartic term. The proof: gauge
reduction to w ≥ 0; analytic exteriors for large |w| and large S_r; a "switched origin profile" near ρ = 0; ray
convexity on cube shells for small ρ; and an adaptive 4-D cover of the bulk with a weighted Cauchy–Schwarz
majorant on quadrature cells: about 1.2·10⁶ boxes, C++17 with upward rounding, an exact rational verifier in
Python, 19 negative controls.

---

## 4. Why the obvious approaches fail

- **The elementary majorant** |Y + d| ≤ |Y| + Re(d·conj ph Y) + |d|²/(2|Y|) gives Rem ≤ E[|d|²/|Y|], which is 1.6–1.9
  times the cost in the A direction (N, record): it ignores the factor sin² of the angle between d and Y, and here
  d is nearly aligned with Y.
- **A constant margin** is (T1): true, but 30–40 % below μ₀.
- **Second-order analysis alone** proves nothing at finite amplitude: m/|ρ|² drops below μ₀ at |ρ| as small as 0.03
  for s ≈ 1 (0.350 against μ₀ = 0.351, and 0.333 at 0.06).
- **Differences from degree 3 that break a verbatim copy of its proof.** (i) w enters through
  w(1 − b_A e₁₁) − b_B w̄ e₂₀, not as a pure shift of L′, so the shifted polar coordinates L + w = re^{iθ} of the
  degree-3 proof do not straighten the singularity; the zero of Y(·; w) must be located (it is unique and simple
  for the constants at hand? check) and the cell decomposition adapted. (ii) The radial map z ↦ L′(z) is still a
  diffeomorphism (T·g(T)² is increasing for g(T) = ℓ + β(T − 2) + ν₅(T² − 6T + 6)/√12 with these constants), but g
  is quadratic in T. (iii) One certificate per row.

---

## 5. Suggested approaches

- **(T0) first:** the entries of M(s) are integrals of smooth functions times 1/|Y|; in polar coordinates centred
  at the zero of Y the weight r·dr removes the singularity. Bound λ_min(C − M(s)) on s-cells; for large s use
  |Y| ≥ s|D| − |L′| with D = 1 − b_A e₁₁ − b_B e₂₀.
- **Exteriors.** Rem ≤ 2E[|Y + d| − |Y|] + 2E|d| ≤ 4E|d| ≤ c₁|ρ|, so m ≥ λ_min(C)|ρ|² − c₁|ρ|, which settles
  everything for |ρ| ≥ some R₀. For |ρ| > μ₀′/b ≈ 0.7 the right side of (T2) is negative and (T2) reduces to m ≥ 0,
  which (T1) gives. For large |w|: Rem ≤ E[|d|²/|Y|] and |Y| ≥ |w||D| − |L′| with D = 1 − b_A e₁₁ − b_B e₂₀.
- **The compact part** {0 ≤ s ≤ s₁} × {|ρ| ≤ 0.75}: an adaptive cover in the five real coordinates, with Rem
  enclosed on each box by quadrature in z with rigorous error terms, as in the degree-3 certificate. Near ρ = 0
  use the exact one-dimensional convexity of τ ↦ Rem(w, τρ̂) along rays (Rem is convex in ρ) together with the
  certified second-order form, as the degree-3 "ray-convexity shells" do, but now for the *linear* correction:
  show τ ↦ (m(w, τρ̂) − μ₀′τ²)/τ³ ≥ −b by a third-order Taylor bound with remainder (the third derivative of
  τ ↦ |Y + τd̂| is −3·Re(d̂·conj ph)·(Im(d̂·conj ph))²/|Y + τd̂|², whose z-average has an integrable but non-uniform
  singularity; this is where b comes from, and a sharp value of b should come out of that integral).
- **Negative controls.** The certifier must reject (T1) with μ_glob = 0.24 on the row 0.79 (true value ≤ 0.210),
  reject (T2) with b = 0.3 on the row 0.79 (needs ≈ 0.47), and reject (T0) with μ₀ + 0.01.

---

## 6. Deliverable

- A proof note: the reductions (symmetries, exteriors, the passage from boxes to all of ℂ³), each step checkable,
  and the consumer inequality "E m(q, r) ≥ (μ₀′ − √2·b·√V)V" proved in full, including E|r|⁴ = (tr Σ)² + tr Σ² ≤ 2(E|r|²)²
  for a circular complex Gaussian vector r ∈ ℂ² with covariance Σ (r_A and r_B are holomorphic linear forms of
  the Gaussian vector y, whatever their relation to q), and the a-priori bound on V that (T1) provides.
- A certifier, its result file and an independent exact verifier: exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier), the rounding of the row constants
  stated, the negative controls and their outcomes; per row the certified (μ₀′, b) and μ_glob.
- Labels "P, author only" and "C, author only".

---

## 7. How to test a claimed result

A floating-point evaluation (numpy; a polar grid: Gauss–Legendre panels in |z| on [0, 6.6] with weight 2r·e^{−r²},
256 or more equispaced angles):

```python
import numpy as np, math
def rem_and_cost(row, s, rho, z, wts, sA=0.4, sB=0.3, p1=50/39):
    l, beta, bA, bB, nu5 = row; T = np.abs(z)**2
    e11, e20, e32 = T - 1, z*z/math.sqrt(2), z*(T*T - 6*T + 6)/math.sqrt(12)
    Y = z*(l + beta*(T - 2)) + nu5*e32 + s*(1 - bA*e11) - bB*s*e20          # w = s >= 0
    rA, rB = rho
    d = (e11 + sA)*rA + e20*np.conj(rB) + sB*rB
    aY = np.abs(Y)
    rem = 2*((np.abs(Y + d) - aY - np.real(d*np.conj(Y/aY))) @ wts)
    cost = p1*(abs(rA)**2 + abs(rB)**2) - abs(sA*rA + sB*rB)**2
    return rem, cost
```

Reference values (N): row 0.80, s = 0.717, ρ = (0.295, 0.268): (cost − rem)/|ρ|² = 0.227. Row 0.79: the table of §3
(for example s = 1.0, |ρ| = 0.10: minimum over directions 0.311; s = 0, |ρ| → 0: 0.351). A claimed (T1) must lie
below the global minima of §3; a claimed (T2) must satisfy μ₀′ − b·τ ≤ the table entry at every (s, τ). Then
attack the claim: Nelder–Mead in (s, ρ) from at least ten starts including the real aligned direction
ρ_A ≈ 1.1ρ_B > 0 with s ∈ [0.6, 1.1], and the directions of the smallest eigenvalue of C − M(s) at s = 0 and s = 1.1.
