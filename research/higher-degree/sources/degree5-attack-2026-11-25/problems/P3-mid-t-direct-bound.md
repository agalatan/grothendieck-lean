# P3. The degree-5 game at intermediate visible mass: a bound with no sector hypothesis

**Summary.** For the operator T = P₁,₀ − (39/50)P₂,₁ + (779/10000)P₃,₂ on complex Gaussian space, prove
Re⟨f, Tg⟩ ≤ 500/701 for all unimodular pairs (f, g) whose visible linear mass t = ‖P₁,₀(f + g)/2‖₂ lies in
[1/4, 13/20], in every dimension. The expected true supremum on this range is below 0.69, so there is room of
2.5·10⁻² or more; what is missing is an argument that uses the joint behaviour of the first chaos and the cubic
chaos of the pair, because every argument that looks only at the law of the cubic part stops near t = 0.23.

Source record (not needed to do the work): ledger rows 4.16, 4.17, 4.18, 4.35 and §5 item 2 ("Small t") of
`research/higher-degree/STATUS.md`; reports `sources/degree5-capped-2026-11-16/SMALL_T.md`, `CAPPED_GATE.md` §5 (c)
and §6 item 10 there (repository `agalatan/grothendieck-lean`, master).

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point; "author only"
when nobody but the author has checked it.

---

## 1. Setting and notation

**Gaussian space.** z = (z₁, …, z_n): independent standard complex Gaussians, each with density π⁻¹e^{−|z|²} on ℂ
(E|z_j|² = 1, E z_j² = 0). n is arbitrary. ⟨f, g⟩ = E[conj(f)·g], ‖f‖₂² = E|f|².

**Chaos.** H_{a,b} ⊂ L² is the closed span of the Wick polynomials :z^α z̄^β: with |α| = a, |β| = b (the complex
Hermite polynomials; H_{a,b} ⊥ H_{a′,b′} unless (a, b) = (a′, b′), and L² = ⊕H_{a,b}). P_{a,b} is the orthogonal
projection onto H_{a,b}. H₁,₀ is the span of z₁, …, z_n. Examples in one variable, with T = |z|²:
z ∈ H₁,₀; e₂₁ = z(T − 2)/√2 ∈ H₂,₁; e₃₂ = z(T² − 6T + 6)/√12 ∈ H₃,₂; all of norm 1.

**The operator.** T = P₁,₀ − ε·P₂,₁ + η·P₃,₂, ε = 39/50, η = 779/10000. It is self-adjoint, real, of norm 1.

**Pairs.** f, g: ℂⁿ → ℂ measurable with |f| = |g| = 1 almost surely. V(f, g) = Re⟨f, Tg⟩. Put

    h = (f + g)/2,    k = (f − g)/2    (so |h|² + |k|² = 1 and Re(h·k̄) = 0 pointwise),    t = ‖P₁,₀h‖₂.

Then (P; T self-adjoint and real)

    V = t² − ε‖P₂,₁h‖² + η‖P₃,₂h‖² − ‖P₁,₀k‖² + ε‖P₂,₁k‖² − η‖P₃,₂k‖².                                  (1)

t ranges over [0, √π/2] (√π/2 = 0.8862…, attained by f = g = z₁/|z₁|).

**The radius of the cubic chaos.** ρ\* = sup E|q|/‖q‖₂ over q ∈ H₂,₁(ℂⁿ), all n. Known: √π/2 ≤ ρ\* ≤ 2287/2500 =
0.9148 (**P + C**, independently reviewed); ρ\* ≤ 4571/5000 = 0.9142 (**P**, author only + **C**). Moreover, with
s = E|q|⁴/‖q‖₂⁴ − 2 ∈ [0, 42]: E|q| ≤ (√π/2)(1 + (26449/5000000)·s)‖q‖₂ (**P + C**). You may use these.

---

## 2. The statement to prove

> **Target.** For every n and every unimodular pair (f, g) on ℂⁿ with 1/4 ≤ t ≤ 13/20:
>
>     V(f, g) = Re⟨f, Tg⟩ ≤ 500/701.

- **What the application needs.** The certificate for K_G^ℂ ≥ 1.402 has an unconditional bound for t ≤ 0.2508 (§3)
  and rows conditional on a sector inequality above; on (0.2508, 0.647] the proof techniques for that sector
  inequality fail (§4). So the target, as stated, removes the hypothesis on that piece. The right end 13/20 is the
  present switch point 0.647 rounded up; a proof on a shorter interval [1/4, t₂] is useful for any t₂ > 1/4, and
  a proof that reaches further (up to t ≈ 0.80) would be worth much more, because the hardest open lemma of the
  programme lives on t ∈ [0.65, 0.80].
