<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/remotenumerics/GLOBAL_RADIUS_DIMENSION_SEVEN.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended filepath: codex-c7e2-round2/remotenumerics/GLOBAL_RADIUS_DIMENSION_SEVEN.md -->
# A strict Gaussian radius bound in complex dimension at most seven

15 November 2026. Analytic proof plus a finite Arb certificate. The
decomposition and every conditional quadratic block were independently
audited by the all-sector agent.

**Theorem.** For every `1 <= n <= 7` and every circular complex cubic
`q in H_(2,1)(C^n)`, with standard proper complex Gaussian coordinates,

\[
\boxed{\quad (\mathbb E|q|)^2
       \le\frac{1569}{2000}\,\mathbb E|q|^2
       <\frac\pi4\,\mathbb E|q|^2\quad}\tag{1}
\]

where the second inequality is strict for nonzero `q`.
The constant `1569/2000 = 0.7845` is a convenient rational bound; the
certified largest block eigenvalue in the seven-dimensional proof is
less than `0.784481`.

It suffices to prove this for `n=7`, because adjoining unused independent
coordinates embeds every smaller-dimensional cubic isometrically into
`H_(2,1)(C^7)`.

This proves an unconditional radius theorem. It does not assert the
corresponding buffered comparison for `q + sqrt(v) W`, and it does not
by itself prove Conjecture K.

## 1. Align the tensor trace

Write the Wick polynomial as

\[
q=\sum_{i,j,k}f_{ijk}:z_i z_j\bar z_k:,
\qquad f_{ijk}=f_{jik}.
\]

Define its trace vector by `t_i=sum_j f_ijj`. A unitary change of the
Gaussian coordinates can place this vector along the first coordinate.
If it is zero, choose any first coordinate. Thus we may assume
`t_i=0` for every `i>=2`.

Write `Z=z_1`, `Y=(z_2,...,z_n)`, `m=n-1`, `T=|Z|^2`, and `S=||Y||^2`.
The independent variables `T,S` have laws `Gamma(1,1), Gamma(m,1)`.
The usual orthogonal visible-coordinate decomposition is

\[
q=\nu\frac{Z(T-2)}{\sqrt2}+(T-1)r_A(Y)
 +\frac{Z^2\overline{r_B(Y)}}{\sqrt2}
 +ZQ(Y)+\bar ZP(Y)+R(Y),\tag{2}
\]

where `r_A,r_B` are holomorphic linear forms, `Q` is a centered
`H_(1,1)` quadratic, `P` is holomorphic quadratic, and `R` belongs to
the remote `H_(2,1)` chaos. Norms below are Gaussian `L^2` norms.

Decompose the quadratic and remote cubic into their radial trace and
trace-free parts:

\[
Q=\rho\frac{S-m}{\sqrt m}+Q_0,
\qquad
R=R_0+\frac{(\eta\cdot Y)(S-m-1)}{\sqrt{m+1}}.\tag{3}
\]

Here `Q_0` is a trace-free quadratic form and `R_0` is a trace-free
complex cubic. In particular `R_0` is an ordinary homogeneous harmonic
polynomial of bidegree `(2,1)`; it has no Wick linear term. Both
decompositions are orthogonal. The normalization in (3) makes the
squared norm of its trace component equal to `||eta||^2`.

The trace vector contributed by the trace component of `R` is
`sqrt(m+1) eta/2`. The contribution from `(T-1)r_A` is half the
coefficient vector of `r_A`. Our trace alignment therefore imposes

\[
r_A=-\sqrt{m+1}\,\eta\cdot Y.\tag{4}
\]

Combining these terms gives the homogeneous polynomial

\[
(T-1)r_A+R-R_0
 =\frac{\eta\cdot Y}{\sqrt{m+1}}[S-(m+1)T].\tag{5}
\]

Its squared norm is `(m+2)||eta||^2`. Consequently the full squared
norm is

\[
\|q\|_2^2=|\nu|^2+|\rho|^2+\|Q_0\|_2^2+\|P\|_2^2
 +\|r_B\|_2^2+\|R_0\|_2^2+(m+2)\|\eta\|^2.\tag{6}
\]

## 2. Conditional angular quadratic form

Condition on `T,S`, then average over the visible phase and the uniform
remote complex sphere. Every cross term vanishes except the one between
the `nu` and `rho` components. Visible frequencies eliminate cross terms
between different powers of `Z` and `bar Z`. Remote spherical trace
orthogonality eliminates those between `Q_0` and the scalar quadratic,
and between `R_0` and the linear angular harmonic in (5).

In the normalized coefficient norm (6), the conditional quadratic form
has the following two-by-two block and scalar blocks:

\[
M(T,S)=
\begin{pmatrix}
\frac12T(T-2)^2 & \frac{T(T-2)(S-m)}{\sqrt{2m}}\\
\frac{T(T-2)(S-m)}{\sqrt{2m}} & \frac{T(S-m)^2}{m}
\end{pmatrix},\tag{7}
\]

