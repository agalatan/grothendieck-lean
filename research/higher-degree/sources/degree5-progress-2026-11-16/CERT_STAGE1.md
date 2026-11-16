<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CERT_STAGE1.md, 16 November 2026; claude-b9ee research worker. -->
# Degree-5 conditional certificate, stage 1: vertical slice and the rows on [0.703, √π/2]

Worker for claude-b9ee (issue #453, milestone M1 part (a)), 16 November 2026.
- Design: `DEGREE5_CERT_DESIGN.md`; gate: `GATE.md`.
- Code: `cert/`; data and logs: `cert/out/`.
- Labels: **P** proof on paper (author only, in this file); **C** exact or interval-certified computation (author
  only; replay scripts below); **N** floating point.

Game: T₅ = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ with ε₁ = 2653/3125 (0.84896) and η = 1409/5000 (0.2818), as exact rationals.

---------------------------------------------------------------------------------------------------------------------

## 0. Result

1. **Conditional theorem on t ∈ [0.703, √π/2] (C, given K₅).** Take the 17 rows of §4 with t ≥ 0.74 (exact rationals). Suppose
   every row satisfies K₅(η₅) (§1). Then every unimodular pair with t = ‖P₁,₀h‖ ∈ [703/1000, √π/2] has

   > **Re⟨f, T₅g⟩ ≤ B + η₅, B = 0.7124786076…** (an exact rational, `cert/out/envelope_stage1.json`).

   - Over the binding band [0.82, √π/2] alone, B = 0.7124771.
   - 500/701 − B = 7.88·10⁻⁴, so η₅ ≤ 7.7·10⁻⁴ gives 1/(B + η₅) > 1.40203 on this range.
   - **The range t < 0.703 is not covered**, and it does not follow from the present inputs (point 3). So this is not
     yet a bound on K_G^ℂ.
2. **Vertical slice at the peak row** r₀ = (84007/10⁵, 159103/10⁶, −158645/10⁶, −96542/10⁶):
   - C = 2β²/ε₁ + G⁺ = 1.41816409663 (exact).
   - **R([0.835, 0.845]) = 0.71247220.**
   - At t = 0.84: certified 0.71244650; float moment-LP 0.7124457 (+1.9·10⁻⁶); Gaussian ideal 0.71242949
     (+1.70·10⁻⁵).
3. **Small t (P + N; the main risk).** With the Lean moment inputs, every row's bound at t = 0 is ≥ ε₁ρ*², with
   ρ* = sup E√U ≥ 0.9717 over the admissible laws (attained near m = 3): ≥ 0.80 > 500/701.
   - The weakness is in the law inputs, not in the row method: at t = 0 the k-side alone gives ε₁(E|q|/‖q‖)², up
     to the dropped ‖Pk‖², η‖Rk‖².
   - So T₅ needs a dimension-free radius bound **E|q| ≤ 0.916‖q‖** on remote cubics, or law inputs that imply it.
   - The sharp conjecture is √π/2 = 0.886; proved: 0.9736 (Lean), 0.95133 (R).
   - The Lean Stein family with the coupled Gram budgets (cut generation, N) gives sup E√U = 0.912 at m = 2.3 but
     0.919 at m = 2.6, 0.924 at m = 3, 0.935 at m = 4 and 0.955 at m = 6.
   - So the Lean inputs do not reach 0.916.
   - GATE.md says the rows below t ≈ 0.76 also need the order-2/4 sharing lemma.
4. **The design's mid-t law budget was optimistic.** Its LP held ν₅ at the Gaussian optimum. With ν₅ free, the
   moment-only gaps are:

   | t | 0.74 | 0.76 | 0.78 | 0.80 | 0.82 | 0.84 | 0.86 | 0.88 |
   |---|---|---|---|---|---|---|---|---|
   | certified gap | 7.5·10⁻⁴ | 1.3·10⁻⁴ | 7.9·10⁻⁵ | 6.0·10⁻⁵ | 3.6·10⁻⁵ | 1.8·10⁻⁵ | 5·10⁻⁶ | 4·10⁻⁶ |

   - At t = 0.74 the design had 6.6·10⁻⁵; the float value is 5.8·10⁻⁴ (σ = 0.5, m = 3.5, ν₅ = 0).
   - The rows at 0.70 and 0.72 lose ≥ 5·10⁻³ and cover nothing.
5. **Cost (big, shared, 25–50 of 48 cores busy).**
   - Ψ₅ cap: **40 ms per node** (width ≤ 7·10⁻¹¹).
   - Per row: 18.7·10³ caps ≈ 12 CPU-minutes; law cover ≈ 2100 boxes ≈ 12 CPU-minutes.
   - About **25 CPU-minutes per row**, 3 wall-minutes on 10 processes.
   - All 19 rows of this session took about 8 CPU-hours.

---------------------------------------------------------------------------------------------------------------------

## 1. Statement and chain

**Row (P, design R1–R2).** For unimodular f, g, h = (f+g)/2, k = (f−g)/2 and P₁,₀h = t z₁, set G₃ = ε₁P₂,₁k,
G₅ = ηP₃,₂h, q = E_{z₁}G₃ ∈ H₂,₁(w) and C = b_A q e₁₁ + b_B q̄ e₂₀ (c₅ = 0). Then

  Re⟨f, T₅g⟩ ≤ t² − 2ℓt + 2β²/ε₁ + (b_A² + b_B²)‖q‖²/η + Λ₅(G₃, G₅).

**Hypothesis K₅(η₅) at a row** (the interface to part (b)). For all n, G₃ ∈ H₂,₁(ℂⁿ) and G₅ ∈ H₃,₂(ℂⁿ):

  **Λ₅(G₃, G₅) ≤ sup_{ν∈ℝ} [E_w Ψ₅(|q|; ν) − ν²/η] − ‖q‖²/ε₁ + η₅**,

  Ψ₅(s; ν) = E_z|L + νe₃₂ + sD| + E_z|L + νe₃₂ − sD|, L = z(ℓ + β(|z|² − 2)), D = 1 − b_A e₁₁ − b_B e₂₀.

The right side is Λ₅ at the q-only points G₃ = q, G₅ = νe₃₂ (P: rotate z by the phase of q; then q − C = e^{iφ}|q|D).
So K₅ says that the q-only points with real ν₅ dominate, up to η₅. GATE.md estimates η₅ ≤ 2.3·10⁻⁴ on the binding
rows under its lemma forms.

- Imaginary ν₅ is left to the sector layer. Conjugation symmetry gives F(x + iy) ≤ F(x) + y²(M − 1/η) with
  M = E|e₃₂|²/|A₊|.
- Numerically **M ≤ 1.025 against 1/η = 3.549** for x ∈ [0, 0.29], s ∈ [0, 2] (N, `out/mcheck.log`). So the
  imaginary direction is pure cost with ratio ≤ 0.29.
- For x < 0, M = ∞ at s = 0. That is why the reduction to real ν is not claimed here.

**Law layer (C).** With κ = 1/ε₁ − (b_A² + b_B²)/η, σ = ‖q‖ and U = |q|²/σ², the row and K₅ give

  Re⟨f, T₅g⟩ ≤ t² − 2ℓt + 2β²/ε₁ + sup_ν[E Ψ₅(σ√U; ν) − κσ² − ν²/η] + η₅.

The certificate bounds the supremum by G⁺ over σ ≥ 0, ν ∈ ℝ and every law of U ≥ 0 with E U = 1,
m = E U² ∈ [2, 44], E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2} and E√U ≤ ρ (C₆ = 4045313/10⁵, ρ = 973612157/10⁹). These are
the Lean inputs for circular cubics (design R6). No Stein cuts are used.

