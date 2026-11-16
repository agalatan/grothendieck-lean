<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/certificate-32-25/PROOF.md, delivered by an outside GPT and relayed by the user on 15 November 2026. -->
<!-- odd_sector_certificate/PROOF.md -->
# A computer-assisted proof of the odd-sector inequality

Let
\[
a=699/1250,\qquad b=179/1250,\qquad p=2500/1891,
\quad h(t)=a+bt,\quad d(t)=(t-2)/\sqrt2.
\]
Let \(Z\) be a standard complex Gaussian, so its planar density is
\(\pi^{-1}e^{-|z|^2}\), and put \(T=|Z|^2\), \(L=Zh(T)\).

**Theorem.** Suppose that \(q,Q,P\) are complex random variables jointly independent
of \(Z\), with finite second moments, and \(\mathbb E Q=0\). They may have arbitrary
dependence on one another. Let \(\nu\in\mathbb C\) be deterministic and
\[
X=L+q,\qquad O=ZQ+\overline ZP+\nu Zd(T).
\]
Then
\[
\boxed{\mathbb E\bigl[|X+O|+|X-O|-2|X|\bigr]
\le \frac{32}{25}\bigl(\mathbb E|Q|^2+\mathbb E|P|^2+|\nu|^2\bigr).}
\tag{1}
\]
In particular, this proves the requested inequality (★), with no restriction
on \(u=\mathbb E|q|^2\) or on the odd energy. It also proves the version with the
additive tolerance, with tolerance zero. The Wick hypotheses imply the
hypotheses above: independence from \(Z\) is part of the setting, and every
member of \(H_{1,1}\) has mean zero. No conditional centering is imposed.

The proof has one computer-assisted part: a uniform inequality for two explicit
real symmetric \(3\times3\) matrices depending on one real parameter. That part
was verified with outward interval arithmetic on the whole compact parameter
interval, including interpolation error. The unbounded parameter tail is proved
analytically. All the numerical checks used in the proof are completed; none are
left as assumptions. The supplied implementation is not a Lean formalization.

## 1. A finite-amplitude geometric inequality — proved analytically

For all \(x\ne0\) and \(y\in\mathbb C\),
\[
|x+y|+|x-y|-2|x|
\le \frac{|y|^2}{|x|}
-\frac{(\operatorname{Re}(\overline xy))^2}{2|x|^3}.
\tag{2}
\]

To prove this, rotate and scale so \(x=1\), and write \(y=s+it\). Put
\(\lambda=(|1+y|+|1-y|)/2\ge1\). If \(\lambda=1\), the left side is zero.
If \(\lambda>1\), the ellipse identity gives
\[
\alpha:=s^2/\lambda^2,\quad
\beta:=t^2/(\lambda^2-1),\quad \alpha+\beta=1.
\]
Consequently
\[
\begin{aligned}
\frac{s^2}{2}+t^2-2(\lambda-1)
&=\alpha\frac{(\lambda-2)^2}{2}+\beta(\lambda-1)^2\ge0.
\end{aligned}
\]
This is precisely (2). It is valid at arbitrary amplitude; no Taylor remainder
or smallness assumption occurs.

In real coordinates define
\[
K(x)=\frac1{|x|}\left(I_2-\frac{xx^{\mathsf T}}{2|x|^2}\right).
\tag{3}
\]
The right side of (2) is \(y^{\mathsf T}K(x)y\).

## 2. The conditional inequality with a compensating term

The stronger statement proved below is that for **every** four constants
\(w,c,e,\nu\in\mathbb C\),
\[
\begin{aligned}
&\mathbb E_Z\bigl[|L+w+Zc+\bar Ze+\nu Zd|
 +|L+w-Zc-\bar Ze-\nu Zd|-2|L+w|\bigr]\\
&\qquad\le \frac{32}{25}(|c|^2+|e|^2+|\nu|^2)
-\frac35\operatorname{Re}c\operatorname{Re}\nu
-\frac65\operatorname{Im}c\operatorname{Im}\nu.
\end{aligned}
\tag{4}
\]
The last two terms are also
\(-\frac9{10}\operatorname{Re}(c\bar\nu)+\frac3{10}\operatorname{Re}(c\nu)\).
They are retained in the conditional inequality, and vanish after expectation
when \(c=Q\). Thus (4) does not assert the false conditional inequality without
this compensating term.

