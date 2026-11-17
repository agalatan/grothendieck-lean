<!-- Verbatim from handoff/gemini-plan-audit-codex-a7c4/NOTE.md, 17 November 2026; only this line added. -->
# Audit of the Gemini plan for the content inequality

Agent-ID: codex-a7c4. 17 November 2026. Refs #509; audit task #510.
Baseline: `8914e52afdcab1dc821e69b59781f363e0487702`.

The input is the user's Gemini draft, preserved in `GEMINI_DRAFT.md` beside
this note. It is a proposed programme, not a proof. The computations and
repairs below are by codex-a7c4. The paper arguments are **P** and the
exact/interval calculations are **C**: claude-b9ee and its review worker
re-derived the claims and replayed both certificate scripts, as recorded in
`REVIEW_claude-b9ee.md`. Floating quadrature and searches remain **N**,
including the proposed optimal damping constants.
No Lean theorem or Grothendieck lower bound changes.

## Verdict

The Wick/Stein direction is appropriate, but much of the proposed second
checkpoint is already in the repository. Complete monotonicity, the
fourth-moment identity, and a content resolvent are available with independent
review. The unresolved step is a **signed comparison of content and deficit**,
not the existence of those identities or the signs of the scalar kernels.

The proposed Taylor-coefficient cubic upper envelope cannot prove the weaker
inequality throughout the band: even at a diffuse Gaussian near the maximizing
energy, its expectation overshoots `S + 10^-4`. This is certified below. A
numerically sharper rational envelope could fit the Gaussian budget, but its
sharp global validity and the tensor inequality needed after taking expectations
are both still open. Fitting the Gaussian budget alone is not a proof.

## Conventions

All complex Gaussians are standard, `E|Z|² = 1`. Set

    a = 699/1250, b = 179/1250, ε = 1891/2500, p = 1/ε,
    L = Z(a+b|Z|²), Φ(r) = 2E|L+√r|,
    E[(|Z|²−1)ph(L+y)] = y g(|y|²),
    B(u) = E Φ(u|W|²), Λ_G(u) = B(u)−pu, S = max_{u≥0} Λ_G(u),
    B_G(u) = S−Λ_G(u), D(q) = B(u)−E Φ(|q|²), u = E|q|²,
    δ = E|q|⁴−2u², χ = δ/u².

The target is `C(q)² ≤ (6/25)D(q)` or, more weakly,
`C(q)² ≤ (6/25)(D(q)+B_G(u)+1/10000)` on
`551/100000 ≤ u ≤ 463/10000`. Nonnegativity of `B_G` does not imply
nonnegativity of `D` or of `D+B_G`.

## 1. Requested block: endpoint derivatives

These are derivatives, not Taylor coefficients divided by factorials.
The displayed endpoints are outward rational intervals (**C**).

| quantity | lower endpoint | upper endpoint |
|---|---:|---:|
| Φ(0) | 1.371879280600869405 | 1.371879280600869406 |
| Φ′(0) | 1.431973791291431351 | 1.431973791291431352 |
| Φ″(0) | −1.672596014280266133 | −1.672596014280266132 |
| Φ‴(0) | 7.137421126297024532 | 7.137421126297024533 |
| Φ⁽⁴⁾(0) | −58.745762941372824062 | −58.745762941372824061 |
| g(0) | −0.835135932614129663 | −0.835135932614129662 |
| g′(0) | 2.159180864970276049 | 2.159180864970276050 |
| g″(0) | −11.692061679509533002 | −11.692061679509533001 |
| g‴(0) | 107.008779841537586556 | 107.008779841537586557 |

In particular, the draft's guess that the third derivative might be around
one or two is too small. At the top of the band,

    u³ = 99252847/10^12,
    Φ‴(0)u³ ∈ [0.000708409367022926, 0.000708409367022927].

The latter is the coarse cubic-remainder allowance for a Gaussian, whose
sixth moment is `6u³`; it already exceeds `10^-4`. The more relevant loss
after subtracting the *exact* Gaussian remainder is smaller, but still fails
the proposed budget (section 4).

### Nonsingular derivation and certificate

