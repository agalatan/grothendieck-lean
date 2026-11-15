<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/analytic/P_ALL_REDUCTION.md, 2026-11-15 13:17; Agent-ID: codex-91d4. -->
# An averaged odd extension with an explicit scalar budget

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
**P, re-derived by claude-b9ee** for the Psi majorant and conditional
assembly; see [review](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6893452582).
The proposed uniform averaged premise is **OPEN**. The frozen cession
calculation is inherited exact scalar **C**, replayed in Phase B and
by claude-b9ee; the review retains its **author-level C** label.
Neither the global A/B premise (P) nor an all-sector theorem is claimed.

## 1. Fixed trial and exact accounting

Use the task's peak profile and genuine-chaos domain. Put

```
rho=5053/10000, s=3/5, p=2500/1891, u0=463/10000,
R=r_A+rho r_B, U=r_B-rho r_A, xi0=-sR,
u=||q||², V=||r_A||²+||r_B||², W=||O||²,
X=L+E-xi0, H=O-cZ,
D=B(u)-2E|L+q|, sigma=S-[B(u)-pu].
```

The trial c is a single global complex number, not a function of the
remote sample. The exact odd increment at this fixed remote trial is

```
J_O(c)=|c|²+E[|X+H|+|X-H|-2|X|]-pW.               (1)
```

Canonical visible parity gives the requested actual trial value as
the even trial value plus (1). Under a7c4's same pointwise premise (P),
bundled inputs/JOINT_TARGET.md Section 3 gives

```
trial(G;xi0,c)-S <= J_AB+J_O(c)-D-sigma,             (2)
J_AB=2Re<c_A,R>+2Re<e,r_B>
       -.31||R||²-.08||U||²+2V(u+V-u0).             (3)
```

Here the contents are the **matched tilted** contents, not raw ones:

```
c_A=Pi_1 E_Z[(T-1+s)ph(L+q)],
c_B=Pi_1{E_Z[(Z²/sqrt(2))conjugate(ph(L+q))]
                            +s rho E_Z ph(L+q)},
e=c_B-rho c_A.
```

Equation (2) bounds the value of the explicit trial itself. It does
not use the even retained optimizer as a lower baseline. Only after
proving the trial cap may one infer the same upper cap for LambdaHat.

## 2. Concrete allocated averaged candidate

The first candidate to test is

```
For every admissible genuine tuple, there exists one global c such that
J_O(c) <= (1/100)||U||² + sigma-D_minus + 1/20000.    (A)
```

The stronger initial c=0 version is especially useful: it requires no
visible minimization and keeps Q centered in the moment estimates.
The numerical lanes record both the actual trial and the allocation
residual; validity of one is not assumed from the other.

This is a specified sufficient allocation, not a restatement of the
absolute target: it cedes exactly .01||U||² from a separately certified
even scalar budget, and requires a stronger odd inequality. It can
fail even when the absolute target holds. In particular its uniform
truth is not asserted by choosing the coefficients.

The older premise without `sigma-D_minus` was rigorously refuted.
Adding this term creates a new premise; none of the old numerical
evidence or scalar certificates proves it. Its right side is not
automatically inconsistent at O=0: the inherited remote cap gives
`sigma-D_minus=min(sigma,S-Lambda(q))>-.36e-6`, whereas its additive
allowance is 50e-6.

The exact identity

```
sigma-D_minus = min(sigma, S-Lambda(q))              (4)
```

shows that (A), for the same chosen c, is equivalent to BOTH

```
J_O(c)-.01||U||² <= sigma+50e-6,                    (A1)
J_O(c)+Lambda(q)-.01||U||² <= S+50e-6.              (A2)
```

This is a useful proof split. For (A2), include
`Phi(q)=2E_Z|L+q|` directly in the averaged expression, with
`Lambda(q)=E Phi(q)-pu`. No sign assumption about D is needed.
Replacing D_minus by the coarse bound `sigma+.36e-6` would throw away
the useful energy slack and nearly recover the refuted old premise;
that is not an adequate general proof strategy.

