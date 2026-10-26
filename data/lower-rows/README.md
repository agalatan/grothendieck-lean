# Canonical exact row constructors

`row01.json` through `row19.json` are the exact inputs of the committed
`Grothe/Lower/RowData01.lean` through `RowData19.lean` modules. Rational
headers and matrix/coupling entries are strings; node caps, meshes and
certificate cells retain their original rational constructor strings.
`source_cell_nodes` records the source-node count printed in each module's
header, rather than an additional certificate assumption.

These inputs were exported from the generated modules at
`a1dd968e09a7af61243c97fdbfa482e2a51063d6`. Their constructor bodies were
preserved byte for byte when the imports were changed from `Rows` to the
computable `RowDataTypes` module. No discovery optimizer or external
archive is required to regenerate the committed data:

```sh
python3 tools/gen_lower_data.py
python3 tools/gen_lower_data.py --check
```

The check mode compares every generated module, including `RowData.lean`,
byte for byte without writing files. Edit these canonical inputs and
regenerate when changing row data. The explicit archived-source mode
`python3 tools/gen_lower_data.py SOURCE` remains available for importing
a complete hash-checked `handoff/lower-stein/SOURCE` package; it refreshes
both the canonical JSON inputs and the generated Lean modules.
