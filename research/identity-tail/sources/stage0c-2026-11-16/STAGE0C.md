<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/STAGE0C.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Caps stage 0c (16 November 2026): the lemma gate, go/no-go numbers for 1.4018 and 1.402, and the Lean plan

Worker of claude-b9ee, 16 Nov 02:00–04:45 Bucharest.
- Folder: `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/`.
- Nothing in the repository changed: no tracked file edited, no Lean built, nothing pushed or posted.
- Labels: **P** proved (written proof, checked), **C** exact computation (rational arithmetic), **N** floating point.
- Witness P₁,₀ − εP₂,₁ + ν(Id − P₁,₀ − P₂,₁) with ε = 191/250, ν = 47/2000 (ε̂ = 25/31, ν̂ = 47/1953).
- Row values are in original units: N = (1 − ν)·cap_hat + ν.
- Targets: 5000/7009 = 0.713368526 (K > 1.4018) and 500/701 = 0.713266762 (K > 1.402).

## 1. Verdict

### The gate: passed (P)

The rank-one correction lemma (Theorem 1 of `caps-stage0b-lemma-2026-11-15/PROOF.tex`) is **proved**. I checked it line by line
and re-verified it independently, both exactly and numerically, and found no gap; see §2 and `LEMMA_REVIEW.md`.

### 1.4018: GO (P + N)

- **The number.** The certifiable cap of the identity-tail witness at (191/250, 47/2000) is modelled as follows (§3):
  - the SOCP law relaxation of stage 0;
  - plus a model of the certified cap table, built with the proved coefficient;
  - plus master's calibration;
  - which gives **B_ν ≈ 0.713198–0.713207, K ≈ 1.40212–1.40214**.
- **The margin.** To 5000/7009 = 0.7133685 it is **1.6–1.7·10⁻⁴**, several times the identified uncertainties. Each is at most
  about 10⁻⁵, and pessimistic combinations stay below 5·10⁻⁵.
- **Conditions.**
  - **Route M (localised node caps) must be ported to ν > 0 in one and two directions.** Both are now prototyped exactly at the
    binding row: the two-direction centre boxes close at 4.8–7.7·10⁻⁶ (§3.6).
  - For 1.4018 the three-direction range (u ≈ 0.625–0.725) and the block-0 region may use price-variance anchored caps. Even with
    those the margin stays 1.3–1.4·10⁻⁴ (§3.6, hyb). This assumes caps of at most about 5·10⁻³ above Ψ for u ≥ 0.75, which
    today's ν = 0 certificate does better than.
  - The far nodes (u up to 6) must be certified as today.
- **Cost.** A 1.4018-only pipeline localises only the one- and two-direction nodes, with mid-range nodes at h = 0.01. It needs
  about 10,000 pieces and a stage-2 Lean build of **about 90–110 CPU-h**, today's size (100–120). The margin left is about
  1.2·10⁻⁴ (§6).

### 1.402: possible, thin (N)

- **The margin.** To 500/701 = 0.7132668 it is **6.0–6.9·10⁻⁵**, about 3 times the identified uncertainty.
- **What it needs.** The full-quality pipeline: 11 plateau rows, mid-range nodes at 0.005 or finer, and route M also in three
  directions and in the block-0 region (with price-variance caps there the margin drops to 3.6·10⁻⁵).
- **Cost.** About 0.6–1.6 thousand Python CPU-h and an estimated **700–750 CPU-h** Lean caps build, against 100–120 today.
  That is a cost decision rather than a feasibility question.
- **Ledger 3.6 would not widen this margin:** the sharp first moment on H₂,₁ gains 0 in the law layer (§3.3).

### What the new numbers changed

- **The gate.** The lemma is proved: the stage-0 gate is passed.
- **Cap tightness and route M.** Caps with γ* are uniformly as tight as today's on the nine rows t = 0.83–0.88 (§3.1). Route M
  cannot be avoided: price variance costs 5·10⁻⁴ to 5·10⁻³ at u ≥ 0.4 (§3.4). Two-direction route M works for ν > 0 (§3.6).
- **The t-range.** The plateau reaches t = 0.885, so 11 binding rows instead of 8; the maximum stays at t ≈ 0.844 (§5).
- **(ε, ν).** The choice is confirmed against the corners (§4).
- **Cost.** The stage-2 cost for 1.402 is about twice the stage-0 estimate (§6).

## 2. The gate: the correction lemma is proved (P)

Full report: `../caps-stage0b-lemma-2026-11-15/LEMMA_REVIEW.md`.

- **Statement.** Theorem 1 of `PROOF.tex` holds for all ν ≥ 0, d₂, d₃ > ν, |L| ≤ R and p ∈ ℂ. It has the sharp coefficient
  γ*(R) = 8σ(e₂e₃)²/(Δ(Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)²)).
- **Checking.** I checked the proof line by line and re-derived every identity by hand. An independent sympy script verifies them
  exactly modulo the unit-circle ideal (`review/indep_identities*.py`, all OK).
- **Machine checks.** Every float or exact check runs clean. Floating-point negatives, where they occur, come from ill
  conditioning or from rounding of the input ν̂, and are resolved in exact or 60-digit arithmetic.
