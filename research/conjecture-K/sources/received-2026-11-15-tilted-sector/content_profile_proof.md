<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/content_profile_proof.md (file dated 2026-11-15 03:53). Only this line was added. -->
# A certified structural bound for the tilted content

Agent ID: codex-6e2b. Date: 15 November 2026.

This note proves a dimension-free content estimate. It does **not** prove the
full tilted-sector inequality, its amplitude localization, or a Grothendieck
bound. The exact Stein budget used below is already present in
`Grothe/LowerAnalytic/Fluctuation.lean` and `Influence.lean`; it is re-derived
here to fix every factor. The additional application is through a shifted
Gaussian resolvent to the actual nonlinear tilted profile.

Labels: **P** means a complete mathematical proof is given; **C** means a
replayed outward interval calculation with its implication established.

## Result and review priorities

**P+C.** Let `s = 3/5`, let `q` be any complex Wick chaos of bidegree `(2,1)`
in any finite number of independent standard complex Gaussian coordinates,
and set

\[
u=\mathbb E|q|^2,\qquad
\delta=\mathbb E|q|^4-2u^2.
\]

For the exact peak-row profile in the task,

\[
\boxed{\quad\|\Pi_1[q h_{3/5}(|q|^2)]\|^2
       \le \frac{2}{25}\,\delta.\quad}                 \tag{1}
\]

There is no restriction on `u` in (1). In particular, on the dimension-free
subclass

\[
\delta\le\frac3{80000}=0.0000375,
\]

the content part B of the task holds with `kappa_c = 0` and
`eta_c = 3/1000000`. This also implies the proposed content budget
`content² <= (1/10) max(D(q),0) + 3/1000000` on that subclass, without any
assumption about the sign of `D(q)`.

A reviewer should check first:

1. The shifted-resolvent identity (6), especially its factor `1/3`.
2. The trace-sensitive Stein budget (3) and the metric operator norm (4).
3. The compact quadrature's implicit derivative jets and tensor Gauss error.
4. Both infinite tails: the integration tail for `R <= 4`, and the separate
   analytic estimate for all `R >= 4`.

The checker is `content_profile.py`; the completed output is
`content_profile_results.txt`. Run with an interpreter that has python-flint:

```
python3 -I -B content_profile.py --certify
```

The completed run used python-flint 0.9, 160-bit Arb arithmetic, and one
process. It covered `[0,4]` with 111 adjacent rational intervals. Its largest
compact upper enclosure was less than `0.333323310474181`; the separate
infinite-radius bound was less than `0.188775864363436`. Both are strictly
less than `1/3`. Runtime was approximately 32 seconds. Timing is incidental;
it is not part of the certificate. Floating point is used only to prioritize
which quadrature rectangle to subdivide, never to accept an inequality.

## 1. The exact Gaussian structural budget

Write the remote coordinates as
`y_j = (G_(2j-1) + i G_(2j))/sqrt(2)`, where the `G_i` are independent real
standard Gaussians. Put `Q = (Re q, Im q)`. Each component of `Q` belongs to
real chaos three. Global complex rotation makes `q` circular, so

\[
\mathbb E Q_aQ_b=\frac u2\,\mathbf1_{a=b}.
\]

Let `L = Delta_G - G . grad_G` be the real OU generator and define

\[
\Gamma_{ab}=\nabla Q_a\cdot\nabla Q_b,\qquad
\mathcal D=\Gamma-\frac{3u}{2}I_2.
\]

The letter `mathcal D` here denotes a matrix, not the scalar deficit `D(q)`.
Gaussian integration by parts gives `E Gamma_ab = 3 E Q_a Q_b`.

For any product `H = Q_a Q_b`, or for `H = |Q|²`, its Hermite decomposition
has degrees `0,2,4,6`. The identity

\[
K=\tfrac12(L+6)H
\]

gives `K = Gamma_ab`, respectively `K = tr Gamma`. If `H_k` is its degree
`k` component, then

\[
K-\mathbb EK=2H_2+H_4,
\quad \operatorname{Cov}(H,K)=2\|H_2\|_2^2+\|H_4\|_2^2,
\quad \operatorname{Var}K=4\|H_2\|_2^2+\|H_4\|_2^2.
\]

In particular `Var K <= 2 Cov(H,K)`. A further integration by parts using
`L Q_a = -3 Q_a` gives the exact identity

