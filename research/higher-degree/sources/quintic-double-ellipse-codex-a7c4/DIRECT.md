# Matching a direct spiked-cubic support inequality to all five visible sectors

Agent-ID: codex-a7c4. Use the degree-five capped witness, its physical energy $A=\|P_{2,1}k\|_2^2$, total mass $K=\|k\|_2^2$, and the amplitude $t=\|P_{1,0}h\|_2$. Write $s_i$ for the five visible fractions of $Q=P_{2,1}k/\sqrt A$, ordered $11,20,10,01,21$, and $y=\sqrt{\mathbb E|Q|^4-2}$. With $C_*=10000/14023-10^{-5}$, the physical payoff is strictly below $C_*$ whenever

- $.46050\le t\le .46052$ with arbitrary shape, or
- $.46\le t\le .48$ and $0\le y\le .72$.

These conclusions hold for every sector distribution in every finite dimension. The first extends the interval beginning at zero via the predecessor [degree-five certificate](TILTED.md).

Assume $V\ge C_*$. The exact step–Gram profiles of `quintic-double-ellipse-codex-a7c4` give

$$A\sum_i d_i s_i \le C+(1-h)t^2+(\epsilon-p)A-dK-C_*,$$

with the five individual prices $d_i=p_i-p>0$. Each of the nine Gram profiles also satisfies $d\ge0$ and $1-h\ge0$, as checked directly. Its terminal payoff bound may therefore deduct $\min_i d_i\,(A_{\rm lo}+t_{\rm lo}^2-\rho^2)_+$ by the independent remote cubic support inequality. In the direct support test put $(\ell,\beta)=(28,45)/53$ and use the frozen $[0,1]$ fourth-excess slab of `spiked-cubic-radius-gemini-4c4c/cert_spiked.json`. Then $\ell t+\beta\sqrt A\le \phi(\ell,\beta Q)$. The direct Stein proof's checked C3 majorant, before pricing its five sector energies $e_i=\beta^2s_i$, has five linear coefficients $L_i$ and the Hölder contribution $H$. Given $\lambda>0$ with all $a_i=\lambda d_i-L_i>0$, Young's inequality absorbs the linear contributions into $\lambda\sum_i d_i e_i$. Its constant is at most the angular symmetric-product intercept of `quintic-product-support-codex-a7c4/p7_product.py`, applied to $(H\kappa_i)^2/(4a_i)$. The same absorption works over the slab by the C3 endpoint chord used by the upstream verifier. The resulting support upper bound is $r(\chi)+\lambda\beta^2\sum_i d_i s_i$. Its intercept $r$ uses only the potential and contraction bounds checked by the upstream C1/C2/C3 Sturm verifier. The replay replaces the old C3 sector contribution after computing it with a zero sector dual. The certificate uses the exact revised intercepts and rounds the polynomial coefficients upward.

Put $x=\sqrt A$, substitute the Gram upper bound above and multiply by $x^2$. A spectral mass witness $K\ge ux-v$ then gives the cubic upper bound

$$\lambda\beta^2(C+(1-h)t^2-C_*+dv)-\lambda\beta^2du x+[r(\chi)+\lambda\beta^2(\epsilon-p)-\ell t]x^2-\beta x^3.$$

A strictly negative cubic excludes that violating response. On each closed parameter box use outward endpoint prices, the inherited two-amplitude elliptic energy interval, and the four cubic Bernstein coefficients on each energy subinterval. Direct tests combine with the original shape certificate and the raw mass/Gram payoff bounds. Bisection retains both closed children and checks their total area. Exactly 85 boxes close the unrestricted strip and 30 close the shaped rectangle. Even retaining all nine Gram profiles and the same two carrier tests, dropping the direct support reopens the comparison at $(t,y)=(.46051,.701)$.

Replay `python3 -IB -O research/higher-degree/code/quintic-double-ellipse-codex-a7c4/direct.py` with `research/higher-degree/code/quintic-double-ellipse-codex-a7c4` available (checked at commit `673204bc5d3ea9f38173401e2124532d587f890a`). The original P7 certificate, the degree-five spectral data, and the existing step–Gram inputs suffice.

The same comparison covers every $0\le t\le .47$ for $\chi\le .7056$: the extension from $.4605$ through $.47$ takes 20 closed cells and joins the unrestricted prefix. At $t=.46053$ and $\sqrt\chi=1.232$ the two- and three-amplitude majorants both exceed $C_*$ by more than $1024217/10^{12}$. The direct estimate also admits an unresolved energy there. Its $[0,1]$ fourth-excess slab excludes that shape. This is an explicit failure of the certified relaxation. The physical inequality there is open.
