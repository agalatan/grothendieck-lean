<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/STEIN_COUPLING.md, 2026-11-15 10:36; Agent-ID: codex-8d2f. -->
# Coupling the A-content resolvent to the radial Stein variables

Agent-ID: **codex-8d2f**, 15 November 2026. New proof **P, author only**;
scalar and rational acceptance **C**, subject to the analytic dependencies
identified below. This is a partial energy/kurtosis rectangle, not the
requested full-range theorem.

## The certified partial result

At the peak row, tilt `3/5`, in every finite dimension, for every remote
`(2,1)` Wick cubic with

    37/800 ≤ u = E|q|² ≤ 463/10000,
    3/2 ≤ χ = E|q|⁴/u² − 2 ≤ 9/4,

the result is

    ||c_(3/5)(q)||² ≤ (1/5) D(q) + 3/500000
                       ≤ (1/5) D₊(q) + 3/500000.                 (1)

The first inequality is signed and does not assume `D≥0`. This improves
the coefficient on this rectangle only. The remaining energies and χ
values have not been certified with coefficient `1/5`.

## 1. Keep the content in the Stein quadratic form — P

Write `q=√u Q`, `U=|Q|²`, and normalize the real Gaussian carré du champ by

    X = Γ(Q,conjugate Q)/3 − 1,
    z = Γ(Q,Q)/3 · conjugate(Q)²/U = r+i s                 (U>0),

setting `r=s=0` at `U=0`. The value on that null set is immaterial for a
nonzero polynomial. Put `P=E[XU]` and `R=E[rU]`. The inherited cubic
Stein identities give

    E X=0,  2P+R=χ,  R≤χ/3,
    E X²≤2P/3,  E(r²+s²)≤2R/3.                           (2)

The second spectral inequality follows before discarding the imaginary
component in the archived proof: with `c=Γ(Q,Q)/3`,
`E|c|²≤2R/3` and `r²+s²=|c|²` off `Q=0`. This is stronger than the
separately quoted bound on `r²`; it uses the same chaos-2/chaos-4
decomposition, not a new tensor hypothesis.

Let `Φ(x)=x h_(3/5)(|x|²)` be the real two-dimensional content field,
`Ψ_u=∫₀∞ e^(t/3) P_t^(u) Φ dt`, and let `A,B` be the two radial Hessian
components of `Ψ_u` in the radial frame, as in the existing content proof.
The reviewed shifted-resolvent identity and projection contraction give

    C² ≤ (1/9) E|𝒟 : D²Ψ_u(q)|²
       = u²/4 · E[((A+B)X+(A−B)r)²+4B²s²].              (3)

Here `𝒟=Γ_real−(3u/2)I₂`. In the frame where `q` is positive real,
`𝒟=(3u/2)[[X+r,s],[s,X−r]]`; contracting with the radial Hessian yields
the displayed expression. Thus (3) retains the joint position of the
Stein variables and the Hessian rather than using its global supremum.

For `11/250≤u≤463/10000`, the previously certified absolute scalar
barrier `W44` gives `|k_u(x)|≤W44(|x|)` and

    |A| ≤ Abar(R),  |B| ≤ Bbar(R),   R=|q|,
    Abar(R)=∫₀¹ (1−z²)W44(R√(1−z²)) dz,
    Bbar(R)=∫₀¹ z² W44(R√(1−z²)) dz.                     (4)

`barrier_boxes.py` bounds these integrals by exact rational rectangle
sums over 200 radial and 256 angular intervals, using Bernstein
coefficients of every intersected rational Hermite cell. For `R≥2` it
uses the proven `Abar<49/200`, `Bbar<31/200` tail bounds. The full
replay rechecks the barrier source before making the boxes.

## 2. A strengthened spectral dual — P

Let `φ` be continuous piecewise affine, constant after its last knot;
`Φφ(x)=∫₀ˣφ`, `dφ=φ−Φφ/x`, and `aφ=Φφ−φ`. For `λ,μ>0`, `ν≥0`
and real `t,β`, set

    f=−(φ+β)/2+(2t+λ/3)U,
    g=−dφ/2+(t+μ/3−ν/2)U.

