<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/singular-continuation/SMALL_DRIVER_STRIP.md, 15 November 2026; Agent-ID: codex-91d4. -->
# A uniform odd strip from the small-driver event

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, author only; exact scalar arithmetic C.** This combines the
neighboring `SMALL_DRIVER_MONOTONICITY.md` with a Gaussian driver-tail
lemma and visible averaging. The new strip is

```
W=||O||² <= (84/1000000)² =441/62500000000=7.056e-9. (1)
```

It proves the existing averaged Psi premise with the global choice
c=0 on this strip, for every admissible genuine tuple and arbitrary
sharing. It does not prove the averaged premise beyond this strip or
the A/B pointwise premise. Its all-sector consequence still requires
the latter. No field search, numerical integration, or compact cover
is used.

## 1. Domain and imported analytic inputs

Use the same six sectors and peak constants as the task:

```
a=699/1250, b=179/1250, epsilon=1891/2500, p=1/epsilon,
V=E(|A|²+|B|²), W=x+y+n,
x=E|Q|², y=E|P|², n=|nu|²,
O=ZQ+conjugate(Z)P+nu Z(|Z|²-2)/sqrt(2).
```

The visible standard circular Gaussian Z is independent of the
remote Gaussian block. A,B are holomorphic linear forms, Q is a
centered H11 field, P is H20, q is H21, and all remote sharing is
arbitrary. The even common-trial polynomial X is unchanged.

We use the imposed response ellipsoid at t>=21/25:

```
u/2+(2/3)E_A+(4/3)E_B+x+y+(8/7)n
                         <=epsilon²(pi/4-t²),       (2)
```

and the inherited remote inequality on u<=.0463:

```
sigma-D_minus> -36/10^8.                            (3)
```

Equation (2) is the task's hypothesis; it is not newly assumed from
arbitrary energy caps. Source: frozen progress handoff
`../inputs/RESPONSE_ELLIPSOID.md`, equation(1), recorded as STATUS2.12b.
Equation (3) is the same inherited premise as `TINY_STRIP.md` and
the old tiny-strip proof. No first-chaos response penalty is newly
subtracted from the functional.

The neighboring monotonicity note proves, conditional on remote
values with S_r=|A|²+|B|²<=K<2ab,

```
E_Z Psi(X,O) <=2w/m_K,
w=|Q|²+|P|²+|nu|², m_K=a-K/(2b).                  (4)
```

Its proof completes squares in the symmetric real derivative,
obtaining Sym DX>=m_K I. The weighted density
pi^(-1)exp(-|z|²)|O(z)|² has mass w and supremum at most w/pi;
layer-cake integration then proves (4), uniformly in q.
For clarity, the scalar certificate below also checks that density
estimate's quartic:

```
p4(t)=t^4/24-t^3/3+(5/2)t²-3t+1,
p4''(t)=(t-2)²/2+3,
p4(2/3)=5/243, p4'(2/3)=-5/81,
p4(t)>=785/39366>0.
```

The analytic proof of (4), not just these scalar identities, remains
an explicit dependency.

## 2. A sharp enough tail for two Gaussian driver directions

The jointly proper Gaussian vector (A,B) has covariance eigenvalues
lambda1>=lambda2>=0 with lambda1+lambda2=V. Thus S_r has the law
lambda1 E1+lambda2 E2 for independent Exp(1) variables.

For K/V>=3/2,

```
Pr(S_r>K)<=exp(-K/V).                               (5)
```

If V=0 the probability is zero. For lambda1>lambda2>0 put
r=lambda2/lambda1 in(0,1), s=K/V. The exact exponential convolution
gives the tail divided by exp(-s) as

```
[exp(-sr)-r exp(-s/r)]/(1-r).
```

This is at most1 precisely when
h(r)=1-r-exp(-sr)+r exp(-s/r)>=0. Its endpoint limits are h(0)=h(1)=0,
and

```
h''(r)=s²[-exp(-sr)+r^(-3)exp(-s/r)]<=0.
```

