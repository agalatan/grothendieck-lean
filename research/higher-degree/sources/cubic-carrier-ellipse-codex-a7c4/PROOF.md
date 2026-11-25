# A joint bound on the first and third chaos of a pair of phases

Agent-ID: codex-a7c4. Paper proof and exact arithmetic, author only.

On complex Gaussian space let $h=(f+g)/2$ and $k=(f-g)/2$ for measurable unit-modulus functions $f,g$. Denote the complex Hermite projections by $P_{a,b}$. Set $t=\|P_{1,0}h\|_2$, $U=P_{2,1}k$ and $u=\|U\|_2$. Let $\rho_*$ be the supremum of $\mathbb E|Q|/\|Q\|_2$ over nonzero $Q\in H_{2,1}$ and all finite complex dimensions. Then in every dimension

$$\boxed{\quad u^2+\frac{2}{\pi}t^2\le\rho_*^2.\quad} \tag{1}$$

The two quantities on the left may depend on exactly the same Gaussian coordinates. For the capped degree-five game this implies an unconditional payoff below $500/701$ throughout $0\le t\le0.31720829$ using the independently reviewed radius $2287/2500$. Using the stronger recorded radius $4571/5000$ gives $t\le0.31975417$. The latter input has author-checked paper proof and independently replayed arithmetic as labelled in [Conjecture K ledger, row 3.7](../../../conjecture-K/STATUS.md). The existing Gaussian-buffer estimate gave $0.25282$ and $0.25465$, respectively. [Gaussian-buffer proof](../buffer-surplus-codex-a7c4/PROOF.md)

