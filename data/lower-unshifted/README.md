# Complete adaptive cover with unshifted law nodes

The complete certificate has **10,521 boxes**, cap

```
B = 35671047661/50000000000    = 0.713420953220
L = 1401696986171/1000000000000 = 1.401696986171
```

Every box is at most B, and L < 1/B. The exact maximum is approximately
`0.713420953219917`. The gain over the preceding strict endpoint
`1.401695673376` is `0.000001312795`.

The forest starts from the immutable 10,234-box certified input in
`inputs/certified-start-cover.json`. Its 287 binary splits and 803
same-domain repricings produce the final 10,521 boxes. Every child retains
its parent's valid recipe as a fallback. Inherited components preserve
their original scale interpolation domains. The full split forest and every
root, event and final bound are checked with exact rational arithmetic.

The original 1,191 reference prefix is unchanged. Seventy further labels
name existing source-table Stein nodes or zero nodes; they add no source
cap or law scale. The only added law certificates remain the two original
unshifted row-14 nodes in `nodes/`, grouped into one appended batch. Their
whole-half-line proofs use the original source, affine tail and Stein cuts.
Their historical `x_interval` is a saving comparison, not a restriction on
the certified law inequality. The mathematical premise remains exactly
**NodeCaps**. The witness and heavy cap import closure are unchanged.

## Replay

From the repository root, with standard-library Python:

```sh
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-lo.json
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-hi.json
python3 -B -I tools/needle_adaptive_global.py \
  --start-cover data/lower-unshifted/inputs/certified-start-cover.json \
  --start-ledger data/lower-unshifted/inputs/certified-start-ledger.json \
  --verify data/lower-unshifted/cover-ledger.json
python3 -B -I tools/needle_unshifted_lean.py --check
```

`cover.json` is the sole final cover and `cover-ledger.json` its replayable
forest ledger. The explicit starting paths map the original logical source
labels to their byte-identical durable copies. This prevents replay from
mistaking the new canonical cover for its own starting input.
`local_adaptive_sha256` records historical discovery provenance; verification
replays all split events and recipes and does not open that research file.
No ignored handoff, external checkout or historical generator snapshot is
needed to replay the final certificate.

`inputs/` also retains the original canonical source tables, cover and
minimal-refinement ledger required by the original node-reference map.
Their manifest pins exact bytes; archived names are provenance labels only.
`nodes.json` binds the two law nodes by clone-local path and SHA256.

The deterministic exporter independently checks the original canonical
node map, both law proofs, every final box and the complete guillotine
partition, then generates `LawNodeData.lean` and `RefinedCoverData.lean`.
The law data stay byte-identical; the cover includes chunk size 2,631.
Four reflected chunks and a partition fact supply the finite cover, and
the kernel checks that their extent covers the actual box list.
Python acceptance alone is separate from Lean reflection and the endpoint.
Eight cover modules passed fresh warning-as-error Lean checks. Four unchanged
generic/law modules were reused by exact source and artifact hashes. The actual
27-declaration report passes both focused axiom audits and uses 14 of the
83 registered native facts; the endpoint itself has those 14 plus the three
standard axioms. The current build records and reports are in `verification/`.

## Scope of the bounded search

The exploratory target `0.71342` was not cleared: 877 final boxes remain
above it. The accepted cap B above has **zero** failing boxes. The accepted
endpoint follows from that complete cap, not the smaller search target.
Selected pointwise bounds near the binding region do not prove optimality
of the node bank or a Gaussian norm floor. Further mixture/law-price
optimization remains a research direction.

Discovery and exact replay use only the Python standard library. Heavy
runs used one low-priority process in an owned droplet directory. The
ledger records generator hashes and stage parameters; `VERIFY.log` retains
the final replay through the canonical durable paths.
