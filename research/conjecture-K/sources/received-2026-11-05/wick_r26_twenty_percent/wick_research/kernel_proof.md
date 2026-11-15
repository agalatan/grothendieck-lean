<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/kernel_proof.md (file dated 2026-11-05). Only this line was added. -->
# Scalar kernel background inherited from R23

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

