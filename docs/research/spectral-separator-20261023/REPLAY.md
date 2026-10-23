# Replay and trust boundary

Run in the isolated worktree only:

```sh
cd /Users/alingalatan/workspaces/grothe-codex-joint-image
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_cubic_phase_ceiling.py --out /tmp/grothe-cubic-phase-ceiling.json
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_spectral_prices.py /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/spectral-separator-20261023/spectral-angular.json
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/generate_cubic_phase_lean.py /tmp/grothe-cubic-phase-ceiling.json --out /tmp/grothe-cubic-phase-screen.lean
cmp /tmp/grothe-cubic-phase-screen.lean /Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/CubicPhaseScreen.lean
/Users/alingalatan/.elan/bin/lake build Grothe.Upper.SpectralScreen Grothe.Upper.CubicPhaseScreen
/Users/alingalatan/.elan/bin/lake env lean /Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsSpectral.lean
shasum -a 256 -c /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/spectral-separator-20261023/SHA256SUMS
```

The first verifier reconstructs rational positivity certificates on the whole
coefficient triangle, including the arbitrary complex phase comparison. The
Lean polynomial proof is generated transparently: no `native_decide`, numerical
axiom, or unproved positivity oracle. The written Gaussian-family application
and the formal low-coefficient interface are distinguished in:

- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/cubic-phase-separator-20261023.tex`
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md`

The second verifier is **not** an enclosure of the numerical response
integrals. It proves the all-index price budget and interval algebra under
the stated error assumptions, and separately encloses the two analytic
baseline columns. It rejects corrupted prices, understated bounds, and an
incorrect analytic baseline. No numerical pool exclusion follows here.

The saved fifteen-theorem axiom report contains only standard axioms. Both
modules are imported by the root and the global audit is configured to print
317 reports after the GitHub-master rebase, with all fifteen new results
required by its checker. A fresh full-library build/317-entry audit runs in CI.
The local validation builds every added module and audits the branch's 61
additional selected theorems separately. The
unchanged headline numerical certificates were not recomputed.

## Discovery provenance

Numerical work ran on `ssh yo`, in the task-owned directory
`/home/agalatan/grothe-cx/codex/joint-image-compatibility-20261023/spectral/`.
Use `/home/agalatan/grothe-cx/venv/bin/python` with
`OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1`. Source scripts are copied into
`/home/agalatan/grothe-cx/codex/joint-image-compatibility-20261023/spectral/input/`;
outputs are in its sibling `results/`.

1. Run `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/angular_response_coefficients.py`
   on the previous response definitions (`response-scan.json`,
   `response-pool-extra.json`, `noise-adversaries.json` in the preceding
   remote results directory), with powers 18 and 20 and the two fixed seeds
   in the source. It passes circle-quadrature and exact pure-phase controls.
   The four radial integrals are scrambled Sobol estimates, not enclosures.
2. Run `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/merge_angular_heads.py`
   with the preceding twelve-column pool and `angular-heads.json`. It forms
   cross-scramble bilinear products. The output is `pool-angular.json`.
   Original-noise kernels are unchanged; no independent scalar-noise
   surrogate is used.
3. Run `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/screen_spectral_pool.py`
   on `pool-angular.json`. Its nine rows vary the price-l1 cap and explicit
   assumed head/kernel errors. The rational export enforces the finite
   spectral front and infinite geometric tail exactly after rounding.
4. Run `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/attack_graded_phase.py`
   with default power 18 and 160 iterations, followed by independent
   power-20 projections. The four starts collapse to essentially one
   visible radial response. Their large witness payoff is not a large
   full upper-rounding score, and no certified global norm follows.

The old midpoint-only spectral scan before the angular update is not needed
to replay any new theorem. No endpoint value in the README was changed.
