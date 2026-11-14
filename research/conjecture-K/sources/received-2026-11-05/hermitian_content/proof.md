<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/hermitian_content/proof.md (file dated 2026-11-05). Only this line was added. -->
# A content theorem for an arbitrary Hermitian spectrum

5 November 2026. Status: analytic proof plus independently replayable rigorous
numerical enclosures. This is not a Lean theorem and does not prove general
Conjecture K.

## The result

Use standard complex Gaussians, normalized by E|Z|² = 1. Put

\[
T=|Z|^2,\quad L=Z(a+bT),\quad
F(q)=\mathbb E|L+q|+\mathbb E|L-q|,
\quad B(v)=2\mathbb E|L+\sqrt v W|,
\]

where W is independent standard complex Gaussian. Define

\[
F_A(q)=\mathbb E_Z[(T-1)\operatorname{ph}(L+q)].
\]

The following three profiles are certified:

| row | epsilon | ell | b | a = ell - 2b |
|---|---:|---:|---:|---:|
| peak | 1891/2500 | 1057/1250 | 179/1250 | 699/1250 |
| flank | 149/200 | 4267/5000 | 1467/10000 | 14/25 |
| upper | 1891/2500 | 877/1000 | 19/125 | 573/1000 |

**Theorem.** Let X be a standard complex Gaussian, Y an independent standard
complex Gaussian vector of arbitrary finite dimension, and A any Hermitian
matrix. Let

\[
P=Y^*AY-\operatorname{tr}A,\qquad q=e^{i\theta}XP,\qquad
u=\mathbb E|q|^2=\operatorname{tr}(A^2).
\]

For every real theta and every

\[
\frac{551}{100000}\le u\le\frac{463}{10000},
\]

one has

\[
\boxed{\quad
\|\Pi_{1,0}F_A(q)\|_2^2
\le \frac{59091}{250000}\,[B(u)-F(q)]
=0.236364\,[B(u)-F(q)].\quad}
\tag{1}
\]

The projection is onto the full remote holomorphic first chaos, including all
coordinates of Y and any extra independent coordinates. There is no restriction
on the signs, multiplicities, rank or dimension of the Hermitian spectrum.

**Consequence using the supplied shell-cost theorem.** Wherever the input
estimate

\[
\Lambda(q+(T-1)U)\le\Lambda(q)
+2\Re\langle U,F_A(q)\rangle-\frac6{25}\|U\|_2^2
\tag{2}
\]

is available, (1) gives, for every remote linear U,

\[
\boxed{
\Lambda(q+(T-1)U)
\le B(u)-pu-\frac{303}{20000}[B(u)-F(q)]\le S.
}\tag{3}
\]

In the range stated in the research record, (2) is available for
\(\|U\|_2^2\le0.0113\). Thus (3) covers the entire remaining shared-A rectangle
for this family, at the rows where that input cost theorem applies. The new
certificate proves (1) itself at all three rows; it does not reprove (2).

## 1. Exact reduction to the coefficient P

The phase factor may be absorbed into X, so take theta = 0. Write

\[
K_v(r)=\mathbb E|r+\sqrt v W|^{-1},\qquad
J(v)=\mathbb E_T[(T-1)K_v(\sqrt T(a+bT))].
\]

Conditioning on Y gives the exact identities

\[
F(q)=\mathbb E B(P^2),\qquad
C:=\|\Pi_{1,0}F_A(q)\|_2
=\frac12|\mathbb E[PJ(P^2)]|.
\tag{4}
\]

For the second identity use complex Gaussian integration by parts:

\[
\mathbb E_X[\overline X\operatorname{ph}(L+PX)]
=\frac P2\mathbb E_X|L+PX|^{-1}.
\]

The coefficients in the Y directions vanish: after integration over Z, F_A is
rotation-equivariant in its complex argument, so its conditional mean over the
circular variable X is zero. This also proves the claim for additional remote
coordinates. In particular arbitrary sharing between U and Y is allowed.

Below we prove B is strictly concave. Let

