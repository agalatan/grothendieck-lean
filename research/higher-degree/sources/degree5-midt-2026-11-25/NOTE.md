# The middle range of the visible mass in the degree-5 certificate

25 November 2026. A research worker (sub-agent) of claude-b9ee, for issue #628 (problem P3 of
[`../degree5-attack-2026-11-25/problems/`](../degree5-attack-2026-11-25/problems/P3-mid-t-direct-bound.md); hypothesis
H2 of ledger 4.45). Written in the repository; scripts and logs in
[`../../code/degree5-midt/`](../../code/degree5-midt/). The ledger rows 4.41–4.45 cited here are those of PR #646
(branch `claude-b9ee/degree5-design`), not yet on master when this was written.

Labels as in [`research/README.md`](../../../README.md): **P** proved on paper, **C** certified in exact arithmetic,
**N** floating point, **open**. Everything here is by one author and unreviewed ("author only"). A search bounds a
supremum from below only.

**The problem.** T = P₁,₀ − ε·P₂,₁ + η·P₃,₂ with ε = 39/50, η = 779/10000. For unimodular f, g put h = (f + g)/2,
k = (f − g)/2, t = ‖P₁,₀h‖, V = Re⟨f, Tg⟩. Wanted: V ≤ 500/701 = 0.7132668 for t between the end of the direct bound
(0.25282, ledger 4.18c) and the first tuned row (t_s = 0.649, ledger 4.44), with no sector hypothesis.

## 0. Results

| | statement | status |
|---|---|---|
| R1 | **Theorem A.** For every unimodular pair in every dimension, (2/π)·‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ₀², for every ρ₀ that bounds the radius of the cubic chaos (§2) | **P**, author only |
| R2 | **V < 500/701 for all t ≤ 0.3172** from Theorem A and ρ₀ = 2287/2500 alone, and **for all t ≤ 0.3321** with the Lean mass fact added (0.3197 and 0.3343 with ρ₀ = 4571/5000) (§2.3) | **P + C**, author only; the radius 2287/2500 is **P + C**, reviewed; the mass fact is a Lean theorem |
| R3 | The coefficient 2/π improves to c₀² with c₀ = 0.862 by an elliptic, non-linear lift; with c₀ = 43/50 the ranges become t ≤ 0.3445 and t ≤ 0.3576 (§3) | construction **P**, author only; the constant **N** |
| R4 | The statement that would carry the method further is a **symmetrised spiked radius** of the cubic chaos, ρ_s: ‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ_s² for every pair. ρ_s ≤ 2287/2500 would give t ≤ 0.4662, ρ_s = √π/2 gives t ≤ 0.6177. Nothing found exceeds √π/2 (§4) | reductions **P**, author only; evidence **N**; the bound **open** (problem P7) |
| R5 | A row with the quintic terms replaced by an identity tail (§5) has diffuse value below the target by 0.080, 0.048, 0.029, 0.019, 0.011 at t = 0.2528, 0.45, 0.55, 0.60, 0.649; in the diffuse one-spike model every sector depending on z₁ lowers it. It is the row of a cubic identity-tail game, the kind certified in Lean with its gate | inequality **P**, author only; values **N** |
| R6 | What does not work (§6): an unsymmetrised two-chaos radius (it is at least 0.93999, 0.9460 found; the application needs 0.9407 at t = 0.2528); bounds that forget the phase (same number); the Lean rows of the cubic witness as black boxes (they miss the target by 1.6·10⁻³ to 9.2·10⁻³ on [0.35, 0.65]); the Gaussian buffer on top of the lift (no gain) | **P** / **N** as stated there |

The range (0.3321, 0.649) is still open. §7 has the tests against the pairs of ledger 4.40, §8 the recommendation.

## 1. Notation and two identities

P = P₁,₀, Q = P₂,₁, R = P₃,₂; x = t²; A = ‖Qk‖²; K = ‖k‖². Pointwise |h|² + |k|² = 1 and Re(h·k̄) = 0, so
‖h‖² = 1 − K. After a rotation Ph = t·z₁. Since T is self-adjoint and real,

    V = x − ε‖Qh‖² + η‖Rh‖² − ‖Pk‖² + εA − η‖Rk‖².                                                        (1.1)

Write ‖Rh‖² = (1 − K) − x − ‖Qh‖² − ‖h′‖², h′ the part of h outside H₁,₀ ⊕ H₂,₁ ⊕ H₃,₂. Then, exactly,

    V = (1 − η)x + η(1 − K) + εA − ‖Pk‖² − (ε + η)‖Qh‖² − η‖Rk‖² − η‖h′‖².                                (1.2)

