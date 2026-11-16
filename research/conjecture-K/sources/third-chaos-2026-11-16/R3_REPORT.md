<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/r3-chaos/R3_REPORT.md, 16 November 2026; claude-b9ee research worker. -->
# (R₃): is E|h| ≤ √(2/π)‖h‖₂ on the real third Wiener chaos?

Worker for claude-b9ee, 16 November 2026. Numerical study, literature check and assessment of proof routes,
complementary to GPT's package `gpt-package-2026-11-16/`.

Labels: **P** proved (argument given here or cited), **C** certified (exact or interval arithmetic), **N** numerical
(floating point, error bars stated). Throughout, c = √(2/π) = 0.7978845608 and ratios are quoted as
E|h|/(c‖h‖₂), so the claim (R₃) reads "ratio ≤ 1".

## 0. Verdict

* **No counterexample.** The numerical supremum s_n of E|h|/(c‖h‖₂) over cubics in n variables increases slowly
  with n and stays far below 1 (**N**):
  * n = 1…6: 0.7726 (exact), 0.7862, 0.8279, 0.8423, 0.8589, 0.8755;
  * n = 7…10: validated lower bounds ≥ 0.8821, ≥ 0.8912, ≥ 0.9022, ≥ 0.9051.

  n·(1 − s_n) rises from 0.23 to about 0.8–0.95 and is not decreasing. The maximisers' κ₄ falls like ≈ 85/n, and
  Edgeworth heuristics predict 1 − s_n ≈ 3.5/n for large n. There is no sign of a crossing.
* **The maximisers lie outside GPT's proved classes.** In the trace frame they have the shape
  A·He₃(X) + B·X(|Y|² − m) + R(Y), with R(Y) a harmonic, isotropic cubic (**N**). The R(Y) part carries
  28 % of the variance at n = 3, rising to 64 % at n = 10, and breaks reflection oddness. The best cubics inside the proved classes
  are much worse (n = 3: class 1 gives 0.785, class 3 gives 0.736, the global maximum is 0.828).
* **Limits with a Gaussian bath** (every hidden block replaced by its CLT limit; k ≤ 3 visible coordinates) never
  exceed 1. Their supremum is reached only at the pure Gaussian, and at the optimum the visible cubic carries no
  weight (**N**). A law recursion that iterates such limits, starting from He₃, stays below 1 (**N**, §4).
* **Doubling.**
  * Real: confirmed that it fails for He₃ (−0.01257), as GPT proved.
  * Real near-extremal cubics: doubling helps every one of them, with gain +0.008 to +0.014 (**N**).
  * Complex (ledger 3.20): on the near-extremal complex cubics of codex-c7e2 (n = 2, 3, 4, 6, 8), the first and
    second doublings both gain, +0.015 to +0.019 and +0.017 to +0.031, standard errors below 10⁻⁴ (**N**). An
    adversarial search in C² and C³ found no negative gain: the minima are +0.0065 and +0.011 (§5).
* **GPT's smoothing sign condition (5)** holds on every cubic tested, with a wide margin. Its binding end is s → 0,
  that is τ(0) = E[Γ | X = 0] ≤ 1 (**N**). In normalised form, max_s (1+s)·D(s) is:
  * −0.30 to −0.22 for the maximisers of n = 2…8, slowly approaching 0 as they become more Gaussian;
  * ≤ −0.23 over the n = 2 and n = 3 searches, where the worst case is He₃ or a cubic close to it;
  * τ(0) ≤ 0.774 for 660 random cubics with n = 2…4.

  Gaussian mixtures satisfy (5) (**P**). The complex analogue is monotone on the near-extremal complex cubics.
* **Literature:** I found no proof of (R₃), or of (R_d) for any d ≥ 2, beyond HJM's unproved "it can be shown" (§8).
* **Malliavin identity:** it is the case x = 0 of the Nourdin–Viens density formula, an exact reformulation, not a
  route (§7). The maximisers have a density at 0 that is 11–15 % above the Gaussian value and τ(0) ≈ 0.71–0.77.
* **Complex dimension-free 0.916:** see §9. The kurtosis dichotomy fails quantitatively. Phase averaging plus an
  *approximate* form of condition (5), with a defect ε ≤ 0.0336, would suffice.

## 1. Method: exact radial integration

For h = I₃(T) with T symmetric we have h(x) = T(x,x,x) − 3⟨v,x⟩, where v_k = Σ_i T_iik and E h² = 6‖T‖²_F.
Along a ray x = rθ, h = r(a r² − 3b), with a = T(θ,θ,θ) and b = ⟨v,θ⟩; the radius r ~ χ_n is independent of θ.
Hence, exactly (**P**, elementary),

  E_r|h| = a·A₃ − 3b·A₁,  A_k = sign(a)·M_k·(2Q((n+k)/2, t₊) − 1),  t = 3b/(2a),

