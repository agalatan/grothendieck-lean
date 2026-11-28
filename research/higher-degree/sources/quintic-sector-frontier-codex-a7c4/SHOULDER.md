# An all-sector amplitude extension from individually priced support budgets

Agent-ID: codex-a7c4. For the capped degree-five game with $(\epsilon,\eta)=(39/50,779/10000)$ and threshold $v=10000/14023-10^{-5}$, the real payoff is strictly below $v$ on $0.4173\le t\le0.420$ in every finite dimension, for the full six-sector response. This extends the amplitude conclusion from the six support profiles of [#867](https://github.com/agalatan/grothendieck-lean/pull/867). It does not by itself give a new global Grothendieck constant.

Run `python3 -IB shoulder.py --repo /path/to/grothendieck-lean`. It replays the full source verifier in `quintic-product-support-codex-a7c4/product_cover.py`. The remaining inputs are 24 integer triples (radial model, Gram row, and multiplier numerator with denominator 50). No additional Stein potential or polynomial certificate is used. The shared functions `matched_coefficients.coefficients` and `joint_sector.bernstein` also underlie the fixed-amplitude calculation.

**Match the two inequalities before relaxing sector content.** Write $A=\|P_{2,1}k\|^2$ and $s_j=\|P_j k\|^2/A$ for the five nonremote sector fractions. The remote fraction is $1-\sum_j s_j$. Write $K=\|k\|^2$. Under $V\ge v$ a nonnegative radial mass-Gram profile gives
$$
\sum_j d_j s_j\le \epsilon-p_0+\frac{C+(1-h)t^2-v-dK}{A},\qquad d_j=p_j-p_0>0 .
$$
Here $p_0$ is the remote price and $p_j$ is the certified price of the corresponding mixed sector. The same $s_j$ occur in the support of the $(1100,2379,2621)$ ray.

At each endpoint of a certified shape slab, let $B,L_j,H$ be the sector-independent intercept, linear sector prices, and Hölder coefficient for these *normalized physical fractions*. Obtain them from the checked C3 formula, multiplying the ray coefficients by $\beta^2$ and $\beta$, respectively. To recover $B$ from the checked production intercept, undo the symmetric angular reduction and subtract the original explicit C3 sector terms at right-hand sides $(0,\beta^2)$. This preserves the outward rounding of the production intercept. For a chosen rational multiplier $\lambda>0$, take Young prices $a_j=\lambda d_j-L_j>0$. Then the linear part left after the angular estimate is exactly $\lambda\sum_jd_js_j$. Use the smaller of the predecessor’s two angular intercepts on terms $(H\kappa_j)^2/(4a_j)$, and add $B$. Denote the resulting upper intercept by $b$. The Gram debit has the same slope at both endpoints. Thus interpolation in $\chi$ gives $\ell t+\beta\sqrt A\le b(\chi)+\lambda\sum_jd_js_j$ on the closed shape slab, by the original fixed-vector support chord. Different slabs may use different Gram profiles and multipliers.

**Check the entire energy interval.** On a box $[t_0,t_1]\times[y_0,y_1]$ with $y=\sqrt\chi$, the spectral mass witnesses give $K\ge u w-z$ for $w=\sqrt A$. First intersect the unconditional ball/ray upper bounds with the lower bounds on $w$ obtained by inserting every witness into $v\le\eta+(1-\eta)t_1^2+\epsilon w^2-\eta K$. For the remaining energy interval choose one spectral witness valid throughout. On each piece of the shape interval take the larger endpoint value $b_*$ of the relevant affine chord. A necessary inequality is $F(w)\ge0$, where
$$
F(w)=-\beta w^3 +[b_*+\lambda(\epsilon-p_0)-\ell t_0]w^2
      -\lambda d u\,w+\lambda[C+(1-h)t_1^2-v+d z].
$$
Rounding every coefficient upwards preserves necessity because $w\ge0$. On a closed interval $[a,b]$, $F$ lies below the maximum of its four cubic Bernstein coefficients $F(a),F(a)+(b-a)F'(a)/3,F(b)-(b-a)F'(b)/3,F(b)$. Strict negativity rules out all energies there. Splitting in $w$ permits different fixed Gram prices, while an exact split at each rational $\chi$ breakpoint covers both sides of a seam.

The full replay checks $[0,13/2]$ in $y$ (covering $0\le\chi\le42$) together with the prior small-energy case. Each binary split covers both closed children and the exact sum of accepted areas equals the input area. At $t=.4174$, $y=2.569047$, removing the matched prices recovers #867’s failure; the same point now passes.

The verifier reconstructs the prices from `prices.json` and the cited coefficients. The integers were selected by trying positive grid multipliers, ranking them by their implied upper bounds, and pruning to one representative per (radial model, Gram row) pair. Their validity is established by positivity of all five Young prices followed by the exact continuum replay.

The frozen prices also give a quantitative outside control. At $t=.4201$, $y=2.03$ and $A=3403/5000$, choose $K$ to be the largest spectral lower estimate evaluated with an upper enclosure of $\sqrt A$, rounded upwards to $10^{-12}$. The raw payoff is more than $0.0012975$ above the target, the inherited cell proof does not exclude the point, and every applicable matched support upper bound exceeds $\ell t+\beta\sqrt A$ by more than $0.00000952$. This identifies a remaining energy for the fixed matched bounds, without asserting feasibility of a physical response.


At the 1.4023 target the final 24-price table closes the three consecutive strips with 15, 77 and 608 cells. The same prices cover every shape through .4193 at 1.4025 and .4180 at 1.403, with the same payoff reserve. A separate [rank-one quartic estimate](RANK_ONE.md) extends the full shape slab [4.1,5.3] through .4202 at 1.4023. In particular it excludes the example at .4201 with squared shape parameter 2.03². The direct transfer of the stronger KRS501 cubic radius to this witness is tracked in [#870](https://github.com/agalatan/grothendieck-lean/issues/870).
