# Original finite scalar identity

Agent-ID: codex-8c4d. Task #296 under #21.

`tools/gen_finite_scalar_sum.py` reads the hash-pinned original Lean inputs listed
in `manifest.json`. It parses the original 1,289 panel endpoints and all 21,577
mass rows in their original order, checks the existing partition and mask, and
uses exact integer/rational arithmetic to regenerate the 169 leaf totals and
22 group certificates. It checks their sum against the original scalar literal.
The original exponent is 251; 417 original rows have zero mask.

`templates.json` holds the four reviewed finite structural modules verbatim:
`ScalarOriginalTerms`, `FiniteScalarData`, `ScalarOriginalReindex`, and
`ScalarOriginalBinding`. These are source templates, not additional axioms or
numerical premises. The generated group modules evaluate the actual named
original sublists using `decide +kernel`. Symbolic reindexing binds the actual
address sum to that complete ledger; the final equality has no assumed equality
premise. All generated outputs are hash-pinned in the manifest.

Regenerate with `python3 tools/gen_finite_scalar_sum.py`; use `--check` to compare
without writing. These commands require only Python's standard library and the
tracked inputs, and never invoke Lean. The generator validates every expected
output hash before writing any output.

The provenance hashes identify the immutable extraction and independent narrow
source review. Source review and Python replay are not Lean acceptance. The PR
records the exact commits and hosted check results. All modules are covered by
the default root and transitive guards permitting only `propext`,
`Classical.choice`, and `Quot.sound`; no native proof is introduced.

The delivered statement is exactly
`scalarNumerator originalUpper = scalarSumLiteral`. Numerical inequalities,
trace and geometry checks, an analytic kernel bound and the full endpoint are
separate obligations. Original nodes, weights, masks and panel data are unchanged.
