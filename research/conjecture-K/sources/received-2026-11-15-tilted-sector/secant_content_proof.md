<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/secant_content_proof.md (file dated 2026-11-15 05:13). Only this line was added. -->
# A factor-two content improvement on the central energy interval

Agent-ID: **codex-6e2b**, 15 November 2026.

**P+C.** At the peak row and tilt `s=3/5`, every finite-dimensional
complex cubic `q` of bidegree `(2,1)` with

\[
\frac3{100}\le u=\mathbb E|q|^2\le\frac{463}{10000}
\]

satisfies, with `delta=E|q|^4-2u^2`,

\[
\boxed{\|c_{3/5}(q)\|^2\le
\frac{1077659}{27000000}\,\delta
\le\frac1{25}\,\delta.} \tag{1}
\]

There is no restriction on the normalized fourth cumulant `chi=delta/u^2`.
Thus this includes the requested interval `2<=chi<=10`. This improves
the earlier certified coefficient `2/25` by more than a factor of two.
It does not by itself prove the general comparison with the signed deficit.

The checker is `secant_content_verify.py`. Its exact coefficient witness
is `secant_content_witness.json`, whose entries are rational decimal
strings. All profile integrals are recomputed with Arb. The separate
`secant_content_probe.py` and `secant_content_candidate.json` are numerical
search artifacts and are not accepted as proof inputs. The checker requires
`python-flint` and imports previously supplied interval/root helpers from
`content_profile.py`, plus explicit exponential-moment formulas from
`content_next_m3.py`. It does not invoke their previous certificates or
assume cached profile integrals.

## 1. The shifted resolvent and its scalar reduction

Use the already proved shifted-resolvent identity from
`content_profile_proof.md`: for

\[
\Phi(x)=x h_{3/5}(|x|^2),\qquad
\Psi_u=\int_0^\infty e^{t/3}P_t^{(u)}\Phi\,dt,
\]

where `P_t^(u)` is the two-dimensional OU semigroup with invariant
covariance `(u/2) I`, the tensor budget gives

\[
\|c_{3/5}(q)\|^2\le\frac23\delta\sup_{R\ge0}N_{\Psi_u}(R), \tag{2}
\]

\[
N_{\Psi_u}(R)=\max\left\{
\frac{3A(R)^2-2A(R)B(R)+3B(R)^2}{8},\ B(R)^2\right\}.
\]

Here, at the point `(R,0)`, `A=partial_11 Psi_1` and
`B=partial_22 Psi_1=partial_12 Psi_2`. The derivation of (2) uses the
exact centered carré-du-champ budget
`E[(tr D)^2+2||D||_F^2]<=6 delta`, so retains the tensor structure of `q`.

Let

\[
m(x)=\mathbb E[(T-2/5)\operatorname{sign}(\operatorname{Re}L+x)].
\]

The phase identity
`ph(z)=(1/4) int_0^(2pi) e^(i theta) sign(Re(e^(-i theta)z)) dtheta`
represents the nonlinear part of `Phi` as this angular average of `m`.
The subtracted linear term has zero Hessian. Differentiating the OU
semigroup twice gives the odd scalar function

\[
k_u(x)=\int_0^\infty e^{-5t/3}P_t^{u/2}m''(x)\,dt
=\int_0^1 z^{2/3}\mathbb E\left[
m''\left(zx+\sqrt{\frac u2(1-z^2)}G\right)\right]dz, \tag{3}
\]

with `G` standard real Gaussian. Consequently

\[
A(R)=\int_0^{\pi/2}\cos^3\theta\,k_u(R\cos\theta)\,d\theta,
\quad
B(R)=\int_0^{\pi/2}\cos\theta\sin^2\theta\,
k_u(R\cos\theta)\,d\theta. \tag{4}
\]

The scalar function is bounded, vanishes at zero, and solves

\[
\mathcal L_u k_u=m'',\qquad
\mathcal L_u=\frac53-\frac u2\frac{d^2}{dx^2}
                 +x\frac d{dx}. \tag{5}
\]

## 2. A sharp angular norm bound

For every measurable real function `w` on `[0,1]` with `|w|<=1`, put

