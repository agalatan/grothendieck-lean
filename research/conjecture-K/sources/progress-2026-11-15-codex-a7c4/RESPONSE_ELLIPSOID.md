# A stronger common-response ellipsoid for all six cubic sectors

Agent-ID: codex-a7c4. Task #421. Current proof, separate from the mechanical rewrite in PR #423.
Status: **P by author**; exact rational numerical consequences checked by
`response_ellipsoid_check.py`. No Lean theorem or new Grothendieck endpoint
is claimed. The old six weights and Rice tangent are inputs already in
A15R FOUNDATIONS §2; the strengthened right-hand side below is new relative
to that displayed ellipsoid.

From the repository root, replay the scalar consequences with
`python3 -I -B research/conjecture-K/code/progress-2026-11-15-codex-a7c4/response_ellipsoid_check.py`.
The proof and scalar replay have been re-derived within this Codex session;
external mathematical review is still pending.

## 1. Statement

Let |f|,|g|≤1, h=(f+g)/2, k=(f−g)/2, P_(1,0)h=tZ with t≥0,
F=εP_(2,1)k, ε>0, and R=E|Z|=√π/2. All Gaussian coordinates are proper
standard complex Gaussians. Decompose the actual cubic projection as

    F=q+(T−1)r_A+Z² conj(r_B)/√2+ZQ+conj(Z)P+ν Z(T−2)/√2,
    T=|Z|².

The remote coefficient fields are respectively in H_(2,1), H_(1,0),
H_(1,0), H_(1,1), H_(2,0); in particular EQ=0. They may share all
coordinates arbitrarily. Put

    E_q=||q||², E_A=||r_A||², E_B=||r_B||²,
    E_Q=||Q||², E_P=||P||², E_ν=|ν|².

Then

    E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7
        ≤ ε²(π/4−t²).                                      (1)

Equivalently, in the normalization of the old ellipsoid,

    E_q/4 + E_A/3 + 2E_B/3 +(E_Q+E_P)/2 +4E_ν/7
        ≤ (ε²/2)(R²−t²).                                   (2)

The previous right side was R ε²(R−t). The improvement is exactly

    (ε²/2)(R−t)² ≥0.                                       (3)

This controls the simultaneous odd sectors in the presence of q+A+B
through their common bounded responses. It does not assert that adding
odd sectors decreases the raw or retained functional at an arbitrary
cubic core. No such monotonicity is used here.

## 2. Direct support proof, including the odd visible cubic

For every full cubic test U, unweighted chaos projection gives

    t+ε⁻¹ Re<U,F>
      = ½ Re E[(Z+U)conj(f)+(Z−U)conj(g)]
      ≤ ½ E(|Z+U|+|Z−U|)
      ≤ E sqrt(|Z|²+|U|²)
      ≤ sqrt(E|Z| · E[(|Z|²+|U|²)/|Z|])
      = R sqrt(1+E[|U|²/|Z|]/R).                           (4)

The penultimate step is weighted Cauchy–Schwarz. The norm step is the
pointwise parallelogram identity followed by concavity of sqrt. It
cancels the signed Z/U cross term before integration for **every U**;
no parity hypothesis is used.

In particular, (4) does not assume E[conj(Z)U/|Z|]=0. That quantity is
nonzero for the visible cubic U=νZ(T−2)/√2. This causes no problem:
Z pairs with h and U pairs with k in two separate response slots.

For the six sectors of U, the quadratic form E[|U|²/|Z|]/R is diagonal
with coefficients

    c=(2, 3/2, 3/4, 1, 1, 7/8).                            (5)

Visible-phase orthogonality removes cross-frequency terms. The
same-frequency remote/A term is zero by remote cubic/linear chaos
orthogonality. The Q/ν term is zero because EQ=0. This uses no
independence among the remote coefficient fields. Each diagonal is a
Gamma half-moment, for example

    E[(T−1)²/√T]/R=3/2,
    E[√T(T−2)²/2]/R=7/8.

Let d²=Σ_j E_j/c_j and choose U_j=sF_j/c_j, s≥0. Then
Re<U,F>=s d² and the weighted test norm is s²d². Thus (4) gives

    t+ε⁻¹ s d² ≤ R sqrt(1+s²d²),  for all s≥0.

