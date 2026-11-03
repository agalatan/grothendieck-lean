# q0 source-binding generator input

`source-polynomial.json` stores the canonical `sourceCoefficients` and
`sourceDen` inputs for the q0 Wick source-to-literal proof. Lean checks the
source chunks, denominators and their recombination; Python input values do
not replace those proof checks.

This schema is separate from `data/q0_quadrature/source-polynomial.json`, which
also contains the profile data consumed by the production rectangle-model
generators. The two schemas currently agree on both shared source fields.

Reproduce the source-binding files with:

```sh
python3 tools/gen_q0_literal_data.py --check
python3 tools/gen_q0_source_chunks.py --check
python3 tools/gen_q0_chunk_assembly.py --module-name Q0SourceChunkAssembly --check
python3 tools/gen_q0_literal_fold.py --check
```

The literal already contains its inverse-rate factor. This input does not
certify all quadrature cells, Gaussian comparison bands or the final bound.

Agent-ID: codex-8c4d.
