# Finite quintic coefficients on the two g84 spike rows

Agent-ID: codex-a7c4. Task #824. **P + C, author only** for global strong concavity. **N** for the payoff values.

Use the stored g84 rows of the game $(1,-.84,.2552)$ at $t=.80,.85$, with their stored cubic scales $\sigma$. Let $z,y,W$ be independent standard proper complex Gaussians, $e_{ij}$ the normalized Wick polynomials and $q=\sigma(c e_{21}(y)+\sqrt{1-c^2}\,W)$. Fix a row with parameters $\ell,\beta,b_A,b_B$. Set
\[
 L=z(\ell+\beta(|z|^2-2)),\quad
 U=\nu e_{32}(z)+A z e_{22}(y)+B\bar z e_{31}(y),\quad
 D=q(1-b_Ae_{11}(z))-b_B\bar q e_{20}(z).
\]
The finite-amplitude row payoff in this family is
\[
 F(\nu,A,B)=t^2-2\ell t+2\beta^2/.84
 -\sigma^2/.84+(b_A^2+b_B^2)\sigma^2/.2552
 +\mathbb E[|L+U+D|+|L+U-D|]
 -(|\nu|^2+|A|^2+|B|^2)/.2552.
\]
The three quintic fields are orthonormal. Their full norm is charged once, and $\nu$ is free in every comparison. These are the visible quintic and the two dominant remote quintic sectors of the [Stage 0 experiment](../degree5-stage0-2026-11-28/REPORT.md). The remote bath and the fixed-scale one-spike family specialize the [finite-amplitude row](../degree5-progress-2026-11-16/SPIKE_LAYER.md).

## Global optimization within the three sectors

The following uniform bounds apply at every coefficient vector. In the complex case take the Hessian in the six real coordinates. The stated decimals are exact rational lower bounds on the smallest eigenvalue of $-\nabla^2 F$.

| Row $t$ | Coefficients | Spike coefficient $c$ | Lower bound |
|---|---|---|---:|
| .80 | real | $[0,.75]$ | .190990 |
| .80 | complex | $[0,.73]$ | .124990 |
| .85 | real | $[0,.20]$ | .050990 |
| .85 | real | $[.20,.30]$ | .015990 |

Thus each covered problem has a unique global maximizer. The linear growth of the norms and the negative quadratic price imply coercivity. If the lower bound is $m$, then $\sup F-F(x)\le\|\nabla F(x)\|^2/(2m)$, by maximizing the tangent quadratic. On the complex range at .80 the maximizer is real, since conjugation preserves the objective and the maximizer is unique. The assertions hold at the printed row scales, with fixed $t$. The other quintic sectors, arbitrary remote laws and the full degree-five witness remain open.

### Curvature after conditioning on the Gaussian bath

Joint rotation sets $z=r\ge0$ with $T=r^2$ standard exponential. Let $a=1-b_A(T-1)$, $b=-b_BT/\sqrt2$, and $\tau=\sigma\sqrt{1-c^2}$. Here $a\pm b>0$ for every $T$. For a projection onto angle $\phi$, define $d_\phi^2=(a+b)^2\cos^2\phi+(a-b)^2\sin^2\phi$. The independent bath has projected variance $s^2=\tau^2d_\phi^2/2$. For $N\sim\mathcal N(0,1)$, the second derivative of $\mathbb E|v+sN|$ is $\sqrt{2/\pi}\exp(-v^2/(2s^2))/s$. In the identity $|w|=(\pi/2)\mathbb E_\phi |\Re(e^{-i\phi}w)|$ the two norm summands therefore give an upper Hessian with prefactor $2\sqrt\pi/\tau$. Differentiation is dominated because $d_\phi\ge1+b_A>0$ and the three fields are square-integrable.

Let $I_2=\mathbb E_\phi[\cos^2\phi/d_\phi]$, $I_0=\mathbb E_\phi[1/d_\phi]$. Averaging the squared projected direction in $y$ gives the diagonal upper bound
\[
 (2\sqrt\pi/\tau)\,\mathbb E_T\operatorname{diag}(e_{32}(r)^2 I_2,\ T I_2,\ T I_0/2).
\]
Indeed $e_{22}(y)$ is centered, real and normalized, and $e_{31}(y)$ is a normalized charge-two mode. The imaginary $\nu,A$ directions use $\sin^2\phi$ in place of $\cos^2\phi$. Reflection in $\phi$ kills the real-imaginary cross terms. Both $B$ directions have the same diagonal.

The convex chord of $x^{-1/2}$ gives $I_2\le[3/(a+b)+1/(a-b)]/8$. The sine bound interchanges the weights $1,3$, and $I_0/2\le[1/(a+b)+1/(a-b)]/4$. To integrate these bounds, for $d,e>0$ write $r_0=d/e$ and choose a polynomial $P$ with $P(-r_0)\ne0$. Then
\[
 Q(X)=\frac{1+X P(X)^2/(r_0P(-r_0)^2)}{d+eX}
\]
is a polynomial and majorizes $1/(d+eX)$ on the positive ray. The checker verifies the polynomial identity with rational coefficients and integrates against the nonnegative weights $T$ and $e_{32}(r)^2=T(T^2-6T+6)^2/12$ using factorial moments.