Put `A(t)=a+bt`, `J(t)=a+3bt`, `H(t)=tA(t)²` and define
`h(H(t))=e^(−t)/(A(t)J(t))`. The plane density of L is `h(|y|²)/π`.
The positive recurrence, already proved in STATUS 2.7a, is

    −∂_s[e^(−t)A^(−m)J^(−n)]
      = e^(−t)A^(−m−1)J^(−n−1)
        + mb e^(−t)A^(−m−2)J^(−n−1)
        + 3nb e^(−t)A^(−m−1)J^(−n−2),  s=H(t).

All coefficients are nonnegative. A Gaussian mixture for h, followed by
radial integration of `Δ(2E|L+y|)=2E|L+y|⁻¹`, gives, for k ≥ 1,

    Φ^(k)(0) = ((1/2)_(k−1)/k!) ∫₀∞ h^(k−1)(r²) dr.       (1)

For example the Gaussian component of precision λ contributes
`(−1)^(k−1)√π λ^(k−1/2) (1/2)_(k−1)/(2k!)` before mixing the
probability measures. This also checks every factorial in (1).
At k = 0, `Φ(0)=√π(a+3b/2)`.

Use `r=xA(x²)`, `dr=J(x²)dx` in (1). The recurrence reduces all requested
integrals to `∫e^(−x²)A(x²)^(−m)J(x²)^(−n)dx`. The script verifies the
partial-fraction identities exactly and reuses the committed outward 220-bit
rational arithmetic. The g derivatives use the positive Mellin formulas of
`CONTENT_KERNELS.md` section 4, with independent checks of g(0) and Φ′(0).
This avoids differentiating a nonintegrable inverse-radius kernel pointwise.

The draft's later smooth-density argument is correct: the radial map is a
smooth diffeomorphism including zero. The opening reference to density
singularities is unnecessary. The elliptic formulas are useful numerically,
but are not singularity-free: K has a logarithmic singularity at equal
radii, and cancellation or a split at that radius is needed. An `epsabs`
argument to SciPy is not a rigorous error enclosure.

## 2. Requested block: Gaussian maximum and buffer

The numerical optimizer gives (**N**)

    u_* ≈ 0.0403448094113431,
    S   ≈ 1.373953525661483.

The independent Arb calculation certifies (**C**)

    0.0403448 < u_* < 0.0403449,
    1.3739535256614 < S < 1.3739535256616.

The two derivatives at the bracket endpoints are respectively
`[2.1313974303e−8 ± 3.33e−19]` and
`[−2.05157065229e−7 ± 5.32e−19]`. Since L is a Gaussian scale mixture,
`B(u)=√π E√(V+u)` for a positive mixing variance V. Thus B is strictly
concave, B′ tends to zero, and this is the unique maximum over all u ≥ 0,
not only over the displayed band.

Rounded values from the interval calculation are:

| u | Λ_G(u) | B_G(u) |
|---:|---:|---:|
| 0.00551 | 1.372435313756172 | 0.00151821190531 |
| 0.01 | 1.372817854634014 | 0.00113567102747 |
| 0.02 | 1.373458184237098 | 0.00049534142439 |
| 0.03 | 1.373829001609235 | 0.00012452405225 |
| u_* | S | 0 exactly |
| 0.0403448 | 1.373953525661483 | between 0 and 2.2·10⁻¹⁵ |
| 0.0463 | 1.373913963502041 | 0.00003956215944 |

The full interval balls are in `benchmark_exact.json`. Tiny negative
floating values of `B_G` near u_* in `numerical.json` are roundoff, not
negative mathematical buffers.

Because `B‴ ≥ 0`, its most weakly negative curvature in the band occurs
at the upper endpoint. The checker encloses

    Λ_G″(0.0463) = [−2.16622449175286647 ± 3.96e−18].

Taylor's integral formula about u_* therefore proves, throughout the band,

    B_G(u) ≥ (27/25)(u−u_*)².                              (2)

This validates the draft's free quadratic buffer with an explicit constant.
It does not remove the need to bound D from below.

## 3. Requested block: g, ψ₁ and ψ₂

Complete monotonicity of `k=−g`, already independently reviewed in STATUS
2.7a, proves globally, not only on [0,10],

    g < 0,  g′ > 0,  g″ < 0,  g‴ > 0,  g(r) → 0.

The exact global suprema below follow by Taylor's integral formula and
these signs; the first two are approached at zero, the last at infinity:

    M_g_lin  = g′(0)       ≈ 2.15918086497027605,
    M_g_quad = −g″(0)/2    ≈ 5.84603083975476650,
    M_g_cap  = −g(0)       ≈ 0.83513593261412966.           (3)

