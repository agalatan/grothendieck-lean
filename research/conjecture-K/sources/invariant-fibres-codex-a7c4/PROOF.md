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

## The first angular mode controls arbitrary cubic perturbations

At the peak of [#509](https://github.com/agalatan/grothendieck-lean/issues/509), take $L=z(a+b|z|^2)$, $a=699/1250$, $b=179/1250$. Row 2.7 represents its law as $\sqrt v G$ with a nonnegative mixing variance $v$ independent of $G$ and all remote variables. Its mean is $m=a^2+4ab+6b^2$. The raw content $C(r)$ is the norm of the first-chaos projection of $\Psi(r)$ for $\Psi(y)=\mathbb E_z[(|z|^2-1)\operatorname{ph}(L+y)]$. Write $\Phi(y)=2\mathbb E_z|L+y|$. The Lipschitz constants for $\Psi$ and $\nabla\Phi$ are at most $3/a<6$ and $6/a<12$. [Visible density estimate and differentiation](../cubic-shear-codex-a7c4/PROOF.md)

**Fibre criterion.** Choose any nonzero zero-contraction reference field as above and any remote Wick cubic $r$. Both may be embedded in a larger finite Gaussian space by adjoining the extra coordinates to $B$ and putting zeros in the extra components of $e$. With $F_r=\bar\partial r$, set
$$
 \alpha=e^*F_r(B),\qquad g=\alpha\bar\xi,\qquad k=r-g,\qquad E_\perp=\mathbb E|k|^2.
$$
Then $C(r)^2\le36 E_\perp$ and $D(r)\ge D(g)-6 E_\perp$. In particular $366 E_\perp\le D(g)$ suffices for $C(r)^2\le D(r)/10$. The mixing amplitude $\alpha$ can depend on the base point and have any phase and size.

To prove the criterion, fix the invariant data $(F,B)$, including the extra coordinates. Rotate the independent coordinate $\xi$ alone. In $r(B+e\xi)=(B+e\xi)^*F_r(B+e\xi)-\operatorname{div}F_r(B+e\xi)$ there is at most one antiholomorphic factor. Thus the whole angular component of frequency $-1$ is exactly $g$, with no higher radial powers of $\xi$. Conditional angular orthogonality gives $\mathbb E[\bar g k]=0$ and $\mathbb E\langle\nabla\Phi(g),k\rangle_{\mathbb R}=0$, since $\Phi$ is radial and its gradient has the same frequency as $g$. Also $C(g)=0$. Indeed $\Psi(g)$ has frequency $-1$, and each component of $\bar Z$ is a sum of frequencies $0$ and $-1$. Projection contraction now gives $C(r)^2\le36E_\perp$. Taylor's inequality gives $\mathbb E\Phi(r)\le\mathbb E\Phi(g)+6E_\perp$. Orthogonality yields $\mathbb E|r|^2=\mathbb E|g|^2+E_\perp$ and the Gaussian benchmark is increasing, proving the deficit bound. The single antiholomorphic factor is essential to the formula for $g$. For instance the bidegree-$(3,2)$ Wick monomial $x^2\bar w(|w|^2-2)$ has a nonconstant radial multiplier in its frequency $-1$ component on the $w$ line.

**Stability in every direction.** For a zero-contraction core $q$ as in the first section and any remote cubic $h$, write $r=q+h$, $u=\mathbb E|q|^2$ and $\eta=\mathbb E|h|^2$. Then
$$
 \eta\le D(q)/368\quad\Longrightarrow\quad C(r)^2\le D(r)/10 .
$$
In particular for $0<u\le463/10000$ one can use $\eta\le u^2/[2944(n-1)]$. Here $n$ counts the core coordinates only. These assertions hold in particular when $\mathbb E|r|^2$ lies in the #509 band $[551/100000,463/10000]$. There is no orthogonality condition between $q$ and $h$.

The estimate uses the square root of the exact Gaussian-mixture deficit. For any complex square-integrable amplitude $A$ measurable in the invariant data, write $\mathcal D(A)=D(A\bar\xi)$ and $U=\mathbb E|A|^2$. Set $s=\sqrt{v+|A|^2}$ and $t=\sqrt{v+U}$. Conditional Gaussianity and the tangent identity give
$$
 \mathcal D(A)=\sqrt\pi\,\mathbb E(t-s)=\sqrt\pi\,\mathbb E\frac{(s-t)^2}{2t}.
$$
Here and below expectations include the independent mixing variance. For a perturbation amplitude $H$ consider $A_\theta=A+\theta H$ for real $\theta$, using $s,t,U$ at $A_\theta$. Differentiating gives
$$
 \frac{d}{d\theta}\mathcal D(A_\theta)
 =\sqrt\pi\,\mathbb E\big[\operatorname{Re}(\bar A_\theta H)(1/t-1/s)\big].
$$
The Gaussian representation gives $\mathbb E v^{-1/2}=\mathbb E|L|^{-1}/\sqrt\pi\le 1/a$ because $|L|\ge a|z|$ and $\mathbb E|z|^{-1}=\sqrt\pi$. In particular $v>0$ almost surely. Differentiation is justified by the Lipschitz bound on a Euclidean norm, both pointwise for $s$ and in the Hilbert space of amplitudes for $t$. Using $|A_\theta|\le s$ and Cauchy–Schwarz on $|s-t|/\sqrt{2t}$ and $|H|\sqrt{2/t}$ gives
$$
 |\mathcal D'(A_\theta)|^2
 \le 2\sqrt\pi\,\mathcal D(A_\theta)\,\mathbb E (v+U)^{-1/2}\,\|H\|_2^2
 \le 8\,\mathcal D(A_\theta)\|H\|_2^2.
$$
In the middle term $H$ depends only on the invariant data, independently of $v$. The last inequality uses $a>1/2$ and $\pi<4$. Integrating the derivative of $\sqrt{\mathcal D(A_\theta)+\delta}$ for $\delta>0$ and then letting $\delta\downarrow0$ proves
$$
 |\sqrt{\mathcal D(A+H)}-\sqrt{\mathcal D(A)}|\le\sqrt 2\,\|H\|_2 .
$$

Apply this with $A=\sqrt V$ for the original core and $H=\alpha-\sqrt V$ for the perturbed cubic. Orthogonal projection onto the fibre mode gives $\eta=\|H\|_2^2+E_\perp$. Consequently
$$
 \sqrt2\,\|H\|_2+\sqrt{366E_\perp}\le\sqrt{368\eta}.
$$
If the right side is at most $\sqrt{D(q)}$, the Lipschitz estimate yields $\sqrt{D(g)}\ge\sqrt{366E_\perp}$, so the fibre criterion applies. Finally $m+463/10000<1$, and the transverse deficit gives $D(q)>u^2/[8(n-1)]$. This proves the explicit energy criterion. It leaves open cubics with large residual for which the fibre criterion also fails.

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

Run the [exact replay](../../code/invariant-fibres-codex-a7c4/verify.py) with Python 3 and SymPy. It checks the field identities, Wick moments against the independent-vector law, the spectral obstruction and the cubic angular projection and the perturbation budget. The disintegration and the estimates for all dimensions use the proofs above.
