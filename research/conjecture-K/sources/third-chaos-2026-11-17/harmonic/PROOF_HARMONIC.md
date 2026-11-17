<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/harmonic/PROOF_HARMONIC.md (17 November 2026); a research worker of claude-b9ee, proving four claims of a Gemini text relayed by the user. Its scripts and logs are in code/third-chaos-2026-11-17/harmonic/. Only this line was added. -->
# (H1)–(H4): the trigonometric lemma, harmonic cubics, the rank-one criterion, the complete cubics e₃
**VERDICT (claude-b9ee, 17 Nov 2026): all four claims are TRUE and now proved, nothing missing** (P by hand; every constant in exact arithmetic, `verify_harmonic.log`, 48 checks).
- **(H1) TRUE.** The global maximum of ‖g‖₁/‖g‖₂ on span{cos a, sin a, cos 3a, sin 3a} is 4√5/(3π), attained exactly at the rotations of sin a + (1/3)sin 3a.
  The proof uses duality with sign functions, not a two-parameter search. This is GPT's angular lemma in the records, here re-derived.
- **(H2) TRUE.** E|H| ≤ κ_n·(4√5/(3π))·‖H‖₂ for every harmonic cubic on ℝⁿ. Exactly: κ_n·4√5/(3π) < √(2/π) for n ≤ 11 (0.797225 at n = 11), and > √(2/π) for n ≥ 12 because κ_n increases. Multilinear square-free cubics in ≤ 11 variables follow.
- **(H3) TRUE with exact constants.** E|P|/√(2/π) ≤ (5/(4√6))[1 + π(34925a²/131072 + 25b²/64 + c²/2)], so E|P| < √(2/π) whenever
  (30611/131072)a² + (7/64)b² > 1/2 − (4√6 − 5)/(5π) = 0.194553… (a rational sufficient form: ≥ 487/2500). It requires a² > 0.686, so it only applies near a dominant He₃ direction.
- **(H4) TRUE.** E|e₃|/‖e₃‖₂ < √(2/π) for every N ≥ 3: (H2) gives N ≤ 11, and (H3) gives N ≥ 11 (0.99429 at N = 11, 0.98936 at N = 12, decreasing to 0.93749).
- **Records (STATUS.md 3.21 (e)).** (H1) and the first-order condition of (H3) are already there (GPT, author only). New are (H2) for 8 ≤ n ≤ 11, the (H3) criterion, and e₃ for 8 ≤ N ≤ 25 (N ≤ 7 was covered by the seven-coordinate theorem, N ≥ 26 by κ₄ ≥ 74).
Labels: **P** proved by hand here; **C** rigorous computation replayed by a script (none needed); **N** floating point, orientation only.

## Notation

S := √(2/π), c₃ := 4√5/(3π) = √80/(3π) = 0.949017.
On the circle, ⟨f, g⟩ := (1/2π)∫₀^{2π} f g da, with ‖·‖₁ and ‖·‖₂ for the same normalised measure. V := span{cos a, sin a, cos 3a, sin 3a},
and P_V is the orthogonal projection onto V.
h₃ := He₃/√6 and h₂ := He₂/√2 are the unit Hermite polynomials. Z is a standard Gaussian vector.
An element of the third Wiener chaos of ℝ^N is P = Σ T_ijk :Z_iZ_jZ_k: = I₃(T) with T a symmetric 3-tensor, and E P² = 6‖T‖_F².
A homogeneous cubic H lies in the third chaos iff it is harmonic: the Ornstein–Uhlenbeck operator gives
(Δ − x·∇)H = ΔH − 3H, and ΔH is linear. In general the third-chaos element with top part H is H − ΔH/2.

## H1. The trigonometric lemma (P)

**Lemma H1.** For every g ∈ V, ‖g‖₁ ≤ c₃‖g‖₂. Equality holds iff g = λ(sin(a − θ) + (1/3)sin 3(a − θ)) for some λ ∈ ℝ, θ ∈ ℝ.

*Proof.* Let g ≠ 0.

