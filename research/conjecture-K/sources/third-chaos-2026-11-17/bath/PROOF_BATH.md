<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/bath/PROOF_BATH.md (17 November 2026); a research worker of claude-b9ee, checking and repairing a Gemini proof relayed by the user. Its scripts and logs ("this folder") are in code/third-chaos-2026-11-17/bath/; its ../../he3-bath-family-2026-11-16/ is sources/third-chaos-2026-11-16/he3-bath-family/; the Gemini logs it cites by line (source/) are not copied (INVENTORY). Only this line was added. -->
# Theorem (A): E|a·He₃(X) + bXY + cZ| ≤ √(2/π)·‖F‖₂, the sharp bound on the Gaussian-bath family
**STATUS (claude-b9ee, 17 Nov 2026): PROVED, nothing missing.** Equality holds iff a = b = 0.
The proof is Gemini's (`source/gemini-chain.txt`, lines 2861–2922), checked step by step, with two repairs:
- **Case B, 1/9 < p ≤ 1/5 (line 2917) was wrong.** A factor-2 slip; the corrected bound (1.149) is below the needed
  1.869, so the method cannot close the case. It is replaced by a rigorous interval-arithmetic certificate on J itself (C, 172 boxes).
- **Case C, 1/5 < p < 1/3 (lines 2918–2921) stated a false chain** (a spurious factor 3). The conclusion is true with margin
  2.5·10⁻³: repaired by hand (P) and cross-checked by the same certificate (C, 106 boxes).
- **Everything else is correct:** Lemma 2.1, the majorants of Ψ, the outer region 3p + 5q ≥ 1, the corner bounds and Case A.
  I re-derived each step by hand (P); every number they use is checked in exact arithmetic (`verify_constants.log`, 77 checks).
Labels: **P** proved by hand here; **C** rigorous computation replayed by a script (log in this folder); **N** floating point, orientation only.

## Theorem (A)

Let X, Y, Z be independent standard Gaussians, a, b, c ∈ ℝ, and F = a(X³ − 3X) + bXY + cZ. Then E F² = 6a² + b² + c² and

    E|F| ≤ √(2/π) · √(6a² + b² + c²),

with equality if and only if a = b = 0.

Equivalently (Section 1): with p = 6a², q = b², c² = 1 − p − q, the function J(p, q) = E|F| satisfies J ≤ √(2/π) on the
triangle T = {p ≥ 0, q ≥ 0, p + q ≤ 1}, with equality only at (0, 0).

**Notation.** S := √(2/π). h(x) := x³ − 3x and H := h/√6 (E H(X)² = 1, E H(X)⁴ = 93). φ(x) := e^{−x²/2}/√(2π). W is
a standard Gaussian. Ψ(μ, v) := E|μ + √v·W| for μ ∈ ℝ, v ≥ 0. f(y) := e^{−y²/2} + y∫₀^y e^{−t²/2}dt. For (p, q) ∈ T:
μ(x) := √p·H(x), v(x) := qx² + 1 − p − q = 1 − p + q(x² − 1), m := 1 − p, J(p, q) := ∫Ψ(μ(x), v(x))φ(x)dx,
α(p) := 1/(2√(1−p)(2 − p + 2√(1−p))). Gemini writes h₃ for our H.

Map of the proof: Section 4 is the edge p = 0 and Section 5 the outer region 3p + 5q ≥ 1. The corner
K = {p > 0, 3p + 5q < 1} is split by p into Case A (Section 7, P), Case B (Section 8, C) and Case C (Section 9, P).
Sections 1–3 and 6 are shared tools.

## 1. Reduction (P)

E(X³ − 3X)² = 15 − 18 + 9 = 6, E(XY)² = E Z² = 1, and the cross terms vanish because E Y = E Z = 0. So
E F² = 6a² + b² + c². If 6a² + b² + c² = 0 then F = 0 and both sides vanish (equality, a = b = 0). Otherwise divide (a, b, c)
by √(6a² + b² + c²); both sides are positively homogeneous of degree 1. So let 6a² + b² + c² = 1, p = 6a², q = b², and
then c² = 1 − p − q and (p, q) ∈ T.

Given X = x, the variable bxY + cZ is N(0, b²x² + c²) = N(0, v(x)), so E[|F| | X = x] = Ψ(a·h(x), v(x)). By Tonelli,
E|F| = E Ψ(a·h(X), v(X)). Now a·h = ±√p·H, and Ψ is even in μ because W and −W have the same law, so E|F| = J(p, q).
Finally a = b = 0 ⇔ (p, q) = (0, 0), and J(0, 0) = E|Z| = S.

