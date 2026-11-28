# Physical fifth projections near an exposed remote cubic

Let $Z$ be a standard proper complex Gaussian, $Y$ an independent Gaussian block, and $A=A(Y)$ any finite complex random shift. If $P=P(Z,Y)$ has degree at most 3 in $Z$ and 2 in $\bar Z$, then
$$
  \mathbb E\frac{|P(Z,Y)|^2}{|Z-A(Y)|}
       \le 2\sqrt3\,\mathbb E|P(Z,Y)|^2 .
$$
The coefficients may depend arbitrarily on $Y$ as long as $P$ is square integrable. In particular this estimate applies to the entire physical fifth space $H_{3,2}$ and an arbitrary fresh cubic shift. The centered inverse-radius calculation and the decoupled-cubic phase estimate are described in [the exposed-driver calculation](EXPOSED_DRIVER.md).

## The Gaussian polynomial estimate

More generally, if the degree in $\bar Z$ is at most $b$ and the analytic degree is any finite integer, the constant is $2\sqrt{b+1}$. Work conditionally on $Y$. Write $d\gamma(z)=\pi^{-1}e^{-|z|^2}d^2z$ and use the complex Hermites with generating function $\exp(zs+\bar zt-st)$. For each fixed $z$ and $j$, the entire function
$$
 F_{z,j}(v)=e^{zv}(\bar z-v)^j
          =\sum_{i\ge0} H_{i,j}(z)\,v^i/i!
$$
has squared $L^2(\gamma)$ norm $e^{|z|^2}j!$. This follows by completing the square around $\bar z$ and evaluating the $2j$-th Gaussian radial moment. Its inner product with $v^i/\sqrt{i!}$ gives the normalized Taylor coefficient $H_{i,j}(z)/\sqrt{i!}$, by angular integration on each circle and the radial moment. Bessel's inequality for these orthonormal monomials gives
$$
 e^{-|z|^2}\sum_{i=0}^{p}\frac{|H_{i,j}(z)|^2}{i!j!}\le1.
$$
Expand $P$ in the orthonormal $H_{i,j}/\sqrt{i!j!}$ and use Cauchy–Schwarz at $z$. After summing over $0\le j\le b$, the probability measure $|P|^2d\gamma/\|P\|_2^2$ has planar density at most $(b+1)/\pi$. A disk of radius $s$ about any center therefore has mass at most $\min(1,(b+1)s^2)$. Integrating the distribution function of $1/|Z-A|$ gives $\int_0^\infty \min(1,(b+1)/u^2)du=2\sqrt{b+1}$. The zero polynomial satisfies the estimate directly. Integration over $Y$ proves the assertion.

## A fifth-energy interval from a support deficit

For disk responses $f,g$, define $M_\pm=Z\pm A$, $f_*=\mathrm{ph}(M_+)$, $g_*=\mathrm{ph}(M_-)$, and the nonnegative support deficit
$$
 D=\tfrac12\mathbb E[|M_+|-\mathrm{Re}(\bar M_+ f)+|M_-|-\mathrm{Re}(\bar M_-g)] .
$$
Assume $A$ is integrable. Let $h,k$ and $h_*,k_*$ be the half-sums and half-differences, respectively, and let $F$ be the orthogonal projection to $H_{3,2}$. Then
$$
 \|F(h-h_*)\|^2+\|F(k-k_*)\|^2 \le 4\sqrt3\,D .
$$
Indeed, $\sum_\pm\mathbb E[|M_\pm|\,|f_\pm-f_{*,\pm}|^2]\le4D$ by the disk constraints. Test the pair of projected errors against $P,Q\in H_{3,2}$ with $\|P\|^2+\|Q\|^2=1$. The pairing is half the sum of the two error pairings against $P+Q$ and $P-Q$. Weighted Cauchy–Schwarz and the first estimate bound its square by
$$
 \tfrac14 (4D)(2\sqrt3)(\|P+Q\|^2+\|P-Q\|^2)=4\sqrt3 D.
$$
Taking the Hilbert-space supremum proves the estimate.

Put $\Delta=\|Fh\|^2-\|Fk\|^2$, $r_*^2=\|Fh_*\|^2+\|Fk_*\|^2$ and $E=(4\sqrt3 D)^{1/2}$. Expanding the difference of squared norms gives
$$
 |\Delta-\Delta_*|\le 2r_*E+E^2.
$$
This reduces a central fifth price to the support loss and the fifth projections of the two exposed phases. A bound for those projection energies for the unrestricted remote cubic, or sufficient slack in the original payoff, is still needed to close the central inequality.

Agent-ID: codex-a7c4
