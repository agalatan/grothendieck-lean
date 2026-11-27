# Sector estimates for the symmetrised spiked cubic radius

Agent-ID: codex-a7c4. Paper proof and exact rational replay for [issue #628](https://github.com/agalatan/grothendieck-lean/issues/628), author-checked. We use the symmetrised spiked radius of [P7](https://github.com/agalatan/grothendieck-lean/pull/658).

For a unimodular pair $f,g$ on standard complex Gaussian space, set $h=(f+g)/2$, $k=(f-g)/2$, $t=\|P_{1,0}h\|_2$, $U=P_{2,1}k$, and $y=t^2+\|U\|_2^2$. Choose a unit linear coordinate $z$ with $P_{1,0}h=tz$. At $t=0$ any unit coordinate can be used. Dimension zero has zero payoff. Write $T=|z|^2\sim\operatorname{Exp}(1)$ and $\mu=\mathbb E|z|=\sqrt\pi/2$.

For the capped degree-five game with $(e,\eta)=(39/50,779/10000)$ we obtain the following partial conclusions.

- If the projection $U$ has zero component independent of $z$, then $V<500/701$ throughout $0\le t\le0.56677916$. A simpler rational estimate reaches $0.55096542$ in the same class.
- The estimate extends to small positive energy in that component by the explicit inequality (3) below. Two other signed energy tests give $V<500/701$ through $t=0.46616437$.
- For a pure visible $(1,1)$ test sector $G=(T-1)W$, a direct shifted-Gaussian estimate gives the sharp radius $\mu$ at every amplitude. The radial envelope alone exceeds this value at one explicit amplitude.
- For cubic test fields, the conditional radial upper envelope has an exact maximum at a fixed normalized signed energy. This gives the second signed test and identifies which sector information the envelope discards. A separate conditional-Gaussian argument proves the conjectured spiked radius on a family allowing a component independent of $z$.

The unrestricted game and the corresponding global lower bound remain open.

## 1. Sector decomposition and support

For a test field $G\in H_{2,1}$ write
\[
 G=\sum_{i=0}^2\sum_{j=0}^1 e_{ij}(z)G_{ij},\qquad E_{ij}=\|G_{ij}\|_2^2,
 \qquad\phi(\ell,G)=\tfrac12\mathbb E(|\ell z+G|+|\ell z-G|).
\]
The $e_{ij}$ are unit visible Wick polynomials. The $G_{ij}$ use only the remaining coordinates, with distinct remote bidegrees $(2-i,1-j)$. They are orthogonal, even if they use the same Gaussian variables. Hence $\sum E_{ij}=\|G\|^2$. Use $x_{ij}$ for the corresponding energies of the **unscaled response projection** $U$. In particular $x_{00}=\|\mathbb E[U\mid\text{remaining coordinates}]\|_2^2$.

For $\ell\ge0$ and arbitrary $G$,
\[
 \ell t+\operatorname{Re}\langle G,U\rangle
 =\tfrac12\operatorname{Re}\mathbb E[
 \overline{\ell z+G}\,f+\overline{\ell z-G}\,g]\le\phi(\ell,G).
\]
Cauchy–Schwarz in the two signs and then Jensen conditional on $z$ give
\[
 \phi(\ell,G)\le\mathbb E\sqrt{S(T)},\quad
 S(T)=(\ell^2+E_{10}+E_{01})T+E_{00}
 +E_{11}(T-1)^2+\tfrac12E_{20}T^2+\tfrac12E_{21}T(T-2)^2. \tag{1}
\]
Here the polynomials multiplying the six energies are $P_{ij}(T)=|e_{ij}(z)|^2$, and the conditional expectation removes the mixed terms by remote orthogonality.

Write $V=\operatorname{Re}\langle f,(P_{1,0}-eP_{2,1}+\eta P_{3,2})g\rangle$. Expanding in $h,k$, discarding the three nonpositive terms and using $\|P_{3,2}h\|^2\le\|h\|^2-t^2\le1-\|U\|^2-t^2$ gives
\[
 V\le(1-e)t^2+\eta+(e-\eta)y. \tag{2}
\]

## 2. A response ellipsoid for weights $T+c$

Let $c>0$. Cauchy–Schwarz bounds the right side of (1) by $\sqrt{(1+c)\mathbb E[S(T)/(T+c)]}$. Define $B_{ij}(c)=(1+c)\mathbb E[P_{ij}(T)/(T+c)]$ and $B_T=B_{10}=B_{01}$. The bound is the square root of $B_T\ell^2+\sum B_{ij} E_{ij}$. The support inequality therefore gives
\[
 \frac{t^2}{B_T}+\sum_{ij}\frac{x_{ij}}{B_{ij}}\le1.
\]
Indeed, take $\ell=t/B_T$ and use the $(i,j)$ component of $U$ divided by $B_{ij}$ as the corresponding component of $G$. The left side equals the square of the right side of the resulting support estimate, which proves the claim, including at zero.

Write $w=1+c$ and $J=\mathbb E[(T+c)^{-1}]$. Polynomial division and $\mathbb E T^n=n!$ give
\[
 \begin{array}{c|ccccc}
 &00&T&11&20&21\\ \hline
 B/w& J& 1-cJ&-1-c+w^2J&(1-c+c^2J)/2&
 (2+3c+c^2-c(c+2)^2J)/2 .
 \end{array}
\]
At $c=18/25$ we certify
\[
 B_T,B_{11},B_{20},B_{21}<b_0=804293213/10^9,\qquad
 B_{00}<b_1=159/125.
\]
As $b_0<b_1$, the ellipsoid gives
\[
 y\le b_0+(1-b_0/b_1)x_{00},\qquad
 V\le(1-e)t^2+\eta+(e-\eta)\,[b_0+(1-b_0/b_1)x_{00}]. \tag{3}
\]
Thus the stated interval through $0.56677916$ follows when $x_{00}=0$. Equation (3) also applies to every pair with positive $x_{00}$. For the simpler choice $c=1$, the same proof works with $b_0=626/773$ and $b_1=200/167$ and yields the cutoff $0.55096542$. Both cutoffs refer to these rational upper estimates. Their expressions exceed the target at the next multiple of $10^{-8}$; this does not imply a violation by the game.

### Certification of the Stieltjes integral

For $k=0,1$ and a real polynomial $P$,
\[
 \int_0^\infty t^k e^{-t}\{2P(t)-(t+c)P(t)^2\}\,dt
 \le \int_0^\infty\frac{t^k e^{-t}}{t+c}\,dt ,
\]
by completing the square. Taking the supremum on polynomials of degree below $n$ gives a rational lower bound $L_k^{(n)}$. In an orthonormal generalized Laguerre basis the coefficient vector of $1$ is the first unit vector ($k!=1$). The matrix of the quadratic form has diagonal $c+2j+1+k$ for $0\le j<n$ and adjacent off-diagonal entries with squares $j(j+k)$ for $1\le j<n$. These follow from the three-term relation $tL_j^{(k)}=(2j+k+1)L_j^{(k)}-(j+1)L_{j+1}^{(k)}-(j+k)L_{j-1}^{(k)}$ and squared norms $(j+k)!/j!$. Maximizing the finite quadratic gives the first diagonal entry of the inverse matrix, computed from the bottom by successive Schur complements. Positivity follows directly from the integral of $(t+c)|P(t)|^2$.

Since the two integrals on the right are $J$ and $1-cJ$, respectively, we have $L_0^{(n)}\le J\le(1-L_1^{(n)})/c$. The verifier uses $n=64$ at $18/25$. For $c=1$ it needs only degree below five for the lower bound and below four for the upper bound, yielding $460/773\le J\le100/167$. Substitution in the table proves the displayed constants.

## 3. The exact radial envelope at fixed signed energy

For $m=\ell^2+\|G\|^2>0$, put
\[
 d=\frac{E_{00}+\tfrac12E_{11}-\tfrac14E_{20}-\tfrac18E_{21}}{m}.
\]
Applying Jensen to (1) with measure $\sqrt T e^{-T}\,dT/\mu$ gives
\[
 \phi(\ell,G)\le\mu\sqrt{\ell^2+2E_{00}
 +\tfrac32E_{11}+\tfrac34E_{20}+E_{10}+E_{01}+\tfrac78E_{21}}
 =\mu\sqrt{m(1+d)}.
\]
The weights use $\Gamma(s+1)=s\Gamma(s)$. Hence $d\le0$ suffices for $\phi\le\mu\sqrt m$ at all amplitudes. This includes $G=zQ+\bar z B+\alpha z(T-2)$ for arbitrary remote $Q\in H_{1,1}$ and $B\in H_{2,0}$, even if they share their coordinates.

For $0\le d\le1$ the sharper estimate is
\[
 \phi(\ell,G)\le\sqrt m\,F(d),\qquad
 F(d)=\int_0^\infty e^{-T}\sqrt{d+(1-d)T}\,dT. \tag{4}
\]
It is sharp as an upper bound on the *radial envelope* in (1) at fixed $d$ and $m$. To prove this, normalize $m=1$ and set $A(T)=d+(1-d)T$. In $S-A$, the coefficients of $E_{11}$ and $E_{20}$ are respectively $R=T^2-5T/2+1/2$ and $R/2$, and that of $E_{21}$ is $J_3=T^3/2-2T^2+7T/8+1/8$. All other coefficients vanish. If $0<d<1$, use the tangent of the square root at $A$. The correction for either polynomial is strictly negative after integrating against $e^{-T}/\sqrt A$.

Indeed the Laplace integrals of $R$ and $J_3$ against $e^{-(1+s)T}\,dT$ equal
\[
 \frac{s(s-3)}{2(1+s)^3},\qquad
 \frac{s(s^2+10s-15)}{8(1+s)^4}.
\]
Each changes sign once on the positive axis, from negative to positive. Each integrates to zero against $s^{-1/2}\,ds$: by the Gamma half-integral this is a positive constant times its polynomial's integral against $e^{-T}T^{-1/2}\,dT$, which vanishes by the Gamma recurrence. The Laplace representation of $A^{-1/2}$ now inserts the strictly decreasing factor $e^{-ds/(1-d)}$ against $s^{-1/2}\,ds$, apart from a positive constant. Subtract the value of the decreasing factor at the sign change. The resulting integrand is negative on both sides, giving the claimed strict sign. Interchanging the integrals is justified by absolute integrability of $e^{-T}T^{-1/2}$ times the absolute value of either polynomial. At $d=0$ the weighted estimate above gives (4); at $d=1$ ordinary Jensen gives it. The point $m=0$ gives $\phi=0$ directly.

For each $d\in[0,1]$ choose only spike energy $1-d$ and a remote cubic of energy $d$; then (1) has $S=A$. Thus (4) is the maximum of (1) over fields in arbitrary dimension at that fixed normalized deficit. This statement does not assert equality for the original expected modulus.

### Two sufficient tests on the actual response

$F$ is strictly increasing from $\mu$ to 1. For $d<1$, differentiation gives $F'(d)=-\operatorname{Cov}(T,A^{-1/2})/2>0$, since $A^{-1/2}$ is strictly decreasing. The one-sided derivative at zero is finite by the Gamma half-integral. For either radius $\rho$ below let $d_\rho$ be the unique solution $F(d_\rho)=\rho$. Applying support with $\ell=t$ and $G=U$ shows $y\le\phi(t,U)$. Hence the following **absolute** response budget suffices:
\[
 x_{00}+\tfrac12x_{11}-\tfrac14x_{20}-\tfrac18x_{21}
 \ \le\ \rho^2 d_\rho
 \quad\Longrightarrow\quad y\le\rho^2. \tag{5}
\]
Otherwise $y>\rho^2$, and division by $y$ makes the normalized $d$ strictly below $d_\rho$. Equation (4) gives $y\le\sqrt y F(d)<\sqrt y\,\rho$ when $d\ge0$; the $\mu$ bound handles $d<0$. This contradicts $y>\rho^2$. Exact brackets are
\[
 \begin{array}{c|c}
 \rho&\text{bounds on }d_\rho\\\hline
 2287/2500 &(0.09890436,0.09890437)\\
 4571/5000 &(0.09632546,0.09632547).
 \end{array}
\]
For the replay let $a=d/(1-d)$. Substitution and integration by parts give $F(d)=\sqrt d+e^a(\sqrt{\pi(1-d)}/2-\sqrt d\int_0^1e^{-av^2}dv)$. Alternating and positive power series, integer square roots and Machin's identity enclose this expression at the four rational endpoints.

A different budget follows from the [existing response ellipsoid](../../../conjecture-K/sources/progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md) by subtraction:
\[
 \tfrac12x_{00}+\tfrac13x_{11}-\tfrac13x_{20}-\tfrac17x_{21}\le\rho^2-\pi/4
 \quad\Longrightarrow\quad y\le\rho^2 .
\]
With either test at $\rho=2287/2500$, (2) gives $V<500/701$ for $t\le0.46616437$. This conclusion is conditional on the response's sector energies. For $d>d_\rho$ the maximum radial envelope is above $\rho$; a particular field may still satisfy the desired bound.

## 4. A conditionally Gaussian class of test fields

Split independent complex Gaussian blocks $X,Y$, with $z$ a unit linear form on $X$, and take
\[
 G=\sum_i X_iQ_i(Y)+\sum_i\bar X_i B_i(Y),
 \qquad Q_i\in H_{1,1}(Y),\quad B_i\in H_{2,0}(Y).
\]
Conditional on $Y$ and an independent fair sign $\sigma$, the variable $\ell z+\sigma G$ is a centered real two-dimensional Gaussian, possibly improper or degenerate. If its covariance eigenvalues are $a,b$, concavity and exchangeability for independent real standard Gaussians $N_1,N_2$ bound $\mathbb E\sqrt{aN_1^2+bN_2^2}$ by $\mathbb E\sqrt{(a+b)(N_1^2+N_2^2)/2}=\mu\sqrt{a+b}$. Averaging over $Y,\sigma$ and applying Jensen to the square root therefore gives $\phi(\ell,G)\le\mu\sqrt{\ell^2+\|G\|^2}$. This argument permits $X_i$ orthogonal to $z$, so it can cover fields whose $E_{00}$ is nonzero. Sharpness of the universal constant for the class follows by taking $G=0$ and $\ell>0$.

## 5. Sharp radius of the pure visible $(1,1)$ sector

Let $z,W$ be independent standard complex Gaussian variables, $T=|z|^2$ and $\mu=\sqrt\pi/2$. The pure sector $G=a(T-1)W$ encompasses any remote complex linear form after normalization, with arbitrary complex phase. Its sign does not change its joint law with $z$. Then at every $\ell\ge0$,
$$
\phi(\ell,G)=\mathbb E|\ell z+G|\le\mu\sqrt{\ell^2+|a|^2}.
$$
Equality at $a=0$ makes the constant optimal. Conditioning on $z$ reduces the integrand to $B(\ell\sqrt T,|a|^2(T-1)^2)$, where $B(r,v)=\mathbb E|r+\sqrt v W|$.

### Two estimates for the shifted complex Gaussian norm

First,
$$ B(r,v)^2\le r^2+\mu^2 v. \tag{6} $$
By scaling take $v=1$. Write $R=|r+W|$, and $\theta=\arg(r+W)$. Then $\mathbb E R^2=1+r^2$, $\partial_r\mathbb E R=\mathbb E\cos\theta$ by dominated differentiation, and $\mathbb E[R\cos\theta]=r$. Therefore $\partial_r\operatorname{Var}(R)=2\operatorname{Cov}(R,\cos\theta)$. Given $R$, the angular density is proportional to $\exp(2rR\cos\theta)$. Its conditional cosine mean increases with $R$: its derivative with respect to the density parameter is the variance of $\cos\theta$. Thus the covariance is nonnegative (e.g. use two independent copies of $R$). The variance is at least its value $1-\mu^2$ at zero. This proves (6), including $v=0$ directly.

For $r>0$ a complementary estimate is
$$ B(r,v)\le r+\frac{3v}{10r}. \tag{7} $$
Indeed the density of $\sqrt v W$ is the planar heat kernel at time $v/4$. Distributionally $\Delta|x|=|x|^{-1}$ in two dimensions; the boundary flux on a circle of radius $\varepsilon$ tends to zero, and $1/|x|$ is locally integrable. Gaussian convolution, or integration by parts on the punctured plane, gives $\partial_vB(r,v)=\frac14\mathbb E|r+\sqrt v W|^{-1}$ for $v>0$. We claim $\sup_{r\ge0} r\,\mathbb E|r+W|^{-1}<6/5$. Substituting $|x|^{-1}=\pi^{-1/2}\int_0^\infty u^{-1/2}e^{-u|x|^2}\,du$, averaging the Gaussian, and taking $t=u/(1+u)=(1-\cos\theta)/2$, gives
$$ r\,\mathbb E|r+W|^{-1}=\sqrt{2\pi s}\,e^{-s}I_0(s),\qquad s=r^2/2. $$
Here $I_0(s)=\sum_{k\ge0}(s^2/4)^k/(k!)^2$. On $0\le s\le1$, use $I_0(s)\le \exp(s^2/4)$. The logarithmic derivative of $\sqrt{s}\exp(-s+s^2/4)$ is $(s-1)^2/(2s)$ for positive $s$. Its maximum there gives $\sqrt{2\pi}e^{-3/4}<6/5$, using $\pi<22/7$ and $e^{3/2}\ge\sum_{k=0}^4(3/2)^k/k!$.

For $s\ge1$ the exact function decreases. From the defining series, $I_0''+I_0'/s=I_0$. Its logarithmic derivative $q=I_0'/I_0$ satisfies $q'=1-q/s-q^2$, and $q(1)<1/2$ follows termwise from $I_0'(1)=\frac12\sum_{k\ge0}4^{-k}/(k!(k+1)!)$. At any equality with $h(s)=1-1/(2s)$ the derivative of $q-h$ is $-1/(4s^2)<0$. Thus $q<h$ throughout $[1,\infty)$, since an upward first crossing is impossible. This makes the logarithmic derivative of $\sqrt{s}e^{-s}I_0(s)$ negative. The claimed uniform bound follows. Scaled to variance $v$ it gives $\partial_vB\le3/(10r)$; integration, using $B(r,0)=r$, proves (7).

### Covering the amplitude range

Normalize $\ell^2+|a|^2=1$ and put $p=\ell^2$. Let $J=\mathbb E[(1+T)^{-1}]$, with exact bounds $460/773\le J\le100/167$ from Section 2. When $0\le p\le3/4$, apply (6) and weighted Cauchy–Schwarz with weight $T+1$:
$$
\phi^2\le 2[p(1-J)+(1-p)\mu^2(4J-2)]
\le p\,(626/773)+(1-p)\mu^2(132/167)<\mu^2 .
$$
The last inequality is affine in $p$, and checking it at $p=0,3/4$ uses only $\pi>333/106$.

When $3/4\le p\le1$, put $u^2=|a|^2/\ell^2\le1/3$. Apply (7) and $\mathbb E[(T-1)^2/\sqrt T]=3\mu/2$ to obtain
$$
\phi/(\mu\ell)\le1+9u^2/20\le\sqrt{1+u^2}.
$$
The last comparison follows by squaring, since $9/10+(81/400)(1/3)<1$. This proves the result in both ranges. The cruder conditional second moment alone cannot give this sharp constant: at $p=4/5$ its radial polynomial $pT+(1-p)(T-1)^2$ is $(T+1)^2/5$ and its integrated square root equals $2/\sqrt5>\mu$.

The [rational replay](../../code/spiked-radius-sectors-codex-a7c4/verify.py) checks the sector coefficients, Stieltjes bounds, residual identities, root brackets, Rice estimates and payoff cutoffs using only the Python standard library.
