# Imported certificates strengthen the complex lower bound

This is an addendum to the coupled residual-moment construction in
`../grothendieck-further-squeeze/lower/research-note.md`. The original analytic
construction remains the Heilman–Jones–Malavolta Gaussian operator
\(T=P_{1,0}-(37/50)P_{2,1}\), from arXiv:2609.25462v1. This work imports
verified polynomial data from the user's second lower-bound package and
combines them with our previous coupled-profile method.

The resulting certificate is
\[
\|T\|_{L^\infty\to L^1}\le B=\frac{7138283181}{10000000000},
\qquad K_G^{\mathbb C}\ge B^{-1}>1.4008970709.
\]
The reciprocal starts \(1.40089707096757443699962958922573458493338525904020170028612\). This improves the previous
strict lower endpoint 1.400813971. The already delivered upper endpoint
1.404898359045958 is unchanged.

**Status:** the finite arithmetic and the lifted Gaussian integration replay
passed locally. This is computer-assisted mathematical research with the
stated analytic dependencies, not a completed Lean proof, external review,
or a claim of priority. No further digit of the exact constant is thereby
determined.

## What transferred from the other instance

Its variance-corrected mixture formula is the retained-square formula already
used in our construction. Its constants 49.423 and 0.97746 are weaker than
our previous 49.42289 and 0.977459. Its finite-model KKT theorem concerns only
its ten fixed support inequalities, not our virtual profiles or the operator
norm optimum.

The useful new input is its family of physical polynomial majorants. Across
its compact and adaptive files we checked 1,020 candidate records, discarded
602 repeated coefficient vectors, and obtained **418 additional distinct
polynomials** beyond our original pool. They concern H0.84 and H0.865. The
compact 180-polynomial delivered certificate alone contributes 44 distinct
new polynomials; the remaining useful search data come from the adaptive
files. `pool-report.json` records provenance and counts.

Every imported polynomial was checked globally against the same source
point/chord majorants, including the infinite affine tail. We retain the
conservative **1/100000000** lift required by our original local integration
replay: add it to both each point cap and each polynomial's constant term.
All saved pool coefficients are **prelift**. Add the lift exactly once.
The other instance's reported successful unmodified Linux replay does not
resolve the original macOS rounding-margin issue.

The primary certificate keeps only the virtual profiles used by the final
scalar cover and their needed imported polynomials. Old extras retain their
order; source-polynomial indices are unchanged. `selection-map.json` records
the remapping. Full search data remain in `research/work/cross-lower-instance/`
and the original received archive is preserved under `received/`.

## Exact sixth-moment refinement

We also sharpen the sixth-moment coefficient to
\[
C_6=\frac{4942288923}{100000000}=49.42288923.
\]
For a normalized cubic \(Y=|q|\), put \(x^2=\mathbb EY^4-2\). The inherited
cumulant/contraction reduction implies
\[
\mathbb EY^6\le 6+9x^2+C_6x^3.
\]
The remaining scalar inequality is checked by the positivity on \([0,1]\) of
\[
\frac{50}{27}C_6^2(1+3y^2/2)^3
 -\left(\frac{95}{2}+\frac{165}{2}y+45y^2+\frac{135}{2}y^3\right)^2.
\]
`sharper_c6.json` covers that interval by 15 rational intervals with strictly
positive Bernstein coefficients. The independent checker uses Horner
substitution and explicit polynomial expansions. This small sharpening is
secondary to the imported physical majorants.

We retain \(\rho=0.977459\) and \(\mathbb EY\le\rho\), with its previous
separate moment proof. The inherited fourth-moment bound gives
\(0\le x\le\sqrt{60}<31/4\).

## How imported polynomials enter the coupled proof