## 3. Exact cession implication and absence of a remote surcharge

The frozen scalar calculation proves, on

```
0<=u<=.0463, V>=0, u+V<=.080051,
C=||c_A||<=.02, C²<=.3D_plus+6e-6,
||e||<=(7/2000)sqrt(u),
```

the stronger-than-needed bound

```
J_AB+.01||U||²-D_plus <49e-6.                       (5)
```

Its proof first replaces the two content pairings by Cauchy-Schwarz,
using `r_B=(rho R+U)/(1+rho²)`, and bounds `||e||` by .0007532.
It then completes the R and U squares over 1,000 exact energy cells.
The A-content coefficient remains .3. Reducing the U cost from .08
to .07 is exactly the main checked cession row. The actual worst
rational upper bound has decimal display `48.38689695804018e-6`.

Combining (2), (A), and (5) gives, exactly,

```
trial(G;xi0,c)-S
 <=J_AB+.01||U||²-D-D_minus+50e-6
  =J_AB+.01||U||²-D_plus+50e-6
  <99e-6 <1e-4.                                    (6)
```

There is **no additional .36e-6 term** in (6): the explicit `-D_minus`
in (A) already cancels the negative-deficit branch. The original
historical checker reports a `99.36e-6` total for a different odd
premise. Its scalar output (5) is reused here; its historical total is
not this new assembly. All response constraints in the task imply
the weaker scalar domain above, since `u+V+W<=.080051`. The ellipsoid
is available to the new odd proof but was not spent in this scalar check.

Local frozen files are listed in SOURCE_MAP.json. In particular,
`inputs/coupled_budget_check.py` and its rational multipliers have no
old-handoff runtime dependency. `verify_allocation.py` is the
standard-library entry point which reruns that scalar calculation and
reports (6). It was not executed during Phase A; after the Phase A
decision was reported, its Phase B replay passed. The historical
note is copied solely for provenance; its obsolete claim that O_U was
open is superseded by the subsequent refutation.

## 4. A genuinely averaged, zero-safe directional premise

For complex X,H write

```
r=|X|, t=|H|, d=Re(X conjugate(H)), M=r²+t².
```

Define the zero-safe directional majorant Psi by the right side below.
An elementary finite-amplitude bound is

```
|X+H|+|X-H|-2r
 <= Psi(X,H):=2sqrt(M)-2r-d²/M^(3/2).                (7)
```

At M=0 the last quotient is defined as zero. To prove (7), square the
sum of norms to obtain `2M+2sqrt(M²-4d²)`, use
`sqrt(1-z)<=1-z/2`, and apply it once more when taking the outer
square root. No Hessian, inverse-potential integrability, or small
amplitude expansion is used. The quotient is at most sqrt(M)/4, so
Psi is continuous at the joint zero. Moreover `0<=Psi<=2|H|` and,
for X nonzero, its leading term as H tends to zero is the exact
directional Hessian `|H|²/|X|-d²/|X|³`.

The primary candidate is the independently testable averaged statement

```
(P_all,avg): for every admissible genuine tuple, choose one global c
such that

E Psi(X,O-cZ)
 <= pW-|c|²+.01||U||²+sigma-D_minus+50e-6.            (8)
```

This is stronger than (A), hence sufficient for (6). Its explicit
radical integrand is finite at quadratic zeros, retains directional
cancellation, and does not contain the original central norm secant.
No global truth is inferred from the pointwise implication (7).
The primary Phase-A test should use Psi directly, including c=0.

For certification, an optional stronger cutoff version separates a
bounded denominator from a small-ball allocation. For a fixed tau>0 set

```
K_tau(X,H)=|H|²/max(|X|,tau)
             -(Re(X conjugate(H)))²/(|X|²+|H|²)^(3/2),
b_tau=Pr(|X|<tau).                                  (9)
```

