<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-direction-cover/PROOF.md (2026-11-15). Only this line was added. -->
# Matrix regions covering every coefficient direction

Agent-ID: codex-a7c4. Refs #431. Author-only derivation; independent review
is required. The full compact interior of (P) remains open.

Use a=699/1250, b=179/1250, c=15159/50000, d=2/5, p=2500/1891,
rho=5053/10000. Let Z be standard complex Gaussian, T=|Z|²,
L=Z(a+bT), h_D=(T-d)A+cB+Z² conjugate(B)/sqrt(2), D=(A,B), and

    S=|A|²+|B|²,
    Q0(D)=(p-.0926)S-.67|A+rho B|²-.08|B-rho A|².

The pointwise target (P) is

    Rem(w,D) <= Q0(D)+|w|² S/2+S²,
    Rem(w,D)=2E[|L+w+h_D|-|L+w|-Re(h_D conjugate(ph(L+w)))].

No remote averaging, odd-sector allowance or new witness profile is used.
A simultaneous rotation of Z,w,A,B reduces w to a nonnegative real number;
all asserted regions are invariant under the corresponding common rotation
of A,B. At S=0 the target is equality. Otherwise write D=s E with s=sqrt(S)
and ||E||=1. Set R(w,E,s)=Rem(w,s E)/s², using its continuous limit at s=0.

## 1. A matrix majorant with an amplitude cap

In base polar coordinates L+w=r exp(i theta), define k=h_E exp(-i theta),

    G_s=(|r+s k|-r-s Re k)/s²,
    0 <= G_s <= |k|²/(2r).

For r>0 and s>0 there is the exact identity

    |k|²-2r G_s = (|r+s k|-r)²/s².

Suppose s|k|<=eta r, with 0<eta<1. Young's inequality gives

    (2r Re k+s|k|²)²
      >= (1-eta)(2r Re k)²-(1/eta-1)s²|k|⁴
      >= r²(1-eta)[4(Re k)²-eta |k|²].

Since |r+s k|+r<=(2+eta)r, division yields a lower bound for
(|r+s k|-r)²/s² with denominator (2+eta)². When the displayed lower
numerator is negative this remains valid simply because the square is
nonnegative. Substitution in the identity gives

    G_s <= [alpha(eta)|k|²+beta(eta)(Im k)²]/(2r),
    alpha(eta)=9eta/(2+eta)²,
    beta(eta)=4(1-eta)/(2+eta)².                         (1)

At eta=1 use the original potential bound; it requires no amplitude
restriction. At eta=0 use the normalized limit G_0=(Im k)²/(2r).
On [0,1], alpha is nonnegative and increasing, while beta is nonnegative
and decreasing.

For every unit direction E,

    |h_E| <= M(T),
    M(T)=sqrt((T-d)²+(c+T/sqrt(2))²).

Indeed the real-linear B map has operator norm c+T/sqrt(2), and Cauchy
bounds the A and B contributions together. Hence for all 0<=s<=smax,
(1) applies with

    eta=min(1,smax M(T)/r).

When eta=1, validity comes from the unconditional potential bound, not
from an assertion that s|k|<=r. Crucially, eta is independent of E.
This makes the resulting bound a quadratic form covering all directions.

## 2. Source matrices and their certified integrals

Let y=r exp(i theta)-w, solve T(a+bT)²=|y|², and put Z=y/(a+bT),
D0(T)=(a+bT)(a+3bT), f(T)=exp(-T)/D0(T). The reviewed inverse-map
jets and interval root brackets are reused unchanged from KINT's
`potential_integral.cpp`. Floating Newton steps only propose brackets;
outward endpoint signs accept them.

Let P(w,r,theta) be the real quadratic matrix of |h_E|², and H(w,r,theta)
that of (Im(h_E exp(-i theta)))². These are positive semidefinite pointwise.
Changing variables in R=2E G_s cancels the radial Jacobian against 1/r.
After reflection in the real axis, the real/imaginary mixed blocks vanish.
The two 2x2 blocks therefore have kernel

    2 f(T) [alpha(eta) P + beta(eta) H],
    r>=0, theta=pi u, 0<=u<=1.                         (2)

Here P,H denote the respective polynomial block entries without the
weight. The same factor 2 would appear on the full circle theta=2pi u;
the reflection is justified before omitting the mixed blocks.

