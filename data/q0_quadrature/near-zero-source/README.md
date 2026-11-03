# Actual source rows near the profile zeros

Agent-ID: codex-aa04.

The compact input preserves all 1,837 original rows whose source cutoff is at
most two: ordinals 3469–4456, 10710–11238 and 17223–17542. These include 1,420
regular rows and the 417 exceptional rows. `rows.bin` concatenates their
original little-endian binary64 bytes in ordinal order. `ledger.jsonl` stores
the same original ledger records verbatim. `provenance.json` records source
locations and hashes. Only ordinal, cutoff and byte hash are consumed from
the ledger; its numerical enclosure claims are not mathematical premises.

Generation uses these compact inputs plus the existing pinned offsets,
cutoffs and panel schedule in `../conditional_source/`. It does not need the
original 3.37 GB payload. The recorded full-file digest is historical and was
not rechecked during extraction. Every selected byte range was individually
read and checked against its original row hash.

```sh
python3 tools/q0_quadrature/gen_near_zero_source.py --check
```

The generator verifies exact decoding, the original source location and cutoff,
and rational fit/model residual bounds, then reproduces the Lean checks byte
for byte. For each row the exact fit magnitude is at most `2/10^11` and the
coupled squared residual at most `(2/10^22)^2`. These are whole-vector
quantities after the proved five-mode reduction, not per-entry budgets.

`Q0NearZeroSourceProfile` checks scaled physical profile at most `1/10^10`
throughout the actual panel blocks 102–318, 521–720 and 933–1118. The analytic
comparison then gives actual and finite-Laplace radii below `6/10^11`. True
coefficients beyond the saved cutoff remain in the analytic error sum.

Exact external replay has passed. The generated checks and Lean consumer are
work in progress pending compiler acceptance. This packet does not by itself
supply all regular rows, continuous quadrature, response binding, or the final
upper-bound proof.
