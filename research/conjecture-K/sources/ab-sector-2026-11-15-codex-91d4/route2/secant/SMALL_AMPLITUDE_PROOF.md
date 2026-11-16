<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/secant/SMALL_AMPLITUDE_PROOF.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Uniform small-amplitude joint secant

Agent-ID: **codex-91d4**. Task #426. **P+C, author only.**

At the peak profile and tilt `(3/5,0)`, the proposed common cost `23/100`
is now proved for every complex w whenever

    R=sqrt(|α|²+|β|²) ≤ 1/32000.                            (1)

This is a genuine uniform small-amplitude region, with no restriction on
phases or on w. The radius is deliberately conservative. It does not
close the remaining central five-parameter compact region.

Explicitly, `f(w;α,β)=E|L+w+(T−2/5)α+Z²conj(β)/√2|` has one norm
expectation, and `Rem=2[f(w;ρ)−f(w;0)−Df(w;0)[ρ]]` is twice its
Bregman remainder. Use the diagonal majorant Q from `EXTERIOR_PROOF.md`.
In real coordinates ordered `(Re α,Re β,Im α,Im β)`,
put `P=diag(p−9/25,p,p−9/25,p)`.

## 1. The Hessian at zero amplitude

By simultaneous rotation take w≥0 real. For `θ∈[0,π/2]` and `y≥0`,
let x be the unique real root

    b x³+(a+b y²)x+w cosθ=0,
    D=a+b(y²+3x²)>0,     T=x²+y²,
    A=T−2/5, U=(x²−y²)/√2, V²=2x²y².                     (2)

The projection identity `|v|=(1/2)∫₀^π|Re(e^(−iθ)v)|dθ`, followed
by the distributional second derivative `2δ₀` of absolute value,
gives the real parameter Hessian as an integral of rank-one positive
matrices. Reflection in y and then `θ↦π−θ` remove the off-block entries.
The real and imaginary blocks are respectively

    H_R= (4/π)∫₀^(π/2)∫₀^∞ e^(−T)/D
         [[A²cos²θ, AUcos²θ],
          [AUcos²θ,U²cos²θ+V²sin²θ]] dy dθ,

    H_I= (4/π)∫₀^(π/2)∫₀^∞ e^(−T)/D
         [[A²sin²θ, AUsin²θ],
          [AUsin²θ,U²sin²θ+V²cos²θ]] dy dθ.              (3)

For example, the B-direction projections before averaging y are
`Ucosθ−√2xy sinθ` and `Usinθ+√2xy cosθ`. Their mixed terms odd in y
vanish. The remaining cross-block terms are odd under `θ↦π−θ`.
This explains both blocks and every factor in (3).

The checker substitutes `θ=(π/2)v`, so the factor becomes 2 and the
integration domain is `0≤v≤1, y≥0`. It certifies

    H_R(w),H_I(w) ≼ diag(p−9/25,p)−(47/200)I₂
       for every 0≤w≤7/2.                               (4)

### Root enclosure and differentiation

For z=wcosθ≥0 the root is nonpositive. Its value decreases with z and
increases with y≥0. Thus, on a z,y rectangle, the two corners
`x(z_hi,y_lo)` and `x(z_lo,y_hi)` enclose every root. Point roots are
accepted only after outward interval sign checks bracket the cubic;
floating Newton iterations merely propose these brackets.

The quadrature encloses second derivatives using interval jets. The
root derivatives used in those jets are

    x_y=−2byx/D,
    x_yy=−[6bx x_y²+4by x_y+2bx]/D,
    x_v=w sinθ·(π/2)/D,
    x_vv=[w cosθ·(π/2)²−6bx x_v²]/D.                      (5)

All other jet operations are ordinary product, reciprocal and chain
rules. Each source rectangle uses its midpoint value plus the exact
tensor midpoint error bound

    area·[h_y² sup|∂_yy integrand|+h_v² sup|∂_vv integrand|]/24.

The w argument remains interval-valued throughout. Consequently each
accepted w slab covers all its points, not just its midpoint.

For y≥5 the positive omitted Hessian has operator norm at most its trace.
Since its unintegrated trace numerator is
`(T−2/5)²+T²/2≤3T²/2` and `D≥b y²`, its trace is at most

the expression below: `T²exp(−T)` decreases for `T≥25`, and
`T≥y²≥25`, so replace it by `y⁴exp(−y²)` before dividing by `b y²`.

    (3/b)∫₅^∞ y²e^(−y²)dy
      ≤(3/b)(5/2+1/20)e^(−25)<10^−9.                     (6)

The interval checker subtracts this allowance from both diagonal
slacks before checking positivity of each 2×2 residual matrix. It
checks diagonal positivity and determinant positivity, using interval
off-diagonal squares. Thus it accepts Loewner inequalities, not
entrywise ones.

### Accepted cover and arithmetic

The completed run accepted 52 w slabs, with 103 visits and maximum
depth 8, using 16×64 source rectangles per attempted slab. The slab
tree starts at `[0,7/2]` and every failed slab is bisected exactly;
therefore exhaustion of the pending list proves the union covers the
whole interval. Runtime was about 0.65 seconds. A bounded unfinished
run exits nonzero and prints no global PASS.

`base_hessian.cpp` includes the verbatim directed-rounding primitives
from `inputs/theta_verify.cpp`, copied from the reviewed tilted-sector
package. All operations use the original outward discipline and strict
compiler flags. The new code rejects `NDEBUG` at compilation. The
containing rational interval for π is the same inherited checked
interval as in that source; its true value is not supplied by libm.
The Gaussian exponentials use rational Taylor bounds from that source.