### The paired signs on the upper spike interval

At $t=.85$ and $.20\le c\le.30$, retaining the two Gaussian factors in the Hessian improves the $B$ diagonal. For common mean $m$ and spike shift $x$, both in units of the projected bath standard deviation, their average is
\[
 M(m,x)=e^{-(m^2+x^2)/2}\cosh(mx),\qquad
 1-M(m,x)\ge(3/8)\min(x^2,1).
\]
For $|x|\le1$ use $\cosh(mx)\le e^{m^2 x^2/2}$ and the chord for $e^{-x^2/2}$. For $|x|\ge1$, scale $(m,x)$ by $1/|x|$. This only increases each of the two Gaussian factors, and reduces to $|x|=1$.

Write $S=|y|^2$, $\theta=\arg y$. The standardized spike is $x=d_c\cos(\theta-\psi)$ with $d_c^2=c^2S(S-2)^2/(1-c^2)$. This follows by projecting $(a+b)\Re e_{21}(y)+i(a-b)\Im e_{21}(y)$ and dividing by the standard deviation in the same direction. On $S\ge4$, the deficit $1-M$ thus dominates $(3/8)\min(16c^2/(1-c^2),1)\cos^2(\theta-\psi)$.

A projected coefficient direction at fixed $r,\phi,S$ belongs to the span of $1,\sqrt2\cos2\theta,\sqrt2\sin2\theta$. On this orthonormal basis, multiplication by $\cos^2(\theta-\psi)$ has diagonal $1/2$ and cross terms only between the constant and the harmonic pair, with Euclidean norm $\sqrt2/4$. The minimum eigenvalue exceeds $1/7$. After applying this matrix inequality to the full direction, discard the nonnegative constant-mode square and retain the $B$ square. Since $e_{31}(y)=y^2(S-3)/\sqrt6$,
\[
 \mathbb E[|e_{31}(y)|^2\mathbf1_{S\ge4}]=(103/3)e^{-4}>31/50.
\]
The $B$ diagonal is consequently multiplied by at most $1-(3/8)(1/7)(31/50)\min(16c^2/(1-c^2),1)$. Throughout the upper interval the unpriced Hessian is below $7.821I$, while the penalty contributes $-(2500/319)I$. [Exact rational replay and removal controls](../../code/finite-spike-codex-a7c4/verify.py)

## Numerical payoff of the original two norms

The evaluator conditions on the elliptic Gaussian bath exactly, then integrates over the two Gaussian radii, the spike azimuth and the norm direction. It optimizes the actual finite coefficients in the three real fields. The scalar comparison optimizes $\nu$ on the same grid at the same spike. At $c=0$ the added fields have zero gain. With 48 and 32 radial nodes, 20 azimuths and 48 norm directions, the sampled results are:

| $t$ | $c$ | Three-sector row payoff | Gain over optimized visible quintic alone |
|---|---:|---:|---:|
| .80 | 0 | .712124517 | 0 |
| .80 | .02 | .712124512 | $8.13\cdot10^{-9}$ |
| .80 | .05 | .712124319 | $3.03\cdot10^{-7}$ |
| .80 | .10 | .712120846 | $4.13\cdot10^{-6}$ |
| .80 | .30 | .711743122 | $1.13\cdot10^{-4}$ |
| .85 | 0 | .712460592 | 0 |
| .85 | .02 | .712460591 | $1.68\cdot10^{-9}$ |
| .85 | .05 | .712460583 | $6.46\cdot10^{-8}$ |
| .85 | .10 | .712460386 | $9.73\cdot10^{-7}$ |
| .85 | .30 | .712414059 | $4.40\cdot10^{-5}$ |

At $t=.85,c=.10$ the two remote fields recover about $83\%$ of the scalar loss from introducing the spike, measured against the $c=0$ payoff. The full three-sector result still lies about $2.05\cdot10^{-7}$ below the same-grid $c=0$ result. This ratio uses the freely optimized scalar reference defined above. It illustrates how a large fraction of a small deficit can coexist with a small absolute effect. At grid orders $(60,40,28,64)$ the corresponding difference is again about $-2.06\cdot10^{-7}$. Neither quadrature, its gradient, nor these sampled values are certified. A rigorous payoff would follow from outward enclosures on a trial value and gradient using the theorem above. The Stage 0 decision for its five games and original allocation still stands. [Numerical evaluator](../../code/finite-spike-codex-a7c4/explore.py)

From the repository root run

```sh
python3 -IB research/higher-degree/code/finite-spike-codex-a7c4/verify.py
python3 -IB research/higher-degree/code/finite-spike-codex-a7c4/explore.py
```

The exact replay uses the Python standard library. The numerical evaluator uses NumPy and SciPy.
