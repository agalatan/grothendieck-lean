# Exceptional conditional rows

Agent-ID: codex-aa04.

The conditional-node table contains 21,577 node rows. Row i holds binary64
approximations of conditional Hermite coefficients for the degree-531 canonical
pairs `0 ≤ c ≤ 266`, `0 ≤ d ≤ 265`, `c ≤ d+1`, `c+d ≤ 531`, in `(c+d,c)`
order, restricted to `c+d ≤ cutoff_i`. A full row has 35,777 entries;
cutoffs 1 and 2 retain three and five entries. These truncations do not assert
that omitted true Gaussian coefficients vanish.

This certificate selects complete panels touched by the outward 128-bit
profile interval Horner screen: mark a source node when its computed interval
contains zero, then include every source node of every marked panel. There are
413 marked nodes (3873–4033, 10910–11037 and 17321–17444) in 381 panels
(146–274, 557–684 and 964–1087). Panel closure gives exactly 417 ordinals:
3872–4036, 10910–11037 and 17321–17444. It adds 3872, 4034, 4035 and 4036.
The selection is independent of the source degree cutoff: the full table has
1,837 rows of cutoff at most two, whereas the selected rows have cutoff 1 in
411 cases and cutoff 2 in six cases. The selected payload contains 1,263 words.

`exception-selection.json` contains the selection rule, its expected ranges,
the 12 integer coefficient intervals from `ProfileRootScreen.coeffs`, exact
panel endpoints/orders and Gauss root bounds. It pins the source-file hashes
and contains only the source fields used by this selection. For scale
`D = 2^128`, the node interval is obtained by outward rounding
`(lo + (hi-lo)(1+root)/2) D`. Each Horner multiplication takes the minimum
and maximum of the four endpoint products, then rounds outward after division
by D; coefficient intervals are added exactly. Zero containment includes both
endpoints. The generator replays all 21,577 nodes before selecting whole panels.
This is the selection used by the research diagnostic
`tools/q0_quadrature/check_source_exception_mass.py`; it is an external
selection calculation, not a Lean Gaussian sign or enclosure theorem.

`exception-centers.bin` concatenates the selected byte slices exactly.
`exception-centers.json` records source offsets, slice hashes and the
`full_source_sha256` provenance field. `conditional_offsets.npy` is the
21,578-entry source offset array. `exception-ledger.jsonl` contains per-row
records, including hashes and cutoffs; `exception-ledger-index.json` records
source-ledger byte positions and line numbers. `conditionalnodes_header.bin`
contains the source NPY header. The full-table digest is provenance metadata;
the generator checks the committed slices, offsets and per-row ledger without
reading or rehashing the full table. Neither the full table nor its digest is a
Lean premise.

The table producer is `build_conditional_nodes.py` in the research bundle
`grothendieck-140462-common-head`, at
`outputs/grothendieck-140462-common-head/build_conditional_nodes.py`
(SHA256 `e9ac9b8b911141cf683954c8acde3374918fff068002c18bf7d1a49fa3327efe`).
The recovery packet stores it as `source-packet/common-head/build_conditional_nodes.py`.
It produces all rows of `conditionalnodes.npy`, `conditional_offsets.npy` and
`conditional_node_ledger.jsonl`; the 417-row panel selection belongs to this
certificate. The ledger also contains claims such as `center_error_upper`.
The certificate uses selected indices, cutoffs and byte hashes; it neither
consumes nor validates those analytic error claims.

Reproduce this certificate with:

```sh
python3 tools/q0_quadrature/gen_source_exception_centers.py --check
```

The plain generator invocation writes exactly 16 center chunks and their
aggregate. `--check` compares those same 17 committed modules byte for byte.
The generator replays the selection, checks pinned input and row hashes, and
checks exact rational norms. Metadata-binding modules have a separate generator
in the source-address assembly; this generator does not emit them.

Lean checks the generated literals by `decide +kernel`. The decoder accepts
only normal binary64 words in its stated exponent range and proves exact
rational scalar magnitude at most one, complete row squared norm at most
121/100, and source byte-span bounds. The aggregate states the exact ordinal
coverage. The strict audit allows only the standard logical axioms.

Source-address alignment, numerical enclosures of actual Gaussian integrals,
physical quadrature weights and the final upper-bound assembly are separate.
The Python provenance and selection checks do not replace those Lean proofs.

`conditional_canonical_pairs.npy` supplies the complete degree-531 pair ordering.
Its producer is the same `build_conditional_nodes.py`; SHA256
`075eb8fe8a52766742c7ca82097171f8dfce173ac8dc9ed80193fc7821ee1ead`
is checked by `gen_conditional_pair_ranks.py`, which reproduces the finite
rank/ordinal certificate. Lean verifies the resulting literals.