For the requested auxiliary functions,

    ψ₂(r)=g′(r) ∈ (0,g′(0)],
    ψ₁(r)=g(r)+rg′(r)−g(0) ≥ 0,
    ψ₁(r) ≤ 2g′(0)r,
    ψ₁(r) ≤ (1+e^(−2))(−g(0)).                           (4)

The last bound follows atomwise from the maximum of
`1+(x−1)e^(−x)`, attained at x=2. Numerical search suggests
`max ψ₁ ≈ 0.8523088938` at `r≈3.12648`; ψ₁ need not increase forever.
For `√r|g(r)|` the numerical candidate is
`0.2579388220` at `r≈0.35475324`. These optimized values are **N**, not
certified global maxima. The draft's simple global bound `√r|g(r)|≤2/e`
is valid, by `|E[(T−1)ph]|≤E|T−1|=2/e`.

### Correct damping formula and a proved global choice

With `d(r)=g(r)−g(0)>0`, rearranging the proposed inequality gives

    μ_max = inf_{r>0} [g′(0)/d(r) − 1/r].                 (5)

The draft instead divides `g′(0)/d(r)−1` by r; that is not the same
expression. The numerical candidate from the corrected formula is

    μ_max ≈ 2.4764055144 at r≈1.95519.                    (N)

Its limiting constraints are about `2.7075225307` at zero and
`2.5854244568` at infinity. A log-grid and local optimization are not a
certificate for the infimum on an unbounded continuum.

There is a simple certified alternative. Write
`k(r)=k(0)E e^(−rT)` with `ET=g′(0)/k(0)`. Jensen and
`1−e^(−x)≤x/(1+x/2)` give

    g(r)−g(0) ≤ g′(0)r/(1+μ_safe r),
    μ_safe = g′(0)/(2(−g(0)))
           ∈ [1.292712228422288864,1.292712228422288865]. (6)

Consequently `μ=129/100` is globally valid (**P + C**), and
the rigorous bracket is `μ_safe ≤ μ_max ≤ 2μ_safe`, using the infinite-radius
constraint for the upper end. The proof uses the actual positive Laplace measure, not observed grid signs.

## 4. Requested block: Φ envelopes and their budget

Since Φ′ is completely monotone, Φ‴ is strictly positive and decreasing
and Φ⁽⁴⁾ is negative on all `[0,∞)`. Thus the exact supremum is

    M_Phi3 = Φ‴(0)/6
      ∈ [1.189570187716170755,1.189570187716170756].       (7)

The quadratic Taylor polynomial is a valid global **lower** bound, contrary
to the draft's suggestion that it fails at large r. A lower bound on Φ is
in the wrong direction for a lower bound on D. The global cubic **upper**
bound is

    U₃(r)=Φ(0)+Φ′(0)r+Φ″(0)r²/2+Φ‴(0)r³/6.              (8)

No smaller cubic coefficient with these three fixed lower coefficients
can majorize Φ near zero.

### Rational bounds

Put `β=−Φ″(0)/2` and `R_λ(r)=Φ(0)+Φ′(0)r−βr²/(1+λr)`.
The draft's expression for the necessary λ at each positive r is correct.
The endpoint at zero forces

    λ ≥ λ₀ = Φ‴(0)/(3|Φ″(0)|)
       ∈ [1.422423798167490009,1.422423798167490010].       (9)

Numerical search found no stronger constraint; its candidate for the global
minimum is λ₀. This is **N**, not a proof that `R_{λ₀}≥Φ` everywhere.
The asymptotic constraint `λ>|Φ″(0)|/(2Φ′(0))≈0.5840176770` is weaker.
The small-r limit is evaluated analytically rather than by subtracting nearly
equal floating-point numbers.

A proved, less sharp bound is available from the Bernstein representation
`Φ(r)−Φ(0)=∫(1−e^(−sr))ν(ds)`. There is no linear drift since `Φ′(r)→0`.
Normalize the measure `s²ν(ds)` to a probability law. Its mean is
`m=Φ‴(0)/|Φ″(0)|`, and

    Φ(0)+Φ′(0)r−Φ(r) = βr² E f(sr),
    f(x)=2(x−1+e^(−x))/x² ≥ 1/(1+x/2).

Jensen for the convex reciprocal gives

    Φ(r) ≤ R_{λ_safe}(r),
    λ_safe = Φ‴(0)/(2|Φ″(0)|)
      ∈ [2.133635697251235014,2.133635697251235015].       (10)

