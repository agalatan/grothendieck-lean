# The mixed one-driver content inequality

Agent-ID: codex-a7c4. This is a paper deduction for [issue #509](https://github.com/agalatan/grothendieck-lean/issues/509). The scalar envelopes have the **P + C, author only** status of the [one-driver certificate](../one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md), ledger 6.3.13–6.3.14. The new implications are **P, author only**. The [exact checks](../../code/mixed-driver-folding-codex-a7c4/verify.py) use only Python's standard library.

At each of the peak, flank and upper rows, $D(q)=2\mathbb E|L+\sqrt u W|-2\mathbb E|L+q|$ is the raw deficit at energy $u=\mathbb E|q|^2$, with $L=z_1(a+b|z_1|^2)$, $W$ independent standard complex Gaussian, and $q$ independent of $z_1$. The content $C(q)$ is the norm of the projection of $F_A(q)=qg(|q|^2)$ on all remote holomorphic linear forms, with $F_A(y)=\mathbb E_{z_1}[(|z_1|^2-1)\operatorname{ph}(L+y)]$. The exact row parameters and the scalar envelopes are in the linked certificate.

Let $X$ be a single standard proper complex Gaussian independent of a standard proper Gaussian vector $Y$. For arbitrary complex $c$, centered $P\in H_{1,1}(Y)$ and holomorphic quadratic $H\in H_{2,0}(Y)$, put

$$q=X[c(|X|^2-2)+P(Y)]+\bar X H(Y),\qquad f=2|c|^2/u.$$

For $551/100000\le u\le463/10000$ and every $0\le f\le1$ we obtain

$$C(q)^2\le(47/200)D(q),\qquad C(q)^2\le(11/50)D(q)\ \text{if } f\ge1/16.$$

No restriction on the cross-dependence of $H$ and $P$ is required. Ledger 6.2.1 then gives the A-shell payoff bound on its stated domain by completing the square as in 6.2.3. The terms $(|X|^2-1)V(Y)$, $X^2\overline{W(Y)}$ and a bath-only cubic still present other mixed cases in 6.3.16.

## Folding the joint law with the drivers

Let $X$ now be a block of any number of remote coordinates. Suppose $q$ is a cubic of character one under simultaneous rotation of $X,Y$ and $q=q_++q_-$ under rotation of $X$ alone, with $q_\pm(e^{i\beta}X,Y)=e^{\pm i\beta}q_\pm(X,Y)$. Put $r=q_++\overline{q_-}$. Then $(q,X)$ and $(r,X)$ have the same joint law. Indeed $\Re q=\Re r$ pointwise, and both joint laws are invariant under common rotation. For the first law rotate $X,Y$ simultaneously, and for the second rotate $X$ alone. In the joint characteristic function $\mathbb E\exp(i\Re(\bar s q+v^*X))$ one may therefore rotate $s$ to a nonnegative real, rotating $v$ at the same time. This recovers every joint characteristic function from the law of $(\Re q,X)$.

Every component of the bath first-chaos content vanishes for each variable: negating $X$ with $Y$ fixed negates both $q$ and $r$, and $F_A$ is odd. Therefore their entire content vectors, energies and radial deficits agree. This identity concerns the full joint law with $X$; it makes no claim of a joint identity with $Y$.

For a single driver it gives $r=X[c(|X|^2-2)+A]$ with $A=P+\bar H$. This independent bath coefficient is centered and $p=\mathbb E|A|^2=\mathbb E|P|^2+\mathbb E|H|^2$ by phase orthogonality; $u=2|c|^2+p$. The large-Wick-share result follows at once from Gate 3 of the one-driver certificate: its pointwise envelope applies to any centered square-integrable $A$ independent of $X$, including $A=0$ at $f=1$. We next check the expectation required by Gate 5 at small Wick share.

## Fourth and sixth moments for a complex quadratic of real Gaussians

Let $A$ be any centered complex quadratic form of finitely many independent real standard Gaussians, $p=\mathbb E|A|^2$, $e=\mathbb E|A|^4-2p^2$, and $M=|\mathbb EA^2|^2$. Then

$$e\ge M,\qquad \mathbb E|A|^6\le 6p^3+74pe-65pM.$$

For uniform angular averaging in $\alpha$, set $F=\sqrt2\Re(e^{-i\alpha}A)$ and $v=\mathbb EF^2=p+\Re(e^{-2i\alpha}\mathbb EA^2)\le2p$. Diagonalizing the real symmetric form for each fixed angle gives $F=\sum_j\lambda_j(G_j^2-1)$ in law. Its cumulants are $\kappa_d=2^{d-1}(d-1)!\sum_j\lambda_j^d$ for $d\ge2$, by expanding $\log\mathbb E e^{t\lambda(G^2-1)}=-t\lambda-\frac12\log(1-2t\lambda)$. Cauchy–Schwarz yields $\kappa_3^2\le (2/3)v\kappa_4$; $\sum\lambda_j^6\le(\sum\lambda_j^2)(\sum\lambda_j^4)$ gives $\kappa_6\le40v\kappa_4$. The sixth moment of a centered variable is $15v^3+15v\kappa_4+10\kappa_3^2+\kappa_6$, hence $\mathbb EF^6\le15v^3+(185/3)v\kappa_4$.

Writing angular means as brackets gives $\langle\mathbb EF^4\rangle=(3/2)\mathbb E|A|^4$, $\langle\mathbb EF^6\rangle=(5/2)\mathbb E|A|^6$, $\langle v^2\rangle=p^2+M/2$ and $\langle v^3\rangle=p^3+3pM/2$. As $\kappa_4\ge0$, $\langle\kappa_4\rangle=(3/2)(e-M)\ge0$ and $\langle v\kappa_4\rangle\le2p\langle\kappa_4\rangle$. Substitution gives both claims.

## Taking the expectation of the small-Wick multiplier

On $f\le1/16$, $p\ge15u/16>0$. The folded $A$ is a centered complex quadratic of the real and imaginary bath coordinates, after normalizing them as standard real Gaussians. Put $S=|A|^2/p$. The preceding lemma gives

$$\mathbb E(S^2-2)\ge0,\qquad \mathbb E(S^3-37S^2+68)\le37\mathbb E(S^2-2).$$

Gate 5 of the [one-driver certificate](../one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md) bounds $|T_c(z)-\lambda(u)z|^2/w(|z|^2/p)$ pointwise by $(47/200)H_{c,u}(z)+p^2 Q(|z|^2/p)$, with

$$w(s)=3/10+7s/10,\qquad Q(s)=\tfrac{59}{500}(s-1)-b_4(s^2-2)+\tfrac{21}{200000}(s^3-37s^2+68).$$

The three rows have $b_4\in\{37/1000,7/200\}$. Thus $\mathbb EQ(S)\le(37\cdot21/200000-b_4)\mathbb E(S^2-2)\le0$. Because $\mathbb Ew(S)=1$, Cauchy–Schwarz gives

$$C(r)^2=|\mathbb E[T_c(A)-\lambda(u)A]|^2\le\mathbb E\frac{|T_c(A)-\lambda(u)A|^2}{w(S)}\le(47/200)\mathbb EH_{c,u}(A)=(47/200)D(r).$$

Here the definitions of $T_c,H_{c,u}$ and their expectation identities depend only on the centered independent coefficient and its energy, as shown in the same certificate. The separate sixth-moment hypothesis used for complex matrix forms in 6.3.1 can fail for $P+\bar H$. Taking the expectation of the combined multiplier is essential.

## Several drivers without self-interaction

For $q=\sum_j[X_jP_j(Y)+\bar X_jH_j(Y)]$, the folded surrogate $r=\sum_jX_j(P_j+\bar H_j)$ is conditionally proper Gaussian of variance $V=\sum_j|P_j+\bar H_j|^2$, including when $V=0$. Thus $|q|^2$ has the law of $V R$ for independent $R\sim\mathrm{Exp}(1)$. As $\mathbb EV=u$, Jensen conditional on $R$ gives $\mathbb E\phi(|q|^2)\le\mathbb E\phi(uR)$ for every concave radial profile for which both expectations exist. The comparison applies to the peak, flank and upper deficit profiles; see 2.7 for their concavity. This also gives the Laplace order $\mathbb E e^{-t|q|^2}=\mathbb E(1+tV)^{-1}\ge(1+tu)^{-1}$ for $t\ge0$. Ledger 3.25 already gives deficit estimates for the single-coordinate-hyperplane subclass. This calculation covers a block of any size.

If a common unitary bath splitting $Y=(S,T)$ makes all $P_j$ block diagonal and each $H_j$ bilinear between $S,T$, then $(S,\bar T)$ is a standard proper Gaussian vector. In these coordinates each $P_j+\bar H_j$ is a centered $(1,1)$ complex matrix form: the $S$ block is unchanged, the $T$ diagonal block transposes and $\bar H_j$ is conjugate-linear in $S$ and linear in the new $T$. Apply the [Gaussian-factor theorem](../received-2026-11-05/gaussian_factor_content/vector_content/proof.md), ledger 6.3.4, to obtain $C(q)^2\le(239/1000)D(q)$ throughout the same energy band at all three rows. With a single driver and this split, 6.3.3 gives $11/50$ at $f=0$. The raw content of a general many-driver block remains open.

## A mixed cubic outside the previous one-driver classes

Take $P=|Y|^2-1$, $H=Y^2$, with a single bath coordinate $Y$. The square $Y^2$ cannot be bilinear across distinct bath blocks. At $c=0$, $q=X(|Y|^2-1)+\bar X Y^2$ has antiholomorphic derivatives $Y^2,XY$. They have no nonzero constant linear annihilator, whereas every proper Gaussian-factor presentation has zero antiholomorphic derivative on its driver space. The same example cannot be a one-driver self-interaction in a different unitary basis: divisibility by that holomorphic driver form would force it proportional to $X$ by the linear term $-X$, and $\bar X Y^2$ is not divisible by $X$. Multiplication by a nonzero scalar puts this example at any energy of the band.

For $A=a(|Y|^2-1)+\bar b\bar Y^2$, write $x=|a|^2$, $y=|b|^2$, $T=|Y|^2\sim\mathrm{Exp}(1)$. A uniform relative phase gives

$$m_k=\mathbb E|A|^{2k}=\sum_{j=0}^k\binom{k}{j}^2x^{k-j}y^j\mathbb E[(T-1)^{2(k-j)}T^{2j}].$$

At $x=y=1$ this gives $(m_1,m_2,m_3)=(3,89,8779)$, whereas the separate cap $37m_1m_2-68m_1^3$ equals $8043$. The mixed cubic is nevertheless covered for every Wick share by the combined multiplier. The [standard-library replay](../../code/mixed-driver-folding-codex-a7c4/verify.py) derives the obstruction from integer moments, checks the rational constants and tests the joint-law identity on mixed polynomial moments.
