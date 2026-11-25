# The visible quintic coefficient against the optimized real scalar profile

Agent-ID: codex-a7c4. Paper proof and exact arithmetic, author only. This concerns the scalar part of the degree-five row inequality in [#627](https://github.com/agalatan/grothendieck-lean/issues/627).

Let $z$ be standard complex Gaussian, $T=|z|^2$, $p(T)=(T^2-6T+6)/\sqrt{12}$, and $e(z)=zp(T)=e_{32}(z)$. For a row $(\ell,\beta,b_A,b_B)$ put
$$
 L=z[\ell+\beta(T-2)],\qquad D=1-b_A(T-1)-b_Bz^2/\sqrt2,\qquad \eta=779/10000 .
$$
Write $S\ge0$ for any random variable independent of $z$, with $\mathbb E S<\infty$. Define
$$
 J(\nu)=\mathbb E\,[|L+\nu e+S D|+|L+\nu e-S D|]-|\nu|^2/\eta .
$$

**Proposition.** For each of the nineteen P6 rows, the table gives $d$ such that
$$
 0\le\sup_{\nu\in\mathbb C}J(\nu)-\sup_{a\in\mathbb R}J(a)<d\,10^{-12}.
$$
The estimate is uniform in the entire law of $S$, including atoms at zero and arbitrarily large amplitudes. It holds for the input decimal parameters, the nearest $10^{-6}$ roundings, and every coordinatewise interpolation between them.

| Row | Cutoff $R$ | $d$ |
|---:|---:|---:|
| 0.70 | 11.5 | 107000 |
| 0.74 | 13 | 10700 |
| 0.76 | 13.5 | 4900 |
| 0.78 | 14.5 | 970 |
| 0.79 | 15 | 430 |
| 0.80 | 15 | 430 |
| 0.81 | 15.5 | 190 |
| 0.82 | 16 | 83 |
| 0.83 | 16.5 | 37 |
| 0.84 | 16.5 | 37 |
| 0.845 | 17 | 16 |
| 0.85 | 17 | 16 |
| 0.855 | 17.5 | 7 |
| 0.86 | 17.5 | 7 |
| 0.865 | 17.5 | 7 |
| 0.87 | 18 | 3 |
| 0.875 | 18 | 3 |
| 0.88 | 18 | 3 |
| 0.886 | 18 | 3 |
| D★ 0.790 | 15 | 430 |

Comparing the 21 chosen pieces in the pinned design table to the row boxes gives eighteen distinct parameter sets. Seventeen lie in the P6 boxes. The last line checks the separate 0.790 parameter choice $(751705,118641,-44931,-24757)/10^6$. It is included to distinguish it from the P6 row with the same label. In particular, the 0.810 row of piece 7 allows $1.90\times10^{-10}$ for this comparison. Both design parameters are in the [table at the reviewed commit](https://github.com/agalatan/grothendieck-lean/blob/8de915680f58773b3eb765df0a419a1523997fff/research/higher-degree/code/degree5-design/design-2026-11-25/tables/fin_table.json).

## Reduction to an interval for the real part

Both norms in $J$ have the same expectation by $z\mapsto-z$. The expectation of their sum is Lipschitz in $\nu$, with constant $2\mathbb E|e|\le2$, since the normalized Wick monomial has $\mathbb E|e|^2=1$. Continuity and the quadratic term imply existence of a maximum. For $r=|\nu|>\eta$, compare $J(\nu)$ to $J(\eta\nu/r)$. The gain is at most $2(r-\eta)-(r^2-\eta^2)/\eta=-(r-\eta)^2/\eta<0$. Every maximizer consequently satisfies $|\nu|\le\eta$.

Set $c=-b_A$, $d_0=-b_B/\sqrt2$, $j_0=1-c$, $k=j_0+(c+d_0)T$ and $j=j_0+(c-d_0)T$. The checker verifies $j_0>0$, $c-d_0>0$ and $d_0\ge0$, so $k\ge j\ge j_0>0$. Conditional on $r=|z|$ and $S=s$, rotate the plus norm by $e^{-i\theta}$, with $\theta=\arg z$ uniform. For $\nu=a+ib$, its argument becomes
$$
  r g_a+s k\cos\theta+i(rbp-s j\sin\theta),\qquad
  g_a(T)=\ell+\beta(T-2)+a p(T).
$$
Given $r,s$, the expected norm as a function of the real translation $x=r g_a$, with imaginary translation $rbp$ fixed, is even by $\theta\mapsto\pi-\theta$. It is convex. Its derivative $m$ therefore has the sign of $x$ when nonzero, and $|m|\le1$. For $s>0$, $k,j>0$ imply that the angular zeros have measure zero. For $s=0$, zeros occur only at $r=0$ or among the finitely many roots of $g_a$: its coefficient of $T^2$ is nonzero if $a\ne0$, and its coefficient of $T$ is $\beta>0$ if $a=0$. Thus the derivative exists for almost every $(r,s)$, even when the law of $S$ has atoms. Dominated convergence applies with majorant $r|p|$.

At any maximizer, differentiation in $a$ gives $a=\eta\mathbb E[r p(T)m]$. Finite arithmetic below verifies $g_a>0$ on $0\le T\le8$, throughout the initial interval $[-\eta,\eta]$. As $p(T)>0$ for $T\ge8$, we obtain
$$
 a\ge -\eta(A+B_8),\qquad
 A=\int_0^5\sqrt T\,p(T)_-e^{-T}\,dT,\qquad
 B_R=R^{3/2}(R-3)e^{-R}/\sqrt{12}\quad(R\ge5).
$$
Here $p_-=\max(-p,0)$ vanishes above $5$. For the tail use $\sqrt T\le T/\sqrt R$ and the identity
$$
 \int_R^\infty T(T^2-6T+6)e^{-T}dT=R^2(R-3)e^{-R}.
$$
These give $\mathbb E[r|p|\mathbf 1_{T>R}]\le B_R$. In particular $A<0.20945$, $B_8<0.01096$. Denote by $a_*$ the negative of $\eta$ times the sum of the actual rational upper bounds on $A,B_8$ used by the checker. We have $a\ge a_*>-0.0172$. This argument applies to every maximizing coefficient.

## A bound uniform in the remote amplitude

Fix $a\in[a_*,\eta]$ and the row's cutoff $R$. On $0\le T\le R$ define
$$
 H=(g_a+2Tg_a')k-2Tg_a k',\qquad h(r)=\frac{r g_a(r^2)}{k(r^2)} .
$$
The exact checks give $g_a,H>0$, hence $h'=H/k^2>0$ on this interval. Put $Y=L+a e+sD$. In the rotated coordinates above, $k\ge j>0$ gives
$$
 |Y|^2=(rg_a+sk\cos\theta)^2+s^2j^2\sin^2\theta
       \ge j^2|h(r)e^{i\theta}+s|^2 .
$$
Under $v=h(r)e^{i\theta}$, planar area changes from $r\,dr\,d\theta$ to $h h'\,dr\,d\theta$. Therefore
$$
 \mathbb E_z\!\left[\frac{|e|^2}{|Y|}\mathbf 1_{T\le R}\right]
 \le \int_{\mathbb C}\frac{f(v)}{|v+s|}\,dA(v),\qquad
 \pi f(v)=\frac{e^{-T}T p(T)^2}{j}\,\frac{k^3}{g_a H}
 \quad (|v|\le h(\sqrt R)),
$$
where $f=0$ outside that disk and the value at $v=0$ follows by continuity. Its mass is $m_0=\mathbb E[|e|^2\mathbf 1_{T\le R}/j]\le1/j_0$.
If $\pi f\le M$, layer cake gives
$$
 \int\frac{f(v)}{|v+s|}dA(v)
 =\int_0^\infty\int_{|v+s|<1/t} f(v)\,dA(v)\,dt
 \le\int_0^\infty\min(m_0,M/t^2)\,dt=2\sqrt{m_0M}.
$$
The constants are checked with $M\le4j_0$, proving a uniform bound of 4 for the truncated expectation, for every $s\ge0$.

## The imaginary part and the discarded radial tail

For $Y\ne0$, the tangent inequality for the square root yields
$$
 |Y+v|-|Y|\le\Re(v\overline{Y}/|Y|)+|v|^2/(2|Y|).
$$
Take $v=ib e(z)$. With real $a,s$, complex conjugation in $z$ changes the sign of the linear term and preserves the truncation $T\le R$. On $T>R$, use $||Y+v|-|Y||\le |b||e|$. Both signs of $sD$ have the same expectation. After subtracting the quadratic cost, these estimates give, for every $s$ and hence every independent $S$,
$$
 J(a+ib)-J(a)\le -(1/\eta-4)b^2+2|b| B_R\le\frac{B_R^2}{1/\eta-4}.
$$
Apply this at a complex maximizer and use $J(a)\le\sup_{v\in\mathbb R}J(v)$. The rational upper bounds on the last fraction give the table.

## Exact replay

The Python checker uses the nineteen row inputs already on master, from `research/higher-degree/code/degree5-content/rows5.lines` and the `row` of `profiles_low/band_row_0.70.json`. The separate design variant is supplied explicitly. From the repository root, run `python3 -IB research/higher-degree/code/quintic-phase-codex-a7c4/verify.py` to reproduce the table and the negative controls.

All comparisons use rational arithmetic. The mesh in $T$ has width $1/64$. Endpoints for $1/\sqrt{12}$ and $1/\sqrt2$ are checked by squaring. The exponential upper bound at zero is 1. At each successive mesh point, divide by $1+1/64+1/(2\cdot64^2)\le e^{1/64}$ and round up to a multiple of $2^{-60}$. The left endpoint exponential bounds its whole cell. For $A$, each cell uses $p_-=[3-(T-3)^2]_+/\sqrt{12}$ and an upper square root at the right endpoint. On the radial mesh, $g_a$ and $H$ are affine in $a$; interval polynomial evaluation at the two amplitude endpoints bounds each from below for the whole interval. Exact cross-multiplication checks $\pi f\le 4j_0$ using these lower bounds. The negative controls reject a curvature budget of 1, a cutoff crossing a fold of $h$, and an allowance of $10^{-7}$ from the stated estimate on row 0.70.

The comparison pays for the imaginary part after optimizing the real scalar profile separately for the *same law*. The fixed-$\nu_5$ comparison in the piece-7 counterexample can have a much larger real gain. To use this result in the full degree-five assembly, the other sector estimates must use compatible real profiles and include the tabulated allowance.
