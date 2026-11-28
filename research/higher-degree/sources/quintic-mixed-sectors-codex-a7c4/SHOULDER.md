# One step weight for all visible amplitudes at unpriced remote energy 0.003113

Author: codex-a7c4. For the degree-five game $P_{1,0}-eP_{2,1}+\eta P_{3,2}$, $e=39/50$, $\eta=779/10000$, consider the real payoff of a unimodular pair and choose the visible coordinate so $P_{1,0}h=tZ$ for $h=(f+g)/2$. Write $x_{00}$ for the squared norm of the **unpriced** remote-only projection of $P_{2,1}k$, $k=(f-g)/2$. Then $x_{00}\le3113/10^6$ implies $V<10000/14025$ throughout $0\le t\le\sqrt\pi/2$. All five other cubic sectors and their shared coordinates are unrestricted. This uses the conditional weighted inequalities of the [Gram proof](GRAM.md) through $t=0.884397$, and the existing arbitrary-energy [free tangent](../quintic-node-pilot-codex-a7c4/FREE_TANGENT.md) from that endpoint to $\sqrt\pi/2$.

## The row and its integration

Put $r=|Z|$ and $T=r^2$. Divide $[0,8]$ into 2048 bins of width $1/256$. For the midpoint $s$ of each bin, set
$$D=10^{-6}\left\lceil10^6\max\{\eta,0.4808s+0.1449s^3+0.00445s^5\}\right\rceil.$$
Use $D=20$ on $r\ge8$. These values define the weight itself. In the companion residual estimate, $D-\eta\ge0$ can multiply the conditional unit-ball inequality at cost $\mathbb E(D-\eta)$. Consequently the constant in the payoff is $\mathbb E D$ and the Gram integrals are taken with density $1/D$ relative to $T\sim\mathrm{Exp}(1)$.

For each integer $0\le k\le6$ the upper-tail integral of $T^k$ beginning at $T=r^2$ is $e^{-r^2}P_k(r)$, with $P_0=1$ and $P_k=kP_{k-1}+r^{2k}$. This follows by integration by parts. Subtract two such tails to bound a finite bin's mass and use one tail for the last infinite bin. The checker starts with $e^0=1$. For each adjacent pair of endpoints $l,u$ it brackets $e^{-(u^2-l^2)}$ by the degree-eleven and degree-twelve Taylor sums with alternating terms, since $0<u^2-l^2<1$. Products are rounded outward at scale $10^{42}$. Directed division by the exact positive cell value of $D$ and rounding at $10^{17}$ enclose all seven moments $\mathbb E[T^k/D]$. Using $k=0$ and multiplying by $D$ instead gives the upper estimate of $\mathbb E D$. This includes the whole infinite tail.

## Prices and the upper endpoint

The positive rank-one denominator verified below makes the inverse legitimate even on bins where $D=\eta$: the dimensionless rank-one factor has norm $\eta\langle e_{3,2},D^{-1}e_{3,2}\rangle<1$.

The adjacent first- and fifth-chaos trial fields and the visible quintic rank-one correction are those of the companion proof. The raw Laguerre conventions are shared with `sector_gram.py`. The table of trial coefficients is fixed in `step_shoulder.py`. For clarity, if $G(a,b)=\mathbb E[\bar a b/D]$ and $f=e_{1,0}-s e_{2,1}$, the visible average costs at least $h_*t^2$ with
$$h_*^{-1}=G(f,f)+\frac{|G(f,e_{3,2})|^2}{1/\eta-G(e_{3,2},e_{3,2})}+s^2/e.$$
The checker uses the unnormalized cubic and quintic with raw squared norms $2,3$, verifies the denominator is positive, and upper bounds each Gram expression by directed summation, including coefficients of either sign. All other prices follow by positive weighted Cauchy–Schwarz. In millionths the upper ceiling of $\mathbb E D$ is $634180$. The respective lower floors of $h_*,p_{00},p_{10},p_{01},p_{11},p_{20},p_{21}$ are $900874,362073,780243,780243,823910,1244412,1184298$. Thus each nonremote price exceeds $e$ and the exact rational prices give
$$V\le\mathbb E D+(1-h_*)t^2+(e-p_{00})x_{00}.$$
Both coefficients are positive. At $t=0.884397$ the threshold for $x_{00}$ in this inequality is strictly between $0.003113$ and $0.003114$, using the exact prices before rounding to millionths. At $x_{00}=0.0031$ the margin exceeds $5592/10^9$. The same row at $0.005$ exceeds the target, providing a negative control for the scalar comparison.

Replay with `python3 -IB -O step_shoulder.py` from the code directory containing `step_shoulder.py` and `sector_gram.py`.
