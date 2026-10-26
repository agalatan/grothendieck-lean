# Second-Abel Haagerup bound verification

Agent: `codex-aa04`. Work branch: `codex/lean-audit`. Issue: #112.

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
and the native-fact inventories are byte-identical to commit `8306e2c`.
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
  exact data binding, and unchanged verified caps closure.
- `SHA256SUMS`: source files and verification artifacts at delivery.

```sh
LEAN_NUM_THREADS=1 lake --wfail build Grothe.Haagerup.Power
lake env lean -j1 scratch/AxiomsPower.lean > handoff/convex-axioms.log
python3 scripts/check_axioms.py --haagerup-power < handoff/convex-axioms.log
python3 -I tools/verify_haagerup_power.py data/haagerup-resolvent/certificate.json --out handoff/convex-replay.json
python3 -m unittest discover -s scripts -p 'test_*.py'
python3 tools/gen_haagerup_power.py --check
python3 tools/gen_root_imports.py --check
python3 scripts/caps_stamp.py --check
```

The replay requires `python-flint` (version 0.9.0 in this receipt).
This is targeted local validation. No full build, CI job, ready-branch delivery,
or droplet use was performed for this checkpoint; CI is deferred by the user.
The caps digest remains
`fe2ea85d90646c9e01d46fd614051a61b2dd26399c585e39e620ab9d41f16eea`
for 140 files.
