<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/budget/ENERGY_SLACK.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Positive signed energy slack and correlated-event odd budgets

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**New analytic implications P, author only; exact continuation C;
cutoff selection N.** The exact checker has passed. It reuses inherited
global Hermite profile caps and genuine cubic moments; it does not
rerun their Arb quadratures or formal proofs. All new files are confined
to this budget folder. No compact (P) cover or large-W exterior is used.

**Result.** Both branches of the signed odd allowance have positive
energy-dependent slack through u=.03. Combining this with the actual
odd energy on the bad driver event gives six new sufficient
(u,V,W) rectangles, all with admissible endpoints outside the earlier
direct regional half-space. The largest displayed new odd cap is
W=.000139 at u<=.02,V<=.005. The universal averaged premise remains open.

## 1. The two quantities that must be bounded

The canonical definition, also stated in the frozen benchmark helper, is

```
L=Z(a+b|Z|²), a=699/1250, b=179/1250, p=2500/1891,
B(u)=2E|L+sqrt(u)G|,
```

where Z,G are independent standard proper complex Gaussians. For a
genuine remote q independent of Z, with E|q|²=u, put

```
F(u)=B(u)-pu, Lambda(q)=2E|L+q|-pu,
D=F(u)-Lambda(q), sigma=S-F(u), D_minus=max(-D,0).
```

Then the exact identity is

```
sigma-D_minus=S-max(F(u),Lambda(q)).                 (1)
```

Thus a common upper bound for F(u) and Lambda(q) supplies a signed
allowance without assuming D>=0. A retained-only remote bound would
not suffice. The argument below bounds the raw Lambda(q) directly.

A preliminary bound follows from concavity of
h(v)=2E_Z|L+sqrt(v)| and h'(0)=j0=E|L|^(-1)/2:
both quantities are at most B0+(j0-p)u. The inherited inequalities
S-B0>.002074245 and j0-p<.11 therefore give
sigma-D_minus>.002074245-.11u. This loses usefulness near u=.019.
The moment continuation below gives substantially stronger bounds.
The preliminary bound is not used by the new scalar verifier.

## 2. Global moment caps apply to both branches

The bundled `inputs/inherited_REMOTE.md`, Section3, proves that its
Hermite polynomials

```
P_i(v)=c0+c1 v+c2 v²+c3 v³
```

majorize h(v) on the entire v>=0 half-line, with c3>0. The packet
`inputs/inherited_remote_augmented_result.json` records17 previously
certified such polynomials and their fresh profile input replay.
`SOURCE_MAP.json` records verbatim source paths and hashes. These are
the reviewed inputs behind canonical STATUS11.47/11.48; their older
source note's original review label is retained verbatim.

For genuine H21 cubics the inherited moment statements give, at u>0,

```
x=sqrt((E|q|^4-2u²)/u²), 0<=x<=sqrt(42)<13/2,
E|q|^4=(2+x²)u²,
E|q|^6<=(6+9x²+C6 x³)u³, C6=4045313/100000.
```

Circularity of L implies 2E|L+q|=E h(|q|²), even with arbitrary remote
sharing. Hence each global profile cap gives

```
Lambda(q)<=M_i(u,x)
 =c0+(c1-p)u+c2(2+x²)u²+c3(6+9x²+C6 x³)u³.         (2)
```

The fourth-moment term is an equality, so the possible negative c2
causes no inequality reversal. Positivity of c3 permits the sixth-
moment upper bound. These are exactly the raw moment expressions in
Section3, equation(7), of the inherited note, with no A-content
surcharge added.

Independently, sqrt(u)G has moments u,2u²,6u³. Applying the same
pointwise profile cap to this Gaussian gives

```
F(u)<=M_i(u,0).                                     (3)
```

This establishes the benchmark branch from its definition. It does
not model a general genuine q as Gaussian. At u=0 both variables
vanish almost surely, so no undefined normalized cumulant is used.

## 3. Four exact common energy caps

For fixed u>=0, (2) has the form A+B x²+C x³ with C>=0. Its derivative
x(2B+3Cx) can change from negative to positive but not conversely.
Explicitly, this derivative is
`x[2(c2 u²+9c3 u³)+3C6 c3 u³ x]`. The possibly negative c2 is
allowed; no global convexity in x is asserted.
Therefore its maximum over a closed nonnegative x interval lies at
an endpoint. At each endpoint the expression is cubic in u; its
Bernstein coefficients bound it on the whole energy interval.

The new verifier selects one inherited polynomial per closed rectangle
and checks this bound exactly. It checks the union independently by
slicing at all rational energy edges, requiring a complete consecutive
x-interval partition in every slab. An area check is supplementary.

Using the inherited S>S_lower=1.3739535256614, it proves:

| Energy domain | Common upper bound for Lambda(q) and F(u) | Closed leaves |
|---:|---:|---:|
| 0<=u<=.01 | <S-.00113 | 3 |
| 0<=u<=.02 | <S-.00049 | 5 |
| 0<=u<=.025 | <S-.00027 | 6 |
| 0<=u<=.03 | <S-.00010 | 6 |

The genuine range 0<=x<=sqrt(42) and the Gaussian case x=0 are included
in every root [0,u_cap]x[0,13/2]. All20 leaves, their selected polynomial
indices and exact reserves appear in `energy_slack_result.json`.

By (1), the corresponding positive slack ell is a lower bound for
sigma-D_minus. No additional .36e-6 subtraction is needed in these
four regions: both branches have already been bounded. Beyond these
regions the earlier uniform negative allowance remains available;
this continuation makes no stronger remote claim near u≈.04034.

