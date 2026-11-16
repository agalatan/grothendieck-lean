<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/partial-q-replacement/ANISOTROPIC_REFERENCE.md, 15 November 2026; Agent-ID: codex-91d4. -->
# All A/B covariances: a stronger small-chi conclusion

Agent-ID: **codex-91d4**. Refs #436. New author-only **P+C**.
The refinement and the elementary K bounds were suggested by
**codex-a7c4**, then independently re-derived below. Scalar signed
deficit remains his task. The two-sign majorant is already reviewed
in master #447 and traced there to the legacy ch40 manuscript.
This new use of it has not yet been reviewed by claude-b9ee.

## 1. Statement

Keep every definition and the partial-replacement theorem (R) of
[PROOF_NOTES.md](PROOF_NOTES.md). For **every** genuine tuple with
u in [.040,.041], arbitrary sharing, arbitrary A/B covariance and
arbitrary lower-sector amplitudes,

```
Ttrial(q) <= S+C0 sqrt(chi) -(3/50)(EA+EB) -(13/50)|nu|^2,
C0=26/125 + [5(103/100)^2]/[4(p-5/4)] < 19.       (A)
```

The original fixed xi0 is unchanged and the one global visible
coefficient is c=0. Q,P need not be diffuse or independent of
anything else. Both real nu channels remain in the exact
interpolation underlying (R). No(P), scalar deficit, or extra
response penalty is used.

Consequences within the user's original caps are:

- If chi<=1/40000000000=2.5e-11, then **Ttrial<S+94e-6** for
  every lower-sector allocation and every driver covariance.
- At the old hard energies
  (u,EA,EB,x,y,n)=(.0403448,.008,.002,.002,.002,.001), all driver
  covariances and all sharing are covered when
  chi<=1/400000000=2.5e-9: **Ttrial<S+90e-6**.

The proof actually needs no lower energy cap. This is a small-chi
slice, not a replacement for codex-8d2f's general large-W work.
In particular it covers every allocation in the remaining W<.02
region near u-star. The caps do not imply the chi cutoff, so the
full arbitrary-shape gap remains open.

## 2. The reviewed directional inequality, re-derived (P)

For X!=0 and any D,

```
|X+D|+|X-D|-2|X|
 <= |D|^2/|X| - (Re(conjugate(X)D))^2/(2|X|^3).  (B)
```

Normalize X=1 and write D=x+iy. If
lambda=(|1+D|+|1-D|)/2>1, the ellipse identity gives
x^2/lambda^2+y^2/(lambda^2-1)=1. Put these two ratios equal to
alpha,beta. Then alpha,beta>=0, alpha+beta=1, and

```
x^2/2+y^2-2(lambda-1)
 = alpha (lambda-2)^2/2 + beta (lambda-1)^2 >=0.
```

The lambda=1 case has zero norm increment. Scaling proves (B).
This holds at every amplitude; it is not a conditional Hessian
bound for the original A/B core.

For fixed T let l=sqrt(T)(a+bT), X=l+q_G and

```
M=E|X|^(-1),
J=E[((Re X)^2-(Im X)^2)/|X|^3].
```

The law of X is invariant under conjugation. Averaging (B) over
q_G independently of a possibly non-Gaussian D gives the price

```
(3/4)M E|D|^2 -(1/4)J Re E[D^2].                (C)
```

Every expectation in (C) is finite because M is finite. The
probability-zero event X=0 causes no omitted region.

## 3. Positivity and a usable bound for the directional kernel (P)

Gaussian completion of the square in the Laplace representation
of |X|^(-3) gives, for l>0,

```
J=(2l^2/sqrt(pi)) integral_0^(1/u)
       v^(1/2) sqrt(1-uv) exp(-l^2 v) dv.          (D)
```

Indeed, before the substitution v=t/(1+ut), the Gaussian weighted
second-moment difference is
l^2(1+ut)^(-3)exp[-l^2 t/(1+ut)]. This proves J>=0.
Also J<=M, since the absolute numerator in its definition is at
most |X|^2. Using sqrt(1-uv)>=1-uv on [0,1/u], and extending
the resulting negative polynomial tail to infinity, gives

```
J >= 1/l-3u/(2l^3).                              (E)
```

Let f=T-2/5, g=T/sqrt(2), and K=E_T[J g f]. We need only

```
0<K<29149/20000=1.45745, uniformly on [.040,.041]. (F)
```

For T in [1,2], l<6/5 and l^2>9u/2. The right side of (E)
decreases in l there, and its value at l=6/5,u=.041 exceeds .79.
Moreover T(T-2/5)>=3/5. As 2<e<11/4,
P(1<=T<=2)=e^(-1)-e^(-2)>28/121>.23. Thus the positive part of
sqrt(2)K is greater than .79*.6*.23=.10902. The entire negative
part is bounded above by

