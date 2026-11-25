# An elliptic quadratic lift for the degree-five game

Agent-ID: codex-a7c4. The elliptic lift was proposed by Claude in [#658, §3](https://github.com/agalatan/grothendieck-lean/blob/4ed8f37b63878f65fc88bc3d6bf9c404a2a662ca/research/higher-degree/sources/degree5-midt-2026-11-25/NOTE.md). We prove its scalar hypothesis with coefficient $c=431/500$, justify the passage from auxiliary Gaussians to genuine finite-dimensional quadratic chaos, and give the resulting sector-free cutoffs.

## 1. A scalar Gaussian inequality

Put $a=179/200$, $b=\sqrt{1-a^2}$, and let $X,Y$ be independent real Gaussians of variances $a^2,b^2$ and means zero. Write $M=X+iY$. For every real $\lambda$,
$$
 F(\lambda)=\mathbb E|M+i\lambda|\ \ge\ \sqrt{\lambda^2+c^2},\qquad c=431/500. \tag{1}
$$
Symmetry reduces the proof to $\lambda\ge0$. For $\lambda\ge3$, convexity in $Y$ and the inequalities $1+x/2-x^2/8\le\sqrt{1+x}\le1+x/2$ for $x\ge0$ give
$$
 F(\lambda)\ge\mathbb E\sqrt{\lambda^2+X^2}
 \ge\lambda+\frac{a^2}{2\lambda}-\frac{3a^4}{8\lambda^3}
 \ge\lambda+\frac{c^2}{2\lambda}\ge\sqrt{\lambda^2+c^2}.
$$
The lower Taylor inequality follows from the positive third derivative of the square root. The penultimate step uses the rational comparison $36(a^2-c^2)>3a^4$.

Here is a finite rational certificate on $[0,3]$. Put $m=96$. In the first quadrant take the unit vectors
$$
 v_j=\frac{(1-u_j^2,2u_j)}{1+u_j^2},\quad u_j=j/m,\quad 0\le j\le m.
$$
Reflect the arc vertices in both coordinate axes to make a centrally symmetric convex polygon $P$ inside the unit disk. For every real vector $w$, the sum of $|e\cdot w|$ over its directed edges $e$ equals $4\max_{v\in P}v\cdot w$. Indeed the scalar projection along the boundary goes from its minimum to its maximum on one chain and back on the other. Its total variation is twice the projection width, which is twice the maximum by central symmetry. Hence $\|w\|_2\ge\frac14\sum_e|e\cdot w|$. Write the $j$th first-quadrant edge as $(-d_x,d_y)$, with $d_x,d_y\ge0$. Applied to $w=(X,Y+\lambda)$, symmetry of $X$ and global sign inside the absolute value show that the four reflected copies have the same expected absolute projection. Thus
$$
 F(\lambda)\ \ge\ \sum_{j=1}^m\mathbb E|\lambda d_y+s_j G|,
 \qquad s_j=\sqrt{a^2d_x^2+b^2d_y^2},\quad G\sim N(0,1).
$$
There is no independence requirement among these one-dimensional projections. For $r\ge0$, test the modulus against $\operatorname{sgn}(G+r)$. For all $\lambda\ge0$ this gives the affine minorant
$$
 \mathbb E|\lambda d_y+s_jG|\ge
 d_y\lambda A(r)+s_jB(r),\qquad
 A(r)=\sqrt{2/\pi}\int_0^r e^{-t^2/2}dt,\quad
 B(r)=\sqrt{2/\pi}e^{-r^2/2}.
$$
Indeed $A=\mathbb E\operatorname{sgn}(G+r)$ and $B=\mathbb E[G\operatorname{sgn}(G+r)]$, by integration of the normal density. A different $r$ may be chosen for each edge and shift interval. Every choice is valid.

Divide the shift interval into 600 cells $[j/200,(j+1)/200]$. For each cell and edge choose $r$ from $\{0,1/128,\ldots,4\}$ near the midpoint value $\lambda d_y/s_j$. The certificate rounds all $d_y,s_j,A(r),B(r)$ down to multiples of $10^{-10}$. It computes the square-root lower bounds by integer square root. For the normal integrals it uses the Taylor polynomial of odd degree 51 for $e^{-x}$, a lower bound at every $x\ge0$, and integrates it termwise for $A$. The computed lower polynomials are nonnegative at the table entries. Machin's identity and alternating arctangent sums bound $\pi$ from above. Thus the sum of the rational affine minorants stays below $F$ throughout that cell. The program verifies that at each of the 1200 cell endpoints this line is nonnegative and that its square exceeds $\lambda^2+c^2$ by more than $10^{-5}$. Because $\lambda\mapsto\sqrt{\lambda^2+c^2}$ is convex, the same affine line dominates it between the endpoints. This proves (1).

## 2. From translation to a field in cubic chaos

For $\lambda\ge0$ put $\kappa(\lambda)=F'(\lambda)=\mathbb E[(Y+\lambda)/|M+i\lambda|]$ and $d(\lambda)=F(\lambda)-\lambda\kappa(\lambda)$. The derivative follows by dominated convergence since the modulus is 1-Lipschitz and $X\ne0$ almost surely. For each $X\ne0$, the integrand defining $\kappa$ is strictly increasing, so $\kappa$ increases continuously from 0 to 1 (as a limit). By (1) and two-dimensional Cauchy–Schwarz,
$$
 d(\lambda)\ge \sqrt{c^2+\lambda^2}-\lambda\kappa(\lambda)
 \ge c\sqrt{1-\kappa(\lambda)^2}. \tag{2}
$$

On the original Gaussian space let $f,g$ be any unimodular pair and put $h=(f+g)/2$, $k=(f-g)/2$. Thus $|h|^2+|k|^2=1$ and $\operatorname{Re}(\bar h k)=0$ pointwise. We construct an independent-randomized unit value $B$ on an enlarged probability space with
$$
 \mathbb E[B\mid z]=k,\qquad \mathbb E[\bar M B\mid z]=ch. \tag{3}
$$
When $h=0$, take $B=k$. Otherwise choose the unique $\lambda\ge0$ with $\kappa(\lambda)=|k|$, and choose $\epsilon\in\{-1,1\}$ so $k=i\epsilon |k|\operatorname{ph}(h)$, choosing either sign at zero. The inverse of $\kappa$ is measurable. Set $B_1=\operatorname{ph}(h)\operatorname{ph}(M+i\epsilon\lambda)$. By the $X$ and $Y$ symmetries,
$\mathbb E[B_1\mid z]=k$ and $\mathbb E[\bar M B_1\mid z]=d(\lambda)\operatorname{ph}(h)$. In the second identity the real part is $F(\lambda)-\lambda\kappa(\lambda)$ and the imaginary part integrates to zero by $X\mapsto-X$. With probability $c|h|/d(\lambda)$ take $B=B_1$; otherwise choose $f$ or $-g$ with equal probabilities independently of $M$. The mixing probability is in $[0,1]$ by (2), and $d(\lambda)>0$ for finite $\lambda$. The independent coin has mean $k$ and zero pairing with $M$. This proves (3). No chaos membership is needed of $B$.

Let $\rho$ be a dimension-free bound $\mathbb E|q|\le\rho\|q\|_2$ on the complex Wick chaos $H_{2,1}$. Choose a normalized visible linear form $\zeta$ with $P_{1,0}h=t\zeta$, where $t=\|P_{1,0}h\|_2$. If $t=0$, any unit form will do. Let $U=P_{2,1}k$. For $\ell\ge0$, (3) gives
$$
 \ell ct+\|U\|_2^2
 =\operatorname{Re}\mathbb E[\overline{\ell\zeta M+U}\,B]
 \le\mathbb E|\ell\zeta M+U|
 \le\rho\sqrt{\ell^2+\|U\|_2^2}. \tag{4}
$$
For the last inequality, on fresh independent coordinates take
$$
 Y_N=(2N)^{-1/2}\sum_{j=1}^N(|Z_j|^2-|Z'_j|^2)
$$
and an independent copy $Y'_N$. Each is a real, centered, unit-variance element of $H_{1,1}$, independent of the original variables. Then $M_N=aY_N+ibY'_N$ has unit second moment and converges in distribution to $M$ by the ordinary central limit theorem. The fields $\ell\zeta M_N+U$ belong exactly to $H_{2,1}$, with squared norm $\ell^2+\|U\|_2^2$ by independence and centering. This remains true when $U$ depends on $\zeta$. The fields converge in distribution to $\ell\zeta M+U$ by independence of the fresh variables. Their common second moment yields uniform integrability of their absolute values. Applying the radius before taking the limit proves (4). In particular no finite-dimensional approximant to $B$, $\kappa$ or its inverse is needed. Taking $\ell=ct$ in (4) and dividing by the positive square root, with the zero case immediate, proves
$$
 c^2t^2+\|P_{2,1}k\|_2^2\le\rho^2. \tag{5}
$$

## 3. Sector-free game intervals

Set $e=39/50$, $\eta=779/10000$, $A=\|P_{2,1}k\|_2^2$ and $K=\|k\|_2^2$. The payoff is $V=\operatorname{Re}\langle f,(P_{1,0}-eP_{2,1}+\eta P_{3,2})g\rangle$. Expanding in $h,k$, dropping the three nonpositive square terms, and using $\|P_{3,2}h\|_2^2\le 1-K-t^2$ gives
$$
 V\le(1-\eta)t^2+\eta+eA-\eta K.
$$
First use $K\ge A$ and then (5). This gives $V\le \eta+(e-\eta)\rho^2+[1-\eta-(e-\eta)c^2]t^2$.

Alternatively use the repository's mass estimate $\widehat e A-mK\le S$, where
$$
 \widehat e=25/31,\qquad m=2141/3906,\qquad
 S=3798855002922010337121170986221578569/22939068096000000000000000000000000000.
$$
Specifically, $\phi_m(r)\ge2\widehat e\,r s-ms^2$ for $s\in[0,1]$. With $r=|U|$, $s=|k|$, orthogonal projection implies $\mathbb E|U||k|\ge A$. Applying the law bound $\mathbb E\phi_m(|U|)-\widehat e A\le S$ gives the stated mass estimate. The definitions are in [MassNodes.lean](../../../../Grothe/Lower/MassNodes.lean) and the law bound is theorem [integral_phiMass_QkOf_le](../../../../Grothe/LowerAnalytic/MassRowFrame.lean). With $K\ge(\widehat e A-S)/m$ and $k_B=e-\eta\widehat e/m>0$ this gives
$$
 V\le\eta(1+S/m)+k_B\rho^2+[1-\eta-k_Bc^2]t^2.
$$
All displayed quadratic coefficients are positive. The following upper endpoints give strict $V<500/701$ for every $t$ from zero to that endpoint.

| Cubic radius input | Parseval alone | With the mass estimate |
|---|---:|---:|
| $2287/2500$ (independently reviewed) | 0.34554022 | **0.35859076** |
| $4571/5000$ (stronger, paper proof author-checked) | 0.34831349 | **0.36096350** |

The exact arithmetic checks both strict inequalities on each row and verifies that at the next multiple of $10^{-8}$ the corresponding *upper bound* exceeds the target. These are cutoffs for the estimates; $V$ itself may stay below the target further. The degree-five game at higher visible mass and the proposed Grothendieck lower bound still require additional arguments.

The [polygon checker](../../code/cubic-carrier-ellipse-codex-a7c4/verify_polygon.py) verifies (1). The [cutoff checker](../../code/cubic-carrier-ellipse-codex-a7c4/verify_elliptic_cutoffs.py) reads no data and compares both sides of each eight-decimal crossing using fractions.

Two further bounds locate the remaining gains. At radius $2287/2500$, a [sixth-moment bound on the projection residual](CLIPPING.md) gives $t\le0.35386150$ without the mass inequality. For the [entire Gaussian elliptic family](GAUSSIAN_CEILING.md), the optimal coefficient is at least $0.862$ and strictly below $0.8626$.
