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

The snapshot has 109 completed centres (15 historical and 94 new), all with zero
best residual. This is partial coverage, not the final remaining maximum.
`cover-baseline-codex-15b7.json` records an exact replay of all 10,762 boxes at
the unchanged padding and cover, including the approximately 4.50e-14 margin.
All 38 centres stored on 1600×256 are covered; the larger-grid phase continues.
`rest-inventory-codex-15b7.json` separately inventories the 358 localised nodes
and 900 unverified anchored candidates needed for the full remaining row caps.
This checkpoint was captured after the original local worker paused gracefully
(exit75, no surviving child/controller), to prepare the user-authorized batching
speedup. It is still partial coverage. Inspect actual processes and the current
handoff before resuming; a historical pause does not rule out a new remote job.

## Audit and save a live checkpoint

`python3 tools/caps_centre_checkpoint.py` audits one live observation without
writing. To audit the committed checkpoint, use `audit --checkpoint
data/caps-m/plan/checkpoint-codex-15b7.json`. It checks source and evidence hashes,
node/grid identities and both stored/fine provenance dependencies; it does not
verify feasibility or process liveness.

An explicit `snapshot --replace --handoff-prefix
handoff/caps-centre/codex-15b7-backup` captures a new owned checkpoint and metadata.
Review the metadata's file list before staging it. The tool preserves the full
observed progress but selects artifacts only from completed accepted centres.
It neither stops the worker nor marks a build cache verified.

## Portable research speedup

The human requested faster processing. The portable configuration at
`portable/Codex15b7Portable/portable-config.json` preserves all109 completed
records and prepares249 remaining centres with relative output paths. Its input
checkpoint is the immutable
`checkpoints/centre-codex-15b7-before-portable-109.json`; do not overwrite that file.
Both stored and finer-grid modules regenerate byte for byte through
`tools/caps_centre_portable.py`. Legacy absolute-path scratch sources are retained
for hash validation only, never rebuilt remotely. No caps, padding or cover changed.

Master now uses one target, `Grothe`, including the cap rows. Its canonical
lakefile stays unchanged in this public worktree. The existing research evidence
pins the prior package config; strict old provenance therefore intentionally
fails in the clean current checkout. Preserve that lineage rather than relabel it:
`portable/Codex15b7Portable/frozen-research-lakefile.toml` contains the exact old
bytes, and `research-configuration.json` records both hashes and the narrowly
allowed difference (the unused `GrotheCaps` library declaration and comment).
Only in the isolated owned research checkout, before any Lean process, apply
that hash-verified one-file override and record HEAD plus the dirty diff. Existing
strict source validators then describe the actual research tree without changes.
Never call a default/full target there: only `CapExport` and pinned `CapPlanRuns`
leaf modules. Final wiring and native CI verification use current canonical master,
its single axiom report and its current 53-file caps fingerprint.

The numerical research prefetcher is `tools/caps_centre_batch.py`. It holds the
same campaign lock and starts one Lake invocation at a time, initially with at
most two independent export modules. It guards memory, disk and foreign runner
activity, uses separate owned journals, preserves partial output, and validates
exports and exact solutions individually. It does not verify native facts, declare
a global maximum, or publish a cache. The first remote run is a two-target export
pilot; inspect its actual concurrency, runtime, RSS and outputs before the full run.

The first two-target droplet pilot finished successfully and both raw exports
(`12:199:0`, `12:200:0`) were copied and validated locally. It measured one Lean
process at a time: 436.3 seconds total, 3.66 GiB peak aggregate RSS. No new centre
was accepted from exports alone. Its source, receipts and isolated scheduler test
are recorded in `checkpoints/centre-codex-15b7-serial-pilot-and-scheduler-poc.json`.
The private droplet folder was cleaned after all jobs exited and evidence returned.
An isolated test demonstrated two concurrent single-threaded Lean processes by
letting Lake use two scheduler threads and passing `-j1` through a guarded copy
of the config. The canonical lakefile and all mathematical source bytes remain
unchanged; use the current tested batcher and a NEW progress path for that setup.
Never rerun the first two exports merely to benchmark concurrency.

Read current `handoff/caps-centre/STATE.md` and `SPEEDUP.md` for actual remote
folder, source commit, PID and phase. Never resume the old local worker while a
remote prefetch job survives. After all copied results validate and the prefetcher
is stopped, the unchanged campaign driver can replay/repair the portable manifest
using a NEW progress path and run directory; do not mutate the old fingerprint:

```sh
python3 tools/caps_centre_campaign.py run --agent-id codex-15b7 \
  --manifest data/caps-m/plan/portable/Codex15b7Portable/manifest.json \
  --progress data/caps-m/plan/centre-campaign-portable-codex-15b7.json \
  --run-dir handoff/caps-centre/campaign-portable \
  --stop-file handoff/caps-centre/STOP_REQUESTED_PORTABLE
```

Start long jobs in their own process groups. The full campaign, including complete
interval repair replay, must account for all358 centres before a final count or
maximum is reported. Final Lean verification/cache production remains CI-only.

## Legacy local resume

Use this only if the portable transition has deliberately been abandoned and no
remote job or portable campaign is active; it would otherwise duplicate research.

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