On each source rectangle the code encloses eta in [eta_lo,eta_hi], then
uses the constants A=alpha(eta_hi), B=beta(eta_lo), each rounded upward.
Because both matrices are PSD, the constant-coefficient integral
A integral(P)+B integral(H) is a Loewner upper bound for (2).
This is not an entrywise assertion: off-diagonal signs do not invalidate
the PSD comparison. The entries of this constant-coefficient matrix are
then enclosed by midpoint quadrature with interval second-order jets:

    area * [F(mid) +/- (sup|F_rr| dr²+sup|F_uu| du²)/24].

Every coefficient bound is recomputed after subdivision. The source
priority is numerical only; every acceptance uses outward matrix sums.
Parameter point inputs and reported endpoints are hexadecimal binary
numbers. The Python checker reconstructs them as exact fractions.

There is no discarded inner disk. P and H extend smoothly to r=0 in
these rectangular polar variables. For an interval containing r=0, eta
is conservatively capped at 1 instead of dividing by zero. The source
integral is truncated at r=40. For w<=2 the omitted true remainder is
bounded by the reviewed potential tail, at most 111 exp(-36)||E||²<10^-10
||E||². The inherited exact tail checker is freshly replayed. The tail is
bounded by the original potential, not by extrapolating the coefficients
A,B of the finite source rectangles.

If the resulting matrix is M(w,smax), then for 0<=s<=smax,

    R(w,E,s) <= E^T M(w,smax) E.

For a physical amplitude band [slo,shi], it suffices to certify

    Q0 + (w²/2+slo²-e)I - M(w,shi) positive definite.   (3)

This gives normalized defect less than -e for every unit E and every
amplitude in the band. The verifier checks both diagonal entries and the
determinant of each 2x2 block. The Python aggregator repeats these
comparisons with exact rational arithmetic on the reported interval
endpoints; no floating eigenvalue is an acceptance rule.

## 3. Shift interpolation and the explicit all-direction regions

The normalized shift-curvature estimate from #443 is

    R_ww >= -480 ||E||²,
    J_ww >= -481 ||E||²,
    J=R-Q0(E)-w²||E||²/2-s²||E||⁴.

The constant's density/mass certificate is freshly replayed. It is
independent of amplitude and permits zeros of the perturbed norm. For
unit E, endpoint checks with reserve greater than 481(delta w)²/8 certify
the whole shift interval by the one-dimensional chord inequality.

The exact manifest uses shift step 1/128 and reserve
61585/16777216, the upward dyadic rounding of 481/(8*128²)+10^-6.
All directions are handled simultaneously by (3); there is no mesh in E.
Each endpoint certificate bounds a whole amplitude band, so no further
amplitude interpolation is needed here.

The certified origin profile is:

| real shift w | amplitude cap s=sqrt(S) |
|---|---|
| [0,1/8] | 1/512 |
| [1/8,1/4] | 1/256 |
| [1/4,1] | 1/64 |
| [1,9/8] | 1/32 |
| [9/8,19/16] | 1/16 |
| [19/16,5/4] | 3/32 |

For w in [5/4,11/8], the amplitude endpoints are
0, 1/8, 5/32, 6/32, ..., 16/32, 5/8, 3/4, 7/8. This is a
contiguous chain of sixteen bands. The existing S>=3/4 exterior covers
s>=7/8, and the existing |w|>=11/8 exterior covers larger shifts.
Consequently the complete replay proves

    (P) for every complex shift and direction if sqrt(S)<=1/512;
    (P) for every amplitude and direction if |w|>=5/4;

as well as the wider origin profile in the table. The scalar small-strip
threshold is 97.65625 times the earlier 1/50000 threshold. This comparison
concerns amplitude, not the volume of the unresolved region.

## 4. A directional exterior at every shift and amplitude

The potential matrix P_w from KINT satisfies

    Rem(w,D) <= D^T P_w D

without an amplitude restriction. Write

    F_w(D)=Q0(D)+w²S/2-D^T P_w D,
    g(D)=|2A+B|²-S/2.

For each certified shift interval, `cone_integral.cpp` finds a common
lambda=n/128, 1<=n<=48, such that both real and imaginary blocks of
F_w+lambda g are positive definite uniformly on that interval. The
matrix of g in each block is [[7/2,2],[2,1/2]]. A single lambda is used
for both blocks; separate multipliers would not justify the combined
complex constraint. The same exact rational PSD audit is applied to
every reported enclosure.

Thus F_w(D)>-lambda g(D) for D nonzero. If g<=0 then (P) holds at
every amplitude. If g>=0, lambda<=3/8 shows that S²>=(3/8)g suffices.
Together, the single sufficient condition is

    16 S²+3 S >= 6|2A+B|².                            (4)

