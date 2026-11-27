# Exact priced remote Conjecture K at the peak

**P + C, author only.** Fix $L=Z(699/1250+(179/1250)|Z|^2)$ and put $B(u)=2\mathbb E|L+\sqrt u W|$ for a fresh standard proper complex Gaussian $W$. For every price $p\ge1317/1000$, let
$$
S(p)=\sup_{v\ge0}\{B(v)-pv\},\qquad
\Lambda_p(q)=2\mathbb E|L+q|-p\,\mathbb E|q|^2 .
$$
Then $\sup_q\Lambda_p(q)=S(p)$ over independent remote circular $(2,1)$ cubics in all finite dimensions. Every nonzero finite cubic satisfies $\Lambda_p(q)<S(p)$. The usual peak price $2500/1891$ is inside this range.

**Inside the response band.** Write $u=\mathbb E|q|^2$. If $0<u\le463/10000$, the [same-variance theorem](PROOF.md) gives $2\mathbb E|L+q|<B(u)$ for every tensor and every dimension. At $u=0$, $\Lambda_p(0)=B(0)\le S(p)$ follows from the definition.

**Exterior energies.** Let $p_*=1317/1000$, $v_*=213/5000$ and $J=B_{\rm lo}(v_*)-p_*v_*$. Here $B_{\rm lo}$ is the certified lower polynomial in the same-variance theorem. The [rational verifier](../../code/peak-remote-deficit-codex-a7c4/verify_peak.py) proves
$$
2\mathbb E|L+q|-p_*u < J-\frac{131649}{10^{12}}
\qquad (u\ge463/10000).
$$

1. On $[463/10000,3/20]$ intersect the 154 archived exterior boxes with this energy interval. The 66 nonempty intersections tile its product with $0\le y\le31/4$, where $y=\sqrt\chi$ and $\chi\le42$. Each box has its own previously certified whole-line cubic Hermite majorant $P$ of $z\mapsto2\mathbb E|L+\sqrt z|$. Its coefficients were enclosed from the value and derivative of the profile at both interpolation nodes. The sign of the fourth derivative proves the Hermite upper bound on the entire nonnegative ray. These exterior majorants are an input from ledger 3.3, separately from the ten new majorants. [Archived checks](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/verify.py) · [Exterior inputs](../../code/audit-2026-11-15-codex-a7c4/remote_stein_original/moment-boxes.json)
2. For $P=c_0+c_1z+c_2z^2+c_3z^3$ use $\mathbb E|q|^4=(2+\chi)u^2$ and $\mathbb E|q|^6\le(6+9\chi+C\chi^{3/2})u^3$, $C=4045313/100000$. The leading coefficient $c_3>0$ preserves the upper bound. The resulting cost is convex in $\chi$. Take both endpoint values $y^2$ from each box, then bound the residual polynomial in $u$ by its Bernstein coefficients. An exact strip sweep checks that every pair of energy and shape coordinates is covered.
3. For $u\ge3/20$, the visible variance mixture makes $V(z)=2\mathbb E|L+\sqrt z|$ concave, since each Gaussian Rice component is concave in $z$. Thus $\mathbb E V(|q|^2)\le V(u)$. Price the 53 archived profile intervals that meet $[3/20,2]$. Beyond 2 the affine cap has slope below $p_*$. Its priced maximum occurs at 2. The Bernstein and affine endpoint bounds give the displayed strict reserve on both pieces.

For $p\ge p_*$ the clearance against the competitor $B_{\rm lo}(v_*)-pv_*$ increases by $(p-p_*)(u-v_*)\ge0$ on the exterior. This proves the upper bound at every energy. Conversely take independent copies of the unit cubic $A B\overline C$ on disjoint triples of standard proper complex Gaussians. Their normalized sums converge in law to $W$ by the two-dimensional central limit theorem. Their common second moment gives uniform integrability of the absolute-value payoffs. At every fixed $v$, multiplying these sums by $\sqrt v$ therefore approaches $B(v)-pv$. Taking the supremum establishes equality.

**Odd sectors.** With both linear drivers $r_A=r_B=0$, write $O=ZQ+\overline ZP+\nu Z(|Z|^2-2)/\sqrt2$. Here $q,Q,P$ are jointly independent of $Z$, $\mathbb E Q=0$, and $\nu$ is constant. The three odd sectors may share remote coordinates arbitrarily. For the raw functional $\Lambda_p(G)=\mathbb E(|L+G|+|L-G|)-p\|G\|_2^2$, the price-independent estimate 7.2.10 and orthogonality of $q$ and $O$ give
$$
\Lambda_p(q+O)\le S(p)-(p-32/25)\|O\|_2^2 .
$$
At the original peak price the coefficient is $1988/47275$. Setting $O=0$ shows that the supremum over this entire family is $S(p)$. [Odd-core matrix theorem](../odd-cubic-core-2026-11-15/PROOF.md)

For the retained A-shell the existing tilted bound 11.51 gives $\widehat\Lambda(q+(|Z|^2-1)r)\le S+5673/295045000$ on its peak domain $u\le463/10000$. Indeed the positive part in its input equals $D(q)$ throughout this band, so the total is bounded by $B(u)-pu-(1-52948/59009)D(q)+5673/295045000$. Arbitrary $A,B$ jointly with odd sectors still require the coupled estimates. Moving to a different visible profile also changes the radial inputs of this proof.