For `γ>0`, define the symmetric matrix and scalar

    M11=λ−u²(A+B)²/(4γ),  M22=μ−u²(A−B)²/(4γ),
    M12=−u²(A²−B²)/(4γ),  T=u²B²/γ.

If `M` is positive definite and `μ≥T`, put

    G = aφ+(ν/3−2t)(U²−2)+(f,g) M⁻¹ (f,g)ᵀ.             (5)

Let `V` be the right side of (3). Expanding squares, applying the radial
Stein identity, `EX=0`, and (2) gives

    EG − V/γ
      = E[(v−M⁻¹h)ᵀ M (v−M⁻¹h)+(μ−T)s²]
        + λ(2P/3−EX²)+μ(2R/3−E(r²+s²))
        + ν(χ/3−R) ≥ 0,

where `v=(X,r)` and `h=(f,g)`. This is the archived spectral cut with
the content quadratic retained inside its square completion. If a cubic
polynomial `J(U)` globally majorizes `h(uU)+G`, then
`F+V/γ≤EJ`, hence `C²≤γ(B−F)+η` whenever `γ(EJ−B)≤η`.

For a radial box the checker admits all `A∈[−Abar,Abar]` and
`B∈[−Bbar,Bbar]`. For fixed `X,r,s`, the subtracted quadratic in
`A,B` is convex, so it suffices to check its rectangle corners. Global
sign reversal leaves that quadratic unchanged; two sign choices cover
the four corners. The verifier checks positive definiteness, `μ≥T`, and
the half-line majorant after multiplying by the positive determinant and
`U²`. It checks all finite pieces using exact rational Bernstein
coefficients and the infinite ray by exact nonnegative coefficients.

At `u=463/10000`, a single rounded dual passes 356 finite pieces and the
tail. The base and extended Hermite profile caps and the Gaussian
benchmark are freshly recomputed with Arb. `J₃≥0`, so its expectation
bound is convex in `χ`; the endpoint checks imply the entire interval
`[3/2,9/4]`. The exact endpoint margins are in
`coupled_verification.log`, approximately `1.4320·10⁻⁵` and
`2.5958·10⁻⁵` in content-squared units. The floating-point solver only
proposed the coefficients; it is not part of acceptance.

## 3. Transfer to a short energy interval — P+C

Fix the normalized law `Q` and write `u₀=463/10000`, `Δ=u₀−u≥0`.
The inherited certified profile gives
`|d h_(3/5)(ρ²)/dρ|≤1/√3`. Since `EU²=2+χ≤17/4`, projection contraction
and `√u(√u₀−√u)≤Δ/2` give

    C(u) ≤ √(u/u₀) C(u₀) + (3/5)Δ.                       (6)

The benchmark profile obeys `−3≤h''≤0`; comparing both laws with its
tangent at zero gives

    D(u₀) ≤ (3/2)u₀²·(17/4),
    |D'(v)| ≤ 3u₀·(25/4),       0≤v≤u₀.                  (7)

The second inequality uses both `EU²≤17/4` and the exponential
benchmark's second moment 2. The signed endpoint certificate and the
first bound in (7) imply `C(u₀)<11/200`, by the exact comparison in the
checker. With `Δ≤1/20000`, equations (6)–(7) therefore lose at most

    (33/500)Δ + (9/25)Δ² + (1/5)·3u₀·(25/4)Δ

from the signed content budget. The checker compares this exact rational
loss with the smaller endpoint margin. Since
`u₀−1/20000=37/800`, this proves (1). No sign assumption on `D` is used.

## Dependencies and limitations

The full replay regenerates W44, its source bounds, the original global
Hessian profile, the base and extended profile caps, and the benchmark.
The OU/Stein and cubic moment identities, the Hermite-cap theorem, and the
analytic implications of those scalar checks are inherited mathematical
inputs; the replay does not formalize them in Lean. No statement on the
complement of the displayed rectangle follows from this certificate.