## 2. A global third-derivative bound in a radius-1/100 ball

This step is uniform in every complex w. In the general projected root
formula of `GEOMETRY.md`, write ρ=(α,β), and let `g_η` denote the
projection of the shell field with coefficient direction η. At a source
point `(x,y)`, `T=x²+y²`, direct Cauchy–Schwarz gives

    |g_η|≤(5/4)(T+1)‖η‖,
    |∂_x g_η|≤(5/2)√T‖η‖.                               (7)

Indeed the squared coefficient norms are exactly
`(T−2/5)²+T²/2` and `4x²+2T`, respectively. These are bounded by the
squares in (7).

For `‖ρ‖≤1/100`, the root derivative denominator and its x derivative
satisfy

    D≥a+bT−√6‖ρ‖√T
      ≥a−3‖ρ‖²/b+(b/2)T
      >11/20+(7/100)T=:d(T),
    |D_x|≤6b√T+1/40.                                    (8)

The first line is completion of a square; the two last rational
comparisons are checked exactly. It proves strict monotonicity and a
unique projected real root on this entire parameter ball.

Let σ be another parameter direction. Implicit differentiation gives
`x_σ=−g_σ/D`. Differentiating the Hessian integrand yields

    ∂_σ[g_η²e^(−T)/D]
      =e^(−T)[−2g_η(∂_xg_η)g_σ/D²
          +2xg_η²g_σ/D²−g_η²(∂_xg_σ)/D²
          +g_η²D_xg_σ/D³].                              (9)

For unit η,σ, equations (7)–(9) bound the absolute value by

    F(T)=e^(−T){[3c₀²c₁(T+1)²√T+2c₀³(T+1)³√T]/d(T)²
         +c₀³(T+1)³[6b√T+1/40]/d(T)³},
    c₀=5/4, c₁=5/2.                                    (10)

The projection formula has factor `1/π` and angle range of length π,
while its source ordinate runs over the full real line. Since T≥y²,

    |D³_ρ f[η,η,σ]|
      ≤2∫₀^∞ sup_(T≥y²)F(T)dy ·‖η‖²‖σ‖ <480‖η‖²‖σ‖.   (11)

This is an absolute bound, so no symmetry of the perturbed roots is
assumed. The dominating function is integrable; it also justifies all
parameter differentiations of the coarea integral. A smooth convex
approximation of the absolute value, strict root monotonicity and
dominated convergence provide an ordinary C³ parameter derivative.

### Exact acceptance of the scalar integral

`derivative_exact.py` encloses F on 512 rational intervals partitioning
`[0,16]`. A reverse running maximum bounds `sup_(T≥y²)F(T)` on each
source-y interval `[sqrt(t_j),sqrt(t_(j+1))]`. All endpoints, function
bounds and square roots are outward rational intervals.

Beyond T=16 it uses the explicit simpler bound

    F(T)≤e^(−T)[(3025/64)(T+1)³+(581/20)(T+1)⁴].          (12)

This follows from d(T)>1/2 and √T≤T+1. Both polynomial-exponential
terms decrease on T≥16. The remaining y≥4 integral is evaluated using
the Gaussian-tail recurrence, starting from
`∫₄^∞e^(−y²)dy≤e^(−16)/8`. This includes the whole infinite tail.

The accepted upper expression is

    inner ∈ (478.393388855105014297,478.393388855105014298),
    tail  ∈ (.091969648316499599,.091969648316499600),
    total ∈ (478.485358503421513897,478.485358503421513898)<480.

Runtime was about 2.6 seconds. No numerical optimizer or sampled
derivative is an acceptance input.

## 3. From Hessian to the doubled secant

Fix |w|≤7/2 and R≤1/32000. Integrating (11) from 0 to τρ gives

    D²f(w;τρ)[ρ,ρ]
      ≤ρᵀ(P−(47/200)I)ρ+480τR³.

The doubled Bregman remainder is exactly

    Rem(w;ρ)=2∫₀¹(1−τ)D²f(w;τρ)[ρ,ρ]dτ.

Thus the constant Hessian contributes its coefficient once, while the
third-derivative allowance has the factor
`2∫₀¹τ(1−τ)dτ=1/3`. Therefore

    Rem(w;ρ)≤ρᵀ(P−(47/200)I)ρ+160R³
      ≤ρᵀ(P−(23/100)I)ρ=Q.                              (13)

The last comparison is the exact rational identity
`47/200−160/32000=23/100`. The case R=0 is equality. For |w|≥7/2,
`EXTERIOR_PROOF.md` already gives the same bound at every amplitude.
This proves (1) for all w.

## 4. Replay and remaining obligation

Run in this directory:

    clang++ -O2 -std=c++17 -frounding-math -ffp-contract=off -fno-fast-math base_hessian.cpp -o base_hessian
    ./base_hessian 16 64
    python3 -I derivative_exact.py
    python3 -I exterior_exact.py

The full joint target remains open on the compact mixed cone

    |w|<7/2, 1/32000<R<5, |α|/21<|β|<56|α|.

The tiny lower amplitude cutoff makes plain absolute-error function
interpolation near its lower boundary expensive. A larger directly
certified Hessian ball would be useful before launching that cover.
No such large cover was run while the content budget remains unresolved.
