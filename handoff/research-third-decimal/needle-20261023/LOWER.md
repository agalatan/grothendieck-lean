# Lower endpoint: reuse the certified law nodes before regenerating integrals

23 October 2026. Complete finite arithmetic assembly; no new Gaussian
integrations, no new law-node certificates, and no unconditional endpoint claim.

## Completed result

The final replacement cover has **9,057 boxes**, changing only **43** original
parents. Its exact arithmetic cap is below

`B = 5707374123/8000000000 = 0.713421765375`.

The reciprocal endpoint can therefore be sharpened, under the unchanged
analytic premises, to

`L = 175211923811/125000000000 = 1.401695390488`.

This raises the existing displayed conditional lower endpoint by
`0.000000068030`. The exact acceptance checks `B*L < 1`; the largest actual
replacement/retained cap is approximately `0.7134217653742564`, at box 4302.
The global cap is not inferred from selected numerical tests: every unchanged
box is retained, every changed parent is covered by its exact eight children,
and the complete inherited guillotine partition is refined at those leaves.

`minimal-cover-ledger.json` is the sole final patch ledger. Its source hashes
pin the original cover and inherited data. The original inherited JSON is not
duplicated or changed. Eight extra references point to existing checked
source-row Stein nodes. No new mixed-batch certificates are introduced.

The generated Lean data is `Grothe/Research/RefinedCoverData.lean`, with
`refinedB`, `refinedL`, `refinedBoxes`, and `refinedCuts` in namespace
`Grothe.Research.RefinedCoverData`. It has 18,113 partition tokens. The exporter
independently reconstructed and matched **all 8,756 original canonical box
strings** against committed `MixedData.lean` before emitting the refinement;
the canonical map of 3 inherited and 18 spectral batches is unchanged.
The new native box/partition facts and endpoint theorem are being integrated
separately; the arithmetic export itself does not assert their completion.

Reproduce and check the final data without running discovery:

```sh
python3 -I tools/needle_cover_refine.py --verify handoff/research-third-decimal/needle-20261023/minimal-cover-ledger.json
python3 -I tools/needle_cover_lean.py --check
```

## What actually binds

The current 8,756-box source is
`handoff/lower-stein/cert-jointmoment-lifted-codex`. Its largest stored bound
is box 7234, approximately `0.7134217985255055`, not the previously improved
box 8150. The stored target `0.7134218` has about `1.47e-9` unused norm-cap
slack. Tightening only that rounding would move the reciprocal endpoint by
about `2.90e-9`; this is valid but too small to motivate a research claim.

For larger, still modest targets, the exact original blocker counts are:

- `B = 0.71342179`: 8 boxes.
- `B = 0.71342178`: 22 boxes.
- `B = 0.71342175`: 66 boxes.
- `B = 0.7134217`: 129 boxes.
- `B = 0.7134215`: 338 boxes.

The whole-row-15 cap box 8168 has bound `0.713421235025179`; it does not
obstruct the last target. Box 8150 has bound `0.7134201892533115`, so its new
rank-one cap is not required for any target in this list.

## An exact free improvement is available on many boxes

The old cover does not always use the strongest available law-node chord.
`tools/needle_cover_refine.py` searches existing node references of the same
potential, proposes their lower convex hulls, and subdivides a parent box
into a rational Cartesian grid. A floating search proposes a mixture weight;
the final weight, gate completion, source interpolation, quadratic maximum,
and subbox cap are replayed with `Fraction` arithmetic. The original bound is
reconstructed exactly before a box is changed. The old choice restricted to
the child is retained as a fallback, so no child becomes worse.

For example, existing node reuse and a `2 x 2 x 2` subdivision give:

- box 3661: `0.7134178645523627`, about `3.93e-6` lower;
- box 1247: `0.7134200066367337`, about `1.79e-6` lower;
- box 5387: `0.7134193900468021`, about `2.41e-6` lower;
- box 4850: `0.7134204707544776`, about `1.32e-6` lower;
- box 6361: `0.713418595627187`, about `3.20e-6` lower.

