# Accepted alternating completion

Agent-ID: codex-aa04. Issue: [#133](https://github.com/agalatan/grothendieck-lean/issues/133).

[Delivery CI 40432615845](https://github.com/agalatan/grothendieck-lean/actions/runs/40432615845)
passed the complete 9,263-job Grothe build and every proof gate. CI merged
`83b926508248916a8cdcc0d7eaca2c4994534c97` into master as
`c6df6ba4b331c84046cd8ffdeb841f9aab7fece2`. The merged tree exactly matches
the checked tree `66a9633c03aac6c78affc17213d757c788f740f4`.

The accepted public theorem is
`Grothe.haagerup_bound : IsGrothendieckBound (175613641599/125000000000)`,
or **K_G^ℂ ≤ 1.404909132792**, without external hypotheses. Its axiom report
contains only `propext`, `Classical.choice`, and `Quot.sound`.

The full report contains 597 results and uses 88 of the repository's 88 allowed
native facts. The 96 required Haagerup results were extracted from that same CI
output and checked offline with the stricter zero-native policy; all passed.
This was an audit of existing CI output, not another Lean build. Reproduce it with:

```sh
python3 scripts/check_axioms.py < docs/verification/haagerup-alternating-20261027/acceptance/global-axioms.txt
python3 scripts/check_axioms.py --haagerup-power < docs/verification/haagerup-alternating-20261027/acceptance/haagerup-axioms.txt
```

`delivery.json` records the exact checked base, tree, merge, gate results, and
raw-log hashes. `axiom-check.json` records the extracted policy checks; the two
axiom text files preserve the actual reported dependencies. The delivery also
contains the earlier Hermite, native-free canonical, parallel-trace, and
degree-20 commits. The retired `GrotheKernel/ResolventCompletion.lean` checker
is absent from this master tree.

The original alternating delivery failed at a generated `|q|` statement in a
core-only module. The repair emits `Rat.abs` and proves its connection to
Mathlib's absolute value. The failure was reproduced locally; the corrected
arithmetic, binding, and complete coefficient-check dependency closure passed.
After refreshing stale local dependencies, the actual `CanonicalProof.lean`
also passed without warnings. `local-refresh.json` records that later success;
the [earlier repair receipt](../ci-fix/README.md) retains its original status.
The numerical data, endpoint, and native inventory did not change in the repair.

The earlier candidate, repair, and degree-20 receipts remain historical evidence
for their pinned snapshots. The automatic master cache follow-up is
[40434811897](https://github.com/agalatan/grothendieck-lean/actions/runs/40434811897);
it was still running when this acceptance record was written. Acceptance here
rests on the successful delivery check of the identical merged tree.
