<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/proof.md (file dated 2026-11-05). Only this line was added. -->
# R23–R25: non-Hermitian content, the size-biased self-interaction, and shell bookkeeping

5 November 2026. The R23 theorem is proved analytically with a completed rigorous
computational certificate. R24 gives exact analytic identities and a new remote
comparison theorem, but not the remaining shared-A content inequality. R25 gives
exact phase bookkeeping and identifies what conditioning can and cannot remove.

All Gaussian variables are standard complex, E|Z|² = 1. The visible variable Z
is independent of all remote variables. Write

\[
L=Z(a+b|Z|^2),\quad F(q)=\mathbb E|L+q|+\mathbb E|L-q|,
\quad B(v)=2\mathbb E|L+\sqrt v W|,
\]

\[
F_A(q)=\mathbb E_Z[(|Z|^2-1)\operatorname{ph}(L+q)],
\qquad C(q)=\|\Pi_{1,0}F_A(q)\|_2.
\]

The three profiles are the peak, flank, and upper rows from the preceding
Hermitian certificate. Their exact parameters are stored in the kernel files.
The notation p below denotes the variance of a quadratic form; the penalty is
written explicitly as 1/epsilon.

## R23. Exact non-Hermitian sixth moment

Let

\[
P=Y^*AY-\operatorname{tr}A,
\quad p=\operatorname{tr}(AA^*),\quad t=\operatorname{tr}(A^2),
\]

\[
\zeta=\operatorname{tr}(A^2A^*),\quad
\eta=\operatorname{tr}(A^3A^*),\quad s=\operatorname{tr}(A^3),
\quad r=\operatorname{tr}((AA^*)^2),\quad Q=\|A^2\|_{HS}^2.
\]

There is no assumption that A is normal. Define

\[
R_3=\operatorname{tr}((AA^*)^3),\quad Q_3=\|A^3\|_{HS}^2,
\]

\[
U_3=\operatorname{tr}(A^{*2}A^2A^*A),\quad
V_3=\operatorname{tr}(A^2A^{*2}AA^*).
\]

The latter two traces are nonnegative real numbers: each is the trace of a
product of two positive semidefinite matrices. The exact moments are

\[
m_4:=\mathbb E|P|^4=2p^2+|t|^2+2r+4Q,
\tag{23.1}
\]

\[
\boxed{\begin{aligned}
m_6:=\mathbb E|P|^6={}&6p^3+9p|t|^2+4|s|^2+36|\zeta|^2
+36\Re(\overline t\eta)\\
&+18pr+36pQ+12R_3+36(Q_3+U_3+V_3).
\end{aligned}}\tag{23.2}
\]

Proof: formally,

\[
\log\mathbb E e^{zP+w\overline P}
=\sum_{k\ge2}\frac1k\operatorname{tr}(zA+wA^*)^k.
\]

Extract the coefficient of z³w³ and multiply by 3!3!. The degree partitions are
2+2+2, 3+3, 2+4, and 6. `verify_moments.mjs` independently enumerates all 265
centered Wick contractions and verifies the resulting noncommutative trace
polynomial exactly. No numerical matrix examples are used to prove this identity.

### A sharp Gaussian-anchored coupled inequality

For all complex A,

\[
\boxed{m_6\le37p\,m_4-68p^3.}\tag{23.3}
\]

Here is a short proof that also produces the refinement needed for the content
certificate. Put

\[
H_\theta=\Re(e^{-i\theta}P),\qquad
p_\theta=\mathbb E H_\theta^2
=\frac{p+\Re(e^{-2i\theta}t)}2.
\]

Apply the Hermitian inequality

\[
\mathbb E H_\theta^6\le\frac{125}{3}p_\theta\mathbb E H_\theta^4
-110p_\theta^3
\]

and integrate theta uniformly. Using

\[
\mathbb E P^3\overline P=3pt+6\eta
\]

and the circle averages of fourth and sixth powers gives

\[
\boxed{
m_6\le25pm_4-44p^3-16p|t|^2+100\Re(\overline t\eta).
}\tag{23.4}
\]

We have

\[
|\eta|\le\sqrt{rQ},\qquad 0\le Q\le r\le p^2,\qquad |t|\le p.
\]

