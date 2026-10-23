# Complete unshifted law-node cover

The accepted finite arithmetic has **10,234 boxes**, two pure-row law nodes,
and one appended batch for original row index 14. Its rounded cap and strict
reciprocal endpoint are

```
B = 713421621393/1000000000000 = 0.713421621393
L = 43802989793/31250000000    = 1.401695673376
```

The exact maximum is approximately `0.7134216213924581`, at cap box 194.
The four bounded passes reached `.71342165`, `.71342163`, `.713421623`, and
`.7134216214`; final rounding uses the exact accepted maximum. The endpoint
gain over `1.401695390488` is `0.000000282888`.

`cover.json` is the sole final full cover. `cover-ledger.json` is the sole
cumulative change ledger, relative to the checked 9,057-box input cover.
It changes 169 parents: 168 exact `2 x 2 x 2` grids and a two-way split in
`t` for cap box 194. Every old recipe remains available as a fallback;
every changed child is checked to cost no more than its old parent.
The original canonical 8,756-box cover and its earlier refinement ledger
are immutable inputs, rather than superseded campaign outputs.

The two nodes in `nodes/` are the already independently accepted unshifted
4302 scale nodes. They are reused across mixture weights and defect cells.
No additional node LP, Gaussian integration, shifted source cap, or rank-one
response premise was introduced in this campaign. The `x_interval` in each
node describes its historical saving comparison, not a restriction on its
whole-half-line law inequality. Both certificates use the original row-14
source, including its affine tail, and the inherited normalized Stein cuts.
The Gaussian assumption remains **exactly the existing `NodeCaps`**.

The binding cap-194 value is essentially the pointwise optimum of envelope
indices 13 and 14 (source row indices 12 and 13; envelope 0 is the crude row).
It is an obstruction within that envelope
calculus, not a lower bound on the actual Gaussian witness norm. Further
improvement requires changing that envelope obligation rather than more
subdivision of the same formula.

## Replay

From the repository root, using only standard-library Python:

```sh
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-lo.json
python3 -B -I tools/needle_rankone_nodes.py --verify data/lower-unshifted/nodes/seed4302-hi.json
python3 -B -I tools/needle_unshifted_campaign.py --verify data/lower-unshifted/cover-ledger.json
python3 -B -I tools/needle_unshifted_lean.py --check
```

The last command checks the deterministic generated Lean data after its
integration. A probe can instead use `--out-dir /tmp/unshifted-lean-probe`.
The exporter independently checks every final box, the canonical old node
map and the complete guillotine partition. Reflected Lean batch/cover checks
and the endpoint theorem are separate obligations, recorded by the main
repository's build and axiom audit; Python acceptance alone does not assert
their completion or an unconditional lower theorem.

The fresh twelve-module Lean 4.34.1 check completed with warnings treated as
errors, including the new batch, all four box chunks, partition and endpoint.
Both focused central audits accept the actual 25-declaration report, using
fourteen of 83 allowed native facts. `verification/` retains the exact source
hashes, build logs, reports and endpoint axiom list; the full default build
runs separately in branch CI.

`inputs/` contains byte-identical copies of the canonical inherited data,
old cover and old minimal-refinement ledger, plus the materialized 9,057-box
starting cover. `source-manifest.json` pins their hashes and retains the old
archive names as provenance labels. Campaign replay opens only these durable
copies; it does not fall back to an archive or another checkout. `nodes.json`
and the final cover bind every new node by repository-relative path and SHA256.

`campaign.json` records the four-stage summary, exact final cap, source/tool
hashes and verification command. `VERIFY.log` retains the final independent
process replay. Discovery ran as four sequential, low-priority, single-process
jobs in an owned droplet tmpfs directory; all completed normally. The optional
NumPy/SciPy versions installed there are pinned in `requirements.txt`, but
neither the delivered search nor its exact replay imports those packages.
