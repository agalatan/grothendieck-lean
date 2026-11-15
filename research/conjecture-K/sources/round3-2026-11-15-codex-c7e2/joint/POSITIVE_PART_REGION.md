<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/joint/POSITIVE_PART_REGION.md, 15 November 2026; relayed by the user from codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round3/joint/POSITIVE_PART_REGION.md -->
# A proved region for the centered joint positive-part target

Agent-ID: codex-c7e2. Baseline: `e9b0a458d06e67e9a1eee1168e98f34ef577b3a0`.

The new odd-sector theorem implies an explicit region for the requested
positive-part premise (B), without assuming (P), restricting coefficient
phases, or replacing genuine Gaussian fields by arbitrary sampled laws.
The proof actually bounds the positive part on the whole remote space;
the compact-event restriction only makes the requested quantity smaller.
This is a regional result, not a proof of (B) at every allowed energy.

The strongest unconditional-in-energy cutoff in this note is obtained
by the recentered potential certificate in section 5:

    V <=945500000/2571412396301873=3.6769675737...e-7.

If nu=0, that cutoff improves to 1.3749819787...e-6. These two numbers
consume the separate new 11/10 inverse-potential certificate. The
earlier results below require only the already reviewed master inputs.

Put alpha=217/100, k=32/25, p=2500/1891, rho=5053/10000 and

    m=p-463/5000-(67/100)(1+rho²)
     =7344303698127/18910000000000 >0.

Let u=E|q|², V=E(|r_A|²+|r_B|²), and
W=E|Q|²+E|P|²+|nu|². Define

    C_0(u)=264.35161799586848...,
    C_1(u)=alpha*18-m+4u(alpha*607-1/2),
    C_2(u)=alpha*68-m+4u(alpha*296-1/2),
    C_*(u)=min(C_0(u),C_1(u),C_2(u)).

Here C_0 is exactly alpha*122-m. Then

    E[(F_joint)_+]
      <= min{ C_*(u)V,
              (alpha-m)V+2 sqrt((1736/625) V W) }.            (1)

All constants used for acceptance are rational, except the displayed
square root. Thus either expression in (1) being at most 1/20000
proves the requested compact positive-part bound. No upper bound on W
or nu is needed for (1) itself. Applying the existing assembly still
requires its original energy and response caps.

Some certified sufficient V thresholds from the first expression are:

| Upper bound on u | Sufficient upper bound on V |
|---|---|
| Any u (constant C_0) | 945500000/4998889096301873 = 1.8914202371...e-7 |
| .0403448 | 945500000/4741644985204913 = 1.9940337223...e-7 |
| .01 | 945500000/1727224612301873 = 5.4740998551...e-7 |
| 0 | 945500000/731280296301873 = 1.2929378854...e-6 |

When W is very small the second expression is substantially better.
For example, at W=0 it permits V <= 1/[20000(alpha-m)], approximately
2.80644e-5. These thresholds do not close the near-u-star example
having V=.01 and W=.005.

If nu=0, a sharper additional bound holds for all q and all shared
Q/P fields:

    E[(F_joint)_+] <= [alpha*p/(p-k)-m]V.

Its coefficient is exactly 91073866937432983/1342610000000000,
approximately 67.83344898. Thus (B) holds on this subfamily whenever

    V <=67130500000/91073866937432983=7.3709948042...e-7.       (1a)

## 1. Definitions and inherited results

Use the definitions of the reviewed centered joint reduction:

    Y=L+q, L=Z(a+b|Z|²), a=699/1250, b=179/1250,
    K=(T-2/5)r_A+(3/5)rho r_B+Z² conjugate(r_B)/sqrt(2),
    O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2),
    S_r=|r_A|²+|r_B|², omega=|Q|²+|P|²+|nu|²,
    C=2h[(11/20)Re(Q)Re(nu)+Im(Q)Im(nu)],
    h=(I2-2I1)/sqrt(2),
    F_joint=Rjoint-B_P-p omega-C.

Here B_P is unchanged from (P), and Rjoint is the visible expectation
of the two norms minus the base and the K first variation. The proof
uses these reviewed inputs:

1. `sources/odd-cubic-core-2026-11-15/PROOF.md`, equations (4), (7):

       D_Y(O):=E_Z[|Y+O|+|Y-O|-2|Y|] <= k omega+C_old,
       C_old=-(3/5)Re(Q)Re(nu)-(6/5)Im(Q)Im(nu).

   This is conditional for every complex q,Q,P,nu, at every amplitude.
   Its matrix certificate also gives interval-specific upper constants
   kappa_i<k for every |q| in [i/40,(i+1)/40], and kappa=11/10 for
   |q|>=8. Coefficient phases are included in those matrix inequalities.

