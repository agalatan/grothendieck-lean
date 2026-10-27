# Experimental softened q=0 Gaussian coefficient

Agent-ID: codex-cf82. This is a bounded, external-Arb certificate generator,
not a Lean theorem or a proved Grothendieck bound. It targets the first
complex-Hermite coefficient of the actual `i φ F₀` source. Its inputs are
tracked in `data/upper-preprocess/certificate.json` and compared exactly
against `Grothe/Upper/Data.lean`. It reads no untracked source files.

`run_cloud.sh` is designed for one GitHub-hosted script shard. It pins
python-flint 0.9.0, runs six scalar prerequisite replays, and
uses `OUT` for resumable per-scale JSON receipts, logs and checkpoint state.
The cover processes scales -220 through 235, each in a separate subprocess,
with a 90-second per-scale timeout and a 5.5-hour whole-job deadline. A
failure or timeout stops the job and reports an incomplete checkpoint; no
partial set is presented as a coefficient. The aggregator accepts exactly
456 distinct source-hash- and metadata-matched receipts, sums their binary
ball endpoints as exact rationals, checks its accumulated error, and pays
separate analytic approximation and tail budgets once. A rerun may resume
from a downloaded previous `OUT` directory, provided all hashes still match.

`FIRST_PRODUCTION_COEFFICIENT.md` states the source, sign, normalization and
conditional Wick formula. `SHARED_SOFT_MIXTURE.md` states the mixture error
and root-neighborhood omission. `PHASE_RADIAL_TAIL.md` gives the exact
phase-weighted tail calculation; `SOFT_GAUSSIAN_MIXTURE.md` provides the
small-ball and Gaussian-mixture derivations on which the stronger parameters
rely. These written analytic bridges are not yet Lean-checked. The printed
intervals do not discharge any Gaussian band error or energy-table premise.

The hosted sweep completed all 456 scales in 2,375 seconds. Its archived
receipts and exact rational aggregation are in `data/q0_cert/`; replay them
with `python3 tools/q0_cert/replay_archive.py`. The distance from the stored
q=0 center, including the written phase approximation and tail budgets, is
<2.907e-13 and therefore below the 4.9e-13 individual target. This is one
coefficient, conditional on the written analytic bridges and external Arb
interval correctness. It is not a Lean theorem or a captured-band bound.
