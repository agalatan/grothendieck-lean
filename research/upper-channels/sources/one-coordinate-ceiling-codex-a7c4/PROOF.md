# The alternating ceiling for one complex Gaussian coordinate

Agent-ID: codex-a7c4. Paper proof and rational certificate, author only.

**Theorem.** The supremum of the alternating sum over all charge-one disk-valued rounding maps of one complex Gaussian coordinate and all contractive real polynomial preprocessors is exactly Haagerup's phase value, $W_1^*=\gamma^\dagger$. The maximizers have $P(-1)=1$ and $G(z)=c\operatorname{ph}(z)$ almost everywhere for $|c|=1$. The proof gives a weighted stability estimate and also bounds the absolute bilinear form with different radial responses on each side.

This answers the one-coordinate part of the [article's alternating-sum question](https://github.com/agalatan/grothendieck-lean/blob/993f838205907bdcde328961b43febff1adb2885/haagerup-article/main.tex#L1202). Since the transfer slope of a mixture satisfies $D\le W$ and $W$ is linear in its coefficients, a mixture made entirely from one-coordinate channels cannot prove a constant below $1/\gamma^\dagger$ by that transfer. The two-coordinate reflected channel in the article already has a larger alternating sum. The theorem here determines the obstruction for the entire one-coordinate class.

Let the standard complex Gaussian have density $\pi^{-1}e^{-|z|^2}$. A measurable charge-one disk response has the form $G(re^{i\theta})=e^{i\theta}f(r)$, $|f|\le1$, up to Gaussian null sets. If equivariance is given only almost everywhere for each rotation, first replace $G$ by its angular Fourier projection of frequency one, which agrees with $G$ in $L^2$. Values at zero are immaterial. The radial probability measure is $d\mu(r)=2re^{-r^2}\,dr$. For $k\ge0$ set $\phi_k(r)=rL_k^{(1)}(r^2)/\sqrt{k+1}$. These form an orthonormal basis of $L^2(\mu)$ by the complex Hermite expansion in charge one. The Hermite convention can insert $(-1)^k$ in this basis, which disappears from the squared coefficients. Write $a_k=\langle\phi_k,f\rangle_{L^2(\mu)}$ and set

$$W_+(f)=\sum_{k\ge0}(-1)^k|a_k|^2.\tag{1}$$

### Reduction to the endpoint

For a real polynomial $P$ of coefficient $\ell^1$ norm at most one, put $t=P(-1)\in[-1,1]$. The series of a one-coordinate channel is $\sum_{k\ge0}|a_k|^2 X^kP(X)^{2k+1}$. This converges in coefficient $\ell^1$ by Parseval and the convolution norm inequality, so its alternating sum is $W(G,P)=\sum_k(-1)^k t^{2k+1}|a_k|^2$. For $c\in[0,1]$, the Gaussian operator $N_cG(z)=\mathbb E[G(cz+\sqrt{1-c^2}Z)]$ is disk-valued and charge one. It acts on a Hermite component of total degree $d$ by $c^d$. For a proof, take expectations in the Wick generating function $\exp(uz+v\bar z-uv)$ after substitution of $cz+\sqrt{1-c^2}Z$. The result is the same generating function with $(u,v)$ replaced by $(cu,cv)$. Gaussian invariance makes $N_c$ an $L^2$ contraction, extending the calculation to arbitrary measurable disk maps. Thus, with $f_c$ the radial amplitude of $N_cG$,

$$ W(G,P)=\operatorname{sgn}(t)W_+(f_{\sqrt{|t|}}), \qquad W(G,P)=0\text{ when }t=0.\tag{2} $$

### A real symmetric integral kernel for (1)

The unitary $U:L^2(\mu)\to L^2((0,\infty),r\,dr)$ is $Uf(r)=\sqrt2e^{-r^2/2}f(r)$. On this latter space let $\mathcal H_1g(r)=\int_0^\infty J_1(rs)g(s)s\,ds$ be the Hankel transform of order one. It is unitary by restriction of the unitary two-dimensional Fourier transform, with normalization $(2\pi)^{-1}e^{-ix\cdot\xi}$, to the first angular harmonic. The angular integration contributes the factor $-i$, which is omitted in $\mathcal H_1$. In particular the integral represents $\mathcal H_1g$ almost everywhere for $g\in L^1(s\,ds)\cap L^2(s\,ds)$.

Here is a direct verification of the diagonalization. Angularly integrating the elementary two-dimensional Fourier transform of a Gaussian gives $\int_0^\infty se^{-as^2}J_0(rs)\,ds=(2a)^{-1}e^{-r^2/(4a)}$, $a>0$. Differentiation in $r$ gives

$$\int_0^\infty s^2e^{-as^2}J_1(rs)\,ds=\frac r{4a^2}e^{-r^2/(4a)}.$$

Multiply the Laguerre generating function by $se^{-s^2/2}$ to obtain $s(1-z)^{-2}\exp[-(1+z)s^2/(2(1-z))]$. Its Hankel transform for real $z$ near zero is $r(1+z)^{-2}\exp[-(1-z)r^2/(2(1+z))]$, the same function with $z$ replaced by $-z$. Each Taylor coefficient may be taken under the integral at zero by Gaussian domination on a sufficiently small complex disk. Comparing coefficients gives $\mathcal H_1 U\phi_k=(-1)^k U\phi_k$. Parseval now gives (1) as $\langle Uf,\mathcal H_1Uf\rangle$. For bounded $f$, $Uf$ is absolutely integrable against $r\,dr$ and $|J_1|\le1$, so the double integral below converges absolutely:

$$ W_+(f)=2\iint J_1(rs)\,\overline{f(r)} f(s)\,dm(r)dm(s),\qquad dm(r)=re^{-r^2/2}\,dr.\tag{3} $$

### The positive row integral and the Hilbert–Schmidt test

Define $b(r)=\int J_1(rs)\,dm(s)$. Integrating the defining series of $J_1$ termwise gives

$$b(r)=\sqrt{\frac\pi8}\,r\,{}_1F_1\left(\frac32;2;-\frac{r^2}2\right)=\frac r{\sqrt{2\pi}}\int_0^1 e^{-r^2x/2}\sqrt{\frac{x}{1-x}}\,dx.\tag{4}$$

For the first equality, the sum of absolute Bessel series terms is bounded by $e^{rs}$, integrable in $s$ against $dm$ for fixed $r$. The coefficient at order $r^{2k+1}$ is $(-1)^k\sqrt{\pi/8}\,(3/2)_k/[2^k(2)_k k!]$. For the second, expand the exponential under the integral and use $B(k+3/2,1/2)$. Thus $0<b(r)\le1$ for every $r>0$. The probability measure $dm$ gives zero mass to $0$. Let $M=\int b\,dm$. Equation (3) gives $2M=W_+(1)=\gamma^\dagger$, the established phase evaluation. Equivalently one can compute the phase coefficients directly as $|a_k|^2=\pi\binom{2k}{k}^2/[4(k+1)16^k]$ and use the integral evaluation in the article's phase-ceiling proposition.

On $L^2(dm)$ consider the real symmetric kernel

$$ T(r,s)=\frac{J_1(rs)}{\sqrt{b(r)b(s)}}.\tag{5}$$

If its Hilbert–Schmidt integral is finite, it defines a compact self-adjoint operator. Equation (4) and the definition of $b$ give the eigenfunction $T\sqrt b=\sqrt b$ of norm $\sqrt M$. For $v=\sqrt b\,f$ the form and its normalization are

$$W_+(f)=2\langle v,Tv\rangle,\qquad \|v\|^2=\int b|f|^2\,dm\le M.\tag{6}$$

The [Gaussian integral proof](GAUSSIAN_BOUND.md) gives $C<1.82$ by ten polynomial endpoint comparisons and elementary tail bounds. This already proves the ceiling and its equality cases. The stronger stability constant below uses a separate estimate,

$$C=\iint\frac{J_1(rs)^2}{b(r)b(s)}\,dm(r)dm(s)<139/100.\tag{7}$$

Indeed for $e=\sqrt{b/M}$ the projection $E=e\otimes e$ commutes with $T$, and $TE=ET=E$. Consequently $\|T-E\|_{\mathrm{op}}\le\|T-E\|_{\mathrm{HS}}=\sqrt{C-1}=:q<5/8$. The identity for the Hilbert–Schmidt norm follows by decomposition along $e$ and its orthogonal complement. This proves both $-qI\le T\le I$ and simplicity of the upper endpoint eigenvalue $1$. The modulus of the endpoint functional and the sharper negative bound follow:

$$ -q\,\gamma^\dagger\le W_+(f)\le\gamma^\dagger.\tag{8}$$

Therefore $W(G,P)\le\gamma^\dagger$ for every admissible pair $(G,P)$, and $G=\mathrm{ph}$, $P=1$ attains the bound. In the notation of the article, $W_1^*=\gamma^\dagger$. More generally (2) and (8) give $|W(G,P)|\le\gamma^\dagger$ and $W(G,P)\le q\gamma^\dagger$ if $P(-1)\le0$.

### Equality and a quantitative deficit

Write $d\nu=b\,dm/M$ and $\bar f_\nu=\int f\,d\nu$. From $T\le E+q(I-E)$ we obtain

$$\frac{\gamma^\dagger-W_+(f)}{\gamma^\dagger}\ge\int(1-|f|^2)\,d\nu+(1-q)\int|f-\bar f_\nu|^2\,d\nu.\tag{9}$$

Since $b>0$ everywhere on $(0,\infty)$, equality in the upper bound of (8) forces $f$ to be constant and unimodular almost everywhere, and these responses all attain equality. When $0\le c<1$, the law of $cz+\sqrt{1-c^2}Z$ has a strictly positive plane density for every $z$. Equality in $|N_cG(z)|\le1$ at even one $z$ would force $G$ to equal a single unit constant on the plane almost everywhere by the equality case of the triangle inequality. Charge one excludes this. Consequently (2), (8) and (9) show that equality $W(G,P)=\gamma^\dagger$ holds exactly when $P(-1)=1$ and $G$ is a constant unit multiple of phase almost everywhere.

The same norm argument also yields $|2\iint J_1(rs)\overline{f(r)}g(s)\,dm(r)dm(s)|\le\gamma^\dagger$ for two distinct disk-valued radial amplitudes. In particular, allowing different one-coordinate radial responses still gives the same absolute ceiling.

### Exact enclosure of the Hilbert–Schmidt integral

Put $x=r^2/2$. Substitution $t\mapsto1-t$ in the beta integral (4), followed by expansion of the positive exponential, gives
$$
 \frac{r e^{-r^2/2}}{b(r)}=\sqrt{8/\pi}\ p(r),\qquad
 p(r)=\left(\sum_{k=0}^\infty c_k x^k\right)^{-1},\qquad
 c_k=\frac{(1/2)_k}{(2)_k k!}.
$$
Here $p(0)=1$, $p$ decreases, and every Taylor coefficient in the denominator is positive. The squared norm in (7) is therefore
$$ C=\frac8\pi\int_0^\infty\int_0^\infty p(r)p(s)J_1(rs)^2\,dr\,ds. $$
An exploratory Gauss–Legendre integration gives $C\approx1.3441$ (**N**). The following upper bound uses integers and rationals throughout.

* **Radial tails.** On $r\ge R=8$, retain just term $k=16$ to get $\int_R^\infty p(r)dr\le A:=R/[(2k-1)c_k(R^2/2)^k]$. The two exterior strips, including their intersection, contribute at most $(8/\pi)(2RA+A^2)<23/10^9$, since $|J_1|\le1$.
* **Radial weights inside the square.** On $[i/N,(i+1)/N]$, $N=256$, use the reciprocal of the first seventeen denominator terms at $i/N$. The verifier rounds each weight upwards on the scale $2^{-32}$.
* **Bessel bounds on the product cells.** At each sample $v=k/N$ between 0 and 64, evaluate the Taylor polynomial $\sum_{j=0}^{110}(-1)^j(v/2)^{2j+1}/[j!(j+1)!]$ exactly, using a common integer denominator. The absolute remainder is bounded by the first omitted term at 64, less than $2^{-32}$: the absolute term ratio is below one beyond this cutoff. The representation $J_1(v)=\pi^{-1}\int_0^\pi\cos(\theta-v\sin\theta)\,d\theta$ gives $|J_1|,|J_1'|\le1$. For the two radial cells use the mesh point nearest their product of midpoints; add the farthest distance from that point to the two endpoints of the product interval. Squaring the resulting bound (capped at one) bounds $J_1(rs)^2$ throughout the rectangle.
* **Assembly.** Sum the upper bounds times the cell area $1/N^2$, exploiting symmetry. Use $333/106<\pi$ for the overall upper factor and add the exterior strips. The verifier returns $C<1.39$ and hence $q<5/8$. Replacing the Bessel estimate everywhere by $|J_1|\le1$ fails the test $C<2$.

For the proof without quadrature, run `python3 -IB research/upper-channels/code/one-coordinate-ceiling-codex-a7c4/verify_algebra.py`. For the stronger gap, run `python3 -IB research/upper-channels/code/one-coordinate-ceiling-codex-a7c4/verify.py` from the repository root. It takes no input files or external libraries. The comparisons use exact fractions even when Python assertions are disabled.

For comparison, the real, one-dimensional sign-rounding problem is treated by Braverman, Makarychev, Makarychev and Naor, Theorem 1.4 and Lemma 2.4. Restricting a complex coordinate to its charge-one angular harmonic produces the order-one Bessel kernel in (3). [Braverman et al.](https://doi.org/10.1017/fmp.2013.4)
