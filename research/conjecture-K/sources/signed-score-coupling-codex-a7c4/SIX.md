# A same-variance reserve for all six retained sectors at the peak

Agent-ID: codex-a7c4.

Let $q$ be a remote charge-one Wick cubic at the [peak visible profile and price](PROOF.md), with $p=2500/1891$. Write $u=E|q|^2$, $\delta=E|q|^4-2u^2$, $\chi=\delta/u^2$ for $u>0$, $B_G(u)=2E|L+\sqrt u W|$ for a fresh standard complex Gaussian $W$, $\Phi(u)=B_G(u)-pu$, $S=\sup_v\Phi(v)$, and $D=B_G(u)-2E|L+q|$. In the decomposition of 7.5.13 write $G=q+A+B+O$ with both even sectors, even energy $V=\|r_A\|_2^2+\|r_B\|_2^2$, and all three odd sectors in $O$. Assume $u\le .0463$ and $u+V\le .080051$. The odd energy and sharing among the six sectors are unrestricted.

**Theorem.** On each of the following sets the retained payoff satisfies

$$
\widehat\Lambda(G)\le\Phi(u)-\frac{41}{125}D<S.
$$

* For unrestricted cubic shapes, the three rectangles $[0,.0463]\times[0,.0784]$, $[0,.0007]\times[0,42]$, $[0,.012]\times[0,.25]$ in $(u,\chi)$, and all nine general staircase rectangles of 6.3.44.
* For sums of disjoint-coordinate cubic blocks $q=\sum q_j$, all four conditions of 6.3.44 throughout $0<u\le.0463$. These include arbitrary shapes with $\max u_j\le u/41$, or $28(\sum\delta_j^{3/2})^2\le(\sum\delta_j)^3$. The two remaining criteria are $0.65\le\chi\le1.4,\ s\le.21\chi$, and $1\le\chi\le1.4,\ s\le.22\chi$, for $s=\sum\delta_j^{3/2}/u^3$. Only the cubic summands have to be on disjoint blocks.

At $u=0$ the conclusion holds without defining $\chi$. An actual response is covered when its remote cubic satisfies a listed shape condition and its energies satisfy both caps.

## The two linear gains

Put $\rho=.5053,\ d=1+\rho^2,\ R=r_A+\rho r_B,\ U=r_B-\rho r_A,\ C=c_{3/5},\ e=c_B-\rho c_A$. In the invariant trial of 7.5.13 its joint pointwise inequality and the shared moment estimates in 7.4.10 give

$$
\widehat\Lambda(G)\le\Phi(u)-D
 +2\operatorname{Re}\langle C+\rho e/d,R\rangle+2\operatorname{Re}\langle e/d,U\rangle
 -.31\|R\|_2^2-.08\|U\|_2^2+2(u+V-.0463)V.
$$

Indeed $r_B=(\rho R+U)/d$, so the linear gain $2\operatorname{Re}(\langle C,R\rangle+\langle e,r_B\rangle)$ has these two coefficients. The odd covariance correction in 7.5.13 has mean zero. The tilt adds the same multiple of the projected phase to the two aligned contents, so their difference $e$ is the raw difference from the [signed-score estimate](PROOF.md). These estimates apply to arbitrary odd energy. [Pointwise trial](../global-all-sector-gemini-c1de/PROOF.md) · [Averaging and shared moments, equation (5)](../progress-2026-11-15-codex-a7c4/JOINT_TARGET.md) Since $\|R\|_2^2+\|U\|_2^2=dV$, put $A_0=.31-.067502/d$ and $B_0=.08-.067502/d$. Both are positive. Completing the two squares gives an increment at most

$$
\frac{(\|C\|_2+\rho\|e\|_2/d)^2}{A_0}
 +\frac{\|e\|_2^2}{d^2B_0}. \tag{1}
$$

Take $H=\delta^{3/2}$ on a general rectangle and $H=\sum_j\delta_j^{3/2}$ on a block tile. In both cases

$$
\|C\|_2^2\le(14/5)H,\qquad \|e\|_2^2\le(3/100)H. \tag{2}
$$

For an odd score $m$, KRAW (3.3) and 6.3.42 give

$$
\|c_m\|_2^2\le \sqrt{13/15}\,(\pi^2/128)(3/8)^{3/2}
     \|m'''\|_\infty^2\,\delta^{3/2}.
$$

The first inequality in (2) uses the unsmoothed estimate $\|m_{3/5}'''\|_\infty<13$ of 11.30, independently replayed in the [phase-content proof, §2](../phase-content-2026-11-16-codex-a786/PROOFS.md). The second uses the signed-score estimate $\|(m_B-\rho m_A)'''\|_\infty<1.344$. For a direction in block $j$, the score after integration over the other blocks is $x\mapsto E[m(x+\operatorname{Re}\sum_{i\ne j}q_i)]$. Circularity keeps it odd and averaging preserves the same derivative bound. Sum the squared projections over the orthogonal block linear spaces as in 6.3.42. This argument applies to both scores before the bounds in (2) are used.

With $c=14/5$ and $e_0=3/100$, $\sqrt{ce_0}<29/100$. Thus (1) is at most $K H$, with

$$
K=\frac{c+2(\rho/d)(29/100)+(\rho/d)^2e_0}{A_0}+
\frac{e_0}{d^2B_0}<63/5. \tag{3}
$$

## The certified deficit prices

On the three general base rectangles the zero-slack estimates in KRAW, KSLIV and 3.19a give $D\ge(25/6)K_A^{\rm tab}(u)H$, as identified in the proof of 7.4.18. Here $K_A^{\rm tab}\ge9/2$. On the thirteen general certificate tiles in 6.3.44, the radial majorant is paid together with $(25/6)(14/15)K_A^{\rm tab}(u_{\rm left})H$, so $D$ exceeds this entire price. Those tiles have $u_{\rm left}\le.035$, where $K_A^{\rm tab}\ge5$. On each of the fourteen disjoint-block tiles the corresponding certificate pays $(25/6)(399/50)H$. Thus $D\ge(75/4)H$ on every piece. On the small-energy and small-excess parts of a block criterion supplied by the general rectangles, apply the general result. Combining (3) with this common price leaves $1-(63/5)/(75/4)=41/125$ of the deficit. The fourteen block tiles themselves retain more than $31/50$ of $D$.

For $u>0$, [3.3a](../peak-remote-deficit-codex-a7c4/PROOF.md) gives $D>0$, and $\Phi(u)\le S$. At $u=0$ both contents vanish and $D=0$. Concavity and the maximizer $u_*>.0403448$ give $\Phi(0)\le\Phi(.00551)$. The quantitative gap in [2.7c](../gemini-plan-audit-2026-11-17/NOTE.md) gives $\Phi(.00551)<S$.

There is a second class requiring no excess or block condition. If a compact subgroup fixing $q$ has no fixed vector in the remote coordinate space (11.31a), both first-chaos projections vanish identically. Then the trial is bounded by $\Phi(u)-D-[.08d-.067502]V$, with $.08d-.067502>.0329$. This includes every finite cyclic linked cubic $\sum_j a_j Z_j^2\overline{Z}_{j+1}$ of length at least two at every allowed energy. The same argument at $u=0$ covers all amplitudes on the stated energy domain.

The exact price checks use the [staircase and block certificates](../strong-content-blocks-codex-a7c4/PROOF.md), the [three inherited envelopes](../strong-content-blocks-codex-a7c4/JOINT.md), and the [joint replay](../../code/signed-score-coupling-codex-a7c4/verify.py).
