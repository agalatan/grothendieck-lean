<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/localization_radial_proof.md (file dated 2026-11-15 04:25). Only this line was added. -->
# Radial-gradient reduction for global sector localization

Agent-ID: codex-6e2b. 15 November 2026.

**Status at writing.** The implications and reductions below are **P**.
The circular-profile interval implementation in `localization_circle.hpp`
has passed an independent mathematical/code audit. The global scalar
majorant (1) is still **O** until the entire `localization_majorant.cpp`
certificate passes. No completed localization theorem is asserted merely
from its numerical evidence.

## 1. A sufficient pointwise gradient inequality — P implication, O premise

Use the constants and definitions from `REPORT.md`: `s=3/5`, `d=2/5`,
`A=T-d`, `P=p-9/25`, and `L=Z(a+bT)`. For real `rho>0` and complex `w`, put

\[
b_\parallel(w,\rho)=\Re\mathbb E_Z[A\operatorname{ph}(L+w+A\rho)].
\]

Consider the explicit scalar majorant

\[
\boxed{b_\parallel(w,\rho)\le
 m\rho+c\Re w+\frac{B}{\rho}|w|^2,\qquad
m=\frac7{10},\ c=\frac{33}{200},\ B=\frac1{25}.}       \tag{1}
\]

If (1) holds for every `rho>0,w`, every global maximizing sector for every
allowed remote cubic with `u<=463/10000` has norm at most

\[
\sqrt{\frac{875533}{123885000}}<\frac{841}{10000}
<\frac{17}{200}.                                      \tag{2}
\]

Indeed, fix a unit remote complex linear form `ell` and write `r=sigma ell`.
Differentiation along this ray gives

\[
\tfrac12\frac d{d\sigma}\mathcal J(q,\sigma\ell)
=\mathbb E\Re\bigl[\bar\ell\,
  \mathbb E_Z A\operatorname{ph}(L+q+A\sigma\ell)\bigr]-P\sigma.
\]

For each remote realization with `ell!=0`, rotate the visible Gaussian
by `arg ell`. In (1), set `rho=sigma|ell|` and
`w=exp(-i arg ell)q`. Multiplying (1) by `|ell|` and integrating yields

\[
\tfrac12\mathcal J'(\sigma)
\le -(P-m)\sigma+\frac{Bu}{\sigma},                 \tag{3}
\]

because `E|ell|²=1` and `E Re(conj(ell) q)=0`. There is **no independence
assumption between `ell` and `q`**. The event `ell=0` has probability zero.
Differentiation under expectation is justified by the integrable bound
`|A ell|`; the visible polynomial has zero probability of a zero argument.

The derivative in (3) is strictly negative once
`sigma²>Bu/(P-m)`. Existence of a global maximizer is already proved in
REPORT §4.2. A nonzero global maximizer must have zero radial derivative,
so (2) follows from

\[
\frac{B(463/10000)}{P-m}=\frac{875533}{123885000}
<\left(\frac{841}{10000}\right)^2.
\]

In particular, no restriction to the preliminary radius `0.371` is needed
if the majorant is global. The implication uses orthogonality and energy,
not a new content-to-deficit comparison.

## 2. Smooth angular profile and a compact source integral — P

Set `z=w/rho`, and define

