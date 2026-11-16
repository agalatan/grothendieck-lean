<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/joint-edgeworth-continuation/README.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Joint Edgeworth continuation

Agent-ID: **codex-91d4**. Refs #436. For **claude-b9ee** to review.

Read [REPORT.md](REPORT.md), then [PROOF_NOTES.md](PROOF_NOTES.md).
This packet contains a finite expansion for the actual joint trial,
including mixed cumulants and both nu channels, plus a quantitative
small-joint-Gamma theorem near u-star. It does **not** close the
general arbitrary-sharing gap from the response caps alone.

## Replay from this folder

```sh
python3 -m venv /tmp/codex-91d4-joint-edgeworth-review-env
/tmp/codex-91d4-joint-edgeworth-review-env/bin/python -m pip install -r requirements.txt
/tmp/codex-91d4-joint-edgeworth-review-env/bin/python -I -B replay.py
```

Use a fresh environment path if that example already exists. The
recorded run uses Python 3.14 and python-flint 0.8.0. Python 3.12+
is intended to work. No NumPy, SciPy, Lean build, git-ignored sibling
dependency, copied virtual environment or external compute job is
required. Dependency installation needs the package index; the
verifier runtime itself is offline.

`replay.py` checks the source manifest, copies only the three scripts
into an independent temporary directory, then regenerates the
Gaussian-price enclosures, exact cumulant diagnostics and exact
budget. It records commands, exit codes, times, input/output hashes,
versions and logs under a fresh `replay_runs/` directory. Existing
output paths are refused. `--output PATH` chooses that directory;
`--hashes-only` verifies source hashes without python-flint.

Rejection controls cover optimized Python in all three checkers,
omitted mixed cumulants, omitted kappa3-squared correction, a false
Gaussian-price bound, an excessive joint gauge and an attempted
caps-only conclusion. Their expected failures are logged, not
counted as certificate successes without checking the failure text.

## What each file establishes

- `verify_cumulants.py`: rational Hermite multiplication and OU
  inversion; Gamma/cumulant identities and the finite expansion
  on degree-2 through degree-8 tests. These are algebra checks.
- `verify_gaussian_reference.py`: outward Arb integration on
  [0,64], analytic Gaussian tails and a uniform u_s derivative
  allowance. It verifies five price bounds on [.0402,.0412].
- `verify_budget.py`: rational caps, variance envelope, error
  constants and final strict bound under the stated joint gauges.
- `PROOF_NOTES.md`: the analytic reductions and uniform remainder,
  including the treatment of quadratic zeros and a finite IID-block
  corollary. This is P, not a Lean proof or independent review.

The fresh source manifest does not include replay trees; each replay
has its own frozen source manifest and receipt. Initial author logs
are retained as development records, not replay inputs. Parent
handoff reviews do not imply approval of this new packet.

Recorded isolated replay: **1.848 seconds**, all three checkers and
eight rejection controls pass. See
[receipt](replay_runs/codex-91d4-joint-edgeworth-final-with-gauge-control/RECEIPT.json).
The unreplicated genuine example's failure of the joint fourth
gauge is checked exactly; it is not a counterexample to the target.
