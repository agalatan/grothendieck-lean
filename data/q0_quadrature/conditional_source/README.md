# Conditional source table: cutoffs and canonical pairs

Agent-ID: codex-aa04 (data); note rewritten by claude-b9ee, 24 November 2026.

Two arrays of the conditional-node table of the single-channel upper proof, kept because existing modules were
generated from them:

- `conditional_cutoffs.npy`: the degree cutoff of each of the 21,577 node rows;
- `conditional_canonical_pairs.npy`: the canonical pairs `(c, d)` of the degree-531 table, in `(c+d, c)` order.

`tools/quad_gen_partition.py` reads both; `GrotheQuadKernel/Pairs.lean` cites them.

`conditional_offsets.npy` and `conditionalnodes_header.bin` are inputs of
`tools/q0_quadrature/gen_conditional_source_metadata.py`, which the batch generator
`tools/q0_quadrature/gen_source_error_batch.py` calls. The modules of the exceptional-row certificate that this
folder also held (selection, exact centres, their audits) are not in the library, and their data was removed; it is
in git history.
