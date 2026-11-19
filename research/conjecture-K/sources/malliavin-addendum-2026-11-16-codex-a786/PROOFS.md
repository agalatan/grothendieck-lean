<!-- Verbatim from the delivery conjecture_k_malliavin_book_addendum.zip (malliavin_addendum/PROOFS.md), 16 November 2026; codex-a786, relayed by the user. Only this line was added. -->
# A Clifford obstruction to improving the scalar Stein budget

Author: codex-a786, 16 November 2026.

**Status convention.** P = complete written proof by this author, without
independent review or Lean formalization. C = exact replay using integers
and Gaussian integers. The proposed general content inequality remains open.
No numerical optimization is a proof input.

The reading that led here is Nourdin and Peccati, *Normal Approximations
with Malliavin Calculus* (2012), especially Theorem 2.9.1 (printed p. 53)
and Lemma 5.2.4, equations (5.2.3)--(5.2.6) (printed pp. 95--96).
The identities below are standard consequences of that calculus.
The explicit complex-cubic obstruction is the contribution to this package;
no claim of priority across the literature is made.

## 1. Normalization and exact spectral correction (P)

Let \(Z_j=(G_{2j-1}+iG_{2j})/\sqrt2\), with independent real standard
Gaussians \(G_i\), and let \(q\in H_{2,1}\). Set

\[
u=E|q|^2,\qquad \delta=E|q|^4-2u^2,
\]
\[
\Gamma(f,g)=\sum_i(\partial_{G_i}f)(\partial_{G_i}g),\quad
A=\Gamma(q,\bar q),\quad B=\Gamma(q,q),
\]
\[
\mathcal B(q)=2E(A-3u)^2+E|B|^2.
\]

The bilinear \(\Gamma\) has no conjugation in its definition.
Let \(J_k\) denote the orthogonal projection onto real Hermite degree \(k\),
extended complex linearly. Define

\[
\mathcal R_4(q)=2\|J_4 A\|_2^2+\|J_4 B\|_2^2.
\]

Then the usual inequality \(\mathcal B\le6\delta\) has the exact refinement

\[
\boxed{\mathcal B(q)=6\delta-\mathcal R_4(q).}\tag{1}
\]

**Proof.** First take a real third-chaos variable \(F\) of variance \(u\).
Write \(F^2=u+H_2+H_4+H_6\). The Ornstein--Uhlenbeck generator
\(\mathscr L=\Delta-G\cdot\nabla\), with \(\mathscr L F=-3F\), gives

\[
\Gamma(F,F)=\tfrac12(\mathscr L+6)F^2
=3u+2H_2+H_4.
\]

Integration by parts gives \(EF^4=E[F^2\Gamma(F,F)]\), whence

\[
\kappa_4(F)=2\|H_2\|_2^2+\|H_4\|_2^2,\qquad
\operatorname{Var}\Gamma(F,F)=4\|H_2\|_2^2+\|H_4\|_2^2.
\]

Consequently
\[
2\kappa_4(F)-\operatorname{Var}\Gamma(F,F)
=\|J_4\Gamma(F,F)\|_2^2. \tag{2}
\]
This is also the degree-three specialization of the book's exact contraction
formulas; it is not an additional fourth-moment assumption.

Now take \(F=\sqrt2\,\Re q\). The relation
\(q(e^{i\theta}Z)=e^{i\theta}q(Z)\) implies circularity and
\[
EF^2=u,\quad EF^4=\tfrac32E|q|^4,\quad
\kappa_4(F)=\tfrac32\delta,\quad
\Gamma(F,F)=A+\Re B.
\]
Under this same Gaussian rotation, \(A\) has charge zero and \(B\) has
charge two. Thus
\[
\operatorname{Var}\Gamma(F,F)=\tfrac12\mathcal B(q),\qquad
\|J_4\Gamma(F,F)\|_2^2
=\|J_4A\|_2^2+\tfrac12\|J_4B\|_2^2.
\]
The projections commute with the rotation. Multiplying (2) by two proves
(1). All differentiations and integrations here involve polynomials. \(\square\)

This correction is already implicit in the spectral argument behind ledger
11.30. Keeping it explicit is a useful refinement, not a new general
Malliavin theorem.