\[
A=\int_0^1(1-t^2)w(t)\,dt,\qquad B=\int_0^1t^2w(t)\,dt.
\]

Then

\[
\frac{3A^2-2AB+3B^2}{8}\le\frac{11}{72},
\qquad B^2\le\frac19. \tag{6}
\]

To prove the first assertion, the compact set of achievable pairs `(A,B)`
has a maximizer for this positive quadratic form. Its supporting linear
functional at a nonzero maximizing pair is maximized by
`w(t)=sign(alpha+(beta-alpha)t^2)`. Thus, up to an overall sign, it is
enough to consider `w=1` on `[0,z]` and `w=-1` on `(z,1]`, including the
constant cases at the endpoints. These give

\[
A=2z-\frac23z^3-\frac23,\quad B=\frac23z^3-\frac13,
\]

\[
\frac{11}{72}-\frac{3A^2-2AB+3B^2}{8}
=\frac{z(1-z)}{18}
(8z^4+8z^3-16z^2-12z+15)\ge0.
\]

The quartic's Bernstein coefficients on `[0,1]` are exactly
`15,12,19/3,0,3`, all nonnegative. The checker verifies these rational
coefficients. The second assertion in (6) follows by integrating `t^2`.
No sign assumption on `w` is needed.

Substitution `t=sin(theta)` in (4) therefore proves

\[
\sup_R N_{\Psi_u}(R)\le\frac{11}{72}\|k_u\|_\infty^2. \tag{7}
\]

## 3. Certified scalar source bounds

Write `a=699/1250`, `b=179/1250`, `d=2/5`, and let
`v=t(a+bt)^2`. Set

\[
p=a+bt,\quad q=a+3bt,\quad D=pq,
\quad R=b/p+3b/q,\quad S=b^2/p^2+9b^2/q^2.
\]

The signed planar density is `f(v)=(t-d)exp(-t)/(pi D)`. The same density
calculation as in `content_next_m3_proof.md` gives

\[
m''(x)=8x\int_0^\infty
\frac{e^{-t}}{\pi D^2}[1-(t-d)(1+R)]\,dy,
\qquad t=t(x^2+y^2). \tag{8}
\]

The checker proves the following bounds with all tails included:

\[
|m''''(x)|\le1000\quad(0\le x\le1), \tag{9}
\]
\[
m''(x)\ge-25/24\quad(x\ge0),\qquad
m''(x)\le25/24\quad(x\ge1). \tag{10}
\]

For (9), put `W=1+3R+2R^2+S`, `K=(t-d)W-2-3R`,
`U=2b^3/p^3+54b^3/q^3`, and

\[
K'=W-(t-d)((3+4R)S+U)+3S,\qquad H=K'-(1+3R)K.
\]

Differentiating (8) gives

\[
m''''(x)=16x\int_0^\infty
\frac{e^{-t}}{\pi D^3}\left(3K+\frac{2x^2}{D}H\right)dy. \tag{11}
\]

The compact part of the integral is bounded by outward interval Riemann
sums over 50 rational `x` boxes covering `[0,1]` and an explicit `y`
partition. This proves the stronger upper bound `92.108`, leaving ample
room in the selected constant 1000. For the omitted ray
`y>=ell(20)`, where `ell(t)=sqrt(t)(a+bt)`, use `x<=1`,
`x^2/D<=t`, increasing denominators, and decreasing `R,S,U` to majorize
(11) by `exp(-t)` times a positive quadratic polynomial. It is decreasing
for `t>=20`. Change variables `y=ell(t)` and use
`ell'(t)<=(a+3bt)/(2sqrt(20))`; the resulting exponential moments are
computed exactly by recurrence.

For (10), compact interval quadrature covers `[0,3]`; on `[0,1]` only
the lower inequality is tested. The source integral (8) is evaluated
with two-point Gauss quadrature and an explicit fourth-derivative error
from Arb-series coefficients. Each accepted `x` box satisfies the stated
inequality throughout. On `x>=ell(4)=2.264`, use
`x<=sqrt(t)(a+bt)` and `sqrt(t)<=t/2` to dominate the integrand by

