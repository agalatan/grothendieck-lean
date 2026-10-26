# Node caps in Lean: status (26 Oct 2026)

The original default-target lower theorem remains
`lower_bound_of_nodeCaps : NodeCaps → IsGrothendieckBound K → 1.401695322458 < K`.
The refined default-target theorem improves this to 1.401697049825 under
the same `NodeCaps` hypothesis; see the README for its certificate.
The separate target supplies
`lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → Llow < K`.
`CapsRest` consists of the vertex caps of rows 12–15 (t = 0.84, 0.845,
0.85, 0.855), plus any excluded-node caps of rows 0–11 and 16–18. All
exclusion lists are currently empty.

## Computation and proof layers

The 15 `CapRowKK` modules for rows 0–11 and 16–18 contain the existing
60 `capRangeKK_j` facts, four sequential ranges per row. Their theorem
statements and native computations are unchanged. Each heavy module imports
only `CapRangeDefs` and `CapRecipeData`. The computation layer separates
`RowDataTypes`, `RowGateData`, `CapChords`, `CapLinAlgDefs`, `CapPieceDefs`,
`CapNodeDefs`, `CapRangeDefs` and `CapTablesData` from analytic soundness.
Its local closure contains the numerical checker and rational data, without
`Reduction`, `WitnessCap`, `Bridge`, `RowCheck`, the lower certificate, or
the checker-soundness and convexity-assembly modules.

`CapRows` retains `VertexCapsRow`, `ExclCaps` and `nodeCap_of_rangeOK`.
`CapAssembly` retains the chord check `capChords_check`, convexity assembly,
`nodeCaps_of_vertexCaps` and `lower_bound_of_vertexCaps`; `CapHull` is a
compatibility import. These proof modules belong to the default `Grothe`
target. `CapNodes` contains the 15 unchanged `vertexCapsRowKK` proofs,
`CapsRest`, and the final assembly of `lower_bound_of_capsRest`.

The rows 12–15 piece checks have the same separation. `CapCoverDefs`
contains `Cons` and the rational coverage predicates; `CapConstrDefs`
contains the constrained matrices, parsers and `nodeOKc`. `CapPieceRange`
imports these pure definitions, row/gate data and `CapTablesData`.
Its local import closure has 32 modules; generated coverage/range modules
for one node have 34, including their data. Semantic regions and all
soundness proofs remain in `CapCover`, `CapConstr` and `CapPieceNodes`.
These generated piece facts are not yet imported by `GrotheCaps`.

The generated default Lean root excludes the 15 heavy row modules and
`CapNodes`, using `data/root-imports-exclude.txt`. They belong to the separate
`GrotheCaps` target. Ordinary CI builds the default target and checks the
source stamp. Its heavy job builds both targets and audits both axiom
reports when the stamped sources change on a `ready/` delivery.
No `Task.spawn` is used inside the native range checks; parallelism is
between separate Lean processes. The numerical checker remains in
`GrotheKernel/CapCheck.lean`.

## Source-stamp boundary: 53 files

`python3 scripts/caps_stamp.py --digest` computes the source hash and file
count without recording verification. The current boundary contains 48 local
modules reachable from the 15 heavy row modules, followed by five direct
extras: `Grothe/LowerAnalytic/CapNodes.lean`, `GrotheCaps.lean`,
`lean-toolchain`, `lake-manifest.json`, and `lakefile.toml`.
The extras' imports are not traversed. The total is 53 files, down from 140
before the split. `python3 scripts/caps_stamp.py --list` lists the exact paths.

The stamp records the verified computational source bytes and direct extras.
It is not a full dependency or reproducibility manifest: it does not hash
every analytic proof reachable through `CapNodes` or `GrotheCaps`, or the
workflow and report scripts. Lake checks ordinary build dependencies
separately. Changes to soundness or the lower certificate outside the stamp
set therefore leave the heavy-computation hash unchanged. The default build
checks the proof layer; the heavy separate-target build checks the final
`CapNodes` assembly.

## Verification status and CI sequence

Acceptance of this split requires the `ready/` heavy CI run.
A successful `GrotheCaps` build and both axiom reports establish verification
for the checked sources; `docs/CAPS_VERIFIED.txt` records that run. An unchanged theorem statement or a read-only
digest is not a verification record. The scratch-branch comment probe in
`RowCheck.lean` leaves the digest unchanged; a comment in `CapRangeDefs.lean`
changes it. Neither probe writes a verification stamp.

For Lean-relevant checks, the ordinary CI job builds `Grothe`, checks its
axiom report and calls `python3 scripts/caps_stamp.py --check` (also the
script's default). That reads the committed `docs/CAPS_VERIFIED.txt`.
A missing or mismatched stamp fails closed. On a `ready/` delivery, CI
also dispatches the heavy `caps` job on the droplet runner.

The heavy job merges the ready branch with current master, builds `Grothe`
and `GrotheCaps`, and checks `scratch/Axioms.lean` and
`scratch/AxiomsCaps.lean` with `scripts/check_axioms.py` (the latter with
`--caps`). Only after these pass does it call
`scripts/caps_stamp.py --write "<run evidence>"`, commit the resulting
`docs/CAPS_VERIFIED.txt` onto the ready branch and repeat its check.
The ordinary CI check then verifies the stamp against its merged candidate.
After auto-merge, a `warm` run updates the shared master build cache.
Use this route without a separate manual droplet verification. The actual
heavy run, repeated ready check and auto-merge remain the acceptance evidence.

## Data and remaining rows

Recipe inputs live in `data/cap-recipes/rowKK.json`, with generator arguments
in `data/cap-recipes/rows.txt`. Change the JSON and regenerate rather than
hand-editing `CapRecipeData.lean`. Lower-row and gate inputs are similarly
kept in `data/`; generated modules must reproduce byte for byte. A failed
recipe can make its cap check fail; it cannot bypass the numerical checker.

Rows 12–15 remain explicit `CapsRest` inputs. Their localized-piece data,
computation campaign and final wiring are roadmap Tracks B/C. Track A
separates both the existing 60 range facts and the localized-piece checks
from the lower proof chain. It changes no cap, certificate or theorem
statement, and does not discharge the remaining rows.
