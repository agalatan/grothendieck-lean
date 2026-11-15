<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/localization_alternative_proof.md (file dated 2026-11-15 04:26). Only this line was added. -->
# Global localization from a scalar derivative majorant

Agent-ID: **codex-6e2b**. 15 November 2026.

**Status.** The analytic reductions in this note are **P**. The scalar
majorant (1) and global radius bound are **P+C**, with the complete successful
run of `localization_majorant.cpp --certify` recorded in
`localization_majorant_results.txt`. The searches in
`localization_alternative_majorant.py` remain **N**, not upper bounds. The
proof uses the already certified profile range and curvature results. It
does not prove the content/deficit bound.

## 1. Scalar statement and its localization consequence

Use \(a=699/1250\), \(b=179/1250\), \(d=2/5\),
\(A=T-d\), \(P=2500/1891-9/25\). Define

\[
\beta(w,\rho)=\mathbb E_Z[A\,\Re\operatorname{ph}(L+w+A\rho)]
\quad(w\in\mathbb C,\ \rho>0).
\]

The sufficient scalar majorant is

\[
\boxed{\quad\beta(w,\rho)\le
 \frac45\rho+\frac{63}{400}\Re w
 +\frac1{40}\frac{|w|^2}{\rho}\quad}
\qquad(\rho>0,\ w\in\mathbb C).                         \tag{1}
\]

**P+C.** For every dimension and every remote cubic with
\(u=\|q\|^2\le463/10000\), every global maximizer of the tilted sector gain
satisfies \(\|r\|\le17/200\).

To see this, fix any unit remote linear form \(X\), write \(X=R e^{i\phi}\),
and vary \(r=\sigma X\) along its positive real ray. Conditional rotation
of the independent visible Gaussian gives

\[
\frac12\frac{d}{d\sigma}\mathcal J(q,\sigma X)
 =\mathbb E[R\,\beta(qe^{-i\phi},\sigma R)]-P\sigma.
\]

The null event \(R=0\) can be omitted. Multiplying (1) by \(R\), and using
\(\mathbb ER^2=1\), \(\mathbb E\overline Xq=0\), and \(\mathbb E|q|^2=u\),
gives

\[
\frac12\frac{d}{d\sigma}\mathcal J(q,\sigma X)
 \le-\left(P-\frac45\right)\sigma+\frac{u}{40\sigma}.
                                                               \tag{2}
\]

This does not assume independence between \(q\) and \(X\). The derivative
under the expectation follows by domination by \(|A|R\); for fixed remote
values the zero set of \(L+w+A\rho\) has visible Gaussian measure zero.

The exact rational margin at the required cutoff is

\[
\left(P-\frac45\right)\left(\frac{17}{200}\right)^2
 -\frac1{40}\frac{463}{10000}
 =\frac{50393}{3782000000}>0.
\]

Thus the gain strictly decreases along every ray for \(\sigma\ge17/200\).
Its global maximum exists by the coercivity proof in REPORT.md, so no
global maximizer lies outside that ball. In fact the same argument gives

\[
\|r_*\|^2\le\frac{875533}{122576000},
\qquad \|r_*\|\le0.084514949721<0.085.
\]

The decimal is explanatory; the strict comparison with \((17/200)^2\)
is rational. The case \(u=0\) follows directly from (2).

## 2. Compactification of the scalar certificate

Set \(w=\rho z\), \(r=|z|\), and define

\[
\mathcal E(\rho,z)=\frac{\beta(\rho z,\rho)}{\rho}
 -\frac{63}{400}\Re z-\frac1{40}|z|^2.
\]

It remains to show \(\mathcal E\le4/5\). Conjugation permits
\(\Im z\ge0\).

**P, using the existing P+C curvature and profile-range results.** For
\(0<\rho\le3/10\), the proved curvature bound at fixed \(w\) implies

\[
\beta(w,\rho)\le\beta(w,0)+\tfrac34\rho,
\qquad
\beta(w,0)=\Re w\,[c_0+h_{3/5}(|w|^2)].
\]

Here \(c_0=(I_1-dI_0)/2\in(3/125,1/40)\). The certified profile range
\(-1/40<h_{3/5}<253/1000\) therefore implies

\[
|c_0+h_{3/5}-63/400|<159/1000.
\]

Consequently

\[
\mathcal E(\rho,z)\le\frac34+\frac{159}{1000}r-\frac1{40}r^2.
\]

