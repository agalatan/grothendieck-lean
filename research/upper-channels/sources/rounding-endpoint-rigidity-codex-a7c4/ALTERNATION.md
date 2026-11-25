# Extremal alternation and the transfer slope

Agent-ID: codex-a7c4. Paper proof and rational threshold. [Independent review by claude-b9ee](https://github.com/agalatan/grothendieck-lean/pull/659#issuecomment-7152972583).

**Theorem.** Let $H$ be any finite convex mixture of common-map charge-one channels in arbitrary finite complex dimensions, with real polynomial preprocessors of coefficient $\ell^1$ norm at most one in each coordinate. Uniformly over all these choices, $|W(H)|\to1$ forces $H_0\to0$ and $D(H)\to-1$. In particular, $|W(H)|\ge99/100$ implies $|H_0|<49/100$ and $D(H)<-1/100$.

Here $W(H)=\sum_{k\ge0}(-1)^kH_k$, $D(H)=H_0+|H_0|-\|H\|_1$, and $\|H\|_1\le1$ by Parseval and the convolution inequality. The conclusion concerns the average score of the mixture and imposes no separate score requirement on its constituents.

## An energy budget for a single Gaussian coordinate

Write $c_j=\mathbb E[\bar Z_j G(Z)]$ and $m=\sum_j|c_j|^2$ for a charge-one disk response $G$ on the standard complex Gaussian space. Only linear chaos terms contribute at degree zero in the channel series: $h_0=\sum_j P_j(0)|c_j|^2$, hence $|h_0|\le m$.

For the alternating score use instead $t_j=P_j(-1)$. Let $Y=NG$ be the coordinatewise Gaussian noise average with correlations $\sqrt{|t_j|}$ and let $R$ negate the coordinates with $t_j<0$. The average $Y$ is still charge one and bounded by one. On charge-one Gaussian $L^2$, let $\Gamma$ multiply total chaos degree $2k+1$ by $(-1)^k$. Let $U$ be the product of $\Gamma$ and pullback by $R$. They commute and are self-adjoint involutions. The squared Hermite coefficient of index $(a_j,b_j)$ acquires under noise the factor $\prod_j|t_j|^{a_j+b_j}$, and the reflection supplies its sign. The absolutely convergent channel series at $-1$ therefore gives $W(h)=\langle Y,UY\rangle$. Put $L=\|G\|_2^2-\|Y\|_2^2$, and let $m'_+$ and $m'_-$ be the first-chaos energies of $Y$ on the positive and negative coordinate subspaces of $R$. Every chaos term loses nonnegative energy under $N$, so
$$m\le L+m'_++m'_- .\tag{1}$$
With $\Pi_-=(I-U)/2$,
$$s:=1-W(h)=(1-\|G\|_2^2)+L+2\|\Pi_-Y\|_2^2.\tag{2}$$

Choose one complex Gaussian coordinate in the positive subspace, directed along the positive first-chaos projection of $Y$. Conditional expectation of $Y$ given this coordinate gives a one-coordinate charge-one disk map $g$ whose first coefficient has modulus $\sqrt{m'_+}$. If $m'_+=0$ use $g=0$. To see that conditional expectation preserves charge, rotate the chosen coordinate and integrate the independent remaining coordinates against their simultaneously rotation-invariant joint law. This conditional projection commutes with $U$: first rotate within the positive subspace to put the chosen direction on one coordinate axis, preserving chaos degrees and commuting with $R$. In this basis conditional expectation deletes exactly the Hermite monomials of positive degree in any discarded coordinate. On the retained coordinate $U=\Gamma$. Let $b$ be the norm of the odd-index projection of $g$, where index $k$ means total degree $2k+1$. This projection and the negative-subspace linear projection of $Y$ are onto orthogonal subspaces of the negative eigenspace of $U$. Thus
$$L+2m'_-+2b^2\le s.\tag{3}$$

## Rational polynomial witnesses

Write $g(re^{i\theta})=e^{i\theta} f(r^2)$, $|f|\le1$. Up to null sets the representation also follows by first taking the angular Fourier projection of frequency one. The variable $x=r^2$ has probability density $e^{-x}$. The normalized one-coordinate radial charge-one Hermite basis is $\phi_k(x)=\sqrt{x}L_k^{(1)}(x)/\sqrt{k+1}$, with $\phi_0(x)=\sqrt{x}$. Given any finite rational linear combination $q=\sum_{k\ {\rm odd}}d_k L_k^{(1)}$, put
$$e=\int_0^\infty\sqrt{x}e^{-x}|1-q(x)|\,dx,\qquad B=\sum_{k\ {\rm odd}}(k+1)d_k^2.$$
Pair $f$ with $\phi_0$, bounding its pairing with $\sqrt{x}(1-q)$ by disk boundedness and with $\sqrt{x}q$ by Cauchy–Schwarz on the odd-index subspace. This gives
$$\sqrt{m'_+}\le e+\sqrt B\,b.\tag{4}$$

Equations (1), (3) and (4) also hold after replacing $s,L,m,m'_+,m'_-,b^2$ by their weighted means over all channels of a mixture. For (4), take the weighted Euclidean norm of the individual inequalities and use its triangle inequality. The averaged $m$ bounds $|H_0|$. Consequently
$$ |H_0|\le s+e^2+2e\sqrt B\,b+(B-2)b^2,\quad 0\le b\le\sqrt{s/2}.\tag{5}$$
Indeed $L+m'_-\le s-2b^2$ by (3). An alternative form obtained by the Euclidean triangle inequality in (1), (4) is
$$ \sqrt{|H_0|}\le e+\sqrt{L+m'_-+Bb^2}\le e+\max(1,\sqrt{B/2})\sqrt{s}.\tag{6}$$
Both estimates hold with $s=1-|W(H)|$: when $W(H)<0$, negate every $P_j$ of every channel. This negates the whole series because all total degrees are odd, preserving $|H_0|$ and $\|H\|_1$.

## Density and a computable uniform modulus

The span of the odd-index functions $\sqrt{x}L_k^{(1)}(x)$ is dense in $L^1(e^{-x}dx)$. Indeed, suppose $f$ is a bounded annihilator, scaled to $\|f\|_\infty\le1$. Define on $\Re z<1$
$$A(z)=\frac{1}{(1-z)^2}\int_0^\infty \sqrt{x}\exp[-x/(1-z)]f(x)\,dx.$$
This is holomorphic by exponential domination locally uniformly. Differentiation under the integral and the generating function $\sum_{k\ge0} L_k^{(1)}(x)z^k=(1-z)^{-2}\exp[-xz/(1-z)]$ show that the $k$th Taylor coefficient is $\int_0^\infty\sqrt{x}L_k^{(1)}(x)e^{-x}f(x)\,dx$. Thus the odd Taylor coefficients vanish. The identity $A(z)=A(-z)$ extends from near zero to $-1<\Re z<1$; reflection now extends $A$ to an entire function. Direct integration of the bound on the integrand gives
$$ |A(z)|\le \frac{\sqrt\pi}{2}\frac{|1-z|}{(1-\Re z)^{3/2}}\quad(\Re z<1).$$
This is at most $(\sqrt\pi/2)(1+|z|)$ on the left half-plane and the reflected expression gives that bound on the right. Cauchy's estimates make $A$ a polynomial of degree at most one. But $|A(-t)|\le(\sqrt\pi/2)(1+t)^{-1/2}$ for $t>0$, so $A=0$. All Laguerre coefficients of $f$ vanish, hence $f=0$ by completeness of the displayed orthonormal basis (bounded $f$ belongs to $L^2(e^{-x}dx)$). The $L^1$ duality theorem and Hahn–Banach give density. One may use real scalars and real annihilators, since the target $\sqrt{x}$ is real.

Rational finite combinations have the same closure. Thus errors $e$ arbitrarily close to zero can be certified by enumerating rational coefficient lists and dovetailing rational upper enclosures for their errors. On each compact interval $[0,T]$, rational subdivisions with interval bounds on the square root, exponential and polynomial converge. For integer $T\ge1$, writing $1-q(x)=\sum_j a_jx^j$, the tail is bounded by
$$2^{-T}\sum_j |a_j|(j+1)!\sum_{\ell=0}^{j+1} T^\ell/\ell!,$$
using $\sqrt{x}\le x$ for $x\ge1$, elementary integration by parts, and $e^{-T}\le 2^{-T}$. This tends to zero for any fixed polynomial. For any rational $\eta>0$, the search finds a strict upper enclosure $e<\eta$. By (6), once $\sqrt{s}<\eta/\max(1,\sqrt{B/2})$ we have $\sqrt{|H_0|}<2\eta$. This proves the asserted uniform limit since $|W(H)|\le\|H\|_1\le1$.

## A single polynomial rules out a positive slope at score 0.99

Use $q(x)=3L_1^{(1)}(x)/5=3(2-x)/5$, so $B=18/25$. The signed integral of $\sqrt{x}(1-q(x))$ under $e^{-x}dx$ is $7\sqrt\pi/20$, and its integrand changes sign at $x=1/3$. For the correction on $[0,1/3]$ use $e^{-x}\le1-x/2$, following from $e^{-x}\le1-x+x^2/2$. Then
$$ e\le\frac{7\sqrt\pi}{20}+2\int_0^{1/3}\sqrt{x}(1/5-3x/5)(1-x/2)\,dx
=\frac{7\sqrt\pi}{20}+\frac{52}{1575\sqrt3}<\frac{16}{25}.$$
Indeed $\pi<22/7$, $\sqrt{22/7}<1773/1000$ and $\sqrt3>173/100$ suffice, the latter two bounds being rational squarings. Replacing $e$ in (5) by $e_0=16/25$ strictly increases the upper bound. For $s\le1/100$ its quadratic in $b$ is increasing on $[0,\sqrt{s/2}]$, since $e_0\sqrt{18/25}>(2-18/25)/\sqrt{200}$. At $b=\sqrt{s/2}$ this gives $|H_0|<(e_0+(3/5)\sqrt{s})^2\le(16/25+3/50)^2=49/100$. Finally $D(H)\le 2|H_0|-\|H\|_1<98/100-99/100=-1/100$.

## The same threshold for different left and right responses

The proof extends to a pair of charge-one disk maps $F,G$ whenever its channel series is real. Put $m=(m_F+m_G)/2$, where $m_F,m_G$ are their linear chaos energies. Then $|h_0|=|\sum_j P_j(0)\overline{c_j(F)}c_j(G)|\le\sqrt{m_Fm_G}\le m$, with $c_j(F)=\mathbb E[\bar Z_jF]$. As before use $t_j=P_j(-1)$ to define the Gaussian noise $N$ and reflection $R$. Let $A=NF$, $C=(NG)\circ R$, $V=(A+C)/2$, and $T=(A-C)/2$. Both $V,T$ are charge-one disk maps. The Hermite multipliers give $W(h)=\operatorname{Re}\langle\Gamma A,C\rangle$. Since $\Gamma$ is self-adjoint, the cross terms cancel on taking the real part. Writing $\Pi_\pm=(I\pm\Gamma)/2$ therefore gives
$$s=1-W(h)=1-\frac{\|A\|_2^2+\|C\|_2^2}{2}+2\|\Pi_-V\|_2^2+2\|\Pi_+T\|_2^2.$$

The first term is at least $L=(\|F\|_2^2-\|A\|_2^2+\|G\|_2^2-\|C\|_2^2)/2$. Each chaos loses nonnegative energy under smoothing. By the parallelogram identity on the linear chaos, $m\le L+m'_++m'_-$ with $m'_+=\|P_1V\|_2^2$ and $m'_-=\|P_1T\|_2^2$, where $P_1$ denotes the linear chaos projection. Condition $V$ on a coordinate along $P_1V$ and let $b$ be its conditional odd-index norm as above. Since this conditioning commutes with $\Gamma$, $b\le\|\Pi_-V\|_2$ and the witness estimate gives $\sqrt{m'_+}\le e+\sqrt B\,b$. Every linear function has positive $\Gamma$ sign, so $m'_-\le\|\Pi_+T\|_2^2$. Thus $L+2m'_-+2b^2\le s$. These are the same inequalities (1), (3), (4), including the bound on $|h_0|$. Their mixture and sign arguments apply verbatim. Cauchy–Schwarz on the mixed Hermite coefficients gives $\|H\|_1\le1$ after contractive preprocessing. In particular $|W(H)|\to1$ forces $D(H)\to-1$, and $|W(H)|\ge99/100$ forces $|H_0|<49/100$ and $D(H)<-1/100$ even for mixtures of such pairs.
