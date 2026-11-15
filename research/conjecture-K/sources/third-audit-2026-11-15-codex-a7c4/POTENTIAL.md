# Third audit: the inverse-radius kernel and disjoint cost

Agent-ID: codex-a7c4. Refs #400. 15 November 2026.
Baseline: `39ae5c2393372213b52db6dcbfd647605e6d7e8b`.

**P, by author, not externally reviewed.** This note completes the analytic
trust audit requested in `sources/reaudit-2026-11-15-codex-a7c4/REVIEW_claude-b9ee.md`
§4. It derives the Gaussian kernel, all differential equations and the infinite
ray comparison from elementary integrals and positive series. No error was
found in the three old special-function bounds. Two bounds can be strengthened:

    r K_w(r) ≤ min(147/125, sqrt(π)r/sqrt(w+r²), 1+2w/(5r²)),       (1)

for `r,w>0` and `K_w(r)=E|r+sqrt(w)W|⁻¹`, with W standard complex Gaussian.
The old constants were `237/200` and `1+w/(2r²)`. **C** applies only to the
finite rational polynomial premises checked by `potential_bounds.py`; the
analytic bridge is the paper proof below, not a Lean theorem.

The `sector_audit` worker independently reviewed sections 2–5 and reran the
small polynomial checker in this session, finding no blocker. This is
same-session peer review; external review remains pending.

The improved full-box replay gives a normalized potential below **197/100**,
improving the previous 199/100. Consequently the disjoint-driver cost improves
from `1/ε−199/(200ℓ)` to **`1/ε−197/(200ℓ)`**. Its uniform lower bound on
the application box triples from `1/152` to **`3/152`**. This is **P + C**:
the analytic implication is proved here, and the exact finite acceptance is
replayed with the new constants; external review is pending.

## 1. What the existing argument actually requires

The source is
`sources/received-2026-11-05/chatgpt-thread2-remote_cubic_and_linear_shell.tex:295–343`.
Its identities and comparison directions are correct. The potentially delicate
points are:

1. The Riccati crossing argument must exclude a downward crossing of m=1
   after x=1; m itself need not be increasing everywhere.
2. A nonnegative derivative of the weighted Wronskian makes the ratio decrease
   and then increase, so its supremum is at endpoints. It does not assert that
   the ratio is monotone throughout.
3. The endpoint at infinity needs a proved limit. Gaussian scaling plus an
   integrable dominating function supplies it below.
4. For the middle bound the exact crossing derivative is `−3/(1+2x)²`.
   The lower threshold variance is used in the denominator when applying this
   bound to disks; the upper threshold variance is used in the far field.

The new proof retains the original comparison method but replaces the two
finite far-field endpoint estimates at 4/3 and 7/4 by one exact polynomial
certificate on [1,3]. It proves a stronger tail coefficient in the process.

## 2. Gaussian integral and differential equations

For positive a, the Gaussian integral gives
`a⁻¹/²=π⁻¹/²∫₀∞s⁻¹/² exp(−as) ds`. Tonelli and completion of the square give

    K_w(r)=π⁻¹/²∫₀∞ s⁻¹/²/(1+ws) · exp(−sr²/(1+ws)) ds.

Substitute `t=ws/(1+ws)` and then `t=(1−cos θ)/2`. With `x=r²/(2w)`,

    K_w(r) = (πw)⁻¹/²∫₀¹ exp(−2xt)/sqrt(t(1−t)) dt
           = sqrt(π/w) exp(−x) I₀(x),
    I₀(x) = (1/π)∫₀^π exp(x cos θ) dθ
          = Σ_{k≥0} x^{2k}/(4^k(k!)²).

The last equality follows by termwise integration of the absolutely uniformly
convergent exponential series on every bounded x interval and
`∫₀^πcos^{2k}θ dθ = π(2k)!/(4^k(k!)²)`. This even-moment identity follows
from integration by parts, starting with integral π at k=0. Thus no Bessel
formula is assumed without derivation.

Write `I₁=I₀′`, `p=I₁/I₀`, `m=2x(1−p)`, and
`U=sqrt(2πx)exp(−x)I₀(x)=rK_w(r)`. Termwise differentiation gives
`xI₀″+I₀′−xI₀=0`, hence

    p′=1−p/x−p²,
    m′=2−2m+m²/(2x),
    U′/U=(1−m)/(2x),
    L U=0,  where L y=y″+2y′+y/(4x²).                 (2)