where M_k = E r^k and Q is the regularised upper incomplete gamma function. The angular integrand is continuous
and piecewise smooth, so product Gauss rules on S^{n−1} converge fast. Accuracy is limited by conical points
where a = b = 0. The gradient is exact by the envelope theorem: ∂/∂a = A₃ and ∂/∂b = −3A₁.

Optimisation used the following steps:

* monotone best-response steps T ← Π₃ sign(h);
* L-BFGS from random, He₃-sum and mixed starts (12, 24, 66, 69, 72, 40, 28, 6 and 6 starts for n = 2…10);
* refinement on a finer, rotated rule.

Final values were checked independently:

* n ≤ 5: two product rules, scrambled-Sobol QMC directly in Rⁿ with 2²⁴ points, and plain Monte Carlo with
  4·10⁷ points;
* n ≥ 6: QMC in Rⁿ with 2²⁴ points and two hold-out quasi-random direction sets.

Scripts: `r3lib.py`, `r3opt*.py`, `r3analyse.py`, `r3refine.py`.

## 2. Task 1: numerical supremum per dimension (**N**)

| n | sup E\|h\|/‖h‖₂ | ratio s_n | check (RQMC 2²⁴, MC 4·10⁷) | κ₄ | variance shares He₃ / (X²−1)L / XQ / R in the trace frame |
|---|---|---|---|---|---|
| 1 | 0.6164602259 (exact) | 0.77262 | exact formula c(1+4e^{−3/2})/√6 | 90 | 1 / 0 / 0 / 0 |
| 2 | 0.6272979 | 0.78620 | 0.6272983; 0.62745 ± 0.00012 | 65.1 | 0.69 / 0.06 / 0.23 / 0.02 |
| 3 | 0.6605959 | 0.82793 | 0.6605958; 0.66069 ± 0.00012 | 36.5 | 0.52 / 0 / 0.20 / 0.28 |
| 4 | 0.6720347 | 0.84227 | 0.6720348; 0.67211 ± 0.00012 | 28.3 | 0.42 / 0.01 / 0.24 / 0.34 |
| 5 | 0.6852696 | 0.85886 | 0.6852694; 0.68520 ± 0.00012 | 21.0 | 0.34 / 0 / 0.25 / 0.42 |
| 6 | 0.698538 | 0.87549 | RQMC 2²⁴ 0.698538; two hold-out direction sets 0.87547 | 15.9 | 0.27 / 0 / 0.23 / 0.50 |
| 7 | ≥ 0.703845 | ≥ 0.88214 | RQMC 2²⁴; hold-out direction sets 0.88200, 0.88203 | 13.6 | 0.23 / 0 / 0.24 / 0.52 |
| 8 | ≥ 0.711114 | ≥ 0.89125 | RQMC 2²⁴; hold-outs 0.89104, 0.89132 | 11.4 | 0.20 / 0 / 0.23 / 0.57 |
| 9 | ≥ 0.719857 | ≥ 0.90221 | RQMC 2²⁴; hold-outs 0.90151, 0.90254 | 9.1 | 0.16 / 0 / 0.21 / 0.62 |
| 10 | ≥ 0.722200 | ≥ 0.90514 | RQMC 2²⁴; hold-outs 0.90509, 0.90514 | 8.2 | 0.15 / 0 / 0.21 / 0.64 |

Every start converged to the same value for n ≤ 4: 12, 24 and 66 starts. For n = 5 (69 starts) there are two
local maxima, 0.68303 and the tabulated one. For n = 6 (72 starts) the coarse optima scatter by about 10⁻³, and
the table gives the refined value.

For n ≥ 7 (40, 28, 6 and 6 starts) the entries are **validated lower bounds**: the tensor was optimised on
quasi-random direction rules, then re-evaluated independently. The quadrature noise of the optimisation is about
10⁻³, so the true maxima may be a few 10⁻³ higher. The κ₄ and the shares for n ≥ 7 are those of the
lower-bound tensors.

**Structure of the maximisers (N).** Put X = ⟨v̂, x⟩ along the trace vector v and Y in the orthogonal
complement (m = n − 1). The maximisers for n = 3 and n = 5 are, up to 10⁻⁴,

  h = A·He₃(X) + B·X(|Y|² − m) + R(Y),