This quadratic decreases for \(r\ge12\), and its value at 12 is
\(-471/500<4/5\). Thus it excludes \(r\ge12\) throughout the small-\(\rho\) region.

For \(\rho\ge3/10\), use
\(\beta\le M:=\mathbb E|T-d|=2e^{-2/5}-3/5<3/4\):

\[
\mathcal E(\rho,z)\le\frac52+\frac{63}{400}r-\frac1{40}r^2.
\]

This decreases for \(r\ge12\), and equals \(79/100<4/5\) at 12. Thus
\(|z|\ge12\) is excluded at every positive \(\rho\).

Finally, completing the square in \(z\) gives, for \(\rho\ge3/2\),

\[
\mathcal E(\rho,z)
 \le\frac{M}{\rho}+\frac{(63/400)^2}{4/40}
 <\frac12+\frac{3969}{16000}
 =\frac{11969}{16000}<\frac45.
\]

Therefore the only remaining domain is the compact box

\[
0\le\rho\le3/2,\quad -12\le\Re z\le12,\quad
0\le\Im z\le12,\quad |z|\le12.                       \tag{3}
\]

At \(\rho=0\), the continuous limiting quotient is

\[
\lim_{\rho\downarrow0}\frac{\beta(\rho z,\rho)}{\rho}
 =\frac{J_s}{2}+c_0\Re z,
\qquad J_s=I_2-2dI_1+d^2I_0.
\]

Its quadratic maximum is
\(J_s/2+(c_0-63/400)^2/(4/40)\), approximately 0.693438 (**N** decimal).
The limit can instead be enclosed directly by the integral in section 3.

## 3. A one-dimensional integral without a source singularity

Let

\[
C(\nu)=\frac1{2\pi}\int_0^{2\pi}|1+\nu e^{i\theta}|\,d\theta,
\quad g(\nu)=C'(\nu),\quad j(\nu)=g(\nu)/\nu,
\]

with \(j(0)=1/2\). Put \(x=\Re z\), \(v=\Im z\), and use \(y\ge0\) for
the visible source radius. Then

\[
\boxed{
\frac{\beta(\rho z,\rho)}{\rho}
 =\int_0^\infty
 \frac{2e^{-y^2}(y^2-d)(x+y^2-d)}{a+by^2}
 j\!\left(
 \frac{\rho\sqrt{(x+y^2-d)^2+v^2}}{y(a+by^2)}
 \right)dy.}                                             \tag{4}
\]

To derive this, average the visible angular phase first. Its mean phase
is \(g(\nu)(w+A\rho)/|w+A\rho|\). Set \(T=y^2\), use
\(dT=2y\,dy\), and cancel the factor \(y\) against
\(\ell(T)=y(a+by^2)\). The remaining signed factor in (4) must retain
its sign in interval arithmetic.

The coefficient outside \(j\) is bounded at \(y=0\). Although its argument
may be infinite there, \(0\le j\le1\); a certificate can use this whole
range on a cell touching zero. The value at the single endpoint does not
affect the integral. At \(\rho=0\), setting \(j=1/2\) gives the displayed
limiting quotient.

On the whole box (3), the source tail at \(Y=4\) is nonnegative and at most

\[
\frac{57}{8b}e^{-16}<10^{-5}.                            \tag{5}
\]

Indeed \(y^2-d>0\), \(x+y^2-d>0\) for \(y\ge4\). Using \(j\le1\),
the integrand is at most \((2/b)(y^2+12)e^{-y^2}\). Integration by parts
and the Gaussian Mills bound yield

\[
\frac2b\int_Y^\infty(y^2+12)e^{-y^2}dy
\le\frac2b e^{-Y^2}\left(\frac Y2+\frac1{4Y}+\frac{12}{2Y}\right),
\]

which becomes (5). The checker must establish the displayed exponential
comparison by outward arithmetic or a rational exponential bound.

## 4. Exact interval series for the circle derivative

Put \(c_k=\binom{1/2}{k}^2\). These are nonnegative rational numbers.
For \(0\le\nu\le1\),

\[
j(\nu)=\sum_{k\ge1}2k c_k\nu^{2k-2},
\qquad \sum_{k\ge1}2k c_k=\frac2\pi.
\]

After terms \(k\le N\), the remaining positive tail is at most

\[
\nu^{2N}\left(\frac2\pi-\sum_{k=1}^N2k c_k\right).     \tag{6}
\]

For \(\nu\ge1\), reciprocity gives

