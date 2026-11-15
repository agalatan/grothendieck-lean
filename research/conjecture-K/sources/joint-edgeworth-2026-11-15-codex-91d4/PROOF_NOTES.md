<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/joint-edgeworth-continuation/PROOF_NOTES.md, 15 November 2026; Agent-ID: codex-91d4. -->
# A finite joint Edgeworth bound for the paired trial

Agent-ID: **codex-91d4**. Refs #436. Author-only **P**, with the
separately identified **C** checks. Independent review is pending.

## 1. Statement, normalization and scope

All complex Gaussians below are proper with E|Y|^2=1. Put

```
a=699/1250, b=179/1250, p=2500/1891,
s=3/5, rho=5053/10000, d=s*rho=15159/50000,
L=Z(a+b|Z|^2), xi0=-s(A+rho B), c=0.
```

The genuine remote fields are q in H21, A,B in H10, Q in H11,
P in H20, with arbitrary sharing, and nu is a complex constant.
Write their energies as u, EA, EB, x, y, n=|nu|^2, respectively.
The original sectors, including the visible ones, are orthogonal, so
||G||^2=u+EA+EB+x+y+n. The explicit trial is

```
Ttrial = s^2 E|A+rho B|^2 - p(u+EA+EB+x+y+n)
         + E|L+G-xi0| + E|L-G+xi0|.                 (1)
```

The retained infimum is at most (1). No reoptimization, random visible
coefficient, response-penalty strengthening, (P) premise or scalar
remote deficit is used in this packet. Let
B(u)=2 E|L+sqrt(u) N_C| for an independent proper complex Gaussian.
We use the defining benchmark inequality B(u)-pu<=S, only at
u in [.0402,.0412]. No numerical value of S is an acceptance input.

Sections 2--5 prove a finite-error criterion for (1) for every finite
dimension and arbitrary sharing whenever u>0. Sections 6--8 prove a
restricted quantitative consequence. They do **not** infer small joint
contractions from the response caps. The case u=0 and the complement
of the additional hypotheses are not certified by this packet.

## 2. Exact scalar projection of the full joint law (P)

Visible parity turns the pair of norm terms into

```
E[|L+q+K+O|+|L+q+K-O|],
K=(T-2/5)A+d B+Z^2 conjugate(B)/sqrt(2), T=|Z|^2.
```

Remote inversion Y -> -Y flips q,A,B and preserves Q,P. Thus, for
fixed Z, writing X=q+K+ZQ+conjugate(Z)P and
vnu=nu Z(T-2)/sqrt(2), the pair equals

```
E_remote[ |X+vnu+L|+|X+vnu-L| ].                  (2)
```

This is a distributional substitution in the second expectation;
it does not assume any conditional mean is zero. Global remote phase
invariance lets us set Z=r=sqrt(T) in (2). In detail, q,A,B have
phase charge 1, Q charge 0 and P charge 2; rotating the remote
Gaussians by the visible phase makes every term in (2) acquire the
same harmless unit factor.

Use |z|=(pi/2) E_theta |Re(e^(-i theta)z)| with theta uniform on
[0,2pi). Define

```
F=F_(T,theta)
 = Re(e^(-i theta)[q+(T-2/5)A+d B+T conjugate(B)/sqrt(2)
                          +sqrt(T)(Q+P)]),
ell=sqrt(T)(a+bT) cos(theta),
cnu=sqrt(T)(T-2)/sqrt(2)
             *[Re(nu)cos(theta)+Im(nu)sin(theta)],
psi(z)=|z+cnu+ell|+|z+cnu-ell|.
```

F is centered and lies in the sum of real chaoses 1,2,3. Exactly,

```
Ttrial=s^2 E|A+rho B|^2-p(u+EA+EB+x+y+n)
                           +(pi/2) E_(T,theta) E_remote psi(F). (3)
```

Both nu channels remain in cnu; no replacement by |nu| is made in
(3) or its expansion. When nu=0, psi is even, and its Gaussian third
derivative average vanishes. The squared third-cumulant term need
not vanish. For nonzero nu even that first cancellation cannot be
assumed. In particular E Q=0 does not justify deleting conditional
Q/nu interactions before the joint average.

