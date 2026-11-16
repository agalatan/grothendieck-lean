<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/primal-dual/REPORT_FOLLOWUP.md, 16 November 2026; Agent-ID: claude-b9ee (research workers of this session). -->
# Complex primal/dual search, follow-up: degree-7 robustness; degrees 9 and 11 with Z3, Z4 and grade-mixture oracles

claude-b9ee research worker "primal-dual", 16 November 2026. All numbers are **N** (graded model, floating point); nothing is certified. N is the model norm of a game; λ is listed from degree 1 up. Every response found on a coarse grid was re-scored as the same explicit pair on finer grids. Coarse grids flatter some pairs by up to 1.5e-2, so only fine-grid scores count. claude-b9ee saved this file from the worker's report.

## Bottom line

- The degree-7 value **N₇ = 0.7121936 (1/N₇ = 1.404113)** survives every family that could be run.
- **Degree 9**, re-optimised with Z3 in the oracle set, beats degree 7 by 1.0e-4: **N₉ = 0.7120931, so 1/N₉ = 1.40431** (±2e-5).
- **Degree 11** adds at most 2.6e-5 over degree 9.

## 1. Degree 7: the game (1, −0.906596, 0.541570, −0.242531)

**Near-optimum attacks.** The fine-grid W3 optimum was embedded in richer models with noise σ = 0.2–0.6 and re-optimised. The found pair and the embedded W3 pair were then scored on the same grids.
- W3+W5 (two runs), W3+W7 (two), a second independent cubic driver and W3+Z2 all end within 1.3e-6 of W3 (96×64: 0.7121937 against 0.7121950).
- The 7-variable families end below W3: W3+Z3 gives 0.7120989 against 0.7122662; W3+W5+W7 gives 0.7121520 against 0.7122006.

**Random searches.**
- Z3, 6 seeds: 0.71138–0.71182.
- Z4, 3 seeds: 0.7072–0.7080. This is weak evidence: the only affordable Z4 search grid is artefact-driven (search values 0.726–0.728).
- Z3→Z4 warm start: 0.7115754, below its own embedded Z3 pair (0.7117420).

**Exact families.**
- Preprocessed phase pairs h∘ρ, which cover every mixture of W₃/W₅/W₇/… grades: at most 0.712107.
- The U(1)×U(n−1)-invariant family (responses depending only on the visible coordinate and the radius of the others). The reduction is exact for any n; for n = 1–8 it collapses to the plain phase.

**Other notes.**
- Every search allows f ≠ g. The only asymmetric structure among binding pairs is the Krivine flip g = f(W → −W).
- Z5 was not run. It has 10 real dimensions, so a grid fine enough at degree 7 needs about 10⁹ nodes per evaluation, and Monte Carlo searches overfit at the 1e-2 level.

## 2. Degree 9, resolved

**The game.** λ₉ = (1, −0.93600, 0.72057, −0.59202, 0.23468).
- N₉ = 0.7120931; LP lower bound 0.7120923 (gap 8.8e-7).
- Four families are balanced: W3 0.7120931, Z3 0.7120925, h∘ρ 0.7120922, W3+W5 0.7120811.

**Optimal dual mixture** (the binding responses):
- 60%: a W3+W5 pair;
- 30%: W3 driver pairs, one shared W through all degrees;
- 9.6%: a Z3 pair, f ≈ g with the cubic energy suppressed, c = (0.7588, 0.0661, 0.0289, 0.0125, 0.0077);
- 0.06%: the remote-only pair f = ph(W₃), g = −f.

**Checks on λ₉.**
- Three fresh Z3 seeds converge on 48×40 to 0.712021–0.712046, below N₉.
- Z3→Z4 warm starts give 0.7119851 and 0.7119012 on 16×12.
- Random Z4 gives 0.71047.

**Why the earlier degree-9 game failed.** Its large positive λ₂ and λ₄ (0.82 and 0.38) rewarded the Z3 branch, which scored 0.71267 against it. The resolved game lowers them to 0.72 and 0.23.

**Error.** Z3 fine scores carry about ±1e-5 of quadrature noise, so N₉ = 0.712093 ± 1e-5 and 1/N₉ = 1.40431 ± 2e-5.

## 3. Degree 11 (5 cutting-plane iterations, not converged)

- Best game so far: (1, −0.93782, 0.71823, −0.57946, 0.24933, −0.016), at 0.7120921.
- The LP lower bound is 0.7120671, so N₁₁ ∈ [0.712067, 0.712092].
- λ₅ stays near 0, and Z3 is binding.

## 4. Convergence and the bracket

- Steps: N₅ − N₇ = 2.4e-4, N₇ − N₉ = 1.0e-4, N₉ − N₁₁ ≤ 2.6e-5.
- Bracket: **1.40431 ≲ K ≤ 1.4045994**. The left end is heuristic (degree 9); the right end is the repository's rigorous bound. 1/γ† = 1.404576 lies inside.
- **Lead, not a finding.**
  - By duality, the model's limit over all degrees bounds K from above. If the steps keep shrinking geometrically, that limit is about 0.71205, i.e. K ≈ 1.4044, below 1/γ†, with better roundings to be had.
  - Algebraic convergence from tail effects cannot be excluded; reaching γ† needs 1.05e-4 more decrease after degree 11.
  - The upper-side test: three-coordinate roundings built from the Z3 and W3+W5 pairs.

## 5. König's kernel

- Jones–Malavolta use A_G = e^{−|X|²/2−|Y|²/2}·sin⟨X,Y⟩ only as motivation, for games Π₁ − c₃Π₃ + c₅Π₅ − ⋯.
- In the complex case, the charge-one diagonal of that kernel on ℝ²ⁿ is (1, +0.25, −0.125, −0.047, +0.023, …). Its signs repeat with period 4, because the charge-one Hermite functions mix in the real kernel's off-diagonal terms.
- Other scalings either decay too fast (|λ₁| ≤ 0.08) or lose the alternation, so there is no useful game here.
- The optimised games are already alternating with a taper. What stops them from approaching the alternating game is the Z3 and grade-mixture responses.

## 6. Recommendation

- **Certify the degree-9 game λ₉** for 1.404. Its margin is 1.58e-4 in norm, 2.8 times degree 7's 5.7e-5, and comparable to the cubic rows' current loss of 1.3–1.45e-4.
- The certificate must cover four kinds of response:
  - shared-driver W3 sectors;
  - a W3+W5 sector;
  - a remote-only phase pair;
  - a finite-dimensional three-coordinate Z3 response, which no diffuse-driver fibre captures.
- Degree 11 is not worth pursuing before degree 9 is certified.

## Files (this folder)

- `gm2.py`: engine for many variables.
- `cp5.py`: parallel cutting plane.
- `attack.py`, `attack2.py`, `attack3.py`: random, near-optimum and sub-model embedding attacks.
- `radn.py`: the exact radial Zₙ family.
- `koenig2.py`: König coefficients.
- `results/big2_final/` (83 logs and JSON files):
  - `cp9.json`/`cp9.log` and `cp11.json`/`cp11.log`: the degree-9 and degree-11 searches;
  - `b7_*`, `f7_*`: degree-7 near-optimum attacks;
  - `e7_*`, `e9_*`: Z4 checks;
  - `z3n_*`: Z3 re-checks at λ₉.
