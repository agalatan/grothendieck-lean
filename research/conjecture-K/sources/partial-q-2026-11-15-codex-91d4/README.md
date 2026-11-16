<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/partial-q-replacement/README.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Partial-q continuation with non-diffuse odd fields

Agent-ID: **codex-91d4**. Refs #436. For **claude-b9ee** to review.

Read [REPORT.md](REPORT.md), then [PROOF_NOTES.md](PROOF_NOTES.md).
The strongest all-covariance consequence is proved in
[ANISOTROPIC_REFERENCE.md](ANISOTROPIC_REFERENCE.md).
The main comparison keeps A/B/Q/P jointly exact, including rank-one
Q/P and arbitrary sharing. It does not assume small joint Gamma
quantities. The explicit regional corollaries still require a small
marginal fourth cumulant of q. The full caps-only gap remains open.

## Clean replay

From this folder, using a fresh environment path:

```sh
python3 -m venv /tmp/codex-91d4-partial-q-review-env
/tmp/codex-91d4-partial-q-review-env/bin/python -m pip install -r requirements.txt
/tmp/codex-91d4-partial-q-review-env/bin/python -I -B replay.py --numerics
```

The record uses Python 3.12 and python-flint 0.8.0. No NumPy, SciPy,
Lean build, neighboring handoff, copied environment or external job
is required. Installation needs the package index; verifier runtime
is offline. All mathematical parameters are rational literals in
the bundled programs. No saved result is an acceptance input.

The driver copies only the checker scripts into an independent
temporary directory, regenerates all certificates and writes logs,
source/output hashes, versions, timings and a receipt to a new
`replay_runs/` directory. Existing destinations are refused.
`--output PATH` selects a new destination. `--hashes-only` needs only
the standard library. `--numerics` adds the cheap Phase 0 selector,
which remains N and never feeds acceptance.

## Verification scope

- `verify_interpolation.py`: exact tensor contractions, Hermite
  products, variance/fourth-cumulant identities and the shared
  interpolation derivative on polynomial tests through degree8.
  Mixed moments are explicitly nonzero. Both nu components are
  retained in the shifted tests.
- `verify_reference.py`: fresh Arb integration on [0,64], analytic
  tails and uniform energy interpolation prove five reference-price
  bounds for u in [.040,.041].
- `verify_budget.py`: exact regional cap and payoff budgets, two
  shared rank-one-odd examples outside the old joint gauge, and a
  larger-nu example with positive A/B covariance.
- `verify_anisotropic.py`: the directional reference bounds, exact
  all-covariance PSD test and coupled Young budget. It covers all
  lower energies at small chi, and the old hard tuple at a larger
  cutoff, without assuming odd diffusivity.
- `PROOF_NOTES.md`: the dimension-independent analytic argument,
  endpoint convergence, mixed contraction estimates and Gaussian
  reference accounting. This is author-level P, not a Lean proof.

Thirteen rejection controls check optimized Python in each checker,
omitted mixed coupling, an omitted nu component, incorrect circular
kurtosis normalization, a false reference price, an excessive chi
and a caps-only inference. Additional controls reject an insufficient
matrix bound, an excessive global chi and spending the odd cost
twice. Failure text is checked as well as the
nonzero exit code.

Source manifests exclude replay trees, which have their own frozen
manifests and receipts. Initial author records are retained but not
imported. No parent review approves this new packet automatically.

Final isolated replay: **2.490 seconds**, all four scoped checkers
and thirteen rejection controls pass; the optional N selector is
also recorded. See the
[receipt](replay_runs/codex-91d4-partial-q-all-covariances/RECEIPT.json).
The earlier 2.855-second receipt precedes the anisotropic extension
and is retained only as a development record.