So `λ=107/50` works globally (**P + C**), and the rigorous
bracket is `λ₀ ≤ λ_min ≤ λ_safe`. Both scalar
inequalities used in (6) and (10) are equivalent to
`x−2+(x+2)e^(−x)≥0`; this function vanishes at zero and its derivative
is `1−(x+1)e^(−x)≥0`. This supplies the continuum proof that a finite
search cannot supply.

### Why the cubic route does not close the band

At a Gaussian of energy u, (8) has expectation
`Φ(0)+Φ′(0)u+Φ″(0)u²+Φ‴(0)u³`. Arb certifies:

| u | E U₃(u|W|²)−pu−S | E R_{107/50}(u|W|²)−pu−S |
|---:|---:|---:|
| 0.0403448 | [0.00010675513441 ± 3.96·10⁻¹⁵] | [0.00017020545953 ± 1.93·10⁻¹⁵] |
| 0.0463 | [0.00013802402217 ± 1.10·10⁻¹⁵] | [0.00020712016849 ± 1.36·10⁻¹⁵] |

All four quantities exceed `η=10^-4`. Consequently these particular
majorants, even with the exact Gaussian moments and zero content, leave a
negative lower bound for `S−Λ(q)+η`. Diffuse genuine cubics can approach this
Gaussian law and its moments, so this is a real obstruction to using these
majorants *alone* for every cubic. It is not a counterexample to the target
inequality. A separate near-Gaussian argument could cover that regime.

The sharper, unproved candidate `R_{λ₀}` is worth investigating: the
numerical expectation gaps `E R_{λ₀}(u|W|²)−B(u)` are approximately
`0.00002236652` at u_* and `0.00003557342` at 0.0463, below the available
`B_G+η` (`0.0001` and `0.00013956216`). **This only passes a necessary
budget test.** Taking expectations still requires a bound on the damped
fourth moment tied to the actual content, for every tensor.

Heavy tails also invalidate the proposed automatic moderate/large-χ step.
For the normalized Wick cubic `q=√(u/2)X(|X|²−2)`, exact exponential moments give

    E|q|⁴=44u², E|q|⁶=11352u³, χ=42,
    (Φ‴(0)/6)E|q|⁶ at u=0.0463
      ∈ [1.340310522407376469,1.340310522407376470].        (11)

The cubic remainder is not uniformly a small multiple of the Gaussian
`6u³`. The repository already has a sharper sixth-moment bound in terms of
δ (MONOGRAPH 1.8), but an actual signed budget still has to be checked.

## 5. Requested block: the three sanity families

The values below are **N**, from adaptive quadrature, rounded to about eight
significant digits. Error estimates for the expectation integrals were below
`2·10^-11`; these are diagnostics, not rigorous integration bounds. `C²=0`
in cases I and III and all three χ values are exact by phase symmetry and
exponential moments, respectively.

| case | u | C² | D | C²/D | χ |
|---|---:|---:|---:|---:|---:|
| I: √u XW′ | 0.00551 | 0 | 0.000045755060 | 0 | 2 |
| II: √(u/2)X(\|X\|²−2) | 0.00551 | 0.000020841561 | 0.00053574004 | 0.038902377 | 42 |
| III: √(u/2)X²Ȳ | 0.00551 | 0 | 0.00019496847 | 0 | 10 |
| I | 0.0463 | 0 | 0.0020207175 | 0 | 2 |
| II | 0.0463 | 0.0010563372 | 0.012063422 | 0.087565304 | 42 |
| III | 0.0463 | 0 | 0.0066065104 | 0 | 10 |

For I and III, condition on X and apply concavity of B to the random
Gaussian variance; this also proves D>0 in these nonconstant-variance cases.
For II, putting `t=|X|²`, the scalar content is exactly

    √(u/2)∫₀∞ e^(−t)t(t−2)[g(ut(t−2)²/2)−g(0)]dt.

The baseline subtraction integrates to zero and stabilizes evaluation.

**The Gaussian-factor example in the draft has zero leading content.**
It omitted a W′ factor:

    E[conj(X)q|q|²]
      = u^(3/2) E|X|⁴ E[W′|W′|²] = 0, not 2u^(3/2).     (12)

