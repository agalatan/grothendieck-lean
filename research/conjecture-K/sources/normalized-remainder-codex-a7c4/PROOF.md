<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-compact-next/NORMALIZED_PROOF.md (2026-11-15). Only this line was added. -->
# A normalized visible remainder and amplitude continuation

Agent-ID: codex-a7c4. Task #431. Author-only proof; independent review pending.
This note does not prove the full compact interior of (P) or a new lower endpoint.

## 1. Exact quantity

Use the peak constants and Q0 from KINT: a=699/1250, b=179/1250,
c=15159/50000, d=2/5, p=2500/1891, rho0=5053/10000.
Let Z be standard complex Gaussian, T=|Z|², L=Z(a+bT),
and h_D=(T-d)A+cB+Z² conjugate(B)/sqrt(2), for D=(A,B).
Set S=|A|²+|B|² and

    Q0(D)=(p-.0926)S-.67|A+rho0 B|²-.08|B-rho0 A|².

Write the physical coefficients as tau D, with tau>=0. At tau>0 the
normalized defect is

    J(w,D,tau)=Rem(w,tau D)/tau²-Q0(D)-w² S/2-tau² S².

All directions in this note are relative to real w>=0. Simultaneously
rotating Z,w,A,B supplies the corresponding complex-shift version.

Use the base polar coordinate L+w=r exp(i theta), with theta=2pi(u-1/2).
For y=r exp(i theta)-w, T is the unique nonnegative solution of
T(a+bT)²=|y|², Z=y/(a+bT), and D0(T)=(a+bT)(a+3bT).
Define k=h_D(Z) exp(-i theta) and

    G_tau(r,k)=(|r+tau k|-r-tau Re k)/tau²,
    W(r,u,w)=4r exp(-T)/D0(T).

Then Rem/tau² is exactly the integral of W G_tau over r>=0, 0<=u<=1.
The factor 4 includes the factor 2 in Rem and the angular Jacobian 2pi.
At tau=0 use G_0=(Im k)²/(2r); this is the pointwise limit for r>0.

Convexity and concavity of the square root give

    0 <= G_tau <= |k|²/(2r).

For nonzero denominator an equivalent evaluation is

    G_tau = (Im k)²/(|r+tau k|+r+tau Re k).

The code intersects the latter interval, the direct expression when tau>0,
and [0,|k|²/(2r)]. When the denominator interval reaches zero it does not
divide by it. In particular, this computation tolerates zeros of the
perturbed visible map and an amplitude interval with endpoint zero.

## 2. One-sided derivatives without inverse powers of amplitude

Let x be r, u or w, with the other base coordinates fixed, and let a prime
denote differentiation in x. Write v=r+tau k. The norm's distributional
second derivative has a nonnegative Hessian contribution, even through
zeros. Since r''=0 in each of these coordinates,

    G_tau'' >= Re[(ph(v)-1) conjugate(k'')]/tau
             >= -2 |k| |k''|/r.

Here |ph(v)-1|<=2 tau |k|/r, away from zeros; the almost-everywhere
inequality and the nonnegative singular part suffice distributionally.
For u,w, where r'=0,

    |G_tau'| <= 2 |k| |k'|/r.

For r use Re(ph(v)-1)=-|ph(v)-1|²/2 almost everywhere to obtain

    |G_tau'| <= 2|k|²/r²+2|k||k'|/r.

These estimates are uniform for tau>0. The same one-sided inequalities
hold at tau=0 by local uniform convergence on r>0. Products with the
smooth nonnegative weight W preserve the sign of the singular part.
Thus F=W G_tau has F_xx>=-M_x, with

    M_x = W*2|k||k''|/r + 2|W'| B_x + |W''| |k|²/(2r),

where B_x is the corresponding first-derivative bound above. Every M_x
is independent of tau. No lower bound on |L+w+tau h_D| is used.