- **What the gate leaves.** Only the per-cell rational check (no division) and the generator rules:
  - γ and the centre (c₀, c₁) exact from the exact ν̂, γ rounded down;
  - cells with γ = 0 checked for d₂ > 0 and Δ > 0;
  - weights rounded so that the 2×2 form dominates the exact one.
- **A defect in the stage-0 code.** The outward stage-0 code (`capnu_cert.py`, `midnu.py`) feeds a float centre to the exact
  integration. The effect is about 10⁻¹⁷, but it is a soundness defect to fix in the generator (LEMMA_REVIEW §5).
- **Use in the pipeline.** With γ* in every cell the anchored caps are slightly tighter than the stage-0 setting (0 to 5.6·10⁻⁷ in
  cap − Ψ at the binding row; block 2 becomes definite at u = 0.4).

## 3. Cap tightness and the certifiable cap

### 3.1 Anchored caps with the proved coefficient, nine rows t = 0.83–0.88 (N)

Setup: `capgap_star.py` (`results/cgs_*.json`), the stage-0 rows, γ* in every cell with e₂, e₃ > 0, 1600 × 128 cells per
quarter, nodes u = 0, 0.025, …, 0.8 (0.05 steps for t = 0.83, 0.87, 0.88). The columns sort the nodes by which blocks of
D = Q − H are indefinite at the anchor.

| t | all PD (anchored) | 1 odd dir | 2 odd dirs | 3 dirs (block 1 too) | block 0 indefinite | anchored cap − Ψ | route-M centre-piece estimate |
|---|---|---|---|---|---|---|---|
| 0.83 | u ≤ 0.20 | 0.25–0.35 | 0.40–0.60 | 0.65–0.75 | ≥ 0.80 | 3.23–3.58·10⁻⁶ | 3.4·10⁻⁶ … 1.48·10⁻⁵ |
| 0.835 | u ≤ 0.225 | 0.25–0.40 | 0.425–0.60 | 0.625–0.725 | ≥ 0.75 | 3.26–3.62·10⁻⁶ | 3.3·10⁻⁶ … 1.40·10⁻⁵ |
| 0.84 | u ≤ 0.25 | 0.275–0.40 | 0.425–0.50 | 0.525–0.70 | ≥ 0.725 | 3.30–3.66·10⁻⁶ | 3.5·10⁻⁶ … 1.37·10⁻⁵ |
| 0.845 | u ≤ 0.25 | 0.275–0.40 | 0.425–0.60 | 0.625–0.725 | ≥ 0.75 | 3.34–3.71·10⁻⁶ | 3.5·10⁻⁶ … 1.39·10⁻⁵ |
| 0.85 | u ≤ 0.25 | 0.275–0.40 | 0.425–0.60 | 0.625–0.725 | ≥ 0.75 | 3.37–3.74·10⁻⁶ | 3.4·10⁻⁶ … 1.39·10⁻⁵ |
| 0.855 | u ≤ 0.25 | 0.275–0.40 | 0.425–0.60 | 0.625–0.725 | ≥ 0.75 | 3.40–3.78·10⁻⁶ | 3.5·10⁻⁶ … 1.38·10⁻⁵ |
| 0.86 | u ≤ 0.25 | 0.275–0.40 | 0.425–0.60 | 0.625–0.725 | ≥ 0.75 | 3.44–3.81·10⁻⁶ | 3.5·10⁻⁶ … 1.36·10⁻⁵ |
| 0.87 | u ≤ 0.25 | 0.30–0.40 | 0.45–0.60 | 0.65–0.70 | ≥ 0.75 | 3.50–3.88·10⁻⁶ | 3.7·10⁻⁶ … 1.24·10⁻⁵ |
| 0.88 | u ≤ 0.25 | 0.30–0.40 | 0.45–0.55 | 0.60–0.70 | ≥ 0.75 | 3.57–3.95·10⁻⁶ | 3.8·10⁻⁶ … 1.21·10⁻⁵ |

- **The rows agree.** All nine rows show the same pattern, so the route-M work is the same on every plateau row.
- **Where the centre estimate holds.** The centre-piece estimate (λ = |eig| + 10⁻³ per failing direction, ρ₀ = 0.003) grows
  from 3.5·10⁻⁶ at u = 0.275 to 1.4·10⁻⁵ at u = 0.725. That it bounds the whole node is verified only for one direction (stage 0,
  u = 0.35).
- **What is new for ν > 0.** Two- and three-direction boxes (u ≥ 0.425) and the block-0 region (u ≥ 0.75) have no ν > 0
  prototype yet. Today's ν = 0 certificate handles the analogous regions of rows 12–15.

### 3.2 Law-relaxed row values with a model of the certified table (N)

Setup: `lawsocp_table.py`, the SOCP relaxation of stage 0 unchanged. The table is the chord interpolant on u_i = 0.0025·i of
node caps Ψ(u_i) + gap(u_i), with the gap from 3.1 (anchored, or the route-M centre estimate). Past the last node with an estimate
(u_f ≈ 0.725) there are three choices:
- **flat:** the gap at u_f is carried on;
- **lip:** c(u_f) + smax·(u − u_f), i.e. nothing certified beyond u_f;
- **today:** today's certified gap of Lean row 13 at the same u.