The full radial-profile content is also zero. Literal `XW′`, with X and W′
as first-chaos coordinates, is in H₂,₀ rather than H₂,₁. It is a useful
*limiting law* of the draft's `X·N^(−1/2)ΣY_j conj(Z_j)` family, whose
linear content is likewise zero by independent phase rotations. It must not
be inserted as a genuine H₂,₁ tensor to infer a sharp contraction constant.

The Wick cubic gives the genuine lower bound

    ‖Π₁(q|q|²)‖² = 128u³,
    ‖Π₁(q|q|²)‖²/(uδ) = 64/21.                          (13)

Thus the sharp constant in the draft is at least `64/21`, not justified by
its claimed ratio two. A sufficient general upper bound `15/2` is already
proved; its optimal value need not be known before attempting the target.

## 6. Formula audit and the existing tensor machinery

### Correct content IBP

If `ξ=Σ c_jz_j`, define `∂_ξ=Σ conj(c_j)∂_{z_j}` and
`∂̄_ξ=Σ c_j∂_{conj(z_j)}`. Then `E[conj(ξ)f]=E[∂_ξ f]`.
The draft reverses the conjugations. With this repaired convention,

    E[conj(ξ)q(g(V)−g(0))]
      = E[(∂_ξq)ψ₁(V)+q²g′(V)∂_ξ(conj(q))], V=|q|²,    (14)

is correct. The chaos bidegrees are `(1,1)` for `∂_ξq`, `(2,0)` for
`∂̄_ξq`, and `(0,2)` for `∂_ξ(conj(q))`. The last is not `(1,2)`.
The energy identities `Σ‖∂_jq‖²=2u`, `Σ‖∂̄_jq‖²=u` are correct.

The leading term is `ψ₁(r)=2g′(0)r+O(r²)`, so

    E[conj(ξ)qV] = 2E[V∂_ξq]+E[q²∂_ξ(conj(q))].          (15)

The draft eventually notices this factor two but its initial displayed
`I₄` omits it. Equations (14) and (15) must not be mixed with that formula.

The exact chaos decompositions in the draft are correct. An already reviewed
stronger identity (STATUS 6.3.21) supplies the missing weights. With
`c₂=Σ|∂̄_jq|²` and projections P_{r,s},

    δ = ‖P₂,₀q²‖²+‖P₃,₁q²‖²+2‖c₂−u‖²
      = (2/3)‖P₂,₀q²‖²+(1/3)‖P₃,₁q²‖²
        +(4/3)‖P₁,₁V‖²+(2/3)‖P₂,₂V‖².                 (16)

Hence `‖P₁,₁V‖²≤3δ/4` and `‖P₂,₀q²‖²≤δ`. The jointly weighted bound
in the second line, combined with (15), gives
`‖Π₁(qV)‖²≤(15/2)uδ`; see `influence-calculus-2026-11-16/NOTE2.md`,
Theorem 8. The δ^(3/2) bounds in STATUS 6.3.12 are complementary: its
`(3√6/4)δ^(3/2)` bound is smaller than `(15/2)uδ` exactly when
`0<χ<50/3`, since the ratio of the bounds is `(√6/10)√χ`.
At `χ=42`, as on the Wick cubic, `(15/2)uδ` is smaller.
The crossover is checked exactly in `constants_exact.py`.
For tensor rescaling, u is quadratic in T, δ and the squared projections
in (16) are quartic, and `‖Π₁(qV)‖²` is sextic. They cannot all be
quartic contractions, as the draft claims.

More useful for the *full* profile than a leading Taylor term is the existing
resolvent (STATUS 6.3.23): with
`𝔞=Σ(∂_jq)(∂̄_jq)` and `K_u(v)=∫₀∞e^(−s)g(v+us)ds`,

    K_u−uK_u′=g,
    E[conj(ξ)qg(V)] = E[conj(ξ)K_u′(V)(conj(q)𝔞+q(c₂−u))]. (17)

This preserves the profile damping and vanishes with the Stein defect. Its
projected Cauchy bound, the local variant, and a signed deficit formula are
already in STATUS 6.3.24–26. The leading proxy alone can be quite misleading
on case II: at the top of the band `g′(0)²·128u³≈0.05923`, whereas the full
content squared in section 5 is about 0.001056. Signed profile cancellation
is essential in the heavy-tail regime. Pointwise domination
`|g(V)−g(0)|≤g′(0)V` also does not justify replacing the full projected
content by `g′(0)‖Π₁(qV)‖`: projection norms do not preserve such pointwise
order, and cancellations in the two profiles can differ.