**Envelope (C).** By R0, K_G^ℂ ≥ 1/max_{t∈[0,√π/2]} min_r [t² − 2ℓ_r t + C_r + η₅(r)]. Stage 1 supplies the C_r
and the envelope for t ∈ [0.703, √π/2].

---------------------------------------------------------------------------------------------------------------------

## 2. Certified Ψ₅ (`cert/psi5.cpp`, `cert/caps.py`)

**Reductions (P).**
- A₋(−z) = −A₊(z), so Ψ₅ = 2E|A₊|.
- |A₊(z̄)| = |A₊(z)|, so Ψ₅ = 4∫_{y≥0}|A₊| e^{−|z|²}/π.
- A₊ is a polynomial in (x, y), and P = (Re A₊)² + (Im A₊)² with real coefficients continues |A₊|² analytically to
  ℂ². No trigonometric function is needed.

**Cells.** The square [−13/2, 13/2] × [0, 13/2] is cut into 0.5-cells, with quadtree refinement down to depth 18.
Each cell is closed in one of two ways:
- (a) N × N Gauss–Legendre, N ≤ 32, with **|I − Q| ≤ (16/3)ρ^{2−2N}/(ρ² − 1)·2h_x h_y(M_x + M_y)** (P).
  - The 1-D bound: Chebyshev coefficients |a_k| ≤ 2Mρ^{−k} on the Bernstein ellipse, and
    |∫T_k − Q(T_k)| ≤ 2 + 2/(k² − 1) for even k ≥ 2N. The tensor form splits as (I_x − Q_x)I_y + Q_x(I_y − Q_y).
  - M_x and M_y bound |f| on (ellipse × real cell) and (real cell × ellipse), after P ≠ 0 is checked on covering
    complex boxes. Then √P has a branch there, positive on the real cell (P).