| t | Gaussian (Ψ) | relaxed (Ψ) | relaxed (flat table) | table effect | relaxed (lip) |
|---|---|---|---|---|---|
| 0.83 | 0.7130204 | 0.7131188 | 0.7131238 | +5.0·10⁻⁶ | — |
| 0.835 | 0.7130864 | 0.7131723 | 0.7131772 | +4.9·10⁻⁶ | 0.72569 |
| 0.84 | 0.7131272 | 0.7131955 | 0.7132003 | +4.8·10⁻⁶ | 0.72970 |
| **0.845** | 0.7131427 | **0.7131979** | **0.7132025** | +4.6·10⁻⁶ | 0.72580 |
| 0.85 | 0.7131378 | 0.7131896 | 0.7131941 | +4.5·10⁻⁶ | 0.72560 |
| 0.855 | 0.7131324 | 0.7131820 | 0.7131865 | +4.5·10⁻⁶ | 0.72534 |
| 0.86 | 0.7131287 | 0.7131759 | 0.7131805 | +4.6·10⁻⁶ | 0.72523 |
| 0.87 | 0.7131254 | 0.7131689 | 0.7131735 | +4.6·10⁻⁶ | — |
| 0.88 | 0.7131262 | 0.7131670 | 0.7131717 | +4.7·10⁻⁶ | — |

- **flat:** the maximum is 0.7132025 at t = 0.845 (K ≥ 1.402126).
- **today** at t = 0.845: 0.7132066, a table effect of +8.7·10⁻⁶.
- **lip:** a loss of 1.2–1.6·10⁻². **The large-u nodes (u ≥ 0.75, block 0 indefinite) must be certified**, as today's
  certificate does up to s = 6. Leaving them to the Lipschitz extension is not an option for either target.
- **Calibration on today's witness** (`lawsocp_leancal.py 13`, same SOCP).
  - Lean row 13 gives 0.7134257 with its certified table and 0.7134143 with the true potential: **today's table costs
    +1.15·10⁻⁵ under the worst law** (+5.3·10⁻⁶ under the Gaussian).
  - That is 2.5 times the flat model. The extra comes from a few loose places in today's table (cap − Ψ: 1.5·10⁻⁵ at u = 0,
    2.4·10⁻³ at u = 0.8, 1.7·10⁻⁴ at u = 1, 2.6·10⁻⁴ at u = 6), which the worst law weights.
  - Master certifies 0.7134209, i.e. 4.8·10⁻⁶ **below** the model with its table: mixtures and the coupled / joint-sixth
    budgets that the SOCP lacks.

### 3.3 Would the sharp first moment on H₂,₁ (ledger 3.6) help? No, at the plateau (N; coordinator's question)

The relaxation's first-moment input is E√U ≤ ρ, with U = |q|²/E|q|² and today ρ = 0.973612157. Ledger 3.6,
E|q| ≤ (√π/2)‖q‖₂ on H₂,₁, would make it E√U ≤ √π/2 = 0.886226925 (plus a 10⁻⁶ grid tolerance). I ran the same SOCP with both
values on the binding plateau rows, with the true potential and with the flat table model (`lawsocp_rho.py`,
`results/rho_results.jsonl`).

| t | relaxed, today's ρ | relaxed, √π/2 | gain | law loss | E√U of the worst law |
|---|---|---|---|---|---|
| 0.84 | 0.7131955 (table 0.7132003) | same | −1·10⁻¹⁰ | 6.83·10⁻⁵ | 0.8848 |
| 0.845 | 0.7131979 (table 0.7132025) | same | −4·10⁻¹¹ | 5.52·10⁻⁵ | 0.8752 |
| 0.85 | 0.7131896 | same | −7·10⁻¹⁰ | 5.18·10⁻⁵ | 0.8680 |
| 0.855 | 0.7131820 | same | +3·10⁻¹² | 4.96·10⁻⁵ | 0.8674 |

- **The gain is zero to 10⁻⁹**, with or without the cap table.
- **Why:** the worst laws sit at x ≈ 0.45 (E U² ≈ 2.2), more spread than the Gaussian. Their E√U = 0.867–0.885 is already below
  √π/2, so neither today's ρ nor the sharp value is active.
- **The law loss of 5–7·10⁻⁵ comes from elsewhere:** the higher moments and the integration-by-parts / spectral constraints at
  x ≈ 0.45.
- **For the thin 1.402 margin, proving 3.6 buys nothing in the law layer.** The only other place ρ enters is the crude row
  ‖P₂,₁k‖ ≤ ρ of the cover, which this model does not contain and which I did not assess.

### 3.4 Can route M be avoided? No (N)

The idea was to certify the non-concave mid range with one global anchored majorant whose prices carry odd-sector variance (the
generator recipe of cert-0745c), with no localisation. `capvar_star.py`, row t = 0.845, 1600 × 64 cells, coordinate search over
the variance amplitudes along the failing directions of blocks 2 and 3 and a price scale:

| u | route-M centre estimate | best variance-priced anchored cap − Ψ |
|---|---|---|
| 0.30 | 3.7·10⁻⁶ | 3.1·10⁻⁵ |
| 0.40 | 4.9·10⁻⁶ | 5.1·10⁻⁴ |
| 0.50 | 7.3·10⁻⁶ | 4.9·10⁻³ |
| 0.60 | 9.7·10⁻⁶ | 2.7·10⁻³ |
| 0.70 | 1.3·10⁻⁵ | 4.8·10⁻³ (block 1 too: price scale 1.024) |

