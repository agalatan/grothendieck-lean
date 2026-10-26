# Verification of the approved Haagerup inverse trim (#54)

The exact inverse polynomial is unchanged: its representation loses 64 trailing
zeros, from 129 to 65 rational coefficients. All other certificate fields and all
15 lemma/theorem declaration texts in `Grothe/Haagerup/Power.lean` are unchanged.
The public endpoint remains 1404909543/1000000000. No native fact is added or
removed. The 140-file caps digest remains
`fe2ea85d90646c9e01d46fd614051a61b2dd26399c585e39e620ab9d41f16eea`.

- `check_equivalence.py` / `equivalence.json`: reproducible exact rational and
  integer-interval comparison against Git commit `4e9f32d78a198da551239bbfa9e56e713d765cae`.
  Every output interval agrees after zero extension, both affected checks accept,
  and unchanged kernel sources are checked byte for byte. No other checkout is read.
- `replay.json` / `replay.log`: fresh independent full replay with python-flint 0.9.0
  at 192 bits. It checks byte-identical generated Lean data, the complete finite
  head, seed, exact defect and power norm, directed infinite tail, and endpoint.
  The recorded 4.437 seconds measures its finite-Horner phase only; it is not Lean
  native runtime.
- `kernel-build.log`: warning-free targeted build of the four arithmetic modules.
- `make_benchmark.py`, `native-benchmark.csv`, `native-benchmark-summary.json`:
  actual compiled Lean defect and seed kernels, explicitly loaded as native
  libraries. Both input lists are read through an IO reference for every call;
  five alternating batches of ten calls exclude import, compilation, warmup and
  printing. All 200 calls return true. Median defect time is 3.870 → 3.826 ms;
  median seed time is 52.566 → 52.551 ms. These shared-load measurements establish
  **no meaningful runtime improvement**, and do not time the unchanged full head.

The shortening saves 128 zero-branch traversals and 93 interval additions in the
inverse convolutions, with no reduction in interval multiplications. Defect list
length is 129 → 94; seed length stays 303. The generated Lean file loses 64 lines.

Full `PowerCheck`/`Power` builds and the aggregate axiom report are delivery-CI
checks; the external replay and focused benchmark above do not replace them.
Follow issue #54 for the delivery result. The historical native module build in
`docs/verification/haagerup-resolvent-20261025/native-build.log` took 522.95 seconds
wall / 509.46 seconds user CPU and matches the pre-trim source hash. That older
folder's manifest describes the baseline source tree, not the trimmed inputs;
verify it at commit `b5a23f06f919e11c18acc0dc4e97a7da78771b3f`.

`OVERVIEW.pdf` was rebuilt and visually checked: ten pages, nine pixel-identical,
only the actual-degree correction on page 5 changed. All bounds/hypotheses remain
unchanged. Its source retains one pre-existing bibliography underfull-box warning.

From the repository root:

```sh
python3 tools/gen_haagerup_power.py --check
python3 docs/verification/haagerup-trim-20261026/check_equivalence.py
python3 -I tools/verify_haagerup_power.py data/haagerup-resolvent/certificate.json --out handoff/haagerup-replay.json
python3 docs/verification/haagerup-trim-20261026/make_benchmark.py
lake build GrotheKernel.ResolventTail:dynlib
lake env lean --plugin=.lake/build/lib/lean/grothe_GrotheKernel_Basic.dylib --plugin=.lake/build/lib/lean/grothe_GrotheKernel_Haagerup.dylib --plugin=.lake/build/lib/lean/grothe_GrotheKernel_PowerTail.dylib --plugin=.lake/build/lib/lean/grothe_GrotheKernel_ResolventTail.dylib --run handoff/lean-audit/HaagerupPaddingBench.lean 10
shasum -a 256 -c docs/verification/haagerup-trim-20261026/SHA256SUMS
```

The benchmark command uses macOS `.dylib` files; on Linux use `.so`.
The manifest binds current certificate/generator/kernel/proof sources and this
verification record. Changes to those sources require a fresh record.
