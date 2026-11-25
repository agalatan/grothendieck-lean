<!-- Original research note by codex-a7c4 for issue #509. -->
# A coefficient-only neighbourhood of real trilinear projections

Agent-ID: codex-a7c4. Research for [issue #509](https://github.com/agalatan/grothendieck-lean/issues/509), **P + C, author only**. The scalar inputs are the [kernel and deficit formulas, 6.3.9b](../third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md) and [real response, 6.3.43 §3](../raw-content-2026-11-17-gemini-5331/PROOF.md). We use the angular sign identity of the [real-carrier argument](https://github.com/agalatan/grothendieck-lean/pull/675). The proof below derives the deficit and computes the content of its trilinear core directly. The [real sign-character extension](REAL_CHARACTERS.md) separately gives the conditional perturbation budgets for a general core.

Let $q\in H_{2,1}$ on the remote proper complex Gaussian coordinates, and write $S=\Re q$ in standardized real Gaussian coordinates. Choose any three mutually orthogonal real input blocks of arbitrary dimension. Let $P$ be the Wick projection of $S$ onto monomials with exactly one coordinate from each block, and set $u_0=2\mathbb EP^2$ and $e=2\mathbb E(S-P)^2$. Unused real directions are allowed.

**Theorem.** On peak, flank and upper, suppose $u_0+e\le463/10000$. Each of the following conditions implies $C(q)^2\le(6/25)D(q)$:

1. For arbitrary block dimensions, $e\le(3/40)[(4/3)\mathbb E P^4-u_0^2]$.
2. If one chosen block has dimension one, $e\le u_0^2/4$.

The second and fourth Gaussian moments are determined by the real coefficient tensor of $P$, and $e$ by the remaining squared Wick coefficients. Only the total cubic must have complex bidegree $(2,1)$. There is no positive lower energy requirement. At $u_0=0$ the hypotheses force $q=0$.

**One-carrier example.** Let $X,Y,Z$ be independent proper standard complex Gaussians. Set $q=p+h$ with
$$p=X(Y\bar Z+\bar YZ)/8,\qquad h=[X(|X|^2-2)+iY(|Y|^2-2)]/200.$$
Choose the line $\sqrt2\Re X$ and the real planes of $Y,Z$. The projection is $P=\Re p$; both monomials of $h$ are excluded by the trilinear projection. Wick orthogonality gives $u_0=1/32$ and $e=1/10000<u_0^2/4$, with total energy below $463/10000$. This example has an odd-in-$X$ self-interaction and a bath-only perturbation simultaneously.

**Two-carrier example.** Take two independent copies of the first trilinear summand and put
$$p=[X_1B_1+2X_2B_2]/16,\quad B_i=Y_i\bar Z_i+\bar Y_i Z_i,\qquad h=[X_1(|X_1|^2-2)+iY_1(|Y_1|^2-2)]/160.$$
Using the real parts of $X_1,X_2$ as the first block and the full underlying real $Y,Z$ spaces as the other blocks, $P=\Re p$. Each $B_i$ is the sum of two independent products of independent real standard Gaussians. Thus $\mathbb EB_i^2=2$, $\mathbb EB_i^4=24$, $u_0=5/128$ and $\operatorname{Var}(V)=85/16384$ for $V=(B_1^2+4B_2^2)/16^2$. The remainder has energy $e=4/160^2<(3/40)\operatorname{Var}(V)$.

## Tomography and character orthogonality

Define $f(x)=\pi\mathbb E|\Re L+x|$, $m_A(x)=\mathbb E[(T-1)\operatorname{sign}(\Re L+x)]$ over the independent visible Gaussian. Circularity of $(q,z)$ under global phase gives $F(q)=\mathbb E f(S)$, $u=2\mathbb E S^2$ and $C(q)=t\|\Pi_{\mathbb R}m_A(S)\|_2$, $t=\pi/(2\sqrt2)$, with $\Pi_{\mathbb R}$ the real linear Gaussian chaos. Indeed $|\cos\theta|$ has mean $2/\pi$ and $\operatorname{sign}(\cos\theta)$ has first complex Fourier coefficient $2/\pi$. Averaging the common rotation therefore gives
$$\mathbb E[\bar z_j(T-1)\operatorname{ph}(L+q)]=(\pi/2)\mathbb E[\bar z_j m_A(S)].$$
Since $m_A(S)$ is real, summing squared moduli with $z_j=(g_j+ih_j)/\sqrt2$ gives the factor $\pi^2/8$.

The sign group independently negates the three blocks $X,Y,Z$. Since $S$ is a real pure cubic, its character projection at $(-,-,-)$ consists exactly of the monomials $X_iY_jZ_k$. Thus $P=\sum_i X_i b_i(Y,Z)$ with real bilinear $b_i$. The odd function $m_A(P)$ has the same character and is orthogonal to every real linear form. The odd function $f'(P)$ also has this character, so $\mathbb E f'(P)R=0$. This reasoning permits arbitrary other components of $S$.

Write $M_0=k_A(0)$, $r=2e^{-3/2}$, $L=(1+r)M_0/2$ and $d=1432/1000$. The signed one-dimensional kernel $m_A$ is a mixture of $-x e^{-\lambda x^2}$ of mass $4M_0/\pi$. The atom derivative lies in $[-1,r]$; removing its spectral midpoint times the identity gives a map with Lipschitz constant $4L/\pi$. Since $\Pi_{\mathbb R}R=0$, $C(q)^2\le t^2(4L/\pi)^2\mathbb ER^2=L^2 e$.

The visible variance mixture has mixing variance $W$ with $m=\mathbb EW=a^2+4ab+6b^2$. Its real marginal has maximal density $\mathbb EW^{-1/2}/\sqrt\pi$ at zero. Therefore $f''(x)\le4\phi'(0)\le4d$. Taylor's theorem, the vanished cross term, and $B'(v)\ge\beta=\sqrt\pi/(2\sqrt{m+463/10000})$ give $D(q)\ge D_0-(d-\beta)e$, where $D_0=B(u_0)-\mathbb E f(P)$. It remains to lower-bound this scalar deficit.

## The deficit of one Gaussian carrier

Conditionally on the bath, $P$ is normal with variance $V/2$, where $V=2\sum_i b_i^2$. It is the real projection of a proper Gaussian of complex variance $V$. Consequently $\mathbb E f(P)=\mathbb E B(V)$ and $\mathbb EV=u_0$. Write $S_0=V/u_0$, $m_j=\mathbb ES_0^j$ and $x=m_2-1$. The same deficit identity holds for a scalar carrier $P=Gb$ with any centered real second-chaos $b$ independent of $G$.

For $v\ge0$ the tangent gap of $B(v)=\sqrt\pi\mathbb E\sqrt{W+v}$ at $u_0$ has the lower bound
$$
B(u_0)+B'(u_0)(v-u_0)-B(v)
\ge\frac{\sqrt\pi(v-u_0)^2}{4\sqrt{m+u_0}(2m+u_0+v)}.
$$
Indeed, in the integral of $-B''$ from $u_0$ to $v$ the weights are nonnegative and Jensen replaces $(W+w)^{-3/2}$ by $(m+w)^{-3/2}$. One can first replace $W$ by $W+\eta$ and send $\eta\downarrow0$ in the tangent gaps at $u_0>0$, so a curvature singularity at $v=0$ causes no differentiation at that endpoint. The square-root tangent gap at fixed $m$ has denominator $2\sqrt{m+u_0}(\sqrt{m+u_0}+\sqrt{m+v})^2$. The inequality $(\sqrt{s}+\sqrt{t})^2\le2(s+t)$ gives the displayed lower bound. Taking expectations and Cauchy–Schwarz with positive denominator yields
$$
\frac{D_0}{u_0^2}\ \ge\ \frac{\sqrt\pi}{4\sqrt{m+u_0}}\,
\frac{x^2}{(2m+u_0)x+u_0(m_3-2m_2+1)}.\tag{1}
$$

Now assume the first block consists of just one coordinate $G$, so $P=G b$. For bilinear $b$ the real quadratic Gaussian eigenvalues occur in pairs $\pm\lambda$ by singular-value decomposition. Real centered quadratics satisfy $\kappa_k=2^{k-1}(k-1)!\sum\lambda_j^k$. For variance $v_b=2\sum\lambda_j^2$, pairing gives $\kappa_3=0$, $\kappa_4\ge0$ and $\kappa_6\le20v_b\kappa_4$, because $\max\lambda_j^2\le(\sum\lambda_j^2)/2$. The fourth and sixth moment partitions yield $m_2\ge3$ and $m_3\le35m_2-90$. Hence the denominator in (1) is at most $(2m+34u_0)x-56u_0$. On $x\ge2$ the ratio $x^2/[(2m+34u_0)x-56u_0]$ is increasing, since $2m>22u_0$ throughout these rows. Evaluation at $x=2$ gives
$$
\frac{D_0}{u_0^2}\ge \frac{\sqrt\pi}{4\sqrt{m+u_0}(m+3u_0)}>\frac12
\qquad(0<u_0\le463/10000).
$$
The final right bound follows at the upper energy endpoint by the rational comparison in the checker. Its narrowest case is the upper row, where even substituting $223/71$ for $\pi$ gives more than $0.500201$.

For comparison, if $b$ is an arbitrary real centered quadratic, the unpaired bound $m_3\le(185/3)m_2-170$ follows from $\kappa_6\le40v_b\kappa_4$ and $\kappa_3^2\le(2/3)v_b\kappa_4$. In (1) its denominator is at most $(2m+182u_0/3)x-328u_0/3$. On $x\ge2$ that quantity increases with $u_0$. Take $U=463/10000$, $A=2m+182U/3$, $B=328U/3$, and use $x^2/(Ax-B)\ge4B/A^2$. This gives $D_0/u_0^2\ge\sqrt\pi B/[\sqrt{m+U}A^2]>49/100$ uniformly. Symmetry of $b$ is essential for the zero-content simplification, whereas this last scalar deficit bound is unrestricted.

## Arbitrary trilinear dimensions

The same sign argument works for an arbitrary orthogonal real decomposition with three blocks $X,Y,Z$ of any dimensions. Project $\Re q$ onto the Wick monomials $X_iY_jZ_k$ to obtain $P=\sum X_i b_i(Y,Z)$, $b_i$ real bilinear. The character $(-,-,-)$ again kills both first-order terms. Set $V=2\sum b_i^2$ and $u_0=\mathbb E V$. The centered variable $F=V-u_0$ has orthogonal bath chaoses of bidegrees $(2,0)$, $(0,2)$ and $(2,2)$.

**Weighted estimate.** For any bilinear $b=b(Y,Z)$,
$$\mathbb E[b^2F^2]\le(16+\sqrt{181})\,\mathbb E[b^2],\mathbb E[F^2]<30\,\mathbb E[b^2],\mathbb E[F^2]$$
when all factors on the right are positive. Indeed, with input coordinates the norms of the three bath chaoses in the order given and output coordinates $(1,1),(3,1),(1,3),(3,3)$, the output norms of $bF$ are bounded componentwise by $\|b\|_2$ times
$$M=\begin{pmatrix}\sqrt2&\sqrt2&2\\ \sqrt3&0&\sqrt6\\0&\sqrt3&\sqrt6\\0&0&3\end{pmatrix}.$$
For each variable block, multiplying a normalized degree-$p$ Wick tensor by a linear form produces creation and contraction with factors $\sqrt{p+1}$ and $\sqrt p$. In the joint action of the two blocks, partial or full contraction of the coefficient tensor of $b$ with the tensor of the input has Hilbert–Schmidt norm at most the product of their norms by Cauchy–Schwarz; tensoring and orthogonal symmetrization are contractions as well. This proves the four entries for each column by multiplying the corresponding factors, independently of the rank of $b$. In the orthonormal symmetric and antisymmetric coordinates of the first two inputs, $M^\top M$ has antisymmetric eigenvalue $3$ and symmetric block $\left(\begin{smallmatrix}7&10\\10&25\end{smallmatrix}\right)$, of eigenvalues $16\pm\sqrt{181}$. Squaring the componentwise bound proves the estimate. Multiplication by two and summation over $b_i$ give $\mathbb E[VF^2]\le30 u_0\mathbb EF^2$.

The tangent-gap proof of (1), in dimensional variables, gives
$$D_0\ge\frac{\sqrt\pi}{4\sqrt{m+u_0}}\,
\frac{(\mathbb E F^2)^2}{(2m+u_0)\mathbb EF^2+\mathbb E[VF^2]}
\ge\frac{\sqrt\pi}{4\sqrt{m+u_0}(2m+31u_0)}\operatorname{Var}(V)
> \frac3{20}\operatorname{Var}(V).$$
The strict last comparison holds on all three rows for $u_0\le463/10000$ and $P\ne0$. Then $V$ is a nonconstant polynomial because $V(0,Z)=0$ and $\mathbb E V>0$. The exact checker evaluates the scalar comparison at the upper energy endpoint. The same completion as above therefore gives $C(q)^2\le(6/25)D(q)$ whenever
$$e\le\frac{3}{40}\operatorname{Var}(V)
=\frac{3}{40}\left(\frac43\mathbb EP^4-u_0^2\right),\qquad
u_0+e\le463/10000.$$
The equality follows by the conditional real Gaussian fourth moment. The budget is symmetric in the three chosen blocks and uses only the second and fourth moments of the trilinear projection; Wick contraction determines them from the input tensor. The one-dimensional-carrier criterion $e\le u_0^2/4$ and the unrestricted-block criterion above may be combined by taking the larger of the applicable bounds.

## Completion

The rational checker evaluates $L^2+(6/25)(d-\beta)<12/25$ on each row, using only outward derivative and elementary square-root bounds. Therefore, with $K=6/25$,
$$
C(q)^2-KD(q)\le -KD_0+[L^2+K(d-\beta)]e< -K u_0^2/2+2K e\le0
$$
for a single carrier when $u_0>0$ and $e\le u_0^2/4$. For arbitrary blocks use $D_0>(3/20)\operatorname{Var}(V)$ in the same inequality. The small A-shell implication then follows by 6.2.1–6.2.3 for $\|U_{\rm shell}\|^2\le113/10000$. This covers a neighbourhood expressed in the raw coefficients; the unrestricted intermediate-kurtosis cubic and Conjecture K remain open.

## Replay

Run `python3 -IB -O research/conjecture-K/code/real-trilinear-neighbourhood-codex-a7c4/verify.py` from the repository root. The [stdlib verifier](../../code/real-trilinear-neighbourhood-codex-a7c4/verify.py) checks the occupied Wick orders and their Gram matrix, the paired and unpaired deficit bounds, all three row budgets, both mixed examples, and the saved [result](../../code/real-trilinear-neighbourhood-codex-a7c4/result.json). One negative control uses the test $b=YZ$, $F=b^2-1$, for which the squared multiplication ratio is 26. The upper row also distinguishes $1/2$ from $501/1000$ for the paired scalar deficit majorant. The inherited row masses can be regenerated by `python3 -IB research/conjecture-K/code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact.py`.