Indeed 1/r-r>=-2log(r), since the derivative of
1/r-r+2log(r) is-(1/r-1)² and its value at1 is zero. For s>=3/2
this implies s(1/r-r)>=-3log(r), the required exponential comparison.
Concavity proves h>=0. The rank-one case is exact, and the equal
eigenvalue case follows by continuity of the tail formula.

This proof controls the actual Gaussian driver pair; it does not
replace q or the odd fields by independent variables.

## 3. Paying for the bad driver event without a fourth-moment assumption

Let B_K={S_r>K}, beta=Pr(B_K). At a fixed visible z, Cauchy-Schwarz
over the whole remote block gives

```
E_remote[|O(z)| 1_B_K]
                 <=sqrt(beta) sqrt(E_remote|O(z)|²).
```

Angular Jensen removes the visible P cross terms. Centering EQ=0
removes the Q/nu term after remote averaging. The same tilted-radial
Jensen calculation as in `TINY_STRIP.md` therefore gives

```
2E[|O| 1_B_K] <=sqrt(pi beta) sqrt(x+y+(7/8)n)
              <=sqrt(pi beta W).                  (6)
```

This holds even though B_K, Q, P and q can be arbitrarily dependent.
It uses the full remote second moment after Cauchy-Schwarz, not an
incorrect independence factorization. In particular no reference
fourth-moment bound such as E|O|^4<=43/20000 is imposed.

On the good event, (4) and E w=W give

```
E[Psi 1_(S_r<=K)]<=2W/m_K.
```

Using Psi<=2|O| on B_K, we obtain the dimension-free estimate

```
E Psi-pW <=2W/m_K+sqrt(pi beta W)-pW.                (7)
```

Each event is paid once. No D1 strip or visible-radius tail is left
unpaid in (7); the monotonicity estimate is global in visible Z.

## 4. A completely rational choice

Choose

```
K=77/500=.154, Vbar=11/160=.06875,
m_K=9617/447500>0, 2/m_K<94,
K/Vbar=56/25>3/2.                                  (8)
```

The response ellipsoid gives V<=3epsilon²(pi/4-(21/25)²)/2.
We use a self-contained improvement of pi<22/7:

```
22/7-pi=integral_0^1 x^4(1-x)^4/(1+x²) dx
       >(1/2) integral_0^1 x^4(1-x)^4 dx=1/1260,
pi<3959/1260.
```

Consequently

```
V<180034880707/2625000000000<Vbar.                  (9)
```

The weaker pi<22/7 alone would give V<.0687549966 and would not
justify Vbar; this is why the explicit refinement above is included.

By (5), beta<=exp(-56/25). The positive exponential Taylor sum
through degree11, together with pi<22/7, verifies exactly

```
pi beta <(22/7)/sum_(j=0)^11 (56/25)^j/j!
        <(29/50)².                                 (10)
```

Discarding the favorable-pW in (7) and using (8)-(10) yields

```
E Psi-pW <94W+(29/50)sqrt(W),                       (11)
```

for W>0; W=0 is immediate. Both terms on the right are increasing.
At W0=(84/1000000)² the exact upper charge is

```
94W0+(29/50)(84/1000000)
 =1543227/31250000000
 =49.383264e-6
 <49.64e-6=1/20000-36/10^8.                         (12)
```

Equations (3) and (12), and the nonnegative U allocation, prove

```
E Psi(X,O)-pW
 <=.01||U||²+sigma-D_minus+1/20000
```

throughout (1), with the fixed global choice c=0. The extra
.256736e-6 is a reserve in this odd allocation, not an additional
endpoint improvement. The strip is approximately11.45 times the old
6.160324e-10 strip. Full averaged closure remains open.

## 5. Replay scope

`verify_small_driver_strip.py` uses only Python's standard library.
It checks the positive-integral polynomial arithmetic, response-cap
conversion, weighted-density quartic, exponential Taylor comparison,
and endpoint budget. It rejects -O/-OO and an enlarged declared cap.
Its PASS is an exact scalar certificate under the analytic lemmas
stated here and in `SMALL_DRIVER_MONOTONICITY.md`; it is not a formal
proof of those analytic lemmas or a full-domain all-sector certificate.
