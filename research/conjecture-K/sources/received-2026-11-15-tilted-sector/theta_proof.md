<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/theta_proof.md (file dated 2026-11-15 04:02). Only this line was added. -->
# Uniform tilted-sector curvature: analytic reduction and certificate contract

Agent-ID: codex-6e2b. 15 November 2026.

**Status: P+C.** The analytic reductions below are **P**. The directed-rounding
checker `theta_verify.cpp` has accepted all 256 scalar-envelope triples, the
angular inclusions, the tails, and both final matrix inequalities. Its output
is in `theta_results.txt`: 6,168 accepted rectangles, 12,335 visited rectangles,
maximum subdivision depth 24, and runtime 13.59 seconds. This proves
`Theta(3/10) <= 3/4`, with the analytic bridge given below. The independent
implementation audit has also passed: it reviewed the arithmetic and
analytic bridge, recompiled the checker, and replayed the full certificate
in approximately 13 seconds.
The input-generation procedure remains **N** provenance; acceptance of its
targets is now **C**. No new Grothendieck-constant bound follows from this
curvature estimate alone.

## 1. Definitions and target — P

Throughout,

\[
a=\frac{699}{1250},\quad b=\frac{179}{1250},\quad
d=\frac25,\quad R_0=\frac3{10},\quad W=\frac{23}{4},\quad
\alpha=\frac{137}{200}.
\]

Let `Z` be standard complex Gaussian, with planar density
`exp(-|z|^2)/pi`, and put

\[
T=|Z|^2,\quad A=T-d,\quad
F_\rho(Z)=Z(a+bT)+A\rho,\qquad
f(w,\rho)=\mathbb E|F_\rho(Z)+w|.
\]

The target is the real Hessian inequality

\[
D_\rho^2 f(w,\rho)\preceq \frac34 I_2
\quad(w\in\mathbb C,\ |\rho|\le R_0).                 \tag{1}
\]

All matrix comparisons in this note are in **Loewner order**: their difference
is positive semidefinite. They are not entrywise comparisons.

A simultaneous complex rotation of `Z`, `w`, `rho` and the direction preserves
the law of `Z`, the norm and Hessian eigenvalues. Hence assume `rho` is real and
nonnegative. Complex conjugation then permits the additional assumption
`Im w >= 0`. Neither reduction assumes `Re w >= 0`.

The constants are arranged so that

\[
\gamma=a-\frac{R_0^2}{3b}>0.
\]

For arbitrary real `k` with `|k| <= R_0`, every real `x` and `y >= 0`,

\[
D=a+b(y^2+3x^2)+2kx
 =a+by^2+3b\left(x+\frac{k}{3b}\right)^2-\frac{k^2}{3b}
 \ge\gamma+by^2>0.                                  \tag{2}
\]

The root and interval arguments below also hold on slightly enlarged boxes
whenever their displayed positive lower bound for `D` is checked.

## 2. A nonsingular scalar projection integral — P

For real `k,z` and `y >= 0`, let `x=x(k,z,y)` be the unique real root of

\[
P(x;k,z,y)=b x^3+kx^2+(a+by^2)x+k(y^2-d)+z=0.          \tag{3}
\]

Existence follows from the cubic's behavior at infinity, and uniqueness and
smooth dependence follow from `P_x=D>0`. Define

\[
\mathcal R(k,z)=\int_0^\infty
 \frac{(x(k,z,y)^2+y^2-d)^2\exp[-x(k,z,y)^2-y^2]}
 {a+b[y^2+3x(k,z,y)^2]+2kx(k,z,y)}\,dy.                \tag{4}
\]

This is the scalar function called `R(k,z)` in the checker discussion. The
script uses `d=2/5`; it is not an additional free parameter.

Write `n_theta=(cos theta,sin theta)`. Then

\[
\boxed{
 D_\rho^2 f(w,\rho)=\frac2\pi\int_0^\pi
 n_\theta n_\theta^{\mathsf T}
 \mathcal R\bigl(\rho\cos\theta,
       (\Re w)\cos\theta+(\Im w)\sin\theta\bigr)\,d\theta.}
                                                               \tag{5}
\]

**Proof of the factors and formula.** For every planar vector `X`,

\[
 |X|=\frac12\int_0^\pi|n_\theta\cdot X|\,d\theta.
\]

