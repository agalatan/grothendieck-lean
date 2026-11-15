<!-- New fourth-audit note. Agent-ID: codex-a7c4. Refs #406. -->
# Joint sector audit: exact obstructions and a smaller compact domain

Agent-ID: codex-a7c4. Refs #406. Initial baseline
`2442792eab87cc48a71ba29dc74be7a250b4a03a`, after merged #403; resynced to
`9a93fb47264f12c74840bc671a80154abc7eca28`, after merged #408.
New proofs below are **P by author, not externally reviewed**. The exact
scalar checks are **C** within the scope of
[`joint_reduction.py`](../../code/fourth-audit-2026-11-15-codex-a7c4/joint_reduction.py).
The root audit worker independently re-derived the mixed normalization,
dominated limit, tail density and potential bound, and replayed the checker;
this within-session check does not replace external review.
No finite-amplitude joint theorem over arbitrary cubic bases is asserted.

## 1. Audit findings and scope

The renewed reading covered MONOGRAPH §§3.1–3.2 and §4b, STATUS §§5,7,11,
and the failed assembly routes of §13. The preceding audit's odd-sector
counterexamples, retained/raw distinction, Hessian regularity qualification
and joint-cost requirements survive this pass. The resync also covered the
new STATUS 11(e), the fifth tilted-sector report and its third review, and
the new joint/five-sector scan definitions. It found an impossible exact
target in the new joint recommendation (§2.1 below), and turns an existing
numerical pointwise obstruction into an exact one (§2.2). A failed Hessian
inequality at intermediate
bases does not refute a finite norm-remainder inequality; these remain
distinct assertions.

Two completed improvements narrow remaining work:

| Baseline | Improvement | Boundary |
|---|---|---|
| STATUS 7.3.1 is R and quotes a .07 diagonal reserve | Re-derive the entire complex A/B quadratic form at zero base and certify a common .08 reserve at the three named rows | An infinitesimal theorem at q=0 only; no integration through visible-dependent bases |
| STATUS 7.4.5 and §15 retain the shift interval [0,6] | Certify the all-amplitude shift tail already for \|x\|≥17/4, with a .027 diagonal reserve | The remaining joint box [0,17/4] is still open; no certificate for that box is supplied |

The first is a fresh verification and strengthening of an existing local
result. The second refines the existing Gaussian-tail reduction, preserving
its hypotheses and arbitrary dependence between the remote cubic and shell
drivers. Neither is a new proof of K or K′.

The newly merged global tilted-A theorem, STATUS 11.39–11.40, has already
removed localisation and amplitude-tail requirements for that particular
sector at tilt 3/5. Its remaining problem is the tilted content versus
deficit, 11.43, or the augmented remote certificate, 11.44. The raw joint
A/B bound remains open. The smaller box below is a sufficient fallback for
that raw joint problem; it is not an additional prerequisite for 11.40.
This bounded resync review does not claim a new line-by-line audit of the
tilted-sector C++ certificate.

## 2. Re-derived local Hermitian form

Let Z be standard complex Gaussian, T=|Z|², L=Z(a+bT), with a,b>0,
p=1/epsilon. Let r_A,r_B be arbitrary remote L² variables independent of Z,
with no independence assumption between them, and put

    h=(T−1)r_A + Z² conjugate(r_B)/sqrt(2),
    J_n=integral_0^infinity t^(n−1/2)e^(−t)/(a+bt) dt.

For real s→0,

    Lambda(sh)=Lambda(0)−s² Q0(r_A,r_B)+o(s²),
    Q0=k_A ||r_A||²+k_B ||r_B||²
       +2m Re E[r_A conjugate(r_B)],
    k_A=p−(J2−2J1+J0)/2,
    k_B=p−J2/4,
    m=(J2−J1)/(2sqrt(2)).                         (1)

For linear shell drivers this is the original joint cubic A/B block. The
extension to arbitrary remote L² coefficients is only an extension of the
local statement at zero base.

To prove (1), L is odd and h even under Z→−Z, so the two expected norm terms
in Lambda(sh) agree. The first variation vanishes by angular integration.
The second-order coefficient of 2|L+sh| is

    [|h|²−Re(h conjugate(ph L))²]/|L|.

With Z=sqrt(T) exp(i theta), conditional angular integration gives

    E_theta |h|²=(T−1)²|r_A|²+(T²/2)|r_B|²,
    E_theta Re(h exp(−i theta))²
      =[(T−1)²|r_A|²+(T²/2)|r_B|²]/2
       +T(T−1)Re(r_A conjugate(r_B))/sqrt(2).

The resulting mixed sign is positive in the cost Q0, and the factor
1/sqrt(2) agrees with the normalization of the B shell. Also
||h||²=||r_A||²+||r_B||². The elementary bound

    0 ≤ 2(|L+sh|−|L|−s Re(h conjugate(ph L)))
      ≤ s² |h|²/|L|

justifies the second-order limit by dominated convergence: the expectation
of its right-hand coefficient is finite by independence of Z and the remote
variables and by the finite radial integrals J0,J1,J2. This establishes the
expansion for every finite dimension without a fourth-moment assumption.

