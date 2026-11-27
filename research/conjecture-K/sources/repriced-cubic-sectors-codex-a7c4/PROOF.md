# Repricing the remote cubic and three odd sectors

Agent-ID: codex-a7c4. Task #789, related to #760. **P + C, author only.** Fix the cubic witness $\varepsilon=94/125$ and target row value $T_*=713245/10^6$. Let $t$ be the visible first-chaos amplitude of an actual response. Write $V_{\rm ph}$ for its total physical energy in the two even driver sectors and $W_{\rm ph}$ for that in the three odd sectors. Every decimal below is an exact rational.

**Theorem (8.13b).** In every finite dimension, with arbitrary sharing of the remote coordinates, the target row value is strictly below $T_*$ on each of the following families.

| Amplitudes | Conditions |
|---|---|
| Every $t$ | $W_{\rm ph}\le .01$ and $V_{\rm ph}\le5\cdot10^{-7}$ |
| $.7923\le t\le .8393$ | $V_{\rm ph}=0$, any $W_{\rm ph}$ |
| $.795\le t\le .8393$ | $V_{\rm ph}\le10^{-7}$, any $W_{\rm ph}$ |
| $.8205\le t\le .8393$ | $W\le2V$, $\|R\|^2\ge V$ and $\operatorname{Re}\langle c_{3/5}(q),R\rangle\le0$ at the scale of the applicable slab; $V$ has no additional cutoff |

The first statement uses row 8.13a outside $[.751,.8393]$. In particular every four-sector response $q+O$ with $W_{\rm ph}\le .01$ is covered. For $t\ge .8393$, 8.13a and its exterior give the target for all sectors. The unrestricted lower-central inequality and the corresponding Grothendieck lower bound $200000/142649$ remain open. [Earlier all-sector slabs and exterior](../priced-peak-consumer-codex-a7c4/PROOF.md)

## A price certificate for every remote cubic

Use the peak visible field $L=Z(.5592+.1432|Z|^2)$, $p_0=2500/1891$ and $b_o=32/25$. A remote circular $(2,1)$ cubic $q$ is independent of $Z$; it may share coordinates with each driver. Write $u=\|q\|_2^2$, $J(X)=\mathbb E(|L+X|+|L-X|)$ and $\Lambda_p(X)=J(X)-p\|X\|_2^2$. For a remote cubic $J(q)=2\mathbb E|L+q|$. We prove the following uniform upper bounds. The displayed clearances concern the small and moment-covered ranges; the last row also has a separate radial tail check.

| $p$ | $u$ | $\Lambda_p(q)<M$ | Moment rectangles | Clearance below $M$ on $0\le u\le u_{\rm end}$ |
|---|---|---:|---:|---:|
| 1.196 | $[0,.165]$ | 1.38575 | 35 | $>11258233/10^{12}$ |
| 1.228 | $[0,.135]$ | 1.38130 | 30 | $>10261129/10^{12}$ |
| 1.28 | $[0,\infty)$ | 1.37627 | 53 | $>474764/10^{12}$ for $u_{\rm end}=.2$ |

At $p=p_0$ we use $M=S_{\rm hi}=1.3739535256616$ from rows 3.3a and 3.14. On $0\le u\le u_0=.0463$, each lower price satisfies $\Lambda_p(q)\le S_{\rm hi}+(p_0-p)u_0$. On the remaining compact intervals take the public whole-ray Hermite majorants $P(s)=\sum_{j=0}^3c_js^j$ of the radial profile $s\mapsto2\mathbb E|L+\sqrt s|$. Each bounds the complete ray because the fourth derivative is nonpositive and the four coefficients enclose the two-node Hermite interpolant from above. Their original energy boxes are unnecessary here. Row 3.4 gives the fourth moment $(2+\chi)u^2$, $0\le\chi\le42$, and sixth-moment upper bound $(6+9\chi+40.45313\chi^{3/2})u^3$. With $c_3>0$ this yields

