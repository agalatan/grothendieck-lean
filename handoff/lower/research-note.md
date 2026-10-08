# Coupled profiles and flexible arguments: the lower certificate

The exact certificate in this directory proves

\[
\sup_n\|T_n\|_{\infty\to1}\le B=\frac{3569353321}{5000000000},
\qquad T_n=P_{1,0}-\varepsilon P_{2,1},\quad\varepsilon=37/50.
\]

The analytic reduction in Sections 7–8 of the
[Heilman–Jones–Malavolta preprint](https://arxiv.org/html/2609.25462v1)
then gives

\[
K_G^{\mathbb C}\ge B^{-1}>1.400813971.
\]

This note proves the additional analytic steps used after that reduction.
The preceding moment improvements and the physical-polynomial replay are
documented and verified in `base/`.

## 1. Keep the completed square

Let \(h=(f+g)/2\), let \(t=\|P_{1,0}h\|_2\), and align a Gaussian
coordinate \(z\) with \(P_{1,0}h\). The same coordinate can be used for all
profiles. Write \(Q=P_{2,1}\) and

\[
v=z(|z|^2-2),\qquad\|v\|_2^2=2.
\]

Instead of discarding the nonnegative square in the source's completion step,
keep the identity

\[
-\varepsilon\|Qh\|_2^2
=2\operatorname{Re}\langle\beta v,h\rangle+
  \frac{2\beta^2}{\varepsilon}
 -\varepsilon\left\|Qh+\frac{\beta v}{\varepsilon}\right\|_2^2.
\]

All later majorizations apply to the terms preceding the square. Consequently
every valid profile cap \(C_i\) yields the stronger bound

\[
V:=\operatorname{Re}\langle f,T_ng\rangle
\le F_i(t)-\varepsilon\left\|Qh+\frac{\beta_i v}{\varepsilon}\right\|_2^2,
\qquad F_i(t)=t^2-2\ell_i t+C_i.
\]

The elementary branch has \(\ell_0=\beta_0=0\) and
\(C_0=\varepsilon\rho^2\), where the previously certified
\(\rho=977459/1000000\) is now used.

For any probability weights \(w_i\), the Hilbert-space variance identity gives

\[
V\le\sum_iw_iF_i(t)-\frac{2}{\varepsilon}
 \left(\sum_iw_i\beta_i^2-\left(\sum_iw_i\beta_i\right)^2\right)
 -\varepsilon\left\|Qh+\frac{\bar\beta v}{\varepsilon}\right\|_2^2,
\qquad\bar\beta=\sum_iw_i\beta_i.
\]

Only the last square is discarded in the scalar-envelope stage. There is no
assumption that separate profile equality cases are simultaneously attainable.

## 2. Joint convexity of the physical potential

For a profile with matrix \(M\), parameters \(\ell,\beta\), and scalar
argument \(\omega\), the defining potential minus
\(2\beta^2/\varepsilon\) is a supremum of functions jointly affine in
\((M,\ell,\beta,\omega)\). Thus it is jointly convex.

Take two source profiles, let \(0<w<1\), and average their matrices,
\(\ell\), and \(\beta\). Put

\[
d=w\delta_1+(1-w)\delta_2,\qquad
g=\frac{2w(1-w)}{\varepsilon}(\beta_1-\beta_2)^2.
\]

For any \(\lambda_1,\lambda_2\ge0\) with
\(w\lambda_1+(1-w)\lambda_2=d\), joint convexity gives

\[
\Psi_{\rm av}(\omega)
\le w\Psi_1\!\left(\frac{\lambda_1}{d}\omega\right)
 +(1-w)\Psi_2\!\left(\frac{\lambda_2}{d}\omega\right)-g.
\]

In particular, any two certified global physical polynomial majorants
\(p_i\ge\Psi_i\) give

\[
\Psi_{\rm av}(s)
\le w p_1(\lambda_1s/d)+(1-w)p_2(\lambda_2s/d)-g
\quad(s\ge0).
\]

The source scales \(\lambda_i=\delta_i\) are one choice; other scales can
be better. A convenient parameterization is
\(\lambda_1=\delta_1+\eta\),
\(\lambda_2=\delta_2-w\eta/(1-w)\).
The potentials and their majorants are global, so the new scaled arguments
need not lie in a source profile's old moment-search rectangle.

The averaged profile still has the completed square with center
\(\bar\beta\). Thus its cap can later be combined with other profile caps
using the variance identity again. Each variance term is used at its own
interpolation step; none is counted twice.

## 3. Remove matrix slack

The residual parameter enters one matrix condition,
\(E\succeq\operatorname{diag}(\varepsilon-\delta,0,0)\), but it does not
enter the physical potential. Write

\[
E=\begin{pmatrix}a&b^T\\b&C\end{pmatrix},\qquad C\succ0.
\]

The condition is equivalent to

\[
\delta\ge\delta_{\min}=\varepsilon-a+b^TC^{-1}b.
\]

After averaging profiles, choose a positive rational
\(d'\in(\delta_{\min},d]\). The exact matrix gates in the verifier check
that the resulting profile is admissible. No new physical polynomial is
needed, because its potential is unchanged.

For its actual residual \(q=d'Q_wc_1\), set
\(\sigma=\|q\|_2\) and \(u=\sigma/d\). The actual range is
\(0\le u\le(d'/d)\rho\). We conservatively certify the larger range
\(0\le u\le\rho\). The negative quadratic term is exactly

\[
-\sigma^2/d'=-\frac{d^2}{d'}u^2.
\]

When the argument scales remain \(\delta_1,\delta_2\), this subtracts the
additional amount \((d^2/d'-d)u^2\) from the old coupled moment bound.

## 4. One common residual-moment problem

For \(\sigma>0\), put \(Y=q/\sigma\) and
\(x^2=\mathbb E|Y|^4-2\). The verified prior moment inequalities give

\[
\mathbb E|Y|\le\rho,\quad\mathbb E|Y|^2=1,\quad
\mathbb E|Y|^4=2+x^2,\quad
\mathbb E|Y|^6\le6+9x^2+C_6x^3,
\quad C_6=49.42289,
\]

with \(0\le x\le\sqrt{60}<31/4\).
For \(\sigma=0\), only the constant coefficient is needed.

Write the two already lifted physical polynomials as
\(p_i(s)=a_{i0}+a_{i1}s+a_{i2}s^2+a_{i4}s^4+a_{i6}s^6\), where
\(a_{i1},a_{i6}\ge0\). Set

\[
A_k=w a_{1k}\lambda_1^k+(1-w)a_{2k}\lambda_2^k.
\]

The averaged profile is bounded by the following polynomial in \(u\):

\[
J(u,x)=A_0-g+\rho A_1u+
 \left(A_2-\frac{d^2}{d'}\right)u^2+
 A_4(2+x^2)u^4+A_6(6+9x^2+C_6x^3)u^6.
\]

Both source polynomials refer to the same \(Y,u,x\). Maximizing them
separately would discard that constraint. Also, after changing argument
scales, one must use the single penalty \(-d^2u^2/d'\), not the separate
source penalties \(-w\lambda_1^2u^2/\delta_1-(1-w)\lambda_2^2u^2/\delta_2\).

For each rectangle covering \([0,\rho]\times[0,31/4]\), the certificate
chooses two polynomials and, where useful, an argument allocation. Each fixed
choice is a globally valid moment bound, so the selection may depend on the
rectangle. For fixed \(u\), the variable part in \(x\) is
\(Ax^2+Dx^3\) with \(D\ge0\); a positive interior stationary point is
a minimum. It therefore suffices to check both \(x\)-endpoints. At each
endpoint, exact Bernstein coefficients in \(u\) certify the whole interval.

Every leaf carries a binary bisection path. Prefix-freeness and the exact
Kraft equality verify complete coverage; no numerical sampling is used to
accept a leaf. There are 21 virtual profiles and 4,197 leaves in the delivered
certificate. The exact gates also check every modified matrix and every
weighted-argument identity.

## 5. The final scalar envelope

For two certified profiles put
\(a=2(\beta_i-\beta_j)^2/\varepsilon\). Minimizing their variance-corrected
mixture over \(0\le w\le1\) gives the ordinary better endpoint when
\(|F_i-F_j|\ge a\), and otherwise gives

\[
\frac{F_i+F_j}{2}-\frac a4-\frac{(F_i-F_j)^2}{4a}.
\]

Because \(F_i-F_j\) is affine in \(t\), this is piecewise quadratic.
An exact maximum on an interval is found from its endpoints and, for a
concave piece, its vertex. The range \(0\le t\le9/10\) contains all
admissible \(t\). The independent scalar verifier checks a complete
20-interval cover and proves every chosen bound at most
\(3569353321/5000000000\).

Multiplying that rational by 1.400813971 gives a number strictly less than
one, proving the advertised strict lower endpoint.

## Verification scope and dependencies

`base/verify_all.py` replays the nine source profiles and 997 price/Schur
certificates, the 220 source and 48 added physical polynomials, and the prior
moment refinements. As documented in the previous work, stored point caps
and physical-polynomial constants are all conservatively lifted by exactly
\(10^{-8}\); the unmodified source run is not represented as passing.

`verify_joint_profiles.py` independently checks the new rational rectangles,
matrix averages, modified matrix gates and argument allocations.
`verify_augmented_envelope.py` independently checks the final scalar cover.
The final driver runs all of these in order. Successful output is in
`logs/full-verification.txt`.

The optimizers and certificate constructors are not needed for verification.
The two final verifier implementations do not import those constructors.
They do reuse the upstream exact profile gate, whose pinned source is an
explicit dependency. These calculations are not a proof-assistant
formalization or an external mathematical review.
