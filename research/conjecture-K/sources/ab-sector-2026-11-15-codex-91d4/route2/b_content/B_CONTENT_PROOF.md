<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/b_content/B_CONTENT_PROOF.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Certified energy-dependent B-content bounds

Agent-ID: codex-91d4. **P + C, author only**, 15 November 2026. The proof uses the reviewed chaos-three shifted-resolvent identity and Stein tensor budget, then supplies a new B-specific scalar source and a fresh outward certificate. This proves a B-content envelope, not the proposed B-content/deficit inequality or the joint retained theorem.

For every finite-dimensional remote complex Wick cubic q of bidegree (2,1), let u=E|q|² and δ=E|q|⁴−2u². At the exact peak a=699/1250, b=179/1250, define

    Φ_B(w) = E_Z[(Z²/√2) conjugate(ph(Z(a+b|Z|²)+w))],
    c_B(q) = Π_(1,0) Φ_B(q).

Then the completed certificate proves

| Closed energy interval | Bound on ‖c_B(q)‖² |
|---|---|
| [1/2000, 1/100] | (61/1000) δ |
| [1/100, 1/50] | (7/125) δ |
| [1/50, 3/100] | (13/250) δ |
| [3/100, 1/25] | (49/1000) δ |
| [1/25, 463/10000] | (23/500) δ |

The stronger exact rational coefficients are recorded in `b_barrier_certificate.json`. Neither nonnegative deficit D nor independence between q and a proposed remote linear driver is assumed. These estimates concern c_B alone and hold in every finite remote dimension.

## 1. Scalar representation of the B profile

Write s=t(a+bt)², A(t)=a+bt, J(t)=a+3bt, so ds/dt=AJ>0. Set

    f_B(s)=exp(-t)/(A(t)^3 J(t)).

The change of variables y=Z(a+b|Z|²) gives

    Φ_B(w)=(1/(π√2)) ∫_C y² conjugate(ph(y+w)) f_B(|y|²) d²y.

All integrals are absolutely convergent: the integral of |y|² f_B(|y|²)/π is E|Z|²=1. Define the odd, real scalar response

    m_B(x)=(1/(π√2))∫_(R²)(v_1²−v_2²) f_B(v_1²+v_2²) sign(v_1+x) dv.

Reality follows from reflection in v₂. The elementary phase identity and rotating the integration variable give

    Φ_B(w)=(1/4)∫_0^(2π) exp(iθ) m_B(Re(exp(-iθ)w)) dθ.       (1)

The Fourier factor is exp(+iθ). In particular Φ_B has charge +1, agreeing with the convention c_B,j=E[conjugate(Y_j)Φ_B(q)] even though the original shell is Z² conjugate(r_B)/√2.

The density and all its derivatives are smooth and integrable. Distributional differentiation of sign, followed by ordinary differentiation of the resulting smooth marginal, is therefore justified. Integration by parts in v₂ yields the nonsingular scalar source

    m_B''(x) = C x ∫_0^∞ [(3/2)f_B(x²+y²)+x² f_B'(x²+y²)]dy,
    C=8/(π√2).                                                (2)

For detail, m_B'(x)=4/(π√2)∫_0^∞(x²−y²)f_B(x²+y²)dy. On differentiating, use
∫_0^∞ y²f_B'(x²+y²)dy=−(1/2)∫_0^∞ f_B(x²+y²)dy; the boundary term y f_B(x²+y²) vanishes at both ends.

For scalar quadrature, every derivative of f_B is a positive rational sum up to its alternating sign. If a term in (−∂_s)^n f_B is c exp(−t)A^(−p)J^(−q), applying −∂_s produces the three terms

    c exp(-t) A^(-p-1)J^(-q-1),
    cpb exp(-t) A^(-p-2)J^(-q-1),
    3cqb exp(-t) A^(-p-1)J^(-q-2).                            (3)

Start at (p,q,c)=(3,1,1). In particular f_B'=−f_B(1+3b/A+3b/J)/(AJ). The verifier generates (3) by exact fractions; it does not differentiate numerically.

Twice differentiating (2) gives

    m_B''''(x)=C x ∫_0^∞ [15f_B'+20x²f_B''+4x⁴f_B'''](x²+y²)dy. (4)

This is the second derivative of the source m_B'', the derivative needed to bound its interpolation error.