The second distributional derivative of the absolute value is `2 delta_0`.
Twice differentiating in `rho` therefore gives

\[
 \int_0^\pi n_\theta n_\theta^{\mathsf T}
 \mathbb E[A^2\delta_0(n_\theta\cdot(F_\rho(Z)+w))]\,d\theta.
\]

Rotate the coordinates of `Z` so that its first real coordinate is along
`n_theta`. Its projected argument is exactly (3), with
`k=rho cos theta` and `z=w dot n_theta`. Integrating out this real coordinate
at its unique root contributes `1/D`. The Gaussian density contributes
`1/pi`; the remaining integrand is even in `y`, contributing a factor of 2.
This gives (5).

The use of distributions here can equivalently be justified by replacing
the absolute value by a smooth convex approximation, integrating first in
the strictly monotone real coordinate, and passing to the limit. The
resulting projected density (4) is continuous, locally smooth in the
parameters, and integrable in `y` by (2) and the Gaussian tail in section 4.
Thus (5) is an ordinary finite Hessian, not merely a formal distributional
identity.

Changing `x` to `-x` in (3) gives the symmetry

\[
\mathcal R(-k,-z)=\mathcal R(k,z).                    \tag{6}
\]

As a normalization check, `x(0,0,y)=0`, and consequently

\[
\mathcal R(0,0)=\frac12\mathbb E\frac{(T-d)^2}{|Z|(a+bT)}.
\]

Since `(2/pi) integral_0^pi n n^T dtheta=I_2`, this agrees with the
direct Hessian at `(w,rho)=(0,0)`.

## 3. Root boxes and the squared-radius range — P

The eight-corner root enclosures used by the checker follow from separate
monotonicity, not from a numerical guess.

Implicit differentiation of (3) gives

\[
x_z=-\frac1D<0,\qquad
x_y=-\frac{2y(bx+k)}D,\qquad
x_k=-\frac{x^2+y^2-d}D.                              \tag{7}
\]

For fixed `k,z`, the sign of `bx+k` cannot change with `y`. Indeed,

\[
P(-k/b;k,z,y)=z-k(a/b+d)
\]

is independent of `y`, and `P` is strictly increasing in `x`. Thus `x_y`
has a fixed sign along each `y`-line.

For fixed `y,z`, the sign of `x^2+y^2-d` cannot change with `k`. If
`y^2 >= d`, this expression is nonnegative. Otherwise put
`r=sqrt(d-y^2)`. At the two thresholds,

\[
P(\pm r;k,z,y)=\pm(a+bd)r+z,
\]

independently of `k`. Strict monotonicity of `P` places its root either
inside `[-r,r]`, outside that interval on one fixed side, or exactly at one
threshold for every `k`. Thus `x_k` also has a fixed sign along each
`k`-line. A root at a threshold is constant along that line.

Consequently `x` is monotone separately in each of the three coordinates.
The monotonicity direction need not be the same on different parallel
lines. Nevertheless, its minimum and maximum on a rectangular box are
among the eight corners: hold two coordinates fixed and move the third
to an endpoint without decreasing the value; repeat for the remaining
coordinates. Apply the same argument to the minimum. Interval enclosures
of the eight corner roots therefore enclose every root in the box.

There is a tighter range argument for `t=x^2+y^2`:

\[
t_y=2x x_y+2y=\frac{2y(a+bt)}D\ge0.                  \tag{8}
\]

At each fixed `y`, the continuous image of the connected `(k,z)` rectangle
under `x` is an interval whose endpoints occur at its four corners. Hence,
if `[x_-,x_+]` is its exact root range, the minimum of `t` at that `y` is

\[
y^2+\operatorname{dist}(0,[x_-,x_+])^2,
\]

and the maximum is `y^2+max(x_-^2,x_+^2)`. By (8), evaluate the minimum at
the lower `y` endpoint and the maximum at the upper endpoint. Using
outward interval root enclosures only enlarges this range. This is the
justification for the lower- and upper-endpoint constructions in the
checker's `range` routine.

## 4. A uniform source tail — P+C

For `Y^2 >= d+2`, `y >= Y`, and any real root `x`, put `t=x^2+y^2`.
The function `(t-d)^2 exp(-t)` decreases for `t >= d+2`. Using (2),