\[
d_u(v)=B(u)+B'(u)(v-u)-B(v)\ge0,\quad
D=B(u)-\mathbb E B(P^2)=\mathbb E d_u(P^2).
\]

Since E P = 0, weighted Cauchy–Schwarz yields

\[
C^2\le D\,\mathbb E R_u(P^2/u),\qquad
R_u(y)=\frac{uy[J(uy)-J(u)]^2}{4d_u(uy)}.
\tag{5}
\]

The removable value at y = 1 is

\[
R_u(1)=\frac{uJ'(u)^2}{-2B''(u)}.
\]

At atoms with P² = u the numerator in (4), after subtracting J(u)P, vanishes.
Thus assigning the continuous value to R at y = 1 is valid for (5).

## 2. The quadratic-chaos moment constraint

Diagonalize A and write P = sum_j lambda_j(E_j - 1), where the E_j are independent
unit exponential variables. Set s_k = sum_j lambda_j^k and u = s_2. The cumulants
are kappa_k(P) = (k-1)! s_k for k >= 2. Consequently

\[
\mathbb E P^4=3u^2+6s_4,
\]

\[
\mathbb E P^6=15u^3+90us_4+40s_3^2+120s_6.
\]

Cauchy–Schwarz gives s_3² <= u s_4. Also s_6 <= u s_4, since every lambda_j² <= u.
It follows that

\[
\boxed{\quad
\mathbb E P^6\le\frac{125}{3}u\mathbb E P^4-110u^3.
\quad}\tag{6}
\]

Equivalently, for V = P²/u,

\[
\mathbb E V=1,\qquad
\mathbb E\left[V^3-\frac{125}{3}V^2\right]\le-110.
\tag{7}
\]

This relation is sharp at a one-eigenvalue spectrum. Importantly, it is stronger
than imposing the separate bounds E P⁴ <= 9u² and E P⁶ <= 265u³.

## 3. The certified scalar inequality

The certificate proves, for each of the three profiles,

\[
\boxed{\quad
R_u(y)\le Q(y):=
\frac{53}{1000}+\frac{23381}{100000}y
+\frac{2293}{5000000}\left(y^3-\frac{125}{3}y^2\right)
\quad}\tag{8}
\]

simultaneously for 551/100000 <= u <= 463/10000 and every y >= 0.
Combining (5), (7), and (8) gives

\[
C^2\le D\left[
\frac{53}{1000}+\frac{23381}{100000}
-110\frac{2293}{5000000}\right]
=\frac{59091}{250000}D,
\]

which proves (1). Completing the square in (2) proves (3), because

\[
1-\frac{59091/250000}{6/25}=\frac{303}{20000}.
\]

The remainder of this note supplies the analytic facts and enclosure procedures
used to prove (8). No random scan, floating quadrature, or optimization solver is
used in the verification.

## 4. Completely monotone kernels

Let t = t(s) be the nonnegative inverse of s = t(a+bt)². Lagrange inversion gives

\[
t'(s)=\frac1{a^2}\,{}_2F_1\left(\frac23,\frac43;\frac32;
-\frac{27b}{4a^3}s\right).
\tag{9}
\]

This identity follows first from the Taylor coefficients
\((-1)^k\binom{3k+1}{k}b^k/a^{3k+2}\), and then by analytic continuation on the
positive real axis. Euler's beta integral represents its right side as a
positive mixture of \((1+csx)^{-2/3}\), 0 < x < 1. Thus t' is completely monotone,
and t is a Bernstein function.

Consequently both

\[
\phi(s)=e^{-t(s)},\qquad
h(s)=\frac{e^{-t(s)}}{(a+bt(s))^2}
\]

are completely monotone. Write their Laplace representations as

\[
\phi(s)=\int e^{-\lambda s}\nu(d\lambda),\qquad
h(s)=\int e^{-\lambda s}\mu(d\lambda).
\]

Here nu is a probability measure, and phi(s) is the radial survival function of
L. Thus L is a Gaussian scale mixture with mixing variance 1/lambda, and

