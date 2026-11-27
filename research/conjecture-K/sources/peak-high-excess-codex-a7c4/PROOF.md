# Exact retained peak Conjecture K for fourth excess at least three

Agent-ID: codex-a7c4. Ledger 7.5.15, **P + C, author only**. At the peak let $p=2500/1891$ and $L=Z(699/1250+(179/1250)|Z|^2)$. A remote $(2,1)$ Wick cubic $q$ has energy $u=E|q|^2$ and normalized excess $\chi=E|q|^4/u^2-2$ for $u>0$. For a fresh standard complex Gaussian $W$, write $B(u)=2E|L+\sqrt u W|$, $\Phi(u)=B(u)-pu$, $S=\sup_{v\ge0}\Phi(v)$ and $D=B(u)-2E|L+q|$.

**Theorem.** Take the six-sector decomposition $G=q+A+B_{\rm shell}+O$ of 7.5.13, where $V=\|r_A\|_2^2+\|r_B\|_2^2$ is the energy of the two even shells and $O$ comprises all three odd sectors. Suppose $u+V\le.080051$. In every finite dimension, with arbitrary sharing of remote coordinates and arbitrary odd energy,

$$
.0354\le u\le.0456,\quad 3\le\chi\le42
\quad\Longrightarrow\quad
\widehat\Lambda(G)< S-\frac{146939}{10^{12}}.
$$

The existing all-sector transfer using 7.5.13 gives exact retained K for every shape when $u\in[0,.0354]\cup[.0456,.0463]$, and an allowance below $27\cdot10^{-6}$ in the central interval. Together these results give strict retained K throughout the original capped energy band for all $\chi\ge3$ (the universal upper bound $\chi\le42$ is 3.4). A concrete central cubic at $\chi=3$ is the equal-energy sum of 14 independent copies of $H(Z)=Z(|Z|^2-2)/\sqrt2$, scaled to the peak optimizer $u_*\in(.0403448,.0403449)$. Independent circular fourth excesses add, and one such Wick block has normalized excess 42, so the sum has excess $42/14=3$. Both even and all odd sectors may share its coordinates. [Peak transfer, Theorem B](../all-sector-transfer-gemini-c1de/PROOF.md) · [Wick excess and independent sums](../content-509-codex-6d92/BLOCKS.md)

## A lower bound for the remote deficit on each strip

For each closed energy strip $[l,h]$ the certificate fixes a positive threshold $D_0$. Its minimum is $253/10^6$ and its maximum is $383/10^6$. Each strip has a partition of $[3,42]$ into closed shape cells. On a cell select one of the three existing polynomials $P(z)=\sum_{i=0}^3p_i z^i$ at zero-based indices 7, 8 and 9 of the 3.3a certificate. The verifier checks $p_3>0$ and $P(z)\ge2E|L+\sqrt z|$ on the entire positive ray, against the 68 original coefficient caps and affine tail, by the Bernstein test of 3.3a. It recomputes the degree-eight KRAW Rice lower polynomial $b(u)\le B(u)$. Since the fourth moment is known exactly, and the sixth moment satisfies 3.4, the polynomial majorizes the remote payoff at the moment price

$$
p_0+p_1u+(2+\chi)p_2u^2+
       (6+9\chi+40.45313\chi^{3/2})p_3u^3.
$$

This is convex in $\chi$. At both shape endpoints the verifier rounds $\sqrt\chi$ upward and subtracts the resulting price and $D_0$ from $b$. On $[l,h]$ each of the nine resulting Bernstein coefficients is positive. Thus $D>D_0$ on the entire strip for these shapes. [Global radial majorants, Rice polynomial and moment bound](../peak-remote-deficit-codex-a7c4/PROOF.md)

## Spending the deficit on the six sectors

Let $\rho=.5053,\ d=1+\rho^2,\ R=r_A+\rho r_B,\ U=r_B-\rho r_A$, and $e=c_B-\rho c_A$. Put $t=\|c_{3/5}\|_2^2$. By 11.30, $0\le t\le T=1/2500$. Row 11.61 gives $t\le\beta D_+ +\alpha$ with $\beta=7/25,\ \alpha=6/10^6$. The positive bound $D>D_0$ just proved implies $D_+=D$ on every cell. The uniform bound in 7.1.6 gives $\|e\|_2^2\le E_0=(.0035)^2h$. [Tilted content, §4](../ab-sector-2026-11-15-codex-91d4/REVIEW_claude-b9ee.md) · [Quadratic trial and centered alignment, §2.2](../all-sector-transfer-gemini-c1de/PROOF.md)

The trial of 7.5.13, its centered odd covariance correction and the shared moment estimates of 7.4.10 bound $\widehat\Lambda(G)-S$ by

$$
-\sigma-D+2\operatorname{Re}\langle c_{3/5}+\rho e/d,R\rangle
+2\operatorname{Re}\langle e/d,U\rangle-.31\|R\|^2-.08\|U\|^2
+2(u+V-.0463)V,\qquad \sigma=S-\Phi(u).
$$

Each strip has a second partition, this time of $[0,.080051-l]$ in $V$. Fix a cell $[v_0,v_1]$. Write $k=2(\min(h+v_1,.080051)-.0463)$, so the last term is at most $kV$ even if $k<0$. By $\|R\|^2+\|U\|^2=dV$ one may add $\mu(dV-\|R\|^2-\|U\|^2)=0$ for the selected real $\mu$. The positive costs are $a=.31-k/d+\mu$ and $b=.08-k/d+\mu$. Complete both squares, then apply $(\sqrt t+\rho\sqrt{E_0}/d)^2\le(1+\eta)t+(1+1/\eta)\rho^2E_0/d^2$ for the selected $\eta>0$. Row 2.7c gives $\sigma\ge s_0=(27/25)\max(.0403448-h,l-.0403449,0)^2$. The resulting upper bound is

$$
s t-\max\{D_0,(t-\alpha)/\beta\}
+\frac{(1+1/\eta)\rho^2E_0}{d^2a}+
\frac{E_0}{d^2 b}+\mu d v_* -s_0,
\qquad
s=\frac{1+\eta}{a},\quad
v_*=\begin{cases}v_1&\mu\ge0,\\v_0&\mu<0.\end{cases}
$$

The first two terms are piecewise affine in $t$. They increase for $0\le t\le t_*=\min(T,\beta D_0+\alpha)$ since $s>0$, and are affine from $t_*$ to $T$. It suffices to check $t_*,T$. The shape and shell partitions are independent, so each shell test uses its strip's uniform $D_0$ for every shape in the theorem.

Across the six strips there are 34 shape cells and 40 shell cells. Rational replay gives a shell clearance greater than $146939/10^{12}$ and a radial clearance above the respective $D_0$ greater than $181948/10^{12}$. Six negative controls test the two partitions, invalid square completion, an excessive shell gain, a false radial threshold, and a still-positive shell margin smaller than the announced clearance. From the repository root run

```sh
python3 -IB research/conjecture-K/code/peak-high-excess-codex-a7c4/verify.py
```

The standard library suffices. The proof uses the original positive radial caps, the KRAW Rice benchmark, the moment inequality, and the previously established sector and tilted-content estimates. The lower endpoint for the Grothendieck constant still requires coverage of the complementary shapes and the other visible profiles in a witness.
