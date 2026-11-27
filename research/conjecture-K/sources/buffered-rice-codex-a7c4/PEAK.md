# Peak remote deficit through energy 7/500 for every fourth excess

At the peak profile, let $L=Z(a+b|Z|^2)$ with $a=699/1250,\ b=179/1250$. If the remote cubic $q$ is independent of $Z$, set $u=\mathbb E|q|^2$ and $D(q)=2\mathbb E|L+\sqrt u W|-2\mathbb E|L+q|$, with $W$ a fresh standard proper Gaussian. For $u>0$ write $\chi=\mathbb E|q|^4/u^2-2$. Then $D(q)>0$ for $0<u\le7/500,\ \chi>0$. Equality holds at $u=0$ and in the Gaussian limit. This extends the previous all-shapes interval through $83/100000$. For $\chi\le49/100$ we use the peak estimate graded **P + C, author only** in row 3.29 through $463/10000$. The argument below handles $\chi\ge49/100$ directly. It uses the independence of the remote field and the visible variable. [Prior ranges, rows 3.19a and 3.29](../../STATUS.md)

## Average the curvature over the actual visible law

By the visible-mixture identity, $L$ has the law of $\sqrt V Z_0$ with $V>0$ independent of $Z_0,q,W$. Write $M_j=\mathbb E V^{-j}$, $Y=|q|^2/u$, $y=\sqrt\chi$, $A=1+y^2$, $H=3+7y^2+(4045313/100000)y^3$, and $R=\sqrt\pi/2$. For a deterministic buffer define $\rho(x)=\mathbb E|Z_0+\sqrt x|$. The moment-dependent Jensen bound before the final relaxation in 2.12g holds at every $m\ge0$:
$$
\rho(m)-\mathbb E\rho(mY)\ge (R m^2/16)\,e^{-m/2}A^2/(A+mH/4).
$$
[Rice tangent and moment calculation](../rice-response-gap-codex-a7c4/PROOF.md)

For the comparison Gaussian, use $T\sim{\rm Beta}(1/2,3/2)$ in the Rice derivative representation. If $E$ is an independent unit exponential, then $\mathbb E\rho(mE)=R\sqrt{1+m}$. The inequality $e^{-x}\ge(1-x/2)/(1+x/2)$ for $x\ge0$ gives
$$
\frac{\rho(m)-R\sqrt{1+m}}{R}
=\frac12\mathbb E_T\frac{(1+mT)^{-1}-e^{-mT}}{T}
\le \frac{m^2}{16}\,\mathbb E_{T_*}\frac1{1+3mT_*/2}.
$$
Indeed $(1+x)^{-1}-e^{-x}\le x^2/[2(1+x)(1+x/2)]$, and $T_*\sim{\rm Beta}(3/2,3/2)$ is the $T$-weighted law since $\mathbb ET=1/4$. Its first two moments are $1/2,5/16$.

Set $m=u/V$ and use the probability measure tilted by $V^{-3/2}/M_{3/2}$. Under it $\mathbb Em=z=u M_{5/2}/M_{3/2}$ and $\mathbb E m^2/z=u M_{7/2}/M_{5/2}$. The function $e^{-m/2}/(A+mH/4)$ is log-convex, so its mean is at least its value at $z$. For the independent $T_*$ put $X=3mT_*/2$. Cauchy–Schwarz gives $\mathbb E[X/(1+X)]\ge(\mathbb EX)^2/(\mathbb EX+\mathbb EX^2)$. Consequently the deficit divided by $2R u^2M_{3/2}/16$ is at least
$$
\frac{(1-z/2)A^2}{A+zH/4} -1+
\frac{3z/4}{1+(15/16)u M_{7/2}/M_{5/2}} .
\tag{1}
$$

## Exact endpoint check

Moment ratios $M_{j+1}/M_j$ are nondecreasing by log-convexity. At $u\le U=7/500$, take $0\le z\le Z=U M_3/M_2$ and $g=(3/4)/(1+15U M_4/(16M_3))$. To compute the moments, let $\tau$ invert $t(a+bt)^2$ on the positive half-line. The squared visible radius has survival function $e^{-\tau(x)}=\mathbb E e^{-x/V}$. Differentiation for $x>0$, followed by monotone convergence at zero and the local inverse power series, gives $M_j=(-1)^j(d/dx)^j e^{-\tau(x)}|_{x=0}$. Lagrange inversion evaluates this as
$$
M_j=(j-1)!\,a^{-2j}\sum_{i=0}^{j-1}{2j+i-1\choose i}
             (b/a)^i/(j-1-i)!.
$$
[Visible-law derivation and inverse moments](../edgeworth-codex-a7c4/PROOF.md)

After multiplying (1) by its positive first denominator it suffices to prove
$$
(1-z/2)(1+y^2)^2-(1-gz)(1+y^2+zH/4)>0.
$$
Expand in nonnegative powers of $y-7/10$. Each of the five coefficients is a quadratic in $z/Z$ whose three Bernstein coefficients all exceed $1/1000$. This covers the entire ray $y\ge7/10$. The [standalone exact replay](../../code/buffered-rice-codex-a7c4/peak.py) computes all 15 ordinates using rational arithmetic. It uses no sampled distributions or numerical integration.