Let zeta=E[A conjugate(B)] and v=E F^2. An explicit variance formula is

```
C=u+(T-2/5)^2 EA+(d^2+T^2/2) EB
       +2(T-2/5)d Re(zeta)+T(x+y),
J=sqrt(2)T[(T-2/5)zeta+d EB]+T E[Q^2],
v=(C+Re(e^(-2i theta)J))/2 >= u/2.                (4)
```

Remote phase and chaos orthogonality justify exactly these second
moments. They do not eliminate higher mixed cumulants. If F is written
as a real linear combination of the real and imaginary field
coordinates, kappa_j(F) is the contraction of the **full** joint
jth cumulant tensor with those coefficients, without discarding any
mixed entries. The operations below act on this F itself.

More explicitly, write F=U+V2, where U contains the first and third
chaoses and V2 the second chaos. Remote inversion makes U odd and
V2 even. Therefore

```
kappa3(F)=3 E[U^2 V2]+E[V2^3],
kappa4(F)=kappa4(U)+kappa4(V2)
                   +6(E[U^2 V2^2]-E[U^2]E[V2^2]).
```

These are genuine mixed terms, not zero-mean simplifications. For
example, the derivative at nu=0 of the third-cumulant correction
in (6), after the outer pi/2, is

```
(pi/12) E_(T,theta) kappa3(F) sqrt(T)(T-2)/sqrt(2)
     * E[psi_(0,sigma)''''(N_v)]
     *[Re(nu)cos(theta)+Im(nu)sin(theta)].
```

Here psi_(0,sigma) is the smoothed paired test with cnu=0. This
displays the two separate real kernels in this correction. It is
not a formula for the derivative of the entire remainder and does
not assert that either averaged kernel vanishes.

## 3. Finite OU expansion, including kappa3 squared (P)

Fix (T,theta) temporarily. The following applies to any centered
real Gaussian polynomial F with variance v>0. Use the isonormal
normalization of the Gaussian derivative D and OU generator L0.
Define

```
Gamma1=F,
Gamma_r=<DF, -D L0^(-1)(Gamma_(r-1)-E Gamma_(r-1))>, r>=2.
Delta2=E|Gamma2-v|, Delta4=E|Gamma4|, Delta5=E|Gamma5|.
```

