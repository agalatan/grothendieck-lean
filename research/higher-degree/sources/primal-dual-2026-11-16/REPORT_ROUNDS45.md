<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/primal-dual/REPORT_ROUNDS45.md, 16 November 2026; claude-b9ee research worker; saved by claude-b9ee from the worker's reports. -->
# Complex primal/dual search, rounds 4–5: degree-5 games with a cap on λ₁

claude-b9ee research worker "primal-dual", 16 November 2026. Everything is **N**: graded model, 96×64 grid, best-response cutting planes with LP gaps ≤ 8·10⁻⁷. The grid reads about 10⁻⁶ high, so the true margins are about 10⁻⁶ larger. Games are λ = (1, −ε, γ); ν is the identity-tail coefficient. claude-b9ee saved this file from the worker's reports.

**Why.** At t = 0 every row bound of the degree-5 certificate is at least ε·ρ*², where ρ* = sup E|q|/‖q‖₂ on H₂,₁. The cap on ε is set by the radius bound in use:
- 0.75248 for the Lean radius 0.973612157;
- 0.7881 for the ledger's 0.95133 (`research/conjecture-K/STATUS.md` 3.7);
- 0.77 and 0.78, to keep slack at t = 0.

| cap on ε | ν | best game | N | 1/N | margin to 0.71326676 | t = 0 slack with ρ* = 0.9513293 |
|---|---|---|---|---|---|---|
| 0.75248 | none | (1, −0.75248, +0.0020) | 0.7131533 | 1.402223 | 1.14e-4 | — |
| 0.75248 | +0.0114 | (1, −0.75248, −0.0058) | 0.7131354 | 1.402258 | 1.31e-4 | — |
| 0.77 | none | (1, −0.77, 0.0500) | 0.7129644 | 1.402595 | 3.02e-4 | 0.0164 |
| 0.77 | +0.0073 | (1, −0.77, 0.0452) | 0.7129544 | 1.402614 | 3.12e-4 | 0.0164 |
| 0.78 | none | (1, −0.78, 0.0779) | 0.7128677 | 1.402785 | 3.99e-4 | 0.0073 |
| 0.78 | +0.0063 | (1, −0.78, 0.0740) | 0.7128611 | 1.402798 | 4.06e-4 | 0.0073 |
| 0.7881 | none | (1, −0.7881, +0.1008) | 0.7127953 | 1.402927 | 4.72e-4 | ≈ 1.4e-5 |
| 0.7881 | +0.0050 | (1, −0.7881, +0.0985) | 0.7127912 | 1.402935 | 4.76e-4 | ≈ 1.4e-5 |

- **Under the Lean radius** the degree-5 coefficient collapses to about 0: the game is the cubic witness at the cap.
- **What binds.** Only visible W3 driver pairs with the Krivine flip bind (c₀ ≈ 0.72, t ≈ 0.849). The other families checked at each optimum stay below N: Z2 and the plain phase (0.7116–0.7124), exact h∘ρ (0.7123–0.7124), Z3 (4 seeds, fine-scored, 0.7118), and W3+W5 (within 10⁻⁶, inside that oracle's scoring bias).
- **Small t.** The remote-only pair scores ε·π/4 = 0.59–0.62, about 0.12 below N. So the t = 0 bound ε·ρ*² is a certificate artefact as long as it stays below 500/701. Small-t responses bind only at degree 7 and above.
- **Choice for the degree-5 route:** the cap 0.78.

Files: `results/round4/`, `results/round5/`.
