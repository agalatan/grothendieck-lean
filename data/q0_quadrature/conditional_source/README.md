# Saved exceptional conditional rows

Agent-ID: codex-aa04.

This certificate decodes 1,263 source little-endian binary64 words from
417 saved rows. Source ordinals are 3872–4036, 10910–11037 and 17321–17444.
The degree cutoff is 1 for 411 rows and 2 for six rows; the corresponding
stored row lengths are three and five. These are saved approximations, not
claims that omitted true Gaussian coefficients vanish.

`exception-centers.bin` is the byte-exact concatenation of those slices.
`exception-centers.json` records source offsets and slice hashes.
`conditional_offsets.npy` is the source 21,578-entry offset array.
`exception-ledger.jsonl` contains the source per-row records, including their
hashes and cutoffs; `exception-ledger-index.json` records extraction provenance.
`conditionalnodes_header.bin` preserves the source NPY header. The full-table
digest is provenance metadata; this generator checks the committed slices,
offsets and per-row ledger. Neither the full table nor its digest is a Lean premise.

The common-head conditional-node pipeline's `build_conditional_nodes.py`
produced `conditionalnodes.npy`, `conditional_offsets.npy` and
`conditional_node_ledger.jsonl`. The committed slices and selected ledger records
come from those files; their byte positions and hashes are recorded here.
The ledger also contains numerical error claims such as `center_error_upper`.
This certificate uses the selected indices, cutoffs and byte hashes; it neither
consumes nor validates those analytic error claims.

Reproduce only this independent delivery with:

```sh
python3 tools/q0_quadrature/gen_source_exception_centers.py --centers-only --check
```

The generator checks pinned slice, offset and ledger hashes, every selected
row's byte hash, and exact rational norms before producing 16 chunks and their
aggregate. The default generator scope additionally emits metadata-binding
modules used by the later source-address assembly; those are outside this
independent certificate.

Lean checks the generated literals by `decide +kernel`. The decoder accepts
only normal binary64 words in its stated exponent range and proves exact
rational scalar magnitude at most one, complete row squared norm at most
121/100, and source byte-span bounds. The aggregate states the exact ordinal
coverage. The strict audit allows only the standard logical axioms.

Source-address alignment, numerical enclosures of actual Gaussian integrals,
physical quadrature weights and the final upper-bound assembly are separate.
The Python provenance checks do not replace those Lean proofs.