\[
C(\nu)=\mathbb E_\theta|1+\nu e^{i\theta}|,
\qquad j(\nu)=\frac{C'(\nu)}\nu,\qquad j(0)=\frac12.
\]

With `y=sqrt(T)`, `A_y=y²-d`, and

\[
\nu=\frac{\rho\sqrt{(\Re z+A_y)^2+(\Im z)^2}}
 {y(a+by^2)},
\]

angular averaging gives the exact formula

\[
\frac{b_\parallel(\rho z,\rho)}\rho
=\int_0^\infty
 \frac{2e^{-y^2}A_y(\Re z+A_y)}{a+by^2}
 j(\nu)\,dy.                                        \tag{4}
\]

The apparent denominator `y` occurs only in the nonnegative argument
`nu`. The integrand itself is bounded at `y=0`, since `0<=j<=1`.
An interval panel containing zero may therefore use a global range for
`j` rather than evaluating an infinite expression. The improved circular
checker supplies the much sharper global upper bound below.

Formula (4) extends continuously to `rho=0` at every fixed finite `z`:

\[
\lim_{\rho\downarrow0}\frac{b_\parallel(\rho z,\rho)}\rho
=\frac{J_s}{2}+c_0\Re z,\qquad
c_0=\frac{I_1-dI_0}{2}.
\]

This follows by dominated convergence, using the bounded circular profile
and its value at zero. It permits closed parameter boxes that include
`rho=0`; no division by zero is needed there.

An optional width-saving identity removes this baseline analytically:

\[
\frac{b_\parallel(\rho z,\rho)}\rho
=\frac{J_s}{2}+c_0\Re z+
\int_0^\infty\frac{2e^{-y^2}A_y(\Re z+A_y)}{a+by^2}
 [j(\nu)-\tfrac12],dy.                              \tag{5}
\]

The constants `J_s` and `c0` already have outward enclosures from the
closed `I_0,I_1,I_2` formulas. This identity is valid regardless of whether
a checker chooses to exploit it.

## 3. Circular-profile enclosures — P+C

Let `c_k=binom(1/2,k)^2>0`. On `0<=nu<=1`,

\[
j(\nu)=\sum_{k\ge1}2k c_k\nu^{2k-2},\qquad
\sum_{k\ge1}2k c_k=\frac2\pi.
\]

The positive coefficients make `j` increasing in this range. Truncation
after `N` terms gives a lower bound, and the remaining total coefficient
times `nu^(2N)` gives an upper remainder. The shared endpoint is evaluated
as the exact value `j(1)=2/pi`.

For `nu>=1`, put `t=1/nu`. Reciprocity of `C` gives

\[
j(1/t)=t-\sum_{k\ge1}(2k-1)c_k t^{2k+1}.
\]

Write `b_k=(2k-1)c_k` and

\[
p_N(t)=t-\sum_{k=1}^N b_k t^{2k+1},\quad
q_N(t)=p_N(t)-\left(1-\frac2\pi-\sum_{k=1}^N b_k\right)t^{2N+3}.
\]

Then `q_N<=j(1/t)<=p_N` on `[0,1]`. Both polynomials are concave, because
all their nonlinear coefficients are nonpositive. Thus the minimum of
`q_N` on any interval is at an endpoint. The derivative of `p_N` is
strictly decreasing on `(0,1)`; once its unique zero is enclosed by
interval-sign bisection, an interval maximum of `p_N` is either an
endpoint or its enclosed peak. This proves the range algorithm without
assuming that `j` is globally monotone.

`localization_circle.hpp` uses `N=64`. Its recurrence
`c_(k+1)=c_k*((2k-1)/(2k+2))²` and all polynomial operations use outward
interval arithmetic. A simple additional global bound is

\[
j(\nu)\le\frac{11}{16}\qquad(\nu\ge0).
\]

For `nu<=1`, use `j<=2/pi<11/16`. For `nu>=1`, truncate at `N=3`.
The degree-seven polynomial

\[
\frac{11}{16}-t+\frac{t^3}{4}
 +\frac{3t^5}{64}+\frac{5t^7}{256}
\]

has strictly positive Bernstein coefficients on all eight closed
intervals `[i/8,(i+1)/8]`. The least exact coefficient is `13/16384`;
setup rechecks every sign with directed intervals. The 64-term peak
enclosure is sharper still and is verified to exceed `2/pi`, so its
upper endpoint is itself a global `j` upper bound. The development
check returned a bound below `0.671513528082957`; the actual accepted
endpoint is computed anew by setup, not trusted as a saved decimal.

## 4. Exterior regions and source tail — P

The remaining scalar expression to bound is

\[
\frac{b_\parallel(\rho z,\rho)}\rho
-c\Re z-B|z|^2\le m.                                \tag{6}
\]

The following elementary exclusions reduce it to the compact box
`0<=rho<=3/2`, `-10<=Re z<=10`, `0<=Im z<=10`. Reflection of `Im z`
does not change (4).

First, `|b_parallel|<=M=E|T-d|<3/4`. Completing the square in `z`,

\[
m+c\Re z+B|z|^2\ge m-\frac{c^2}{4B}
=\frac{3391}{6400}.
\]

For `rho>=3/2`, multiplying this lower bound by `rho` gives
`10173/12800>3/4`, proving (1).

For `rho<=3/10`, the already certified curvature bound gives

\[
b_\parallel(\rho z,\rho)
\le b_\parallel(\rho z,0)+\tfrac34\rho.
\]

The scalar profile identity and its certified range give

\[
\frac{b_\parallel(\rho z,0)}\rho
 =\Re z\,[c_0+h_{3/5}(\rho^2|z|^2)],\qquad
-\frac{166}{1000}\le c_0+h_{3/5}-c\le\frac{113}{1000}.
\]

Here one may use `24/1000<c0<25/1000` and the prior range
`-1/40<h<253/1000`. Thus (6)'s left side is at most
`3/4+(166/1000)|z|-|z|²/25`. This decreases for `|z|>=10` and is below
`m` at ten. For `rho>=3/10`, use instead the upper bound
`5/2+c|z|-B|z|²`, which also decreases and is below `m` for `|z|>=10`.
All these comparisons are rational.

On the compact parameter box, the omitted source integral `y>=8` in
(4) is bounded in absolute value by

\[
\frac2b\left(4+\frac1{32}+\frac{10}{16}\right)e^{-64}<10^{-24}.
\]

Indeed `|Re z|<=10`, `A_y>0`, `0<=j<=1`, and
`|A_y(Re z+A_y)|/(a+by²)<=y²+10` divided by `b`. Integrate the resulting
`(2/b)(y²+10)e^{-y²}` and use the standard Gaussian tail bound.

## 5. Independent numerical curvature route — N, not used for acceptance

`localization_radial_probe.py` and `localization_radial_probe_results.txt`
test a different sufficient approach. If `theta(t)` is an actual uniform
Hessian bound at exact visible sector radius `t`, put
`g(x)=integral_0^x theta(t)dt`. For a unit linear Gaussian `Y`, the radial
derivative obeys

\[
\tfrac12\mathcal J'(\sigma)
\le\|c_s(q)\|-P\sigma+\mathbb E[|Y|g(\sigma|Y|)].
\]

The formula is **P conditional on the stated uniform Hessian envelope**.
The numerical probe uses elliptic-integral quadrature and nonlinear
searches with no error bounds, and is only **N**. It found exclusion
margins `P sigma-E|Y|g(sigma|Y|)` around `0.03405` at `sigma=.085`,
`0.05686` at `.15`, and `0.07484` at `.371`. The actual-radius Hessian
search peaked near radius `.525` at about `1.80`. No uniform envelope
beyond the previously certified radius `.3` has been proved by this
probe. These data motivate the alternative route; they are not inputs
to the pointwise-majorant certificate.

