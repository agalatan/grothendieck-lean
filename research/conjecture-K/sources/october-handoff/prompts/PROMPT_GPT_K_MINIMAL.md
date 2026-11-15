<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_K_MINIMAL.md (file dated 2026-10-22). Only this line was added. -->
# Problem

Let z = (z₁, …, zₙ) be a standard complex Gaussian vector (independent coordinates, E zᵢ = 0, E|zᵢ|² = 1, E zᵢ² = 0), n ≥ 1 arbitrary.

Let H₂,₁(ℂⁿ) be the complex linear span of the polynomials

  zᵢ zⱼ z̄ₖ − δᵢₖ zⱼ − δⱼₖ zᵢ   (1 ≤ i, j, k ≤ n),

the Wick (Hermite) chaos of bidegree (2,1).

Fix ε = 1891/2500, ℓ = 1057/1250, β = 179/1250, and put

  L = z₁ (ℓ + β(|z₁|² − 2)).

For G ∈ H₂,₁(ℂⁿ) define

  Λ(G) = E|L + G| + E|L − G| − E|G|² / ε.

Let U be a standard complex Gaussian independent of z, and

  S = sup_{v ≥ 0} { 2 E|L + √v U| − v/ε }   (S = 1.37395…).

**Conjecture.** For every n and every G ∈ H₂,₁(ℂⁿ),

  Λ(G) ≤ S.

Prove it, or disprove it. A proof of the weaker statement Λ(G) ≤ S + 1.3·10⁻⁴ for all n and G is also of interest.

Deliver a complete written proof (or an explicit counterexample with a verifiable computation). Every inequality must be proved or checked in exact/interval arithmetic; numerical searches alone do not count.

# References (for the setting only)

- S. Heilman, C. Jones, G. Malavolta, *Sharper bounds for the complex Grothendieck constant*, arXiv:2609.25462 — complex Hermite chaos, the projections P_{p,q}, and the operator P_{1,0} − εP_{2,1} from which this problem arises.
- G. Pisier, *Grothendieck's theorem, past and present*, Bull. AMS 49 (2012), arXiv:1101.4195, §4 — the complex Grothendieck constant.
- U. Haagerup, *A new upper bound for the complex Grothendieck constant*, Israel J. Math. 60 (1987) — the Gaussian phase rounding and the value γ† = ∫₀^{π/2} cos²t (1+sin²t)^{-1/2} dt.
