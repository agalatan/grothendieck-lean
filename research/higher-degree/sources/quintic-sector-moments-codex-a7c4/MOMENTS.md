# The visible coordinate in the cubic fourth moment

Agent-ID: codex-a7c4. Use the finite-dimensional game, unpriced sector energies and aligned proper Gaussian coordinate of the [support proof](SPIKED.md). For $A=\|P_{2,1}k\|_2^2>0$ expand $Q=P_{2,1}k/\sqrt A=\sum_{ij} e_{ij}(Z)q_{ij}(Y)$ in normalized visible Wick polynomials. Each coefficient has remote bidegree $(2-i,1-j)$, and $s_{ij}=\mathbb E|q_{ij}|^2=x_{ij}/A$. Write $T=|Z|^2$ and $J=\sum(i+j)s_{ij}$.

The first mixed moment in the elliptic lift is $\mathbb E[(T-1)|Q|^2]=J$. Distinct coefficients are orthogonal over $Y$. The diagonal integral $\mathbb E[T|e_{ij}|^2]=i+j+1$ follows by applying the complex Hermite creation and annihilation recurrences, or by integrating the six polynomials $1,T-1,Z^2/\sqrt2,Z,\bar Z,Z(T-2)/\sqrt2$ against the unit exponential law for $T$.

For the second mixed moment, only remote coefficients of conjugate bidegrees pair in $\mathbb E[Z^2\bar Q^2]$. In the $21$ and $10$ diagonal slots the visible integrals are $\mathbb E[T^2(T-2)^2]/2=4$ and $\mathbb E T^2=2$. For $11,20$ the integral is $\mathbb E[T^2(T-1)]/\sqrt2=2\sqrt2$, and both orders occur. Cauchy–Schwarz on the remote coefficients yields
$$
|\mathbb E[Z^2\bar Q^2]|
\le 4s_{21}+2s_{10}+4\sqrt2\sqrt{s_{11}s_{20}}.
$$
Let $r=2(179/200)^2-1$ and $z=\sum_{j\ne00}w_j s_j$, where $w_j$ are the weights in the [mass estimate](MASS_GRAM.md) and the [support verifier](../../code/quintic-sector-moments-codex-a7c4/cover.py). Then
$$
4J+2r\operatorname{Re}\mathbb E[Z^2\bar Q^2]\le99 z .
$$
Indeed the diagonal coefficients before the off-diagonal term are $d=(8,8,4+4r,4,12+8r)$ in the order $11,20,10,01,21$. The checker verifies every $99w_j-d_j\ge0$ and $(99w_{11}-8)(99w_{20}-8)\ge32r^2$. These are the principal-minor tests for the one coupled two-dimensional block. For example, at $(t,\sqrt\chi)=(.42,1.86)$ the full inequality succeeds and deleting this sector bound makes the frozen comparison fail. [Elliptic lift and its fourth moment](../joint-spectral-cubic-lift-codex-a7c4/PROOF.md)

## A payoff bound using the fourth excess of the whole cubic

Set $x=s_{00}=\sigma^2/A$, $v=1-x$ and $\chi=\mathbb E|Q|^4-2$. For $x>0$, let $\chi_R$ be the normalized fourth excess of the remote restriction. The [cumulant restriction theorem](RESTRICTION.md) gives $x^2\chi_R+2v^2\le\chi$. If $0\le\chi\le c<2$ then $v\le b=\sqrt{c/2}<1$, $A\le\sigma^2/(1-b)$ and
$$
\chi_R\le\max_{0\le v\le b}\frac{c-2v^2}{(1-v)^2}
=\frac{c}{1-c/2}.
$$
The maximum occurs at $c/2$. This also proves $x>0$ whenever $A>0$ on the stated range. If $A=0$, the elementary estimate $V\le\eta+(1-\eta)t^2$ suffices throughout the range claimed here.

At any rational slope $l>0$, testing the actual pair against $Z$ and its normalized remote restriction bounds $t+l\sigma$ by $\mathbb E|Z+l R/\sigma|$, since the two choices of sign give the same integral by circularity and independence. The diffuse cubic lift therefore gives the following support line, with $m=\sqrt\pi/2$:
$$
 t+l\sigma\le m\sqrt{1+l^2}\left[1+.00529\frac{c}{1-c/2}\left(\frac{l^2}{1+l^2}\right)^2\right].
$$
This is equation (1) of the [diffuse-lift proof](../quintic-mixed-sectors-codex-a7c4/PROOF.md). Use an outward square root both here and for $b$. In the elementary payoff estimate and the two [conditional trials](ANGULAR.md), replace $A$ by $\sigma^2/(1-b)$ with its positive coefficient $\varepsilon-\eta$. Each resulting upper bound is jointly convex in $(t,\sigma)$. A fixed support line over a closed amplitude strip bounds a trapezoid, so a single trial valid at all four vertices proves the whole strip. The [exact checker](../../code/quintic-sector-moments-codex-a7c4/shape.py) minimizes over such choices after taking the four-vertex maximum. The earlier all-sector proof supplies $[0,.38]$ at the same target and reserve. The listed excess ceilings decrease, so each new strip also has the preceding prefix.

| All amplitudes through | Maximum full fourth excess $c$ |
|---:|---:|
| $.50$ | $.0097$ |
| $.55$ | $.0045$ |
| $.60$ | $.00248$ |
| $.62$ | $.00165$ |
| $.64$ | $.00086$ |
| $.649$ | $.00060$ |
| $.65$ | $.00058$ |
| $.66$ | $.00034$ |
| $2/3$ | $.000195$ |
| $.67$ | $.000133$ |
| $.675$ | $.000057$ |
| $.68$ | $.000009$ |

As one consequence of the subspace inequality, a unit cubic on $n$ complex coordinates has $\chi\ge2/n$ by integrating out all coordinates. Thus the $.00060$ row through $.649$ concerns the high-dimensional, nearly Gaussian part of the problem.

Each interval gives $V<1/1.4025-10^{-5}$. No assumption on any individual energy or on the dependence between the visible coordinate and the full cubic is needed.
