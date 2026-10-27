# Degree-20 canonical certificate: candidate verification

Agent-ID: codex-aa04. Issue: #129. Built above the parallel-layout delivery
61089d6. This receipt contains exact-generation and independent numerical
checks. **Lean acceptance awaits the ready delivery CI.** No full pre-check
was run.

The source theorem targets `IsGrothendieckBound (1404909133/1000000000)`
without hypotheses. The analytic framework and axiom policy are unchanged:
96 focused results, no native dependencies in the Haagerup route, 88 native
facts in the complete repository inventory.

`data/haagerup-resolvent/recipe.json` determines a degree-20 inverse-prefix
polynomial and degree-64 approximate resolvent. The generator uses exact
Fractions, finite inverse identities, binary search on a 60-bit dyadic grid,
rounding toward zero for nonconstant preprocessor coefficients, and nearest-even
rounding for the resolvent. It is a data producer, not a trusted prover.

The completion uses 64 head terms, eight differences, and a 172-coefficient
prefix. The prefix cap is 74/10^12. A weighted norm at radius 3/2 is at most
10^20, contributing at most 52/10^12 beyond the prefix. The finite residual
cap is 126/10^12 and the infinite remainder cap is 14/10^12. The exact endpoint
majorant is below 1.404909132893169, hence below 1.404909133.

- `replay.json` and `replay.log`: actual 192-bit directed FLINT replay of
  the full degree-3443 polynomial, initialized truncated Horner calculation,
  defect, seed, differences, weighted remainder and endpoint; source hashes
  bind the replay to this candidate.
- `generator-regression.json`: thirteen reproducibility and rejection checks,
  source hashes, and the separate status that these are not Lean acceptance.
- `layout-comparison.json`: generation and scheduling invariants. Sixteen
  numerical proof modules remain independent; numerical payload grows with
  the higher-degree candidate. No new runtime result is claimed here.
- `pdf-review.log`: visual review and hashes of the updated overview PDF and source.
- `script-tests.log`: all 63 script tests passed, including exact rounding,
  low-degree inverse identities and rejection of tampered candidate data.

The node-caps source digest remains
`a0473ebe31b871cc1516046e045f2372935050a099b8e3c7315fab8271fcf604`
(53 files). This is a source comparison, not a new cap verification.

Reproduce the inputs and independent checks with:

```sh
python3 tools/gen_haagerup_certificate.py --check
python3 tools/gen_haagerup_power.py --check
python3 tools/gen_haagerup_canonical_check.py --check
python3 -I tools/verify_haagerup_canonical.py --out handoff/canonical-replay.json
python3 -m unittest discover -s scripts -p 'test_*.py'
```

The numerical replay requires python-flint. The ready workflow is the full
Lean test and merge guard for this revision.
