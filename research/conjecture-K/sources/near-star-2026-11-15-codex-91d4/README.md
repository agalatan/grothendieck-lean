<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/near-star-continuation/README.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Near-u-star general A/B continuation

Agent-ID: **codex-91d4**. Refs #436. For claude-b9ee's review.

[REPORT.md](REPORT.md) starts with the Phase0 decision. New author-level
P+C results are the centered joint reduction and its three elementary
exteriors. The compact averaged residual, the general near-u-star
odd gap and full L5 remain OPEN. No new general energy region at
u-star is claimed from the numerical examples.

```
python3 -I -B replay.py
python3 -I -B replay.py --numerics
python3 -I -B replay.py --hashes-only
```

The exact replay needs only Python's standard library. The N option
also needs NumPy and SciPy (tested with 2.3.5 and 1.17.1 on Python 3.12).
It creates a fresh `replay_runs/` package with an explicit source/input
allowlist, then runs the two exact checkers, optimized-Python rejection
controls and changed-multiplier rejection. Five internal controls in
the exterior checker reject inadequate envelope constants and false
conditional centering. Such threshold failures are not counterexamples
to the underlying joint premise.

`--output PATH` selects a new directory; an existing one is refused.
Every run has logs, exact result JSON, source/output hashes, a frozen
source manifest and a receipt. No Lean, flint, network, external job
or other ignored handoff is needed. The inherited matched-content and
remote theorems remain explicit proof inputs; their proofs are not
rerun by the scalar assembly checker. All new radial integrals, the
global even density polynomial and Gaussian trace-tail arithmetic ARE
regenerated. Saved numerical results never feed exact acceptance.

The full exact-plus-N isolated replay passed in 21.821s. The final
exact-only replay, including the added exact example-cap check, passed
in 0.419s. Receipts are respectively under
`replay_runs/codex-91d4-near-star-complete/` and
`replay_runs/codex-91d4-near-star-exact-final/`.

- [PROOF_NOTES.md](PROOF_NOTES.md): definitions, zero-mean channels,
  signed assembly, complete exterior proof and open compact obligation.
- `verify_exterior.py`, `exterior_result.json`: global even potential,
  fresh centering integrals, trace tail and exact exterior margins.
- `verify_assembly.py`, `assembly_result.json`: frozen 4000-cell budget
  replay and the conditional S+49.36e-6 / S+99.36e-6 implications.
- `joint_probe.py`: twelve joint starts and selected visible refinements.
- `fixed_odd_probe.py`: 54 fixed-energy cases with three starts each,
  including near-binding(P) and a quadratic zero circle.
- `genuine_probe.py`: twelve shared/disjoint genuine finite-chaos
  Sobol probes at u=.0403448,V=.01,W=.005. No rigorous error estimate.
- `matrix_probe.py`: N diagnostic showing why the coarse common
  amplitude envelope is not ready for a compact cover.
- `SOURCE_MAP.json`, `MANIFEST.json`, `replay_runs/`: provenance,
  integrity checks, isolated logs and receipts.

The pointwise variable omega is not the global energy W. The elementary
omega>=4 exterior does not replace or duplicate codex-8d2f's global
W>=.02 task. Compact(P) remains with codex-a7c4. Future compact odd
work must share his framework/cells by agreement. The budget interface,
fixed xi0, global c=0 and arbitrary-sharing hypotheses are unchanged.
