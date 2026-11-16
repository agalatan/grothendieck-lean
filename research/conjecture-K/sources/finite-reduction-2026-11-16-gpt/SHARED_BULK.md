<!-- Verbatim from the delivery content_law_finite_reduction_20261116.zip (SHARED_BULK.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Conditional Gaussian receivers with correlated quadratic coefficients

**P.** Let \(X_1,\ldots,X_r\) be independent standard complex Gaussians, independent of \(Y\), and set
\[
 q=\sum_i X_i p_i(Y)+\sum_i\bar X_i f_i(Y).
\]
Here \(p_i(Y)=Y^*A_iY-\operatorname{tr}A_i\) for arbitrary complex matrices, and \(f_i\) are holomorphic homogeneous quadratics. Suppose \(\sum_i p_i f_i=0\) as a polynomial. Distinct receiver coordinates for the two sums give this condition automatically. All the \(p_i,f_i\) can use the same \(Y\). Then \(q\in H_{2,1}\), and for every real continuous polynomial-growth profile \(h\),
\[
 \|c[h]\|^2\le \tfrac53\,\delta\,\widehat\Omega[h].
\tag{1}
\]
The sharper matrix criterion below can be evaluated for a specific tuple. The role of the pseudocovariance assumption is to make the conditional output proper Gaussian. General improper receivers and general cubic tensors are outside (1).

## Conditional signed pairing

Write \(Y=(G_{\rm R}+iG_{\rm I})/\sqrt2\) and collect all the real and imaginary parts of the \(p_i,f_i\) into \(P_\ell=G^\top H_\ell G-\operatorname{tr}H_\ell\) with \(H_\ell\) real symmetric. Put \(A=\sum_\ell P_\ell^2\), \(u=\mathbb E A>0\), \(L=\operatorname{Var}(A)\), and \(\tau\sim\operatorname{Exp}(1)\) independent. Conditionally on \(Y\), the output is proper Gaussian with variance \(A\). Its pseudocovariance is \(2\sum_i p_i f_i=0\). The law of \(V\) is \(A\tau\), and \(\delta=2L\).

Conditional centered symmetry of \(q\) kills content in every \(Y\) coordinate. Gaussian regression gives receiver content \(\mathbb E[p_i\tau h(A\tau)]\), since the \(f_i\) regression term is proportional to the conditional angular average of \(q^2 h(V)\), which vanishes. Thus only the real coordinates of the \(p_i\) coefficient vector are needed in the following directional bound. Let \(e\) be a real unit vector supported in those entries. For \(S_{ij}=(H_iH_j+H_jH_i)/2\), set \(B_{ij}=2G^\top S_{ij}G\).

Writing \(k=\mathcal K_u h\), exponential integration by parts gives
\[
 \mathbb E_\tau[\tau h(A\tau)]
 =\mathbb E_\tau k(A\tau)+(A-u)\mathbb E_\tau[\tau k'(A\tau)] .
\]
For the first term integrate by parts against the centered real quadratic \(P_i\). It has Gaussian Ornstein–Uhlenbeck eigenvalue \(-2\), and \(\tfrac12\nabla P_i\cdot\nabla P_j=B_{ij}\). The directional content is therefore
\[
 C_e=\mathbb E[\tau k'(A\tau)e^\top\{(A-u) I+2B\}P].
\tag{2}
\]
This includes the derivatives of the shared bulk. Formula (2) does not split the variance into independent core and bulk terms.

## Exact moments and uniform bound

Introduce deterministic real matrices and a vector
\[
\begin{aligned}
 M_{ij}&=2\operatorname{tr}(H_iH_j),&
 G_0&=\sum_i H_i^2,&
 R_{ij}&=\operatorname{tr}(G_0 S_{ij}),\\
 T_{ij}&=\sum_k\operatorname{tr}(S_{ki}S_{kj}),&
 v_i&=\operatorname{tr}(G_0H_i),\\
 J&=M^2+8R+16T,& K&=M^2+8T+16R .
\end{aligned}
\]
Then
\[
 \mathbb E B^2=M^2+8T,\quad
 \mathbb E[(A-u)B]=16R,\quad
 \mathbb E BP=4v,\quad
 \mathbb E[(A-u)P]=8v,\quad
 L=2\operatorname{tr} J .
\tag{3}
\]
For verification, the log-mgf of a centered real quadratic with coefficient \(H\) is \(\sum_{k\ge2}2^{k-1}\operatorname{tr}(H^k)/k\) near zero. Apply it to linear combinations. The second and third coefficients give the first four identities. In the fifth, for the pair \(i,j\) the covariance of their squares is \(2M_{ij}^2+32\operatorname{tr}(H_i^2H_j^2)+16\operatorname{tr}(H_iH_jH_iH_j)\). Use \(\operatorname{tr}(S_{ij}^2)=\tfrac12(\operatorname{tr}(H_i^2H_j^2)+\operatorname{tr}(H_iH_jH_iH_j))\) and sum. These identities require no independence among the quadratics.

With probability measure \(d\mu=A\tau\,d\mathbb P/u\), put \(Z_e=e^\top[(A-u)I+2B]P/A\) where \(A>0\), with value zero otherwise. Since \(\|P\|^2=A\), the expanded signed square and (3) give \(u\mathbb E_\mu Z_e^2\le L+4e^\top K e\) and \(u\mathbb E_\mu Z_e=16e^\top v\). The inverse of \(I-\Pi_{\rm const}/2\) on \(L^2(\mu)\) is \(I+\Pi_{\rm const}\). Duality in (2) with the original law functional gives the explicit sufficient coefficient
\[
 \theta(e)=\frac13\left[1+
       \frac{4e^\top K e+256(e^\top v)^2/u}{2\operatorname{tr}J}\right].
\tag{4}
\]
The denominator is positive for \(q\ne0\). In particular \(\operatorname{tr} M^2>0\), and \(\operatorname{tr}R,\operatorname{tr}T\ge0\).

To bound (4), rotate the real factor indices so that the first becomes \(e^\top P\). Write \(r_{ij}=\operatorname{tr}(H_i^2H_j^2)\) and \(t_{ij}=\operatorname{tr}(S_{ij}^2)\). Both are nonnegative. For \(j\ne1\), \(\operatorname{tr}J\) contains \(16r_{1j}+32t_{1j}\), dominating the \(16r_{1j}+8t_{1j}\) contribution to \(K_{11}\). The two diagonal contributions from \(r,t\) agree. Hence \(e^\top K e\le\operatorname{tr}J\).

Furthermore \(e^\top P\) is the real part of a linear combination of centered Hermitian-complex forms, equivalently a centered Hermitian form in \(Y\). Therefore the eigenvalues of its real coefficient \(H_1\) occur in equal pairs, so \(M_{11}^2=4(\operatorname{tr}H_1^2)^2\ge8\operatorname{tr}H_1^4\). The diagonal contribution to \(\operatorname{tr}J\) is then at least \(32t_{11}\). Its off-diagonal pair contributions dominate \(32t_{1j}\). Thus \(32e^\top T e\le\operatorname{tr}J\). Finally by Cauchy–Schwarz on \(\sum_i\operatorname{tr}(H_iS_{i,e})\),
\[
 (e^\top v)^2/u\le\tfrac12 e^\top T e,\qquad u=2\sum_i\operatorname{tr}H_i^2 .
\]
Substituting the last three bounds into (4) gives \(5/3\). The actual content norm is obtained by a real direction of the complex receiver content, so (1) follows. ∎

For a simple correlated example, take \(q=X(|Y|^2-1)+\bar ZY^2\) with \(X,Y,Z\) independent and standard. The two summands use the same \(Y\). If \(R=|Y|^2\), then \(A=(R-1)^2+R^2\), \(u=3\) and \(\delta=104\). At \(h(v)=v\), the \(X\) content is \(2\mathbb E[(R-1)A]=12\). Both the fourth excess and the marked content differ materially from the independent-bulk formulas. These computations are checked exactly by the replay.

The pseudocovariance condition can hold even with common receiver variables and nonzero coefficients on both sides. For example \(p_1=y_1\bar y_2,\ p_2=y_3\bar y_2,\ f_1=y_3y_4,\ f_2=-y_1y_4\). Additional pure receiver terms are allowed; all formulae remain valid.
