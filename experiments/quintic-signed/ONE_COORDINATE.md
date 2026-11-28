# One arbitrary response on a complex Gaussian coordinate

Let $P,Q,F$ denote the physical Gaussian projections of bidegrees $(1,0),(2,1),(3,2)$. Set $e=191/250$, $\nu=47/2000$, $0\le d\le\nu$, $\alpha=1-\nu$, $\beta=e+\nu$ and $S=\nu I+\alpha P-\beta Q-dF$. Write $\mu=\sqrt\pi/2$ and
\[
 B_d=\nu+\mu^2(\alpha-\beta/8-3d/64).
\]
In any finite dimension, suppose one response is a measurable disk-valued function of a single standard complex **linear** Gaussian coordinate. The other response may be any measurable disk-valued function of all coordinates. The absolute payoff is less than $B_d+2\cdot10^{-54}$. The visible phase paired with itself attains $B_d$. Thus this determines the supremum on that class to within $2\cdot10^{-54}$, for the whole debit interval.

* For $d=1/50$ the absolute payoff is below $0.712392364069987$, with reciprocal above $1.40372082918867$.
* For $d=47/2000$ it is below $0.712263509683805$, with reciprocal above $1.40397477394838$. The [300,001-coordinate stress pair](FINITE_GRADED_LIFT.md) exceeds the $1.4023$ target at this very debit.
* Every $d\ge.000394$ in the stated interval passes the $1.4023$ test on this response class. At $d=.00039399$ the visible phase already exceeds the target payoff. The [radial flip](VISIBLE_PAIR_BUDGET.md) gives strictly more than $B_d$ on a diagonal pair for every $d>0$.

The [fresh-coordinate extension](REMOTE_CUBIC_MULTIPLIER.md) bounds arbitrary pairs by retaining just the purely remote cubic contribution.

## Both signs of the witness in one coordinate

For $Z$ standard proper complex Gaussian, put $T=|Z|^2\sim\mathrm{Exp}(1)$. In one complex coordinate the three ranges are lines spanned by the unit vectors
\[
 z=Z,\quad q=Z(T-2)/\sqrt2,\quad v=Z(T^2-6T+6)/\sqrt{12}.
\]
For $u_0=\operatorname{ph}Z$, their coefficients are $\mu$, $a=-\mu/(2\sqrt2)$, $b=3\mu/(8\sqrt3)$. These follow by integrating $T^{j+1/2}$. Define
\[
 L=\alpha\mu z-\beta a q-db v=\mu Z p_d(T),\quad p_d(t)=\alpha+\beta(t-2)/4-d(t^2-6t+6)/16,
\]
$M=\alpha\mu^2-\beta a^2-db^2=B_d-\nu$ and $\Lambda=\nu+(1+\epsilon)|L|$ with $\epsilon=10^{-54}$. We prove both signed quadratic-form inequalities $-\Lambda\le S\le\Lambda$ on the weighted form domain, which contains all bounded responses.

**Positive sign.** $\mathbb E(\overline{u_0}L)=M>1/2$. The concave polynomial $p_d$ is nonnegative on $[0,142]$ by evaluating at $0,142$ and both endpoint debits. Its absolute coefficients sum to less than one. On $t\ge142$, $\mu\sqrt t |p_d(t)|\le t^3$, so
\[
 0\le\mathbb E|L|-M\le2\int_{142}^\infty t^3e^{-t}dt<\epsilon/2.
\]
For any $u$ in the form domain, Cauchy–Schwarz applied to $L,q,v$ gives
\[
 \alpha^2\mu^2|\langle z,u\rangle|^2\le
 \left(\frac{\mathbb E|L|}{1+\epsilon}+\beta a^2+db^2\right)
 \left(\mathbb E[(\Lambda-\nu)|u|^2]+\beta|\langle q,u\rangle|^2+d|\langle v,u\rangle|^2\right).
\]
Indeed $|\langle L,u\rangle|^2\le\mathbb E|L|\,\mathbb E[|L||u|^2]$. The first factor is at most $M+\beta a^2+db^2=\alpha\mu^2$, which proves the positive sign. Also $\mathbb E\Lambda\le\nu+(1+\epsilon)^2M<B_d+2\epsilon$. At $d=1/50$ one can take cutoff 166 and $\epsilon=10^{-64}$.

**Negative sign.** It suffices, by weighted Cauchy–Schwarz for each negative mode, that
\[
 \mathbb E\frac{\beta |q|^2+d|v|^2}{\Lambda+\nu}<1.
\]
For $0\le t\le32$, $p_d(t)\ge c+bt$ with $c=9/16$, $b=5/32$. Again concavity and the two endpoint debits suffice. Using $d\le\nu$, the contribution on this interval is bounded by integrating $N(t)/(c+bt)$ against the probability measure $\sqrt t e^{-t}\,dt/\mu$, where
\[
 N(t)=\beta(t-2)^2/2+\nu(t^2-6t+6)^2/12.
\]
Let $J(t)=t(t-2)^2(t-5)^2$, $x=-c/b$, and $\gamma=-N(x)/J(x)>0$. Then $H=(N+\gamma J)/(c+bt)$ is a polynomial nonnegative on $[0,\infty)$ which majorizes $N/(c+bt)$. Its integral over the full half-line is exactly $188217137/202272000$. On $t\ge32$, the original numerator is at most $t^5$ and $\Lambda+\nu\ge2\nu$. The total trace is below $.931$ after adding $(2\nu)^{-1}\int_{32}^\infty t^5 e^{-t}dt$. This proves the negative sign.

Rotate $g$ so the payoff is real. For $h=(f+g)/2$, $k=(f-g)/2$, self-adjointness gives $\mathrm{Re}\langle f,Sg\rangle=\langle h,Sh\rangle-\langle k,Sk\rangle$. The two inequalities bound this by $\mathbb E\Lambda(|h|^2+|k|^2)\le\mathbb E\Lambda$. The functions may have arbitrary angular dependence.

## An unrestricted partner and approximate dependence

For any unit complex linear Gaussian coordinate $X$, let $D$ be conditional expectation onto $X$. In physical coordinates with $X$ first, each product Hermite is either a function of $X$ or has a positive-degree factor in a fresh coordinate and is killed by $D$. Thus $D$ commutes with $P,Q,F$ and $S$; unitary coordinate invariance gives this for every $X$. On $D L^2$, $S$ is exactly the one-coordinate operator above. If $f=Df$, then $\langle f,Sg\rangle=\langle f,S Dg\rangle$ and conditional expectation preserves the disk. This proves the stated all-dimensional result, including any two responses depending on different linear coordinates.

For approximate dependence let $f_\perp=f-Df$, $g_\perp=g-Dg$. The conditional means have absolute payoff at most $B_d+2\epsilon$. The remaining payoff is exactly $\langle f_\perp,Sg_\perp\rangle$, of norm at most $\|f_\perp\|\|g_\perp\|$. Choose $X$ along $Pf$ when it is nonzero. Then $P f_\perp=0$; if $Pf=0$ this holds for every $X$. Writing $R=I-P-Q$, the remaining absolute cost is at most
\[
 e\|Qf_\perp\|\,\|Qg_\perp\|+\nu\|Rf_\perp\|\,\|Rg_\perp\|,
\]
since the eigenvalues on $R$ are $\nu-d,\nu$. The [exact arithmetic replay](code/one_coordinate_multiplier.py) uses polynomial identities, integer gamma moments, the exponential series and Machin bounds for $\pi$.

~~~sh
python3 -IB -O experiments/quintic-signed/code/one_coordinate_multiplier.py
~~~

Agent-ID: codex-a7c4
