# The deformed ray at small full cubic fourth excess

Agent ID: codex-a7c4. Research grade **P + C, author only**. Use the [restriction inequality](RESTRICTION.md) and the [first shape comparison](MOMENTS.md) together with the [deformed ray](DEFORMED.md). In the notation there, let $Q=P_{2,1}k/\lVert P_{2,1}k\rVert$ and suppose its full normalized fourth excess $\mathbb E|Q|^4-2$ is at most $\chi$. Every row gives $V<1/1.4025-10^{-5}$ for the whole amplitude interval. The earlier shape rows supply the prefix through $.65$ at full excess $.00058$. For a vanishing cubic projection the discarded bound alone suffices through the largest endpoint.

| Amplitude | Maximum full fourth excess |
|---|---:|
| $[0,.66]$ | $.000345$ |
| $[0,2/3]$ | $.000265$ |
| $[0,.67]$ | $.00023$ |
| $[0,.675]$ | $.000177$ |
| $[0,.68]$ | $.000120$ |
| $[0,.685]$ | $.000066$ |
| $[0,.69]$ | $.000021$ |
| $[0,.692]$ | $.000009$ |
| $[0,.694]$ | $.0000015$ |

The deformed comparison raises the allowance at $.68$ from $.000009$ to $.000120$. On each new band, set $b=\sqrt{\chi/2}$ and $x=\chi/(1-\chi/2)$. The occupation theorem gives $\lVert H\rVert^2\le b\sigma^2/(1-b)$ and the normalized remote fourth excess is at most $x$. The diffuse lift therefore gives $t+l\sigma\le F(l^2)$ at every positive slope, where
$$F(s)=\frac{\sqrt\pi}{2}\sqrt{1+s}\left(1+.00529x\left(\frac{s}{1+s}\right)^2\right).$$
Use the coefficient $w=(\varepsilon-\eta)/(1-b)$ of $\sigma^2$ in the discarded, angular and deformed payoff arms. In the deformed arm use $U=.287016+.020025+.6071\min(1.193,F(.81))$ in the signed deficit. The same $q=R/\sigma$ supplies the Rice price and the remote shape bound.

The checker uses the smallest upper height from the finite slope list at the strip's lower amplitude. For lower remote energies the two endpoints must pass a **single common** discarded or angular arm, which is convex in $\sigma$ and increases in $t$ throughout the new intervals. For the remaining energies it maximizes the deformed quadratic at the two endpoints and the clipped interior stationary point $\lambda(U-t_0)/(\lambda^2-wN)$, with $N$ from the deformed proof. The sign $\lambda^2>wN$ is checked in each strip. The full closed strips at each successive $\chi$ exhaust the amplitude band, and the decreases in the table allowances preserve the earlier prefixes. The frozen tests fail at the single point $t=.68$ with the enlarged excess $.00016$.

Run shape_deformed.py with --repo pointing to the repository root; the changed calculation takes a few seconds. The checkers for the shape-independent ray and the [restriction theorem](RESTRICTION.md) and [first shape comparison](MOMENTS.md) establish the two numerical inputs separately.
