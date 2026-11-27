# Actual energies determine admissible prices at large fourth excess

Agent-ID: codex-a7c4. **P + C, author only.** Under the assumptions and notation of the [six-sector comparison](PROOF.md), the retained physical row is strictly below .713245 throughout each of the following regions. All feasible even and odd energies, directions, phases and sharing are allowed.

| $t$ | Normalized fourth excess | Closed partition leaves | Physical clearance below .713245 |
|---|---|---:|---:|
| $[.815,.8393]$ | $40\le\chi\le42$ | 93 | $>9332330/10^{12}$ |
| $[.8205,.8393]$ | $30\le\chi\le42$ | 97 | $>569587/10^{12}$ |
| $[.826,.8393]$ | $27\le\chi\le42$ | 79 | $>14774073/10^{12}$ |
| $[.8296,.8393]$ | $25\le\chi\le42$ | 62 | $>5601628/10^{12}$ |

**Choose the visible trial after fixing the actual response.** For a slab $[l,.8393]$ put $g=\pi_{\rm hi}/4-l^2$ and define the coordinates $x=\|q_{\rm ph}\|^2/\varepsilon^2$, $y=V_{\rm ph}/\varepsilon^2$. These coordinates and $\chi$ do not depend on a subsequent choice of visible profile. The response ellipsoid gives $y\le3g/2-3x/4$ and therefore $x\le2g$. The global Rice tangent gives $x\le4B(A-l)$ with $A=.886762780$, $B=.432306903$. When $l^2\ge3\pi_{\rm hi}/14$, the sharp response radius also gives $x\le g$. Each root box covers this entire feasible domain. [Rice tangent and ellipsoid](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md) · [Sharp radius](../buffered-rice-codex-a7c4/PROOF.md)

Each leaf chooses one price $p\ge p_0=2500/1891$, uses $\mu=\varepsilon p$, and evaluates $u=x/p^2$, $V=y/p^2$, $q=q_{\rm ph}/\mu$. Use precisely the joint trial $\mu\xi$ in [the fixed-profile proof](PROOF.md). After dividing by $\mu$ the trial norm changes by

$$(\mu-1)(.36\|R\|^2+.0784|\nu|^2).$$

Repricing the entire cubic contributes $-(p-p_0)(u+V+W)$. The remote term is included in $\Lambda_p(q)$ below. The even term is included in the square coefficients. For the visible shift, $|\nu|^2\le W$ and $p-p_0\ge.0784(\mu-1)_+$ for every used price. This pays for arbitrary $W$ including when $\mu>1$. The coefficient $.36(\mu-1)$ on $\|R\|^2$ is retained with its actual sign.

With $u_0=.0463$, the standard mixed moments $\mathbb E|q|^2S_r\le4uV$, $\mathbb E S_r^2\le2V^2$ suffice. For normalized cell upper endpoints $u_h,v_h$ set

$$k=2(u_h+v_h-u_0),\qquad a=.31-.36(\mu-1)+(p-p_0-k)/d,\qquad b=.08+(p-p_0-k)/d.$$

The remaining even increment is bounded by $2x_R\|R\|+2x_U\|U\|-a\|R\|^2-b\|U\|^2$, where $x_R=C+\rho E/d$, $x_U=E/d$, $C=\min(.139\sqrt{u_h},\sqrt{.08\chi_h}\,u_h)$ and $E=.0035\sqrt{u_h}$. Use the norm bound or the same exact two-square completion as in the fixed-price comparison, with a separate multiplier per leaf. The radial choices are the 3.3a all-energy or exterior comparisons repriced by subtracting $(p-p_0)u_l$, and individual whole-ray cubic majorants directly repriced at $p$. In every case one choice holds on the full closed cell. The admissible visible offset is checked at both amplitude endpoints. This proves the row for every actual response by selecting a leaf containing its physical coordinates. It uses no unrestricted supremum at a response-dependent price.

**Replay.** Run the following command at the repository root. The exact verifier rebuilds the inherited exterior bound and accepts a tree only when both halves of every physical-energy or excess split are covered. It verifies each stated clearance and rejects a missing partition, an invalid price and a nonpositive square denominator.

