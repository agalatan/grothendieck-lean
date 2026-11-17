<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/fourpartite/PROOF_4PARTITE.md (17 November 2026); a research worker of claude-b9ee. Its scripts and logs are in code/third-chaos-2026-11-17/fourpartite/. Only this line was added. -->
# Lemma (L) and the 4-partite corollary (claude-b9ee research worker, 17 Nov 2026; Agent-ID: claude-b9ee)

1. PROVED (P + C): Theorem 1, one block: E|aX + bY + cXY| ≤ √(2/π)·√(a² + b² + c²), equality iff c = 0; at unit variance the gap is ≥ 0.078·c². P: Fourier reduction to one function K(s) of one variable; C: arb ball-arithmetic certificate `c01_K_certify.py` (25 s), cross-checked by an independent mpmath.iv implementation `c02_K_crosscheck_iv.py`.
2. PROVED (P, from Theorem 1): Theorem 2 = Lemma (L) in every dimension, with or without the Gaussian c₀Z₀; equality iff M = 0. Proof: two conditionings and Jensen; no SVD and no multi-block Fourier analysis (the "one block plus a Gaussian" of task 1 is the case m = n = 1).
3. PROVED (P, from Theorem 2): Corollary 3, E|P| ≤ √(2/π)‖P‖₂ for every 4-partite cubic in any dimensions, strict unless P = 0; Corollary 3′, the same for every P = ⟨u(W),X₃⟩ + ⟨v(W),X₄⟩ + ⟨X₃,M(W)X₄⟩ (W independent of X₃, X₄); Corollary 3″, every (d+1)-partite element of the d-th chaos, every d ≥ 2.
4. PROVED (P): κ₃² ≤ ¾κ₄ for every unit-variance element of the first two chaoses (the near-Gaussian necessary condition, with margin ¼).
5. N only: the reduction identity, the class values of §5.4 (all ratios < 1), and the task-4 numerics of §6.
6. NOT PROVED: task 4 (general degree ≤ 2, Q = Σλᵢ(gᵢ² − 1) + μᵢgᵢ): only numerics, which support it (the normalised gap (1 − ratio)/κ₄ has infimum ≈ 1/96, approached at the Gaussian limit); §6 says why the method stops. The real third chaos in general (3.21 (e)) remains open.
7. The Gemini input was checked (§2.3): its characteristic function, modulus bound, cumulants and U,V decomposition are right; its case split in p = c² is not used.
8. Labels: P = proved by hand here; C = rigorous computation with a replay script; N = floating point, orientation only. All proofs are author-only (this worker); nothing was reviewed independently.
9. Files and replay: §7. `n01`, `n03` ran on the laptop (one core) before the coordinator moved the work to yo; everything else ran on yo.
10. Records to compare: `research/conjecture-K/STATUS.md` 3.21 (e); comparison in §5.5.

---

## 0. Notation

X, Y, Z₀, ξ, η, g, gᵢ denote independent standard Gaussian variables or vectors. For a real random variable W,
φ_W(t) = E e^{itW}. Throughout, for s ∈ [0, 1] and t ≥ 0:

- r_s(t) = (1 + st²)^{−1/2} · exp(−(1 − s)t² / (2(1 + st²))),
- G_s(t) = log r_s(t) + t²/2 = ½(x − log(1 + x)) + (1 − s)st⁴/(2(1 + x)), where x = st²,
- Θ̄_s(t) = ((1 − s)/2)·√s·t³/(1 + st²),
- C(θ) = cos θ for 0 ≤ θ ≤ π, C(θ) = −1 for θ > π (nonincreasing on [0, ∞)),
- K(s) = ∫₀^∞ [r_s(t)·C(Θ̄_s(t)) − e^{−t²/2}] t^{−2} dt.

(The second expression of G_s equals the first: −½log(1+x) − (1−s)t²/(2(1+x)) + t²/2 = ½(x − log(1+x)) + (1−s)st⁴/(2(1+x)) after
writing t²/2 = t²(1+x)/(2(1+x)) and x/2 = st²(1+x)/(2(1+x)).)

## 1. Statements

**Theorem 1 (one block).** For real a, b, c and independent standard Gaussians X, Y, F = aX + bY + cXY satisfies
E|F| ≤ √(2/π)·‖F‖₂, ‖F‖₂² = a² + b² + c², with equality iff c = 0. Quantitatively, if ‖F‖₂ = 1 then
√(2/π) − E|F| ≥ (2/π)·K(c²) ≥ (2/π)·0.1226·c² ≥ 0.078·c².

**Theorem 2 (Lemma (L)).** Let X ∈ ℝ^m, Y ∈ ℝ^n, Z₀ ∈ ℝ be independent standard Gaussian, u ∈ ℝ^m, v ∈ ℝ^n, M ∈ ℝ^{m×n}, c₀ ∈ ℝ, and
g = ⟨u, X⟩ + ⟨v, Y⟩ + ⟨X, MY⟩ + c₀Z₀. Then E|g| ≤ √(2/π)·√(|u|² + |v|² + ‖M‖_F² + c₀²) = √(2/π)‖g‖₂, with equality iff M = 0.

