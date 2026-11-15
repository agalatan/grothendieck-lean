<!-- Original: research/conjecture-K/MONOGRAPH.md §2.11 at 5b7495a815413018dcf0d3c9bb7a8241ad21e46b, 2026-11-15. Read status through STATUS.md 2.12c. -->
### 2.11 Charging response feasibility to the discarded squares

[P, author only · codex-9b17 · task #432 · ledger 2.12c]. This is an unconditional
inequality for actual responses, not a proof of K or a new numerical endpoint.
It uses the same weighted-Hilbert-space method as 2.10, retaining additional
features. No priority over the manuscript's general weighted-Gram machinery is
asserted. Independent review and a Lean consumer remain pending.

Write H = Z(T−2)/√2, R² = π/4, G = εP₂,₁k, and use the six energies of 2.10.
Let the two discarded squares be

    Σ = ‖P₁,₀k‖² + ε‖P₂,₁h + (√2β/ε)H‖².

For every λ ≥ 0 define

    a(λ) = 2(λ+2)/(3λ+4),      n(λ) = 8(λ+1)/(7λ+6),
    J_λ = (λ/ε²)[E_q/2 + a(λ)E_A + 4E_B/3 + E_Q + E_P + n(λ)E_ν]
          − λ(π/4−t²)
          + [ελ/(2(3ε+4λ))](t−4β/ε)².

Then **Σ ≥ J_λ**, simultaneously for all λ. Hence Σ ≥ max(0, sup_{λ≥0} J_λ).
The assertion holds in every finite dimension, for arbitrary sharing of the
remote coordinates, all ε > 0, real β, and bounded responses |f|, |g| ≤ 1 with
P₁,₀h = tZ, t ≥ 0. There is no small-energy or Gaussian-domination premise.

**Weighted Gram proof.** Put dμ = |Z|dγ/R. The pair (h,k) has squared norm at
most one in L²(μ)⊕L²(μ), since |h|²+|k|² ≤ 1. All features below are divided
by |Z|; their weighted inner products are computed by
E_μ[conj(U/|Z|) V/|Z|] = E[conj(U)V/|Z|]/R.
They are square integrable: the only negative visible half-moment is E T^(−1/2).

In the h slot retain Z and H. Their feature Gram matrix is

    [[1, −1/(2√2)], [−1/(2√2), 7/8]].

In the k slot retain Z, H, all remote first-chaos basis vectors W_i, the
corresponding A features (T−1)W_i, and orthonormal bases for the other four
cubic sectors. Each (W_i,(T−1)W_i) feature pair has Gram

    [[2, −1], [−1, 3/2]].

The remaining sector Gram factors are 2, 3/4, 1, 1 for q, B, Q, P.
Cross-block inner products vanish by visible angular frequency, remote
chaos orthogonality, and EQ=0. These facts do not require independent
remote coefficient fields. For example, E[(T−1)/√T]/R = −1 and
E[√T(T−2)]/(√2 R) = −1/(2√2). Both 2×2 matrices are positive definite,
with determinants 3/4 and 2 respectively.

Put c = ⟨H,h⟩, α = ⟨Z,k⟩, let p be the vector of remote linear
coefficients of k, let a = r_A/ε, and let v = ν/ε be the visible cubic
coefficient of k (G has visible part νH). Inverting the two Gram blocks
and applying Bessel gives

    t² + (4/3)|c+t/(2√2)|²
      + ‖p‖²/2 + ‖a+p/2‖²
      + |α|² + (4/3)|v+α/(2√2)|²
      + (E_q/2 + 4E_B/3 + E_Q + E_P)/ε² ≤ R².             (G)

The factors R disappear after multiplying Bessel's inequality by R²:
the Gaussian coefficients of every feature pair with (h,k) are divided by R.
Also orthogonality in the original Gaussian L² space gives

    Σ ≥ ‖p‖² + |α|² + ε|c+√2β/ε|².                     (S)

Multiply the left side of (G) minus R² by λ and add it to the right
side of (S). This is still a lower bound for Σ. Minimize independently
in p, α, c. The three completed-square minima are

    inf_p {‖p‖² + λ(‖p‖²/2 + ‖a+p/2‖²)}
        = λ a(λ) ‖a‖²,
    inf_α {|α|² + λ(|α|² + (4/3)|v+α/(2√2)|²)}
        = λ n(λ) |v|²,
    inf_c {ε|c+√2β/ε|² + (4λ/3)|c+t/(2√2)|²}
        = [ελ/(2(3ε+4λ))](t−4β/ε)².

All denominators are positive. Substitution proves Σ ≥ J_λ, including λ=0.
This is a lower bound obtained by minimizing unconstrained auxiliary
coefficients, so no existence or attainability assumption is needed.

**Connection to the row.** Let V = Re⟨f,T_εg⟩ and let Φ be the nonnegative
pointwise support slack integrated over the Gaussian space. The exact identity is

    V = t²−2ℓt+2β²/ε + Λ(G) − Σ − Φ.

It follows, without K, that every actual response satisfies

    V ≤ t²−2ℓt+2β²/ε + Λ(G) − max(0, sup_{λ≥0} J_λ).     (R)

A finite set of nonnegative rational λ already gives a valid consumer cut.
This replaces dropping Σ by an explicit penalty depending only on t and the
six sector energies. **Do not subtract this full penalty from Λ̂**: its
first-chaos square has already been spent. Combine it with the raw Λ row,
or split the available squares explicitly before using another retained dual.
The support slack Φ has not been spent here.

**Strict gain over the displayed energy constraints.** At the peak profile,
set t=1057/1250, E_q=1/25, E_A=3/100, and all other energies to zero.
This tuple satisfies the six-sector ellipsoid strictly, the remote cap
0.046266 and the total cap 0.070564. Nevertheless, J_1 > 9/1000.
Thus any actual response with those energies must pay more than 0.009
in the discarded squares. This is a comparison of relaxations, not an
assertion that the tuple is realizable or that the global endpoint gains 0.009.

The standard-library replay
`python3 -I research/conjecture-K/code/response-penalty-codex-9b17/check.py`
checks these strict comparisons using exact fractions and outward Machin
bounds for π. It checks only the scalar consequences; the Gaussian proof
above is author-only, not Lean-checked. A certified full-domain payoff
consumer is still required to improve the current lower endpoint.
