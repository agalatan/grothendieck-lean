# Gaussian radius comparison for a cubic with six times its energy in independent noise

**P + C, author only.** Agent-ID: codex-a7c4.

Let $q\in\mathcal H_{2,1}(\mathbb C^n)$ with $\mathbb E|q|^2=1$, and let $Z$ be an independent standard proper complex Gaussian with $\mathbb E|Z|^2=1$. Set $R=\sqrt\pi/2$. For every dimension and every $0\le s\le 1/6$,
$$
\mathbb E|Z+\sqrt{s}\,q|\le R\sqrt{1+s}.
\tag{1}
$$
As a consequence, the supremum of feasible remote cubic energy at visible first-chaos amplitude $t$ is $\varepsilon^2(R^2-t^2)$ throughout $R\sqrt{6/7}\le t\le R$. Dimensions may vary in this supremum. The arithmetic can be replayed with [the exact Python checker](../../code/buffered-rice-codex-a7c4/verify.py).

## The buffered radius

Write $U=|q|^2$, $y=\sqrt{\mathbb E U^2-2}$ and $\rho(x)=\mathbb E|Z+\sqrt x|$. Conditioning on $q$ identifies the left side of (1) with $\mathbb E\rho(sU)$. The cubic moment bounds give $0\le y^2\le42$ and $\mathbb E U^3\le M=6+9y^2+Cy^3$, where $C=40454/1000$ rounds the sixth-moment coefficient $4045313/100000$ upward. We use three overlapping closed ranges of $y$. [Cubic moment bounds, ledger 3.4](../../STATUS.md)

### Small fourth excess, $0\le y\le 1/11$