## 2. Explicit matrices and a genuine \(H_{2,1}\) cubic (P+C)

Use the usual Pauli matrices
\[
I=\begin{pmatrix}1&0\\0&1\end{pmatrix},\quad
X=\begin{pmatrix}0&1\\1&0\end{pmatrix},\quad
Y=\begin{pmatrix}0&-i\\i&0\end{pmatrix},\quad
Z=\begin{pmatrix}1&0\\0&-1\end{pmatrix}.
\]
A word denotes a tensor product, not a matrix product. Define seven
\(8\times8\) matrices by
\[
(A_1,\ldots,A_7)
=(IIY,\ IYX,\ XYZ,\ YIZ,\ YXX,\ YZX,\ ZYZ).
\tag{3}
\]
They satisfy, exactly,
\[
A_i^*=A_i,\quad A_i^T=-A_i,\quad \operatorname{tr}A_i=0,\quad
A_iA_j+A_jA_i=2\delta_{ij}I_8.
\tag{4}
\]
Every matrix is purely imaginary. These identities follow by multiplying
the displayed Pauli words; verify.mjs checks every matrix entry with Gaussian
integers, without evaluating roots of unity or floating-point matrices.

Let \(X_0,\ldots,X_7,Y_1,\ldots,Y_8\) be independent standard complex
Gaussians. In this section capital \(X_j,Y_j\) are random variables, while
the bare letters in (3) denote Pauli factors. Set \(Y=(Y_1,\ldots,Y_8)^T\),
\[
H(Y)=\sum_{a=1}^8Y_a^2,\qquad Q_i(Y)=Y^*A_iY,
\]
\[
\boxed{q=\overline X_0\,H(Y)+\sum_{i=1}^7 X_i Q_i(Y).}\tag{5}
\]
The first term belongs to \(H_{0,1}(X)\otimes H_{2,0}(Y)\).
Since each \(A_i\) is traceless, every \(Q_i\) belongs to \(H_{1,1}(Y)\).
Thus the other terms belong to
\(H_{1,0}(X)\otimes H_{1,1}(Y)\). Consequently (5) is genuinely in
\(H_{2,1}(\mathbb C^{16})\); no auxiliary Gaussian limit is being inserted.

## 3. Exact moments and the improved obstruction (P+C)

Write \(Y=(g+ih)/\sqrt2\), \(G=(g,h)\in\mathbb R^{16}\), and set
\[
P_0=Z\otimes I_8,\qquad P_1=X\otimes I_8,\qquad
P_{i+1}=-Y\otimes A_i\quad(1\le i\le7).
\]
These nine matrices are real symmetric, traceless, square to \(I_{16}\),
and anticommute in pairs. If
\(\widetilde Q_a=G^TP_aG/2\), then
\[
\widetilde Q_0=\Re H(Y),\quad
\widetilde Q_1=\Im H(Y),\quad
\widetilde Q_{i+1}=Q_i(Y).
\]
The block identities, including these signs and factors, are checked exactly.
Put
\[
m=9,\quad d=8,\quad
S_0=\sum_{a=0}^{8}\widetilde Q_a^2,\qquad R=|G|^2/2.
\]

For small real \(t_a\), anticommutation gives
\((\sum t_aP_a)^2=(\sum t_a^2)I_{16}\). Since its trace is zero,
\[
E\exp\Big(\sum_a t_a\widetilde Q_a\Big)
=\det\Big(I-\sum_a t_aP_a\Big)^{-1/2}
=\Big(1-\sum_a t_a^2\Big)^{-d/2}.
\tag{6}
\]
The Gaussian determinant formula follows by orthogonally diagonalizing the
real symmetric matrix and multiplying one-dimensional Gaussian integrals.
Differentiating (6) at zero yields
\[
E\widetilde Q_a^2=d,\quad
E\widetilde Q_a^4=3d(d+2),\quad
E\widetilde Q_a^2\widetilde Q_b^2=d(d+2)\quad(a\ne b).
\]
Independently, the checker computes these fourth moments by the trace-cumulant
formula
\[
\kappa(\widetilde Q_i,\widetilde Q_j)=\tfrac12\operatorname{tr}(P_iP_j),
\]
\[
\kappa(\widetilde Q_i,\widetilde Q_j,\widetilde Q_k,\widetilde Q_l)
=\tfrac12\sum_{\text{six permutations }(a,b,c)\text{ of }(j,k,l)}
\operatorname{tr}(P_iP_aP_bP_c).
\]
The permutation is over the three positions, so repeated indices retain
their multiplicities. This formula follows by expanding
\(-\tfrac12\log\det(I-\sum t_aP_a)\); it is not an assumed numerical fit.
Adding the three covariance pairings gives the fourth moment.

