<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_self_interaction/r26_certificate/README.md (file dated 2026-11-05). Only this line was added. -->
# R26 self-interaction certificate

The theorem and complete mathematical argument are in **proof.md**.

For all three profiles, all finite-dimensional Hermitian matrices A, real c,
and u in [0.03, 0.0463], the certificate proves

    C(q)^2 <= (23/100) ( B(u) - F(q) - 1/40000 ),
    q = exp(i alpha) X [ c(|X|^2-2) + Y* A Y - tr A ].

In particular the requested 0.24 content inequality holds on the whole
Hermitian self-interaction family, without a condition on its variance share.

This is a mathematical proof with a rigorous computational certificate,
not a Lean formalization. The six-shell mixture problem is not claimed solved.

## Replay

Requirements: Python 3.12+, numpy, python-flint, and g++ with C++17/OpenMP.
The run used python-flint 0.9.0. SciPy is needed only to find replacement
witnesses; replay never calls a linear-programming solver.

Run from this directory:

```bash
# r26_certificate/ — fast replay of the saved interval enclosures
python replay.py --quick
```

This checks the analytic constants, rebuilds the certified quadrature nodes
and parameter enclosures, verifies the kernel interpolation bounds, reconstructs
all polynomial targets, and checks all 55,539 stored moment duals using
81,642,330 exact integer polynomial comparisons.

To recompute the scalar integrals with exact fixed-point interval arithmetic:

```bash
# r26_certificate/ — recompute scalar enclosures and verify fixed witnesses
python replay.py
```

To additionally regenerate all 423 Arb kernel nodes directly from the positive
integral formulas:

```bash
# r26_certificate/ — complete replay from the kernel definitions
python replay.py --regenerate-kernels
```

The last mode is substantially slower. The kernel generator uses up to six
worker processes; scalar integration defaults to four OpenMP threads, adjustable
with OMP_NUM_THREADS. Full regeneration does not need the earlier progress
archive or any external mathematical files.

## Files

- `proof.md`: theorem, moment reduction, analytic bounds, continuous interpolation,
  infinite-tail arguments, and shared-A consequence.
- `generate_kernels.py`, `*_kernels.json`: positive Arb integrals and their certified
  node enclosures for all three profiles.
- `quadrature.py`, `quadrature.json`, `parameters.json`: certified radial rule,
  its analytic error, and the algebraic parameter grid.
- `prepare.py`: exact Hermite remainder checks and evaluator input generation.
- `evaluate_interval.cpp`: outward-rounded integer interval evaluation of the
  radial integrals. No floating-point evaluation is used here.
- `*_interval_points.bin`, `*_interval_benchmark.txt`: scalar interval enclosures.
  Binary integers are signed 64-bit little-endian, with denominator 2^48;
  each scalar point stores F_lower, F_upper, C_lower, C_upper.
- `certify.py`: untrusted witness finder and exact reconstruction of scalar
  majorant targets. The optimizer is never used by replay.
- `*_duals.bin`: eight signed 64-bit little-endian integers per witness,
  with denominator 2^44. Order: t, angle, lambda, moment coefficient.
- `verify_duals.cpp`: exact Bernstein, infinite-tail, multiplier-sign, and
  moment-cost checks. This is the acceptance criterion for the witnesses.
- `replay.py`, `result.json`, `*_verification.log`: replay orchestration and results.

The kernel generation uses Arb rigorous ball arithmetic. Subsequent scalar
integration uses exact integer intervals; final polynomial comparisons use exact
signed 128-bit integers. Ordinary floating optimization has no authority to
accept a witness.