- **Allowance.** Any bound V ≤ 500/701 − c with c ≥ 0 does the job; nothing needs to be sharp. Model estimates of
  the supremum at fixed t (N; a model, not a bound): explicit pairs (§3 item 4) give at least 0.626, 0.647, 0.664,
  0.682 at t = 0.25, 0.4, 0.5, 0.6, and rows evaluated with a Gaussian cubic give at most 0.637, 0.648, 0.663, 0.677,
  0.688 at t = 0.25, 0.3, 0.4, 0.5, 0.6 (0.700 at t = 0.7). 500/701 = 0.71327. So the expected room is about
  7.6·10⁻², 6.5·10⁻², 5.0·10⁻², 3.6·10⁻², 2.5·10⁻² at t = 0.25, 0.3, 0.4, 0.5, 0.6.
- **A weaker version that still suffices:** a bound of the form V ≤ a·t² + b·t + c(law data of the cubic part) that
  is below 500/701 on the interval after maximising over the proved constraints on cubics (the radius, moment
  bounds), in exact arithmetic.

---

## 3. What is known

1. **Small t, no hypothesis (P + C, reviewed).** For every pair,

       V ≤ (1 − η)t² + ερ₀² + η²/(πε)     for every ρ₀ ≥ ρ\*.

   Proof idea: in (1) drop −‖P₁,₀k‖², −η‖P₃,₂k‖² and −ε‖P₂,₁h‖², use ‖P₃,₂h‖² ≤ ‖h‖² − t² = 1 − ‖k‖² − t², write
   ε‖P₂,₁k‖² = 2Re⟨G, k⟩ − ‖G‖²/ε with G = εP₂,₁k and maximise pointwise over |k| ≤ 1. This gives
   V ≤ (1 − η)t² + E[2|G| + (η − |G|)₊²/η] − ‖G‖²/ε. The clipped payoff 2r + (η − r)₊²/η lies below 2E|r + (η/√π)W|
   for an independent standard complex Gaussian W, and G + (η/√π)W is a limit of elements of H₂,₁, so the radius
   bound applies to it. With ρ₀ = 2287/2500: V ≤ (9221/10000)t² + 0.655227 < 500/701 for t ≤ 0.2508. With
   ρ₀ = √π/2 (the conjectured ρ\*) the same formula reaches only t ≤ 0.3263: the method is limited by its
   coefficient 1 − η of t², not by the radius.
2. **A variant with a mass coupling (P; values N).** For η′ ≥ η: V ≤ (1 − η′)t² + N(η′),
   N(η′) = sup_{σ ≥ 0}[sup_q E(2σR + (η′ − σR)₊²/η′) − σ²/ε], R = |q| for unit q ∈ H₂,₁. With law constraints on R
   (moments, radius 0.93, Stein-type cuts) the best reach found is t ≤ 0.228 at η′ = η + 0.375 (float SDP). The
   worst laws keep about 1 % of their mass near R = 0.
3. **Above the range (context).** For t ≥ 0.65 the programme uses "rows": for real ℓ, β, b_A, b_B,
   V ≤ t² − 2ℓt + 2β²/ε + (b_A² + b_B²)‖q‖²/η + Λ₅, where Λ₅ is a functional of G₃ = εP₂,₁k and G₅ = ηP₃,₂h, and a
   sector inequality bounds Λ₅ by its value at "q-only" configurations. On t ∈ [0.25, 0.65] such rows exist with
   certified constants and rooms 1.1·10⁻² to 2.1·10⁻² (2.4·10⁻² to 4.4·10⁻² with sharper law inputs, N), but only
   conditionally on that sector inequality.
4. **Model values (N).** Explicit pairs: f = ph(z₁ + cW), g = ph(z₁ − cW), ph(x) = x/|x|, with W a standard complex
   Gaussian independent of z₁ and placed in H₂,₁ (the L² limit of N^{−1/2}Σ_{j≤N} e₂₁(y_j) in fresh variables y_j).
   Computed for this file:

   | c | 0.6 | 0.8 | 1.0 | 1.3 | 1.7 | 2.3 | 3.2 |
   |---|---|---|---|---|---|---|---|
   | t | 0.7599 | 0.6920 | 0.6267 | 0.5403 | 0.4493 | 0.3534 | 0.2643 |
   | V | 0.70655 | 0.69752 | 0.68665 | 0.67094 | 0.65460 | 0.63929 | 0.62776 |

   These are not optimised; the optimised model values are those of §2 ("Gaussian-ideal row").

---

## 4. Why the obvious approaches fail