**Corollary 3 (4-partite cubics).** Let X₁, …, X₄ be independent standard Gaussian vectors in ℝ^{d₁}, …, ℝ^{d₄} (some dₐ may be 0) and
T_abc trilinear forms. Then P = T₁₂₃(X₁,X₂,X₃) + T₁₂₄(X₁,X₂,X₄) + T₁₃₄(X₁,X₃,X₄) + T₂₃₄(X₂,X₃,X₄) satisfies E|P| ≤ √(2/π)‖P‖₂,
with equality iff P = 0.

**Corollary 3′ (conditionally bi-affine variables).** Let W be a random element of a standard Borel space, independent of standard
Gaussian vectors X₃ ∈ ℝ^{d₃}, X₄ ∈ ℝ^{d₄}, and u, v, M measurable functions of W (values in ℝ^{d₃}, ℝ^{d₄}, ℝ^{d₃×d₄}) with
E[|u|² + |v|² + ‖M‖_F²] < ∞. Then P = ⟨u(W), X₃⟩ + ⟨v(W), X₄⟩ + ⟨X₃, M(W)X₄⟩ satisfies E|P| ≤ √(2/π)‖P‖₂, with equality iff
M(W) = 0 a.s. and |u(W)|² + |v(W)|² is a.s. constant.

**Corollary 3″ (any degree).** Let d ≥ 2 and F an element of the d-th Wiener chaos which, in some orthonormal basis and for some
partition of the basis into d + 1 classes, is a combination of multilinear monomials whose d variables lie in d distinct classes
(a "(d+1)-partite" chaos element). Then E|F| ≤ √(2/π)‖F‖₂, strictly unless F = 0. More generally the bound holds for every element
of any chaos that is bi-affine in two independent blocks (X₃, X₄) and vanishes at X₃ = X₄ = 0 (Corollary 3′).

**Proposition 4 (cumulants).** Every Q = Σᵢ(λᵢ(gᵢ² − 1) + μᵢgᵢ) with E Q² = 1 has κ₃(Q)² ≤ ¾κ₄(Q).

## 2. Two tools, and the Gemini formulas (P)

**2.1 Fourier formula.** For real x, ∫₀^∞ (1 − cos tx) t^{−2} dt = (π/2)|x| (substitute u = t|x|; ∫₀^∞(1 − cos u)u^{−2}du =
[−(1 − cos u)/u]₀^∞ + ∫₀^∞ sin u/u du = π/2). By Tonelli (nonnegative integrand), for every real random variable W,
E|W| = (2/π)∫₀^∞ (1 − Re φ_W(t)) t^{−2} dt. For a standard Gaussian this gives √(2/π) = (2/π)∫₀^∞(1 − e^{−t²/2})t^{−2}dt.
Hence, if E W² = 1, both integrals are finite and

  √(2/π) − E|W| = (2/π)·J(W),  J(W) := ∫₀^∞ (Re φ_W(t) − e^{−t²/2}) t^{−2} dt  (absolutely convergent).

**2.2 One block.** For F = aX + bY + cXY: given X, F ~ N(aX, (b + cX)²), so E[e^{itF} | X] = exp(itaX − t²(b + cX)²/2). For real
β > −1 and complex α, E exp(αX − βX²/2) = (1 + β)^{−1/2}exp(α²/(2(1 + β))) (complete the square for real α; both sides are entire
in α). With β = c²t², α = ita − t²bc, α² = −t²a² − 2it³abc + t⁴b²c², and −t²b²/2 + t⁴b²c²/(2(1 + c²t²)) = −t²b²/(2(1 + c²t²)):

  φ_F(t) = (1 + c²t²)^{−1/2} · exp(−(a² + b²)t² / (2(1 + c²t²))) · exp(−i·abc·t³/(1 + c²t²)).

**2.3 Check of the Gemini text.** (i) The formula above is the Gemini formula. (ii) Modulus: if a² + b² + c² = 1 and s = c², then
|φ_F(t)| = r_s(t) and log r_s(t) + t²/2 = G_s(t) ≥ 0 (both terms of G_s are ≥ 0), so |φ_F| ≥ e^{−t²/2}; for several blocks the
moduli multiply and the gains G add, so the multi-block statement holds too. (iii) The phases add: Θ(t) = Σⱼ aⱼbⱼcⱼt³/(1 + cⱼ²t²).
(iv) Cumulants (expand log φ_F at unit variance): κ₃ = 6abc, κ₄ = 6c⁴ + 12(a² + b²)c² = 6c²(2 − c²); and κ₄ − κ₃² ≥
6c²(2 − c²) − 9(1 − c²)²c² = 3c²(1 + 4c² − 3c⁴) > 0 for 0 < c² ≤ 1 (using |ab| ≤ (1 − c²)/2). (v) The SVD reduction to
c₀′Z₀ + Σⱼ(aⱼXⱼ + bⱼYⱼ + cⱼXⱼYⱼ), with aⱼ = ⟨u, pⱼ⟩, bⱼ = ⟨v, qⱼ⟩ (components on the singular pairs) and the rest of u, v merged into
c₀′Z₀, is right. (vi) aX + bY + cXY = (αU + (c/2)U²) + (βV − (c/2)V²) with U = (X+Y)/√2, V = (X−Y)/√2, α = (a+b)/√2, β = (a−b)/√2
is right, and so is the cancellation of the arctan phases. None of (iii), (v), (vi) is needed below: §4 replaces the multi-block
analysis by conditioning.

## 3. Proof of Theorem 1