The last four terms are ≤ 0. Dropping them and using K ≥ A:

    V ≤ (1 − η)x + η + εA − ηK ≤ (1 − η)x + η + (ε − η)A.                                                (1.3)

(This is formula (2) of P3.) So a bound on A in terms of t is a bound on V.

**What stops the direct bound of ledger 4.18 at t = 0.2528.** It bounds εA − ηK by a constant (ερ₀² + η²/(πε) − η −
9/10000) that does not depend on t: its only use of t is the coefficient 1 − η of t² in (1.3). The radius ρ₀ is
not the lossy input (with ρ₀ = √π/2 the same bound ends at 0.3263). What is lost is the trade-off between the
visible mass and the cubic energy of k: for the driver pairs t² + A = π/4 exactly (§4.2), so A falls by t² while
the direct bound keeps A at ρ₀². A trade-off A ≤ r² − c²t² turns the coefficient 1 − η into 1 − η − c²(ε − η):
0.9221 for the direct bound, 0.4751 with c² = 2/π (Theorem A), 0.2200 with c² = 1 (§4).

**The radius.** ρ\* = sup E|q|/‖q‖₂ over q ∈ H₂,₁(ℂⁿ), all n. ρ\* ≤ 2287/2500 (**P + C**, reviewed) and
ρ\* ≤ 4571/5000 (**P**, author only + **C**): `../../../conjecture-K/STATUS.md` row 3.7. ρ₀ is any proved bound.

## 2. Theorem A: the radius bound with a spike

> **Theorem A (P, author only).** Let ρ₀ ≥ ρ\*. For every n, every pair of unimodular f, g on ℂⁿ, every unit linear
> form ζ ∈ H₁,₀, every G ∈ H₂,₁(ℂⁿ) and every ℓ ≥ 0:
>
>     √(2/π)·ℓ·Re⟨ζ, h⟩ + Re⟨G, k⟩ ≤ ρ₀·√(ℓ² + ‖G‖²).                                                   (2.1)
>
> Consequently (2/π)·‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ₀².                                                          (2.2)

### 2.1 Proof

Adjoin 2N fresh coordinates y₁, …, y_{2N} and put

    m = (2N)^{−1/2}·( Σ_{j ≤ N} (|y_j|² − 1) − Σ_{N < j ≤ 2N} (|y_j|² − 1) ),        s = sgn(m).

m is real, lies in H₁,₁ of the fresh coordinates, E m = 0, E m² = 1; its law is symmetric (exchange the two
blocks) and has no atom, so s = ±1 almost surely and E s = 0.

*The lifted function.* F = s·h + k on ℂ^{n+2N}. It equals f where s = 1 and −g where s = −1, so |F| = 1.

*The lifted cubic.* U = ℓ·ζ·m + G. The product of an element of H₁,₀ and an element of H₁,₁ in independent
coordinates lies in H₂,₁, so U ∈ H₂,₁(ℂ^{n+2N}). ζm and G are orthogonal (E[conj(ζm)G] = E[m]·E[ζ̄G] = 0), and
‖ζm‖² = E|ζ|²·E m² = 1. Hence ‖U‖² = ℓ² + ‖G‖².

*The pairing.* By independence of the fresh coordinates from (h, k, ζ, G):

    ⟨U, F⟩ = ℓ·E[m s]·⟨ζ, h⟩ + ℓ·E[m]·⟨ζ, k⟩ + E[s]·⟨G, h⟩ + ⟨G, k⟩ = ℓ·E|m|·⟨ζ, h⟩ + ⟨G, k⟩.

*The radius.* Re⟨U, F⟩ ≤ E|U| ≤ ρ₀‖U‖, the radius bound in dimension n + 2N. So
ℓ·E|m|·Re⟨ζ, h⟩ + Re⟨G, k⟩ ≤ ρ₀√(ℓ² + ‖G‖²) for every N. As N → ∞, m converges in law to a standard real Gaussian
with E m² = 1 throughout, so E|m| → √(2/π). This is (2.1) (if Re⟨ζ, h⟩ < 0 the limit is used in the same way).

*(2.2).* Take ζ with Ph = tζ, G = Qk, ℓ = √(2/π)·t: (2/π)x + A ≤ ρ₀√((2/π)x + A). ∎

Remarks.
- In the supremum form: ½(E|√(2/π)ℓz₁ + G| + E|√(2/π)ℓz₁ − G|) ≤ ρ₀√(ℓ² + ‖G‖²) for every G ∈ H₂,₁, also when G
  depends on z₁ (§4).
- The loss is the factor E|m|/‖m‖ on the spike. A real element of H₁,₁ is a real Gaussian quadratic form, for
  which E|m| ≤ √(2/π)‖m‖ (`../../../conjecture-K/sources/d1/D1_NOTES.md`, Theorem A), so this lift is the best of
  its kind; §3 uses a complex m.