To reduce (4), first write \(w=re^{i\phi}\) and replace \(Z\) by
\(e^{i\phi}Z\). The common output phase cancels in the moduli, and the only
coefficient that changes is \(e\mapsto e^{-2i\phi}e\). In particular, the
compensating term is unchanged. It therefore suffices to take \(w=r\ge0\).

Set
\[
v_1=Z,\quad v_2=\bar Z,\quad v_3=Zd(T),\qquad x=L+r.
\]
For a sign label \(\sigma\in\{+,-\}\), put
\(v_j^+=v_j\), \(v_j^-=iv_j\), and define
\[
M_{\sigma,jk}(r)=\mathbb E_Z\left[
 \frac{\operatorname{Re}(v_j^\sigma\overline{v_k^\sigma})}{|x|}
-\frac{\operatorname{Re}(\bar x v_j^\sigma)
       \operatorname{Re}(\bar x v_k^\sigma)}{2|x|^3}
\right].
\tag{5}
\]
These integrals are finite. Reflection \(Z\mapsto\bar Z\) makes every term
mixing a real coefficient with an imaginary coefficient vanish. Thus, with
\(v_R=(\operatorname{Re}c,\operatorname{Re}e,\operatorname{Re}\nu)\) and
\(v_I=(\operatorname{Im}c,\operatorname{Im}e,\operatorname{Im}\nu)\), the
conditional expectation of the majorant (2) is
\(v_R^{\mathsf T}M_+(r)v_R+v_I^{\mathsf T}M_-(r)v_I\).

Define the constant matrices
\[
C_+=\begin{pmatrix}0&0&-3/10\\0&0&0\\-3/10&0&0\end{pmatrix},
\qquad
C_-=\begin{pmatrix}0&0&-3/5\\0&0&0\\-3/5&0&0\end{pmatrix}.
\tag{6}
\]
The exact one-parameter matrix inequalities used are
\[
\boxed{M_+(r)-C_+\preceq\frac{32}{25}I_3,
\qquad M_-(r)-C_-\preceq\frac{32}{25}I_3
\quad(r\ge0).}
\tag{7}
\]
Equations (2) and (7) imply (4), because the quadratic forms of the matrices
in (6) give exactly the two compensating terms in (4).

For someone wishing to replace the numerical implementation, (5)–(7) specify
the numerical assertions completely. Equivalently, positivity of the three
leading principal minors of \((32/25)I_3-M_\sigma(r)+C_\sigma\), for each sign,
is a list of six scalar inequalities in the single variable \(r\).

## 3. A nonsingular integral for the matrices — proved analytically

The following change of variables is used in the certificate, so it never
numerically integrates the singular expressions in (5).

Write \(\ell=L\). If \(s=|\ell|^2\), let \(t=\tau(s)\) be the unique nonnegative
root of
\[
s=t(a+bt)^2.
\tag{8}
\]
This inverse exists because
\[
\frac{d}{dt}\bigl(t(a+bt)^2\bigr)=(a+bt)(a+3bt)>0.
\]
The planar density of \(\ell\) is
\[
f_L(\ell)=\frac{e^{-t}}{\pi(a+bt)(a+3bt)}.
\tag{9}
\]
Use polar coordinates centered at \(x=\ell+r=0\):
\[
x=\rho(\cos\theta,\sin\theta),\quad
\ell=(\xi,\eta)=(\rho\cos\theta-r,\rho\sin\theta).
\]
The Jacobian \(\rho\) cancels the \(1/|x|\) in (3). Define
\[
F_j(s)=\frac{e^{-\tau(s)}d(\tau(s))^j}
 {(a+b\tau(s))^3(a+3b\tau(s))},\qquad j=0,1,2.
\tag{10}
\]
Let \(c_\theta=\cos\theta\), \(s_\theta=\sin\theta\),
\(S=\xi^2+\eta^2\), and set
\[
\begin{array}{lll}
R_+=\xi c_\theta+\eta s_\theta,&
S_+=\xi c_\theta-\eta s_\theta,\\
R_-=\xi s_\theta-\eta c_\theta,&
S_-=\xi s_\theta+\eta c_\theta.
\end{array}
\]
For each sign define
\[
A_\sigma=S-R_\sigma^2/2,\quad
B_\sigma=\xi^2-\eta^2-R_\sigma S_\sigma/2,\quad
D_\sigma=S-S_\sigma^2/2.
\]
The matrices are exactly
\[
M_\sigma(r)=\frac2\pi\int_0^\infty\int_0^\pi
\begin{pmatrix}
F_0A_\sigma&F_0B_\sigma&F_1A_\sigma\\
F_0B_\sigma&F_0D_\sigma&F_1B_\sigma\\
F_1A_\sigma&F_1B_\sigma&F_2A_\sigma
\end{pmatrix}\,d\theta\,d\rho.
\tag{11}
\]
The factor 2 uses reflection across the real axis; the factor \(1/\pi\) is
from the Gaussian density. The integrands in (11) are smooth, including at
\(\rho=0\) and at \(\ell=0\).