$$\Lambda_p(q)\le c_0+(c_1-p)u+c_2(2+\chi)u^2+c_3(6+9\chi+40.45313\chi^{3/2})u^3.$$

For a whole rectangle the same $P$ works at both ends in $\chi$, by convexity in $\chi$, and at every energy between its endpoints, by the four Bernstein coefficients in $u$. The replay checks the exact rectangular partition up to $\sqrt\chi=13/2$. Only 27 public majorants are used. For $u\ge .2$, Jensen bounds $J(q)$ by the concave radial profile at $u$ as in 3.3a. The checker prices every inherited profile interval intersecting $[.2,2]$, and evaluates the affine tail at 2 after checking its slope is strictly below 1.28. [Priced remote theorem, radial inputs and moment argument](../peak-remote-deficit-codex-a7c4/PRICE.md)

## Four-sector consumption and the physical energy units

Choose a price $p$ and put $\mu=\varepsilon p$, $(\ell,\beta)=\mu(\ell_0,\beta_0)$ with $(\ell_0,\beta_0)=(.8456,.1432)$. Write the physical cubic as $G_{\rm ph}=\mu(q+E+O)$, where $E=(|Z|^2-1)r_A+Z^2\overline{r_B}/\sqrt2$ and $O=ZQ+\overline ZP+\nu Z(|Z|^2-2)/\sqrt2$. In particular $V=\|r_A\|^2+\|r_B\|^2=V_{\rm ph}/\mu^2$ and $W=\|Q\|^2+\|P\|^2+|\nu|^2=W_{\rm ph}/\mu^2$. The fields $q,r_A,r_B,Q,P$ are jointly independent of $Z$, with $\mathbb E Q=0$ and deterministic $\nu$. Define

$$C(t,\mu)=t^2-2\mu\ell_0t+2(\mu\beta_0)^2/\varepsilon.$$

With $V=0$, use the zero first-chaos trial, giving row upper $C(t,\mu)+\mu\Lambda_p(q+O)$. Row 7.2.10 gives $J(q+O)\le J(q)+b_oW$ at every amplitude and sharing. The change $Z\mapsto-Z$ converts the two signs of the original payoff into signs of $O$ at common remote core $q$. By orthogonality, the physical row is consequently at most

$$C(t,\mu)+\mu M+(b_o-p)_+W_{\rm ph}/\mu.$$

The Rice tangent of row 2.12a ensures $u\le 4B(A-l)/p^2$ on a slab $[l,h]$, where $A=.886762780$, $B=.432306903$. For the first two slabs this upper bound is respectively below .165 and .135. The remaining two prices apply at all energies. Each row bound is convex in $t$ and its two endpoints suffice. [Odd-sector theorem](../odd-cubic-core-2026-11-15/PROOF.md) · [Response tangent](../progress-2026-11-15-codex-a7c4/RESPONSE_ELLIPSOID.md)

| Slab | $p$ | $W_{\rm ph}$ | Certified clearance below $T_*$ in millionths |
|---|---:|---|---:|
| [.751,.77] | 1.196 | $\le .01$ | $>171.425763$ |
| [.77,.795] | 1.228 | $\le .01$ | $>169.095880$ |
| [.795,.833] | 1.28 | arbitrary | $>108.289857$ |
| [.833,.8393] | $p_0$ | arbitrary | $>64.327139$ |

At price 1.28 the same comparison extends down to .7923 with clearance $>3.223947$ millionths on $[.7923,.833]$. For an immediate perturbation valid in all even directions, the triangle inequality and orthogonality add at most $2\sqrt{V_{\rm ph}}-V_{\rm ph}/\varepsilon$ to the physical row. Thus $V_{\rm ph}\le10^{-9}$ and $W_{\rm ph}\le .01$ already suffice across the entire residual band, with clearance exceeding 1.0815 millionths. A common trial gives the larger range next.

## Adding the even drivers with a common remote core