- `lift_check_mc.py` checks the pairing identity and the inequality by Monte Carlo on eight explicit pairs with
  cubics that depend on z₁ (**N**; log `lift_check_mc.log`).

### 2.2 The Lean mass fact

For every unimodular pair in every dimension m > 0 (`Grothe.LowerAnalytic.twice_normSq_QkOf_le` and
`integral_phiMass_QkOf_le`, `Grothe/LowerAnalytic/MassRowFrame.lean`; constants `massC`, `massS` of
`Grothe/Lower/MassNodes.lean`):

    ε̂·A − c·K ≤ S,       ε̂ = 25/31,  c = 2·(47/1953) + 1/2 = 2141/3906,  S = massS = 0.165606335…           (2.3)

It is stronger than K ≥ A when A ≥ S/(ε̂ − c) = 0.6411.

### 2.3 The range of t (P + C, author only)

From (1.3) and (2.2), for every pair:

    (A)  V ≤ [1 − η − (2/π)(ε − η)]·t² + η + (ε − η)ρ₀².

From V ≤ (1 − η)x + η + εA − ηK, K ≥ (ε̂A − S)/c by (2.3), and then (2.2) (the coefficient ε − ηε̂/c of A is
positive):

    (B)  V ≤ [1 − η − (2/π)(ε − ηε̂/c)]·t² + η(1 + S/c) + (ε − ηε̂/c)ρ₀².

Exact arithmetic (`verify_lift_bound.py`; π is bracketed by 333/106 < π < 355/113, checked against the Machin
series; the upper bound of each right-hand side is compared with 500/701):

| bound | ρ₀ | right-hand side (rounded) | below 500/701 for | slack there | fails at |
|---|---|---|---|---|---|
| (A) | 2287/2500 | 0.475129·t² + 0.665459 | t ≤ 0.3172 | 2.5·10⁻⁶ | 0.3173 |
| (A) | 4571/5000 | 0.475129·t² + 0.664688 | t ≤ 0.3197 | 1.6·10⁻⁵ | 0.3198 |
| (B) | 2287/2500 | 0.498501·t² + 0.658272 | t ≤ 0.3321 | 1.5·10⁻⁵ | 0.3322 |
| (B) | 4571/5000 | 0.498501·t² + 0.657541 | t ≤ 0.3343 | 1.5·10⁻⁵ | 0.3344 |

"Fails at": the lower bound of the right-hand side exceeds 500/701 there (negative control). Both bounds hold for
every pair; (B) is the smaller one where ρ₀² − (2/π)t² ≥ 0.6411, which includes its whole range (checked). The
inputs of (A) are the radius alone; (B) adds one Lean theorem. Neither uses a sector hypothesis, an interval cover or libm. Together with ledger 4.18c
(t ≤ 0.25282) this proves V < 500/701 for all t ≤ 0.3321 with reviewed inputs, pending review of this note.

With the conjectured sharp radius √π/2 the same formulas reach t ≤ 0.4203 (A) and 0.4231 (B): the method is
limited by the coefficient 2/π, not by the radius.

## 3. An elliptic lift (construction P, author only; constant N)

The linear lift F = s·h + k is the only one that is linear in (h, k) (a unimodular a(y)h + b(y)k for all admissible
(h, k) forces a = ±b, |a| = 1). A non-linear one does better.

Let a ∈ (0, 1], b = √(1 − a²), X ~ N(0, a²) and Y ~ N(0, b²) independent, M = X + iY (the diffuse limit of
a·m₁ + i·b·m₂ with m₁, m₂ as in §2.1 in separate blocks; E|M|² = 1). For λ ≥ 0 put R_λ = |M + iλ| and

    κ(λ) = E[(Y + λ)/R_λ],     c(λ) = E[(X² + Y(Y + λ))/R_λ],     r(λ) = c(λ)/√(1 − κ(λ)²),     c₀(a) = inf_{λ ≥ 0} r(λ).

**Construction.** At a point where h ≠ 0 write k = i·ς·|k|·ph(h), ς = ±1 (possible because Re(h·k̄) = 0). Choose
λ with κ(λ) = |k| (κ is continuous, κ(0) = 0, κ → 1) and set Φ = ph(h)·ph(X + i(Y + ςλ)). Then |Φ| = 1,
E_M Φ = ph(h)·iς·κ(λ) = k (the real part of E ph(M + iλ) vanishes by X → −X), and
E_M[M̄·Φ] = ph(h)·c(λ) (the imaginary part vanishes by X → −X; for ς = −1 use Y → −Y). With an independent
uniform variable, let F = Φ with probability p = c₀·|h|/c(λ) ≤ 1 and F = f or −g by a fair coin otherwise (the
coin has mean k and no correlation with M); where h = 0 let F = k. Then F is unimodular on the enlarged space,
E[F | z] = k and E[M̄F | z] = c₀·h. With U = ℓ·ζ·M + G as in §2.1: ⟨U, F⟩ = ℓc₀⟨ζ, h⟩ + ⟨G, k⟩, ‖U‖² = ℓ² + ‖G‖², and

    c₀(a)²·‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ ρ₀².                                                                    (3.1)

