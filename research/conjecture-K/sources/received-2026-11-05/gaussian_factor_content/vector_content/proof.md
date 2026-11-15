<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_content/vector_content/proof.md (file dated 2026-11-05). Only this line was added. -->
# Shared-A content for arbitrary Gaussian-factor cubics

## Result and scope

Let X=(X_1,...,X_m) and Y be independent standard complex Gaussian vectors.
Let A_1,...,A_m be arbitrary complex matrices of the same size, with no
normality, commutativity, rank, dimension or covariance restriction. Set

\[
 P_j=Y^*A_jY-\operatorname{tr}A_j,\qquad q=\sum_{j=1}^m X_jP_j,
 \qquad u=\mathbb E|q|^2=\sum_j\|A_j\|_{HS}^2.
\]

For each of the peak, flank and upper rows of the supplied R23 certificate,
and 551/100000 <= u <= 463/10000, the enclosed certificate proves

\[
 \boxed{\|\Pi_{1,0}F_A(q)\|_2^2
 \le\frac{239}{1000}\,[B(u)-F(q)].}
\]

The scalar kernels and their analytic justification are inherited from the
supplied Hermitian/R23 certificate. The vector moment reduction below is new
to this note. The new scalar envelope inequalities have been checked using
exact rational arithmetic and the supplied outward kernel enclosures.
This is not a Lean proof. It does not settle general Conjecture K.

Using the supplied shell cost 6/25, this implies

\[
 \Lambda(q+(T-1)U)\le B(u)-u/\varepsilon
 -\frac1{240}[B(u)-F(q)]\le S
\]

for every remote holomorphic linear U in that cost theorem's amplitude range
(in particular E|U|^2 <= 0.0113 at the stated rows). U may share any X or Y
coordinates. This removes the covariance restriction for the entire
Gaussian-factor class with quadratic coefficients.

## 1. A vector quadratic-form moment inequality

Let H=(H_1,...,H_d) be any real vector of centered Hermitian quadratic forms
of the same standard complex Gaussian vector. Define

\[
 V=|H|^2,\quad M=\mathbb E HH^T,\quad u=\operatorname{tr}M,
 \quad\rho=\|M\|_{op},\quad\tau=\rho/u.
\]

For u>0, 0<tau<=1. We prove

\[
 \mathbb EV^3\le \frac{25u+100\rho}{3}\mathbb EV^2
 -\frac{22}{3}u^3-44u\operatorname{tr}(M^2)
 -\frac{176}{3}\operatorname{tr}(M^3).                 \tag{1}
\]

For a scalar centered Hermitian quadratic form K, with variance v, diagonalize
its matrix and write K=sum lambda_i(E_i-1), with independent unit exponentials.
Writing s_k=sum lambda_i^k gives

\[
 \mathbb EK^4=3v^2+6s_4,\quad
 \mathbb EK^6=15v^3+90vs_4+40s_3^2+120s_6.
\]

Since s_3^2<=v s_4 and s_6<=v s_4,

\[
 \mathbb EK^6\le\frac{125}{3}v\mathbb EK^4-110v^3.       \tag{2}
\]

Introduce an independent standard REAL Gaussian vector g in R^d. Apply (2)
to g dot H for every fixed g, with variance g^T M g, and integrate over g.
Elementary real Gaussian moments give

\[
 \mathbb E_g(g\cdot H)^6=15V^3,
\]
\[
 \mathbb E_g[(g^TMg)(g\cdot H)^4]
 =3uV^2+12V H^TMH,
\]
\[
 \mathbb E_g(g^TMg)^3
 =u^3+6u\operatorname{tr}(M^2)+8\operatorname{tr}(M^3).
\]

Consequently, before estimating H^TMH, we obtain

\[
 \mathbb EV^3\le\frac{25}{3}u\mathbb EV^2
 +\frac{100}{3}\mathbb E[V H^TMH]
 -\frac{22}{3}u^3-44u\operatorname{tr}(M^2)
 -\frac{176}{3}\operatorname{tr}(M^3).
\]

Use H^TMH<=rho V to prove (1). Since tr(M^k)>=rho^k for k=2,3,
Y_0=V/u satisfies

\[
 \mathbb EY_0=1,\qquad
 \mathbb E[Y_0^3-\alpha(\tau)Y_0^2]\le-\beta(\tau),     \tag{3}
\]

where

\[
 \alpha(t)=\frac{25+100t}{3},\qquad
 \beta(t)=\frac{22}{3}+44t^2+\frac{176}{3}t^3.
\]

