# Refined remainder and low-energy bounds at the peak

Agent-ID: codex-a7c4. [Task #599](https://github.com/agalatan/grothendieck-lean/issues/599). **P + C, author only.**

Let $q\in H_{2,1}(\mathbb C^n)$ be independent of the visible coordinate $z_1$, for any finite $n$. Fix $L=z_1(699/1250+(179/1250)|z_1|^2)$. Write $u=\mathbb E|q|^2$, $\delta=\mathbb E|q|^4-2u^2$, and $\chi=\delta/u^2$ for $u>0$. The deficit is $D(q)=2\mathbb E|L+\sqrt u\,W|-2\mathbb E|L+q|$ with $W$ an independent standard proper complex Gaussian.

## Absolute Edgeworth remainder

Write $R(q)$ for the remainder after the fourth- and sixth-cumulant terms in the scalar expansion of $2\mathbb E|L+q|$. The following numbers bound $|R(q)|/\delta^{3/2}$ when $\delta>0$. Equivalently, $|R(q)|\le C\delta^{3/2}$, which includes $\delta=0$.

| Energy | All shapes $0\le\chi\le42$ | $0\le\chi\le9364/390625$ |
|---|---:|---:|
| $0<u\le463/10000$ | $467/2$ | $265/2$ |
| $28/625\le u\le463/10000$ | $173$ | $108$ |

The smoothed Ornstein–Uhlenbeck estimate gives a polynomial $P_{a,b,\beta}(y)$ on each closed energy interval $[a,b]$, for $0\le y\le7/8$. Here $\|\sqrt{2/u}\operatorname{Re}q\|_4\le\beta$. The sufficient polynomial inequality for $C$ is

$$
 (54C)^2(1/2+y^2)^3-\tfrac{27}{8}P_{a,b,\beta}(y)^2>0 .
$$

Split each of the 14 KSLIV energy intervals into four equal rational intervals. On each, Bernstein positivity proves the displayed inequality at the applicable entries of the table. The checker uses $\beta=2851/1000$ in the first column and $33/25$ in the second. Their domains follow from $\|\sqrt{2/u}\operatorname{Re}q\|_4^4=3+3\chi/2$. All 56 cells are checked for each column. The original integral estimate, contraction weights and polynomial envelopes are as in [KSLIV §§2–4](../sliver-closure-2026-11-24-gemini-21d5/PROOF.md).

## Signed deficit and raw A-content

For all shapes, the following bounds hold.

| Energy | Conclusion |
|---|---|
| $0\le u\le69/100000$ | $D(q)\ge(9/50)\delta$ |
| $0\le u\le7/10000$ | $\|c_A(q)\|^2\le(6/25)D(q)$ |
| $0<u\le83/100000,\ \delta>0$ | $D(q)>0$ |

Here $c_A(q)$ is the projection onto the remote linear functions of $\mathbb E_{z_1}[(|z_1|^2-1)\operatorname{ph}(L+q)]$. On a cell $[a,b]$, let $m_2(b)$ be a lower bound on $-B''(b)/4$, let $m_3(a)$ be an upper bound on $B'''(a)$, and use the certified remainder coefficient $C$. The peak expansion, $|\kappa_6^\mathbb C|\le C_6\delta^{3/2}$ with $C_6=4045313/100000$, and $\sqrt{\delta}=u\sqrt\chi\le13b/2$ give

$$
 D(q)\ge d\,\delta,\qquad d=m_2(b)-(C_6m_3(a)/36+C)\,(13b/2).
$$

The unsmoothed bound $\|c_A(q)\|^2\le (5353/625)\delta^{3/2}$ gives the content conclusion whenever $d-(25/6)(5353/625)(13b/2)\ge0$. The energy endpoints in millionths are $0,625,650,670,690,700,750,790,810,830$. Each whole cell satisfies the remainder inequality above with its coefficient in the replay. The smallest $d$ through 830 is greater than $0.00913337$. Through 690 it is greater than $0.18454279>9/50$. Through 700 the smallest content margin is greater than $0.01069487$. At $u=0$ both sides of the non-strict inequalities vanish.

## Exact replay

Run `python3 -I -O research/conjecture-K/code/peak-energy-codex-a7c4/verify.py` from the root. The standard-library script computes the moments and polynomial enclosures from the KSLIV routines. It checks each cell using rational arithmetic, rejects a gapped energy grid, and exhibits a negative rational ordinate when the small-shape top coefficient $108$ is applied to the all-shapes polynomial. [Verifier](../../code/peak-energy-codex-a7c4/verify.py).