At a = 1 this is Theorem A: r(λ) increases from √(2/π) to 1. At a = 1/√2 (circular M) r decreases from √π/2 to
1/√2. In between (`lift_constant.py`, log `lift_constant.log`; **N**):

| a | 0.88 | 0.89 | 0.895 | 0.90 | 0.905 | 0.91 |
|---|---|---|---|---|---|---|
| inf r | 0.85959 | 0.86172 | **0.86204** (λ = 0.56) | 0.86180 | 0.86091 | 0.85936 (λ = 0) |

With c₀ = 43/50 (a = 179/200) the bounds (A) and (B) of §2.3 with c₀² in place of 2/π give t ≤ 0.3445 and
t ≤ 0.3576 at ρ₀ = 2287/2500 (0.3473 and 0.3600 at 4571/5000; floating point, last block of
`verify_lift_bound.log`).

**What is not done.** (i) A certified lower bound of r(λ) over λ ∈ [0, ∞) at a = 179/200: a one-parameter family
of two-dimensional Gaussian integrals, smooth in polar coordinates centred at −iλ, with limit a at infinity.
(ii) The passage from the Gaussian M to elements of H₁,₁ in finitely many variables (κ and c then depend on N; a
constant below c₀ absorbs this). Both are routine; they are sub-problem (b) of P7. At k = 0 the coefficient is
E|M|, at most √π/2 for a Gaussian M, so with Gaussian M the method ends below c₀² = π/4, that is t ≤ 0.371 with (B).

## 4. The symmetrised spiked radius

### 4.1 Definition and equivalence (P, author only)

For ℓ ≥ 0 and G ∈ H₂,₁(ℂⁿ) (G may depend on z₁):

    φ(ℓ, G) = ½(E|ℓz₁ + G| + E|ℓz₁ − G|) = sup over unimodular pairs of ℓ·Re⟨z₁, h⟩ + Re⟨G, k⟩,

    ρ_s = sup φ(ℓ, G)/√(ℓ² + ‖G‖²).

ρ_s ≤ r₁ ⟺ ‖Ph‖² + ‖Qk‖² ≤ r₁² for every unimodular pair (⇒: ℓ = t, G = Qk; ⇐: Cauchy–Schwarz). With (1.3):

    ρ_s ≤ r₁  ⟹  V ≤ (1 − ε)t² + η + (ε − η)r₁².                                                          (4.1)

| r₁ | 0.9407 | 0.9363 | 0.9329 | 0.9246 | 2287/2500 | 0.9092 | 0.9001 | 0.8900 | √π/2 |
|---|---|---|---|---|---|---|---|---|---|
| (4.1) < 500/701 for t ≤ | 0.2528 | 0.300 | 0.3321 | 0.400 | **0.4662** | 0.500 | 0.550 | 0.600 | **0.6177** |

### 4.2 What is known

- √π/2 ≤ ρ_s, with **equality along a whole family**: for f = ph(z₁ + cW), g = ph(z₁ − cW) (W a diffuse cubic
  Gaussian independent of z₁), t = (√π/2)/√(1 + c²) and ‖Qk‖ = (√π/2)c/√(1 + c²), so t² + A = π/4 for every c (**P**).
- φ(ℓ, G) ≤ ρ\*√(ℓ² + ‖G‖²) when G does not depend on z₁ (**P**: z₁ may then be replaced by a normalised sum of
  cubics in fresh variables, as in the buffer argument of ledger 4.18).
- φ(ℓ, G) ≤ ρ\*√((π/2)ℓ² + ‖G‖²) for every G (Theorem A), and with 1/c₀² = 1.346 in place of π/2 = 1.571 (§3, **N**).
- Second order at G = 0: φ(ℓ, G) = (√π/2)ℓ + (1/2ℓ)·E[(Im(G·e^{−iθ}))²/|z₁|] + …, θ = arg z₁. The form
  E[(Im(G·e^{−iθ}))²/|z₁|] is at most (√π/2)‖G‖² on each sector of H₂,₁ by visible Wick factor: equality on G
  independent of z₁ and on G = i·z₁·Q with Q real in H₁,₁; 0.7754 on i·e₂₁(z₁); 0.7269 (largest eigenvalue) on
  the span of e₁₁(z₁)·w and e₂₀(z₁)·w̄; 0.4431 on z̄₁·H₂,₀ and on z₁·(complex diffuse H₁,₁) (`second_order_checks.py`;
  closed forms, **N** as evaluated). So G = 0 is not a point where the conjecture fails to second order.

