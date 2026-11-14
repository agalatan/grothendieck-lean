<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/tailgames-2026-11-14/README.md (file dated 2026-11-14). Only this line was added. -->
# Games with an identity tail — exploration of 14 November 2026 (claude-b9ee)

All numbers here are floating point, in the two-variable graded model (one visible coordinate z, one grade-3
driver w), unless a line says otherwise. Nothing in this folder is a certificate.

## 1. The device

A game `λ = (1, λ₁, …, λ_D, ν, ν, ν, …)` (finite head, constant tail ν, |ν| ≤ 1) is a valid witness: `1/K ≤ N(λ)`.
Its operator is `T = Σ_{k≤D} (λ_k − ν) P_k + ν·Id`. For unimodular f, g the identity part is pointwise:
`Re⟨f, g⟩ = E cos 2θ = 1 − 2‖k‖²` with `k = (f − g)/2`. Hence

- the tail adds no order parameter (the convex structure is that of the head alone);
- `Σ_{k>D} c_k(f,g) = ⟨f,g⟩ − Σ_{k≤D} c_k(f,g)` exactly, so model norms of such games have no truncation error
  (the degree-7 primal/dual run of 22 October failed for exactly that reason).

For the cubic head, with `s = 1 − ν`, `ε̂ = (ε + ν)/(1 − ν)`, `ν̂ = ν/(1 − ν)`:

    N(1, −ε, ν, ν, …) = (1 − ν) · sup_{f,g} [ V_ε̂(f,g) − 2ν̂ ‖k‖² ] + ν,

where `V_ε = ‖Ph‖² − ε‖Qh‖² − ‖Pk‖² + ε‖Qk‖²` is the cubic functional of the Lean proof. The row bound is the cubic
one with the pointwise potential `|A| + |B|` replaced by

    Ψ_ν(A, B) = max_{|u|=|v|=1} [ Re(ūA) + Re(v̄B) + ν Re(u v̄) ]
              = min { (d₁+d₂+d₃)/2 : diag(d) ⪰ M },   M = [[0,A,B],[Ā,0,ν],[B̄,ν,0]]

(the second form because 3×3 complex correlation matrices have rank-one extreme points; any feasible d is an upper
bound; checked numerically to 5e-15 on 40 random cases, `psidual.py`). Remark: writing `μ‖h‖² = μ − μ‖k‖²` with μ = λ₂ turns the degree-5 game into a cubic-type row too, but the
concave term `−λ₂ Σ_{k≥3} ‖P_k h‖²` then has to be kept, and its non-visible part is the old h-side loss (§4).

## 2. Results

| game | model norm | 1/N | source |
|---|---|---|---|
| cubic, ε = 0.7564, no tail | 0.713136 | 1.402257 | `sanity.log` (known value 0.7131355) |
| quintic (1, −0.8494, 0.283), no tail | 0.712430 | 1.403646 | `sanity.log` (known 0.7124294) |
| cubic head + tail, optimum ε = 0.7681, ν = +0.0235 | **0.713021** | **1.402483** | `cp_1_free.log`, `two.log`, `scan3.log` |
| same family with λ₂ ≤ ν free (h-side trivial) | 0.713022 (optimum at λ₂ = ν) | | `htriv.log` |
| quintic head, no tail, optimum (1, −0.8493, 0.2827) | 0.712430 | 1.403646 | `cp_2_zero.log` (cutting planes, gap 1e-7) |
| quintic head + tail, near (1, −0.864, 0.338), ν ≈ −0.015 | between 0.712375 and 0.712404 | ≈ 1.40370 | `cp_2_free.log` (stopped at gap 3e-5) |

- Two independent optimisers (simplex; cutting planes with an LP over the game) agree to 1e-6 on the cubic family.
- At degree 5 a constant tail gains only about 4e-5, and with the opposite sign (ν < 0). A degree-7 head was started
  and stopped unfinished (no result).
- At the optimum the active responses are driver pairs with `c₁ = 0` and `Σ_{k≥2} c_k = 0`; the plain phase pair is
  2.9e-4 below.
- The transition from the plain phase response to the driver branch is continuous for ν = 0 (at ε ≈ 0.717) and
  discontinuous for ν > 0 (`scan3.log`): e.g. at (ε, ν) = (0.765, 0.025) the plain phase pair is the model maximiser,
  value `(π/4)(1 − ε/8) + ν(1 − 9π/32) = 0.713205` (1/N = 1.40212), and the driver branch is 1.5e-4 below.