At all three named rows the exact checker proves

    Q0 >= .24 ||r_A||²+.26 ||r_B||²
           +.236 Re E[r_A conjugate(r_B)]
           +.08 (||r_A||²+||r_B||²).               (2)

It tests positive definiteness of the residual matrix with diagonals
k_A−.32 and k_B−.34, and off-diagonal m−.118. At the peak the entries are

    k_A in (0.320054503608992,0.320054503608993),
    k_B in (0.940202200988668,0.940202200988669),
    m   in (0.117988819120357,0.117988819120358),

and the residual determinant exceeds .000032713061066. The flank and upper
determinants exceed .015046570262862 and .017058374356451. Thus .08 is a
common safe reserve, improving .07. This is not a claim that .08 is sharp.
No analogous matrix is asserted at finite amplitude or nonzero q.

### 2.1 The exact .300 joint margin proposed after #408 is impossible

The grid in STATUS 11.45 reports a minimum near .300 and correctly says that
the local matrix has a smaller eigenvalue, near .298. Nevertheless, STATUS
§15 item 1 recommends certifying the literal inequality

    r_x(alpha,beta) <= (p−.300)(|alpha|²+|beta|²)      (2a)

at every base and amplitude. STATUS 7.4.5 repeats that expression as an
observation on the scanned points. The scan is labelled N; no certified
theorem is being overturned. The exact proposed target (2a), however, is
false already at x=0 and arbitrarily small amplitudes.

At the peak choose (alpha,beta)=s(1,−1/5). By (1), its normalized local cost is

    k_test=(k_A+k_B/25−2m/5)/(26/25)
      in (0.298526023077303,0.298526023077304) < .300. (2b)

If (2a) held, divide by s² and let s→0 to obtain k_test≥.300, contradicting
the exact enclosure. Thus (2a) fails for every sufficiently small nonzero s
in this direction; no uncertified finite-amplitude quadrature is needed.

This obstruction also has a genuine cubic realization: take q=0 and
r_A=sX, r_B=−sX/5 for a remote standard complex Gaussian X. These are valid
linear shell drivers; the resulting A/B sum belongs to the cubic chaos.
Expansion (1) gives the same normalized cost (2b). Therefore even a claim
of .300 diagonal cost only for genuine cubic A/B perturbations is false.
This is not a counterexample to K, nor to the weaker anisotropic/robust
joint target of STATUS 7.4.5. It excludes this rounded number as an exact
global margin. A smaller prospective margin, for example .29, is not
excluded by (2b), but remains unproved globally.

The scan coordinates also need faithful interpretation. In
[`secant_joint.py`](../../code/kprime-2026-11-15/secant_joint.py), the variable
named `share` means theta/(pi/2), with amplitudes
(|r_A|,|r_B|)=amp(cos theta,sin theta). It is not B's energy share. The
reported `share=.375` at tilt .6 means

    |r_B|²/(|r_A|²+|r_B|²)=sin²(3pi/16)
      in (.308658283817455,.308658283817456),

so the phrase “37% B” in 11.45 should be about 30.9% B energy. Similarly
`share=.125` means sin²(pi/16), about .0380602, or 3.81% B energy, not 12%.
The checker certifies both radical expressions exactly. These corrections
change the description of the scan, not its computed margins.

### 2.2 Exact pointwise five-sector obstruction, with its cubic limitation

STATUS 11.45 and §13 item 77 already record the numerical failure of a
positive pointwise five-sector cost. The following is an exact confirmation
of that existing obstruction, not a new counterexample to cubic K.

At zero base let the odd sector coefficients in
[`secant_all_sectors.py`](../../code/kprime-2026-11-15/secant_all_sectors.py)
be k_Q=i, k_P=0, nu=−i. Thus

    h_o=i Z[1−(T−2)/sqrt(2)],   E|h_o|²=2.

Relative to L this is purely imaginary. Consequently
|L+s h_o|=|L−s h_o| and the normalized second-order cost of the two norm
terms is

    k_odd=(k_QQ+k_nunu−2m_Qnu)/2,
    k_QQ=p−J1,
    k_nunu=p−(J3−4J2+4J1)/2,
    m_Qnu=−(J2−2J1)/sqrt(2).

The same norm-remainder domination used in (1) justifies this limit; the
integrable dominating radial expression is
sqrt(T)[1−(T−2)/sqrt(2)]²/(a+bT). Exact enclosures at the peak are

    k_QQ   in (.128376107076914,.128376107076915),
    k_nunu in (.330212634031258,.330212634031259),
    m_Qnu  in (.608078556038441,.608078556038442),
    k_odd  in (−.378784185484355,−.378784185484354)<−3/8. (2c)

Hence a pointwise bound Rem≤p||coefficients||², even with zero positive
margin, fails at w=0 for sufficiently small s. This confirms the sign
reported by the scan without claiming its numerical optimum −.387.

Here k_Q is a nonzero constant. It does not satisfy the genuine cubic
requirement that Q be a centered remote Wick quadratic: E Q=0. With a
genuine Q and constant nu the mixed term at zero core vanishes after remote
averaging. Thus (2c) refutes the stronger pointwise coefficient inequality,
not an integrated theorem on admissible cubic sectors. The general
nonzero-core interaction remains open.

