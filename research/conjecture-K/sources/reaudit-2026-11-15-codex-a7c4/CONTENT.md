<!-- Original research note by codex-a7c4, 15 November 2026; Refs #398. -->
# A larger certified neighbourhood of a content-controlled core

Agent-ID: codex-a7c4. **P, by its author, not externally reviewed; C for the
explicit scalar enclosures below.** This sharpens the conditional theorem in
STATUS 6.3.9, from a remainder energy of `(3/500)D(p)` to `D(p)/100`.
It does not establish the required inequality for arbitrary cubics, the joint
A/B bound, Conjecture K, or a new Grothendieck bound.

## 1. Precise statement and relationship to the record

Use the peak profile `a=699/1250`, `b=179/1250`. Write

    Φ(z) = φ(|z|²) = 2 E_Z |L+z|,
    Ψ(z) = z g(|z|²) = E_Z[(T−1) ph(L+z)],
    F(q) = E Φ(q),   C(q) = ‖Π₁,₀ Ψ(q)‖₂,
    D(q) = B(‖q‖₂²)−F(q),   B(v) = E φ(v|W|²).

Split the remote coordinates into orthogonal blocks X,Y. Let `p,h∈H₂,₁`, with
`p` of character one under common rotation of X and `h` having zero component
of that character. Assume

    ‖p+h‖₂² ≤ 463/10000,
    D₀ := D(p) > 0,     C(p)² ≤ (9/40)D₀.

Then, in every finite dimension,

    ‖h‖₂² ≤ D₀/100   ⇒   C(p+h)² ≤ (6/25)D(p+h).

This is a 5/3 increase in the allowed remainder **energy**, relative to
`sources/audit-2026-11-13/improvement_content_extension.md`. The norm radius
increases by `sqrt(5/3)`. That proof's circle cancellation and Gaussian-chaos
estimates are valid; no error is alleged in it. The improvement comes from
enclosing its scalar constants rather than using the deliberately coarse
analytic bounds `1,5,8/5,9/10`. A core theorem remains a hypothesis. In
particular, a new neighbourhood does not make different family certificates
additive or exhaust the whole chaos.

## 2. Re-derived perturbation argument

Set `e=‖h‖₂²`, `c₀=Π₁,₀Ψ(p)`. Orthogonality of the circle characters gives
`‖p+h‖₂²=‖p‖₂²+e`. Since Φ is radial and Ψ has charge one, circle averaging
gives

    E DΦ(p)[h] = 0,
    Re⟨c₀, Π₁,₀(DΨ(p)[h])⟩ = 0.

For the second identity, `c₀` is supported on the X block. Pair with a unit
linear form there. For each character `k≠1` of h the real-linear derivative
has characters k and `2−k`; the two pairings have nonzero characters `k−1`
and `1−k`. This argument does not require independence of p and h.

The certified bounds of section 3 are

    ‖DΨ‖∞ < 209/250,      ‖D²Ψ‖∞ < 336/125,
    φ′(0) < 179/125,      B′(v) > 49/50   (0≤v≤463/10000).

Convexity of Φ and `φ′′≤0` bound its Hessian above by `2φ′(0)I`.
Taylor's theorem and the first cancellation therefore give

    D(p+h) ≥ D₀ − (179/125−49/50)e = D₀−(113/250)e.

Projection contraction gives `‖ΠΨ(p+h)−c₀‖² ≤ (209/250)²e`. If `c₀≠0`,
put `ℓ=c₀/‖c₀‖₂`. Creation/annihilation in the orthonormal complex Wick
basis gives

    E|ℓ|²|h|² = e+‖∂_ℓ h‖₂²+‖∂̄_ℓ h‖₂² ≤ 4e,
    E|ℓ||h|² ≤ 2e.

The derivative norms sum to at most three times e since h has total chaos
degree three. Taylor's theorem for Ψ, the second cancellation, and expansion
of the projection norm give (also when `c₀=0`)

    C(p+h)² ≤ C(p)² + [(209/250)²+2(336/125)C(p)]e.

Jensen gives `F(p)≥φ(0)`; concavity of φ gives
`B(v)≤φ(0)+(179/125)v`. Hence

    C(p)² ≤ (9/40)(179/125)(463/10000) < (123/1000)².

Subtract `(6/25)D(p+h)` to obtain

    C(p+h)²−(6/25)D(p+h)
      ≤ −(3/200)D₀ + (91789/62500)e
      < −(3/200)D₀ + (3/2)e.