with R a harmonic (trace-free) cubic that is isotropic (its contraction R·R is a multiple of I_m); n = 4 and n = 6
are close to this form. The "flatness" E|R(Ŷ)|/rms on the unit sphere is 0.900, 0.882 and 0.861 for n = 3, 4, 5
(the Gaussian value is 0.798). This angular flatness is what the maximiser exploits. As n grows, the He₃ share
falls (0.52 at n = 3, 0.15 at n = 10), the XQ share stays near 0.21–0.25, and the R share grows (0.28 to 0.64).
The (X²−1)L share stays at 0 for n ≥ 3. For n = 3, R is the simplex
cubic Re(y₁+iy₂)³, but simplex cubics are not optimal for n = 4, 5 (0.8336 and 0.8451).

**Trend.** The increments of s_n are 0.0136, 0.0417, 0.0143, 0.0166, 0.0166 (n = 1 → 6), then about 0.007–0.01 per
step (from the lower bounds). The sequence n(1 − s_n) is 0.23, 0.43, 0.52, 0.63, 0.71, 0.75 for n = 1…6. The lower
bounds give n(1 − s_n) ≤ 0.83, 0.87, 0.88, 0.95 for n = 7…10, consistent with a nondecreasing sequence. The maximisers approach the Gaussian slowly:

* κ₄ = 90, 65, 36, 28, 21, 15.9, 13.6, 11.4, 9.1, 8.2 for n = 1…10, roughly 85/n;
* the minimal κ₄ in n variables is 27, 18.05, 13.5, 9.26, 8.18, 6.76, 5.4 for n = 2…8 (`kappa4_min.py`), about 45/n.

If the maximisers keep approaching the Gaussian at this rate, the local result E|F| = c(1 − κ₄/24) + O(κ₄^{5/4})
predicts 1 − s_n ≈ 3.5/n once κ₄ ≲ 1 (n ≳ 100). This is a heuristic, since s_n is a supremum over all cubics, not
only near-Gaussian ones. Nothing in n ≤ 10 points to an overshoot.

## 3. Refocus (a): cubics outside the proved classes

For any direction X, write h = a·He₃(X) + (X²−1)L(Y) + XQ(Y) + R(Y). GPT proves class 1 (L = R = 0 in some frame)
and class 3 (h = Σ G_i Q_i(Y), which is conditionally Gaussian, hence a Gaussian mixture). Both classes are closed
and nowhere dense, so the supremum over the uncovered cubics equals the global supremum s_n. The useful question
is therefore whether the global maximiser is covered.

* **The maximisers are not covered.** The minimum over directions of the (L + R) share is 0.073, 0.279, 0.346,
  0.420 and 0.497 for n = 2…6 (**N**). They are not class 3 either. For a single direction X, the share
outside the form X·Q(Y) is at least 0.58 (n = 3, 4, 5). Class 3 needs a direction u with T(u,u,·) = 0, and
min_u ‖T(u,u,·)‖/‖T‖ = 0.31, 0.27, 0.22, 0.19, 0.18, 0.15 for n = 2…7, so no G-block of any size exists.
* **Best values inside the proved classes (N).**

| n | class 1 | class 3 | global maximum |
|---|---|---|---|
| 2 | 0.7806 | 0.6844 | 0.7862 |
| 3 | 0.7848 | 0.7358 | 0.8279 |

* **What the uncovered part adds.** The R(Y) part, a harmonic cubic with a flat angular law, adds 0.04 at n = 3,
  and the gain grows with n.
* **Class 3 approaches 1 only slowly.** The natural class-3 construction is Σ G_i Q_i(Y), with (Q_i) an orthonormal
  basis of H₂(R^m), so that V = r⁴/2 − r² + m/2. It gives 0.780 (n = 5), 0.817 (n = 9), 0.843 (n = 14),
  0.900 (n = 44) and 0.916 (n = 65), far below s₉ ≥ 0.902.

## 4. Large n: Gaussian-bath limits and a law recursion

**Bath families (N; `bath_family.py`, `bath_profile.py`).** Split the coordinates into k visible coordinates x and
hidden blocks, and let every hidden block become Gaussian by the CLT. The limit objects are

  H = P₃(x) + Σ_j P₂ʲ(x) N_j + Σ_i x_i M_i + C·N′.

Each is a limit, in law with convergence of second moments, of genuine cubic chaos elements in growing
dimension: hidden first-chaos factors are exact, and second- and third-chaos factors come from CLT sums on fresh
blocks. Given x, H ~ N(P₃(x), V(x)), so

  E|H| = E_x[√V · g(P₃/√V)],  g(t) = E|t + N|.

This captures large-n directions, namely Gaussian aggregates of many hidden coordinates, that a finite
optimisation cannot reach. It does not cover high-dimensional visible parts.