- **Law-only arguments stop near t = 0.23.** Any bound that keeps only the law of |G| (item 1 or 2) must give up
  the pointwise relations |h|² + |k|² = 1 with Re(h·k̄) = 0 beyond |k| ≤ 1, that is, the relative phase of the
  visible coordinate and the cubic. Even for a cubic independent of z₁ the resulting bound is 0.7155 > 500/701 at
  t = 0.2 in the best such scheme recorded (SMALLT §0). Sharper radius constants do not help (item 1).
- **The Parseval bound** V ≤ t² + ερ₀² + η(1 − ρ₀² − t²)₊ (from ‖P₂,₁k‖ ≤ ρ₀ and ‖h‖² + ‖k‖² ≤ 1) is item 1 of §3 in a
  slightly weaker form: with ρ₀ = 2287/2500 it is 0.6655 + 0.9221t², below 500/701 only for t ≤ 0.2276.
- **The sector method of larger t fails in form here.** It needs "pure cost" inequalities: the second variation
  of E|L + q·D ± …| in certain directions must be below the quadratic cost 1/ε. For rows tuned at t ≤ 0.6 the base
  L = z(ℓ + β(|z|² − 2)) is small, the visible coordinate is no longer special among the coordinates, and the ratios
  exceed 1: 1.05–2.5 for the first-order (A/B) directions and 1.28–3.1 for the odd directions at t = 0.2–0.6
  (N). Allowances that pay for this exceed the room at t = 0.1–0.3.
- **Dropping −‖P₁,₀k‖² or −η‖P₃,₂k‖² entirely** loses the mechanism that punishes a large cubic response: a pair with
  ‖P₂,₁k‖ near ρ\* needs |k| ≈ 1, hence ‖h‖ ≈ 0 and t ≈ 0. Quantifying "t ≥ 1/4 forces ‖k‖² ≤ 1 − t²/(…)" is the
  heart of the matter.

---

## 5. Suggested approaches

- **A cap on the cubic energy of k as a function of t.** From (1), dropping −ε‖P₂,₁h‖², −‖P₁,₀k‖², −η‖P₃,₂k‖² and
  using ‖P₃,₂h‖² ≤ ‖h‖² − t² = 1 − ‖k‖² − t² ≤ 1 − ‖P₂,₁k‖² − t²:

      V ≤ (1 − η)t² + η + (ε − η)·‖P₂,₁k‖².                                                              (2)

  So the target holds wherever ‖P₂,₁k‖² ≤ c_need(t) := ((500/701 − η) − (1 − η)t²)/(ε − η), which is 0.8229, 0.7868,
  0.6948, 0.5766, 0.4321, 0.3501 at t = 0.25, 0.3, 0.4, 0.5, 0.6, 0.65. What is known about
  Q(t) := sup ‖P₂,₁k‖² over pairs with ‖P₁,₀h‖ = t:
  - Q(0) = ρ\*² ∈ [π/4, 0.8369]. This is why item 1 of §3 works up to t ≈ 0.25 and no further.
  - *Response inequality (P, reviewed at degree 3; the proof is three lines).* For every U ∈ H₂,₁:
    t + Re⟨U, k⟩ = ½Re E[conj(z₁ + U)f + conj(z₁ − U)g] ≤ ½E(|z₁ + U| + |z₁ − U|). With U = λ·P₂,₁k:

        t + λ‖P₂,₁k‖² ≤ ½E(|z₁ + λP₂,₁k| + |z₁ − λP₂,₁k|)        for all λ ≥ 0.                       (3)

    If P₂,₁k does not depend on z₁, the right side is E ρ(λ²|P₂,₁k|²) with
    ρ(x) = E|z₁ + √x| = (√π/2)e^{−x/2}[(1 + x)I₀(x/2) + x·I₁(x/2)], a concave function. For a Gaussian P₂,₁k this
    gives exactly ‖P₂,₁k‖² ≤ π/4 − t² (0.7229, 0.6954, 0.6254, 0.5354, 0.4254, 0.3629 at the six values of t above:
    below c_need(t) up to t ≈ 0.61, and (2) then gives 0.643, 0.649, 0.665, 0.684, 0.709 at t = 0.25, …, 0.6). For
    a general cubic independent of z₁, Jensen gives only ‖P₂,₁k‖² ≤ min_x (ρ(x) − t)²/x = 0.8830, 0.8364, 0.7280,
    0.6029, 0.4637, 0.3894, which is **above** c_need(t) at every one of these t (N, computed for this file). So
    (2) with (3) closes the range up to about 0.6 for Gaussian remote cubics and for no other class as it stands.
  - What is missing is therefore a bound of Q(t) between the Jensen value and the Gaussian value: (3) combined
    with information on the law of |P₂,₁k| that excludes a nearly constant modulus (the radius bound, its
    s-dependent form, Stein-type identities for H₂,₁), and a treatment of the part of P₂,₁k that depends on z₁
    (its components along the visible Wick factors e₁₁, e₂₀, z, z̄, e₂₁; a proved six-term ellipsoid bounds them with
    weights between 1/2 and 4/3 times ε²(π/4 − t²), which loses a factor 2 on the remote part and is too weak
    here). A proof of "Q(t) ≤ c_need(t) on [1/4, t₂]" for some t₂ is a complete answer on that interval. Note that
    (2) cannot reach beyond t ≈ 0.61 even with the Gaussian value, so the upper part of the range needs the terms
    that (2) drops.
