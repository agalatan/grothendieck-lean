<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/PROOF_NOTES.md (16 November 2026); codex-91d4. Only this line was added. -->
# A centred, parity-sensitive partial Gaussian comparison

Agent-ID: **codex-91d4**. 16 November 2026. New author-only **P+C**.
Book consulted: Nourdin--Peccati (2012), Lemma 5.2.4, Lemma 6.2.1,
Theorem 8.2.5 and Theorems 8.4.3--8.4.4. The following inequalities
are our derivation, not claims attributed to the book. No book text
is copied into this packet.

## 1. Statement and normalization (P, with C constants below)

Keep a=699/1250, b=179/1250, p=2500/1891, rho=5053/10000,
d=3rho/5=15159/50000, xi0=-(3/5)(r_A+rho r_B), and global c=0.
The genuine fields are q in H21, r_A,r_B in H10, Q in H11,
P in H20, and nu constant, with completely arbitrary sharing.
Write

```
u=E|q|^2>0, EA=E|r_A|^2, EB=E|r_B|^2, V=EA+EB,
x=E|Q|^2, y=E|P|^2, o=x+y, n=|nu|^2, W=o+n,
zeta=E[r_A conjugate(r_B)], delta=E|q|^4-2u^2, chi=delta/u^2,
H1=(17/25)EA+(1+d^2)EB/2+(3/5)d Re(zeta).
```

Define the continuous increasing function

```
F(0)=0,
F(r)=2[r atanh(sqrt(1-r^2))+asin(r)]  for 0<r<1,
F(r)=pi                              for r>=1,
C=sqrt(5pi)/(2^(9/4) 3^(3/4)).
```

Let q_G be an independent proper complex Gaussian of variance u,
while all lower fields keep their original joint law. Then

```
|Ttrial(q)-Ttrial(q_G)|
 <= sqrt(pi*u*chi/12)
  +(1/2)(pi^6/864)^(1/4) sqrt(H1) chi^(1/4)
  +C chi^(1/4) sqrt(o) F(2sqrt(W/(e*u))).          (Rnew)
```

This comparison needs no amplitude, small-chi or sharing restriction.
The reference variable is auxiliary, not asserted to be a cubic.
Both nu components are retained. Every term with o=0 is interpreted
by continuity; it vanishes in the last line. H1 is nonnegative.

For u in [.040,.041], the fresh reference certificate proves

```
Ttrial(q_G) <= S-(43/200)V-(27/200)o-(69/200)n.   (Gnew)
```

Combining gives an explicit energy/cumulant criterion, valid at all
lower amplitudes on that u interval. Using rational constants,

```
Ttrial(q)-S
 <= .104 sqrt(chi)+.515 sqrt(H1) chi^(1/4)
    +C chi^(1/4) sqrt(o) F(2sqrt(W/(e*u)))
    -.215 V-.135 o-.345 n.                       (E)
```

The certified consequences are:

- chi<=1/50000000=2e-8: Ttrial<S+97e-6-.02V-.20n for every
  lower-sector amplitude and covariance.
- At the old hard energies
  (u,EA,EB,x,y,n)=(.0403448,.008,.002,.002,.002,.001),
  chi<=1/1000000=1e-6 gives Ttrial<S+40e-6 for every covariance.
- The former region III, specified in section 7, holds at chi<=1e-5.

These are additional cumulant hypotheses, not consequences of the
response caps. Scalar deficit, premise(P) and response strengthening
are not used. The general larger-chi problem remains open.

## 2. Exact interpolation and the book's contraction formulas (P)

Visible parity, remote inversion and a global remote phase rotation
turn the norm sum into the angular average of a real paired norm.
For T exponential and theta uniform, put

```
A=Re(exp(-i theta)q),
B1=Re(exp(-i theta)[(T-.4)r_A+d r_B+T conjugate(r_B)/sqrt(2)]),
B2=sqrt(T) Re(exp(-i theta)(Q+P)),
ell=sqrt(T)(a+bT)cos(theta),
cnu=sqrt(T)(T-2)/sqrt(2)
                      [Re(nu)cos(theta)+Im(nu)sin(theta)].
```

Here A,B1,B2 are in real chaoses 3,1,2. Let v=u/2 and
kappa=kappa4(A)=3delta/8, by circularity of q. The norm sum is
(pi/2)E[|A+B1+B2+cnu+ell|+|A+B1+B2+cnu-ell|].

