<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/joint/PHASE_OBSTRUCTION.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/joint/PHASE_OBSTRUCTION.md -->
# The finite-amplitude A/B problem cannot be reduced to real phases at fixed moduli

Agent-ID: codex-c7e2. Source baseline:
`6bb44599190397f806d2db89b25df4e6785b758e`.

**Result:** a concrete, interval-checked counterexample to a natural
dimension reduction of auxiliary premise (P). It is **not** a counterexample
to (P), Conjecture K, or the retained conjecture. Full (P) remains open.

## 1. Definitions

Use the exact peak constants

    a=699/1250, b=179/1250, rho=5053/10000,
    p=2500/1891, c=(3/5)rho=15159/50000.

For a standard complex Gaussian Z, T=|Z|², define

    L=Z(a+bT),
    h=(T-2/5)A+cB+Z² conjugate(B)/sqrt(2),
    E=|A|²+|B|²,
    Q(w,A,B)=(p-463/5000)E-(67/100)|A+rho B|²
                -(2/25)|B-rho A|²+(|w|²/2+E)E,
    J(w,A,B)=2E_Z[|L+w+h|-|L+w|
                     -Re(h conjugate(ph(L+w)))]-Q(w,A,B).

Premise (P) is J<=0 for all complex w,A,B. A common phase rotation
reduces w to a nonnegative real number, but it does not remove both
remaining coefficient phases.

## 2. Certified counterexample to fixed-modulus real-phase reduction

Take the exact rational complex coefficients

    w=1/10,
    A=84/325+i(7/65),       |A|=7/25,
    B=27/100-i(9/25),       |B|=9/20.

Then for every sa,sb in {-1,1},

    J(w,A,B)-J(w,sa*7/25,sb*9/20) > 1/50.             (1)

The four stronger certified lower bounds, displayed in decimal, are

| sa | sb | strict lower bound for the difference |
|---|---|---|
| -1 | -1 | 0.0452596642554 |
| -1 |  1 | 0.0283207148303 |
|  1 | -1 | 0.0387222594961 |
|  1 |  1 | 0.0339554572678 |

The comparisons themselves use exact fractions decoded from outward
hexadecimal integral endpoints; the decimals are only displays.
The same computation bounds J(w,A,B)<-17/100. Thus this configuration
is safely within (P); it disproves the proposed restriction to real
phases at fixed moduli, not the underlying inequality.

### Analytic reduction of the certificate

Write F(A,B)=E_Z|L+w+h|. The first variation is

    E Re(h conjugate(ph(L+w)))
       = beta(w) Re(A+rho B)-w e(w) Re B,

where beta(w)=w[g(w²)+(3/5)j(w²)] and
e(w)=k_B(w²)-rho k_A(w²). We use these explicit inherited bounds:

    beta(0)=0, |beta'(0)|<=1/40, |beta''(w)|<=1,
    0<=e(w)<=7/1000.

These inputs are not reproved by the new checker. The beta curvature
bound is the input of `compact-joint-2026-11-15/PROOF.md` section 2,
from `received-2026-11-15-tilted-sector/secant_proof.md` section 5 (12).
The derivative at zero follows from the reviewed peak enclosures
for g0 and j0 in STATUS; g0+(3/5)j0 lies between .024 and .025.
The alignment bound is the reviewed peak kernel comparison of
STATUS 7.1.4 and the same compact-joint proof.

At w=1/10 these give |beta(w)|<=3/400. For any real comparison
(Ar,Br) with the same two moduli, define

    dA=Re A-Ar, dB=Re B-Br,
    dC=Re(A conjugate(B))-Ar Br.

Equal moduli make E and all diagonal quadratic terms cancel. Hence

    J(A,B)-J(Ar,Br)
      =2(F(A,B)-F(Ar,Br))-2 beta(w)(dA+rho dB)
          +2w e(w)dB+(59/50)rho dC.

Insert the preceding beta/e bounds and the fresh integral enclosures
to obtain (1). The checker also encloses F(0,0) to bound the absolute
complex defect from above.

### Reproduction and trust

    python phase_counter.py --repo /path/to/grothendieck-lean

The runner builds a small driver over the existing two-harmonic
source integrator, recomputes all six integrals to width below 1/2000,
and performs the final comparisons independently with Python Fraction.
It records source hashes and all hexadecimal endpoints in
`phase_counter.json`. Inputs A,B,w are exact rational intervals, not
rounded decimal centers. The compiler uses directed-rounding flags;
builds with disabled assertions or fast math are rejected. The source
integrator's inherited unused main emits a return-type warning under
g++; the executed path is separate. No Lean theorem is involved and
no independent external review is claimed.

## 3. A second obstruction: no global imaginary-direction curvature bound

There is an exact rank-zero example inside the compact parameter
region. Set

    A=b,
    B=(a+b)/sqrt(2),
    w=a+(2/5)b-(a+b)(c+1/sqrt(2))/sqrt(2).