\[
\frac{4e^{-t}}{\pi p_4q_4^2}
\left[(1+d(1+R_4))t+(1+R_4)t^2\right].
\]

This decreases for `t>=4`. Splitting the `y` integral at `ell(4)`
gives a global absolute upper bound `0.363864<25/24` on this ray.
Thus the finite parameter cover overlaps the infinite one.

All compact quadratures stop at `y=ell(20)`. Their omitted tails are
bounded by the previously derived explicit positive envelope from
`content_next_m3.py`, multiplied by the applicable upper bound on `x`.
The two-point Gauss error is `length^5` times the absolute fourth
Taylor coefficient divided by 180. Every midpoint, radius, and
quadrature error is accumulated outward.

## 4. The rational supersolution certificate

The witness specifies rational values `Y_i` and physical derivatives
`D_i` at `x_i=i/500`, `0<=i<=500`. The cubic Hermite interpolant `K`
on each cell, with `h=1/500` and local variable `t`, has power coefficients

\[
Y_i,\quad hD_i,\quad
-3Y_i-2hD_i+3Y_{i+1}-hD_{i+1},\quad
2Y_i+hD_i-2Y_{i+1}+hD_{i+1}.
\]

This is a continuously differentiable, piecewise cubic function.
The checker sets the endpoints exactly to `K(0)=0`, `K(1)=5/8` and
verifies `K'(1)>=0`. It verifies by Bernstein coefficients that

\[
K(x)\le313/500\quad(0\le x\le1). \tag{12}
\]

It recomputes (8) at all 501 nodes. By (9), the linear interpolation
of these source values, plus `1000 h^2/8`, majorizes `m''` on every
cell. After subtracting this source majorant from `mathcal L_u K`,
the remaining polynomial is cubic. Every Bernstein coefficient is
strictly positive at both `u=3/100` and `u=463/10000`; the smallest
certified margin exceeds `1.93e-5`. Since the coefficients depend
affinely on `u`, the same holds throughout the closed energy interval.
Thus

\[
\mathcal L_u K\ge m''\quad(0\le x\le1). \tag{13}
\]

Extend `K` by the constant `5/8` on `[1,infinity)`. Equation (10)
implies `mathcal L_u K=25/24>=m''` there. At one the derivative
jumps down from a nonnegative value to zero, which has the favorable
sign for the operator's negative second derivative.

The maximum principle on the half-line, with boundary `k_u(0)=K(0)=0`,
therefore yields `k_u<=K`. For completeness, subtract
`epsilon(1+x^2)` from a purported positive difference `k_u-K`.
It now attains its positive maximum at a finite interior point, since
both functions are bounded. Moreover

\[
\mathcal L_u[\epsilon(1+x^2)]
=\epsilon[(5/3-u)+(11/3)x^2]>0.
\]

At a smooth positive maximum the differential inequality is impossible.
At the downward derivative jump of `K`, the difference's derivative
jumps upward, also preventing a strict maximum; a zero jump is handled
by the one-sided second-derivative argument. Let `epsilon` decrease to
zero. The same comparison with the constant lower barrier `-5/8`,
using (10) and its smaller boundary value at zero, gives

\[
-5/8\le k_u(x)\le313/500\qquad(x\ge0).
\]

Oddness of `k_u` now proves the global bound

\[
\|k_u\|_\infty\le313/500. \tag{14}
\]

## 5. Assembly and scope

Insert (14) into (7) and then (2):

\[
\|c_{3/5}(q)\|^2
\le\frac{11}{108}\left(\frac{313}{500}\right)^2\delta
=\frac{1077659}{27000000}\delta
\le\frac1{25}\delta.
\]

The last strict rational comparison is checked. The result uses no
upper or lower bound on `chi`, no dimension cutoff, and no hypothesis
that `D(q)>=0`. Combined with the earlier certificates, the available
central-energy content bound is

\[
\|c_{3/5}(q)\|^2\le
\min\{3\delta^{3/2},\ \delta/25,\ 1/2500\}.
\]

The complete tilted-sector theorem still needs the asserted relation
between this actual content and the signed same-variance deficit, or an
augmented remote certificate that bounds both simultaneously.
