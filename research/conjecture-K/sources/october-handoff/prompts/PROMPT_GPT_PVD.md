<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_PVD.md (file dated 2026-10-21). Only this line was added. -->
# An L¹/L² inequality for complex Wiener chaos of bidegree (2,1)

## Setting
Let X₁, …, X_n be independent standard proper complex Gaussians: E X_j = 0, E|X_j|² = 1, E X_j² = 0.

H_{2,1}(ℂⁿ) is the space of Wick-ordered polynomials of bidegree (2,1):

  q = Σ_{i,j,k} T_{ij,k} :X_i X_j X̄_k:,  T_{ij,k} = T_{ji,k} ∈ ℂ,

where :X_i X_j X̄_k: = X_i X_j X̄_k − δ_{ik} X_j − δ_{jk} X_i. Equivalently, H_{2,1} is the bidegree-(2,1) component of the complex
Wiener–Itô chaos decomposition: the polynomials of the form Σ T_{ij,k} X_iX_jX̄_k + (linear terms) that are orthogonal to every
polynomial of total degree ≤ 2. Every q ∈ H_{2,1} has mean zero, its law is invariant under q ↦ e^{iθ}q (because rotating all X_j by
e^{iθ} multiplies q by e^{iθ}), and E|q|² = 2 Σ_{i,j,k} |T_{ij,k}|².

## Problem
Find the best constant

  ρ* = sup { E|q| / (E|q|²)^{1/2} : n ≥ 1, q ∈ H_{2,1}(ℂⁿ), q ≠ 0 }.

**Main target:** prove ρ* ≤ 0.9711 (any rigorous constant below 0.9711 is a success).
**Ideal target:** prove ρ* = √π/2 = 0.886227…, i.e. E|q| ≤ (√π/2)·‖q‖₂ for every q ∈ H_{2,1}, in every dimension.

The value √π/2 is E|N| for a standard complex Gaussian N. It is approached by diffuse sums
n^{−1/2} Σ_j H(X_j) (central limit theorem), so ρ* ≥ √π/2. The conjecture is that the Gaussian maximises the L¹/L² ratio on this
chaos.

## Reference values (normalised so that ‖q‖₂ = 1)
- H(X) = X(|X|² − 2)/√2: E|H| = 0.69082.
- X₁(|X₂|² − 1): 0.65205.
- X₁X₂X̄₃: (√π/2)³ = 0.69604.
- X₁²X̄₂/√2: 0.62666.
- Diffuse limit: 0.88623.

## Known facts you may use (all true)
1. E|q|⁴ ≥ 2(E|q|²)² for q ∈ H_{2,1}, with equality only in the diffuse limit. Write x² := E|q|⁴/(E|q|²)² − 2 ≥ 0. Over all n one has
   x² ≤ 42, and the single Wick monomial H attains 42.
2. A sixth-moment bound E|q|⁶ ≤ (6 + 9x² + C₆x³)(E|q|²)³ holds with C₆ ≈ 40.45. In this cubic form it is essentially sharp: it is the
   sixth-moment curve of the mixtures √θ H(X) + √(1−θ) N.
3. If q is a complex Gaussian scale mixture (q = √V·N with N independent of V ≥ 0), then E|q| = (√π/2) E√V ≤ (√π/2)‖q‖₂ by Jensen.
   Products such as X₁(|X₂|² − 1) are of this kind (conditionally Gaussian given X₂). The single Wick monomial H(X) is **not**.
4. Hypercontractivity: ‖q‖_r ≤ (r − 1)^{3/2}‖q‖₂ for r ≥ 2 (real form of the third chaos).

## Routes known to FAIL (do not use them as the main argument)
- **Moments only.** Maximising E|q| subject to E|q|² = 1, E|q|⁴ = 2 + x² and the sixth-moment bound of fact 2, over all laws on
  [0, ∞), gives at best 0.97361 (worst x ≈ 1.37). The extremal law, "nearly constant modulus plus a rare spike", is not realisable
  by a chaos, but no inequality using only these three moments can go below 0.9736. Higher-moment versions of the same idea
  converge only slowly.
- **Laplace-transform domination.** E e^{−λ|q|²} ≥ 1/(1+λ) for all λ ≥ 0 would imply the ideal target, but it is **false**: a random
  two-coordinate cubic violates it for λ ≳ 100. The comparison must be integrated over λ, using
  E|q| = (1/(2√π)) ∫₀^∞ (1 − E e^{−λ|q|²}) λ^{−3/2} dλ.
- Heat-kernel domination and characteristic-function domination also fail. Any proof must couple several scales.
- **Monotonicity along the CLT.** It is plausible for this functional, but unproved and false for related functionals.

## Possibly useful directions (not required)
- A **Stein-kernel / Malliavin** argument. For F in a fixed chaos, Γ = ⟨DF, −DL⁻¹F⟩ = |DF|²/(chaos degree). A known sufficient condition
  for the ideal target is the "bump inequality" E[(Γ − σ²) e^{−sX²}] ≤ 0 for all s ≥ 0 on the real third chaos (σ² = Var). It was
  verified numerically for n ≤ 4, with margin −0.014.
- Anti-concentration (Carbery–Wright), combined with the moment constraints above, to rule out the "nearly constant modulus" laws
  that defeat the moment method. Only a constant below 0.9711 is needed for the main target.
- Interpolation q_s = cos(s)·q + sin(s)·q′ with an independent copy q′, or the Ornstein–Uhlenbeck semigroup, with the integrated
  Laplace representation above.

## What to deliver
- A complete rigorous proof of E|q| ≤ ρ‖q‖₂ for every n and every q ∈ H_{2,1}(ℂⁿ), with an explicit ρ < 0.9711 (or ρ = √π/2).
- Clearly mark every step as proved, or as numerically verified with a reproducible exact or interval-arithmetic script.
  Dimension-free statements may not rest on finite samples.
- If you only obtain partial results (special classes, a constant between 0.9711 and 0.9736, or a reduction to a single lemma), state
  precisely what is proved and what remains.