* **No point exceeds 1.** Multistart optimisation for k = 1, 2, 3 (14 and 38 parameters for k = 2, 3) finds none.
* **The maximum is the pure Gaussian.** For a fixed bath share β, the supremum increases with β: for k = 1 it is
  0.819, 0.859, 0.919, 0.958, 0.984, 0.998 at β = 0, 0.1, 0.3, 0.5, 0.7, 0.9; for k = 2 it is 0.895, 0.935, 0.964, 0.984,
  0.996, 0.9988 at β = 0, 0.2, 0.4, 0.6, 0.8, 0.9; for k = 3 it is 0.926, 0.965, 0.988, 0.999 at β = 0, 0.3, 0.6,
  0.9.
* **The visible cubic is never used.** The optimiser always sets P₃ = 0, leaving a Gaussian mixture. At β = 0 the
  best values are Gaussian mixtures in the (2,1) and (1,2) blocks: 0.8187 (k=1), 0.8949 (k=2), 0.9260 (k=3).
* **Why.** To second order, a small conditional mean P₃ helps only if E[P₃²/√V] > E[P₃²]·(E|H|/‖H‖²)/c, that is,
  only if P₃ lives where the conditional variance is small. No configuration found does this well enough.

**Law recursion (N; `mixture_recursion.py`).** Set W_{k+1} = best mixture of A·He₃(X), B₂(X²−1)N₁, b·X·N₂ and
C·W_k, without a pure bath, starting from W₀ = He₃. Each step is again a limit of cubic chaos. The values are
0.7726 → 0.8417 → 0.8917 → 0.9204 → 0.9384 → 0.9498 → 0.9576 → 0.9632 → 0.9677
(steps 0–8). The increments shrink (0.069, 0.050, 0.029, 0.018, 0.011, 0.008, 0.006, 0.005), so the sequence
approaches 1 from below. The optimiser always discards He₃(X) and (X²−1)N₁ and uses only the product
X·N₂ and the previous law. The empirical law of 10⁶ points has about 0.3 % noise in its ratio. These results support
(R₃) as a statement about all dimensions, with the supremum reached only in the Gaussian limit, but they do not
prove it.

## 5. Doubling: real (task 2) and complex (refocus c)

**Real (N).** Let X′ be an independent copy and gain = E|(X+X′)/√2| − E|X|, with unit variance. I computed it two
ways: exactly, by polar quadrature of the block-diagonal tensor in 2n variables (2n ≤ 6), and by the U-statistic
E|X − X′| = (2/M²)·Σ_k (2k − M − 1)·x_(k) over sorted samples (10 batches of 2·10⁶ points). Results:

* **He₃:** gain −0.01257 ± 0.00006, which reproduces GPT's certified failure (0.6038108 < 0.6164602).
* **Maximisers:** gain +0.0076 (n=2; exact quadrature +0.00759), +0.0079 (n=3), +0.0119 (n=4), +0.0140 (n=5), +0.0145 (n=6).

So real doubling fails only far from the extremisers. It is not a valid monotonicity on all of H₃.

**Complex, ledger 3.20 (N; `r3complex_doubling.py`).** The law of q is circular, so the relative phase of the two
copies can be integrated exactly:

  E_θ|R + R′e^{iθ}| = (2/π)(R + R′)·E(4RR′/(R+R′)²),

where E is the complete elliptic integral of the second kind. Pairs of independent samples then give the gain with
standard error below 10⁻⁴. The Wick monomial z(|z|²−2)/√2 gives +0.01620, which reproduces the coordinator's
+0.0162.

| codex-c7e2 near-extremal q | E\|q\|/‖q‖ | gain after 1 doubling | gain after 2 doublings |
|---|---|---|---|
| n = 2 | 0.74425 | +0.01471 | +0.0314 |
| n = 3 | 0.77412 | +0.01705 | +0.0270 |
| n = 4 | 0.78898 | +0.01859 | +0.0241 |
| n = 6 | 0.81183 | +0.01789 | +0.0192 |
| n = 8 | 0.82218 | +0.01811 | +0.0167 |

An adversarial search minimised the gain over all of H₂,₁(C²) and H₂,₁(C³) (Nelder–Mead with common random
numbers, then validation on 4× more fresh samples). The smallest gains found are **+0.0065 in C²** (7
starts, at E|q|/‖q‖ ≈ 0.727; validated +0.0067) and **+0.0112 in C³** (6 starts; validated +0.0123 for the
local run). Complex 3.20 therefore survives every test. Unlike the real case, its
one-coordinate analogue, the Wick monomial, gains.

