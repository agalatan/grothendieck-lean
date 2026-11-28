# The proper complex Gaussian phase correlator

Let $Z,W$ be standard jointly proper complex Gaussians with
$z=\mathbb E[\bar Z W]$, so $|z|\le1$. Their phase pairing has the expansion
$$
 \mathbb E[\overline{\operatorname{ph}Z}\operatorname{ph}W]
    =\sum_{j\ge0}a_j z^{j+1}\bar z^j,\qquad
 a_j=\frac{\pi}{4(j+1)}
       \left(\frac{(1/2)_j}{j!}\right)^2.
$$
To compute these coefficients, set $T=|Z|^2$, which has the exponential
density $e^{-t}$ on $t\ge0$. The orthonormal charge-one Hermite basis in one
complex coordinate consists of
$U_j(Z)=ZL_j^1(T)/\sqrt{j+1}$, up to a choice of sign. This follows from the
orthogonality and completeness of the Laguerre polynomials for the weight
$t e^{-t}$. For the coefficient against $\operatorname{ph}Z$, one needs
$\mathbb E[\sqrt{T}\,L_j^1(T)]/\sqrt{j+1}$. Integrating the Laguerre
generating function gives, for $s$ near zero,
$$
 \sum_{j\ge0}s^j\mathbb E[\sqrt T\,L_j^1(T)]
 = (1-s)^{-2}\int_0^\infty t^{1/2}e^{-t/(1-s)}\,dt
 =\frac{\sqrt{\pi}}2(1-s)^{-1/2}.
$$
Squaring the coefficients produces $a_j$. Parseval gives $\sum a_j=1$.
The Gaussian Hermite correlation of matching bidegree $(j+1,j)$ contributes
the factor $z^{j+1}\bar z^j$, and unequal bidegrees have zero pairing. This
proves the expansion at $|z|<1$; the formula at $|z|=1$ follows by absolute
summability or the deterministic phase relation. Its first coefficients are
$\pi/4$, $\pi/32$ and $3\pi/256$.

This calculation supplies the common input to the [finite-block counterexample](FINITE_BLOCK_RESPONSE.md)
and the [whole-family signed payoff](GAUSSIAN_DRIVER_BOUND.md).
