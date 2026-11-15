<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_LARGE_A_SMALL_BUFFER.md (file dated 2026-10-21). Only this line was added. -->
# Large shared A-couplings with a small fresh buffer: a two-driver Gaussian-domination inequality

## Setting
Fix the constants
  a = 699/1250,  b = 179/1250,  p = 2500/1891.

Let Z, X₁, X₂, U be independent standard proper complex Gaussians (E W = 0, E|W|² = 1, E W² = 0). Put T = |Z|² and

  L = Z(a + bT),  H(X) = X(|X|² − 2)/√2  (the Wick cubic, E|H|² = 1).

**The family 𝓕₂.** For c₁, c₂ ≥ 0, complex α₁, α₂, β₁, β₂, and g ≥ 0, let

  G = Σ_{j=1,2} [ c_j H(X_j) + α_j (T − 1) X_j + β_j Z² X̄_j/√2 ] + gU.

Terminology:
- **The two drivers** are the coordinates X₁ and X₂. Each carries a cubic c_jH(X_j).
- **Shared couplings.** The same coordinate X_j also appears in the "A-coupling" α_j(T−1)X_j and the "B-coupling" β_jZ²X̄_j/√2. So
  the couplings share their randomness with the cubics; they are not independent of them.
- **The fresh buffer** is gU, where U is a standard complex Gaussian independent of everything else, and g ≥ 0 is its size.
  "Small buffer" means small g.

**The functional and the benchmark.**
  Λ(G) = E|L + G| + E|L − G| − p E|G|²,  S = sup_{v≥0} { 2E|L + √v U| − p v }.

Numerically S = 1.3739535…, attained at v* ≈ 0.0403. The benchmark is the case where G is a pure Gaussian buffer √v·U.

**A useful exact reduction.** G(−X) = −G(X) for the non-buffer part, so with ρ_g(u) := E|√u + gU| (the Rice mean),

  Λ(G) = 2E ρ_g(|L + Q|²) − p(c₁² + c₂² + |α|² + |β|² + g²),

where Q is G without gU, |α|² = |α₁|² + |α₂|², |β|² = |β₁|² + |β₂|², and
ρ_g(u) = g(√π/2)·e^{−x/2}[(1+x)I₀(x/2) + xI₁(x/2)], x = u/g². ρ_g is concave in u, and ρ₀(u) = √u.

## Problem
**Main target:** prove
  Λ(G) ≤ S + 9·10⁻⁵
for every G ∈ 𝓕₂ in the **open region**

  0 ≤ g < 41/250 (= 0.164),  max(c₁, c₂) < ĉ(g),  |α|² + |β|² < 4/25,  c₁² + c₂² + |α|² + |β|² + g² < 13/20,
  and 152c_k² + 66|α_k|² > 52|β_k|² for k = 1, 2,

where ĉ(g) = 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1 on the g-intervals [0.1, 0.105], [0.105, 0.12], [0.12, 0.135], [0.135, 0.145],
[0.145, 0.155], [0.155, 0.16], [0.16, 0.164], and ĉ(g) = ∞ (no restriction) for g < 0.1.

**Ideal target:** Λ(G) ≤ S on the whole open region. Equality is expected only at the benchmark.
Partial results (an explicit large sub-region, e.g. all g ≥ 0.12, or all |α|² ≤ 0.03) are welcome.

## Already proved (you may use these; do not re-prove)
1. **g ≥ 41/250:** Λ(G) ≤ S for every G ∈ 𝓕₂.
2. **One large cubic:** for 0.1 ≤ g < 41/250 and max(c₁, c₂) ≥ ĉ(g), Λ(G) < S − 4·10⁻⁵. Exact K holds at every buffer once max c ≥ 0.315.
3. **One driver** (c₂ = α₂ = β₂ = 0): Λ(G) ≤ S for every c₁, g, α₁, β₁.
4. **No A** (α₁ = α₂ = 0): Λ(G) ≤ S + 75·10⁻⁶ at every amplitude and buffer.
5. **Energy exclusions:** if |α|² + |β|² ≥ 4/25, or the total variance V = E|G|² ≥ 13/20, then Λ(G) < S − 1/5000. If 152c_k² + 66|α_k|² ≤ 52|β_k|²
   for some k, a separate block theorem applies.
