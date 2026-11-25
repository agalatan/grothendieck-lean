# The sharp covariance comparison for a holomorphic quadratic field

Agent-ID: codex-a7c4. [Task #698](https://github.com/agalatan/grothendieck-lean/issues/698), related to [#509](https://github.com/agalatan/grothendieck-lean/issues/509). The all-dimensional derivations are **P, author only**. The finite identities have an exact author replay.

Let $Z$ be standard proper complex Gaussian in arbitrary finite dimension and let $F(Z)$ be a vector of homogeneous holomorphic quadratics. Write $H=\mathbb E FF^*$, $u=\operatorname{tr}H>0$, and $V=\|F\|^2$. For every $t>0$,
$$
 \mathbb E e^{-tV}>\det(I+tH)^{-1}.
$$
Consequently $\mathbb E f(V)\le\mathbb E f(Y)$ for every Bernstein function $f$, where $Y=G^*HG$ for a fresh standard proper Gaussian vector $G$. Equivalently $Y$ is the sum of independent mean-one exponentials weighted by the eigenvalues of $H$. This comparator is optimal for fixed $H$ when the input dimension is allowed to vary. The proof uses the full output covariance and allows dependencies among all components of $F$.

## A scalar probe

For any fixed vector $c$ put $P=c^*F(Z)=Z^T M Z$ with $M=A+iB$ complex symmetric. Writing $Z=(X+iY_0)/\sqrt2$ gives $\operatorname{Re} P$ as one half of the real Gaussian quadratic form with symmetric matrix
$$
 \begin{pmatrix} A&-B\\-B&-A\end{pmatrix}.
$$
It anticommutes with the complex structure, so its real eigenvalues occur in pairs $s_j,-s_j$. Orthogonal diagonalization and a further rotation of each Gaussian pair give $\operatorname{Re} P\stackrel d=\sum_j s_j U_j W_j$ with all the real standard normals independent. Circularity under global input rotation gives $2\sum_j s_j^2=\mathbb E|P|^2=c^*Hc$. Thus
$$
 \mathbb E_Z e^{2i\sqrt t\operatorname{Re}P}
 =\prod_j(1+4t s_j^2)^{-1/2}
 \ge e^{-2t\sum_j s_j^2}=e^{-tc^*Hc}.
$$
The strict scalar inequality holds whenever $c^*Hc>0$, by $\log(1+x)<x$. Now draw $c$ standard proper complex Gaussian independent of $Z$. Conditional on $F$, its probe is proper Gaussian of variance $V$. Integrating its characteristic function in the other order yields the announced Laplace inequality, strictly because $c^*Hc>0$ almost surely. Fubini applies to a bounded integrand. Bernstein functions are a nonnegative constant plus a nonnegative linear term and a positive mixture of $1-e^{-tx}$; equal means handle the linear term and Tonelli handles the mixture.

For sharpness, diagonalize $H$ and take independent blocks with $F_{j,N}=\sqrt{\lambda_j/(2N)}\sum_{k=1}^N Z_{jk}^2$. This has the prescribed covariance for every $N$. The real multivariate central limit theorem gives independent proper Gaussian limits of variances $\lambda_j$; rotate outputs back for a general $H$. For each block the normalized fourth moment is $2+4/N$ by expanding the independent circular summands ($\mathbb E|Z^2|^2=2$, $\mathbb E|Z^2|^4=24$). Hence $V$ has bounded second moments uniformly along the construction, by Minkowski. This supplies uniform integrability for Bernstein functions, whose growth at infinity is at most linear.

## Sharp buffer and rank comparisons for cubics

For $q$ of bidegree $(2,1)$ with $F=\bar\partial q$ and $DF\,F=0$, row 3.24 gives $|q|^2$ exponential conditional on $V$. Global circularity gives the unconditional law $q\stackrel d=\sqrt V G_0$ with $G_0$ fresh. For an arbitrary cubic the same mixture represents its decoupled surrogate $\tilde q=W^*F(Z)$ with $W$ independent. In both cases the energy is $u$; for a general Wick cubic $\mathbb E\|\bar\partial q\|^2=\mathbb E|q|^2$ by antiholomorphic Gaussian integration by parts (equivalently Wick orthogonality in antiholomorphic degree one). Apply the comparison to $f(x)=\sqrt{v+x}$ for $v\ge0$. For the zero-contraction case
$$
 2\mathbb E|\sqrt v G_1+q|\le\sqrt\pi\,\mathbb E\sqrt{v+Y}.
$$
Here $G_1$ is independent. The block construction above, paired with fresh independent output coordinates in the cubic $\sum_j\bar w_j F_{j,N}$, achieves the right side in the limit. Its extended field has zero contraction and the same nonzero covariance eigenvalues. If only $u$ and an upper bound $r$ on the output rank are prescribed, permuting the $r$ eigenvalues, padded with zeros, and using concavity gives the sharp comparator $(u/r)\mathrm{Gamma}(r,1)$. In particular
$$
 \sup\frac{\mathbb E|q|}{\sqrt u}
 =\frac{\sqrt\pi}{2}\frac{\Gamma(r+1/2)}{\sqrt r\,\Gamma(r)} .
$$
Output rank one gives $\pi/4$ in arbitrarily many input coordinates. The supremum concerns the class in this paragraph.

## A quantitative deficit in terms of the spectrum

Set $B_2=\operatorname{tr}H^2$, $b_*=\operatorname{tr}H^3/B_2$. For the exponential sum $Y$, $\mathbb E(Y-u)^2=B_2$ and $\mathbb E(Y-u)^3=2B_2 b_*$. For $a=v+u$, the tangent gap for $\sqrt{v+Y}$ is $(Y-u)^2/[2\sqrt a(\sqrt{v+Y}+\sqrt a)^2]$. Its expectation is at least
$$
 \frac{1}{4\sqrt a}\frac{(\mathbb E(Y-u)^2)^2}{\mathbb E[(Y-u)^2(2v+Y+u)]}
 =\frac{B_2}{8\sqrt a(a+b_*)},
$$
by $(s+t)^2\le2(s^2+t^2)$ and Cauchy–Schwarz. The function $a\mapsto a^{-1/2}(a+b_*)^{-1}$ is convex, as its two factors are positive, decreasing and convex. Average over any independent proper Gaussian buffer variance of mean $m$. The exact deficit of a zero-contraction cubic, and the decoupled term $\mathcal J$ of row 3.26 for every cubic, are at least
$$
 \frac{\sqrt\pi\,\operatorname{tr}H^2}{8\sqrt{m+u}(m+u+b_*)}.
$$
At the peak row $m=1181331/1562500$ and $u\le463/10000$, so $m+2u<1$ and $b_*\le u$. In particular $\mathcal J>\operatorname{tr}H^2/8$. For a zero-contraction core the stability result of [#694](https://github.com/agalatan/grothendieck-lean/pull/694) then gives $C(q+h)^2\le D(q+h)/10$ for $\mathbb E|h|^2\le\operatorname{tr}H^2/2944$. This uses the effective output rank $u^2/\operatorname{tr}H^2$, independent of the size of the input and residual spaces. For general cubics the two signed contraction terms of row 3.26 remain in addition to $\mathcal J$. [Decoupling identity, §6.1–6.2](../deficit-sign-2026-11-16/REPORT.md)

[Exact replay](../../code/quadratic-spectrum-codex-a7c4/verify.py) with Python 3 and SymPy. Run `python3 -IB research/conjecture-K/code/quadratic-spectrum-codex-a7c4/verify.py` from the repository root.
