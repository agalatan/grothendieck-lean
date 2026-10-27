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

Fresh CI [run 40247044009](https://github.com/agalatan/grothendieck-lean/actions/runs/40247044009)
passed at `752473bc11444f3869c33953e5219c4ed2d52aa7`. With no project build-cache
hit, it built `Grothe.Haagerup.PowerCheck` in 438 seconds and `Grothe.Haagerup.Power`
in 10 seconds, completed the aggregate build and forbidden-code scan, accepted
424 axiom records (18 of 78 allowed native facts), and passed the unchanged
140-file caps stamp.

Subsequent full validations passed on the primary branch at `a0341d7`
([run 40250530009](https://github.com/agalatan/grothendieck-lean/actions/runs/40250530009))
and merged master at `08e55bb`
([run 40251214852](https://github.com/agalatan/grothendieck-lean/actions/runs/40251214852)).
Both missed the project build cache and freshly built `PowerCheck` and `Power`:
372 / 9.8 seconds on the primary branch, 297 / 7.0 seconds on master. Both accepted
435 axiom records (18 of 78 allowed native facts), passed the forbidden-code scan
and unchanged caps stamp, and completed the aggregate build. Master additionally
passed the generated root-import and sorted-list check. Neither run emitted a
Lean diagnostic warning; each reported two infrastructure deprecations. Mathlib's
8,908 cache files were downloaded; the separate caps target was not rebuilt.

The five affected files—`Power.lean`, `PowerCheck.lean`, the certificate JSON and
its README, and `gen_haagerup_power.py`—are byte-identical across all three verified
trees, trim delivery `1f49d089`, and the current verification record. The fresh
`PowerCheck` builds execute the complete native certificate check. These module
times are observations, not a before/after performance comparison. The results
certify the named trees; validation of subsequent proof changes is recorded
separately. The external replay and focused benchmark do not replace Lean build
and axiom checks.

The historical native module build in
`docs/verification/haagerup-resolvent-20261025/native-build.log` took 522.95 seconds
wall / 509.46 seconds user CPU and matches the pre-trim source hash. That older
folder's manifest describes the baseline source tree, not the trimmed inputs;
verify it at commit `b5a23f06f919e11c18acc0dc4e97a7da78771b3f`.

The `OVERVIEW.pdf` at merge-repair commit
`beaa19555cd03034f63012185507bff56546efad` was regenerated from the merged
`docs/overview.tex` after the phase-geometry documentation merge; all ten pages of
that PDF were visually reviewed. The regeneration preserves the stated bounds and
hypotheses. That source retains one pre-existing bibliography underfull-box warning.

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