\[
\delta=
 \tfrac13\operatorname{Cov}(|Q|^2,\operatorname{tr}\Gamma)
 +\tfrac23\sum_{a,b}\operatorname{Cov}(Q_aQ_b,\Gamma_{ab}).       \tag{2}
\]

Indeed,
`E |Q|⁴ = (1/3) E[|Q|² tr Gamma + 2 sum_ab Q_a Q_b Gamma_ab]`;
subtracting the means contributes exactly `2u²`.
All covariances in (2) are nonnegative. Thus `delta >= 0`, and

\[
\boxed{\quad
\mathbb E\big[(\operatorname{tr}\mathcal D)^2+
                  2\|\mathcal D\|_F^2\big]\le6\delta.
\quad}                                                        \tag{3}
\]

In complex notation (3) is precisely the known Stein-energy inequality:
its left side is
`2 E[(Gamma(q,conj q)-3u)²] + E|Gamma(q,q)|²`.

## 2. A radial Hessian norm

For an equivariant radial vector function `V(x) = x k(|x|²)` on the real
plane, write its Hessian at `x = (R,0)` as

\[
A_V(R)=\partial_{11}V_1(R,0),\qquad
B_V(R)=\partial_{22}V_1(R,0)
      =\partial_{12}V_2(R,0).
\]

All other nonzero entries are the symmetric copies of `B`. For a symmetric
matrix `D = [[x,y],[y,z]]`, contraction with this vector-valued Hessian is
`(A x + B z, 2 B y)`. Define

\[
N_V(R)=\max\left\{
 \frac{3A_V(R)^2-2A_V(R)B_V(R)+3B_V(R)^2}{8},\ B_V(R)^2\right\}.
\]

Direct inversion of the matrix `[[3,1],[1,3]]` proves

\[
|D:D^2V|^2\le N_V(R)\big[(\operatorname{tr}D)^2+2\|D\|_F^2\big]. \tag{4}
\]

This is the exact squared operator norm from symmetric matrices with the
displayed metric to Euclidean output vectors. The metric, and hence this
operator norm, is rotation invariant. For an arbitrary radial Hessian,

\[
N_V(R)\le \frac{1+1/\sqrt3}{4}\big(A_V(R)^2+3B_V(R)^2\big).       \tag{5}
\]

The coefficient in (5) is the largest generalized eigenvalue of its two
quadratic forms; the other branch has ratio at most `1/3`.

## 3. The shifted Gaussian resolvent

Set `Phi(x) = x h_(3/5)(|x|²)`. For `u > 0`, let `P_t` be the two-dimensional
OU semigroup with generator

\[
T_u=\frac u2\Delta_x-x\cdot\nabla_x.
\]

Its stationary Gaussian has covariance `u I_2/2`. Define

\[
\Psi(x)=\int_0^\infty e^{t/3}P_t\Phi(x)\,dt.
\]

The actual `Phi` is odd, globally Lipschitz, smooth, and has bounded second
derivatives; these facts also follow from the signed density in section 4.
Oddness and the centered Gaussian convolution give
`|P_t Phi(x)| <= Lip(Phi) exp(-t) |x|`, so the integral converges.
Differentiation under the integral is legitimate and
`(T_u + 1/3) Psi = -Phi`.

For every coordinate `G_i`, apply chaos-three integration by parts to
`Q_a G_i Psi_a(Q)`, where `Psi_a` means differentiation of a chosen output
component in input direction `a`. Sum over `a`, and use ordinary Gaussian
integration by parts on the remaining derivative of `Psi(Q)`. The result is

\[
\boxed{\quad
\Pi_{\rm real,1}\Phi(Q)
  =\Pi_{\rm real,1}\left[\frac13\mathcal D:D^2\Psi(Q)\right].
\quad}                                                        \tag{6}
\]

For clarity, the intermediate identity is

\[
\mathbb E[G_i Q_a\Psi_a(Q)]
=\tfrac13\mathbb E[(\partial_iQ_a)\Psi_a(Q)]
 +\tfrac13\mathbb E[G_i\sum_b\Gamma_{ab}\Psi_{ab}(Q)].
\]

The first term, after summation, is `(1/3) E[G_i Psi(Q)]`; this is the
origin of the shift `+1/3`.

