<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/d1/D1_NOTES.md (file dated 2026-11-04). Only this line was added. -->
# Conjecture D₁, degree 2 (real): PROVED. Notes of the worker of claude-b9ee (4 Nov 2026)

Scripts in this folder (`/usr/local/bin/python3 -I -W ignore d1_numK.py`): `d1_num1.py` … `d1_num8.py`; what each tests is in §4.
Setting: X = Σ_{i≤d} λ_i ξ_i, ξ_i = g_i² − 1 i.i.d. centred χ²₁, ‖X‖₂² = 2Σλ_i². Write θ_i := 2λ_i (signed scale), Γ_i ~ Gamma(1/2,1),
so λ_iξ_i = θ_i(Γ_i − ½) and Var X = Σθ_i²/2. Normalisation 2Σλ_i² = Σθ_i²/2 = 1 unless stated.

## 0. Result

**Theorem A (D₁ for the real second chaos).** For every λ ∈ ℝ^d, E|Σλ_i(g_i²−1)| ≤ √(2/π)·√(2Σλ_i²), with strict inequality
for every λ ≠ 0. The bound is attained only in the limit (e.g. equal eigenvalues, d → ∞: E|χ²_d − d|/√(2d) = √(2/π)e^{−μ(d/2)} ↑ √(2/π)).
Equivalently sup_{|u|≤1}‖Π₂u‖₂² = 2/π.

**Theorem B (same proof).** For independent Gammas Γ_i ~ Gamma(a_i,1), signed scales σ_i ≠ 0, and an independent Gaussian G:
E|Σσ_i(Γ_i − a_i) + bG| ≤ √(2/π)·(Σσ_i²a_i + b²)^{1/2}. (Theorem A is a_i = ½, σ_i = 2λ_i, b = 0.)

Ingredients: Gaussian/Gamma Stein identities (elementary), the size-bias relation Gamma(a+1) = Gamma(a) + Exp(1), a one-line
Laplace-transform lemma, and **Yamazato's theorem** (every self-decomposable law on ℝ is unimodal: M. Yamazato, Ann. Probab. 6 (1978)
523–531; also Sato, *Lévy processes and infinitely divisible distributions*, Thm 53.1). Everything else is self-contained below.

## 1. Proof

Throughout, G, G_s ~ N(0,1), N(0,s²) are independent of everything; X_s := X + G_s; p_s := density of X_s (smooth, bounded for s > 0);
X₂ := Σ_iθ_i·(θ_i(Γ_i − ½)) = Σθ_i²(Γ_i − ½) = 2Σλ_i²ξ_i. Note EX₂ = 0 and E[X₂X²] = 16Σλ_i⁴ > 0.

