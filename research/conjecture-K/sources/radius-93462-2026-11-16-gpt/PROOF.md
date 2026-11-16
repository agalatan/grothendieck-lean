<!-- Verbatim from the delivery cubic_l1_rho_0_93462.zip (PROOF.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Complete proof of the bound 0.93462

**Theorem [C, using the analytic lemmas [P] below].** In every complex dimension,
for every \(q\in H_{2,1}\),
\[
\mathbb E|q|\le\frac{46731}{50000}\sqrt{\mathbb E|q|^2}
=0.93462\sqrt{\mathbb E|q|^2}.
\]
The two moment ceilings supplied in the question are inputs. Everything
additional used in the theorem is proved below. The final finite verification
uses exact rational arithmetic. This proves an upper bound, not the optimum
of the strengthened relaxation. The milestone 0.916 and the sharp conjecture
remain unresolved here.

Labels: **P** = written proof; **C** = exact replayable computation;
**N** = numerical exploration only.

## 1. Inputs and scope

Normalize E|q|^2=1, put V=|q|^2 and s=EV^2-2. The zero polynomial is
immediate, and scaling will restore the general statement.

The two previously proved moment estimates supplied in the question are
used as inputs:

\[
0\le s\le42,\qquad
\mathbb EV^3\le M_3(s):=6+9s+\frac{4045313}{100000}s^{3/2}. \tag{1}
\]

This bundle does not reprove that supplied sixth-moment estimate. The new
bound is a consequence of those stated estimates and the proved Stein and
projection identities below. It does not rely on the previous 0.95133
certificate, on numerical information about particular cubics, or on a
claim that a relaxation attains its numerical optimum.

All derivatives below use y_j=(x_j+i t_j)/sqrt(2), with x_j,t_j independent
standard real Gaussians. Write

\[
C=c_2,\quad D=\frac{c_1+c_2}{3},\quad
c=C-1,\quad d=D-1,\quad
b=\begin{cases}\operatorname{Re}(\bar q^{\,2}a)/V,&V>0,\\0,&V=0.
\end{cases} \tag{2}
\]

In particular, |b|<=|a| and Vb=Re(bar(q)^2 a) everywhere.

## 2. The projection identities [P]

Here are self-contained derivations of the identities used from F1--F5.
Let

\[
F_j=\bar\partial_jq,\qquad
\mathcal D F=\sum_j(\bar y_jF_j-\partial_jF_j).
\]

Each F_j is a holomorphic homogeneous quadratic. Gaussian integration by
parts makes D the adjoint of the antiholomorphic gradient. Since q has
antiholomorphic chaos degree one, q=D F. For any holomorphic polynomial
vector G, the polynomial D G has antiholomorphic chaos degree one,
bar(partial)_j D G=G_j, and

\[
\|\mathcal D G\|_2^2=\sum_j\|G_j\|_2^2. \tag{3}
\]

These statements can also be checked directly by differentiating and
integrating against the complex Gaussian density. In particular EC=1.
The corresponding holomorphic number operator gives Ec_1=2, hence ED=1.

For G=bar(q)g(V), the same integration by parts gives

\[
\mathbb E[Vg(V)]
 =\mathbb E[C\{g(V)+Vg'(V)\}+Vb g'(V)]. \tag{4}
\]

Using the holomorphic number operator, whose eigenvalue on q is two,
gives

\[
2\mathbb E[Vg(V)]
 =\mathbb E[c_1\{g(V)+Vg'(V)\}+Vb g'(V)].
\]

Adding these identities yields the second Stein identity we use:

\[
\mathbb E[Vg(V)]
 =\mathbb E[D\{g(V)+Vg'(V)\}+\tfrac23Vb g'(V)]. \tag{5}
\]

To verify the projections of a, let L be the real Ornstein--Uhlenbeck
generator. Its eigenvalue on H_{m,n} is -(m+n), and its product rule gives

\[
L(q^2)=-6q^2+4a.
\]

The possible bidegrees in q^2 are (4,2),(3,1),(2,0). Consequently

\[
a=P_{2,0}q^2+\tfrac12P_{3,1}q^2. \tag{6}
\]

Put

\[
A=\|P_{2,0}q^2\|_2^2,\quad B=\|P_{3,1}q^2\|_2^2,\quad
t=\mathbb E(C-1)^2.
\]

Orthogonality immediately gives

\[
\mathbb E|a|^2=A+B/4,
\qquad \mathbb E[Vb]=A+B/2. \tag{7}
\]

For completeness, the covariance identity also has a short direct proof.
Define the holomorphic cubics

\[
H_j=\sum_k F_k\partial_kF_j.
\]

Product differentiation gives

\[
qF_j=\mathcal D(F_jF)+H_j,
\qquad
a=\mathcal D H+\sum_{j,k}(\partial_jF_k)(\partial_kF_j).
\]

The two summands in the first identity have bidegrees (4,1) and (3,0).
Those in the second have bidegrees (3,1) and (2,0). By (3) and
orthogonality,

\[
\mathbb E[CV]=\mathbb E C^2+\sum_j\|H_j\|_2^2
             =\mathbb E C^2+B/4.
\]

It follows that

\[
\operatorname{Cov}(C,V)=t+B/4. \tag{8}
\]

Finally, setting g(v)=v in (4) gives

\[
2+s=2\mathbb E[CV]+\mathbb E[Vb],
\qquad\boxed{s=A+B+2t}. \tag{9}
\]

This verifies the needed content of F3--F4 rather than assuming extra
signs for weighted versions of their identities.

## 3. Retaining two tensor Gram matrices [P]

Write
\[
q=\sum_{i,j,k}T_{ijk}:y_i y_j\bar y_k:,
\qquad T_{ijk}=T_{jik},\qquad 2\sum|T_{ijk}|^2=1.
\]
Thus \(F_k=\sum_{i,j}T_{ijk}y_i y_j\). Define Hermitian positive semidefinite
matrices
\[
U_{ab}=4\sum_{j,k}T_{ajk}\overline{T_{bjk}},\qquad
J_{ab}=2\sum_{i,j}T_{ijb}\overline{T_{ija}}.
\]
We use the centered quadratic form
\(Q_H(y)=\sum_{a,b}H_{ab}(y_a\bar y_b-\delta_{ab})\).
For Hermitian matrices, \(\mathbb E Q_H Q_K=\operatorname{tr}(HK)\).
Put
\[
P=\operatorname{tr}U^2,\quad Q=\operatorname{tr}J^2,\quad
R=\operatorname{tr}(UJ).
\]
The capital \(Q\) here is a scalar invariant, distinct from the polynomial
\(q\). We have
\[
\operatorname{tr}U=2,\quad\operatorname{tr}J=1,\quad
0\le P\le4,\quad0\le Q\le1,\quad R\ge0,\quad
G:=\begin{pmatrix}P&R\\R&Q\end{pmatrix}\succeq0. \tag{10}
\]
The trace bounds follow from nonnegative eigenvalues, and the last assertion
is Hilbert--Schmidt Cauchy--Schwarz.

Let \(M=P_{1,1}V\), \(N=P_{2,2}V\), and \(C_4=P_{2,2}C\). Direct Wick
expansion, or differentiating twice and integrating, gives
\[
P_{1,1}C=Q_U,\quad M=Q_{U+J},\quad
\|C_4\|_2^2=Q,\quad t=P+Q,\quad\|M\|_2^2=P+Q+2R. \tag{11}
\]
Here is detail for the two potentially less immediate assertions. The
coefficient of the fourth-chaos part of \(C\) is
\(S_{ab;cd}=\sum_kT_{abk}\overline{T_{cdk}}\), symmetric in each pair;
its squared norm is
\(4\sum|S_{ab;cd}|^2=\operatorname{tr}J^2\).
The coefficient of \(y_a\bar y_b-\delta_{ab}\) in \(V\) is
\(\mathbb E\partial_a\bar\partial_b V\). The terms containing a second
derivative of one factor vanish by chaos orthogonality, and the remaining
two terms give \(U_{ab}+J_{ab}\).

The generator product rule gives
\[
LV=-6V+2(c_1+C),\qquad c_1+C=3+2M+N. \tag{12}
\]
To compute the mixed gradient covariance, set
\(K=\sum_{j,k}|\partial_kF_j|^2=2+Q_U\). Then
\(LC=-4C+2K\). Self-adjointness of \(L\), together with (8), yields
\[
\mathbb E(Cc_1)=\mathbb E(KV)+B/4,
\qquad\operatorname{Cov}(c_1,C)=P+R+B/4. \tag{13}
\]
Indeed, equate \(\mathbb E[VLC]\) and \(\mathbb E[CLV]\), and use
\(\mathbb E CV=\mathbb E C^2+B/4\).

Apply (5) with \(g(v)=v\). Orthogonality and (12) imply
\[
3s=4\|M\|_2^2+2\|N\|_2^2+2A+B.
\]
Using \(s=A+B+2(P+Q)\), this gives the following exact identities:
\[
\begin{aligned}
\mathbb Ec^2&=P+Q,\\
\mathbb E[c(V-1)]&=P+Q+B/4,\\
\mathbb E[Vb]&=A+B/2,\\
\mathbb Eb^2&\le A+B/4,\\
\mathbb E[dc]&=(2P+Q+R+B/4)/3,\\
\mathbb Ed^2&=\{5P+5Q+4R+A/2+B\}/9. \tag{14}
\end{aligned}
\]
For the last line use \(d=(2M+N)/3\). For the preceding line use
\(D=(c_1+C)/3\), (13), and \(\operatorname{Var}C=P+Q\).

There is a second positive semidefinite Gram matrix:
\[
H:=
\begin{pmatrix}
 A/2+B+P+Q-4R & Q+B/4-R\\
 Q+B/4-R & Q
\end{pmatrix}\succeq0. \tag{15}
\]
It is the Gram matrix of \(N\) and \(C_4\). To verify its off-diagonal
entry, (12) gives \(P_{1,1}c_1=Q_{U+2J}\); subtracting the quadratic
covariance \(P+2R\) from (13) gives
\[
\langle P_{2,2}c_1,C_4\rangle=B/4-R.
\]
Since \(N=P_{2,2}c_1+C_4\), (15) follows.

Two useful consequences, not sufficient alone for the final improvement, are
\[
\mathbb E(c_1-C-1)^2=P+5Q+A/2=s/2+4Q-B/2\le s/2+4, \tag{16}
\]
and \(\operatorname{Cov}(c_1,C)\ge0\).

## 4. Two contraction bounds [P]

We have
\[
\boxed{A\le2P,\qquad B\le12R.} \tag{17}
\]
For the first, write the holomorphic quadratic \(P_{2,0}a\) as
\(\sum_{a,b}K_{ab}y_a y_b\), where
\[
K_{ab}=4\sum_{j,k}T_{jak}T_{kbj}.
\]
Let \(V\) be the matrix whose row \(a\) consists of the entries
\(2T_{ajk}\), and let \(S\) interchange the indices \(j,k\). Then
\(U=VV^*\), \(K=VSV^{\mathsf T}\), and
\[
\|K\|_{\rm HS}^2\le\operatorname{tr}(VV^*)^2=P.
\]
For completeness, putting \(E=V^*V\), cyclicity expresses the left side
as \(\operatorname{tr}(S E^{\mathsf T}S^*E)\), which is at most
\(\|S E^{\mathsf T}S^*\|_{\rm HS}\|E\|_{\rm HS}
=\operatorname{tr}E^2\). Since \(A=2\|K\|_{\rm HS}^2\), this proves
\(A\le2P\).

For the second, the unsymmetrized coefficient tensor of
\(H_j=\sum_kF_k\partial_kF_j\) is
\[
S_{abc;j}=2\sum_k T_{abk}T_{kcj}.
\]
A direct contraction gives \(\|S\|_{\rm HS}^2=R/2\).
Symmetrizing in \(a,b,c\) is an orthogonal projection, so
\[
B=4\sum_j\|H_j\|_2^2=24\|\operatorname{Sym}_{abc}S\|_{\rm HS}^2
\le12R.
\]
Also, (17) and \(s=A+B+2(P+Q)\) prove
\[
\boxed{\mathbb E[Vb]=A+B/2\le s/2.} \tag{18}
\]
This last scalar inequality by itself did not lower the numerical bound.

## 5. A quantitative constraint near rank one [P]

For every \(\alpha>0\),
\[
\boxed{R\le\frac{1+\alpha}{4}B+
                 \left(5+\frac3\alpha\right)(1-Q).} \tag{19}
\]
This prevents the output covariance \(J\) from being nearly rank one
while \(B\) is small and \(R\) is substantial.

We first record two elementary holomorphic product estimates. If \(f\) is
homogeneous quadratic and \(\ell\) is linear, then
\[
\|f\ell\|_2^2\ge\|f\|_2^2\|\ell\|_2^2. \tag{20}
\]
Rotate \(\ell\) to a multiple of \(y_1\) and use
\(\mathbb E|f|^2|y_1|^2=\mathbb E|f|^2+\mathbb E|\partial_1 f|^2\).
If \(f_i\) are quadratic and \(\ell_i\) linear, then
\[
\left\|\sum_i f_i\ell_i\right\|_2^2
\le3\left(\sum_i\|f_i\|_2^2\right)
       \left(\sum_i\|\ell_i\|_2^2\right). \tag{21}
\]
To see this, write their coefficient tensors as \(T_i,v_i\). The product
has tensor \(\operatorname{Sym}\sum_iT_i\otimes v_i\), whose squared
norm is at most \((\sum_i\|T_i\|^2)(\sum_i\|v_i\|^2)\).
Multiply by \(3!\), and use \(\|f_i\|_2^2=2!\|T_i\|^2\).

Diagonalize \(J\) by a unitary change of the Gaussian coordinates, write
its eigenvalues as \(\lambda=\lambda_1\ge\lambda_2\ge\cdots\), and put
\(\varepsilon=1-\lambda\). With \(f=F_1\) and
\(h=\|\partial_1f\|_2^2\), we have \(\|f\|_2^2=\lambda\) and
\(\sum_{j\ge2}\|F_j\|_2^2=\varepsilon\). By (20)--(21),
\[
\lambda h\le\|f\partial_1f\|_2^2
\le (1+\alpha)\|H_1\|_2^2+
 (1+\alpha^{-1})\left\|\sum_{k\ge2}F_k\partial_kf\right\|_2^2
\le\frac{1+\alpha}{4}B+6(1+\alpha^{-1})\lambda\varepsilon. \tag{22}
\]
Here the middle inequality is weighted Cauchy--Schwarz applied to
\(f\partial_1f=H_1-\sum_{k\ge2}F_k\partial_kf\).

If \(\lambda\le1/2\), then \(R\le2\lambda\le1\) and
\(Q\le\lambda\le1/2\), so (19) is immediate. Suppose \(\lambda>1/2\).
Let \(h_1=\sum_{j\ge2}\|\partial_1F_j\|_2^2\le2\varepsilon\).
Since \(\sum_{i,j}\|\partial_iF_j\|_2^2=2\) and
\(\lambda_i\le\varepsilon\) for \(i\ge2\),
\[
R\le\lambda(h+h_1)+\varepsilon(2-h-h_1)
\le(\lambda-\varepsilon)h+4\lambda\varepsilon.
\]
Insert (22), multiply its right side by
\((\lambda-\varepsilon)/\lambda\le1\), and discard a nonpositive term:
\[
R\le\frac{1+\alpha}{4}B+(10+6/\alpha)\lambda\varepsilon.
\]
Finally \(Q\le\lambda^2+\varepsilon^2\), so
\(2\lambda\varepsilon\le1-Q\), proving (19).

## 6. The exact quadratic-budget interface [P]

This section specifies every condition that the certificate verifiers check.
Choose a positive definite real matrix
\(M_0=\begin{pmatrix}m_{11}&m_{12}\\m_{12}&m_{22}\end{pmatrix}\),
\(\zeta>0\), and real numbers \(k_c,k_b,\nu\).
Choose \(\mu_P,\mu_Q,\tau,\psi\ge0\), positive semidefinite real
matrices \(L_0,N_0\), and nonnegative numbers \(\chi_i\).
For this certificate the eight values of \(\alpha_i\) are
\[
1/4,\ 1/2,\ 1,\ 2,\ 4,\ 8,\ 16,\ 32,
\quad a_i=(1+\alpha_i)/4,\quad k_i=5+3/\alpha_i.
\]
Define
\[
\begin{aligned}
c_A&=m_{11}/18+\zeta+k_b,\\
c_B&=m_{11}/9+m_{12}/6+\zeta/4+k_c/4+k_b/2,\\
c_P&=5m_{11}/9+4m_{12}/3+m_{22}+k_c,\\
c_Q&=5m_{11}/9+2m_{12}/3+m_{22}+k_c,\\
c_R&=4m_{11}/9+2m_{12}/3.
\end{aligned}
\]
Require the five rational inequalities
\[
\begin{aligned}
c_A+(N_0)_{11}/2&\le\nu+\tau,\\
c_B+(N_0)_{11}+(N_0)_{12}/2
 &\le\nu+\psi-\sum_i(a_i/k_i)\chi_i,\\
c_P+2\tau+(L_0)_{11}+(N_0)_{11}&\le2\nu+\mu_P,\\
c_Q+(L_0)_{22}+(N_0)_{11}+2(N_0)_{12}+(N_0)_{22}
 &\le2\nu+\mu_Q+\sum_i\chi_i,\\
c_R+2(L_0)_{12}-4(N_0)_{11}-2(N_0)_{12}+12\psi
 &\le\sum_i\chi_i/k_i. \tag{23}
\end{aligned}
\]
Then, for
\[
Z=m_{11}d^2+2m_{12}dc+m_{22}c^2+\zeta b^2
       +k_c c(V-1)+k_b Vb,
\]
we have
\[
\mathbb EZ\le\nu s+4\mu_P+\mu_Q+\sum_i\chi_i. \tag{24}
\]
Indeed (14) gives \(\mathbb EZ\le c_AA+c_BB+c_PP+c_QQ+c_RR\).
Multiplying (23) by the respective nonnegative invariants bounds this by
\[
\begin{split}
\nu s+\mu_PP+\mu_QQ+\tau(A-2P)+\psi(B-12R)
+\sum_i\chi_i\{Q+R/k_i-a_iB/k_i\}\\
-\operatorname{tr}(L_0G)-\operatorname{tr}(N_0H).
\end{split}
\]
Equations (10), (15), (17), and (19) give (24).

## 7. The dual majorant [P]

Let \(r=\sqrt v\). Choose real \(C^1\) functions \(f_D,f_C\), with
\(f_i'(0)=0\), and constants \(\eta_D,\eta_C\). Put
\[
h_i=f_i+\tfrac r2 f_i',\quad k_i^{\rm test}=\tfrac r2 f_i',\quad
\mathcal R=r^2(f_D+f_C)-h_D-h_C.
\]
Choose a positive semidefinite real matrix function
\(W(r)=\begin{pmatrix}w_{11}&w_{12}\\w_{12}&w_{22}\end{pmatrix}\),
and \(p(v)=d_0+d_1v+d_2v^2+d_3v^3\), with \(d_3\ge0\).
Define
\[
\begin{aligned}
H_D&=h_D-\eta_D+3w_{22},\\
H_C&=h_C-\eta_C-k_c(r^2-1)+w_{11}-w_{22},\\
H_b&=\tfrac23 k_D^{\rm test}+k_C^{\rm test}-k_b r^2+2w_{12}.
\end{aligned}
\]
If, for every \(r\ge0\),
\[
\Phi(r):=p(r^2)+\mathcal R-r-w_{11}-2w_{22}
 -\frac14(H_D,H_C)M_0^{-1}(H_D,H_C)^{\mathsf T}
 -\frac{H_b^2}{4\zeta}\ge0, \tag{25}
\]
then
\[
\mathbb E\sqrt V\le d_0+d_1+d_2(2+s)+d_3M_3(s)
                    +\nu s+4\mu_P+\mu_Q+\sum_i\chi_i. \tag{26}
\]

Here is the pointwise-to-expectation proof, including the matrix sign.
Cauchy--Schwarz gives \(|a|^2\le c_1C\), and hence
\[
\mathcal M=\begin{pmatrix}1+c&b\\b&2+3d-c\end{pmatrix}\succeq0.
\]
Therefore \(\operatorname{tr}(W\mathcal M)\ge0\).
The two radial Stein identities with \(g_i(v)=f_i(\sqrt v)\) say that
\[
\mathbb E\{\mathcal R-h_Dd-h_Cc-
       (\tfrac23 k_D^{\rm test}+k_C^{\rm test})b\}=0.
\]
Complete the square in \((d,c)\) and in \(b\) in (25). The result is
\[
\begin{split}
r\le p(V)+\mathcal R-h_Dd-h_Cc-
(\tfrac23 k_D^{\rm test}+k_C^{\rm test})b+Z
+\eta_Dd+\eta_Cc-\operatorname{tr}(W\mathcal M).
\end{split}
\]
Take expectations, use (24), \(\mathbb Ed=\mathbb Ec=0\), and (1).
This proves (26). All the functions used below have polynomial growth;
Stein's identity extends to them by smoothing and dominated convergence.

## 8. The seven certificates and how they are verified [C]

The rational data are in `certificates.json`. Their format directly follows
(23)--(26): `mat` is \(M_0\), `gram` is \(L_0\), `gramN` is \(N_0\),
`alpha` holds \((\eta_D,\eta_C)\), and `d` holds \((d_0,d_1,d_2,d_3)\).
All numbers in that file are rational strings.

The certified partition and upward-rounded endpoint bounds are:

| Interval of \(s\) | Upper bound from (26) |
|---|---:|
| \([0,3]\) | 0.934615300505 |
| \([3,47/10]\) | 0.934569636551 |
| \([47/10,11/2]\) | 0.934619444773 |
| \([11/2,29/5]\) | 0.934619555342 |
| \([29/5,29/4]\) | 0.934602464859 |
| \([29/4,12]\) | 0.934383742719 |
| \([12,42]\) | 0.933233317972 |

For clarity, these are upper bounds supplied by explicit duals, not claimed
optima. Their maximum is strictly below \(46731/50000\).

**Spline definition [P].** At the rational knots \(r_j\), `coef[2*j]`
contains the two function values, and `coef[2*j+1]` their derivatives.
Between knots we use cubic Hermite interpolation. In local coordinate
\(t=(r-a)/(b-a)\), the four basis polynomials are
\[
1-3t^2+2t^3,\quad (b-a)(t-2t^2+t^3),\quad
3t^2-2t^3,\quad(b-a)(-t^2+t^3).
\]
At the last knot \(R_0\), the continuation is
\[
f_i(r)=f_i(R_0)+(r^2-R_0^2)f_i'(R_0)/(2R_0),\qquad r\ge R_0.
\]
The first two rows of `coef` vanish. Thus \(g_i(v)=f_i(\sqrt v)\)
is \(C^1\) even at zero. The three entries `ww[j]` are
\((w_{11},w_{22},w_{12})\) at the knots; interpolate them linearly and
keep them constant after the last knot. Positivity of each nodal matrix
proves positivity of \(W\) everywhere.

**Polynomial verification [P/C].** Substituting these definitions into (25)
gives a polynomial of degree at most six on each interval. Its coefficients
are reconstructed exactly from the rational data; no sampled values are
used. On a compact interval, a polynomial is nonnegative if all its
Bernstein coefficients are nonnegative. When this first test does not
suffice, exact dyadic de Casteljau subdivision is used. The algorithm is
sound because every Bernstein basis function is nonnegative on \([0,1]\).
For the tail put \(x=r-R_0\) and then \(x=t/(1-t)\). If the polynomial is
\(\sum_{i=0}^m p_i x^i\), the Bernstein coefficients of
\((1-t)^m\sum p_i(t/(1-t))^i\) are \(p_i/\binom mi\). This proves the
entire unbounded tail, with no truncation.

Every matrix condition, support inequality (23), and polynomial certificate
is checked exactly. There are 673 terminal Bernstein intervals in total.
The expression in (26) is convex in \(s\): its only nonlinear term is a
nonnegative multiple of \(s^{3/2}\). Endpoint checks therefore cover each
whole interval. For an endpoint rational \(s\), the verifier replaces
\(\sqrt s\) by an upper rational with denominator \(10^{12}\), computed
using integer square root and an exact final comparison. The interval
partition covers all of \([0,42]\).

Both the JavaScript and Python verifiers perform these checks independently.
The Python verifier uses floating point only in its displayed diagnostics;
all proof decisions use `Fraction`. The JavaScript verifier uses `BigInt`
rationals, and rounds its displayed upper bounds upward.

This completes the proof of the theorem, after scaling back to arbitrary
\(u\). The case \(u=0\) is immediate.

## 9. Failed strengthenings and their exact obstructions [P]

**Positivity of the covariance of the fourth-chaos pieces fails.** Consider
\[
q=\bar y_3y_1^2+\bar y_4y_1y_2+\bar y_5y_2^2
       +\bar y_6(y_2y_3-y_1y_4).
\]
The corresponding holomorphic vector is
\(F=(0,0,y_1^2,y_1y_2,y_2^2,y_2y_3-y_1y_4)\).
Its divergence correction is zero, so this displayed homogeneous cubic is
already Wick ordered. Direct differentiation gives \(H_j=0\) and \(K=0\),
hence \(A=B=0\). Its matrices are
\[
U=\operatorname{diag}(6,6,1,1,0,0),\qquad
J=\operatorname{diag}(0,0,2,1,2,2).
\]
Thus \(u=7,P=74,Q=13,R=3\), and
\[
\langle P_{2,2}c_1,P_{2,2}c_2\rangle=B/4-R=-3.
\]
In particular, one cannot apply positivity of covariance of complete
squares of chaos variables to their fourth-chaos projections. This also
defeats the proposed inequality \(B\ge4R\).

**Two tempting upper bounds for \(A\) fail.** Let
\[
q=\bar y_1(y_1^2+y_2^2)-2\bar y_2y_1y_2.
\]
Here \(F=(y_1^2+y_2^2,-2y_1y_2)\), and again the divergence correction
vanishes. Computation gives
\[
u=8,\quad A=B=256,\quad P=128,\quad Q=32,\quad R=64.
\]
For the variance-one normalization these become
\((A,B,P,Q,R)=(4,4,2,1/2,1)\). Consequently both
\(A\le2u^2+B/4\) and \(A+2Q\le2u^2+B/3\) are false.
All these values follow by elementary Gaussian moments; `verify_identities.py`
recomputes them exactly, along with the identities used above on several
complex-coefficient examples. The general proofs are in Sections 2--5,
not inferred from those examples.

## 10. Numerical work and remaining gap [N, unless explicitly marked P/C]

Adding the scalar covariance inequality alone, or (18) alone, produced
essentially zero new dual multipliers in the tested optimizations near
\(s=6.5\). This is a numerical observation, not a proof that those scalar
relaxations have the same optimum. Retaining the two Gram matrices and then
adding (19) lowered the numerical dual values and led to the certified
bound above.

For example, the numerical search at \(s=5.6\) returned objective about
0.93460642 before rational rounding and certification. No optimum of the
relaxation is asserted. The exact theorem uses only the rounded, repaired
rational certificates and the exact verifier.

Another possible inequality suggested by limited tensor optimization was
\(A+2Q\le2u^2+B\). It is **unproved here** and is **not used anywhere in
the certificate**. The simpler attempted strengthenings in Section 9 have
explicit counterexamples. Neither weighted sign in F6 has been established.
The bound 0.916 has not been reached.
