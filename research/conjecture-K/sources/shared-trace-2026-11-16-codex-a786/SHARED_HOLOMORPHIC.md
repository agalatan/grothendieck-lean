<!-- Verbatim from the delivery content_law_shared_trace_and_phase_obstruction_20261116.zip (SHARED_HOLOMORPHIC.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# The holomorphic part may share the same Gaussian block

**Theorem 3 (P + C).** Theorem 1 in PROOFS.md remains true, with exactly the same constants \(\Theta_d\), if each matrix block is replaced by
\[
Q_{d,\lambda}
 =Y^*GY-\operatorname{tr}G
   +\sqrt\lambda\sum_{a,b=1}^d\overline Z_{ab}Y_aY_b,
\qquad \lambda\ge0.
\tag{1}
\]
The entries of \(G,Z\) and \(Y\) are independent proper standard complex Gaussians. Different blocks and the additional bulk \(W\) remain independent. In particular the holomorphic-quadratic and Hermitian-quadratic terms in (1) may share every \(Y\) coordinate. The parameter \(\lambda\) is unrestricted.

The proof is written below (**P**). Polynomial identities and nonnegative-coefficient checks on the whole continuum \(\lambda\ge0\) and integer range \(d\ge2\) have an exact replay (**C**). There is no discretization of \(\lambda\).

## 1. Conditional reduction

Conditional on \(Y\), the variance of (1) is
\[
A_\lambda(S)=(1+\lambda)S^2-2S+d=R_d(S)+\lambda S^2,
\quad S=\|Y\|^2.
\tag{2}
\]
The \(Z,Y\) contents vanish under the symmetry \(Y\mapsto e^{i\phi}Y,\ Z\mapsto e^{2i\phi}Z,\ G\mapsto G\). Gaussian regression and spherical averaging again leave only the trace direction of \(G\). Thus the proof of PROOFS §§2–5 applies with
\[
\begin{split}
u_\lambda&=d^2+\lambda d(d+1),\\
L_\lambda&=2d[(2d^2+d+1)+(4d^2+6d+2)\lambda
                   +(2d^2+5d+3)\lambda^2],\\
N_\lambda&=(S-d)(A_\lambda-u_\lambda)+SA_\lambda',
\qquad \mathbb EN_\lambda=4u_\lambda.
\end{split}
\tag{3}
\]
In the multiple-block proof, the mean bound (25) becomes
\[
u(\mathbb E_\mu Z_e)^2
 \le16\sum_j e_j^2a_j^4u_{d_j,\lambda_j}/d_j.
\tag{4}
\]
Indeed \(u\ge\sum_j a_j^2u_{d_j,\lambda_j}\). It therefore suffices to prove
\[
\Theta_d\ge
\frac{\mathbb E[N_\lambda^2/A_\lambda]+16u_\lambda}
 {3dL_\lambda},\qquad
\Theta_d\ge\frac1{3d}\mathbb E\frac{(S-d)^2}{A_\lambda}.
\tag{5}
\]
The bulk term in the second inequality is at most its value for \(\lambda=0\).

## 2. A polynomial upper bound

Let
\[
\begin{split}
\mathcal B_{d,\lambda}={}&d^4-d^3+14d^2+6d+4\\
 &+(2d^4+6d^3+16d^2+24d+32)\lambda\\
 &+(d^4+7d^3+14d^2-14d+64)\lambda^2.
\end{split}
\tag{6}
\]
Then
\[
\mathbb E[N_\lambda^2/A_\lambda]\le\mathcal B_{d,\lambda}.
\tag{7}
\]
To prove it, use \(A_\lambda\ge R_d\) and divide \(N_\lambda^2\) by the monic quadratic \(R_d\), writing \(N_\lambda^2=R_d Q+J\). The remainder has the factorization
\[
J=C_{d,\lambda}(d-2S)+J_0,
\tag{8}
\]
where
\[
\begin{split}
C_{d,\lambda}={}&[d^2-2+\lambda(d^2+4d-8)]\\
 &\times[(d-1)(d^2-2)+\lambda(d^3+d^2-8d+8)],\\
J_0={}&-2d^2\lambda(d-2)
 [d^2-2+\lambda(d^2+2d-4)].
\end{split}
\tag{9}
\]
For \(d\ge2,\lambda\ge0\), \(C_{d,\lambda}\ge0\) and \(J_0\le0\). Each bracket is nonnegative by expanding in \(d-2\). The signed Gamma identity (20) of PROOFS therefore implies \(\mathbb E[J/R_d]\le0\). Gamma moments give \(\mathbb EQ=\mathcal B_{d,\lambda}\), proving (7).

At \(d=2,3,4\), the comparison
\[
\frac{\mathcal B_{d,\lambda}+16u_\lambda}{3dL_\lambda}
 \le\Theta_d^{\rm pol}
\tag{10}
\]
follows, after clearing the displayed rational denominators, from the polynomials
\[
\begin{array}{c|l}
d&\text{nonnegative numerator}\\ \hline
2&800\lambda+1220\lambda^2\\
3&69336\lambda+88020\lambda^2\\
4&91200\lambda+92832\lambda^2.
\end{array}
\tag{11}
\]
Here the denominator conventions are respectively
\(6(3dL)-11(\mathcal B+16u)\),
\(173(3dL)-594(\mathcal B+16u)\), and
\(175(3dL)-888(\mathcal B+16u)\).

For completeness (7) alone gives the uniform constant \(173/594\) for every \(d\ge3,\lambda\ge0\). At \(d=3+x\), the coefficients of \(\lambda^0,\lambda^1,\lambda^2\) in \(173(3dL_\lambda)-594(\mathcal B+16u_\lambda)\) are
\[
\begin{split}
&1482x^4+19416x^3+77934x^2+99864x,\\
&2964x^4+38232x^3+167100x^2+266688x+69336,\\
&1482x^4+18816x^3+84114x^2+165024x+88020.
\end{split}
\tag{12}
\]

## 3. The inverse-moment bound retains decay in dimension

Since
\[
A_\lambda\ge(\lambda+(d-1)/d)S^2,
\]
put \(D_0=(d-1)(d-2)\) and
\[
\begin{split}
E_{d,\lambda}:={}&D_0\mathbb E[N_\lambda^2/S^2]\\
={}&24d^4-78d^3+78d^2-32d+8\\
 &+(48d^4-108d^3+36d^2+24d)\lambda\\
 &+(24d^4-30d^3-18d^2+36d)\lambda^2.
\end{split}
\tag{13}
\]
Thus
\[
\frac{\mathbb E[N_\lambda^2/A_\lambda]+16u_\lambda}{3dL_\lambda}
\le
\frac{dE_{d,\lambda}+16u_\lambda D_0(d-1+d\lambda)}
 {3dL_\lambda D_0(d-1+d\lambda)}
\le\Theta_d^{\rm inv}\quad(d\ge4).
\tag{14}
\]
For the last inequality, cross-multiplication reduces its numerator to
\(6d^2\lambda(d-2)(d-1)F(d,\lambda)\), where
\[
\begin{split}
F={}&(40d^6-82d^5-67d^4+161d^3-40d^2-64d+24)\\
 &+(80d^6-84d^5-246d^4+148d^3+100d^2-118d+12)\lambda\\
 &+(40d^6-2d^5-139d^4-21d^3+64d^2-12d)\lambda^2.
\end{split}
\tag{15}
\]
All coefficients of \(F(4+x,\lambda)\) are positive. This is an exact polynomial certificate, replayed by the script.

Also \(\Theta_d^{\rm inv}\le\Theta_d^{\rm pol}\) for every \(d\ge5\): after removing positive factors, the comparison is
\[
d^6-4d^5-5d^4+16d^3-10d^2+8d+8\ge0,
\tag{16}
\]
whose coefficients after \(d=5+x\) are positive. Equations (10) and (14) prove the first part of (5) with the same \(\Theta_d\) as before. The second follows from the existing bulk bounds and \(A_\lambda\ge R_d\). This completes the proof.

For \(h(v)=v\), a block of amplitude \(a\) has squared content \(16a^6u_\lambda^2/d\). Hence these enlarged families still have nonzero content. Nothing here requires or asserts independence of the two summands within (1).