- Adding a real grade-(1,1) driver (diffuse chirp pairs `e^{±iκ r ξ}`) changes nothing at the cubic optimum or at
  the tail optimum (`m3_cubic.log`, `m3_two.log`); chirp starts relax to the driver pair.

## 3. Second variation at the plain phase response (`hess.py`)

Gain/cost ratio per sector (> 1 means unstable) for the game (1, −ε, ν, ν, …):

| ε | ν | remote cubic | Y (diffuse chirp) | A | radial chirp |
|---|---|---|---|---|---|
| 0.7564 | 0 | 1.083 | 0.880 | 0.755 | 0.733 |
| 0.7564 | 0.02 | 0.910 | 0.867 | 0.599 | 0.708 |
| 0.85 | 0.05 | 0.936 | 0.975 | 0.590 | 0.778 |

The tail regularises the 1/|L| singularity that the remote sector uses (weight `1/(|L| + 2ν)`), so the remote ratio
falls fast and the chirp sector becomes the largest. All ratios below 1 does not mean phase is optimal: at
(0.85, 0.05) the plain phase value is 0.7078, below the proved floor 1/K ≥ 0.71195, and the driver branch wins at
finite amplitude.

## 4. Structure of the best response at the cubic optimum (`hdecomp.py`)

`‖h‖² = 0.8516`, visible part 0.8237, non-visible 0.0280: driver degree 2: 0.0183, degree 4: 0.0040, degree ≥ 6:
0.0056. `‖k‖² = 0.1484`: driver degree 1: 0.1336, degree 3: 0.0076, higher: 0.0071. So a gate on the non-visible
part of h costs λ₂ · 0.028 ≈ 0.008 at λ₂ = 0.283 (the known ≈ 1e-2 loss at degree 5), and test functions of second
order in the driver still leave λ₂ · 0.0096 ≈ 2.7e-3, more than the 7e-4 that degree 5 gains.

## 5. Ideas tested and refuted the same day

1. `p ↦ log(E|X|^p / E|N|^p)` convex for chaos X (would give E|X| ≤ √(2/π)‖X‖₂): false on p ∈ (−0.8, 0.4) for
   He₂ … He₆ (`mellin2.py`); only the sign pattern (≤ 0 on [0,2], ≥ 0 outside) holds.
2. Reduction to the sphere S³ ⊂ ℂ² via `F(a) = f(a₁U + a₂V)`: valid (`N_∞(λ) ≤ N_{S³}(κ)` with
   `λ_k = E[κ(s) conj(s|s|^{2k})]`), but every S³ instance has ratio ≤ K_G^ℂ(2) ≈ 1.2, so it can never show a norm
   below ≈ 0.82 λ₀; in particular linear phases are not optimal on S³ for good games.
3. Shift by the vector-valued Borell inequality in the style of the real-case rotation constraints: the Borell
   deficit of a driver pair is ≈ 1e-2 even at τ = 0.95 (hand estimate for phase(Z ± 0.35 W₃)), against a budget of 1e-4 (and the inequality is only
   conjectured for S¹-valued functions in dimension above 2).
4. Bellman function / martingale relaxation in the state (t, f_t, g_t): by the argument that the two gradients can be
   aligned freely at each time, it cannot see the sign of the time multiplier a(t) and returns the bound of |a(t)|
   (argument only, not computed).
5. Sum of squares: the degree-2 relaxation gives only the trivial value 1 for `sup ‖P₁,₀ f‖²` (truth π/4), because the
   true proof takes a supremum over the direction of the order parameter. Degree 4 was not tested.

## 6. What it means

- Upper side: unchanged view. The two-coordinate excess of the screening functional is 5e-6 in the complex case
  against 8e-4 in the real case, so the mechanism that took the real constant below Krivine's value has no room here.
- Lower side: the tail lifts the ceiling of the cubic-type certificate from 1.40226 to 1.40248. If the certificate
  loss stayed at its present 1.4e-4 (model 0.713288 against certified 0.713425 at ε = 0.745), the certified bound
  would be ≈ 0.71316, i.e. ≈ 1.4022. That "if" is untested: it needs the float row pipeline rerun with Ψ_ν at
  (ε, ν) ≈ (0.768, 0.0235), then new caps and a Lean change in the witness and the pointwise step.

## Files

`tailmodel.py` (model and alternating maximisation), `cutplane.py` (LP over games), `scan2.py`, `scan3.py` (maps of
N(ε, ν)), `hess.py`, `hdecomp.py`, `model3.py` (model with the real driver), `mellin2.py`; logs `*.log`.
Run with a Python that has numpy and scipy, e.g. `python3.12 tailmodel.py sanity`.