### 4.3 Numerics (N)

**Diffuse one-spike model** (`midt_lib.py`, `spiked_radius_search.py`): G = α·e₂₁(z₁) + z₁(a_C·N_C + a_R·e^{iφ}N_R) +
z̄₁·b·N_B + c·e₁₁(z₁)w + d·e^{iψ}e₂₀(z₁)w̄ + σW with independent Gaussians (N_R real): the six sectors of H₂,₁ by
visible Wick factor with diffuse remote factors, ten real parameters. Maximising φ/√(ℓ² + ‖G‖²) at ten angles
θ (ℓ = cos θ, ‖G‖ = sin θ) from random starts: the largest ratio found is √π/2 to 10⁻¹⁰ at every angle, attained by
σW alone (table in `spiked_radius_search.log`; the one value above, 0.88641 at θ = 0.1·π/2, is the quadrature
error of the pure spike, 3·10⁻⁴).

**Juntas with a bath** (`spiked_radius_junta.py`): G = Σ_{i ≤ 6} c_i·b_i(z₁, y) + τW, b_i the Wick monomials of
H₂,₁(ℂ²), c_i complex. Largest ratios found (re-evaluated on a 48 × 48 × 96 grid):

| θ/(π/2) | 0.15 | 0.30 | 0.45 | 0.60 | 0.80 |
|---|---|---|---|---|---|
| largest ratio found | 0.8862267 | 0.8862269 | 0.8862269 | 0.8862269 | 0.8862269 |
| share of the bath in ‖G‖ at that point | 0.995 | 1.000 | 1.000 | 1.000 | 1.000 |
| largest ratio found without a bath (24 × 24 × 32 grid) | 0.8855 | 0.8743 | 0.8496 | 0.8139 | 0.7616 |

(√π/2 = 0.8862269; log `spiked_radius_junta.log`. Without a bath the grid error is of the order of 10⁻², as the
check line of the log shows.)

**Reading.** In both families the supremum found is the diffuse value. The families contain the sectors that make
the sector inequality K₅ fail in form at small t (the odd sector z₁·H₁,₁ and the A/B sectors), non-Gaussian cubics
in z₁ and one remote coordinate, and the transverse cubic of ledger 4.40. They do not contain cubics in three or
more coordinates without a bath, or the clustered cubics of ledger 4.28–4.30 (those are remote, where the
question is the radius ρ\* itself).

### 4.4 The statement proposed

> **(P7)** ρ_s ≤ r₁ for an explicit r₁ < 0.9329; in particular with r₁ = 2287/2500. Conjecture: ρ_s = √π/2.

At ℓ = 0 this is the radius of the cubic chaos, so r₁ ≥ ρ\* and the conjecture contains the open conjecture
ρ\* = √π/2. The problem file is
[`../degree5-attack-2026-11-25/problems/P7-symmetrised-spiked-radius.md`](../degree5-attack-2026-11-25/problems/P7-symmetrised-spiked-radius.md).

## 5. A row with an identity tail (cap-relative, no own-q comparison)

### 5.1 The inequality (P, author only)

From (1.2), for real ℓ, β, with v = z₁(|z₁|² − 2) (‖v‖² = 2), L = ℓz₁ + βv and G = εQk:

    (1 − η)x − (ε + η)‖Qh‖² = (1 − η)x − 2ℓt + 2β²/(ε + η) + 2Re⟨L, h⟩ − (ε + η)‖Qh + βv/(ε + η)‖²,
    εA = 2Re⟨G, k⟩ − ‖G‖²/ε,          η(1 − K) = η·E|h|².

Pointwise 2Re(L̄h) + 2Re(Ḡk) + η|h|² ≤ Φ_η(L + G, L − G), where

    Φ_η(a, b) = sup over unimodular f, g of Re(āf) + Re(b̄g) + η|f + g|²/4        (≤ |a| + |b| + η).

Hence, for every unimodular pair and all real ℓ, β:

    V ≤ (1 − η)t² − 2ℓt + 2β²/(ε + η) + N(ℓ, β),      N(ℓ, β) = sup over G ∈ H₂,₁ of [ E Φ_η(L + G, L − G) − ‖G‖²/ε ].      (5.1)

Dropped: −‖Pk‖², −η‖Rk‖², −η‖h′‖² and a square. (5.1) contains no multiplier C and no comparison with the pair's own
remote cubic: G is the whole cubic εQk, and the claim needed is a bound of N(ℓ, β) by a number.

