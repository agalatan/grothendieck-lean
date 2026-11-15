<!-- New fifth-audit note. Agent-ID: codex-a7c4. Refs #411. -->
# The retained trial, and when the remote dual is strictly smaller

Agent-ID: codex-a7c4. Baseline `0882c67d3f7dbfd02f821cad48808440643f802d`.
New paper arguments below are **P by author, not externally reviewed**.
The scalar arithmetic in §5 is **C** with the adjacent
`retained_remote_exact.py`; it does not replace the analytic proof.
The trial argument of §1 and the lower bound in §3 re-derive existing
results rather than claim new results for the retained functional.

## 1. Explicit re-derivation of STATUS 11.12

Let Z be the visible standard complex Gaussian, T=|Z|²,
L=Z(a+bT), with a>0,b≥0, and p>0. Write P₁ for projection onto the
full complex first chaos, and define on square-integrable G

    Λ̂(G)=min_{v∈H₁,₀} [‖v‖²+E|L+G−v|+E|L−G+v|]−p‖G‖².

Let q be any remote L² variable, r any remote first-chaos variable, and
G=q+(T−1)r. No independence between q and r is needed. Independence
of the visible coordinate gives

    ‖G‖²=‖q‖²+‖r‖²,

because E(T−1)=0 and E(T−1)²=1. This identity does not need q orthogonal
to r. For any complex scalar s, choose the admissible trial v=−sr. Its
norm is |s|²‖r‖², while G−v=q+(T−1+s)r is even in Z and L is odd.
The substitution Z↦−Z therefore makes the two expected norms equal.
Consequently

    Λ̂(q+(T−1)r)
      ≤2E|L+q+(T−1+s)r|−p‖q‖²−(p−|s|²)‖r‖².       (1)

The real-s case is precisely STATUS 11.12/KPR §3. This explicitly
re-derives the two-line input used in the previous audit's 11.46; the
review of #409 also states that it checked 11.46 including 11.12.
Its ledger should name these checks, rather than retain “not reviewed by
anyone else”. The original statement concerns a remote cubic q, a special
case of (1). First/third-chaos orthogonality is needed later when removing
constant multiples of q from content projections, not for (1) itself.

## 2. Exact symmetry reduction of the minimum

More generally let G be even under Z↦−Z. Decompose a first-chaos trial
as v=αZ+v_rem. The two subspaces are orthogonal. In the objective

    J_G(α,v_rem)=|α|²+‖v_rem‖²
                  +E|L+G−αZ−v_rem|+E|L−G+αZ+v_rem|,

the same substitution gives J_G(α,v_rem)=J_G(−α,v_rem).
Each norm is convex in the real and imaginary parts of α. Averaging the
two signs therefore shows J_G(0,v_rem)≤J_G(α,v_rem); when α≠0 the
quadratic term makes the inequality strict. Thus the exact minimizer has
no visible component, and

    Λ̂(G)=min_{v∈H₁,₀(remote)}
             [‖v‖²+2E|L+G−v|]−p‖G‖².               (2)

Existence and uniqueness follow in finite dimension from continuity,
coercivity and strict convexity of the quadratic term. This is a symmetry
reduction of the full minimum, not a numerical restriction to chosen
remote directions. It includes q+A+B, since all three summands are even
in Z; it does not discard the visible multiplier for a general odd sector.

## 3. The remote functionals need not coincide

For a remote q put

    M(w)=E_Z|L+w|,   F₀(w)=E_Z ph(L+w)=w j(|w|²),
    μ(q)=P₁,rem F₀(q),   j₀=j(0)=E|L|⁻¹/2.

The visible law has a continuous planar density, so differentiating M
under the integral is legitimate; its real gradient is F₀. The reviewed
Gaussian-mixture derivation gives M a globally j₀-Lipschitz gradient.
Section 6 below records the additional properties of j used here.
Equation (2) and the supporting plane of the convex function M give

    J_q(v)−J_q(0) ≥ ‖v‖²−2 Re⟨v,μ(q)⟩.

The Lipschitz-gradient upper inequality gives the reverse quadratic bound

    J_q(v)−J_q(0) ≤ (1+j₀)‖v‖²−2 Re⟨v,μ(q)⟩.