It follows that
\[
ES_0=md=72,\qquad ES_0^2=m(m+2)d(d+2)=7920.
\tag{7}
\]
In fact the quadratic map has the stronger exact identity
\[
\boxed{S_0=R^2.}\tag{7a}
\]
For a fixed nonzero real vector \(G\), the nine vectors \(P_aG\) are
orthogonal and have norm \(|G|\). Bessel's inequality therefore gives
\(\sum_a(G^TP_aG)^2\le |G|^4\), or \(S_0\le R^2\).
But \(ES_0=72=ER^2\), so the nonnegative difference is zero almost surely.
It is a polynomial and Gaussian measure has full support, hence the identity
holds everywhere. The checker also expands both quartic polynomials and
verifies every coefficient directly.

Conditioned on \(Y\), (5) is a circular complex Gaussian of variance \(S_0\).
The conjugate variable \(\bar X_0\) is independent of the other \(X_i\);
it does not introduce a nonzero conditional pseudovariance. Thus
\[
q\overset{\mathrm{law}}=RW,\qquad
R\sim\operatorname{Gamma}(8,1),\quad W\sim\mathcal N_{\mathbb C}(0,1),
\]
where \(R,W\) are independent in this representation. In particular,
\(E|q|^{2k}=k!\,\Gamma(8+2k)/\Gamma(8)\) for every integer \(k\ge0\).
The original cubic, not the auxiliary law representation, defines its
first-chaos projection. It follows that
\[
\boxed{u=72,\quad E|q|^4=15840,\quad \delta=5472.}\tag{8}
\]

For the gradient energy, let \(F=\sqrt2\,\Re q\).
There are nine independent real standard Gaussian coordinates \(x_a\),
independent of \(G\), such that \(F=\sum_{a=0}^{8}x_a\widetilde Q_a\).
The unused imaginary \(X_i\) coordinates have zero derivative.
Anticommutation gives
\[
\nabla_G\widetilde Q_a\cdot\nabla_G\widetilde Q_b
=2R\delta_{ab},
\qquad
\Gamma(F,F)=S_0+2R\,H_0,\quad H_0=\sum_{a=0}^{8}x_a^2.
\tag{9}
\]
Here \(R\) is Gamma with shape \(d\), \(H_0\) is chi-squared with \(m\)
degrees of freedom, and \(H_0\) is independent of \((R,S_0)\). Thus
\[
ER=d,\ ER^2=d(d+1),\quad EH_0=m,\ EH_0^2=m(m+2).
\]
Moreover,
\[
E[RS_0]=(d+2)ES_0=720. \tag{10}
\]
Indeed \(S_0\) is homogeneous of degree four in \(G\). Radial Gaussian
integration, or the third trace-cumulant identity with the identity
matrix, gives (10); no independence of \(S_0\) and \(R\) is assumed.
Consequently
\[
E\Gamma(F,F)=216,\qquad
E\Gamma(F,F)^2
=7920+4\cdot72\cdot99+4\cdot720\cdot9=62352,
\]
\[
\operatorname{Var}\Gamma(F,F)=15696,\qquad
\boxed{\mathcal B(q)=31392,\quad
\frac{\mathcal B(q)}{\delta(q)}=\frac{109}{19}.}\tag{11}
\]
The last conversion uses the circular identity in §1.

