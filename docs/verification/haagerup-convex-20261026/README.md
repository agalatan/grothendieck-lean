# Second-Abel Haagerup bound verification

Agent: `codex-aa04`. Work branch: `codex/haagerup-convex-ready`.
Ready branch: `ready/codex-haagerup-convex`. Combined master: `0effd0330fa5f76d6e68750d6cfa9cbec8510ccf`. Issue: #112.

The public theorem `Grothe.haagerup_bound` proves
`IsGrothendieckBound (1404909409/1000000000)` with no hypotheses.
The written argument is in `docs/research/haagerup-power.tex` and
`docs/HAAGERUP_POWER.md`.

The normalized Haagerup coefficients have decreasing nonnegative first
differences and tend to zero. A second Abel summation and coefficient locality
bound the entire tail by 87.7·10⁻⁹. The finite residual cap is 95·10⁻⁹.
The native certificate still checks its original Abel allowance, 174·10⁻⁹;
Lean derives the stronger allowance from it using exact arithmetic.

`data/haagerup-resolvent/certificate.json`, its generated `PowerCheck.lean`,
and the native-fact inventories are byte-identical to the combined master.
The certificate's `upper` metadata is its original baseline endpoint;
the replay separately binds the strengthened cap and endpoint to `Power.lean`.
There is no new numerical hypothesis or native fact.

## Evidence and reproduction

- `build.log`: warning-free targeted Lake build of the changed modules and their concrete importer.
- `axioms.log` and `axioms-check.log`: 55 reported theorems; only the standard
  axioms and the existing `Grothe.HaagerupPower.check` native fact are permitted.
- `replay.json` and `replay.log`: complete directed FLINT replay of the finite
  head and short seed, exact inverse defect and power budget, unchanged native
  allowance, refined allowance, and public endpoint.
- `script-tests.log`: repository script tests, including parsing the current
  saved multiline axiom report.
- `root-check.log`, `data-check.log`, and `caps-check.log`: generated imports,
  exact data binding, and source equality of all 54 caps-closure files with master.
  No cap-cache verification or marker write is claimed.
- `pdf-review.log`: regenerated merged overview and visual layout review.
- `SHA256SUMS`: source files and verification artifacts at delivery.

```sh
LEAN_NUM_THREADS=1 lake --wfail build Grothe.Haagerup.Power
lake env lean -j1 scratch/AxiomsPower.lean > handoff/convex-axioms.log
python3 scripts/check_axioms.py --haagerup-power < handoff/convex-axioms.log
python3 -I tools/verify_haagerup_power.py data/haagerup-resolvent/certificate.json --out handoff/convex-replay.json
python3 -m unittest discover -s scripts -p 'test_*.py'
python3 tools/gen_haagerup_power.py --check
python3 tools/gen_root_imports.py --check
python3 scripts/caps_stamp.py --digest
```

The replay requires `python-flint` (version 0.9.0 in this receipt).
This records targeted local validation of the combined ready tree. The normal
ready-branch workflow runs the full merged-tree build and default axiom audit
before automatic merge. Those CI results are separate from this local receipt.
The user explicitly requested that delivery workflow. No manual droplet job is
needed for this unchanged caps closure. The caps digest is
`3bf3f36f1aa49fe345e655971cd99364aaf736fb0f101b298884703df3a2ef0f`
for 54 files.