\[
\begin{aligned}
\int_Y^\infty\frac{(t-d)^2e^{-t}}D\,dy
&\le\frac1b\int_Y^\infty
       \frac{(y^2-d)^2}{y^2}e^{-y^2}\,dy\\
&\le\frac1b\int_Y^\infty y^2e^{-y^2}\,dy\\
&\le\frac1b\left(\frac Y2+\frac1{4Y}\right)e^{-Y^2}.
\end{aligned}                                                    \tag{9}
\]

The second inequality uses `y^2 >= d/2`. For the last inequality, integrate
by parts and use `integral_Y^infty exp(-y^2)dy <= exp(-Y^2)/(2Y)`.
At `Y=5`, the right side is less than `2.5e-10`; the checker has verified
this final scalar comparison with directed intervals. The tail is
nonnegative and uniform over every
`k,z` in the permitted parameter range. No tail derivative is required
when enclosing the full integral by its truncated integral plus this
common interval `[0,2.5e-10]`.

## 5. The exterior region needs no numerical quadrature — P

For every `|rho| <= R_0`, every unit direction `v`, and every `|w| >= W`,

\[
D_\rho^2f(w,\rho)[v,v]
\le\frac{197911}{264660}<\frac34.                    \tag{10}
\]

Here is the complete bound, including the change of variables needed for
the source tail. The real Jacobian of `F_rho` is

\[
J_\rho(z)=(a+bt)\bigl(a+3bt+2\Re(\rho\bar z)\bigr)>0.
                                                               \tag{11}
\]

The second factor is at least `gamma`. The map is a global diffeomorphism.
For an elementary injectivity and surjectivity proof, set
`X=x+d rho` for the desired image `x`. Its inverse squared radius is the
unique nonnegative root of

\[
b^2t^3+(2ab-|\rho|^2)t^2+
 (a^2+2\Re(X\bar\rho))t-|X|^2=0.                    \tag{12}
\]

For `X != 0`, the coefficient signs are `+,+,+/-,-`, because
`2ab-R_0^2>0`; Descartes' rule and the signs at zero and infinity give one
positive root. Set `z=(X-t rho)/(a+bt)`; equation (12) gives `|z|^2=t`.
For `X=0`, only `t=0` is nonnegative. Equation (11) then supplies the
smooth inverse.

The pushforward of the weighted measure `A^2 d gamma` has density

\[
\delta_\rho(x)=
\frac{(t-d)^2e^{-t}}{\pi(a+bt)(a+3bt+2\Re(\rho\bar z))}.
                                                               \tag{13}
\]

The norm Hessian kernel in direction `v` is

\[
K_v(x)=\frac{1-(v\cdot x/|x|)^2}{|x|}
       =\frac{\sin^2(\arg x-\arg v)}{|x|}\quad(x\ne0).
\]

Thus the directional Hessian is the convolution of this nonnegative
kernel with (13), evaluated at `-w`.

Split the original source into `T <= 4` and `T > 4`. On the first part,

\[
|F_\rho(Z)|\le 2(a+4b)+R_0(4-d)=\frac{418}{125}.
\]

The total weighted mass is `E A^2=34/25`. Its tail mass is exactly

\[
m_4=e^{-4}\bigl[(4-d)^2+2(4-d)+2\bigr]
   =e^{-4}\frac{554}{25}.
\]

Using `54 < exp(4) < 55`, the core mass is at most `1316/1375`.
As `K_v(x)<=1/|x|`, its Hessian contribution is at most

\[
\frac{1316/1375}{23/4-418/125}=\frac{5264}{13233}.      \tag{14}
\]

On `t >= 4`, the numerator `(t-d)^2 exp(-t)` decreases, and the positive
lower bound

\[
(a+bt)(a+3bt-2R_0\sqrt t)
\]

for the Jacobian increases. The latter assertion follows by
differentiating its factors; in particular
`3b-R_0/sqrt(t) >= 3b-3/20 > 0`. The tail pushforward density is therefore
at most

\[
D_4=\frac{6/25}{\pi(381201/312500)},                  \tag{15}
\]

because `exp(-4)<1/54`, `(4-d)^2/54=6/25`, and
`(a+4b)(a+12b-4R_0)=381201/312500`. Its mass is at most `277/675`.

For any nonnegative planar density bounded by `D`, with mass at most `m`,

