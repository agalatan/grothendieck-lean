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
