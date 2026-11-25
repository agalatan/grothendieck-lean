# A ceiling for the whole Gaussian elliptic-lift family

Agent-ID: codex-a7c4. In the elliptic lift of [#658, §3](https://github.com/agalatan/grothendieck-lean/blob/4ed8f37b63878f65fc88bc3d6bf9c404a2a662ca/research/higher-degree/sources/degree5-midt-2026-11-25/NOTE.md), let $M=\sqrt p\,U+i\sqrt{1-p}\,V$ for independent real standard normal $U,V$ and $0\le p\le1$. Define $F_p(\lambda)=\mathbb E|M+i\lambda|$. Then
$$
 \sup_{0\le p\le1}c_0(p)<\frac{4313}{5000}=0.8626.
$$
Together with the lower bound $431/500=0.862$ at $p=(179/200)^2$, this confines the optimum over all axis ratios to an interval of length $0.0006$. It is a limitation of the Gaussian elliptic lift, and leaves more general choices of auxiliary laws open.

## Why two translations suffice

The coefficient of an elliptic lift cannot exceed
$$
 \inf_{\lambda\ge0}\sqrt{F_p(\lambda)^2-\lambda^2}. \tag{1}
$$
Here is an argument that also verifies the equivalence with the ratio in §3 of the proposal. Put $\kappa(s)=F_p'(s)$ and $d(s)=F_p(s)-s\kappa(s)$. Convexity gives $F_p(\lambda)\ge d(s)+\lambda\kappa(s)$ for every $s,\lambda\ge0$. The range of $\kappa(s)$ contains $[0,1)$: at $p>0$ the derivatives of the pointwise norm are bounded by one and strictly increasing almost surely, while at $p=0$ we have $\kappa(s)=2\Phi(s)-1$. The values start at zero and tend to one. If $c_0(p)=\inf_s d(s)/\sqrt{1-\kappa(s)^2}$, then
$$
 F_p(\lambda)\ge\sup_{0\le x<1}\{c_0(p)\sqrt{1-x^2}+\lambda x\}
 =\sqrt{c_0(p)^2+\lambda^2}.
$$
The converse follows from $d(s)=F_p(s)-s\kappa(s)$ and Cauchy–Schwarz applied to $(c,\lambda)$ and $(\sqrt{1-x^2},x)$. Equivalently, (1) gives $c_0(p)$ itself; the upper bound alone suffices here.

We use $\lambda=14/25$ for $0\le p\le814/1000$ and $\lambda=0$ for $814/1000\le p\le1$. For the stated choice on each interval the exact calculation proves
$$
 F_p(\lambda)^2-\lambda^2\ \le\ (4313/5000)^2-10^{-5}. \tag{2}
$$
The slack in (2) is uniform in $p$, giving a strict upper bound also for the supremum.

## A rational upper bound for the expected length

Take $N=64$ edges per quadrant, beginning with the positive horizontal axis. More precisely, use the $N+1$ unit vectors
$$
 v_j=((1-t_j^2)/(1+t_j^2),2t_j/(1+t_j^2)),\qquad t_j=j/N,\quad 0\le j\le N,
$$
and reflect them into the other quadrants. For their convex hull with support function $h(w)=\max_v v\cdot w$, the total variation of projection along the polygon boundary gives $h(w)=\frac14\sum_e|e\cdot w|$, with the sum over all directed edges. Indeed the projected boundary goes monotonically from the minimum to the maximum along one chain, and back along the other, and the extremal values are opposite by symmetry. For every $w$ there is a vertex making angle at most $\arctan(1/N)$ with it: the first-quadrant vertex angles are $2\arctan(j/N)$, whose consecutive gaps decrease. Therefore
$$
 \|w\|_2\le\sqrt{1+N^{-2}}\,h(w).
$$
Write a first-quadrant edge as $(-d_x,d_y)$, with positive components $d_x,d_y$. After averaging at $w=(\sqrt p\,U,\sqrt{1-p}\,V+\lambda)$, the four copies of each edge contribute equally by symmetry. Thus
$$
 F_p(\lambda)\le\sqrt{1+N^{-2}}\sum_{j=1}^N\mathbb E|m_j+s_jG|,\quad
 m_j=\lambda d_y,\quad s_j^2=p d_x^2+(1-p)d_y^2,\quad G\sim N(0,1).
$$

On each variance cell $i/1000\le p\le(i+1)/1000$ take the upper endpoint for $s_j^2$ by testing the sign of $d_x^2-d_y^2$. Both $s_j$ and $d_y$ are subsequently rounded upwards in multiples of $10^{-10}$. This is a valid upper enclosure. For $m,s\ge0$ the folded normal mean $\mathbb E|m+sG|$ increases in $m$ (symmetry and convexity) and in $s$ (Gaussian variance addition and conditional Jensen). All $s_j$ used in the computation are positive.

For the rounded pair let $r=m/s$ and $\Psi(r)=\mathbb E|G+r|$. Write
$$
 A(q)=\sqrt{2/\pi}\int_0^q e^{-x^2/2}\,dx,\qquad
 B(q)=\sqrt{2/\pi}e^{-q^2/2}.
$$
Then $\Psi(q)=q A(q)+B(q)$, $\Psi'(q)=A(q)$ and $0\le\Psi''(q)=B(q)\le1$. For a grid representative $q=j/128$ with $|r-q|\le1/(2\cdot128)$, Taylor's inequality gives
$$
 \mathbb E|m+sG|\le m A(q)+s B(q)+\frac{s}{8\cdot128^2}.
$$
The script verifies each nearest-grid comparison. It encloses $A(q),B(q)$ from above using the even Taylor polynomial of degree 18 of $e^{-x}$ at the nonnegative arguments $x=q^2/2$, integrating it termwise for $A$. The factor $\sqrt{2/\pi}$ is rounded up using Machin's arctangent identity and alternating-series bounds. All finite comparisons use integer arithmetic and exact fractions. After squaring the polygon upper bound, the least lower bound among the 1000 resulting differences $(4313/5000)^2+\lambda^2-F_p(\lambda)^2$ is
$$
 \frac{69541454237910612838466212866020537160484985823}
 {419430400000000000000000000000000000000000000000000}>10^{-5}.
$$
It occurs for the enclosure $p\in[0.813,0.814]$. This proves (2). The maximizing variance for the true elliptic coefficient is not determined by this cellwise estimate.

[Exact replay](../../code/cubic-carrier-ellipse-codex-a7c4/verify_elliptic_ceiling.py).

With the reviewed radius $2287/2500$, even replacing the coefficient by $4313/5000$ leaves the mass-row payoff majorant strictly above $500/701$ at $t=0.36$. Optimizing the Gaussian axis ratio alone therefore cannot certify that point with this majorant. [Exact payoff comparison](../../code/cubic-carrier-ellipse-codex-a7c4/verify_elliptic_cutoffs.py).