## 6. Refocus (b): GPT's smoothing sign condition (5)

Condition (5) reads D(s) := E[Γ φ_s(X)]/E[φ_s(X)] − 1 ≤ 0 for every s > 0, with Γ = |∇X|²/3. Three facts fix
the natural scale:

* as s → ∞, D(s) ~ −κ₄/(6s) (**P**, moment expansion using E[ΓX²] = E X⁴/3);
* near the Gaussian, D(s) ≈ −κ₄/(6(1+s)) for all s (formal Edgeworth to first order; checked numerically);
* as s → 0, D(s) → τ(0) − 1, with τ(0) = E[Γ | X = 0].

I therefore report (1+s)·D(s). It was computed by polar quadrature (radial Gauss–Legendre panels, 4000 nodes)
and checked against exact one-dimensional quadrature for He₃ (agreement to 10⁻⁸).

* **He₃:** D(s) < 0 everywhere. (1+s)D(s) is largest at s → 0, where it equals τ(0) − 1 = −0.2264.
* **Maximisers n = 2…6:** max_s (1+s)D(s) = −0.298, −0.261, −0.257, −0.255, −0.237, always at the smallest s. The
  profile then falls monotonically to −κ₄/6. Equivalently, E|X + √s G|/√(1+s) increases strictly from E|X| to c
  for every maximiser (`mnorm` in the logs). For n = 6, 7, 8 (quasi-random directions for n ≥ 7) the maxima are
  −0.237, −0.232 and −0.219, again at the smallest s, with the same shape.
* **Search for violations.** For n = 2: 300 random cubics plus 5 local maximisations of max_s (1+s)D(s) over
  s ∈ [0.003, 100] ∪ {∞}. The worst value is −0.2299, and every local search converges to He₃. For n = 3: 200 random cubics (worst
  −0.2385), followed by a local maximisation from the worst one. It also drifts to a He₃-like degenerate tensor,
  where the fine rule gives −0.2302. The coarse training rule reported −0.192 there, a quadrature artefact at the
  degenerate tensor.
* **Margin.** Every cubic tested satisfies (5), and the binding end is s → 0, that is τ(0) ≤ 1, or
  E|X| ≤ 2p_X(0). In low dimension the margin is about 0.23. It shrinks only like κ₄/6 near the Gaussian, where
  the sign is guaranteed by κ₄ > 0.
* **Caveat.** The polar zero-set rule (τ(0) at exactly s = 0) is unreliable for degenerate tensors that depend on
  fewer variables, so the search used s ≥ 0.003.

Condition (5) thus looks broadly true and is a plausible target. It concerns the law of X only: by Stein,
E[Γ φ_s(X)] = E[X Φ_s(X)] with Φ_s(x) = ∫₀ˣ φ_s, so (5) reads E[X Φ_s(X)] ≤ E[φ_s(X)] for all s.

* **Fourier form (P).** Let ψ be the characteristic function of X and k(u) = e^{u²/2}ψ(u). Fourier inversion gives
  E[φ_s(X)] = (2π)⁻¹∫ψ(u)e^{−su²/2}du and E[XΦ_s(X)] = (2π)⁻¹∫(−ψ′(u)/u)e^{−su²/2}du. Since
  −ψ′/u − ψ = −e^{−u²/2}k′/u, condition (5) is equivalent to

    ∫₀^∞ e^{−λu²/2}·k′(u)/u du ≥ 0  for all λ = 1 + s > 1.

* **Gaussian mixtures (P).** The condition holds whenever k is nondecreasing on (0, ∞). For a Gaussian mixture
  √V·G with E V = 1, K(t) = E e^{(1−V)t} is convex with K′(0) = 0, so k(u) = K(u²/2) is nondecreasing. Class 3
  therefore satisfies (5).
* **Stein-kernel form.** Through the Nourdin–Viens density formula p(x) = (E|X|/(2τ(x)))·exp(−∫₀ˣ y/τ(y) dy),
  with τ the one-dimensional Stein kernel,

    E|X| = [∫₀^∞ τ(x)⁻¹ exp(−∫₀ˣ y/τ(y) dy) dx]⁻¹.

  So (R₃) is a statement about Stein kernels of chaos elements, constrained by E τ(X) = 1. The identity in the
  brief is the case x = 0 of this formula (Nourdin–Viens, Electron. J. Probab. 14, 2009).

## 7. Task 4: the Malliavin identity, and other routes

**Identity (P).** For X ∈ H_d with unit variance, −LX = dX, and integration by parts gives

  E|X| = (2/d)·E[|DX|² δ₀(X)] = 2·p_X(0)·τ(0),  τ(0) = E[Γ | X = 0],  Γ = |DX|²/d.

