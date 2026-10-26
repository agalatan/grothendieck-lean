# Canonical Haagerup upper-bound verification

Agent: `codex-aa04`. Work branch: `codex/lean-audit`. Issue: #113.
Combined master: `624e4845bd943c9954d17285d1eb0cee96424389`.
Cloud-checked commit: `f7d9773e036ccdc3a2acf4e441f7ba4dd465d678`.
Cloud-checked Git tree: `2dea4dbfc59b0978b12fe95e0c9f2ec72788a0b7`.
Full check: [40410959319](https://github.com/agalatan/grothendieck-lean/actions/runs/40410959319) (completed successfully).

`Grothe.haagerup_bound` proves
`IsGrothendieckBound (1404909140/1000000000)` without hypotheses.
Its axiom dependencies are only `propext`, `Classical.choice`, and `Quot.sound`.

Complete monotonicity of the Haagerup coefficients controls every order of a
finite resolvent completion. The concrete proof combines 64 series terms and
six signed correction terms before taking absolute values. The finite residual
cap is 9.14e-9 and the infinite remainder cap is 0.24e-9. A checked prefix of
170 coefficients contributes at most 9.136e-9. Scaling the finite polynomial
by X ↦ (3/2)X gives a weighted norm at most 10^18, so its omitted coefficients
contribute at most 4e-12. Independent full-polynomial replay finds degree 2399.

The four finite checks are assembled from literal arithmetic steps proved by
`decide +kernel`, recurrence lemmas, and bindings to the mathematical data. Lean checks
every generated equality; the generator is not trusted. The obsolete native
`PowerCheck.lean` is removed. Its six required exact inputs are generated in
`PowerData.lean` from unchanged certificate JSON. The global native allowlist
removes exactly that one fact, decreasing from 84 to 83. The new arithmetic
module is outside the precompiled kernel library, which remains unchanged.

## Evidence

- `cloud-run.json`, `cloud-summary.json`, `cloud-build.log`: successful GitHub-hosted
  full `Grothe` build and global axiom audit on the exact commit above, using the
  verified master caps cache. No manual droplet job was used.
- `cloud-axioms.txt`, `global-axioms-check.log`: all 588 requested global reports,
  each present exactly once and accepted by the strict global axiom checker.
- `cloud-source-snapshot.json`, `cloud-evidence.json`: checked Git tree, proof-source
  and workflow hashes, artifact hashes, run identity, and exact audit counts.
- `trace-generator-regression.json`: 13 generator reproducibility and rejection
  checks, with source hashes; this is separate from Lean acceptance.
- `axioms.log`, `axioms-check.log`: 96 records extracted verbatim from that global
  cloud report, zero native axioms allowed or used. The parser rejects missing
  results, diagnostics, and foreign axioms.
- `replay.json`, `replay.log`: independent 192-bit directed FLINT replay of every
  completed coefficient, actual truncated-Horner output, seed, inverse defect,
  finite differences, weighted finite-tail bound, infinite remainder, and endpoint. Source and data hashes are included.
- `script-tests.log`, `script-tests.json`: repository script tests rerun during
  finalization, with the actual extracted cloud report, zero exit status, fixture
  and script-source hashes, and rejection of the old native fact in the focused mode.
- `root-check.log`, `data-check.log`, `trace-data-check.log`: generated imports,
  exact certificate binding, and byte-for-byte trace regeneration.
- `pdf-review.log`: rendered overview pages inspected for layout and clipping.
- `caps-source-check.log`: all 53 cap-closure source files match the combined
  master. This is a source comparison, not a new cap-cache verification.
- `SHA256SUMS`: proof sources, policies, documentation, and these receipts.

```sh
scripts/cloud.sh --ref codex/lean-audit check
python3 scripts/check_axioms.py < docs/verification/haagerup-canonical-20261026/cloud-axioms.txt
python3 scripts/check_axioms.py --haagerup-power < docs/verification/haagerup-canonical-20261026/axioms.log
python3 -I tools/verify_haagerup_canonical.py --out handoff/canonical-replay.json
python3 -m unittest discover -s scripts -p 'test_*.py'
python3 tools/gen_root_imports.py --check
python3 tools/gen_haagerup_power.py --check
python3 tools/gen_haagerup_canonical_check.py --check
python3 scripts/caps_stamp.py --digest
```

The independent replay requires python-flint (0.9.0 in this receipt).
The final acceptance evidence is the successful cloud check of the exact source
snapshot above. Earlier targeted local builds preceded the arithmetic-module move
and native-check retirement and are not used to certify this layout. The normal
ready-branch workflow separately checks the eventual merged tree before automatic merge.
The caps digest is
`a0473ebe31b871cc1516046e045f2372935050a099b8e3c7315fab8271fcf604` (53 files).