It is the row of a **cubic game with an identity tail**: Φ_η = η/2 + Ψ_{η/2} with Ψ_ν(a, b) = sup Re(āf) + Re(b̄g) +
ν·Re(f̄g) the fibre potential of the identity-tail witness (`../../../identity-tail/STATUS.md` 1.2), here with hat
tail ν̂ = η/2 and cubic weight ε (ε + η on the h side). Equivalently, from (1.2),

    V ≤ η(1 − t²) + [t² − ‖Pk‖² + ε(A − ‖Qh‖²) − ηK],                                                     (5.2)

and the bracket is the hat value of the witness with (ε̂, ν̂) = (39/50, 779/20000).

### 5.2 Diffuse values and the sector test (N)

`tail_row_model.py`: for each t, (ℓ, β) minimises (5.1) with G restricted to σW (W the diffuse remote cubic); then
the bracket of N(ℓ, β) is maximised over the ten sector parameters of §4.3 from the diffuse point and random
starts.

| t | ℓ | β | σ | diffuse value of (5.1) | room to 500/701 | best search over sectors minus diffuse |
|---|---|---|---|---|---|---|
| 0.2528 | 0.1670 | 0.0050 | 0.6632 | 0.633019 | 0.08025 | 0 (no start above) |
| 0.3000 | 0.2025 | 0.0073 | 0.6511 | 0.639646 | 0.07362 | 0 (no start above) |
| 0.3500 | 0.2411 | 0.0103 | 0.6357 | 0.647440 | 0.06583 | 0 (no start above) |
| 0.4000 | 0.2804 | 0.0143 | 0.6175 | 0.655949 | 0.05732 | 0 (no start above) |
| 0.4500 | 0.3212 | 0.0199 | 0.5960 | 0.665068 | 0.04820 | 0 (no start above) |
| 0.5000 | 0.3639 | 0.0274 | 0.5711 | 0.674631 | 0.03864 | 0 (no start above) |
| 0.5500 | 0.4099 | 0.0376 | 0.5421 | 0.684381 | 0.02889 | 0 (no start above) |
| 0.6000 | 0.4599 | 0.0506 | 0.5085 | 0.693953 | 0.01931 | 0 (no start above) |
| 0.6490 | 0.5147 | 0.0665 | 0.4701 | 0.702687 | 0.01058 | 0 (no start above) |

(log `tail_row_model.log`: the runs for the nine values of t, merged in order of t; two to three starts per row.)

No start exceeded the diffuse value. `tail_row_directions.py` adds a directional test at the same rows: one sector
at a time (ten directions, amplitudes 0.05 to 0.4, σ fixed and re-optimised). Every entry is negative; the
largest is −1.4·10⁻⁵, for the transverse sector i·z₁·(real H₁,₁) at amplitude 0.05, which is marginal to second
order (§4.2) and costs at fourth order (log `tail_row_directions.log`).

So in this model the supremum in (5.1) is its diffuse value: the sectors that depend on z₁ are pure cost *at the
diffuse optimum*, although the same sectors have second-variation ratios above 1 relative to the pair's own q at
q = 0 (ledger 4.16, 4.40). This is the cap-relative statement that ledger 4.40 leaves open, in the form: bound
N(ℓ, β) by its diffuse value plus an allowance, the allowance being the room of the table minus the loss of the law
layer.

The room at the switch point 0.649 is 0.0106. (5.1) gives up η‖h′‖² and η‖Rk‖² against rows with G₅, and a law
layer costs about 0.012 at the row 0.6 of ledger 4.42 (the Gaussian value 0.688 of P3 §2 against its room
0.0132; an estimate). So above t ≈ 0.55 the room of (5.1) is of the size of the law-layer loss, and the last
part of the range needs the quintic terms, a sharper law layer (Stein cuts), or both.

### 5.3 What a proof of N(ℓ, β) ≤ number needs

N(ℓ, β) is the gate-free row functional of a cubic game, the object of Conjecture K
(`../../../conjecture-K/README.md`); the Lean lower bound does not prove it but bounds the hat value through the
retained gate (`SharedReduction`, `reductionHyp_of_nodeCaps`), for every t, with rows at 0.4 and 0.6 whose caps are
built around the broken maximiser (`../../../identity-tail/STATUS.md` 5.2, 5.6). That machinery is the proved way
to treat the sectors at mid t; §6.3 measures how far its existing rows are from what is needed here.

## 6. What does not work

### 6.1 Comparisons with the pair's own remote cubic

Ledger 4.40 (codex-a7c4). Nothing in §§2–5 uses such a comparison.

### 6.2 An unsymmetrised radius, and bounds that forget the phase (P; one number N)

