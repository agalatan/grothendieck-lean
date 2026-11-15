<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/secant_audit_math.md (file dated 2026-11-15 05:17). Only this line was added. -->
# Independent secant-certificate reductions

Agent-ID: **codex-6e2b**. 15 November 2026.

**Status:** the reductions below are **P**. The complete compact
certificate has now passed, as recorded in `secant_core_results.txt` and
`secant_audit_results.md`, so the global secant theorem is **P+C**. All
parameters are those of the peak row, with `s=3/5`, `A=T−2/5`, and
`L=Z(a+bT)`. The review's numerical evidence remains **N**.

## 1. The target and convex interpolation

Rotate the remote increment to a nonnegative real number `rho`, and reflect
so that `Im(w)>=0`. Write

\[
f(w,\rho)=\mathbb E_Z|L+w+A\rho|,\quad
f_0(w)=f(w,0),\quad b_0(w)=\partial_\rho f(w,0),
\]
\[
\operatorname{Rem}(w,\rho)=2[f(w,\rho)-f_0(w)-\rho b_0(w)],
\quad G(w,\rho)=\operatorname{Rem}(w,\rho)-S\rho^2,
\quad S=13/20.
\]

The function `f` is jointly convex in the three real variables
`(Re(w),Im(w),rho)`, since its integrand is a norm of an affine function.
Let `I` be the trilinear interpolation operator on a rectangular box, and
put `h(w,rho)=f0(w)+rho b0(w)`. Jensen's inequality gives `f<=I f`, so

\[
G\le I G+2(Ih-h)+S(I\rho^2-\rho^2).                 \tag{1}
\]

The existing profile results imply

\[
\|D_w^2 f_0\|_{\rm op}\le j_0=I_0/2,
\qquad \|D_w^2 b_0\|_{\rm op}\le1.                  \tag{2}
\]

For the second assertion, `b0` is the real component of the tilted phase
response; its linear subtraction has zero Hessian. The already certified
radial tensor metric bound `N_Phi<=1/3` means

\[
\|D^2\Phi(w):D\|^2\le\tfrac13[(\operatorname{tr}D)^2+2\|D\|_F^2]
\]

for every real symmetric matrix `D`. Taking `D=v v^T` with `|v|=1`
gives `||D²Phi[v,v]||<=1`, and taking its real component proves (2).

Interpolation in `rho` is exact on `h`. At every fixed `rho` in the box,
its Hessian in `w` has operator norm at most `j0+rho_hi`. The elementary
one-dimensional interpolation error bound, applied in each `w` coordinate,
therefore gives

\[
\boxed{G\le\max_{\text{eight corners}}G+
 \frac{j_0+\rho_{\rm hi}}4(\Delta x^2+\Delta y^2)
 +\frac S4\Delta\rho^2.}                             \tag{3}
\]

The factor `1/4` in the first error term includes the factor 2 in (1).
The last term uses exactly `I rho²−rho²<=(Delta rho)²/4`.
Thus a box can be accepted by rigorous corner function values and the
explicit quadratic interpolation allowance. No fourth derivative through
a fold of the shifted visible map is required.

## 2. A nonnegative ring decomposition

Let

\[
C(t)=\mathbb E_\theta|e^{i\theta}+t|,\quad g=C',\quad j(t)=g(t)/t,
\quad j(0)=1/2.
\]

For fixed source `T`, set `ell=sqrt(T)(a+bT)`, `h=A rho`,
`r0=|w|`, `r1=|w+h|`, `a0=r0/ell`, and `a1=r1/ell`.
The ring contribution to half the remainder is

\[
M(\ell,r_1)-M(\ell,r_0)-h\frac{\operatorname{Re}w}{r_0}g(a_0).
\]

With the usual continuous interpretation at `r0=0`, it equals

\[
\boxed{\ell D_C(a_1,a_0)
 +\frac{h^2-(r_1-r_0)^2}{2\ell}j(a_0),}\tag{4}
\]

where `D_C(b,a)=C(b)−C(a)−g(a)(b−a)` is the scalar Bregman remainder.
Both terms are nonnegative. To verify (4), use

\[
r_1-r_0-h\frac{\operatorname{Re}w}{r_0}
 =\frac{h^2-(r_1-r_0)^2}{2r_0}
\]

and `|r1−r0|<=|h|`. This representation avoids subtracting two large norm
expectations when evaluating the remainder at a fixed corner.

The circle-mean binomial series has positive coefficients
`c_k=binom(1/2,k)^2`:

\[
C(t)=1+\sum_{k\ge1}c_k t^{2k}\quad(0\le t\le1),
\qquad
C(t)=t+\sum_{k\ge1}c_k t^{1-2k}\quad(t\ge1).
\]

Every nonlinear monomial in either representation is convex. Its
Bregman remainder is nonnegative and can be evaluated without subtracting
nearby powers. For positive integer `p>=2`,

\[
b^p-a^p-pa^{p-1}(b-a)
 =(b-a)^2\sum_{j=0}^{p-2}(j+1)a^j b^{p-2-j}.
\]

For negative integer exponent `−m`, `m>=1`,

