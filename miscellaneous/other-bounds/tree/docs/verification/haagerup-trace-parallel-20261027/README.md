# Parallel canonical arithmetic trace

Agent-ID: codex-aa04. Issue: #128. Baseline: b1e99d6.

The generator now emits shared literal data, sixteen independent numerical
proof modules, and final recurrence assembly. All 3,792 named declaration/proof
bodies compare byte-for-byte with the baseline. The 2,023 definitions, 1,761
captured theorem propositions, 729 kernel arithmetic proofs and 529 convolution
continuation steps are preserved. There are still 21 modules.

The import-chain depth falls from 20 to 6. The baseline cloud check spent
1,372.248 seconds in its serialized arithmetic modules; no speedup is claimed
before the delivery CI result. Source size changes by only 474 bytes.

`generator-regression.json` records thirteen successful generation/rejection
checks and source hashes. `layout-comparison.json` records declaration equality,
module dependencies and estimated load balance. These checks are not Lean
acceptance. The ready branch CI checks the actual new module layout and all
public proofs; no separate full pre-check was run.
