# Row 12 source activation and CI handoff

Agent-ID: codex-6b2a. Row 12 is generated and wired into the canonical source
stage. Native execution, successful Lean proof verification and Actions cache
publication are still pending. This stage does not claim the final lower bound
without cap hypotheses.

Row index 12 is zero-based: it names `rowData[12]`, nominal parameter 0.84,
defined by `RowData13.lean` and `data/lower-rows/row13.json`. Its 396 nodes
partition into 85 chord nodes and 311 vertices. The vertices partition into 88
localized nodes and 223 anchored vertices. The localized nodes contain 4,562
pieces; completing 88 centre searches does not certify all those pieces.

## Bound research proposals and fixed grids

The adoption plan uses the immutable 153-centre research checkpoint. Every
Row 12 centre is complete with zero additional cap increase. All 88 saved
matrices replay exactly, including four nonzero centre indices. The chosen
results are 48 fine, 38 stored and 2 historical selections. The other 4,474 pieces
retain their original recipes, constraints and conservative stored grids.
The original research inputs, capPad = 10⁻¹¹, raw caps, refined cover and
endpoint are unchanged.

The stable piece-grid catalogue retains legacy indices 0–2, then appends:

- index 3: (1600,1152,1/200);
- index 4: (3200,256,1/400).

A research label alone is not a certificate-grid index. Both refinement tuples
were already fixed by the unchanged campaign; rows 13–15 need not finish before
these indices are reserved.

## Reproduce the source

```sh
python3 tools/caps_row_plan.py --check
python3 tools/gen_cap_row_anchors.py --check
python3 tools/gen_cap_row_candidate.py --out handoff/caps-centre/row12-lean-candidate --check
python3 tools/activate_cap_row12.py --check
python3 scripts/build_caps_batches.py --plan
python3 scripts/test_caps_row_plan.py
python3 scripts/test_gen_cap_row_anchors.py
python3 scripts/test_build_caps_batches.py
```

To recreate a missing handoff candidate, run the candidate command once without
`--check`. The five tracked inputs are `row12.json`, `row12-pieces.json`,
`row12-selection.json`, `row12-anchors.json` and `row12-generation.json` under
`data/caps-m/plan/row-certificates/`. The last file pins canonical commit
`95113edbcafed32ab9e8062c3b5cae5ff3338834` and generation parameters, so an
unrelated move of `origin/master` cannot change reproduction. An explicit
`--base` prepares a reviewed newer tree in a NEW output directory. Metadata
records the actual base and all input hashes.

A fresh staged-only checkout reproduces all 88 exact matrix replays. The 86
research-exporter source files needed for those provenance bindings are packaged
as inert `.lean.txt` data under `research-source-archive/`, outside Lean source
roots. The reader preserves their original logical module names and exact hash
bindings; it fails closed on changed or ambiguous bytes. Packaging changes no
generated Lean certificate or caps fingerprint.

The generated source inventory has 1,487 Lean files: 88 data, 88 coverage, 88 localized-node
assembly, 1,194 piece-range, one anchor-recipe, 25 anchor-range and one row-assembly
module and two shared grid/soundness updates. The candidate also includes its source manifest
and a separate anchors manifest. Its 1,307 native prerequisites are 88 coverage
checks, 1,194 piece ranges and 25 anchor ranges, each in its own sequential module.

The anchor ranges exclude exactly the 88 localized indices using their OWN
list, rather than the old global `capExcl12` default. The final range ends at
canonical `nodeList.length`. Assembly discharges those exclusions using all 88
localized-node proofs and exposes `vertexCapsRow12` once its prerequisites pass.
The activated `CapNodes` source uses that unconditional row theorem and leaves
rows 13–15, plus any exclusions of the old fifteen rows, as `CapsRest` inputs.

## Canonical build and cache evidence still required

The source stage registers every new native theorem, localized-node theorem and
final row theorem in the one combined strict audit. The computation fingerprint
uses explicit heavy roots, including all Row 12 leaves; generated proof roots
include only activated certificate modules, with research exporters excluded.
The independent precompiled `GrotheCapsKernel` remains unchanged.

`row12-build.json` inventories 1,322 native modules (15 retained row modules plus
1,307 Row 12 leaves), 126 pure project prerequisites, 1,453 source/configuration
pins and two execution-helper pins. The self-hosted preparatory builder finishes
pure prerequisites first, then builds at most TWO native leaves per owned group,
each `-j1`, with aggregate RSS≤24 GiB and disk free≥3 GiB. It preserves canonical
Lake configuration, checks actual concurrency and source/profile pins, forwards
STOP only to its owned child group and records real closed receipts. Lake traces
reuse valid completed outputs if an identical run resumes.

The rough 2–3 day estimate at two workers comes from the actual grid census and
historical checker costs (about 124 CPU hours); no Row 12 native pilot has measured
that runtime. Native anchors, non-centre pieces, compilation and pauses can
extend it. The current 72 hour CI timeout may require an identical incremental
resume. A leaf receipt is not proof of the completed row or a verified cache.

Canonical CI must finish ONE `Grothe` build, ONE combined STRICT native/axiom
audit, the existing marker/probe checks and a successful Actions cache upload.
No second ordinary branch check is required merely to repeat a successful
canonical build. After actual merge, the ordinary master check must upload the
master cache; a branch cache alone is not that evidence. Workflow edits follow
the human-merged PR route for final delivery.

The private numerical campaign was paused cleanly at 173 accepted centres, all
zero, and its entire owned source/data root was archived and hash-validated
before removal. Valid unaccepted peers and failed witnesses remain preserved.
Do not restart research alongside a user/CI build. The human-requested work
branch is `codex/row12-caps`; no private native/full build or manual cache
publication substitutes for canonical CI.

Native anchor and non-centre checks can still fail and require recipe repair;
preparation never presumes their success or permits an increased cap. The final
hypothesis-free endpoint still needs rows 13–15 and every remaining anchor/piece
certificate. The accepted native-free upper endpoint 1.404909132791 is unchanged.
