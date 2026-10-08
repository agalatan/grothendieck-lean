# A checked refinement of the complex Grothendieck lower bound

Research calculation, 8 October 2026. This is a locally reproduced refinement
of an existing argument, not a claim of a new published record or a new
decimal of the constant. External mathematical review remains desirable.

The principal result of this calculation is

\[
\boxed{K_G^{\mathbb C}>1.40020018.}
\]

The exact operator-norm upper bound certified below is

\[
B=\frac{187475002679365220625351}
        {262502532747000100000000}
 =0.7141835955543087993\ldots.
\]

Consequently the argument gives

\[
K_G^{\mathbb C}\ge B^{-1}
 =1.4002001813327240017\ldots>1.40020018.
\]

The fraction is the proof object; the printed decimal expansion is explanatory.
The safe decimal inequality is checked by integer arithmetic.

**Starting point and attribution.** We use the analytic reduction and
Gaussian-potential certificates of Heilman, Jones and Malavolta,
[Sharper Bounds for the Complex Grothendieck Constant](https://arxiv.org/html/2609.25462v1),
Sections 7–8. Their witness is
\(T_n=P_{1,0}-(37/50)P_{2,1}\) on complex Gaussian space.
An upper bound for \(\sup_n\|T_n\|_{\infty\to1}\) gives a reciprocal
lower bound for \(K_G^{\mathbb C}\). The published table already implies
\(1.4000887248144145\ldots\), which must not be credited as our improvement.
The source is pinned to [commit 7139f4c](https://github.com/sheilman77/grothendieck_cx/tree/7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f).

**What changes.** The witness, nine profiles, and their Gaussian price recipes
are retained. We sharpen a scalar sixth-moment coefficient, construct 48
additional globally valid polynomial majorants, and repartition the moment
domain. All final accept/reject decisions use exact rational inequalities.

1. The sixth-moment coefficient improves from 50 to 49.42289.
2. Linear programming proposes new polynomial coefficients; rational
   Bernstein tests prove them above the complete potential majorant,
   including its unbounded tail.
3. The final rectangle certificate uses the best available polynomial on
   each piece. An independent verifier checks all 3,768 pieces, complete
   coverage, and the final one-variable bound.

The final bound keeps the original first-moment constant \(\rho=0.98\).
Every polynomial used has zero linear coefficient, so replacing \(\rho\)
by the separately proved 0.977459 does not improve the active part of this
particular certificate.

**The sixth-moment improvement.** For a normalized complex Wick cubic
\(q\in\mathcal H_{2,1}\), let \(m=\mathbb E|q|^4\). The retained
Wick identities and contraction estimates reduce the desired sharpening to
positivity of one polynomial on \([0,1]\). With

\[
C=\frac{4942289}{100000},\qquad
N(y)=\frac{95}{2}+\frac{165}{2}y+45y^2+\frac{135}{2}y^3,
\]

the exact certificate establishes

\[
\frac{50C^2}{27}\left(1+\frac32y^2\right)^3-N(y)^2>0
\quad(0\le y\le1).
\]

It uses twelve dyadic subintervals, with strictly positive rational
Bernstein coefficients on each. This gives

\[
\mathbb E|q|^6\le9m-12+C(m-2)^{3/2},\qquad 2\le m\le62.
\]

No finite sampling substitutes for positivity on an interval.

**How a polynomial produces a profile bound.** The verified scalar potential
is bounded by each applicable polynomial

\[
p(s)=a_0+a_1s+a_2s^2+a_4s^4+a_6s^6,
\qquad a_1,a_6\ge0.
\]

For a profile parameter \(\delta>0\), put \(x^2=m-2\). Its moment bound is

\[
J_p(\sigma,x)=a_0+\rho a_1\sigma+
(a_2-\delta^{-1})\sigma^2+
a_4(2+x^2)\sigma^4+
a_6(6+9x^2+Cx^3)\sigma^6.
\]

We prove a uniform upper bound on each rectangle of the required domain.
For fixed \(\sigma\), the variable part in \(x\) has the form
\(Ax^2+Dx^3\), with \(D\ge0\). Any positive interior stationary point
is a minimum, so checking the two \(x\)-endpoints suffices. At each such
endpoint, the maximum of the rational Bernstein coefficients in
\(\sigma\) bounds the whole interval. Thus the certificate never relies
on an optimizer identifying the global maximum.

The resulting profile inequalities have the form
\(t^2-2\ell_i t+C_i\). Their pairwise intersections divide
\([0,9/10]\). Convexity bounds each branch by its endpoint values;
the maximum is the exact fraction \(B\) above. The verifier also checks
which branch is smallest on every interval.

**Reproduction issue and conservative repair.** On this computer, the
unmodified upstream lower verifier rejects a stored point bound after
successfully generating and verifying its price data. The largest observed
excess over a stored point cap is approximately \(3.19491\times10^{-10}\).
We do not describe that unmodified run as passing.

Instead, the replacement certificate adds exactly \(10^{-8}\) to every
stored point cap and every physical polynomial constant term. It then
checks every regenerated price against the enlarged cap. This translates
each chord and affine tail by the same amount, preserving the physical
majorant inequalities. The lift is included in every final moment bound.
All proof gates remain enabled.

The complete replay passed nine profile matrix checks, 997 price/Schur
certificates, 220 original global polynomial majorants, and 947 original
rectangles. The separate checker passed all 48 additional global majorants
and all 3,768 refined rectangles. The delivered scripts reproduce these
checks from the pinned upstream source without requiring the optimizer.

**A separate stronger moment lemma.** We also prove

\[
\mathbb E|q|<\frac{977459}{1000000}=0.977459
\]

for normalized charge-one complex Wick cubics. The useful general lemma is:
if \(Z\ge0\), \(\mathbb EZ=1\), \(\mathbb EZ^2=m>1\), and
\(\mathbb EZ^3\le N>m^2\), define

\[
\alpha=\frac{N-m}{m-1},\qquad
\beta=\frac{N-m^2}{m-1}.
\]

Then

\[
\mathbb E\sqrt Z\le
\frac{1+\sqrt\beta}{\sqrt{\alpha+2\sqrt\beta}}.
\]

A two-point distribution attains equality for these abstract moment
constraints. A positive cubic majorant gives a direct proof; see
[the full moment argument](quadrature_moment_lemma.md). The bound for Wick
cubics follows by exact polynomial positivity after removing the square
roots with sign checks. This classical moment method is not claimed to be new.

**Why this does not pin the next decimal.** Combining the present lower
bound with the earlier, separately checked upper refinement gives

\[
1.40020018<K_G^{\mathbb C}<1.404898426735.
\]

This fixes the decimal prefix 1.40, and the value rounded to two decimal
places is 1.40. The next digit in the ordinary decimal expansion can still
be 0, 1, 2, 3, or 4. With this upper endpoint held fixed, determining that
digit as 4 requires a lower bound at least 1.404. Determining the rounded
value at three decimal places as 1.405 requires a lower bound at least
1.4045. Neither threshold has been reached.

There is also an exact ceiling on what this fixed witness can achieve.
For \(\varphi(z)=z/|z|\) in one complex Gaussian coordinate,

\[
\|P_{1,0}\varphi\|_2^2=\frac\pi4,\qquad
\|P_{2,1}\varphi\|_2^2=\frac\pi{32}.
\]

Indeed, the normalized cubic is
\(H(z)=z(|z|^2-2)/\sqrt2\); the coefficients of \(\varphi\)
along \(z\) and \(H\) are \(\sqrt\pi/2\) and
\(-\sqrt\pi/(4\sqrt2)\). Hence

\[
\sup_n\|T_n\|_{\infty\to1}
\ge\langle\varphi,T_1\varphi\rangle
=\frac{363\pi}{1600}.
\]

Therefore this fixed-operator reciprocal-norm method cannot exceed

\[
\frac{1600}{363\pi}=1.403018782077314\ldots.
\]

For the family \(P_{1,0}-\varepsilon P_{2,1}\), the same test gives
the ceiling \(32/[\pi(8-\varepsilon)]\). Reaching 1.404 by this
method requires \(\varepsilon\ge8-32/(1.404\pi)\approx0.74507382\).
That is only a necessary condition, not a sufficiency claim.

The previously checked upper bound is documented separately in
[the upper-bound refinement](../grothendieck-refinement/research-note.md).
It is not reproved by this lower-bound package.
