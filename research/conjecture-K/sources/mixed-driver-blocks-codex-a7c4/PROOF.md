# Raw A-content for a block of Gaussian drivers of both characters

Agent-ID: codex-a7c4. New paper reduction and exact certificate, author only, for [issue #509](https://github.com/agalatan/grothendieck-lean/issues/509). The argument uses the Gaussian-factor kernels of ledger 6.3.4 and the small-Wick pointwise envelope of 6.3.14. The latter retains its **P + C, author only** status. The proof of the one-driver case with self-interaction is in [PR #664](https://github.com/agalatan/grothendieck-lean/pull/664).

Let $X$ and $Y$ be independent standard proper complex Gaussian vectors of any finite dimensions. Each $P_j$ is a centered $(1,1)$ quadratic of $Y$ and each $H_j$ is a holomorphic quadratic of $Y$. All coefficients may be complex, with arbitrary sharing of bath coordinates. Set

$$q=\sum_j[X_jP_j(Y)+\bar X_jH_j(Y)],\qquad u=\mathbb E|q|^2.$$

On each of peak, flank and upper with $551/100000\le u\le463/10000$, the raw A-content and radial deficit of #509 obey

$$C(q)^2\le(47/200)D(q).$$

This includes every cubic having a coordinate block in which each Wick monomial has exactly one factor, whether holomorphic or antiholomorphic. The number of drivers and their covariance are unrestricted. Terms within a block of three driver factors, or mixtures with two or zero such factors, require additional arguments. Several self-interacting drivers and arbitrary intermediate-kurtosis cubics remain open. The estimate gives the A-only implication of 6.2.3 on the domain of its shell-cost theorem.

## Scalar inputs and the directional content

Set $A_j=P_j+\overline{H_j}$ and $r=\sum X_jA_j$. Then $(q,X)$ and $(r,X)$ have the same law. Their real parts in the first coordinate agree pointwise. The first pair has invariant common phase by rotating $X,Y$ together and the second by rotating $X$ alone. In any joint characteristic function one can therefore rotate the Fourier parameter of the first coordinate to the nonnegative real axis. Bath first-chaos coefficients vanish for both variables by negating $X$, since the A-profile $F_A(z)=zg(|z|^2)$ is odd. It suffices to prove the result for $r$.

Write $B(v)=2\mathbb E|L+\sqrt v W|$ with independent standard proper $W$, and define $J(v)=2\mathbb E[R g(vR)]$ with $R$ mean-one exponential. With $V=\sum_j|A_j|^2$ and $d(v)=B(u)+B'(u)(v-u)-B(v)$, conditioning on $Y$ gives

$$D(q)=\mathbb E d(V),\qquad \mathbb E[\bar X_j F_A(r)]=\tfrac12\mathbb E[A_j J(V)].$$

Indeed conditionally $r$ is proper Gaussian of variance $V$, and conditional regression of $\bar X_j$ on $r$ gives $(A_j/V)\bar r$ when $V>0$. The identities extend to $V=0$ directly. We have $d\ge0$ by strict concavity of $B$ and $\mathbb EV=u$.

Choose a unit complex direction $b$ making the content pairing real and nonnegative. Put $h=\Re(b^* A)$ and $S=V/u$. Then $C=\frac12\mathbb E[h(J(V)-J(u))]$, since $\mathbb E h=0$. Let $K$ be the vector formed by the real and imaginary parts of $A$ and $M=\mathbb E KK^\top$. Its trace is $u$. Put $\rho=\|M\|_{\rm op}$, $\tau=\rho/u$. The real coefficient vector producing $h$ has Euclidean norm one, hence $h^2\le V$ and $\mathbb E h^2\le\rho$.

## Moment bounds for a vector of real second-chaos variables

For any real test direction $b$, $F=b^\top K$ is a real centered Gaussian quadratic of variance $v=b^\top M b$. Real orthogonal diagonalization writes $F=\sum \lambda_j(G_j^2-1)$ in law, giving cumulants $\kappa_k=2^{k-1}(k-1)!\sum\lambda_j^k$. Thus $0\le\kappa_4\le12v^2$, $\kappa_3^2\le(2/3)v\kappa_4$, $\kappa_6\le40v\kappa_4$. The middle inequality is Cauchy–Schwarz for $\sum\lambda_j^3$, the others follow by multiplying the power sums of orders 2 and 4. The moment–cumulant formulas give

$$3v^2\le\mathbb EF^4\le15v^2,\qquad \mathbb EF^6\le(185/3)v\,\mathbb EF^4-170v^3.$$

For the sixth-moment estimate substitute the cumulant bounds in $15v^3+15v\kappa_4+10\kappa_3^2+\kappa_6$, then use $\kappa_4=\mathbb EF^4-3v^2$.

Now take $b$ an independent standard **real** Gaussian vector. Its fourth and sixth moments along $K$ are $3V^2$ and $15V^3$. Direct Gaussian integration gives $\mathbb E_b v^2=u^2+2\operatorname{tr}M^2$ and $\mathbb E_b v^3=u^3+6u\operatorname{tr}M^2+8\operatorname{tr}M^3$. For fixed $K$, $\mathbb E_b[v(b^\top K)^4]=3uV^2+12V K^\top M K$ by Wick pairings. Hence, writing $m_k=\mathbb E S^k$,

$$1+2\tau^2\le m_2\le 15,\qquad m_3\le (37/3)(1+4\tau)m_2-34/3.$$

For the second bound, use $K^\top M K\le\rho V$ and discard the nonnegative trace corrections from $\mathbb E_b v^3$. The fourth bounds use $\rho^2\le\operatorname{tr}M^2\le u^2$.

For a normalization check take $A_1=|Y|^2-1+\bar Y^2$, $A_2=i(|Y|^2-1)$ for one proper complex $Y=(G+iH)/\sqrt2$. Then $K=(G^2-1,-GH,0,(G^2+H^2-2)/2)$ with independent real standard $G,H$. The nonzero entries of $M$ are $M_{11}=2$, $M_{22}=M_{44}=M_{14}=M_{41}=1$. Its trace is four and $\tau=(3+\sqrt5)/8<83/100$. Using the complex covariance $\mathbb EAA^*$ would instead give the normalized eigenvalue $(2+\sqrt2)/4>83/100$. The [checker](../../code/mixed-driver-blocks-codex-a7c4/verify.py) derives these entries from real Gaussian moments.

## Smaller covariance

Suppose $\tau\le83/100$. Set $R_u(y)=uy[J(uy)-J(u)]^2/(4d(uy))$, continuously extended at $y=1$. For $V=0$ set $h^2/V=0$. Cauchy–Schwarz gives

$$C^2\le D\,\mathbb E[(h^2/V)R_u(S)].$$

At $V=u$ the centered numerator vanishes, so the right-hand expectation also bounds the expression there. If $D=0$ the same argument gives $C=0$ since $d(V)=0$ implies $V=u$.

Use one of the [Gaussian-factor scalar envelopes](../received-2026-11-05/gaussian_factor_content/vector_content/proof.md), the one originally indexed by $37/50\le\tau\le3/4$. Its **pointwise** inequalities contain no covariance restriction. For every $y\ge0$ throughout the energy band on each row they are $Q(y)\ge0$, $R_u(y)\le Q(y)+\gamma y$, where

$$Q(y)=c_0+c_1y+c_3(y^3-\tfrac{100}{3}y^2),\qquad
(c_0,c_1,c_3,\gamma)=(57244599935,-1501543759,3157217,213543031787)/10^{12}.$$

Since $h^2/V\le1$ and $\mathbb E h^2/u\le\tau$, the expectation above is at most $\mathbb E Q(S)+\gamma\tau$. The moment bounds give an explicit upper bound, with $t=83/100$:

$$c_0+c_1+\gamma t+c_3\{15[(37/3)(1+4t)-100/3]-34/3\}
=70167789027883/300000000000000<47/200.$$

Here $(37/3)(1+4t)-100/3$ is positive, so the upper bound on $m_2$ has the required sign.

## Larger covariance

Suppose $\tau\ge83/100$. Apply the [small-Wick pointwise envelope](../one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md) at zero self-interaction, scalar amplitude $z=\sqrt V$ and $p=u$. In its notation $H_{0,u}(z)=d(V)$ and $T_0(z)-\lambda(u)z=z[J(V)-J(u)]/2$. Its weight is $w(y)=(3+7y)/10$, so $\mathbb Ew(S)=1$. Weighted Cauchy–Schwarz and $h^2\le V$ give

$$C^2\le\mathbb E\frac{h^2[J(V)-J(u)]^2}{4w(S)}\le(47/200)D+u^2\{-b_4(m_2-2)+(21/200000)(m_3-37m_2+68)\}.$$

This uses the pointwise scalar inequality on its **whole** nonnegative right-hand side. It does not multiply the signed cubic moment correction by $h^2/V$. The three rows have $b_4\ge7/200$. Set $b=(7/200)/(21/200000)=1000/3$. As $m_2\ge1+2(83/100)^2>2$ and $m_3\le(185/3)m_2-34/3$, the correction is nonpositive provided

$$(b+37-185/3)[1+2(83/100)^2]+34/3-68-2b\ge0.$$

The left-hand side is $79607/7500>0$, with $b+37-185/3>0$. This proves the estimate.

## Scalar replay and provenance

The [replay](../../code/mixed-driver-blocks-codex-a7c4/verify.py) checks the compact strip and both tails with exact rationals, and optionally recomputes all 381 saved kernel enclosures at 160 bits using the repository's [Arb kernel verifier](../../code/audit-2026-11-13/r26_kernel_recheck/check_kernels.py). Input tables are the original Gaussian-factor node subsets of the 6.3.4 audit, included here so the replay requires no private files. They enclose the positive, decreasing convex kernels $A_0=-B''$ and $H_0=J'$. The [positive formulas and error bounds](../received-2026-11-05/wick_r26_twenty_percent/wick_research/kernel_proof.md) justify the quadrature.

For $v=uy$, $R_u(y)=uy\bar H^2/(4\bar A)$, where $\bar H=\int_0^1 H_0((1-s)u+sv)\,ds$ and $\bar A=\int_0^1(1-s)A_0((1-s)u+sv)\,ds$. Both decrease with $u,y$. Secants of the upper node bounds majorize $H_0$. At each interior cell the two neighboring secant slopes bound $A_0$ from below by lines through the endpoint lower bounds. Subtracting the maximum gap between their maximum and the endpoint secant gives a linear minorant; on the first cell monotonicity gives the right endpoint lower bound. Integrating these piecewise linear functions gives exact rational bounds for $\bar H,\bar A$, including at $y=1$ by continuity. Each compact box in $[551/100000,463/10000]\times[0,70]$ uses $\bar H$ at the lower left, $\bar A$ at the upper right, and a degree-three Bernstein lower bound for the scalar polynomial. The checker separately certifies $Q\ge0$.

For $y\ge70$, $0<-J(0)<17/10$ and $A_0(u+1/10)>1$. The integral for $d(v)$ on $[u,u+1/10]$ gives $d(v)\ge(v-u-1/10)/10$. Consequently $R_u(y)\le(17/10)^2/[(4/10)(1-(u_{\max}+1/10)/(70u_{\min}))]$. Both cubic polynomials are increasing past 70 and their endpoint comparisons suffice. The tail check evaluates the [exact erfc formula for $J(0)$](../received-2026-11-05/r26_twenty_percent_extension/r26_extension/proof.md) with outward Arb arithmetic.

From the repository root, with `python-flint` installed, run `python3 -IB research/conjecture-K/code/mixed-driver-blocks-codex-a7c4/verify.py --recompute-kernels`. Omitting the flag uses the saved rational intervals. This replays the low-covariance envelope and the new exact moment budgets. The high-covariance case inherits Gate 5; its saved certificate can be replayed with `python3 -IB -O research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py`.