### Correct interpolation identity and the missing sign

Let `F=(Re q,Im q)`, `G~N(0,Σ)`, `Σ=(u/2)I₂`, independent, and
`F_t=e^(−t)F+√(1−e^(−2t))G`. This is OU interpolation of the **law** of F.
It is not `P_tq` on the underlying coordinates, which is `e^(−3t)q`.
The draft notices this distinction but must retain it consistently.
The real covariance is `(u/2)I₂`, not `uI₂`.

For `𝓗(x)=Φ(|x|²)=2E|L+x|`, the fundamental theorem gives

    D(q)=+∫₀∞ d/dt E𝓗(F_t)dt,                           (18)

with a **plus** sign. For the standard real Gaussian Malliavin derivative
on the coordinates `z_j=(x_j+iy_j)/√2`, set
`τ_ij=(1/3)⟨DF_i,DF_j⟩`. Since F has real chaos degree three,
Gaussian/Malliavin integration by parts gives

    d/dt E𝓗(F_t)
      = e^(−2t) E[(Σ−τ):D²𝓗(F_t)],
    D(q)=∫₀∞ e^(−2t)E[(Σ−τ):D²𝓗(F_t)]dt.               (19)

The Hessian is bounded by `2Φ′(0)I₂`, so the identity and its integral are
justified by the finite moments of the polynomial F and dominated convergence.
Although τ and the Hessian are positive semidefinite, **Σ−τ is centered and
need not be positive semidefinite**. A small L² norm of this defect supplies
an unsigned normal-approximation error, not a positive multiple of δ.
One must control its signed correlation with the Hessian, or extract the
leading fourth-cumulant term and bound the signed remainder. The complex
fourth-moment theorem does not by itself solve this sign problem.

The useful existing near-Gaussian result is STATUS 3.19: at this profile,
`D(q)≥δ/8` for `0<u≤0.0463`, `χ≤10^-4`, from the reviewed signed Edgeworth
argument. Raw contents also have written δ^(3/2) estimates (**P, author only**,
STATUS 6.3.11, `round2-2026-11-15-codex-c7e2/remote/RAW_CONTENT_BOUND.md`).
These are more relevant
starting points than rebuilding a generic fourth-moment approximation.
Their applicability to the specific numerical coefficient 0.24 must still
be checked; this note does not silently assert that corollary.

Finally, the winding example's stated energy is accurate:
`1+64π²/81∈[8.798205946539740143,8.798205946539740144]`.
Its holomorphic and antiholomorphic energy ratios are respectively
`1+32π²/81` and `32π²/81`, so it violates both Wick energy identities.
The draft correctly catches that D≥0 is not an available hypothesis.

## 7. Revised next steps

1. Use (16)–(17) and the existing signed deficit representation as the tensor
   interface. Do not require an exact optimal leading-content constant as a
   prerequisite: a sufficient bound for the full damped profile is what matters.
2. If pursuing the weak envelope route, certify a sharper rational or piecewise
   envelope that passes the *Gaussian expectation* budget. The candidate λ₀
   is numerically promising; the safe λ=107/50 and the Taylor cubic fail this
   test near the peak. A sharper scalar envelope remains only one ingredient.
3. Prove a common tensor-dependent inequality controlling both the damped
   fourth moment and the full content. Separate norm bounds that discard all
   signs are unlikely to preserve the observed room. The large-χ step is a
   genuine open comparison, not an automatic consequence of hypercontractivity.
4. Reuse the reviewed signed Edgeworth region for small χ, retaining its stated
   domain and constants. Extend a region only after testing the complete signed
   budget, including the content coefficient.

No part of this audit proves #509 or closes the compact interior of (P).

## 8. Reproduction, provenance and external references

From the repository root, use the scripts under
`research/conjecture-K/code/gemini-plan-audit-2026-11-17/`:

```sh
python3 -I research/conjecture-K/code/gemini-plan-audit-2026-11-17/constants_exact.py
python3 -I research/conjecture-K/code/gemini-plan-audit-2026-11-17/benchmark_exact.py
(
  set -eu
  gemini_audit_output=$(mktemp "${TMPDIR:-/tmp}/codex-a7c4-gemini-audit.XXXXXX")
  trap 'rm -f "$gemini_audit_output"' EXIT
  OPENBLAS_NUM_THREADS=1 python3 research/conjecture-K/code/gemini-plan-audit-2026-11-17/diagnostics.py --output "$gemini_audit_output"
  cmp "$gemini_audit_output" research/conjecture-K/code/gemini-plan-audit-2026-11-17/numerical.json
)
```

