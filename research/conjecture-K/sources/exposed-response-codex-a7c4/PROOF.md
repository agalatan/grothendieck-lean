# A response-square estimate near the remote energy maximum

Agent-ID: codex-a7c4. **P + C, author only.** Set $\varepsilon=94/125$, $R=\sqrt\pi/2$ and $H=(|Z|^2-2)Z/\sqrt2$ for a standard proper complex Gaussian $Z$. For an actual response $|f_\pm|\le1$, put $h=(f_++f_-)/2$, $k=(f_+-f_-)/2$, and rotate so $P_{1,0}h=tZ$. Write $e$ for the squared norm of the remote part of $\varepsilon P_{2,1}k$.

**Theorem.** The true cubic-witness objective is strictly below $713245/10^6$ on each of the following closed portions of the actual-response domain. There is no restriction on dimension, even or odd driver energy, or sharing of the remote coordinates. Write $D(t)=\varepsilon^2(R^2-t^2)$ for the sharp remote energy supremum on these intervals.

| Visible amplitude | Physical remote energy | Clearance in millionths, rounded down |
|---|---|---:|
| $0.8366\le t\le0.8372$ | $D(t)-3\cdot10^{-7}\le e\le D(t)$ | 3.072115 |
| $0.8368\le t\le0.8372$ | $D(t)-10^{-6}\le e\le D(t)$ | 4.736222 |

In particular $(t,e)=(0.8368,0.0481605)$ belongs to both portions. This calculation spends the square available from the *actual* response. The separate [unrestricted estimate](../uncapped-peak-consumer-codex-a7c4/PROOF.md) also covers smaller remote energies at these amplitudes.

## A support inequality at arbitrary amplitude and energy

For $e>0$ write the remote projection as $\sqrt e\,q$ with $\|q\|_2=1$. The cubic $q$ is independent of $Z$. Fix any $a\ge0$, let $s=a^2$, $X_\pm=Z\pm a q$, $B_q(s)=\mathbb E|Z+a q|$, and put
$$\sigma=B_q(s)-t-a\sqrt e/\varepsilon.$$
The real part of the average of $\mathbb E[\overline{X_\pm} f_\pm]$ is $t+a\sqrt e/\varepsilon$ by orthogonality of the two projections. Both moduli have the same mean by symmetry of $Z$. Thus $\sigma\ge0$. Write $\operatorname{ph}(w)=w/|w|$ off zero, and set its value to zero at zero. For $|f|\le1$ we have $|w||f-\operatorname{ph}(w)|^2\le2(|w|-\operatorname{Re}(\bar w f))$. Cauchy–Schwarz under the product of the probability law and the uniform two-sign measure gives
$$\operatorname{Re}\langle H,h\rangle\ge C_q(s)-\sqrt{(7/2)\sigma},\qquad
 C_q(s)=\operatorname{Re}\mathbb E[\bar H\,\operatorname{ph}(Z+a q)]. \tag{1}$$
Here the two signs yield the same averaged score since the scalar Gaussian score below depends only on the shift magnitude.

For the factor $7/2$, condition on the remote field. For any deterministic shift $b$, the density of $|H(z)|^2\,d\gamma(z)$ is $x(x-2)^2e^{-x}/(2\pi)$ at $x=|z|^2$. Its supremum is at most $3/(8\pi)$. Indeed the positive maxima can only be at the two roots of $x^2-5x+2=0$, which are in $[.43,.45]$ and $[4.55,4.57]$. On each interval $[l,r]$, $r\max(|l-2|,|r-2|)^2<\tfrac34\sum_{j=0}^5 l^j/j!$. Integrating $|z+b|^{-1}$ over its translated unit disk thus costs at most $3/4$. On the exterior $|z+b|^{-1}\le1$ and $\mathbb E|H|^2=1$. This proves $\mathbb E[|H|^2/|Z+b|]\le7/4$ uniformly and justifies (1) also when the shift vanishes.