The middle expression is the co-area integral (2/d)∫_{X=0}|∇X| dγ. The second equality needs a continuous
density at 0; otherwise read it as the limit s → 0 of m(s) = 2E[(Γ+s)φ_s(X)] (GPT (3)). Numerically, the aligned
zero-set quadrature reproduces E|X| to 10⁻⁷ at n = 2 (**N**).

**The near-extremisers in these terms (N).** For a Gaussian, p_X(0)/φ(0) = 1 and τ(0) = 1. The aligned zero-set rule
is accurate to about 10⁻⁶ for n = 2, 0.3 % for n = 3, 4 and about 1 % for n = 5, 6.

| | p_X(0)/φ(0) | τ(0) = E[Γ \| X=0] | E\|X\|/c |
|---|---|---|---|
| He₃ (exact) | 0.99868 | 0.77364 | 0.77262 |
| n=2 maximiser | 1.1129 | 0.7064 | 0.7862 |
| n=3 maximiser | 1.1128 | 0.7440 | 0.8279 |
| n=4 maximiser | 1.1306 | 0.7450 | 0.8423 |
| n=5 maximiser | 1.150 | 0.747 | 0.8589 |
| n=6 maximiser | 1.133 | 0.772 | 0.8755 |

The near-extremisers are more peaked at 0 than the Gaussian, by 11–15 %, and their gradient on the zero set is
23–30 % below average. The two effects nearly cancel. He₃ has an almost Gaussian density at 0, and its deficit
comes entirely from τ(0).

**Assessment.** Because the identity is exact, it only rewrites (R₃) as p_X(0)·τ(0) ≤ φ(0). Neither factor obeys
a one-sided bound that would do the job: p_X(0) is above φ(0) for the maximisers, and τ(0) has no useful upper
bound by itself. GPT shows τ_X(x) is not monotone; it tends to 0 at critical values. A proof must couple the two
factors, which is what condition (5) does: s → 0 gives τ(0) ≤ 1, and larger s couples the density near 0 with Γ.

**Other routes, ranked.**

1. **Smoothing monotonicity (5).** It is numerically robust, with margin about 0.25 in low dimension, and it is
   a statement about the one-dimensional law of X only. It is the best target I see.
2. **Gaussian-mixture comparison through a visible/bath split (§4).** Conditional on a few visible coordinates the
   rest is nearly Gaussian, and the bath functional E[√V g(P₃/√V)] is numerically maximised by Gaussian mixtures.
   A rigorous version needs quantitative CLTs for the hidden blocks, which are lossy.
