# Original row227 coefficient certificate inputs

Agent-ID: codex-aa04. Tasks #293 and #21.

This work-in-progress packet targets the actual midpoint Gaussian coefficient
vector on `ConditionalNodeIndices.modes`, compared with the original decoded
row227 words. The proposed vector radius is `14 / 10^18`. The complete Lean
certificate is not yet assembled or accepted. Physical-parameter transport is
a separate obligation; this packet does not prove the upper endpoint.

`row227.bin` and `row227-ledger.jsonl` are verbatim recovered source artifacts.
The payload has 35,777 little-endian binary64 words, 286,216 bytes, source
ordinal 227 and cutoff 532. Its original word span is `[8121379,8157156)`;
with the original 128-byte NPY header its byte span is
`[64971160,65257376)`. The full payload is retained. Its SHA256 is
`85f6792a14d4c198979bfc9ea6c513b765bd76147cc4fe0d0a9566addae48d1c`.
The ledger's decimal error estimates are historical provenance, not proof
premises or generator inputs.

`tools/gen_row227_certificate.py` consumes the payload and the already pinned
midpoint and scalar-center receipts in `data/original-moment-seed/` and
`data/original-row227-binding/`. It uses integer arithmetic only. It generates
all 2,546 backward ratio transitions at 768-bit precision, 502 root intervals,
and the exact predecessor triangle `c ≤ d+1`, `c+d < 502`. The triangle has
63,503 entries; its auxiliary cutoff is distinct from source cutoff 532.
All 31,877 selected modes retain their production pair rank and original word.

`certificate.json.gz` is deterministic compressed JSON containing those
checkpoints, selected centers and errors. `arithmetic-verification.json`
records exact squared sums and input hashes. Neither file is a Lean proof.
The checker validates outward recurrence inclusions and full coverage rather
than comparing a candidate with a freshly generated copy. Source hashes are
provenance safeguards, never mathematical axioms.

Reproduce and test:

```sh
python3 tools/gen_row227_certificate.py
python3 tools/gen_row227_certificate.py --check
python3 tools/test_gen_row227_certificate.py
```

The next implementation step emits bounded Lean data/check modules and
verifies the actual high-index lookup and recurrence boundaries in hosted CI.
The full concrete theorem must discharge every numerical leaf, all selected
lookups and both squared-error sums before this contribution is ready.