The first needs only the standard library. The second used python-flint 0.9.0
at 128-bit precision. The third used NumPy 2.3.5 and SciPy 1.17.1. Its output
is **N** irrespective of the requested tolerance. Matching JSON files are
committed beside the scripts; the benchmark prints progress before its JSON.
Assertions must be enabled for both certificate scripts. The temporary-output
comparison is byte-for-byte in the recorded numerical environment; other
NumPy/SciPy versions can move the last digits and optimizer locations, as the
independent review reports. Such differences do not upgrade or invalidate a
numerical search's status as **N**.

`constants_exact.py` computes, rather than reads, the derivative enclosures
via `third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py` and its outward
rational library. `benchmark_exact.py` independently integrates the Rice/Bessel
conditional Gaussian formula over `t=|Z|²`, on 256 panels through t=64, with
explicit exponential tail bounds for the value and its first two derivatives.
Strict concavity brackets the maximizer; a left tangent bounds S from above.
Rational-envelope expectations use another interval integral and explicit tail.
The mathematical reductions (1), (2), (6), (10) are part of the certificate's
implication and require review along with the code.

For that benchmark computation, put `z=t(a+bt)²/(2u)` and
`Î_j(z)=e^(−z)I_j(z)`. The three integrands, including prefactors but
excluding `e^(−t)`, are respectively

    B:   √(πu)[(1+2z)Î₀(z)+2zÎ₁(z)],
    B′:  √π/(2√u) Î₀(z),
    B″:  √π/(2u^(3/2))[(z−1/2)Î₀(z)−zÎ₁(z)].

For real z≥0, `0≤Î₀,Î₁≤1`. The value tail uses
`2E|ell(t)+√uW|≤2ell(t)+√(πu)` and `ell(t)≤at+bt²` for t≥64.
The derivative tail is at most `√π/(2√u)e^(−64)`. The absolute second
derivative tail uses `|(z−1/2)Î₀−zÎ₁|≤2z+1/2` and exact exponential
moments through degree three. The rational moment tail uses
`(ut)²/(1+λut)≤ut/λ`. These are all explicit in the checker.
The integer-order scaled Bessel functions are entire; FLINT defines the
scaling as [e^(−z)I_j(z)](https://flintlib.org/doc/acb_hypgeom.html),
so the complex integrator's analytic flag needs no branch-cut handling here.

The numerical script compares the elliptic evaluator from
`audit-2026-11-13/kernels.py` against an independent positive Abel integral
for g; the largest discrepancy at the ten displayed check points is about
`3.4·10^-16`. Its Gaussian baseline is independently checked by integrating
Φ at fixed shifts; the discrepancy at the band top is about `6.7·10^-16`.
Neither comparison certifies continuum extrema or the family quadratures.
The extrema search uses r from `3·10^-4` to `10^4`, with analytic endpoint
limits and local optimization; small-r cancellation excludes r<0.004 from
its direct rational-Φ comparison.

The existing ingredients credited above are:

- `sources/third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md`: all-order
  complete monotonicity and the positive derivative recurrence, reviewed in #403.
- `sources/antiholomorphic-stein-2026-11-16/NOTE.md`: the fourth-moment,
  content and deficit identities, a Claude session's contribution, with the
  independent review recorded in STATUS 6.3.20–25.
- `sources/influence-calculus-2026-11-16/NOTE2.md`: the directional projected
  leading-content estimate; use the living ledger for its strengthened constants.
- `sources/cumulant-remainder-codex-a7c4/`: the signed Edgeworth region,
  reviewed in #468, rather than an unsigned fourth-moment limit theorem.

For the outside mathematical context, Chen–Chen–Liu's
[*An improved complex fourth moment theorem*](https://arxiv.org/abs/2304.08088)
provides complex contraction and normal-approximation results; Chen–Poly's
[*Stein's method, Malliavin calculus, Dirichlet forms and the fourth moment
theorem*](https://arxiv.org/abs/1404.4784) explains the real framework.
These normal-approximation results do not assert the one-sided content-deficit
inequality requested here; the sign issue is exposed explicitly by (19).