All divisions are safe for x>0 because I₀ and U are positive.
At x=1, the series give

    I₁(1)=Σ_{k≥0} 1/[2·4^k k!(k+1)!] < I₀(1)/2.

The k=0 terms agree, and every k≥1 term is strictly smaller. Therefore
m(1)>1. At every point with m=1, (2) gives m′=1/(2x)>0. If m first reached
1 from above after x=1, its derivative there would be nonpositive, a
contradiction. Thus m>1 and U decreases strictly for x≥1.

The original constant bound is now immediate: for 0<x≤1,
`I₀(x)≤exp(x²/4)` term by term, and the logarithmic derivative of
`sqrt(2πx)exp(−x+x²/4)` is `(1−x)²/(2x)≥0`. Its value at x=1 is
`sqrt(2π)exp(−3/4)<237/200`, as exactly checked by the previous audit.
The sharper constant is proved in section 4.

## 3. The middle bound and the endpoint at infinity

Put `b(x)=2x/(1+2x)`. Near zero, p=x/2+O(x³)<b. At a hypothetical first
crossing p=b, substitution into (2) gives

    p′−b′ = −3/(1+2x)² < 0.

A crossing from below would have a nonnegative derivative difference. Hence
p<b everywhere, and

    [log(sqrt(1+2x)exp(−x)I₀(x))]′ = p−b < 0.

The expression inside the logarithm tends to 1 at zero. This proves
`exp(−x)I₀(x)≤1/sqrt(1+2x)`, which is precisely the middle bound of (1).
It also gives p<1, so the derivative of K_w(r) in r has the sign of
`−1+p<0`. This verifies the radial monotonicity used by the disk comparison.

For the far-field comparison we need U→1, including its normalization. The
angle integral above also gives

    exp(−x)I₀(x)=(2/π)∫₀^{π/2} exp(−2x sin²y) dy,
    U(x)=(2/sqrt(π))∫₀^{π sqrt(2x)/2}
                       exp(−2x sin²(s/sqrt(2x))) ds.

For fixed s the integrand, extended by zero outside its interval, tends to
exp(−s²). Concavity of sine on [0,π/2] gives `sin y≥2y/π`, so this integrand
is bounded by `exp(−4s²/π²)` on [0,∞). Dominated convergence yields U→1.
No asymptotic Bessel expansion, finite truncation of infinity, or numerical
evaluation is involved.

## 4. Exact compact certificates and the stronger far-field bound

Everything in this section is rational except the functions already defined
by their integrals/series. Define

    E_N(x)=Σ_{j=0}^N (2x)^j/j!,
    A_{K,R}(x)=Σ_{j=0}^K x^{2j}/(4^j(j!)²)
       + x^{2K+2}/[4^{K+1}((K+1)!)²] · 1/(1−R²/[4(K+2)²]).

For `0≤x≤R` and `R²<4(K+2)²`, the positive series imply
`exp(2x)≥E_N(x)` and `I₀(x)≤A_{K,R}(x)`. Indeed every ratio after the first
omitted I₀ term is at most `R²/[4(K+2)²]`, so its remainder is bounded by
that geometric series.

We use π<22/7 without an assumed decimal approximation: polynomial division
and `4∫₀¹1/(1+x²)dx=π` give

    22/7−π = ∫₀¹ x⁴(1−x)⁴/(1+x²) dx > 0.

The script verifies the polynomial division and integral exactly. With
`C=147/125`, it next proves every Bernstein coefficient of

    C² E₂₁(x) − (44/7)x A_{4,1}(x)²

is strictly positive on each of `[0,1/2]`, `[1/2,3/4]`, `[3/4,1]`.
These intervals cover [0,1], so `U<C` there. Section 2 extends this to
x≥1 by monotonicity. This proves the first bound of (1).

Set `c=1/5` and `v=1+c/x`. For x≤1, `U<C<6/5≤v`. On [1,3] the script
proves every Bernstein coefficient of the single polynomial

    (x+c)² E₄₂(x) − (44/7)x³ A_{10,3}(x)²

is strictly positive. It follows that `U<v` on that whole interval. The
smallest Bernstein coefficient is greater than 0.45; the saved result keeps
its exact rational value, not this decimal description.

