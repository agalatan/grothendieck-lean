# A Gaussian coordinate and the transverse radius of a cubic

Agent-ID: codex-a7c4. [Research task #509](https://github.com/agalatan/grothendieck-lean/issues/509). The derivation is **P, author only**. The algebraic examples and rational budgets have an exact **C, author-only** replay.

For a pure complex Wick cubic $q$ of bidegree $(2,1)$ in $n$ independent standard proper complex Gaussian coordinates, let $F=\bar\partial q$. Assume $DF(z)F(z)=0$ identically and $F\ne0$. Row 3.24 gives the exponential law of $|q|^2$ conditional on $\|F\|^2$. We determine the conditional law of the original vector along its complex line parallel to $F$, remove one Gaussian coordinate from its radius, and deduce a quantitative deficit for every Gaussian buffer. At the peak visible row this gives an explicit neighbourhood satisfying the content inequality of #509. [Row 3.24, Theorem 4.1](../deficit-sign-2026-11-16/REPORT.md)

## The conditional law on a line

Normal ordering gives $q(z)=z^*F(z)-\operatorname{div}F(z)$ with $F$ homogeneous quadratic and holomorphic. The polynomial derivation $D=F\cdot\nabla$ annihilates $F$, so $D^2z_j=0$. Its exponential acts on the polynomial ring by substituting $S_t z=z+tF(z)$ (the Leibniz rule makes the series finite on each polynomial). Hence $F(S_t z)=F(z)$ and $S_{-t}$ is the polynomial inverse. Its complex Jacobian determinant is a polynomial unit and equals one at zero. Differentiating $\det(I+tDF)=1$ at zero in $t$ gives $\operatorname{div}F=0$. A nonzero field of this kind requires $n\ge2$.

Write $Z$ for the input Gaussian, $V=\|F(Z)\|^2$, $e=F(Z)/\sqrt V$, $\xi=e^*Z$ and $B=Z-e\xi$. The zero set of the nonzero field has Gaussian measure zero. Both $F$ and $B$ are invariant under $S_t$, since $\xi$ changes by $t\sqrt V$. Write $I=(F,B)$. Changing variables by $S_t$ in the Gaussian density gives, for any bounded nonnegative $h$,
$$
 \mathbb E h(I)e^{-2\operatorname{Re}(tq)-|t|^2V}=\mathbb Eh(I).
$$
Condition on $I$. For each complex rational $t$ the conditional Laplace transform of $q$ equals $e^{|t|^2 V}$. A single full-measure set works for these countably many points. On each bounded rectangle the conditional exponential integrand is bounded by the sum at its four rational bounding vertices, so dominated convergence extends this identity to real and imaginary parts of arbitrary $t$. Uniqueness of the two-dimensional Laplace transform gives
$$
 Z=B+e\xi,\qquad q=\sqrt V\,\bar\xi,\qquad
 \xi\sim\mathcal N_{\mathbb C}(0,1)\quad\text{independent of }(F,B).
$$
In particular $u=\mathbb E|q|^2=\mathbb EV$. Also $\mathbb E[Z\bar q h(|q|^2)]=0$ whenever the integrals exist, since conditionally on $I$ the two terms have nonzero angular frequencies in $\xi$. This recovers the first-content conclusion of 3.24.

## The transverse gamma law

Let $d=n-1$, $T=\|B\|^2$, and $S=\|Z\|^2=T+|\xi|^2$. The summands are independent. Dividing the Laplace transform $(1+s)^{-n}$ of $S$ by $(1+s)^{-1}$ shows $T\sim\mathrm{Gamma}(d,1)$, with scale one. Define $J=V/T^2$ almost surely. Under positive real dilation of $Z$, $B$ has degree one and $F$ has degree two. Thus $J$ depends only on the direction of $Z$ and is independent of $S$. Since $|\xi|^2$ is independent of $(J,T)$, the same Laplace-transform division conditional on $J$ gives
$$
 T\perp J,\qquad V=T^2J,\qquad \mathbb E J=u/[d(d+1)].
$$
For an independent standard proper Gaussian $G$ and $v\ge0$, first condition on $I$ and then apply Jensen to $J$ at fixed $T$. This yields
$$
 2\mathbb E|\sqrt vG+q|=\sqrt\pi\,\mathbb E\sqrt{v+V}
 \le\sqrt\pi\,\mathbb E\sqrt{v+u T^2/[d(d+1)]}.
$$
In particular $\mathbb E|q|\le(\sqrt\pi/2)\sqrt{d/(d+1)}\sqrt u$. For $q=x^2\bar w$ in two coordinates, $B=(x,0)$, $T=|x|^2$ and $J=1$. Equality holds for every buffer in this example. The dimension is that of the coordinates used by the core cubic. Unused independent coordinates can be omitted.

## A strict deficit and arbitrary remote perturbations

Let $L$ be an independent centered proper Gaussian variance mixture of mean variance $m$. Define $D(r)=2\mathbb E|L+\sqrt{\mathbb E|r|^2}\,G|-2\mathbb E|L+r|$, taking $G$ independent of the other data. For $Y=uT^2/[d(d+1)]$ and $A=v+u$, subtracting $\sqrt{v+Y}$ from its tangent at $A$ gives
$$
 \frac{(Y-u)^2}{2\sqrt A(\sqrt{v+Y}+\sqrt A)^2}.
$$
The expected denominator is at most $8A^{3/2}$ by Jensen. Cauchy–Schwarz therefore bounds the mean tangent gap below by $(\mathbb E|Y-u|)^2/(8A^{3/2})$. Since $\mathbb E Y=u$,
$$
 \mathbb E|Y-u|\ge 2\mathbb E[(Y-u)\mathbf1_{T\ge d}]
 =2u e^{-d}\frac{d^d}{d!}\frac{2d+1}{d+1}.
$$
Indeed the signed tail is $u$ times the difference of the upper tails at $d$ of gamma variables with shapes $d+2$ and $d$. Integration by parts leaves the last two terms in the exponential series. For $p_d=e^{-d}d^d/d!$, consecutive terms of $\sqrt d\,p_d$ have ratio $e^{-1}(1+1/d)^{d+1/2}>1$, by strict midpoint Jensen applied to the integral of $1/x$ on $[d,d+1]$. Since $e<3$ and $2(2d+1)/(d+1)\ge3$, we have $\mathbb E|Y-u|>u/\sqrt d$. Averaging the buffer inequality over the independent variance of $L$ and using convexity of $A^{-3/2}$ gives
$$
 D(q)>\frac{\sqrt\pi\,u^2}{8d(m+u)^{3/2}}.
$$

For #509 take $L=z(a+b|z|^2)$, $a=699/1250$, $b=179/1250$, $z$ independent of the remote variables. Its Gaussian mixture representation is row 2.7. Here $m=a^2+4ab+6b^2$ and $m+463/10000<1$. For any remote cubic $r=q+h$ with $\operatorname{Re}\mathbb E[\bar qh]=0$, put $\eta=\mathbb E|h|^2$. Allow $h$ to depend on any finite number of additional remote coordinates. If $u+\eta$ is in the peak-row band $[551/100000,463/10000]$ and
$$
 \eta\le\frac{u^3}{10000 d^2},
 \qquad\text{then}\qquad C(r)^2\le D(r)/10 .
$$
Here $C$ is the norm of the first projection of the raw response $\Psi(r)$, where $\Psi(y)=\mathbb E[(|z|^2-1)\operatorname{ph}(L+y)]$. Circularity makes $\Psi(y)$ a radial scalar times $y$, whence $C(q)=0$. Extra remote coordinates are independent of $q$ and have zero projection as well. The smoothed payoff $\Phi(y)=2\mathbb E|L+y|$ has gradient zero at the origin. The Lipschitz bounds for $\Psi$ and $\nabla\Phi$ are respectively $3/a<6$ and $6/a<12$, by integrating the inverse distance against the visible density and its weighted version. [Density estimate and differentiation, final section](../cubic-shear-codex-a7c4/PROOF.md)

Projection contraction gives $C(r)^2\le36\eta$. The Taylor upper bound on $\Phi(q+h)$, followed by Cauchy–Schwarz, gives $\mathbb E\Phi(r)\le\mathbb E\Phi(q)+12\sqrt{u\eta}+6\eta$. The Gaussian comparison term increases when its energy rises from $u$ to $u+\eta$. Thus $D(r)-10C(r)^2\ge D(q)-12\sqrt{u\eta}-366\eta$. The loss is at most $[12/100+366(463/10000)/10000]u^2/d<u^2/(8d)$, below the proved deficit. The residual may have the same circle weight as the core. The condition restricts its size; the content inequality outside this neighbourhood remains open.

## Several cubics and one independent Gaussian vector

For fields $F_i$ suppose $DF_i F_i=0$ and $DF_i F_j+DF_j F_i=0$ for every distinct pair. Every complex linear combination then satisfies the scalar hypothesis. Write $Q=(Z^*F_i(Z))_i$ and let $W$ be a fresh independent standard proper Gaussian vector. For each fixed complex coefficient vector $c$, the scalar cubic for $\sum_i c_iF_i$ and $W^*\sum_i c_iF_i$ have the same law by the line decomposition. Applying Cramér–Wold to real parts gives
$$
 Q\ \stackrel{\rm law}=\ (W^*F_i(Z))_i .
$$
This identity determines the joint distribution of the cubics. Conditioning both sides on the common Gram matrix can invalidate it.

Indeed in four coordinates $(x,u,v,w)$ take $F_1=(0,x^2,0,xv)$ and $F_2=(0,0,x^2,-xu)$. Their individual contractions vanish and their crossed contractions are $\pm x^3 e_w$. Set $l=(v,-u)^t$ and $m=x^2(\bar u,\bar v)^t$. Then $l^*m=0$ and $Q=m+x\bar w l$. The Gram matrix in covariance order is $H_{ij}=\sum_k F_{i,k}\overline{F_{j,k}}$, so $H=|x|^4 I+|x|^2ll^*$. Almost surely its smaller eigenvalue $\lambda=|x|^4$ is simple and the eigenvalue gap is $\Delta=|x|^2\|l\|^2$. For its smaller-eigenvalue projection $P(H)$,
$$
 \|P(H)Q\|^2=\|m\|^2=\sqrt\lambda\,\Delta.
$$
The right side is known given $H$. For the independent-vector surrogate the squared projection conditional on $H$ is exponential with mean $\lambda>0$, hence has strictly positive conditional variance. This distinguishes the two joint laws with $H$ included.

Run the [exact replay](../../code/invariant-fibres-codex-a7c4/verify.py) with Python 3 and SymPy. It checks the field identities, Wick moments against the independent-vector law, the spectral obstruction and the perturbation margin. The disintegration and the estimates for all dimensions use the proofs above.