**Formula.** For v > 0, Ψ(μ, v) = √v·Ψ(μ/√v, 1). Also Ψ(y, 1) = 2φ(y) + y(2Φ(y) − 1) = S e^{−y²/2} + y·erf(y/√2) = S f(y),
because erf(y/√2) = S∫₀^y e^{−t²/2}dt. Hence

    Ψ(μ, v) = S√v·f(μ/√v) = √(2v/π)·e^{−μ²/(2v)} + μ·erf(μ/√(2v))   (v > 0),     Ψ(μ, 0) = |μ|.

f is even, f(0) = 1, f′(y) = ∫₀^y e^{−t²/2}dt and f″(y) = e^{−y²/2}. The last two are checked symbolically in
`verify_constants.log`, Section 3.

## 2. Constants (P; every item is checked exactly in `verify_constants.log`, Section 2)

| constant | proof |
|---|---|
| 25/8 < π < 22/7 | π = 6∫₀^{1/2}(1 − x²)^{−1/2}dx, and (1 − x²)(1 + x²/2)² = 1 − 3x⁴/4 − x⁶/4 < 1 on (0, ½), so π > 6∫₀^{1/2}(1 + x²/2)dx = 25/8. Also 0 < ∫₀¹x⁴(1 − x)⁴/(1 + x²)dx = 22/7 − π. (Gemini, Lemma 2.1, line 2865.) |
| 163/60 < e < 1631/600 < 68/25 | the partial sum up to k = 5 is 163/60, and Σ_{k≥6} 1/k! ≤ (1/720)Σ_j 6^{−j} = 1/600 (line 2866) |
| e^{−1/2} > 3/5 | e < 68/25 < 25/9 |
| e^{3/2} < 9/2, e^{−3/2} > 2/9, e^{9/2} < 729/8 < 92 | e³ < (68/25)³ = 314432/15625 < 81/4 (line 2867) |
| e³ < 21, e⁴ < 63 | (68/25)³ < 21, and e < 3 |
| e^{7/2} < 36, e^{49/8} < 756 | e^{7/2} < (25/9)^{7/2} = (5/3)⁷ = 78125/2187 < 36, and e^{49/8} < e^{13/2} = e^{7/2}e³ < 36·21 |
| √15 > 19/5, √π < 9/5, √(10/7) < 6/5 | 361 < 375; 22/7 < 81/25; 10/7 < 36/25 |
| e^{9/2} < 90.03 | from e < 1631/600: (1631/600)⁹ < 90.03² (used only to widen the margin in Section 9) |

## 3. Pointwise facts on Ψ (P)

**Lemma 3 (four majorants).** For μ ∈ ℝ and v > 0 (v ≥ 0 in (M1) and (M2)):

    (M1) Ψ(μ, v) ≤ √(μ² + (2/π)v)
    (M2) Ψ(μ, v) ≤ |μ| + S√v
    (M3) Ψ(μ, v) ≤ S(√v + μ²/(2√v))
    (M4) Ψ(μ, v) ≤ S(√v + μ²/(2√v) − μ⁴/(12√v(2v + μ²)))

*Proof.* (M2) is the triangle inequality, with E|W| = S. If v = 0, (M1) is an equality. For v > 0 put y = μ/√v.
By the formula of Section 1, (M3) and (M4) say f(y) ≤ 1 + y²/2 and f(y) ≤ 1 + y²/2 − y⁴/(12(2 + y²)), multiplied by
S√v; note S√v·y⁴/(12(2 + y²)) = S μ⁴/(12√v(2v + μ²)). Taylor's formula with integral remainder gives, for Y = |y|,

    f(y) = 1 + ∫₀^Y (Y − t)e^{−t²/2}dt = 1 + y²/2 − ∫₀^Y (Y − t)(1 − e^{−t²/2})dt.