I put these gaps into the table model ('var': anchored caps for u ≤ 0.25, the variance caps above, the u = 0.7 gap carried on)
and solved the SOCP. **The row value becomes 0.7140043 (+8.1·10⁻⁴), above both targets.**
**Route M (localisation) has to be ported to ν > 0 for either target.** One direction is prototyped (stage 0, u = 0.35) and two
directions now as well (§3.6). Three directions and the block-0 region are the main open engineering item.

### 3.5 The estimate of the certifiable cap and the margins (N)

**The binding row is t = 0.845 in every scenario.**

| scenario | max over rows | − master's mixture / budget gain (4.8·10⁻⁶) | K | margin to 5000/7009 | margin to 500/701 |
|---|---|---|---|---|---|
| true potential (no table) | 0.7131979 | — | 1.402135 | 1.71·10⁻⁴ | 6.89·10⁻⁵ |
| flat table (proved γ*, route-M centre estimates) | 0.7132025 | 0.7131977 | 1.402126 / 1.402135 | 1.66 / 1.71·10⁻⁴ | 6.43 / 6.91·10⁻⁵ |
| today-like far range | 0.7132066 | 0.7132018 | 1.402118 / 1.402127 | 1.62 / 1.67·10⁻⁴ | 6.01 / 6.49·10⁻⁵ |
| route M only up to two directions, price-variance caps beyond u = 0.6 (hyb, §3.6) | 0.7132355 | 0.7132307 | 1.402061 / 1.402071 | 1.33 / 1.38·10⁻⁴ | 3.13 / 3.61·10⁻⁵ |

The **estimate with the full route M is B_ν ∈ [0.713198, 0.713207]**. It agrees with the stage-0 range
[0.7131983, 0.7132058]. The cheap 1.4018 pipeline (hyb) gives about 0.71323.

Uncertainty, assessed rather than computed:

| source | effect on B |
|---|---|
| calibration transfer | ±1·10⁻⁵ |
| route-M pieces closing above the centre estimate at the 2- and 3-direction nodes (if 2–3 times the centre) | +0 to +1·10⁻⁵ |
| completeness of the fibre maximisation for ν > 0 | ±1·10⁻⁵ (stage 0) |
| unsampled t between rows | ≈ +1·10⁻⁶ with mixtures |
| robust row re-optimisation and master's extra budgets | only lower B |

### 3.6 Route M in two odd directions for ν > 0: first exact nodes (C, modulo two float data items)

`midnu2.py` is new. It takes the two-direction layout of cert-0745d `midcaps2.py` and the ν > 0 outward integrator of stage 0
(`midnu.SetupNu`), with γ* in every cell. Row t = 0.845, nodes in the two-direction range.
- **Pieces:** 36 boxes in (τ₂, τ₃) = (v₂·m, v₃·m), plus 6 far slabs or halfspaces. The symmetries cover the other quadrants.
- **Anchors:** box anchors are constrained maximisers (BFGS in blocks 0, 1 and the complements of v₂, v₃).
- **Arithmetic:** outward MR integration with the rigorous moment tables; 1024 angular cells for the 9 central boxes, 256
  elsewhere; exact Loewner bound; exact S-lemma LDL.
- **The two float data items:** the per-cell γ is float γ* × (1 − 10⁻⁹), and the centre c₀, c₁ is float (§2).

| u | centre box (exact) | stage-0 centre estimate | inner boxes (1024 cells, i, j ≤ 2, done so far) | outer boxes at 256 cells | the same boxes re-run at 1024 cells |
|---|---|---|---|---|---|
| 0.45 | **+4.76·10⁻⁶** | 6.0·10⁻⁶ | +2.4·10⁻⁶ or lower | up to +9.2·10⁻⁵, box (2,4) | — |
| 0.525 | **+6.27·10⁻⁶** | 7.9·10⁻⁶ | +2.2·10⁻⁶ or lower | up to **+2.4·10⁻⁴**, box (0,5) | (0,3) −1.6·10⁻⁵, (0,4) −7.4·10⁻⁵, (0,5) −3.1·10⁻⁴ |
| 0.60 | **+7.69·10⁻⁶** | 9.7·10⁻⁶ | +5.4·10⁻⁶ or lower | up to +1.0·10⁻⁴ | (0,3) −1.2·10⁻⁵, (1,3) −1.7·10⁻⁵ |

- **The two-direction localisation works for ν > 0.**
  - The centre boxes close exactly at 4.8–7.7·10⁻⁶, below the stage-0 estimates used in the table model of §3.2. So that model
    is slightly pessimistic.
  - The boxes next to the centre close lower still.
- **Some outer boxes are loose at 256 angular cells,** by up to 2.4·10⁻⁴. Every one of the five re-run at 1024 cells drops
  well below the centre box, with no splitting. A generator should use 1024 cells, or retry at 1024 when a box exceeds the
  centre; the same resolution effect was seen at ν = 0 (stage 0: 7.07 against 3.78·10⁻⁶ at u = 0.35).
