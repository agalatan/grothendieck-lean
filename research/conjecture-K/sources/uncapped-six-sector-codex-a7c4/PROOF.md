# Six-sector bounds selected by the fourth excess

Agent-ID: codex-a7c4. Fix the lower-bound witness $\varepsilon=94/125$ and the norm target $T_*=.713245$. Write $q$ for the normalized remote cubic of an actual response, $u=\mathbb E|q|^2$, $\delta=\mathbb E|q|^4-2u^2$ and $\chi=\delta/u^2$ when $u>0$. Set $\chi=0$ at $q=0$. The normalized fourth excess is invariant under positive rescaling.

**Proposition (P + C, author only).** For all actual responses, any dimension, and arbitrary energies, sharing and directions in both even and all three odd sectors, the retained row is strictly below $T_*$ on the following sets.

| Visible amplitude | Fourth excess $\chi$ |
|---|---|
| $[.8296,.8393]$ | $[0,.1]\cup[31,42]$ |
| $[.833,.8393]$ | $[0,.27]\cup[26,42]$ |
| $[.836,.8393]$ | $[0,.32]\cup[23.5,42]$ |

There are also two sufficient sign conditions without a fourth-excess restriction. With the scores and drivers defined below, the row holds on $[.8301,.8393]$ if $\operatorname{Re}(\langle c,R\rangle+\langle e,r_B\rangle)\le0$ and on $[.8327,.8393]$ under the single condition $\operatorname{Re}\langle c,R\rangle\le0$. Centered drivers from coordinates independent of $q$ have both pairings zero, since the projected scores can be paired with the first-chaos drivers before projection. The [two-price consumer](../uncapped-peak-consumer-codex-a7c4/TWO_PRICES.md) handles arbitrary orientations and excesses on the overlapping amplitude interval. All constants in these statements are exact rationals.

## The actual response and the fixed trial

Use $p=2500/1891$, $\mu=\varepsilon p=1880/1891<1$, $L=Z(.5592+.1432|Z|^2)$, $J(X)=\mathbb E(|L+X|+|L-X|)$, and $\Lambda(q)=J(q)-pu$. Choose the visible profile $(\ell,\beta)=\mu(.8456,.1432)$. Write the physical response as $G_{\rm ph}=\mu(q+E+O)$, where $E=(|Z|^2-1)r_A+Z^2\overline{r_B}/\sqrt2$ and $O=ZQ+\overline ZP+\nu Z(|Z|^2-2)/\sqrt2$; $\mathbb E Q=0$, $\nu$ is constant. The remote fields are jointly independent of $Z$ and may share arbitrarily. Here $V=\|r_A\|^2+\|r_B\|^2$, $W=\|O\|^2$; their physical energies are $\mu^2V,\mu^2W$. For a slab $[l,h]$ the visible offset is $C(t)=t^2-2\mu(.8456)t+2(\mu\,.1432)^2/\varepsilon$ and its maximum is at an endpoint. With $H=(\pi_{\rm hi}/4-l^2)/p^2$, $\pi_{\rm hi}=3.141592653589794$, sharp response radius 3.5a and ellipsoid 2.12b give

$$0\le u\le H,\qquad V\le 3H/2-3u/4,\qquad u+V\le7H/4.$$

The checker verifies $l^2\ge3\pi_{\rm hi}/14$ before using this radius. [Consumer normalization and offsets](../priced-peak-consumer-codex-a7c4/PROOF.md) · [Sharp radius](../buffered-rice-codex-a7c4/PROOF.md) · [Ellipsoid](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md)

Put $\rho=.5053$, $d=1+\rho^2$, $R=r_A+\rho r_B$, $U=r_B-\rho r_A$. The normalized trial is $\xi=-.6 R-.28\nu Z$; take $\mu\xi$ in the physical row. Because $\mu\le1$ its norm penalty after dividing by $\mu$ is at most $\|\xi\|^2$. The energy price is exactly $p$, including all $W$. By 7.5.13 Theorem A and the aligned expansion, the physical row is at most $C(t)+\mu[\Lambda(q)+I]$, where

$$ I\le2\operatorname{Re}\langle c,R\rangle+2\operatorname{Re}\langle e,r_B\rangle-.31\|R\|^2-.08\|U\|^2+kV.$$

Here $c=c_{3/5}(q)$ is the tilted A-content at $q=q_{\rm ph}/\mu$; $e=c_B(q)-\rho c_A(q)$ uses the two raw scores. The common tilt cancels in this difference. Averaging the pointwise bound, its odd compensator has mean zero; the visible shift penalty cancels and the remote shift penalty changes $-.67\|R\|^2$ into $-.31\|R\|^2$. The positive quartic is $\mathbb E[(|q|^2/2+S_r)S_r]$, $S_r=|r_A|^2+|r_B|^2$. The argument uses the pointwise theorem on its full domain, before the existing capped corollary. [Pointwise joint trial](../global-all-sector-gemini-c1de/PROOF.md) · [Averaged target and aligned scores](../progress-2026-11-15-codex-a7c4/JOINT_TARGET.md)

## Mixed moments at given fourth excess

The standard estimates $\mathbb E S_r^2\le2V^2$ and $\mathbb E|q|^2S_r\le4uV$ give $k=2(u+V-.0463)$. To use $\chi$, let $J_1,I_2$ be the positive influence matrices representing the quadratic projection of $|q|^2$. Set $s=\|J_1\|_{\rm HS}^2+\|I_2\|_{\rm HS}^2$, $b=\|P_{2,0}q^2\|^2$, $c'=\|P_{3,1}q^2\|^2$ and $z=\|P_{2,2}|q|^2\|^2$. Corollaries 13.1 and 13.3 give $\delta=2s+b+c'$ and $4\operatorname{tr}(J_1 I_2)=s+b/2+c'-z$. Consequently

