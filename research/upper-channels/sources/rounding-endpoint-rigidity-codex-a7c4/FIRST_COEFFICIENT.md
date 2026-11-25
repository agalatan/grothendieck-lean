# Rigidity at the maximal first coefficient

Agent-ID: codex-a7c4. In this section a channel uses a common charge-one disk map $G$ of finitely many independent standard complex Gaussian coordinates, and one real polynomial $P_j$ of coefficient $\ell^1$ norm at most one per coordinate. A mixture is convex. Write $\mu=\sqrt\pi/2$, $S=\mu^2=\pi/4$, $h$ for one channel series and $H$ for their mixture. Let $a$ denote the unprocessed phase series, with $a_k\ge0$, $\sum_k a_k=1$, $a_0=S$. Define $u=S-H_0$. All estimates below are uniform over dimensions, numbers of channels and polynomial degrees.

## First-chaos projection and the weighted small-ball estimate

Set $\beta=\|\operatorname{Proj}_1G\|_2$. Charge one ensures that the first-chaos projection is a complex linear form. Choose a unit linear form $L=\sum_j v_jZ_j$ with $\operatorname{Proj}_1G=\beta L$, so $\mathbb E[\bar L G]=\beta$. When $\beta=0$, take any unit linear form. A channel using no coordinate would have $G=0$ and may be supplied one unused coordinate. The variable $R=|L|$ has distribution $\Pr(R\le r)=1-e^{-r^2}$ and $\mathbb ER=\mu$. Therefore $\beta\le\mu$. Set $F=\operatorname{ph}L$ and $p=\sum_j|v_j|^2P_j(0)$. The first coefficient is
$$
 h_0=\beta^2p\le S.
$$
Indeed only the first-chaos energies contribute to $h_0$, with multiplier $P_j(0)$ on coordinate $j$.

We use the following elementary inequality for any $0\le Q\le2$, without any independence assumption on $R,Q$:
$$
 \mathbb E[RQ]\ \ge\ \frac{\sqrt2}{3}(\mathbb EQ)^{3/2}. \tag{1}
$$
To see this, put $a=\mathbb E Q$. For $r\ge0$,
$\mathbb E[Q\,\mathbf 1_{R>r}]\ge a-2\Pr(R\le r)\ge a-2r^2$. Integrating the positive part over $0\le r\le\sqrt{a/2}$ gives (1). The estimate also holds on a disjoint union of Gaussian spaces with mixture weights when $R$ is defined using the chosen $L$ in each space, since its marginal law stays the same.

With $Q=1-\operatorname{Re}(\bar F G)$, bounded by 2, one has $\mathbb E[RQ]=\mu-\beta$ and $\|G-F\|_2^2\le 2\mathbb E Q$. Hence
$$
 \|G-F\|_2\le [6(\mu-\beta)]^{1/3}. \tag{2}
$$
Since $\mu(\mu-\beta)\le S-\beta^2\le S-h_0$, in the weighted direct sum of the channels we get $\|G-F\|_2\le(6u/\mu)^{1/3}$, either by (1) on the disjoint union or by Jensen.

## Convergence of the full coefficient series

In the Wiener norm $\|h\|_1=\sum_k|h_k|$,
$$
 \boxed{\quad
 \|H-a\|_1\le 2(6u/\mu)^{1/3}
     +2\sum_{k\ge0}a_k\min\{1,\,2(2k+1)u/S\}.\quad} \tag{3}
$$
In particular $H\to a$ in coefficient $\ell^1$ whenever $H_0\to S$. This gives $D(H)\to 2S-1=\pi/2-1$ and $W(H)\to W(a)=\gamma^\dagger$.

For the proof, expand $G$ and $F$ in the same orthonormal complex Hermite basis. Cauchy–Schwarz gives
$$
 \sum_\nu\big|\,|\widehat G_\nu|^2-|\widehat F_\nu|^2\,\big|
 \le \|G-F\|_2(\|G\|_2+\|F\|_2)\le2\|G-F\|_2 .
$$
For coordinate degrees $d_j$ and total odd degree $d=\sum d_j$, its coefficient series multiplier is $X^{(d-1)/2}\prod_jP_j(X)^{d_j}$, of coefficient norm at most one. Summation yields the same upper bound for the change in the entire channel series, regardless of polynomial signs.

For the map $F=\operatorname{ph}L$ alone, the channel series is exactly $\sum_{k\ge0}a_kX^k P(X)^{2k+1}$, with $P=\sum_j|v_j|^2P_j$. Indeed for real input correlation $t\in(-1,1)$ the jointly complex Gaussian linear forms on the two sides have correlation $tP(t^2)$, so their phase pairing is the scalar phase kernel at $tP(t^2)$. Absolute convergence and uniqueness of the power series give the stated coefficient identity. Here $\|P\|_1\le1$, $P(0)=p$, and $\|P-1\|_1\le (1-p)+(1-|p|)\le2(1-p)$. Thus for every positive integer $d$,
$$
 \|P^d-1\|_1\le \min\{2,d\|P-1\|_1\}\le2\min\{1,d(1-p)\}.
$$
We have $S(1-p)=(S-\beta^2)(1-p)+\beta^2(1-p)\le2(S-h_0)$, also when $\beta=0$. Average the last polynomial bound and apply concavity of $x\mapsto\min(1,dx)$. Combined with (2) this proves (3). Dominated convergence in the $a_k$-sum proves its claimed limit. At $H_0=S$ every positive-weight channel has $\beta=\mu$ and $p=1$. Equality in (2) gives $G=\operatorname{ph}L$ almost everywhere, and each preprocessor on the support of $v$ is identically 1, since its constant term is 1 and its Wiener norm is at most 1.