\[
g(\nu)=1-\sum_{k\ge1}(2k-1)c_k\nu^{-2k},
\qquad\sum_{k\ge1}(2k-1)c_k=1-\frac2\pi.
\]

The positive series subtracted after terms \(k\le N\) has tail at most

\[
\nu^{-2N-2}\left(1-\frac2\pi-
 \sum_{k=1}^N(2k-1)c_k\right).                         \tag{7}
\]

The function \(g\) is increasing because \(C\) is convex. Therefore,
on \([l,h]\subset[1,\infty)\),

\[
\frac{g(l)}h\le j(\nu)\le\frac{g(h)}l.
\]

No global monotonicity of \(j\) is asserted: it is false. Intervals
crossing 1 can be split there. The bound \(0\le j\le1\) follows from
the positive series and \(2/\pi<1\) below 1, and from \(g\le1\) above 1.

The production checker uses the sharper reciprocal range in
`localization_circle.hpp`. Set \(t=1/\nu\in[0,1]\) and
\(b_k=(2k-1)c_k\). Then

\[
p_N(t)=t-\sum_{k=1}^N b_kt^{2k+1},\qquad
q_N(t)=p_N(t)-\left(1-2/\pi-\sum_{k=1}^Nb_k\right)t^{2N+3}
\]

satisfy \(q_N(t)\le j(1/t)\le p_N(t)\). Both polynomials are concave,
so the minimum of \(q_N\) on an interval occurs at an endpoint. The
unique maximum of \(p_N\) is bracketed by interval signs of its strictly
decreasing derivative. Endpoint evaluations or a natural interval
evaluation over that root bracket bound the maximum on any interval.
Here \(N=64\). Every claimed derivative sign is rechecked by directed
interval arithmetic; Newton or floating-point maximization is not used.

A uniform \(j\le11/16\) is also proved. Below 1 this follows from
\(2/\pi<11/16\). Above 1 it follows from
\(j(1/t)\le p_3(t)=t-t^3/4-3t^5/64-5t^7/256\): the checker transforms
\(11/16-p_3\) to degree-seven Bernstein coefficients on each of the eight
intervals \([i/8,(i+1)/8]\), and verifies that every coefficient is positive.
This cap handles source cells touching zero.

The interval engine and this series header were independently audited.
The exact pi enclosure they use is proved by the separate Machin-series
calculation in `verify.py`. The executable must be compiled without
`NDEBUG`, using `-frounding-math -ffp-contract=off -fno-fast-math`.

## 5. Complete certificate and audit

**C.** The complete directed-rounding run enclosed (4) plus the tail (5)
on every required compact box. It accepted 70,373 boxes after 140,745
visits, including 3,205 boxes accepted by the analytic inexpensive bounds.
The maximum subdivision depth was 25, and the largest accepted integral
upper bound was 0.79999684962304463, strictly below 4/5. The run completed
in 153.24 seconds with exit status zero. These counts describe the recorded
run; every replay reconstructs the cover and verifies all comparisons.

The independent audit read the complete engine, the series header, and
the analytic reduction, and recompiled the checker using the required
flags. It replayed two rigorous point enclosures as an engine check; the
full successful cover is the primary recorded run, not an independent
second full run. No blocking mathematical or interval-rounding error was
found.

**Checker coverage.** `localization_majorant.cpp --certify` begins with
\([0,3/2]\times[-12,12]\times[0,12]\), which contains (3). It either
accepts a box using the already certified curvature/profile bounds, accepts
an outward upper enclosure of (4) plus (5), or bisects it. The source
Riemann sums use powers of two (64, 256, 1024, or 4096 panels) on \([0,4]\),
so all source partition endpoints are exactly representable. Each cell
uses an interval range of the entire integrand. The signed factors are
multiplied before summation and no point sample is treated as a cell
bound. Reaching the depth limit aborts the run, and successful completion
requires the complete work list to be empty. The exterior assertions
also recheck the rational comparison that yields the radius below .085.

**N evidence.** At \(B=1/40\), the searched constant \(c=63/400\) gives
a limiting negative-\(x\) value about 0.693438 and a positive-\(x\) local
maximum about 0.694919 at \(\rho\approx0.375239\), \(x\approx2.161661\),
\(v\approx0\). These indicate a margin to \(m=4/5\), not a proved global
upper bound. A single differential-evolution run missed the positive branch
at a nearby value of \(c\); this is why the rigorous cover is essential.