- (b) [0, area·sup f], below 10⁻¹² per unit area or at the depth limit.

The outside |z| > 13/2 is bounded with Arb (incomplete gamma) by 10⁻¹³.

**Arithmetic (C).**
- Binary64 intervals, one-ulp outward step after each correctly rounded operation; `-ffp-contract=off`.
- exp by range reduction with an Arb enclosure of ln 2 and a degree-24 Taylor polynomial with remainder.
- Gauss–Legendre nodes and weights and 1/π from Arb (`gen_consts.py` → `glconsts.h`).

**Checks (N).**
- The closed form at s = 0 lies inside the enclosure.
- mpmath tanh–sinh at 25 digits (split at the zero of A₊) lands mid-enclosure at s = 0, 0.24, 0.5, 1.5
  (`crosscheck.py`, `out/crosscheck.log`).
- Nodes with ν < 0 (where L + νe₃₂ vanishes on a circle) use tolerance 10⁻⁷ and depth 7: rigorous, width ≤ 2.6·10⁻⁵,
  slack ≥ 5·10⁻³.

**What the node caps need (P), checked (N).**
- Joint convexity in (s, ν): Ψ₅ is the expectation of |affine|. The cap tables' smallest second divided difference
  is +0.0028 in s; −0.002 in ν, only at the loose ν < 0 nodes.
- |∂_sΨ₅| ≤ 2√(1 + b_A² + b_B²) and |∂_νΨ₅| ≤ 2.

**Grids.**
- s: step 0.002 on [0, 1.2], 0.005 to 2, 0.02 to 3, 0.1 to 6. The peak run used step 0.002 up to 0.8.
- ν: step 0.003 on [0.009, 0.063], with coarse nodes out to ±0.29 ≥ η.

---------------------------------------------------------------------------------------------------------------------

## 3. Exact law layer (`cert/law.py`, `cover.py`; replay `replay.py`, `replay_caps.py`)

Boxes tile (σ, x = √(m − 2), ν) ∈ [0, σ_max] × [0, 6481/1000] × [−0.29, 0.29]; their ν-sides are cap cells.

1. **Majorants (C, exact rationals).** One per box end: p(s) = a₀ + a₁s + a₂s² + a₄s⁴ + a₆s⁶ with a₁, a₆ ≥ 0, and
   p ≥ Ψ₅(·; ν_j) on [0, ∞).
   - On each cap segment: min(p − c) at the two ends ≥ (Δ²/8)·max(p″ at the ends)⁺. Since p″ is convex in s², its
     maximum is at an end; Ψ₅ lies below the chord of the caps.
   - Beyond the last node, p(s_N + y) − c_N − Lip·y has nonnegative coefficients.
   - The coefficients come from a float LP and are rounded up.
