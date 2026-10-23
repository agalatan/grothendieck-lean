# Replay and trust boundary

All paths here refer to the isolated worktree, not the shared main checkout.
The exact checks below need only Python's standard library and can run from an
unrelated directory. They do not certify the saved floating Gaussian integrals.

```sh
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_symmetric_cubic_state.py
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_noise_prices.py /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-20261023/pool-screen-with-phase.json
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_noise_prices.py /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-20261023/pool-screen-expanded.json
python3 -I /Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_graded_gaussian_obstruction.py /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-20261023/pool-screen-with-phase.json --out /tmp/grothe-graded-gaussian-replay.json
```

The first check verifies joint Gram/moment algebra and rejects independent-Y
and first-grade-G surrogates. The next two check admissible rational prices and
the exact algebra on **floating midpoint inputs**, including negative controls.
The last check is different: its kernel is analytic, and every series term and
infinite remainder is enclosed over rational arithmetic. Its payoff obstruction
is rigorous given the paper's replica-limit argument and Gaussian phase identity.
It applies to the first price-induced witness; it is not a new endpoint.

The selected Lean targets and eleven-theorem standard-axiom report are rebuilt by:

```sh
cd /Users/alingalatan/workspaces/grothe-codex-joint-image
/Users/alingalatan/.elan/bin/lake build Grothe.LowerAnalytic.ReplicaState Grothe.Upper.KernelScreen
/Users/alingalatan/.elan/bin/lake env lean /Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsReplica.lean
shasum -a 256 -c /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/symmetric-response-20261023/SHA256SUMS
```

Both modules are imported by the root. At commit `f4b9db4`, the complete
232-entry audit was configured but not freshly run here. The next separator
stage extends that configuration to 247 entries; its new selected-module audit
is documented in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/spectral-separator-20261023/REPLAY.md`.
No unchanged numerical native checks were repeated
in this worktree. The earlier full-library validation is documented in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/WORKTREE_HANDOFF_2026-10-23.md`.

Discovery ran on `ssh yo`, using
`/home/agalatan/grothe-cx/venv/bin/python`, numpy/scipy, and
`OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1`, in
`/home/agalatan/grothe-cx/codex/joint-image-compatibility-20261023/input`.
Its results are in the sibling
`/home/agalatan/grothe-cx/codex/joint-image-compatibility-20261023/results`.
The source sequence was:

1. `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/symmetric_cubic_response.py`:
   six initial fits at `m=4,16,128`, epsilon `0.745,0.7564`, then four extra fits
   at `m=16,128`, epsilon `0.77,0.8`. Fit power 18, two holdout powers 20.
2. `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/symmetric_cubic_replicas.py`:
   power-18 original-noise cross-Gram controls.
3. `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/screen_symmetric_kernel.py`:
   independent power-20 kernels at `rho=0.5,0.7,0.85,0.95,1` for the eight
   `m=16,128` columns.
4. `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/screen_response_pool.py`:
   necessary full-score relaxation, with `--phase-baseline`; freeze its rational
   price before adversary search. The nominal first optimum is about 0.711591.
5. `/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/attack_noise_prices.py`:
   fit power 17, two starting points at each of `m=16,128`. Finite-difference
   gradient errors decrease from roughly `5.9e-6` to `4.4e-8` when the step
   decreases tenfold. Optimizer termination is not a stationarity certificate.
6. Evaluate both new columns using the original-noise kernel script, then repeat
   the pool screen with those records, `--phase-baseline`, and
   `--graded-variances 1/3`. The expanded midpoint relaxation is about 0.712036;
   that value is not an achieved rounding score.

One-point scalar features must never be independently Gaussian-noised to run
step 3. The scalar G has third-chaos original noise, and A_Y shares its squared
modulus. The standalone paper proves the correct replica representation.
