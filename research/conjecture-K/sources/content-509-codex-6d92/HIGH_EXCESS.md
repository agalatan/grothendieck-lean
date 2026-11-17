<!-- New research note authored for #521 on 17 November 2026. Agent-ID: codex-6d92. -->
# High fourth excess in the raw content inequality

Agent ID codex-6d92. Refs #509.

At the peak profile $(a,b,\varepsilon)=(699/1250,179/1250,1891/2500)$, every remote cubic of energy $0.00551\le u\le0.0463$ and fourth excess $\chi\ge1008/25=40.32$ satisfies
$$
C(q)^2\le \frac{6}{25}D(q).
$$
The allowance version follows from $S-\Lambda(q)\ge D(q)$. The analytical argument and the scalar check have status **P + C**. Independent proof reviews and certificate replays are listed in the [inventory](../../INVENTORY.md#raw-content-comparison-codex-6d92-pr-522-task-521).

## 1. Large fourth excess forces a Wick direction

Write $q=\sum T_{ij,k}:Z_i Z_j\bar Z_k:$ and normalize $T$ to squared Hilbert–Schmidt norm one for the Gram calculation. Let $N,H$ be the one-slot holomorphic and antiholomorphic Gram matrices of GramTensor.lean, with trace one. Let $n=\|N\|_F^2,h=\|H\|_F^2$, and let $b_g,y,z$ denote gramB, gramY, gramZ. The exact fourth-moment identity of CircularFourth.lean and the contraction estimates used there give
$$
\chi=8n+2h+8b_g+24y,\qquad
b_g\le n,\qquad y\le z=\operatorname{tr}(NH^{\mathsf T}),\qquad
n,h,z\le1.
$$
The normalization uses $u=2\|T\|_F^2$ before rescaling $T$.

In the certified range, set $d=42-\chi\le42/25$. For a unit top eigenvector $e_0$ of $N$, let $\alpha=1-\lambda_{\max}(N)$ and $\beta=1-\langle e_0,H^{\mathsf T}e_0\rangle$. Splitting along the top direction gives
$$
z\le 1-\alpha,\qquad
z\le (1-\alpha)(1-\beta)+\alpha\beta .
$$
Since $1-z\le d/24\le1/10$, the first inequality gives $\alpha\le d/24$. The second gives $\beta<1/2$ because otherwise $\alpha+(1-2\alpha)\beta\ge1/2$. It then gives $\beta\le d/24$ by $\alpha+\beta-2\alpha\beta\ge\beta$. Also $n\le(1-\alpha)^2+\alpha^2$. Thus
$$
\begin{aligned}
d&\ge16(1-n)+24(1-z)\\
 &\ge24(2\alpha+\beta)+\alpha(8-32\alpha-48\beta)\\
 &\ge24(2\alpha+\beta).
\end{aligned}
$$
The squared coefficient mass outside the three slots aligned with the selected direction is at most $2\alpha+\beta$ by a union bound. Rotate to make the selected coordinate $X$. The Wick part $p=E[q\mid X]$ and the remainder $h_q=q-p$ then have energies $w,e$ with $w+e=u$ and $e/u\le d/24$. A unit phase makes $p=\sqrt{w/2}\,X(|X|^2-2)$.

## 2. Deficit and content perturbations

Write $F(z)=V(|z|^2)=2E|L+z|$ and $\Psi(z)=zg(|z|^2)$. The positive Laplace representations of $V'$ and $-g$ and the derivative estimates in CONTENT_KERNELS.md give
$$
D^2F\preceq 2V'(0)I,\quad V'(0)<1.432,\quad
\|D^2\Psi\|\le2\sqrt{M_0M_1}<H_2=2.6857,
$$
where $M_0=-g(0)$ and $M_1=g'(0)$. The checker recomputes the moments. The Jacobian of $\Psi$ has eigenvalues $g(r)$ and $g(r)+2rg'(r)$, where $r=|z|^2$. Both are at least $g(0)>-.83514$, by the positive Laplace representation. The radius check below verifies $g(r)+2rg'(r)<.17$. Therefore $\Psi(z)+.33z$ has global Lipschitz constant $l=.50514$. The added linear term preserves the content on third-chaos arguments.

Conditioning on $X$ eliminates the first Taylor term for the payoff and in the pairing of the content increment with the linear direction $X$. Hence
$$
D(q)\ge D(p)-(1.432-\beta_0)e
\quad\text{for}\quad
\beta_0\le \inf_{s\in[w,u]}B'(s).
$$
Put $\Pi=P_{1,0}$. In expanding $\|\Pi\Psi(q)\|^2$ around $\Pi\Psi(p)$, the cross term is at most $H_2 C(p) E[|X||h_q|^2]$. The five shells of $h_q$ have $X$ factors $X^2$, $R-1$, $X$, $\bar X$, and $1$, with $R=|X|^2$. Their coefficients in the other coordinates have different bidegrees, and remain orthogonal after weighting by $|X|$. The weighted moment divided by the squared norm for each factor is respectively $15\sqrt\pi/16,\ 7\sqrt\pi/8,\ 3\sqrt\pi/4,\ 3\sqrt\pi/4,\ \sqrt\pi/2$. Therefore $E[|X||h_q|^2]\le(15\sqrt\pi/16)e$.

The squared norm of the projected increment is at most $l^2e$. At low energy we sharpen it by linearizing in $h_q$. In the identity
$$
D\Psi(p)[h_q]=(g(v)+vg'(v))h_q+p^2g'(v)\overline{h_q},\qquad
v=w\mu(R),\quad \mu(R)=R(R-2)^2/2,
$$
only the shells $(R-1)A(Y)$ and $X^2\bar B(Y)$ can contribute to the linear projection in the other coordinates $Y$. Here $A,B$ are linear forms in $Y$. Their coefficients are
$$
E[(R-1)(g(v)+vg'(v))],\qquad
(w/2)E[R^2(R-2)^2g'(v)] .
$$
The positive Laplace representation gives $0\le g(v)-g(0)+vg'(v)\le2M_1v$. Also $E[(R-1)\mu(R)]=3$. Use $\mu(R)\le16/27$ for $R\le1$ and $E[(1-R)1_{R<1}]=1/\exp(1)$ to get $E|R-1|\mu(R)\le3+32/(27\exp(1))<7/2$. The first coefficient has modulus at most $7M_1w$. In the second, divide by $\|X^2\|_2=\sqrt2$ to compare the shell energy and use $E[R^2(R-2)^2]=8$. This gives the bound $2\sqrt2M_1w$. Cauchy–Schwarz over the two shell norms and the exact scalar cap $\sqrt{57}M_1<16.31$ yield
$$
\|\Pi D\Psi(p)[h_q]\|_2\le16.31w\sqrt e.
$$
The remainder has norm at most $(H_2/2)\|h_q\|_4^2\le(H_2/2)\sqrt{44}e$ by the fourth-moment cap. Together,
$$
C(q)^2\le C(p)^2+
e\left[
\frac{15\sqrt\pi}{16}H_2C(p)
+\min\left\{l^2,\left(16.31w+\frac{H_2}{2}\sqrt{44e}\right)^2\right\}
\right].
$$

## 3. Scalar certificate

The checker uses the positive measures $\nu_A,\nu_D$ for $-g$ and $V'$. Their endpoint moments are enclosed by the positive derivative recurrence for the visible densities, followed by Gaussian integration with an explicit tail. It constructs six-node Gaussian rules and six positive nodes plus zero for the left Gauss–Radau rules. The monic polynomial of positive nodes is orthogonal to degrees at most five with respect to $\nu$ for Gauss and to $t\,d\nu(t)$ for Radau. Exactness through degrees eleven and twelve follows by division by the nodal polynomial, including the zero factor for Radau. Hermite interpolation at the double nodes, and simple zero for Radau, gives the lower and upper rules by the even and odd derivative signs. These apply to $x\mapsto e^{-rx}$, $x\mapsto\int_0^r e^{-sx}\,ds$, and $x\mapsto (1+wx)^{-j}$ for $j=1,2$.

The Wick payoff is upper-bounded with the Radau rule for $V(w\mu(R))$. The Gaussian lower rule gives a lower bound on $B(w)$ by $V(0)+w\int(1+wx)^{-1}\,d\nu_D(x)$. An Arb comparison of the derivatives at opposing endpoints orders the increasing Gaussian lower bound minus the concave Wick upper bound throughout the energy band. The same Gaussian rule at each cell's upper total energy bounds $B'$ below. For $C(p)$, split $\sqrt{w/2}\,E[R(R-2)(g(w\mu(R))-g(0))]$ into its sign parts at $R=2$, and use bounds on both parts with their monotonicity in $w$. The tails beyond $R=16$ use $0\le g-g(0)\le M_0$ and $0\le V(r)-V(0)\le V'(0)r$. These same tail bounds hold for the quadrature functions because their weights are positive and integrate constants exactly.

### Radius bound for the Jacobian

Let \(H(t)=t(a+bt)^2\), \(A(t)=a+bt\), and \(J(t)=a+3bt\). The visible density for the content mixture is \(f_A(H(t))=e^{-t}A(t)^{-2}\). Write \(f_{A,j}=(-\partial_s)^j f_A\), with \(s=H(t)\). Equation (8) of [CONTENT_KERNELS.md](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md) and \(\int_{\mathbb R}e^{-\lambda x^2}\,dx=\sqrt{\pi/\lambda}\) give, for \(c=\cos^2\theta\),
\[
g^{(j)}(r)=\frac{(-1)^{j+1}}{2\pi}\int_0^\pi\int_{\mathbb R}
c^{j+1}f_{A,j}(x^2+rc)\,dx\,d\theta .
\]
The derivative recurrence applies \(-J^{-1}A^{-1}\partial_t\) to each term \(e^{-t}A^{-p}J^{-q}\), giving the three terms with denominator exponents \((p+1,q+1),(p+2,q+1),(p+1,q+2)\) and multipliers \(1,pb,3qb\), respectively. All coefficients are nonnegative. If \(k_{pq}\) are the resulting coefficients at order \(j\), the code uses the bound
\[
|f_{A,j}(s)|\le K_j e^{-\Re t(s)},\qquad
K_j=\sum_{p,q}k_{pq}(a-b/2)^{-p}(a-3b/2)^{-q},
\]
where \(t(s)=H^{-1}(s)\) is the branch with \(\Re t>-1/2\).

To justify the branch, for real \(h,y\),
\[
\Re H(h+iy)=H(h)-b(2a+3bh)y^2 .
\]
On \(h=-1/2\), this is at most \(-(a-b/2)^2/2<-1/9\). Consequently the number of roots of \(H(t)=s\) with \(\Re t>-1/2\) is locally constant throughout \(\Re s>-(a-b/2)^2/2\). Roots cannot escape to infinity on compact sets of \(s\) and none can cross the boundary line there. At \(s=0\) there is exactly one such root, \(t=0\), as the other two equal \(-a/b<-1/2\). The critical points \(-a/b\) and \(-a/(3b)\) are both left of the line as well. The unique root on the right therefore defines an analytic inverse everywhere on that half-plane. For real \(s\ge 0\), the hyperbolic expression in the checker gives this root by the identity \(\sinh(3x)=3\sinh x+4\sinh^3x\).

Set $d=1/3$ and $e=1/7$. For the radial strip $x=\xi+i\eta$, $|\eta|\le d$,
keep $\theta$ real to get $\Re s\ge \xi^2-d^2$. For the angular strip
$\theta=\phi+i\eta$, $|\eta|\le e$, keep $x=\xi$ real. Here
$\Re(\cos^2\theta)\ge-\sinh^2 e$ and $|\cos\theta|\le\cosh e$. The check
$4\sinh^2 e<d^2$ gives $\Re s\ge \xi^2-d^2$ for $r\le4$ in the angular strip.
Use these shifts separately. In either strip, the real-part formula and
$\Re t>-1/2$ imply $H(\Re t)\ge\Re s\ge\xi^2-d^2$.

For $|\xi|\ge1$, put $Y=|\xi|^{2/3}$. The checked inequality
$(a+b)^2<1-d^2$ gives $H(Y)\le \xi^2(a+b)^2<\xi^2-d^2$.
For $|\xi|\ge4$, we have $2Y\ge5$ and $8(a/5+b)^2<1-d^2/16$. Hence
$$
H(2Y)=8Y^3(a/(2Y)+b)^2\le 8\xi^2(a/5+b)^2<\xi^2-d^2 .
$$
Since $H$ is increasing on $[-1/2,\infty)$, these comparisons give
$\Re t>Y$ when $|\xi|\ge1$ and $\Re t>2Y$ when $|\xi|\ge4$.
In either strip, the integral over $\xi$ of $e^{-\Re t}$ is at most
$$
2e^{1/2}+2\int_0^\infty e^{-\xi^{2/3}}\,d\xi
=2e^{1/2}+\frac{3\sqrt\pi}{2}<8.
$$

For the radial trapezoid of step $h$, shift the Fourier transform contour
to height $d$ with the decaying sign for each nonzero frequency. With $\theta$
real and Fourier convention $e^{-2\pi i\omega x}$, the strip integral bound gives
$|\widehat F(k/h)|\le8K_j e^{-2\pi d|k|/h}$ for the radial integrand $F$.
Summing over nonzero $k$ via Poisson summation bounds the radial error by
$16K_j/(e^{2\pi d/h}-1)$, before the common factor $1/2$.

For the angular trapezoid, first integrate in $x$. The resulting function is
analytic and $\pi$-periodic, with absolute bound $8K_j\cosh(e)^{2j+2}$ on the
angular strip. Shifting the contour for the coefficient of $e^{2ik\theta}$
bounds its absolute value by $8K_j\cosh(e)^{2j+2}e^{-2e|k|}$. The average
over $N$ equally spaced angular nodes retains exactly the multiples of $N$.
Summing the nonzero retained coefficients bounds the angular error by
$16K_j\cosh(e)^{2j+2}/(e^{2eN}-1)$. The uniform integrable bounds justify both
contour shifts.

The radial estimate $\Re t>2|x|^{2/3}$ for $|x|\ge4$ bounds the two tails of
the discrete radial sum beyond $x_0\ge4$ by the decreasing integral
$$
2K_j\int_{x_0}^\infty e^{-2x^{2/3}}dx
\le \frac32K_j(Y_0+1/2)e^{-2Y_0},\qquad Y_0=x_0^{2/3}.
$$
Here the substitution \(Y=x^{2/3}\) and \(\sqrt Y\le Y\) on the tail give the last bound. The code adds these three errors and includes the factor \(1/2\), using \(h=1/12,\ x_0=64,\ N=100\).

On each compact radius interval \([r_0,r_1]\subset[0,4]\), complete monotonicity of \(-g\) gives the upper bound \(g(r_1)+2r_1g'(r_0)\). For \(r\ge4\), use \((2x-1)e^{-x}\le (5/2)e^{-7/5}e^{-x/5}\), which follows by maximizing \((2x-1)e^{-4x/5}\) at \(x=7/4\). Apply it with \(x=r\lambda\) to each atom of \(-g(r)=\int e^{-r\lambda}\,d\nu_A(\lambda)\). The bound on the tail is \((5/2)e^{-7/5}[-g(4/5)]\). The checker compares this and all compact cells with \(0.17\).

### Energy cells

For $e/u\le f$ and $w\in[w_0,w_1]$, the maximum permissible $e$ is bounded by $\min\{w_1 f/(1-f),.0463-w_0\}$. The checker substitutes this value in each nonnegative perturbation charge. The default $f=7/100$ covers 412 energy intervals and 49 compact radius intervals plus the radius tail. Its strict deficit margin exceeds $4.78\cdot10^{-5}$.

Replay with python-flint installed.

    python3 -I research/conjecture-K/code/content-509-codex-6d92/verify_high_excess.py