- **Keep the term −‖P₁,₀k‖² − η‖P₃,₂k‖².** In the row inequality these are dualised by auxiliary elements ξ ∈ H₁,₀
  and C ∈ H₃,₂. A row with a multiplier tied to the pair (C built from P₂,₁k) and a first-chaos element ξ kept is
  available as a proved inequality ("retained row"); its strength at small ℓ has not been explored.
- **Symmetrisation between the visible coordinate and the others** (a candidate named in the record): at small t the
  visible coordinate is one direction among many, and a bound for the game restricted to pairs with P₁,₀h = t·z₁
  might follow from averaging over rotations that mix z₁ with a second coordinate inside the potential.
- **A certified cover is plausible once a pointwise inequality exists.** If you can reduce the target to a
  pointwise inequality in finitely many complex parameters (as the row method does for larger t), the
  finite-dimensional part can be closed by interval arithmetic over a compactified domain plus analytic
  exteriors. This is how the analogous premise at degree 3 was proved (a 4-dimensional cover of ℂ³ modulo symmetry,
  about 1.2·10⁶ boxes, C++ with outward rounding and an exact rational verifier).

---

## 6. Deliverable

- A proof note with every step checkable, stating exactly the interval of t that it covers and the inputs it uses
  (which radius constant, which moment bounds).
- Every number the proof uses produced by a script delivered with it, in exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier); negative controls (for example: the same
  script must fail for the target 0.62 at t = 0.3, which explicit pairs exceed).
- Labels "P, author only" and "C, author only" on your results. Negative results are wanted too: a proof that a
  class of arguments cannot reach beyond some t, with the extremal object.

---

## 7. How to test a claimed bound

Any claimed inequality V ≤ B(t) must hold on these pairs (N; a three-dimensional quadrature over |z₁|, |W| and their
relative phase is enough):

1. **Driver pairs** f = ph(z₁ + cW), g = ph(z₁ − cW) as in §3 item 4. Formulas: with the orthonormal functions
   z₁, e₂₁(z₁), W ∈ their chaoses and e₃₂(z₁), (|z₁|² − 1)W, z₁²W̄/√2 ∈ H₃,₂,

       t = |⟨z₁, f⟩|,
       V = |⟨z₁, f⟩|² − ε(|⟨e₂₁, f⟩|² − |⟨W, f⟩|²) + η(|⟨e₃₂, f⟩|² − |⟨(|z₁|² − 1)W, f⟩|² − |⟨z₁²W̄/√2, f⟩|²),

   because g is f with W replaced by −W. The table of §3 must be reproduced; at c = 0, t = √π/2 and
   V = π/4 − ε·π/32 + η·3π/256 = 0.711697; as c → ∞, t → 0 and V → επ/4 = 0.612611.
2. **Richer driver pairs:** f = ph(z₁(1 + a·e₁₁-type corrections) + c·W(1 + b(|z₁|² − 1)) + d·z₁²W̄), g = f(W → −W);
   maximise V at fixed t over (a, b, c, d). The record's optimum at the peak t ≈ 0.85 is 0.71287; at t ∈ [0.25, 0.65]
   compare the maxima with the model values of §2; a pair of this family above the upper
   model values would be new information and should be reported.
3. **A remote-only pair:** f = ph(W), g = −f: t = 0, V = επ/4. And f = g = ph(z₁): t = √π/2, V = 0.711697.
4. **Finite-dimensional cubic drivers:** replace W by e₂₁(y) (one extra coordinate) and by (e₂₁(y₁) + e₂₁(y₂))/√2.
   The projections must then be computed in the variables (z₁, y); for these pairs the six-term formula of item 1
   is no longer exact, because higher Wick polynomials of y enter P₃,₂ (use a full quadrature of ⟨f, Tg⟩ through
   the Mehler/Wick expansion to degree 5). They test that a bound does not rely on W being Gaussian.
