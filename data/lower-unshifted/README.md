# Complete cover with pure-row and mixed-source law nodes

The complete certificate has **10,909 boxes**, with

```
B = 713420886479/1000000000000 = 0.713420886479
L = 1401697117301/1000000000000   = 1.401697117301
```

Every box is at most B and L < 1/B. The exact maximum is approximately
`0.713420886478006`. The mathematical premise remains exactly **NodeCaps**;
the witness, original source tables and heavy cap import closure are unchanged.

The node bank contains two pure-row law nodes and three mixed-source Young
nodes. The mixed source uses original rows 14 and 15, normalized by each row's
delta, with theta `177107909/800000000`. Its certified kurtosis range is
`0 <= x <= 4/5`. Each file contains the full witness and its exact proof data.
Historical fusion and LP paths are provenance only and are never opened for
acceptance. The original pure-row batch is preserved at index 21, and the
mixed nodes form one appended batch at index 22.

The forest starts from the immutable 10,521-box input in
`inputs/fused-start-cover.json`. Its 388 binary splits and
1,072 same-domain repricings produce the complete final cover.
The recipes mix existing source potentials and their checked law nodes; original
recipes remain valid fallbacks. Restricted components retain their original
scale interpolation domains. The original 1,261-reference and 19-group prefixes
are pinned; 51 further references expose existing source Stein or zero
nodes, and three references name the new mixed nodes. No source cap is added.

## Replay

From the repository root, with standard-library Python:

```sh
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-lo.json
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-hi.json
python3 -B -I tools/needle_mixed_nodes.py --verify data/lower-unshifted/nodes/fused-lo.json
python3 -B -I tools/needle_mixed_nodes.py --verify data/lower-unshifted/nodes/fused-hi.json
python3 -B -I tools/needle_mixed_nodes.py --verify data/lower-unshifted/nodes/focus-3.json
python3 -B -I tools/needle_fused_global.py --verify data/lower-unshifted/cover-ledger.json
python3 -B -I tools/needle_unshifted_lean.py --check
```

`cover.json` is the sole final cover and `cover-ledger.json` its exact replay
ledger. All acceptance inputs are durable, clone-local files. The preserved
baseline, original source tables, source manifest and seed proofs are pinned
by hashes. No ignored handoff or generation script is needed for verification.
The older `certified-start-*` inputs remain intact for their original replay
chain. The deterministic exporter checks the original canonical node map,
every new node, every final recipe and the complete guillotine partition before
reproducing the generated Lean data byte for byte. The original source box strings
and cut tokens live only in `inputs/source-cover-serialization.json`, an uncompiled,
hash-pinned replay input. It also pins the exact retained `mixedBatches` declaration;
the compiled module no longer contains the old cover or its partition.

## Lean scope

The new law batch and all four box chunks are reflected separately, with a
partition fact. Chunk width is 2,728; the kernel checks its extent against the
actual box-list length. Python replay and Lean reflection are separate checks.
The required Lean coverage includes `LawNodeData`, `LawNodeCheck`, the eight cover
modules and their generic bridges. Exact Python replay does not replace Lean
reflection; the delivery CI checks the generated cover. The records in
`verification/` describe the earlier cover and its CI run.

## Remaining obstruction

The search cap `0.71342` is not cleared: 340 final boxes exceed it.
The accepted B above has zero failures. A whole-region subdivision of the old
cap cell 9750 retains scale and kurtosis information through existing row-15
law nodes. A KKT floor for mixing the uniform global row caps therefore does
not imply a floor for this stronger law relaxation or the actual Gaussian norm.
The final cover omits unused source nodes and redundant subdivisions. Further
local prices need another complete global replay before changing the endpoint.
