<!-- Original research note by codex-a7c4 for issue #509. -->
# Raw A-content near a cubic with a unitary symmetry

Agent-ID: codex-a7c4. Paper argument and exact budget replay, **P + C, author only**. The estimates for the core retain their individual ledger labels. [Issue #509](https://github.com/agalatan/grothendieck-lean/issues/509)

Let $p,h$ belong to the pure complex Gaussian chaos $H_{2,1}$ on the remote coordinates and let $\Pi$ project onto the holomorphic first chaos. We use $\Phi(z)=\phi(|z|^2)$, $F(q)=\mathbb E\Phi(q)$, $D(q)=B(\|q\|_2^2)-F(q)$, and $C(q)=\|\Pi\Psi_A(q)\|_2$ from ledger 6.2–6.3. Let $\mathcal G$ be a compact group acting unitarily on the coordinates and $\chi$ a continuous complex character of modulus one. Assume
$$p(gz)=\chi(g)p(z),\qquad \int_{\mathcal G}\overline{\chi(g)}h(gz)\,dg=0,$$
where $dg$ is Haar probability. For an involution $T$, these equations say that $p$ and $h$ have opposite signs under $T$.

Suppose $D_0=D(p)>0$, $C(p)^2\le\kappa D_0$, and $\|p+h\|_2^2\le463/10000$. For the indicated integer $n$, $\|h\|_2^2\le D_0/n$ implies $C(p+h)^2\le(6/25)D(p+h)$.

| row | $\kappa=47/200$ | $\kappa=9/40$ | $\kappa=11/50$ |
|---|---:|---:|---:|
| peak | 167 | 56 | 42 |
| flank | 167 | 56 | 42 |
| upper | 160 | 54 | 40 |

At the peak the circle-character case of 6.3.9b gains the factor $90/56$ in the allowable energy for a core with $\kappa=9/40$. A sign change of one driver or an entire driver block allows mixtures of opposite circle characters inside the core.

## Cancellations from symmetry

Write $c_0=\Pi\Psi_A(p)$. The projection commutes with the group action and $\Psi_A$ is phase-equivariant, so $c_0(gz)=\chi(g)c_0(z)$. Averaging the inner product of $p$ and $h$ gives zero. By invariance of the Gaussian law and phase invariance of $\Phi$,
$$\mathbb E D\Phi(p)[h]=0,\qquad \mathbb E[\overline{c_0}D\Psi_A(p)[h]]=0.$$
Indeed after replacing $z$ by $gz$, the direction in each real-linear derivative at $p$ is $\overline{\chi(g)}h(gz)$, whose average vanishes. Polynomial integrability and the derivative bounds below justify the averages.

If $c_0\ne0$, set $\ell=c_0/\|c_0\|_2$, a unit Gaussian linear form. In orthonormal coordinates starting with $\ell$, expand $h$ in the normalized complex Hermites $H_{ij}(\ell)/\sqrt{i!j!}$. Its component with occupancy $(2,1)$ is a constant times $H_{21}(\ell)$, a vector of character $\chi^2\bar\chi=\chi$. Character orthogonality removes this component. Every other coefficient has complementary bidegree $(2-i,1-j)$, and coefficients at different occupancies are orthogonal in the remaining coordinates. The elementary exponential moments give the diagonal factors $\sqrt\pi/2$ at $(0,0)$, $3\sqrt\pi/4$ at $(1,0),(0,1)$, $15\sqrt\pi/16$ at $(2,0)$ and $7\sqrt\pi/8$ at $(1,1)$. Thus
$$\mathbb E|\ell||h|^2\le k\|h\|_2^2,\qquad k=15\sqrt\pi/16.$$
For $c_0=0$ the pairing vanishes directly. The moment calculation is also in [6.3.9b, §6](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md).

## Removing linear terms before projection

On each profile $\Psi_A(z)=-z\int e^{-s|z|^2}\nu_A(ds)$ with $\nu_A$ positive and finite, of mass $M_0$. The real Jacobian of a negative unit atom has eigenvalues $-e^{-x}$ and $(2x-1)e^{-x}$ at $x=s|z|^2$. The second has maximum $r=2e^{-3/2}$ at $x=3/2$. Hence the spectrum of $D\Psi_A$ lies in $[-M_0,rM_0]$. Subtracting its scalar midpoint times the identity from $\Psi_A$ gives a globally Lipschitz map with constant $L=(1+r)M_0/2$. Since $\Pi h=0$, projection contraction gives
$$\|\Pi(\Psi_A(p+h)-\Psi_A(p))\|_2\le L\|h\|_2.$$
Separately, the multiplier of $z$ in $\Psi_A(z)$ lies in $[-M_0,0]$. Adding $M_0z/2$ and using $\Pi p=0$ gives $C(p)\le M_0\|p\|_2/2$.

The bilinear Hessian of a unit atom has norm at most $2\sqrt{s}$ by [the atom calculation, §5](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md). Its exact half-moment is $\int\sqrt{s}\,\nu_A(ds)=2/(3\sqrt\pi a^2)$ by [the positive kernel representation, equation (4.1)](../raw-content-2026-11-17-gemini-5331/PROOF.md). Thus $H=4/(3\sqrt\pi a^2)$ bounds $\|D^2\Psi_A\|$ and $kH=5/(4a^2)$.

Put $e=\|h\|_2^2$. In the expansion of $C(p+h)^2$ the squared change of projection costs at most $L^2 e$. The cross term equals twice the real pairing of $c_0$ with the second-order Taylor remainder, by the first-variation cancellation. This costs at most $H\mathbb E|c_0||h|^2\le kH C(p)e$. Orthogonality gives $\|p+h\|_2^2=\|p\|_2^2+e$.

## Deficit and exact budget

All three rows satisfy $\phi'(0)\le d=1432/1000$. Indeed $\phi'(0)=\int_0^\infty e^{-r^2}/(a+br^2)\,dr$ decreases in each parameter, and the peak row has the smallest $a,b$. Concavity of $\phi$ gives $D^2\Phi(z)[h,h]\le2d|h|^2$. The variance-mixture formula and Jensen give
$$B'(v)\ge\frac{\sqrt\pi}{2\sqrt{a^2+4ab+6b^2+463/10000}}\quad(0\le v\le463/10000).$$
These formulas and the outward peak bound come from [§§2 and 6 of the kernel proof](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md). With any lower bound $\beta$ on this slope, Taylor's theorem and the payoff cancellation give $D(p+h)\ge D_0-(d-\beta)e$.

Consequently the full adaptive criterion, with $K=6/25$, is
$$e\left[L^2+\frac{5}{4a^2}\min\!\left(\sqrt{\kappa D_0},\frac{M_0\|p\|_2}{2}\right)+K(d-\beta)\right]\le(K-\kappa)D_0.$$
The table uses $\|p\|_2\le\sqrt{463/10000}$. The [exact replay](../../code/mixed-driver-sign-perturbation-codex-a7c4/verify.py) reads the audited rational bounds on each mass, bounds $2e^{-3/2}<447/1000$ by the degree-seven exponential series, and rounds the square roots outwards using integers. It checks both sides of the integer rounding boundary in each cell of the table. From the repository root run `python3 -IB -O research/conjecture-K/code/mixed-driver-sign-perturbation-codex-a7c4/verify.py`. To regenerate the inherited moment bounds run `python3 -IB research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py`.

## Mixed drivers and the A-shell

Negate a specified driver block. The entire one-driver core $p=X[c(|X|^2-2)+P(Y)]+\bar XH(Y)$ is odd. Its two driver characters can both occur, so on the specified block it can fail the charge-one assumption of 6.3.9b. An arbitrary even cubic $h$ can contain $(|X|^2-1)V(Y)$, $X^2\overline{W(Y)}$, and a bath-only cubic together. [Ledger 6.3.16](../mixed-driver-folding-codex-a7c4/PROOF.md) supplies $\kappa=47/200$, or $11/50$ if the core Wick share is at least $1/16$. Both estimates require the **core** energy $\|p\|_2^2$ in $[551/100000,463/10000]$.

The many-driver class $p=\sum_j(X_jP_j+\bar X_jH_j)$ is also odd under joint negation of its drivers. [Ledger 6.3.16a](../mixed-driver-blocks-codex-a7c4/PROOF.md) gives $47/200$ on the same core energy band. Conversely $p=(|X|^2-1)V(Y)+X^2\overline{W(Y)}$ is even under negation of $X$ and lies in 6.3.16a using $Y$ as the drivers. Thus all odd $h$ can perturb this core under the stated budget; the coefficients may share coordinates.

For an explicit simultaneous mixture take independent standard proper $X,Y$ and
$$p=[X(|Y|^2-1)+\bar X Y^2]/10,\qquad h=Y(|Y|^2-2)/5000.$$
The core has energy $u_0=3/100$ by Wick orthogonality. With $Y=(G+iH)/\sqrt2$, its folded variance is $V=[(G^2-1)^2+G^2H^2]/100$. On $|G|,|H|\le1/2$, $V\le17/1600$. Each real Gaussian interval has mass at least $e^{-1/8}/\sqrt{2\pi}>1/3$, by $e^{-1/8}\ge7/8$ and $\pi<22/7$. On $[0,u_0]$, $-B''>1$ on each row by monotonicity and the tail comparison in [6.3.16a](../mixed-driver-blocks-codex-a7c4/PROOF.md). Therefore the tangent gap at $V$ is at least $(u_0-V)^2/2$ on this event and nonnegative everywhere. It follows that $D_0>(31/1600)^2/18$, whereas $e=2/5000^2<D_0/167$. This checks all hypotheses directly for a cubic having both driver charges and a bath-only perturbation.

For every remote Gaussian linear $U$ with $\|U\|_2^2\le113/10000$, [the shell cost, 6.2.1–6.2.3](../../STATUS.md) now yields $\Lambda(p+h+(T-1)U)\le S$. For the unperturbed $47/200$ core, completion of the same square gives $\Lambda(p+(T-1)U)\le S-D_0/48$, since $1-(47/200)/(6/25)=1/48$. Comparable energies of the opposing components at intermediate kurtosis and unrestricted Conjecture K remain open. The resulting estimates are research results; no Lean theorem or published Grothendieck endpoint changes.