\[
B(v)=\sqrt\pi\int\sqrt{v+\lambda^{-1}}\,\nu(d\lambda).
\]

In particular

\[
A_0(v):=-B''(v)=\frac{\sqrt\pi}{4}
\int\frac{\lambda^{3/2}}{(1+\lambda v)^{3/2}}\,\nu(d\lambda)
\tag{10}
\]

is positive and completely monotone. The subscript on A_0 distinguishes this
scalar kernel from the Hermitian matrix A.

Integration by parts in T gives

\[
J(v)=\int_0^\infty sh(s)\,\partial_sK_v(\sqrt s)\,ds.
\]

The elementary Laplace transform

\[
\int_0^\infty e^{-\lambda s}K_v(\sqrt s)\,ds
=\frac{\sqrt\pi}{\sqrt\lambda\sqrt{1+\lambda v}}
\]

then yields

\[
J(v)=-\frac{\sqrt\pi}{2}
\int\frac{\lambda^{-1/2}}{(1+\lambda v)^{3/2}}\,\mu(d\lambda),
\]

\[
H_0(v):=J'(v)=\frac{3\sqrt\pi}{4}
\int\frac{\lambda^{1/2}}{(1+\lambda v)^{5/2}}\,\mu(d\lambda).
\tag{11}
\]

Thus A_0 and H_0 are positive, decreasing and convex, and -J is decreasing.
These properties hold for all a,b > 0, not just the three certified rows.

## 5. Positive formulas for rigorous kernel integration

Let k = a+bt, d = k(a+3bt), d_t = 4ab+6b²t, and s = tk². For v > 0,

\[
A_0(v)=\frac{\sqrt\pi}{4v^{3/2}}
\int_0^\infty e^{-t}s\left(\frac1d+\frac{d_t}{d^2}\right)
{}_1F_1\left(\frac32;2;-\frac{s}{v}\right)dt,
\tag{12}
\]

\[
H_0(v)=\frac{3\sqrt\pi}{8v^{5/2}}
\int_0^\infty e^{-t}t^2(k^2+2bk)
{}_1F_1\left(\frac52;3;-\frac{s}{v}\right)dt.
\tag{13}
\]

To verify these formulas, use

\[
\lambda^{-\alpha}(1+v\lambda)^{-\beta}
=\frac1{v^\beta\Gamma(\alpha+\beta)}
\int_0^\infty s^{\alpha+\beta-1}e^{-\lambda s}
{}_1F_1(\beta;\alpha+\beta;-s/v)\,ds.
\]

Apply it with (alpha,beta) = (1/2,3/2), integrating phi'', and with
(alpha,beta) = (1/2,5/2), integrating -h'. All integrands in (12)–(13) are
nonnegative. Euler's integral also gives 0 <= 1F1(beta;alpha+beta;-x) <= 1 for
x >= 0.

At v = 0 the formulas used are

\[
A_0(0)=\frac12\int_0^\infty e^{-x^2}
\frac{d^{-1}+d_t d^{-2}}{a+bx^2}\,dx,
\]

\[
H_0(0)=\frac32\int_0^\infty e^{-x^2}
\frac{a+bx^2+2b}{(a+bx^2)^4}\,dx,
\]

where d and d_t are evaluated at t = x².

`kernels.py` integrates (12)–(13) on [0,64] with Arb ball arithmetic. The omitted
tails are bounded explicitly using

\[
s(d^{-1}+d_t d^{-2})\le
(1+4b/a)t+(6b^2/a^2)t^2,
\]

\[
t^2(k^2+2bk)
=(a^2+2ab)t^2+(2ab+2b^2)t^3+b^2t^4,
\]

and the exact formula for the incomplete integer gamma integral
\(\int_R^\infty t^m e^{-t}dt=e^{-R}\sum_{j=0}^m(m!/j!)R^j\).
The v = 0 integrals are truncated at x = 8, with a 10^(-20) tail allowance.
For the specified rows, a > 1/2 and b < 0.16 give a bound below 10^(-25) for
both omitted tails, so this allowance is conservative.