On the real isonormal space, define

```
tau=||DA||^2/3,
Gamma1=<DA,DB1>/3, Gamma2=<DA,DB2>/3,
lambda=v(1-t), U_t=sqrt(t)A+B1, V2=B2+cnu,
K_t(s)=2/sqrt(lambda)[phi((s+ell)/sqrt(lambda))
                              +phi((s-ell)/sqrt(lambda))].
```

Gamma1 and Gamma2 denote sectors, not the book's indexed iterated
Gamma operators. Gaussian integration by parts, replacing only A
by sqrt(t)A+sqrt(1-t)N_v, gives exactly

```
Ttrial(q)-Ttrial(q_G)
 =(pi/4) E_(T,theta) integral_0^1 E_remote [
   (tau-v)K_t(U_t+V2)
  +(Gamma1+Gamma2)K_t(U_t+V2)/sqrt(t)] dt.         (I)
```

One can first smooth the paired absolute value and then pass to
the limit. The bound |K_t|<=4/[sqrt(2pi)sqrt(lambda)] makes the
two endpoint singularities integrable, as in the reviewed preceding
packet. The new bounds below are at most that bound, so preserve
the justification. All norms and penalties outside the two norm
terms are unchanged in the comparison.

For A=I3(f), B1=I1(g), B2=I2(h), normalized by
E I_k(f)^2=k!||f||^2, the product/contraction formulas give

```
kappa=1296||f contracted_2 f||^2
                  +1944||sym(f contracted_1 f)||^2,
Var(tau)=288||f contracted_2 f||^2
                  +216||sym(f contracted_1 f)||^2 <=2kappa/9,
Gamma1=I2(f contracted_1 g),
Gamma2=2I3(sym(f contracted_1 h))+4I1(f contracted_2 h).
```

With w1=E B1^2 and w2=E B2^2, contraction Cauchy--Schwarz gives

```
E Gamma1^2 <=sqrt(kappa) w1/18,
E Gamma2^2 <=sqrt(kappa) 5w2/9.                  (C)
```

For example ||f contracted_2 f||<=sqrt(kappa)/36 and the three
needed mixed contraction squares are at most this number times
||g||^2 or ||h||^2. The chaos isometries supply coefficients
2,24,16; w2=2||h||^2. This is Lemma 6.2.1 specialized without
discarding the different chaos orders. `algebra.py` independently
checks the tensor factors and nonzero mixed moments exactly.

The book's higher Gamma identities explain why E Gamma1=E Gamma2=0
does not eliminate mixed cumulants. In particular
E[A B^2]=2E[(Gamma1+Gamma2)B] and
E[A B^3]=3E[(Gamma1+Gamma2)B^2], for B=B1+B2. These are generally
nonzero. None is set to zero or replaced by a formal Edgeworth term.

## 3. Centre the kernel and use the mixed parity (P)

Write Kmax=4/[sqrt(2pi)sqrt(lambda)]. Since 0<=K_t<=Kmax and
E(tau-v)=E Gamma1=0, the self and first-chaos pairings satisfy

```
|E Y K_t(U_t+V2)| <= (Kmax/2) E|Y|,
                       Y=tau-v or Gamma1.        (H)
```

Subtract the deterministic midpoint Kmax/2 to prove (H).
This halves each of their previous bounds, without a sign claim.

Remote inversion sends A,B1 to their negatives and fixes B2.
Consequently Gamma2 is odd, U_t is odd and V2 is even. K_t is an
even function. Invariance of the remote Gaussian measure gives

```
E Gamma2 K_t(U_t+V2)
  =(1/2)E Gamma2[K_t(U_t+V2)-K_t(U_t-V2)].       (P)
```

In particular the mixed term remains present. Both nu components
are in V2. The range bound for the difference is Kmax/2 after
the factor 1/2, and the mean-value bound is
|V2| ||K_t'||_infinity. Since max|phi'|=1/sqrt(2pi e),

```
|E Gamma2 K_t(U_t+V2)|
 <= ||Gamma2||_2 min( 2/[sqrt(2pi)sqrt(lambda)],
                     4sqrt(w2+cnu^2)/[sqrt(2pi e)lambda]). (P2)
```

Use E V2^2=w2+cnu^2; only the unconditional E B2=0 is needed.
Taking the derivative estimate alone would give a divergent time
integral. The minimum with the range estimate is essential.

## 4. Integrate the minimum and average without losing amplitude (P)