On a source rectangle of side lengths dr,du, one-dimensional chord
interpolation applied successively in r,u gives the upper integral

    area * (average of four corner values
            + sup M_r * dr²/12 + sup M_u * du²/12).

The factor 1/12 follows by integrating (x-lo)(hi-x)/2. The code encloses
M_r,M_u by interval second-order jets, not by numerical differentiation.
It reuses the reviewed implicit inverse-T jets of KINT. Norm derivatives
themselves are never evaluated at perturbed zeros.

## 3. Cutoffs and interval arithmetic

For M(T)=503/1000+(613/500)T, |h_D|<=M(T)sqrt(S). The inherited exact
density certificate states exp(-T)M(T)²/D0(T)<=81/100. Consequently the
discarded base disk r<epsilon has normalized remainder at most
2*(81/100)*epsilon*S. We take epsilon=1/65536.

For 0<=w<=2, the KINT tail argument bounds the potential beyond r=40 by
111 exp(-36) S < 10^-10 S. The normalized remainder is bounded by that
potential at every amplitude, so the same tail applies here. The runner
freshly replays the inherited exact density and tail checkers.

All accepted sums and parameter expressions use outward interval
arithmetic with FE_UPWARD, strict floating-point compilation, and retained
assertions. Floating Newton iteration only proposes inverse-T brackets;
interval endpoint signs accept them. Adaptive subdivision priority is
numerical only. A cell limit yields UNRESOLVED with nonzero exit, never PASS.
Periodic upward resummation reduces accumulated overestimation without
discarding any cell. No sampled grid is a continuum acceptance rule.

Parameter boxes remain intervals at every source corner and in every jet.
Acceptance therefore proves the statement for all parameters in the box.
Only quadrature in r,u is performed; there is no assumption that the worst
parameter lies at its midpoint. At tau=0 the accepted assertion concerns
the continuous normalized limit; the original (P) is equality there.

## 4. Amplitude continuation

For fixed w,D define H(tau)=tau² J(w,D,tau). Its norm term is convex in
tau and its first-variation term is linear. Hence on [l,h], l>0,

    H'' >= -M,
    M=(2(p-.0926)+w_max²) S_max + 12 h² S_max².

This uses Q0(D)<=(p-.0926)S. If both endpoint normalized defects are
at most -e, chord interpolation gives

    H(tau) <= -e[(1-t)l²+t h²] + M(h-l)²/8
            <= -e l² + M(h-l)²/8,  0<=t<=1.

Therefore e>M(h-l)²/(8l²) suffices uniformly in the parameter box. This
requires relative amplitude resolution, not absolute resolution tending
to zero with amplitude. The checker computes each required e exactly with
Fraction arithmetic, adds 10^-6, then rounds UP to a dyadic. Each endpoint
uses the largest reserve required by its adjacent amplitude intervals.

## 5. Proposed complete-amplitude tube

The finite replay is designed to prove (P) on

    2457/4096 <= w <= 2459/4096,
    A=tau(1+i x), B=tau(y+i z), tau>=0,
    |x|,|z|<=1/4096,
    2367/4096 <= y <= 2369/4096.

The region [0,1/64] in tau is one direct interval check. From 1/64 to 7/8
the exact partition uses 16 subintervals per dyadic octave and the endpoint
continuation above. For tau>=7/8, S_physical>=tau²>=49/64>3/4, so the
independently reviewed KINT amplitude exterior applies. This tube has
positive width in all five reduced parameters but does not cover arbitrary
directions or shifts. Its complete-amplitude claim is conditional on every
assigned endpoint check and the final coverage aggregation passing.

The runner's shard receipts explicitly say they are partial. The aggregator
requires exactly every manifest index, rejects duplicates/missing indices,
checks the numerical upper/lower comparisons and source hashes, and records
complete_interior=false even when complete_tube=true. Neither this tube nor
the general quadrature lemma closes the odd-sector premise or yields a new
Grothendieck bound by itself.