**Step 1 (Stein kernels).** For Y = θ(Γ − ½), θ ≠ 0: E[Yh(Y)] = E[τ(Y)h'(Y)] with τ(y) = θ(y + θ/2) (from the Gamma Stein identity
E[(Γ − a)h(Γ)] = E[Γh'(Γ)]; for θ < 0 use τ_{−Y}(y) = τ_Y(−y)). Hence, with R independent of Y: E[Yh(Y+R)] = E[τ(Y)h'(Y+R)] = θ²E[Γh'(Y+R)].
Summing over i and adding the Gaussian (τ ≡ s²): for X_s,
  E[X_s h(X_s)] = E[τ_s(X_s)h'(X_s)],  τ_s(x) = Var(X_s) + E[X₂ | X_s = x] = 1 + s² + E[X₂ | X_s = x].        (1.1)

**Step 2 (the OU path and its derivative).** For c ∈ (0,1) put σ = √(1−c²), X_c := cX + σG, s := σ/c ∈ (0,∞). Then
  d/dc E|X_c| = E[sign(X_c)(X − (c/σ)G)] = (2c/σ)E[X·(Φ(cX/σ) − ½)·… ] computed by (1.1) with h(x) = 2Φ(cx/σ) − 1 and by the
  Gaussian identity E[sign(a+σG)G] = 2φ(a/σ):  d/dc E|X_c| = (2c/σ)E[(τ_X(X) − 1)φ(cX/σ)] = (2c/σ)E[X₂ φ(X/s)] = 2p_s(0)·E[X₂ | X_s = 0].  (1.2)
(Checked numerically to 6 digits, `d1_num5.py` (c).) Since E|X_0| = E|G| = √(2/π) and E|X_c| → E|X| as c ↑ 1, Theorem A follows from

**Key Lemma (C7).** E[X₂ | X_s = 0] ≤ 0 for every s > 0 (and < 0 for s large, since E[X₂φ_s(X)] ≈ −E[X₂X²]/(2s³√(2π)) < 0).

**Step 3 (size-biasing: everything in terms of one-sided exponential averages of p_s).** Γ·f_{1/2}(γ) = ½f_{3/2}(γ) and Gamma(3/2) =
Gamma(1/2) + Exp(1), so E[Γ_i h'(X_s)] = ½E[h'(X_s + θ_iE_i)], E_i ~ Exp(1) independent. Define, for θ > 0,
  δ_s(θ)  := ∫₀^∞ e^{−u/θ}[p_s(−u) − p_s(0)]du = θ[p_{X_s+θE}(0) − p_s(0)]   (left side of 0),
  δ_s⁻(θ) := ∫₀^∞ e^{−u/θ}[p_s(u) − p_s(0)]du  = θ[p_{X_s−θE}(0) − p_s(0)]   (right side of 0).
A one-line integration by parts gives p'_{X_s+θE}(0) = −δ_s(θ)/θ² and p'_{X_s−θE}(0) = δ_s⁻(θ)/θ². Let P = {i: θ_i > 0}, N = {i: θ_i < 0}.
Taking h = δ₀ in Step 1 (legitimate for s > 0: all densities are smooth):
  (I2)  p_s(0)·E[X₂ | X_s = 0] = E[X₂δ(X_s)] = Σ_iθ_i·θ_i²·½·E[δ'(X_s+θ_iE_i)] = ½[Σ_{P}θ_jδ_s(θ_j) + Σ_{N}|θ_k|δ_s⁻(|θ_k|)],
  (I1)  0 = E[X_sδ(X_s)] = Σ_iθ_i²·½·E[δ'(X_s+θ_iE_i)] + s²E[δ'(X_s)]  ⟹  Σ_{P}δ_s(θ_j) − Σ_{N}δ_s⁻(|θ_k|) = 2s²p_s'(0).
(Both verified numerically to 6 digits for positive and mixed spectra, `d1_num8.py`.)

**Step 4 (unimodality).** X_s is infinitely divisible with Lévy density k(x)/|x|, k(x) = ½Σ_{P}e^{−x/θ_j} (x>0), ½Σ_{N}e^{−|x|/|θ_k|} (x<0),
k monotone towards 0 on each half-line, plus Gaussian part s²: i.e. X_s is self-decomposable (class L). By Yamazato's theorem p_s is unimodal:
nondecreasing on (−∞, m₀], nonincreasing on [m₀, ∞) for some mode m₀. Consequently the functions on (0,∞)
  H_s(u) := p_s(−u) − p_s(0)  and  H_s⁻(u) := p_s(u) − p_s(0)
satisfy: if m₀ < 0 then H_s⁻ ≤ 0, p_s'(0) ≤ 0, and H_s has exactly one sign change, from + to −, at the unique u₁ > |m₀| with p_s(−u₁) = p_s(0);
if m₀ > 0 the mirror statements hold (H_s ≤ 0, p_s'(0) ≥ 0, H_s⁻ one change + to −); if m₀ = 0 both H ≤ 0.

**Step 5 (Laplace lemma).** If H: (0,∞) → ℝ is bounded, H ≥ 0 on (0,u₁), H ≤ 0 on (u₁,∞), then r ↦ e^{ru₁}∫₀^∞e^{−ru}H(u)du is nondecreasing
(its derivative is −∫(u−u₁)e^{−r(u−u₁)}H(u)du ≥ 0). Hence θ ↦ δ_s(θ) = ∫e^{−u/θ}H_s(u)du is ≥ 0 on (0,θ*) and ≤ 0 on (θ*,∞) for some
θ* ∈ [0,∞] (apply the lemma with r = 1/θ). If H ≤ 0 throughout, then trivially δ ≤ 0 throughout.

**Step 6 (bookkeeping).** Case m₀ < 0: δ_s⁻(|θ_k|) ≤ 0 for all k ∈ N (Step 4), and with θ* from Step 5,
  Σ_Pθ_jδ_s(θ_j) = Σ_P(θ_j − θ*)δ_s(θ_j) + θ*Σ_Pδ_s(θ_j) ≤ θ*Σ_Pδ_s(θ_j) = θ*[2s²p_s'(0) + Σ_Nδ_s⁻(|θ_k|)] ≤ 0,
every term being ≤ 0 (each (θ_j − θ*)δ_s(θ_j) ≤ 0 by Step 5; p_s'(0) ≤ 0; if θ* = ∞ all δ_s(θ_j) ≥ 0 and (I1) forces them to vanish).
So by (I2), p_s(0)E[X₂|X_s=0] ≤ ½Σ_N|θ_k|δ_s⁻(|θ_k|) ≤ 0. Case m₀ > 0: mirror image (use Σ_Nδ_s⁻ = Σ_Pδ_s − 2s²p_s'(0) ≤ 0 and the threshold for δ_s⁻).
Case m₀ = 0: all δ ≤ 0. This proves the Key Lemma, hence Theorem A. ∎

**Theorem B.** Identical: τ_i(y) = σ_i(y + σ_ia_i), E[Γ_{a}h'(·)] = aE[h'(· + E)], X₂ := Σσ_i²(Γ_i − a_i); (I2) reads
p_s(0)E[X₂|X_s=0] = Σ_Pσ_ja_jδ_s(σ_j) + Σ_N|σ_k|a_kδ_s⁻(|σ_k|) and (I1) Σ_Pa_jδ_s(σ_j) − Σ_Na_kδ_s⁻(|σ_k|) = s²p_s'(0); the weights a_i > 0 do not
affect Step 6. Class L and Yamazato apply verbatim (Lévy density ∝ Σa_ie^{−|x|/|σ_i|}/|x|). ∎

**Remarks.** (i) Where the Gamma structure enters: linear Stein kernels (so that τ(0) − Var = E[X₂|X=0] with X₂ again a weighted sum),
size-biasing by an *exponential* shift (so that the one-sided averages are Laplace transforms: variation diminishing), and class L (unimodality).
Centred Poisson(ν), ν ∈ (0.2, 0.85), has E|X|/σ up to 0.858 > √(2/π): positivity of all cumulants is not enough; the x^{−1} singularity of the
Gamma Lévy measure (class L) is what matters. (ii) At s = 0, (I1) reads Σ_Pδ₀ = Σ_Nδ₀⁻ and the same argument gives τ_X(0) ≤ Var X, i.e.
E|X| ≤ 2Var(X)p_X(0) (equality for every single Gamma and for Gaussians; this is Stirling's bound Γ(a) > √(2π)a^{a−1/2}e^{−a} when X is a
centred Gamma). (iii) The fixed-measure analogue is false (Heilman, §2), so the proof had to work at the mean level c = 0 only; the OU path
E|cX + √(1−c²)G| is monotone while the pairwise Schur route is not (§4).

## 2. Equal eigenvalues (closed form) and literature

**L1.** Y ~ Gamma(a,1): E|Y − a| = 2a^ae^{−a}/Γ(a) (E|Y−a| = 2a[F_a(a) − F_{a+1}(a)], F_a(x) − F_{a+1}(x) = x^ae^{−x}/Γ(a+1)). So
E|χ²_d − d| = 4(d/2)^{d/2}e^{−d/2}/Γ(d/2), and for λ_i ≡ 1/√(2d): E|X| = √(2/π)e^{−μ(d/2)}, μ = Binet's function (positive, decreasing);
values 0.68440, 0.73576, 0.75533, …, 0.79127 (d = 20) ↑ 0.797885. Verified to 1e-8 (`d1_num1.py`).

**Heilman**, *Low correlation noise stability of symmetric sets*, J. Theor. Probab. 34 (2021), arXiv:1511.00382: the ρ² coefficient of the noise
stability of a symmetric set A is ½[Σ_i(∫_A(1−x_i²)dγ)² + 2Σ_{i≠j}(∫_Ax_ix_jdγ)²] = our ‖E[1_Aξ]‖² after diagonalising. Thm 1.7/1.8: among
symmetric sets of fixed measure, B(0,r) ⊂ ℝⁿ or its complement is a local maximiser iff r² ≤ n+2; for r² > n+2 it is not, and at measure
≈ 0.944 in ℝ² an ellipse (semi-axes 2.5, 2.314) and a strip beat the ball. Our extremal set {Σλ_ig_i² < Σλ_i} is the ball of radius² d ≤ d+2;
the counterexamples live at fixed measure with larger balls. Theorem A settles the free-measure problem.

## 3. Reformulations established on the way (all equivalent to the Key Lemma or to D₁)

- Dual: E|X| = sup_{|u|≤1}E[uX]; sup_X E|X|/‖X‖₂ = sup_{|u|≤1}‖Π₂u‖₂, ‖Π₂u‖² = ½‖E[u(gg^T−I)]‖_F² = E[u(g)u(g')K₂(g,g')]; WLOG u even in each
  coordinate: for y_i i.i.d. χ²₁, Σ_i(E[u(y)(y_i−1)])² ≤ 4/π (∞→1 norm of the first Laguerre kernel).
- E|X| = 2τ(0)p_X(0) = E[|∇X|²δ(X)] = ∫_{X=0}|∇X|φ_d dS = 2E[X⁻]; Stein: E|X| − √(2/π) = √(2/π)E[X₂w(X)], w(x) = 1 − |x|Φ̄(|x|)/φ(|x|).
- Lévy: X is ID, Lévy density ½|x|^{−1}Σe^{−|x|/|θ_i|} on sign x = sign θ_i. τ_Xp_X = ν̄₁ * p_X with ν̄₁(w) = ∫_{|y|>|w|, sign y = sign w}|y|ν(dy)
  (the Stein-kernel density is the ν̄₁-smoothing of p). Integral equation (x+m)p(x) + s²p_s'(x) = Σ_P½θ_jp_{X_s+θ_jE_j}(x) − Σ_N½|θ_k|p_{X_s−|θ_k|E_k}(x).
- Key Lemma ⟺ E|X_s| ≤ 2Var(X_s)p_{X_s}(0) ⟺ E[b(X+S)] ≤ E[b(X)] for Gaussian bumps b, S ⊥ X with density ν̄₁ ⟺ ∫₀^∞Re[Ψ'(t)]e^{−at²/2}t^{−1}dt ≥ 0
  for all a ≥ 1, Ψ := φ_X/φ_G ⟺ ∫₀^∞[Re φ_X(t) − e^{−t²/2}]e^{−(a−1)t²/2}(a + t^{−2})dt ≥ 0 for all a ≥ 1 (D₁ itself is ∫[Re φ_X − e^{−t²/2}]t^{−2} ≥ 0).
- Second-order (near-Gaussian) expansion: E|X| ≈ √(2/π)[1 − 2p₄ + (8/3)p₃²], p_k = Σλ_i^k; Cauchy–Schwarz p₃² ≤ p₂p₄ = p₄/2 gives the sign,
  and τ(0) − 1 ≈ −8(p₄ − 2p₃²) ≤ 0 is exactly Cauchy–Schwarz.

## 4. Numerical record (nothing contradicts Theorem A; the scripts are the evidence)

- `d1_num1.py`: closed form (A); pair test (B); doubling E|X+X'| ≥ √2E|X| (C, 8/8); F(λ) ≤ F(|λ|) (D, 6/6).
- `d1_num2.py`: τ(0) ≤ 1 (E, all); Gamma-shape interpolation Φ(n) = E|Σλ_i(χ²_n−n)/√n| increasing (F, 6/6); pair monotonicity (G); Stein identity (H).
- `d1_num3.py`: p_X(0) ≤ 1/√(2π) is FALSE for positive spectra ((1, ε×64): p(0) = 0.459); so the two-factor route dies.
- `d1_num4.py`: **the pairwise Schur lemma is FALSE.** Exact formula dF/dθ = −8ab(b−a)p'_{X̃}(0), X̃ = a(χ²₃−1) + b(χ²₃'−1) + W (FD agrees to 6 digits);
  for W = (1,1,1) and a pair of norm r ≤ 0.3, E|X| increases away from the equal pair (by up to 8e-4). Equalising a pair helps only if the pair
  is not small relative to the rest, so no induction on d by pair equalisation.
- `d1_num5.py`: Key Lemma in the form D(σ) = E[X₂e^{−X²/2σ²}] ≤ 0 for 11 σ's and 16 spectra (positive, mixed, the ones where the pair lemma fails):
  all negative; E|X_c| strictly increasing as c ↓ in all cases; derivative formula (1.2) confirmed.
- `d1_num6.py`: E[X₂|X_s=0] ≤ 0 in 40/40 cases; the naive ordering "E[Y_i|X_s=0] decreasing in λ_i" fails 11/40 (tiny components have conditional
  mean ≈ 0), so Chebyshev's sum inequality is not available; the threshold structure (sign − iff λ_i ≥ λ*) is what holds and what the proof uses.
- `d1_num7.py`: convexity of τ_{X_s} (would give the Lemma by Jensen) is at best marginal/noisy — not used.
- `d1_num8.py`: identities (I1), (I2) to 6 digits; threshold structure of δ_s, δ_s⁻ exactly as in Steps 4–6, for positive, mixed and mirrored spectra.

## 5. Dead ends (with reasons), for the record

1. Pointwise Re φ_X(t) ≥ e^{−t²/2}: false (phase Θ(t) ≈ Σ(π/4 − λ_it) oscillates); only |φ_X| ≥ e^{−t²/2}.
2. Jensen on g² − 1 = E[g² − g'² | g] or symmetrisation: loses √2 (gives the trivial bound); E|X| ≤ E|X−X'|/√2 is false (d=1).
3. Convex-order pair lemma: false (κ₄ goes the wrong way); the pair lemma with remainders of the class is also false for small pairs (§4).
4. Conditioning on |g| or on g/|g| plus Jensen gives only LOWER bounds E|X| ≥ (Σλ_i/d)E|χ²_d−d|.
5. B-inequality (log-concavity of log λ ↦ P(Σλ_ig_i² ≤ y)): comparison with the equal-volume ball is far too weak.
6. Two-factor route 2τ(0)p(0) with both factors bounded separately: p(0) can exceed the Gaussian value.
7. Borell's bound (2/π)arcsin ρ gives only a₂ ≤ 0.879.
8. Jensen via convexity of the Stein kernel τ: not clearly true.