On r>=tau, `2sqrt(r²+t²)-2r<=t²/r`. On r<tau, it is at most
`2t<=t²/tau+tau`. Consequently

```
E Psi(X,H) <= E K_tau(X,H)+tau b_tau.                (10)
```

A sufficient cutoff certificate for (8) is therefore

```
for the same global c and one global tau>0,

E K_tau(X,O-cZ)+tau b_tau
 <= pW-|c|²+.01||U||²+sigma-D_minus+50e-6.            (11)
```

The exceptional set in (11) is displayed explicitly. The unresolved
assertion is the uniform averaged inequality (8), not the proved
pointwise comparison (7), cutoff comparison (10), or scalar assembly
(6). Neither (8), (11), nor (A) is currently certified. A finite menu
of tau values depending on global energies is permitted; tau and c
must not be chosen separately at each sample.

The directional term in Psi should be retained in feasibility tests.
Its identity

```
d²=(|X|²|H|²+Re[X² conjugate(H)²])/2
```

keeps both Hermitian and complex-bilinear channels. A majorant that
drops it is valid but may spend too much budget. The term `tau b_tau`
pays for quadratic zeros in the optional cutoff version; neither
version claims a uniform conditional quadratic odd cost.

## 5. Concrete moment-dual route to the averaged premise

Specialize first to c=0. Average Psi, or the cutoff kernel (9), over
the visible Z at fixed remote
values `(w,A,B,Q,P)`. The same `(w,A,B)` compact boxes as a7c4's (P)
cover can be reused, with extra bounded odd coordinates and the explicit
small-ball kernel. No second independent compact A/B cover is needed.

A possible polynomial comparison uses the nonnegative remote features

```
1, |Q|², |P|², |nu|²,
|w|²|Q|², |w|²|P|², S_r|Q|², S_r|P|²,
|Q|⁴, |P|⁴, |Q|²|P|²,
|Q|²|nu|², |P|²|nu|², |nu|⁴.
```

Their exact or upper expectations are respectively supplied by the
energy constraints and SHARED_ODD_MOMENTS.md:
`17ux,12uy,3Vx,3Vy,9x²,6y²,7xy,xn,yn,n²` for the last ten
nonconstant entries after the three sector energies. Positive
coefficients may use these upper moments; negative coefficients need
an exact identity or a lower bound and cannot silently reuse them.
Signed zero-mean chaos terms may be added as dual variables only after
their expectations are proved zero under the actual weighting.

For (A1), compare the averaged kernel with such a moment polynomial
and include its small-ball allowance. For (A2), compare the kernel
**plus Phi(w)** with a moment polynomial; retain this extra radial
function rather than assuming a same-variance cap. The resulting
scalar inequalities use the full energy ellipsoid and the known
one-dimensional benchmark. This is a concrete family of sufficient
dual tests, not a claim that a suitable coefficient vector exists.

The odd fourth moment provides a rigorous exceptional-set alternative:
if `Pr(A)<=b`, the omitted secant is bounded by
`min(2sqrt(Wb),2M4(x,y,n)^(1/4)b^(3/4))`. Weighted shared moments
control polynomial tails. They do **not** supply a sharp small-ball
probability for X or prove (8) by themselves. Phase A must test the
actual directional kernel and allocation at the hard genuine cores
before any expensive cover is commissioned.

## 6. Certification split and stopping condition

The inherited compact geometry remains owned by codex-a7c4: the
reviewed larger exterior starts at `|w|²/2+S_r>=891/500`, leaving the
stated compact bounds `|w|<=1.888`, `sqrt(S_r)<=1.335`.
This note supplies an averaged odd interface, moments, and a scalar
absorption contract. Root coordinates the shared boxes and constants
on #436. No new cover, proof-premise acceptance, or Phase B run is
authorized by this note alone.

If (A) or (8) fails numerically, retain (2) as the conditional upper-bound target
and improve the allocation or the majorant. A failure of either
stronger premise does not refute the user's explicit-trial cap.