For source profiles \(i,j\), let \(0<w<1\), with averaged matrix parameters,
\(\ell=w\ell_i+(1-w)\ell_j\), \(\beta=w\beta_i+(1-w)\beta_j\), and
\(d=w\delta_i+(1-w)\delta_j\). The matrix gate permits a smaller positive
\(d'\le d\). Our certificates verify every averaged matrix and the gate
exactly. In block notation \(M_E=\begin{pmatrix}a&b^*\\b&C\end{pmatrix}\),
the relevant Schur-complement threshold is
\(d'\ge\varepsilon-a+b^*C^{-1}b\).

Choose nonnegative argument scales satisfying
\(w\lambda_i+(1-w)\lambda_j=d\). They may differ from leaf to leaf. Each
global physical polynomial has the form
\[
p_i(s)=a_{i0}+a_{i1}s+a_{i2}s^2+a_{i4}s^4+a_{i6}s^6,
\quad a_{i1},a_{i6}\ge0.
\]
Define \(A_k=wa_{ik}\lambda_i^k+(1-w)a_{jk}\lambda_j^k\) and
\(g=2w(1-w)(\beta_i-\beta_j)^2/\varepsilon\). The common residual moment
bound is
\[
J(u,x)=A_0-g+\rho A_1u+(A_2-d^2/d')u^2
 +A_4(2+x^2)u^4+A_6(6+9x^2+C_6x^3)u^6.
\]
The actual residual domain has \(u\le(d'/d)\rho\); the certificate safely
covers the larger rectangle \([0,\rho]\times[0,31/4]\). The single actual
quadratic penalty is \(-d^2u^2/d'\). It must not be replaced by individual
source penalties after changing the arguments.

For fixed \(u\), the dependence on \(x\) is a constant plus
\(Ax^2+Dx^3\), with \(D\ge0\). An interior positive critical point is a
minimum, so the maximum is at an endpoint of an x interval. At each endpoint,
exact degree-six Bernstein bounds in \(u\) prove the rectangle cap. Binary
paths give a prefix-free complete cover, independently checked using the
Kraft sum and exact reconstruction of each rectangle.

Each profile inequality retains the square centered at its averaged beta.
Thus its certified cap \(C_r\) supplies
\[
V\le t^2-2\ell_rt+C_r
 -\varepsilon\|Qh+(\beta_r/\varepsilon)v\|^2,\qquad\|v\|^2=2.
\]
For any two such profiles, mixing and completing their common square
subtracts \(2\theta(1-\theta)(\beta_r-\beta_s)^2/\varepsilon\). Minimizing
in \(\theta\in[0,1]\) gives a piecewise quadratic in \(t\). Its exact maximum
on each interval is checked at endpoints and, when applicable, its concave
vertex. `envelope.json` covers \([0,9/10]\), which contains the inherited
admissible t range. Finally, \(1.4008970709\,B<1\) is an exact rational check.

The primary certificate has 18 virtual profiles,
10,218 moment leaves, and 31 final scalar-cover leaves.

## Conditional first moments: valid, but not responsible for this gain

The received contact polynomial is useful to retain for future work. For
positive rationals \(a,b\), \(s=a+b\), \(p=ab\), let
\[
P(y)=\frac{p^2(s^2+p)+(s^4-ps^2+3p^2)y^2+(3p-2s^2)y^4+y^6}
 {2ps^3}.
\]
Then
\[
P(y)-y=\frac{(y-a)^2(y-b)^2(y^2+2sy+s^2+p)}{2ps^3}\ge0.
\]
Writing its coefficients as \(c_k\) gives
\[
\mathbb EY\le R_{a,b}(x)
=c_0+c_2+2c_4+6c_6+(c_4+9c_6)x^2+C_6c_6x^3.
\]
This can replace \(\rho\) in the linear term. One fixed contact pair must
be used throughout each certified rectangle; taking unrelated endpoint
minima would not justify the same endpoint argument.

Our old pool had no linear terms. The expanded pool contains 114 majorants
with positive linear coefficient, but the numerically controlling new
majorants still have zero linear coefficient. Conditional first moments
did not improve the tested controlling caps. **The delivered bound uses
constant rho only**, which its checker enforces. The contact helper and
findings remain available as exploration, not an extra assumed gain.

## Analytic and formalization boundary

See `../../formalization/LOWER_FORMALIZATION.md` for the Gaussian operator,
Hermite projections, tensor moment identities, physical potential,
integration enclosures, retained square, and finite-matrix transfer. No new
Gaussian construction is asserted here. The new finite data do not prove
those analytic lemmas merely by being parsed.

The finite-order consequence in `finite-dimension/theorem.md` is
\[
K_G^{\mathbb C}(n)\ge
\frac{\pi n\binom{2n}{n}^2}{16^nB}
 \left(1-\frac{37}{200(n+1)}\right).
\]
Its independent arithmetic uses a rational Machin enclosure for pi.
Here n is the Hilbert-space dimension, not an asserted explicit matrix size.

The fixed-operator ceiling \(1600/(363\pi)\) is a ceiling on this witness
method. It is not an upper bound on the Grothendieck constant. No finite-model
optimality statement in either package rules out other profiles, operators,
or constructions.