Let $\rho=.5053$, $d=1+\rho^2$, $R=r_A+\rho r_B$, $U=r_B-\rho r_A$, and $e=c_B(q)-\rho c_A(q)$. Write $c=c_{3/5}(q)$ for the tilted A-score at the normalized remote core. The global bounds are $\|e\|\le .0035\sqrt u$, $\|c\|\le.139\sqrt u$. The latter follows from centering the tilted radial multiplier on its whole range and $\Pi_1q=0$. [Aligned scores](../progress-2026-11-15-codex-a7c4/JOINT_CONTENT.md) · [Global tilted score range](../received-2026-11-15-tilted-sector/REPORT_localization_history.md)

Use the explicit trial $\xi_J=-.6R-.28\nu Z$ of 7.5.13. Before any energy cutoff, its pointwise Theorem A and the moment inequalities $\mathbb E(|q|^2S_r)\le4uV$, $\mathbb E S_r^2\le2V^2$ ($S_r=|r_A|^2+|r_B|^2$) give

$$J(q+E+O-\xi_J)+\|\xi_J\|^2\le J(q)+2\operatorname{Re}\langle c,R\rangle+2\operatorname{Re}\langle e,r_B\rangle +p_0(V+W)-.31\|R\|^2-.08\|U\|^2+2(u+V-u_0)V.$$

Indeed the averaged odd compensator vanishes because $\mathbb EQ=0$. The visible part of the trial norm cancels its debit, and its remote part adds $.36\|R\|^2$ to the pointwise $-.67\|R\|^2$. The quartic term is bounded by $2uV+2V^2$, and $-.0926V=-2u_0V$. These estimates use the pointwise theorem with no size cutoff. [Theorem A](../global-all-sector-gemini-c1de/PROOF.md) · [Unrestricted mixed moments and the aligned linear terms](../progress-2026-11-15-codex-a7c4/JOINT_TARGET.md) · [Fixed trial and content expansion](../all-sector-transfer-gemini-c1de/PROOF.md)

Fix $0<\theta\le1$. Use the joint trial on $q+E/\theta+O$ with weight $\theta$, and the raw comparison on $q+O$ with weight $1-\theta$. Both arms have precisely the same $(q,O)$. Convexity of $J$ gives one trial at the physical response, namely $\mu\theta\xi_J(E/\theta,O)$. Its squared norm is at most $\mu\theta\|\xi_J(E/\theta,O)\|^2$ because $\mu\theta\le1$. The shell energy inside the joint arm is $V/\theta^2$. Let $H$ be the tangent bound above, decreased to $(\pi_{\rm hi}/4-l^2)/p^2$ whenever $l^2\ge3\pi_{\rm hi}/14$, where $\pi_{\rm hi}=3.141592653589794$ (3.5a). Using $\|R\|^2+\|U\|^2=dV$, the physical bound is $C(t,\mu)+\mu M$ plus at most

$$\mu\left[2(.139\sqrt d+.0035)\sqrt{HV}+\left(\frac{p_0-.08d+2(H-u_0)}{\theta}-p\right)_+V+\frac{2V^2}{\theta^3}\right]+\frac{(b_o+\theta(p_0-b_o)-p)_+}{\mu}W_{\rm ph}.$$

On the four slabs above choose $\theta=1/25,1/25,1/25,1$ respectively. For $V_{\rm ph}\le5\cdot10^{-7}$, $W_{\rm ph}\le.01$, the four clearances exceed $41.892294,50.225947,4.211258,12.799008$ millionths. For arbitrary $W_{\rm ph}$ on $[.795,.833]$, take $p=1.28025$ and $\theta=(p-b_o)/(p_0-b_o)$. The price of $W$ cancels exactly. The all-energy bound at $p=1.28$ also bounds this higher price. On $[.833,.8393]$ use $p=p_0,\theta=1$. With $V_{\rm ph}\le10^{-7}$ the clearance on their union exceeds 32.663279 millionths. [Sharp physical radius](../buffered-rice-codex-a7c4/PROOF.md)

