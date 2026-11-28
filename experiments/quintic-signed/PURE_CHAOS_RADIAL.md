# Radial Laplace weights on an arbitrary single complex Gaussian chaos

Agent-ID: codex-a7c4. Let $Z$ be any unit complex-linear coordinate on a finite standard complex Gaussian space. For a polynomial $v$ in one pure bidegree $(p,q)$ and every $s\ge0$,
\[
 \mathbb E[e^{-s|Z|^2}|v|^2]\le\frac{\|v\|_2^2}{1+s}.
\]
The bound is sharp when $v$ uses only independent coordinates. It holds for every nonnegative mixture of these Laplace weights, possibly by monotone convergence. In particular for $0<\gamma<1$,
\[
 \mathbb E[|Z|^{-2\gamma}|v|^2]\le\Gamma(1-\gamma)\|v\|_2^2 .
\]
The inverse-radius constant at every individual degree is therefore $\sqrt\pi$. The theorem retains the same constant in degree five as in degree three. For sums of different bidegrees there may be weighted cross terms.

## Two independent binomial variables

Write $H_{a,b}$ for the normalized complex Hermites, using the convention
\[
 e^{uz+v\bar z-uv}=\sum_{a,b\ge0} H_{a,b}(z)\frac{u^a v^b}{\sqrt{a!b!}} .
\]
For $\lambda=(1+s)^{-1}$ and a scalar standard proper complex Gaussian $G$, coefficient comparison in
\[
 \mathbb E[e^{-s|G|^2} e^{uG+v\bar G-uv}e^{x\bar G+yG-xy}]
 =\lambda\exp\big((\lambda-1)(uv+xy)+\lambda(ux+vy)\big)
\]
gives
\[
 \frac{\mathbb E[e^{-s|G|^2}|H_{a,b}(G)|^2]}{\lambda}
 =\sum_{k=0}^{\min(a,b)}{a\choose k}{b\choose k}
    (1-\lambda)^{2k}\lambda^{a+b-2k}.
\]
Indeed the coefficient of $u^av^bx^ay^b$ on the right must select equal counts $k$ from $uv$ and $xy$, leaving $a-k$ copies of $ux$ and $b-k$ copies of $vy$. The Gaussian integral follows by changing the radial variance to $\lambda$ and using $\mathbb E\exp(cG+d\bar G)=\exp(cd)$. All coefficient derivatives are integrable in a neighborhood of the origin by Gaussian decay. The last sum is the probability that independent $\mathrm{Bin}(a,1-\lambda)$ and $\mathrm{Bin}(b,1-\lambda)$ variables agree. In particular it is at most one, with no degree-dependent factor.

Rotate coordinates to take $Z$ first. Expanding the physical $v$ as $\sum_{a,b}H_{a,b}(Z)v_{p-a,q-b}$ leaves each remote coefficient in a different bidegree. Orthogonality over the remote variables therefore diagonalizes the weighted norm. Apply the scalar bound term by term and sum the unweighted coefficient norms. For the inverse power, integrate the Laplace bound against $s^{\gamma-1}/\Gamma(\gamma)$ by Tonelli, or integrate the same positive mixture against the unit exponential law. Its expectation is $\Gamma(1-\gamma)$.

The [coefficient replay](code/coupled_cubic_fifth.py) cross-checks the binomial identity against direct finite Hermite integration. The [coupled cubic and fifth estimate](COUPLED_CUBIC_FIFTH.md) uses the $\gamma=1/2$ case in a dimension-independent comparison for arbitrary physical responses.
