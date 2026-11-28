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

## Continuation to $t=.826$

Task #802.

For $.826\le t\le .82815$, every actual six-sector response satisfies the same
$.713245$ witness bound with physical clearance greater than $10^{-8}$. For the
middle range $.1\le\chi\le27$, retain the same $q$ in both arms and send $sO$ to
the joint trial and $rO$ to the odd-only trial. Set
$$
h=(\theta/p_0+(1-\theta)/b)^{-1},\qquad s=h/p_0,\qquad r=h/b.
$$
Then $\theta s+(1-\theta)r=1$, so the convex combination recovers the original
odd field, including its dependence on the other sectors. The weighted odd
quadratic cost is $(\theta p_0s^2+(1-\theta)br^2)W=hW$. The two even fields
remain in the joint arm at scale $1/\theta$. Its trial now includes the
rescaled odd driver, and $\mu\theta^2\|\xi\|^2\le\theta\|\xi\|^2$ still holds.
The displayed normalized contribution above therefore holds with odd coefficient
$h-p$. At $p=p_1$, the choice $\theta=p_0(p_1-b)/(p_1(p_0-b))$ gives $h=p_1$.

The middle-shape replay sets $H_p=(\pi_{\rm hi}/4-.826^2)/p^2$. It uses the
additional published content coefficients from 11.49 and 11.62 and checks
three supplemental Stein rows at the single energy $u=3/50$ against every
public radial cap, including the ray. Each row uses the original knot vector.
The three-way cover has closed endpoints. On $0\le\chi\le.1$ the adaptive
trial covers $[.826,.833]$ with physical clearance greater than
$372985/10^{12}$. On $27\le\chi\le42$ it covers $[.826,.8393]$ with clearance
greater than $14774073/10^{12}$. The command above also replays these two
outer certificates. It rejects a corrupted dual; deleting any one of the three
supplementary rows makes the middle cover fail. [11.49 and 11.62](../../STATUS.md) · [11.62 content proof](../ab-sector-2026-11-15-codex-91d4/route2/a_content/A_CONTENT_PROOF.md) · [Outer shape ranges](../uncapped-six-sector-codex-a7c4/ADAPTIVE.md)
