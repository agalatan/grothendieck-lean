<!-- Verbatim from the delivery content_law_finite_reduction_20261116.zip (REDUCTION.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Marked Gaussian compression within \(H_{2,1}\)

Throughout, **P** denotes a written proof and **C** denotes an exact arithmetic check. The ambient dimension is finite and arbitrary. All complex Gaussian coordinates are proper and standard.

## 1. Statement

Normalize \(\mathbb E|Q|^2=1\) and let \(X\) be a marked unit linear Gaussian form. Put \(V=|Q|^2\), \(\chi(Q)=\mathbb E V^2-2\). At a fixed physical energy \(u>0\), use the normalized profile \(H(v)=h(uv)\) and \(K=\mathcal K_1 H\). Define functions on \(\mathbb C\):
\[
\Phi(z)=zH(|z|^2),\quad
a(z)=|z|^2 K'(|z|^2),\quad g(z)=|z|^2K'(|z|^2)^2.
\]
Let \(B_\Phi,B_a,B_g\) be bounds on their absolute values and \(L_\Phi,L_a,L_g\) bounds on their Lipschitz constants. Write
\[
C(Q,X)=\mathbb E[\bar X\Phi(Q)],\qquad
\omega(Q)=\tfrac32\mathbb E g(Q)-\tfrac34(\mathbb E a(Q))^2 .
\]

**Theorem 1 (P).** For each integer \(m\ge1024\) there is a normalized \(Q_*\in H_{2,1}(\mathbb C^{m+1})\) and a unit coordinate \(X_*\) such that
\[
\begin{aligned}
|\chi(Q_*)-\chi(Q)|&\le 44000/\sqrt m,\\
|C(Q_*,X_*)-C(Q,X)|&\le (3B_\Phi+37L_\Phi)/\sqrt m,\\
|\mathbb E a(Q_*)-\mathbb E a(Q)|&\le (3B_a+37L_a)/\sqrt m,\\
|\mathbb E g(Q_*)-\mathbb E g(Q)|&\le (3B_g+37L_g)/\sqrt m,\\
|\mathbb E|Q_*|-\mathbb E|Q||&\le 40/\sqrt m.
\end{aligned}\tag{1}
\]
In the proof the two copies of the marked coordinate are identified. Arbitrary extra test functions can be added with corresponding changes in the selection constant. The sixth-moment input is the existing ledger 3.4.

## 2. Compress the complement, correct the trace on the sphere

Choose unitary coordinates \(y=(X,Y)\). Let \(M\) be an \((n-1)\)-by-\(m\) matrix of independent standard complex Gaussians, independent of \(X\) and \(Z\in\mathbb C^m\). Write \(Z=R\zeta\), with \(\zeta\) uniform on the unit sphere and independent of \(R\). For fixed \(M\), consider the spherical surrogate
\[
S_M(X,\zeta)=Q(X,M\zeta).
\]
For fixed \(\zeta\), \((X,M\zeta)\) has exactly the input law of \(Q\) when averaging over \(M,X\). This remains true jointly with the mark \(X\).

Expand \(Q\) in single-variable Wick monomials in \(X\). Each coefficient \(f\) is a Wick polynomial in \(Y\) of complementary bidegree \((a,b)\) with \(0\le a\le2,0\le b\le1\). This is the tensor-product decomposition of complex Gaussian chaoses for independent blocks. For this coefficient expand \(f(M\zeta)\) into its highest spherical harmonic \(H_{ab,M}(\zeta)\) and lower component. The lower component is possible only for \((1,1)\) and \((2,1)\), where its bidegrees are \((0,0)\) and \((1,0)\), respectively. Explicitly, for the top homogeneous part \(P(z)\) of \(f(Mz)\) put
\[
\operatorname{harm} P=P-|z|^2\frac{\Delta_{\mathbb C}P}{m+a+b-2},
\qquad
\Delta_{\mathbb C}=\sum_j\partial_{z_j}\partial_{\bar z_j},
\tag{2}
\]
in the two trace cases. In other cases keep \(P\). Formula (2) follows by applying \(\Delta_{\mathbb C}\) to \(|z|^2\) times a constant or holomorphic linear form. It gives the top spherical harmonic, since mixed contractions of lower degree give precisely the remaining two possible lower harmonic spaces and different harmonic degrees are orthogonal on the sphere. Homogeneous trace-free polynomials are Wick polynomials: complex Wick renormalization of a homogeneous polynomial is \(\exp(-\Delta_{\mathbb C})P\), as follows on monomials from the generating function. Thus replace \(f(M\zeta)\) by the polynomial
\[
 m^{-(a+b)/2}(\operatorname{harm}P)(Z)
  =(R/\sqrt m)^{a+b}H_{ab,M}(\zeta).
\]
Doing this on each coefficient defines \(Q_M\in H_{2,1}(\mathbb C^{m+1})\).

The point of the spherical correction is that it removes the trace in the **compressed** block. Direct substitution \(Y=MZ/\sqrt m\) followed by a Wick correction has uncontrolled trace terms in comparison with \(Q(X,M\zeta)\). Formula (2) has the following uniform bound.

**Lemma 2 (P).**
\[
\mathbb E_M\|Q_M-S_M\|_{L^2(X,Z)}^2\le7/m.
\tag{3}
\]

**Proof.** If \(\eta\) is a second sphere point and \(\rho=\sum_j\zeta_j\bar\eta_j\), then complex Wick orthogonality gives
\[
\mathbb E_M[f(M\zeta)\overline{f(M\eta)}]
    =\rho^a\bar\rho^b\|f\|_2^2.
\tag{4}
\]
For instance this follows by pairing the factors across the two Wick monomials. Covariances within a Wick monomial are removed, and each surviving holomorphic or antiholomorphic pair contributes \(\rho\) or \(\bar\rho\). For a random uniform \(\zeta,\eta\) one has \(\mathbb E|\rho|^2=1/m\) and \(\mathbb E|\rho|^4=2/[m(m+1)]\). These moments follow by fixing \(\eta\) and integrating the squared coordinate of \(\zeta=Z/\|Z\|\), whose distribution is Beta\((1,m-1)\) when \(m>1\).

In the \((1,1)\) case (4) shows that the mean squared constant component is \(\|f\|^2/m\). In the \((2,1)\) case the orthogonal projection kernel onto holomorphic linears on the sphere is \(m\rho\), since coordinate functions have squared norm \(1/m\). Pairing it with (4) gives mean squared dropped norm \(2\|f\|^2/(m+1)\). The expected total squared spherical norm is \(\|f\|^2\).

Let \(s=R/\sqrt m\) and \(T=s^2\). Gamma moments give \(\mathbb E(T-1)^2=1/m\). For degrees 1 and 2, \(\mathbb E(s^d-1)^2\le1/m\). For degree 3,
\[
\mathbb E(s^3-1)^2
\le\mathbb E[(T-1)^2(T+2)]=3/m+2/m^2\le 5/m.
\]
Indeed \((s^3-1)/(s^2-1)=s+1/(s+1)\), whose square is at most \(s^2+2\). Orthogonality of high and low angular harmonics makes the radial error and the dropped norm add in squares. Independence of \(R,\zeta\) and the bounds above give at most \((5/m+2/(m+1))\|f\|^2\) per coefficient. Orthogonality of the marked-coordinate Wick monomials sums these bounds up to (3). ∎

**Exact trace example.** For \(Q=X(\|Y\|^2-n)/\sqrt n\), with \(n\) complementary coordinates, write \(G=M^*M\). The corrected compressed cubic is \(XZ^*(G-\operatorname{tr}(G)I/m)Z/(m\sqrt n)\). The spherical constant term has expected squared norm \(1/m\), since \(\operatorname{tr}G\sim\operatorname{Gamma}(nm,1)\). The corrected mean square error is \(2/m-1/m^2\), from the exact \(d=2\) calculation above. The naive Wick substitution gives \(X(Z^*GZ-\operatorname{tr}G)/(m\sqrt n)\). Its difference from the corrected cubic has squared norm \(n/m+1/m^2\) averaged over \(M,X,Z\): this is the variance of \(R^2-m\) times \(\mathbb E(\operatorname{tr}G)^2/(m^4 n)\). That extra radial trace error diverges at fixed \(m\) as \(n\) increases.

## 3. Control all the observables for one matrix

For a test \(F(X,Y)\) in \(L^2\), let \(\widetilde F(Y)=\mathbb E_X F(X,Y)\). Suppose \(\widetilde F\) is invariant under \(Y\mapsto e^{i\varphi}Y\). Then
\[
\mathbb E_M\left|\mathbb E_{X,\zeta} F(X,M\zeta)-\mathbb E F(X,Y)\right|^2
\le \|F\|_2^2/m. \tag{5}
\]
Indeed the correlated Gaussian pair \(M\zeta,M\eta\) has correlation \(\rho\) in (4). The phase-zero function \(\widetilde F\) has only bidegrees \((a,a)\). Its centered covariance across the pair equals the sum of \(|\rho|^{2a}\|\Pi_{a,a}\widetilde F\|^2\) for \(a\ge1\), by (4) and \(L^2\) approximation. Bound \(|\rho|^{2a}\le|\rho|^2\) and integrate. Conditional expectation contracts the \(L^2\) norm. This proves (5), including for complex tests.

Apply (5) to the six tests
\[
 |Q|^2,\quad |Q|^4,\quad \bar X\Phi(Q),\quad a(Q),\quad g(Q),\quad |Q|.
\]
Their \(X\)-averages have phase zero in \(Y\): rotate \(X\) together with \(Y\), use that \(Q\) has charge one, and in the marked test use the conjugated \(X\) factor. Let their \(L^2\) norms be \(\sigma_j\). If a test has zero norm, omit it.

The average over \(M\) of the sum of the following nonnegative terms is at most \(8\):
\[
 \frac{m}{7}\|Q_M-S_M\|_2^2,\qquad
 \sum_j \frac{m}{\sigma_j^2}|\mu_j(M)-\mu_j|^2,\qquad
 \frac{\mathbb E_{X,\zeta}|S_M|^6}{\mathbb E|Q|^6}.
\]
Here \(\mu_j(M)\) uses the spherical surrogate rather than the compressed Wick cubic. The first bound is (3), the second is (5), and the last uses the exact spherical marginal. Choose \(M\) with sum at most \(8\). Then
\[
\|Q_M-S_M\|_2\le8/\sqrt m,\qquad
|\mu_j(M)-\mu_j|\le3\sigma_j/\sqrt m,\qquad
\mathbb E |S_M|^6\le8\mathbb E |Q|^6.
\tag{6}
\]
For energy, \(\sigma_j\le \sqrt{44}<7\) by ledger 3.4. Thus \(|\|S_M\|_2-1|\le21/\sqrt m\) and \(|\|Q_M\|_2-1|\le29/\sqrt m\). For \(m\ge1024\) define \(Q_*=Q_M/\|Q_M\|_2\); it is nonzero and
\[
 \|Q_*-S_M\|_2\le37/\sqrt m. \tag{7}
\]

All three profile tests follow from (6)–(7), using Cauchy–Schwarz for the \(\bar X\) factor. The radius test uses \(\sigma_j=1\) and the Lipschitz constant 1. For the fourth moment, ledger 3.4 gives
\[
\mathbb E|Q|^6\le 6+9\chi+(4045313/100000)\chi^{3/2}<12000
\quad(0\le\chi\le42).
\]
This holds for \(Q_*\) as well. Hence \(\|Q_*\|_6^3<110\) and \(\|S_M\|_6^3<310\). The test norm satisfies \(\sigma_j=\|Q\|_8^4\le (7/5)^6 12000^{2/3}<4000\) by \(L^6\)-to-\(L^8\) Gaussian hypercontractivity of the third chaos. The complex version follows by \(|P_tQ|\le P_t|Q|\) for the Ornstein–Uhlenbeck semigroup. Finally
\[
\big||z|^4-|w|^4\big|\le2(|z|^3+|w|^3)|z-w|
\]
by \(x^2y+xy^2\le x^3+y^3\) for \(x,y\ge0\). With (6)–(7), the total error is at most \([12000+2(110+310)37]/\sqrt m<44000/\sqrt m\). This completes Theorem 1. ∎

## 4. Exact transfer to a finite-dimensional test

For the physical variable \(q=\sqrt u\,Q\), \(c_q[h]=\sqrt u\,c_Q[H]\), \(\delta_q=u^2\chi(Q)\), and \(\widehat\Omega_q[h]=\omega(Q)/u\), using \(K'(v)=u k'_u(uv)\). Divide the inequality by \(u\) to obtain the normalized residual
\[
 \mathcal R_\theta(Q,X)=|C(Q,X)|^2-\theta\chi(Q)\,\omega(Q).
\]
Define \(d_f=3B_f+37L_f\) for \(f=\Phi,a,g\), and
\[
 E_\theta=2B_\Phi d_\Phi+
   \theta\left[66000 B_g+63(d_g+B_a d_a)\right].
\tag{8}
\]
Then \(|\mathcal R_\theta(Q,X)-\mathcal R_\theta(Q_*,X_*)|\le E_\theta/\sqrt m\). Indeed \(\omega\) lies between zero and \(3B_g/2\) and its change is at most \(\tfrac32(d_g+B_a d_a)/\sqrt m\). Both fourth excesses are at most 42. Also \(|C|\le B_\Phi\) by Cauchy–Schwarz.

Since unitary rotation can put the full content norm at the marked coordinate, this proves that the supremum of \(\mathcal R_\theta\) differs from the supremum in dimension \(m+1\) by at most \(E_\theta/\sqrt m\), at every fixed energy. Padding adds dimensions without changing observables.

For an exact inequality, take a small-excess cutoff \(b_0>0\) whose range \(0\le\chi<b_0\) is established by a separate proof, for example a verified scalar cutoff from the previous three-derivative result. A sufficient test for the rest is:
\[
\mathcal R_\theta\le -E_\theta/\sqrt m
\quad\text{in dimension }m+1
\quad\text{for }\chi\ge b_0-44000/\sqrt m. \tag{9}
\]
At varying \(u\), use upper bounds for the profile and error constants and a cutoff valid throughout the energy cell. Condition (9) is a sufficient strict-margin test. The approximation theorem does not imply that the margin exists at the target \(\theta\).

The coefficient unit sphere is compact, of real dimension \(2\binom{m+2}{2}(m+1)-1\). The residual apart from the explicit \(\chi\) cutoff has an explicit Lipschitz estimate on this sphere. If \(Q,P\) are normalized cubics on the same coordinates, then at a fixed mark
\[
\begin{aligned}
|C(Q,X)-C(P,X)|&\le L_\Phi\|Q-P\|_2,\\
|\chi(Q)-\chi(P)|&\le440\|Q-P\|_2,\\
|\omega(Q)-\omega(P)|&\le\tfrac32(L_g+B_aL_a)\|Q-P\|_2 .
\end{aligned}
\]
The proof is the same Cauchy–Schwarz estimate on two honest cubics. Thus (9) with an adequate strict margin reduces to a finite net of normalized rational coefficient vectors, verified scalar and Gaussian integration, with an explicit remainder for the coefficient net. The resulting dimension is very large at small error tolerance. No six-row coefficient net is computed here.

For the given phase profiles, the boundedness and Lipschitz requirements in Section 1 hold. The change of variables \(w=L'(z)/(1-b_A e_{11}(z)-b_B e_{20}(z))\) and derivative bounds are proved in the previous shared-factors packet, PROOFS §4. In brief the planar map is a diffeomorphism by strictly nested reciprocal ellipses. The real-axis phase integrals are convolutions of a bounded function against Schwartz densities, so their derivatives are bounded and the phase profile is smooth and odd. This yields \(H(v)=O(v^{-1/2})\), \(H'(v)=O(v^{-1})\), \(H''(v)=O(v^{-3/2})\) at infinity, and regularity at zero. The resolvent averaging preserves those bounds under differentiation. They imply bounded and Lipschitz \(\Phi,a,g\). Numeric enclosures for the constants in (8) have not been made.

The result is a reduction in **distribution and marked tests**, with an intermediate coupling over the auxiliary sphere. It does not assert that a small subspace of the original coordinates captures the energy of \(Q\). That stronger property is refuted by the example in the latest Partial Theorem Progress packet.

## 5. The radius admits a smaller error

For the radius, no mark is needed. Apply Section 2 with all original coordinates in the complement. Each \(Q\) is entirely in bidegree \((2,1)\), so its mean angular loss is exactly \(2/(m+1)\). The lifted squared norm is multiplied by \(\mathbb E(R/\sqrt m)^6=(m+1)(m+2)/m^2\). Thus
\[
\mathbb E_M\|Q_M\|_2^2=\frac{(m-1)(m+2)}{m^2}\le 1+1/m.
\]
Using the exact marginal of \(S_M\), Lemma 2 and Cauchy–Schwarz over \(M\) gives
\[
\mathbb E|Q|
\le \mathbb E_M\|Q_M\|_1+\sqrt{7/m}
\le \rho_m\sqrt{1+1/m}+\sqrt{7/m}.
\]
Since \(\rho_m\le1\) by Cauchy–Schwarz and \(\sqrt{1+1/m}\le1+1/(2m)\), this proves
\[
0\le\rho_\infty-\rho_m\le3/\sqrt m,\qquad m\ge2.
\]
The final coefficient uses \(\sqrt7+1/(2\sqrt2)<3\), equivalent after squaring to \(289>288\). This approximation allows a finite radius upper bound with any prescribed positive additive tolerance, but a new finite-dimensional radius certificate would still have to beat \(0.9359\) after its error allowance.
