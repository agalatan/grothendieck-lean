# Retained mixed-node certificates

`batches.json` is the canonical, clone-local input for the 21 mixed-potential
batches in `Grothe/Lower/MixedData.lean`. It stores all 351 serialized witnesses
and their row indices, weights, Lipschitz constants, node tables and meshes.
The declaration is byte-identical to the retained declaration from the original
module, whose SHA-256 was
`a529b61562c93f665403968361aabb292cc72d93c8a47b74037ea474603bf0d0`.
The exact declaration digest is recorded in the JSON and exporter.

Regenerate or check with standard-library Python:

```sh
python3 tools/gen_lower_mixed.py
python3 tools/gen_lower_mixed.py --check
```

The old cover and its partition are absent from the compiled module. The refined
cover exporter still needs their source-reference ordering; their exact box
strings and cut tokens are preserved only as the uncompiled replay input
`data/lower-unshifted/inputs/source-cover-serialization.json`. Its digest and the
retained mixed-batch declaration are checked before exporting the refined cover.
Run `python3 -B -I tools/needle_unshifted_lean.py --check` to replay the current
law nodes and cover and compare both generated Lean files byte for byte.