**3.1 Reduction to K (P).** By homogeneity assume a² + b² + c² = 1, and put s = c² ∈ [0, 1]. If s = 0, F is Gaussian and equality
holds. By 2.2, Re φ_F(t) = r_s(t)·cos Θ(t) with Θ(t) = abc·t³/(1 + st²). Since |abc| ≤ ((a² + b²)/2)|c| = ((1 − s)/2)√s, we have
|Θ(t)| ≤ Θ̄_s(t), hence cos Θ(t) = cos|Θ(t)| ≥ C(Θ̄_s(t)) (if Θ̄_s(t) ≤ π, because cos decreases on [0, π]; otherwise C = −1).
As r_s ≥ 0, J(F) ≥ K(s), and by 2.1, E|F| = √(2/π) − (2/π)J(F) ≤ √(2/π) − (2/π)K(s). The integrand of K is integrable: near 0
it is O(t²) (r_s − e^{−t²/2} = e^{−t²/2}(e^{G_s} − 1) = O(t⁴) and r_s(1 − C(Θ̄)) ≤ Θ̄²/2 = O(t⁶)), and it is at most 2t^{−2} in
absolute value. **So Theorem 1 follows from: K(s) ≥ 0.1226·s for every s ∈ (0, 1]** (§3.3–3.5); then for s > 0 the inequality is
strict, and with ‖F‖₂ = 1 the gap is (2/π)J(F) ≥ (2/π)K(c²) ≥ 0.0780·c².

**3.2 Monotonicity facts (P).** For t > 0 and s ∈ [0, 1], with x = st²:

- (M1) ∂_s log r_s(t) = (1 − s)t⁴/(2(1 + st²)²) ≥ 0: r_s(t) and G_s(t) are nondecreasing in s.
- (M2) ∂_t log r_s(t) = −st/(1 + st²) − (1 − s)t/(1 + st²)² ≤ 0: r_s(t) is nonincreasing in t.
- (M3) ∂_t G_s(t) = t[1 − s/(1 + x) − (1 − s)/(1 + x)²] ≥ t[1 − s − (1 − s)] = 0: G_s(t) is nondecreasing in t; G_s ≥ 0.
- (M4) For s ∈ [s₁, s₂] ⊂ [0, 1]: Θ̄_s(t) ≤ Θ*(t) := (1 − s₁)√s₂·t³/(2(1 + s₁t²)) (each factor bounded separately), and Θ* is
  increasing in t (d/dt[t³/(1 + s₁t²)] = t²(3 + s₁t²)/(1 + s₁t²)² ≥ 0).
- (M5) C is nonincreasing; 1 − C(θ) ≤ min(2, θ²/2) for θ ≥ 0 (for θ ≤ π, 1 − cos θ ≤ θ²/2; for θ > π, 2 < π²/2); C(θ) ≥ 1 − θ²/2.
- (M6) The integrand of K is ≥ 0 on (0, 1], for every s ∈ [0, 1]. Proof: let G_lin = (1 − s)st⁴/(2(1 + x)) ≤ G_s. Then
  Θ̄_s² = G_lin·(1 − s)t²/(2(1 + x)) ≤ G_lin·t²/2 ≤ G_s/2 for t ≤ 1, so by (M5) e^{G}C(Θ̄) ≥ e^{G}(1 − Θ̄²/2) ≥ e^{G}(1 − G/4),
  which is ≥ 1 because f(G) = e^{G}(1 − G/4) is nondecreasing on [0, 3] with f(0) = 1, and G_s(t) ≤ x²/4 + (1 − s)s/2 ≤ 3/8 for
  t ≤ 1. Hence r_sC(Θ̄) − e^{−t²/2} = e^{−t²/2}(e^{G}C(Θ̄) − 1) ≥ 0.

(The derivative formulas (M1)–(M2) and the identity for G_s were also checked by finite differences at 2000 random points.)

**3.3 Cell bounds, s ∈ [1/1000, 1] (P for the bounds, C for the evaluation).** Let I_s(t) = [r_s(t)C(Θ̄_s(t)) − e^{−t²/2}]t^{−2}.
Fix s ∈ [s₁, s₂] and t ∈ [t_a, t_b] ⊂ [0, ∞), and let ω = 1 − C(Θ*(t_b)) ∈ [0, 2], an upper bound for 1 − C(Θ̄_s(t)) by (M4), (M5).

- Form 1. I_s(t) = e^{−t²/2}t^{−2}[(e^{G_s(t)} − 1) − e^{G_s(t)}(1 − C(Θ̄_s(t)))] ≥ e^{−t²/2}t^{−2}·m₁ with
  m₁ = (e^{G_{s₁}(t_a)} − 1) − e^{G_{s₂}(t_b)}·ω, by (M1), (M3).
- Form 2. I_s(t) = t^{−2}[r_s(t) − e^{−t²/2} − r_s(t)(1 − C(Θ̄_s(t)))] ≥ t^{−2}·n₂ with n₂ = r_{s₁}(t_b) − e^{−t_a²/2} − r_{s₂}(t_a)·ω,
  by (M1), (M2).