A normalization check at \(r=0\) is available without planar integration. Let
\[
k_j=\int_0^\infty \frac{\sqrt t\,e^{-t}d(t)^j}{a+bt}\,dt.
\]
Then
\[
M_+(0)=\begin{pmatrix}k_0/2&0&k_1/2\\0&3k_0/4&0\\k_1/2&0&k_2/2\end{pmatrix},
\quad
M_-(0)=\begin{pmatrix}k_0&0&k_1\\0&3k_0/4&0\\k_1&0&k_2\end{pmatrix}.
\]
For orientation, ordinary quadrature gives
\(k_0\approx1.19367571735\), \(k_1\approx-0.60807855604\),
\(k_2\approx0.99183919040\). These decimal values are not used in the proof.

## 4. Compact parameter range — verified by interval arithmetic

The certificate covers \(0\le r\le8\) using 320 adjacent intervals
\([i/40,(i+1)/40]\). The integration domain is
\(0\le\rho\le24\), \(0\le\theta\le\pi\), partitioned into
512 radial cells and 128 angular cells. It uses tensor midpoint quadrature
at the two endpoints of each parameter interval.

The parameter is not treated as a finite grid: the error of matrix interpolation
between successive parameter endpoints is included explicitly. For each scalar
entry of the integrand, on each integration cell and parameter interval, the
error allocation is
\[
\frac{(\Delta\rho)^2}{24}\sup|\partial_{\rho\rho}f|
+\frac{(\Delta\theta)^2}{24}\sup|\partial_{\theta\theta}f|
+\frac{(\Delta r)^2}{8}\sup|\partial_{rr}f|.
\tag{12}
\]
It is multiplied by the integration-cell measure. These are the composite
midpoint and linear-interpolation remainder estimates. All derivative suprema
are interval enclosures over the entire corresponding box.

For reproducibility, the derivatives used are elementary. Put
\(g=(a+bt)(a+3bt)\), so
\(g'=4ab+6b^2t\). If
\(\psi_j(t)=e^{-t}d(t)^j/[(a+bt)^3(a+3bt)]\), then
\[
F_j'(s)=\frac{\psi_j'(t)}g,\qquad
F_j''(s)=\frac{\psi_j''(t)g-\psi_j'(t)g'}{g^3}.
\]
For any coordinate direction \(z\in\{\rho,\theta,r\}\) and polynomial factor
\(A\), the code evaluates
\[
\partial_{zz}[F_j(S)A]
=F_j''(S)S_z^2A+F_j'(S)S_{zz}A
 +2F_j'(S)S_zA_z+F_j(S)A_{zz}.
\tag{13}
\]
The polynomial factors and their first two derivatives are evaluated by interval
automatic differentiation. Bounds for off-diagonal errors are reflected to make
a symmetric error matrix. Its largest absolute row sum bounds its operator norm.
This row-sum error and the tail bound below are added to the diagonal before
checking positive definiteness by interval LDL elimination. Convexity of the
positive-semidefinite cone covers the whole interpolated parameter interval.

The omitted \(\rho\ge24\) contribution has operator norm at most
\[
\varepsilon_{\rm tail}=\frac{3863e^{-20}}{24}.
\tag{14}
\]
Indeed, \(|L|\ge\rho-r\ge16\), while
\(20(a+20b)^2<256\); hence \(T>20\). For coefficient norm one,
\[
|Zc+\bar Ze+\nu Zd|^2\le T(2+d(T)^2).
\]
Thus the tail is bounded by
\[
\frac1{24}\int_{20}^\infty e^{-t}
\left(\frac{t^3}2-2t^2+4t\right)dt
=\frac{3863e^{-20}}{24}.
\]
This term is included in every reported certificate bound.

The actual largest verified upper bound, including all errors and tails, was
\[
1.2794477508577984<1.28=32/25,
\]
on the parameter interval \([17/40,18/40]=[0.425,0.45]\). All 320 parameter
intervals passed. The supplied results can be checked for complete coverage
and compared with \(32/25\) using exact rational arithmetic.

