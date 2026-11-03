# Node-cap individual-piece diagnostic

Agent-ID: codex-15b7. This branch contains a temporary diagnostic only. It is not a certificate, fix, PR or request to run the canonical caps CI.

The source at b5a8d967 has `pieceRangeOK pieceNode_12x186 0 4 = true` false under `native_decide`. A range result does not identify which piece failed. These probes independently test each piece in nodes 186 and 204 with the unchanged original `pieceTables`. Grid identifiers are zero-based: 2 = 1600×1024 and 3 = 1600×1152.

Run only on the human-authorized powerful host in your own signed directory, following its process, disk and memory guards. Link shared packages only where permitted. Do not access or build in a runner workspace, dispatch mode=caps, edit the builder/workflow, or publish a private cache. Check the host is actually available before starting. Each process must be bounded and be run with `-j1`; capture real exit, elapsed time, peak RSS, stdout/stderr, source revision and command. An exit 0 means the individual proposition is true; an exit 1 with `native_decide ... is false` means it is false. Other failures are inconclusive.

```sh
python3 experiments/grid3-diagnostics/generate.py /absolute/own/new/probes
# First build ONLY prerequisites in the owned checkout:
lake build Grothe.LowerAnalytic.CapPieceRange Grothe.LowerAnalytic.CapPieces.D12x186 Grothe.LowerAnalytic.CapPieces.D12x204 --wfail
# In separate bounded process groups, one command per generated file:
lake lean /absolute/own/new/probes/Node186Piece0.lean -- -j1
# Repeat for Node{186,204}Piece{0,1,2,3}.lean.
```

A practical parallelism is up to eight processes if real memory/disk/foreign-work preflight permits it. Never bypass the host's resource or ownership guards. Send the eight results and any failures to codex-15b7, including actual timing and host details; report infrastructure failures separately from logical false. No other runs or persistent edits are requested.

Use `lake lean`, which prepares the external file's module setup and loads the imported precompiled checker library. `lake env lean` only supplies environment variables and does not prepare that setup. The original range module's Lake setup includes `libgrothe_GrotheCapsKernel.so`; the individual probes need the same compiled checker context. A slow or interrupted probe is inconclusive, not a false result.

## Exact matrices for the six failed pieces

The completed eight-probe run reported on PR #243 establishes: piece 0 passes for both nodes, while pieces 1–3 fail for both. Their six matrix exports and exact multiplier-only repairs have now been obtained. **Do not repeat these probes or exports.** The default command below remains available only to reproduce that diagnostic explicitly, preserving its original grid 2, recipes, constraints, cap and padding:

```sh
python3 experiments/grid3-diagnostics/generate_exports.py /absolute/own/new/matrices
# One command per generated file, in separate bounded process groups:
lake lean /absolute/own/new/matrices/Export186Piece1.lean -- -j1
# Repeat for Export{186,204}Piece{1,2,3}.lean (six jobs total).
```

The generator copies the committed `CapExport.lean` computational definitions verbatim, replacing only its analytic-proof import with `CapPieceRange` and the selected data module. It records source hashes in `manifest.json` and refuses existing output paths. The JSON includes the original polynomial/enclosure/verdict flags, exact `N`, ordered constraint matrices `A`/`B`, and stored multipliers. A successful export is not a passing certificate. Return all six closed JSONL files, the manifest, generated sources, actual commands, logs, exit codes and timings. Do not start a broader sweep, solver run, certificate rewrite or CI run on this request.

The original six failed because their multipliers left the cap-free matrix block indefinite with the checker's cell-RMS prices. Their exact matrix repairs preserve the cap, grid, recipe and constraint region. Exact matrix feasibility is separate from the final native certificate check.

## Remaining neighbours in the known failed row-12 nodes

The opt-in command below selects **304 diagnostic candidates**, restricted to the 31 nodes whose range modules failed: 183–212 and 215. A candidate is an original noncentre piece containing a two-sided constraint with endpoints `-3/1000` and `3/1000`. It skips each planned centre using `output_piece_index` from the pinned row-12 plan, rather than assuming that every centre is piece zero. It also excludes the six completed exports (nodes 186/204, pieces 1–3). There are 180 candidates on grid 2 and 124 on grid 1. A failed node does **not** establish that every selected candidate is false; their individual verdicts and exact matrices are still required.

```sh
python3 experiments/grid3-diagnostics/generate_exports.py --known-failures /absolute/own/new/neighbours
# Run only jobs listed in the resulting manifest, one file per bounded process:
OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 MKL_NUM_THREADS=1 NUMEXPR_NUM_THREADS=1 \
  lake lean /absolute/own/new/neighbours/Export183Piece1.lean -- -j1
```

The human chooses the AI and powerful host for this batch. The host owner must first check actual ownership, competing jobs, available memory and disk, then choose a bounded number of concurrent processes and retain the host's resource guards. Do not launch all 304 at once. Build only the computational prerequisites and the D modules named in the manifest in the owned checkout; never build in the runner workspace. This command only generates sources; it starts no workers or CI jobs.

The selector checks fixed SHA-256 values for `row12.json`, `row12-pieces.json` and `row12-selection.json`, verifies their plan binding, and matches every selected node's D-module directions and full encoded piece list against those inputs. The manifest records those input hashes, every D-module hash, the copied canonical exporter-body hash, the source hash and actual grid of each job, and both exclusion lists. The original recipe, ordered constraints, multipliers, grid, cap and padding remain unchanged. A changed input or mismatching D module is rejected for inspection.

Return only closed outputs with their generated sources, manifest, exact commands, source revision, logs, real exits, elapsed time and peak RSS. Preserve partial and failed output separately; an infrastructure failure or incomplete export is inconclusive. Exporting successfully does not prove a piece passes. No solver run, certificate rewrite, broader row sweep, canonical CI dispatch or cache publication is requested. Subsequent exact analysis and any repair are separate work.
