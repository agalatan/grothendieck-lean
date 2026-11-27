# Peak content under a shared Gaussian perturbation

Agent-ID: codex-a7c4. Refs #743, #509.

Work at the peak visible profile $L=Z(a+b|Z|^2)$ with $a=699/1250$, $b=179/1250$, using the [signed peak content normalization](../strong-content-blocks-codex-a7c4/PROOF.md). Let $p(X)=\sum_j p_j(X_j)$ be a complex Wick cubic of bidegree $(2,1)$ in disjoint remote Gaussian coordinate blocks, $u=E|p|^2$, $\delta_j=E|p_j|^4-2(E|p_j|^2)^2$, $\chi=\sum_j\delta_j/u^2$, and $s=\sum_j\delta_j^{3/2}/u^3$. For $u>0$ suppose the core meets one of the following hypotheses.

| Core family | Condition | Local divisor $n$ |
|---|---|---:|
| Energy shares | $\max_j E|p_j|^2\le u/41$ | 3700 |
| Fourth-excess shares | $28(\sum_j\delta_j^{3/2})^2\le(\sum_j\delta_j)^3$ | 12000 |
| Moderate excess | $0.65\le\chi\le1.4$, $s\le0.21\chi$ | 1150 |
| Higher excess | $1\le\chi\le1.4$, $s\le0.22\chi$ | 900 |

Let $Y$ be a remote standard complex Gaussian block independent of $X$, and let $h(X,Y)$ be a pure $(2,1)$ Wick cubic whose terms all have total $Y$-chaos degree at least two. All its summands may depend on the same $Y$. Set $e=E|h|^2$, and assume $u+e\le0.0463$. Throughout the full energy band,
\[
 e\le u\chi/16000\quad\Longrightarrow\quad C(p+h)^2\le(6/25)D(p+h).
\]
For $u\ge0.008$, the local divisor in the table suffices in place of 16000. For the first two families this local statement also assumes $\chi\ge0.0784$. At $u=0$ use $u\chi=0$ by convention, which forces $p=h=0$. For example, with scalar $Y$, the perturbation $h=\varepsilon[(|Y|^2-1)\sum_j X_j+Y(|Y|^2-2)]$ has both a quadratic coefficient shared across the blocks and a bath-only cubic. For a positive-excess core with $u<0.0463$, a sufficiently small nonzero $\varepsilon$ meets both energy conditions.

## Two perturbation estimates

Use $\Psi(w)=w g_A(|w|^2)$, $\Phi(w)=V(|w|^2)$ and $\beta=6/25$. The contents are first-chaos projection norms. The bidegree assumption gives $E[h\mid X]=0$, so $E[\bar p h]=0$ and the total energy is $u+e$. It also gives conditional orthogonality of $h$ and $\bar h$ to every linear coordinate of $Y$. The real derivative $D\Psi(p)[h]$ is a linear combination of $h$ and $\bar h$ with $X$-dependent coefficients. Its entire first-chaos projection thus vanishes, both on $X$ and on $Y$.

For a unit holomorphic Gaussian linear form $\ell$ in the remote coordinates,
\[
 E[|\ell|\,|h|^2]\le(33\sqrt\pi/32)e.
\]
To check this, rotate the coordinates to make $\ell$ the first one and expand in the normalized complex Hermite basis. For different local bidegrees $(i,j)$ the complementary bidegrees $(2-i,1-j)$ are orthogonal. Weighting by $|\ell|$ therefore gives a weighted sum of the squared coefficient norms. The six possible weight factors divided by $\sqrt\pi$ are $1/2,3/4,3/4,15/16,7/8,33/32$ for $(0,0),(1,0),(0,1),(2,0),(1,1),(2,1)$, respectively. For example the last weight is $E[R^3(R^2-2)^2]/2$ for $R=|\ell|$. The replay integrates the squared Hermite polynomials for all six cases.