For r>=0, direct integration at the switching point 1-t=r^2 gives

```
integral_0^1 t^(-1/2) min((1-t)^(-1/2),r/(1-t))dt = F(r).
```

If r<1, the first part is 2r atanh(sqrt(1-r^2)) and the terminal
part is 2asin(r). For r>=1 only the first range bound is active.
For 0<r<1,

```
F'(r)=2atanh(sqrt(1-r^2)),
F''(r)=-2/[r sqrt(1-r^2)],
F(r)-rF'(r)=2asin(r)>=0.                         (D)
```

Thus F is increasing and concave, joining the constant pi with
derivative zero. The function x->F(k sqrt(x))^2 is also concave
for any k>=0. For k=1, the sign of its second derivative is that of

```
r F'(r)^2+r F(r)F''(r)-F(r)F'(r)
 =-2asin(r)F'(r)-2F(r)/sqrt(1-r^2) <=0.
```

Rescale for general k and use continuity at 0 and 1. Consequently
Cauchy--Schwarz followed by Jensen gives

```
E sqrt(w2) F(k sqrt(w2+cnu^2))
 <=sqrt(E w2) F(k sqrt(E(w2+cnu^2))).             (J)
```

Average over T,theta. Orthogonality and the exponential moments give

```
E w1=H1, E w2=o/2, E cnu^2=n/2.
```

There is no conditional independence assertion here. Integrate (H)
using integral(1-t)^(-1/2)=2 and integral[t(1-t)]^(-1/2)=pi.
Insert (C), v=u/2, kappa=3u^2 chi/8 and (J) into (P2).
The self contribution is sqrt(pi*u*chi/12); the first-chaos
contribution is half the former coefficient times sqrt(H1).
The second-chaos coefficient is

```
(pi/4)*(2/sqrt(2pi))*v^(-1/2)
   *(3u^2 chi/8)^(1/4)*sqrt(5/9)*sqrt(o/2)
 = C chi^(1/4) sqrt(o),
```

with argument 2sqrt(W/(eu)). This proves (Rnew) at every amplitude.

## 5. Stronger directional reference (P+C)

Let l=sqrt(T)(a+bT), X=l+q_G, M=E|X|^(-1),
J=E[((Re X)^2-(Im X)^2)/|X|^3]. The reviewed two-sign inequality

```
|X+D|+|X-D|-2|X|
 <= |D|^2/|X|-(Re(conjugate(X)D))^2/(2|X|^3)
```

follows by normalizing X=1 and using the ellipse through 1+D and
1-D. Averaging the independent Gaussian X gives
(3/4)M E|D|^2-(1/4)J Re E D^2. Write

```
D1=(T-.4)r_A+d r_B+(T/sqrt(2))conjugate(r_B),
D2=sqrt(T)(Q+P), vnu=nu sqrt(T)(T-2)/sqrt(2).
```

Degree orthogonality removes D1/(D2+vnu) cross terms. Phase charge
gives E P^2=E QP=E[Q conjugate(P)]=0, and E Q=E P=0. Therefore
|E(D2+vnu)^2|<=T x+T(T-2)^2 n/2. The P sector pays only 3M/4;
the Q and nu sectors pay at most (3M+J)/4. No conditional mean
given q or another sector is removed.

For z=l^2/(2u), Gaussian integration gives the entire expressions

```
M=sqrt(pi/u) exp(-z) I0(z),
J=sqrt(pi/u) exp(-z) I1(z),   0<=J<=M<9.         (Bessel)
```

For J, start from the previously derived Laplace formula
J=(2l^2/sqrt(pi))integral_0^(1/u) v^(1/2)sqrt(1-uv)e^(-l^2v)dv.
Put y=uv, then x=1-2y; the integral representation
I1(z)=(z/pi)integral_-1^1 e^(zx)sqrt(1-x^2)dx yields (Bessel).
The l=0 limit is continuous. The formula for M follows from the
same Gaussian integral or its I0 angular representation.

Both u derivatives have absolute value <=sqrt(pi)/(2u^(3/2))<111
on [.040,.041]. Indeed their angular representations contain
exp(-x)cos(k theta), k=0,1, x=z(1-cos(theta))>=0; differentiating
in u inserts (x-1/2)/u, and |(x-1/2)e^(-x)|<=1/2.

The fresh Arb integrator certifies, uniformly on this entire interval,

