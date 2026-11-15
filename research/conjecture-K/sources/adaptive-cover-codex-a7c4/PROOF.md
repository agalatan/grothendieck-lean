<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-compact-cover/PROOF.md (2026-11-15). Only this line was added. -->
# Uniform shift curvature and an amplitude-adaptive tube

Agent-ID: codex-a7c4. Refs #431. Author-only derivation and interval replay;
independent review is required. Full (P) and a new lower endpoint remain open.

Use the peak constants, normalized remainder R(w,D,tau)=Rem(w,tau D)/tau²,
and J=R-Q0(D)-w²S/2-tau²S² from the normalized-remainder proof.
Here D=(A,B), S=|A|²+|B|², w is real and nonnegative, and tau>=0.
At tau=0 use the continuous normalized limit. This note strengthens the
spatial continuation, without changing the existing source integrator.

## 1. A global lower bound for the second shift derivative

Write a0=a+bT, c0=a+3bT, D0=a0*c0, f(T)=exp(-T)/D0,
M(T)=.503+1.226T and m(T)=1+b/a0+3b/c0.
In base polar coordinates L+w=r exp(i theta), differentiating in w keeps
r,theta fixed. The inverse map Z satisfies

    |Z_w| <= 1/a0,
    |Z_ww| <= 6b sqrt(T)/a0³,
    |T_w| <= 2sqrt(T)/c0,
    |T_ww| <= 2/D0.

The first two follow from the minimum singular value a0 of
Z -> (a+b|Z|²)Z and its Hessian bound 6b|Z|. For the last bound, the
radial and tangential eigenvalues of the Hessian of T as a function of L are
2(a-3bT)/c0³ and 2/D0; |a-3bT|a0 <= c0². In particular these estimates
also hold at T=0 by smoothness of the inverse map.

For h=(T-.4)A+cB+Z² conjugate(B)/sqrt(2), its real differential and
second differential have operator norms at most sqrt(6T)*sqrt(S) and
sqrt(6)*sqrt(S). Therefore, for k=h exp(-i theta),

    |k| <= M sqrt(S),
    |k_w| <= K1 sqrt(S),       K1=sqrt(6T)/a0,
    |k_ww| <= K2 sqrt(S),      K2=sqrt(6)/a0²*(1+6bT/a0).

Also f_T=-mf and f_TT=(m²+b²/a0²+9b²/c0²)f. Apply the normalized
one-sided derivative lemma to F=4r f G_tau. Its distributional second
w derivative is bounded below by -4f B(T) S, where

    B = 2M K2 + 4m*(2sqrt(T)/c0)*M K1
        + (1/2)[(m²+b²/a0²+9b²/c0²)*4T/c0² + 2m/D0] M².

The nonnegative singular Hessian of the perturbed norm is retained. There
is no inverse power of tau and no assumption that the perturbed norm stays
nonzero. Replace sqrt(6) by 5/2 to get the rational envelope Bbar used by
`shift_curvature.cpp`. The inherited outward arithmetic verifies

    sup_{T>=0} exp(-T) Bbar(T)/D0(T) < 100,
    integral_0^infinity exp(-T) Bbar(T) dT < 140.

On [0,36] it uses interval rectangles of width 1/256, including the
exponential envelope. On T>=36, M<=(5/4)T, a0>=bT, c0>=3bT,
m<=19/18. Consequently Bbar<=T/b²: after division by T/b² its terms
are bounded by

    (35/2)(5/2)/36² + (10/3)(19/18)(5/2)/36
    + (25/72)((19/18)²+2/36²) + (25/48)(19/18)/36 < 1.

The tail mass is at most 37 exp(-36)/b², and the tail density is at most
exp(-36)/(108b^4). All these comparisons are checked outward.

The positive measure with density exp(-T) Bbar(T)/(pi D0(T)) in the
L-plane has mass at most 140 and density at most 100/pi. For any such
measure of mass m0 and density M0/pi, layer cake gives, uniformly in w,

    integral 1/|L+w| dmu <= integral_0^infinity min(m0,M0/s²) ds
                          = 2sqrt(M0*m0).

Thus integrating the lower derivative bound in base polar coordinates gives

    R_ww >= -2 S E[Bbar(T)/|L+w|] >= -480 S,
    J_ww >= -481 S.