In particular the cone |2A+B|²<=S/2 is amplitude-complete. The source
cover runs over [0,11/8], and the reviewed shift exterior handles every
larger complex shift. Common phase rotation preserves g and S.

A concrete mixed-driver consequence is available without global (P).
If r_B=kappa r_A pointwise and |kappa+4|<=3, then

    |2r_A+r_B|²-(|r_A|²+|r_B|²)/2
       = |r_A|² (|kappa+4|²-9)/2 <= 0.

Thus (P) holds for every remote shift q on this entire proportional
holomorphic-driver family. Define A_shell=(T-1)r_A and
B_shell=Z² conjugate(r_B)/sqrt(2), with u=||q||² and
V=||r_A||²+||r_B||². Under the unchanged energy caps u<=0.0463 and
u+V<=0.080051, the already reviewed conditional joint bridge (ledger 7.4.10)
therefore gives the unconditional restricted-family estimate

    Lambda_hat(q+A_shell+B_shell) < S_G + 4936/10^8.

Here S_G denotes the Gaussian benchmark, not the physical amplitude energy
S used in this note. The remote cubic may share its variables with r_A;
no independence assumption is added. This corollary does not include odd
sectors or arbitrary A/B driver pairs.

For the central example kappa=-2, the existing uniform content norm bound
gives a sharper allowance without using the content-deficit estimate.
Put x=||r_A||, delta=2rho-1, C=1/50 and E=7532/10^7; the reviewed
centered-error bound gives ||e||<=E since E²>=(7/2000)² E0. Then
V=5x², ||R||=delta x and ||U||=(2+rho)x. The reviewed averaged joint
identity and u+V<=80051/10^6 bound the gain over Lambda(q) by

    2(C delta+2E)x-K x²,
    K=(31/100)delta²+(2/25)(2+rho)²
                         -10(80051/10^6-E0)>0.

Completing the square gives gain <=(C delta+2E)²/K. The exact checker
`joint_family.py` verifies, after adding the reviewed remote gap 36/10^8,

    (C delta+2E)²/K+36/10^8 < 19/10^6.

Thus Lambda_hat(q+A_shell+B_shell)<S_G+19/10^6 for r_B=-2r_A under
the same energy caps, in every remote dimension and with arbitrary sharing.
This is an unconditional restricted-family estimate, not a bound for all
adversaries or a new Grothendieck lower endpoint.

## 5. Replay, coverage and limits

The runner compiles strict outward arithmetic with assertions retained,
rejects disabled assertions and fast math, replays the inherited density,
tail and shift-curvature checks, and rejects an impossible matrix reserve.
A source-cell limit returns UNRESOLVED, never PASS. The cone driver
subdivides unresolved shift intervals and fails if its minimum width is
reached. The all-direction matrix jobs have fixed exact endpoints and
must all pass; unresolved points are not omitted or sampled away.

There are 438 endpoint matrix jobs and eight cone-cover roots. The exact
aggregator requires every job once, audits every reported PSD comparison,
checks every adaptive cone interval chain and the fixed endpoint grids,
and validates hashes of all numerical source dependencies. Shard receipts
remain partial. The combined receipt always records complete_interior=false.
Numerical rounding and adaptive cell counts may differ across platforms;
fresh execution must satisfy the same strict inequalities and exact coverage.
A receipt records a run and does not replace fresh execution or Lean checking.

These regions leave the central finite-amplitude, positively aligned
coefficient directions unresolved. They do not prove full (P), the odd
averaged premise, Conjecture K, or a new Grothendieck lower endpoint.

## 6. Completed verification

Cloud run 43718049407 passed both shards (129 s and 123 s). Exact aggregation
accepts all 446 jobs: 438 endpoint matrices and 93 adaptive cone intervals,
531 matrix enclosures in total. The maximum source-cell count was 36,000,
below the 120,000 matrix cap and 40,000 cone cap. The combined receipt is
199,961 bytes and is committed as `code/directional-matrix-codex-a7c4/result.json`.
The separate exact `joint_family.py` check and its assertion-disable rejection
controls pass. The strengthened results remain P+C, author only, pending
independent derivation and replay.

The receipt-corruption checks reject partial coverage, duplicate/missing jobs,
stale hashes, negative indices, failed PSD comparisons, changed reserves or
shift coordinates, out-of-range cone multipliers and missing cone intervals.
