# Independent cubic blocks at the peak row

Agent-ID: codex-a7c4. [Task #509](https://github.com/agalatan/grothendieck-lean/issues/509). **P + C, author only.** Let $q$ be a nonzero zero-contraction core, $F=\bar\partial q$, $u=\mathbb E|q|^2$, $H=\mathbb E FF^*$ and $B_2=\operatorname{tr}(H^2)$. Let $h_j$ be arbitrary bidegree-$(2,1)$ Wick cubics on mutually disjoint Gaussian coordinate blocks, each disjoint from the core and from the visible input. Put $r=q+\sum_j h_j$, $e_j=\mathbb E|h_j|^2$, $m_j=\mathbb E|h_j|^4$, $e=\sum_j e_j$. Suppose $u+e\le 463/10000$. This note concerns the peak visible row of #509.

* For a single independent residual, **$e\le\sqrt{B_2}/11$ implies $C(r)^2\le D(r)/10$**. At output rank one this allows residual energy $u/11$ in every input dimension. An arbitrary sum on disjoint-from-core inputs can also be treated as one residual.
* For several blocks the same conclusion holds if
$$
 \frac{17}{20}\sum_j e_j^2
   +40(11/5)^2\sum_j e_j(m_j-e_j^2)\le 7B_2/25.
$$
For example, a rank-one core and 28 independent residuals, each of energy $u/28$, satisfy the condition even with total residual energy $u$. Each residual may have arbitrary tensor coefficients and dimension.

## Derivative estimates after independent circular noise

Write $\Phi(s)=2\mathbb E|L+\sqrt s|$ and $\Psi(y)=y g(|y|^2)$. The positive Laplace measures in rows 2.7–2.7b give a Bernstein representation for $\Phi$, a completely monotone representation for $-g$, and the bounds $M=-\Phi''(0)<17/10$, $N=g'(0)<11/5$. The outward enclosures refer to derivatives in the squared radius. [Peak derivative certificate and normalization](../gemini-plan-audit-2026-11-17/NOTE.md)

For any independent circular noise $R$ of finite second moment put $\Phi_R(s)=\mathbb E\Phi(|R+\sqrt s|^2)$ and $\mathbb E\Psi(R+y)=y g_R(|y|^2)$. Then $|\Phi_R''|\le M$ and $|g_R'|\le N$ globally. If $R$ is a proper Gaussian variance mixture, $\Phi_R$ is also Bernstein: convolving $e^{-\lambda |y|^2}$ with noise of variance $v$ gives $(1+\lambda v)^{-1}e^{-\lambda |y|^2/(1+\lambda v)}$, and a Bernstein representation integrates one minus these kernels.

Here is a derivation for general circular $R$. The Fourier representation of $e^{-\lambda|y|^2}$ uses a planar Gaussian frequency $\omega$ with coordinate variance $2\lambda$. Write $p=|\omega|$, with $\mathbb E p^4=32\lambda^2$. The characteristic function of $R$ is a radial multiplier of modulus at most one. Let $J(t)$ and $A(t)$ be the characteristic functions along one axis of uniform probability on the unit circle and disk, respectively. By the divergence theorem on the disk, for a unit direction $d$ uniform on the circle,
$$
 \mathbb E_d d\,e^{ipd\cdot y}=i(p/2)y A(p|y|).
$$
Hence $\partial_s J(p\sqrt s)=-p^2 A(p\sqrt s)/4$. Also $|\partial_s A(p\sqrt s)|\le p^2/8$ by $|\sin t|\le|t|$ and the disk coordinate variance $1/4$. The second derivative of the translated scalar kernel in the squared radius is thus at most $\mathbb Ep^4/32=\lambda^2$ in absolute value. The vector kernel $y e^{-\lambda|y|^2}$ has Fourier representation $\mathbb E[\omega e^{i\omega\cdot y}]/(2i\lambda)$. After convolution its radial coefficient is the average of $p^2 A(p\sqrt s)/(4\lambda)$ against the frequency law times the radial multiplier. Its derivative is at most $\mathbb Ep^4/(32\lambda)=\lambda$. These bounds justify differentiation, including at zero by continuity, first for finite positive kernel mixtures and then by dominated convergence using the finite endpoint derivative moments $M,N$. A linear term in the Bernstein representation contributes zero second derivative; a constant in $g$ contributes zero first derivative.

## Comparing payoffs and projecting the raw response

Let $G_j$ be fresh independent standard proper Gaussians and let $r_G=q+\sum_j\sqrt{e_j}G_j$. In the [covariance deficit estimate](PROOF.md), add $e$ to the visible mixing variance and use $b_*\le u$. The loss relative to the Gaussian benchmark of energy $u+e$ is at least
$$
 \frac{\sqrt\pi B_2}{8\sqrt{m+u+e}(m+u+e+b_*)}> 7B_2/25,
$$
where $m=1181331/1562500$. Indeed $m+u+e<(9/10)^2$, $m+u+e+b_*<17/20$ and $\sqrt\pi>\sqrt3> (7/25)8(9/10)(17/20)$.

The sum $h=\sum_j h_j$ is circular and independent of $q$, whose law is a proper Gaussian variance mixture. By concavity $\mathbb E\Phi_q(|h|^2)\le\Phi_q(e)$. Taylor's lower bound at $e$ gives $\mathbb E\Phi_q(e|G|^2)\ge\Phi_q(e)-Me^2/2$ since the exponential has variance one. A second bound uses the independence of the blocks in the Fourier representation of the Bernstein profile $\Phi_q$. At frequency of modulus $p$, let $a_j=p^2e_j/4$ and $x_j=\mathbb E e^{i\omega\cdot h_j}$. Circularity gives $x_j=\mathbb E f(p^2|h_j|^2/4)$ with $f(x)=J(2\sqrt x)$. We claim
$$
 e^{-\sum a_j}-\prod_j x_j\le\tfrac14\sum_j a_j^2 .
$$
First $f\ge-1/2$: average the squared absolute value of the sum of three complex exponentials on a uniform circle, choosing their frequency vectors at the vertices of an equilateral triangle of side $2\sqrt x$. The result is $3+6f(x)\ge0$. The global sixth-degree Taylor lower bound for cosine, averaged on the circle, gives $f(x)\ge P(x)=1-x+x^2/4-x^3/36$. A convex minorant of $f$ is $P$ up to $2$, its tangent at $2$ up to $17/6$, then the constant $-1/2$: $P''\ge0$ up to $3$, $P(2)=-2/9$ and $P'(2)=-1/3$. Jensen now gives $x_j\ge P(a_j)$ for $a_j\le2$. The fourth-degree Taylor upper bound for $e^{-a}$ gives $e^{-a}-P(a)\le a^2/4$ there because $-5a^3/36+a^4/24\le0$. For $a_j\ge2$ use $e^{-2}+1/2<1\le a_j^2/4$. A negative $x_j$ requires $a_j>5/4$, since $P$ decreases up to $2$ and $P(5/4)>0$.

If all factors are nonnegative, telescope the products: every other factor lies in $[0,1]$. If the product is negative, it is at least any negative factor $x_k$, so use $e^{-\sum a_j}\le e^{-a_k}$. If there is a negative factor but the product is nonnegative, the left side is at most $e^{-5/4}<(5/4)^2/4$. This proves the claim in all cases. The coefficient $1/4$ is sharp at small frequency for one fixed-radius circular variable by the quadratic coefficients of $e^{-a}$ and $f(a)$. For each Gaussian Fourier atom the cost is at most $\mathbb E p^4\sum_j e_j^2/64=(\lambda^2/2)\sum_j e_j^2$. Integrate against the positive measure of $\Phi_q$, using $|\Phi_q''(0)|\le M$; the linear term cancels. Together these give
$$
 D(r)\ge 7B_2/25-(M/2)\sum_j e_j^2.
$$

The first projection on the core coordinates vanishes: averaging the independent circular residuals produces a radial response $q g_h(|q|^2)$ and row 3.24 gives zero core first content for every radial profile. For block $j$ average all other inputs except the visible input already in $\Psi$. They form independent circular noise $R$. For a unit complex Gaussian linear form $Z_b$ on this block, Wick orthogonality gives $\mathbb E\bar Z_b h_j=0$, so the coefficient is unchanged by subtracting $g_R(e_j)h_j$. Cauchy–Schwarz gives its squared modulus at most
$$
 N^2\,\mathbb E|Z_b h_j|^2\,(m_j-e_j^2)\le 4N^2 e_j(m_j-e_j^2).
$$
To see the last inequality, rotate the unit direction to the first coordinate. Multiplication by this coordinate on the normalized complex Hermite basis raises the holomorphic index with coefficient $\sqrt{p_1+1}$ or lowers the antiholomorphic index with coefficient $\sqrt{q_1}$. The two resulting degrees are orthogonal; within each shift the index map is injective. Here $p_1\le2$, $q_1\le1$. Taking the supremum over unit directions gives the norm of this block projection. The squared norms add across mutually orthogonal first-chaos blocks, proving the stated criterion.

Finally $m_j\le44e_j^2$ by ledger 3.4. For one block with $e\le\sqrt{B_2}/11$, $B_2\le u^2$ implies $e\le (463/10000)/12$. The relative cost is at most $[17/20+40(11/5)^2\,43(463/10000)/12]/121<7/25$. For the 28-block example $u\le(463/10000)/2$, $B_2=u^2$. The cost divided by $u^2$ is at most $(17/20)/28+40(11/5)^2\,43(463/10000)/(2\cdot28^2)<7/25$. Independence here requires disjoint input blocks. For perturbations sharing drivers the general neighbourhood in #694 still applies.

[Exact moment and budget replay](../../code/quadratic-spectrum-codex-a7c4/verify.py).
