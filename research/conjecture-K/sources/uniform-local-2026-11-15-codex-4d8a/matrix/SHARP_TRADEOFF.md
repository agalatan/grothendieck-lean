<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/matrix/SHARP_TRADEOFF.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/matrix/SHARP_TRADEOFF.md — Agent-ID: codex-4d8a -->
# A sharp finite-amplitude even/odd tradeoff

This note proves an elementary inequality. Its use below for shifted Gaussian
matrices is a numerical feasibility calculation, **not a certified compact
Conjecture K result**. The proof does not assume small amplitude, centering,
independence, or a nonvanishing perturbed base.

For x ≠ 0, put e=x/|x| and

    J(x;k,o)=|x+k+o|+|x+k−o|−2|x|−2 Re(k conjugate(e)),
    k_r=Re(k conjugate(e)), o_r=Re(o conjugate(e)).

For every 0 ≤ c < 1/2,

    J(x;k,o) ≤ ( |k|² + |o|²
                 + c/(1−2c) k_r² − c o_r² ) / |x|.       (T_c)

Equivalently the radial coefficients are

    α=(1−c)/(1−2c), β=1−c, with 1/α+1/β=2;

the two tangential coefficients remain exactly 1. Both radial coefficients
are jointly sharp within this quadratic class.

Optimizing c pointwise gives the nonlinear inequality

    J(x;k,o) ≤ [ |k|² + |o|²
                 − ( (|o_r|−|k_r|)_+ )²/2 ] / |x|.        (T_*)

In particular, k=0 recovers the half-radial odd-sector majorant at every
amplitude. For o=0 the usual one-sided inverse-potential estimate is recovered.

## Proof of the entire quadratic family

Rotate and scale to x=1 and identify complex numbers with real vectors. Let
A=diag(α,1) and B=diag(β,1). The support formula for each norm gives

    J(1;k,o)=sup_{|u|,|v|≤1}
      [2(s−e)·k+2d·o+2s_x−2],
    s=(u+v)/2, d=(u−v)/2, e=(1,0).

The supremum, over arbitrary k,o, of the expression in brackets minus
[kᵀAk+oᵀBo] is

    H(u,v)=(s−e)ᵀA⁻¹(s−e)+dᵀB⁻¹d+2s_x−2.              (1)

This is convex in (u,v). Each point of the product of disks is a convex
combination of pairs of boundary points, so it suffices to prove H≤0 for
|u|=|v|=1. Then s·d=0 and |s|²+|d|²=1. Write

    s=t(cos θ,sin θ),
    d=±sqrt(1−t²)(−sin θ,cos θ),    0≤t≤1.

This representation also covers s=0, by choosing θ perpendicular to d.
Set r=c/(1−c) and z=cos θ. Since α⁻¹=1−r and β⁻¹=1+r,
substitution into (1) is the polynomial identity

    (1−r)(tz−1)² + t²(1−z²)
      + (1−t²)[(1+r)(1−z²)+z²] + 2tz−2
    = −r(t−z)² ≤ 0.                                     (2)

This proves (T_c). `verify_tradeoff.mjs` checks identity (2) as an exact
integer polynomial identity; the elementary support and convexity arguments
above supply its implication for the norm inequality.

## Sharpness and why the unmodified half-debit cannot extend

For a putative bound with radial coefficients α,β, choose u=1,v=−1 in
(1). Necessarily

    1/α+1/β−2 ≤ 0.

Thus α≥β/(2β−1) whenever 1/2<β≤1. Equality holds in the proposed bound
at the real values k=−1/α, o=1/β. The tangential coefficient of k cannot
be smaller than 1, by taking o=0 and infinitesimal imaginary k. The analogous
statement for o follows by taking k=0 and infinitesimal imaginary o.

At β=1/2, **no finite quadratic k coefficient works**. Concretely, x=1,
o=2 and k=−ε, 0<ε<1, give J=2+2ε, whereas the exact half-debit for o
is 2 and a quadratic k allowance is only O(ε²). This is a structural
obstruction, not an adverse numerical example.

## Optimizing the tradeoff

Let a=|k_r|, b=|o_r|. The additional term is

    c a²/(1−2c)−c b².

If b≤a its minimum is 0 at c=0. If b>a>0 its minimum is
−(b−a)²/2, attained at c=(1−a/b)/2. If a=0<b, use c↑1/2.
This proves (T_*), including all degenerate cases by continuity.

## Application to the centered joint premise

Take x=L+w, k=K and o=O as in STATUS 7.5.6. With the four real A/B
coefficient coordinates e and the six real Q/P/ν coordinates o, let
E,E_r and M,M_r be the integrated quadratic matrices of

    |K|²/|L+w|, K_r²/|L+w|,
    |O|²/|L+w|, O_r²/|L+w|,

respectively. Let B_2(w) be the quadratic part of B_P, and C the retained
centering matrix with Q/ν entries (11h/20,h). Then (T_c) implies

    F_joint ≤ eᵀ[E+c/(1−2c)E_r−B_2(w)]e
               +oᵀ[M−cM_r−pI−C]o−S_r².                  (3)

The matrices have no even/odd mixed block. This cancellation is exact at
all amplitudes and uses the common quadratic family, not a Hessian at the
perturbed base L+w+K. As usual, reflection splits the even and odd matrices
into real/imaginary blocks. All integrals are nonsingular after changing
variables L+w=ρ exp(iθ), because the polar Jacobian cancels 1/|L+w|.

If the largest eigenvalues in (3) are bounded by e_c(w),o_c(w), then

    F_joint ≤ e_c(w) S_r+o_c(w) omega−S_r².                (4)

This can yield all-direction regions even when K is not infinitesimal.
For sharper direction-dependent work one may integrate the pointwise minimum
of (T_c), (T_*), and an independently valid amplitude-envelope bound. It is
not legitimate to transfer the old even error certificate to these new
integrands without new derivative/error analysis.

## Numerical feasibility only

`tradeoff_probe.py` implements nonsingular shifted-plane quadrature and
records its results in `tradeoff_probe.json`. These are floating-point
values without certified quadrature errors. For c=9/20, sample shifts
0≤|w|≤2 give an even residual eigenvalue no larger than approximately 5.44
and an odd residual eigenvalue no larger than approximately −0.029.
This suggests a conditional cone omega≥200 S_r; it does **not** prove it.

The family does not solve the central nearly-even problem: at
(w,S_r,omega)=(0.2,0.01,0.005), even the optimized c gives a positive
upper bound about 0.00755. The actual norm remainder may be much smaller.
The new lemma is useful for odd-dominated cells and as one member of a
hybrid bound, while the nearly-even region still needs the sharper even
finite-amplitude structure.

The completed certified cone V≤W/1400 is proved in `CERTIFIED_CONE.md`;
the stronger omega≥200S_r suggestion remains numerical only.
