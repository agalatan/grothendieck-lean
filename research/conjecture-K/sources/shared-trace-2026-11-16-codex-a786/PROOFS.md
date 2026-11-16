<!-- Verbatim from the delivery content_law_shared_trace_and_phase_obstruction_20261116.zip (PROOFS.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# Content in the trace direction of a shared matrix block

All quantified claims in this file are **P**: complete written proofs, author only. The exact algebraic replay is **C**, described separately. This is not an unrestricted content-law theorem.

## 1. Statement

All Gaussian coordinates are proper standard complex Gaussians; different displayed blocks are independent. For each \(j=1,\ldots,r\), let \(Y_j\in\mathbb C^{d_j}\), \(d_j\ge2\), and let \(H_{j,a}\), \(0\le a<d_j^2\), be a real Hilbert–Schmidt orthonormal basis of Hermitian matrices, with
\[
H_{j,0}=I/\sqrt{d_j},\qquad \operatorname{tr}H_{j,a}=0\quad(a>0).
\]
Let \(X_{j,a}\) be independent standard complex Gaussians and set
\[
Q_j=\sum_{a=0}^{d_j^2-1}X_{j,a}
 (Y_j^*H_{j,a}Y_j-\operatorname{tr}H_{j,a}).
\tag{1}
\]
Allow any finite independent bulk
\[
W=\sum_b\overline Z_b F_b(U),
\tag{2}
\]
where the \(F_b\) are arbitrary holomorphic homogeneous quadratic polynomials. For arbitrary \(a_j\ge0\), not all zero, put
\[
q=\sum_j a_jQ_j+W.
\tag{3}
\]
Complex amplitudes give the same class by rotating the corresponding \(X\) coordinates. All terms belong to the genuine finite-dimensional Wick chaos \(H_{2,1}\).

An equivalent, basis-free description is \(Q_j=Y_j^*G_jY_j-\operatorname{tr}G_j\), where \(G_j\) is a \(d_j\times d_j\) matrix of independent standard complex Gaussian entries, independent of \(Y_j\). Passing from matrix entries to a Hermitian orthonormal basis is a complex unitary change of Gaussian coordinates.

Define
\[
\begin{split}
\Theta^{\rm pol}_d&=
\frac{d^4-d^3+30d^2+6d+4}{6d^2(2d^2+d+1)},\\
\Theta^{\rm inv}_d&=
\frac{20d^3-51d^2+28d-4}
 {3d(d-2)(d-1)(2d^2+d+1)}\quad(d\ge4),\\
\Theta_d&=\begin{cases}
\Theta^{\rm pol}_d,&d=2,3,\\
\min(\Theta^{\rm pol}_d,\Theta^{\rm inv}_d),&d\ge4.
\end{cases}
\end{split}
\tag{4}
\]

**Theorem 1 (P).** For every real continuous profile \(h:[0,\infty)\to\mathbb R\) of polynomial growth, (3) satisfies
\[
\boxed{\quad\|\Pi_1[qh(|q|^2)]\|^2
 \le \max_{j:a_j>0}\Theta_{d_j}\;\delta\;\widehat\Omega[h].\quad}
\tag{5}
\]
Here \(u,\delta,k,\widehat\Omega\) belong to the same entire cubic (3), including the bulk. In particular,
\[
\Theta_2=\frac6{11}<\frac35,\quad
\Theta_3=\frac{173}{594}<\frac3{10},\quad
\Theta_4=\frac{175}{888},\quad
\sup_{d\ge3}\Theta_d=\frac{173}{594}.
\tag{6}
\]
Moreover \(\Theta_d=O(d^{-2})\). All six content targets are covered on (3) if every active \(d_j\ge3\). If some active \(d_j=2\), the last five are covered. These comparisons do not certify the numerical row budgets or the rest of the degree-5 programme.

## 2. Only the trace coordinates contribute

Write \(S_j=\|Y_j\|^2\sim\mathrm{Gamma}(d_j,1)\), and
\[
R_d(s)=s^2-2s+d=(s-1)^2+d-1.
\tag{7}
\]
Completeness of the Hermitian basis gives
\[
\sum_a(Y^*H_aY-\operatorname{tr}H_a)^2
 =\|YY^*-I\|_{\rm HS}^2=R_d(S).
\tag{8}
\]
Conditional on all \(Y_j,U\), \(q\) is a proper complex Gaussian of variance
\[
A=\sum_j a_j^2R_{d_j}(S_j)+D,\qquad D=\sum_b|F_b(U)|^2.
\tag{9}
\]
Its squared radius is thus represented by \(A\tau\), with independent \(\tau\sim\mathrm{Exp}(1)\). Gaussian regression gives the \(X_{j,a}\) content as
\[
a_j\mathbb E[(Y_j^*H_{j,a}Y_j-\operatorname{tr}H_{j,a})
 \tau h(A\tau)].
\tag{10}
\]
Given \(S_j\), the direction of \(Y_j\) is uniform on the sphere with conditional covariance \(S_jI/d_j\). A traceless quadratic has conditional mean zero. Since \(A\) only depends on \(Y_j\) through \(S_j\), all the \(a>0\) contents vanish. The surviving coordinate is
\[
c_j=\frac{a_j}{\sqrt{d_j}}\mathbb E[(S_j-d_j)\tau h(A\tau)].
\tag{11}
\]
The \(Y_j\) contents vanish under \(Y_j\mapsto e^{i\phi}Y_j\). The bulk coordinates have zero content under \(U\mapsto e^{i\phi}U,\ Z\mapsto e^{2i\phi}Z\), which fixes \(W\). These use ledger **11.31a**; conditional spherical averaging identifies the remaining direction. Each \(c_j\) is real.

## 3. A signed scalar pairing

Integration of \((s^de^{-s}g(s))'\) proves
\[
\mathbb E[(S-d)g(S)]=\mathbb E[Sg'(S)]
\quad(S\sim\mathrm{Gamma}(d,1)).
\tag{12}
\]
For \(f=k'\), \(h=k-uf\) and exponential integration by parts give
\[
\mathbb E_\tau[\tau h(A\tau)]
 =\mathbb E_\tau k(A\tau)+(A-u)\mathbb E_\tau[\tau f(A\tau)].
\tag{13}
\]
Using (12) on the first term of (11), with other blocks fixed, gives
\[
c_j=\frac{a_j}{\sqrt{d_j}}\mathbb E[\tau f(A\tau)N_j],
\qquad N_j=(S_j-d_j)(A-u)+a_j^2S_jR'_{d_j}(S_j).
\tag{14}
\]
This specializes the signed representation behind ledger **6.3.23**, with a direct proof here. It does not use the majorant in 6.3.25.

Set \(d\mu=(A\tau/u)d\mathbb P\). For real unit \(e\in\mathbb R^r\), define \(Z_e=A^{-1}\sum_j e_j a_jN_j/\sqrt{d_j}\). The inverse of \(I-\frac12\Pi_{\rm const}\) is \(I+\Pi_{\rm const}\), whence
\[
|c_e|^2\le\frac{2u}{3}
 (\mathbb E_\mu Z_e^2+(\mathbb E_\mu Z_e)^2)\widehat\Omega[h].
\tag{15}
\]
Indeed \(c_e=u\mathbb E_\mu Z_ef\), whereas
\(\widehat\Omega=(3u/2)(\mathbb E_\mu f^2-\frac12(\mathbb E_\mu f)^2)\).

## 4. Scalar estimates with exact constants

For a single \(d\ge2\), abbreviate \(R=R_d(S)\), and put
\[
u_d=d^2,\qquad L_d=\operatorname{Var}R=2d(2d^2+d+1),
\]
\[
N_d=(S-d)(R-d^2)+SR'
 =S^3-dS^2-(d-1)(d-2)S+d^2(d-1).
\tag{16}
\]
Gamma moments \(\mathbb ES^k=d(d+1)\cdots(d+k-1)\) give
\[
\mathbb ER=d^2,\quad \mathbb EN_d=4d^2,\quad
\mathbb EN_d^2=2d(12d^3+81d^2+109d+50).
\tag{17}
\]

**Lemma 2 (P).** With \(B_d=\mathbb E[N_d^2/R]\), \(b_d=\mathbb E[(S-d)^2/R]\),
\[
B_d\le d^4-d^3+14d^2+6d+4=:B^{\rm pol}_d,\qquad b_d\le1.
\tag{18}
\]
For \(d>2\), also
\[
B_d\le\frac{2d(12d^3-27d^2+12d-4)}{(d-2)(d-1)}
 =:B^{\rm inv}_d,\qquad
b_d\le\frac{d(d+2)}{(d-2)(d-1)^2}.
\tag{19}
\]

**Proof.** Gamma integration by parts for \(1/R\) gives the signed identity
\[
\mathbb E\frac{d-2S}{R}
 =-\mathbb E\frac{S(R+R')}{R^2}
 =-\mathbb E\frac{S(S^2+d-2)}{R^2}\le0.
\tag{20}
\]
Here \(R\ge d-1>0\). Since \((S-d)^2=R+(d-1)(d-2S)\), this proves the bound for \(b_d\).

Polynomial division gives \(N_d^2=RQ_d+(d-1)(d^2-2)^2(d-2S)\), with
\[
\begin{split}
Q_d={}&S^4+(2-2d)S^3+(-d^2+d)S^2\\
 &+(4d^3-8d^2+4d)S-d^4+5d^3-4d^2-4d+4.
\end{split}
\tag{21}
\]
Thus \(B_d\le\mathbb EQ_d\), the first bound in (18).

For (19), the exact square \(R-\frac{d-1}{d}S^2=(S-d)^2/d\) implies \(1/R\le d/((d-1)S^2)\). Expand using \(\mathbb ES^{-1}=1/(d-1)\), \(\mathbb ES^{-2}=1/((d-1)(d-2))\), and the positive gamma moments. This proves (19). ∎

## 5. Any number of blocks, without a count loss

Delete zero-amplitude blocks; all indices in this section are active.

Let \(L_j=a_j^4L_{d_j}\), \(L=\operatorname{Var}A=\sum_jL_j+\operatorname{Var}D\). The same-law identities are
\[
u=\sum_j a_j^2d_j^2+\mathbb ED,\qquad \delta=2L.
\tag{22}
\]
Indeed the conditional Gaussian law gives \(\mathbb EV^2=2\mathbb EA^2\).

Let \(\xi_j=A-a_j^2R_{d_j}-(u-a_j^2d_j^2)\). It is centered, independent of \(S_j\), and has variance \(L-L_j\). Then
\[
N_j=a_j^2N_{d_j}+(S_j-d_j)\xi_j.
\tag{23}
\]
Pointwise weighted Cauchy–Schwarz, using \(\sum_j a_j^2R_{d_j}\le A\), yields
\[
u\mathbb E_\mu Z_e^2
 =\mathbb E\frac{(\sum_j e_ja_jN_j/\sqrt{d_j})^2}{A}
 \le\sum_j\frac{e_j^2}{d_j}
 \{a_j^4B_{d_j}+(L-L_j)b_{d_j}\}.
\tag{24}
\]
The cross term in each resulting expectation is zero by independence and centering of \(\xi_j\). This is a joint estimate for the profile of the whole sum.

Also \(u\mathbb E_\mu Z_e=4\sum_j e_ja_j^3d_j^{3/2}\). Using \(\sum_j a_j^2d_j^2\le u\),
\[
u(\mathbb E_\mu Z_e)^2\le16\sum_j e_j^2a_j^4d_j.
\tag{25}
\]
If \(\theta\ge(B_d+16d^2)/(3dL_d)\) and \(\theta\ge b_d/(3d)\) for all active dimensions, (24)–(25) imply
\(u(\mathbb E_\mu Z_e^2+(\mathbb E_\mu Z_e)^2)\le3\theta L\).
Equation (15) now proves (5).

Bounds (18) make \(\Theta_d^{\rm pol}\) satisfy both requirements for \(d\ge2\); (19) does the same for \(\Theta_d^{\rm inv}\) when \(d\ge4\). The comparisons reduce to polynomials with nonnegative coefficients after replacing \(d\) by \(2+x\) or \(4+x\). In addition,
\[
173[6d^2(2d^2+d+1)]-594[d^4-d^3+30d^2+6d+4]
\]
at \(d=3+x\) is
\[
1482x^4+19416x^3+77934x^2+99864x.
\tag{26}
\]
This proves (6); the inverse-moment bound gives the decay. The script checks every algebraic identity and shifted-polynomial comparison in exact arithmetic. ∎

## 6. Applicability, nontriviality and limits

The six phase profiles are continuous of polynomial growth, as proved in the input signed-pairing packet, PROOFS §9. Here is also a direct verification of the needed regularity. Write
\[
L'(z)=z(p_0+p_1|z|^2+p_2|z|^4),
\quad p_0=\ell-2\beta+\sqrt3\nu_5,\quad
p_1=\beta-\sqrt3\nu_5,\quad p_2=\nu_5/\sqrt{12}.
\]
All supplied rows have \(p_0>1/2,\ p_1>1/10,\ p_2>0\), as checked in exact arithmetic using rational bounds for the square roots. Thus \(|L'(z)|\ge|z|/2\). At real input \(r\), write \(A_\pm=L'\pm rD(z)\), where \(D\) is a degree-two polynomial. The elementary inequality
\(|\operatorname{ph}(a+b)-\operatorname{ph}a|\le2|b|/|a|\)
bounds the phase difference divided by \(r\) by \(4|D|/|L'|\). Multiplication by any of the weights \(1,e_{11},\overline{e_{20}}\) remains integrable against the planar Gaussian. Differentiability of phase away from zero and dominated convergence give a finite limit of each \(\Gamma(r)/r\) at zero. For each fixed \(r>0\), \(A_\pm\) are nonzero polynomials, whose zero sets have planar measure zero; bounded convergence gives continuity. At large \(r\), the phase difference is bounded by 2, so the quotient is \(O(1/r)\). Conjugation symmetry makes the real-axis profiles real. Therefore \(h_A,h_B\) extend as continuous bounded functions.

The ΓB convention is its real-axis restriction in the question. The theorem applies to both channels at every energy, in particular all \(u/\sigma^2\in[1/2,13/10]\).

For continuous polynomial-growth \(h\), the formula
\(k(v)=u^{-1}e^{v/u}\int_v^\infty e^{-s/u}h(s)ds\)
is \(C^1\), satisfies \(k'=(k-h)/u\), and has polynomial growth. This suffices for the integrations above; smooth approximation with polynomial domination is an alternative. No derivative of \(h\) is needed.

For \(h(v)=v\), \(k'=1\), and
\[
c_j=4a_j^3d_j^{3/2},\qquad
\|c[v]\|^2=16\sum_j a_j^6d_j^3,\qquad
\widehat\Omega[v]=3u/4.
\tag{27}
\]
These are nonzero-content examples. A single unscaled block has
\(\chi=4(2d^2+d+1)/d^3\), including \(\chi=88/27\) at \(d=3\). Arbitrarily many blocks remain covered.

Consequently the optimal constant for a single block, if required to work for *all* real profiles, has the lower bound
\[
\Theta_d^{\rm optimal}\ge \frac{16}{3(2d^2+d+1)}.
\tag{28}
\]
At \(d=2\) this is \(16/33>37/100\): no profile-independent proof can cover the first row on that family. At \(d=3\) the rigorous interval is
\[
\frac8{33}\le\Theta_3^{\rm optimal}\le\frac{173}{594}.
\]
As \(d\) increases, (19) and (28) give the matching order
\[
\frac{8/3+o(1)}{d^2}\le\Theta_d^{\rm optimal}
 \le\frac{10/3+o(1)}{d^2}.
\]
These asymptotic statements are algebraic consequences of explicit rational bounds, not numerical asymptotics.

For general shared matrices the conditional variance need not depend only on the radius of the shared Gaussian block; the conditional traceless cancellation then fails. A reduction of all cubic tensors to (3), and all unrestricted row closures, remain **open**.