\[
\begin{aligned}
p_B&=\frac{T^2S}{2m},\\
p_{Q_0,P}&=\frac{TS^2}{m(m+1)},\\
p_{\mathrm{trace}/A}&=
 \frac{S[S-(m+1)T]^2}{m(m+1)(m+2)},\\
p_{\mathrm{harmonic}}&=\frac{S^3}{m(m+1)(m+2)}.
\end{aligned}\tag{8}
\]

For example, conditional on `S`, a unit linear form has squared mean
`S/m`; a unit trace-free quadratic or holomorphic quadratic has squared
mean `S^2/[m(m+1)]`; and a unit homogeneous trace-free cubic has squared
mean `S^3/[m(m+1)(m+2)]`. These identities follow directly from uniform
sphere moments and the Gaussian norm normalization.

All diagonal blocks in (7)--(8) have unconditional mean one, and the
off-diagonal entry of (7) has mean zero.

## 3. A finite positive weight proves the bound

Let `w(T,S)>0` be any measurable scalar weight with the required finite
integrals. Weighted Cauchy--Schwarz gives

\[
(\mathbb E|q|)^2\le\mathbb Ew\;
                         \mathbb E\frac{|q|^2}{w}.\tag{9}
\]

By (6)--(8), it is therefore enough to exhibit `w` such that

\[
(\mathbb Ew)\mathbb E[M/w]\preceq\frac{1569}{2000}I_2,
\qquad
(\mathbb Ew)\mathbb E[p_j/w]\le\frac{1569}{2000}
\quad\text{for all four scalar blocks}.\tag{10}
\]

We exhibit a positive rational weight constant on each rectangle of a
finite partition of `(T,S)`, including every infinite tail. There is no
quadrature approximation in checking (10).

For `m=6`, the `T` endpoints are

\[
\{j/16:0\le j\le192\}
\cup\{j/2:25\le j\le48\}
\cup\{26,28,\ldots,48\}\cup\{\infty\},
\]

and the `S` endpoints are

\[
\{j/16:0\le j\le256\}
\cup\{j/2:33\le j\le64\}
\cup\{34,36,\ldots,64\}\cup\{\infty\}.
\]

There are `229*305=69,845` rectangles. The file
`free_radial_weights_n7_den16.json` specifies `w=N/10^8` on each rectangle
in row-major order, with the `T` interval outermost. Every integer `N`
is strictly positive. The checker verifies the header, denominator,
number of cells, and positivity before using these values.

For completeness, the rational starting coefficients used to construct
the weight are recorded in `free_radial_witness_manifest.json`. The
weight was suggested by a numerical optimization, but its provenance is
irrelevant to its verification: any positive rational values passing
(10) prove the theorem.

## 4. Exact cell integrals and certified result

For any nonnegative integer `k`, put

\[
H_k(t)=k!e^{-t}\sum_{r=0}^k\frac{t^r}{r!},
\qquad H_k(\infty)=0.
\]

If `X~Gamma(d,1)`, then

\[
\mathbb E[X^j\mathbf1_{\ell\le X<h}]
 =\frac{H_{d+j-1}(\ell)-H_{d+j-1}(h)}{(d-1)!}.\tag{11}
\]

Every entry of (7)--(8) is polynomial of degree at most three in each
variable. Independence and (11) give every cell integral exactly using
only rational arithmetic, square roots, and exponentials of rational
endpoints. With a constant rational `w` on each cell, both sides of
(10) are finite sums of such expressions.

The 160-bit Arb replay certifies the following values; each displayed
decimal is rounded outwards:

| Block | Certified upper bound |
|---|---:|
| Largest eigenvalue of the `nu,rho` block | 0.784480921 |
| `B` | 0.784152358 |
| Trace-free `Q` and `P` | 0.784185842 |
| Tied remote trace and `A` | 0.783999151 |
| Remote harmonic cubic | 0.784057747 |

The actual acceptance tests use Arb comparisons against the exact
rational `1569/2000`, including positive diagonal slack and positive
determinant for the two-by-two matrix. The checker also verifies that the
partition masses enclose one and that all unweighted block integrals
enclose their exact normalizations. Infinite rectangles are included
using the zero endpoint term in (11).

This proves (10), hence (1). The checker additionally verifies
`1569/2000 < pi/4` with Arb.

## 5. Replay and scope

With `python-flint` installed, run

```sh
python certify_free_radial.py --n 7 --den 16
python -O certify_free_radial.py --n 7 --den 16
```

Both executions retain every acceptance test. The first frozen-witness
replay takes about two seconds in this workspace. It writes
`free_radial_certificate_n7.json`; all numerical discovery scripts are
unnecessary for replay.

The proof needs only `certify_free_radial.py`,
`free_radial_witness_manifest.json`, and
`free_radial_weights_n7_den16.json`. The output certificate records all
block enclosures and the determinant margin. This is a finite certified
analytic proof, not a Lean formalization.

The bound covers every tensor in at most seven complex Gaussian
coordinates, at every amplitude. It does not reduce the arbitrary-
dimension problem to seven coordinates and makes no assertion about
Gaussian buffers or mixed first/third chaos.