- The factor in front is taken at t_b when the bracket bound is ≥ 0 and at t_a (> 0) when it is < 0; this gives two lower bounds L₁, L₂
  for I_s on the cell, and on cells inside (0, 1] also L₀ = 0 by (M6). So ∫_{t_a}^{t_b} I_s ≥ (t_b − t_a)·max(L₁, L₂, L₀) for every
  s ∈ [s₁, s₂]. (Form 1 is the sharp one for small t, where r_s − e^{−t²/2} is a small difference; Form 2 for large t, where splitting
  r_s = e^{−t²/2}e^{G_s} into two monotone factors would lose a factor e^{t·(t_b − t_a)}.)
- Tail. For t ≥ T: I_s(t) ≥ −(r_{s₂}(t) + e^{−t²/2})t^{−2}, and r_{s₂}(t) ≤ (s₂t²)^{−1/2}exp(−(1 − s₂)T²/(2(1 + s₂T²))) because
  t²/(1 + s₂t²) increases; with ∫_T^∞ e^{−t²/2}t^{−2} ≤ e^{−T²/2}T^{−3}:
  ∫_T^∞ I_s ≥ −[s₂^{−1/2}exp(−(1 − s₂)T²/(2(1 + s₂T²)))/(2T²) + e^{−T²/2}T^{−3}].

The script evaluates these bounds in ball arithmetic (arb, 128 bits; every quantity is a ball containing the exact real, a sign is
used only when it is certain, and lower endpoints are summed). Grids: t-nodes 0, 1/500, …, 8, then t_{k+1} = (⌊10⁶t_k·501/500⌋ + 1)/10⁶
up to 100.18 (5266 nodes), tail beyond; s-cells: s₀ = 1/1000, s_{i+1} = (⌊10⁹·1.05·s_i⌋ + 1)/10⁹, last edge 1, i.e. 142 cells covering
[1/1000, 1] (adaptive bisection was available but never needed). **Result (C): every cell has a certified lower bound > 0; the smallest
value of (bound)/s₂ is 0.122684, on the first cell [0.001, 0.00105]; so K(s) ≥ 0.1226·s on [1/1000, 1].** Run time 25 s, one core.
Sample cells (certified bound ≤ floating-point K at the endpoints, N): [0.001, 0.00105]: 1.2882·10⁻⁴ (K(0.001) = 1.5732·10⁻⁴);
[0.0099, 0.0104]: 1.3110·10⁻³ (K(0.01) = 1.6274·10⁻³); [0.098, 0.103]: 0.013816 (K(0.1) = 0.018088); [0.491, 0.516]: 0.14293
(K(0.5) = 0.15084); [0.972, 1]: 0.25167 (K(1) = √(π/2) − 1 = 0.25331).
Independent check: `c02_K_crosscheck_iv.py` re-implements Part B with mpmath.iv (separately written code) and reproduces the bounds
of 17 of the 142 cells (every tenth, plus the first two and the last) to all printed digits.

**3.4 Small s, s ∈ (0, 1/1000] (P, with one certified integral C).** Fix s ≤ s₀ = 1/1000.
(i) For all t > 0: e^{G}C(Θ̄) − 1 = (e^{G} − 1) − e^{G}(1 − C(Θ̄)) ≥ G − e^{G}Θ̄²/2 (by e^G − 1 ≥ G and (M5)).
(ii) G_s ≥ (1 − s)st⁴/(2(1 + st²)) and G_s ≤ Ĝ_s := s²t⁴/4 + (1 − s)st⁴/(2(1 + st²)) (as x − log(1 + x) ≤ x²/2); Θ̄_s² =
(1 − s)²st⁶/(4(1 + st²)²). Hence I_s(t) ≥ s·h_s(t), h_s(t) = e^{−t²/2}[(1 − s)t²/(2(1 + st²)) − e^{Ĝ_s(t)}(1 − s)²t⁴/(8(1 + st²)²)].
(iii) For t ≤ 10 and s ≤ s₀: (1 − s)/(1 + st²) ≥ (1 − s₀)/(1 + s₀t²), and Ĝ_s ≤ Ĝ_{s₀} because ∂_s[(1 − s)s/(1 + st²)] =
(1 − 2s − s²t²)/(1 + st²)² ≥ 0 there; dropping (1 − s)²/(1 + st²)² ≤ 1, h_s ≥ h̃ := e^{−t²/2}[P(t) − Q(t)] with
P = (1 − s₀)t²/(2(1 + s₀t²)) and Q = e^{Ĝ_{s₀}(t)}t⁴/8, both increasing in t. So ∫₀^{10} I_s ≥ s∫₀^{10} h̃, and the script bounds the
last integral on cells of width 1/1000 (P(t_a) − Q(t_b) times e^{−t²/2} at the appropriate endpoint): **∫₀^{10} h̃ ≥ 0.1445243512 (C).**
(iv) On [10, s^{−1/2}]: 1 + st² ≤ 2, so r_s ≤ e^{−(1 − s₀)t²/4}; |e^{G}C − 1| ≤ Ge^{G} + e^{G}(1 − C) gives |I_s| ≤ r_s t^{−2}(G + Θ̄²/2)
≤ s·e^{−αt²}(β₂t² + β₄t⁴) with α = (1 − s₀)/4, β₂ = s₀/4 + ½, β₄ = ⅛. Using β₂t² + β₄t⁴ ≤ (β₂ + β₄)t⁵/10 for t ≥ 10 and
∫_T^∞ t⁵e^{−αt²}dt = e^{−αT²}(α²T⁴ + 2αT² + 2)/(2α³): the contribution is ≥ −s·E₁, **E₁ ≤ 1.931·10⁻⁸ (C).**
(v) On [s^{−1/2}, ∞): I_s ≥ −(r_s + e^{−t²/2})t^{−2}, and for st² ≥ 1, t²/(1 + st²) ≥ 1/(2s) and (1 + st²)^{−1/2} ≤ (st²)^{−1/2}, so the
contribution is ≥ −E₂(s), E₂(s) = s^{1/2}e^{−(1−s)/(4s)}/2 + s^{3/2}e^{−1/(2s)}; E₂(s)/s is increasing on (0, s₀] (log-derivatives
−1/(2s) + 1/(4s²) > 0 and 1/(2s) + 1/(2s²) > 0), so E₂(s)/s ≤ E₂(s₀)/s₀ ≤ 5.42·10⁻¹⁰⁸ (C).
(Note 10 ≤ s₀^{−1/2} ≈ 31.6, so the three ranges cover (0, ∞) for every s ≤ s₀.) **Hence K(s) ≥ 0.14452·s on (0, 1/1000].**