## 2. Shifted resolvent and the chaos budget

The reviewed proof in `sources/received-2026-11-15-tilted-sector/content_profile_proof.md`, §§1–3, applies to any smooth odd equivariant planar profile with the bounded derivatives established above. For the OU semigroup P_t^(u) with invariant covariance (u/2)I, put

    Ψ_u=∫_0^∞ exp(t/3) P_t^(u)Φ_B dt.

The first-chaos identity and the centered Stein tensor inequality imply

    ‖c_B(q)‖² ≤ (2/3) δ sup_(R≥0) N_(Ψ_u)(R),
    N(A,B)=max{(3A²−2AB+3B²)/8, B²},                        (5)

where A=∂₁₁Ψ₁(R,0) and B=∂₂₂Ψ₁(R,0)=∂₁₂Ψ₂(R,0). The prefactor in (5) comes from the exact budget
E[(tr D)²+2‖D‖_F²]≤6δ and the 1/3 factor in the shifted-resolvent projection identity. Subtracting any linear function from Φ_B changes neither the content nor these Hessians.

By (1), differentiation of the semigroup reduces the Hessian to the bounded odd scalar function

    k_u(x)=∫_0^∞ exp(-5t/3) E[m_B''(exp(-t)x+√((u/2)(1-exp(-2t)))G)]dt,
    ((5/3)−(u/2)∂_x²+x∂_x)k_u=m_B'',   k_u(0)=0,            (6)

with G a real standard Gaussian. Its angular reconstruction is

    A(R)=∫_0^(π/2) cos³θ k_u(Rcosθ)dθ,
    B(R)=∫_0^(π/2) cosθ sin²θ k_u(Rcosθ)dθ.                  (7)

The reviewed angular norm lemma from `secant_content_proof.md`, §2, gives

    sup_R N_(Ψ_u)(R) ≤ (11/72)‖k_u‖_∞².                     (8)

Its quartic Bernstein check is replayed exactly by the new verifier. Combining (5) and (8), it suffices to bound k_u by a scalar cap c, yielding coefficient (11/108)c² in front of δ.

## 3. Fresh scalar certificates, including both infinite tails

The verifier proves

    |m_B''''(x)|≤1000 on [0,1],
    m_B''(x)≥−1 on [0,∞),
    m_B''(x)≤1 on [1,∞).                                     (9)

The first bound actually encloses its supremum below 72.148, but 1000 is the constant used in the rational witness.

For the tails, put ℓ(t)=√t(a+bt), H_T=1+3b/A(T)+3b/J(T), and T≥4. Since x²≤s=tA² and x²/(AJ)≤t, the absolute integrand of (2) is bounded by

    E_T(t)= C exp(-t)/(2A(T)²J(T)) [(3/2)t+H_T t²], t≥T.       (10)

Here √t≤t/2, all denominators increase, and H_t decreases. Each term t^j exp(−t), j≤2, is decreasing for t≥4. For a polynomial envelope c_j t^j exp(−t), the integral along y≥ℓ(T) is bounded by

    ∑_j c_j [a E_j(T)+3b E_(j+1)(T)]/(2√T),
    E_0(T)=exp(-T), E_j(T)=exp(-T)T^j+jE_(j-1)(T).             (11)

Indeed t(x²+y²)≥t(y²); use monotonicity of (10), then change variables y=ℓ(t) and ℓ'(t)≤(a+3bt)/(2√T).

For x≥ℓ(4), split the whole y integral at ℓ(4). The first part is at most ℓ(4)E_4(4), the second is bounded by (11). The resulting absolute upper bound is below 0.595. Since ℓ(4)=2.264<3, this covers the entire infinite x ray and overlaps the compact source cover.

For (4), on x∈[0,1], use (3) and the absolute bound
C[15|f_B'|+20|f_B''|+4|f_B'''|]. For t≥20, replace every denominator in (3) by its value at 20. This leaves a positive constant times exp(−t); (11) then bounds the omitted y tail. Its resulting bound is below 6.42·10^-12. The compact integral is enclosed by outward Riemann sums over 50 x intervals covering [0,1] and an explicit y partition ending at ℓ(20).