```
9 integral_0^(2/5) T(2/5-T)dT=.096,
```

because J<=M<9. Contributions at T>=2/5 outside [1,2] are
nonnegative. Hence sqrt(2)K>.01302>0.
For the upper bound, drop the negative part and use J<=M:

```
K <= E[M T^2]/sqrt(2) <= sqrt(2) IB
  <(283/200)(103/100)=29149/20000.
```

The price IB<1.03 is from the fresh outward check in this packet.
The elementary e bound follows by bounding the series after 1/2
by (1/6)/(1-1/4), giving e<=49/18<11/4. Every rational comparison
in this paragraph is replayed by `verify_anisotropic.py`.

## 4. The A/B form is negative for every covariance (P+C)

Split D=D1+D2+vnu, where

```
D1=f r_A+d r_B+g conjugate(r_B),
D2=sqrt(T)(Q+P), vnu=nu sqrt(T)(T-2)/sqrt(2).
```

The cross terms between D1 and D2+vnu vanish in both E|D|^2
and E D^2 by genuine degree orthogonality and centering. No
independence among these fields is required. For the linear part,

```
E|D1|^2=f^2 EA+(d^2+g^2)EB+2fd Re(zeta),
Re E[D1^2]=2g[f Re(zeta)+d EB].
```

For D2+vnu use |E(D2+vnu)^2|<=E|D2+vnu|^2 and 0<=J<=M.
Its price in (C) is at most M E|D2+vnu|^2, retaining the previous
coarse odd prices IO and IN. Its constant/quadratic cross term
vanishes only after the full remote average, E Q=E P=0. This is
the auxiliary independent-q reference; the actual shared coupling
has already been charged by (R), with both nu channels intact.

Using the five certified price bounds IA<1, IB<1.03, IO<1.25,
IN<1.06, |IC|<.2 and (F), the A/B contribution, including the
trial cost and energy penalty, is at most

```
-a0 EA-b0 EB+C Re(zeta),
a0>p-.36-.75>.212,
b0>p-.36rho^2-.75(1.03)>.457,
C=2(.36)rho+(3/2)d IC-K/2, |C|<.456.
```

The omitted B term is -(d/2)E[J g]EB<=0. The certified interval
for C is (-.455863,.45477). Since

```
4(.212-.075)(.457-.075)-.456^2=7/5000>0,
```

the Hermitian 2x2 form is at most -.075(EA+EB), for every
complex covariance |zeta|<=sqrt(EA EB). This is the step that
removes the previous positive-correlation obstruction.

Writing o=x+y and n=|nu|^2, the reference now satisfies

```
Ttrial(q_G) <= S-(3/40)V-(p-5/4)o-(p-53/50)n,
V=EA+EB.                                        (G)
```

No lower-sector fourth moments or amplitude caps enter (G).

## 5. Absorb the entire mixed replacement charge (P+C)

By 2Re(zeta)<=V and the definition in (R),

```
H <= (771/1000)V+5o.
```

Let gamma_o=p-5/4 and k=gamma_o/5. Exact rational arithmetic gives

```
3/40-(771/1000)k > 3/50,
p-53/50 > 13/50.
```

Thus the costs in (G) pay kH+(3/50)V+(13/50)n. Combining with
(R), using .208 and 1.03 from its exact constant bounds, leaves

```
Ttrial(q)-S <= .208 sqrt(chi)-kH+1.03 sqrt(H)chi^(1/4)
                                    -.06V-.26n.
```

Complete the square in sqrt(H):

```
-kH+1.03 sqrt(H)chi^(1/4)
 <= 1.03^2 sqrt(chi)/(4k).
```

This proves (A). The odd energy cost is spent once, in kH.
The retained V and n costs are the proved leftovers, not a reuse
of the odd price. A rejection control explicitly detects spending
an additional gamma_o o/2 after this allocation.

For chi<=2.5e-11, sqrt(chi)<=1/200000 and
C0/200000<94e-6. At the old hard energies V=.01,n=.001, the
weaker coefficient19 gives, for chi<=2.5e-9,

```
19/20000-.06(.01)-.26(.001)=90e-6.
```

The actual coefficient is strictly less than19, so the displayed
hard-tuple bound is strict. The response caps for this tuple are
checked separately and no shared variable arrangement is excluded.

## 6. Scope

This refinement certifies the small-marginal-chi branch for all
A/B drivers and non-diffuse odd sectors near u-star. It preserves
the earlier larger-cutoff region III, which can be stronger where
the finite odd-energy credit exceeds the uniform Young allocation.
General large-chi cubics remain outside these sufficient tests.
In particular nothing here proves that the original caps force
chi small. All new results await claude-b9ee's review.
