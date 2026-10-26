# Node caps in Lean: status (26 Oct 2026)

`lower_bound_of_refined_cover_data` proves
`lower_bound_of_refined_cover_data : NodeCaps → IsGrothendieckBound K → 1.401697049825 < K`.
The separate target proves the same refined endpoint with fewer cap inputs:
`lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401697049825 < K`.
Both theorems use `RefinedCoverData.refinedL` and the same checked finite cover.
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
`Reduction`, `WitnessCap`, `Bridge`, the lower certificate, or
the checker-soundness and convexity-assembly modules.

`CapRows` retains `VertexCapsRow`, `ExclCaps` and `nodeCap_of_rangeOK`.
`CapAssembly` retains the chord check `capChords_check`, convexity assembly
and `nodeCaps_of_vertexCaps`; `CapHull` is a compatibility import. The common
`NodeCaps` definition lives in `NodeCaps.lean`, which imports `FibreSup`
without importing `Reduction`. These proof modules belong to the default
`Grothe` target. `CapNodes` contains the 15 unchanged `vertexCapsRowKK`
proofs and `vertexCaps_of_capsRest`. Its final `lower_bound_of_capsRest`
composes those vertex caps through `nodeCaps_of_vertexCaps` and
`lower_bound_of_refined_cover_data`, with no new cap premise.

The rows 12–15 piece checks have the same separation. `CapCoverDefs`
contains `Cons` and the rational coverage predicates; `CapConstrDefs`
contains the constrained matrices, parsers and `nodeOKc`. `CapPieceRange`
imports these pure definitions, row/gate data and `CapTablesData`.
Its local import closure has 32 modules; generated coverage/range modules
for one node have 34, including their data. Semantic regions and all
soundness proofs remain in `CapCover`, `CapConstr` and `CapPieceNodes`.
These generated piece facts are not yet imported by any proof.

There is one build target, `Grothe`: the generated root imports the 15 heavy
row modules and `CapNodes` like every other module. CI builds it, replaying
the heavy facts from the cache, only when the cache marker matches. No `Task.spawn` is used inside the native range checks;
parallelism is between separate Lean processes.

The numerical checker has its own independent precompiled library,
`GrotheCapsKernel` (`Basic`, `CapPoly`, `CapCheck`). Its constants retain
the `GrotheKernel` Lean namespace. Other numerical checkers stay outside
that library, so their changes do not replace the cap checker's shared
object. The library root is pinned because every importer loads it.

## Cache provenance: 53 files

`python3 scripts/caps_stamp.py --digest` computes the source hash and file
count without marking a build. The boundary contains 48 local computation
modules reachable from the 15 heavy row modules, followed by five direct
extras: `Grothe/LowerAnalytic/CapNodes.lean`,
`GrotheCapsKernel.lean`, `lean-toolchain`, `lake-manifest.json`, and
`lakefile.toml`. The extras' imports are not traversed. The total is 53
files. `--list` lists the exact paths.

The hash identifies the cached computational source bytes and direct
extras. It is not a full dependency or reproducibility manifest: it does
not hash every analytic proof reachable through `CapNodes`,
or the workflow and report scripts. Lake checks ordinary dependencies
separately. Soundness and lower-certificate changes outside this set leave
the computation hash unchanged; CI's build of `Grothe` and its
axiom audit still check the final assembly against the current proof layer.

The verified marker is `.lake/build/caps-closure.sha`, saved beside the
compiled build products. Verification is recorded with that cache, rather
than in a committed source-stamp file.

## Verification status and CI sequence

Acceptance of the combined computation split and CI-cache change requires
one successful runner `caps` build of the combined candidate, the axiom
report, and the repeated ordinary CI check. A read-only digest or unchanged
theorem statement is not a verification record. The scratch-branch
`Grothe/LowerAnalytic/Bridge.lean` comment probe leaves the computation hash unchanged;
`CapRangeDefs.lean` is a negative control that changes it. Neither probe
marks a build cache.

For Lean-relevant checks, ordinary CI restores `.lake/build` and calls
`python3 scripts/caps_stamp.py --check-cache` (also the default).
On a match, CI builds `Grothe` and checks `scratch/Axioms.lean` with
`scripts/check_axioms.py`; a GitHub-hosted check only runs when a cache with the
current caps digest exists.
This checks `CapNodes` against the current proof layer; Lake reuses cached
native results only when its dependency hashes permit it.

When no verified cache matches the caps digest (part of the cache key),
CI's route job sends the same check to the droplet's runner, which builds
`Grothe`, checks the axiom report, and only then calls
`scripts/caps_stamp.py --mark-cache` and saves the cache. A `ready/` check
uses the branch merged with current master. After the merge, master's check
also runs on the droplet and reuses the runner's persistent build, refreshing the canonical
master cache. One runner build supplies validation, branch replay and the
subsequent master cache; do not launch an independent droplet verification.

## Data and remaining rows

Recipe inputs live in `data/cap-recipes/rowKK.json`, with generator arguments
in `data/cap-recipes/rows.txt`. Change the JSON and regenerate rather than
hand-editing `CapRecipeData.lean`. Lower-row and gate inputs are similarly
kept in `data/`; generated modules must reproduce byte for byte. A failed
recipe can make its cap check fail; it cannot bypass the numerical checker.

Rows 12–15 remain explicit `CapsRest` inputs. Their localized-piece data,
computation campaign and final wiring are roadmap Tracks B/C. Track A
separates both the existing 60 range facts and the localized-piece checks
from the lower proof chain. The same 60 range facts support the refined
endpoint through the shared cover; recipes, row data and cap hypotheses
are unchanged. The remaining rows are not discharged.