(i) *Sign structure.* Write g = Re(c₁e^{ia} + c₃e^{3ia}). With ζ = e^{ia}, 2ζ³g = c₃ζ⁶ + c₁ζ⁴ + c̄₁ζ² + c̄₃ is a polynomial of degree at most 6
that is not identically zero, so g has at most 6 zeros in [0, 2π). Only odd frequencies occur, so g(a + π) = −g(a). Hence the
zero set is invariant under a ↦ a + π, and any half-open half-period [θ, θ + π) contains at most 3 zeros. Since g changes sign
between a and a + π, the number m of sign changes in such a half-period is odd. So m ∈ {1, 3}, and σ := sign g is (a.e.) a ±1
anti-periodic step function with m jumps per half-period, alternating in sign.

(ii) *Duality.* ‖g‖₁ = ⟨g, σ⟩ = ⟨g, P_Vσ⟩ ≤ ‖g‖₂·‖P_Vσ‖₂, and ‖P_Vσ‖₂² = 2|σ̂(1)|² + 2|σ̂(3)|² (σ is real).

(iii) *Fourier coefficients.* For odd k, anti-periodicity gives σ̂(k) = (1/π)∫₀^π σe^{−ika}da. Put one jump at 0 by rotation; this does
not change |σ̂(k)|.
- If m = 1, then σ = ±sign(sin a) and |σ̂(k)| = 2/(πk). So ‖P_Vσ‖₂² = (8/π²)(1 + 1/9) = 80/(9π²) = c₃².
- If m = 3, let the jumps be at 0, x and x + y, with gaps x, y and z := π − x − y, all > 0. Then
  σ̂(k) = (2/(πik))(1 − e^{−ikx} + e^{−ik(x+y)}), and, using cos k(x + y) = −cos kz for odd k,

      ‖P_Vσ‖₂² = (8/π²)·Φ,   Φ := 3 − 2Σcos x_i + (1/9)(3 − 2Σcos 3x_i)   (x_i = x, y, z).

(iv) *The key identity.* With Π₁ := Π sin(x_i/2) and Π₃ := Π sin(3x_i/2), and x + y + z = π:

      Φ = 10/9 − (8/9)(9Π₁ − Π₃).

This follows from Σcos x_i = 1 + 4Π₁ and Σcos 3x_i = 1 − 4Π₃, which are the standard triangle identities (the second because
3x + 3y + 3z = 3π), and from cos 3x = 4cos³x − 3cos x. It is also checked as a Laurent-polynomial identity in e^{ix/2} and e^{iy/2}
in `verify_harmonic.log`.

(v) *The inequality.* sin 3s = sin s·(1 + 2cos 2s), so Π₃ = Π₁·Π(1 + 2cos x_i). I claim Π(1 + 2cos x_i) ≤ 8:
- At most one factor is negative, because 1 + 2cos x < 0 needs x > 2π/3 and two such angles exceed π. If one is negative or
  zero, the product is ≤ 0.
- If all are positive, AM–GM gives Π(1 + 2cos x_i) ≤ ((3 + 2Σcos x_i)/3)³. And Σcos x_i = 1 + 4Π₁ ≤ 3/2, because
  Π₁ ≤ sin³(π/6) = 1/8 by concavity of log sin on (0, π) with Σx_i/2 = π/2. So the product is ≤ 2³ = 8.

Since Π₁ > 0 when all gaps are positive, 9Π₁ − Π₃ ≥ Π₁ > 0, hence Φ ≤ 10/9 − (8/9)Π₁ < 10/9 and ‖P_Vσ‖₂² < 80/(9π²).

(vi) *Conclusion and equality.* In every case ‖g‖₁ ≤ c₃‖g‖₂. Equality forces m = 1, σ = ±sign(sin(a − θ)), and g = λ·P_Vσ with λ > 0
(the equality case of Cauchy–Schwarz in V). Now P_V sign(sin a) = (4/π)(sin a + (1/3)sin 3a). Conversely,
g = sin a + (1/3)sin 3a = 2 sin a(1 − (2/3)sin²a) has the sign of sin a, ‖g‖₁ = 20/(9π) and ‖g‖₂ = √5/3, so the ratio is c₃. ∎