Thus, if \(c_*\) is the best constant valid for every dimension in
\(\mathcal B(q)\le c_*\delta(q)\), then
\[
\boxed{\frac{109}{19}\le c_*\le6.}\tag{12}
\]
Replacing the coefficient six alone can improve any bound proportional to
this scalar budget by at most
\[
\boxed{\frac{6}{109/19}=\frac{114}{109}<1.046.}\tag{13}
\]
This is a limit on squared-content or sector-gain bounds linear in the
budget. For a square-root bound the possible factor is even smaller.
It says nothing against refinements that keep tensor correlations or phase.
No claim that \(109/19\) is optimal is made.

The normalized cubic \(q/\sqrt{72}\) has
\[
u=1,\quad \delta=\frac{19}{18},\quad
\mathcal B=\frac{109}{18},\quad \mathcal R_4=\frac5{18}.
\]
Its kurtosis is moderate. Scaling the cubic preserves both the normalized
fourth excess and the obstruction ratio.

## 4. The same cubic has exactly zero content (P+C)

For \(1\le k\le7\), apply the following unitary transformation to the
underlying independent Gaussian vector:
\[
Y\longmapsto A_kY,\quad
X_0\longmapsto-X_0,\quad
X_k\longmapsto X_k,\quad
X_i\longmapsto-X_i\quad(i\ne k,\ i\ge1).
\tag{14}
\]
Since \(A_k^TA_k=-I\), \(H(Y)\) changes sign. Also \(Q_k\) is unchanged,
and each \(Q_i,\ i\ne k\), changes sign. Thus (14) fixes \(q\) exactly.

Every \(X_i\) coefficient of \(\Pi_1F(q)\) vanishes: some transformation
(14) flips that coordinate while leaving \(F(q)\) unchanged.
The vector of \(Y\)-coefficients must be fixed by every \(\bar A_k\).
Two of these matrices anticommute, so they have no common fixed vector:
if \(Av=Bv=v\), then \((AB+BA)v=2v=0\).
Therefore
\[
\boxed{\Pi_1F(q)=0\quad\text{for every }F(q)\in L^2.}\tag{15}
\]
All algebraic identities used here are verified in the checker.
The argument is the invariant-subspace criterion from the earlier package,
restated here so this addendum is self-contained.

In particular, all the raw and tilted first-chaos contents vanish for
\(\lambda q\), at every scalar \(\lambda\in\mathbb C\).
Thus a nearly maximal scalar Stein budget need not imply any actual
first-chaos content.

## 5. Consumers and precise repository dependencies

References in this section are to snapshot
7fe22ca8ba33789f6e87676f920d46146a569e15, used by the preceding package.
These existing analytic inputs are accepted, not rerun here.

### 5.1 Retaining the spectral correction (P, with existing scalar certificates)

Before replacing the Stein budget by \(6\delta\), the shifted-resolvent
proof behind 11.30 and 11.49 gives
\[
\|c_{3/5}(q)\|^2\le
\frac{\mathcal B(q)}9\sup_R N_{\Psi_u}(R).
\tag{16}
\]
The already replayed profile estimate \(\sup N_\Phi<1/3\) and
\(\sup N_{\Psi_u}\le(9/25)\sup N_\Phi\) therefore give
\[
\boxed{\|c_{3/5}(q)\|^2
\le\frac{6\delta-\mathcal R_4(q)}{75}.}\tag{17}
\]
Likewise, each energy-dependent coefficient \(\gamma(u)\) in 11.49
coming from \((2/3)\sup N_{\Psi_u}\) can be replaced by
\[
\boxed{\|c_{3/5}(q)\|^2
\le\gamma(u)\big(\delta-\mathcal R_4(q)/6\big).}\tag{18}
\]
This is a tensor-dependent refinement. The lower bound (12) rules out
extracting a large improvement by uniformly lower-bounding
\(\mathcal R_4/\delta\) and changing only that single coefficient.

### 5.2 An exact retained A-sector family (P, given 2.7 and 11.39--11.40)