If d=0 the claim is immediate. Otherwise minimizing the right side
minus ε⁻¹s d² proves t²+ε⁻²d²≤R² (including the boundary by limits).
This is (1).

## 3. Independent weighted-Hilbert-space derivation

Let dμ=|Z|dγ/R. On L²(μ)⊕L²(μ), the pair (h,k) has squared norm at
most1 because |h|²+|k|²=(|f|²+|g|²)/2≤1.

Use the feature Z/|Z| in the **h slot**, of norm1. Its h coefficient
is t/R. In the k slot use each Gaussian-orthonormal cubic basis vector
U_j divided by |Z|. Its weighted squared norm is c_j, and the features
from distinct sectors are orthogonal by (5). Within a sector the same
scalar multiple of its Gaussian Gram holds. Bessel's inequality gives

    t²/R² + Σ_j E_j/(ε²R²c_j) ≤1.

The two slots are orthogonal by construction, so weighted Z/ν pairing
never enters this argument. This gives a second proof of (1).

A ν-only extremal-direction check: take U=i s H(Z),
H(Z)=Z(T−2)/√2, and f=ph(Z+U), g=ph(Z−U). The two norm terms saturate
the parallelogram bound pointwise. Writing D_s=sqrt(1+s²(T−2)²/2),

    h=ph(Z)/D_s,
    k=i ph(Z) s(T−2)/(√2 D_s),
    t=E[√T/D_s],
    <H,k>=i s E[√T(T−2)²/(2D_s)].

At s=0, the expansion has t=R−(7/16)Rs²+O(s⁴) and
<H,k>=i(7/8)Rs+O(s³). Therefore t²+(8/7)|<H,k>|²=R²+O(s⁴):
the ν weight in (1) is consistent and sharp to second order. This
check is analytic; it does not depend on sampled quadrature.

## 4. Quantitative consumer-domain improvement

The existing certified Rice tangent rho(u)≤A+Bu has

    A=886762780/10^9, B=432306903/10^9,
    E_q≤4ε²B(A−t).

Every nonremote coefficient in (1) is at least2/3. Thus, with
V=||F||²,

    V≤(3/2)ε²(R²−t²)+E_q/4
      ≤ε²[(3/2)(π/4−t²)+B(A−t)].                         (6)

Relative to the old refined total bound
ε²[3R(R−t)+B(A−t)], the exact improvement is
(3/2)ε²(R−t)². At ε=1891/2500:

| t lower bound | new strict total-energy cap | old displayed strict cap | decrease of unrounded bound |
|---|---:|---:|---:|
| .8400 | .080051 | .081884 | .0018339366025… |
| .8456 | .070564 | .071981 | .0014165183792… |
| .8510 | .061366 | .062431 | .0010649857091… |
| .8540 | .056234 | .057126 (same old formula) | .0008913167095… |

The remote-energy cap is unchanged. The new total bound decreases
with t≥0, so each listed threshold covers all larger t. The checker
uses exact Fraction arithmetic, Machin's alternating atan series and
integer square roots for outward enclosures of π and R; all displayed
strict caps are checked by rational comparison. It does not rerun the
already-certified A,B tangent derivation.

## 5. Scope for lower-bound work

Equation(1) can be imposed in a consumer or an all-sector optimization
without assuming Conjecture K or odd monotonicity. It is stronger than
the particular old quadratic support ellipsoid and lowers its full
energy cap by roughly1.4–2.2% on the central interval. A payoff cap still
has to be proved on the remaining feasible domain. In particular it
neither proves K_G>1.4018 nor invalidates the frozen-source barrier:
the barrier deliberately discarded common-response feasibility. No
claim is made that this one extra inequality alone excludes its cubic.

Some broader weighted-Gram machinery in the October manuscript may
subsume (1) after specialization. The new contribution claimed here is
the explicit stronger six-sector formula, its elementary proof, and
its strict numerical improvement over the currently quoted domain
caps—not priority over every possible implicit consequence of that
machinery.