*The two-parameter form (N).* After a rotation and a reflection, g = cos t·cos a + sin t·cos(3a + ψ) with t ∈ [0, π/2] and ψ ∈ [0, π].
On a 181 × 91 grid the ratio peaks at 0.9490161, at (t, ψ) = (0.3229, π). The proof's maximiser is t = arctan(1/3), ψ = π, that is
g ∝ cos a − (1/3)cos 3a, with value c₃ = 0.9490167. The minimum of the ratio on the family is 0.7236. The proof above gives the
global maximum directly, so no certified search is needed.

*Records.* This is the angular lemma of `research/conjecture-K/sources/third-chaos-2026-11-16/gpt/binary_cubic_proof.tex`, with the
same route. Its S equals our Π₁, its S₃ equals −Π₃, and its key inequality "S₃ ≥ −8S" is our Π₃ ≤ 8Π₁, proved there by a different
factorisation. The ledger lists it as author only, checked numerically by claude-b9ee. It is now re-derived by hand, with exact
checks.

## H2. Harmonic cubics (P)

**Theorem H2.** Let n ≥ 2, X ~ N(0, Iₙ), and let H ≢ 0 be a harmonic homogeneous cubic on ℝⁿ. Then

    E|H(X)| ≤ κ_n·c₃·‖H‖₂,   κ_n := E R³/(E R⁶)^{1/2},  R ~ χ_n,

and κ_n·c₃ < √(2/π) iff n ≤ 11. In particular E|H(X)| < √(2/π)‖H‖₂ for 2 ≤ n ≤ 11.

*Proof.*
- *Polar decomposition.* Write X = RΘ with R = |X| ~ χ_n independent of Θ, which is uniform on S^{n−1}. Homogeneity gives
  H(X) = R³Y(Θ) with Y := H|_{S^{n−1}}, so E|H(X)| = E R³·E|Y(Θ)| and E H(X)² = E R⁶·E Y(Θ)².
- *Great circles.* If G is Haar-distributed on SO(n) and α is uniform on [0, 2π), independent of G, then G(e₁cos α + e₂sin α)
  is uniform on the sphere. So E|Y(Θ)| = E_G[(1/2π)∫|Y(Ge₁cos α + Ge₂sin α)|dα]. For fixed G the integrand is the restriction of H
  to a great circle, a cubic form in (cos α, sin α), hence an element of V (cos³ = (3cos + cos 3)/4 and so on, in the log).
- *Lemma H1 and Cauchy–Schwarz.* Lemma H1 on each circle, then Cauchy–Schwarz over G, give
  E|Y(Θ)| ≤ c₃·E_G[circle-average of Y²]^{1/2} ≤ c₃·(E Y(Θ)²)^{1/2}. Hence E|H(X)| ≤ κ_n c₃‖H‖₂.
- *The constants (exact, `verify_harmonic.log`).* E R^{2s} = 2^sΓ(n/2 + s)/Γ(n/2), so E R⁶ = n(n + 2)(n + 4). The bound is
  below S iff κ_n² < 9π/40, since c₃² = 80/(9π²). The values are κ_n² = 3π/32, 128/(105π), 75π/512, 512/(315π), 735π/4096,
  32768/(17325π), 6615π/32768, 131072/(63063π), 114345π/524288 and 2097152/(945945π) for n = 2, …, 11, and κ₁₂² = 3864861π/16777216.
  - For even n the comparison is rational.
  - For odd n it needs π² > r, where r is rational. The tightest case is n = 11, which needs π² > 83886080/8513505 = 9.8533.
    This follows from π > 1979/630, because 22/7 − π = ∫₀¹x⁴(1 − x)⁴/(1 + x²)dx < ∫₀¹x⁴(1 − x)⁴dx = 1/630.
  - At n = 12, 3864861/16777216 > 9/40, so the bound exceeds S.
  - Numerically, κ₁₁c₃ = 0.797225 < 0.797885 < κ₁₂c₃ = 0.807339.
