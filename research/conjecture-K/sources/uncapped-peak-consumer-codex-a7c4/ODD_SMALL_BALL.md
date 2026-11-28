# Positive odd-energy mass below a radial threshold

Agent-ID: codex-a7c4. Task #813. **P + C, author only.**

For $Q\in H_{1,1}$, $P\in H_{2,0}$ and constant $\nu$, write $S=|Q|^2+|P|^2+|\nu|^2$ and $W=\mathbb ES$. For every event $A$ on the entire probability space of mass $\alpha$,
\[
 \mathbb E[\mathbf1_A S]\ge
  \frac4{51}\alpha^3\,\mathbb E|Q|^2+
  \frac16\alpha^3\,\mathbb E|P|^2+
  \alpha|\nu|^2\ \ge \frac4{51}\alpha^3W .
\]
The event may depend on all the fields.

**Centered quadratic forms.** The real and imaginary parts of $Q$ are centered Hermitian quadratic forms. Diagonalizing each separately gives $Y=\sum_j\lambda_j(E_j-1)$, where $E_j$ are independent standard exponential random variables and $\sigma^2=\mathbb EY^2=\sum\lambda_j^2$. When $\sigma=0$ its contribution vanishes. Otherwise set $m=\max\lambda_j^2/\sigma^2$.

If $m\ge16/17$, condition on the other variables. The density of the dominant scaled exponential is at most $1/(\sigma\sqrt m)$, hence the unconditional density is at most $\sqrt{17}/(4\sigma)$. If $m<16/17$, partition the coefficients into two groups with variance fractions $a,b$ such that $a+b=1$ and $ab\ge16/289$. For $1/2\le m<16/17$, use the largest coefficient alone: $m(1-m)\ge16/289$. For $m<1/2$, accumulate coefficients until their total squared fraction first reaches $1/4$; that total is at most $3/4$, giving $ab\ge3/16$.

In the latter case independence gives
\[
 |\phi_Y(t)|=\prod_j(1+\lambda_j^2t^2)^{-1/2}
 \le[(1+a\sigma^2t^2)(1+b\sigma^2t^2)]^{-1/2}
 \le(1+\sigma^2\sqrt{ab}\,t^2)^{-1}.
\]
Fourier inversion bounds the density by $[2\sigma(ab)^{1/4}]^{-1}\le\sqrt{17}/(4\sigma)$. Thus, with $M=\sqrt{17}/(4\sigma)$,
\[
 \mathbb E[\mathbf1_A Y^2]\ge
 \int_0^{(\alpha/(2M))^2}(\alpha-2M\sqrt t)\,dt
 =\frac{\alpha^3}{12M^2}=\frac4{51}\alpha^3\sigma^2 .
\]
Add the inequalities for real and imaginary parts on the same event. Their variances sum to $\mathbb E|Q|^2$; independence between them is unnecessary.

**Holomorphic quadratic forms.** By Takagi factorization and invariance of the complex Gaussian, $P=\sum_j d_j z_j^2$ with $d_j\ge0$ and $w=\mathbb E|P|^2=2\sum_jd_j^2$. Assume $w>0$. The planar characteristic function of $d z^2$ at $\xi$ is $(1+d^2|\xi|^2)^{-1/2}$: after rotation take $\xi$ real and write $\operatorname{Re}(z^2)=(X^2-Y^2)/2$ for independent standard real Gaussians. Consequently $P$ has the same law as $\sqrt{2\sum d_j^2 X_j^2}\,G$ where $G$ is standard complex Gaussian independent of the independent real Gaussians $X_j$. It follows that $|P|^2/w$ has the distribution of $Y=E\sum_j a_j X_j^2$, with $E\sim\operatorname{Exp}(1)$ independent and $a_j=2d_j^2/w$ summing to one.

For each threshold $s\ge0$, convexity of $(s-x)_+$ gives
\[
 \mathbb E(s-Y)_+\le \sum_j a_j\mathbb E(s-EX_j^2)_+
   =\mathbb E(s-T^2/2)_+,\qquad T\sim\operatorname{Exp}(1).
\]
The last identity is the single-coefficient case of the distributional equality, since $|z^2|^2/2=T^2/2$. For every event $A$, $\mathbb E[\mathbf1_A Y]\ge s\alpha-\mathbb E(s-Y)_+$. This lower bound depends only on the marginal law and therefore applies to the original $|P|^2/w$ even when $A$ depends on other fields. For $0<\alpha<1$ take $s=(-\log(1-\alpha))^2/2$ to obtain the lower-tail integral
\[
 \mathbb E[\mathbf1_A |P|^2]/w
 \ge \frac12\int_0^\alpha[-\log(1-p)]^2\,dp \ge \alpha^3/6 .
\]
The endpoints follow directly. Normalized rank-one $P$ attains the first bound when $A$ is its lower-quantile event.

**Uniform price at every fourth excess.** Write $X=|q|^2$ and let $u$ bound its mean. Let $H$ be the [conditional matrix envelope](ODD_RESPONSE.md), with maximum $k_*=H(x_*)$ from $x_*=(17/40)^2$. For $W>0$ let $F(x)=\Pr(X\le x)$ and let $F_S(x)$ denote the corresponding probability under the density $S/W$. By the event inequality $F_S(x)\ge(4/51)F(x)^3$. The original compensator averages to zero before this change of measure. Layer cake gives
\[
 k_*-\mathbb E_S H(X)=\int_0^{x_*}F_S\,dH
 \ \ge\frac4{51}\int_0^{x_*} F^3\,dH,\qquad
 \int_0^{x_*}F(x)\,dx=x_*-\mathbb E\min(X,x_*)\ge x_*-u .
\]
When $W=0$ the odd gain vanishes. A closed-form discount follows already by Jensen applied to $F^3$ under $dH/(k_*-H(0))$, using $\mathbb E H(X)\le H(u)$:
\[
 k_*-\mathbb E_S H(X)\ \ge\frac4{51}\frac{(k_*-H(u))^3}{(k_*-H(0))^2}.
\]

For the numerical values retain the seven slopes $m_i$ and segment lengths $L_i$ of $H$. Every multiplier $\lambda\ge0$ gives
\[
 \int_0^{x_*} F^3\,dH\ge\lambda(x_*-u)-\sum_i L_i\max_{0\le f\le1}(\lambda f-m_i f^3).
\]
This follows by integrating the defining inequality for the maximum on each segment. For $\lambda\ge3m_i$ the maximum is $\lambda-m_i$. For $0\le\lambda<3m_i$ it is $(2\lambda/3)\sqrt{\lambda/(3m_i)}$. Each price below uses a displayed rational multiplier and an upper square-root enclosure. No optimization result is a premise.

| Upper normalized remote energy $u$ | Multiplier $\lambda$ | Odd price at most | Discount from $k_*$ greater than |
|---|---:|---:|---:|
| .043 | .521787 | 1.277940349 | .001507401 |
| .06 | .355886 | 1.278521949 | .000925802 |
| .07 | .274510 | 1.278767934 | .000679816 |

The [replay](../../code/uncapped-peak-consumer-codex-a7c4/odd_response.py) verifies each price and discount and checks two controls that give zero discount. Use `python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/odd_response.py --price-only`. These bounds apply at arbitrary fourth excess and with arbitrary coordinate sharing. Row 8.13f's physical cover already follows from the fourth-moment price alone.