**3.5 Conclusion.** K(s) ≥ 0.1226·s for all s ∈ (0, 1], which proves Theorem 1 with its equality case and the quantitative gap.
For orientation (N, `n03_K.log`): K(s)/s increases from √(π/2)/8 = 0.15666 (the Edgeworth value at s → 0) to about 0.308 near
s = 0.6 and ends at K(1) = 0.25331; at a = b the true value J(F) (cos instead of C) is larger than K by 5 % at s = 0.05, 19 % at
s = 0.15 (the largest seen), 10 % at s = 0.3 and under 1 % for s ≥ 0.6, so the truncation C costs little. The integrand of K changes
sign once, near t = 2 for small s and later for larger s (at t ≈ 30 for s = 0.9); the positive part on t ≲ 2 pays for the rest.

## 4. Proof of Theorem 2 (P)

**4.1 Absorbing c₀.** Put X̃ = (X, Z₀) ∈ ℝ^{m+1}, ũ = (u, c₀), M̃ = (M; 0) ∈ ℝ^{(m+1)×n}. Then g = ⟨ũ, X̃⟩ + ⟨v, Y⟩ + ⟨X̃, M̃Y⟩, and
the three terms are orthogonal in L² (E[⟨ũ,X̃⟩⟨X̃,M̃Y⟩] = ũᵀM̃·E Y = 0, the others by independence and centring), with
E⟨X̃, M̃Y⟩² = E|M̃Y|² = ‖M̃‖_F². So ‖g‖₂² = |ũ|² + |v|² + ‖M̃‖_F², and it suffices to treat c₀ = 0 (drop the tildes).

**4.2 Case v = 0.** Given Y, g = ⟨X, u + MY⟩ is N(0, |u + MY|²), so E|g| = √(2/π)·E|u + MY| ≤ √(2/π)(E|u + MY|²)^{1/2} =
√(2/π)(|u|² + ‖M‖_F²)^{1/2}, with equality iff |u + MY| is a.s. constant, i.e. iff M = 0 (|u + MY|² is a polynomial in Y with
quadratic part |MY|²).

**4.3 Case v ≠ 0: two conditionings.** Let v̂ = v/|v|, η = ⟨v̂, Y⟩, Y′ = Y − ηv̂ (η ~ N(0,1) independent of Y′ ~ N(0, I − v̂v̂ᵀ)).
Then ⟨v, Y⟩ = |v|η and MY = MY′ + ηMv̂, so

  g = |v|η + ⟨X, p⟩ + η⟨X, q⟩,  p := u + MY′ (a function of Y′),  q := Mv̂ (fixed).

Let p̂ = p/|p| if p ≠ 0 and p̂ = e₁ otherwise (a Borel function of Y′), ξ = ⟨p̂, X⟩, X′ = X − ξp̂. Since X, η, Y′ are independent and
p̂ depends on Y′ only, conditionally on Y′ = y′ the variables ξ ~ N(0,1) and X′ ~ N(0, I − p̂p̂ᵀ) are independent Gaussians (uncorrelated
linear images of X), independent of η. So conditionally on (Y′, X′), (ξ, η) ~ N(0, I₂). Now ⟨X, p⟩ = |p|ξ (as X′ ⊥ p) and
⟨X, q⟩ = ξ⟨p̂, q⟩ + ⟨X′, q⟩, hence

  g = A·ξ + B·η + Γ·ξη,  A = |p|,  B = |v| + ⟨X′, q⟩,  Γ = ⟨p̂, q⟩,

with (A, B, Γ) a function of (Y′, X′): **conditionally on (Y′, X′), g is one block with no Gaussian remainder.** By Fubini and
Theorem 1, E[|g| | Y′, X′] ≤ √(2/π)·V^{1/2} with V = A² + B² + Γ², and by Jensen (concavity of √),
E|g| ≤ √(2/π)·E V^{1/2} ≤ √(2/π)·(E V)^{1/2}.

**4.4 Bookkeeping.** Given Y′: E⟨X′, q⟩ = 0 and E⟨X′, q⟩² = |q − ⟨p̂,q⟩p̂|², so E[B² + Γ² | Y′] = |v|² + |q|². And
E A² = E|u + MY′|² = |u|² + ‖M(I − v̂v̂ᵀ)‖_F², |q|² = ‖Mv̂v̂ᵀ‖_F², and ‖M(I − v̂v̂ᵀ)‖_F² + ‖Mv̂v̂ᵀ‖_F² = ‖M‖_F² (complementary
orthogonal projections). So E V = |u|² + |v|² + ‖M‖_F² = ‖g‖₂², which proves the inequality.

