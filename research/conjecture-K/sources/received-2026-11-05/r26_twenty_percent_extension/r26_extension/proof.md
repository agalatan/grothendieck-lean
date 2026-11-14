<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_twenty_percent_extension/r26_extension/proof.md (file dated 2026-11-05). Only this line was added. -->
# R26: a uniform twenty-percent coefficient neighborhood of the Wick endpoint

5 November 2026. Analytic proof with a completed exact dyadic certificate.
This extends the supplied p <= u/16 theorem to p <= u/5. It does not close the
remaining mixed family or general Conjecture K.

## Statement

All complex Gaussians are standard, with E|X|^2 = 1. Let

\[
L=Z(a+b|Z|^2),\qquad
F(q)=\mathbb E|L+q|+\mathbb E|L-q|,
\qquad B(v)=2\mathbb E|L+\sqrt v W|,
\]

\[
f(z)=F_A(z)=\mathbb E_Z[(|Z|^2-1)\operatorname{ph}(L+z)]
             =z g(|z|^2),\qquad
C(q)=\|\Pi_{1,0}f(q)\|_2.
\]

The projection is onto the full remote holomorphic first chaos. The visible
variable Z is independent of all remote variables.

The theorem holds for each of these exact rows:

| Row | epsilon | a | b |
|---|---|---|---|
| peak | 1891/2500 | 699/1250 | 179/1250 |
| flank | 149/200 | 14/25 | 1467/10000 |
| upper | 1891/2500 | 573/1000 | 19/125 |

Let X be independent of Y, let P=P(Y) be any complex random variable satisfying
E P=0 and E|P|^2=p<infinity, and set

\[
q=X[c(|X|^2-2)+P],\qquad u_0=2|c|^2,\qquad u=u_0+p.
\]

If

\[
\frac3{100}\le u\le\frac{463}{10000},
\qquad 0\le p\le\frac u5,
\]

then, with Delta=B(u)-F(q),

\[
\boxed{\quad
\Delta>0,\qquad
C(q)^2\le\frac{47}{200}\Delta
=0.235\,\Delta<0.24\,\Delta.
\quad}                                                     \tag{1}
\]

The only distributional assumptions on P in this theorem are independence
from X, centeredness and a finite second moment. For the cubic-chaos
application P is a centered charge-zero quadratic.

Using the supplied shell-cost estimate with kappa=6/25, (1) gives

\[
\boxed{\quad
\Lambda(q+(T-1)U)
\le B(u)-\frac u\varepsilon-\frac1{48}\Delta
\le S,\qquad T=|Z|^2,
\quad}                                                     \tag{2}
\]

whenever that estimate applies, in particular in its stated range
E|U|^2<=0.0113 for the intended cubic family. Here
S=sup_{v>=0}[B(v)-v/epsilon] for the corresponding row. This certificate does
not reprove the supplied shell-cost theorem.

## 1. A sharper global directional Hessian bound

We use the inherited, exact complete-monotonicity facts

\[
\phi(s):=2\mathbb E_Z|L+\sqrt s|,
\qquad \phi'\ \text{and}\ -g\ \text{are completely monotone}.
\]

A derivation is recalled below. Write

\[
-g(s)=\int_0^\infty e^{-ts}\,\nu(dt).
\]

For the real map f_t(z)=z exp(-t|z|^2), we first prove

\[
\sup_{z,\ |h|=1}|D^2 f_t(z)[h,h]|\le2\sqrt t.                \tag{3}
\]

Rotation reduces to h=1. Put s=t|z|^2 and v=t(Re z)^2, so 0<=v<=s.
Direct differentiation gives

\[
\frac{|D^2 f_t(z)[1,1]|^2}{t}
=e^{-2s}\{4s+16(2-s)v(1-v)\}.                              \tag{4}
\]

For 0<=s<=1/2 the right-hand braces are maximized at v=s and equal
4s(3-2s)^2. The fourth Taylor polynomial of exp(2s), minus
s(3-2s)^2, is

\[
P_4(s)=1-7s+14s^2-\frac83s^3+\frac23s^4>0
\quad(0\le s\le1/2).
\]

Positivity is certified by its degree-four Bernstein coefficients:

| Interval | Bernstein coefficients |
|---|---|
| [0,1/4] | 1, 9/16, 13/48, 11/96, 11/128 |
| [1/4,1/2] | 11/128, 11/192, 5/32, 3/8, 17/24 |

For 1/2<=s<=2, use v(1-v)<=1/4 to bound (4) by 8/e<4.
For s>=2 the maximum is at v=s and is at most
16s^3 exp(-2s)<=128/e^4<4. The rational lower bound e>8/3
suffices for both comparisons. This proves (3), including t=0.

Integrating (3) and applying Cauchy--Schwarz to the positive measure gives