The first bound is Hilbert–Schmidt Cauchy–Schwarz applied to
tr(A² AA*); the second follows from
Q = tr((A*A)(AA*)) <= r.

For 0 <= tau <= 1 and 0 <= q <= r <= 1, the scalar inequality

\[
25\tau\sqrt{rq}\le7\tau^2+6r+12q
\tag{23.5}
\]

holds. To verify it, write q = r z², 0 <= z <= 1. If
6+12z²-25tau z >= 0 the result is immediate. Otherwise take r = 1, which can
only decrease the difference. For z >= 14/25, the minimum over tau in [0,1]
is attained at tau = 1, where the difference is
(1-z)(13-12z). For z <= 14/25, completing the square gives the lower bound
6 - (289/28)z² > 0. Thus (23.5) holds.

It implies

\[
100\Re(\overline t\eta)\le28p|t|^2+24pr+48pQ.
\]

Substitute this in (23.4) and use (23.1) to obtain (23.3).

The pair (37,68) is sharp in the following precise sense. A rank-one Hermitian
matrix has (p,m4,m6) = (1,9,265), attaining equality. Diffuse normal matrices
with circularly distributed eigenvalue phases have (m4,m6) tending to (2,6),
with p = 1. Any Gaussian-anchored bound m6 <= alpha p m4 - beta p³ must have
beta <= 2alpha - 6. On this anchoring line, the rank-one example forces
alpha >= 37. Thus neither coefficient of (23.3) can be improved while holding
the other fixed. This does not assert a full classification of every possible
unanchored tradeoff between alpha and beta.

### The coupled inequality alone is insufficient for this envelope method

Feeding only (23.3) into the old scalar relaxation gives approximately 0.2472,
above 0.24. This is an exploratory optimization result, not used in the proof.
Two additional constraints close the gap.

First, put tau = |t|/p. Since sqrt(rQ) <= (r+2Q)/(2sqrt(2)), (23.4) gives

\[
m_6\le\alpha(\tau)pm_4-\beta(\tau)p^3,
\tag{23.6}
\]

where

\[
\alpha(\tau)=25+\frac{25}{\sqrt2}\tau,
\quad
\beta(\tau)=44+16\tau^2+\frac{25}{\sqrt2}\tau(2+\tau^2).
\]

Second, the real direction carrying the content uses only part of the variance.
Choose theta so that e^(-i theta) E[P J(|P|²)] is nonnegative real and put

\[
Y_0=|P|^2/p,\qquad Z_0=(\Re(e^{-i\theta}P))^2/p.
\]

Then

\[
0\le Z_0\le Y_0,\qquad \mathbb EY_0=1,
\qquad \mathbb EZ_0\le\frac{1+\tau}{2}.
\tag{23.7}
\]

The conditional Gaussian identities remain exact for arbitrary complex P:

\[
F(XP)=\mathbb EB(|P|^2),\qquad
C(XP)=\frac12|\mathbb E[PJ(|P|^2)]|.
\]

All remote first-chaos coefficients other than the X coefficient vanish by
conditional circular symmetry. The real-direction version of weighted
Cauchy–Schwarz gives

\[
C(XP)^2\le\Delta\,
\mathbb E\left[\frac{Z_0}{Y_0}R_p(Y_0)\right],
\quad \Delta=B(p)-F(XP),
\tag{23.8}
\]

with the integrand interpreted as zero when Y_0 = 0. Here R is the same kernel
as in the preceding certificate:

