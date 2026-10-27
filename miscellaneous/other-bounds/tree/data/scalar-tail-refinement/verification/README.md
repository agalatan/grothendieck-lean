# Scope and replay of the scalar-tail evidence

The parent [proof](../PROOF.md) derives the ordinary mathematical
`K_G^C<1.4048984303` corollary from explicit published scalar inputs and the
exact power16 bound with per-index tail weights. The companion Lean module proves the refinement
and numerical-input implication; this evidence does not create a new
unconditional Lean Grothendieck endpoint.

The archive contains:

- `UPSTREAM_REPLAY.json`: byte-preserved receipt for four successful
  upstream non-regeneration stages, including versions and timings.
- `upstream-logs/`: their complete byte-preserved outputs. The original
  receipt retains its remote absolute log paths; local copies are located
  by the identical basenames and checked against their recorded hashes.
- `UPSTREAM_MANIFEST.json`: all 19 source/data URLs and SHA pins at commit
  `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`, including the two interval
  tables. These are metadata, not copies of the upstream files.
- `REPLAY_DRIVER.py`: our byte-preserved bounded replay driver, whose hash
  is bound by the receipt. It verifies the pinned sources before running
  each stage, with one thread and a 115-second stage timeout.
- `SCALAR_BRANCH5.json`: exact polynomial input used by the independent
  power audit, extracted from the canonical source without executing it.
- `POWER16_ARITHMETIC_AUDIT.json`: independent integer norm and Fraction
  ledger replay for the earlier uniform-weight estimate. The verifier preserves that archive and separately recomputes the current weighted ledger. Its power135 discussion is informational; the checked
  delivery uses power16 only.
- `verify_receipts.py`: a standard-library verifier of this archive's
  hashes, stage scope, exact power16 arithmetic, the weighted split at 160, and correspondence to
  the production `certificate.json`. It does not execute upstream code.
- `SHA256SUMS`: hashes of the packaged evidence, current proof and verifiers. The upstream receipts and logs are preserved byte for byte.
  `RECEIPT_CHECK.json` is the resulting verification report and binds the
  production certificate by hash; it is excluded from the input manifest.
- `LEAN_BUILD.json` and `production-*.log`: the successful targeted
  production build of the earlier source revision, its source/dependency hashes, and all 16 scalar-tail
  axiom reports. All sixteen results use only standard axioms; the polynomial
  power is checked by `decide +kernel`, without native axioms. The report verifier
  rejects any scalar-tail native registry entry or native report dependency.
  This archived receipt does not certify the current weighted-tail source. Its recorded source hashes identify exactly what was built. This is targeted module
  coverage; CI checks the complete root target and full axiom report.
- `WEIGHTED_BUILD.json` and `weighted-build.log`: the complete generated weighted-tail module passed focused CI at commit `1cc7f65`. The source hashes are checked against that historical commit, not against later revisions.
  Replaying this source binding requires a Git checkout containing that commit.
- `verify_lean_report.py`: consumes the entire archived report through the
  repository's strict parser, checks all 16 names and both registries, and
  rejects any foreign native fact. It checks a report; it does not rebuild.

From the repository root:

```sh
python3 -B -I data/scalar-tail-refinement/verification/verify_receipts.py --out data/scalar-tail-refinement/verification/RECEIPT_CHECK.json
shasum -a 256 -c data/scalar-tail-refinement/verification/SHA256SUMS
python3 -B -I data/scalar-tail-refinement/verification/verify_lean_report.py
```

This checks the archive and exact arithmetic. It does not rebuild Lean,
regenerate coefficient tables, or prove that the published interval tables
enclose their stated integrals. The successful upstream replay consumed
the two pinned tables and recomputed their derived bounds. It also freshly
computed the origin polynomial/energy and scalar contour certificates;
the coefficient-table generators themselves were not rerun.

To repeat the upstream computation, obtain the exact files identified by
the manifest in a separate directory. The pinned driver checks all 19
entries, although the minimal runtime dependency subset is 13 Python
files and two NPZ tables. Run it on the droplet in an owned process group:

```sh
python3 REPLAY_DRIVER.py --root /path/to/pinned-upstream --manifest UPSTREAM_MANIFEST.json --out NEW_REPLAY.json --logs NEW_LOGS
```

Use Python 3.12 with NumPy and python-flint 0.9.0 or newer. The archived
stages completed successfully; their individual times are in the receipt.
New runs must preserve the one-thread/time-limit discipline and use new
output paths. A partial or timed-out receipt is not a successful replay.

To reproduce the targeted formal check in an owned build directory, use
the repository's pinned toolchain and packages, build
`Grothe.Haagerup.ScalarTailRefinement`, and print the 16 declarations listed
in `verify_lean_report.py`. Pass that complete output to the same verifier.
The production source is generated by
`python3 tools/gen_scalar_tail_refinement.py`; its `--check` and `--self-test`
options replay exact arithmetic and generator controls without compiling.

No upstream Python source or NPZ table is vendored. The pinned repository
contains no explicit LICENSE/COPYING/NOTICE file, and no code license was
identified. This package preserves references and verification evidence
without inferring a redistribution license from public availability.
