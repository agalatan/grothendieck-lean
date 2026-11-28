# Central signed budgets from scaled cubic and fifth tangents

Agent-ID: codex-a7c4. Use the physical operator, coordinates and half-sum and half-difference of [the visible pair bound](VISIBLE_PAIR_BUDGET.md). The target payoff is $10000/14023$. At $d=1/50$ the following sufficient conditions hold in every finite positive dimension for arbitrary unimodular responses. They bound the real payoff in the phase convention used to compute $t$.

| $t$ range | Previous sufficient $\|Qk\|^2$ | New sufficient $\|Qk\|^2$ |
|---|---:|---:|
| $[.837430,.837445]$ | .06500 | .07151 |
| $[.838820,.838850]$ | .06324 | .06940 |
| $[1071/1280,2151/2560]$ | .06129 | .06734 |

Each new threshold may instead be imposed on the smaller quantity
\[
 q_{\rm net}=q-\frac{(1+\nu)p+(2\nu-d)m+d(m-j)}{e-\nu},
 \quad p=\|Pk\|^2,\ q=\|Qk\|^2,\ m=\|k\|^2-p-q,\ j=\|Fk\|^2.
\]
It incorporates the exact contribution of the half-difference after subtracting the constant $\nu$ in the spectral identity. Orthogonality gives $0\le j\le m$.

Write $v=\operatorname{ph}Z$, $T=|Z|^2$, $\rho=1-\operatorname{Re}(\bar v h)$, so $0\le\rho\le2$ and $\mathbb E\sqrt{T}\rho=\mu-t$, where $\mu=\sqrt\pi/2$. Choose $s,b\in[0,1]$. Expanding $\|Qh-sQv\|^2\ge0$ and $\|Fh-bFv\|^2\ge0$ separately bounds the full payoff by
\[
 \nu+(1-\nu)t^2+(e+\nu)(s^2-2s)\pi/32
       +d(b^2-2b)3\pi/256+\mu\mathbb E[\sqrt T\rho W(T)]+(e-\nu)q_{\rm net}.
\]
The joint polynomial is $W(T)=s(e+\nu)(2-T)/2+db(3-3T+T^2/2)/4=W(0)-AT+CT^2$, with $A=s(e+\nu)/2+3db/4$ and $C=db/8$. This formulation allows the two projection coefficients to move with the amplitude cell.

For $r=z^2$, choose $0<r<1$ and $R=128$ with $C(R+r)\le A$. The factorization $W(T)-W(r)=(r-T)(A-C(T+r))$ gives three bounds. For $0\le T\le r$ it is at most $(r-T)(A-Cr)$. For $r\le T\le R$ it is nonpositive. For $T>R$ it is at most $CT^2$ by $A(r-T)-Cr^2\le0$. Using the exponential law for $T$, we obtain
\[
 \mathbb E[\sqrt T\rho W(T)]\le W(r)(\mu-t)+(A-Cr)U(z)
       +2C e^{-R}(R^3+3R^2+6R+6),
\]
where
\[
 U(z)=2\sum_{j=0}^2\frac{(-1)^j z^{5+2j}}{j!(j+3/2)(j+5/2)}.
\]
Indeed $e^{-x}\le1-x+x^2/2$ on $[0,r]$ bounds the core integral, and $T^{5/2}\le T^3$ on the tail. The resulting upper bound is convex in $t$ for fixed $s,b,r$, so closed intervals require just two evaluations.

The [rational replay](code/scaled_visible_budget.py) uses $z=1/3$, with $(s,b)=(.787,.50),(.794,.51),(.80,.53)$ for the respective rows. It also checks $d=.006$ and $.0235$. The missing step is to bound $q_{\rm net}$, or to obtain extra compensation from the same physical pair when this threshold fails.

~~~sh
python3 -IB -O experiments/quintic-signed/code/scaled_visible_budget.py
~~~
