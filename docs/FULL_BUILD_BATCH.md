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
   own pull request against `master` as usual, labels it `full-build-batch` and `WIP`, pushes with `[skip ci]`, and
   names its own open `type: task` issue besides the epic #786. A `WIP` pull request gets comments on the approach
   and no verdict (AGENTS.md §7a), so the contribution is accepted like this: the independent reviewer (another
   agent family) leaves a signed comment on that pull request that accepts the contribution for inclusion and names
   the full commit SHA it read; `claude-b9ee` checks that the contributor's head still equals that SHA and merges
   exactly that commit into this branch (a merge commit, never a rebase). The contributor's pull request is closed
   by the landing of the batch. The final aggregate, without the `WIP` label, gets the ordinary formal review
   (`scripts/review.sh`, at its head commit) before `/land`.
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
   registry (`data/tail-caps/build.json`) with `python3 scripts/caps_stamp.py --write-registry`; then
   `python3 scripts/caps_stamp.py --digest` must print a `sha256` line.
3. Announce on #225 a freeze of **all** landings on master, documentation included, from the `/land` until the
   fast-forward (about 12 hours for the caps). The landing check merges the branch into the master commit it finds
   and fast-forwards master to exactly that merge: if master has moved meanwhile, the fast-forward is refused and
   `scripts/land_ready.sh` dispatches another landing check against the new master, and a check that finds master
   already past its base uploads no tree handoff. If master moves anyway, the second check finds the caps cache
   that the first one saved for this branch and, because the lake files changed, runs on a heavy runner again:
   minutes if it gets the runner whose workspace holds the first build and the caps closure did not change again,
   a full build otherwise (so keep one heavy runner online for the landing).
4. Merge master, remove this file, and push **with `[skip ci]` on this final commit too**: for a new node-cap
   digest an ordinary push check fails at once by design (AGENTS.md §8), and with `FORCE_HEAVY` on it would start a
   second heavy build beside the landing build. Remove the `WIP` label, get the review at the head
   (`scripts/review.sh`), and comment `/land claude-b9ee`. The one full build is started by that comment:
   `land.yml` reads the labels and the review of the head commit, not the commit message, and dispatches `lean.yml`
   with `land=true`. The landing check builds everything once on the heavy runner; master's own check then replays
   it (AGENTS.md §10).
5. **The fast-forward is refused: a permission failure, not a failed check.** This branch changes
   `.github/workflows/` (commit `69eae7193`: the forbidden-code scan of `lean.yml` and `cloud.yml` reads the library
   folders that exist). Unless the repository secret `MERGE_TOKEN` exists, the finish job checks out with
   `github.token`, and `scripts/land_ready.sh` (step 4, `git push origin merge-candidate:master`) is refused: the
   job ends red with "this delivery changes .github/workflows and the token may not update workflows". Everything
   before that step passed: the merged tree built and checked green, the approval and the task issue were verified,
   and the recreated merge was compared with the checked tree. Nothing has to be rebuilt. Then (AGENTS.md §9):
   1. The operator reads the checked tree: the `tree=` line of the `merge-info` artifact of the landing run, or the
      name of its `lean-build-tree-<tree hash>` artifact (kept one day), and the `base=` line (the master commit
      the check merged with). Master must still be that commit; the freeze guarantees it.
   2. The user merges #787 by hand with GitHub's **Create a merge commit** at the reviewed head commit (no squash,
      no rebase, no push in between). Because the branch was merged with master before the `/land` and
      `tools/gen_root_imports.py` had nothing to change, that merge has exactly the checked tree.
   3. The operator verifies, before anything else lands: `git fetch origin master` and
      `git rev-parse 'origin/master^{tree}'` equals the checked tree. If it differs, stop and report it.
   4. Master's own check (started by the user's push) then finds the artifact `lean-build-tree-<tree hash>` and
      replays the finished build instead of building the node caps again (AGENTS.md §10). It must start within the
      day the artifact is kept. Since CI did not land the PR, the operator also closes the `Closes #n` issues by
      hand, deletes the branch and its build caches, and lifts the freeze (next section).

## Freeze and staging (the user's decision, 28 November 2026)

From the moment `/land claude-b9ee` is commented on this pull request until master has fast-forwarded to the batch
(by CI, or by the user's hand merge of step 5 above), **no pull request lands on master**: the landing check must
find master where it started, and the hand merge must produce exactly the checked tree.

1. At the moment of the `/land`, `claude-b9ee` creates the branch `staging` from that master commit
   (`git push origin <master sha>:refs/heads/staging`) and announces the freeze on #225 and #786, naming `staging`.
2. Approved pull requests go to `staging` instead: each is retargeted with `gh pr edit <n> --base staging`, reviewed
   as usual (AGENTS.md §7a), and merged into `staging` by `claude-b9ee` with a merge commit, after checking that the
   approval (`Independent review` status) is at the pull request's current head. `/land` cannot do this: it only
   lands into master. Nobody pushes to `staging` otherwise.
3. When the batch is on master and master's own check is green, `claude-b9ee` creates `claude-b9ee/staging-land`
   from `staging`, merges `master` into it (resolving conflicts by understanding both sides, then
   `python3 tools/gen_root_imports.py`), and opens one ordinary pull request from it into master, naming the task
   issues of every pull request it carries (`land.yml` lands only branches named `<agent-id>/<topic>`, so not
   `staging` itself). It gets its own review and its own landing check (`/land claude-b9ee`), and its landing closes
   the `Closes #n` issues named in its commits.
4. The freeze ends when master has the batch. `claude-b9ee` then deletes `staging` on GitHub (once
   `claude-b9ee/staging-land` holds it) and says so on #225: `scripts/sync_master.sh` reads the freeze from the
   existence of `origin/staging` (AGENTS.md §6). Pull requests not merged into `staging` are retargeted back with
   `gh pr edit <n> --base master` and land as usual.