```
IA=E(T-.4)^2 M <.986,
IB=E(T^2/2+d^2)M <1.022,
IO=ETM <1.245, IN=E[T(T-2)^2 M/2] <1.051,
.182<IC=E(T-.4)M<.189,
1.006<JO=ETJ<1.013, JN=E[T(T-2)^2 J/2]<.749,
.736<K=E[T(T-.4)J/sqrt(2)]<.741.                (Prices)
```

Fifty u cells have exact midpoint radius 1/100000. For each centre,
analytic quadrature integrates M and J moments k=0,1,2,3 over
T in [0,64] at 128-bit precision. Their nonnegative tails are each
bounded by 9e^(-64)k! sum_(j=0)^k 64^j/j!, before signed moment
combinations. The derivative error is 111/100000 times the integral
of the absolute weight. Those integrals are bounded by 34/25,
1+d^2,1,1,7/5,1,1,(2+.4)/sqrt(2), respectively. No numerical
search output or previous table is acceptance input.

The scaled Bessel call means exp(-z)I_k(z), including for complex
z, so the quadrature integrands are entire. This convention was
checked against the [FLINT reference](https://flintlib.org/doc/acb_hypgeom/index.html#modified-bessel-functions)
as well as the pinned python-flint call documentation.

The A/B quadratic form, including the trial and energy penalties, is

```
-a0 EA-b0 EB+C_AB Re(zeta),
a0=p-.36-.75 IA,
b0=p-d^2-.75 IB+d JO/(2sqrt(2)),
C_AB=.72rho+1.5d IC-K/2.
```

Using (Prices), |C_AB|<.082, and an exact positive 2x2 determinant
gives cost at least .215V for every covariance. The odd costs are
at least p-.75IO-.25JO>.135 for Q, p-.75IO>.135 for P, and
p-.75IN-.25JN>.345 for nu. The base is B(u)-pu<=S. This proves
(Gnew), with no lower-amplitude restriction. These new reference
prices, not scalar deficit, supply the improved budget.

## 6. Uniform budget and its global one-variable check (P+C)

The exact covariance matrix of H1 gives H1<=.73V; the determinant
test is in verify_budget.py. Split .215V=.195V+.02V and use
.345n>=.135n+.20n. Completing the square only in sqrt(V), once,
gives from (E)

```
Ttrial(q)-S <= c0 sqrt(chi)+C chi^(1/4)sqrt(W)F(2sqrt(W/(eu)))
                           -.135W-.02V-.20n,
c0=.104+.515^2*.73/(4*.195)<.353.                (Y)
```

Here sqrt(o)<=sqrt(W) and monotonicity of F replace u by .040.
To bound the remaining W expression over ALL W>=0, use its
concavity. If r=c sqrt(W)<1, the sign of the second derivative
of sqrt(W)F(c sqrt(W)) is that of

```
r^2 F''(r)+rF'(r)-F(r)
 =-2r/sqrt(1-r^2)-2asin(r)<0.
```

For r>=1 it is pi sqrt(W), again concave, and the derivatives
match at r=1. At chi=1/50000000 the unique maximum is bracketed
by W in [17273/10^7,17275/10^7]: the outward derivative is positive
at the left endpoint and negative at the right. Monotonicity of
the positive part and the linear term bounds the maximum by
the positive part at the right minus .135 times the left.
Adding c0 sqrt(chi) certifies <97e-6. Smaller chi can only reduce
the upper expression. This is a global concavity argument with an
outward root bracket, not a sampled W maximization.

## 7. Finite-energy consequences and limitations (P+C)

For the hard energies, use |zeta|<=sqrt(EA EB)=.004 directly
in H1 and retain o=.004, n=.001 separately in (E). At chi=1e-6,
the outward budget is <40e-6; smaller chi is also covered. The
exact checker verifies that the tuple satisfies the original caps.

The earlier region III is
u in [.040,.0405], EA in [0,.003], EB in [.0035,.004],
o in [.0015,.002], n in [.0135,.014], covariance arbitrary.
At chi<=1e-5 use the largest H1, o, W and the least costs
independently in (E); the outward result is strictly below S.
The entire box satisfies the weighted and total response caps.

These statements apply to genuine fields in every finite dimension.
Q/P may be fixed rank-one fields, all sectors may share coordinates,
and nu may have any complex phase. The cutoff is on q only.
The caps do not imply it. No general signed covariance theorem,
full second-order Edgeworth remainder, global scalar deficit or
general all-sector closure has been proved here.