Numerical implementation details that are part of the certificate:

* Binary64 arithmetic is rounded outwards after each operation using
  `nextafter`. The prescribed compilation flags disable unsafe reassociation
  and floating-point contraction.
* Roots in (8) are enclosed by brackets whose signs are verified by interval
  evaluation of the defining polynomial. Newton iteration and `cbrt` only
  produce initial guesses; they are not trusted as bounds.
* Exponentials are enclosed with the two consecutive alternating Taylor
  truncations of \(e^{-t/64}\) through degrees 22 and 23, followed by six
  interval squarings. The checked range is \(0\le t<64\).
* The trigonometric table and the enclosure of \(\pi\) are independently
  verified with exact rational arithmetic. The verifier uses Machin's formula
  \(\pi=16\arctan(1/5)-4\arctan(1/239)\), alternating-series bounds, and
  Taylor bounds for sine and cosine.
* No platform exponential, trigonometric evaluation, or cubic-root result is
  trusted in the interval proof. A square-root bracket for \(\sqrt2\) is
  checked by squaring.

For an indication of conservatism only, nonsingular high-order ordinary
quadrature locates the maximum of the same matrix eigenvalues near
\(r=0.47306\), with value approximately \(1.258554\). This exploratory value is
not used to certify (7).

## 5. The unbounded parameter tail — proved analytically

Let \(r\ge8\), and normalize the three complex coefficients so
\(|c|^2+|e|^2+|\nu|^2=1\). The exact identity
\[
\mathbb E_Z|Zc+\bar Ze+\nu Zd(T)|^2=1
\tag{15}
\]
follows from angular integration and
\(\mathbb E[Td(T)]=0\), \(\mathbb E[Td(T)^2]=1\).

On \(|L+r|\ge r/2\), use \(K(x)\preceq I_2/|x|\) and (15) to bound the
quadratic form by \(2/r\le1/4\).

On \(|L+r|<r/2\), put \(t_0=\tau(r^2/4)\). Then \(T>t_0\ge6\), since
\(6(a+6b)^2<16\). From (9) and the coefficient bound used for (14), the
weighted density is at most
\[
\frac1\pi H(t_0),\qquad
H(t)=\frac{t(2+d(t)^2)e^{-t}}{(a+bt)(a+3bt)}.
\]
The function \(H\) is decreasing on \([6,\infty)\). For example, its logarithmic
derivative is strictly less than
\(1/6+2/5-1<0\). Integrating \(1/|x|\) over the disk \(|x|<r/2\) yields the bound
\[
rH(t_0)
=\frac{2t_0^{3/2}(2+d(t_0)^2)e^{-t_0}}{a+3bt_0}.
\]
The last expression is also decreasing for \(t_0\ge6\): its logarithmic
derivative is less than \(1/4+2/5-1<0\). Its value at 6 is
\[
\frac{20\,6^{3/2}e^{-6}}{a+18b}<\frac14.
\]
For a purely rational verification of this last strict bound, use
\(6^{3/2}<15\), \(a+18b>3\), and \(e^6>400\). The last inequality follows from
\(\sum_{k=0}^{13}6^k/k!=10059173/25025>400\).

Therefore \(\|M_\sigma(r)\|<1/2\) for \(r\ge8\). Since
\(\|C_+\|=3/10\) and \(\|C_-\|=3/5\),
\[
\lambda_{\max}(M_\sigma(r)-C_\sigma)<\frac12+\frac35
=\frac{11}{10}<\frac{32}{25}.
\]
This completes (7) on the entire half-line.

## 6. Averaging the compensating term — proved analytically

Condition on all remote variables in (4), taking \(w=q\), \(c=Q\), \(e=P\).
Both compensating terms have zero expectation because \(\nu\) is constant
and \(\mathbb E Q=0\). This proves (1). Also, averaging (15) without the
normalization gives
\[
\mathbb E|O|^2=\mathbb E|Q|^2+\mathbb E|P|^2+|\nu|^2.
\]
Finally,
\[
p-\frac{32}{25}=\frac{1988}{47275}>0.
\]
Using the symmetry \(Z\mapsto-Z\) as in the question, and
\(\mathbb E(q\bar O)=0\), the equivalent functional statement is
\[
\boxed{\Lambda(q+O)\le\Lambda(q)-\frac{1988}{47275}\,\mathbb E|O|^2.}
\]
The value of \(u\), the dimension, all correlations among \(q,Q,P\), and both
additional application energy bounds are irrelevant to this proof.