F = (P₁,₀ + P₂,₁)(z₁/|z₁|) = (√π/2)·z₁(1 − (|z₁|² − 2)/4) has E|F| ≥ ‖F‖₂² and ‖F‖₂² = π/4 + π/32, so
sup E|ℓz₁ + G|/√(ℓ² + ‖G‖²) ≥ √(9π/32) = 0.93999 (the ratio of this F is 0.9433, and 0.9460 at the coefficient
0.345: **N**). The bound φ(ℓ, G) ≤ E√(ℓ²|z₁|² + |G|²) has the value Γ(5/2)/√2 = 0.93999 at ℓ = ‖G‖ for a diffuse
remote G. (4.1) needs r₁ ≤ 0.9407 at t = 0.2528 and r₁ ≤ 0.93999 at t = 0.2612. So a two-chaos radius without the
symmetrisation, or any bound through the moduli alone, gives at most t ≤ 0.2612, and with the value 0.9460 nothing
beyond ledger 4.18c. This is the precise form of "a direct argument needs phase information" (ledger 4.18).

### 6.3 The Lean rows of the cubic witness as black boxes (P for the inequalities; table N)

The Lean rows bound V̂_L = x − ‖Pk‖² + ε̂(A − ‖Qh‖²) − 2ν̂K (ε̂ = 25/31, ν̂ = 47/1953) for every pair:
V̂_L ≤ t² − 2ℓ_r t + C_r (rows 0.4, 0.6, 0.7, …) and V̂_L ≤ ½t² + ½ + S (mass row). With r = ε/ε̂ = 1209/1250, by (1.1):

    (i)   V ≤ r·V̂_L + (1 − r)x + η(1 − K − x) + 2rν̂K              (η − 2rν̂ = 0.0313 > 0),
    (ii)  V ≤ (1 − η)x + η + εA − ηK,       A ≤ min(K, ρ₀² − (2/π)x, (S + cK)/ε̂).

(i) decreases in K, (ii) increases until its cap on A binds. `lean_rows_blackbox.py` maximises min((i), (ii)) over
K (by linear-programming duality this is the best bound obtainable by mixing these inequalities):

| t | 0.31 | 0.33 | 0.35 | 0.39 | 0.43 | 0.47 | 0.51 | 0.55 | 0.59 | 0.63 | 0.65 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| bound − 500/701 | −0.0071 | −0.0007 | +0.0027 | +0.0016 | +0.0034 | +0.0079 | +0.0055 | +0.0038 | +0.0050 | +0.0092 | +0.0092 |

Up to t = 0.33 only (ii) acts (this is (B)). Beyond, the existing Lean rows miss by 1.6·10⁻³ to 9.2·10⁻³ on the
whole range (full table in `lean_rows_blackbox.log`). They were tuned to pass their own target, with margins
2.9·10⁻³ to 9.5·10⁻³ at mid t (`../../../identity-tail/sources/stage0d-2026-11-17/PROGRESS.md`), not to be tight,
and only two of them are tuned inside the range. With the hat tail ν̂′ = η/(2r) = 0.04027 in place of 47/1953 the
K-term of (i) vanishes: V ≤ r·V̂′ + η + (1 − r − η)t², and the hat bounds needed are 0.6627, 0.6643, 0.6686,
0.6737, 0.6768 at t = 0.35, 0.4, 0.5, 0.6, 0.65. The diffuse rooms of that game are those of §5.2 divided by r, up
to the difference between the weights ε + η and ε on the h side.

A sharper cap on A as a function of K does not close the gap: the linear program over the proved law class
(moments, radius; `k_profile_lp.py`, **N**, a lower estimate of the class supremum) lowers the cap by 0.005–0.016
for K ∈ [0.55, 0.70] only, and (i) is nearly flat in K.

### 6.4 The Gaussian buffer on top of the lift (P)

Applying the buffer inequality of ledger 4.18c, ε‖Qk̃‖² − η‖k̃‖² ≤ ερ₀² + η²/(πε) − η − 9/10000 for |k̃| ≤ 1, to
k̃ = c(y)·h + k with a real |c| ≤ 1 gives εA − ηK + ε(E[cm])²x − η·E[c²]·(1 − K) ≤ the same constant. At the point
where (A) or (B) binds this is not active (at t = 0.34, K = A = 0.7633: 0.5749 against 0.5764), so it does not
improve §2.3. Applying the Lean mass fact to k̃ loses: (E[cm])² ≤ E[c²] and ε̂(2/π)x < c(1 − K) there.

## 7. Tests against the recorded families