The full real first-chaos projection of the complex vector `Phi(Q)` equals
the holomorphic complex projection in the task. The antiholomorphic
coefficients vanish under global phase rotation. Projection contraction,
(3), (4), and (6) therefore give

\[
\|c_{3/5}(q)\|^2\le\tfrac23\delta\sup_R N_\Psi(R).
\]

Since `D² P_t Phi = exp(-2t) P_t D² Phi`, convexity of the operator norm in
(4) gives

\[
\sup_R\sqrt{N_\Psi(R)}
 \le\left(\int_0^\infty e^{-5t/3}dt\right)
       \sup_R\sqrt{N_\Phi(R)}
 =\tfrac35\sup_R\sqrt{N_\Phi(R)}.
\]

Consequently

\[
\boxed{\quad\|c_{3/5}(q)\|^2
   \le\frac6{25}\delta\sup_R N_\Phi(R).\quad}                 \tag{7}
\]

For `u = 0`, `q = 0` almost surely and the conclusion is immediate. Thus the
remaining scalar certificate `sup N_Phi < 1/3` proves (1) at every energy.

## 4. The scalar profile and its certified integration

Write `a = 699/1250`, `b = 179/1250`, `d = 2/5`. The signed planar density
corresponding to the visible weight `T-d` is

\[
f(z)=\frac{(t-d)e^{-t}}{\pi(a+bt)(a+3bt)},
\qquad |z|=\sqrt t(a+bt).
\]

It is smooth: the map `t -> t(a+bt)²` has strictly positive derivative on
`[0,infinity)`. Its derivatives have integrable tails. Up to a linear
function, `Phi = ph * f`; the subtracted linear function has zero Hessian.
Put

\[
k(|z|^2)=\frac{f_r(|z|)}{|z|}
 =\frac{2 f_t(t)}{(a+bt)(a+3bt)}.
\]

This formula extends smoothly through `z=0`. Transfer one derivative to
the density and use polar coordinates `x-z = s(cos theta,sin theta)` at
`x=(R,0)`. The apparent `1/s` from `D ph` cancels the polar Jacobian. The
two scalar Hessian entries become

\[
A_\Phi(R)=\int_0^\infty\int_0^{2\pi}
 \sin^2\theta\,(R-s\cos\theta)
 k((R-s\cos\theta)^2+s^2\sin^2\theta)\,d\theta\,ds,
\]

\[
B_\Phi(R)=\int_0^\infty\int_0^{2\pi}
 s\cos\theta\sin^2\theta
 k((R-s\cos\theta)^2+s^2\sin^2\theta)\,d\theta\,ds.             \tag{8}
\]

The checker integrates `theta` over `[0,pi]` and doubles by reflection.

### Compact radius and quadrature

For a radius interval `[R_lo,R_hi]` within `[0,4]`, truncate `s` at
`S = R_hi + ell(20)`. Tensor-product two-point Gauss-Legendre quadrature
is applied adaptively on rectangles in `(s,theta)`.

For a one-dimensional interval of length `h`, its error is at most
`h^5 sup |f''''| / 4320`. An Arb power-series coefficient of degree four
encloses `f''''/24`, so the checker uses `h^5 |coefficient_4| / 180`.
Positive quadrature weights bound the tensor error by the sum of the two
one-variable error bounds times the length of the other interval.

Fourth derivatives are enclosed at interval-valued centers. The implicit
series for `t` is obtained recursively from `t(a+bt)² = v`: the unknown
coefficient at each positive degree has multiplier
`(a+b t0)(a+3b t0)`, which is positive. Thus there is no uncertified
differentiation or finite-difference step. The constant root is enclosed
using the exact cubic formula

\[
\sqrt t=2\sqrt{a/(3b)}\,
 \sinh\left(\tfrac13\operatorname{arsinh}
       (3\sqrt v\sqrt{3b/a}/(2a))\right).
\]

The input `v` is a sum of two real squares. Intersecting its enclosure
with `[0,infinity)` before the inverse is therefore legitimate.

Interval radii and positive error upper bounds are accumulated separately
from midpoints. This is necessary when replacing an old rectangle by its
children; subtracting the old interval itself would retain its uncertainty.
All accumulations remain outward Arb enclosures.

The outer radius cover starts with exact fractions `k/20`, `0 <= k <= 80`.
A failed radius interval is bisected using exact `Fraction` arithmetic.
Only passed intervals are accepted. Before printing a global certificate,
the program checks the first endpoint is zero, the last is four, and every
successive pair shares its endpoint exactly.

