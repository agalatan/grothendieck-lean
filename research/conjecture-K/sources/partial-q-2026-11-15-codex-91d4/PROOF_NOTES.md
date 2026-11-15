<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/partial-q-replacement/PROOF_NOTES.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Partial cubic replacement with the lower-chaos law retained

Agent-ID: **codex-91d4**. Refs #436. New author-only **P**, with
the explicitly identified **C** checks. For **claude-b9ee** to review.

The subsequent [anisotropic refinement](ANISOTROPIC_REFERENCE.md)
removes the covariance restrictions from the small-chi branch:
it proves the coupled bound with coefficient C0<19 for every
lower-sector amplitude. The comparison and regional proofs below
remain valid and are inputs to that stronger result.

## 1. Main comparison: arbitrary sharing, no odd diffusivity (P)

Keep the peak constants

```
a=699/1250, b=179/1250, p=2500/1891,
s=3/5, rho=5053/10000, d=s rho=15159/50000,
xi0=-s(r_A+rho r_B), c=0.
```

The genuine remote fields are q in H21, r_A,r_B in H10,
Q in H11 and P in H20, with arbitrary sharing. The constant nu
is complex. Write

```
u=E|q|^2>0, EA=E|r_A|^2, EB=E|r_B|^2,
x=E|Q|^2, y=E|P|^2, n=|nu|^2,
zeta=E[r_A conjugate(r_B)],
delta=E|q|^4-2u^2, chi=delta/u^2.
```

Let Ttrial(q) denote the user's explicit full trial with xi0 above
and c=0. Let Ttrial(q_G) be the same expression with q replaced
by q_G=sqrt(u)N_C, independent of ALL the original remote fields.
The lower-chaos joint law is unchanged. q_G is an auxiliary
comparison variable, not a claimed genuine cubic or an admissible
new variational direction. The genuine sectors are orthogonal, and
the replacement preserves their energies and the trial penalty.

Define the nonnegative scalar

```
H=(17/25)EA + (1+d^2)EB/2 + (3/5)d Re(zeta) + 5(x+y).
```

Then the dimension-independent comparison is

```
|Ttrial(q)-Ttrial(q_G)|
 <= sqrt(pi*u*chi/3) + (pi^6/864)^(1/4) sqrt(H) chi^(1/4). (R)
```

This bound holds without a smallness assumption on chi and without
the response caps; its usefulness depends on its size. Q,P and
their sharing with q and r_A,r_B are unrestricted. No fourth-moment
or Gamma smallness assumption on Q or P is made. The two nu channels
are kept in the exact identity below; (R) bounds them uniformly.
It is not the false assertion that marginal Gaussianity gives exact
independence or a sign-definite odd increment.

The mechanism is the partial-replacement step underlying a joint
Edgeworth approach. We do not expand or Gaussianize the lower law.
All its mixed dependence with q appears in an exact interpolation
integral, bounded here using contractions. The chi^(1/4) term agrees
with the earlier mixed-cumulant obstruction.

## 2. Exact paired projection (P)

Set T=|Z|^2 and L=Z(a+bT). Visible parity first turns the two norm
terms into |L+q+K+O|+|L+q+K-O|, where

```
K=(T-2/5)r_A+d r_B+Z^2 conjugate(r_B)/sqrt(2),
O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2).
```

Remote inversion flips q,r_A,r_B and fixes Q,P. In the second
expectation this gives |X+vnu-L|, while the first is |X+vnu+L|,
where X=q+K+ZQ+conjugate(Z)P and vnu=nu Z(T-2)/sqrt(2).
Global remote phase rotation fixes the visible phase, leaving
Z=sqrt(T): q,r_A,r_B have charge 1, Q charge 0 and P charge 2.

Use |z|=(pi/2) E_theta |Re(e^(-i theta)z)|. For each T,theta define