\[
b^{-m}-a^{-m}+ma^{-m-1}(b-a)
 =\frac{(b-a)^2}{a^{m+1}b^m}
    \sum_{j=0}^{m-1}(j+1)a^{m-1-j}b^j.
\]

If the interval crosses 1, split with the exact identity

\[
D_C(b,a)=D_C(b,1)+D_C(1,a)+(b-1)[g(1)-g(a)],
\]

whose three terms are nonnegative when 1 lies between `a` and `b`.
One must retain explicit series tails. In particular, the divided
quantity `D_C(b,a)/(b−a)²` is unbounded as `a,b` approach 1 together;
`D_C` itself stays finite. No uniform ring Hessian bound is valid.

## 3. A root-based positive-part alternative

For the projection direction `n_theta=(cos theta,sin theta)`, put
`k=rho cos theta`, `z=Re(w)cos theta+Im(w)sin theta`. In visible real
coordinates `(x,y)`, set

\[
P_k(x)=b x^3+kx^2+(a+by^2)x+k(y^2-d)+z,\quad d=2/5.
\]

The scalar identity

\[
|u+v|-|u|-v\operatorname{sign}(u)
 =2|u+v|\,\mathbf1_{u(u+v)<0}
\]

and `|v|=(1/2)int_0^pi |n_theta·v| dtheta` give

\[
\boxed{\operatorname{Rem}(w,\rho)=\frac4\pi
\int_0^\pi\int_0^\infty e^{-y^2}
\int_{P_0(x)P_k(x)<0}|P_k(x)|e^{-x^2}\,dx\,dy\,d\theta.}\tag{5}
\]

The inner integral is nonnegative and consists of intervals whose
endpoints are the unique real root of `P0` and all real roots of `Pk`.
A primitive of `Pk(x)e^{-x²}` is

\[
\frac{\sqrt\pi}{2}[z+k(y^2+1/2-d)]\operatorname{erf}(x)
 -\frac12[a+b(x^2+y^2+1)+kx]e^{-x^2}.
\]

This removes the singular Jacobian denominator that appears in the
pointwise Hessian. A rigorous implementation must enclose all real roots,
including multiple roots and three-root regions. The current convex
interpolation plan (section 1) is simpler because it needs only the
one-dimensional circle-mean source integral; (5) is an alternative, not
an additional certificate obligation.

## 4. Elementary exterior bounds

For every nonzero complex `v` and any `h`, concavity of the square root gives

\[
2\left(|v+h|-|v|-\Re\frac{\overline v h}{|v|}\right)
 \le\frac{|h|^2}{|v|}.
\]

Therefore, uniformly in every amplitude `rho`,

\[
\operatorname{Rem}(w,\rho)
 \le\rho^2\mathbb E\frac{A^2}{|L+w|}.                \tag{6}
\]

This is a valid route to an exterior bound in `|w|`; an exterior Hessian
bound restricted to small amplitudes alone would not suffice. Separately,
`|b0(w)|<=M=E|A|` and the triangle inequality imply

\[
\operatorname{Rem}(w,\rho)\le4M\rho.
\]

Consequently `rho>=5` is already covered by `S=13/20`, because the proved
`M<3/4` gives `4M/rho<3/5<13/20`. The finite-amplitude agent owns the
sharper exterior and small-amplitude certificates.


## 5. Audit of the implemented point quadrature

The independent audit read `secant_verify.cpp` and checked its complete
source integration and parameter interpolation logic. For each source
cell, exponential mass and conditional mean are enclosed outward. The
circle mean is jointly convex in its radius and center, nondecreasing in
its nonnegative radius, and 1-Lipschitz in that radius. These properties
justify the implemented Jensen lower bounds, chord upper bounds on the
convex part of `ell`, tangent upper bounds on the concave part, and the
explicit second-derivative allowance on an inflection-crossing cell.
The first source cell uses its exact exponential mass; the infinity tail
uses explicit exponential moments. Refinement replaces stored lower and
upper cell bounds using directed rounding.

The audit also checked the revised radial-profile consumer. It uses
rational node intervals from the exact integer numerators and scale,
retains every intersecting interpolation cell, and adds the bound
`(R_hi-R_lo)^2/8` from `|Fraw''|<=1`. It enforces the table's radius scope
`R<=6`, using the exterior theorem outside it.

An independent strict-flag compilation and three rigorous point checks
succeeded. Their enclosures contain independently computed numerical
values from adaptive elliptic-integral quadrature. This comparison is a
smoke check; rigor comes from the analytic and interval audit. The compact
parameter cover subsequently completed successfully: 102,104 accepted
boxes, 204,207 visits, maximum depth 27, and 153.72 seconds. The separate
end-to-end replay subsequently passed as well, reproducing the same cover
in 104.80 seconds; see `results.txt`.

Separately, the central-energy content certificate in
`secant_content_verify.py` was independently audited and replayed with
exit zero. The source/tail enclosures, rational Hermite supersolution,
Bernstein residuals, half-line maximum principle, and angular norm bound
prove `C(q)^2 <= (1077659/27000000) delta <= delta/25` for
`3/100 <= u <= 463/10000`, without a restriction on dimension or `chi`.
This content result does not depend on acceptance of the secant cover.
