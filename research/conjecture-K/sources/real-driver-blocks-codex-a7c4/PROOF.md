# Real Gaussian carrier blocks and mixed driver shells

Agent-ID: codex-a7c4. Ledger 6.3.16b, **P, author only**, using the [mixed Gaussian-driver estimate in 6.3.16a](../mixed-driver-blocks-codex-a7c4/PROOF.md) (**P + C, author only**). The exact moment controls below are **C, author only**. [Research task #509](https://github.com/agalatan/grothendieck-lean/issues/509)

**Theorem.** Let $q$ be a bidegree-$(2,1)$ Wick cubic in independent standard proper complex remote coordinates. Suppose that, after a real orthogonal change of their standardized real and imaginary parts, its real part satisfies
$$
 S=\Re q=\sum_{j=1}^{k}G_j b_j(H),
$$
where $G,H$ are independent standard real Gaussian blocks and each $b_j$ is a centered quadratic in $H$. The blocks may have any dimensions. Then, at each of the three visible rows and for every energy in $[551/100000,463/10000]$,
$$
 C(q)^2\le (47/200)D(q).
$$
For the radial distribution, $|q|^2\stackrel d= VR$ with R a standard exponential independent of $V=2\sum_j b_j^2$. In particular $\mathbb E\varphi(|q|^2)\le\mathbb E\varphi(uR)$ for any integrable concave radial test. All driver and bath content components are included. The criterion also applies to a constant phase rotation of $q$, since the independent visible Gaussian is circular.

### Recovering the full content norm

Let $z_j=(g_j+ih_j)/\sqrt2$, $Z=(g_1,h_1,\dots,g_n,h_n)$, $T=|z_1^{\rm vis}|^2$, $L=z_1^{\rm vis}(a+bT)$, and use the remote coordinates in Z only. The raw deficit is $D(q)=2\mathbb E|L+\sqrt u W|-2\mathbb E|L+q|$ for independent standard proper $W$ and $u=\mathbb E|q|^2$. Raw content $C$ is the Euclidean norm of the coefficients $c_j$ below. Write $Y=L+q$ and $H_0=(T-1)\operatorname{sign}(\Re Y)$, setting the sign at zero to zero. Simultaneously rotating the visible and remote proper coordinates sends $(Y,z_j)\mapsto e^{i\theta}(Y,z_j)$, with T fixed. With normalized angular measure on $[0,2\pi]$, the angular averages
$$
 \int |\Re(e^{i\theta}y)|\,d\theta/(2\pi)=2|y|/\pi,\quad
 \int e^{-i\theta}\operatorname{sign}\Re(e^{i\theta}y)\,d\theta/(2\pi)
   =(2/\pi)\operatorname{ph}(y)
$$
therefore imply
$$
 \mathbb E|Y|=(\pi/2)\mathbb E|\Re L+S|,\qquad
 c_j=\mathbb E[\bar z_j(T-1)\operatorname{ph}(Y)]
    =(\pi/2)\mathbb E[\bar z_j H_0].
$$
Consequently $C(q)^2=(\pi^2/8)\|\mathbb E[Z H_0]\|_{\mathbb R^{2n}}^2$. The factor 1/2 is from the standard proper complex coordinate. Since H₀ is real, this formula retains the squares of both real and imaginary coefficients of every complex direction. Rotating all coordinates of Z by an arbitrary real orthogonal map preserves this real vector norm. Circularity also gives $u=2\mathbb E S^2$.

To construct a surrogate, take independent copies $G'_j$, set $X_j=(G_j+iG'_j)/\sqrt2$, $A_j=\sqrt2 b_j(H)$, and $r=\sum_j X_jA_j$. Now $\Re r=S$ exactly. The visible Gaussian is the same in both expressions. For q, the involution $(G,H,z_1^{\rm vis})\mapsto(-G,H,-z_1^{\rm vis})$ negates $H_0$, hence $\mathbb E[H H_0]=0$. For r, the additional imaginary coordinates $G'_j$ are independent of $H_0$, so they contribute zero. Rotating the carrier X and the visible coordinate together proves the same sign identity for every $X_j$. Bath first-chaos content for the surrogate vanishes separately, either by conditional averaging over $(X,z_1^{\rm vis})$ or by simultaneous sign. Thus
$$
 C(q)^2=(\pi^2/8)\|\mathbb E[G H_0]\|^2
       =\sum_j|\mathbb E[\bar X_j(T-1)\operatorname{ph}(L+r)]|^2.
