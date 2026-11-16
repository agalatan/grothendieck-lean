<!-- Verbatim from the delivery conjecture_k_phase_content_codex_a786.zip (phase_content/FIFTH_DERIVATIVE.md), 16 November 2026; codex-a786, relayed by the user. -->
# Fifth derivative of the retained peak profile

**P+C, author only.** This is a new scalar certificate, separate from the
two inherited interval replays. It proves

\[
\sup_{x\in\mathbb R}|m^{(5)}(x)|<1000,\qquad
m(x)=E[(T-2/5)\operatorname{sign}(\Re L+x)].
\]

The constants are \(a=699/1250,\ b=179/1250,\ d=2/5\).
The executable is certify_m5.py, requiring python-flint 0.9.0.

## Density and exact differentiation

Set
\[
v=t(a+bt)^2,\quad P(t)=a+bt,\quad Q(t)=a+3bt,\quad D(t)=P(t)Q(t).
\]
The map \(t\mapsto v\) has positive derivative \(D\). The signed density
of \(L\), weighted by \(T-d\), is
\[
f(v)=\frac{(t-d)e^{-t}}{\pi D(t)}.
\]
Write \(f^{(k)}(v)=e^{-t}R_k(t)/\pi\). The exact recurrence is
\[
R_0(t)=\frac{t-d}{P(t)Q(t)},\qquad
R_{k+1}(t)=\frac{R_k'(t)-R_k(t)}{D(t)}.
\tag{1}
\]
The code generates \(R_0,\ldots,R_4\) with rational coefficients,
representing a term by
\[
c\,t^sP(t)^{-A}Q(t)^{-B}.
\]
Initially the two terms are \((s,A,B,c)=(1,1,1,1)\) and
\((0,1,1,-2/5)\). Differentiation produces respectively the four terms
\[
\begin{split}
&cs\,t^{s-1}P^{-A-1}Q^{-B-1},\\
&-cAb\,t^sP^{-A-2}Q^{-B-1},\\
&-3cBb\,t^sP^{-A-1}Q^{-B-2},\\
&-c\,t^sP^{-A-1}Q^{-B-1},
\end{split}
\]
with the first omitted for \(s=0\). All coefficients are Fractions.

The one-dimensional marginal of the signed density is
\(g(x)=\int_{\mathbb R}f(x^2+y^2)\,dy\). It is even and smooth.
Consequently \(m'(x)=2g(x)\), and differentiating four more times gives
\[
m^{(5)}(x)=\frac4\pi\int_0^\infty e^{-t}
\left(12R_2(t)+48x^2R_3(t)+16x^4R_4(t)\right)dy,
\quad t=t(x^2+y^2).
\tag{2}
\]
For example \(\partial_x^4 f(x^2+y^2)=12f''+48x^2f'''+16x^4f''''\).
This checks every factor in (2). Smoothness and differentiation under the
integral follow since the inverse map has nonzero derivative and all the
resulting functions are rational expressions times \(e^{-t}\), hence have
integrable bounds locally uniformly in \(x\).

## Two infinite tails

For a term of \(R_k\), associate \((j,F)=(0,12),(1,48),(2,16)\) for
\(k=2,3,4\). In (2) it is multiplied by \(F x^{2j}\).
Since \(x^2\le tP(t)^2\), its absolute contribution to the integrand is
at most
\[
\frac4\pi |c|F e^{-t}t^{s+j}
P(t)^{-(A-2j)}Q(t)^{-B}.
\]
The exact recurrence has \(A-2j\ge1,\ B\ge1,\ s+j\le3\);
the code asserts these inequalities term by term. For \(t\ge T_0\ge4\),
freeze the positive increasing denominator at \(T_0\), giving
\[
e^{-t}\sum_{\ell=0}^3 C_\ell(T_0)t^\ell,\qquad C_\ell(T_0)\ge0.
\tag{3}
\]
Every summand decreases on \(t\ge4\). Define
\[
\ell(t)=\sqrt t(a+bt),\qquad
E_j(T_0)=\int_{T_0}^\infty t^je^{-t}dt.
\]
The recurrence \(E_0=e^{-T_0}\),
\(E_j=T_0^je^{-T_0}+jE_{j-1}\) is evaluated by Arb.
Using \(\ell'(t)=(a+3bt)/(2\sqrt t)\), the omitted source tail
\(y\ge\ell(T_0)\), uniformly in \(x\), is at most
\[
I(T_0)=\sum_{\ell=0}^3
\frac{C_\ell(T_0)}{2\sqrt{T_0}}
\big(aE_\ell(T_0)+3bE_{\ell+1}(T_0)\big).
\tag{4}
\]
This uses \(t(x^2+y^2)\ge t(y^2)\ge T_0\) and monotonicity of (3).
We use \(T_0=20\) for the numerical integration ray.

For \(x\ge\ell(4)=283/125=2.264\), the entire integral in (2) is bounded by
\[
\ell(4)e^{-4}\sum_{\ell=0}^3 C_\ell(4)4^\ell+I(4)<37<1000.
\tag{5}
\]
The split is at \(y=\ell(4)\): use \(t\ge4\) on the first piece and
(4) on the second. The code currently asserts the needed bound \(<1000\);
the saved outward enclosure is also \(<37\). Thus no inference is based
on truncating either infinite domain without a remainder.

## Compact interval and error bound

The remaining domain is covered by the 240 rational intervals
\([j/80,(j+1)/80]\), \(0\le j<240\), lying in \([0,3]\).
Evenness of \(m^{(5)}\) and the overlap with (5) then cover the real line.

For each entire \(x\)-interval, integrate (2) on \(0\le y\le\ell(20)\)
by adaptive two-point Gauss quadrature. For a \(y\)-cell of length \(h\),
its error is bounded by
\[
\frac{h^5}{4320}\sup|\partial_y^4 F|
=\frac{h^5}{180}\sup|[y^4]F|,
\]
where the second expression uses a Taylor series with coefficient
\(\partial_y^4F/24\). The coefficient is enclosed using arb_series at the
whole cell and the entire \(x\)-interval. The inherited implicit-series
routine solves \(t(a+bt)^2=x^2+y^2\) through degree four, with coefficient
multiplier \((a+bt_0)(a+3bt_0)>0\). Rational denominator factors are
divided separately; no division by a wide expanded denominator is needed.

Midpoints, radii and error bounds are accumulated separately. Splitting a
cell removes its previous three contributions and adds its two children.
The sole floating-point value is the heap priority for choosing which
cell to subdivide; it never accepts a mathematical inequality.

The final enclosure adds the full tail (4). A box is accepted only if
the absolute value of that enclosure is strictly below 1000. The wrapper
checks positive cell lengths, exact adjacency, endpoints zero and three,
and all acceptance flags. Failed boxes are subdivided rationally; the
recorded successful run needed none of these outer subdivisions.

## Replayed result and scope

The output in results/m5_replay.jsonl accepts all 240 boxes. Its largest
compact upper bound is less than 998.806. The source-integration tail is
less than \(6.49\cdot10^{-9}\), and the infinite-\(x\) bound is below 37.
These displayed decimal relaxations are statements about outward Arb
enclosures, not about floating quadrature.

This is a scalar profile bound only. PROOFS.md §5.3 supplies the distinct
phase-selection and Taylor argument that turns it into
\(\|c(p_0+h)\|^2\le30000000(E|h|^2)^5\) for the specified five-cycle
perturbation. No fifth derivative bound for a degree-5 row profile is
asserted here.
