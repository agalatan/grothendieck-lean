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
   `github.token`, and the push of `scripts/land_ready.sh` (step 4) is refused. The script classifies the refusal
   (`scripts/land_push_refusal.sh`: workflow files changed, by `git diff --quiet` on `.github/workflows`, and
   GitHub's message about the missing `workflows` permission in the push's own output) and ends red with
   "PERMISSION, NOT A FAILED CHECK" and the checked tree. Everything before that step passed: the merged tree built
   and checked green, the approval and the task issue were verified, and the recreated merge was compared with the
   checked tree. Nothing has to be rebuilt. Any other refusal message ("workflow-unexplained" or "another reason")
   is not this case: stop and find the cause. Then (AGENTS.md §9):
   1. The operator reads the landing run's `merge-info` artifact: `tree=` (the checked tree, also the name of the
      `lean-build-tree-<tree hash>` artifact, kept one day), `base=` (the master commit the check merged with) and
      `source=` (the reviewed head of #787). Master must still be `base`; the freeze guarantees it.
   2. The user merges #787 by hand, pinned to the reviewed head:
      `gh pr merge 787 --merge --match-head-commit "$source"` (a merge commit; GitHub refuses if the head moved).
      Because the branch was merged with master before the `/land` and `tools/gen_root_imports.py` had nothing to
      change, that merge has exactly the checked tree.
   3. The operator records the merge receipt, `M=$(gh pr view 787 --json mergeCommit --jq .mergeCommit.oid)`, and
      verifies, before anything else lands: `git fetch origin master`; `git rev-parse "$M^{tree}"` equals `tree=`;
      `git rev-parse "$M^1"` equals `base=`; `git rev-parse "$M^2"` equals `source=` (an empty commit pushed after the
      review would give the same tree and first parent, but another second parent);
      `git merge-base --is-ancestor "$M" origin/master`. Master may already be one commit further: since
      `docs/overview.tex` changes, `overview.yml` can push a generated `OVERVIEW.pdf` commit on top of `M`;
      `git diff --name-only "$M" origin/master` must then list `OVERVIEW.pdf` only. Compare with `M`, never with
      master's head. If any check fails, stop and report it.
   4. The operator finds master's proof run of exactly `M`: a `lean.yml` run with `event` `push` or
      `workflow_dispatch` and `head_sha` = `M` (the weekly `schedule` keepalive shares the workflow and is green with
      every proof job skipped: it never counts),
      `gh api "repos/agalatan/grothendieck-lean/actions/workflows/lean.yml/runs?head_sha=$M" --jq '.workflow_runs[] | select(.event == "push" or .event == "workflow_dispatch") | .id'`.
      In that run, the `build` job must have concluded `success` with its steps "Build Grothe (everything, node caps
      included)", "Axiom report" and "Upper axiom report" concluded `success` (not `skipped`):
      `gh api "repos/agalatan/grothendieck-lean/actions/runs/<id>/jobs" --jq '.jobs[] | select(.name == "build") | [.conclusion, (.steps[] | select(.name | test("^(Build Grothe|Axiom report|Upper axiom report)")) | .conclusion)]'`.
      That run replays the finished build from `lean-build-tree-<tree hash>` (AGENTS.md §10).
      If no such run exists and master's head is still `M`, the operator dispatches `gh workflow run lean.yml --ref master`
      within the artifact's one-day lifetime. If master's head is already the PDF commit, that run's tree differs from
      the artifact's by `OVERVIEW.pdf` and misses the handoff. The operator then dispatches it onto the machine whose
      persistent workspace holds the landing build, `gh workflow run lean.yml --ref master -f mode=caps -f runner=mega`
      (the runner that ran the landing check, read from the `runner_name` of that run's `build` job; for the planned
      cold build `mega-droplet-3`, labels `heavy,mega`: Lake replays the node caps there in minutes, in the workspace
      `ws-<key>` of this manifest). A generic `heavy` label could pick another machine and rebuild them. The freeze ends only
      after this run is green with those steps run.
   5. Since CI did not land the PR, the operator also closes the `Closes #n` issues by hand, deletes the branch and
      its build caches, and lifts the freeze (next section).

## Package store of the cold build

The batch changes `lake-manifest.json` (Mathlib v4.34.1 → v4.36.0: all nine packages at other revisions). Lake checks
out, inside `.lake/packages`, the revisions that the consumer's manifest pins, so a packages tree shared between a
v4.34 user and a v4.36 user can change under a running build. During the freeze both generations run: `staging`
still carries the v4.34 workflow. Two measures keep them apart without editing the old workflow:

- **One persistent workspace per manifest on the runners.** The route job names the workspace `ws-<first 16 hex of
  sha256(lake-manifest.json)>`; the build and shard jobs check out into it and run every step there. The v4.34
  workflow keeps using the runner's root checkout, whose `.lake/packages` stays linked to `~/grothe-caps/.lake/packages`;
  the v4.36 jobs never touch the root checkout, and the old ones never see `ws-<key>`.
- **One package store per manifest** (`scripts/package_store.sh`): `.lake/packages` of a new workspace links to
  `packages-<key>` (on the droplets under `~/grothe-caps`, on the laptop under
  `/Users/alingalatan/workspaces/grothe-packages`). The store records the manifest's full sha256 and refuses any other
  one. Mathlib's compiled files are fetched with `lake exe cache get` unless a stamp records a successful fetch for
  exactly this manifest and toolchain, and the Mathlib checkout must be at the pinned revision. That also holds for
  a private (non-symlinked) packages directory, which is refreshed when its manifest changes. The old shared trees
  are never touched.

Initialisation of a store is serialised by an exclusive lock (Python's `fcntl.flock`, which works on Linux and macOS).
Every build cache keeps one archive path, `ws/.lake/build`, because the path is part of a cache entry's version. On a
hosted runner the checkout is `ws/` itself; on a heavy runner `ws` is a symlink to `ws-<key>`. The master cache saved
by `lean.yml` is therefore found by `cloud.yml` and the weekly keepalive (`scripts/test_cache_paths.py`).

On the laptop the master builder (`scripts/master_build_job.sh`) selects the store of every target commit it checks
out, and `scripts/clone_master_build.sh` gives a new worktree the store of its own manifest. The main checkout's
`.lake/packages` stays as it is for the worktrees already linked to it. A resumed worktree that adopts the new
manifest by a merge runs `scripts/package_store.sh --if-needed` before its first `lake` command (AGENTS.md §5, §6;
`scripts/sync_master.sh` prints an ACTION line when a worktree's packages do not match its manifest). Tests: `scripts/test_package_store.py` (old →
new → old → new on one runner with two workspaces, a moved or foreign store refused, a private directory refreshed)
and `scripts/test_laptop_packages.py` (the builder across a manifest change, existing and new worktrees).

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