(M3) follows from e^{−t²/2} ≤ 1. For (M4), e^s ≥ 1 + s gives 1 − e^{−t²/2} ≥ t²/(2 + t²) ≥ t²/(2 + y²) for 0 ≤ t ≤ Y, and
∫₀^Y (Y − t)t²dt = Y⁴/12. (These are Gemini's lines 2881 and 2887–2892.)

(M1) is Gemini's Komatsu argument (lines 2882–2886), the same as Lemma 2 of `../../he3-bath-family-2026-11-16/PROOF_as_pasted.md`.
Let y ≥ 0 and D(y) := y² + 2/π − Ψ(y, 1)², so D(0) = 0. Put E(y) := erf(y/√2) = d/dy Ψ(y, 1), G(y) := ∫_y^∞ e^{−s²/2}ds,
so that 1 − E(y) = S·G(y). Then D′ = 2y − 2Ψ(y, 1)E = 2S[y(1 + E)G − e^{−y²/2}E].

*Komatsu:* G(y) > r(y)e^{−y²/2} with r(y) := 2/(√(y² + 4) + y) = (√(y² + 4) − y)/2 ∈ (0, 1]. Indeed r² + yr = 1 and
r′ = −r/√(y² + 4). For g := G − r e^{−y²/2} this gives g′ = r e^{−y²/2}(1/√(y² + 4) − r) = r e^{−y²/2}(y√(y² + 4) − y² − 2)/(2√(y² + 4)) < 0,
since (y² + 2)² − y²(y² + 4) = 4. And g(∞) = 0, because 0 ≤ G(y) ≤ e^{−y²/2}/y and r ≤ 1. Hence g > 0.

Since y(1 + E) ≥ 0, D′ ≥ 2S e^{−y²/2}[y(1 + E)r − E] = 2S e^{−y²/2}·r·(y − E r), using 1 − yr = r². And y − Er ≥ 0, because
r ≤ 1 and 0 ≤ E(y) = S∫₀^y e^{−t²/2}dt ≤ Sy ≤ y (as π > 2). So D ≥ 0, i.e. Ψ(y, 1) ≤ √(y² + 2/π). Scaling and evenness give (M1). ∎

**Lemma 4 (monotonicity).** For v ≥ 0, Ψ(μ, v) is nondecreasing in |μ| (v fixed) and nondecreasing in v (μ fixed).

*Proof.* μ ↦ E|μ + √v W| is convex, as an average of convex functions, and even, since W and −W have the same law.
A convex even function is nondecreasing on [0, ∞): for 0 ≤ μ₁ < μ₂, write μ₁ = λμ₂ + (1 − λ)(−μ₂) with λ ∈ [½, 1].
In the same way σ ↦ E|μ + σW| is convex and even on ℝ, hence nondecreasing in σ ≥ 0, that is, in v = σ². ∎

## 4. The edge p = 0 (P; Gemini line 2879, correct)

J(0, q) = E Ψ(0, v(X)) = S·E√(1 + q(X² − 1)) ≤ S·√(E[1 + q(X² − 1)]) = S by Jensen. The inequality is strict for q > 0,
because √ is strictly concave and 1 + q(X² − 1) is not almost surely constant.

## 5. The outer region 3p + 5q ≥ 1 (P; Gemini Step 3.2, lines 2893–2901, correct)

This is the weighted bound of the earlier 0.8143 proof (`PROOF_as_pasted.md`, steps 4–5), with sharper vertex estimates.
Let w(x) := √(3/(2π))·e^{λx²/2} with λ = 7/25, and R(x) := μ(x)² + (2/π)v(x) = pH(x)² + (2/π)(1 − p + q(x² − 1)).
By (M1) and √R ≤ w/2 + R/(2w),

    J(p, q) ≤ L(p, q) := ½∫wφ + ½∫(R/w)φ   (Gemini line 2896, whose formula was lost in the text export).

R is affine in (p, q), so L(p, q) = (1 − p − q)L(0, 0) + pL(1, 0) + qL(0, 1). The moments needed are
∫x^{2k}e^{∓λx²/2}φ dx = (2k − 1)!!(1 ± λ)^{−k−1/2}, with 1 − λ = 18/25 and 1 + λ = s = 32/25. They give

- ½∫wφ = 5/(4√(3π)) and L(0, 0) = 5/(2√(3π)) = (5/√24)·S;
- L(0, 1) = ((1 + 1/s)/2)·L(0, 0) = (57/64)·L(0, 0);
- L(1, 0) = ½(1 + cπ)·L(0, 0), with c = (1/12)(15/s³ − 18/s² + 9/s) = 34925/131072.

Hence, exactly (`verify_constants.log`, Section 5):

- L(0, 0) < (49/48)S, since 25·48² = 57600 < 57624 = 24·49²;
- L(0, 1) < (44/48)S, since (57/64)²(25/24) = 27075/32768 < 121/144;
- L(1, 0) < ½(1 + (22/7)c)(5/√24)S = (4214635/(917504√24))·S < (46/48)S.

So on all of T,

    J(p, q) ≤ L(p, q) < ((49 − 3p − 5q)/48)·S,

and J < S wherever 3p + 5q ≥ 1.

## 6. The corner K = {(p, q) ∈ T : p > 0, 3p + 5q < 1}: shared bounds (P; Gemini lines 2902–2911, correct)

On K: 0 < p < 1/3, 0 ≤ q < (1 − 3p)/5 < 1/5, and m = 1 − p > 2/3. Moreover q/m < (1 − 3p)/(5(1 − p)) ≤ 1/5 < 3/10.
Write v(x) = m(1 + u(x)), with u(x) := (q/m)(x² − 1) ≥ −q/m > −3/10.

**6.1 E√v(X) ≤ √m − q²/10.** Put P(u) := 1 + u/2 − u²/8 + u³/16. For u ≥ −1, P(u) > 0, because P(−1) = 5/16 and P′ has
negative discriminant. Moreover P(u)² − (1 + u) = u⁴(16 + (2 − u)²)/256 ≥ 0, so √(1 + u) ≤ P(u). With E(X² − 1) = 0,
E(X² − 1)² = 2 and E(X² − 1)³ = 8:

    E√v = √m·E√(1 + u) ≤ √m(1 − (q/m)²/4 + (q/m)³/2) = √m − (q²/m^{3/2})(1/4 − q/(2m)) ≤ √m − q²/(10m^{3/2}) ≤ √m − q²/10.

**6.2 E[H²/√(1 + u)] ≤ 1, hence E[μ²/(2√v)] = (p/(2√m))·E[H²/√(1 + u)] ≤ p/(2√m).** Since E H² = 1, it suffices to show
E[H²((1 + u)^{−1/2} − 1)] ≤ 0. Split according to |X|.

- *|x| ≤ 1.* Here u ∈ (−3/10, 0]. The function (1 + u)^{−1/2} is convex, so on [−3/10, 0] it lies below its chord, whose
  slope is −(√(10/7) − 1)/(3/10) > −(6/5 − 1)/(3/10) = −2/3. Hence (1 + u)^{−1/2} − 1 ≤ −(2/3)u = (2/3)(q/m)(1 − x²).
  Using H² = x²(3 − x²)²/6 and φ ≤ 1/√(2π), this part is at most
  (2/3)(q/m)·(2/√(2π))∫₀¹(1 − x²)x²(3 − x²)²/6 dx = (2/3)(q/m)·8/(27√(2π)) = (16/81)(q/m)/√(2π).
- *|x| > 1.* Here u > 0, so (1 + u)^{−1/2} − 1 < 0. On 5/2 ≤ |x| ≤ 7/2 moreover 0 < u ≤ (3/10)(45/4) = 27/8 < 7/2. For
  0 < u ≤ 7/2, (1 + u)(1 − u/7)² − 1 = (u/49)(35 − 13u + u²) > 0 (the quadratic decreases on [0, 13/2] and equals 7/4 at 7/2),
  and 1 − u/7 > 0, so (1 + u)^{−1/2} − 1 ≤ −u/7. This part is at most −(1/7)(q/m)·E[H²(X² − 1); 5/2 ≤ |X| ≤ 7/2].
- *That expectation.* (x² − 1)H(x)² is nondecreasing on [√3, ∞) and e^{−x²/2} is decreasing. On [5/2, 11/4],
  (x² − 1)H² ≥ 29575/512 > 57 and e^{−x²/2} ≥ e^{−121/32} > e^{−4} > 1/63. On [11/4, 3], (x² − 1)H² ≥ 22568315/131072 > 172
  and e^{−x²/2} ≥ e^{−9/2} > 1/100. On [3, 7/2], (x² − 1)H² ≥ 432 and e^{−x²/2} ≥ e^{−49/8} > 1/756. Counting both signs of x,
  E[H²(X² − 1); 5/2 ≤ |X| ≤ 7/2] ≥ (½·57/63 + ½·172/100 + 432/756)/√(2π) = (989/525)/√(2π).
- *Total.* E[H²((1 + u)^{−1/2} − 1)] ≤ (q/m)(16/81 − 989/3675)/√(2π) < 0.

**6.3 The master inequality.** Apply (M4) at each x, then 6.1 and 6.2:

    J/S ≤ E√v + E[pH²/(2√v)] − (p²/12)·E_{p,q} ≤ √m + p/(2√m) − q²/10 − (p²/12)·E_{p,q},
    E_{p,q} := E[H(X)⁴ / (√v(X)·(2v(X) + pH(X)²))] > 0.

Next, √(1 − p) + p/(2√(1 − p)) − 1 = α(p)p², because (2 − p − 2√(1−p))(2 − p + 2√(1−p)) = p². The function α is increasing
on [0, 1) (its denominator is a product of positive decreasing functions), and α(0) = 1/8. So on K:

    (6.3)   J(p, q)/S − 1 ≤ α(p)p² − q²/10 − (p²/12)·E_{p,q}.

*Why this works at the corner (the point to check hardest).* The first-order terms cancel exactly:
√(1 − p) + p/(2√(1 − p)) = 1 + O(p²). As (p, q) → 0, E_{p,q} → E H⁴/2 = 93/2, so the right side of (6.3) equals
−(15/4)p² − q²/10 + o(p² + q²). The truth (N, Section 12) is J/S − 1 = −(15/4)p² − (3/2)pq − (1/4)q² + O(3), which is
−κ₄(F)/24. So (6.3) has the exact p²-coefficient, a negative q²-coefficient, and drops the cross term (whose sign is
favourable). Its right side is negative definite at second order, which a bound must be in order to work at (0, 0).

## 7. Case A: 0 < p ≤ 1/9 (P; Gemini lines 2911–2916, correct)

First, α(p) ≤ α(1/9) < 1/7. For p ≤ 1/9, √(1 − p) ≥ √(8/9) > 16/17 and 2 − p ≥ 17/9, so the denominator of α satisfies
2√(1 − p)(2 − p + 2√(1 − p)) > (32/17)(17/9 + 32/17) = 18464/2601 > 7.

**(i) q ≥ 6p/5.** By (6.3), J/S − 1 ≤ α(p)p² − q²/10 < p²/7 − (36/250)p² < 0, because 36/250 > 1/7.

**(ii) q < 6p/5, so q < 2/15.** We bound E_{p,q} from below, keeping only |X| ≥ √3 and substituting x² = 2w + 3 with w ≥ 0.
Then H² = (2/3)w²(2w + 3), H⁴ = (4/9)w⁴(2w + 3)², and 2∫_{√3}^∞ g(x)φ(x)dx = (2e^{−3/2}/√(2π))∫₀^∞ g·e^{−w}dw/√(2w + 3).
Moreover

- v = 1 − p + q(2w + 2) ≤ (4w + 19)/15;
- √v·√(2w + 3) ≤ √((4w + 19)(4w + 6)/30) ≤ (4w + 25/2)/√30, by AM–GM;
- 2v + pH² ≤ G(w) := (8w + 38)/15 + (2/27)w²(2w + 3), using p ≤ 1/9.

So E_{p,q} ≥ (2e^{−3/2}/√(2π))·(4/9)√30·∫₀^∞ w⁴(2w + 3)²/((4w + 25/2)G(w))·e^{−w}dw. Apply Cauchy–Schwarz, ∫A²/B ≥ (∫A)²/∫B,
with A = w³(2w + 3) and B = w²(4w + 25/2)G(w) against e^{−w}dw. Here ∫A e^{−w}dw = 66 and ∫B e^{−w}dw = 9338/9. Hence

    E_{p,q} ≥ (8√15·e^{−3/2}/(9√π))·(39204/9338) > (304/729)(39204/9338) = 73568/42021 > 12/7,

using √15 > 19/5, e^{−3/2} > 2/9 and √π < 9/5. So E_{p,q}/12 > 1/7 > α(p), and by (6.3), J/S − 1 ≤ p²(α(p) − E_{p,q}/12) < 0.
(Every number: `verify_constants.log`, Section 7.)

## 8. Case B: 1/9 < p ≤ 1/5 (C; replaces Gemini line 2917)

**Lemma 5 (box bound; P).** Let B = [p₀, p₁] × [q₀, q₁] ⊂ T. Put M_B(x) := √(p₁/6)(x³ − 3x), and
V_B(x) := 1 − p₀ + q₀(x² − 1) for |x| < 1, V_B(x) := 1 − p₀ + q₁(x² − 1) for |x| ≥ 1, and
U(B) := ∫Ψ(M_B(x), V_B(x))φ(x)dx. Then J(p, q) ≤ U(B) for every (p, q) ∈ B.

*Proof.* For (p, q) ∈ B and every x, |μ(x)| = √(p/6)|h(x)| ≤ |M_B(x)|. Also v(x) = 1 − p + q(x² − 1) ≤ V_B(x), because the
coefficient of q has the sign of x² − 1. Lemma 4 gives the claim at each x; integrate. ∎

**The certificate** (`certify_caseB.py` → `certify_caseB.log`; Arb through python-flint 0.9.0, 80-bit balls).

*Cover.* K_B := {1/9 < p ≤ 1/5, q ≥ 0, 3p + 5q < 1} lies in the union of the 172 boxes [i/128, (i+1)/128] × [k/128, (k+1)/128]
with 14 ≤ i ≤ 25 and k/128 < (1 − 3i/128)/5. Indeed, a point with p ∈ [i/128, (i+1)/128] has q < (1 − 3p)/5 ≤ (1 − 3i/128)/5.
All boxes satisfy p₁ + q₁ < 1, and their endpoints are dyadic, hence exact in Arb.

*Integrals.* For each box, U(B) = 2(∫₀¹ + ∫₁³ + ∫₃⁶ + ∫₆¹⁰) + tail, since the integrand is even in x. Each integral is
enclosed by `acb.integral`, which is Arb's rigorous Gauss–Legendre integration with error bounds from analyticity.
The integrand (S√V e^{−M²/(2V)} + M·erf(M/√(2V)))·φ is built from polynomials, exp, erf (all entire), division, and √ called
with the `analytic` flag. Arb therefore returns a non-finite ball whenever a branch cut or pole could be touched, and then
subdivides.

*Tail.* The tail over |x| ≥ 10 lies in [0, 2(99√(p₁/6) + 2S)φ(10)] ⊂ [0, 10⁻²⁰]. This follows from (M2) together with
√V_B ≤ √(1 + x²) ≤ 1 + x, ∫_L^∞(x³ − 3x)φ = (L² − 1)φ(L), ∫_L^∞φ ≤ φ(L)/L and ∫_L^∞xφ = φ(L).

*Result.* Every one of the 172 boxes gives S − U(B) > 0 as a ball, and none needed bisection. The smallest certified margin
is S − U(B) ≥ 0.006396 on [7/64, 15/128] × [0, 1/128], next to (1/9, 0), where S − J = 0.0100. The run takes 1.6 s.
By Lemma 5, J < S on K_B.

The four sanity lines at the top of the log (degenerate boxes, which give J itself) agree with the independent numpy
quadrature of `numerics.log` to 10⁻¹¹ (N).

*Why not repair Gemini's route here (N).* The inequality that (6.3) needs in Case B, E_{p,q} > 12α(p) − 1.2q²/p², is true:
on sampled points its smallest margin is 0.43, at (1/5, 2/25). But Gemini's Cauchy–Schwarz bound on {|X| ≥ √3} with
worst-case p and q gives only 1.149 there (Section 11), so a hand proof would need a sharper lower bound for E_{p,q}.
The certificate on J is shorter and does not depend on (6.3).

## 9. Case C: 1/5 < p < 1/3 (P; repairs Gemini lines 2918–2921; cross-checked by C)

Here q < (1 − 3/5)/5 = 2/25 and m < 4/5. So for |x| ≥ 3, v(x) < 4/5 + (2/25)(x² − 1) = (18 + 2x²)/25 ≤ 4x²/25, that is
√v < (2/5)|x|. Use (M3) on {|X| < 3} and (M2) on {|X| ≥ 3}:

    J/S ≤ E√v + E[μ²/(2√v)] − E[μ²/(2√v); |X| ≥ 3] + √(π/2)·E[|μ|; |X| ≥ 3].

By 6.1 and 6.2, the first two terms are at most √m − q²/10 + p/(2√m) = 1 + α(p)p² − q²/10. Next,

- E[μ²/(2√v); |X| ≥ 3] > (5p/4)E[H²/|X|; |X| ≥ 3] = (5p/4)·68e^{−9/2}/(3√(2π)) = (85/(3√(2π)))e^{−9/2}·p, because
  E[H²/|X|; |X| ≥ 3] = (1/(3√(2π)))∫_{9/2}^∞(2s − 3)²e^{−s}ds = 68e^{−9/2}/(3√(2π));
- √(π/2)·E[|μ|; |X| ≥ 3] = √(π/2)·√p·(2/(√6·√(2π)))·∫₃^∞(x³ − 3x)e^{−x²/2}dx = (4√6/3)e^{−9/2}√p, because
  (x³ − 3x)e^{−x²/2} = d/dx[(1 − x²)e^{−x²/2}].

Therefore J/S − 1 ≤ α(p)p² − q²/10 − s(p), where s(p) := e^{−9/2}(A·p − B·√p), A := 85/(3√(2π)) and B := 4√6/3.

**Claim: s(p) > α(p)p² on (1/5, 1/3).** Put t := p^{−1/2} ∈ (√3, √5). Then s(p)/p² = g(t) := e^{−9/2}(At² − Bt³), and
g′(t) = e^{−9/2}t(2A − 3Bt) > 0 for t < 2A/(3B) = 85/(12√(3π)). Now 85/(12√(3π)) > √5 ⇔ 7225 > 2160π, which holds since
π < 22/7. So g increases on [√3, √5]: for p < 1/3, s(p)/p² > g(√3) = e^{−9/2}(85/√(2π) − 12√2). On the other side,
α(p) < α(1/3) = 3/(8 + 10√(2/3)). Finally, with π < 22/7 (so 1/√(2π) > √(7/44) ≥ 0.398862), √2 ≤ 1.414214,
√(2/3) ≥ 0.816496 and e^{9/2} < 90.03:

    e^{−9/2}(85/√(2π) − 12√2) > (85·0.398862 − 12·1.414214)/90.03 = 0.188078… > 0.185587… = 3/(8 + 10·0.816496) ≥ α(1/3).

This is an exact rational comparison (`verify_constants.log`, Section 9). With only Lemma 2.1's e^{9/2} < 729/8 the left side
is 0.185818, which still suffices (margin 2.3·10⁻⁴). Hence J < S in Case C.

*Cross-check (C, not needed by the proof):* the second part of `certify_caseB.log` covers
{25/128 ≤ p ≤ 43/128, 0 ≤ q ≤ (1 − 3p)/5} ⊇ Case C by 106 boxes of side 1/128. All are certified; the smallest margin is 0.0192.

## 10. Conclusion (P + C)

T is the union of the point (0, 0), the edge {p = 0 < q} (Section 4), the outer region {3p + 5q ≥ 1} (Section 5), and the
corner K. K in turn is the union of {0 < p ≤ 1/9} (Section 7), {1/9 < p ≤ 1/5} (Section 8) and {1/5 < p < 1/3} (Section 9),
each intersected with 3p + 5q < 1. J(0, 0) = S, and J < S on every other piece. By Section 1 this is Theorem (A), with equality
exactly when a = b = 0. ∎

## 11. What was wrong or missing in the Gemini proof (line numbers of `source/gemini-chain.txt`)

1. **Line 2917, Case B (1/9 < p ≤ 1/5): wrong, and not repairable by arithmetic.**
   - *The slip.* The text claims (1/12)E_{p,q} > (1/12)·18392/8319 > 10/63. But its own expression with its own constants equals
     (24√15e^{−3/2}/(9√π))·(39204/44368) > (912/729)·(9801/11092) = 9196/8319 = 1.105, exactly half of 18392/8319. The draft at
     line 2398 writes 242 where 9801/81 = 121 belongs: 242 = 19602/81 is the factor of Case A, where the ratio was 39204/9338 = 19602/4669.
   - *Why it cannot be fixed.* With exact constants the bound is 1.149, and the case needs E_{p,q} > 12α(p): up to
     12α(1/5) > 1.868, or 1.905 with Gemini's own α(p) < 10/63. It even fails at p = 1/9, where 12α = 1.69.
   - *The truth.* The inequality itself is true there (N: smallest E_{p,q} on Case B ≈ 2.11), but the Cauchy–Schwarz bound
     restricted to |X| ≥ √3 with worst-case p and q loses too much. Replaced by the certificate of Section 8.
2. **Lines 2918–2921, Case C (1/5 < p < 1/3): false chain, true conclusion.**
   - *What is wrong.* The bound at p = 1/3 is written as 3e^{−9/2}(85/√(2π) − 12√2)p² > (3/92)(100/3 − 17)p² = (49/92)p² > p²/5 > α(p)p²,
     with a spurious factor 3. The saving divided by p² at p = 1/3 is e^{−9/2}(85/√(2π) − 12√2) = 0.18818. With the stated
     constants (√(2π) < 51/20, 12√2 < 17, e^{9/2} < 92) it is only > 49/276 = 0.1775 < α(1/3) = 0.18559, and the step "> p²/5"
     is false (0.18818 < 0.2).
   - *Why the conclusion holds.* The true margin is 0.0026 at p = 1/3 and is provable with π < 22/7 and e^{9/2} < 729/8
     (Section 9). The monotonicity "the saving divided by p² is strictly decreasing" is asserted without proof; it holds
     because π < 3.3449 (Section 9).
3. **Formulas lost in the text export (not Gemini's error).** Lines 2890, 2896, 2907, 2915 and 2921 lost their symbols.
   I reconstructed them from the longer derivation earlier in the file (lines 1968–2460) and checked them:
   - 2890 is (M4);
   - 2896 is J ≤ L = ½∫wφ + ½∫(μ² + (2/π)v)/w·φ;
   - 2907 is E√v ≤ √(1 − p)(1 − q²/(4m²) + q³/(2m³)) ≤ √(1 − p) − q²/10;
   - 2915 is (1/12)E_{p,q} > (1/12)(8√15e^{−3/2}/(9√π))(39204/9338) > (1/12)(73568/42021) > 1/7;
   - 2921 is item 2.
4. **Correct as written** (each step re-derived here, every number checked exactly): Lemma 2.1 (2863–2867), the reduction
   and p = 0 (2876–2879), both majorants (2880–2892), the outer region (2893–2901), the corner bounds 6.1–6.3 (2903–2911)
   and Case A (2912–2916). In line 2910 the constant 572/2205 is a valid but weaker form of 989/3675.
5. **A wrong estimate in the draft (no effect on the final text).** At line 2431 the draft estimates E_{1/3,0} ≈ 1.66 < 2
   and therefore leaves the quartic route for Case C. The true value is 2.317 > 12α(1/3) = 2.227 (N).

## 12. Numerical orientation (N; `numerics.log`)

- *Maximum of J.* On a 7381-point grid of T (step 1/120) the maximum of J is S, attained only at (0, 0).
- *Deficit near the corner.* Compare S − J with the second-order term S(15/4·p² + 3/2·pq + 1/4·q²) = S·κ₄(F)/24.
  The ratio is 0.948 at (10⁻³, 0) and 0.998 at (0, 10⁻³), and its smallest value on [0, 0.05]² is 0.41, at (0.05, 0).
  Along q = 0, (S − J)/(Sp²) is 3.56, 2.65, 1.08 and 0.53 at p = 0.001, 0.01, 0.1 and 1/3. The convergence to 15/4 is slow
  because the higher-order terms are large (E H⁶ = 53745).
- *The corner bound (6.3).* Against the truth, 6.1 and 6.2 hold at every sampled point of K, and E_{p,q} exceeds what (6.3)
  needs everywhere sampled. The smallest margin is 0.039, at (0.3, 0.02), next to 3p + 5q = 1.
- *Monte Carlo.* With 8·10⁷ samples (20 seeds) at (1/9, 0), (0.05, 0.1) and (0.2, 0.08), Monte Carlo agrees with the
  quadrature (|z| ≤ 0.8).
- *Gemini's Case B.* Its bound with exact constants is 1.149; the case needs 12α(1/5) = 1.869; the true minimum of E_{p,q}
  on Case B is about 2.109.
- *Case C.* s(p)/p² − α(p) is 0.066, 0.046, 0.021 and 0.0026 at p = 0.2, 0.25, 0.3 and 1/3.

## 13. Files and replay

All files are in `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/bath/`:

- `PROOF_BATH.md`: this file.
- `verify_constants.py` → `verify_constants.log`: 77 exact checks (fractions, sympy), all PASS.
- `certify_caseB.py` → `certify_caseB.log`: the Case B certificate (C) and the Case C cross-check.
- `numerics.py` → `numerics.log`: floating point (N).
- `environment.txt`: Python 3.12.3, python-flint 0.9.0, sympy 1.14.0, numpy 2.5.5, scipy 1.18.1, Linux x86_64 (yo).

To replay: `python3 -m venv venv && venv/bin/pip install python-flint sympy numpy scipy`, then
`venv/bin/python -I <script>.py > <script>.log` for each script. Each exits with status 0 on success; the three take about
a minute together on two cores.

**Proposed ledger text** (K ledger, row 3.21 (e), replacing "the sharp constant on the family is not proved"):
"the sharp constant holds on the family: E|F| ≤ √(2/π)‖F‖₂, with equality iff a = b = 0 (**P** + **C**: a Gemini proof
relayed by the user, 17 Nov 2026, checked and repaired by claude-b9ee. Its Case B was wrong and is replaced by an Arb
certificate of 172 boxes; its Case C constant was corrected; `gemini-log-2026-11-17/bath/PROOF_BATH.md`)".
