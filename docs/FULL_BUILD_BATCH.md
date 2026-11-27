# The batch for the next full build

This file exists only on the branch `claude-b9ee/full-build-batch`. It is removed by the last commit before the
branch lands. The list of what the batch contains is the epic
[#786](https://github.com/agalatan/grothendieck-lean/issues/786); this file holds the rules of the branch.

## What the branch is for

A change of `lean-toolchain`, `lake-manifest.json`, `lakefile.toml`, of `GrotheCapsKernel/` or of any other file of
the node caps' import closure (`python3 scripts/caps_stamp.py --list`) makes every proof check rebuild all node
caps: hundreds of CPU-hours on a heavy runner ([AGENTS.md](../AGENTS.md) §10, §13). Such changes are collected
here and paid for with one build. The build is started when a result needs new node caps, and the toolchain and
Mathlib are then upgraded to the latest stable versions in the same build.

## Rules

1. **No check runs on this branch until the build is decided.** Every push carries `[skip ci]` in the message of
   its head commit, merges of master included. The pull request is labelled `WIP` and `full-build-batch`: a `WIP`
   pull request cannot land. Never dispatch `lean.yml` on this branch (`-f mode=caps` would start the full build),
   never remove the `WIP` label, and never comment `/land` before the user says the build starts.
2. **One owner pushes.** The branch belongs to `claude-b9ee`. Another agent with a change for the batch opens its
   own pull request against `master` as usual, labels it `full-build-batch` and `WIP`, pushes with `[skip ci]`,
   names the epic, and asks for its review there. When that pull request is approved, `claude-b9ee` merges its
   branch into this one (a merge commit, never a rebase). Its pull request is closed by the landing of the batch.
3. **It follows master.** `claude-b9ee` merges `origin/master` into the branch at least once a day and after every
   landing that touches Lean sources, resolves conflicts by understanding both sides, runs
   `python3 tools/gen_root_imports.py`, and pushes with `[skip ci]`. A conflict that is a decision goes to the
   author of the batched change.
4. **Nothing is built on the laptop.** A change in the batch is checked by its author with targeted builds of its own
   modules on a droplet (AGENTS.md §12), in a clone of this branch, and only while the droplet's CI runner is
   offline. The node caps are never built outside CI.
5. **What does not belong here.** Anything that lands without a full build: research records, documents, scripts,
   and Lean modules outside the caps closure whose rebuild is cheap. Those go to master directly.

## Starting the build (only on the user's word)

1. Master's check is green; a heavy runner is up with a warm workspace (AGENTS.md §8).
2. Upgrade `lean-toolchain`, `lake-manifest.json` and what the new versions break; regenerate the node-cap
   registry (`data/tail-caps/build.json`) with its generator; run `python3 scripts/caps_stamp.py --digest`.
3. Announce a freeze of Lean-relevant landings on #225.
4. Merge master, remove this file, push **without** `[skip ci]`, remove the `WIP` label, get the review at the
   head, and comment `/land claude-b9ee`. The landing check builds everything once on the heavy runner; master's
   own check then replays it (AGENTS.md §10).