The proof does not require the Hermitian matrices defining H to commute.
To apply it to complex P, take H=(Re P_1,Im P_1,...,Re P_m,Im P_m).
Every component is a centered Hermitian quadratic form. In particular M here
is the real covariance matrix, not the complex covariance matrix E PP*.

## 2. Full first-chaos content and directional variance

Conditionally on Y, q is proper complex Gaussian of variance V=sum |P_j|^2.
Therefore, with the notation of the supplied certificate,

\[
 F(q)=\mathbb EB(V),\qquad
 c_j=\mathbb E[\overline X_j F_A(q)]=\tfrac12\mathbb E[P_jJ(V)].
\]

All Y-direction first-chaos coefficients vanish: rotating all X_j by a common
phase rotates F_A(q) by that phase. Thus C=||Pi F_A(q)||=||c||.
If c=0 the desired inequality follows from concavity of B. Otherwise choose
complex a with ||a||=1 and a*c=C real. Then h=Re(a*P) is a real linear
functional of H of Euclidean norm one, so

\[
 h^2\le V,\qquad\mathbb Eh^2\le\rho,\qquad\mathbb Eh=0.
\]

Let d_u(v)=B(u)+B'(u)(v-u)-B(v)>=0 and Delta=E d_u(V)=B(u)-F(q).
Subtract J(u) using E h=0 and apply weighted Cauchy--Schwarz:

\[
 C^2\le\Delta\,\mathbb E\left[\frac{Z_0}{Y_0}R_u(Y_0)\right],
 \quad Z_0=h^2/u,
\]

where

\[
 R_u(y)=\frac{uy[J(uy)-J(u)]^2}{4d_u(uy)},\quad
 0\le Z_0\le Y_0,\quad\mathbb EZ_0\le\tau.
\]

At V=0 set Z_0/Y_0=0. At V=u the original numerator vanishes, and the
continuous extension of R gives a valid upper bound. If Delta=0, strict
concavity of B implies V=u almost surely and C=0, so this case is settled
without division.

## 3. Exact scalar certificates

Partition tau into [0,0.4], [0.4,0.41], ... , [0.99,1]. For each interval [l,h],
set alpha=alpha(h), beta=beta(l). Both functions are increasing; hence (3)
implies E(Y_0^3-alpha Y_0^2)<=-beta throughout the interval.

The rational coefficients in envelopes.json define

\[
 Q(y)=a_0+a_1y+a_3(y^3-\alpha y^2),\qquad a_3>0,\quad\gamma\ge0.
\]

verify.py checks, for all y>=0 and 0.00551<=u<=0.0463 at each of the three rows,

\[
 Q(y)\ge0,\qquad R_u(y)\le Q(y)+\gamma y,
\]

and checks the exact rational inequality

\[
 a_0+a_1-\beta a_3+\gamma h<239/1000.
\]

It follows that

\[
 \mathbb E[(Z_0/Y_0)R_u(Y_0)]
 \le\mathbb EQ(Y_0)+\gamma\mathbb EZ_0
 \le a_0+a_1-\beta a_3+\gamma h<239/1000.
\]

This completes the content theorem. All interval decisions use flint fmpq.
The supplied Arb kernel enclosures are reused, not regenerated in this run.
Their positive integral formulas and analytic justification are included in
kernel_proof.md; generate_kernels.py and kernels.py allow regeneration.

The exploratory scipy program only chooses rational envelope coefficients.
It is not part of the verification or a source of proof assertions.

## 4. Remaining gap

This theorem covers any number of Gaussian drivers and arbitrary jointly
dependent quadratic coefficients P_j(Y). It does not cover self-interaction
X_j(|X_j|^2-2), or arbitrary tensors in which a driver also occurs inside its
own coefficient. In particular it neither proves R26 nor the general
content envelope E'. Those remain necessary gaps in the proposed route to K.

## Replay

Install python-flint. Run `python verify.py peak`, `python verify.py flank`,
`python verify.py upper` from this directory. Regeneration of the scalar kernel
tables uses `python generate_kernels.py peak` (and analogously for other rows).
The coefficient search additionally uses numpy/scipy, but is unnecessary for
replaying the proof.

## Completed verification

| Row | Rational rectangles | Status |
|---|---:|---|
| peak | 1,600,321 | PASS |
| flank | 448,143 | PASS |
| upper | 94,933 | PASS |

The largest exact rational expectation cap is less than 0.238086; the theorem uses 0.239.