The linear lift was also derived independently in [PR #658](https://github.com/agalatan/grothendieck-lean/pull/658). The [elliptic lift](ELLIPTIC.md) proves the open coefficient comparison proposed there and extends the sector-free interval to $0.35859076$ using the existing mass inequality.

## Lifting a pair of phases to one phase

Rotate coordinates so $P_{1,0}h=tz$, with $z$ a standard complex Gaussian; at $t=0$ choose any unit coordinate. On fresh independent complex Gaussians $v_1,w_1,\ldots,v_m,w_m$ put

$$Y_m=\frac{1}{\sqrt{2m}}\sum_{j=1}^m(|v_j|^2-|w_j|^2).$$

This is a real, symmetric, variance-one element of $H_{1,1}$. Its law has no atom at zero. The sign $s_m=\operatorname{sgn}Y_m$ has mean zero and is independent of all original Gaussian coordinates. Define

$$F_m=k+s_m h.$$

On $s_m=1$ this is $f$ and on $s_m=-1$ it is $-g$, so $|F_m|=1$. The projection of any unit-modulus function $F$ onto $H_{2,1}$ has norm at most $\rho_*$: for a unit vector $Q$ in that subspace, $|\langle Q,F\rangle|\le\mathbb E|Q|$. Apply this in the enlarged dimension to $F_m$.

The original cubic subspace and $zY_m$ are orthogonal since $\mathbb E Y_m=0$. The product $zY_m$ belongs to $H_{2,1}$, with unit norm, because its factors are Wick polynomials on disjoint coordinates. The projection of $F_m$ onto the original cubic subspace is $U$, since its conditional mean over the new coordinates is $k$. The new coordinate of this same projection is

$$\langle zY_m,F_m\rangle=\mathbb E[Y_m s_m]\,\mathbb E[\bar z h]=t\,\mathbb E|Y_m|.$$

Bessel's inequality gives $u^2+t^2(\mathbb E|Y_m|)^2\le\rho_*^2$ for each finite $m$. The summands are independent with finite variance, so the real central limit theorem gives $Y_m\Rightarrow N(0,1)$. Their common second moment gives uniform integrability of the absolute values. Therefore $\mathbb E|Y_m|\to\sqrt{2/\pi}$, proving (1).

There is an exact finite-dimensional version. A difference of independent unit exponentials has characteristic function $(1+s^2)^{-1}$. Consequently $Y_m$ has the same law as $\sqrt{A/m}\,N$ with $A\sim\mathrm{Gamma}(m,1)$ and $N$ an independent standard real normal. Since $\mathbb E\sqrt A=\Gamma(m+1/2)/\Gamma(m)$,

$$ (\mathbb E|Y_m|)^2=\frac{2m}{16^m}\binom{2m}{m}^2. \tag{2}$$

Already $m=10$ suffices for $t=0.31$ with the reviewed radius. The coefficient $2/\pi$ is best among these carriers, by the limit and by Jensen for the square root of the mixing variance. More generally, the same upper bound holds for every real symmetric $Y\in H_{1,1}$ with variance one. Diagonalizing its Hermitian matrix writes $Y=\sum_j\lambda_j(|v_j|^2-1)$. To see that the nonzero eigenvalues come in opposite pairs, use the symmetry of its law near zero in the cumulant generating function $\log\mathbb E e^{tY}=\sum_{k\ge2}(\sum_j\lambda_j^k)t^k/k$. All odd power sums of orders $k\ge3$ vanish. Divide by the largest eigenvalue magnitude to power $k$ and send odd $k$ to infinity to pair its positive and negative multiplicities. Removing these eigenvalues and repeating proves the assertion. Thus $Y$ is a sum of independent scaled symmetric Laplace variables, hence a variance mixture of centered real normals, and Jensen yields $\mathbb E|Y|\le\sqrt{2/\pi}$. This sharpness is only for this class of independent symmetric quadratic carriers.

## Applying the ellipse to the capped game

Set $e=39/50$, $\eta=779/10000$, $S=P_{1,0}-eP_{2,1}+\eta P_{3,2}$, and $V=\operatorname{Re}\langle f,Sg\rangle$. Self-adjointness gives $V=\langle h,Sh\rangle-\langle k,Sk\rangle$. Drop its three nonpositive terms, and use orthogonality and $\|h\|^2+\|k\|^2=1$ to obtain $\|P_{3,2}h\|^2\le1-t^2-u^2$. Consequently, for every $\rho\ge\rho_*$,

$$ V\le(1-\eta)t^2+\eta+(e-\eta)u^2
 \le\eta+(e-\eta)\rho^2+\left[1-\eta-\frac2\pi(e-\eta)\right]t^2. \tag{3}$$

The bracket is positive. At the respective radii $2287/2500$ and $4571/5000$, the upper bound in (3) is strictly below $500/701$ at $t=0.31720829$ and $0.31975417$; the next eight-decimal value is above the target in each case. The bound on the middle of the interval requested in [P3](../degree5-attack-2026-11-25/problems/P3-mid-t-direct-bound.md) remains open.

## A stronger estimate for the entirely remote cubic projection

With $z$ as above let $p=\mathbb E[U\mid z^\perp]$, the part with zero visible Wick degree. For any $a,b\ge0$, the pair response gives

$$a t+b\|p\|^2\le\tfrac12\mathbb E[|a z+b p|+|a z-b p|]=\mathbb E|a z+b p|.$$

The equality uses symmetry of $z$ and its independence of $p$. Replace $z$ in the last expectation by a normalized sum $W_m$ of independent variance-one circular cubics $v_j(|v_j|^2-2)/\sqrt2$ on fresh coordinates. The joint law with $p$ converges to $(z,p)$ by the two-dimensional central limit theorem and independence. The common second moment gives uniform integrability. The prelimit field $aW_m+bp$ belongs to $H_{2,1}$ and has squared norm $a^2+b^2\|p\|^2$. Taking the limit gives $a t+b\|p\|^2\le\rho_*\sqrt{a^2+b^2\|p\|^2}$. Choosing $(a,b)=(t,1)$ and squaring proves $t^2+\|p\|^2\le\rho_*^2$, including the zero cases. This uses the same Gaussian buffering principle as the [earlier proof](../buffer-surplus-codex-a7c4/PROOF.md).

If $\delta=\|U-p\|^2$, the first inequality of (3) now gives

$$V\le\eta+(e-\eta)\rho^2+(1-e)t^2+(e-\eta)\delta.$$

In particular, if $\delta=0$, all cubic laws obey the payoff target through $t=0.46616437$ at the reviewed radius, or $0.46990576$ at the stronger radius. This condition concerns the projected cubic, so it allows $h,k$ themselves to depend on every coordinate.

## Exact arithmetic

The accompanying Python checker uses rational arithmetic, Machin's formula and alternating arctangent bounds for $\pi$. It checks all four cutoffs and the next higher grid points, the finite-$m$ examples in (2), and the failure of the majorant at $t=0.30$ if the joint term is deleted. A further control checks that (3) still exceeds $500/701$ at $t=0.65$ even with the stronger radius. This result improves an interval for the capped game. A full proof of its payoff bound, and hence the proposed lower bound $1.402$ for the Grothendieck constant, requires coverage of the remaining masses.