For m_B'', two-point Gauss quadrature on each y cell includes the exact remainder bound length⁵ times the supremum of the fourth Taylor coefficient divided by 180. The coefficients are propagated with Arb series and the inverse equation t(a+bt)²=x²+y². The unknown coefficient of each order has multiplier (a+bt₀)(a+3bt₀)>0. Every omitted integration tail uses (10)–(11) at T=20. A cover of 60 rational x intervals proves the second and third statements in (9); the endpoints are checked to meet exactly. Every acceptance comparison is an outward Arb comparison. Floating-point priorities only choose which quadrature cell to bisect. Nonfinite enclosures are rejected.

## 4. Rational supersolutions

`b_barriers.json` stores five sets of candidate rational decimal values Y_i and physical derivatives D_i at x_i=i/500. On each cell the cubic Hermite interpolant has power coefficients

    Y_i, hD_i, −3Y_i−2hD_i+3Y_(i+1)−hD_(i+1),
    2Y_i+hD_i−2Y_(i+1)+hD_(i+1),     h=1/500.

The interpolants K are C¹. They satisfy K(0)=0, K(1)=c and K'(1)≥0, where c is respectively .77, .74, .71, .69, .67. Every Bernstein coefficient on every cell is at most c+10^-8. This small rational inflation protects the bound from the finite decimal representation; the verifier still checks the exact decimal coefficients rather than trusting an optimizer.

The verifier recomputes (2) at all 501 nodes, from scratch. By (9), its piecewise linear interpolation plus 1000h²/8 majorizes m_B'' on each cell. It then subtracts this source majorant from

    L_u K=(5/3)K−(u/2)K''+xK'.

Every Bernstein coefficient of the residual cubic is strictly positive at both energy endpoints. The minimum completed margin exceeds 1.9988·10^-4. Since the residual depends affinely on u, both endpoint checks prove L_uK≥m_B'' throughout each closed energy interval.

Extend K constantly by c on [1,∞). There L_uK=(5/3)c≥1≥m_B''. Its derivative jumps downward at 1, giving the favorable sign for the negative second-derivative term. The constant lower barrier −3/5 has L_u(−3/5)=−1≤m_B'' and lower boundary value at zero. The maximum principle therefore gives

    −3/5 ≤ k_u(x) ≤ K(x) ≤ c+10^-8,   x≥0.

For completeness, all functions are bounded. Subtract ε(1+x²) from a purported positive difference k_u−K; it attains its positive maximum at finite x and
L_u[ε(1+x²)]=ε[(5/3−u)+(11/3)x²]>0 on the certified u range. A smooth positive maximum contradicts the differential inequality. At the derivative jump of K, the difference's derivative jumps upward, precluding a strict maximum; a zero jump is covered by one-sided second derivatives. Let ε decrease to zero. The lower comparison is identical. Oddness extends the resulting bound to negative x.

Inserting ‖k_u‖∞≤c+10^-8 into (5)–(8) proves the table. The last comparisons to its clean rational ceilings are performed with exact fractions.

## 5. Replay, scope and current obstruction

```
python3 -I b_barrier_verify.py
```

Requires python-flint. If it is not installed, `B_CONTENT_FLINT` may name a directory containing the package. All mathematical inputs are relative files in this directory. The verifier rejects optimized Python modes because its assertions are certificate checks. No cached profile integral, numerical source table or numerical optimization result is accepted as a theorem. A complete replay takes about 16 seconds in the recorded environment.

`b_barrier_certificate.json` records the bounds, residual margins, runtime, and SHA-256 hashes of the input and verifier; `b_barrier_verify.log` records stdout. No Lean claim is made and independent review is still required.

These estimates substantially sharpen the previous .14δ structural B envelope on the covered energies. They do not establish ‖c_B‖²≤.06D₊+4·10^-6. For example, at u=.0463 and χ=3, the .046δ envelope is approximately .0002958; the currently available deficit lower bound .000845095 makes the proposed target only about .00005471. This is a gap between two bounds, not a counterexample cubic.

The signed-resolvent numerical probe finds an actual sampled metric coefficient of about .038208904 at u=.0463, R≈.42193. Thus retaining the sign in the angular integral only improves the scalar-cap route modestly. A coefficient near .0085 cannot be reached by perfect evaluation of this uniform metric supremum alone, according to these **N** probes. A stronger deficit certificate, a further law-dependent B envelope, or a different structural inequality is needed.