2. **Moment bound J (P; Lean `MPoly.J`).** E p(σ√U) ≤ J(σ, x).
3. **Convexity in ν (P).** Linear interpolation between the two majorants, with the cost −ν²/η − κσ² kept exactly.
4. **Box bound (C).** The maximum is at an x-endpoint (Lean `MPoly.J_endpoint`). At each endpoint, an exact branch
   and bound on tensor Bernstein coefficients in (σ, λ), to 10⁻⁹.
5. **Outside (P).**
   - σ ≥ σ_max ≥ Lip·ρ/κ is dominated by σ = 0.
   - |ν| ≥ 0.29 ≥ η is dominated by the boundary values.
6. **Search.** Boxes above the target are split, wide x first. Splitting stops when it no longer pays, and the box
   keeps its own valid bound.

**Replays (C).**
- Peak: tiling, 1920 majorants and 960 Bernstein bounds, 40 s on 8 processes.
- Row 0.82: 2118 boxes, PASS, 198 s on 2 processes; 300 random caps recomputed, PASS.
- All 16 rows of the envelope other than the peak (0.74–0.886): tiling, every majorant and every box bound, plus a 300-node random cap recomputation per row. **48/48 PASS**, about 16 minutes (`cert/replay_all.sh`, `out/replay_all.log`).
- The cap recomputation reruns the same `psi5` code: it guards against corrupted data, not against an error in the code.
  The independent checks of the code are the mpmath and closed-form comparisons of §2.

---------------------------------------------------------------------------------------------------------------------

## 4. Rows and the envelope

