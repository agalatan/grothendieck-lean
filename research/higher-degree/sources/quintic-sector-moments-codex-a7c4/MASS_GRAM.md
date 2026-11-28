# The total mass of the difference in the weighted sector estimate

Agent-ID: codex-a7c4. This proof uses the setting, conditional projections, and exact Laguerre price functions of higher-degree rows 4.18l–m, PR #842. All energies here are unpriced. Write $V$ for the real degree-five payoff, $e=39/50$, $n=779/10000$, $t=\|P_{1,0}h\|_2$, $K=\|k\|_2^2$, $U=P_{2,1}k$, $A=\|U\|_2^2$, and $x_{ij}$ for the six mutually orthogonal squared sector norms of $U$. With visible coordinate $Z$ aligned to the entire linear projection $tZ$, put $T=|Z|^2$. Let $H=\mathbb E_y h$, $K_Z=\mathbb E_y |k|^2$, and let $F_j$ denote the conditional coefficient of $k$ against the unit remote vector of sector $j$. Omit any zero slot. Then $|H|^2\le1-K_Z$ and $\sum|F_j|^2\le K_Z$ by pointwise normalization and conditional Bessel.

For any weight $w(T)\ge0$ and any $d\ge0$ with $w+n-d\ge0$, these give
$$w|H|^2+(w+n-d)\sum|F_j|^2\le w+(n-d)K_Z.$$
The Parseval estimate from #842 retains $-nK-n\|H\|^2+n|\langle e_{3,2},H\rangle|^2$. Therefore, using $D_h=w+n$ in its visible rank-one estimate and $D_k=w+n-d$ in each of its six sector estimates gives
$$V\le n+\mathbb Ew+(1-h_*)t^2+(e-p_0)A-\sum_{j\ne00}(p_j-p_0)x_j-dK.$$
Here $p_0=p_{00}$. Each price is rounded down before taking differences. This is one inequality for the same pair, so an independently proved lower bound on $K$ can enter the negative term directly.

Our five rational rows use $w=LT$, $0<c<n$, $d=n-c$. Hence $D_h=n+LT$ and $D_k=c+LT$. They retain the predecessor's first- and fifth-chaos trials in the difference and its positive cubic and negative quintic trials in the average. In each slot $D=a+LT=(a+L)(T+a/L)/(1+a/L)$, so the predecessor's price functions are called with the indicated mass and shift. The associated Stieltjes integral is enclosed by its order-256 variational Laguerre bounds, rounded outwards at $10^{-18}$. The replay stores all trial coefficients and checks each of 35 rational prices before downward rounding at $10^{-7}$.

Let $v_j>0$ be arbitrary pre-existing normalized sector weights in order $11,20,10,01,21$. The checker forms $s=\min_{j\ne00}(p_j-p_0)/v_j>0$. For any potentially violating pair $V\ge C$ with $t\le t_1$ and $A\in[a,b]$, $a>0$, its normalized charge $z=\sum v_j x_j/A$ satisfies
$$z\le\frac1s\left(e-p_0+
 \sup_{A\in[a,b]}\frac{n+L+(1-h_*)t_1^2-C-dK}{A}\right).$$
To bound the supremum, take any **single** mass witness $K\ge u\sqrt A-v$ valid throughout the energy and shape rectangle, with $u\ge0$. In $x=1/\sqrt A$ the expression to maximize is $(n+L+(1-h_*)t_1^2-C+dv)x^2-du x$. A nonnegative quadratic coefficient gives convexity; otherwise the expression is decreasing on $x>0$. Thus its maximum is at one of $A=a,b$. Use the lower values of the same witness at those endpoints, with downward square roots. Different witnesses may be tested independently and their bounds minimized. Using the best witness separately at each endpoint without a common lower function is insufficient. The returned $z$ is unscaled; a support ray multiplies it by its own squared cubic coefficient. The predecessor's shape-chord proof then applies without changing its Stein polynomials or endpoint contractions.

The additional contribution can be tested on the predecessor's original first ray at $t=.392$, $\sqrt\chi=2.2$. The old charge fails at this point, and setting just $d=0$ in the new charge bounds also fails. Retaining the charge and $dK$ rejects the whole closed cell containing that point. These are controls on the relaxation, not claims of a realizable violating pair.