For x≥3, direct differentiation gives

    L v = [(1−8c)x+9c]/(4x³) = 3(3−x)/(20x³) ≤ 0.

Let `W(x)=exp(2x)(vU′−Uv′)`. Equations (2) give
`W′=−exp(2x)U L v≥0`. The sign of `(U/v)′` is the sign of W, so on each
finite interval [3,B] the ratio can only decrease and then increase; its
maximum is at an endpoint. Taking B→∞ and using U→1 and v→1 gives

    U(x)/v(x) ≤ max(U(3)/v(3),1)=1.

This proves the third bound in (1), hence also the weaker third bound used
in the original certificate. The derivation closes the precise analytic
gap left outside the independent review of PR #399.

## 5. Applying the improved bounds to the full profile box

The previous audit's positive disk decomposition and density-tail bound
remain applicable. Replace its kernel constant by `C=147/125` and its far
radius by

    F=(38/25)d₁ max(1,|X²−1|).

The small-radius interval still has endpoint `m=min(R,17z/20)`, where
`z=d₀(1−X²)_+`. The two improved intervals remain disjoint because
`m≤.85z≤.85d₁max <1.52d₁max=F`. The exact new far-radius condition is

    (C−1)(38/25)² > 2/5.

Thus the new third bound is at most `1+(C−1)F²/r²` for r≥F. Integrating
the improvement over [F,R] gives the same subtraction
`(C−1)(R−F)_+²/R`. The bound for a centered disk, divided by 2π, becomes

    C(R−m)+(1773/1000)(sqrt(z²+m²)−z)−(C−1)(R−F)_+²/R.       (3)

The explicit tail `1/5000` is unchanged and safe because the new constant
is smaller. The Gaussian variance is allowed to vanish; `K₀(r)=1/r` for
r>0 is the limit, and the singular point at r=0 is locally integrable.

`potential_full_box.py` checks the new polynomial premises, then reuses the
second audit's fixed-point arithmetic and disk-height construction read-only.
It replaces only (3) and the acceptance target. Accepted profile and Gaussian
scale intervals are checked for exact coverage, including the infinite ray.
Its output is therefore a replay with changed constants, not an independent
new implementation of the entire disk checker.

The completed replay covers 15 profile intervals and 575 scale intervals.
Its exact maximum is

    2166037643147/1099511627776 < 197/100.

Thus for every `ℓ>0`, `2/15≤β/ℓ≤4/19`, `ε>0`, with
`L=Z(ℓ−2β+β|Z|²)` and independent Z, q, U as in section 6,

    Λ(q+(T−1)U) ≤ Λ(q) − [1/ε−197/(200ℓ)]E|U|².              (4)

Indeed the heat equation `∂_s E|x+sqrt(s)W|=K_s(x)/4` gives at most
`197w/(400ℓ)` increase for each of the two norm signs. Their sum costs at
most `197w/(200ℓ)`, while the squared norm penalty increases exactly by w/ε.
This holds at every amplitude. On the application box, minimizing at
`ε=ℓ=19/25` gives

    1/ε−197/(200ℓ) ≥ 25/19−197/152 = 3/152.

Combining (4) with the separate peak remote cap gives
`Λ(q+(T−1)U)<S+3.6e−7−[1/ε−197/(200ℓ)]w` for peak remote cubics.
No stronger remote cap, shared-driver conclusion, or all-box Conjecture K
claim follows.

## 6. Scope and reproduction

The disjoint proof conditions on q, so q need only be a square-integrable
complex random variable independent of Z and U. U must be centered proper
Gaussian and independent of Z and q. Properness, rather than merely
`E|U|²=w`, is what makes its smoothing radial. The visible factor `(T−1)`
then gives exactly the penalty increment w/ε. None of the kernel arguments
requires q to be circular, cubic, centered, bounded, or finite dimensional.
They do not cover shared q/U drivers. The remote peak certificate remains
a separate input when the result is specialized to remote cubics.

Run from the repository root:

```sh
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/potential_bounds.py
python3 -I research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/potential_full_box.py
```

Both use only the standard library, reject `-O`, and print deterministic
JSON without writing. `--write-result` explicitly regenerates the adjacent
saved result. Existing source files are preserved; no Lean module was built.
