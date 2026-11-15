<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/content_next_m3_proof.md (file dated 2026-11-15 04:35). Only this line was added. -->
# Scalar third-derivative certificate

Agent-ID: codex-6e2b. 15 November 2026.

This note supplies the scalar **C** input to the separately derived
second-chaos resolvent theorem. It does not prove the missing general
content-to-deficit estimate.

Fix the peak row and `s=3/5`, and put `d=2/5`. Define

\[
m(x)=\mathbb E[(T-d)\operatorname{sign}(\operatorname{Re}L+x)].
\]

The checker `content_next_m3.py`, requiring `python-flint`, certifies

\[
\sup_{x\in\mathbb R}|m'''(x)|<13. \tag{1}
\]

It imports only the interval and inverse-root helpers from
`content_profile.py`; it does not assume the previous profile certificates
or read a cached integral. Every omitted integration ray is bounded.
The accompanying `content_next_m3_results.txt` records all accepted boxes.

## Density and derivative formula

Let `a=699/1250`, `b=179/1250`, and let `t=t(v)` be the unique nonnegative
solution of `v=t(a+bt)^2`. Write

\[
p_t=a+bt,\quad q_t=a+3bt,\quad D_t=p_tq_t,
\quad R_t=\frac b{p_t}+\frac{3b}{q_t},
\quad S_t=\frac{b^2}{p_t^2}+\frac{9b^2}{q_t^2}.
\]

The signed density of `L`, weighted by `T-d`, is the smooth radial function

\[
f(z)=\frac{(t-d)e^{-t}}{\pi D_t},\qquad t=t(|z|^2).
\]

Since `dt/dv=1/D_t` and `dR_t/dt=-S_t`, its derivatives in `v` are

\[
f_v=\frac{e^{-t}}{\pi D_t^2}J_t,
\quad f_{vv}=\frac{e^{-t}}{\pi D_t^3}K_t,
\]

where

\[
J_t=1-(t-d)(1+R_t),
\quad K_t=(t-d)(1+3R_t+2R_t^2+S_t)-2-3R_t.
\]

Differentiating the one-dimensional marginal gives the even function

\[
m'''(x)=8\int_0^\infty
\frac{e^{-t}}{\pi D_t^2}
\left(J_t+\frac{2x^2}{D_t}K_t\right)\,dy,
\qquad t=t(x^2+y^2). \tag{2}
\]

Smoothness at the origin follows from the implicit equation, whose
`t` derivative is `D_t>0`. Each derivative is an exponentially decaying
rational function of `t`, times a polynomial in `x,y`, so differentiation
under the integral is justified by an integrable majorant on compact
`x` intervals.

## Uniform integration tails

For a fixed `T_0>0` and `t>=T_0`, all denominators increase and `R_t,S_t`
decrease. Also

\[
\frac{x^2}{D_t}\le\frac{t p_t^2}{p_tq_t}
=\frac{t p_t}{q_t}\le t.
\]

Put `R=R_{T_0}`, `S=S_{T_0}`, and

\[
k_1=1+3R+2R^2+S,\qquad k_0=dk_1+2+3R,
\]
\[
P_{T_0}(t)=1+d(1+R)+(1+R+2k_0)t+2k_1t^2.
\]

The absolute value of the integrand in (2), including its factor 8, is
bounded by

\[
G_{T_0}(t)=\frac{8e^{-t}P_{T_0}(t)}{\pi D_{T_0}^2}. \tag{3}
\]

The checker verifies that `G_{T_0}` decreases on `[T_0,infinity)` for both
`T_0=4` and `T_0=20`. If `P=c_0+c_1t+c_2t^2`, the sign to check is
`P'-P`; its value and derivative are negative at `T_0`, and its second
derivative is `-2c_2<0`. All these are Arb inequalities with strict signs.

Write `ell(t)=sqrt(t)(a+bt)`. Then

\[
\ell'(t)=\frac{a+3bt}{2\sqrt t}
\le\frac{a+3bt}{2\sqrt{T_0}}\qquad(t\ge T_0).
\]

Consequently the explicit tail quantity used is

\[
I(T_0)=\frac8{\pi D_{T_0}^2}
\sum_{j=0}^2\frac{c_j}{2\sqrt{T_0}}
\left(a E_j(T_0)+3bE_{j+1}(T_0)\right),
\]

where `E_j(T_0)=int_{T_0}^infinity t^j exp(-t) dt`; these integrals are
computed by the exact recurrence `E_0=exp(-T_0)`,
`E_j=exp(-T_0) T_0^j+j E_{j-1}`.

For every `x`, the omitted source interval `y>=ell(20)` contributes at
most `I(20)`: use `t(x^2+y^2)>=t(y^2)>=20` and monotonicity in (3).

For every `x>=ell(4)=2.264`, the whole integral is at most

\[
\ell(4)G_4(4)+I(4)
<2.519<13. \tag{4}
\]

Indeed split the `y` integral at `ell(4)`, use `t>=4` on its first
piece, and use `t>=t(y^2)` on its second piece. This covers the infinite
`x` ray and overlaps the compact interval checked below.

## Compact quadrature and coverage

On each rational `x` box in `[0,3]`, the checker encloses (2) on
`0<=y<=ell(20)` by adaptive two-point Gauss quadrature. A cell of length
`l` has error at most `l^5 sup|F''''|/4320`. The Arb-series coefficient
of degree four is `F''''/24`, so the implemented divisor is 180.

The inverse map `t(v)` is enclosed at degree zero by its explicit
hyperbolic formula and at higher degrees recursively from
`t(a+bt)^2=v`. The coefficient of the unknown degree `k` is exactly
`(a+bt_0)(a+3bt_0)`. Divisions use these positive factors separately,
avoiding artificial zero crossings from wide product intervals.

Midpoints, interval radii, and error upper bounds are accumulated
separately. Refining a cell subtracts only its previous midpoint, radius,
and error allowance before adding its children. Floating point numbers
are used solely to prioritize refinement, never for acceptance.

The initial boxes have endpoints `j/40`, `0<=j<=120`; failed boxes are
bisected rationally. Every accepted box has absolute enclosure `<13`.
The global wrapper checks the sorted boxes start at zero, end at three,
have positive lengths, meet exactly with no gaps, and all passed.
Evenness, this compact cover, and (4) prove (1).

## Consequence of the independently derived structural theorem

The second-chaos resolvent argument establishes, for any finite-dimensional
complex cubic `q` of bidegree `(2,1)`, with
`delta=E|q|^4-2(E|q|^2)^2`,

\[
\|c_{3/5}(q)\|^2\le
\frac{\pi^2}{128}\left(\frac38\right)^{3/2}
\|m'''\|_\infty^2\,\delta^{3/2}.
\]

The checker also verifies

\[
\frac{\pi^2}{128}\left(\frac38\right)^{3/2}169<3.
\]

Thus, with the structural proof as explicitly identified mathematical
input, the resulting **P+C** bound is

\[
\boxed{\|c_{3/5}(q)\|^2\le3\delta^{3/2}.}
\]

In particular, `delta<=1/10000` implies
`||c_{3/5}(q)||^2<=3/10^6`, independently of the sign of `D(q)`.
This proves the desired content estimate
`||c||^2<=(1/5)max(D,0)+3/10^6` on that dimension-free subclass.
No general lower bound on the signed deficit is inferred.
