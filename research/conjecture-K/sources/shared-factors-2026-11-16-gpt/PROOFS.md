<!-- Verbatim from the delivery content_law_shared_factors_20261116.zip (PROOFS.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Proofs

All theorem statements in this file are **P** unless an exact **C** comparison or an **open** scalar evaluation is specified.

## 1. Conditional Gaussian models with shared Hermitian forms

Write every complex coefficient matrix as the sum of a Hermitian matrix and \(i\) times a Hermitian matrix. Collect the resulting real quadratic factors as \(P_i=Y^*H_iY-\operatorname{tr}H_i\), \(1\le i\le p\). Their ordering can give \(q=\sum_jX_j(P_{2j-1}+iP_{2j})+W\), with zero factors permitted. All \(X,Y,U,Z\) are independent proper standard complex Gaussian blocks and \(W=\sum_j\bar Z_j F_j(U)\), as in README. The cubic is in \(H_{2,1}\). Rotations of \(Y\), and the joint rotation \(U\mapsto e^{i\varphi}U,\ Z\mapsto e^{2i\varphi}Z\), show that the content is supported on the \(X\) block. With real \(h\), its real and imaginary parts are represented by a single real vector indexed by the \(P_i\).

Use the following real symmetric deterministic matrices:
\[
\begin{aligned}
M_{ij}&=\operatorname{tr}(H_iH_j),&
S_{ij}&=(H_iH_j+H_jH_i)/2,&
G&=\sum_i H_i^2,\\
R_{ij}&=\operatorname{tr}(GS_{ij}),&
T_{ij}&=\sum_k\operatorname{tr}(S_{ki}S_{kj}),&
v_i&=\operatorname{tr}(GH_i),\\
J&=M^2+R+2T,&K&=M^2+T+2R.
\end{aligned}
\]
Let \(B_{ij}=Y^*S_{ij}Y\), \(D=\sum_j|F_j(U)|^2\), \(A=\|P\|^2+D\), \(u=\mathbb E A>0\), and \(L=\operatorname{Var}(A)\). Conditional on \(Y,U\), \(q\) is proper Gaussian with variance \(A\). Thus the radial law is \(V=A\tau\) with independent \(\tau\sim\operatorname{Exp}(1)\), and \(\delta=2L\).

**Theorem 1.** If any \(H_i\ne0\), then
\[
 \|c[h]\|^2\le\theta\,\delta\,\widehat\Omega[h],\qquad
 \theta=\frac13\left(1+
 \frac{4\lambda_{\max}(K+4vv^\top/u)}{2\operatorname{tr}J+\operatorname{Var}D}\right)\le\frac53.
 \tag{1}
\]
If all \(H_i=0\), the content vanishes. This holds for every real continuous polynomial-growth profile and every scale of \(q\).

**Proof.** Gaussian regression at fixed \(Y,U\) gives the real content vector \(\mathbb E[P\tau h(A\tau)]\). With \(k=\mathcal K_u h\), exponential integration by parts gives
\[
\mathbb E_\tau[\tau h(A\tau)]
=\mathbb E_\tau k(A\tau)+(A-u)\mathbb E_\tau[\tau k'(A\tau)].
\]
For the first term, use Gaussian integration by parts against the centered quadratic \(P_i\). In real standard coordinates \(P_i\) has Ornstein–Uhlenbeck eigenvalue \(-2\), and \(\tfrac12\langle\nabla P_i,\nabla P_j\rangle=Y^*S_{ij}Y=B_{ij}\). The chain rule and independence of \(D\) give the exact vector identity
\[
c_{\mathbb R}[h]=\mathbb E\bigl[\tau k'(A\tau)\{P(A-u)+2BP\}\bigr]. \tag{2}
\]
With \(d\mu=(A\tau/u)d\mathbb P\), fix real unit \(e\) and put
\[
Z_e=e^\top\{(A-u)I+2B\}P/A .
\]
The integrand is set to zero wherever \(A=0\). For \(f=k'(A\tau)\),
\[
 |c_e|^2\le\frac{2u}3\bigl(\mathbb E_\mu Z_e^2+(\mathbb E_\mu Z_e)^2\bigr)\widehat\Omega.
 \tag{3}
\]
Indeed \(\widehat\Omega=(3u/2)(\mathbb E_\mu f^2-\tfrac12(\mathbb E_\mu f)^2)\), and the operator \(I-\tfrac12\Pi_{\rm const}\) has inverse \(I+\Pi_{\rm const}\).

Since \(\|P\|^2\le A\), expanding the signed square only now yields
\[
 u\,\mathbb E_\mu Z_e^2\le L+4e^\top K e,\qquad
 u\,\mathbb E_\mu Z_e=4e^\top v. \tag{4}
\]
The moment identities used here are
\[
\mathbb E B^2=M^2+T,\quad
\mathbb E[(A-u)B]=2R,\quad
\mathbb E[(A-u)P]=2v,\quad
\mathbb E[BP]=v,\quad L=2\operatorname{tr}J+\operatorname{Var}D. \tag{5}
\]
Here \(B^2\) is the matrix square. For a centered quadratic \(P_H\), diagonalization gives \(\log\mathbb E e^{tP_H}=\sum_{k\ge2}t^k\operatorname{tr}(H^k)/k\) near zero. Apply it to \(H=\sum t_iH_i\) and compare coefficients. In particular \(\operatorname{Cov}(P_i^2,P_j^2)=2M_{ij}^2+4\operatorname{tr}(H_i^2H_j^2)+2\operatorname{tr}(H_iH_jH_iH_j)\). Also \(\operatorname{tr}(S_{ij}^2)=\tfrac12(\operatorname{tr}(H_i^2H_j^2)+\operatorname{tr}(H_iH_jH_iH_j))\). Summing proves the variance identity. The quadratic covariance and cubic cumulant give the first four identities by direct substitution. Equations (3)–(5) give (1)'s explicit coefficient.

For the uniform bound, rotate the real factor indices to make \(e\) the first basis vector. For \(r_{ij}=\operatorname{tr}(H_i^2H_j^2)\ge0,\ t_{ij}=\operatorname{tr}(S_{ij}^2)\ge0\), each pair \((1,j)\) with \(j>1\) contributes \(2r_{1j}+4t_{1j}\) to \(\operatorname{tr}J\), and \(2r_{1j}+t_{1j}\) to \(K_{11}\). The diagonal contribution \(3t_{11}\) is identical. Thus \(e^\top K e\le\operatorname{tr}J\). Moreover \((e^\top v)^2\le(\operatorname{tr}M)e^\top T e\), by Cauchy–Schwarz on \(\sum_i\operatorname{tr}(H_iS_{i,e})\). The same pair count shows \(4e^\top T e\le\operatorname{tr}J\): for the diagonal use \(t_{11}=\operatorname{tr}H_1^4\le M_{11}^2\). Hence \(\lambda_{\max}(K+4vv^\top/u)\le2\operatorname{tr}J\), proving \(\theta\le5/3\). ∎

For fixed \(u\), the original concave law functional is retained. The estimate uses no directional maximization of the four projections in ledger 6.3.25.

## 2. Explicit shared and independent families

**Shared noncommuting example.** Let \(H_i\) form a real Hilbert–Schmidt orthonormal basis of Hermitian \(d\times d\) matrices. Write \(t_i=\operatorname{tr}H_i\). The completeness identities \(\sum_iH_iBH_i=(\operatorname{tr}B)I\), \(\sum_iH_i^2=dI\), and \(t^\top t=d\) follow from the diagonal matrix units and the two normalized Hermitian combinations of each off-diagonal pair. Consequently
\[
 M=I,\quad R=dI,\quad T=(dI+tt^\top)/2,\quad v=dt,\quad
 \operatorname{tr}J=d^2(1+2d)+d .
\]
At zero bulk, \(u=d^2\) and \(\lambda_{\max}(K+4vv^\top/u)=1+7d\). Any allowed bulk only increases the denominator of (1) and decreases its rank-one term. Thus for every \(d\ge8\),
\[
 \theta\le\frac13\left(1+\frac{2(1+7d)}{d^2(1+2d)+d}\right)
 <\frac{37}{100}.
\]
The strict comparison is a cubic polynomial with positive coefficients in \(d-8\), checked exactly. For \(h(v)=v\), (2) gives \(c_{\mathbb R}=4dt\ne0\). With zero bulk the normalized excess is \(4[d^2(1+2d)+d]/d^4\). This example has all its quadratic factors on the same \(Y\).

**Independent gamma factors, with finite bulk.** Specialize to \(n\ge1\) independent factors \(P_i=\sqrt{s}(G_i-m)/\sqrt{m}\), \(G_i\sim\operatorname{Gamma}(m,1)\), with \(s>0\) the common energy of each factor. Let \(p_i=P_i/\sqrt{s}\), \(r_i=p_i^2\), and \(\eta_i=\mathbb E[p_i\mid r_i]\). Define \(\alpha^2=\mathbb E[\eta_i^2/r_i]\) and \(J_w=\mathbb E[(r_i+1)^2\eta_i^2/r_i]\). After conditioning on all \(r_i,D\), the numerator of \(Z_e\) in (3) is
\[
 \sum_i e_i\sqrt{s}\{\eta_i(A-u+2s)+2s r_i/\sqrt m\}.
\]
Use Cauchy–Schwarz with the weights \(\sqrt{sr_i/A}\), whose squares sum to at most one. The signed cross term of the resulting expectation is \(8s^2/m\), since \(\mathbb E p_i=0\), \(\mathbb E p_i^3=2/\sqrt m\), and the other factors and \(D\) are independent of \(p_i\). Put \(V_m=2+6/m=\operatorname{Var}(r_i)\). This proves
\[
 u\,\mathbb E_\mu Z_e^2\le\alpha^2(L-s^2V_m)+s^2(J_w+12/m).
\]
The squared mean contribution in (3), multiplied by \(u\), is at most \(16ns^3/(mu)\le16s^2/m\). Since \(L\ge ns^2 V_m\), one valid bound is
\[
 \theta\le\frac13\left[\alpha^2+\frac{(J_w+28/m)/V_m-\alpha^2}{n}\right]
\]
whenever the second numerator is nonnegative. More generally replace that numerator by its positive part. For \(m=1\), the reflected density affinity is \(2/e\). The sign estimate from Partial Theorem Progress, proved by Cauchy–Schwarz under the folded density, gives \(\alpha^2\le1-4/e^2<23/50\). To verify the last inequality, sum the exponential series to order 5, then bound the tail by \(7/(6\cdot720)\), obtaining \(e<68/25\), and square. Also \(J_w\le\mathbb E(r_i+1)^2=12\). Using \(V_1=8\) gives \(\theta\le(23/50+(5-23/50)/n)/3\). The comparisons at \(n=7,8\) are exact.

## 3. General cubics and three derivatives

**Theorem 2.** Let \(q\in H_{2,1}\) be arbitrary, \(h\) real with \(\Phi(z)=zh(|z|^2)\) of class \(C^3\) and derivatives of polynomial growth. With \(D_h\) from README,
\[
 \|c[h]\|^2\le\frac{13}2\,\delta^{3/2}\mathbb E[D_h^2(V)]. \tag{6}
\]

**Proof.** Write \(Q_i=I_3(f_i)\), \(i=1,2\), for the real and imaginary parts of \(q\) in standard real Gaussian coordinates. The \(f_i\) are real symmetric third-order tensors. The normalization is \(\mathbb E I_d(f)^2=d!\|f\|^2\). Set \(K_i=f_i\otimes_2f_i\) and \(\Lambda=\max_i\|K_i\|_{\rm HS}\).

The real-chaos product formula gives \(P_2(Q_i^2)=18I_2(K_i)\). For \(Q_i\) in third chaos the generator product rule gives
\[
 \kappa_4(Q_i)=2\|P_2(Q_i^2)\|^2+\|P_4(Q_i^2)\|^2.
\]
For example, \(\|\nabla Q_i\|^2/3\) is \(Q_i^2+\tfrac16 L_{\rm OU}(Q_i^2)\); substitute into \(\mathbb E Q_i^4=\mathbb E[Q_i^2\|\nabla Q_i\|^2]\). Circularity implies \(\kappa_4(Q_i)=3\delta/8\), so
\[
 \Lambda\le \sqrt{3\delta/8}/36. \tag{7}
\]

Take a fixed real unit input direction \(e\), and \(\phi(z)=\Re\Phi(z)\). Write \(A_i=f_i(e,\cdot,\cdot)\), with \(\|A_i\|_{\rm HS}\le\sqrt\Lambda\). Integration by parts in \(e\) gives \(\mathbb E[G_e\phi(q)]=3\sum_i\mathbb E[I_2(A_i)\partial_i\phi(q)]\). Integrate by parts twice with the quadratic Wick polynomial. If \(v_{ia}\) is the vector obtained by contracting \(A_i\) with two indices of \(f_a\), then the resulting identity is
\[
 \mathbb E[G_e\phi(q)]=
 \sum_{i,a,b=1}^2\mathbb E\left[
  \partial_{iab}\phi(q)
  \{3\langle \nabla Q_a,A_i\nabla Q_b\rangle+18D_{v_{ia}}Q_b\}\right]. \tag{8}
\]
Indeed \(D^2 Q_a=6I_1(f_a)\) with two tensor indices left free, and integration by parts against the resulting linear form differentiates \(\partial_{ia}\phi(q)\) once more. Equation (8) is the step that retains three factors of the cubic tensor.

For symmetric \(A\) one has the dimension-free product estimate
\[
 \|\langle\nabla Q_a,A\nabla Q_b\rangle\|_2
 \le9\sqrt{60}\,\Lambda\,\|A\|_{\rm HS}. \tag{9}
\]
To see this, regard \(f_i\) as \(F_i:\mathbb R^N\to(\mathbb R^N)^{\otimes2}\), with \(F_i^*F_i=K_i\). Expand the product of the two quadratic integrals in \(\nabla Q_a,\nabla Q_b\). Before the three Wick coefficients \(1,4,2\), each output kernel has norm at most \(\Lambda\|A\|_{\rm HS}\). For order 4 use the operator norm of \(F_a\otimes F_b\); symmetrization contracts the norm. For order 0 use
\(\|F_a^*F_b\|_{\rm HS}^2=\operatorname{tr}(F_aF_a^*F_bF_b^*)\le \|K_a\|_{\rm HS}\|K_b\|_{\rm HS}\).
For order 2 use the contraction \(A\mapsto\sum_k f_{a,k}A f_{b,k}\). Pair it in Hilbert–Schmidt inner product with a test matrix \(H\). Then Cauchy–Schwarz bounds the pairing by
\[
 (\textstyle\sum_k\|f_{a,k}H\|_{\rm HS}^2)^{1/2}
 (\textstyle\sum_k\|A f_{b,k}\|_{\rm HS}^2)^{1/2}
 \le\Lambda\|A\|_{\rm HS}\|H\|_{\rm HS},
\]
since \(\sum_k f_{i,k}^2=K_i\). Orthogonality and \(4!+4^2\,2!+2^2=60\) give (9), including the factor \(9\) from the two gradients.

Also \(\|v_{ia}\|\le\sqrt\Lambda\|A_i\|_{\rm HS}\), hence \(\|D_{v_{ia}}Q_b\|_2\le3\sqrt2\,\Lambda\|A_i\|_{\rm HS}\). In (8) the \(L^2\) norm of each of the eight coefficients in braces is therefore at most \(27(\sqrt{60}+2\sqrt2)\Lambda^{3/2}\). Cauchy–Schwarz over real output indices and expectation gives an additional factor \(\sqrt 8\) times \((\mathbb E\|D^3\phi(q)\|_{\rm HS}^2)^{1/2}\). Charge one implies that the real first-chaos projection has norm \(\|c[h]\|/\sqrt2\). Evaluating at \((\sqrt v,0)\) and then rotating the real output shows \(\|D^3\phi(z)\|_{\rm HS}^2\le D_h^2(|z|^2)\). The two orthogonal tensors for the real and imaginary outputs have nonzero entries on the index patterns \((111),(122)\) and \((112),(222)\), respectively, giving the displayed formula for \(D_h^2\).

Using (7), the resulting squared coefficient is
\(\tfrac14(68+8\sqrt{30})(3/8)^{3/2}<13/2\).
The last comparison follows by squaring the rational bounds \(\sqrt{30}<11/2\) and \(\sqrt{3/8}<49/80\). This proves (6). ∎

**Corollary 3 (the polynomial profile in ledger 6.3.12).** For every cubic,
\[
\|c[v]\|^2\le \frac{3\sqrt6}{4}\,\delta^{3/2}.
\tag{9a}
\]

**Proof.** In (8) take \(\phi(z)=(\Re z)^3\). Only \((i,a,b)=(1,1,1)\) contributes. The mean of \(D_{v_{11}}Q_1\) is zero, and \(\mathbb E[(\nabla Q_1)(\nabla Q_1)^\top]=18K_1\). Thus \(\mathbb E[G_e Q_1^3]=324\langle f_1(e,\cdot,\cdot),K_1\rangle\). Next average over the simultaneous phase of \(q\) and the complex linear form with real part \(G_e\). Conditional on any values of those two complex numbers, the circle averages for \(G_e Q_1^3\) and \(G_e Q_1|q|^2\) have ratio \(3/4\), by the averages of \(\cos^4\) and \(\cos^2\), and the mixed sine terms integrate to zero. Taking the real first-chaos projection therefore gives \(\|c[v]\|\le\sqrt2\,(4/3)\,324\,\Lambda^{3/2}\). Equation (7) yields (9a). ∎

In particular one can split off any real linear slope \(\lambda v\) in a smooth profile and apply (9a) and (6) separately. The resulting coefficient relative to \(\delta^{3/2}\) is
\[
\left(|\lambda|\sqrt{3\sqrt6/4}+
  \sqrt{(13/2)\,\mathbb E D_{h-\lambda v}^2(V)}\right)^2.
\]
This may reduce the scalar upper bound in (10).

## 4. A scalar criterion for the original law functional

Let \(g(v)=v k'(v)^2\), \(b=\mathbb E g(u\tau)\), \(M_0=\sup_v D_h^2(v)\), and \(L_0=\tfrac94\sup_v|g'(v)|\). Use the variance-\(u\) resolvent \(K_g=\mathcal K_u g\). The deficit identity in Conjecture-K ledger 6.3.24, with \(\gamma=(K_g(0)-K_g(v))/v\), and the budget in 6.3.21 give
\[
 |b-\mathbb E g(V)|\le
 \sqrt\delta\,\sup_v\sqrt{|v\gamma'(v)|^2+|K_g'(v)|^2/2}
 \le \sqrt\delta L_0.
\]
In the last step use \(|v\gamma'|=|(K_g(v)-K_g(0))/v-K_g'(v)|\le2\|g'\|_\infty\). In fact any upper bound on the first scalar supremum can replace \(L_0\). Since \(\widehat\Omega\ge(3/4)\mathbb E g(V)\), (6) proves the following explicit sufficient test (**P**):
\[
 \boxed{\quad u\sqrt{\chi}\,(26M_0+3\theta L_0)\le 3\theta b.\quad} \tag{10}
\]
When \(b=0\), \(k'=0\) by continuity, so the profile is constant and the content vanishes. Rational upper bounds on \(M_0,L_0,u\) and a rational lower bound on \(b\) in an energy cell produce a rational cutoff for \(\chi\). No row-specific evaluation of \(b,M_0,L_0\) is certified in this packet.

**Regularity of the six profiles.** For real input \(r\), write \(L'(z)=zP(|z|^2)\), \(P=p_0+p_1T+p_2T^2\), and \(D(z)=d+b_D|z|^2+c_Dz^2\). Here \(p_0=\ell-2\beta+\sqrt3\nu_5,\ p_1=\beta-\sqrt3\nu_5,\ p_2=\nu_5/\sqrt{12}\), \(d=1+b_A,\ b_D=-b_A,\ c_D=-b_B/\sqrt2\). Exact row comparisons give \(p_0\in(1/2,1), p_1>1/10,\ p_2>0,\ d>47/50,\ 0<c_D<b_D,\ b_D+c_D<9/100\).

The real-plane map \(w(z)=L'(z)/D(z)\) is a smooth diffeomorphism. For \(z=s e^{i\varphi}\) with \(s>0\), \(1/w\) parametrizes an ellipse with semiaxes \((d+(b_D\pm c_D)s^2)/(sP(s^2))\). Both decrease strictly from infinity to zero. Indeed, the numerator of the derivative of their reciprocals, after multiplication by the square of the denominator, is \(dp_0+(3dp_1-a p_0)s^2+(5dp_2+a p_1)s^4+3a p_2s^6\) for \(a=b_D\pm c_D\), with positive coefficients. Strict nesting proves existence and uniqueness by solving the ellipse equation. Its radial derivative is nonzero. At zero the derivative of \(w\) is multiplication by \(p_0/d\). At infinity \(s^{-3}w(se^{i\varphi})\) tends, with derivatives in angle and scaled radius, to the homogeneous map with reciprocal ellipses of semiaxes \((b_D\pm c_D)/(p_2 s^3)\). The limiting angular and radial derivatives have nonzero determinant, by the same ellipse calculation. Compactness of the circle gives polynomial bounds on the inverse Jacobian at infinity. Higher inverse derivatives have polynomial bounds by differentiation.

The tilted phase profiles on the real axis are convolutions of the bounded phase function with Schwartz densities after this change of variables. The weights are polynomials in \(z,\bar z\) times \(\operatorname{ph}D(z)\) and the Gaussian density. The diffeomorphism and inverse derivative bounds preserve Schwartz decay, since \(|w|\) grows as \(|z|^3\). Hence all derivatives of each real-axis profile \(\Gamma\) are bounded, and \(\Gamma\) is smooth and odd. The quotient \(\Gamma(r)/r\) extends as an even smooth function. This makes the radial \(\Phi\) smooth across zero. At infinity the derivative bounds imply that \(D_h^2\), \(g\) and \(g'\) are bounded. In the B channel the original integral has charge \(-1\); its real-axis restriction produces the \(h_B\) of the question and the conjugated content used here.

## 5. Radius cap arithmetic

By earlier Prove Improved Bound and Conjecture-K ledger 3.4, \(\rho_*\le9359/10000\) (**P+C**, earlier packet replayed). The \(t=0\) radius constraint of higher-degree ledger 4.12 is \(\epsilon \rho_*^2\le500/701\). Hence that constraint permits
\[
 \epsilon\le\frac{50\,000\,000\,000}{61\,401\,207\,581}
\]
when substituting the certified radius upper bound, and in particular \(\epsilon=81/100\) has the exact room in README. These are arithmetic consequences for that constraint. Optimizing and certifying the rows at the new cap are open.
