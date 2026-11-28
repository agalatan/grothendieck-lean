# A second price for the lower peak shoulder

Agent-ID: codex-a7c4. Task #795. Fix $\varepsilon=.752$. For every actual six-sector response with $.82815\le t\le .8297$, the 8.13(ii) witness is below $.713245-10^{-6}$. This joins the [unrestricted single-price interval](PROOF.md). The individual visible profile may depend on the response's energies and fourth moment. Those are deterministic parameters of the response fixed before choosing the trial in row 2.1.

Use $p_0=2500/1891$ and $p_1=1.316$. For each candidate $p$, let $\mu=\varepsilon p$ and use $(\ell,\beta)=\mu(\ell_0,\beta_0)$. In this paragraph, $u,V,W$ denote the remote, even and odd squared energies of the same physical response, each divided by $\mu^2$. Write $J(q)=2E|L+q|$, $O$ for all odd sectors and $E$ for both even sectors. Let $G(u,\chi,v)$ denote the joint upper on the even gain in the [single-price proof](PROOF.md), including its two square penalties and shared fourth-moment terms. Thus 7.5.13 gives the paired norm plus unit trial cost at most $J(q)+p_0(V+W)+G(u,\chi,V)$. Row 7.2.10 gives $J(q+O)\le J(q)+(32/25)W$ at zero trial, for all odd fields and all remote energies. [Joint pointwise trial](../global-all-sector-gemini-c1de/PROOF.md) · [All-energy odd estimate](../odd-cubic-core-2026-11-15/PROOF.md)

Keep $q$ and $O$ identical in the two arms. Convexity of the paired norms permits combining $q+E/\theta+O$ at its joint trial $\xi$ with $q+O$ at zero trial, with respective weights $\theta,1-\theta$. Take the physical trial $\mu\theta\xi$. After dividing the paired norms by $\mu$, its squared cost is $\mu\theta^2\|\xi\|^2\le\theta\|\xi\|^2$, since both scales are below one. Subtract the physical response price and write $b=32/25$. The resulting normalized contribution is at most
$$
[J(q)-p_0u]+(p_0-p)u+\theta G(u,\chi,V/\theta^2)
 +(p_0/\theta-p)V+(\theta p_0+(1-\theta)b-p)W .
$$
For $p=p_0$ use $\theta=1$. For $p=p_1$ one may use either $\theta=1$ or $(p_1-b)/(p_0-b)\in(0,1)$; the latter cancels the odd price exactly. For either choice the normalized contribution enters the physical row with multiplier $\mu$ and explicit outer term $t^2-2\mu\ell_0t+2(\mu\beta_0)^2/\varepsilon$.

For each price, put $H_p=(\pi_{\rm hi}/4-.82815^2)/p^2$. The unreduced response ellipsoid 2.12b gives
$$
W\le H_p-u/2-2V/3,\qquad
\|r_B\|^2\le M=3H_p/2-3u/4-V .
$$
Inside the joint arm divide both even drivers by $\theta$. Let $v$ be their energy there. An upper bound $M'$ on that arm's B energy gives $r_{\min}=(\sqrt{(v-M')_+}-.5053\sqrt{M'})_+\le\|R\|$ by the reverse triangle inequality. On a shell rectangle the replay uses the lower endpoint of $v$ in the square root and the upper endpoint of $M'$. With $a=C+\rho e/d$ this improves the completed square $a^2/.23$ by subtracting $.23(r_{\min}-a/.23)_+^2$. Both bounds are necessary inequalities for the same physical response, and each use only reduces an upper bound on a distinct term. [Full weighted ellipsoid in the monograph](../../MONOGRAPH.md)

The finite cover uses the $p_0$ coordinates to label each response just once. In testing any other price it multiplies the two energies and the ellipsoid radius by $(p_0/p)^2$; $\chi$ is invariant. It uses the 91 checked spectral duals, all ten checked Hermite bounds and the same two score barriers as the single-price proof. It splits at transformed energy nodes before interpolating. Each $(u,\chi,V)$ cell must admit a single price and trial giving a uniform bound throughout it. Bisections include both endpoints. The 641 energy/shape cells certify physical clearance greater than $1.0177\cdot10^{-6}$ and removing the second price causes an energy/shape cell to fail. [Exact replay](../../code/uncapped-peak-consumer-codex-a7c4/lower_shoulder.py)

```sh
python3 -IB research/conjecture-K/code/uncapped-peak-consumer-codex-a7c4/lower_shoulder.py
```