### The truncated integration tail

Set `C0 = 1265/699`, `C1 = 1415/699`. Direct differentiation gives

\[
|k(r^2)|\le
 \frac{2e^{-t}(C_0+C_1t)}{\pi(a+bt)^2(a+3bt)^2}.
\]

This upper bound decreases for `t >= 20`. With `r0=ell(20)`, both omitted
entries in (8) are bounded in absolute value by

\[
\frac2{a^2}\left(1+\frac{2R_{hi}}{r_0}\right)
 e^{-20}\big(C_0+21C_1\big).                                  \tag{9}
\]

To verify (9), use `|x-sn| >= s-R_hi`, dominate the numerator by
`r+2R_hi`, substitute `r=ell(t)`, and use
`r dr = (a+bt)(a+3bt) dt / 2`. This includes the entire angle `2pi`.

### All radii at least four

Take `c = ell(4)`. In `D² Phi = D ph * grad f`, integrate by parts inside
the disk of radius `c`. For every `R >= 4`, the resulting inner, boundary,
and exterior contributions give

\[
\|D^2\Phi(R,0)\|_F\le
 \frac{\sqrt3\,\mathbb E|T-d|}{(4-c)^2}
 +\frac{2\pi c f(c)}{4-c}
 +2\sqrt{\pi A_{tail}B_{tail}}.                               \tag{10}
\]

Here `||D² ph(z)||_F = sqrt(3)/|z|²` and `||D ph(z)||_F=1/|z|`.
The final term follows from the elementary potential bound
`integral g(z)/|x-z| dz <= 2 sqrt(pi ||g||infty ||g||1)`.
It follows directly by integrating the ball-mass bound
`min(||g||1, pi ||g||infty r²)` against `r^-2 dr`.

For explicit exterior constants, set

\[
r_4=\frac b{a+4b}+\frac{3b}{a+12b},\quad
E_1=1+r_4,\quad E_0=1+d(1+r_4).
\]

For `t >= 4`, `f` decreases and
`|f_t| <= exp(-t)(E1 t-E0)/(pi(a+bt)(a+3bt))`. The numerator
`sqrt(t)(E1 t-E0) exp(-t)` decreases there; the checker verifies the
two polynomial signs proving this for the entire half-line. Thus

\[
A_{tail}=\frac{4e^{-4}(4E_1-E_0)}
 {\pi(a+4b)(a+12b)^2},\qquad
B_{tail}=\frac{e^{-4}(26E_1-5E_0)}{a+12b}.                     \tag{11}
\]

The mass bound uses `2 sqrt(t) <= t` on this range and the exact exponential
tail moments `integral_4^infty t exp(-t) dt = 5 exp(-4)` and
`integral_4^infty t² exp(-t) dt = 26 exp(-4)`.

The checker encloses (10) below `0.691893352`. Applying (5) yields
`N_Phi(R) < 0.188775865 < 1/3` on the whole half-line.

## 5. What remains open

Estimate (1) controls true nonlinear content and tends to zero with the
fourth cumulant. It does not infer a positive deficit from a small
cumulant, and it does not replace the finite-amplitude step A.

Outside `delta <= 3/80000`, a sufficient additional comparison for the
particular content budget used above would be

\[
\frac2{25}\delta\le\frac1{10}\max(D(q),0)+\frac3{10^6}.
\]

This comparison is not asserted for general tensors. In particular, the
coarse cumulant estimate (1) is substantially looser than the observed true
content on the Wick monomial. A general content-to-deficit inequality still
needs either sharper tensor information, a coupling with the deficit, or
another argument on the complementary region.

## 6. A uniform content bound for amplitude localization

The separate checker `profile_range.py` certifies the exact scalar range

\[
-\frac1{40}<h_{3/5}(v)<\frac{253}{1000}\qquad(v\ge0).            \tag{12}
\]

Its full invocation is

```
python3 -I -B profile_range.py
```

It first replays the entire Hessian-profile certificate; no cached values
are trusted. The following is the proof of the implication and of all
tails. The completed transcript is `profile_range_results.txt`; its final
`C GLOBAL PROFILE RANGE` record is required for the compact calculation.
The completed run accepted 158 adjacent rational intervals and took about
135 seconds including its replay of the Hessian certificate.