The constant is strict because 16*100*140 < 480². To justify integrating
the distributional inequality, first use fixed positive radial cutoffs,
then let the inner cutoff tend to zero and the outer cutoff to infinity.
The preceding potential estimate controls the negative part uniformly in w;
the normalized remainder is dominated by the inherited potential bound.
The inequalities pass to the distributional limit, including tau=0. A
positive norm-Hessian singular part cannot worsen the lower bound.

## 2. Coefficient and amplitude interpolation

Let d=(Re A,Im A,Re B,Im B), with each d_i in [l_i,h_i], and let
Smax=sum_i max(|l_i|,|h_i|)². The normalized remainder is convex in d
at fixed positive tau, because h is linear and its subtracted variation is
linear. Its tau=0 limit is convex too. Write

    qa=p-.0926-.67-.08 rho0²,
    qb=p-.0926-.67 rho0²-.08.

For q_i=qa,qa,qb,qb respectively, throughout a box with tau<=tmax,

    J_(d_i d_i) >= -Mi,
    Mi=2q_i+wmax²+4tmax² Smax+8tmax² max(|l_i|,|h_i|)².

Successive one-dimensional chord bounds give

    J(interior) <= max_corner J + Espace,
    Espace=481 Smax (wmax-wmin)²/8 + sum_i Mi (h_i-l_i)²/8.

Mixed derivative estimates are unnecessary: interpolate one coordinate at
a time, using uniform diagonal bounds. On a positive amplitude interval
[l,h], the existing amplitude argument adds the sufficient endpoint reserve

    Eamp=[(2(p-.0926)+wmax²)Smax+12h²Smax²]*(h-l)²/(8l²).

The runner checks every spatial corner at both amplitude endpoints with
reserve Espace+Eamp+10^-6, rounded upward to a dyadic with denominator 2^24.
First apply spatial interpolation at the endpoints, then amplitude
continuation. On [0,1/64] it checks the entire amplitude interval directly
at each spatial corner, with Espace+10^-6. Both rules certify closed boxes.

Complex conjugation of Z preserves its law and conjugates L,w,h, with w
real. Thus J(w,conjugate(D),tau)=J(w,D,tau). For the symmetric imaginary
intervals here, the eight spatial corners with Im A positive account for
all sixteen distinct spatial corners. Im B still takes both signs. The
fixed Re A=1 coordinate introduces no interpolation error.

## 3. Explicit region and coverage

Every box is centred at w=3/5 and y=37/64 in

    A=tau(1+i x), B=tau(y+i z).

For each amplitude band below, |x|,|z| and |y-37/64| are at most r, and
|w-3/5| is at most delta/2:

| tau band | r | delta (full shift width) |
|---|---|---|
| [0,1/8] | 1/8 | 1/64 |
| [1/8,1/4] | 1/16 | 1/128 |
| [1/4,1/2] | 1/32 | 1/128 |
| [1/2,5/8] | 1/16 | 1/64 |
| [5/8,7/8] | 1/8 | 1/32 |

Above 7/8, S_physical>=tau²>=49/64>3/4, so the reviewed amplitude
exterior applies to every direction and shift. In particular the smallest
box (r=1/32, delta=1/128) is valid at every amplitude, once every listed
corner check passes. The positive-amplitude manifest has 64 intervals;
the direct zero strip adds one. Shared endpoints are checked once with
the largest required reserve. There are 560 distinct corner jobs.

The exact aggregator regenerates the manifest, checks the interval chain,
requires every corner index exactly once, checks source hashes, rational
job descriptions and strict upper/target comparisons. Shard receipts
explicitly remain partial. Recorded values can vary in their final bits
and adaptive cell counts across platforms; a fresh replay must satisfy
all the same inequalities. Source hashes, not historical floating outputs,
identify the computation. Receipts record executions; they do not replace
a fresh replay or kernel checking.

This is an enlarged amplitude-complete tube and an interpolation method
usable elsewhere. It does not cover all shifts or coefficient directions.
Full (P), the independent odd averaged premise, and an improved Grothendieck
lower bound remain open. No Lean theorem or lower endpoint changes here.
