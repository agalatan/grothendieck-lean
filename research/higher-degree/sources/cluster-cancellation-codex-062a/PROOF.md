# When three-cluster content vanishes

In the [P5 model](../degree5-attack-2026-11-25/problems/P5-three-cluster-scale-law.md), fix a cluster size $c\ge2$ and energy $u>0$. Set the radial-driver coefficient $a=0$ and write $s=s_R$. For a nonzero complex direction $p=(p_1,p_2,p_3)$ take $m=d p$ with $d^2=(1-s)/(c\sum |p_j|^2)$ and $d>0$ for $s<1$.

**Classification (P, author only).** The following are equivalent.

1. For every $s\in[0,1)$, every allowed bulk law and every real bounded continuous profile, $c_X=0$.
2. At two distinct weights $s\in[0,1)$, each with any one allowed bulk law, $c_X=0$ for every real bounded continuous profile.
3. Up to permutation and a common nonzero complex multiple, $p=(1,-1,0)$ or $p=(1,\omega,\omega^2)$, where $\omega=e^{2\pi i/3}$.

In these two families the P5 inequality $|c_X|^2\le\theta\delta\widehat\Omega$ holds for all eleven rows, at every energy and every nonnegative allowance. This includes mixed cofactor and bulk terms and uses the [positivity of the two factors](../admissible-four-atom-codex-a7c4/PROOF.md). The endpoint $s=1$ is already the pure-bulk case. A generic direction still requires the profile and the allowance.

## Permuting the clusters

Let $T=\sigma\sqrt G\,e^{i\phi}$ and $Y=\sqrt R A+T$. Circular symmetry of $T$ conditional on the other radii gives
\[
 c_X=\sqrt u\,\mathbb E[\sqrt R\,Y h(u|Y|^2)].
\]
Indeed, rotating into the phase of $A$ gives the cosine term of P5, while its sine term integrates to zero. If $A=0$ the conditional average is zero. The cluster radii are exchangeable and $\sigma^2=s S_1S_2S_3/c^3$ is permutation invariant. For the opposite pair the transposition changes $A$ into $-A$. For the equilateral triple a cycle changes it into $\omega A$. Rotating $T$ by the same phase preserves the conditional law. In either case $c_X$ equals a nontrivial unit multiple of itself and vanishes. This proves $3\Rightarrow1\Rightarrow2$.

The same coupling gives a bound off these directions, including $a\ne0$. Suppose $F(z)=z h(|z|^2)$ is $L$-Lipschitz. For any permutation $\pi$ and unit complex $\eta\ne1$,
\[
 |c_X|^2\le uL^2\left(a^2+
 \frac{c\sum_j|m_j-\eta m_{\pi(j)}|^2}{|1-\eta|^2}\right).
\]
Couple $\sqrt u Y$ with $\sqrt u(\eta\sqrt R A_\pi+T)$ on the same radii and bulk, using $A_\pi=a(R-2)/\sqrt2+\sum m_{\pi(j)}(S_j-c)$. Their weighted expectations under $F$, with weight $\sqrt R$, are $c_X$ and $\eta c_X$. The Lipschitz difference is at most $\sqrt u L\,\mathbb E[R|A-\eta A_\pi|]$. Apply Cauchy–Schwarz for the probability measure $R\,d\mathbb P$. Its squared norm of the difference is $|1-\eta|^2 a^2+c\sum|m_j-\eta m_{\pi(j)}|^2$, since $\mathbb ER=1$, $\mathbb E[R(R-2)^2]/2=1$ and the centered cluster radii are independent. This bounds the numerator. A bound for the ratio away from exact cancellation would also need control of $\delta\widehat\Omega$.

## Why two weights suffice

Assuming item 2, take the bounded profiles $h_M(v)=\min(v,M)$ and pass to $h(v)=v$ by dominated convergence. The dominating variable is $u^{3/2}\sqrt R|Y|^3$, which is integrable by the exponential and gamma moments and boundedness of $G$ for fixed $c$. For $A=\sum m_j(S_j-c)$, uniform phase integration gives
\[
 u^{-3/2}c_X[v]=\mathbb E[R^2 A|A|^2+2R A\sigma^2]
 =4c\sum_j m_j|m_j|^2+2s\sum_j m_j .
\]
Here $\mathbb E R^2=2$, $\mathbb E(S_j-c)^3=2c$, and tilting the cluster law by $S_1 S_2 S_3/c^3$ changes each mean from $c$ to $c+1$. Only $\mathbb E G=1$ enters. Substituting $m=dp$ and dividing by $2d$ gives the affine function
\[
 2(1-s)\frac{\sum p_j|p_j|^2}{\sum |p_j|^2} + s\sum p_j .
\]
Two distinct zeros force $\sum p_j=\sum p_j|p_j|^2=0$. For collinear coefficients, rotate them to real values $x_j$. On $\sum x_j=0$, the sum of their cubes is $3x_1x_2x_3$. One vanishes and the other two are opposites. Otherwise the real-linear map $t\mapsto\sum t_j p_j$ from $\mathbb R^3$ to $\mathbb C$ has rank two. Both $(1,1,1)$ and $(|p_1|^2,|p_2|^2,|p_3|^2)$ belong to its one-dimensional kernel. The three lengths therefore agree. Three unit complex numbers summing to zero have pairwise real inner product $-1/2$ and form the claimed equilateral triple.

**Scope of the test.** The direction $(1,1,-2)$ has sum zero but gives nonzero linear-profile content for every $s<1$. Conversely $(1,1,-3/2)$ has zero linear-profile content at $s=22/39$ and nonzero content at $s=0$. The latter example explains the two weights in the moment test. It makes no claim about all profiles at the exceptional weight.

The [symbolic replay](../../code/cluster-cancellation-codex-062a/verify.py) expands the conditional phase average and integrates it against independent gamma moments. It checks both rotations, the driver norm, and the two negative controls (**C, author only**). From the repository root run

```sh
uv run --with sympy python -IB research/higher-degree/code/cluster-cancellation-codex-062a/verify.py
```

Agent-ID: codex-062a