\[
\sup_{z,\ |h|=1}|D^2f(z)[h,h]|
\le2\int\sqrt t\,\nu(dt)
\le2\sqrt{(-g(0))g'(0)}.                                   \tag{5}
\]

The scalar checker freshly evaluates the required constants, with Arb
enclosures, at each row:

\[
-g(0)<\frac{21}{25},\qquad g'(0)<\frac{217}{100}.             \tag{6}
\]

The integral of sqrt(t) is finite by these two moment bounds, which also
justifies differentiating the mixture in (5).

## 2. The centered perturbation costs at most (9/5)p

Multiplying q by a constant phase does not change F or C, so take c>=0.
Let R=|X|^2 and q_0=cX(R-2). Conditional on X, the linear Taylor term in XP
has mean zero. Formula (5) gives

\[
\left|\mathbb E_P[f(q_0+XP)-f(q_0)]\right|
\le \sqrt{(-g(0))g'(0)}\,Rp.
\]

For every fixed Y and R, rotating X rotates q and f(q) by the same phase.
Consequently all Y-direction first-chaos coefficients vanish. Thus the
projection norm is exactly the absolute value of the X coefficient, and

\[
\begin{aligned}
C(q)
&\le C(q_0)+p\,\mathbb E R^{3/2}\sqrt{(-g(0))g'(0)}\\
&=C(q_0)+\frac{3\sqrt\pi}{4}\sqrt{(-g(0))g'(0)}\,p\\
&\le C(q_0)+\frac95p.                                      \tag{7}
\end{aligned}
\]

For the last bound use (6), pi<22/7, and the exact rational comparison

\[
\frac9{16}\frac{22}{7}\frac{21}{25}\frac{217}{100}
<\left(\frac95\right)^2.
\]

This improves the supplied perturbation constant 4 to 9/5.

## 3. Keep the full concavity lower bound for the deficit

Independence and E P=0 give

\[
\mathbb E_P|c(R-2)+P|^2=c^2(R-2)^2+p.
\]

Since phi is concave,

\[
F(q)\le
\overline F(c,p):=
\mathbb E_R\phi\!\left(R[c^2(R-2)^2+p]\right).
\]

Define

\[
\overline D(c,p)
=B(2c^2+p)-\overline F(c,p).
\]

Then

\[
\Delta\ge\overline D(c,p).                                 \tag{8}
\]

No further linearization in p is made. In particular, we do not use the
lossier lower bound Delta_0-(7/2)up.

The remaining two-dimensional numerical assertion is

\[
\boxed{\quad
\left(C(cX(R-2))+\frac95p\right)^2
<\frac{47}{200}\overline D(c,p)
\quad}                                                     \tag{9}
\]

throughout

\[
0.03\le2c^2+p\le0.0463,\qquad 0\le p\le c^2/2.
\]

The last condition is exactly p<=u/5. In this region 2c^2>=0.024;
the certificate covers this enlarged pure-Wick variance range directly.
It does not assume that the earlier pure-Wick certificate, which starts at
0.0279, applies below its domain.

Equations (7)--(9) prove (1). They also prove Delta>0, because the right-hand
side of (9) is strictly positive.

## 4. Exact certificate for (9)

The file verify_endpoint.mjs regenerates all of its tables from elementary
integer arithmetic. Its input consists of the three rational profile rows.
There is no stored floating-point quadrature table.

The scales are

\[
D=2^{20},\quad M=2^{30},\quad L_{\rm accum}=2^{13},
\quad N_{\rm angle}=2^{16}.
\]

Both visible and remote radii x=sqrt(R) are partitioned at spacing 1/2048
on [0,5]. The coefficient c is partitioned at spacing 1/8192; p is
partitioned at spacing 1/32768. Cells are retained whenever they can meet
the theorem domain; all domain exclusion and clipping comparisons are
integer comparisons.

For each coefficient cell the checker bounds C(q_0) above by amp/D.
For each retained (c,p) cell it computes:

- ph/D, an upper bound for p;
- a Gaussian-potential lower bound at the lower total variance;
- an upper bound for the concavity surrogate Fbar(c,p).

The common baseline phi(0) is subtracted from both potentials. Their
difference slack/D is a lower bound for Dbar(c,p) throughout the cell.

It then verifies, with BigInt integers, the strict inequality

\[
25\cdot235\,D\,\mathrm{slack}
-1000(5\,\mathrm{amp}+9\,\mathrm{ph})^2>0.                   \tag{10}
\]

This is exactly the desired comparison (9) for the outward bounds, since
(5 amp+9 ph)/(5D) bounds its unsquared left-hand quantity.

### Angular and radial enclosures

Let j(r,y) be the uniform angular mean of |r+y exp(i theta)|. With
m=max(r,y), l=min(r,y),

\[
j(r,y)=m\sum_{n\ge0}b_n(l/m)^{2n},
\quad b_0=1,\quad b_1=\tfrac14,\quad
b_n=b_{n-1}\left(\frac{2n-3}{2n}\right)^2.
\]

The bound b_n<=4/(27n^3), n>=2, follows by induction. It bounds the norm
series tail and its derivative tail after 96 terms. All coefficients and
powers have outward BigInt bounds. Monotonicity of the norm increment and
phase derivative then encloses every angular table cell, including r=y.

Radial cell masses are differences of exp(-x^2). The signed visible
(T-1) weights have the exact primitive -x^2 exp(-x^2). Exponentials are
enclosed by alternating Taylor bounds at x^2/32, followed by five
outward-rounded squarings. The positive and negative visible phase weights
are summed separately to retain valid signed bounds for C(q_0).

The amplitude grid has spacing 1/4096 up to 1, 1/1024 from 1 to 4, and
1/128 from 4 to 20. Function monotonicity selects lower and upper endpoints
of each cell. There is no unverified interpolation assumption.

All scalar square roots in the Node checker are integer-root guesses
corrected and verified by exact integer square comparisons. The acceptance
test and reported ratio ceilings are BigInt computations. Products used
as Number integers stay within the safe-integer range; accumulator products
are checked at runtime.

### Omitted tails

For a radius x with density 2x exp(-x^2),

\[
\mathbb E[x; x>5]\le\frac{51}{10}e^{-25},
\qquad
\mathbb E[x^3; x>5]\le\frac{2653}{20}e^{-25}.
\]

The whole parameter grid has c<4/25 and sqrt(p)<3/25.
Thus the omitted Fbar increment is bounded by

\[
2\left[\frac4{25}\frac{2653}{20}
       +\frac3{25}\frac{51}{10}\right]e^{-25}
<44e^{-25}<D^{-1}.
\]

The pure content tail is at most E[x;x>5], because |f(z)|<=E|T-1|=2/e<1.
The visible norm-gain tail is at most 40 exp(-25), and its positive signed
phase tail at most 25 exp(-25). The auxiliary Gaussian tails are smaller.
The added unit allowances cover all these tails. The last strict bound is
checked rationally using e>8/3:

\[
44(3/8)^{25}<2^{-20}.
\]

### Completed results

| Row | Retained parameter cells | Certified ratio ceiling | Minimum integer margin in (10) |
|---|---:|---:|---:|
| peak | 64,216 | 0.234730 | 62,124,207,000 |
| flank | 64,216 | 0.234778 | 50,900,223,000 |
| upper | 64,216 | 0.233344 | 364,430,767,000 |

These ceilings concern the conservative perturbation/concavity bound
in (9), not a sampled approximation to the actual content ratio.

## 5. Scalar kernel inputs and their replay

For completeness, let t=t(s) invert s=t(a+bt)^2. Lagrange inversion and
Euler's beta integral give

\[
t'(s)=a^{-2}\,{}_2F_1(2/3,4/3;3/2;-27bs/(4a^3)),
\]

which is completely monotone. Therefore t is a Bernstein function, and
both exp(-t(s)) and exp(-t(s))/(a+bt(s))^2 are completely monotone.
The first is the radial survival function of L, so L is a Gaussian scale
mixture. This yields complete monotonicity of phi' and hence concavity
of phi.

Writing the Laplace measure of the second function as mu gives

\[
J(v)=2\mathbb E_R[Rg(vR)]
=-\frac{\sqrt\pi}{2}
\int\lambda^{-1/2}(1+\lambda v)^{-3/2}\,\mu(d\lambda).
\]

Gamma integration, followed by uniqueness of the Laplace transform, yields

\[
-g(s)=\frac{\sqrt\pi}{4}\int\lambda^{-1/2}
{}_1F_1(3/2;2;-\lambda s)\,\mu(d\lambda).
\]

Euler's beta integral represents each hypergeometric factor as a positive
mixture of exponentials. This proves the representation used in (5).

The constants in (6) are evaluated independently of any inherited JSON
kernel tables. The identities used are

\[
J(0)=\frac{\sqrt\pi}{b}
-\left(1+\frac ab\right)
\frac{\pi e^{a/b}\operatorname{erfc}(\sqrt{a/b})}{\sqrt{ab}},
\qquad -g(0)=-J(0)/2,
\]

\[
g'(0)=\frac{J'(0)}4
=\frac38\int_0^\infty e^{-x^2}
\frac{a+bx^2+2b}{(a+bx^2)^4}\,dx.
\]

The file check_constants.py uses python-flint at 100-bit precision.
It integrates J'(0) on [0,8] with Arb and adds a 10^(-20) tail allowance.
For these rows the integrand for J'(0), on x>=8, is bounded by
24(1+x^2)exp(-x^2), whose integral is at most
(393/4)exp(-64)<10^(-20). Thus the stored log is reproducible without
trusting previously generated kernel values.

The same script verifies the Bernstein coefficients, all rational scalar
comparisons, and the final shell factor:

\[
1-\frac{47/200}{6/25}=\frac1{48}.
\]

## Replay and remaining scope

From this directory, run:

    node verify_endpoint.mjs
    python check_constants.py

The first command needs Node 20 or later and no packages. The second needs
python-flint. Successful logs are included. This is a paper proof with
rigorous computational inputs, not a Lean formalization.

The proved mixed region is p<=u/5. The remaining R26 region is
p>u/5 with c!=0; the pure-P endpoint c=0 is covered by the prior
Gaussian-factor theorem. General six-shell mixtures are not covered here.
The file remaining_r26.md records an exact integrated-deficit reduction
for the remaining region, without claiming that its required envelope has
been certified.