```
A=Re(e^(-i theta)q),
B1=Re(e^(-i theta)[(T-2/5)r_A+d r_B+T conjugate(r_B)/sqrt(2)]),
B2=sqrt(T) Re(e^(-i theta)(Q+P)), B=B1+B2,
ell=sqrt(T)(a+bT)cos(theta),
cnu=sqrt(T)(T-2)/sqrt(2)
                 [Re(nu)cos(theta)+Im(nu)sin(theta)],
psi(z)=|z+cnu+ell|+|z+cnu-ell|.
```

A lies in real chaos 3, B1 in chaos 1 and B2 in chaos 2. These
orders are orthogonal, but their values and derivatives need not
be independent. The norm sum is exactly
(pi/2) E_(T,theta) E psi(A+B), and the reference sum uses an
independent N_v in place of A, where v=u/2. Circularity gives

```
E A^2=v=u/2, kappa4(A)=3 delta/8.                 (1)
```

The real fourth cumulant is nonnegative by the third-chaos product
formula below, so delta>=0. No conditional expectation given q is
set to zero. In particular both real nu components remain in cnu.

## 3. Exact interpolation, with all mixed terms (P)

Use the standard isonormal real Gaussian derivative D. Only A is a
pure third-chaos variable. Write

```
tau=||DA||^2/3, Gamma=<DA,DB>/3,
A_t=sqrt(t)A+sqrt(1-t)N_v,
F(t)=E psi(A_t+B), 0<t<1.
```

N_v is independent of the original Gaussian space. For a smooth
test, differentiate in t and use Gaussian integration by parts
on N_v and the identity E[A f]=E<DA,Df>/3. This gives

```
F'(t)= (1/2) E[(tau-v+Gamma/sqrt(t))
                         psi''(A_t+B)].           (2)
```

For the actual nonsmooth paired absolute value, first average over
N_v. Put lambda=v(1-t) and S_t=sqrt(t)A+B. The second derivative
in (2) is the explicit Gaussian kernel

```
K_t(S_t)=2/sqrt(lambda) *[
 phi((S_t+cnu+ell)/sqrt(lambda))
 +phi((S_t+cnu-ell)/sqrt(lambda))].                (3)
```

The exact interpolation integral is therefore

```
E psi(A+B)-E psi(N_v+B)
 = (1/2) integral_0^1 E[(tau-v+Gamma/sqrt(t)) K_t(S_t)] dt. (4)
```

It retains ALL the mixed dependence. For example E Gamma=E AB=0,
but, for polynomial tests,

```
E[A B^k] = k E[Gamma B^(k-1)].                    (5)
```

Thus E Gamma B and E Gamma B^2 contain the mixed third and fourth
moments, and need not vanish. When E AB=0, those moments are also
the corresponding cumulants with one A and two or three B entries.
The checker exhibits both as nonzero and rejects omission of Gamma.
No univariate Edgeworth remainder is substituted for this joint term.

To see the two nu channels explicitly, differentiate (3) before
bounding it. The derivatives with respect to Re(nu), Im(nu) carry
respectively sqrt(T)(T-2)cos(theta)/sqrt(2) and
sqrt(T)(T-2)sin(theta)/sqrt(2), multiplying the derivative of K_t
with respect to cnu. These are two real kernels inside (4).
Neither is declared conditionally centered. Taking a uniform upper
bound for (3) charges both kernels; it does not drop a channel.

Since sup phi=1/sqrt(2pi),

```
|K_t| <= 4/[sqrt(2pi) sqrt(v(1-t))].
```

Let Delta_self=E|tau-v| and Delta_mixed=E|Gamma|. Integrating (4),
using integral_0^1 (1-t)^(-1/2)dt=2 and
integral_0^1 [t(1-t)]^(-1/2)dt=pi, yields

```
|E psi(A+B)-E psi(N_v+B)|
 <= sqrt(2/pi)/sqrt(v) [2 Delta_self+pi Delta_mixed]. (6)
```