**4.5 Equality.** If M = 0, g is Gaussian. Conversely, suppose equality with v ≠ 0. Then V is a.s. constant (Jensen); V depends on X′
only through B, so ⟨X′, q⟩ is a.s. constant given Y′, i.e. q ∥ p̂ for a.e. Y′, and then Γ = ±|q|. Equality in the conditional step
for a.e. (Y′, X′) forces Γ = 0 (Theorem 1 is strict for Γ ≠ 0), so q = Mv̂ = 0; then V = |u + MY′|² + |v|² constant forces
M(I − v̂v̂ᵀ) = 0, hence M = 0. With 4.2 this proves: equality iff M = 0.

Remarks. (a) Task 1's "one block plus a Gaussian", c₀Z₀ + aX + bY + cXY, is the case m = n = 1; here the reduction is one conditioning:
with r² = a² + c₀², ξ = (aX + c₀Z₀)/r, X′ = (c₀X − aZ₀)/r, one gets c₀Z₀ + aX + bY + cXY = rξ + (b + cc₀X′/r)Y + (ca/r)ξY.
(b) The numerical check `n04` (N) compares, for random (u, v, M, c₀) with (m, n) = (1,2), (2,2), (2,3), the exact E|g| (one-dimensional
Fourier integral after an SVD) with the average over (Y′, X′) of the one-block values: they agree to 1·10⁻⁸, 4·10⁻⁵, 1·10⁻⁵
(Gauss–Hermite error), E V = ‖g‖₂² to all digits, and E|g| ≤ √(2/π)E V^{1/2} ≤ √(2/π)‖g‖₂ (ratios 0.983, 0.858, 0.949).
(c) Equivalently, Theorem 2 is the bound E|W| ≤ √(2/π)‖W‖₂ for every W in the first two chaoses whose second-chaos kernel has a spectrum
symmetric about 0 (eigenvalues in pairs ±cⱼ): with eigenvectors eⱼ (for cⱼ) and fⱼ (for −cⱼ), (cⱼ/2)(⟨eⱼ,g⟩² − ⟨fⱼ,g⟩²) = cⱼXⱼYⱼ for
Xⱼ, Yⱼ = (⟨eⱼ,g⟩ ± ⟨fⱼ,g⟩)/√2.

## 5. The corollaries (P) and their classes

**5.1 Proof of Corollary 3′.** For fixed w, write g_w(x₃, x₄) = ⟨u(w), x₃⟩ + ⟨v(w), x₄⟩ + ⟨x₃, M(w)x₄⟩. The map (w, x₃, x₄) ↦ g_w(x₃, x₄)
is jointly measurable and W is independent of (X₃, X₄), so by Fubini (for the nonnegative |P| and for P²) E[|P| | W = w] = E|g_w(X₃, X₄)|
and E[P² | W = w] = |u(w)|² + |v(w)|² + ‖M(w)‖_F² for a.e. w (the three terms of g_w are orthogonal, 4.1). Theorem 2 with c₀ = 0 gives
E[|P| | W] ≤ √(2/π)(E[P² | W])^{1/2}, and Cauchy–Schwarz gives E|P| ≤ √(2/π)E[(E[P²|W])^{1/2}] ≤ √(2/π)(E P²)^{1/2}. Equality holds iff
both steps are equalities: E[P²|W] a.s. constant and, for a.e. w, equality in Theorem 2, i.e. M(w) = 0.

**5.2 Proof of Corollary 3.** Take W = (X₁, X₂), u(W) ∈ ℝ^{d₃} with ⟨u, x₃⟩ = T₁₂₃(X₁, X₂, x₃), v(W) with ⟨v, x₄⟩ = T₁₂₄(X₁, X₂, x₄), and
M(W) with ⟨x₃, Mx₄⟩ = T₁₃₄(X₁, x₃, x₄) + T₂₃₄(X₂, x₃, x₄). There is no constant term (no edge lies inside parts 1, 2), so
P = g_W(X₃, X₄) and Corollary 3′ applies. Equality: M(W) = M₁(X₁) + M₂(X₂) = 0 a.s. with M₁, M₂ linear; conditioning on X₁ (E M₂(X₂) = 0)
gives M₁(X₁) = 0 a.s., so M₁ = 0, and likewise M₂ = 0, i.e. T₁₃₄ = T₂₃₄ = 0; then |u(W)|² + |v(W)|² is an a.s. constant polynomial in
(X₁, X₂), hence constant, and it vanishes at X₁ = 0, so u = v = 0 and P = 0.

**5.3 Proof of Corollary 3″.** Given the d + 1 classes, call two of them B₃, B₄ and the union of the others A; let W be the coordinates in
A. Each monomial misses exactly one class, so it contains at most one variable of B₃, at most one of B₄, and at least one of B₃ ∪ B₄. So F
is bi-affine in (X_{B₃}, X_{B₄}) with no term free of both, and Corollary 3′ applies. Strictness: as in 5.2, equality forces the
B₃B₄-terms to vanish and then |u|² + |v|² (a polynomial vanishing at W = 0, since d ≥ 2) to vanish. Also covered (Corollary 3′): cubics
with Hermite terms in A, e.g. H₂(x₁)x₃ + x₁x₂x₄ + (x₁ + x₂)x₃x₄ (A = {x₁, x₂}, B₃ = {x₃}, B₄ = {x₄}).