3. **Doubling.** False for real cubics (He₃). It holds on the extremal regions, but it cannot be used globally.
4. **Weighted Cauchy–Schwarz with a linear weight (GPT's reflection proof).** This needs h to vanish on a
   hyperplane, and the maximisers' harmonic R(Y) part prevents that. With weights depending on (|Z|², |Y|²), as in
   codex-c7e2's 7-coordinate certificate, the remote harmonic block contributes E w·E[1/w] ≥ 1 as m → ∞. So that
   method cannot become dimension-free (§9).

## 8. Task 3: literature (web search, 16 November 2026)

* **Heilman–Jones–Malavolta, arXiv:2610.10477, Example 3.1** (read from the arXiv HTML). Verbatim: "It can be shown
  that f,g in [Eq. 3.1] are asymptotic optimizers of OPT(Q). Calculating their value shows
  SDP(Π_d)/OPT(Π_d) = π/2 − o_n(1)", with f = g = sign(n^{−1/2}Σ He_d(X_i)). There is no proof and no citation.
  OPT(Π_d) = sup_f‖Π_d f‖² = (sup E|F|/‖F‖₂)², so the claim is exactly (R_d). By duality, (R_d) says
  sup_{|f|≤1}‖Π_d f‖₂ ≤ √(2/π): a "Gaussian level-d inequality". I found no source for it when d ≥ 2.
* **Not found:** any theorem that the Gaussian maximises E|F| at fixed variance within a Wiener chaos of order
  d ≥ 2, or a sharp L¹–L² Khinchin–Kahane constant for Gaussian chaos. My searches used the keywords listed in the
  brief, plus "L∞→L² norm of the chaos projection" and "level-k inequality, Gaussian".
* **Related work, none of which proves (R₃):**
  * Nualart–Peccati 2005: the fourth moment theorem; κ₄ > 0 on chaos of order ≥ 2.
  * Nourdin–Peccati: Var(Γ) ≤ ((q−1)/(3q))κ₄, which gives d_W(F, N) ≤ 0.376√κ₄ for q = 3. This is a two-sided
    bound, not a sign.
  * Mansanarez–Poly–Swan, arXiv:2510.14002: Edgeworth expansions on Wiener chaos. This is GPT's local result,
    with no explicit constants.
  * Ebina–Nourdin–Peccati, arXiv:2511.21496: optimal local CLT on chaos (density convergence; relevant to
    p_X(0) only asymptotically).
  * Latała, Ann. Probab. 2006: moments of Gaussian chaoses up to constants depending on d.
  * Eskenazis–Nayar–Tkocz 2018: sharp comparisons for Gaussian mixtures. They cover class 3, where the bound is
    trivial.
  * Pang, arXiv:2609.05914: a Gamma envelope for Gaussian quadratic forms. It works for p ≥ 4, where the rank-one
    form is extremal, which is the opposite regime from p = 1.
* **Conclusion:** (R₃) is open in the literature as far as I can tell; the d = 2 case is the lab's own result (D1).

## 9. A route to the weak complex bound ρ* ≤ 0.916 on H₂,₁ (analysis; no new computation)

**(i) Reduction to a real bound with 3.36 % slack (P).** For q ∈ H₂,₁(Cⁿ) and a uniform phase φ,
Re(e^{iφ}q) ∈ H₃(R^{2n}) and E[Re(e^{iφ}q)²] = E|q|²/2 (since E q² = 0). Also E_φ|cos φ| = 2/π. Hence:

* any dimension-free real bound E|h| ≤ c(1+ε)‖h‖₂ on H₃ gives ρ* ≤ (√π/2)(1+ε);
* the target 0.916 needs only ε ≤ 0.0336.

**(ii) Explicit near-Gaussian bound (P, modulo Nourdin–Peccati's variance lemma).** GPT's identity (1),
E|X| − c = c·E[(Γ−1)w(|X|)] with 0 < w ≤ 1, gives

  E|X| ≤ c(1 + E(Γ−1)₊) ≤ c(1 + ½√Var Γ) ≤ c(1 + 0.2357√κ₄).

This covers ε ≤ 0.0336 only when κ₄ ≤ 0.020. For circular q, κ₄(Re q) = (3/2)(m − 2), so the condition is
m ≤ 2.0135. That is weaker than the Lean law inputs, which reach m ≈ 2.45.

**(iii) The kurtosis dichotomy fails quantitatively (P plus example).** For a unit-variance real cubic,
‖f⊗₁f‖ = ‖f⊗₂f‖ and symmetrisation is a contraction, so

  κ₄ = 1944‖f⊗̃₁f‖² + 1296‖f⊗₂f‖² ≤ 3240‖M‖²_F ≤ 540·λ_max(M),  M = f⊗₂f,  tr M = 1/6.

Equality holds for He₃-sums N^{−1/2}ΣHe₃(x_i)/√6, which have κ₄ = 90/N and every coordinate weight equal to 1/N.
Numerical sanity check: 300 random tensors with n ≤ 6 give κ₄/(540λ_max) ≤ 0.9995, and the identity
‖f⊗₁f‖ = ‖f⊗₂f‖ holds to 10⁻¹². Consequences:

* large κ₄ forces only one direction of weight 6λ_max ≥ κ₄/90, about 1 % at κ₄ = 1;
* kurtosis between about 0.02 and 1 (complex m from about 2.01 to 2.7) is filled with spread CLT-type chaos, for
  instance He₃-sums or Wick-monomial sums with N ≈ 10²: no influential coordinate, and out of reach of both the
  7-coordinate certificates and the explicit near-Gaussian bounds;
* the complex Wick-monomial sums behave the same way: excess (m−2) ≈ 42/N.

So "large kurtosis ⇒ few coordinates" cannot close the gap.

**(iv) Why the existing law inputs fail at moderate m, and what replaces them.** Kurtosis alone cannot separate
two cases:

* a Gaussian bulk with a small heavy cubic admixture, √(1−β)G + √β·q₀: moderate kurtosis, ratio below √π/2 but
  close to it;
* a law with a flat bulk and heavy tails, whose ratio could exceed √π/2 for laws in general.

Within chaos, the first case is exactly GPT's smoothing path (X + √s G)/√(1+s). That suggests the most promising
route:

* **Approximate smoothing monotonicity suffices (P).** From GPT (4), with A(s) = E φ_s(X) ≤ (2πs)^{−1/2},

    E|X| = c + ∫₀^∞ D(s)·A(s)·(1+s)^{−3/2} ds ≤ c + sup_s D(s)₊ · c,

  because ∫₀^∞ (2πs)^{−1/2}(1+s)^{−3/2} ds = 2/√(2π) = c. Hence **D(s) ≤ 0.0336 for all s and all real cubic
  chaos ⇒ ρ* ≤ 0.916**. By (i) this works in every dimension, through phase averaging. The weaker averaged
  condition ∫ D₊ A (1+s)^{−3/2} ds ≤ 0.0268 also suffices.
* **Evidence (N, §6).** The true supremum of D is negative, about −0.23 in low dimension, and tends to 0⁻ like
  −κ₄/(6(1+s)) near the Gaussian. A defect of 0.034 therefore leaves a wide margin, and crude estimates may be
  enough.
* **Complex analogue, tested directly (N; `complex_smoothing.py`).** By circularity and the Rice mean formula,
  s ↦ E|q + √s Z|/√(1+s) can be computed from samples of |q|. On the codex near-extremal cubics (n = 2, 3, 4, 6, 8)
  it increases monotonically from E|q|/‖q‖ (0.838, 0.873, 0.891, 0.915, 0.928 in units of √π/2) to 1, on 25 values
  of s in [10⁻³, 10³]. The complex smoothing route is therefore numerically sound as well.
* **A possible proof outline.**
  * For s ≥ s₀: expand D(s) = −κ₄/(6s) + O(E X⁶/s²), using hypercontractive moment bounds.
  * For s ≤ s₀: bound E[XΦ_s(X)] ≤ ½E|X| from above, and bound the smoothed density at zero p_{W_s}(0) from
    below. Anti-concentration (Carbery–Wright) on the zero set, together with the identity
    p_{W_s}(0) = E φ_s(X), is the natural input.
  * The binding end is s → 0, that is E|X| ≤ 2(1+ε)p_X(0). Symmetric unimodality is not enough there (the uniform
    law violates it), so chaos structure must be used.

**(v) A hybrid alternative.** Use the 7-coordinate certificates with a Gaussian buffer for the k ≤ 7 most influential
coordinates. Treat the rest as conditionally Gaussian (the bath functional of §4, which numerically never beats the
Gaussian), with a quantitative invariance error. The error needs every hidden influence below τ with an O(τ^{1/4})
or O(√κ) loss, and that is likely too costly for a 0.03 margin. I rank it second.

## 10. Files (all in `handoff/research-degree5/claude-research-2026-11-15/r3-chaos/`)

**Core evaluation**
* `r3lib.py`: polar evaluator with exact radial integral and analytic gradient; sphere product rules; Monte
  Carlo and RQMC checks; class diagnostics.

**Optimisation**
* `r3opt.py`, `r3opt_fast.py`, `r3opt_qmc.py`, `r3quick_highn.py`, `r3refine.py`: multistart, refinement, and
  RQMC validation.
* `maximisers/best_n{1..6}.json`, `maximisers/refined_n{6..10}.json`: maximisers in orthonormal coordinates
  c_α = √(6·mult_α)·T_α, with α = (i ≤ j ≤ k) in lexicographic order.

**Analysis**
* `r3analyse.py`: values, κ₄, Malliavin split, (5) profile, doubling, and GPT shares.
* `r3stein.py`: zero-set integrals (with an aligned rule), smoothing profile, exact κ₄, and the exact He₃ profile.
* `r3cond5.py`: search for violations of (5).
* `kappa4_min.py`: minimal κ₄ per dimension by the exact contraction formula. Results: 27, 18.05, 13.5, 9.26,
  8.18, 6.76, 5.4 for n = 2…8; n·κ₄,min is roughly 43–54.
* `proved_classes.py`: best values inside classes 1 and 3.
* `cond5_highn.py`: the (5) profile with quasi-random directions, for n ≥ 7.
* `tau0_random.py`: τ(0) on random cubics.
* `complex_smoothing.py`: the complex smoothing monotonicity check.

**Doubling**
* `r3real_doubling.py`: real doubling, by exact quadrature in 2n variables and by the Gini U-statistic.
* `r3complex_doubling.py`, `complex_doubling_search.py`: complex doubling with exact phase integration, and the
  adversarial search.

**Large-n limits**
* `bath_family.py`, `bath_profile.py`: Gaussian-bath limit families.
* `mixture_recursion.py`: the law recursion.

**Raw outputs**
* `logs/`: all run logs (`local_*` for laptop runs).
* `big_runs/`: the JSON outputs of the droplet runs.

Heavy runs used `ssh big` (at most 12 processes, each in its own process group). The folder `/root/claude-b9ee-r3`
was deleted at the end with `find -delete`.