Apply the smooth Edgeworth expansion to the cubic $\sqrt{s}\,q$ with deterministic visible variance $V=1$. In the source notation $B(s)=\sqrt\pi\sqrt{1+s}$ and $\delta=s^2y^2$. The fourth correction to $2\mathbb E|Z+\sqrt s q|$ is $\delta B''(s)/4$, and the sixth correction is at most $Cs^3y^3 B'''(s)/36$. The real projection $F=\sqrt2\operatorname{Re}q$ has $\kappa_4(F)=3y^2/2$ by circularity and $\beta^4=\mathbb EF^4=3+3y^2/2<(33/25)^4$. Therefore the uniform resolvent constant $K_\beta$ in equations (9)–(12) is at most $81/20$. [Smooth Edgeworth expansion and resolvent estimate, §§3–4](../cumulant-remainder-codex-a7c4/PROOF.md)

The phase-averaged projection payoff $h(x)=\pi\mathbb E|\operatorname{Re}Z+\sqrt{s/2}x|$ has $\|h^{(7)}\|_\infty\le128(s/2)^{7/2}$ by the derivative estimate in §4 of that proof with $\mathbb EV^{-3}=1$. Multiplying this by $\kappa_4(F)^{3/2}/7$ gives an upper bound $(12\sqrt3/7)s^{7/2}y^3$. For $s,y>0$, the deficit $B(s)-2\mathbb E|Z+\sqrt{s}q|$, divided by $\sqrt\pi s^2y^2$, is consequently at least
$$
\frac1{16(1+s)^{3/2}}
-y\left[\frac{Cs}{96(1+s)^{5/2}}+\frac{81}{20}\frac{12}7\sqrt{3/\pi}\,s^{3/2}\right].
\tag{2}
$$
The first term decreases and both costs increase on $[0,1/6]$. The checker bounds (2) below by $23843983/11441304000>1/500$ at its worst corner. At $y=0$, both correction terms and the remainder vanish. At $s=0$, (1) is equality.

### Intermediate fourth excess, $1/11\le y\le1$

For $T\sim\operatorname{Beta}(1/2,3/2)$, the Rice derivative is $\rho'(x)=(R/2)\mathbb E e^{-xT}$. Thus $\rho(x)/R=1+\tfrac12\mathbb E[(1-e^{-xT})/T]$. For $D\sim\operatorname{Beta}(1,4)$ and $z\ge0$ the integral Taylor remainder gives
$$
1-e^{-z}=z-z^2/2+z^3/6-(z^4/24)\mathbb E e^{-zD}.
$$
Since $\Pr(D>v)=(1-v)_+^4\le e^{-4v}$ for every $v\ge0$, $\mathbb E e^{-zD}\ge(1+z/4)^{-1}$. The $T^3$-weighted law is $\operatorname{Beta}(7/2,3/2)$, of mean $7/10$. Applying Jensen to the reciprocal in the remainder gives a global upper estimate
$$
\frac{\rho(x)}R\le1+\frac x2-\frac{x^2}{16}+\frac{x^3}{96}
-\frac{5x^4}{3072(1+7x/40)}.
\tag{3}
$$
The moments used here are $\mathbb E T=1/4$, $\mathbb E T^2=1/8$ and $\mathbb E T^3=5/64$. [Integral for the Rice derivative](../manuscript/legacy/ch25-parts/30-response-feasibility.tex)

Put $A=2+y^2$ and $M_0=\mathbb E U^3$. Cauchy–Schwarz gives $\mathbb E[U^4/(1+7sU/40)]\ge M_0^2/(A+7sM_0/40)$. The function
$$m\longmapsto s^3m/96-5s^4m^2/[3072(A+7sm/40)]$$
is increasing for $s>0$, $m\ge0$. Indeed, $(m^2/(A+dm))'=(1-A^2/(A+dm)^2)/d\le1/d$ for $d>0$, so the subtracted derivative is at most $25/28$ of $s^3/96$. We may therefore replace $M_0$ by its upper bound $M$.

Taylor's theorem gives $\sqrt{1+s}\ge1+s/2-s^2/8+s^3/16-5s^4/128$, since the fifth derivative is positive. Inserting this and (3) shows that $(R\sqrt{1+s}-\mathbb E\rho(sU))/(Rs^2)$ for $s>0$ is at least
$$
\frac{y^2}{16}-\frac{s(9y^2+Cy^3)}{96}-\frac{5s^2}{128}
+\frac{5s^2M^2}{3072(A+7sM/40)}.
\tag{4}
$$
The rational checker proves strict positivity on every rectangle of a closed cover of $[0,1/6]\times[1/11,1]$.

### Large fourth excess, $1\le y\le\sqrt{42}$

For $x\ge0$, subtract $\rho(x)$ from its tangent at $s$. The integral for $\rho'$ expresses this difference as $(R/2)\mathbb E[e^{-sT}(e^{-z}-1+z)/T]$, where $z=T(x-s)$. For all real $z$,
$$e^{-z}-1+z\ge\frac{z^2}{2(1+z_+/2)}.$$
For $z\le0$ use the quadratic Taylor lower bound. For $z\ge2$ the inequality follows using $e^{-z}\ge0$. For $0\le z<2$ it is equivalent to $e^{-z}\ge(2-z)/(2+z)$, which follows by differentiating $\log((2+z)/(2-z))$. Under the $T$-weighted law, $T\sim\operatorname{Beta}(3/2,3/2)$ with mean $1/2$. Jensen for the positive log-convex function $t\mapsto e^{-st}/(1+t(x-s)_+/2)$ bounds the tangent difference below by $(R/16)e^{-s/2}(x-s)^2/(1+x/4)$.

Take $x=sU$ and expectations. The linear tangent term cancels. Cauchy–Schwarz with the weight $1+sU/4$ gives $\mathbb E[(U-1)^2/(1+sU/4)]\ge (1+y^2)^2/[1+y^2+(s/4)(3+7y^2+Cy^3)]$. Using $e^{-s/2}\ge1-s/2$ yields
$$
\frac{\rho(s)-\mathbb E\rho(sU)}R\ge\frac{s^2}{16}
\frac{(1-s/2)(1+y^2)^2}{1+y^2+(s/4)(3+7y^2+Cy^3)}.
\tag{5}
$$
The cubic part of (3) and the quartic lower bound for $\sqrt{1+s}$ give $(\rho(s)-R\sqrt{1+s})/R\le(s^2/16)(1-5s/6+5s^2/8)$. The checker proves that the quotient in (5) strictly exceeds the last parenthesis throughout $[0,1/6]\times[1,7]$. Every bound in the two rectangle covers uses rational endpoints. The replay independently checks that their union with the small-excess rectangle tiles $[0,1/6]\times[0,7]$. This proves (1).

## The exact remote energy supremum

Use $P=P_{1,0}$, $Q=P_{2,1}$, $p=1/\varepsilon>0$. A response consists of $|f_\pm|\le1$, $h=(f_++f_-)/2$, $k=(f_+-f_-)/2$, $Ph=tZ$ and $F=\varepsilon Qk$. Let $q_{\rm rem}$ be the remote projection of $F$ and $e=\|q_{\rm rem}\|_2^2$. The scalar Rice cut gives $t+p\sqrt{es}\le\mathbb E\rho(s|q_{\rm rem}|^2/e)$ when $e>0$, by testing at $\sqrt{s/e}$. At $R\sqrt{6/7}\le t<R$, take $s=R^2/t^2-1\in(0,1/6]$. Applying (1) gives $t+p\sqrt{es}\le R^2/t$, hence $t^2+p^2e\le R^2$. If $t=R$, divide the increment inequality by $\sqrt s$ and let $s\downarrow0$ to get $e=0$. The zero-energy bound holds directly. [Response cut and sector decomposition](../manuscript/legacy/ch25-parts/30-response-feasibility.tex)

For sharpness take any $t,e\ge0$ with $t^2+p^2e<R^2$. Let $A_j,B_j,C_j$ for $1\le j\le N$ and $Z$ be independent standard proper Gaussians. Put
$$
T_N=N^{-1/2}\sum_j A_jB_j\bar C_j,\qquad S_N=N^{-1}\sum_j |B_j|^2|C_j|^2,\qquad G=T_N/\sqrt{S_N}.
$$
Set $G$ arbitrarily on the null event $S_N=0$. Conditional on all $B,C$, $G$ is standard proper Gaussian, so $(Z,G)$ is independent of $S_N$. The monomials are orthonormal in $\mathcal H_{2,1}$, and $\mathbb E S_N=1$, $\operatorname{Var}(S_N)=3/N$. Hence
$$
d_N=\mathbb E\sqrt{S_N}
=1-\tfrac12\mathbb E\frac{(S_N-1)^2}{(1+\sqrt{S_N})^2}\ge1-\frac3{2N}.
$$
Choose a sufficiently large $N$ that $t^2+p^2e/d_N^2\le R^2$. For the nonzero target choose the unit vector $(a,b)$ parallel to $(t,p\sqrt e/d_N)$ and let $c=\sqrt{t^2+p^2e/d_N^2}/R$. Take $f_\pm=c\operatorname{ph}(aZ\pm bG)$. Gaussian regression gives $\mathbb E[\bar Z h]=cRa=t$, $\mathbb E[\bar T_N k]=cRb d_N=p\sqrt e$. The zero target may use zero responses.

Both responses are invariant under block permutations and under independent rotations $(A_j,B_j,C_j)\mapsto(u_j A_j,v_j B_j,u_jv_j C_j)$. The torus has no invariant remote first-chaos vector, giving $Ph=tZ$. Negating all remote coordinates negates $k$, so $Pk=0$ and the components of $Qk$ with zero or two remote factors vanish. Components with one remote factor vanish by the torus action. The torus weights of the holomorphic coordinates in each block are $x_j,y_j,x_j+y_j$; weights from different blocks have disjoint support. The only invariant remote $(2,1)$ monomials are consequently $A_jB_j\bar C_j$. Permutations force equal coefficients. These symmetries commute with Gaussian chaos projection. Thus $F=\varepsilon Qk=\sqrt e\,T_N$, with $r_A,r_B,Y,W,\nu$ all zero. Every strict disk interior point is feasible at finite dimension. At $t=R$, $f_+=f_-=\operatorname{ph}Z$ realizes $e=0$.

For unimodular responses adjoin one independent complex Gaussian of angle $\theta$ and replace $c$ by $c+i\sqrt{1-c^2}\operatorname{sgn}(\sin4\theta)$. The multiplier has modulus one almost surely and mean $c$. Its centered angular modes have order at least four, so its centered part is orthogonal to every polynomial of total degree at most three in the extra coordinate. Independence preserves both displayed chaos projections. For the zero target the same multiplier with $c=0$ applied to any of the unit phase pairs gives zero projections.

The construction determines the energy supremum. Conditional on $S_N$, the remote cubic has Gaussian variance $eS_N$, so its independent-visible, linearly priced radial payoff is an average of Gaussian-variance payoffs.

At the endpoint $t=R$, taking both responses equal to the visible phase realizes zero remote energy. The [peak-mixture calculation](PEAK.md) separately applies the same Rice curvature estimate to the remote payoff.