These are improvements of old cap assembly using already certified inputs;
they do not require the new rank-one source inequality. The cost is a larger
finite cover, which the existing Lean `box_sound` and partition checker can
handle after regeneration of its data.

## Semantics checked against the Lean development

The replacement uses the exact `boxVal` semantics from `Boxes.lean`:
one common virtual row is formed before its pinned gate price is computed;
the same mixture weight is used on both endpoint moment polynomials; `x`
is maximized at its two endpoints; the remaining scale quadratic is maximized
at endpoints and its interior vertex; the source pad is restored once.

Each chosen node has the same potential as its group. The source-row nodes
are valid for every admissible `x`: their construction-cell label is not an
extra validity restriction (`rowTNode_sound`). Spectral joint nodes retain
their actual `x <= sixth_joint.xmax` restriction (`JBatch.tnodeX`, `nodeOf`).
New nodes are not invented. References newly appended to the cover are
existing source-row Stein nodes already present in the checked row data.

The ledger verifier independently recomputes every replacement cap and checks
the complete exact Cartesian grid of each replaced parent. The exporter
writes a new source package, preserves unchanged boxes and all existing node
proofs, and appends arithmetic-only cap-box recipes if needed. A generated
Lean certificate must still pass the existing complete `checkCert` and
partition checks before the new global endpoint is asserted.

## First complete discovery pass at B = 0.7134215

The same-group pass examined all 338 original blockers. It eliminated 290,
but left 48. Its global candidate bound is `0.7134217846589757`, controlled by
box 8701, followed by 4297 and 3945. Most residual boxes have small fourth-
defect coordinate `x` around `0.12` to `0.18` and scale around `0.207` to
`0.213`. They use source row 13 with row 15 or 16 and lie in the previously
identified rank-one source-contact band. This is a different obstacle from
the old scalar-law maximum near `x = 0.7`.

Cap box 194 is another residual obligation. Its original recipe is
`c|1687/2000,211/250,0,973612157/1000000000,0,31/4|13,14,11/20`.
Its cap is `0.713421622761154`. Searching all pairs of scalar envelopes and
subdividing `t` did not materially lower it: the best second half still has
cap about `0.7134216213924581`. It may need a law-node cover over scale and
defect rather than another scalar-envelope weight.

The next pass permitted changing to any one or two existing groups per child.
It reduced the global cap to the completed value above. Only the 43 original
boxes above that final target need replacement; all other discovery changes
are unnecessary and were removed from the delivered patch. In particular,
cap 194 and whole-row cap 8168 remain untouched.

The stronger exploratory target `B=0.7134215` still has 39 blockers in this
search. The existing rank-one bank can be repriced for the remaining
low-defect mixture completions without regenerating its Gaussian majorants;
new whole-half-line law certificates would then be a distinct obligation.

## Premises and proof boundary

The free cover reconstruction leaves every analytic premise of the existing
certificate unchanged: the row potential caps, Gaussian reduction, moment
and Stein/spectral inequalities and `NodeCaps` boundary remain as before.
Only finite rational assembly changes. This is substantially easier to turn
into endpoint movement than claiming that a local response experiment or a
single improved rank-one box already bounds the global norm.

Heavy discovery uses only one low-priority process in owned droplet tmpfs
`/dev/shm/codex-needle-cover-20261023`, with source hashes pinned in each
ledger. No main checkout or master branch is changed.

## Follow-up: new original-source law nodes

The separate experiment in `UNSHIFTED_NEXT.md` certifies two new row-14 law
scales against the original unshifted caps, passes a standalone Lean
`checkBatch` evaluation, and improves original box 4302 by about `5.22e-5`.
It leaves this completed global cover unchanged. Its pure-row nodes are
reusable across mixture weights; the next complete campaign should exploit
that reuse before adding any shifted-response analytic premise.