**5.4 Classes, with one numerical value each (N).** Values of E|P|/(√(2/π)‖P‖₂) (`n04`, `n06`; Gauss–Hermite in the conditioning
variables with the exact one-block value inside, or Monte Carlo over the conditioning variables with the exact multi-block Fourier value
inside, ± one standard error):

| class | example | ratio |
|---|---|---|
| K₄^(3) (one coordinate per part) | t₁x₂x₃x₄ + t₂x₁x₃x₄ + t₃x₁x₂x₄ + t₄x₁x₂x₃, random t | 0.66023 (equal t: 0.68151) |
| blow-ups of K₄^(3) (complete 4-partite) | parts 3+3+3+3, Gaussian tensors T_abc, 12 coordinates | 0.844 ± 0.010 |
| sums of independent copies | N copies of K₄^(3), equal weights, 4N coordinates | N = 1: 0.670 ± 0.014 (exact 0.68151), N = 2: 0.779 ± 0.013, N = 4: 0.869 ± 0.009, N = 8: 0.913 ± 0.007 |
| strongly 4-colourable 3-graphs | tight cycle C₇^(3) (colours 0123012), random weights | 0.749 ± 0.012 |
| two edge types (conditionally Gaussian) | T₁₃₄ + T₂₃₄, 12 coordinates | 0.816 ± 0.007 |
| tripartite (one part empty; conditionally Gaussian) | T(X₁, X₃, X₄), parts 4+4+4 | 0.837 ± 0.008 |
| Hermite terms in A (Corollary 3′) | t₁H₂(x₁)x₃ + t₂x₁x₂x₄ + (t₃x₁ + t₄x₂)x₃x₄ | 0.65998 |
| 4th chaos (Corollary 3″) | K₅^(4): Σₐ tₐ ∏_{b≠a} x_b, random t (5 coordinates); 3 copies, equal weights (15 coordinates) | 0.53852; 0.728 ± 0.013 |

All values are below 1, as the corollaries require; the sums of copies climb towards 1, as they must (they tend to a Gaussian).

**Combinatorial form of Corollary 3′ on the third chaos.** In a basis adapted to an orthogonal decomposition ℝ^N = A ⊕ B₃ ⊕ B₄, the
cubic is covered when every monomial (with multiplicity, H₂(xᵢ)xⱼ counting xᵢ twice) contains at most one variable of B₃, at most one
of B₄, and at least one of B₃ ∪ B₄; variables of A may repeat. In hypergraph terms: two disjoint vertex sets, each meeting every edge at
most once, whose union meets every edge. 4-partite cubics are the case A = parts 1 ∪ 2 with no repeated variables.

**5.5 Comparison with the records (3.21 (e)).** The records prove the sharp real bound on the third chaos for cubics odd under one
reflection, for conditionally Gaussian forms Σ GᵢQᵢ(Y), in at most seven coordinates, for κ₄ ≥ 74 and for 0 < κ₄ ≤ 10⁻¹⁴⁰.
- A 4-partite cubic with one edge type missing is linear in the part opposite to it (that part meets every monomial exactly once), so it is
  a conditionally Gaussian form: tripartite cubics and the cases T₁₂₃ + T₁₂₄ or T₁₃₄ + T₂₃₄ were already covered.
- With all four edge types present, no part is a transversal, and the class contains cubics in any number of coordinates: blow-ups of
  K₄^(3), sums of any number of independent copies of K₄^(3) (which tend to the Gaussian law, the Larsson-Cohn regime where the ratio
  tends to 1; 0.913 already at 8 copies), tight cycles C_n^(3) with 3 ∤ n, n ≥ 7 (strongly 4-colourable: concatenate blocks 012 and
  0123, possible for every n ≥ 6; no exact transversal, since one would be every third vertex). Those with 8 or more coordinates are
  outside the "at most seven coordinates" case. I did not check whether some members admit another conditionally Gaussian or reflection
  structure after a rotation; for the coordinate structure they do not.
- Corollary 3′ also covers cubics with H₂-terms in the conditioning block and all chaos degrees (Corollary 3″), which the records do not
  treat. It does not cover He₃ terms or the Gaussian-bath family of 3.21 (e).

## 6. Task 4: the general degree-≤ 2 case (N, plus Proposition 4)

Q = Σᵢ(λᵢ(gᵢ² − 1) + μᵢgᵢ), ‖Q‖₂² = Σ(2λᵢ² + μᵢ²). If E|Q| ≤ √(2/π)‖Q‖₂ held for all such Q, the conditioning of 5.1 (on the blue
vertices of a 2-colouring) would extend Corollary 3 to every cubic without He₃ terms whose hypergraph is 2-colourable.

