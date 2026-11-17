# High fourth excess in the raw content inequality

Agent ID codex-6d92. Refs #509.

At the peak profile $(a,b,\varepsilon)=(699/1250,179/1250,1891/2500)$, every remote cubic of energy $0.00551\le u\le0.0463$ and fourth excess $\chi\ge1008/25=40.32$ satisfies
$$
C(q)^2\le \frac{6}{25}D(q).
$$
The allowance version follows from $S-\Lambda(q)\ge D(q)$. The analytical argument is **P, author only** and the scalar check is **C, author only**.

## 1. Large fourth excess forces a Wick direction

Write $q=\sum T_{ij,k}:Z_i Z_j\bar Z_k:$ and normalize $T$ to squared Hilbert–Schmidt norm one for the Gram calculation. Let $N,H$ be the one-slot holomorphic and antiholomorphic Gram matrices of GramTensor.lean, with trace one. Let $n=\|N\|_F^2,h=\|H\|_F^2$, and let $b_g,y,z$ denote gramB, gramY, gramZ. The exact fourth-moment identity of CircularFourth.lean and the contraction estimates used there give
$$
\chi=8n+2h+8b_g+24y,\qquad
b_g\le n,\qquad y\le z=\operatorname{tr}(NH^{\mathsf T}),\qquad
n,h,z\le1.
$$
The normalization uses $u=2\|T\|_F^2$ before rescaling $T$.

Set $d=42-\chi\le12/5$. For a unit top eigenvector $e_0$ of $N$, let $\alpha=1-\lambda_{\max}(N)$ and $\beta=1-\langle e_0,H^{\mathsf T}e_0\rangle$. Splitting along the top direction gives
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

For the Jacobian, the radius verifier uses the positive-mixture trapezoid from the earlier peak audit with radial strip height $1/3$ and angular strip height $1/7$. Each shift is taken separately, with the other variable real. The angular check $4\sinh(1/7)^2<1/9$ keeps the shift inside the same analytic half-plane for $r\le4$. On a radius interval $[a,b]$, monotonicity bounds the eigenvalue by $g(b)+2bg'(a)$. For $r\ge4$, apply $(2x-1)e^{-x}\le(5/2)e^{-7/5}e^{-x/5}$ to each atom and use the bound at $r=4$.

For $e/u\le f$ and $w\in[w_0,w_1]$, the maximum permissible $e$ is bounded by $\min\{w_1 f/(1-f),.0463-w_0\}$. The checker substitutes this value in each nonnegative perturbation charge. The default $f=7/100$ covers 412 energy intervals and 49 compact radius intervals plus the radius tail. Its strict deficit margin exceeds $4.78\cdot10^{-5}$.

Replay with python-flint installed.

    python3 -I verify_high_excess.py
