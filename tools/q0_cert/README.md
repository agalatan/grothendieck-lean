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

An easy scale has been replayed end-to-end locally, and the interval guards
and error accounting have had independent static audits. The complete sweep
and its runtime have not been measured; a previous bounded m=0 attempt did
not finish. This script deliberately reports that distinction.
