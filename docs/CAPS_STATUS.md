# Node caps in Lean: status (27 Oct 2026)

Agent-ID: codex-6b2a. Row 12 is activated in source for canonical CI. Its native
checks, complete Lean build, strict audit and Actions cache upload are pending.
Source generation and exact replay of research matrices do not establish those
verification results.

`lower_bound_of_refined_cover_data` has the endpoint
`NodeCaps → IsGrothendieckBound K → 1.401697049825 < K`.
The activated `lower_bound_of_capsRest` source assembles the same refined cover
and endpoint from fewer cap inputs. `CapsRest` now contains the vertex caps of
rows 13–15 (t = 0.845, 0.85, 0.855), plus excluded-node caps of the original
fifteen certified rows. Those old exclusion lists remain empty. The source
uses Row 12's unconditional row assembly; canonical CI must check that assembly
before this stage is considered verified. Raw caps, capPad = 10⁻¹¹, the refined
cover and endpoint are unchanged.

## Row 12 computation and proof layers

Row index 12 is zero-based and uses `RowData13.lean` / `data/lower-rows/row13.json`
(nominal 0.84). Its 396 nodes partition into 85 chord nodes and 311 vertices.
The vertices are 88 localized nodes, containing 4,562 constrained pieces, and
223 anchored vertices. All 88 selected centre matrices replay exactly with zero
additional cap increase; the other 4,474 pieces and 223 anchors still need their
native checks. The unchanged original fifteen `CapRowKK` modules retain all 60
single-threaded `capRangeKK_j` facts.

The activated Row 12 inventory comprises 1,487 Lean files: 88 data modules, 88 coverage
checks, 1,194 piece-range checks, 88 localized-node assemblies, separate anchor
recipes, 25 anchor-range checks, one row assembly and two shared grid/soundness updates. Its 1,307 independent native
facts are 88 coverage checks, 1,194 piece ranges and 25 anchor ranges. Each check
occupies its own module and runs sequentially. The anchor ranges exclude exactly
the 88 localized indices using their own list; the row assembly discharges those
indices using every localized-node theorem, then exposes `vertexCapsRow12`.
Completing 88 centre searches alone never substitutes for the full piece/anchor
certificate.

`CapCoverDefs`, `CapConstrDefs` and `CapPieceRange` keep numerical computations
separate from semantic soundness in `CapCover`, `CapConstr` and `CapPieceNodes`.
The original cap range computation layer remains separate from Gaussian
analysis and the lower certificate. `CapRows` gives range-check soundness;
`CapAssembly` gives chord convexity and `nodeCaps_of_vertexCaps`. The common
`NodeCaps` definition is unchanged. `CapNodes` combines the original fifteen
row proofs with the unconditional Row 12 assembly, leaving only rows 13–15 and
old excluded-node caps in `CapsRest`.

The numerical checker remains the independent precompiled `GrotheCapsKernel`
library (`Basic`, `CapPoly`, `CapCheck`), retaining the `GrotheKernel` namespace.
Other numerical checkers do not replace its shared object. There is one target,
`Grothe`, and one combined strict axiom report. Research-only export modules
remain outside the public roots.

## Exact computation inventory and bounded native build

The tracked `data/caps-m/plan/row-certificates/row12-build.json` lists 1,322
independent native modules: 15 retained row modules and 1,307 new Row 12 leaves.
It pins 126 pure project prerequisites and 1,453 source/configuration files,
plus the two execution helpers. `scripts/build_caps_batches.py --plan` validates
and prints the plan without building or writing anything.

On the self-hosted runner, the preparatory builder completes the pure
prerequisites before scheduling at most TWO native leaves in one owned process
group. Each Lean child receives `-j1`; aggregate RSS is limited to 24 GiB and
free disk must remain at least 3 GiB. It checks actual child concurrency, foreign
Lean/Lake work, source/registry fingerprints and an owned STOP file. Only its
own new process group may be stopped. Closed child exits, logs and peak resource
samples are recorded under `.lake/caps-batches`.

Lake receives an owned TOML overlay adding only trace-neutral `weakLeanArgs =
["-j1"]`; the canonical lakefile is unchanged. Re-running the identical source
plan asks Lake to validate and reuse completed outputs. Receipts alone never
skip a build or attest a verified cache. The rough cold estimate is 2–3 days at
two workers, based on the recipe/grid census and roughly 124 CPU hours of
historical checker cost. It is not a measured Row 12 native pilot; anchors,
compilation and shared-machine pauses can extend it. The CI timeout is 72 hours,
and completed canonical outputs persist for an identical rerun.

## Cache provenance and verification sequence

`scripts/caps_stamp.py --digest` and `--list` are read-only source inventories.
The fingerprint covers 1,454 files: the explicit computation-root registry,
all retained and Row 12 heavy computation closures, and direct assembly/config
pins. Direct assembly imports are not recursively hashed; Lake checks ordinary
proof dependencies separately. This boundary is not a complete reproducibility
manifest or a verification record.

CI's route compares the caps digest in the cache key. A matching verified cache
allows GitHub-hosted replay. Otherwise the SAME check runs on the self-hosted
runner. After the bounded preparation step it must complete `lake build Grothe`,
the ONE combined STRICT native/axiom audit and the existing verification/probe
checks, then record `.lake/build/caps-closure.sha` and successfully upload an
Actions cache. A digest, marker alone, partial log or preparatory leaf receipt
is insufficient. No unconditional second ordinary branch check is required.

A `ready/` delivery checks the tree combined with current master; workflow edits
follow the human-merged PR route. After an actual merge, observe the ordinary
master check and its master-cache upload. A branch cache is not a master cache;
branch deletion also removes its branch cache. No private native/full build or
manual cache publication stands in for this canonical CI evidence.

## Reproduction and remaining work

The five Row 12 generation inputs are under
`data/caps-m/plan/row-certificates/`; see
[CAPS_ROW 12_PREPARATION.md](CAPS_ROW12_PREPARATION.md) for exact regeneration.
The stable piece-grid catalogue retains the original three indices and appends
(1600,1152,1/200) and (3200,256,1/400). Recipe proposals can fail their exact
native checks; such failure does not authorize changing a cap or capPad.

The separate numerical research run was deliberately paused at 173 accepted
centres, all with zero best residual. Its closed data, unaccepted peers and
witnesses were archived and hash-validated, and the owned remote folder was
removed before this CI handoff. It must not restart over a user/CI Row 12 build.
Rows 13–15 and every remaining anchor/piece certificate are still needed for a
hypothesis-free lower endpoint. The accepted native-free upper theorem
`K_G^ℂ ≤ 1.404909132791` and its proof interfaces are unchanged.

A green branch check can also hand its fully checked build to master as the
short-lived `lean-build-tree-<tree hash>` artifact when the branch contains
current master. Master's check accepts that artifact only for the exact same
tree and the canonical workflow, then performs its ordinary checks and saves
the master cache. This preserves the distinction between a branch cache and
the master cache while avoiding a second cold droplet build.