$$
The distributions of q and r are each circular, and their real parts agree, so the full radial laws agree by their characteristic functions. Conditional on H, r is proper Gaussian of variance V, with natural interpretation when V=0. This proves the radial claim and identifies the two raw deficits, including their same-energy Gaussian benchmarks. The proof of 6.3.16a after the folding step uses only that $r=\sum X_jA_j$ and that every directional component of $(\Re A,\Im A)$ belongs to the real second Gaussian chaos. Here $A_j=\sqrt2 b_j(H)$ has this property. The conditional regression identity, covariance estimates, Gaussian moment inequalities and both scalar envelopes therefore give the stated estimate.

### An explicit mixed family at every parity share

For $s>0$, in three complex remote coordinates $z=(z_1,z_2,z_3)$, let
$$
 A_s=\begin{pmatrix}1&s&0\\0&2&s\\0&0&3\end{pmatrix},\qquad
 F(z)=z\times A_s z,qquad q_s=:\bar z\cdot F(z):.
$$
The dot and cross products are complex bilinear. The displayed conjugate supplies the antiholomorphic factor. If $z=X+iY$ with X,Y real of variance 1/2, then
$$
 \Re(\bar z\cdot (z\times A_s z))=-2(X\times Y)\cdot A_sY.
$$
Real Wick ordering commutes with taking the real part. Every real carrier occurs once, and Wick ordering centers the quadratic in Y. More explicitly, if $G=\sqrt2 X, H=\sqrt2Y$, the surrogate coefficients are $A_j^{\rm sur}=\mathbb EF_j(H)-F_j(H)$, with $S=\sum G_j A_j^{\rm sur}/\sqrt2$.