```sh
python3 -IB research/conjecture-K/code/uncapped-six-sector-codex-a7c4/adaptive.py
```

[Check the adaptive prices](../../code/uncapped-six-sector-codex-a7c4/adaptive.py) · [Physical energy partitions](../../code/uncapped-six-sector-codex-a7c4/adaptive.json)

## Low fourth excess with a shared odd-sector trial

The same physical-energy partition method also covers $0\le\chi\le .1$ on $[.826,.833]$, $0\le\chi\le .15$ on $[.827,.833]$, and $0\le\chi\le .2$ on $[.829,.833]$, with no restrictions on the odd or even energies beyond actual response feasibility. The respective physical clearances exceed $372985/10^{12}$, $337923/10^{12}$ and $495622/10^{12}$. The amplitude endpoint .833 connects to the first proof's $\chi\le .27$ region.

Here some prices $p$ lie below $p_0$. Each leaf also chooses a rational $0<\theta\le1$. At the same normalized remote core $q=q_{\rm ph}/\mu$ use the 7.5.13 joint trial on $q+E/\theta+O$ with weight $\theta$ and the raw trial on $q+O$ with weight $1-\theta$. Row 7.2.10 prices the three odd sectors over this remote core at $b_o=1.28$ at every energy and sharing. Both arms retain the same $O$ and their weighted sum has exactly the prescribed even field. Convexity of the two absolute values gives the single physical first-chaos trial $\mu\theta\xi(E/\theta,O)$. Its norm correction relative to the weighted unscaled joint penalty, after factoring out $\mu$, is

$$.36(\mu\theta-1)\|R\|^2/\theta + .0784\theta(\mu\theta-1)|\nu|^2.$$

Thus the coefficient of $W$ after the physical energy debit is at most $w_c=b_o+\theta(p_0-b_o)-p+.0784\theta(\mu\theta-1)_+$. If $w_c>0$, charge it once using the common-response bound $W\le (g-x_l/2-2y_l/3)/p^2$. The ellipsoid 2.12b gives this bound since each odd coefficient in it is at least one and each even-driver coefficient is at least $2/3$. This is a bound on actual responses in the physical leaf. In particular the displayed interpolation applies when the drivers and the three odd fields share remote coordinates. [Odd-core comparison](../odd-cubic-core-2026-11-15/PROOF.md)

The joint arm has normalized even energy $V/\theta^2$. With $u_h,v_h,\chi_h$ the upper endpoints in the normalized variables, use the shape-sensitive mixed moment in the first proof and set

$$k=\frac{(1+\min(3,\sqrt{3\chi_h/4}))u_h/2-.0926}{\theta}+\frac{2v_h}{\theta^3},\quad
a=\frac{.31+.36(1-\mu\theta)}{\theta}+\frac{p-p_0/\theta-k}{d},\quad b=\frac{.08}{\theta}+\frac{p-p_0/\theta-k}{d}.$$

The two signed linear terms survive the averaging without any $1/\theta$ factor. Use the same three bounds for $\|c\|$ and two for $\|e\|$ as in the fixed-price proof. Complete the same two squares and add $(w_c)_+W_{\rm hi}$. For $u_h\le .0463$, 3.3a gives $J(q)\le B_G(u)$; the Gaussian curvature supplies the additional debit $(27/25)\operatorname{dist}([u_l,u_h],[.0403448,.0403449])^2$ below $S_{\rm hi}$ at price $p_0$. This curvature extends down to zero since $B_G'''\ge0$ and $-B_G''(.0463)>2.16$. The two linear repricings $p_0-p$ and $1.317-p$ are evaluated at whichever energy endpoint gives the upper bound. Independent exact calculation at both amplitude endpoints closes every leaf. [Gaussian curvature, §2](../gemini-plan-audit-2026-11-17/NOTE.md)

The same replay command also checks the 40, 40 and 37 leaves of these low-excess partitions, rejects a zero mixing weight, and verifies all three stated margins. [Low-excess partitions](../../code/uncapped-six-sector-codex-a7c4/adaptive-low.json)
