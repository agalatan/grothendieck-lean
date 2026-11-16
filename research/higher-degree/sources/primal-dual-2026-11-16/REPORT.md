<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/primal-dual/REPORT.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Complex primal/dual search (overview open problem 3): first run

claude-b9ee research worker "primal-dual", 16 November 2026. All numbers are **N** (floating point, graded model); nothing is certified. N denotes the model norm of a game; λ lists its coefficients from degree 1 up. claude-b9ee saved this file from the worker's report.

## Bottom line

- The degree-5 and degree-7 lower-bound values are real within every response family tried.
- **Degree 9 is not resolved.** Both the repository's degree-9 games and a re-optimised one lose to responses that earlier searches missed.
- Bracket: **1.40411 ≲ K_G^ℂ ≤ 1.4045994**. The left end is heuristic (the degree-7 game); the right end is the repository's rigorous bound. 1/γ† = 1.404576 lies inside. There is no evidence for a constant of the form 1.403-something.

## 1. Primal side

| D | best game λ | N | 1/N | gap |
|---|---|---|---|---|
| 3 | ε = 0.7564 | 0.7131355 | 1.402258 | exact |
| 5 | (1, −0.84896, 0.28180) | 0.7124294 | **1.403648** | 1e-7 |
| 7 | (1, −0.906596, 0.541570, −0.242531) (the repository's game, re-confirmed) | 0.7121936 | **1.404113** | 2e-7 |
| 9 | unresolved | between 0.71205 and 0.7121936 | between about 1.40440 and 1.40411 | — |

The degree-5 value is a Richardson extrapolation over 96/128/160-node grids. "Gap" is the cutting-plane LP lower bound against the best response found.

**Responses that degree-9 games had missed.**
- **Grade mixtures.** f = ph(√a·W₃ + √b·W₇), g = −f, which mixes two diffuse grades.
  - It scores 0.7154289 against GPT's retuned game and 0.7138931 against the manuscript game.
  - The old single-grade oracle G_d cannot see it, so the repository's figures 1.40441–1.40444 are overestimates.
- **Three ordinary coordinates (Z3).**
  - With an exact gradient oracle, the re-optimised game is λ₉ = (1, −0.95435, 0.82444, −0.78684, 0.38482), with N = 0.7120501 against the W3, Z2, W5 and preprocessed-phase families.
  - But a genuine n = 3 pair scores **0.712672**, stable over four grids (0.71262 / 0.71268 / 0.71266 / 0.71267). Hence 1/N(λ₉) ≤ 1.40318, which is worse than degree 7.
- **Consequence.** Degrees 11 and 13 are unresolved too, because their cutting planes had no Z3 oracle.

**Checks passed at degrees 5 and 7.** In each family the best restart matched the W3 value to 1e-10 or stayed below it.
- One extra variable: Z2, W5, W7, and real or complex sectors (1,1), (2,0), (3,0), (3,1), (2,2).
- Exact preprocessed-phase pairs h∘ρ: at most 0.712107 at degree 7.
- Preprocessed two-variable pairs: the optimum is W3 itself.
- Five-dimensional families: W3+Z2, a second independent cubic driver, W3+(2,0) and W3+(1,1).
- Z3: 5 seeds at degree 7 (0.7114–0.7118, below W3) and 3 seeds at degree 5 (plain-phase level).

**Not tested.** Four or more ordinary coordinates at degree 7. These are the adversaries that grow as games approach the alternating game. A constant near 1.403 would need a missed response worth at least 3e-4 against the degree-7 game; none appeared.

Coarse polar grids flatter two-coordinate pairs (+1.9e-5 at 48×32, gone after refinement), so every reported value is an explicit pair scored on fine grids.

## 2. Structure of the optimal responses (what a certificate must reproduce)

- **Degree 5.**
  - g = f(W → −W) exactly, and f = ph(z(1 + 0.267H₂₁ + 0.048H₃₂) + 0.290[W + 0.158(|z|² − 1)W + 0.096·z²W̄]).
  - One shared driver W feeds all three W-sectors.
  - The optimum lies at the crossing of two branches: the dual mixture is 87% driver pairs and 13% plain phase.
- **Degree 7.** Two branches tie, both with one shared W and the Krivine flip.
  - Visible driver pairs carry 99.6% of the dual mixture.
  - A W-dominated pair carries 0.4%: ‖P₀f‖² = 0.077 and ‖P₁f‖² = 0.708 in W, plus the z̄W² and z|W|² sectors; c = (0.074, −0.711, −0.002, 0.022).
- **Degree 9.** The dual mixture has four parts:
  - shared-W driver pairs in every degree: 95%;
  - Z2 near-plain-phase pairs: 5.7%;
  - a remote-only pair ph(√0.948·W₃ ± √0.052·W₅): 0.2%;
  - the Z3 branch: f ≠ g, with most energy in the two non-visible coordinates; c = (0.753, 0.060, 0.028, 0.011, 0.007).

## 3. Dual side (consistency only)

- Within the model, the truncated LP duals equal the primal lower bounds to 1e-7. Their tails are uncontrolled, so they are not bounds.
- An exact LP over preprocessed-phase roundings stays at Haagerup's γ_H = 0.7117898067. It goes to degree 41, with the tail to degree 241 below 6e-11. The solution is a degenerate vertex; improving it needs mixtures whose residuals cancel.
- The repository's rounding (0.7119468) remains the best dual. No pool goes above γ† or towards 1/1.403.

## 4. Convergence and the 1.404 threshold

- **Step sizes:** N₃ − N₅ = 7.1e-4 and N₅ − N₇ = 2.4e-4; degree 9 gains at most 1.4e-4 (unresolved).
- **Distance to γ†:** N₇ − γ† = 2.35e-4.
- **Threshold:** degree 7 is the first degree to exceed 1.404, with a margin of 5.7e-5 in norm.

## 5. Certification recommendations

- **Degree-7 game (1, −0.906596, 0.541570, −0.242531).**
  - The allowed loss for 1.404 is below 5.7e-5, about 2.5 times tighter than the cubic rows' 1.3–1.45e-4.
  - The certificate must handle both tied branches, including the remote-dominated one, where the remote cubic holds 71% of the energy.
- **Degree 9: do not certify** the repository's games or λ₉. First re-optimise with Z3 and Z4 oracles; the optimum may fall back towards the degree-7 game.

**Error estimates.** Grid error is about 1.5e-6 for W3 at 96×64 and about 5e-5 for fixed Z3 pairs; duality gaps are at most 2e-7. The dominant uncertainty is one-sided: missing adversaries can only raise the true norms.

**Files** (this folder):
- engine: gm.py;
- game search: cutplane2.py, cutplane4.py;
- richer families: richer.py, pre2.py, pre2opt.py, z3check.py, z3quick.py;
- structure, grid refinement and dual: structure.py, refine.py, dualcg.py;
- logs: results/yo/, results/big/, and results/structure_K{2,3,4}.log;
- degree-9 Z3 evidence: results/big/z3q_K4_s1{1,2,3}.log;
- optimal mixtures: results/yo/cp3_K3.json and results/yo/cp3_K4.json.
