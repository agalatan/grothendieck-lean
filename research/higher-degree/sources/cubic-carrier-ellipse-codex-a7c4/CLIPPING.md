# The projection residual of a bounded cubic response

Agent-ID: codex-a7c4. Paper proof and rational checks, author only.

The [elliptic lift](ELLIPTIC.md) and the sixth-moment inequality for complex cubics already give $V<500/701$ up to $t=0.35386150$ at the independently reviewed radius $2287/2500$. At the radius $4571/5000$ they give $t\le0.35649797$. These estimates use the pointwise bound $|k|\le1$ and the exact relation between $k$ and its orthogonal cubic projection. The existing Lean mass-row inequality gives $0.35859076$ and $0.36096350$, respectively, when combined with the same elliptic carrier. The two approaches estimate the same projection residual.

## Keep the distance to the projected cubic

Use [the game's notation](PROOF.md) and write $U=P_{2,1}k$, $x=\|U\|^2$, $L=\|k\|^2-x=\|k-U\|^2$. The payoff reduction gives $V\le\eta+(1-\eta)t^2+(e-\eta)x-\eta L$. Take $\lambda=21/200$. Orthogonality gives the exact identity

$$ \|k-(1+\lambda)U\|^2=L+\lambda^2 x.$$

When $x>0$ write $R=|U|/\sqrt{x}$, so $\mathbb E R^2=1$. Because $|k|\le1$, for $z=(1+\lambda)^2 x$ the identity implies $L\ge\mathbb E(\sqrt{z}R-1)_+^2-\lambda^2x$. Define for a fixed normalized cubic law

$$F_R(x)=(e-\eta+\eta\lambda^2)x-\eta\mathbb E[((1+\lambda)\sqrt{x}R-1)_+^2].$$

The secant slopes of the positive-part square as a function of $x\ge0$, pointwise in $R$, are between $0$ and $(1+\lambda)^2R^2$: it vanishes up to the threshold, and differentiating above it gives $(1+\lambda)^2R^2-(1+\lambda)R/\sqrt x$. Consequently all secant slopes of $F_R$ lie in

$$[\,e-\eta-\eta(1+2\lambda),\; e-\eta+\eta\lambda^2\,].$$

The left endpoint is positive. Apply any proved ellipse $x+\nu t^2\le\rho^2$, replacing $x$ by the larger $\rho^2-\nu t^2$ in $V\le\eta+(1-\eta)t^2+F_R(x)$. The resulting expression increases in $t^2$ since $1-\eta>\nu(e-\eta+\eta\lambda^2)$. This use of a hypothetical energy scales the same fixed law $R$, so no monotonicity in the laws of different cubic projections is needed. At $x=0$ one can take any normalized cubic law in $F_R$, because $F_R(0)=0$.

It is enough to check one mass $t_0$ for each radius and ellipse. Put $x_0=\rho^2-\nu t_0^2$, $z_0=(1+\lambda)^2 x_0$. The required strict comparison is

$$\mathbb E(\sqrt{z_0}R-1)_+^2>\frac{\eta+(1-\eta)t_0^2+(e-\eta)x_0-500/701}{\eta}+\lambda^2x_0.\tag{1}$$

## A quartic test uniform in the cubic law

Set $s=\mathbb E R^4-2\ge0$. The normalized complex-cubic moment theorem gives

$$\mathbb E R^6\le M(s)=6+9s+C_6s^{3/2},\qquad C_6=4045313/100000.$$

The analytic hypotheses on a normalized complex Wick cubic and the tensor facts are recorded in [the radius proof’s dependency inventory for Theorem 1](../../../conjecture-K/sources/complex-radius-2026-11-17-gemini-2762/PROOF.md) and in [the circular sixth-moment theorem](../../../../Grothe/LowerAnalytic/Circular.lean).

For $J=\sqrt{z_0}R$, $J^4-J^2\le(J-1)_+(J^3+J^2)$. Cauchy–Schwarz and the triangle inequality in $L^2$ give

$$ \sqrt{\mathbb E(J-1)_+^2}\ge \frac{z_0(2+s)-1}{\sqrt{z_0M(s)}+\sqrt{2+s}}.$$

All rows have $2z_0>1$. Choose a rational upper bound $r$ for the square root of the right side of (1). Let $d>0$ be the tangent parameter in the table. By AM–GM, $\sqrt{2+s}\le(2+d^2+s)/(2d)$. Define $A=2z_0-1-r(2+d^2)/(2d)$ and $B=z_0-r/(2d)$. The replay checks $A,B>0$ and proves the following quartic positive for $v\ge0$:

$$ (A+Bv^2)^2-r^2z_0(6+9v^2+C_6v^3)>0,\qquad v=\sqrt{s}.$$

Taking nonnegative square roots now gives (1). On $v\ge4$ positivity follows from the five positive Taylor coefficients at four. On $[0,4]$ the verifier converts the rational polynomial to the degree-four Bernstein basis and uses midpoint subdivision until all five coefficients on each subinterval are strictly positive. The Bernstein functions are nonnegative and sum to one. The four rows use 10–12 subintervals apiece; there is no floating-point step or sampling assumption.

| Ellipse coefficient $\nu$ | Cubic radius $\rho$ | Tangent $d$ | Capped game certified through $t_0$ |
|---|---:|---:|---:|
| $2/\pi$ | $2287/2500$ | $1.795$ | $0.32552663$ |
| $2/\pi$ | $4571/5000$ | $1.7925$ | $0.32795281$ |
| $(431/500)^2$ | $2287/2500$ | $1.76333$ | $0.35386150$ |
| $(431/500)^2$ | $4571/5000$ | $1.76009$ | $0.35649797$ |

For $2/\pi$ the replay uses the slightly smaller rational coefficient $0.63661977236758$, verified with Machin's identity. For every row, dropping the projection residual fails the desired comparison at $t_0$. At the next eight-decimal point a specific rational $s$ makes the displayed Cauchy–Schwarz sixth-moment lower bound too small to certify (1). This negative control concerns that majorant and fixed $\lambda$; it makes no claim that any cubic attains the test moments.

[Exact replay](../../code/cubic-carrier-ellipse-codex-a7c4/verify_clipping.py).

The controls for the real symmetric carrier use the same lower rational approximation to $2/\pi$ as the proof of its positive endpoints.