Use the peak constants \(a=699/1250,\ b=179/1250,\ p=2500/1891\),
\(T=|z_1|^2\), and \(L=z_1(a+bT)\), independent of the remote variables.
For a remote cubic, \(\Lambda(q)=2E|L+q|-pE|q|^2\), and the tilted
content is
\[
c_{3/5}(q)=\Pi_1\Phi_0(q),\qquad
\Phi_0(w)=E_{z_1}[(T-2/5)\operatorname{ph}(L+w)].
\]
The linear subtraction used in the repository gives the same projection
because the first and third chaoses are orthogonal.
Ledger 2.7 supplies the positive Gaussian scale-mixture representation
\(L\overset{\mathrm{law}}=\sqrt V\,W\). Define
\[
B_{\rm row}(u)=2E|L+\sqrt u\,W'|=\sqrt\pi\,E\sqrt{V+u},\quad
S=\sup_{u\ge0}\{B_{\rm row}(u)-pu\}.
\]
Here \(W,W'\) are independent standard complex Gaussians, and a fresh \(V\)
can be taken independent of the remote variables. Thus \(B_{\rm row}\)
is concave. Because (5) is conditionally Gaussian,
\[
2E|L+\lambda q|=E B_{\rm row}(|\lambda|^2S_0)
\le B_{\rm row}(72|\lambda|^2).
\tag{19}
\]
This is the Gaussian-scale-mixture case, not a claim of concavity at
arbitrary nonremote conditional bases.
It proves same-variance remote domination for this family:
\[
\Lambda(\lambda q)\le B_{\rm row}(u)-pu\le S,\qquad
u=72|\lambda|^2.
\]
The retained functional is
\[
\widehat\Lambda(G)=\min_{\xi\in H_{1,0}}
\{\|\xi\|_2^2+E|L+G-\xi|+E|L-G+\xi|\}-p\|G\|_2^2.
\]
Here \(H_{1,0}\) includes the actual visible and remote first-chaos directions.
At the peak, ledger 11.12 and the accepted global remainder 11.39--11.40
give, with \(k=59009/189100\),
\[
\widehat\Lambda(\lambda q+(T-1)r)
\le\Lambda(\lambda q)+2\Re\langle c_{3/5}(\lambda q),r\rangle
-k\|r\|_2^2.
\]
By (15), the linear term is zero. Consequently
\[
\boxed{\widehat\Lambda(\lambda q+(T-1)r)
\le S-\frac{59009}{189100}\|r\|_2^2.}\tag{20}
\]
This holds for every complex \(\lambda\) and every remote holomorphic
linear form \(r\), with every amplitude and arbitrary sharing.
Additional independent remote coordinates cause no change.
There is no additive \(3.6\cdot10^{-7}\) remote-cap loss in this family.
No joint A/B or odd-over-A/B assertion follows.

## 6. What the mixed identities suggest, and what they do not prove

Theorem 2.9.1 applied twice gives a useful full-amplitude identity.
Put \(Q=(\Re q,\Im q)\) and
\(\Gamma_{ab}=\nabla Q_a\cdot\nabla Q_b\).
For a sufficiently smooth real scalar profile \(\varphi\),
\[
E[G_i\varphi(Q)]
=\frac14E\sum_{a,b=1}^2
(\partial_i\Gamma_{ab})\,\partial_{ab}\varphi(Q).
\tag{21}
\]
To check the factor, Gaussian integration by parts first gives
\(E\sum_a(\partial_iQ_a)\partial_a\varphi(Q)\).
Each \(\partial_iQ_a\) is in real chaos two. Applying integration by parts
again introduces \(1/2\); symmetrizing \(a,b\) introduces the other
\(1/2\) and produces \(\partial_i\Gamma_{ab}\).
Polynomial growth of the needed derivatives suffices.
This is standard calculus, closely related to 11.29, not a new closed estimate.

The mixed cumulant recursion in Chapter 8 should similarly be applied to
the joint vector \((\Re q,\Im q,\Re r,\Im r)\), retaining its mixed fields.
For instance
\(\kappa(\bar r,q,q,\bar q)=E[\bar r q|q|^2]\), since the covariance
pairings vanish by chaos orthogonality and charge.
But that leading tensor alone is already a failed route in ledger §14,
item 22. No finite-order truncation or mixed-cumulant closure is proved here.

The useful unresolved target is a bound on these profile-weighted mixed
fields against the deficit of the same cubic. Scalarizing them to
\(\mathcal B/\delta\) cannot supply the factor 1.5--3 sought in the
degree-five band. Neither the raw content theorem 6.3.18 nor the remaining
joint-sector premises are solved by this addendum.