2. `sources/near-star-2026-11-15-codex-91d4/PROOF_NOTES.md`, section 3:

       Rem_Y(K):=2E_Z[|Y+K|-|Y|-Re(K conjugate(ph(Y)))]
                  <= alpha S_r.

   This follows from the global inverse-potential bound and holds for
   every q,r_A,r_B and every amplitude.

3. For the u-dependent improvement, the genuine shared Gaussian moment
   inequality E[|q|² S_r]<=4uV, already used by the centered joint
   reduction. For the W-dependent improvement, EQ=0 and constant nu.
   No conditional centering is used.

The radial integral h is freshly recomputed using exact rational
interval arithmetic, giving

    -.60807855603844108334 < h < -.60807855603844108333.

## 2. A pointwise reserve at zero A/B

For any admissible conditional matrix constant kappa, put

    G_kappa=kappa omega+C_old,
    D_kappa=p omega+C-G_kappa.

For kappa=k, both are positive definite quadratic forms in the six real
odd coefficients. In fact the fresh scalar checks give

    D_k >= (19/2500) omega,
    G_k <= 129 D_k.                                         (2)

In particular F_joint<=-(19/2500)omega when r_A=r_B=0,
pointwise for all q,Q,P,nu. This is stronger than cancellation after
remote averaging and proves (B) with zero left side at V=0.

The exact matrix checks are elementary. Real and imaginary Q/nu blocks
are diagonalized by Q+nu and Q-nu; P contributes a separate eigenvalue.
The corresponding eigenvalues g,d of G_kappa,D_kappa are:

| Coordinate | g | d |
|---|---|---|
| Re(Q+nu) | kappa-3/10 | p-kappa+3/10+(11/20)h |
| Re(Q-nu) | kappa+3/10 | p-kappa-3/10-(11/20)h |
| Im(Q+nu) | kappa-3/5 | p-kappa+3/5+h |
| Im(Q-nu) | kappa+3/5 | p-kappa-3/5-h |
| Re P, Im P | kappa | p-kappa |

The checker proves positivity of every d and of tau*d-g. Using only
the global k=32/25 theorem gives tau=129. Consuming the reviewed
whole-interval matrix bounds gives, simultaneously,

    G_kappa <= tau(|q|) D_kappa

for each of

    tau(w)=121,  tau(w)=17+607w²,  tau(w)=67+296w².            (3)

The same scalar comparison with kappa=11/10 covers the whole tail
w>=8. The dependence on w in (3) is handled on every complete source
certificate parameter interval, not by evaluating sample points.

## 3. Convexity transfer to arbitrary A/B coefficients

For 0<theta<1, convexity of the norm gives exactly

    Rjoint(Y,K,O)
      <= theta Rem_Y(K/theta)
           +(1-theta)D_Y(O/(1-theta))
      <= alpha S_r/theta+G_kappa/(1-theta).

The first line follows by writing each argument Y+K+/-O as
theta(Y+K/theta)+(1-theta)(Y+/-O/(1-theta)). The base and first
variation terms then cancel with precisely the displayed factors.
No retained coefficient is chosen conditionally in this argument;
theta is only an auxiliary number in an inequality for fixed values.

Taking the infimum over theta yields

    F_joint <= alpha S_r-B_P
                    +2sqrt(alpha S_r G_kappa)-D_kappa.

Since G_kappa<=tau D_kappa and D_kappa>=0, Young's inequality gives

    2sqrt(alpha S_r G_kappa)-D_kappa <= alpha tau S_r,

and therefore

    F_joint <= alpha(1+tau)S_r-B_P.                          (4)

This includes the zero cases by continuity. The elementary lower bound

    B_P >= (m+|q|²/2)S_r+S_r²

uses |r_A+rho r_B|²+|r_B-rho r_A|²=(1+rho²)S_r.

For tau=t0+t2|q|², drop -S_r² and, when t2=0, also drop the negative
|q|² term. The remaining upper bound is nonnegative. Consequently

    (F_joint)_+ <= [alpha(1+t0)-m]S_r
                   +max(0,alpha t2-1/2)|q|² S_r.

Taking expectations and using the genuine shared moment inequality
proves the first expression in (1). Keeping only tau=129 instead gives
a version depending solely on the published 32/25 theorem:

    E[(F_joint)_+] <= (130 alpha-m)V,