The hypothesis `e≤D₀/100` proves the assertion, with strict reserve. This
also exhibits the exact budget: the same estimates do not justify `e≤D₀/90`.

## 3. Scalar constants, with exact enclosures

The positive Laplace-mixture representation `−g(v)=∫e^(−tv)ν(dt)` is the
analytic identity proved in the earlier extension note and the manuscript's
CM A-profile argument. Its derivation uses the inverse of
`H(t)=t(a+bt)²`, the completely monotone function
`exp(−H⁻¹(s))/(a+bH⁻¹(s))²`, and integration by parts. It does not follow from
a sampled graph. We rechecked the change of variables and heat-equation
step: for `M_λ(x)=E|Z_λ+x|`, `E|Z_λ|²=1/λ`, the radial integral is
`−∂_λ M_λ(x)=(sqrt(pi)/4)λ^(−3/2)e^(−λ|x|²/2)I₀(λ|x|²/2)`.

Put `M₀=−g(0)`, `M₁=g′(0)`. For the atom `z e^(−t|z|²)`, the derivative
and Hessian operator norms are at most `1` and `2sqrt(t)` respectively
(the elementary maximization is supplied in the earlier note). Thus

    ‖DΨ‖∞ ≤ M₀,    ‖D²Ψ‖∞ ≤ 2sqrt(M₀M₁).

Our exact scalar check proves

| quantity | enclosing interval |
|---|---|
| M₀ | (0.835135932614129, 0.835135932614130) |
| M₁ | (2.159180864970276, 2.159180864970277) |
| φ′(0) | (1.431973791291431, 1.431973791291432) |

In particular `M₀<.836`, `M₁<2.16`, and `2sqrt(.836·2.16)<2.688`.
Also `φ′(0)=(1/2)E|L|⁻¹`. Since L is a circular Gaussian scale mixture,

    B′(v) ≥ sqrt(pi)/(2sqrt(E|L|²+v)),
    E|L|² = a²+4ab+6b².

The exact inequality `pi>4(49/50)²(E|L|²+463/10000)` proves the bound on B′.

### A nonsingular formula for M₁

The earlier note already proved this formula and the coarse bound M₁<6;
its sharper numerical value was only a floating diagnostic. Write
`K(t)=(a+bt)(a+3bt)`, `s=H(t)`. The signed radial pushforward density of
`(T−1)dP` is `f(s)/pi`, with `f(H(t))=(t−1)e^(−t)/K(t)`. Move Laplacians
from the norm to this smooth density. Radial integration by parts gives

    M₁ = (1/8)∫₀∞ f′(s)/sqrt(s) ds
       = (1/8)∫₀∞ e^(−t)/[sqrt(t)(a+bt)]
           [(2−t)/K(t)−(t−1)K′(t)/K(t)²] dt.

Boundary terms vanish at both endpoints. After `t=r²` the integrand is
`e^(−r²)` times a rational function whose denominator is
`4(a+br²)³(a+3br²)²`. The checker verifies its partial-fraction identity
coefficient by coefficient, then evaluates it through

    I_k(c,d) = ∫₀∞ e^(−r²)/(c+dr²)^k dr,
    I₀ = sqrt(pi)/2,
    I₁ = pi exp(c/d) erfc(sqrt(c/d))/(2sqrt(cd)),
    I_(k+1) = [(2k−1−2c/d)I_k+(2/d)I_(k−1)]/(2kc).

The recurrence follows by integrating the derivative of
`r e^(−r²)/(c+dr²)^k`. No numerical quadrature, sampled interpolation, or
stored kernel value enters acceptance. The interval arithmetic and rational
series for pi, exp and erf are explicitly reused from the previous audited
`odd_cost_check.py`; their inputs are recomputed in this invocation.

## 4. Reproduction and audit limits

From the repository root:

    python3 -I research/conjecture-K/code/reaudit-2026-11-15-codex-a7c4/content_constants.py

The checker prints JSON and never modifies the checkout. Saved output:
`code/reaudit-2026-11-15-codex-a7c4/content_constants.json`. It checks the
partial fractions, all outward scalar bounds and the final rational budget;
it also rejects the unsupported `D₀/90` radius and a Lipschitz bound below
`.83`. Paper arguments, including complete monotonicity and the chaos
calculus, remain separate analytic obligations stated above, not facts
mechanically proved by the script. No prior source file is changed.
