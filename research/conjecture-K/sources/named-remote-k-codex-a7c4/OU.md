# Scalar deficit on the two central energy intervals

Agent-ID: codex-a7c4. Research proof with exact arithmetic, author only.

Let $L=z_1(a+b|z_1|^2)$, $q$ be a remote cubic of bidegree $(2,1)$, $u=\mathbb E|q|^2$, $\delta=\mathbb E|q|^4-2u^2$, and $\chi=\delta/u^2$. Write $B(u)=2\mathbb E|L+\sqrt u\,W|$ for an independent standard circular Gaussian $W$ and $D(q)=B(u)-2\mathbb E|L+q|$. For $0<\chi\le1/100$ the following lower bounds hold in every dimension. Each terminating decimal in the table is an exact rational rounded downward.

| Row | $(a,b)$ | Closed interval for $u$ | Lower bound for $D(q)/\delta$ |
|---|---|---|---|
| flank | $(14/25,1467/10000)$ | $[.023,.028]$ | .15529231 |
| flank | same | $[.028,.0325]$ | .06465886 |
| upper | $(573/1000,19/125)$ | $[.022,.026]$ | .16892974 |
| upper | same | $[.026,.030]$ | .08847921 |

For positive energy, every such cubic has $\delta>0$. Indeed $F=\sqrt{2/u}\,\Re q=I_3(f)$ has variance one. Its order-two contraction $f\otimes_2 f$ is a positive Gram operator of positive trace. The fourth-cumulant formula of KCR §3 then gives $3\chi/2=\kappa_4(F)>0$. Thus $D(q)>0$ throughout the two stated near-Gaussian ranges.

## Proof

The KSLIV smoothed two-step OU identity, equations (3)–(9), uses the profile through the positive Gaussian mixing variance $V$ of $L$. The expansion gives

$$
D(q)=-\frac{B''(u)}4\delta-\frac{B'''(u)}{36}\kappa_6^\mathbb C-R(q).
$$

For both rows the KSLIV contraction table applies unchanged, since it concerns the normalized cubic $F$. Its fourth norm is bounded by $33/25$, as $\mathbb E F^4=3+3\chi/2\le(33/25)^4$. We apply the KSLIV interpolation polynomials to the mixing measure of each actual profile. The half-integer moments $M_j=\sqrt\pi\,\mathbb E[V^{1/2-j}]$, $2\le j\le8$, are enclosed by its directed 220-bit partial-fraction recurrence with the stated $a,b$. The helper stores a peak-specific value at index zero. The recurrence for indices 1–8 is independent of that entry, and only indices 2–8 enter these estimates. If $t(a+bt)^2=s$, then $m_n=\mathbb E V^{-n}=(-1)^n n![s^n]e^{-t(s)}$. Lagrange inversion gives

$$
m_n=(n-1)!a^{-2n}\sum_{j=0}^{n-1}\binom{2n+j-1}{j}\frac{(b/a)^j}{(n-1-j)!}.
$$

The script checks these nine moments against the KSLIV formal-series recurrence evaluated at $(2a,2b)$, then multiplied by $4^n$ because that mixing variance is $4V$.

On each interval $[u_-,u_+]$, KSLIV §4 constructs a polynomial $P(y)$ using upper bounds on the smoothed inverse moments at the lower energy in each OU integration cell. Bernstein positivity on the whole interval $0\le y\le7/8$ checks $(54\cdot140)^2(1/2+y^2)^3>(27/8)P(y)^2$. This proves $|R(q)|\le 140\delta^{3/2}$. Since $B'''(u)>0$, the sixth cumulant ceiling $\kappa_6^\mathbb C\le C_6\delta^{3/2}$ suffices, with $C_6=4045313/100000$ from ledger 3.4. Monotonicity of the inverse moments and $\sqrt\delta=u\sqrt\chi\le u_+/10$ now yield

$$
\frac{D(q)}{\delta}\ge -\frac{B''(u_+)}4 -\frac{u_+}{10}\left(140+\frac{C_6}{36}B'''(u_-)\right).
$$

The degree-five Hermite minorant for $(1+x)^{-3/2}$ and degree-four Radau majorant for $(1+x)^{-5/2}$ give the signed table values. The checker also requires the false remainder cap 1 to fail on each interval. From the repository root run `python3 -IB research/conjecture-K/code/named-remote-k-codex-a7c4/ou.py`.

The replay verifies the KSLIV helper SHA-256 `6f08bff127643e12549ee02ebf06d106255e958e32caf4cb735a8142737af800` before loading it. Source formulas appear in [KSLIV §§2–4](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md) and [KCR §3](../cumulant-remainder-codex-a7c4/PROOF.md).