For the signed cone take $\theta=1$, $p=b_o$ on $[.8205,.833]$ and $p=p_0$ on $[.833,.8393]$. Suppose $\operatorname{Re}\langle c,R\rangle\le0$, $\|R\|^2\ge V$ and $W\le2V$. The pairing condition holds, for example, for centered drivers on coordinates independent of $q$. Evaluate the pairing at $q=q_{\rm ph}/\mu$ on the chosen slab. The common-response ellipsoid 2.12b gives $u+V\le T=3(\pi_{\rm hi}/4-l^2)/(2p^2)+H/4$. Define

$$k=p-p_0+.08d+.23-2(T-u_0)-2(p_0-p).$$

Then the additional charge is at most $\mu(2\cdot.0035\sqrt{HV}-kV)\le\mu(.0035)^2H/k$. Both $k$ are positive. The row stays below target by more than 61.667899 millionths on the combined interval. The cone allows arbitrary feasible driver amplitudes subject to its three stated conditions.

## Why the capped homotheties alone fail

Fix physical remote energy $e=.0481605$. For $0\le t\le .8368$, $t^2+e/\varepsilon^2<\pi/4$. The finite disjoint-triple construction in 3.5a realizes $F=\sqrt e\,T_N$, with $T_N=N^{-1/2}\sum_j A_jB_j\overline{C_j}$ and all five other sectors zero, for every sufficiently large $N$. Uniform sufficiency follows by checking the disk condition at $t=.8368$. The responses can be unimodular. Projection of any first-chaos trial onto fixed vectors of the block torus decreases the convex trial cost, leaving only the visible coefficient $aZ$ (the auxiliary unimodular coordinate acts independently and can also be averaged). Negating the remote coordinates reverses $F$ and exchanges the two terms under $a\mapsto-a$. Convexity gives the minimum at $a=0$. Thus for this family the raw and retained row values coincide at each scale.

Define $B_G(s)=2\mathbb E|L+\sqrt{s}\,G'|$ for a fresh proper Gaussian $G'$. The two-dimensional central limit theorem and a uniform second-moment bound give the following limit of the physical rows at each fixed $m>0$:

$$F_t(m)= C(t,m)+mB_G(e/m^2)-e/\varepsilon.$$

Both the finite rows and the limit are convex in $m$ by the absolute-value formula $2\mathbb E|mL+\sqrt e\,T_N|$ and the quadratic part of $C$. For $s=1.01989$ the public degree-eight Gaussian lower polynomial at $e/s^2$ and $S_{\rm hi}$ as an upper bound for $B_G(e)-p_0e$ give $F_{.8368}(s)-T_*>0.587835\cdot10^{-6}$ and $F_{.8368}(s)-F_{.8368}(1)>88.651027\cdot10^{-6}$. The first difference increases as $t$ decreases, since $s\ell_0>.8368$, and the second increases since $s>1$. Strictness persists for finite sufficiently large $N$ by convergence at the two points. The condition $e/m^2\le .0463$ requires $m>s$, so the positive secant slope excludes **every** such scale on the same finite response. This obstruction applies only to these capped peak homotheties with their retained row, before using any further response-square credit. [Construction](../buffered-rice-codex-a7c4/PROOF.md) · [Gaussian lower polynomial](../peak-remote-deficit-codex-a7c4/PROOF.md)

## Replay

From the repository root:

```sh
python3 -IB research/conjecture-K/code/repriced-cubic-sectors-codex-a7c4/verify.py
python3 -IB research/conjecture-K/code/repriced-cubic-sectors-codex-a7c4/verify.py --radial
```

The first invocation uses standard-library rational arithmetic and pinned public radial certificates. The second also evaluates the 27 selected whole-ray majorants, the inherited 68 local majorants and the final tangent using python-flint. The certificate records the rectangle endpoints and original majorant indices. The replay recomputes the bounds and domain coverage and exercises six failure cases. The input moment theorems and the analytic implications cited above are paper proofs. [Exact replay](../../code/repriced-cubic-sectors-codex-a7c4/verify.py) · [118 price rectangles](../../code/repriced-cubic-sectors-codex-a7c4/cover.json)