Numerically w=.1146990427..., A=.1432, B=.4966718031...,
and E=.26718912<3/4. For

    Y(Z)=L+w+(T-2/5)A+cB+Z²B/sqrt(2),

one has Y(-1)=0 and both real first derivatives vanish at Z=-1.
Writing Z=-1+u+iv, its quadratic part is

    [(a-3b)/2]u²-[(a+b)/2]v²+i(a-b)uv
      =.0648u²-.3512v²+i(.416)uv.

This quadratic map is nonzero on every nonzero direction: if its
imaginary part is zero, u=0 or v=0, and then its real part is nonzero.
Consequently |Y| is comparable to u²+v² near the root.

Changing Im A by a parameter t adds i t(T-2/5), whose value at the
root is (3/5)i t. The directional norm Hessian is a nonnegative
quantity proportional to |Y|^{-1} times the squared perpendicular
projection. On a positive angular sector the projection is bounded
below, so its integral contains a positive multiple of
integral_0^delta dr/r and diverges. Fatou applied to the nonnegative
paired second differences proves that the integrated norm has an
infinite second symmetric derivative in this imaginary direction.
All polynomial terms in J have finite second derivatives. Thus a
global bounded upper Hessian, or global concavity of J in imaginary
coefficients, is impossible.

This does not prevent the one-sided curvature/chord interpolation
already used in the repository: those bounds retain the nonnegative
singular Hessian instead of bounding it from above.

## 4. An exact obstruction to the elementary source-majorant route

There is also a rigorous failure of the three available elementary
pointwise bounds, even after pointwise switching and arbitrarily fine
source refinement. This is stronger than a finite subdivision run
ending without a certificate.

For each source point put X=L+w, r=|X| and

    U=|h|²/r,
    H=(Im(h conjugate(X)))²/r³,
    eta=|h|/r,
    e=min(1,eta),
    alpha(e)=9e/(2+e)², beta(e)=4(1-e)/(2+e)².

Each of the following is an upper bound for the pointwise remainder
2(|X+h|-|X|-Re(h conjugate(ph(X)))):

    M0=U,
    M1=alpha(e)U+beta(e)H,
    M2=H+(16/27)eta U.

The first is norm concavity in the squared norm, the second is the
repository's directional-matrix bound, and the third is the sharp
cubic norm inequality proved in the previous round. These use the
actual perturbation norm, which is at least as informative as a
direction-independent upper bound for it.

At the exact configuration

    w=3/5, A=7/20, B=1/5, S=13/80,

the fresh source interval calculation proves

    E_Z min(M0,M1,M2) - Q(w,A,B) > 1/100.              (2)

In fact its certified lower bound is

    908137824272265/36028797018963968 > .0252.

Thus a proof that upper-bounds the actual remainder by this pointwise
minimum and then integrates cannot establish (P) at this configuration.
There is no assertion that the actual remainder violates (P).

### Certificate and exact lower integration

    python majorant_obstruction.py --repo /path/to/grothendieck-lean

The driver integrates on [-4,4]² in the Cartesian Gaussian source
plane, using a 1024 by 1024 dyadic grid and the repository's outward
interval primitives. On each box it bounds each of M0,M1,M2 from
below, then takes the minimum of these lower bounds, multiplies by
the lower Gaussian density, and sums downward. Both majorants and
their minimum are nonnegative; the omitted tail and the two boxes
where r could vanish contribute a valid lower bound zero.

For M1, alpha is increasing and beta decreasing on [0,1], so the
lower bound uses alpha(e_lower) and beta(e_upper). All other factors
in the source integrand are nonnegative. The runner freshly rebuilds
and recomputes the integral, rejects fast math and disabled assertions,
and independently checks the final comparison using exact fractions:

    integral lower = 2599302450529523/18014398509481984,
    Q exact = 112594284482123/945500000000000.

The coefficient e=eta when eta<1 is also sufficient to exclude using
a looser cap in M1 to improve (2). For fixed U>0 and 0<=H<=U, the
derivative of alpha(e)U+beta(e)H has numerator

    (18-16 H/U)+e(-9+4 H/U).

It decreases with e, so the minimum on [eta,1] lies at an endpoint.
Those endpoints are precisely M1 and M0, already included above.
The case U=0 is trivial.

## 5. What did not close (P)

The sharp-cubic source-matrix majorant of the previous round was
tested at w=.6 and physical amplitude .4. Even after 100,000 source
cells its all-direction matrix was too large for (P). This is a
limitation of that majorant, not a numerical candidate violating (P).
A regularized quadratic norm-tangent price centered near A=.35,B=.20
was also too loose globally: the associated quadratic form has a
positive eigenvalue about 1.24 above Q(w) (exploratory quadrature).

The fresh complex-phase optimization found no violation of (P), but
it produced the robust phase-reduction counterexample above. A full
proof still needs an averaging inequality that preserves phase
couplings, or a certified localized cover of the genuine remaining
five-real-parameter domain. No full cover was produced in this round.