\[
\sup_w(K_v*\delta)(w)\le\sqrt{\frac{3\pi Dm}{2}}.     \tag{16}
\]

Indeed `area{K_v>lambda}=3pi/(8lambda^2)` and
`integral(K_v-lambda)_+=3pi/(8lambda)`. Hence the convolution is at most
`lambda m+3pi D/(8lambda)` for every positive `lambda`; minimize it.
Applying this to (15), the square of the tail bound is at most

\[
\frac{138500}{1143603}<\left(\frac7{20}\right)^2.
\]

Adding to (14) gives

\[
\frac{5264}{13233}+\frac7{20}
=\frac{197911}{264660}<\frac34.
\]

The elementary exponential and rational comparisons in this section are
finite scalar certificate obligations. For example, the degree-20
positive Taylor sum and its geometric remainder prove `54<exp(4)<55`.

## 6. Pairing signs and removing the remaining w,rho parameters — P

It remains to consider `|w| <= W`. In this region every projection
`z=w dot n` lies in `[-W,W]`.

Pair the angles `theta` and `pi-theta`, for `0 <= theta <= pi/2`.
Put `c=cos(theta)`, `s=sin(theta)`, and

\[
n_+=(c,s),\quad n_-=(c,-s),\quad k=\rho c\ge0,
\quad z_\pm=(\Re w)c\pm(\Im w)s.
\]

At `pi-theta`, the original parameters are `-k,-z_-` and its outer
product is `n_- n_-^T`. Symmetry (6) therefore makes (5) equal to

\[
\frac2\pi\int_0^{\pi/2}
 [n_+n_+^{\mathsf T}\mathcal R(k,z_+)
 +n_-n_-^{\mathsf T}\mathcal R(k,z_-)]\,d\theta.        \tag{17}
\]

Define suprema over closed scalar domains:

\[
\begin{aligned}
m(K)&=\sup\{\mathcal R(k,z):0\le k\le K,\ -W\le z\le W\},\\
\ell(K,h)&=\sup\{\mathcal R(k,z):0\le k\le K,\ -W\le z\le h\},\\
u(K,h)&=\sup\{\mathcal R(k,z):0\le k\le K,\ h\le z\le W\}.
\end{aligned}                                                    \tag{18}
\]

These definitions do not assume monotonicity of the function
`mathcal R` in either argument. The three suprema are nondecreasing in
`K`; `ell` is nondecreasing in its cutoff, while `u` is nonincreasing in
its cutoff, solely by set inclusion.

If `Re w <= alpha`, then `Im w >=0` gives `z_- <= alpha c`.
If `Re w >= alpha`, it gives `z_+ >= alpha c`. At equality either case
may be used. Also `k <= R_0 c`. Consequently the two fixed matrices

\[
\begin{aligned}
M_L&=\frac2\pi\int_0^{\pi/2}
 [m(R_0c)n_+n_+^{\mathsf T}
  +\ell(R_0c,\alpha c)n_-n_-^{\mathsf T}]\,d\theta,\\
M_U&=\frac2\pi\int_0^{\pi/2}
 [u(R_0c,\alpha c)n_+n_+^{\mathsf T}
  +m(R_0c)n_-n_-^{\mathsf T}]\,d\theta
\end{aligned}                                                    \tag{19}
\]

bound the Hessian, respectively in those two cases. Replacing a scalar
coefficient by an upper bound is legitimate because the matrix it
multiplies is a positive semidefinite outer product. In particular, an
off-diagonal entry need not increase under this operation. This is why
entrywise matrix comparison would be incorrect.

## 7. Rational candidate domains and exact angular integration — P contract

The input file has `N=256`, denominator `Q=1000000`, and integer rows

`index Kint Lcutint Ucutint mtargetint ltargetint utargetint`.

For row `i`, define

\[
\theta_0=\frac{i\pi}{2N},\quad
\theta_1=\frac{(i+1)\pi}{2N},\quad
K_i=Kint/Q,\quad L_i=Lcutint/Q,\quad U_i=Ucutint/Q,
\]

and rational targets `m_i,ell_i,u_i` from the final three integers.
The checker must establish both the trigonometric inclusions

\[
K_i\ge R_0\cos\theta_0,\qquad
L_i\ge\alpha\cos\theta_0,\qquad
U_i\le\alpha\cos\theta_1                         \tag{20}
\]