## A sharp-exponent slope estimate from endpoint coupling

At the real correlation $1$ the full series has value $h(1)=\sum_k h_k$. The nonnegative quantity $1-H(1)$ controls the slope, because $D(H)\le 2H_0-H(1)$. We claim
$$
 \boxed{\qquad (1-H(1))^3\le\frac{1152}{\pi}(S-H_0)^2,\qquad
 D(H)\le 2H_0-1+\left(\frac{1152}{\pi}\right)^{1/3}(S-H_0)^{2/3}.\qquad} \tag{4}
$$
In particular $H_0\ge783/1000$ forces $D(H)<7/10$, and $H_0\ge7827/10000$ forces $D(H)<71/100$.

For one channel let $t_j=P_j(1)$ and $\lambda=\sum_j|v_j|^2t_j$. Draw row and column standard circular Gaussian vectors $X,Y$ with independent coordinate pairs and real cross-correlations $t_j$. The endpoint formula $h(1)=\mathbb E[\overline{G(X)}G(Y)]$ holds by the diagonal action of Gaussian averaging on complex Hermite polynomials and continuity at $|t_j|=1$. In particular $h(1)$ is real. If $c_j=P_j(0)$, then $t_j\ge c_j-(1-|c_j|)$, so $1+t_j\ge 2c_j$ and also $1+t_j\ge0$. It follows that
$$
 \mu\beta(1+\lambda)\ \ge\ 2\beta^2p. \tag{5}
$$
For $p\le0$ this follows by nonnegativity, and for $p\ge0$ it follows from $1+\lambda\ge2p$ and $\mu\ge\beta$.

Let $U,V$ be conditionally independent unit-circle variables given $(X,Y)$, with means $G(X),G(Y)$ respectively. A disk value $b$ is realized by the two values $\pm\operatorname{ph} b$ with probabilities $(1\pm |b|)/2$, choosing 1 as the reference phase at zero. Then $\mathbb E[\bar U V]=h(1)$. For this estimate put $F=\operatorname{ph}L(X)$ and $R=|L(X)|$. First-chaos projection and Gaussian regression give
$$
 \mathbb E[R(1-\operatorname{Re}(\bar F U))]=\mu-\beta,\qquad
 \mathbb E[R(1-\operatorname{Re}(\bar F V))]=\mu-\beta\lambda.
$$
Indeed $\mathbb E[\overline{L(X)}G(Y)]
 =\sum_j\bar v_jt_j\mathbb E[\overline{Y_j}G(Y)]=\beta\lambda$.

Now average channels and select $U$ or $V$ with equal probabilities. With $T=1-\operatorname{Re}(\bar F\,\text{selected phase})$, (5) gives $\mathbb E[RT]\le u/\mu$. Formula (1) gives $\mathbb ET\le(3u/(\sqrt2\mu))^{2/3}$. From $|U-V|^2\le2|U-F|^2+2|V-F|^2$ we conclude
$1-H(1)\le4\mathbb E T$. Cubing and substituting $S=\mu^2=\pi/4$ yields (4). For the two stated rational thresholds $(b,d)$, put $\pi_-=314/100,\ \pi_+=355/113$. In each case $1+d-\pi_+/2>0$ and
$$
 (1+d-\pi_+/2)^3-\frac{1152}{\pi_-}(\pi_+/4-b)^2
 =\begin{cases}
 6620357/141584268125,&(b,d)=(783/1000,7/10),\\
 5978615881/226534829000000,&(b,d)=(7827/10000,71/100).
 \end{cases}
$$
Both values are positive, so (4) with $2H_0\le\pi/2$ proves the strict thresholds.

The exponent $2/3$ in (4) is sharp, including for the slope. In one coordinate take $P=1$ and $G_r(z)=\operatorname{ph}(z)\mathbf 1_{|z|>r}$. All coefficients are nonnegative, $h(1)=e^{-r^2}$, and
$\beta=\mu-\int_0^r2s^2e^{-s^2}ds=\mu-2r^3/3+O(r^5)$. Hence $u=(4\mu/3)r^3+O(r^5)$ and $1-h(1)\sim r^2$. Because $D(h)=2h_0-h(1)$ for this example, also $D(h)-(2S-1)\sim r^2$. A uniform $o(u^{2/3})$ error is impossible, even for these one-coordinate channels.

## A tradeoff with the alternating score

If the article's phase ceiling $W(\operatorname{ph},P)\le\gamma^\dagger$ is available, the same comparison also yields
$$
 \sqrt{1-\gamma^\dagger}\le
 \sqrt{1-W(H)}+\sqrt2(6u/\mu)^{1/3}. \tag{6}
$$
On each charge-one Hermite space let $T$ be the real diagonal multiplier $(-1)^{(d-1)/2}\prod_jP_j(-1)^{d_j}$. On the mixture direct sum this is a selfadjoint contraction and $\langle G,TG\rangle=W(H)$. For the unit-norm comparison maps $F=\operatorname{ph}L$ the one-coordinate polynomial reduction from (3) gives $\langle F,TF\rangle\le\gamma^\dagger$. The triangle inequality for $(I-T)^{1/2}$, whose norm is at most $\sqrt2$, now proves (6) using (2) and $\|G\|\le1$.
