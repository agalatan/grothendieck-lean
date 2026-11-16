<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/primal-dual/REPORT_ROUND3.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Complex primal/dual search, round 3: identity tails and the upper-side test

claude-b9ee research worker "primal-dual", 16 November 2026. Everything is **N** (graded model, floating point); nothing is certified. claude-b9ee saved this file from the worker's report.

## 1. Identity tails

A tail game has its head λ₀..λ_K and the same coefficient ν on every higher degree.
- The tail needs no truncation: Σ_{k>K} c_k = Re E[f̄g] − Σ_{k≤K} c_k exactly.
- The best response is f = ph(Σ_{k≤K}(λ_k − ν)P_k g + νg). Pairs are scored by solving f = ph(A_f + νg), g = ph(A_g + νf) pointwise.
- The code reproduces the identity-tail cubic value 0.713021: 0.7130210, and 0.7130190 when re-scored on the finer 96-node grid.

| D | N_D, no tail | best tail game; ν | N_D, with tail | 1/N | gain |
|---|---|---|---|---|---|
| 5 | 0.7124306 | (1, −0.86328, 0.33459); −0.01384 | 0.7123827 | **1.40374** | 4.8e-5 |
| 7 | 0.7121949 | (1, −0.90861, 0.55426, −0.26737); +0.00923 | 0.7121878 | 1.40411 | 7e-6 |
| 9 | 0.71209–0.71210 | unresolved | between 0.712042 and 0.71210 | ≤ 1.40441 | ≤ 6e-5 |

**Degrees 5 and 7.**
- Converged with the W3, Z2, h∘ρ and plain-phase oracles; the gaps are 3.6e-7 and 7.4e-7.
- At degree 5 only the W3 driver pairs bind. The negative tail charges symmetric responses for their mass above degree 5: the plain phase drops to 0.71186, Z2 to 0.71199.
- The Z3 and W3+W5 checks at these tail optima did not finish. At ν = 0 those families were within ±1e-5 of W3 at degree 5, and below W3 at degree 7.
- The degree-5 tail game (1/N = 1.40374) exceeds the degree-≤5 ceiling 1.4036705 of `docs/overview.tex`. This is not a contradiction: the tail acts on every degree.

**Degree 9.**
- Without Z3 and W3+W5 in the loop, the tail search drifts back to an aggressive game, (1, −0.95693, 0.83313, −0.79594, 0.41635) with ν = −0.00937, at 0.7120418. That is a lower bound for the tail optimum only.
- Z3 still breaks it: six fine-scored seeds give 0.71267–0.71275. So the degree-9 tail gain is at most 6e-5 and probably small.

**Correction to round 2.** At λ₉ the W3 family reaches 0.7120973 and W3+W5 0.7121013, so N₉ = 0.71209–0.71210 and 1/N₉ = 1.40430–1.40431.

**Margins for certificates.**
- Degree 5 with the tail: 3.8e-4 below 1/1.403 and 8.8e-4 below 1/1.402.
- Degree 9: about 1.5e-4 below 1/1.404.

## 2. Upper-side test

The test value is V = c₀(μ) − Σ_{k≥1}|c_k(μ)|.
- **Coefficients.**
  - High-degree coefficients are computed exactly within the model: Laguerre-form Hermite tables and an FFT over arg W. They match the plain phase to 7e-13 up to k = 30, and ph(z ± 0.5W) to 4.5e-6.
  - Beyond k = 30, model pairs use the energy bound √((1−E_f)(1−E_g)). Haagerup's family h∘ρ uses exact series up to k = 300.
- **Pool:**
  - the degree-9 W3 driver pairs;
  - the remote-only pair f = ph(W₃), g = −f;
  - the plain phase and Haagerup-type columns.

  The Z3 and W3+W5 pairs (5-dimensional) could only be bounded up to k = 4, with 5–12% of their energy beyond, so they are useless here.
- **Result.** V_max = 0.7117798, attained by Haagerup's column alone. This is below γ_H = 0.7117898, below the repository's 0.7119468 and below γ† = 0.7119587. The test gives **no support** to the lead K ≈ 1.4044 < 1/γ†.
- **What limits it.**
  - Mainly the pool. The degree-9 dual mixture cancels c₁…c₄ exactly and nothing above. The visible driver pair alone has c₀ = 0.71183, Σ_{1≤k≤4}|c_k| = 0.0035 and Σ_{5≤k≤30}|c_k| = 4.7e-4.
  - Then the tail bound. Phases carry about 1% of their energy above degree 61, so the rigorous tail bound alone costs about 1e-2.
  - A real test needs smoothed, non-unimodular, preprocessed multi-coordinate roundings, as in the repository's construction.

## Files (this folder)

- Code: `gm3.py`, `cp6.py`, `vtail.py`, `hispec.py`, `krivine.py`.
- Logs, under `results/round3/`: `t5_local.*`, `t7_local.*`, `t9_local.*`, `big_v9z3.log`, `krivine.log`, `krivine_out.json`, `big_*`.