- *Monotonicity.* With x = n/2, κ_n² = Γ(x + 3/2)²/(Γ(x)Γ(x + 3)), and
  d/dx log κ_n² = 2ψ(x + 3/2) − ψ(x) − ψ(x + 3) > 0, because the digamma function ψ is strictly concave
  (ψ″(x) = −2Σ_{k≥0}(x + k)^{−3} < 0) and x + 3/2 is the midpoint of x and x + 3. So κ_n increases strictly in n, and the bound is
  below S exactly for n ≤ 11. ∎

**Corollary.** Every square-free multilinear cubic Σ_{i<j<k} a_ijk Z_iZ_jZ_k in N ≤ 11 standard Gaussians (each term has zero
Laplacian, so the cubic is harmonic) satisfies E|P| < √(2/π)‖P‖₂. So does every harmonic cubic that depends on at most 11
orthonormal linear forms.

*Remarks.*
- The inequality E|H| ≤ κ_n c₃‖H‖₂ holds for every homogeneous cubic. Harmonicity is what places H in the third chaos.
- For n ≤ 7 the records already cover all cubics: the seven-coordinate theorem, `gpt/seven_dimensional_proof.tex`, uses the same
  great-circle argument with the extra radial term R(R² − 9)H₁(Θ) of non-harmonic cubics, and gets the constant 28√5/(25π).
  For harmonic cubics only R³ occurs, which is why the range extends to 11.
- (N) Random harmonic cubics give E|H|/(S‖H‖) ≈ 0.80 (n = 8), 0.84 (n = 11) and 0.853 (n = 12), against the bound
  κ_n c₃/S = 0.947, 0.9992 and 1.012.

## H3. The rank-one criterion (P)

**Theorem H3.** Let P = I₃(T) lie in the third chaos of ℝ^N with ‖P‖₂ = 1, and put f(v) := E[h₃(⟨v, Z⟩)P(Z)] = √6·T(v, v, v) for unit v.
Let v be a critical point of f on the unit sphere, for instance a maximiser (which exists by compactness). Put W₁ := ⟨v, Z⟩,
let W' be the coordinates of Z in v^⊥, and set a := f(v). Then:
1. P = a·h₃(W₁) + W₁Q₂(W') + R₃(W'), with Q₂ and R₃ in the second and third chaos of W'. There is no h₂(W₁)L(W') term.
   With b := ‖Q₂‖₂ and c := ‖R₃‖₂, we have a² + b² + c² = 1.
2. E|P| ≤ E√(a²h₃(X)² + b²X² + c²) for X ~ N(0, 1).
3. E|P|/√(2/π) ≤ (5/(4√6))·[1 + π(A a² + B b² + C c²)], where A = 34925/131072, B = 25/64 and C = 1/2.
4. Hence E|P| < √(2/π) whenever

       (30611/131072)·a² + (7/64)·b² > 1/2 − (4√6 − 5)/(5π) = 0.1945525…

   A rational sufficient form is (30611/131072)a² + (7/64)b² ≥ 487/2500, using √6 > 2449/1000 and π < 22/7. Gemini's
   0.2335a² + 0.1094b² > 0.1946 also implies the exact criterion.