and the three full-domain integral bounds

\[
m(K_i)\le m_i,\qquad
\ell(K_i,L_i)\le\ell_i,\qquad
u(K_i,U_i)\le u_i.                                  \tag{21}
\]

Because cosine decreases on this interval, (20) and set inclusion make
these targets valid over the entire angular bin. No assumed monotonicity
of `mathcal R`, no sampled angular maximum, and no interpolation between
angular samples are used.

Put `Delta=theta_1-theta_0`, and define the exact matrices

\[
W_i^\pm=\int_{\theta_0}^{\theta_1}n_\pm n_\pm^{\mathsf T}\,d\theta
=\begin{pmatrix}
\frac\Delta2+\frac{\sin2\theta_1-\sin2\theta_0}{4}
&\displaystyle\pm\frac{\sin^2\theta_1-\sin^2\theta_0}{2}\\
\displaystyle\pm\frac{\sin^2\theta_1-\sin^2\theta_0}{2}
&\frac\Delta2-\frac{\sin2\theta_1-\sin2\theta_0}{4}
\end{pmatrix}.                                                    \tag{22}
\]

They are positive semidefinite by their integral definition. Then

\[
M_L\preceq\widehat M_L=
 \frac2\pi\sum_i(m_iW_i^++\ell_iW_i^-),\qquad
M_U\preceq\widehat M_U=
 \frac2\pi\sum_i(u_iW_i^++m_iW_i^-).                 \tag{23}
\]

The final checks are

\[
\widehat M_L\preceq\tfrac34 I_2,\qquad
\widehat M_U\preceq\tfrac34 I_2.                     \tag{24}
\]

For example, strictly positive diagonal entries and determinant of each
`(3/4)I_2-widehat M` suffice. Directed interval evaluation must establish
these signs for the exact matrices (22)-(23). Numerical eigenvalues alone
are not a certificate.

In a branch-and-bound implementation of (21), the accepted boxes must
cover the full closed domains in (18). Each accepted upper bound must
include the uniform tail (9). Floating Newton iterations may propose a
root bracket, but acceptance requires interval signs on its two endpoints;
strict monotonicity (2) then proves enclosure. An exhaustive successful
run, rather than the particular adaptive partition chosen, supplies the
finite certificate.

### The implemented scalar enclosure and domain-coverage logic — P

For clarity, let `F(k,z)` denote (4) truncated to `0 <= y <= 5`, and let
`g(k,z,y)` denote its integrand. At a parameter point `(k_c,z_c)`, the
checker applies the composite midpoint rule to `g`, adding on each
`y`-panel a symmetric remainder interval of radius

\[
\frac{h^3}{24}\sup_{\text{panel}}|\partial_y^2 g|.
\]

The `second` routine evaluates this analytic second derivative by implicit
differentiation of (3); it does not use finite differences. The midpoint-rule
panels have widths `5/128` or `5/512`; the derivative integral panels likewise
use power-of-two denominators. Their endpoints and midpoints are exact dyadic
numbers. Root and squared-radius enclosures use section 3.

For a full parameter rectangle and a center `(k_c,z_c)` within it, decompose

\[
F(k,z)-F(k_c,z_c)
=[F(k,z)-F(k_c,z)]+[F(k_c,z)-F(k_c,z_c)].
\]

The first difference is enclosed by an interval bound on `F_k` over the
rectangle multiplied by `k-k_c`. For the second difference, use `F_z` at
the center and a second-order Taylor remainder bounded by

\[
\tfrac12\sup_{\text{rectangle}}|F_{zz}|\,(z-z_c)^2.
\]

The checker obtains these derivative integral enclosures by integrating
pointwise interval enclosures on the source panels. Thus it is legitimate
to bound `F_k` and `F_zz` on a larger rectangle than the particular line
segments used in the decomposition. The explicit formula for the second
`z` derivative, with `N(t)=(t-d)^2 exp(-t)` and `E=6bx+2k`, is