For full rigor at the endpoints, apply this argument first to
psi convolved with N(0,epsilon^2). The bound above remains valid
because the total convolution variance is at least v(1-t).
Both displayed endpoint singularities are integrable. The smoothed
payoffs converge in expectation to psi by its Lipschitz bound.
Dominated convergence in (4) proves (4)--(6) for psi itself.
No positive auxiliary smoothing variance is retained and no
variance surcharge is incurred. No density or conditional Hessian
bound at the actual quadratic zeros is needed.

## 4. Explicit mixed contraction constants (P)

Write A=I3(f), B1=I1(g), B2=I2(h), with symmetric real kernels.
Put w1=E B1^2=||g||^2 and w2=E B2^2=2||h||^2. These are
per-projection variances. Our normalization is E I_k(f)^2=k!||f||^2.

We use the product and contraction identities in
[Nourdin--Rosinski, Section 2, equations (2.6)--(2.7)](https://arxiv.org/html/1112.5070v2#S2).
They allow different chaos orders and shared kernels. The
quantitative constants here are derived directly, not taken from
an asymptotic independence statement.

Let C2=||f contracted_2 f||^2 and
S1=||sym(f contracted_1 f)||^2. Renaming summation indices gives
||f contracted_1 f||^2=C2. The product formula gives

```
kappa4(A)=1296 C2+1944 S1,
Var(tau)=288 C2+216 S1 <= (2/9)kappa4(A).           (7)
```

For completeness, A^2 has chaos components I6(sym(f tensor f)),
9 I4(sym(f contracted_1 f)), 18 I2(f contracted_2 f) and
6||f||^2. The first component's squared norm is
72||f||^4+648C2. Subtracting 3(6||f||^2)^2 from E A^4 proves
the first line of (7). The nonconstant components of tau are
3 I4(sym(f contracted_1 f)) and 12 I2(f contracted_2 f),
giving the second line. Thus, by (1),

```
Delta_self <= sqrt(Var(tau)) <= sqrt(delta/12).    (8)
```

The mixed derivative separates orthogonally by parity:

```
Gamma1=<DA,DB1>/3 = I2(f contracted_1 g),
Gamma2=<DA,DB2>/3
 =2 I3(sym(f contracted_1 h))+4 I1(f contracted_2 h).
```

Here Gamma1 is in chaos 2, while Gamma2 is in chaoses 1 and 3.
Do not confuse these subscripts with the iterated-Gamma convention
of the previous packet. They label the two lower-chaos sectors.
Set c_f=||f contracted_2 f||<=sqrt(kappa4(A))/36 by (7).
The contraction identity and Cauchy--Schwarz give

```
||f contracted_1 g||^2 <= c_f ||g||^2,
||f contracted_1 h||^2 <= c_f ||h||^2,
||f contracted_2 h||^2 <= c_f ||h||^2.
```

For the second line use
||h contracted_1 h||<=||h||^2; for the third use
||f contracted_1 f||=c_f. Symmetrization cannot increase norm.
Consequently

```
E Gamma1^2 <= sqrt(kappa4(A)) w1/18,
E Gamma2^2 <= sqrt(kappa4(A)) (5/9) w2,
Delta_mixed <= kappa4(A)^(1/4) sqrt((w1+10w2)/18). (9)
```

The separate factors 2,24,16 in these calculations are also
verified by the exact tensor/Hermite checker. No independence
between f,g,h is used anywhere in (7)--(9).

## 5. Average the comparison and derive (R) (P)

Multiply (6) by pi/2, insert v=u/2, (1), (8),(9), and average
over T,theta. The self contribution is sqrt(pi delta/(3u)).
The mixed coefficient simplifies to
(pi^6/864)^(1/4) chi^(1/4), multiplying E sqrt(w1+10w2).

Angular averaging of the squared real projection, followed by the
exponential moments E T=1 and E T^2=2, gives exactly

```
E w1 = (17/25)EA+(1+d^2)EB/2+(3/5)d Re(zeta),
E w2 = (x+y)/2.
```

The cross terms between the first and second chaoses vanish by
degree, and E[Q conjugate(P)]=0 by phase charge. These statements
are unconditional orthogonality identities, not independence claims.
Hence E(w1+10w2)=H>=0. Jensen gives E sqrt(w1+10w2)<=sqrt(H),
which proves (R). For every u<=.041 we may use the rational bounds

```
sqrt(pi*u/3) < 26/125=.208,
(pi^6/864)^(1/4) < 103/100=1.03.                 (10)
```

The exact checker verifies (10) using fresh rational Machin bounds
for pi. This is a joint replacement estimate only. It proves no
signed scalar deficit D and uses none of codex-a7c4's deficit bounds.

## 6. Retained-law reference bound and outward integration (P+C)

The lower law in Ttrial(q_G) can be non-Gaussian. It is enough that
q_G is independent of it. For any l,q_G,D, the parallelogram and
square-root tangent inequalities give

```
E[|l+q_G+D|+|l+q_G-D|]
 <=2 E|l+q_G|+E|D|^2 E|l+q_G|^(-1),              (11)
```

where independence is used only to factor the final expectation.
In our reference take D=K+sqrt(T)(Q+P)+vnu. Symmetry of q_G
puts its paired expression into (11). Averaging the genuine lower
law in |D|^2 keeps the A/B covariance. First/second-chaos cross
terms vanish by degree, and the Q/nu term vanishes only after this
FULL remote average because E Q=0. The comparison error (R) has
already charged the actual shared dependence; it is not omitted.

For T exponential and u in [.040,.041], let

```
M(T,u)=sqrt(pi/u) exp(-z)I0(z), z=T(a+bT)^2/(2u),
IA=E(T-2/5)^2M, IB=E(T^2/2+d^2)M,
IO=E T M, IN=E T(T-2)^2 M/2, IC=E(T-2/5)M.
```

This M is exactly E|sqrt(T)(a+bT)+q_G|^(-1), as obtained by radial
Gaussian integration. Fresh outward integration certifies uniformly

```
IA<1, IB<1.03, IO<1.25, IN<1.06, |IC|<.20.      (12)
```

The new u interval starts at .040, not the previous smoothed .0402.
`verify_reference.py` recomputes all four moments E T^k M,
k=0,1,2,3, at ten centers .04005,...,.04095, with cell radius
1/20000. It uses Arb analytic quadrature on [0,64] at 128 bits.
The entire scaled I0 function is used, and every imaginary ball
must contain zero. Each positive moment tail is enclosed by

```
9 exp(-64) k! sum_{j=0}^k 64^j/j!.
```

Indeed M<=sqrt(pi/u)<9. Tail intervals are added before signed
moment combinations are formed. The uniform derivative bound is
|partial_u M|<=sqrt(pi)/(2u^(3/2))<111: represent
exp(-z)I0(z) as E exp[-z(1-cos alpha)] and use
0<=z(1-cos alpha)exp[-z(1-cos alpha)]<=1/e<1/2.
The five integrals of absolute weights are bounded respectively
by 34/25,1+d^2,1,1,7/5. Multiplying by 111/20000 covers each
whole energy cell. No saved floating quadrature values are inputs.

Let B(u)=2E|L+sqrt(u)N_C| and use only the defining benchmark
inequality B(u)-pu<=S. Combining (11),(12) with the trial penalty,
set

```
alpha=34/25-p,
beta=p-(9/25)rho^2-103/100,
gamma_o=p-5/4, gamma_n=p-53/50,
r=Re(zeta),
Kref=alpha EA-beta EB-gamma_o(x+y)-gamma_n n
                         +2(9/25)rho r+(2d/5)|r|.
```

All four scalar coefficients alpha,beta,gamma_o,gamma_n are positive.
The last two terms upper-bound 2(s^2 rho+d IC)r for BOTH signs of r.
For r<=0 this contribution is nonpositive, since
2(s^2 rho-d/5)>0. Therefore the general scalar criterion is

```
Ttrial(q) <= S+Kref+sqrt(pi*u*chi/3)
                 +(pi^6/864)^(1/4)sqrt(H)chi^(1/4), u in [.04,.041]. (J)
```

Any genuine tuple under the response caps whose right-hand excess
is strictly below 1e-4 satisfies the desired all-sector target.
Criterion (J) itself does not impose a fixed chi cutoff. It has no
odd diffusivity requirement or additional sharing hypothesis.
It is sufficient, not asserted necessary, and does not certify
every tuple in the original caps.

## 7. Three explicit regions under the original caps (P+C)

Write o=x+y. The following closed rectangles are certified using
(J). Except for the stated sign condition in region II, all driver
covariances and all sharing with q,Q,P are allowed.

| Parameter | I: B-dominant | II: larger A | III: larger nu |
|---|---|---|---|
| u | [.040,.041] | [.040,.041] | [.040,.0405] |
| EA | [0,.0011] | [0,.0085] | [0,.003] |
| EB | [.0075,.0085] | [.0015,.0025] | [.0035,.004] |
| o | [.0035,.0045] | [.0035,.0045] | [.0015,.002] |
| n | [.0009,.0011] | [.0009,.0011] | [.0135,.014] |
| Driver covariance | unrestricted | Re(zeta)<=0 | unrestricted |
| chi(q) | <=1e-10 | <=8e-11 | <=1e-7 |
| Certified trial | <S+90e-6 | <S+71e-6 | <S-200e-6 |

All are strictly below S+1e-4, at the unchanged xi0 and global c=0.
There is no Gaussianity assumption on Q,P in this table. The real
and imaginary components of nu can have any phase at the stated n.

For region I use |zeta|<.00306; for III use |zeta|<.003465.
In II its real part is nonpositive. This gives upper H values
below .169^2, .173^2 and .122^2 respectively. Exact rational
upper bounds for (sqrt(chi),chi^(1/4)) are respectively
(.00001,.003163), (.000009,.003), (.000317,.018).
Together with (10) these are all the replacement-error constants.

The exact final excess bounds are approximately

```
I:    +.0000897448153903,
II:   +.0000707728967861,
III:  -.000223754911878.
```

These displays are not acceptance data; `verify_budget.py` keeps
every comparison rational. The respective maximum weighted energies
are 503/13125,617/17500,547/12000, all strictly below a freshly
checked lower bound .045642545084 for
(1891/2500)^2(pi/4-(21/25)^2). The total energy is below .080051.
The maximum W values are .0056,.0056,.016, all below .02.
No strengthened penalty or extra consumer allowance is used.

## 8. A shared example genuinely outside the old joint gauges (P+C)

Let Y1,Y2,Z2,...,Zm be independent proper complex Gaussians and
q0(Y)=Y(|Y|^2-2). Put

```
q_m=[q0(Y1)+sum_{j=2}^m q0(Zj)]/(7 sqrt(m)), m=10^12,
r_A=(Y1+Y2)/16, r_B=-Y1/24,
Q=(|Y1|^2-1)/25, P=Y1^2/32, nu=(1+i)/45.
```

Only q is diffused. Q and P keep fixed rank-one, non-Gaussian laws.
Every sector shares Y1, r_A,r_B are nonproportional, and both nu
components are nonzero. Exact exponential moments give
E|q0|^2=2 and E|q0|^4=176. Therefore

```
u=2/49, chi(q_m)=42/m,
(EA,EB,x,y,n)=(1/128,1/576,1/625,1/512,2/2025),
zeta=-1/384.
```

This lies in region II, with no independence assumption among the
sectors. It is not the previous construction which replicated all
five fields together. In fact it fails the previous small-joint-Gamma
fourth-cumulant condition, as follows.

At T=1,theta=0 the projected lower field has the form

```
G=h X+(3/80)Z+(57/800)H2(X)+(7/800)H2(Y),
h=3/80-(d+1/sqrt(2))/24 in (-.005,-.004),
H2(X)=X^2-1/2,
```

with independent real X,Y,Z of variance 1/2. Its fourth cumulant
is at least 3[(57/800)^4+(7/800)^4]. To check this, diagonalize
the real quadratic part: for independent standard normals, the
fourth cumulant of linear+centered quadratic is
48 tr(H^4)+48 g^T H^2 g, so the extra linear term cannot lower it.
Its variance is bounded above by the gvar expression in the checker,
which is below .01, so ||G||4<.3 by degree-two hypercontractivity.

The shared cubic contribution is c Re(q0(Y1)), c=1/(7*10^6).
The exact fourth moment of Re(q0) is 66, so its L4 norm is below 3
and ||c Re(q0)||4<5e-7. Hölder and the binomial expansion bound the
change in fourth moment by
4ab^3+6a^2b^2+4a^3b+a^4 with a=5e-7,b=.3.
The variance correction in the fourth cumulant is bounded by
6 gvar c^2+3c^4, since the cubic is orthogonal to G.
The remaining independent cubic blocks have nonnegative fourth
cumulants. The checker verifies that this strict lower bound
exceeds 118098 v_total^2/10^12, the previous joint-gauge allowance.
The ratio exceeds one million. Thus the new example is demonstrably
outside the earlier sufficient subclass while satisfying the new
bound. This does not refute the earlier theorem.

To separate this gain from the change of energy rectangle, keep
the same q_m,Q,P,nu and instead set r_A=Y1/32,
r_B=(Y1+Y2)/16. This example lies INSIDE the previous B-dominant
energy box. It has zeta=1/512 and is certified by region I, but
still fails the old joint fourth-cumulant gauge. At T=1,theta=0
its two linear coefficients are below .082 and .064; the same
argument gives gvar<.01. The exact checker verifies a fourth
cumulant more than 500000 times the old gauge allowance. Thus
the new theorem really admits non-diffuse odd fields in the old
energy range, as well as adding the other two regions.

Region III also has a direct finite family: choose u=.0403448,
m=10^9, q=sqrt(u/(2m)) times the same sum of q0 blocks, and take
EA=.0028, EB=.0038, x=.0008, y=.001, n=.0138. Use
r_A=sqrt(EA)Y1, r_B=sqrt(EB/2)(Y1+Y2),
Q=sqrt(x)(|Y1|^2-1), P=sqrt(y/2)Y1^2,
nu=sqrt(n/2)(1+i). Here chi=42/m<1e-7, the A/B covariance is
positive and the odd laws remain fixed and non-Gaussian.
The construction is analytic; no huge array is allocated.

## 9. Remaining gap and ownership

The comparison (R) is valid for every shape, but the certified
rectangles use an explicit small marginal-q cumulant. The original
energy caps alone do not force that condition: the unreplicated
same cubic has chi=42 at the same energy. The checker's caps-only
control rejects it. No statement is made that this violates the
actual trial target.

The subsequent anisotropic refinement covers the old hard energies
(.0403448,.008,.002,.002,.002,.001) for chi<=2.5e-9 with arbitrary
A/B covariance, and all allocations for chi<=2.5e-11. General
large-chi cubic cores remain open; the original caps do not force
either cutoff. Thus the full general A/B odd-energy gap is still OPEN.

No signed scalar deficit was derived or spent. codex-a7c4 retains
that task and compact(P). codex-8d2f retains W>=.02. These new
analytic claims and scoped certificates are author-only until
claude-b9ee reviews them.
