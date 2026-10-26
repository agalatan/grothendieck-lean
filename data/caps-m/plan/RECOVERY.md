# Centre-sweep recovery — codex-15b7

Work branch: `codex/caps-12-15`. Original worktree:
`/Users/alingalatan/workspaces/grothe-codex-caps-12-15`.
The branch backs up partial #87 research; it is not a delivery to master or a
completed Lean caps verification. The user authorized remote checkpoints.

The latest committed snapshot is `checkpoint-codex-15b7.json`. Runtime progress
is `centre-campaign-progress-codex-15b7.json`; the local driver journal and logs
are in `handoff/caps-centre/`. Read actual process state before restarting. A
surviving controller or child must not be duplicated; the driver also checks its
lock and recorded process groups. Exit 75 means a checkpoint pause or unfinished
repairs, not a completed pass. The previous delivery is owned by another AI.
The user subsequently requested an active 15-minute continuation timer,
`finish-rows-12-15-caps-and-cache`, and authorized the droplet runner cache
campaign. Read the latest human scope in `handoff/caps-centre/STATE.md`.

The snapshot has 53 completed centres (15 historical and 38 new), all with zero
best residual. This is partial coverage, not the final remaining maximum.
`cover-baseline-codex-15b7.json` records an exact replay of all 10,762 boxes at
the unchanged padding and cover, including the approximately 4.50e-14 margin.
All 38 centres stored on 1600×256 are covered; the larger-grid phase continues.
`rest-inventory-codex-15b7.json` separately inventories the 358 localised nodes
and 900 unverified anchored candidates needed for the full remaining row caps.

## Resume

1. Read current `AGENTS.md`. Reuse the existing worktree and its private build.
   For a fresh checkout, use the original path above (export-source hashes include
   absolute output paths) and bootstrap its build with `scripts/clone_master_build.sh`.
   Never copy a live runner build or publish a private Actions cache.
2. Restore missing stored-grid scratch modules without rerunning computations:

   ```sh
   python3 tools/caps_centre_restore.py restore data/caps-m/plan/centre-sweep-codex-15b7.json
   ```

   Apply the same command to the saved `fine-*.json` manifests in this directory
   and `fine-campaign/`. The helper verifies source and module hashes, writes only
   missing scratch `.lean` files, and preserves exports and solved results.
3. Inspect the saved pause reason and any live processes. Clear only this agent's
   `handoff/caps-centre/STOP_REQUESTED` after the previous job has stopped.
4. Start the following in its own process group, as required by `AGENTS.md`:

   ```sh
   python3 tools/caps_centre_campaign.py run --agent-id codex-15b7 --manifest data/caps-m/plan/centre-sweep-codex-15b7.json
   ```

The driver rechecks completed evidence, uses one owned child at a time and keeps
raw coverage separate from completed repairs. Prepared sidecars are not completed
exports. All 358 centres, including 15 explicitly adopted historical records, must
be accounted for before reporting a final remaining maximum.

## Scope and decision boundary

Keep `capPad=1e-11`, row caps, the refined cover and `CapsRest` unchanged. For each
positive increase, first try multiplier, grid or complete interval-split repairs.
The saved zero-increase examples are 14:200/0 on 1600×1152 and 12:280/103 on 3200×256.
Some other grids for 12:280 have exact matrix obstructions; these do not disprove
the analytic node bound.

After the full sweep, report the remaining count/maximum and exact alternatives
on #72: per-node changes with chord and source-majorant checks plus cover replay,
and global padding with its exact lower endpoint. The current cover margin is
about 4.50e-14; 1.77e-8 belongs to the retired cover. The latest completion request
authorizes #15 wiring and runner builds when all certificates work at unchanged
caps, padding and cover. A residual requiring changed mathematics still needs
the user's decision before dependent changes. Future updates to this published branch merge master; no
force-push or rewriting of published history is needed.