To compute the score, fix $b\in\mathbb C$ and $v>0$, let $Y=\sqrt v Z$, and write
$$F(v)=\frac1v\mathbb E[\bar Y\operatorname{ph}(Y+b)]=\frac12\mathbb E|Y+b|^{-1}.$$
The second identity is Gaussian integration by parts with $\partial_z\operatorname{ph}(z)=1/(2|z|)$, locally integrable in two real dimensions. It also follows by smoothing the phase or excising a disk whose boundary term vanishes with its radius. Differentiating the integral on the left with density $(\pi v^2)^{-1}\bar y e^{-|y|^2/v}$ at $v=1$ gives $F'(1)=\mathbb E[(|Z|^2-2)\bar Z\operatorname{ph}(Z+b)]$. On the right use the Laplace integral for the inverse square root and $\mathbb E e^{-w|Y+b|^2}=(1+vw)^{-1}\exp(-w|b|^2/(1+vw))$. Substituting $T=vw/(1+vw)$ yields $F(v)=Rv^{-1/2}\mathbb E_T e^{-|b|^2 T/v}$, $T\sim\operatorname{Beta}(1/2,1/2)$. Differentiation under this finite measure is valid at fixed $b$. Consequently
$$C_q(s)=\frac R{\sqrt2}\mathbb E[(z-1/2)e^{-z}],\qquad z=s|q|^2T,$$
with $T$ independent. For all $z\ge0$, $(z-1/2)e^{-z}\ge-1/2+3z/2-5z^2/4$, using $1-z\le e^{-z}\le1-z+z^2/2$. The first two moments of $T$ are $1/2,3/8$. For $\chi=\mathbb E|q|^4-2$ this gives
$$C_q(s)\ge c(s,\chi)=\frac R{\sqrt2}\left[-\frac12+\frac{3s}{4}-\frac{15}{32}(2+\chi)s^2\right]. \tag{2}$$

At any real visible cubic parameter $\beta$, the discarded square compatible with the retained first-chaos trial is $\varepsilon\|P_{2,1}h+(\sqrt2\beta/\varepsilon)H\|^2$. By projecting onto the unit vector $H$, (1)–(2) give the lower bound
$$\varepsilon\left(c(s,\chi)-\sqrt{(7/2)\sigma}+\sqrt2\beta/\varepsilon\right)_+^2. \tag{3}$$
Equations (1)–(3) apply to all $t,e>0$ and all $s\ge0$. The same support calculation holds at $e=0$ by choosing any remote unit cubic orthogonal to $k$ when such a direction is present. The numerical theorem uses positive $e$ only. The first-chaos trial spends the separate $k$-square. [Retained square allocation](../response-penalty-2026-11-15-codex-9b17/ALLOCATION.md)

## Controlling shape at near-extremal energy

Take a closed amplitude slab $[l,r]$ and thickness $w$, and choose one rational $a$ by rounding down $\sqrt{\pi_{\rm lo}/4-m^2}/m$ at $m=(l+r)/2$. All slabs have $.120\le s=a^2\le.123$. The buffered Rice theorem gives $B_q(s)\le R\sqrt{1+s}$. Since $e\ge D(t)-w$, the resulting upper bound for $\sigma$ on the slab is
$$\bar\sigma=R\sqrt{1+s}-\min_{t\in\{l,r\}}\left(t+a\sqrt{R^2-t^2-w/\varepsilon^2}\right).$$
The minimized function is concave throughout each slab. The replay rounds outward. Over the two tubes $\bar\sigma$ is at most $0.317209$ and $1.056794$ millionths, respectively.

