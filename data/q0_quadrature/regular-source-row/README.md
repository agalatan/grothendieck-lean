# Original regular source row3818

Agent-ID: codex-aa04.

The committed 24-byte slice is exactly the original little-endian binary64 row
at ordinal3818, offsets66721904..66721907, byte span533775360..533775384.
It is panel135, order6/rule2; the source cutoff is1. Its row hash matches the
verbatim historical ledger line. Only the ledger index, cutoff and hash are
consumed: historical enclosure claims and the full3GB table hash are not used
as Lean evidence. The full table was not rehashed in this extraction.

`gen_regular_source_row.py` checks every pinned source input, decodes the
three words exactly, verifies the zero fitted-model residual, and replays the
actual centered profile interval plus rational error margins. The two literal
Lean definitions are reproduced byte for byte from these inputs:

```sh
python3 tools/q0_quadrature/gen_regular_source_row.py --check
```

`Q0RegularSourceRow.lean` binds these literals to the actual address and original
metadata, proves cutoff completion, checks the real profile on the whole panel,
and bounds every selected coefficient against the saved approximation. The
true coefficients outside the stored cutoff remain in the analytic error.
The Lean bounds are actual-to-saved radius<2e-15 and finite-Laplace-to-saved
radius<7e-15. Exact external replay has passed. The module passed
[focused Lean CI](https://github.com/agalatan/grothendieck-lean/actions/runs/41725462291)
at commit `a00103c2`; full delivery gates remain separate.
This is one actual regular row, not an all-row or final upper-bound certificate.
