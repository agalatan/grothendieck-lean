<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/proof.md (file dated 2026-11-05). Only this line was added. -->
# R26: the full Hermitian self-interaction family

5 November 2026. A proof with a reproducible interval and integer certificate.

## Statement

Let (Z,W,X,Y_1,\ldots,Y_n) be independent standard complex Gaussians, normalized by (\mathbb E|Z|^2=1). Put
\[
T=|Z|^2,\quad L=Z(a+bT),\quad
F(q)=2\mathbb E|L+q|,\quad B(u)=2\mathbb E|L+\sqrt u W|,
\]
\[
F_A(z)=\mathbb E_Z[(T-1)\operatorname{ph}(L+z)]=z g(|z|^2),
\quad C(q)=\|\Pi_{1,0}F_A(q)\|_2,
\quad \Delta(q)=B(u)-F(q).
\]
The projection includes all remote Gaussian coordinates. These definitions use the **same-energy deficit**, not the penalized deficit.

At each of the following profiles:

| Profile | epsilon | a | b |
|---|---:|---:|---:|
| Peak | 1891/2500 | 699/1250 | 179/1250 |
| Flank | 149/200 | 14/25 | 1467/10000 |
| Upper | 1891/2500 | 573/1000 | 19/125 |

let
\[
q=e^{i\alpha}X\left[c(|X|^2-2)+Y^*AY-\operatorname{tr}A\right],
\qquad c\in\mathbb R,\quad A=A^*.
\]
There is no restriction on the dimension or on the signs, multiplicities, or concentration of the eigenvalues of (A).

**Theorem.** If
\[
\frac3{100}\le u=2c^2+\operatorname{tr}(A^2)\le\frac{463}{10000},
\]
then
\[
\boxed{\Delta(q)\ge\frac1{40000},\qquad
C(q)^2\le\frac{23}{100}\left(\Delta(q)-\frac1{40000}\right).}
\tag{1}
\]
In particular, (C(q)^2<(6/25)\Delta(q)). Thus R26 is closed throughout the requested interval for the entire stated Hermitian family, including (c=0) and (A=0).

The proof actually covers (u\in[(17/100)^2,(27/125)^2]=[0.0289,0.046656]). The smaller interval in the statement is the requested one.

## 1. Reduction to a one-dimensional moment problem

Write (R=|X|^2\sim\mathrm{Exp}(1)), and define
\[
\phi(v)=2\mathbb E_Z|L+\sqrt v|.
\]
Global phase is immaterial; changing (q) to (-q), if necessary, permits (c\ge0). For (P=Y^*AY-\operatorname{tr}A), put
\[
b=c(R-2)+P.
\]
The exact identities are
\[
F(q)=\mathbb E\phi(Rb^2),\qquad
\mathcal C(q)=\mathbb E[Rb\,g(Rb^2)],\qquad C(q)=|\mathcal C(q)|.
\tag{2}
\]
The (Y)-direction first-chaos coefficients vanish by the phase symmetry of (X). In particular, the content weight is **(R=|X|^2)**.

For (p=\mathbb EP^2>0), let (Q=P/\sqrt p). Diagonalizing (A/\sqrt p), write (Q=\sum_i\lambda_i(S_i-1)), with independent exponential (S_i) and \(\sum_i\lambda_i^2=1\). If (m_k=\mathbb EQ^k) and (s_k=\sum_i\lambda_i^k), then
\[
m_3=2s_3,\quad m_4=3+6s_4,\quad
m_6=15+90s_4+40s_3^2+120s_6.
\]
Since (s_3^2\le s_4) and (s_6\le s_4\le1),
\[
\boxed{\mathbb EQ=0,\quad \mathbb EQ^2=1,\quad
3\le m_4\le9,\quad |m_3|\le2,\quad
m_6-\frac{125}{3}m_4\le-110.}
\tag{3}
\]
The remainder of the proof works for **any real random variable satisfying (3)**, independently of (X). No additional property of its spectral representation is used.

Set (t=\sqrt u), and parametrize
\[
c=\frac{t\sin\theta}{\sqrt2},\qquad \sqrt p=t\cos\theta,
\qquad 0\le\theta\le\pi/2.
\tag{4}
\]
When (p=0), choose any (Q) satisfying (3); its coefficient is zero.

For fixed (t,\theta), write \(\sigma=t\cos\theta\), and define scalar functions
\[
f(z)=\mathbb E_R\phi\big(R[c(R-2)+\sigma z]^2\big),
\]
\[
h(z)=\mathbb E_R R[c(R-2)+\sigma z]
 g\big(R[c(R-2)+\sigma z]^2\big).
\tag{5}
\]
Then (F(q)=\mathbb Ef(Q)), \(\mathcal C(q)=\mathbb Eh(Q)\).