## 4. Retaining the actual bad-event odd energy

Use the same small-driver event as the singular-continuation notes:

```
S_r=|A|²+|B|², V=E S_r<=Vbar,
0<K<2ab, K>=3Vbar/2, m=a-K/(2b),
B_K={S_r>K}, beta=Pr(B_K)<=exp(-K/Vbar).
```

The last inequality is the proved two-eigenvalue Gaussian tail lemma
in `../../singular-continuation/SMALL_DRIVER_STRIP.md`. Its proof uses
the actual jointly Gaussian linear drivers and no independence of
them from q,Q,P.

Put w=|Q|²+|P|²+|nu|², W=Ew, and t=E[w 1_B_K]. The weighted visible
potential estimate gives a good-event charge at most

```
(2/m)(W-t),                                        (4)
```

rather than spending2W/m and discarding the event correlation.

On B_K, angular Jensen followed by the tilted visible-radial measure
sqrt(T)exp(-T)dT/(sqrt(pi)/2) gives, conditionally on remote values,

```
E_Z|O|<=(sqrt(pi)/2)sqrt(kappa),
kappa=|Q|²+|P|²+(7/8)|nu|²-Re(Q conjugate(nu))/sqrt(2).
```

The coefficient7/8 is the tilted mean of(T-2)²/2, and the cross term
uses the tilted mean of(T-2)/sqrt(2), namely-1/(2sqrt(2)). This cross
term cannot be dropped on B_K. It is handled by the pointwise bound

```
kappa<=(4/3)w.                                     (5)
```

Indeed in the Q,nu block the two diagonal differences are1/3 and11/24,
the squared off-diagonal entry is1/8, and the determinant is1/36>0.
The P coefficient is also bounded. Thus Cauchy-Schwarz over the remote
bad event, and Psi<=2|O|, give

```
E[Psi 1_B_K]<=sqrt((4pi/3) beta t).                 (6)
```

No conditional centering or independence has been assumed in (4)-(6).
Completing the square in sqrt(t), while enlarging 0<=t<=W to t>=0,
now proves the alternative uniform bound

```
J_Psi=E Psi-pW
 <=(2/m-p)W+pi beta m/6
 <=(2/m-p)W+(pi m/6)exp(-K/Vbar).                  (7)
```

This is a sufficient upper bound, not a claim that t can be chosen
arbitrarily by genuine tensors. Enlarging its domain is safe for an
upper bound. Unlike the earlier separate charges, (7) retains the
actual odd energy left for the good event. Its constant term can be
poor at very small W; the earlier vanishing bounds remain available.

## 5. Six new sufficient regions

For each row below use the common slack ell from Section3. The exact
checker verifies that the right side of (7), at the displayed W cap,
is strictly below .99(ell+50e-6). Since 2/m-p>0, the entire W interval
below that cap is included. Formula(1) then proves the averaged Psi
allocation with c=0 for the whole rectangle in the original domain.

| u cap | V cap | K | W cap | Odd charge upper, in 10^-6 units | Available budget, in 10^-6 units |
|---:|---:|---:|---:|---:|---:|
| .01 | .06 | .155980 | .0000044 | <1165.184 | 1180 |
| .02 | .05 | .156880 | .00000158 | <534.133 | 540 |
| .025 | .045 | .157372 | .000000795 | <316.719 | 320 |
| .03 | .04 | .158090 | .000000275 | <148.475 | 150 |
| .02 | .005 | .044540 | .000139 | <533.504 | 540 |
| .03 | .005 | .050526 | .0000359 | <148.307 | 150 |

All terminating domain decimals are exact. Every row has more than1%
reserve in its odd allowance. The companion output also records six
slightly weaker regions using the old separate-event bound; they are
an independent comparison and are not added to (7).

These regions extend beyond the earlier direct half-space(R). For
each table endpoint, take all V in the A driver and all W in Q, with
genuine q,A,Q on disjoint remote coordinates. The checker verifies
u+V+W<.080051 and

```
u/2+(2/3)V+W<epsilon²(pi/4-.84²),
(771/500)u+(43/250)V-(16/125)W>1087/500000.
```

Thus each new region contains admissible genuine energy tuples outside
(R), not just a relabeling of its interior. This is an energy-domain
statement, not a claim that these tuples arise from bounded responses.
The endpoint feasibility check uses the elementary pi>3.14 bound from
the Machin identity and two alternating-series terms. It does not
evaluate their actual norm payoff.

## 6. Replay, provenance and remaining gap

Run `python3 -I -B verify_energy_slack.py`. Its default input paths
are relative to its own directory. The inherited profile payload is
hash bound. The code independently checks all20 remote leaves and
their coverage, the Q/nu matrix bound, exact positive exponential
Taylor sums, rational odd budgets and the endpoint comparisons above.
It rejects disabled assertions, missing rows and changed contracts.

K choices came from bounded scalar selection, recorded separately in
`SELECTION_N.json`; no field search or numerical integration was used.
The exact verifier does not read floating selection values. New
acceptance is conditional only on the explicitly inherited profile,
moment, benchmark and small-driver analytic inputs. It does not infer
validity from saved decimal quadratures or merely from a PASS label.

The region u>.03 near the Gaussian maximum and the remaining odd
energies are not closed. No full-domain all-sector statement, compact
(P) proof, or new Grothendieck endpoint is claimed.
