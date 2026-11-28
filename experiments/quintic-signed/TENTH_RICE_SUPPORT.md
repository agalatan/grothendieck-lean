# A three-node bound for shifted cubic support

For $t\ge\mu\sqrt{6/7}$, the [buffered Rice comparison and sharpness proof](../../research/conjecture-K/sources/buffered-rice-codex-a7c4/PROOF.md) already proves that the supremum over all dimensions is $\sqrt{\pi/4-t^2}$. Both central amplitudes below satisfy this hypothesis. The polynomial estimates in this note give an independent proof using finitely many radial moments, and can also be restricted to smaller fourth-excess intervals.

Let $q$ be any unit circular complex Gaussian cubic of bidegree $(2,1)$, and let $Z$ be an independent standard proper Gaussian. No restriction is imposed on the ambient dimension. The following upper bounds hold at the two central test directions.

| $\lambda$ | Upper bound on $\mathbb E|Z+\lambda q|$ | Lower limit on $t$ | Strict upper bound on $\tau$ |
|---:|---:|---:|---:|
| .3425 | .936765955 | .83835 | .287346 |
| .3463 | .937862576 | $27441/32768$ | .290008 |

The support inequality $t+\lambda\tau\le\mathbb E|Z+\lambda q|$ gives the last column. At the second amplitude and $\tau\ge.290007$ the physical support slack is at most $.000000290571875$. Finite responses enter this rectangle by the [Gaussian cubic-sum construction](OCCUPIED_FIFTH_SIGN.md). The [exact rational replay](code/tenth_rice_support.py) combines a polynomial of degree five with the [previous two-node bound](GAUSS_QUADRATURE_RICE.md).

## The radial moment bounds

Write $s=\mathbb E|q|^4-2$, $F=\sqrt2\operatorname{Re} q$, $M_j=\mathbb EF^j$, and $m_j=\mathbb E|q|^{2j}$. Circular symmetry gives $M_{2j}=2^{-j}\binom{2j}{j}m_j$. In particular $F$ is a normalized real third-chaos polynomial and $M_4=3+3s/2$. The [sixth-moment inequality](SIXTH_RICE_SUPPORT.md) gives $m_3\le6+9s+40.45313s^{3/2}$.

For a real third-chaos polynomial, define $B=\|\nabla F\|^2/3$ and let $L$ be the Gaussian Ornstein–Uhlenbeck generator. Since $LF=-3F$, Gaussian integration by parts gives $\mathbb E[Fp(F)]=\mathbb E[Bp'(F)]$. For the probabilists' Hermites $H_k$, the Gaussian polynomial $H_k(F)$ has degree at most $3k$. Expanding in the usual orthogonal Hermite basis gives $\mathbb E\|\nabla H_k(F)\|^2\le3k\,\mathbb E H_k(F)^2$. Since $H_k'=kH_{k-1}$, applying integration by parts to $p(x)=\int_0^x H_{k-1}(u)^2du$ yields
$$
 \mathbb E\left[H_k(F)^2-kF\int_0^F H_{k-1}(u)^2du\right]\ge0.
$$
Inserting $H_2(x)=x^2-1$, $H_3(x)=x^3-3x$, and $H_4(x)=x^4-6x^2+3$, the cases $k=3,4$ give
$$
 M_6\ge 10M_4-15,\qquad M_8\ge \tfrac{84}5 M_6-70M_4+63\ge105+98(M_4-3).
$$
Hence $m_4\ge24+168s/5$. The replay only needs $m_4\ge24$. This scalar argument reproduces the required cases of the polynomial moment inequalities of [Azmoodeh, Malicet, Mijoule and Poly](https://arxiv.org/abs/1305.6579).

For the upper tenth moment, observe that $B-1=(L+6)(F^2-1)/6$. The centered polynomial $F^2-1$ has Hermite degrees $2,4,6$. The multipliers of $(L+6)/6$ on these degrees are $2/3,1/3,0$. Therefore
$$
 \mathbb E(B-1)^2\le\tfrac23\mathbb E[(B-1)(F^2-1)]
 =\tfrac23(M_4/3-1)=s/3.
$$
For $k=4,5$, Gaussian hypercontractivity gives $\|B-1\|_k\le(k-1)^2\|B-1\|_2$ because $B-1$ has degree at most four. This follows by applying the Gaussian $L^2$-to-$L^k$ noise estimate at $(k-1)^{-1/2}$ to the polynomial whose degree-$j$ component has been multiplied by $(k-1)^{j/2}$. The orthogonal components have $j\le4$. Hölder's inequality and the preceding integration by parts now give
$$
 M_{2k}\le(2k-1)\left(M_{2k-2}+(k-1)^2\sqrt{s/3}\,M_{2k}^{1-1/k}\right).
$$
Starting at $M_6=5m_3/2$, the replay bounds $x=M_{2k}^{1/k}$ by an outward rational root of $x^{k-1}(x-a)=b$. The left side is increasing for $x\ge a\ge0$; smaller nonnegative $x$ already satisfy the bound. It finally uses $m_5=8M_{10}/63$. The bracket estimates are the finite-dimensional Gaussian ingredients of the [Malliavin–Stein fourth-moment method](https://arxiv.org/abs/0712.2940).

## Three double nodes

Put $W=|q|^2$ and $g(w)=\mathbb E_Z|Z+\lambda\sqrt w|/\mu$. Its positive first derivative is a positive mixture of decreasing exponentials, as in the two-node derivation. In particular $g^{(6)}\le0$. At any three distinct nonnegative nodes, take the degree-five Hermite interpolant matching $g$ and $g'$ at each. For $w$ outside or between the nodes the interpolation error equals the sixth derivative at an intermediate point times a nonnegative product of three squared distances divided by $6!$. The interpolant thus majorizes $g$ on the entire positive half-line.

The exact verifier computes interval divided differences and expands the resulting polynomial in $W$. It checks the signs of every monomial coefficient. The prices of $m_2,m_4$ are negative; use their lower bounds. The prices of $m_3,m_5$ are positive; use their upper bounds at the upper endpoint of the current fourth-excess interval. Every selected interpolant applies throughout that whole shape interval and at every possible $W$. Larger shapes use the prior cubic interpolant. The two proofs together cover the closed range $0\le s\le42$. The printed output counts all accepted closed intervals.

Agent-ID: codex-a7c4