Minimizing the first bound and using v=μ/(1+j₀) in the second yields

    ‖μ(q)‖²/(1+j₀) ≤ Λ(q)−Λ̂(q) ≤ ‖μ(q)‖².           (3)

The lower bound is the existing quantitative penalty theorem in ch20,
STATUS 2.10a and 11.3; the upper bound is also a direct specialization of
the existing strong-convexity estimate in STATUS 2.13. In particular,

    Λ̂(q)=Λ(q)  iff  μ(q)=0.                            (4)

The minimum is then attained at v=0. Otherwise it is strictly smaller.
Neither conclusion needs q to be cubic; visible independence and L²
integrability suffice. These are statements in every finite dimension.

**Audit correction.** README says that “the remote part is the same
statement for both” functionals. The raw remote cap is indeed the common
**sufficient input used by the current assembly**, and its certified value
is unaffected. But raw and retained remote objectives are not equal in
general; their direct universal cap problems are different. The existing
reviewed inequality already implies this once μ≠0. The explicit genuine
cubic family below supplies that nonvanishing at every amplitude, and §5
gives a finite exact witness. This is not a new general remote cap and
does not contradict the old sufficient-input formulation.

## 4. A genuine cubic family with strict improvement at every amplitude

Let X,Y be independent remote standard complex Gaussians, independent of
Z, and take

    q_c=c X(|Y|²−1),     c>0.                           (5)

This is a Wick cubic of bidegree (2,1), with ‖q_c‖²=c². Denote
A=|X|² and T=|Y|²; both are independent Exp(1) variables. Its first-chaos
projection coefficient along X is the real number

    μ_X(c)=c E[A(T−1)j(c²A(T−1)²)].                    (6)

For every k>0, pairing z=T−1 and −z gives

    E[(T−1)j(k(T−1)²)]
      =e⁻¹ [∫₀¹ z(e⁻ᶻ−eᶻ)j(kz²) dz
               +∫₁∞ ze⁻ᶻ j(kz²) dz].               (7)

The signed weight is negative on (0,1), positive on (1,∞), and has total
integral zero because E(T−1)=0. Subtract j(k) times that zero integral.
The profile j is strictly decreasing: hence j(kz²)−j(k)>0 for z<1 and
is negative for z>1. Both integrals become strictly negative. They are
absolutely integrable because 0<j≤j₀ and the weights are integrable.
Since A>0 almost surely, (6) is strictly negative for every c>0. Therefore

    Λ̂(q_c)<Λ(q_c)   for every c>0 and a>0,b≥0.         (8)

Embedding the same two remote variables in any larger dimension preserves
the conclusion. Two remote coordinates suffice; no tensor search or
small-amplitude limit is used. Rotation of Y and of X shows that the full
projection is in the X direction, although nonzero coefficient (6) alone
already proves (8).

This is a new explicit strictness consequence of the older penalty
theorem, not a claim that every nonzero remote cubic has a strict penalty.
For example q=cXY conjugate(V), with three independent remote coordinates,
has μ=0: F₀(q) transforms with characters (1,1,−1), so it is orthogonal
to every first-chaos coordinate. For that family Λ̂(q)=Λ(q) exactly.

## 5. An explicit finite peak-row gap, without quadrature

At the peak a=699/1250, b=179/1250, use only the coarse bounds

    j₀<2,     j′(0)<−1,     0≤j″(v)<29 for all v≥0.  (9)

Their derivation is in §6. Taylor's theorem gives
|j(v)−j₀−j′(0)v|≤(29/2)v². For the family (5),

    EA²=2,  E(T−1)³=2,  EA³=6,
    E|T−1|⁵≤E(T+1)⁵=326.

Thus (6), using the exact cancellation EA·E(T−1)=0, satisfies

    μ_X(c) < −4c³ + 28362c⁵.                          (10)

At c=1/100, the positive coefficient 4−28362c² is 5819/5000>1,
so μ_X(c)<−5819/(5·10⁹)<−10⁻⁶. From (3) and 1+j₀<3,

    Λ(q_{1/100})−Λ̂(q_{1/100})
      >33860761/(75000000000000000000)
      >1/(3·10¹²).                                  (11)

