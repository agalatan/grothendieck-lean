# A reflected cubic perturbation increases the alternating score

Agent-ID: codex-a7c4. Research proof for [#668](https://github.com/agalatan/grothendieck-lean/issues/668). The article already uses a two-coordinate optimized cell with a larger alternating score. The construction here uses one explicit polynomial and the ordinary complex phase, with no angular cell table.

Let $z,w$ be independent standard complex Gaussians of density $\pi^{-1}e^{-|z|^2}$. Put $h(w)=w(|w|^2-2)$ and $G_\epsilon(z,w)=\operatorname{ph}(z+\epsilon h(w))$, with $\operatorname{ph}(0)=0$. Use the constant visible preprocessor $+1$ and the constant remote preprocessor $-1$. This is a common charge-one disk map in two complex coordinates. Write $W=\sum_{k\ge0}(-1)^k H_k$ for its alternating score and $\gamma^\dagger$ for that of ordinary phase. Then

$$ W(G_\epsilon)=\gamma^\dagger+C_4\epsilon^4+R_6(\epsilon),\quad 5.97<C_4<5.98,\qquad |R_6(\epsilon)|\le\frac{898000371712}{5}|\epsilon|^6. $$

In particular $\epsilon=10^{-6}$ gives $W(G_\epsilon)>\gamma^\dagger+5\cdot10^{-24}$. The proof also proves strict improvement for every sufficiently small nonzero real $\epsilon$ of either sign. This is a result on the alternating functional. The transfer slope $D=H_0-\sum_{k\ge1}|H_k|$ is at most $W$ and needs independent coefficient control. Indeed this channel converges in $L^2$ to plain phase by dominated convergence. Squared Hermite coefficients converge in $\ell^1$ by Cauchy–Schwarz, and the signed grade summation is a contraction. Consequently its own transfer slope tends to $\pi/2-1$ at $\epsilon=0$. The published lower and upper endpoints are unaffected.

The reflected-cubic choice has a real predecessor. Saha, Li, Xue, Chaudhuri, Klivans, Kothari and Meka use a sign of a Gaussian shifted by a cubic Hermite and reflect the cubic coordinate in their real limiting scheme. Here the complex cubic has charge one, and we estimate the fourth variation of the alternating functional directly. [Definition 4.1 of the real scheme](https://arxiv.org/html/2608.11158v2#S4).

The companion estimates describe two obstructions: arbitrary channels supported only on coordinate angles, and phase modulations with conjugately paired angular harmonics in one coordinate. [Angle-only classification](ANGLE_ONLY.md) and [paired angular estimates](ANGULAR_PAIRING.md).

## The convergent Fourier integral

Identify $\mathbb C$ with $\mathbb R^2$ and write $x\cdot y=\operatorname{Re}(\bar x y)$. For $s=\pm1$ let
$$ k_s(x,y)=(2\pi^2)^{-1}e^{-(|x|^2+|y|^2)/2-is x\cdot y}. $$
The integral operator in its Gaussian bilinear form is Mehler noise at parameter $-is$. Equivalently it is the planar Fourier transform after multiplying each response by its Gaussian square-root density, with a reflection for negative $s$. On a two-coordinate Hermite term of odd total degree $d$, the factor $i(-i)^d$ gives exactly $(-1)^{(d-1)/2}$. Thus
$$ W(G_\epsilon)=i\int k_+(x,y)k_-(p,q)\,\overline{\operatorname{ph}(x+\epsilon h(p))}\operatorname{ph}(y+\epsilon h(q))\,dx\,dy\,dp\,dq. $$
See the [Fourier normalization and diagonalization](../high-dimensional-alternation-codex-a7c4/PROOF.md). Both kernels have absolute integral two; all integrals below are absolutely convergent. The change $(p,q)\mapsto(-p,-q)$ makes the score even in $\epsilon$.

Write $u=h(p),v=h(q)$ and translate the visible integration variables by $\epsilon u,\epsilon v$, leaving unshifted phase factors. The translated kernel divided by $k_+(x,y)$ equals $e^{\epsilon L-\epsilon^2 M}$, with
$$ L=u\cdot x+v\cdot y+i(u\cdot y+v\cdot x),\qquad M=(|u|^2+|v|^2)/2+i u\cdot v. $$
For calculating a fixed coefficient use $P_{-1}=0,P_0=1$ and $P_n=(L P_{n-1}-2M P_{n-2})/n$. This is differentiation at zero; a global interchange of a Taylor series and the unbounded cubic shifts is unnecessary. Justification of six differentiations is given below.

As a control use the linear carrier $u=\sqrt2p,v=\sqrt2q$ with **positive** remote endpoint. Its score is exactly $\gamma^\dagger$ for every $\epsilon$: unitary invariance of both identical preprocessors reduces the phase of a linear combination to the phase of one coordinate. It has the same quadratic coefficient as the reflected cubic. Indeed $h$ is a centered proper complex Hermite term of bidegree $(2,1)$ with squared norm $\mathbb E[T(T-2)^2]=2$ for $T\sim\operatorname{Exp}(1)$. At the reflected remote parameter $+i$ its cross multiplier is $i^3=-i$, matching the linear carrier at parameter $-i$. Both holomorphic second moments vanish by charge and both one-site variances equal two. Thus every remote moment appearing in $P_2$ agrees and the quadratic coefficient is zero.

## The fourth coefficient as nine radial moments

For $l,j,n\ge0$ put
$$ H(l,j,n)=2\int_0^\infty\!\int_0^\infty r^{l+1}s^{j+1}e^{-(r^2+s^2)/2}J_n(rs)\,dr\,ds. $$
The fourth coefficient is the sum of the products in this table.

| $(l,j,n)$ | coefficient of $H$ | $(l,j,n)$ | coefficient of $H$ | $(l,j,n)$ | coefficient of $H$ |
|---|---:|---|---:|---|---:|
| $(0,0,1)$ | $204$ | $(1,1,0)$ | $134$ | $(1,3,2)$ | $42$ |
| $(0,2,1)$ | $-140$ | $(1,1,2)$ | $-134$ | $(2,2,1)$ | $-61/2$ |
| $(0,4,1)$ | $5$ | $(1,3,0)$ | $-42$ | $(2,2,3)$ | $13/2$ |

Here are exact arithmetic rules to derive the table independently. Expand $P_4=L^4/24-L^2M/2+M^2/2$, writing each dot product as $(a\bar b+\bar a b)/2$. Subtract the linear comparison's fourth coefficient, which vanishes as its full score is constant. For the remote Gaussian at endpoint sign $s$, the bilinear integral of $p^a\bar p^b q^c\bar q^d$ vanishes unless $a+c=b+d$. In the remaining case it equals
$$ \sum_{k=\max(0,b-c)}^{\min(a,b)} \frac{a!b!c!d!}{k!(a-k)!(b-k)!(c-b+k)!}(-is)^{a+b-2k}. $$
This is Wick pairing, with $k$ the number of first-site holomorphic factors paired at the same site. It follows directly by differentiating the Gaussian generating function; the same moments at $s=\pm1$ follow from the absolutely convergent Fourier integral. For powers of $h(p)$ and its conjugate insert the binomial expansion of $(|p|^2-2)^{a+b}$, and similarly at $q$. For the linear comparison use the multiplier $(\sqrt2)^{a+b+c+d}$ instead. Each surviving total is even.

A visible monomial $x^a\bar x^b y^c\bar y^d$ with $a+c=b+d$, including the external factor $i\overline{\operatorname{ph}x}\operatorname{ph}y$, integrates to $i(-i)^n H(a+b,c+d,n)$, where $n=|a-b-1|$. Indeed angular integration gives the $n$th Fourier coefficient of $e^{-irs\cos\theta}$. All other visible monomials vanish by rotation. The [checker](../../code/polynomial-phase-variation-codex-a7c4/verify_quartic.py) performs these operations with integer Wick counts and rational polynomial coefficients, verifies that every imaginary coefficient cancels and reproduces the table. It also checks cancellation at degree two.

To evaluate the moments set $A=(l+n+2)/2$, $B=(j+n+2)/2$, $C=n+1$. The Bessel series and Gaussian radial moments give
$$ H(l,j,n)=2^{1+(l+j)/2}\frac{\Gamma(A)\Gamma(B)}{\Gamma(C)}\,{}_2F_1(A,B;C;-1). $$
For a direct justification replace $J_n(rs)$ by $J_n(hrs)$ with $0<h<1$, where the series of absolute integrals converges by the ratio test. This inserts $h^n$ and replaces $-1$ by $-h^2$. Let $h\uparrow1$ by dominated convergence on the integral ($|J_n|\le1$), and use Pfaff's identity on the hypergeometric expression. At the endpoint it is $2^{-A}{}_2F_1(A,C-B;C;1/2)$. Both $A,B$ are half-integers in every row, so the remaining prefactor divided by $\pi/\sqrt2$ is rational. Through Taylor index 80 and thereafter the absolute term ratio in the transformed series is below $3/5$. Summing the exact rational terms and inflating by $3/2$ times the absolute value of the last included term bounds the full tail. The rational comparisons, including $333/106<\pi<355/113$, give $5.97<C_4<5.98$.

## A sixth-order remainder without bounded shifts

For fixed $u,v$ differentiate the translated kernel six times, then put $X=x-\epsilon u,Y=y-\epsilon v$ in the absolute integral. At that point the coefficient of the sixth derivative divided by $6!$ is $\sum_{k=0}^3(-M)^k L(X,Y)^{6-2k}/(k!(6-2k)!)$. We have $|L(X,Y)|\le(|u|+|v|)(|X|+|Y|)$ and $|M|\le(|u|+|v|)^2/2$. The absolute visible and remote kernels together have mass four and after normalization are independent standard Gaussian pairs in $\mathbb R^2$. Writing $R$ for the length of one such real Gaussian vector gives $\mathbb ER^{2a}=2^a a!$. For $d=6-2k$ the elementary bound $\mathbb E(R+R')^d\le2^d\mathbb ER^d$ follows by convexity for $d\ge1$, with equality for $d=0$. Similarly $\mathbb E(|u|+|v|)^6\le64\mathbb E[R^6(R^2-2)^6]$. Thus the sixth derivative divided by $6!$ is uniformly bounded by
$$ 4\cdot64\,\mathbb E[R^6(R^2-2)^6]\sum_{k=0}^3\frac{2^{6-2k}\mathbb ER^{6-2k}}{2^k k!(6-2k)!}=898000371712/5. $$
For differentiation under the integral, first differentiate the translated visible kernel at fixed $p,q$ (on each compact $\epsilon$ interval the shifted Gaussian is integrably dominated there). The resulting absolute visible integrals of every derivative through order six have bounds polynomial in $|u|+|v|$ uniform in $\epsilon$ by the same change of variables. These polynomials have finite remote absolute moments. Dominated differentiation on $p,q$ follows. Since the odd derivatives at zero vanish, Taylor's formula to order five proves the stated error bound. At the chosen $\epsilon$, $\epsilon^2(898000371712/5)<0.97$, so the strict gain exceeds $5\epsilon^4$.
