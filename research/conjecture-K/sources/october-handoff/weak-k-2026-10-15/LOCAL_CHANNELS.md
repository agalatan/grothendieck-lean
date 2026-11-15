<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/weak-k-20261015/package/content/LOCAL_CHANNELS.md (file dated 2026-10-15). Only this line was added. -->
# Pinned first-chaos channels: exact local calculation and failed global shortcuts

15 October 2026. This note does **not** prove a new Grothendieck endpoint or a global fibre majorant. The algebraic local formula and the Rice correction below are proofs; all finite-amplitude searches and law optimizations remain exploratory.

Use a=699/1250, b=179/1250, L=Z(a+b|Z|²), T=|Z|². Put

    J(q;k,α,β)=2 E_Z |L+q+k+(T−1)α+Z² conj(β)/sqrt(2)|.

The first-chaos dual adds |k|². Its baseline linear terms are exactly

    2 Re[conj(F0(q)) k + conj(FA(q)) α + conj(FB(q)) β].

Here F0(q)=E phase(L+q); FA and FB are the established A/B profiles. This normalization agrees with J(q;0,0,0)=Φ0(|q|).

## 1. Exact local three-channel matrix

At q=0, the quadratic term in J is

    E [ |k+(T−1)α−T β/sqrt(2)|² / (2 sqrt(T)(a+bT)) ].

Indeed expand the norm to second order at L, average the visible angle, and retain the charge-zero terms. Consequently the Hermitian matrix in coordinates (k,α,β) is

    M0 = E[v(T)v(T)^T/(2|L|)],  v(T)=(1,T−1,−T/sqrt(2)).

Numerically,

    [[ 1.4319737912914, −0.8351359326141, −0.4220280971396],
     [−0.8351359326141,  1.0019973208225, −0.11798882],
     [−0.4220280971396, −0.11798882,      0.38184962]].

The displayed last few entries are only rounded diagnostics; use the integral formula as the exact statement. There is no assertion that M0 is a global Hessian bound or a global secant majorant.

For justification of the local expansion, first remove T<δ, where the norm is smooth and differentiation is dominated. On the remaining interval use the scalar norm Hessian. The omitted region is bounded by a constant times the inverse-radius weight, integrable as T^(-1/2); this permits δ down to zero by dominated convergence.

## 2. Tied A/B multiplier and a rigorous obstruction to 0.8 I

Choose k=α/3+β/6. The total local matrix including |k|² becomes

    M_AB=E[w(T)w(T)^T/(2|L|)]+d d^T,
    w(T)=(T−2/3,1/6−T/sqrt(2)), d=(1/3,1/6).

Its entries are

    [[ .71545934255659821294, −.26274451853082600266],
     [−.26274451853082600266, .30872841859886246742]].

In direction (α,β)=(2,−1), normalized by |α|²+|β|²=5, the curvature is

    .84430877258971186596740662415138766064159113… > .843 > .8.

Thus a global bound with isotropic cost .8 is impossible, even infinitesimally at q=0. The self-contained Arb script `check_local_ab_obstruction.py` encloses the quantity rigorously. The analytic maximum eigenvalue is approximately .84434709; the rational direction above avoids an eigenvalue calculation.

The integrals have elementary closed forms in erfc. Define

    I_j = integral_0^infty e^(−r²) r^(2j)/(a+b r²) dr.
    I0 = π exp(a/b) erfc(sqrt(a/b))/(2 sqrt(ab)),
    I1 = (sqrt(π)/2−a I0)/b,
    I2 = (sqrt(π)/4−a I1)/b.

Then the entries of M_AB are the degree-two polynomial combinations printed in the checker. This is an outward-rounded evaluation of the exact formula, not quadrature evidence.

## 3. What the finite-amplitude searches say, and do not say

A-only, tying k=α/3, appears compatible with a total global secant cost 3/4. The needed exact scalar inequality would be

    2 E_T mabs(sqrt(T)(a+bT), |s+(T−2/3)α|)
       ≤ Φ0(s)+2 Re(α)[FA(s)+F0(s)/3]+(23/36)|α|².

Adding |k|²=|α|²/9 gives total 3/4. This remains **unproved**. It is a three-real-parameter, all-amplitude target; a local Hessian proof is not enough.

For the full free (k,α,β), an attempted global majorant M0+.13 I is false numerically: repeated searches find excess ~.54862 relative to M0, at q~.65747 and amplitude~.67188 with aligned real coefficients. The .13 padding was only suggested by the constant+A two-channel search and cannot be transplanted to B.

For tied A/B, the isotropic maximum found is near the local .84435 obstruction. This supports testing .85–.87 as a scalar cost, but a certificate is still required. It does not certify the local matrix plus a small diagonal padding: that is a different inequality.

## 4. Conditional implication for the pinned-content problem

Suppose a **global**, fixed matrix C gives

    J(q;α/3+β/6,α,β)+|α/3+β/6|²
       ≤ Φ0(|q|)+2 Re< (α,β), (FA(q)+F0(q)/3, FB(q)+F0(q)/6) >
         + (α,β)* C (α,β).

If D=ε^(-1)I−C is positive definite, averaging over any joint remote variables, with α and β in the appropriate first-chaos space, and completing the square proves

    Λ_P ≤ E Φ0(|q|)−||q||²/ε
           + tr[D^(-1) (ΠF)^* ΠF],
    F=(FA+F0/3, FB+F0/6).

No independence of α,β,q is used. This is a valid implication, **not** proof of its premise or a universal bound on the last content term.

Our ordinary moment-plus-Bessel diagnostic still permits errors around 10^(-3), even with the optimistic false cost .8 I. It uses actual nonlinear profiles and subtracts their projection onto q. Thus the first-chaos pinning does not by itself remove the need for the coupled spectral/Stein constraints. The finite-cutoff Gram/Stein calculations have solver residuals and are not certificates.

## 5. A certified finite-amplitude counterexample

The suggested global majorant M_AB+(1/10)I is false, with a wide rigorous margin. Take

    q=3/4, α=7/20, β=1/2, k=α/3+β/6=1/5.

The script `check_false_matrix_majorant.py` proves

    J(q;k,α,β)−J(q;0,0,0)
      −2 Re[conj(F0(q))k+conj(FA(q))α+conj(FB(q))β]
      +|k|² − (α,β)*(M_AB+(1/10)I)(α,β) > .097696.

It uses 256 radial by 512 angular cells, with interval bounds on the scalar norm Taylor remainder. The radial integration weights are exact exponential differences. The omitted unbounded radial tail is nonnegative by convexity of the norm, so omitting it is valid for this lower bound. The only input beyond elementary arithmetic is outward-rounded Arb evaluation of exp, trigonometric functions, sqrt, and erfc. The closed-form matrix is the one in Section 2. This is a proof that the proposed **majorant** is false, not a counterexample to Conjecture K.