\[
g_{zz}=\frac{2N'+4x^2N''}{D^3}
 -\frac{6xE N'+6bN}{D^4}+\frac{3E^2N}{D^5}.
\]

Finally add the common tail interval `[0,2.5e-10]`. Even though the code
adds this interval when constructing the center integral, the mathematical
enclosure is `F(k,z)+[0,2.5e-10]` for every parameter point. No derivative
of the tail is taken or needed.

The adaptive atlas starts with the containing rectangle
`[0,max_i K_i] x [-W,W]` and bisects it into closed child rectangles with
a shared boundary. For each atlas box, the implementation takes the
minimum target over **every query domain that can intersect that box**.
It accepts the entire box only if its integral upper bound is below that
minimum. This is stronger than requiring the bound only on each
intersection. To see coverage explicitly, take any point in any query
domain and an accepted box containing it. That box activates the query's
target: its lower `k` endpoint is below the query's upper endpoint, and its
appropriate `z` endpoint passes the lower- or upper-cutoff intersection
test. The accepted cap is therefore below that query's target at the
chosen point. Outward interval endpoint comparisons may activate extra
queries, but cannot omit a query containing the point. An empty pending
stack proves all query domains have been covered. There is no assumption
that the upper-envelope targets are nested or monotone.

## 8. Verified conclusion and candidate provenance

**P+C.** The checker has passed obligations (20), (21), (24), and the scalar
tail and exterior comparisons. Equations (17)-(24) prove (1) on
`|w| <= 23/4`; equation (10) proves it on the complementary region.
Rotational and reflection invariance restore all complex `rho` with
`|rho| <= 3/10`, all complex `w`, and every real unit Hessian direction.
Hence `Theta(3/10) <= 3/4`.

The successful run's outward matrix enclosures, displayed here with
further outward decimal rounding, are

| Matrix entry | Left matrix | Right matrix |
|---|---|---|
| `(1,1)` | `[.7436596295745, .7436596295754]` | `[.7453222484900, .7453222484910]` |
| `(2,2)` | `[.6072263469871, .6072263469880]` | `[.6317338452590, .6317338452600]` |
| `(1,2)=(2,1)` | `[.01525583337398, .01525583337403]` | `[-.001410996357077, -.001410996357075]` |

It checked positive diagonal entries and determinant of the differences
from `(3/4)I_2` directly. It did not use a floating eigenvalue test.

**N provenance, not part of acceptance.** `theta_candidates.txt` was
generated in this session, under Agent-ID codex-6e2b, using Python 3.12,
NumPy and SciPy. The scalar integral was approximated by 180-point
Gauss-Legendre quadrature on `0 <= y <= 7`. A `k` grid of spacing `0.001`
was rounded upward at the domain endpoint. The search in `z` used a
161-point preliminary grid on `[-5.75,5.75]`, refined sampled local maxima
with scalar optimization, and included the applicable one-sided cutoff
boundary. Every proposed bound then received additive padding `0.002`
and upward rounding to `1e-5`. The integer domain endpoints use nominal
outward rounding to `1e-6` of floating trigonometric values; (20) must
independently validate their directions. A search can miss a maximum, so
none of this provenance substitutes for (21).

Integrating these rational candidate targets with floating trigonometry
gave

\[
\widehat M_L\approx
\begin{pmatrix}.743659629575&.015255833374\\
 .015255833374&.607226346988\end{pmatrix},\qquad
\lambda_{\max}\approx.745344709300,
\]

\[
\widehat M_U\approx
\begin{pmatrix}.745322248490&-.001410996357\\
 -.001410996357&.631733845260\end{pmatrix},\qquad
\lambda_{\max}\approx.745339773199.
\]

These two original displays remain **N** approximations. They indicated
approximately `0.00465` remaining margin when the certificate was proposed;
the verified theorem instead uses the independent interval enclosures
reported above. In particular, the `utarget` column is not monotone with the
row index; an implementation must not assume it is.

## What a reviewer should check first

1. The factor `2/pi` in (5), and the simultaneous sign reversal in (6)
   when pairing the second quadrant in (17).
2. The separate root monotonicity and the strict denominator lower bound,
   including every enlarged interval box used by the implementation.
3. The scalar domains in (21): all `k` between zero and the upper endpoint,
   all permitted `z`, and the nonnegative source tail must be included.
4. The directions of the three angular inclusions in (20), especially
   `U_i <= alpha cos(theta_1)`.
5. The positive-semidefinite, rather than entrywise, matrix comparison
   behind (19) and (23), and interval signs for the final determinants.
6. The exterior density tail estimate (13)-(16), which avoids leaving an
   unbounded `w` domain unchecked.