- **Far pieces in direction 2** (slab [T, 2T], slab [2T, 4T] and the halfspace beyond 4T, T = 0.096; any τ₃):

  | anchor | piece | u = 0.45 | u = 0.525 | u = 0.6 |
  |---|---|---|---|---|
  | symmetric | slab [T, 2T] | −6.8·10⁻⁴ | +1.25·10⁻³ | +2.0·10⁻³ |
  | symmetric | slab [2T, 4T] | −6.5·10⁻³ | −4.7·10⁻³ | −2.9·10⁻³ |
  | symmetric | halfspace | −4.4·10⁻² | −4.1·10⁻² | −3.8·10⁻² |
  | constrained maximiser | slab [T, 2T] | — | **−8.6·10⁻⁴** | **+3.6·10⁻³** |

  - **Still open: the first slab at u = 0.6.** It needs the box treatment in τ₃ (extend the grid beyond T) or bisection, as
    today's certificate did for some far slabs of row 15. Not done.
  - **Direction 3** far pieces were not reached.
- **Run status at the deadline:**
  - 22–23 of the 42 pieces per node were done when the runs were stopped, plus the refinements and far pieces above.
  - All logs are in `results/mn2*_*.log` and `results/mn2r_*.json`.
  - No node has a complete certified cap yet.
  - Bottom line: in two directions, every box close to the centre closes at or below the centre box; the loose pieces are an
    angular-resolution or anchor issue of the kind today's pipeline already handles.
- **What if route M stops at two directions?** I solved the SOCP with route M up to u = 0.6 and price-variance caps beyond
  (rising to 4.8·10⁻³ at u = 0.7, then carried on; `hyb0.6`).
  - The binding row gives **0.7132355**, 3.3·10⁻⁵ above the flat model.
  - After calibration: 0.713231, a margin of **1.4·10⁻⁴ to 5000/7009** but only 3.6·10⁻⁵ to 500/701.
  - So **1.4018 does not need the three-direction port or the block-0 localisation; 1.402 does.**
  - Caveat: the price-variance caps were measured only up to u = 0.7. Beyond u = 0.75 block 0 is indefinite too, and the 4.8·10⁻³
    carried on there is an assumption: today's ν = 0 certificate reaches 2.4·10⁻³ at u = 0.8 and 1.7·10⁻⁴ at u = 1.
  - If the u ≈ 0.6 far slab stays loose, at about 3·10⁻³, the hybrid starts nearer u = 0.55. That costs about 10⁻⁵ more and
    leaves about 1.3·10⁻⁴ for 1.4018.

## 4. (ε, ν) re-checked against the relaxed law (N)

Stage 0 tested the four axis neighbours of (0.764, 0.0235). I added the four corners (ε ± 0.002, ν ∈ {0.018, 0.030}) and one
point on the "valley" direction (0.762, 0.0212), where the ε-tilt and the ν-tilt of the plateau cancel to first order. Rows are
Gaussian-optimal, re-optimised per configuration at t = 0.84, 0.845, 0.85 by `run_rows.py`; the values are N.

| (ε, ν) | Gaussian 0.84 / 0.845 / 0.85 | max | relaxed (where run) |
|---|---|---|---|
| **(0.764, 0.0235)**, chosen | 0.7131274 / 0.7131427 / 0.7131378 | **0.7131427** | 0.7131955 / **0.7131979** / 0.7131896 |
| (0.762, 0.018) | 0.7131394 / 0.7131487 / 0.7131290 | 0.7131487 | 0.7132119 / 0.7131988 / 0.7131670 |
| (0.766, 0.018) | 0.7131800 / 0.7131446 / 0.7130796 | 0.7131800 | 0.7132529 / 0.7131962 / 0.7131198 |
| (0.762, 0.030) | 0.7130910 / 0.7131891 / 0.7132900 | 0.7132900 | 0.7131744 / 0.7132678 / 0.7133653 |
| (0.766, 0.030) | 0.7131302 / 0.7131827 / 0.7132377 | 0.7132377 | 0.7132137 / 0.7132619 / 0.7133130 |
| (0.762, 0.0212), valley | 0.7131190 / 0.7131449 / 0.7131447 | 0.7131449 | 0.7131868 / **0.7131964** / 0.7131883 |

**The choice stands.**
- Every corner is worse. The relaxed maxima are 0.7132119, 0.7132529, 0.7133653 and 0.7133130, against 0.7131979:
  1.4·10⁻⁵ to 1.7·10⁻⁴.
- The valley point (0.762, 0.0212) has relaxed maximum 0.7131964, 1.5·10⁻⁶ below the choice. That is inside the noise of the whole
  estimate. The neighbourhood is flat to about 2·10⁻⁶ along the valley, and no corner helps.
- ν = 0.030 is clearly bad: it lifts the t ≥ 0.85 side by 1–1.5·10⁻⁴.

## 5. The t-range (N)

Relaxed values with the true potential (stage 0 and this run; t ≤ 0.7 Gaussian only):

| t | 0.12–0.70 | 0.74 | 0.78 | 0.80 | 0.82 | 0.83 | 0.835 | 0.84 | 0.845 | 0.85 | 0.855 | 0.86 | 0.87 | 0.88 | 0.8825 | 0.885 | 0.8875 | 0.89 | 0.90 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| N | ≤ .70411 G | .70821 | .71130 | .71233 | .71296 | .71312 | .71317 | .71320 | **.71320** | .71319 | .71318 | .71318 | .71317 | .71317 | .71317 | .71317 | .71026 | .70483 | .68325 |