**6.1 Proposition 4 (P).** With unit variance, κ₃ = Σᵢλᵢ(8λᵢ² + 6μᵢ²) and κ₄ = Σᵢ48λᵢ²(λᵢ² + μᵢ²) (from log E e^{θQ} =
Σᵢ[−½log(1 − 2λᵢθ) − λᵢθ + μᵢ²θ²/(2(1 − 2λᵢθ))]). By Cauchy–Schwarz with weights wᵢ = 2λᵢ² + μᵢ² (Σwᵢ = 1),
κ₃² ≤ Σᵢ4λᵢ²(4λᵢ² + 3μᵢ²)²/wᵢ, and (4λ² + 3μ²)² ≤ 9(λ² + μ²)(2λ² + μ²) ⟺ 0 ≤ 2λ⁴ + 3λ²μ². Hence κ₃² ≤ 36Σλᵢ²(λᵢ² + μᵢ²) = ¾κ₄.
So the Edgeworth necessary condition κ₄ ≥ κ₃² holds with margin ¼ in the whole first-plus-second chaos (N: the minimum of 1 − κ₃²/κ₄
over 2000 random Q is 0.25003); the ratio ¾ is approached only when λᵢ/μᵢ → 0. Theorem 1's family reaches it too (a = b, c → 0).

**6.2 Numerics (N, `n05`, `n05b`).** E|Q| by the Fourier formula with φ_Q = ∏ᵢ(1 + 4λᵢ²t²)^{−1/4}exp(−μᵢ²t²/(2(1 + 4λᵢ²t²)))·e^{iψᵢ(t)},
ψᵢ = ½arctan(2λᵢt) − λᵢt − λᵢμᵢ²t³/(1 + 4λᵢ²t²) (cross-checked against direct quadrature in one coordinate to 10⁻¹⁰).
- One coordinate λ(g² − 1) + μg: the ratio decreases from 1 (μ only) to 0.8578 (λ only); 0.8849 at λ = ½, μ = 1/√2.
- Random Q in 2, 3, 5, 8 coordinates (40 each): largest ratio 0.99999926, always at nearly Gaussian Q.
- The normalised gap D = (1 − ratio)/κ₄, minimised by Nelder–Mead from the best of 30 random starts, in 1–4 coordinates: the minima
  found are 0.010407–0.010417, i.e. the Edgeworth value (1 − ¾)/24 = 1/96 = 0.0104167, reached at the Gaussian limit (λ → 0 in one
  coordinate carrying the linear term; there κ₄ ~ 10⁻⁸ and the last digits are quadrature noise). For Theorem 1's family D = 0.0105
  (c = 0.05), 0.0122, 0.0198, 0.0303 (c = 0.8).
So nothing contradicts the general degree-≤ 2 inequality, and the binding regime is the near-Gaussian one, as for one block.

**6.3 Why the method stops.** (i) The conditioning of §4 needs, at each step, a subspace that is isotropic for the current quadratic part
and orthogonal to the current linear coefficient; conditioning on anything else creates a constant (a nonzero conditional mean). A
definite or unbalanced quadratic part has no such subspace, so the "atoms" stay of unbounded dimension; with a symmetric spectrum the atom
is one block (§4). (ii) In the Fourier formula the phases ½arctan(2λᵢt) − λᵢt no longer cancel, and they are there even for μ = 0, where
the records' proof (D1, `handoff/research-degree5/d1/D1_NOTES.md`) needed Yamazato's unimodality theorem and pointwise Fourier arguments
fail (D1 §5 item 1). (iii) That Stein/self-decomposability route does not extend: a non-central χ² has Lévy density
e^{−y/(2λ)}(1/(2y) + μ²/(16λ³)) whose y-multiple is not monotone once μ² > 4λ², so it is not self-decomposable. The first new case beyond
Theorem 2 and D1's Theorem B (pure second chaos plus an independent Gaussian) would be one block plus an independent pure second chaos
with an unbalanced spectrum; I did not attempt it.

## 7. Files and replay

Folder `handoff/research-third-chaos/gemini-log-2026-11-17/fourpartite/` (all by claude-b9ee's research worker, 17 Nov 2026):

- `c01_K_certify.py`, `c01_K_certify.log` (C): the certificate of §3.3–3.4. Needs python-flint (arb). `python3 -I c01_K_certify.py`,
  25 s on one core; last line `RESULT: K(s) > 0 for every s in (0,1]: CERTIFIED`.
- `c02_K_crosscheck_iv.py`, `c02_K_crosscheck_iv.log` (C, independent implementation): mpmath.iv, `python3 -I c02_K_crosscheck_iv.py 10`
  (17 cells, 44 s).
- `n01_explore.py/.log` (N): Fourier vs conditional formula for one block plus a Gaussian (agreement 10⁻¹³); one block at a = b.
- `n03_K.py/.log` (N): K(s) and the bound with the true phase on a grid; sign changes of the integrand.
- `n04_reduction_and_classes.py/.log` (N): §4 remark (b) and the rows K₄^(3), blow-up, C₇^(3), two edge types, tripartite of §5.4.
- `n05_general_deg2.py/.log`, `n05b_deg2_deficit.py/.log` (N): §6.2.
- `n06_more_classes.py/.log` (N): the rows "sums of copies", "Hermite terms in A" and "4th chaos" of §5.4.

`n01` and `n03` ran on the laptop (one core, before the coordinator moved the work); all other runs were on yo (folder
`~/claude-b9ee-fourpartite`, own venv with mpmath, numpy, scipy, python-flint; one or two cores), and that folder was deleted before the
hand-back. The replay commands need python-flint for `c01` and mpmath for `c02`; the N scripts need numpy and scipy (`n04`–`n06` import
each other, so run them from this folder).