Write $y=\sqrt\chi$. For the entire interval $.120\le s\le.123$ and $.1\le y\le\sqrt{42}$ the buffered Rice proof gives $R\sqrt{1+s}-B_q(s)>3.504998\cdot10^{-6}$. The replay evaluates its equation (4) on 1,024 closed subdivisions of $.1\le y\le1$, and its equation (5) against the Gaussian tangent gap on 1,024 subdivisions of $1\le y\le7$. The second bound uses the factor $Rs^2/16$ and divides the cross-multiplied difference by its positive denominator. This deficit exceeds the room above $t+a\sqrt e/\varepsilon$ on both tubes, contradicting $\sigma\ge0$. Thus every actual response in the theorem satisfies $\chi<.01$, which we use in (2). [Buffered Rice estimates and sharp physical radius](../buffered-rice-codex-a7c4/PROOF.md)

## The six-sector bound

For each slab enclose $e$ by $e_l=\varepsilon^2(\pi_{\rm lo}/4-r^2)-w$ and $e_h=\varepsilon^2(\pi_{\rm hi}/4-l^2)$. The ellipsoid 2.12b gives $3e/4+V\le3e_h/2$ for the physical even energy $V$, hence $V\le V_h=3e_h/2-3e_l/4$. Set $E_0=.0463$ and $K_0=.080051$. With upward square-root rounding, take $\mu_1=\sqrt{e_h/E_0}$ and $\mu_2=\max(\mu_1,\sqrt{(e_h+V_h)/K_0})$. Use $\mu_1$ if $e+V\le\mu_1^2K_0$ and $\mu_2$ otherwise. Both normalized energies $u=e/\mu^2$ and $u+v=(e+V)/\mu^2$ meet the respective caps. On the second layer $V\ge\max(0,\mu_1^2K_0-e_h)$. [Response ellipsoid](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md)

At $(\ell,\beta)=\mu(.8456,.1432)$ use the fixed KAST trial $\mu\xi_*$, with $\xi_*=-.6(r_A+.5053r_B)-.28\nu Z$ in normalized units. KAST's signed fixed-trial proof bounds the unscaled trial by $S$ on $.0456\le u\le.0463$, which holds throughout the first layer, and by $S+27\cdot10^{-6}$ throughout the second layer. Here $S\le1.3739535256616$. Repricing this trial at fixed $\varepsilon$ costs $(\mu-1)\|\xi_*\|^2-p(u+v+v_{\rm odd})$ in the normalized functional, where $p=\mu/\varepsilon-2500/1891$ and $v_{\rm odd}$ is the normalized odd energy. From $\|\xi_*\|^2\le.452(v+v_{\rm odd})$ and $z=p-.452\max(0,\mu-1)\ge0$ its cost is at most $-pu-zv$ for arbitrary odd energy. [KAST fixed trial, §§1.2–2.2](../all-sector-transfer-gemini-c1de/PROOF.md) · [Repricing and benchmark](../priced-peak-consumer-codex-a7c4/PROOF.md)

Write $M$ for the applicable fixed-trial cap and $V_l$ for the physical lower even-energy bound on the chosen layer. The actual row is bounded by
$$\max_{t\in\{l,r\}}(t^2-2\mu\ell_0t)+2(\mu\beta_0)^2/\varepsilon
+\mu(M-pe_l/\mu^2-zV_l/\mu^2)
-\varepsilon\left(c(s,.01)-\sqrt{(7/2)\bar\sigma}+\sqrt2\mu\beta_0/\varepsilon\right)_+^2.$$
The visible quadratic is convex. The checker subdivides each closed amplitude interval into slabs of length $.00001$, computes both prices and both squared offsets, and compares with $713245/10^6$. Removing the offset fails the first theorem's clearance test. The cases $e<D(t)-w$ are outside this computation.

The standard-library checker uses exact rational operations, outward square roots, a Machin enclosure for $\pi$ and the two public buffered Rice interval formulas. It consumes the stated KAST theorem; the linked KAST package contains its numerical certificates. From the repository root run `python3 -IB research/conjecture-K/code/exposed-response-codex-a7c4/verify.py`. All comparisons also run under `-O`. [Exact replay](../../code/exposed-response-codex-a7c4/verify.py)
