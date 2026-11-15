<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_twenty_percent_extension/r26_extension/remaining_r26.md (file dated 2026-11-05). Only this line was added. -->
# Exact integrated-deficit reduction for the remaining R26 region

The identities and sufficient criterion below are proved. The final
pointwise matrix envelope has not been certified over its full parameter
domain. This note is not a proof of the rest of R26.

Use the notation of proof.md, take c>0 by a constant phase rotation, and set
u=2c^2+p. Define functions of a deterministic complex coefficient z:

\[
F_c(z)=\mathbb E_R\phi(R|c(R-2)+z|^2),
\]

\[
h_c(z)=\mathbb E_R\!\left[
R(c(R-2)+z)g(R|c(R-2)+z|^2)\right].
\]

Then, exactly,

\[
F(q)=\mathbb E_PF_c(P),\qquad C(q)=|\mathbb E_Ph_c(P)|.
\]

## A positive pointwise deficit after integrating the Wick radius

Put A(u)=-B''(u) and

\[
K(u)=2uA(u)+u^2A'(u)
     =-2uB''(u)-u^2B'''(u)>0.
\]

Define

\[
\boxed{\quad
d_{c,u}(z)=B(u)+B'(u)(|z|^2-p)
          +2cuB''(u)\Re z-F_c(z).
\quad}                                                     \tag{11}
\]

This function is pointwise positive, with the quantitative bound

\[
\boxed{\quad d_{c,u}(z)\ge c^2K(u)>0
\quad\text{for every }z\in\mathbb C.\quad}                  \tag{12}
\]

Moreover,

\[
\boxed{\quad
\mathbb E_Pd_{c,u}(P)=B(u)-F(q)=\Delta.
\quad}                                                     \tag{13}
\]

Thus the full deficit, including the positive self-interaction term, can
serve as a single Cauchy--Schwarz weight after the R integration.

### Proof

Use the size-biased Gamma(2,1) expectation

\[
\widehat{\mathbb E}H(R)=\mathbb E[R H(R)].
\]

Concavity of phi makes the following Bregman remainder nonnegative:

\[
d_{u,r}(v)=
\frac{\phi(ru)+r\phi'(ru)(v-u)-\phi(rv)}r\ge0.
\]

For V=|c(R-2)+z|^2,

\[
V-u=c^2(R^2-4R+2)+2c(R-2)\Re z+(|z|^2-p).
\]

Gamma integration by parts gives

\[
\widehat{\mathbb E}[(R-2)\phi'(uR)]=uB''(u),
\]

\[
\widehat{\mathbb E}[(R^2-4R+2)\phi'(uR)]
=2uB''(u)+u^2B'''(u)=-K(u).
\]

Substitution yields the exact identity

\[
d_{c,u}(z)=c^2K(u)
 +\widehat{\mathbb E}\,
 d_{u,R}(|c(R-2)+z|^2),                                    \tag{14}
\]

which proves (12). In (13), the two explicit control terms average to zero
because E P=0 and E|P|^2=p.

For positivity of K, let nu be the positive Gaussian-scale mixing measure
associated with the radial survival of L. Then

\[
K(u)=\frac{\sqrt\pi\,u}{8}
\int\frac{\lambda^{3/2}(4+\lambda u)}
          {(1+\lambda u)^{5/2}}\,\nu(d\lambda)
\ge\frac12uA(u)>0.
\]

## Centered controls and a two-by-two matrix criterion

Let v(z)=(Re z,Im z)^T and h(z)=(Re h_c(z),Im h_c(z))^T.
For any real 2x2 matrix M and real vector n, set

\[
H(z)=h(z)-M v(z)-n(|z|^2-p).
\]

Then E H(P)=E h(P). Weighted Cauchy--Schwarz in every real direction gives
the Loewner-order inequality

\[
(\mathbb E H)(\mathbb E H)^T
\preceq \Delta\,
\mathbb E\frac{H(P)H(P)^T}{d_{c,u}(P)}.                      \tag{15}
\]