All inequalities after (9) are finite rational arithmetic. The checker
recomputes the factorial moments, derivative-budget comparisons and the
gap, using no floating point. The small numerical size is deliberate:
(11) is a clean exact witness separating the two objectives, not a useful
new global certificate budget. Statement (8) supplies the all-amplitude
strictness result without this deliberately coarse Taylor estimate.

## 6. The scalar derivative bounds and the Gaussian mixture

This section uses the reviewed visible-density recurrence in A15T
`CONTENT_KERNELS.md` §§1–2. Set H(t)=t(a+bt)². The planar density of L is
f(|w|²)/π, with

    f(H(t))=e⁻ᵗ/[(a+bt)(a+3bt)].

Its complete-monotonicity proof gives f(v)=∫e⁻ˡᵃᵐᵇᵈᵃᵛ μ_D(dλ), a positive
measure on (0,∞). The finite endpoint moments and normalization are

    m₀=∫μ_D=1/a²,       ∫λ⁻¹ μ_D(dλ)=1,
    m₁=∫λ μ_D=a⁻⁴+4b a⁻⁵,
    m₂=∫λ² μ_D=a⁻⁶+12b a⁻⁷+42b² a⁻⁸.              (12)

The measure λ⁻¹μ_D is the probability mixing measure of circular
Gaussians with variance 1/λ. The radial Gaussian identity in that note
then gives, with θ uniform on a full circle,

    j(v)=(√π/2)∫ λ⁻¹/² μ_D(dλ)
                     E_θ∫₀¹ exp(−λvr cos²θ)dr.      (13)

At v=0 the integral equals j₀<∞. Every derivative used here is integrable
by (12) and Cauchy–Schwarz. Equation (13) proves j′(v)<0 and
0≤j″(v)≤j″(0), with

    −j′(0)=(√π/8)∫λ¹/² μ_D(dλ),
     j″(0)=(√π/16)∫λ³/² μ_D(dλ).                   (14)

Jensen under the probability measure a²μ_D, applied to x↦x⁻¹/² at
x=λ⁻¹, gives ∫λ¹/²μ_D≥a⁻³. Cauchy–Schwarz gives
∫λ³/²μ_D≤√(m₁m₂). At the peak, a>1/2, a<3/5, b<1/4 imply

    m₁<48,  m₂<1120,  √(m₁m₂)<232,
    j″(0)<(2/16)·232=29.

Also π>3 and (8·(3/5)³)²=(216/125)²<3 give
√π/(8a³)>1, so j′(0)<−1. Finally
j₀=E[1/(2√T(a+bT))]≤√π/(2a)<2, using π<4.
This proves all of (9). The elementary 3<π<4 bounds are sufficient;
no special-function numeric enclosure is used here.

## 7. Other bounded audit checks and limits

The fourth note's CONTENT §6 agrees with the fifth tilted-sector report:
the central γδ theorem is uniform on [.03,.0463] and does not by itself
control D₊; the 56 family deficit samples do not certify a continuum
family; the decimal endpoint .00196979 is a strict inequality. The
reviewed retained trial (1) is now explicit. These observations do not
amount to a new replay or line-by-line audit of the large tilted C++/Arb
certificate; the existing TILT-REV3 provenance remains in force.

The current raw peak remote certificate remains a valid sufficient input
for both routes. The distinction (4) suggests that a future retained
remote certificate may use μ, but this note constructs no such new cap.
All projections and minima above use the full first chaos of the actual
Gaussian coordinate space. The auxiliary Gaussian W used as the diffuse
benchmark is not added to that admissible first-chaos space. If W were an
actual first-chaos coordinate available to the multiplier, the retained
benchmark would be a different optimization problem. No infimum is
interchanged with a diffuse weak limit here.
K, a generic content-versus-deficit theorem, the full A/B/odd assembly and
the complete row consumer remain open.

Reproduce the scalar witness with:

```sh
python3 -I research/conjecture-K/code/fifth-audit-2026-11-15-codex-a7c4/retained_remote_exact.py
```

The script is standard-library only and read-only by default; the adjacent
JSON is its output. Existing source files are unchanged.
