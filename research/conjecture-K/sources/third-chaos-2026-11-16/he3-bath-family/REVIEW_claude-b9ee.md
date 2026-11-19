<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-bath-family-2026-11-16/REVIEW_claude-b9ee.md (16 November 2026); claude-b9ee. Only this line was added. -->
# The family a·He₃(X) + b·XY + c·Z: review of a proof of E|F| ≤ (5/(2√(3π)))·‖F‖₂

claude-b9ee, 16 November 2026, 23:58 (Europe/Bucharest). The task was written by a Codex session ("the d = 3 case"); the
proof was produced by an outside session of the user and pasted into this session by the user; both are kept here
as pasted: `TASK.txt` and `PROOF_as_pasted.md` (no other file of it exists). **Verdict: the proof is
correct.** I checked every step by hand and the numbers below by computation.

## Statement (P)

X, Y, Z independent N(0, 1), a, b, c real, F = a(X³ − 3X) + bXY + cZ. Then E F² = 6a² + b² + c² and

    E|F| ≤ (5/(2√(3π)))·‖F‖₂ = 0.814337…·‖F‖₂ < √(2/3)·‖F‖₂ < √(17/25)·‖F‖₂ = 0.824621…·‖F‖₂.

## The proof, as I verified it

1. **Reduction.** With p = 6a², q = b², 1 − p − q = c² (after scaling), F given X = x is Gaussian with mean
   μ(x) = ±√(p/6)(x³ − 3x) and variance v(x) = qx² + 1 − p − q, so E|F| = J(p, q) = ∫Ψ(μ(x), v(x))φ(x)dx with
   Ψ(μ, v) = E|μ + √v·W| = √(2v/π)e^{−μ²/(2v)} + μ·erf(μ/√(2v)). Checked.
2. **Lemma (the one new idea): E|μ + σW| ≤ √(μ² + (2/π)σ²)** for all real μ and σ ≥ 0, with equality at μ = 0.
   Proof: D(y) = y² + 2/π − Ψ(y, 1)², D(0) = 0, Ψ′ = erf(y/√2), and
   D′(y) = 2√(2/π)[y(1 + erf)∫_y^∞e^{−s²/2}ds − e^{−y²/2}erf]. With the lower bound
   ∫_y^∞e^{−s²/2}ds > r(y)e^{−y²/2}, r = 2/(√(y² + 4) + y) (proved in the text by g′ < 0 and g(∞) = 0, using
   r² + yr = 1 and r′ = −r/√(y² + 4): checked), D′(y) ≥ 2√(2/π)e^{−y²/2}·[2y − (√(y² + 4) − y)·erf]/(√(y² + 4) + y) ≥ 0,
   because √(y² + 4) − y ≤ 2 and erf(y/√2) ≤ √(2/π)·y ≤ y. Checked line by line.
3. **Linearisation.** R(p, q; x) = μ² + (2/π)v is affine in (p, q). For the weight w(x) = √(3/(2π))·e^{(7/50)x²},
   √R ≤ w/2 + R/(2w), so J(p, q) ≤ L(p, q) := ½∫wφ + ½∫(R/w)φ, which is affine in (p, q), hence at most its
   largest value at the three vertices of the triangle.
4. **Vertices (exact).** With s = 32/25: L(0, 0) = 5/(2√(3π)); L(0, 1) = (57/64)·L(0, 0);
   L(1, 0) = (1 + 34925π/131072)·5/(4√(3π)) < L(0, 0), because 34925·7/(131072·2) = 244475/262144 < 1 and π < 7/2.
   The rational enclosure 25/8 < π < 7/2 is proved from π = 6∫₀^{1/2}(1 − x²)^{−1/2}dx. All arithmetic re-done in
   exact fractions (`check_bath_family.py`).

No step uses a grid, a truncation or an optimiser.

## Numerical checks (N; mine, not part of the proof)

- The lemma: D(y) ≥ 0 at 12,075 points of [0, 59] and down to y = 10⁻³⁰ (60 digits); the Mills-ratio bound holds at
  all of them.
- J against L on 5,151 points of the triangle (composite Gauss–Legendre, 11,520 nodes): J ≤ L everywhere; the
  smallest gap is 0.0027 at (p, q) = (0, 0.34). The largest J is 0.797885 = √(2/π), at (0, 0).
- J(1, 0) = 0.616460 = (1 + 4e^{−3/2})/√(3π) and J(0, 1) = 0.636620 = 2/π, as the remarks say; Monte Carlo with
  4·10⁶ samples agrees with the quadrature at four interior points within 2 standard errors.
- The remark on the best weight: L(1, 0) = L(0, 0) at λ = 0.18123, where the bound is 0.804574 (the text says
  0.1815 and 0.8046).
- The expansion J = √(2/π)(1 − (15/4)p² − (3/2)pq − q²/4 + …): the q² coefficient is confirmed to 3·10⁻⁶ at
  q = 0.01; in p the second-order coefficient is approached slowly (2.18 at p = 0.02, 2.65 at p = 0.01), as it must
  be: the third-order coefficient is about +48 (E He₃⁶ is large). Consistent, not a discrepancy.

## What it proves, and what it does not

- F is the limit, in law and in first absolute moment, of the third-chaos variables
  F_N = a·He₃(X) + bX·Σ(U_i² − 1)/√(2N) + c·ΣHe₃(V_i)/√(6N). This is the "Gaussian bath" limit of the shape that the
  numerical maximisers of the real third chaos have (A·He₃(X) + B·X(|Y|² − m) + R(Y), `R3_REPORT.md` of the TCH
  package). So the weak constant √0.68, the real form of the radius 0.916 (K ledger 3.21), holds on this limit
  family with room: 0.8143, and 0.8046 with the best weight.
- For c = 0 the variables F_N are odd under the reflection X → −X, and the recorded reflection theorem already
  gives the sharp constant √(2/π) for them (TCH `gpt/reflection_proof.tex`). The new case is the independent
  Gaussian remainder c·Z, which breaks that oddness.
- It is **not** a bound for third-chaos variables in finitely many coordinates, and not for the whole chaos: only
  for the three-parameter limit family. The sharp constant on the family (√(2/π), attained only at the Gaussian
  point by the numerics here and in `R3_REPORT.md` §4) is not proved; the proof's majorant has the value
  0.8143 at the Gaussian point, where the truth is 0.7979.
- The lemma is reusable: for any F that is Gaussian with mean M and variance V given some σ-field,
  E|F| ≤ E√(M² + (2/π)V) ≤ √(E M² + (2/π)E V). By the second (Jensen) form alone the constant √0.68 holds whenever
  the conditional mean carries at most (0.68 − 2/π)/(1 − 2/π) = 11.9 % of the energy.

## Proposed ledger text (K ledger, row 3.21 (e), one clause; status P)

"on the Gaussian-bath limit family a·He₃(X) + b·XY + c·Z (X, Y, Z independent standard Gaussians; the limit of
a·He₃(X) + bX·Σ(U_i² − 1)/√(2N) + c·ΣHe₃(V_i)/√(6N)): E|F| ≤ (5/(2√(3π)))‖F‖₂ = 0.8143‖F‖₂ < √0.68·‖F‖₂, from
E|μ + σW| ≤ √(μ² + (2/π)σ²) and a Gaussian weight (**P**, an outside session of the user; re-derived by
claude-b9ee, who also checked the vertex arithmetic exactly)".
