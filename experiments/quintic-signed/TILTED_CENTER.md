# A tilted test at the central sparse amplitude

For the signed witness $P-.764Q+.0235(I-P-Q)-.02F$, let $t$ be the norm of the first projection of the half-sum of the aligned pair of unimodular responses. Let $\tau$ be the norm of the purely remote cubic component of the half-difference. At $t=.83835$, all dimensions and all other sectors pass the $1/1.4023$ payoff test through $\tau=.137624483$. The untilted radial estimate gave $.04372$. The actual all-pairs Rice bound at this amplitude allows a larger $\tau$.

With notation from [the remote cubic calculation](REMOTE_CUBIC_MULTIPLIER.md), put $s=.095$, $u=.91$, $d=.02$, and take the radial linear functional
\[
L=\mu Z[(\alpha-s)+\beta u(T-2)/4-d(T^2-6T+6)/16].
\]
In the visible cubic tangent square center at $uQ\operatorname{ph}Z$ and in the fifth tangent square center at $F\operatorname{ph}Z$. The first-mode identity is $\alpha t^2=2(\alpha-s)\mu t + \alpha(\mu-t)^2 + 2s\mu t-\alpha\mu^2$. Subtracting twice the signed mean of $L$ against the visible phase gives the net new terms $-2s\mu(\mu-t)+\beta\pi(1-u)^2/32$. The negative tail of the radial polynomial contributes less than $10^{-52}$, since it is positive on $[0,140]$ by concavity. Past 140 the absolute integrand is bounded by $T^3$ using $\mu<1$.

Apply the same radial and tangent quadratic-form calculation to $A=|L|$, $W=2\nu+A$. The rational integration at 512 radius intervals per unit gives these upper prices for the fresh blocks.

| Fresh bidegree | Price |
|---|---:|
| $(0,0)$ | .81114 |
| $(0,1)$ | .63864 |
| $(1,0)$, including the first-mode credit | .95494 |
| $(1,1)$ or $(2,0)$ | .99146 |
| Conjugate pair $(2,1),(1,2)$ | .97560 |

The last row pays $19/40$ of the purely remote cubic energy and both fifth terms. The remaining fifth-only blocks are covered by $W\ge 2\nu>d$. Hence, with $B_d=\nu+\pi(\alpha-\beta/8-3d/64)/4$ and $\delta=\mu-t$,
\[
\operatorname{Re}\langle f,Sg\rangle\le
 B_d+\alpha\delta^2-2s\mu\delta+\beta\pi(1-u)^2/32+
 (\beta-19/40)\tau^2+10^{-52}.
\]
At the stated amplitude the constant term is below $.707195263794$. Exact rational comparisons give the displayed range of $\tau$.

Replay with `python3 -IB -O experiments/quintic-signed/code/tilted_center.py`.

Agent-ID: codex-a7c4
