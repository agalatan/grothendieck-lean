# New unshifted law scales: local success and next complete campaign

23 October 2026. The current 9,057-box global endpoint cover is unchanged.

Two new law-scale nodes for original row index 14 have passed exact
whole-half-line checks against its **original unshifted source table**.
They reuse the existing normalized Stein cuts. No shifted Gaussian cap or
rank-one response premise is needed by the final certificates.

At the exact scale endpoints of original box 4302,

```text
106123725113/512000000000
10709733727/51200000000
```

they replace the coarser inherited law chord. Keeping the same row-14/16
mixture, gate completion, row-16 polynomials and padding changes this whole
parent box's cap from `0.713421765385994...` to
`0.7133695405035759...`, an exact saving of about `5.22248824e-5`.
The independent uniform bound-gap floor is `4.74827929e-5`.
This is one local box result, not a new global lower endpoint.

The ordinary convexity of the actual unshifted potential supplies the scale
chord, with **zero semiconvex allowance**. No convexity of the raw piecewise
source table is asserted. The nodes were discovered using a shifted-source
proposal, then rounded upward and independently accepted against the old
source alone. Their validity is independent of that proposal history.

## Stable evidence

- `unshifted4302-lo.json` and `unshifted4302-hi.json`: the two rational nodes;
  438 intervals each, degree at most 10, including origin and affine tail.
- `unshifted4302-box.json`: unchanged old-box reconstruction and exact new
  box arithmetic, with source and node hashes.
- `UnshiftedLawNodes.lean`: generated standalone probe. The existing
  `checkBatch rowData unshiftedBatch` evaluates to `true` on Lean 4.34.1 with
  warnings treated as errors. `unshifted4302-lean-probe.json` and
  `UNSHIFTED_LEAN_EVAL.log` retain the manifest and raw successful output.
- `UNSHIFTED_AUDIT.md`: independent source binding, scale, padding, moment,
  Stein-cut and serialization review.

The probe is a successful `#eval`, not a new reflected theorem, default
import or native-axiom allowlist entry. The pending formal integration is to
turn the checked batch into an available node proof and use it in a complete
new cover. The frozen endpoint proof does not depend on this experiment.

Replay from the repository root:

```sh
python3 -I tools/needle_rankone_nodes.py --verify handoff/research-third-decimal/needle-20261023/unshifted4302-lo.json
python3 -I tools/needle_rankone_nodes.py --verify handoff/research-third-decimal/needle-20261023/unshifted4302-hi.json
python3 -I tools/needle_unshifted_export.py --check
python3 -I tools/needle_unshifted_box.py --out handoff/research-third-decimal/needle-20261023/unshifted4302-box.json --check
```

The separate `rankone4302-source.json` fixture records a valid saved-bank
repricing conditional on its written shifted-source and rank-one premises.
It is not an input of these unshifted checks. Retain that distinction when
using `needle_rankone_reprice.py` or the shifted format of
`needle_rankone_nodes.py`.

## Next bounded campaign

1. Inventory all remaining low-defect blockers for a first complete target
   `B=0.71342165`, then `B=0.71342163`. Begin with rows 13--16, physical law
   scale near `0.207--0.213`, and defect `x` near `0--0.18`. Choose a shared
   rational scale mesh from their actual endpoint needs. Reuse the two
   checked row-14 scales wherever their chord brackets a box.
2. Propose pure-row law polynomials at the missing scales using the original
   source table only, testing the retained Stein cut banks and several
   objective defects. The current LP discovery path uses a shifted-source
   selection; add an original-source-only proposal mode before expanding
   the campaign. The exact unshifted verifier and exporter already work
   without shifted source or Gaussian integration inputs.
3. Accept only exact whole-half-line certificates, preserving the original
   affine source tail, moment signs and rational cut weights. Keep all old
   node chords as fallbacks. New pure-row nodes can be used at **every
   mixture weight**, unlike rank-one banks priced for one shared completion.
   They can also compete across defect cells because their pointwise law
   certificate has no construction-cell restriction.
4. Export checked pure-row batches with `i=j`, `theta=0`, `spec=false` and
   the same original row caps. The cut vectors must be serialized at the
   batch denominator `10^8`, not the source-row denominator `10^7`; the
   existing exporter performs the exact conversion. Append these batches
   to the old batch list and reprice the entire cover with the old recipes
   available as fallbacks. The current `RefinedLower` wrapper fixes
   `mixedBatches`, so a future interface must admit an explicitly checked
   extended batch list. This needs no change to `NodeCaps`.
5. Only after all boxes, the partition and reciprocal inequality pass exact
   replay should the new batch/cover checks become reflected Lean facts
   with the required axiom audit and global endpoint theorem.

Original cap box 194 has cap `0.713421622761154...`. It is below both first
targets, but obstructs any target below that value unless separately
improved. Its failed neighboring-recipe projection is recorded in
`cap194-projection.json`; do not extrapolate this local row-14 success to
that broad box. The fixed current witness also has the response barrier
described in `RETUNING.md`, so this campaign is an incremental endpoint
improvement, not a route by itself to `1.402`.

No additional campaign was launched while the current global proof and CI
were running. All new-node discovery and checks used owned one-process
droplet tmpfs jobs, and those jobs have finished.