We certify the quadratic-dual inequality
\[
F(q)+2\ell\mathcal C(q)-B(t^2)-\frac{23}{100}\ell^2
\le-\frac1{40000}.
\tag{6}
\]
It suffices to prove (6) for \(|\ell|\le2/5\). Indeed, \(\mathbb E\overline Xq=0\), and the kernel bound \(-209/250<g\le0\) gives
\[
|\mathcal C(q)|
=|\mathbb E\overline Xq[g(|q|^2)-g(0)/2]|
\le\frac{209}{500}t.
\]
Thus \(|\mathcal C|/(23/100)<2/5\) for (t\le27/125). Taking \(\ell=\mathcal C/(23/100)\) in (6) proves (1).

## 2. Positive kernels and rigorous scalar enclosures

Let \(\iota(s)\) be the inverse of (s=r(a+br)^2), and set
\[
f_0(s)=e^{-\iota(s)},\qquad
h_0(s)=\frac{e^{-\iota(s)}}{(a+b\iota(s))^2}.
\]
The following nonsingular identities give the kernels used in the certificate:
\[
-g(v)=\frac2\pi\int_0^{\pi/2}\sin^2\beta
\int_0^\infty h_0(y^2+v\sin^2\beta)\,dy\,d\beta,
\tag{7}
\]
\[
\phi'(v)=\frac4\pi\int_0^{\pi/2}\cos^2\beta
\int_0^\infty[-f_0'(y^2+v\sin^2\beta)]\,dy\,d\beta.
\tag{8}
\]
They follow by the Gaussian-mixture representation, Euler's integral for the confluent hypergeometric function, and the fractional-integral representation of \(\lambda^{-1/2}\). Equivalently, direct angular integration and integration by parts give these identities.

The function \(\iota\) is Bernstein: its derivative
\[
\iota'(s)=a^{-2}{}_2F_1(2/3,4/3;3/2;-27bs/(4a^3))
\]
has a positive Euler integral. Consequently (f_0,h_0,-g,\phi') are completely monotone. The inverse is holomorphic off the cut \(s\le-4a^3/(27b)\), which lies strictly to the left of \(-1/20\) at every profile. Taylor expansion with nonnegative Laplace moments extends the corresponding Laplace representations to \(\Re s>-1/20\).

The Arb-generated tables rigorously enclose (H=-g, P=\phi', G=g', U=-\phi'') at 140 nonnegative dyadic nodes and at one node slightly below \(-1/20\), per profile. They verify
\[
H(-1/20)<1,\quad P(-1/20)<2,\quad
H(0)<209/250,\quad G(0)<54/25,\quad P(0)<3/2.
\tag{9}
\]
Also \(\phi(0)=\sqrt\pi(a+3b/2)<3/2\).

For clarity, the numerical integrals defining these node values are enclosed by Arb ball arithmetic, not by comparing ordinary quadrature grids. The inverse used is
\[
\iota(s)=\frac{2a}{3b}
\left[{}_2F_1(-1/3,1/3;1/2;-27bs/(4a^3))-1\right].
\]
The callbacks explicitly reject integration balls crossing the cut. The (y)-integrals stop at 80; at every profile, \(\iota(80^2-0.051)>60\). Substitution (y=\sqrt{r(a+br)^2-v\sin^2\beta}\) bounds the four omitted tails by (10^{-24}); the implementation adds (10^{-20}). Bounds (a>1/2,b<0.16) suffice. For example, the (h_0) tail is bounded by \(\int_{60}^\infty3e^{-r}/\sqrt r\,dr\); its derivative is at most (6.56) times this majorant. The other two tails are bounded similarly using \(d=(a+br)(a+3br)\), \(1/d\le4\), and \(d'/d\le1.28\).

### Cubic Hermite interpolation

On a kernel interval ([x,x+h]), the cubic Hermite interpolant using exact endpoint values and derivatives underestimates each of (H,P), since its fourth derivative is nonnegative. If (K=H) or (P), its error is at most
\[
\frac{5K(-1/20)}{384}\left(\frac h{x+1/20}\right)^4.
\tag{10}
\]
Indeed, \(K^{(4)}(x)\le5K(-1/20)/(x+1/20)^4\), by its Laplace representation and \((4/e)^4<5\). On the chosen grid, (10) is less than (1.4\times10^{-6}) for (H), and (2.8\times10^{-6}) for (P).

Endpoint uncertainty is propagated by exact interval arithmetic. Integrating the interpolant of (P) gives an enclosure of \(\phi\), with additional one-sided error at most \(2.8\times10^{-6}v\). The code does not discard the derivative-node uncertainties.

### Radial quadrature

The (R)-integrals in (5) are evaluated on ([0,32]), using 12-point Gauss-Legendre rules on 129 dyadic panels, a total of 1548 nodes. Both nodes and exponentially weighted weights are first enclosed by Arb.

Here is an explicit analytic error bound. On a panel centered at (r), of length \(\rho\), use the complex disk \(|w-r|\le\rho\). Write (v(w)=w(cw+d)^2), with (d=\sigma z-2c). For (r>\rho), minimization over the real value (b=cr+d) gives
\[
\Re v(w)\ge-\frac{2c^2r\rho^2(r+\rho)}{r-\rho}.
\tag{11}
\]
The exact rational panel construction makes this greater than \(-1/20\), using (c^2\le3/125). The first panel uses the direct bound \(|v(w)|\le(r+\rho)[(153/1000)(r+\rho)+463/100]^2<1/20\).

For \(|z|\le20\), we have (c<153/1000), \(|d|<463/100\). Equations (9) give disk bounds
\[
M_F=e^{-r+\rho}\{3/2+2(r+\rho)[(153/1000)(r+\rho)+463/100]^2\},
\]
\[
M_C=e^{-r+\rho}(r+\rho)[(153/1000)(r+\rho)+463/100].
\]
The Bernstein ellipse of parameter 3 lies inside this disk. Truncating its Chebyshev series at degree 23, and using positivity and exactness of Gaussian quadrature, bounds the panel errors by \(6\rho M_F/3^{24}\) and \(6\rho M_C/3^{24}\).

Summing these bounds and adding explicit exponential-moment tails above 32 gives errors less than (2.57\times10^{-9}) and (2.49\times10^{-10}), respectively. The implementation allows (10^{-8}) for each.

**All subsequent integral evaluations use fixed-point integer intervals with denominator (2^{48}).** Multiplication and division round outward using signed 128-bit integer arithmetic. Kernel arguments are enclosed; evaluating at an enclosed midpoint adds the rigorous Lipschitz allowances \(3\delta\) for (g) and \((3/2)\delta\) for \(\phi\). There is no floating-point quadrature assumption in these scalar enclosures.

## 3. The finite moment-dual certificate

The parameter grid is
\[
t\in\{.170,.175,.180,.185,.190,.195,.200,.205,.210,.215,.216\},
\qquad \theta_j=2\arctan(j/50),\quad j=0,\ldots,50,
\]
\[
\ell=m/40,\qquad m=-16,\ldots,16.
\tag{12}
\]
Thus there are 561 amplitude/angle nodes and 18,513 moment duals per profile.

At each node the witness provides eight dyadic numbers (y_0,y_1,y_2,\beta_0,\ldots,\beta_4), with \(\beta_i\ge0\), and the polynomial
\[
Q_*(z)=\underline B+y_0+y_1z+y_2z^2
+\beta_0(z^6-\tfrac{125}{3}z^4)
-\beta_1z^4+\beta_2z^4+\beta_3z^3-\beta_4z^3.
\tag{13}
\]
Here \(\underline B\le B(t^2)\) is the certified scalar lower bound. The checker proves, on the **entire real line**,
\[
Q_*(z)\ge f(z)+2\ell h(z),
\tag{14}
\]
and checks exactly
\[
y_0+y_2-110\beta_0-3\beta_1+9\beta_2+2\beta_3+2\beta_4
\le\frac{23}{100}\ell^2-\frac1{10000}-\frac{|\ell|}{1000}.
\tag{15}
\]
Taking expectations and using (3) establishes the grid version of (6), with the stronger right side in (15).

For (14), the scalar grid has spacing (0.1) in ([-4,4]) and (0.25) in the remaining parts of ([-20,20]), totaling 209 nodes. The proof of the between-node bound uses
\[
(f+2\ell h)''\ge-\frac{15\sqrt\pi}{2}|\ell|\sigma^2.
\tag{16}
\]
Therefore an endpoint chord, plus \((5/3)|\ell|\sigma^2\times(\text{interval length})^2\), is an upper bound. All seven degree-six Bernstein coefficients of the difference between (13) and this upper bound are checked nonnegative.

For both infinite tails, the elementary estimates
\[
f(z)+2\ell h(z)\le A_*+B_*|z|,
\]
\[
A_*=\phi(0)+(2+(418/250)|\ell|)t\sin\theta,
\quad
B_*=(1773/1000+(418/250)|\ell|)\sigma
\tag{17}
\]
are used. They follow from the triangle inequality, \(\mathbb ER|R-2|\le\sqrt2\), \(\mathbb E\sqrt R|R-2|\le\sqrt2\), and \(\sqrt\pi<1.773\). The checker verifies that every coefficient of
\(Q_*(\pm(20+x))-A_*-B_*(20+x)\), as a polynomial in (x\ge0\), is nonnegative.

There are **27,214,110 exact polynomial coefficient comparisons per profile**, or **81,642,330** across all three profiles, in addition to the exact sign and moment-cost checks. The witness denominators are (2^{44}); the scalar-bound denominator is (2^{48}). After cancellation, all comparisons fit in signed 128-bit integers, with explicit input-size checks. The linear-programming solver only finds candidate witnesses; none of its feasibility or optimality assertions is trusted.

## 4. Uniformity between parameter nodes

Let \(\psi(w)=wg(|w|^2)\), and \(\Phi(w)=\phi(|w|^2)=2\mathbb E|L+w|\). Complete monotonicity and (9) give
\[
\|D\psi\|<209/250,\qquad \|D^2\psi\|<5,
\qquad 0\preceq D^2\Phi\preceq3I.
\tag{18}
\]
For the second inequality, writing \(-g(s)=\int e^{-vs}\nu(dv)\), the second derivative of (we^{-v|w|^2}) is bounded by
\[
\sqrt v(6\sqrt x+4x^{3/2})e^{-x},\qquad x=v|w|^2.
\]
The parenthesized scalar function has maximum at (x=\sqrt3/2), less than (3.705). Also \(\int\sqrt v\nu(dv)\le\sqrt{H(0)G(0)}\). The resulting bound is less than (4.979<5). This also proves (16).

For \(Q_\theta=X[(\sin\theta/\sqrt2)(R-2)+\cos\theta Q]\), expansion using (3) gives
\[
\mathbb E|Q_\theta|^4\le44.
\tag{19}
\]
Explicitly, for (x^2+y^2=1), its fourth moment is at most
\(44x^4+24x^2y^2+8\sqrt2|xy^3|+18y^4\le44\).
The same bound applies to \(\partial_\theta Q_\theta\).

Write
\[
\mathcal H(t,\theta,\ell)=F(tQ_\theta)+2\ell\mathcal C(tQ_\theta)-B(t^2)-(23/100)\ell^2.
\]
Equations (18)–(19), \(\partial_\theta^2Q_\theta=-Q_\theta\), and Cauchy–Schwarz imply throughout the enlarged rectangle
\[
\mathcal H_{tt}\ge-(3+67|\ell|),\qquad
\mathcal H_{\theta\theta}\ge-(.14+3.5|\ell|),\qquad
\mathcal H_{\ell\ell}=-.46.
\tag{20}
\]
For example,
\[
|\mathcal C_{\theta\theta}|\le5t^2\sqrt{44}+(209/250)t<7/4,
\quad |\mathcal C_{tt}|\le5\sqrt{44}<33.5,
\]
and (F_{\theta\theta}\ge-3t^2\ge-.14).

A function with second derivative at least (-M) is bounded above by its endpoint chord plus (M h^2/8). Apply this successively in \(\ell,\theta,t\). The grid spacings satisfy
\(h_\ell=1/40, h_\theta\le1/25, h_t\le1/200\).
Using the slightly larger curvature (0.48) in \(\ell\), the total interpolation allowance is at most
\[
\frac3{80000}+\frac{.14+3.5|\ell|}{5000}
+\frac{3+67|\ell|}{320000}
=.000074875+.000909375|\ell|.
\]
The grid reserve in (15) is \(.0001+.001|\ell|\). Their difference is
\[
\frac{201}{8000000}+\frac{29}{320000}|\ell|>\frac1{40000}.
\]
This proves (6) uniformly, and completes the proof of the theorem.

## 5. Consequence for the previously certified shared-A shell

Use the inherited shell-cost estimate, in its stated range \(\|U\|_2^2\le113/10000\):
\[
\Lambda(q+(T-1)U)\le\Lambda(q)+2\Re\langle U,F_A(q)\rangle-\frac6{25}\|U\|_2^2.
\]
Completing the square and using (1) gives
\[
\Lambda(q+(T-1)U)
\le B(u)-pu-\frac{\Delta(q)}{24}-\frac{23}{960000}
\le S-\frac1{40000}.
\]
This consequence uses the existing shell-cost theorem; it is not a new certification of that input.

The theorem treats real (c) and Hermitian (A), up to the displayed global phase. It does not assert the corresponding statement for an arbitrary complex quadratic (P), or for simultaneous mixtures of all six shells. It does not by itself prove full Conjecture K. The earlier rejection of exact monomial extremality is unchanged.