*Proof.*
1. *Decomposition.* Since W₁ and W' are independent, the third chaos of Z is ⊕_{k=0}^{3} h_k(W₁)·(chaos 3 − k of W'). So
   P = a·h₃(W₁) + h₂(W₁)L(W') + W₁Q₂(W') + R₃(W'), with a = E[P·h₃(W₁)] = f(v). Here f(v) = (1/√6)E[I₃(T)I₃(v^{⊗3})] = √6T(v, v, v).
   For unit w ⊥ v, h₂(W₁)⟨w, W'⟩ = (1/√2)I₃(sym(v⊗v⊗w)). So the coefficient of L along w is E[P·h₂(W₁)⟨w, W'⟩] = 3√2·T(v, v, w).
   At a critical point the tangential gradient 3(T(v, v, ·) − T(v, v, v)v) vanishes, so T(v, v, w) = 0 for every w ⊥ v, and L = 0.
   (This first-order condition is GPT's `gpt/optimal_direction.tex`, Theorem 1.) The norms: ‖W₁Q₂‖² = E W₁²·E Q₂² = b², and the
   pieces are orthogonal, so a² + b² + c² = ‖P‖₂² = 1.
2. *Conditional Cauchy–Schwarz.* Given W₁ = x, P = a h₃(x) + xQ₂(W') + R₃(W'). Distinct chaoses of W' are orthogonal and Q₂, R₃
   are centred, so E[P² | W₁ = x] = a²h₃(x)² + b²x² + c². Then E[|P| | W₁] ≤ E[P² | W₁]^{1/2}; take expectations. (If L ≠ 0, as at
   a non-critical v, the same bound holds with the extra term h₂(x)²‖L‖² under the root.)
3. *Weight.* Pointwise √y ≤ (w + y/w)/2 with w(x) := √(3/(2π))e^{(7/50)x²}, and λ = 7/25. With E e^{λX²/2} = (1 − λ)^{−1/2}
   and E[X^{2k}e^{−λX²/2}] = (2k − 1)!!(1 + λ)^{−k−1/2}:
   - ½E w/S = 5/(4√6);
   - ½E[1/w]/S = (5/(4√6))π·½;
   - ½E[X²/w]/S = (5/(4√6))π·25/64;
   - ½E[h₃²/w]/S = (5/(4√6))π·34925/131072.
   Each is checked symbolically (`verify_harmonic.log`, H3). These are the constants of the bath certificate
   (`../bath/PROOF_BATH.md`, Section 5). There the variance part carried the factor 2/π from the Gaussian conditional law; here it
   does not, because only Cauchy–Schwarz is available.
4. *Criterion.* (5/(4√6))(1 + πQ) < 1 ⟺ Q < (4√6 − 5)/(5π). Substituting c² = 1 − a² − b² into Q = Aa² + Bb² + Cc² gives
   Q = 1/2 − (C − A)a² − (C − B)b², with C − A = 30611/131072 and C − B = 7/64. ∎

*Scope.* With a² + b² ≤ 1, the criterion needs a² > 0.686 (when c = 0), and a² > 0.833 when b = 0. (N) For random cubics in
n = 5, a² is about 0.2 to 0.33. There the conditional Cauchy–Schwarz step alone already gives 1.11–1.15·S, and the criterion
fails. So (H3) is a criterion for cubics close to a single He₃ direction, such as e₃ below. It is not a route to the general case.

*Comparison.* GPT's corollary in `optimal_direction.tex` is a different sufficient region: (1 − c²)r² + 2ctr ≤ c²a_rec², where
a_rec = a/√6, t = √(5a_rec² + b²), r = c and c = √(2/π) there. For e₃ it applies only from N = 32 (N: a float check over N ≤ 199). The criterion of (H3)
applies from N = 11.

## H4. The complete cubics (P)

**Theorem H4.** For N ≥ 3, the normalised elementary symmetric cubic P_N := C(N, 3)^{−1/2}·e₃(Z₁, …, Z_N) satisfies E|P_N| < √(2/π).

*Decomposition along u = (1, …, 1)/√N* (P; checked symbolically for N = 3, …, 8 in the log).
- Put W₁ = ⟨u, Z⟩, m := W₁/√N and Y := Z − W₁u, so that ΣY_i = 0 and Y is independent of W₁.
- e₃(Z) = Σ_{i<j<k} :Z_iZ_jZ_k:, and Wick products are multilinear. Substituting Z_i = m + Y_i gives
  e₃(Z) = C(N, 3)·:m³: + C(N − 1, 2)·:m²ΣY_i: + (N − 2)·:m·e₂(Y): + :e₃(Y):. The second term vanishes because ΣY_i ≡ 0.
- Since m is independent of Y, :m·e₂(Y): = m·:e₂(Y):. As E Y_iY_j = −1/N for i ≠ j and e₂(Y) = −|Y|²/2, we get
  :e₂(Y): = −(|Y|² − (N − 1))/2. Hence

      e₃(Z) = C(N, 3)N^{−3/2}·He₃(W₁) − ((N − 2)/(2√N))·W₁(|Y|² − (N − 1)) + :e₃(Y):.

- With ‖He₃‖² = 6 and ‖W₁(|Y|² − (N − 1))‖² = 2(N − 1), this gives a_N² = 6C(N, 3)/N³ = (N − 1)(N − 2)/N² and
  b_N² = 3(N − 2)/N². By orthogonality, c_N² = 4/N², as Gemini states.
- The script confirms, for N = 3, …, 8: the identity, with the remainder invariant under Z ↦ Z + t(1, …, 1) (so it is a function
  of Y alone); the three norms; and the vanishing of the h₂(W₁)L term.

*u is a maximiser.* For P_N, T(v, v, v) = e₃(v)/√C(N, 3). For unit v, |e₃(v)| ≤ e₃(|v|) ≤ C(N, 3)N^{−3/2}, by Maclaurin's inequality
(e₃/C(N, 3))^{1/3} ≤ e₁/N and then e₁/N ≤ N^{−1/2}. Equality holds at v = u. So Theorem H3 applies literally with
(a, b, c) = (a_N, b_N, c_N). Symmetry alone already makes u a critical point.

*Conclusion.*
- *N ≤ 11.* e₃ is harmonic, so Theorem H2 gives E|P_N| ≤ κ_N c₃ < S.
- *N ≥ 11.* The left side of the criterion is LHS(N) = A′(1 − 3s + 2s²) + B′(3s − 6s²), with s = 1/N, A′ = 30611/131072 and
  B′ = 7/64. Both 3(B′ − A′) and 2A′ − 6B′ are negative, so LHS increases with N. LHS(11) = 142821/720896 = 0.198116 > 487/2500,
  so Theorem H3 gives E|P_N| < S for all N ≥ 11.
- (At N = 10 the criterion fails narrowly: LHS = 0.194401 < 0.194518 ≤ the exact right side.) ∎

| N | E\|P_N\|/S (N, Monte Carlo) | (H2) bound κ_N c₃/S | (H3) bound along u |
|---|---|---|---|
| 3 | 0.637 (exact 2/π = 0.6366) | 0.741 | 1.170 |
| 8 | 0.734 | 0.947 | 1.017 |
| 10 | 0.742 | 0.985 | 1.0002 |
| 11 | 0.744 | **0.9992** | **0.9943** |
| 12 | 0.747 | 1.012 | **0.9894** |
| 24 | 0.759 | 1.091 | **0.963** |
| 100 | 0.769 | 1.164 | **0.944** |
| ∞ | 0.7726 = E\|h₃\|/S | — | 0.9375 |

(As N → ∞, P_N → h₃(W₁) in L², so the truth tends to E|h₃(X)|/S = (1 + 4e^{−3/2})/(√(3π)S) = 0.7726, far below 1. e₃ is not
a near-extremal family.)

## Comparison with the records (STATUS.md, row 3.21 (e))

The ledger proves the sharp bound (P, author only, GPT) in these cases:
- for cubics odd under one reflection;
- for conditionally Gaussian forms;
- for all cubics in at most 7 coordinates (constant 28√5/(25π) = 0.79717);
- for κ₄ ≥ 74 and for 0 < κ₄ ≤ 10⁻¹⁴⁰.

Against that:
- **(H1)** is in the records (`gpt/binary_cubic_proof.tex`, same route) and is now re-derived (P, exact checks).
- **(H2)** is new for 8 ≤ n ≤ 11, harmonic cubics only. For n ≤ 7 the seven-coordinate theorem is stronger, since it covers all
  cubics. The great-circle step is the same as in `gpt/seven_dimensional_proof.tex`.
- **(H3).** The first-order condition (no (X² − 1)L(Y) term at a maximising direction) is `gpt/optimal_direction.tex`, Theorem 1.
  The weighted criterion is new. It covers a different region than GPT's corollary, and for e₃ a larger one.
- **(H4).** Before this note, e₃ was covered by the records for N ≤ 7 (seven coordinates) and for N ≥ 26, because κ₄(P_N) ≥ 74 there.
  Exactly, E e₃⁴ = 27C(N, 3) + 324C(N, 4) + 1350C(N, 5) + 1860C(N, 6); κ₄(P_25) = 84657/1150 < 74 ≤ κ₄(P_26) = 48237/650, and
  κ₄(P_N) ≥ 74 for all N ≥ 26 (exact checks in the log). (H2) and (H3) close the gap 8 ≤ N ≤ 25, and they re-prove all N
  independently of the author-only results.

*Proposed ledger text* (row 3.21 (e), after the seven-coordinate clause): "for harmonic cubics in at most 11 coordinates
(E|H| ≤ κ_n·(4√5/(3π))‖H‖₂ with κ_n = E R³/√(E R⁶), R ~ χ_n, below √(2/π) iff n ≤ 11); and for every P whose maximising
direction carries a with (30611/131072)a² + (7/64)b² > 1/2 − (4√6 − 5)/(5π); in particular for the normalised e₃ in every number
of variables (**P**, a Gemini text relayed by the user, 17 Nov 2026, checked by claude-b9ee, `gemini-log-2026-11-17/harmonic/`).
The angular lemma of `gpt/binary_cubic_proof.tex` is now re-derived (**P**)".

## What Gemini's text gets right, and its imprecisions

All four claims are correct. Smaller points:
- (H1): the two-parameter reduction is not needed. Duality with sign patterns gives the global maximum and the equality case
  in a few lines, and the lemma is already in the records.
- (H2): the value at n = 11 is 0.797225, not 0.797232, which is immaterial. The "iff n ≤ 11" needs κ_n to be increasing; that
  is proved above.
- (H3): the decomposition holds at every critical point of f, not only at the maximum. a² + b² + c² = 1 requires the unit
  normalisation h₃ = He₃/√6. The rounded criterion is valid, and the exact one is stated above.
- (H4): (H3) already covers N = 11, not only N ≥ 12. u is the global maximiser of f (Maclaurin), so (H3) applies as stated.
  The quoted 0.9894 at N = 12 is right (0.98936).

## Numerical orientation (N; `numerics_harmonic.log`)

- H1: on a 181 × 91 grid of the two-parameter family, the maximum is 0.9490161 at (0.3229, π) and the minimum is 0.7236.
- H2: κ_n c₃ for n = 2–15, from 0.515 (n = 2) to 0.797225 (n = 11), then 0.807339 (n = 12). Five random harmonic cubics
  for each of n = 8, 11 and 12 give 0.795–0.802, 0.839–0.845 and 0.851–0.855 (as E|H|/(S‖H‖), 10⁶ samples each).
- H3: random cubics in n = 5 have a ≈ 0.44–0.58. The tangential gradient at the numerical maximiser is ≤ 10⁻⁵ (the first-order
  condition). E|P|/S ≈ 0.74–0.77 ≤ the CS step 1.11–1.15 ≤ the bound 1.13–1.17, so the criterion fails, as expected.
- H4: the table above, with 2·10⁶ samples per N.

## Files and replay

All files are in `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/harmonic/`:

- `PROOF_HARMONIC.md`: this file.
- `verify_harmonic.py` → `verify_harmonic.log`: 48 exact checks (fractions, sympy), all PASS, about 15 s.
- `numerics_harmonic.py` → `numerics_harmonic.log`: floating point (N), about 40 s on 2 cores.
- `environment.txt`: script hashes; Python 3.12.3, sympy 1.14.0, numpy 2.5.5, scipy 1.18.1; Linux (yo).

To replay: `python3 -m venv venv && venv/bin/pip install sympy numpy scipy`, then `venv/bin/python -I <script>.py > <script>.log`.
The verifier exits with status 0 iff all checks pass.