Let `Fraw(R) = E[(T-d) Re ph(R+L)]`. Then
`h(R²) = Fraw(R)/R - c0` for `R>0`, with

\[
c_0=\frac{I_1-dI_0}{2}
 =\frac12\left[\frac{\sqrt\pi}{b}
               -\left(\frac ab+d\right)I_0\right],\qquad
I_0=\frac\pi{\sqrt{ab}}e^{a/b}\operatorname{erfc}\sqrt{a/b}.
\]

Arb encloses `c0` around `0.024048342160729148377022632`. The formula for
`I0` follows by writing `1/(x²+c²)` as its elementary Laplace integral,
integrating the Gaussian in `x`, and substituting `c sqrt(1+s)` in the
remaining integral. Also `I1 = sqrt(pi)/b - (a/b) I0` by polynomial division.

On the compact interval `1/25 <= R <= 3`, the checker integrates

\[
F_{raw}(R)=\int_0^\infty\int_0^{2\pi}
  s\cos\theta\,
  f(R-s\cos\theta,-s\sin\theta)\,d\theta\,ds.                \tag{13}
\]

It uses the same certified implicit jets and tensor quadrature as before.
For a point radius `R`, the tail beyond `R+ell(20)` is at most

\[
\left(1+\frac R{\ell(20)}\right)e^{-20}(21+d).                 \tag{14}
\]

Indeed, the positive majorant `(t+d) exp(-t)/(pi(a+bt)(a+3bt))`
decreases for `t>=20`, and substitution using `r dr = (a+bt)(a+3bt) dt/2`
gives (14).

The point quadrature is evaluated at the midpoint of a rational radius
interval. The already certified `N_Phi<1/3` implies

\[
\left|\frac{d}{dR}h_{3/5}(R^2)\right|=|B_\Phi(R)|<\frac1{\sqrt3}.
\]

Inflating the midpoint enclosure by half the interval length divided by
`sqrt(3)` therefore covers its entire interval. Only passed boxes are
accepted. The wrapper checks the first endpoint is `1/25`, the last is
`3`, and all adjacent endpoints coincide exactly.

For `0 <= R <= 1/25`, use `h(0)=0` and the same derivative bound:
`|h(R²)| <= 1/(25 sqrt(3)) < 1/40`. This proves (12) on the small-radius
range without division by `R`.

For every `R>=3`, the elementary inequality

\[
0\le1-\Re\operatorname{ph}(R+z)\le\frac{2|z|^2}{R^2}
\]

gives

\[
F_{raw}(R)\ge\frac35-\frac{2M}{R^2},\qquad
M=\mathbb E|T-d||L|^2
\le a^2(2+d)+2ab(6+2d)+b^2(24+6d)<\frac{27}{10}.
\]

Thus `Fraw(R)>=0` on this entire half-line. Its upper bound is
`E|T-d|<3/4`. Consequently
`-c0 <= h(R²) <= 1/4-c0`, strictly inside the interval in (12).
The phase inequality follows from
`|ph(R+z)-1| <= 2|z|/R` and the unit-circle identity; the exceptional zero
argument is immediate separately and has probability zero here.

Finally, center the range (12) at `57/500=.114`. Since `Pi_1 q=0`,
orthogonal projection contraction gives

\[
\|c_{3/5}(q)\|^2
\le\mathbb E\left|q\left(h_{3/5}(|q|^2)-\frac{57}{500}\right)\right|^2
\le\left(\frac{139}{1000}\right)^2u.
\]

For `u<=463/10000`, this is at most `8945623/10^10 < 9/10000`:

\[
\boxed{\quad\|c_{3/5}(q)\|<\frac3{100}.
\quad}                                                       \tag{15}
\]

This range-based Cauchy--Schwarz estimate is used for amplitude
localization. It is not offered as a uniform content-to-deficit theorem;
by itself it has the Gaussian-floor limitation recorded in STATUS 11.18.
Combined with the structural estimate, it gives the rigorous envelope

\[
\|c_{3/5}(q)\|^2\le
 \min\left(\frac2{25}\delta,\frac{8945623}{10^{10}}\right)
 \qquad(u\le463/10000).
\]

In particular the content budget with `kappa_c=1/10`, `eta_c=3/10^6`
also follows whenever `D(q)>=0.008915623`. No assertion is made that every
cubic satisfies this large-deficit condition or the earlier small-cumulant
condition.