Our indexing is one more than the usual Gamma_0=F convention.
Gaussian integration by parts gives E Gamma_r=kappa_r/(r-1)!.
For mixed chaoses Gamma2 is generally **not** ||DF||^2/3.
For finite polynomials all the required moments exist. These
identities are the general (not fixed-chaos-only) formulas of
[Nourdin--Peccati, Theorem 4.3](https://arxiv.org/html/0910.1996v1#S4),
also used in [Bierme--Bonami--Nourdin--Peccati, Section 3.3](https://arxiv.org/html/1109.1546v1#S3.SS3).
The explicit constants below are derived here, not imported as an
unspecified asymptotic Edgeworth constant.

For a smooth test h let

```
U_h(z)=-integral_0^infinity [P_t^v h(z)-E h(N_v)] dt,
P_t^v h(z)=E h(e^(-t)z+sqrt(v(1-e^(-2t)))N).
```

Then (v d^2/dz^2-z d/dz)U_h=h-Eh(N_v). Repeated integration by
parts on the original remote Gaussian space gives

```
D_h := E h(F)-E h(N_v)
 = -kappa3/2 E U_h'''(F)-kappa4/6 E U_h''''(F)
                                      -E Gamma5 U_h^(5)(F). (5)
```

Apply the same identity one stage shorter to g=U_h''':

```
D_g=-kappa3/2 E U_g'''(F)-E Gamma4 U_g''''(F).
```

Gaussian invariance implies E U_h^(j)(N_v)=-E h^(j)(N_v)/j.
In particular E U_(U_h''')'''(N_v)=E h^(6)(N_v)/18. Substitution
into (5) gives the exact finite expansion

```
E h(F) = E h(N_v) + kappa3/6 E h'''(N_v)
          +kappa4/24 E h''''(N_v)
          +kappa3^2/72 E h^(6)(N_v) + R_h,          (6)

R_h = -E Gamma5 U_h^(5)(F) -(kappa4/6)D_(U_h'''')
       +(kappa3/2)E Gamma4 U_(U_h''')''''(F)
       +(kappa3^2/4)D_(U_(U_h''')''').
```

The first-order Stein identity and semigroup derivative bound give
|D_g|<=Delta2 ||g''||_infinity/2. Consequently

```
|R_h| <= Delta5 ||U_h^(5)||
       +|kappa4|Delta2 ||U_h^(6)||/12
       +|kappa3|Delta4 ||U_(U_h''')^(4)||/2
       +kappa3^2 Delta2 ||U_(U_h''')^(5)||/8.         (7)
```

All norms in (7) are supremum norms. This derivation never assumes
that kappa4(F) is nonnegative; F is a mixture of chaoses. The exact
Hermite checker verifies the Gamma normalization and (6), including
its signed remainder, on polynomial tests of degrees 2 through 8.
It rejects omission of either mixed cumulants or the third-square
term. These finite checks supplement, rather than prove, the
general analytic statement.

## 4. Uniform smoothing and singular regions (P)

Set h=psi_sigma=E psi(z+sigma N), with sigma>0. Convexity gives
psi<=psi_sigma. Thus (6) yields an **upper bound** for the actual
payoff without paying a separate Lipschitz error O(sigma). The
Gaussian reference in (6) includes the smoothing variance; it is
not the unsmoothed reference.

For k>=2, Gaussian convolution gives

```
||psi_sigma^(k)|| <= 4 c_(k-2) sigma^(1-k),
c_j=sup |phi^(j)| <= (1/(2pi))integral_R |t|^j exp(-t^2/2) dt.
```

The needed upper constants are c1<=1/pi, c2<=1/sqrt(2pi),
c3<=2/pi, c4<=3/sqrt(2pi), c5<=8/pi and
c6<=15/sqrt(2pi). Fourier inversion proves these bounds directly.
The constants are uniform in ell,cnu, including all quadratic zeros.

Retain the Gaussian smoothing in the OU integrals instead of using
only the unsmoothed derivative suprema. For k>3,

```
||U_h^(k)|| <= 4 c_(k-2)/2 * integral_0^1
         y^(k/2-1)[sigma^2+v(1-y)]^(-(k-1)/2) dy.
```

Dropping the positive power of y and extending 1-y to [0,infinity)
proves

```
||U_h^(5)|| <= 4/(pi v sigma^2),
||U_h^(6)|| <= 4/(sqrt(2pi) v sigma^3).
```

For the nested resolvents, their two time integrals combine into

```
||U_(U_h''')^(j)|| <= (4 c_(j+1)/6) integral_0^1
  y^(j/2-1)(1-y^(3/2))[sigma^2+v(1-y)]^(-(j+2)/2) dy.
```

Use 1-y^(3/2)<=3(1-y)/2 and extend as above. The two elementary
integrals are integral_0^infinity z(sigma^2+vz)^(-3)dz
=1/(2v^2 sigma^2) and its exponent-7/2 version
=4/(15v^2 sigma^3). Therefore

```
||U_(U_h''')^(4)|| <= 4/(pi v^2 sigma^2),
||U_(U_h''')^(5)|| <= 4/(sqrt(2pi) v^2 sigma^3).
```

Combining with (7), the explicit finite error is

```
Rbound = 4 Delta5/(pi v sigma^2)
       + |kappa4|Delta2/(3sqrt(2pi) v sigma^3)
       + 2|kappa3|Delta4/(pi v^2 sigma^2)
       + kappa3^2 Delta2/(2sqrt(2pi) v^2 sigma^3).   (8)
```

For a directly computable signed correction, put tvar=v+sigma^2,
alpha_+=cnu+ell, alpha_-=cnu-ell. The reference and derivatives are

```
E h(N_v) = sum_{alpha=alpha_+,alpha_-}
  [sqrt(2 tvar/pi) exp(-alpha^2/(2tvar))
                         +alpha(2Phi(alpha/sqrt(tvar))-1)],
E h^(k)(N_v) = sum_alpha 2 tvar^((1-k)/2)
   (-1)^(k-2) H_(k-2)(alpha/sqrt(tvar)) phi(alpha/sqrt(tvar)), k>=2.
```

Equations (3),(6),(8), averaged over T,theta, are the general
joint criterion. They retain the two nu components and all sharing
terms. No dimension-dependent joint density or inverse Malliavin
covariance is required. On the energy box below v>=.02, so every
denominator in (8) is uniformly nonzero. Gaussian tails are treated
analytically; there is no excluded event near a zero of the actual
polynomial profile.

## 5. A Gaussian reference bound without a scalar deficit (P)

For fixed T, construct a centered complex Gaussian X_G with the
same real covariance as X. It can be decomposed as
sqrt(u)N_C+D_G, with N_C independent of D_G. Indeed the genuine
third-chaos q is orthogonal to the lower chaoses and circular.
The first-chaos part and the Gaussian replacement for the second
chaos can also be taken independent; this is a construction of the
reference law, not an assertion about the genuine shared fields.

Adding the projection smoothing sigma^2 amounts to replacing u by
u_s=u+2sigma^2 in this Gaussian reference. The elementary paired
norm inequality, applied with independent Gaussian q_G and D_G, is

```
E[|L+q_G+D_G+vnu|+|L+q_G-D_G-vnu|]
 <= 2 E|L+q_G| + E|D_G+vnu|^2 E|L+q_G|^(-1).
```

It follows first from the parallelogram estimate and then the tangent
inequality for sqrt. Symmetry of q_G rewrites its left side as the
Gaussian reference of (2). Let

```
M(T,u_s)=E|sqrt(T)(a+bT)+sqrt(u_s)N_C|^(-1)
 =sqrt(pi/u_s) exp(-z) I0(z), z=T(a+bT)^2/(2u_s).
```

Define, with T exponential of mean one,

```
IA=E(T-2/5)^2 M, IB=E(T^2/2+d^2)M,
IO=E T M, IN=E T(T-2)^2 M/2, IC=E(T-2/5)M.
```

The resulting reference trial bound is

```
S+2p sigma^2 + (s^2+IA-p)EA + (s^2 rho^2+IB-p)EB
     +(IO-p)(x+y)+(IN-p)n+2(s^2 rho+d IC)Re(zeta). (9)
```

Here B(u_s)-pu_s<=S accounts for the Gaussian remote baseline
exactly. The positive 2p sigma^2 in (9) is essential. No signed
deficit D, energy slack or pre-existing odd allowance has been spent
again. Arbitrary phases of zeta are allowed by the estimates below.

## 6. Uniform reference prices and tails (P+C)

Fix sigma=1/100 and the rectangle

```
u in [.040,.041], EA in [0,.0011], EB in [.0075,.0085],
x+y in [.0035,.0045], n in [.0009,.0011].           (10)
```

Thus u_s in [.0402,.0412]. The fresh outward integration certifies

```
IA<1, IB<1.03, IO<1.25, IN<1.06, |IC|<.20.       (11)
```

The integrator evaluates the four moments E T^k M, k=0,1,2,3,
at ten exact rational centers .04025,...,.04115. Each integral
on [0,64] uses python-flint/Arb complex analytic quadrature at
128 bits; exp(-z)I0(z) is entire. Real parts are enclosed and
imaginary balls must contain zero. There is no floating quadrature
tolerance accepted as a mathematical error estimate.

For the uniform extension, let f(z)=E_alpha exp(-z(1-cos alpha)).
Then 0<=f<=1, 0<=z E(1-cos alpha)exp(-z(1-cos alpha))<=1/e<1/2.
Differentiating M in u_s gives

```
|partial_(u_s) M| <= sqrt(pi)/(2 u_s^(3/2)) < 111.
```

The five integrals of absolute weights are at most
34/25, 1+d^2, 1, 1, 7/5 respectively. A cell radius of 1/20000
times these constants times 111 gives the uniform increment.
For T>=64, M<=sqrt(pi/u_s)<9. Each nonnegative moment tail is
enclosed between zero and

```
9 exp(-64) k! sum_{j=0}^k 64^j/j!.
```

These tail intervals are added **before** forming the signed moment
combinations. Thus cancellations in IA, IN and IC discard no tail.
The quadrature is the only external numerical library used.

The exact rational checker substitutes (11) in (9), uses
|zeta|<=sqrt(EA EB)<.00306, and obtains

```
Gaussian reference trial - S
 <= -375379062407/1891000000000000
  < -.0001985082297.                              (12)
```

The rectangle is strictly inside the unchanged response caps:
total<=.0562<.080051 and weighted energy<=503/13125
<.045642545084, a rational lower bound for
(1891/2500)^2(pi/4-(21/25)^2). Here W<=.0056<.02.
No independence among remote sectors is used in these cap checks.

## 7. An explicit small-joint-Gamma theorem (P+C)

Assume (10) and, for every T>=0 and theta, the following gauges
of the actual F from Section 2, for some epsilon<=10^(-6):

```
Delta2       <= 16 v epsilon,
|kappa3|     <= 844 v^(3/2) epsilon,
|kappa4|     <= 118098 v^2 epsilon^2,
Delta4       <= 39366 v^2 epsilon^2,
Delta5       <= 3188646 v^(5/2) epsilon^3.           (13)
```

These are additional quantitative joint hypotheses, not consequences
of caps or of a marginal q fourth moment. They permit arbitrary
sharing and arbitrary mixed-cumulant signs.

The real projection variance is bounded by

```
v <= u/2 + [sqrt(EA)(T+2/5)
               +sqrt(EB)(d+T/sqrt(2))]^2/2 + T(x+y)
  <= (1+T)^2/40.                                  (14)
```

The last polynomial comparison is checked coefficientwise with
sqrt(EA)<.034, sqrt(EB)<.093 and 1/sqrt(2)<177/250.
The factor 1/2 in the linear part follows by rotating the conjugate-B
term into a proper holomorphic linear projection and applying its
L2 triangle inequality. Different chaos degrees are orthogonal.
The quadratic projection variance is at most T E|Q+P|^2=T(x+y).
Using exponential moments in (14) yields

```
E sqrt(v)<=8/25, E v^(3/2)<=8/125, E v^2<=13/320.
```

Bound the signed Gaussian corrections in (6) absolutely using
tvar>=v and the derivative constants of Section 4. After including
the outer pi/2, their respective costs are at most

```
|kappa3|/(3v),
pi |kappa4|/[12sqrt(2pi) v^(3/2)],
pi kappa3^2/[12sqrt(2pi) v^(5/2)].
```

Substitution of (13), (14) and (8), with pi<22/7 and
sqrt(2pi)>5/2, gives these exact-rational upper costs:

| Term | Decimal display only |
|---|---:|
| Third cumulant | .000090026666667 |
| Fourth cumulant | .000000003959095 |
| Third cumulant squared | .000000023880217 |
| Gamma5 remainder | .000000004081467 |
| Fourth/Gamma2 remainder | .000000016083823 |
| Third/Gamma4 remainder | .000000021263939 |
| Third-squared/Gamma2 remainder | .000000145520069 |
| Sum | .000090241455275 |

Combining with (12), the exact upper excess is

```
-959683455386267/8864062500000000000
  < -.0001082667744 < -1/10000.
```

**Conclusion under (10),(13): Ttrial < S-10^(-4).** In particular
the desired S+10^(-4) cap holds, at c=0 and the prescribed xi0.
This is a direct absolute result; no(P) or scalar-deficit theorem
is a premise. The Gaussian tails and the actual quadratic zeros are
already covered by Sections 4 and 6.

## 8. Nonempty diffuse family with arbitrary sharing inside blocks (P)

For any centered real Gaussian polynomial F of degree<=3, variance v,
the Gamma recursion has degree Gamma_r<=r+2. Gaussian
hypercontractivity and orthogonality give

```
||DF||_(L4(H)) <= 3sqrt(3) sqrt(v),
||D(-L0)^(-1)(H-EH)||_(L4(Hspace))
                      <= 3^((degree(H)-1)/2) ||H-EH||_2.
```

For clarity, the vector bound follows by applying scalar
hypercontractivity componentwise and the L2 triangle inequality
to the sum of squares. The L2 derivative/inverse estimate follows
by expanding in chaoses: its squared weights are 1/k<=1.
Scalar hypercontractivity for a polynomial of degree at most d
gives ||H||4<=3^(d/2)||H||2; no fixed-degree assumption is needed.
Cauchy--Schwarz in L4 then proves

```
||Gamma2||2 <= 9sqrt(3) v < 16v,
||Gamma3||2 <= 243sqrt(3) v^(3/2) < 422v^(3/2),
||Gamma4||2 <= 19683 v^2,
||Gamma5||2 <= 1594323 v^(5/2).                    (15)
```

Now take m independent copies of the **whole joint remote block**
(q,A,B,Q,P), each with arbitrary internal sharing and satisfying
(10). Sum each of the five fields and divide by sqrt(m); leave nu
unchanged. Energies and covariances, and the genuine bidegrees,
are preserved. For every scalar projection,

```
F_m=m^(-1/2)sum F_j,
Gamma_r(F_m)=m^(-r/2)sum Gamma_r(F_j).             (16)
```

Disjoint derivative coordinates and the tensor-product OU generator
prove (16). Using the mean plus centered L2 norm in (16), (15) yields
all of (13) with epsilon=1/sqrt(m). In particular Delta4 is at most
19683v^2(m^(-1)+m^(-3/2)) and Delta5 at most
1594323v^(5/2)(m^(-3/2)+m^(-2)). The fourth and third cumulant
constants follow from kappa4=6E Gamma4 and kappa3=2E Gamma3.
Thus **every such block replicated m>=10^12 times** satisfies
the theorem. This enormous cutoff is deliberately conservative.
It is a finite nonempty subclass, not the unrestricted theorem.

One explicit block, with independent proper Y1,Y2, is

```
q=Y1(|Y1|^2-2)/7,
A=Y1/32, B=(Y1+Y2)/16,
Q=(|Y1|^2-1)/25, P=Y1^2/32, nu=(1+i)/45.
```

Its energies are (2/49,1/1024,1/128,1/625,1/512,2/2025),
with zeta=1/512. All fields share Y1, the A/B drivers are genuinely
nonproportional, and both nu components are nonzero. The exact
checker verifies its position in (10) and the caps. The expressions
are Wick-centered in the required bidegrees. Replication is a
mathematical construction; no trillion-dimensional array is formed.

The unreplicated same block supplies an exact warning against a
caps-only inference of (13). At T=0, theta=0 its projection is
Re(q)+(-1/80+d/16)Re(Y1)+(d/16)Re(Y2). The Hermite checker verifies
that its fourth cumulant exceeds 118098 v^2/10^12. Thus even (10)
and the original caps do not imply (13). Continuity gives the same
failure near this projection. This is not a counterexample to the
trial target; it identifies a limitation of the new sufficient test.

## 9. What remains open

The general finite criterion (3),(6),(8) is available for all
arbitrary-sharing inputs with u>0. The quantitative theorem proved
here uses the additional energy rectangle and joint gauges.
The old hard tuple (.0403448,.008,.002,.002,.002,.001) is outside
(10), and a near-Gaussian q marginal alone does not ensure (13).
Mixed cumulants can remain as large as chi^(1/4), as the preceding
assessment showed. No full-box Gaussianity or odd nonincrease is
claimed. No compact(P) cover or large-W work has been done here.

To enlarge this branch, the two useful targets are sharper signed
joint cumulant/contraction bounds and a sharper Gaussian reference
bound on the remaining A/B energy ratios. A scalar remote deficit
could participate only through an explicitly agreed joint accounting
inequality. That scalar task remains codex-a7c4's.
