# Gaussian scale slack on gA1 at the finite-spike witness

For the gA1 row at $t=.84$, the available gain from optimizing the diffuse Gaussian scale is less than $3\cdot10^{-9}$ at **both** the historical gate scale $.23953$ and the full row scale $.23953361222480435$. This accounts for the entire scale supremum in the denominator of the [finite five-shell trial](../finite-spike-witness-codex-062a/TRIAL.md). Its contribution to the proposed $7/20$ allocation is less than $1.05\cdot10^{-9}$. The finite-spike deficit and the defender-corrected trial gain still need outward enclosures to decide that allocation.

**P + C, author only (codex-062a, #922).** The [interval replay](../../code/ga1-diffuse-slack-codex-062a/verify.py) reads the exact decimal coefficient spellings from the pinned Stage 0 row and checks the historical point in its separate gate file. Run from the repository root with Python and python-flint (tested with 0.9.0).

~~~sh
python3 -IB -O research/higher-degree/code/ga1-diffuse-slack-codex-062a/verify.py
~~~

## The scale supremum

Write $B(s^2)$ for the expected sum of the two diffuse branch norms at standard deviation $s$, and $H(s)=B(s^2)-ks^2$, where $k=1/\varepsilon_1-(b_A^2+b_B^2)/\eta$. All scale-independent terms cancel. For each of the two reference scales $\sigma$ the result is
\[
 0\le V_{\rm sl}(\sigma)=\sup_{s\ge0}H(s)-H(\sigma)<3\cdot10^{-9}.
\]
At $s=.2$ the replay checks $H(.23953)-H(.2)>7\cdot10^{-5}$ as an off-peak control.

The diffuse branch depends affinely on $s$. Each unit-scale bath field has second moment $1+b_A^2+b_B^2$ by orthogonality and circularity of the independent Gaussians. The triangle and Cauchy–Schwarz inequalities give Lipschitz constant $2\sqrt{1+b_A^2+b_B^2}$ for $s\mapsto B(s^2)$. The checker verifies $k>\sqrt{1+b_A^2+b_B^2}$, so $H$ decreases above 1. Convexity of the two expected norms in $s$ bounds $H$ on any subinterval $[a,b]$ by $\max(H(a),H(b))+k(b-a)^2/4$. Subdivide $[0,1]$ until every such upper bound is strictly below an outward lower endpoint for both reference scores plus $3\cdot10^{-9}$.

## The two-dimensional integral

Use the [diffuse folded-normal formula](../quintic-node-pilot-codex-a7c4/SPIKE.md) with visible radius $r$, $T=r^2$, projection variable $u=2\phi/\pi\in[0,1]$, and $C=\cos(\pi u/2)$. Set
\[
 L=r[\ell+\beta(T-2)+\nu_5(T^2-6T+6)/\sqrt{12}],\quad
 A=1-b_A(T-1),\quad B=-b_BT/\sqrt2,\quad
 D=\sqrt{(A-B)^2+4AB C^2},\quad m=LC .
\]
Here $B$ without an argument denotes the ellipse coefficient. The two branch signs have equal diffuse expectation, and quadrant symmetry reduces the direction average to the unit interval. With $W=2\pi r e^{-T}$ the integrand for $B(s^2)$ is
\[
 W\left[m\,\operatorname{erf}(m/(sD))+
              (sD/\sqrt\pi)\exp(-(m/(sD))^2)\right].
\]
The three coefficients of $L/r$ as a polynomial in $T$ are positive by the checks on $\ell,\beta,\nu_5$. Hence $B(0)=2\,\mathbb E L=\sqrt\pi(\ell-\beta/2+3\nu_5/(4\sqrt{12}))$ by the Gaussian radial moments. For $r\ge7$ and $s\le1$, the folded mean is at most $|L|+D\le4r^5$ using the checked coefficient bounds. For example $|L|\le r(1+T)+.1r(T^2+6T+6)/\sqrt{12}$ and $D\le 1+T$. The discarded integral is therefore at most $8\pi\int_7^\infty r^7e^{-r^2}\,dr=4\pi e^{-49}(49^3+3\cdot49^2+6\cdot49+6)<10^{-14}$.

## Outward Gauss–Legendre error

A single tensor rule on adaptive rectangles covers $r\in[0,7]$, $u\in[0,1]$ for every $1/32\le s\le1$. Fix one coordinate real and extend the other to a complex disk of radius $2h$ about **every** real point in its panel of half-width $h$. If the integrand is analytic there with magnitude at most $M$, Cauchy's estimate bounds its derivative of order $2n$ by $(2n)!M/(2h)^{2n}$. For an $n$-point Gauss–Legendre rule the resulting error in the panel **mean** is at most
\[
 M\,\frac{(n!)^4}{(2n+1)((2n)!)^2}.
\]
Indeed the Gaussian remainder is the $2n$-th derivative divided by $(2n)!$ times the mean squared monic Legendre polynomial. On a panel the latter is $h^{2n}[2^n(n!)^2/(2n)!]^2/(2n+1)$. [Gauss quadrature remainder](https://dlmf.nist.gov/3.5#v) · [Legendre normalization](https://dlmf.nist.gov/18.3)

The complex box for the varying coordinate extends $3h$ to either side of the midpoint and $2h$ in both imaginary directions. The other coordinate ranges over its real panel. The checker establishes $\Re D^2>0$ before using the analytic square root. Put $z=m/D$ and $E=\exp(\max(0,-\inf\Re(z^2))/(1/32)^2)$. This bounds $|\exp(-(z/s)^2)|$ throughout the scale range. Integrating the derivative of $\operatorname{erf}$ vertically from $\Re z/s$ to $z/s$ gives $|\operatorname{erf}(z/s)|\le1+2|\Im z|E/(1/32)$, since the real part of the squared argument along that segment is at least its endpoint value. The bound on the complex integrand follows by the triangle inequality.

Use $n=12$ and bisect until each directional error in the mean is below $4\cdot10^{-11}$. Applying the estimate one coordinate at a time uses only the positivity and normalization of the quadrature weights. Summing the two errors over area 7 costs at most $5.6\cdot10^{-10}$ per endpoint score. All panel coordinates are dyadic and the enforced depth makes the binary64 midpoint geometry exact. Arb encloses the Gauss nodes, weights, integrands and remainder calculations.

## Reusing the quadrature across scales

Each real node contributes a positive weight times $f_s(x)=x\operatorname{erf}(x/s)+s e^{-(x/s)^2}/\sqrt\pi$ with $x=m/D\ge0$, after absorbing $D$ into the weight. For $x>8$, $0\le f_s(x)-x\le e^{-64}$ by convexity of absolute value and the folded formula. For the remaining nodes use bins centered at multiples of $1/256$. Verify $|x-x_{\rm bin}|<1/500$ individually and accumulate weighted moments through degree five with Arb. The Taylor remainder per unit weight is at most
\[
 \frac{(1/500)^6}{30\sqrt\pi\,s^5}.
\]
Indeed $f_s''(x)=2e^{-(x/s)^2}/(\sqrt\pi s)$. The fourth derivative of $e^{-v^2}$ has absolute value at most 12, its value at zero, by its Fourier representation as the transform of a positive Gaussian density weighted by the fourth power of frequency. Taylor's formula now gives the displayed bound, including all rounding in the polynomial evaluations through the interval arithmetic. The scale interpolation uses these outward score intervals at every tested endpoint. At smaller positive scales the single chord from 0 to $1/32$ suffices.
