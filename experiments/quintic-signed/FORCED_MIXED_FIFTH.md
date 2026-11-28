# A large remote cubic forces a mixed fifth projection

Let the visible coordinate be $Z$ with $\mathbb E|Z|^2=1$. For a pair of disk-valued responses write $h=(f+g)/2$, $k=(f-g)/2$ in an aligned first-chaos frame, with $\operatorname{Re}\langle Z,h\rangle=t$. Let $q$ be the unit vector in the direction of the purely remote cubic projection of $k$, so $\operatorname{Re}\langle q,k\rangle=\tau>0$. The variable $q$ depends only on the fresh coordinates and has bidegree $(2,1)$. Put $T=|Z|^2$. The functions $(T-1)q$ and $Z^2\bar q/\sqrt2$ are orthonormal fifth-chaos vectors. Independence gives their squared norms, their distinct visible angular charges give orthogonality, and the Hermite product in disjoint coordinates gives their bidegree $(3,2)$.

Define the vector $U=.052(T-1)q+.030 Z^2\bar q$ in this two-dimensional space $J$. Its squared norm is $.052^2+2(.030)^2=.004504$. The following support inequality holds in every dimension:
\[
 t+.37\tau+\operatorname{Re}\langle U,k\rangle\ \le\ .935 .
\]
In particular, when $t\ge .83835$ the physical half-difference satisfies the following lower bounds.

| Remote cubic norm at least | $\|P_Jk\|$ greater than | $\|P_Jk\|^2$ greater than |
|---:|---:|---:|
| .270 | .048 | .002304 |
| .280 | .103 | .010609 |
| .285 | .130 | .016900 |

The support inequality fixes the sign of the correlation with $U$ whenever $t+.37\tau>.935$. The energy bound follows by projection and Cauchy–Schwarz. For a positive fifth eigenvalue increment $s$, these prices are guaranteed subtractions from the contribution $s(\|Fh\|^2-\|Fk\|^2)$. Controlling $Fh$ and the original scalar payoff together is still necessary for an all-pairs improvement.

## Conditional scalar price

Put $H=.37q+U$. The disk constraints bound the sum of the two real inner products with $Z,h$ and $H,k$ by $\tfrac12\mathbb E(|Z+H|+|Z-H|)$. Conditional on the remote variables, only $y=|q|$ matters. Averaging over the uniform phase of $Z$ makes both signs equal. With $r=|Z|$ and $\theta$ the relative phase, the conditional price $S(y)$ is the expectation of the Euclidean length of
\[
 \left(r+y(.318+.082r^2)\cos\theta,\quad y(.318+.022r^2)\sin\theta\right).
\]
The angular measure is uniform on $[0,\pi]$ by reflection and the radial density is $p(r)=2r e^{-r^2}$. The exact rational replay proves $S(y)\le .88645+.04855y^2$ for every $y\ge0$. Averaging uses only $\mathbb E|q|^2=1$ and gives $.935$.

## Bounds between quadrature nodes

The replay checks $r\le6$ in steps $h=1/96$, 64 equal angular panels, and $y=0,1/16,\ldots,9$. All square roots, trigonometric evaluations, mesh masses, and final comparisons are rounded outward.

* On an angular interval of width $\pi/64$, the deviation of the displayed **vector** from its linear interpolant is at most $y(.318+.082r^2)(\pi/64)^2/8$ by the second derivative bound. Convexity of the norm then gives an upper trapezoid rule. Integrating this error costs at most $.4 y(\pi/64)^2/8$.
* On a radial interval, quadratic interpolation of the same vector costs at most $.082yh^2/4$. The derivative of its norm in the Lipschitz sense is at most $1+2(.082)yr$ up to the right endpoint. The density has $|p'|\le2$, since $|(1-2r^2)e^{-r^2}|\le1$. The difference between the integral of a linear interpolant and its midpoint value times the exact interval mass is bounded by $h^2$ times the difference of the two endpoint norms divided by six. To see this, subtract $p$ at the midpoint in the covariance integral and integrate the squared distance from the midpoint. Summing gives at most $6h^2(1+12(.082)y)/6$.
* The tail contribution beyond six is at most $e^{-36}[37+y(.318+37(.082))]$ from $r\le r^2$ on the tail. The exponential mass recurrence uses the cubic lower and quartic upper Taylor polynomials with outward integer rounding. Machin's interval for $\pi$ and Taylor remainders enclose the angular ordinates. The integer square-root test bounds each norm from above.
* $S$ is convex in $y$, so between two checked ordinates its chord gives an upper bound. The gap between that chord for $.88645+.04855y^2$ and the quadratic itself is at most $.04855/(4\cdot16^2)$, included at every ordinate. For $y\ge9$ the triangle inequality gives $S(y)\le\mu+.4y\le .88645+.04855y^2$.

Replay with `python3 -IB -O experiments/quintic-signed/code/forced_fifth.py`.

Agent-ID: codex-a7c4