Writing $z=(x,y,z')$, the holomorphic quadrics are
$$
 F=(yz'-s{z'}^2,\ -2xz'+syz',\ xy+sxz'-sy^2).
$$
Under the single-driver reflection $y\mapsto-y$, the three odd Wick monomials have energies $1,4,1$. The four even monomials have energies $2s^2,s^2,s^2,2s^2$. Thus the even energy fraction is $s^2/(1+s^2)$, equal to $1/2$ at $s=1$ and attaining every share in $(0,1)$. The even component includes $(|y|^2-1)z'$, $y^2\bar z'$, and a bath-only term. Rescale by $\sqrt{u/(6+6s^2)}$ for any prescribed energy in the band. Both parities can therefore carry positive energy throughout the band.

At the balanced example $s=1$, exact Gaussian moments give $u=12$, normalized fourth excess $31/3$, and $\mathbb E[\bar z_j q|q|^2]=(48,4,44)_j$. The example lies between the unconditional low- and high-excess regimes in §6.3.43 and §6.3.41 at the upper end of the energy band.

### A content coefficient below one fifth for this family

For the displayed $A_s$ family, the real coefficients of the surrogate have covariance
$$
 M=\begin{pmatrix}1+2s^2&s&0\\s&4+s^2&-2s\\0&-2s&1+3s^2\end{pmatrix}.
$$
Indeed these coefficients are $-H_2H_3+s(H_3^2-1)$, $2H_1H_3-sH_2H_3$, and
$-H_1H_2-sH_1H_3+s(H_2^2-1)$, with independent standard normal $H_j$.
For any $v=(h,k,l)\in\mathbb R^3$ we have
$$
 4(1+s^2)\|v\|^2-v^\top Mv
 =3(h-sk/3)^2+3(l+2sk/3)^2+(4/3)s^2k^2+2s^2h^2+s^2l^2.
$$
Thus $\tau=\|M\|_{\rm op}/\operatorname{tr} M\le 2/3$, since its trace is $6(1+s^2)$.
This ratio is invariant under scaling the cubic to a prescribed energy. Take $t=2/3$ in the small-covariance proof of 6.3.16a. Its scalar coefficients $(c_0,c_1,c_3,\gamma)$ are
$(57244599935,-1501543759,3157217,213543031787)/10^{12}$. The coefficient of the upper bound on the second moment is positive since $(37/3)(1+4t)>100/3$. The resulting uniform coefficient is
$$
 c_0+c_1+\gamma t+c_3\left(15[(37/3)(1+4t)-100/3]-34/3\right)
 =\frac{595896997819}{3000000000000}<\frac15.
$$
Therefore $C(q_s)^2\le (595896997819/3000000000000)D(q_s)$ at all three rows for every $s>0$ and all normalized energies in the band.

### Excluding prior complex-block presentations

It suffices to exclude these presentations for the leading homogeneous cubic, since Wick corrections only add linear terms. A complex linear carrier of dimension at least two with exactly one factor in each monomial would have $F(b)=0$ for all b in it, by taking the second holomorphic directional derivative. But $F(b)=0$ means b is zero or an eigenvector of $A_s$. Its three distinct eigenlines cannot contain a two-plane.

Both an exactly-linear complex carrier line and the one-driver template allowing self-interaction in [6.3.16](../mixed-driver-folding-codex-a7c4/PROOF.md) would have zero bath-only cubic. Write its normal as a unit vector e and the bath plane as $P=e^{\perp_H}$. Vanishing of the cubic on P implies $F(z)\in\mathbb Ce$ there. Differentiate the polynomial restricted to P in each conjugate bath coordinate, obtaining its Hermitian inner products with F. On the plane write $F(z)=f(z)e$. The identity $z\cdot F(z)=0$ gives $f(z)(z\cdot e)=0$ identically on P. Since $F\equiv0$ on P was excluded by its eigenlines, $z\cdot e=0$ identically there, so e is real up to a constant phase. Take e real. Then $z\times A_sz\in\mathbb Ce$ on P implies $A_sP\subset P$: decompose $A_sz=v+he$, $v\in P$. In $z\times A_sz$, the piece $z\times v$ is normal to P and $h z\times e$ lies in P, vanishing only when h=0 for $z\ne0$. Thus e is a left eigenvector. Neither complex template has a monomial with two holomorphic factors from e and one antiholomorphic bath factor, so $F(e)\in\mathbb Ce$. Since $e\cdot F(e)=0$ and e is real, $F(e)=0$, making it a right eigenvector as well.

With eigenvalues 1,2,3, respective right eigenvectors are $(1,0,0),(s,1,0),(s^2/2,s,1)$, and respective left eigenvectors are $(1,-s,s^2/2),(0,1,-s),(0,0,1)$. No left/right pair for the same eigenvalue agrees as a line when $s>0$. Unequal eigenvalues cannot share a real eigenvector since $e^\top A_s e$ would give both eigenvalues times $\|e\|^2$. Hence no such carrier line exists. The three quadrics $F_j$ are linearly independent (inspect the $z'^2,xy,xz'$ coefficients), so all three complex coordinates are essential. Adding unused Gaussian coordinates also preserves this obstruction. Reflection across any candidate carrier changes q by a sign, preserving its minimal complex coordinate space. Its restriction splits that space into the same two eigenspaces, giving an excluded carrier there.

The criterion requires one phase of the cubic to be exactly linear in a real Gaussian block. General mixtures with comparable parity energies remain open.


## Replaying the Gaussian moment controls

Run `python3 -IOB research/conjecture-K/code/real-driver-blocks-codex-a7c4/verify.py` from the repository root. The [standard-library verifier](../../code/real-driver-blocks-codex-a7c4/verify.py) computes the radial moments and every coordinate of the projected polynomial transform for $q_s$ and the duplicated-carrier surrogate for orders zero through three. The angular identity proves the result for the actual sign kernel. The scalar inequalities used from 6.3.16a have their own linked replay.