The integrands evaluated by Arb are meromorphic or entire in the integration
variable. No branch selection is hidden in an analytic callback: all powers
of v appearing outside the integral are real positive constants.

## 6. From 127 kernel values to a continuum certificate

`generate.py` produces enclosures at 127 dyadic arguments. The arguments have
denominator 2^20; the outward-rounded value enclosures have denominator 2^36.

Convexity gives a chord upper bound for H_0 between adjacent nodes. For A_0,
extrapolate the preceding secant to the right and the following secant to the
left; both are lower bounds by convexity. A lowered chord below the maximum of
these two lines gives a single linear lower bound on each cell. The first cell
uses monotonicity instead. `verify.py` constructs these bounds using exact
rational arithmetic and integrates them exactly.

The useful cancellation-free identity is

\[
R_u(y)=\frac{uy}{4}
\frac{\left[\int_0^1H_0(u(1+(y-1)t))\,dt\right]^2}
{\int_0^1(1-t)A_0(u(1+(y-1)t))\,dt}.
\tag{14}
\]

It remains valid at y = 1. Both integrals in (14) decrease as either u or y
increases. On a rectangle [u0,u1] x [y0,y1], use the H integral at (u0,y0), the
A integral at (u1,y1), and prefactor u1*y1/4. This yields a rigorous upper bound.
The minimum of the four cubic Bernstein coefficients bounds Q from below on
the y interval. Subdivide until the rational comparison is strict.

For y >= 70, the checker verifies |J(0)| < 17/10 and A_0(0.1389) > 6/5. Since
v = uy and 3u <= 0.1389,

\[
d_u(v)\ge\int_u^{3u}(v-s)A_0(s)ds
\ge2u(v-3u)\frac65.
\]

Thus

\[
R_u(y)\le
\frac{(17/10)^2}{8(67/70)(551/100000)(6/5)}<Q(70).
\]

Also Q' > 0 on [70,infinity). This proves the entire unbounded tail.
The J(0) check uses

\[
J(0)=\frac{\sqrt\pi}{b}
-\left(1+\frac ab\right)
\frac{\pi e^{a/b}\operatorname{erfc}(\sqrt{a/b})}{\sqrt{ab}}.
\]

Completed verification results:

| row | boxes checked | accepted leaves | maximum depth | resulting constant |
|---|---:|---:|---:|---:|
| peak | 43,067 | 21,534 | 23 | 59091/250000 |
| flank | 18,481 | 9,241 | 21 | 59091/250000 |
| upper | 4,177 | 2,089 | 17 | 59091/250000 |

Floating point supplies only initial interval-index guesses in `verify.py`;
exact rational comparisons correct and validate each guess. All accept/reject
decisions in the rectangle and tail checks are exact, except the explicitly
rigorous Arb enclosure of J(0).

## 7. Scope and next obstruction

This closes arbitrary Hermitian spectra in q = XP(Y), not merely a grid of
spectra or the rank-one template X(|Y|²-1). It avoids a Schur-convexity theorem.

It does not handle an arbitrary remote cubic, nor the full family
cX(|X|²-2)+XP(Y), nor the additional X-bar B(Y), X² W-bar(Y), and (|X|²-1)V(Y)
components. Conditional Gaussianity in X is used essentially in (4).

The moment constraint (6) also matters essentially to this proof. With only
E P = 0 and E P² = u, nearly symmetric two-point coefficient laws have limiting
content/deficit ratio

\[
\frac{uJ'(u)^2}{-2B''(u)},
\]

which is approximately 0.246922 at u = 0.0403448 and 0.264570 at u = 0.0463 for
the peak profile. Such coefficients are not quadratic Gaussian chaoses. These
values explain why centeredness and conditional Gaussianity alone cannot prove
the proposed 0.24 content inequality.

The next concrete extension is to cX(|X|²-2)+XP(Y), using (6) and the same
completely monotone kernel representations while retaining the X dependence
in the first term. Nothing here claims that this extension, the general content
lemma, K-a for arbitrary cubics, or the remaining mixed-shell reductions are
proved.