which already proves (B) whenever
V <=945500000/5327166696301873=1.7748646774...e-7.

When nu=0 both compensators vanish pointwise. Then G_k=k omega,
D_k=(p-k)omega, so the same proof works with tau=k/(p-k).
Substitution in (4) proves (1a), without any centering step.

For the second expression in (1), use kappa=k and D_k>=0 before
applying Young's inequality. Since alpha-m>0,

    (F_joint)_+ <= (alpha-m)S_r+2sqrt(alpha S_r G_k).

Full remote expectation gives E G_k=kW because EQ=0 and nu is
constant. Cauchy-Schwarz then proves that expression. The compensation
is removed only at this full expectation step.

## 4. Verification and limitations

Run

    python verify_positive_part.py --repo /path/to/grothendieck-lean

The checker regenerates h using exact Fraction arithmetic and outward
220-bit dyadic intervals; verifies the five scalar matrix eigenvalue
inequalities; checks all 320 complete parameter intervals in BOTH the
original and independently reviewed PR447 outputs; takes the larger
certified upper bound on each interval; verifies the analytic tail;
and computes all regional thresholds exactly. It records source hashes
and results in `positive_part_result.json`. Optimized Python is rejected.

This is a new exact consumer of the reviewed source-matrix certificate.
It does not claim that those source integrals were recomputed here.
The nonlinear convexity argument is analytic. No Lean theorem is
claimed, and the full allowed V,W domain remains open.

## 5. Sharper corollaries from the recentered potential

Two separately proved potential estimates from this round can improve
the preceding result. They concern different decompositions of the same
fixed X=Y+K:

| beta | New proof base Y' | Perturbation H=X-Y' |
|---|---|---|
| 7/4 | L+q+(15159/50000)r_B | (T-2/5)r_A+Z² conjugate(r_B)/sqrt(2) |
| 11/10 | L+q+(7/50)r_A+(15159/50000)r_B | (T-27/50)r_A+Z² conjugate(r_B)/sqrt(2) |

For both rows, the new theorem is the pointwise conditional estimate

    E_Z |H|²/|Y'| <= beta S_r

at every remote shift, amplitude and complex phase. The 7/4 result is
the exact polynomial-density proof in
`../odd-taylor/UNIVERSAL_ODD_AB_REGION.md`, section 3, with its rational
Node checker. The sharper 11/10 result is
`../odd-perturb/RECENTERED_EVEN_POTENTIAL.md`: its compact shift domain
has a fresh 600-interval source certificate, and its unbounded shift
tail is analytic. The complete source replay belongs to that packet.
These potential theorems are explicit additional inputs to this section.

There is no change to B_P, C, the original first variation, or the fixed
trial X. Use the exact identity

    Rjoint=Rem_Y(K)+D_X(O).

Apply the convex interpolation to D_X(O) at the new base Y', dropping
its nonpositive term -Rem_Y'(H), as in the odd-over-A/B proof. This gives

    D_X(O) <= beta S_r/theta+G_kappa/(1-theta).

The old potential estimate still bounds Rem_Y(K)<=alpha S_r. Therefore
the preceding optimization and Young inequality yield

    F_joint <= [alpha+beta(1+tau)]S_r-B_P.                 (5)

Here kappa and the constant tau=121 may be used at the arbitrary new
remote shift because their bounds are uniform. No q'-dependent affine
tau bound or moment estimate is used. In particular,

    E[(F_joint)_+] <= (alpha+122 beta-m)V.                 (6)

When nu=0, take tau=k/(p-k) instead, obtaining

    E[(F_joint)_+] <= [alpha+beta*p/(p-k)-m]V.             (7)

The exact scalar consumers, freshly checked by the companion script, are:

| beta | Coefficient in (6) | Sufficient V for (B) | Sufficient V when nu=0 |
|---|---|---|---|
| 7/4 | 215.28161799586848... | 945500000/4070975396301873 = 2.3225392147...e-7 | 67130500000/76259205637432983 = 8.8029372242...e-7 |
| 11/10 | 135.98161799586848... | 945500000/2571412396301873 = 3.6769675737...e-7 | 469913500000/341759751962030881 = 1.3749819787...e-6 |

The proof of (5)-(7) was independently checked, including the necessary
7r_A/50 shift in the 11/10 row. This consumer checker recomputes the
rational thresholds; it does not substitute for the separate potential
certificate replays.
