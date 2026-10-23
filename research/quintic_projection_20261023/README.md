# Frozen fifth-projection and tail-price experiment

Read `docs/QUINTIC_REASSESSMENT_2026-10-23.md` first, then the exact projection
proof. No new Grothendieck endpoint is claimed. No other chats or the main
checkout were used. The numerical files are marked `NUMERICAL_ONLY`.

The root of this directory contains the original endpoint certificate with
its unchanged, source-hashed dependencies. The hardened production integral
verifiers are in `tools/`. `production_replays/` records their independent
replays, rejection controls, the rational mixture-score consequence and the
standalone Lean compilation. `numerics/` contains frozen search results and
holdouts, including failed necessary-score tests.

Environment used: Python 3.12.3, python-flint 0.9.0 (Arb), NumPy 2.5.4,
SciPy 1.18.1; Lean uses this repository's toolchain and Mathlib. Versions and
source hashes matter for reproduction. Mathematical inputs not proved by
the scripts are stated in the proof and `MEHLER_AUDIT.md`.

## Production replay from the worktree

```sh
python -I tools/verify_quintic_coefficient.py tools/quintic_sign.json --out sign-replay.json
python -I tools/verify_quintic_bank.py tools/quintic_bank.json --out bank-replay.json
python -I tools/check_quintic_certificates.py --out controls.json
python -I research/quintic_projection_20261023/verify_bank_constants.py
python -I tools/verify_quintic_mixture_score.py research/quintic_projection_20261023/bank-constants-replay.json --out score-replay.json
lake env lean Grothe/LowerAnalytic/QuinticTransferAudit.lean
```

The sign and bank checks recompute all required directed integrals and
include full unbounded Gaussian tails. The constants aggregator verifies
the frozen source/replay hashes and recomputes rational consequences; it
does not itself recompute the endpoint grid. The mixture-score checker
rejects `--target 7108/10000`, a deliberately false rejection threshold.

## Full endpoint provenance replay

Run the following **on the droplet in an owned copy**, since the three
1024-grid endpoint runs are heavy. The historical cancellation verifier
uses sibling imports, so invoke it without isolated mode. Preserve the
original filenames: the later checks hash their predecessors.

```sh
cd research/quintic_projection_20261023
python quintic_phase_moments.py quintic_phase_profiles.json --backend arb --all-moments --out quintic-all-moments-replay.json
python certify_exchange_cancellation.py exchange-active-cancellation-input.json --out exchange-active-cancellation-replay.json
python -I verify_exchange_endpoint_lower.py --n 1024 --out exchange-endpoint-lower-replay.json
python -I verify_bank_constants.py
```

The grid bounds the omitted boundary union by its exact probability mass;
it is not a finite-radius numerical integration. The endpoint identity
and monotonicity proof remain paper arguments. Rerunning integrals changes
runtime fields and hence replay hashes; regenerate downstream files in
the displayed order. The original hashes are a provenance check, not a
claim that a checksum proves the analytic bridge.

## Numerical search and frozen holdouts

Copy `quintic_local_oracle.py`, `evaluate_quintic_frozen.py`,
`tail_priced_phase_oracle.py`, and `quintic_frozen.json` from `tools/` into
an owned droplet directory. These commands match the saved runs:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -I quintic_local_oracle.py --out quintic-local-oracle-final.json
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -I evaluate_quintic_frozen.py quintic_frozen.json --out quintic-frozen-holdouts.json
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -I tail_priced_phase_oracle.py --out tail-priced-oracle.json
```

Each oracle freezes coefficients before independent scrambles. The frozen
rational example has three fresh `2^20` holdouts. The tail oracle stores
all 30 steps of each selected circuit and both raw and control-variate
scores. None of these sampling errors is certified. Analytic finite-m
errors are separate and are explicitly recorded in the outputs.

The small bank LPs can be replayed locally from the worktree:

```sh
python -I tools/quintic_tail_screen.py research/quintic_projection_20261023/numerics/tail-screen-columns.json --out screen.json
python -I tools/quintic_tail_screen.py research/quintic_projection_20261023/numerics/tail-screen-with-circuits-columns.json --out screen-with-circuits.json
```

Their optimal values are upper diagnostics for a necessary full-tail
score on those numerical banks. They are not global scalar norm caps or
certified rounding scores. Real spectra use a genuine equal mixture with
the conjugation-reflected response pair. `phase(0)=0` preserves charge-one
equivariance for every frozen recursive circuit.