- **The plateau continues to t = 0.885** (new rows 0.8825 and 0.885: relaxed 0.7131670 and 0.7131673).
- **It ends between 0.885 and 0.8875.** At 0.8875 the optimiser switches to the large-ℓ family (ℓ = 2, τ* = 0) that binds at
  0.89–0.9: relaxed 0.7102575.
- **The maximum stays at t ≈ 0.844 (0.7131983).** Each row bound is a parabola in t with leading coefficient 1 and ℓ ≈ t on the
  plateau, so between two rows Δt apart the single-row cost is about (Δt/2)². That is 6·10⁻⁶ for rows 0.005 apart, before
  mixtures.
- **The certificate needs the plateau rows 0.835–0.885 at 0.005 spacing (11 rows),** plus the rows below 0.835 and the large-ℓ
  rows at t ≥ 0.8875. Today there are 4 binding rows.
- **All new rows are in the positivity regime** (c = ℓ − 2β > 0 and β > 0) that the anchored R bound needs.

## 6. CPU cost (unit costs measured; totals are N-model counts)

### Unit costs

| step | unit cost | source |
|---|---|---|
| row optimisation, one t | 5–10 CPU-min | stage 0, yo; 15–20 min on loaded big |
| SOCP law relaxation, one row | 4–7 CPU-min | stage 0 and this run |
| float cap profile, one row (33 nodes, 1600 × 128) | about 36 CPU-min | this run, loaded big |
| outward anchored node cap, Python (`capnu_cert`, 256 cells per quarter) | 55–120 CPU-s | stage 0 |
| exact route-M piece, Python | 15 CPU-s (cert-0745d average, 8,991 pieces in 37 CPU-h) to 25–45 CPU-s (`midnu` ν > 0 slabs, 256 cells); ×4 at 1024 cells | |
| Lean anchored node range | about 26 CPU-s | 21 CPU-h / 2,940 legacy nodes |
| Lean localised piece | about 20 CPU-s | about 95 CPU-h / 16,719 pieces of rows 12–15 |

### Piece counts

The cap profiles (§3.1) give, per plateau row on u ∈ [0, 0.8]:
- the class of every node: anchored / 1 / 2 / 3 odd directions / block 0;
- today's piece formats per class: 9 / 42 / 167 / 400 pieces per node (`summarize.py`).

### Totals (Python = stage 0, Lean = stage-2 CI)

| scenario | rows with route M | node spacing in the mid range | localised pieces | Python stage 0 | Lean stage 2 |
|---|---|---|---|---|---|
| **1.402 quality** | 11 plateau rows | h = 0.005 | about 130,000 | 550–1,600 CPU-h for pieces, plus about 100 for rows, anchored nodes, law and cover | about 700–750 CPU-h |
| 1.402, leaner | 11 | h = 0.01 | about 65,000 | 300–900 | about 380 |
| **1.4018 only**: localise only 1–2 directions, price-variance caps for 3 directions and block 0 (§3.6, hyb) | 11 plateau rows | h = 0.01 | about 10,000 | about 150–250 (pieces 45–130) | **about 90–110, today's size or less** |
| 1.4018, all directions localised | 6 rows, 0.01 apart, with mixtures | h = 0.02 | about 19,000 | 180–340 | about 125–150 |
| today (reference) | 4 rows | — | 16,719 | — | 100–120 (overview, CAPS_M_STATUS) |