\[
R_p(y)=\frac{py[J(py)-J(p)]^2}
{4[B(p)+B'(p)(py-p)-B(py)]}.
\]

### Completed certificate for arbitrary complex A

The new certificate proves

\[
\boxed{
C(XP)^2\le\frac{239}{1000}[B(p)-F(XP)]
}\tag{23.9}
\]

for every complex matrix A and
551/100000 <= p <= 463/10000, at all three application rows.

Partition tau into [0,0.7], [0.7,0.75], ..., [0.95,1]. On the first interval
use (23.3). On each subsequent [l,h], use the rigorous rational weakening of
(23.6):

\[
\alpha=25+\frac{17678}{1000}h,
\quad
\beta=44+16l^2+\frac{17677}{1000}l(2+l^2).
\]

The checker verifies the rational square comparisons placing 25/sqrt(2)
between 17.677 and 17.678.

For each interval the file `envelopes.json` supplies rational a0,a1,a3,gamma,
with a3 > 0 and gamma >= 0. Put

\[
Q(y)=a_0+a_1y+a_3(y^3-\alpha y^2).
\]

The verifier proves simultaneously

\[
Q(y)\ge0,\qquad R_p(y)\le Q(y)+\gamma y
\quad(y\ge0,\;0.00551\le p\le0.0463),
\]

and checks exactly that

\[
a_0+a_1-\beta a_3+\gamma(1+h)/2<239/1000.
\]

Because 0 <= Z_0/Y_0 <= 1,

\[
\frac{Z_0}{Y_0}R_p(Y_0)\le Q(Y_0)+\gamma Z_0.
\]

Taking expectations, using the coupled moment and (23.7), proves (23.9).

The scalar kernel enclosures are the same 127-node Arb enclosures as before;
`generate.py` recomputes them from positive one-dimensional integral formulas.
The proof of their complete monotonicity and the integration tail bounds is
included in `kernel_proof.md`. All scalar rectangle decisions are exact rational
comparisons. The whole tail y >= 70 is controlled using |J(0)| < 1.7 and
-B''(0.1463) > 1: for v = py >= 70p,

\[
d_p(v)\ge\int_p^{p+0.1}(v-s)(-B''(s))ds
\ge0.1(v-0.1463).
\]

This bounds R uniformly by a rational constant smaller than each envelope at
70. Both relevant polynomials are increasing beyond 70.

Completed rectangle counts, summed over all seven tau intervals:

| row | rational boxes | additional polynomial-positivity boxes |
|---|---:|---:|
| peak | 983671 | 77 |
| flank | 157507 | 77 |
| upper | 27601 | 77 |

The largest rational expectation bound is below 0.238775, so rounding the
result to 0.239 retains margin. This is not a Lean certificate.

Using the supplied 0.24 shell-cost theorem, (23.9) implies

\[
\boxed{
\Lambda(XP+(T-1)U)
\le B(p)-p/\varepsilon-\frac1{240}[B(p)-F(XP)]\le S
}
\]

for every remote linear U in that cost theorem's amplitude range, including
arbitrary sharing with X and Y. The new certificate does not reprove the input
shell-cost estimate.

## R24. The correct size bias and an exact positive deficit

Now let R = |X|² be the remote driver radius, distinct from the visible |Z|².
Take any complex c and any complex mean-zero random variable P independent of X,
with finite second moment. In particular P may be a non-Hermitian centered
Gaussian quadratic form. Set

\[
b_R=c(R-2)+P,\quad q=Xb_R,
\quad u=2|c|^2+\mathbb E|P|^2.
\]

Define the size-biased expectation

\[
\widehat{\mathbb E}H(R,P)=\mathbb E[R H(R,P)].
\]

Under this probability measure R has Gamma(2,1) density r e^(-r), while P
remains independent of R. Exactly,

\[
\widehat{\mathbb E}b_R=0,
\qquad \widehat{\mathbb E}|b_R|^2=u.
\tag{24.1}
\]

This is the natural weight: it preserves both the centering required for the
content estimate and the energy. Taking an independent copy of b_R under the
original exponential law instead would give mean -c, creating a first-chaos
component. That naive decoupling does not preserve the required structure.

Let

\[
B_0=2\mathbb E|L|,
\quad \Phi(s)=2\mathbb E|L+\sqrt s|-B_0,
\quad F_A(z)=z\,g(|z|^2).
\]

The function g is real and continuous at zero. Since L is a circular Gaussian
scale mixture, Phi is concave in s. For example each Gaussian component has

\[
\Phi'(s)=\frac{\sqrt\pi}{2}\int\sqrt\lambda\,
{}_1F_1(1/2;2;-\lambda s)\,\nu(d\lambda),
\]

whose derivative is nonpositive by Euler's integral.

For r > 0 define

\[
h_r(v)=\Phi(rv)/r,
\]

\[
d_{u,r}(v)=h_r(u)+\Phi'(ru)(v-u)-h_r(v)\ge0.
\tag{24.2}
\]

Then, writing A_0(u) = -B''(u),

\[
\boxed{
B(u)-F(q)=\widehat{\mathbb E}d_{u,R}(|b_R|^2)
+|c|^2\mathcal K(u),
}\tag{24.3}
\]

where

\[
\mathcal K(u)=2uA_0(u)+u^2A_0'(u)
\ge\frac12uA_0(u)>0\qquad(u>0).
\tag{24.4}
\]

In particular this proves exact remote same-norm domination F(q) <= B(u) for
the full self-interaction family, for all amplitudes and all a,b > 0. The random
variable P need not even be a quadratic form for this remote-only statement.

Proof of (24.3): conditional second moments give

\[
\mathbb E_P(|b_R|^2-u)=|c|^2(R^2-4R+2).
\]

Also B'(u) = hat E Phi'(uR). Integration by parts for the Gamma(2,1) law gives

\[
\widehat{\mathbb E}[(R^2-4R+2)\Phi'(uR)]
=2uB''(u)+u^2B'''(u)=-\mathcal K(u).
\]

Taking expectations in (24.2) proves (24.3). From the Gaussian-mixture formula
for A_0,

\[
\mathcal K(u)=\frac{\sqrt\pi u}{8}
\int\frac{\lambda^{3/2}(4+\lambda u)}{(1+\lambda u)^{5/2}}\,\nu(d\lambda),
\]

which proves (24.4).

### Exact remaining content formula

There is only one possible remote first-chaos coefficient, the X coefficient.
It obeys

\[
\boxed{
\mathcal C(q):=\mathbb E[\overline X F_A(q)]
=\frac{cuJ'(u)}2+
\widehat{\mathbb E}\{b_R[g(R|b_R|^2)-g(Ru)]\}.
}\tag{24.5}
\]

Indeed hat E g(uR) = J(u)/2, and Gamma integration by parts gives
hat E (R-2)g(uR) = uJ'(u)/2.

A useful additional control variate is free. Put V = |b_R|² and, for any complex
lambda, define

\[
W_\lambda=b_R[g(RV)-g(Ru)]-\lambda(V-u),
\]

\[
\mathcal Q_\lambda=
\widehat{\mathbb E}\frac{|W_\lambda|^2}{d_{u,R}(V)},
\qquad \mathcal E=\widehat{\mathbb E}d_{u,R}(V).
\]

Since hat E(V-u) = 0, weighted Cauchy–Schwarz gives

\[
\boxed{
C(q)\le\frac{|c|uJ'(u)}2+\sqrt{\mathcal E\mathcal Q_\lambda},
\qquad \Delta=\mathcal E+|c|^2\mathcal K(u).
}\tag{24.6}
\]

The optimal constant lambda for this bound is

\[
\lambda_*=
\frac{\widehat{\mathbb E}[b_R(g(RV)-g(Ru))(V-u)/d_{u,R}(V)]}
{\widehat{\mathbb E}[(V-u)^2/d_{u,R}(V)]},
\]

when the denominator is positive and the quantities are finite. Ratios at
removable zeros are interpreted by their limits; the identity before
Cauchy–Schwarz does not require division.

When P = Y* A Y - tr A, the marginal law of b_R under the size bias is exactly
the centered quadratic form with matrix diag(c,c,A), because a Gamma(2,1)
variable is the sum of two independent exponentials. Thus all R23 moment and
phase constraints transfer to b_R. For real c and Hermitian A this also recovers
the stronger Hermitian moment inequality.

However b_R and R remain correlated. We have not proved the inequality

\[
\left(\frac{|c|uJ'(u)}2+\sqrt{\mathcal E\mathcal Q_{\lambda_*}}\right)^2
\le0.24(\mathcal E+|c|^2\mathcal K(u))
\]

uniformly over this family. The new remote theorem does not by itself prove the
shared-A content lemma. Replacing the joint expectation by a worst-case radius
loses substantial information, so the Gamma weight must remain in a proof.

## R25. What remains in a general one-driver cubic

Use an arbitrary fixed unit remote linear direction X and write

\[
q=cX(R-2)+XP(Y)+\overline X B(Y)+(R-1)V(Y)
+X^2\overline{W(Y)}+R_0(Y),\quad R=|X|^2.
\]

Here P is centered charge-zero quadratic, B is holomorphic quadratic, V and W
are holomorphic linear, and R_0 is charge-one cubic. All use Y coordinates
independent of X and may share coordinates with each other.

The exact energy bookkeeping is

\[
\|q\|_2^2=2|c|^2+\|P\|_2^2+\|B\|_2^2+\|V\|_2^2
+2\|W\|_2^2+\|R_0\|_2^2.
\]

Condition on (Y,R=r), write X = sqrt(r)e^(i theta), and put

\[
a_r=\sqrt r[c(r-2)+P],\quad b_r=\sqrt r B,
\quad d_r=r\overline W,\quad e_r=(r-1)V+R_0.
\]

Then q = a_r e^(i theta) + b_r e^(-i theta) + d_r e^(2i theta) + e_r.
The exact cubic-content coefficient is

\[
\boxed{\begin{aligned}
\mathbb E_\theta[\overline Xq^2\overline q]=\sqrt r\{&
a_r(|a_r|^2+2|b_r|^2+2|d_r|^2+2|e_r|^2)\\
&+e_r^2\overline{b_r}
+2b_rd_r\overline{e_r}
+2e_rd_r\overline{a_r}\}.
\end{aligned}}\tag{25.1}
\]

This is just the frequency condition k+l-m = 1. It displays every cross term;
none is lost through an unjustified independent-phase average.

The contribution of a_r alone, after integrating r and Y, is

\[
32c|c|^2+4c\operatorname{tr}(AA^*)
+2\overline c\operatorname{tr}(A^2)+4\operatorname{tr}(A^2A^*)
\]

when P is the quadratic form for A. The remaining contributions can be written
explicitly as the expectation over Y of

\[
\begin{aligned}
&4(P+c)|B|^2+(6P+16c)|V|^2+2P|R_0|^2
+4P\Re(V\overline{R_0})+(12P+24c)|W|^2\\
&+(3V^2+2VR_0+R_0^2)\overline B
+(8\overline V+4\overline{R_0})B\overline W\\
&+(8V\overline P+4R_0\overline P+20\overline cV)\overline W.
\end{aligned}\tag{25.2}
\]

The two omitted terms have zero expectation by first/third-chaos orthogonality:
8c E Re(V conjugate(R_0)) and 4 conjugate(c) E[R_0 conjugate(W)].

### What conditioning alone does establish

| component or class | statement supplied by conditioning |
|---|---|
| XP, arbitrary complex quadratic P | R23 closes the content inequality on the rectangle. |
| cX(R-2)+XP | R24 proves remote domination and the exact deficit/content decompositions; shared-A content remains open. |
| conjugate(X) B alone | C_X = 0 by phase; in fact every holomorphic first-chaos coefficient is zero. Conditional Gaussianity also gives remote domination. |
| X² conjugate(W) alone | C_X = 0 by phase, and all holomorphic first-chaos coefficients vanish. Conditional Gaussianity in W gives remote domination. |
| (R-1)V and/or R_0, with no odd X-phase terms | C_X = 0 by evenness in X. This says nothing by itself about content in the Y directions. |
| frequency-zero terms together with X² conjugate(W) | C_X = 0 by evenness; a remote bound for the full sum is still a separate question. |
| conjugate(X) B + X² conjugate(W), with no other terms | C_X = 0 by the mod-3 phase symmetry. This is directional, not a general full-projection assertion. |
| arbitrary mixtures of the listed shells | The cross terms in (25.1) survive. They are not automatically absorbed by the existing scalar weighted Cauchy–Schwarz argument. |

For example

\[
q=\overline X Y^2+(|X|^2-1)Y
\]

has no XP or self-interaction part, but

\[
\mathbb E[\overline Xq^2\overline q]
=\mathbb E[R(R-1)^2]\mathbb E|Y|^4=3\cdot2=6.
\]

`check_shells.mjs` verifies this with exact Gaussian polynomial moments.
The interaction e_r² conjugate(b_r) is responsible. Thus dismissing the
conjugate-X and radial-linear shells by averaging the X phase would be false.

There is one useful mixed-shell potential bound that does not yet control
content: for q = XP + conjugate(X)B, conditional on Y its Gaussian law may be
improper, but averaging theta and using concavity of Phi gives
F(q) <= E B(|P|²+|B|²) <= B(E|P|²+E|B|²). Its mixed content coefficient still
contains 4 E[P|B|²], so the same potential comparison does not eliminate B in
the content argument.