6. **The remote part alone** (α = β = 0): Λ ≤ S + 10⁻⁵.
7. ρ_g is concave in u. The visible variable L is a complex Gaussian scale mixture: L has the same law as √V·W with W standard complex
   Gaussian independent of V ≥ 0. Hence v ↦ 2E|L + √v U| − pv is strictly concave.

## Why the existing method stops (the obstruction)
The proofs of facts 1 and 2 use the **pointwise tangent** of the concave ρ_g. Writing |L + Q|² around an anchor and bounding ρ_g by its tangent
line, at each point of the visible and driver variables, gives a quadratic majorant in (α, β). At c = 0 its A-diagonal coefficient is

  M_AA(0, g) = E[K_g(ℓ²)(T − 1)²] − p,  K_g = 2ρ_g′,  ℓ = √T(a + bT).

| g | 0.10 | 0.12 | 0.14 | 0.15 | 0.16 | 0.164 | 0.17 | 0.20 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| M_AA(0, g) | +0.212 | +0.139 | +0.073 | +0.042 | +0.012 | +0.0002 | −0.017 | −0.095 |
| S − F(g²) | 1.1e−3 | 8.2e−4 | 5.2e−4 | 3.8e−4 | 2.6e−4 | 2.1e−4 | 1.5e−4 | 1.3e−7 |

Here F(v) = 2E|L + √v U| − pv. M_AA changes sign at g ≈ 0.16407. Below it the majorant is **convex** in α, so it is unbounded in the
A-direction. Yet the **true** second variation of Λ in A is negative. The pointwise tangent discards the radial part of the Hessian
(ρ_g″ < 0), roughly a factor 2 where ℓ ≳ g.

The one-driver case (fact 3) was overcome by covering α with boxes and using **complex A anchors**, on which the positive curvature is
paid by the margin. Floating-point margins are ≥ 10⁻³ at g = 0.1 and ≥ 1.9·10⁻⁴ at g = 0.164. With two drivers and anchors
α₁⁰, α₂⁰ ≠ 0, the driver laws depend on the visible radius, and the one-dimensional table factorisation of the earlier proof breaks.

## Numerical sanity checks (one driver, float)
- c = 0.15, α = 0, g = 0.1: Λ − S = −0.00441.
- c = 0.15, α = 0.15, g = 0.1: Λ − S = −0.01097.
- c = 0.15, α = 0.25, g = 0.1: Λ − S = −0.02970.
- c = 0, α = 0.25, g = 0.1: Λ − S = −0.02988.
- c = 0.1, α = 0.2, g = 0.05: Λ − S = −0.01739.

All floating scans of 𝓕₂ (Nelder–Mead and grids over c₁, c₂, complex α, β and g) stayed below S. No counterexample is known.

## Routes known to fail
- The pointwise-tangent (cell-tangent) majorant alone below g ≈ 0.164, as explained above.
- Restricting the A/B energy to 4/25 and paying (4/25)·M_AA: this exceeds the margin S − F(g²) as soon as M_AA ≳ 1.6·10⁻³, i.e. for g ≲ 0.1637.
- Splitting "A-content ≤ f(kurtosis)" against "slack ≥ g(kurtosis)" through fourth moments: the content is third order and the slack second order.
- Jensen on |L + Q|² (the norm is not concave in the needed direction), and fixed-|Z| (fibrewise) Gaussian domination, which is false.

## Possibly useful ideas (not required)
- Keep the radial second-order term: use a **second-order** (curvature-retaining) majorant of ρ_g instead of its tangent, or average over
  the visible phase first. After factoring the phase of Z, the A-coupling has the same phase as the cubic part, and the B-coupling the
  opposite one.
- Complex A anchors with box covers in (α₁, α₂), with two-variable driver tables E[H(X)·J_n(k|cH(X) + α(T−1)X|)] in (k, α(T−1)/c).
- Exploit that the buffer smooths: the A-curvature of the exact Λ is negative for every g ≥ 0, so a proof via the exact Hessian along
  segments may work.

## What to deliver
A rigorous proof (or a large explicit sub-region), dimension-free in the sense that only X₁, X₂, Z, U appear. Mark every step as proved or as
verified by a reproducible exact or interval-arithmetic script. Floating-point evidence alone is not a proof.