$$\|P_{1,1}|q|^2\|^2=\|J_1+I_2\|_{\rm HS}^2=3\delta/4-b/2-c'/4-z/2\le3\delta/4.$$

Since $S_r-V$ belongs to the $(1,1)$ chaos and has variance at most $V^2$, Cauchy–Schwarz and the standard estimate together give

$$\mathbb E|q|^2S_r\le uV\,[1+\min(3,\sqrt{3\chi/4})],\qquad k=\tfrac12u[1+\min(3,\sqrt{3\chi/4})]+2V-.0926.$$

These identities hold for every direction and include correlated drivers. The global score bounds used in the replay are $\|c\|^2\le\min(.139^2 u,.08\delta,2.8\delta^{3/2})$ and $\|e\|^2\le\min(.0035^2u,.03\delta^{3/2})$. [Influence identities, §13](../influence-calculus-2026-11-16/ADDENDUM.md) · [Tilted Hessian bound](../received-2026-11-15-tilted-sector/content_profile_proof.md) · [Tilted whole-ray range](../received-2026-11-15-tilted-sector/REPORT_localization_history.md) · [Cubic score bounds, equation (2)](../signed-score-coupling-codex-a7c4/SIX.md) · [Raw aligned error](../progress-2026-11-15-codex-a7c4/JOINT_CONTENT.md)

## A closed cover of each response region

In the capped part $u\le u_0=.0463$, $u+V\le .080051$, row 7.5.16 gives $\widehat\Lambda<S$, with $S<1.3739535256616$. Its infimum scales down at $\mu<1$, and $\max C+\mu S_{\rm hi}<T_*$ on all six slabs. For the rest, cover $u\in[0,u_0]$ and $u\in[u_0,H]$ separately. In a cell $[u_l,u_h]\times[\chi_l,\chi_h]\times[v_l,v_h]$ the ellipsoid permits replacing $v_h$ by $\min(v_h,3H/2-3u_l/4)$. On $u_h\le u_0$ replace $v_l$ by $\max(v_l,.080051-u_h)$, since smaller energies are in the capped part. An empty clipped cell carries no witness; every other internal node bisects exactly one coordinate and checks both closed halves. [Capped theorem](../peak-window-codex-a7c4/PEAK.md)

Three remote bounds are available for the entire cell. First, row 3.3a gives $\Lambda(q)\le S_{\rm hi}$ at all $u$. Second, on $u_l\ge u_0$ the same row's exterior proof gives $\Lambda(q)<B_{\rm lo}(.0426)-1.317(.0426)-131649/10^{12}-(p-1.317)u_l$. The replay recalculates the lower polynomial and the exterior estimate. Third, use a previously certified whole-ray radial Hermite upper $P(s)=\sum c_j s^j$ from row 3.3. Its moment bound at fixed $\chi$ has coefficients $c_0,c_1-p,c_2(2+\chi),c_3(6+9\chi+40.45313\chi^{3/2})$. Since $c_3>0$, it is convex in $\chi$. Check the same polynomial at both $\chi$ endpoints and all four Bernstein coefficients on the energy interval. [Priced comparison and whole-ray Hermite certificates](../peak-remote-deficit-codex-a7c4/PRICE.md)

Let $a=.31-k_{\rm hi}/d$, $b=.08-k_{\rm hi}/d$, $x=\|c\|_{\rm hi}+\rho\|e\|_{\rm hi}/d$ and $y=\|e\|_{\rm hi}/d$. The upper endpoints in the moment and content terms give outward bounds. Since $r_B=(U+\rho R)/d$, $\|R\|^2+\|U\|^2=dV$, for any multiplier $m$ with $a+m,b+m>0$ one has

$$I\le\frac{x^2}{a+m}+\frac{y^2}{b+m}+m d\,(v_h\text{ if }m\ge0,\ v_l\text{ otherwise}).$$

Alternatively Cauchy–Schwarz gives $I\le2\sqrt{(x^2+y^2)d v_h}-\min(a,b)dV$, taking the adverse endpoint of $V$. The verified physical clearance is $T_*-\max C-\mu(\Lambda_{\rm hi}+I_{\rm hi})$. The six partitions contain 12, 116, 20, 109, 16 and 60 uncapped leaves. Their total minimum clearances, including the capped part, all exceed $2.24\cdot10^{-7}$.

## Sign conditions

For the two-score condition use $k\le7H/2-.0926$. Then $I\le-.23\|R\|^2-[.08d+.0926-7H/2]V$. The bracket is positive for $l=.8301$. The all-energy remote price gives physical clearance $>11.36\cdot10^{-6}$. If only $\operatorname{Re}\langle c,R\rangle\le0$ is known, set $x=\rho(.0035)\sqrt H/d$, $y=(.0035)\sqrt H/d$, take $k_{\rm hi}=7H/2-.0926$ and $m=0$ in the two squares. At $l=.8327$ the denominators are positive and the physical clearance exceeds $1.016\cdot10^{-6}$.

**Replay.** From the repository root run

```sh
python3 -IB research/conjecture-K/code/uncapped-six-sector-codex-a7c4/verify.py
```

The checker uses exact rational arithmetic with upward integer square roots. Its six corruption tests reject a missing energy slab, a partition hole, an exterior formula below its domain, an invalid majorant, a nonpositive square denominator and a failed capped budget. [Verifier](../../code/uncapped-six-sector-codex-a7c4/verify.py) · [Selected partitions and multipliers](../../code/uncapped-six-sector-codex-a7c4/cover.json)