- **The pairs of ledger 4.40** (130 coordinates, t ∈ [1/4, 5/12], q = 0, G₃ = i·a·z₁·Q with a = 27/100):
  A = a²/ε² = 0.1198, so (2/π)t² + A ≤ 0.2303 against ρ₀² = 0.8369 (exact, in `verify_lift_bound.py`), and
  t² + A ≤ 0.2934 against π/4. For this G, φ(ℓ, G) = (√π/2)·E√(ℓ² + a²Q²) ≤ (√π/2)√(ℓ² + a²) by Jensen: the ratio of
  §4 is below √π/2 for every transverse cubic (**P**). (5.1) at this pair is far below its diffuse value (V < 0.252).
  The 49- and 19-coordinate fields of 4.40 are of the same form. So the pairs that defeat the own-q comparison are
  harmless for every statement of this note, with margins 0.3 or more.
- **Driver pairs** (P3 §7): t² + A = π/4 exactly (§4.2): zero margin for the conjecture ρ_s = √π/2, margin 0.0515
  in ρ_s² for ρ_s ≤ 2287/2500, and (2/π)t² + A ≤ π/4 − (1 − 2/π)t² for Theorem A.
- **Low-dimensional optimisation:** §4.3 (ratio) and §5.2 (tail row).
- **Margins over t ∈ [0.25, 0.65].** (A) and (B) are proved bounds; their margin to 500/701 is 0.0181 and 0.0238
  at t = 0.25, zero at 0.3172 and 0.3321, and negative beyond ((A) is 0.7415 at t = 0.4). For the conjectured
  (4.1) with r₁ = √π/2 the margin is 0.0702, 0.0487, 0.0289, 0.0047 at t = 0.25, 0.40, 0.50, 0.60 and zero at
  0.6177; with r₁ = 2287/2500 it is 0.0341, 0.0126 at t = 0.25, 0.40 and zero at 0.4662. For (5.1) the diffuse
  margins are in §5.2.

## 8. Recommendation

1. **Record R2** after review: the hypothesis-free piece ends at t = 0.3321 instead of 0.25282 (0.3172 from the
   radius alone). In the design of ledger 4.44, t₁ moves from 0.250885 to 0.3321 and H2 of ledger 4.45 shrinks to
   (0.3321, 0.649).
2. **Next lemma: P7**, the symmetrised spiked radius with the constant of the unspiked radius. It is a statement
   of the same kind as the radius theorem (one functional on H₁,₀ ⊕ H₂,₁, every dimension), it survives every test
   made here with the diffuse value as supremum, and r₁ = 2287/2500 gives t ≤ 0.4662. Sub-problem (b) of P7
   (certify c₀ = 43/50) is a finite computation that gives t ≤ 0.3576 at once.
3. **Beyond P7's range**: the tail row (5.1) is the right object up to t ≈ 0.55 (diffuse room 0.029 or more), and
   it is a cubic identity-tail row. The proved technique for it is the
   gated reduction of the Lean lower bound. **Next computation:** run the cubic row pipeline of
   `../../../identity-tail/` for the witness with hat weight 25/31 and hat tail η/(2r) = 0.04027 on rows tuned at
   t = 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, with the targets of §6.3; the existing rows 0.4 and 0.6 of the other tail
   miss by 2·10⁻³ to 9·10⁻³ when used on the whole range. Part of the miss comes from covering the range with two
   rows (the row 0.4 is 0.006 higher at t = 0.47 than at t = 0.4); the rest has to come from tighter caps.
4. **The last piece, t from about 0.55 to 0.649,** has diffuse room 0.029 to 0.011 in (5.1) and none in (4.1) beyond
   0.6177, before any law-layer loss. Either the switch point moves down (tuned rows below 0.649 lose the A/B
   premise, ledger 4.43), or this piece needs rows with G₅, Stein cuts in the law layer and a gate of degree 5. It
   is the part of H2 for which this note has no route with room to spare.

## 9. Replay

From the repository root (the exact script needs only the standard library; the others numpy and scipy):

```sh
python3 -I -O research/higher-degree/code/degree5-midt/verify_lift_bound.py      # exact: section 2.3, controls
python3 research/higher-degree/code/degree5-midt/lift_check_mc.py                # N: the lift on explicit pairs
python3 research/higher-degree/code/degree5-midt/second_order_checks.py          # N: sections 4.2, 6.2
python3 research/higher-degree/code/degree5-midt/lean_rows_blackbox.py           # section 6.3
cd research/higher-degree/code/degree5-midt
python3 lift_constant.py                    # N: section 3
python3 spiked_radius_search.py 10 2        # N: section 4.3, diffuse model
python3 spiked_radius_junta.py 8 1          # N: section 4.3, juntas
python3 tail_row_model.py 2 1               # N: section 5.2
python3 tail_row_directions.py              # N: section 5.2, the directional test
python3 k_profile_lp.py                     # N: section 6.3, last paragraph
```
