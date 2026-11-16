<!-- Verbatim from the delivery cubic_l1_rho_0_9359.zip (README.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# A certified dimension-free bound for complex cubic Gaussian chaos

**Result [C].** For every dimension and every complex Wick cubic
\(q\in H_{2,1}\),

\[
\boxed{\quad \mathbb E|q|\le \frac{9359}{10000}
                 (\mathbb E|q|^2)^{1/2}.\quad}
\]

Thus **rho = 0.9359** improves the supplied 0.95133 bound. This does not
establish rho <= 0.916 or the sharp conjectured constant sqrt(pi)/2.

The proof consists of the analytic reduction below [P] and six rational
dual certificates [C]. No numerical optimizer is used in verification.
The largest certified endpoint bound in this particular partition is at
most 0.935898597609. The stated theorem uses the simpler rational 0.9359.

Labels throughout: **P** = written proof; **C** = exact certified
computation, with replay code; **N** = numerical exploration only.

## Replay

From this directory, run:

```sh
# cubic_l1_certificate/
node verify.mjs
python verify.py certificates.json
python verify_examples.py
```

The JavaScript verifier needs Node 20 or later and only built-in modules.
The independent Python verifier and example checker need only the Python
standard library. Both verifiers use exact rational arithmetic for every
proof decision. Floating-point values are used only to format the Python
verifier's diagnostic output. The JavaScript diagnostics round upward.

Both verifiers check the entire half-line, not a radius mesh. They also
check a covering of every s in [0,42], not just selected s values.
The JavaScript run completed in under one second in the preparation
environment; the Python run took about 0.3 seconds [N: timings].

Files:

- `README.md`: theorem, complete analytic reduction, certificate definition,
  and failed approaches.
- `certificates.json`: all rational coefficients of the six certificates.
- `verify.mjs`: independent exact BigInt/rational verifier.
- `verify.py`: independent exact Fraction verifier.
- `verify_examples.py`: exact arithmetic checks for the examples below.
- `discover.py`: numerical search, included for further experimentation.
- `requirements-discovery.txt`: dependencies for the optional search only.
- `verification.txt`: output of the two exact verifiers and example checks.

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

## 3. A radial matrix budget [P]

Let X=Re q, sigma^2=EX^2=1/2 and Gamma=|grad X|^2/3. Denote by P_k the
projection on the kth real chaos. Since X is in the third real chaos,
the product rule implies

\[
\Gamma=X^2+\tfrac16L(X^2)
 =\sigma^2+\tfrac23P_2(X^2)+\tfrac13P_4(X^2).
\]

The identity EX^4=3E[Gamma X^2] therefore gives

\[
\kappa_4(X)=2\|P_2X^2\|_2^2+\|P_4X^2\|_2^2,
\]

and hence

\[
\operatorname{Var}\Gamma
 =\tfrac49\|P_2X^2\|_2^2+\tfrac19\|P_4X^2\|_2^2
 \le\tfrac29\kappa_4(X).
\]

Rotation invariance gives EX^4=(3/8)E|q|^4, so kappa_4(X)=3s/8.
Direct differentiation in the stated real coordinates gives

\[
\Gamma=\frac D2+\frac{\operatorname{Re}a}{3}.
\]

Under a common phase rotation, D has charge zero and a has charge two.
Thus E[(D-1)Re a]=0 and E(Re a)^2=(1/2)E|a|^2. Substitution yields

\[
\boxed{3\mathbb E d^2+\tfrac23\mathbb E|a|^2\le s.} \tag{10}
\]

In addition, pointwise Cauchy--Schwarz gives |a|^2<=c_1 c_2.
Therefore the following matrix is positive semidefinite pointwise:

\[
\boxed{\mathcal M=\begin{pmatrix}C&b\\b&3D-C\end{pmatrix}\succeq0.} \tag{11}
\]

This keeps the joint radial information in the two real components of q.

## 4. Five scalar constraints [P]

Equations (7)--(10), and b^2<=|a|^2, prove the following five inequalities.
They are all used by the certified duals:

\[
\begin{aligned}
\mathbb E[3d^2+\tfrac23 b^2]&\le s, &(Q_0)\\
\mathbb E[2c^2+b^2]&\le s, &(Q_1)\\
\mathbb E[b^2+2c(V-1)]&\le s, &(Q_2)\\
\mathbb E[c^2-c(V-1)]&\le0, &(Q_3)\\
\mathbb E[b^2-Vb]&\le0. &(Q_4)
\end{aligned} \tag{12}
\]

For Q_1, the left side is at most 2t+A+B/4=s-3B/4.
For Q_2 it is at most A+B/4+2(t+B/4)=s-B/4.
The left side of Q_3 equals -B/4.
The left side of Q_4 is at most -B/4.
Q_0 is (10) with |a|^2 replaced by b^2.

In particular, the new inequality E b^2<=E Vb has a sign, although the
weighted sign needed in F6 has not been established here.

## 5. The dual-certificate lemma [P]

The following lemma is the entire interface between the analytic proof
and the finite rational computation.

Choose nonnegative rational numbers lambda_0,...,lambda_4 and put

\[
\alpha=3\lambda_0,\qquad
\beta=2\lambda_1+\lambda_3,\qquad
\zeta=\tfrac23\lambda_0+\lambda_1+\lambda_2+\lambda_4,
\qquad \Lambda=\lambda_0+\lambda_1+\lambda_2.
\]

Require alpha,beta,zeta>0. Let eta_D,eta_C be arbitrary rationals.
Let f_D(r),f_C(r) be C^1 functions of polynomial growth on [0,infinity),
with f_D'(0)=f_C'(0)=0, as in the explicit spline construction below.
Define

\[
h_i=f_i+\tfrac r2 f_i',\quad k_i=\tfrac r2 f_i',\qquad
R=r^2(f_D+f_C)-h_D-h_C.
\]

Let

\[
W(r)=\begin{pmatrix}w_{11}&w_{12}\\w_{12}&w_{22}\end{pmatrix}\succeq0
\]

pointwise, and set

\[
\begin{aligned}
H_D&=h_D-\eta_D+3w_{22},\\
H_C&=h_C-\eta_C+(\lambda_3-2\lambda_2)(r^2-1)+w_{11}-w_{22},\\
H_b&=\tfrac23k_D+k_C+\lambda_4r^2+2w_{12}.
\end{aligned}
\]

Choose p(v)=d_0+d_1v+d_2v^2+d_3v^3 with d_3>=0.
Suppose, for every r>=0,

\[
\boxed{\quad
\Phi(r):=p(r^2)+R-r-w_{11}-2w_{22}
 -\frac{H_D^2}{4\alpha}-\frac{H_C^2}{4\beta}-\frac{H_b^2}{4\zeta}
 \ge0.\quad} \tag{13}
\]

Then

\[
\mathbb E|q|\le
\mathcal B(s):=d_0+d_1+d_2(2+s)+d_3M_3(s)+\Lambda s. \tag{14}
\]

**Proof.** Apply (4)--(5) to g_i(v)=f_i(sqrt(v)). The chain rule gives
g_i+vg_i'=h_i and vg_i'=k_i. Since Ec=Ed=0,

\[
\mathbb E R=\mathbb E\mathcal L,
\quad
\mathcal L=d(h_D-\eta_D)+c(h_C-\eta_C)
                +b(\tfrac23 k_D+k_C).
\]

Let

\[
Q=\alpha d^2+\beta c^2+\zeta b^2
 +(2\lambda_2-\lambda_3)c(V-1)-\lambda_4Vb.
\]

By the nonnegative weighted sum of (12), EQ<=Lambda s. Moreover,

\[
\mathcal L+\operatorname{tr}(W\mathcal M)-Q
 =dH_D+cH_C+bH_b-\alpha d^2-\beta c^2-\zeta b^2+w_{11}+2w_{22}.
\]

Completing each of the three squares bounds this above by

\[
\frac{H_D^2}{4\alpha}+\frac{H_C^2}{4\beta}
 +\frac{H_b^2}{4\zeta}+w_{11}+2w_{22}.
\]

Both W and M are positive semidefinite, so tr(WM)>=0. Combining this
pointwise inequality with (13), then taking expectations, yields
E sqrt(V)<=E p(V)+Lambda s. Now use EV=1, EV^2=2+s, and (1), with d_3>=0.
This is (14).

The spline functions below make g_i continuously differentiable at zero:
on the first segment, f_i(r)=a r^2+b r^3, so g_i(v)=av+bv^(3/2).
Across every other junction, g_i is C^1. Gaussian integration by parts
is valid for these C^1 functions with polynomial growth; alternatively,
smooth approximation with dominated first derivatives proves the same
identities. Thus no smoothness assumption is being bypassed. QED.

## 6. Exact certificate format and verification [C]

The JSON stores six instances of (13). All numeric strings are exact
rationals; a decimal string denotes that terminating rational, not a
floating-point value.

For each certificate, `knots` lists r_0=0<...<r_m. The rows `coef[2*j]`
and `coef[2*j+1]` give the values and r-derivatives of (f_D,f_C) at r_j.
On [a,b]=[r_j,r_(j+1)], set t=(r-a)/(b-a) and use cubic Hermite
interpolation:

\[
f_i(r)=(2t^3-3t^2+1)y_{j,i}
 +(b-a)(t^3-2t^2+t)z_{j,i}
 +(-2t^3+3t^2)y_{j+1,i}
 +(b-a)(t^3-t^2)z_{j+1,i}. \tag{15}
\]

For r>=R=r_m use

\[
f_i(r)=y_{m,i}+\frac{r^2-R^2}{2R}z_{m,i}. \tag{16}
\]

This matches both value and derivative at R. The first two coefficient
rows are exactly zero. The field `ww[j]` contains (w_11,w_22,w_12) at
r_j. Interpolate W linearly on each finite segment, and keep it constant
on the tail. The verifier checks each nodal 2-by-2 matrix is PSD using
its two diagonal entries and determinant. Convexity of the PSD cone
then proves W(r)>=0 everywhere.

The JSON field `alpha` stores (eta_D,eta_C); `la` stores the five
lambda's; `d` stores the four polynomial coefficients. These field names
are only serialization conventions; the alpha in the dual lemma is
3 lambda_0.

On each segment, (13) is a rational polynomial of degree at most six
in the local parameter t. On the tail it is a degree-at-most-six
polynomial in x=r-R>=0. The verifiers reconstruct these polynomials
directly from (13), without trusting coefficients supplied by a solver.

**[P] Polynomial positivity rule.** If P(t)=sum_(j=0)^n p_j t^j on
[0,1], its Bernstein coefficients are

\[
b_i=\sum_{j=0}^i p_j\frac{\binom ij}{\binom nj}.
\]

If every b_i is nonnegative, then P is nonnegative, since the Bernstein
basis is nonnegative. Otherwise split at 1/2 and apply the same rule to
both halves using the exact de Casteljau averaging algorithm. A
certificate is accepted only when all leaves have nonnegative
coefficients. The depth limit is a failure condition, never acceptance.

For the tail polynomial P(x), use x=t/(1-t). The Bernstein coefficients
of (1-t)^n P(t/(1-t)) are p_i/binom(n,i). The same subdivision rule
therefore proves positivity on the entire unbounded tail. This is an
algebraic change of variables, not a tail truncation.

**[C] Results.** The following rational intervals cover [0,42] with no
gaps. The displayed bounds are upward-rounded decimal bounds on both
endpoints. Both independent verifiers check the corresponding exact
rational comparisons against 9359/10000.

| s interval | Endpoint bound at most | Exact Bernstein leaves |
|---|---:|---:|
| [0,3] | 0.934615300505 | 80 |
| [3,21/4] | 0.935610941608 | 84 |
| [21/4,25/4] | 0.935886270586 | 138 |
| [25/4,57/8] | 0.935898597609 | 134 |
| [57/8,45/4] | 0.935891198858 | 82 |
| [45/4,42] | 0.935374595197 | 84 |

There are 602 accepted Bernstein leaves in total. The inequalities in r
are independent of s. For a fixed certificate, B(s) from (14) is convex
on [0,infinity), because its only nonlinear term is the nonnegative
multiple d_3 C_6 s^(3/2). Checking both endpoints therefore controls the
whole s interval [P].

**[C] Square roots at endpoints.** For s=N/D, the verifier computes an
integer a with a^2 D >= N*10^24. It then uses a/10^12 as a rigorous upper
bound for sqrt(s). This is computed by integer square root and an exact
comparison. Its coefficient in (14) is nonnegative. No transcendental
or floating-point evaluation is used in the proof.

Equations (13)--(14), the table, and scaling complete the theorem.

## 7. What does not work

### 7.1 Moment constraints alone: an explicit law [P]

Let V take 9/10 with probability 600/601, and 61 with probability 1/601.
Direct calculation gives

\[
EV=1,\quad EV^2=7,\quad s=5,\quad EV^3=1892/5.
\]

The sixth-moment ceiling (1) is satisfied: sqrt(5)>2 gives
M_3(5)>51+10 C_6>1892/5. Nevertheless

\[
E\sqrt V>\frac{600(9486/10000)+781/100}{601}>0.96,
\]

because (9486/10000)^2<9/10 and (781/100)^2<61.
Thus the two moment constraints alone do not even imply rho<=0.96.

This is a law for a relaxation, not a cubic. The full radial Stein
identity eliminates it. Indeed, at each positive atom v, smooth test
functions with independently assigned values and derivatives in (4)
force E[C|V=v]=v and E[b|V=v]=-v. Conditional Jensen then gives

\[
E[b^2+2(C-1)^2]\ge EV^2+2E(V-1)^2=19>5=s,
\]

contradicting Q_1. This explicitly shows which added condition rejects
the moment-only example.

### 7.2 A uniformly stricter projection factor is false [P]

One might try to replace E|a|^2<=E[Vb] by
E|a|^2<=eta E[Vb] with a universal eta<1. This fails for the cubics

\[
q_n(y)=y_1\left(\sum_{j=1}^n|y_j|^2-(n+1)\right).
\]

They are in H_(2,1), since
q_n=y_1(|y_1|^2-2)+sum_(j=2)^n y_1(|y_j|^2-1).
Here F_j=y_1 y_j and H_j=2y_1^2 y_j. The computation in Section 2 gives

\[
u=n+1,\quad A=2(n+3)^2,\quad B=32(n+2),
\quad t=n^2+8n+11,\quad \delta=4n^2+60n+104.
\]

For example, E|H_1|^2=24 and E|H_j|^2=8 for j>1, so
B=4 sum_j E|H_j|^2=32(n+2). Also
sum_(j,k)(partial_j F_k)(partial_k F_j)=(n+3)y_1^2,
giving A=2(n+3)^2. The other moments follow by integrating independent
exponentials, as checked by `verify_examples.py`.

Consequently

\[
\frac{E|a|^2}{E[Vb]}
 =\frac{A+B/4}{A+B/2}
 =\frac{n^2+10n+17}{n^2+14n+25}\longrightarrow1.
\]

This defeats every such eta<1. It also defeats every proposed universal
lower bound B>=epsilon A with epsilon>0. It does not disprove a stronger
inequality for the projected real variable b itself, or for the
specific weighted quantities in F6.

### 7.3 Numerical exploration, not an optimality claim [N]

At s=5, increasingly rich *mesh searches* produced the following
approximate candidate objective values. These are not certified optima,
and the intermediate values are not being used as theorems:

| Search stage at s=5 | Candidate value |
|---|---:|
| Antiholomorphic Stein identity with the loose F4 quadratic budget | 0.96254 |
| Radial D identity with the rotational budget (10) | 0.94967 |
| Also E b^2<=E Vb | 0.94019 |
| Joint C,D identities and covariance constraints, rational test basis | 0.93913 |
| Including linear-in-v test terms | 0.93747 |
| Cubic Hermite tests in r | 0.93611 |
| Also the positive gradient matrix (11) | 0.93537 |

The final theorem uses the globally checked rational certificates in
Section 6, not this table. Fine-knot searches near s=6.5 gave candidate
values around 0.93584, but no claim of sharpness or exhaustion of this
augmented relaxation is made. The discovery script is optional and may
produce solver-dependent numerical output; the saved exact certificate
data are the proof witnesses.

Neither sign in F6 is proved here. The 0.916 milestone and sharp constant
remain unresolved by this work.

## 8. The lower endpoint sqrt(pi)/2 [P]

For context, no dimension-free constant below sqrt(pi)/2 is possible.
Take independent copies xi_j of y_1 y_2 bar(y_3) and set
q_m=m^(-1/2) sum_(j=1)^m xi_j, using disjoint triples of coordinates.
Then q_m is in H_(2,1), E|q_m|^2=1, E xi_j=E xi_j^2=0. The
two-dimensional central limit theorem gives q_m converging in law to a
standard complex Gaussian. The bound E|q_m|^2=1 makes |q_m| uniformly
integrable, so E|q_m| tends to sqrt(pi)/2. The result here is therefore

\[
\frac{\sqrt\pi}{2}\le
\sup_{n,q\ne0}\frac{E|q|}{(E|q|^2)^{1/2}}
\le0.9359.
\]

No assertion about attainment is needed for, or implied by, this proof.

## Source note

The proof uses the self-contained setting and the two supplied moment
estimates (1). Public background consulted included Chen, Chen and Liu,
*Berry-Esséen bound for complex Wiener-Itô integral*,
https://arxiv.org/html/2407.05353v1, especially its complex-chaos product
and isometry conventions. None of its quantitative estimates is used
in the new bound. The supplied Larsson-Cohn thesis overview was read
for background; it is not an input to the certificate.