Assume now that P=Y^*AY-tr(A) is a centered complex Gaussian quadratic,
with p>0. Put

\[
\Sigma=\mathbb E[v(P)v(P)^T],\qquad
\tau=\frac{|\mathbb EP^2|}{p}\in[0,1].
\]

The eigenvalues of Sigma are p(1+tau)/2 and p(1-tau)/2.
The coupled moment inequality proved below is

\[
\mathbb E|P|^6\le\alpha(\tau)p\,\mathbb E|P|^4
                    -\beta(\tau)p^3,
\]

\[
\alpha(\tau)=25+\frac{50}{3}\tau,\qquad
\beta(\tau)=44+66\tau^2.                                   \tag{16}
\]

Let

\[
Q(y)=a_0+a_1y+a_3(y^3-\alpha(\tau)y^2),\qquad a_3\ge0.
\]

A sufficient pointwise certificate is

\[
\boxed{\quad
\frac{H(z)H(z)^T}{d_{c,u}(z)}
\preceq
Q(|z|^2/p)I_2+\gamma\,\frac{v(z)v(z)^T}{p}
\quad(z\in\mathbb C),\qquad\gamma\ge0.
\quad}                                                     \tag{17}
\]

Indeed, taking expectations in (17), using (15)--(16), and taking the
largest eigenvalue gives

\[
\boxed{\quad
C(q)^2\le
\left[a_0+a_1-\beta(\tau)a_3
                  +\gamma\frac{1+\tau}{2}\right]\Delta.
\quad}                                                     \tag{18}
\]

Consequently, finding controls and an envelope satisfying (17) with the
bracket in (18) at most 6/25 would close the remaining content inequality.
Uniform rational enclosures of (17), including the unbounded z tail and
the small-c limit, are still needed. Numerical selection of coefficients
at individual parameter points does not establish (17).

### Proof of the moment inequality

Write V=|P|^2, rho=||Sigma||, and let G be an independent standard real
two-dimensional Gaussian. Each real projection G.v(P), with G fixed,
is a centered Hermitian Gaussian quadratic. The elementary Hermitian
moment inequality is

\[
\mathbb E Q_0^6\le\frac{125}{3}(\mathbb E Q_0^2)
                           (\mathbb E Q_0^4)
                      -110(\mathbb E Q_0^2)^3.
\]

For completeness, diagonalizing its Hermitian matrix gives
E Q_0^4=3s_2^2+6s_4 and
E Q_0^6=15s_2^3+90s_2s_4+40s_3^2+120s_6.
The inequalities s_3^2<=s_2s_4 and s_6<=s_2s_4 prove the displayed bound.

Averaging it over G and using real Gaussian moments yields

\[
15\,\mathbb EV^3
\le125(p+4\rho)\mathbb EV^2
 -110\{p^3+6p\operatorname{tr}\Sigma^2
                       +8\operatorname{tr}\Sigma^3\}.
\]

The identities used here are

\[
\mathbb E_G(G.v)^6=15|v|^6,
\]

\[
\mathbb E_G[(G^T\Sigma G)(G.v)^4]
=3p|v|^4+12|v|^2v^T\Sigma v
\le3(p+4\rho)|v|^4,
\]

\[
\mathbb E_G(G^T\Sigma G)^3
=p^3+6p\operatorname{tr}\Sigma^2+8\operatorname{tr}\Sigma^3.
\]

Insert rho=p(1+tau)/2,
tr(Sigma^2)=p^2(1+tau^2)/2, and
tr(Sigma^3)=p^3(1+3tau^2)/4, then divide by 15. This proves (16).

## Precise remaining domain

The completed certificate in proof.md covers p<=u/5, for
0.03<=u<=0.0463 and all three rows. The prior pure-P theorem covers c=0.
The still-unproved region considered by (17) is

\[
0.03\le2c^2+p\le0.0463,\qquad c>0,\qquad p>(2c^2+p)/5.
\]

Nothing in this note supplies a content estimate for arbitrary mixtures
of the other cubic shells.