In this second script the printed `shares` really are energies,
|r_j|²/sum|r_j|². Thus the scan's .58 Q / .42 nu means 58% and 42% of the
squared coefficient norm, not the coefficient direction .58 ZQ+.42 nu
stated in 11.45. Without the complex phases, those two energy shares do not
specify a direction. Witness (2c) gives an explicit alternative direction
with equal energy shares and opposite imaginary coefficients.

## 3. Large-shift remainder bound with cutoff 17/4

Use the notation of the existing
[`improvement_joint_tail.md`](../audit-2026-11-13/improvement_joint_tail.md):
for constants x,alpha,beta in C,

    h=(T−1)alpha+Z² conjugate(beta)/sqrt(2),
    r_x(alpha,beta)=2 E_Z[|L+x+h|−|L+x|
                       −Re(h conjugate(ph(L+x)))],
    S0=|alpha|²+|beta|²,
    P(t)=(t−1)²+t²/2=3t²/2−2t+1.

Here S0 is a squared shell amplitude, not the Gaussian benchmark S.
Cauchy–Schwarz in the two shell coefficients and the norm tangent bound give

    r_x(alpha,beta) <= S0 E[P(T)/|L+x|].             (3)

The old argument estimated the whole inner radial region by its worst
denominator. We instead integrate its mass over 200 intervals. Set

    X=17/4, c=21/4, t_j=c*j/200,
    M(t)=e^(−t)(3t²/2+t+2),
    r(t)=sqrt(t)(a+bt).

M(t) is exactly the mass integral of P(s)e^(−s) on [t,infinity).
For |x|≥X and T in [t_j,t_(j+1)],

    |L+x| >= X−r(t_(j+1)) > 0.

The resulting inner potential bound is therefore

    I_inner=sum_(j=0)^199
       [M(t_j)−M(t_(j+1))]/[X−r(t_(j+1))].         (4)

For T>c, push forward the weighted Gaussian measure by Z→L. Its mass is
M(c), and its planar density is

    e^(−T)P(T) / [pi(a+bT)(a+3bT)].

For T≥3 the numerator decreases and the denominator increases. Indeed,
minus the derivative of e^(−t)P(t), divided by e^(−t), is
3t²/2−5t+3; after t=3+y this is 3/2+4y+3y²/2>0.
Thus the tail density is at most D_c/pi, where

    D_c=e^(−c)P(c)/[(a+bc)(a+3bc)].

A positive planar measure of mass m and density bounded by d/pi has
inverse-distance potential at most 2sqrt(md), uniformly in its center.
For completeness, split at radius rho and bound 1/r by
1/rho+(1/r−1/rho)_+. Integrating the latter against the density bound yields
m/rho+d rho, whose minimum is 2sqrt(md). Therefore

    E[P(T)/|L+x|] <= I_inner+2sqrt(M(c)D_c)<183/200. (5)

The last inequality is certified separately at all three rows. The exact
upper expressions are enclosed in

| Row | Interval containing the upper expression in (5) |
|---|---|
| peak | (.897052074942719,.897052074942720) |
| flank | (.900715670334752,.900715670334753) |
| upper | (.912492449684519,.912492449684520) |

These are upper bounds on the true potential, not estimates of its actual
maximum. All square roots and exponentials in (4)–(5) are enclosed by exact
rational arithmetic; no floating-point quadrature enters acceptance.

## 4. Consequence for the open box

The signed target from the existing reduction is

    Q_signed=(p−.24)|alpha|²+(p−.26)|beta|²
               −.236 Re(alpha conjugate(beta)).

The largest eigenvalue of [[.24,.118],[.118,.26]] is at most its largest
row sum .378, and p≥33/25 at all three rows. Consequently, for |x|≥17/4,

    Q_signed−r_x >= (1.32−.378−.915)S0=.027 S0.    (6)

The robust target replaces the last term by +.236|alpha beta| and is no
smaller, so (6) holds for it as well, at every shell amplitude.

The existing amplitude-tail reduction needs only .0000753 reserve on
|alpha|,|beta|≤.4 for the robust target, or .0000807 for the signed target.
Its Gaussian-tail arithmetic and arbitrary-correlation argument are
unchanged. The shift part of its remaining domain may now be shortened to

    0 <= x <= 17/4, |alpha|,|beta| <= 2/5,

with both relative phases retained. The shift interval is 17/24 of its
previous length. The compact-box inequality on that smaller domain remains
open; (2) cannot be integrated to obtain it. Neither (2) nor (6) controls
the odd sectors over a nonzero even core.

## 5. Reproduction

Run from the repository root:

```sh
python3 -I research/conjecture-K/code/fourth-audit-2026-11-15-codex-a7c4/joint_reduction.py
```

The script is read-only by default; `--write-result` regenerates the adjacent
small JSON result. It reuses the existing outward dyadic interval library
and freshly evaluates all needed radial integrals and exponentials. The
analytic transformations, matrix implication and tail argument are the
paper portion of the result. No Lean build was run.