**Where the rows come from.**
- `out/rows_fixed.json` (14 rows, the gate worker's two-branch rows), rounded to 6 decimals.
- t = 0.80 optimised here (`optrows_local.py`; 0.83 is the same row as the gate's).
- t = 0.72, 0.76, 0.79 and 0.81 are midpoints of neighbouring rows (Gaussian values by `gaussrow.py`).
- Pipeline: `run_rows.py` (caps → cover), `combine.py`, `summarize.py`.

| t | ℓ | C (certified, given K₅) | gap over Gaussian | C − ℓ² | covers (row ≤ 0.712497) | boxes |
|---|---|---|---|---|---|---|
| 0.700 | 0.679904 | 1.1768621094 | ≥ 5·10⁻³ (loose) | 0.7145927 | none | 1247 |
| 0.720 | 0.703404 | 1.2101471900 | ≥ 5·10⁻³ (loose) | 0.7153700 | none | 2116 |
| 0.740 | 0.726903 | 1.2402952256 | 7.46·10⁻⁴ | 0.7119073 | [0.7026, 0.7512] | 2293 |
| 0.760 | 0.750225 | 1.2746602911 | 1.29·10⁻⁴ | 0.7118227 | [0.7243, 0.7762] | 2138 |
| 0.780 | 0.773547 | 1.3105214995 | 7.91·10⁻⁵ | 0.7121465 | [0.7548, 0.7923] | 2112 |
| 0.790 | 0.784961 | 1.3284344856 | 7.22·10⁻⁵ | 0.7122707 | [0.7699, 0.8000] | 2112 |
| 0.800 | 0.796375 | 1.3465697001 | 6.01·10⁻⁵ | 0.7123566 | [0.7845, 0.8082] | 2129 |
| 0.810 | 0.807505 | 1.3644770132 | 4.92·10⁻⁵ | 0.7124127 | [0.7983, 0.8167] | 2137 |
| 0.820 | 0.818635 | 1.3826052247 | 3.64·10⁻⁵ | 0.7124420 | [0.8112, 0.8261] | 2118 |
| 0.830 | 0.829470 | 1.4004718931 | 2.69·10⁻⁵ | 0.7124514 | [0.8227, 0.8362] | 2112 |
| 0.840 | 0.840070 | 1.4181640966 | 1.77·10⁻⁵ | 0.7124465 | [0.8330, 0.8472] | 960 |
| 0.850 | 0.850394 | 1.4356039117 | 9.93·10⁻⁶ | 0.7124340 | [0.8425, 0.8583] | 2112 |
| 0.855 | 0.855445 | 1.4442132340 | 7.55·10⁻⁶ | 0.7124271 | [0.8471, 0.8638] | 2112 |
| 0.860 | 0.860232 | 1.4524216741 | 5.39·10⁻⁶ | 0.7124226 | [0.8516, 0.8689] | 2112 |
| 0.865 | 0.865019 | 1.4606784441 | 5.61·10⁻⁶ | 0.7124206 | [0.8563, 0.8738] | 2112 |
| 0.870 | 0.870130 | 1.4695467660 | 4.52·10⁻⁶ | 0.7124205 | [0.8614, 0.8789] | 2112 |
| 0.875 | 0.874401 | 1.4769988338 | 3.44·10⁻⁶ | 0.7124217 | [0.8657, 0.8831] | 2112 |
| 0.880 | 0.878777 | 1.4846734634 | 4.46·10⁻⁶ | 0.7124244 | [0.8703, 0.8873] | 2112 |
| 0.886 | 0.885644 | 1.4967953485 | 4.41·10⁻⁶ | 0.7124301 | [0.8775, 0.8938] | 2112 |

**Exact envelope** (`envelope.py`: maximum at breakpoints or ends; 886227/10⁶ > √π/2 is a safe right end, since each
piece is convex). On [703/1000, 886227/10⁶]: **B = 0.7124786076** at t = 0.703.

| piece | active row ℓ | max |
|---|---|---|
| [0.7030, 0.7368] | 0.726903 | 0.7124786 |
| [0.7368, 0.8144] | 0.750–0.808 | ≤ 0.7124600 |
| [0.8144, 0.8446] | 0.8186–0.8401 | **0.7124771** (the binding band) |
| [0.8446, 0.8862] | 0.850–0.886 | ≤ 0.7124672 |

On the binding band [0.82, 0.886], the room to 500/701 left after certification is 7.90·10⁻⁴. GATE.md asks for at
most 2.3·10⁻⁴ there.

---------------------------------------------------------------------------------------------------------------------

## 5. The small-t obstruction

**Statement (P).** With moments only, every row's law-layer bound at t = 0 is ≥ (E|D|·E√U)²/κ ≥ ε₁(E√U)² for every
admissible law. Proof:
- |L + sD| + |L − sD| ≥ 2|sD| gives Ψ₅(s; ν) ≥ 2sE|D|;
- E|D| ≥ 1 and κ ≤ 1/ε₁;
- optimise over σ.

The moment-only supremum of E√U is at least 0.9717, at m = 3 (N). So the bound is ≥ 0.80 > 500/701.

**Why a radius bound is needed.** With g = −f and f = q/|q|, Re⟨f, T₅g⟩ = ε₁‖Qf‖² − ‖Pf‖² − η‖Rf‖² ≥ ε₁(E|q|/‖q‖)² − (P and R
parts). The P and R parts vanish as |q| becomes constant. So certifying T₅ near t = 0 is essentially a radius
bound: **E|q| ≤ 0.916‖q‖** for every remote cubic, since ε₁·0.916² = 0.7125.

**Float scan of moment-only rows (N, crude rows, `rowscan.py`).**

| t | 0 | 0.2 | 0.4 | 0.5 | 0.6 | 0.65 | 0.70 |
|---|---|---|---|---|---|---|---|
| best value | 0.830 | 0.786 | 0.749 | 0.739 | 0.720 | 0.715 | 0.712 |

**Stein cuts (N, `steinlp.py`, `steinlp2.py`).** The Lean spectral cut family, re-derived here (P):
- for piecewise-linear φ and any c_f, c_g, β, λ, μ > 0 and a budget λE X² + μE r² ≤ aP + bQ,
  **E[f²/λ + g²/μ + Φ − φ − κ′(U² − 2)] ≥ 0**,
  with f = −(φ+β)/2 + c_f U, g = −(φ − Φ/U)/2 + c_g U and κ′ = α/2 + min(0, β′ − α/2)/3 (α = 2c_f − a, β′ = 2c_g − b);
- it follows from f²/λ ≥ 2fX − λX², the integration by parts E[Φ − φ] = E[Xφ + r(φ − Φ/U)], 2P + Q = m − 2 and
  0 ≤ Q ≤ (m − 2)/3;
- the budgets are the basic (2λ/3, 2μ/3) and the coupled Gram family E X² ≤ a_s P − b_s Q (Lean `coupled_of_gram`).

Cut generation by bounded convex QP separation (knots 0–36) gives sup E√U:

| m | 2.0 | 2.3 | 2.6 | 3.0 | 4.0 | 6.0 |
|---|---|---|---|---|---|---|
| moments only | 0.924 | 0.957 | 0.967 | 0.972 | 0.974 | 0.971 |
| + Stein (v1, spectral only, 150 rounds) | 0.892 | 0.918 | 0.932 | — | — | — |
| + Stein + coupled Gram (v2) | 0.904 (25 rounds) | **0.912** | **0.919** (cuts exhausted) | **0.924** (150 rounds) | **0.935** (cuts exhausted) | **0.955** (cuts exhausted) |

So the present Lean law inputs do not imply 0.916 for m ≳ 2.5 (N). "Cuts exhausted" means that no violated cut
exists within the knot set (0–36) and the coefficient box used; richer families are not excluded. Full numbers are in `out/stein2_*.log`.

---------------------------------------------------------------------------------------------------------------------

## 6. Stage 2 plan

1. **Small t is the first decision.** One of:
   - (a) a radius-type theorem: E|q| ≤ 0.916‖q‖ dimension-free, or a law input implying it;
   - (b) a richer cut family (general Gram certificates `gramCert`, joint sixth-moment budgets, more knots);
   - (c) for t ∈ (0, 0.70), rows optimised for the moment- or Stein-value rather than the Gaussian ideal.

   Without (a) or (b), T₅ cannot be certified near t = 0, whatever K₅ gives. Together with GATE.md's sharing lemma
   for t ≲ 0.76, this is the critical path.
2. **t ≥ 0.703 is done** up to K₅.
   - Optional polish: re-optimise rows for the moment-LP value at t ≤ 0.76 (gain about 10⁻⁴ there; not binding).
   - Optional polish: tighten the peak boxes (≤ 1.5·10⁻⁶).
3. **Assembly.**
   - One checker: caps (`psi5` on all nodes), boxes (`replay.py`), envelope (`envelope.py`), with per-row η₅(r).
   - Compute cost of the checker: about 8 CPU-hours.
4. **Lean (later).** About 3.5·10⁵ Ψ₅ caps (19 rows × 18.7·10³) is far beyond the cubic cap kernel. A smaller cap
   representation is needed, for example caps only at nodes where a majorant is tight, with Lipschitz/chord bounds
   elsewhere.

---------------------------------------------------------------------------------------------------------------------

## 7. Files

- `cert/psi5.cpp`, `cert/glconsts.h`, `cert/gen_consts.py`: interval evaluator of Ψ₅ and its Arb constants.
- `cert/caps.py`: node caps per row, with the tail bound.
- `cert/law.py`, `cert/cover.py`: exact law layer.
- `cert/replay.py`, `cert/replay_caps.py`, `cert/replay_all.sh`: replays.
- `cert/run_rows.py`, `cert/combine.py`, `cert/summarize.py`, `cert/envelope.py`: rows and the exact envelope.
- `cert/crosscheck.py`, `cert/mcheck.py`, `cert/lawexp.py`, `cert/lawfloat.py`, `cert/rowscan.py`, `cert/steinlp.py`,
  `cert/steinlp2.py`, `cert/steinrun.py`, `cert/gaussrow.py`, `cert/optrows_local.py`: float tools (N).
- `cert/out/`:
  - caps and covers (`caps_<t>.json`, `cover_<t>.json`, `caps_peak.json`, `cover_peak.json`);
  - row records (`rows_cert_all.json`, `envelope_stage1.json`);
  - logs (`run_rows*.log`, `replay_all.log`, `stein*.log`, `crosscheck.log`, `mcheck.log`, `lawfloat_0.740.log`,
    `rowscan.*`);
  - new rows (`rows_new.json`, `rows_interp*.json`, `optrows_*.json`).