Notes:
- **What the counts leave out.** The block-0 region beyond u = 0.8 (today's localised nodes reach u ≈ 1.1) and the far nodes up
  to u = 6 are not in the counts. Both are needed (§3.2, lip), so add 10–30 %.
- **The stage-0 estimate was low.** It said 300–400 CPU-h for the stage-2 build; this count is higher for 1.402 quality, because
  the tail's non-concave range is wider (u ∈ [0.275, 0.75+] on 11 rows, against s ∈ [0.2, 0.58] on 4 rows today).
- **For 1.4018 the margin pays for the cheaper pipeline.** The costs in B:
  - chord error Ψ″h²/12: ≈ 1·10⁻⁵ at h = 0.01, or 4·10⁻⁵ at h = 0.02, times about 0.4 of the law mass, i.e. ≈ 0.5–2·10⁻⁵;
  - fewer plateau rows: about (0.005)² = 2.5·10⁻⁵ before mixtures, if the rows are 0.01 apart;
  - price-variance caps for three directions and block 0: +3.3·10⁻⁵ (hyb).
  With all three the margin is still about 1·10⁻⁴.
- **Wall time on big's 16 slots:** about 10–25 hours for the 1.4018 pipeline, 2–4 days for 1.402 quality.
- **Agent time:** 3–4 weeks for 1.402 quality, as stage 0 estimated, dominated by the three-direction and block-0 route-M port;
  about 2–3 weeks for the 1.4018 pipeline, whose one- and two-direction route M is now prototyped.
- **This session:** about 35 CPU-h on big (up to 16 slots for about 2.5 h) and under 0.5 CPU-h on the laptop.

## 7. Plan for the Lean side

### 7.0 What is in the caps closure

The registry `data/caps-m/plan/row-certificates/row12-build.json` (`source_sha256`, 9,537 files) defines the closure:
- `GrotheCapsKernel/{Basic, CapPoly, CapCheck}`;
- `Grothe/Lower/{RowData, RowData01–19, RowDataTypes, RowGateData}`;
- `Grothe/LowerAnalytic/{CapChordData, CapChords, CapConstrDefs, CapCoverDefs, CapCoverFast, CapLinAlgDefs, CapNodeDefs, CapNodes,
  CapPieceDefs, CapPieceRange, CapPieceRepairDefs, CapRangeDefs, CapRecipeData, CapRow00–11, CapRow16–18, CapTablesData}`;
- the folders `CapRow12/` to `CapRow15/` and `CapPieces/` (9,371 files);
- the three lake files.

**Outside** the closure, and so changeable without invalidating the caps:
- `CapMajorant` (AF eq. (4), `anchored_pair`), `CapCheckSound`, `CapGrid`, `CapPiece`, `CapRows`, `CapAssembly`;
- `Witness`, `WitnessCap`, `Fibre*`, `FibrePotential`, `FibreSup`, `Reduction`, `RowGaussian`, `Bridge`, `KSide`;
- `Grothe/Lower/{Boxes, Gate, RowReduction, …}` and `Grothe/Research/*`.

ε = 149/200 lives in `Grothe/Lower/RowDataTypes.lean:23`, which is in the closure. `Witness`, `WitnessCap`, `FibreSup` and
`FibrePotential` use it through `unfold ε; norm_num`.

### 7.1 Stage 1: landable PRs, closure untouched, `main_bounds` unchanged

Generalise in place. Every new statement takes the tail parameter and is instantiated at today's witness (ν = 0), so nothing
dangles (memory "no dangling Lean"). Use targeted builds only, on yo/big when they have room, or `cloud.sh lean`.

**1a. `CapMajorant`: Theorem 1 of the lemma as `anchored_pair_nu`** [proof P; about 2 days].
- Lemma 1 is a ring identity.
- Lemma 2 is identity (7.1), or the pieces W1–W7 of `review/indep_identities_split.py`.
- Lemma 3 is (4.1), Cauchy–Schwarz, `abs_norm_sub_norm_le`, and the one-line identity
  (2(2−a) + |η||δ|)² − η²b² = (2−a)²σ²/(e₂e₃) (LEMMA_REVIEW §2).
- `anchored_pair` becomes its ν = 0 case.
- The statement Lean needs is pointwise in the phases: ℓ_w(L+p, L−p) ≤ Φ_d − (γ/16)h² for every unimodular (f, g). So Ψ_ν
  never has to be defined as a supremum for the caps.

**1b. `Witness`** [P]. Make `witnessOf` T = P₁,₀ − εP₂,₁ + ν(Id − P₁,₀ − P₂,₁). `norm_pairVal_witness` keeps its bound
1 − (1+ε)/(n+1), because the tail is positive semidefinite: Re⟨u,Tu⟩ ≥ (1+ε)‖P₁,₀u‖² − ε‖u‖².

**1c. `WitnessCap`** [P]. In hat units,
`VOf_eq`: Re⟨f,Tg⟩ = (1−ν)[t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² + ν̂(1 − 2‖k‖²)], using ‖h‖² + ‖k‖² = 1.
The endpoint is B = (1 − ν)·cap_hat + ν.

**1d. The fibre chain** [plan, about 1 week; the key identity is P: for unimodular f, g, −2ν̂|k|² = −(ν̂/2)|f−g|² = ν̂ Re(f̄g) − ν̂].
- The pointwise tail −2ν̂|k|² = ν̂ Re(f̄g) − ν̂ enters the fibre expression.
- `Jpot` gains the ν̂ term, or is phrased through the pointwise majorant.
- `fibreExpr_le_Jpot` and `Jpot_le_fibreExpr` carry over.
- `pot` stays convex, even and Lipschitz: it is a supremum of functions affine in s, and the tail adds an s-independent term.
- So does `capsHold_rowPot`.
- Everything is parameterised by (ε̂, ν̂) at today's values.

**1e. The kernel extension and its soundness** (branch only, not landable: it edits closure files). Develop and test it on a
branch with targeted builds of a few generated sample rows.
- **Per-cell data:** dyadic d₂, d₃ and exact ν̂. Weights c_L, c_P, τ, rounded so that the 2×2 form dominates:
  c_L′ ≥ c_L, c_P′ ≥ c_P, (c_L′ − c_L)(c_P′ − c_P) ≥ (τ′ − τ)².
- **The correction:** ξ; γ with the division-free cell check of PROOF.tex (cell); exact c₀, c₁ and the weights of l²x, l², l⁴.
  Radial degree stays ≤ 12 and harmonics ≤ 4, so today's tables suffice.
- **Cells with e_i ≤ 0:** γ = 0, with the checks d₂ > 0 and d₂d₃ > ν̂².
- **Soundness:** `CapCheckSound`, `CapGrid` and `CapPiece` follow.

### 7.2 Stage 2: one PR with every invalidating change (one heavy CI build)

**Witness constants.** `RowDataTypes`: ε̂ = 25/31, ν̂ = 47/1953 (and ε, ν where the witness needs them).

**Rows.** All rows `RowData01…NN`, `RowData` and `RowGateData`, by the generalised `tools/gen_lower_data.py` and
`tools/gen_row_gates.py` (both assert ε = 0.745 today). About 25 rows, including the plateau t = 0.835–0.885 at 0.005 spacing (§5).

**Cap data and kernel.**
- `CapRecipeData` and `CapChordData`.
- `CapTablesData`: today hand-written, so it needs a generator.
- `Cap*Defs`: `mMat` with ε̂, and the ν̂ weights.
- The kernel of 1e.

**Cap modules, regenerated** (`tools/gen_cap_*`, `gen_cap_prepared_rows.py`):
- all `CapRowKK`, the localised-row folders (today `CapRow12–15`, tomorrow the plateau rows), `CapPieces` and `CapNodes`;
- recreate `tools/gen_cap_row_anchors.py`, which the AnchorRange headers name but which no longer exists.

**Registry.** Regenerate `row12-build.json` with its generator. `python3 scripts/caps_stamp.py --digest` must print a sha256
before pushing.

**Law nodes and refined cover.** Regenerate `Grothe/Research/{LawNode*, LowerRefinement*, RefinedCover*}` for the new rows.
**Rename them out of `Grothe/Research/` in the same PR** (the rename deferred on 15 Nov): `CapNodes.lean` imports
`Grothe.Research.RefinedCoverResult` and names two of its declarations, so the rename changes the caps digest anyway.

**Axiom lists and docs.**
- `data/axioms/{native,required}.txt` and `scratch/Axioms.lean`.
- `docs/overview.tex` and `docs/LEAN_DETAILS.md`: the witness, the potential Ψ_ν and the new endpoint.
- README untouched (frozen).

**Not changed:** the lake files.

**CI.** The landing check goes to a heavy runner, because the caps digest changes. None has been online since 15 Nov (mega
destroyed), so start one first from the 8 Nov snapshots.

## 8. Not done, and what is only modelled

- **No integer certificate.** The stage-0d pure-integer verifier is not built. Every B number above is N: SOCP relaxation, float
  caps, and the route-M centre estimate.
  - The certified parts of this run: the lemma (P), its identities (C), and the per-cell exact check of γ (C).
  - From stage 0: three outward anchored nodes and one one-direction route-M node.
- **Route M for ν > 0** is now prototyped in one direction (stage 0, u = 0.35) and in two directions (three nodes at t = 0.845;
  centre and inner boxes plus a few re-run outer boxes; the full 42-piece runs did not finish, §3.6).
  - Not prototyped: three-direction boxes (u ∈ [0.625, 0.725]) and the block-0 region (u ≥ 0.75).
  - They matter for 1.402. For 1.4018, price-variance caps there suffice in the model (§3.6).
- **The far nodes (u > 0.8, up to 6)** are modelled by today's certified gap profile. Their ν > 0 certification is not tried.
- **Not modelled:** master's coupled and joint-sixth budgets, mixtures, and the crude row. The first two only lower B; the crude
  row is not assessed.
- **`verify_identities.py`:** its one-shot identity (7.1) had not finished after an hour of sympy. The identity is covered by
  the independent pieces W1–W7, all exact, and by 200 exact random rational points (LEMMA_REVIEW §3).

## 9. Files (all under this folder)

**Scripts**
- `capgap_star.py`: cap profile of a row with the proved γ*.
- `lawsocp_table.py`: law-relaxed row value with a cap-table model, modes psi / flat / lip / today / var / hyb.
- `lawsocp_leancal.py`: table effect on Lean row 13 of today's witness.
- `lawsocp_rho.py`: first-moment comparison (§3.3).
- `capvar_star.py`: price-variance mid-range caps (§3.4).
- `midnu2.py`: two-direction route-M nodes for ν > 0 (§3.6).
- `midnu2_refine.py`: re-runs loose boxes at 1024 cells and splits them 2 × 2.
- `summarize.py`: tables, margins and the cost model.
- `review/`: the independent lemma checks (`indep_identities*.py`, `indep_numeric*.py`, `hp_case.py`, `hp_reduced.py`,
  `cc_detail.py`, `numcheck_adversarial_sharded.py`) and their logs.

**Results (`results/`)**
- `cgs_*.json/log`: nine cap profiles.
- `lst_results.jsonl`, `lst_*.log`: table values.
- `rho_results.jsonl`, `rho_*.log`: first-moment comparison.
- `lawsocp_leancal_results.jsonl`, `leancal13.log`: calibration on today's witness.
- `cvs_0.845.json/log`: price-variance caps.
- `mn2_*.json/log` and `mn2r_*.json/log`: the route-M nodes and their refinements.
- `rows/`: the new row files and their law-relaxation lines (X7640_0235 at t = 0.8825–0.8875; the corners C7620_0180,
  C7660_0180, C7620_0300, C7660_0300; the valley point V7620_0212).

The stage-0 scripts are imported from `../caps-stage0-2026-11-15/` (set `$STAGE0`).

**Lemma folder** `../caps-stage0b-lemma-2026-11-15/`:
- `LEMMA_REVIEW.md`;
- the regenerated logs `numcheck_300_1.log`, `cells_compare_nq64.log/.json`, `capgain.log`, `gstar_selftest_rerun_2026-11-16.log`,
  `adversarial_sharded_120_7_*.log`, `verify_identities.log`;
- `cells_compare.py`, with a one-line fix: python-flint 0.8 has no `float(fmpq)`.