The global bilinear Hessian bound for $\Psi$ is $4/(3\sqrt\pi a^2)$. Taylor's formula, the zero projected derivative and the weight bound give
\[
 C(p+h)\le C(p)+\frac{11}{16a^2}e .
\]
For the deficit, concavity of $V$ bounds $V(|p+h|^2)$ by its tangent at $|p|^2$. The linear term in $h$ vanishes conditionally on $X$, and $V'(|p|^2)\le V'(0)$, giving $E\Phi(p+h)\le E\Phi(p)+V'(0)e$. Write $B(v)=E[V(vE_0)]$ with $E_0$ a standard exponential. Since $B'$ is decreasing and $V'(0)-B'(u+e)\le2[-V''(0)](u+e)$, we get
\[
 D(p+h)\ge D(p)-3.346(u+e)e .
\]
The rational replay checks $-V''(0)<1673/1000$ against the directed peak derivative enclosure. [Hessian estimate](../mixed-driver-sign-perturbation-codex-a7c4/PROOF.md) · [Slope bound, §4.1](../multi-driver-self-interaction-gemini-21d5/PROOF.md)

## Paying both estimates from the core deficit

On the four core families, $s\le0.232\chi$ and $\chi\le3/2$ by the [disjoint-block criteria](../strong-content-blocks-codex-a7c4/PROOF.md). The [block projection theorem](../content-509-codex-6d92/BLOCKS.md) gives $C(p)^2\le7.98su^3$. Since $u\le0.0463$, it follows that $C(p)\le0.3u\sqrt\chi$. Use $11/(16a^2)<2.2$, $\sqrt\chi\le1.225$. If $e\le k u\chi$, the increase in $C^2/\beta-D$ is at most $T(k)u^2\chi$ with
\[
 T(k)=k[3.346(1+1.5k)+(2\cdot0.3\cdot2.2\cdot1.225+2.2^2\cdot1.5k)/\beta].
\]
The original radial majorants, together with the first three radial moments, bound $E\Phi(p)+C(p)^2/\beta$. Add $T(k)\chi$ to the coefficient of $u^2$ in this upper bound and subtract from the same Rice lower polynomial for $B(u)$. The price remains convex in $\chi$, so both endpoints suffice. Rational Bernstein coefficients on the closed energy interval bound the resulting gap below. With $k=1/n$ the fourteen local rectangles all have positive margin. For $k=1/16000$ they also have positive margin when the lower energy edge $0.008$ is replaced by $0.00798$ and each lower excess edge $0.0784$ by $0.077$. The verifier checks the claimed tiling in both cases.

It remains to reach the lower edges of the full band. Write $t=e/u$ and let $\chi'$ be the normalized fourth excess of $p+h$. The sharp fourth-moment cap gives $E|h|^4\le44e^2$. In the expansion of $|p+h|^4$ the term linear in $h$ vanishes conditionally on $X$. Hölder's inequality and $u+e\ge u$ therefore yield
\[
 \chi'\le\chi+6\sqrt{44(2+\chi)}t
  +4(2+\chi)^{1/4}44^{3/4}t^{3/2}+44t^2
 \le\chi+77t .
\]
The final comparison uses $\chi\le1.5$ and $t\le1.5/16000$. If $u\le0.00798$ the total energy is at most $0.008$ and $\chi'\le2$, within the [general staircase](../strong-content-blocks-codex-a7c4/PROOF.md). If $\chi\le0.077$, the inequality $t\le\chi/16000$ gives $\chi'\le0.0784$ throughout $u+e\le0.0463$, within the [zero-slack region of Theorem 2](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md). These cases also cover $\chi=0$.

For the raw $A+B$ shells with first-chaos drivers one can use this strong-content estimate directly in [the signed Schur bound](../raw-joint-ab-gemini-4c4c/PROOF.md). At total remote energy $v=u+e$ it gives $\Lambda(p+h+A+B)\le B(v)-p_*v+3241/1186575200$ at peak price $p_*=2500/1891$. The [Gaussian benchmark bound](../gemini-plan-audit-2026-11-17/NOTE.md) pays this fee for $v\le0.03875$ or $v\ge0.04194$ by its quadratic margin, using monotonicity below $v=0.00551$. This consequence uses the total energy after the perturbation. The conclusion at intermediate energies proved here concerns the signed A-content.

## Exact replay

From the repository root run

```sh
python3 -IB research/conjecture-K/code/shared-bath-perturbation-codex-a7c4/verify.py
```

The verifier checks the four global radial majorants directly, all Gaussian occupancy weights, both edge transfers, and both fourteen-rectangle covers using Python standard-library arithmetic and the pinned upstream KRAW routines. The controls delete a cell, supply an invalid majorant index and overcharge the perturbation allowance. All three must be rejected. [Verifier](../../code/shared-bath-perturbation-codex-a7c4/verify.py) · [Input manifest](../../code/shared-bath-perturbation-codex-a7c4/PUBLIC_INPUTS.sha256)
