# Rules for AI agents working on this repository

Several agents (Codex instances and Claude sessions) work on this repository at the same time, on two shared
machines (the user's laptop and the droplet). These rules keep them from overwriting each other's work. Read all of
them before doing anything.

**The six rules that matter most:**
1. Never commit or push to `master`. Work in your own worktree and branch; deliver by pushing `ready/<agent>-<topic>`
   (§7). Only CI moves `master`. **The delivery check is the test:** do not check the same tree beforehand (no
   cloud check, droplet or full local build, no extra branch push); if it fails, fix and push again.
2. Before every push, sync with master and combine with it (§6).
3. Never run a full build (`lake build` or `lake build Grothe`) on the laptop. Build only your modules; full builds
   run in CI (§5, §8).
4. Sign everything with your agent ID (§2) and clean up after yourself (§14).
5. Never stop, delete or overwrite what another agent started or owns. Ask the user. (One exception: the janitor
   may merge master into a conflicting `ready/` branch, §7.)
6. **At most 2 CI jobs per agent at a time** (proof checks of your branches and cloud shards, §8). Check with
   `scripts/ci_active.sh <agent-id> <your branches>`.

## 1. Work items live in GitHub Issues

All planned work is tracked as GitHub Issues: **epics** (label `type: epic`), with **tasks** (`type: task`) as
sub-issues. Labels give the area (`area: lean`, `area: docs`, `area: infra`, `area: research`, `area: compute`),
the side (`side: lower`, `side: upper`), the owner (`owner: codex`, `owner: claude`) and the status
(`status: in progress`, `status: blocked`, `status: needs decision`).

- **Before starting:** find the issue (`gh issue list`, `gh issue view <n>`); if none exists, create one with full
  context. Comment that you are starting, with your branch and worktree. Set the `owner:` and `status: in progress`
  labels.
- **While working:** reference the issue in commit bodies (`Refs #<n>`). Comment on the issue when you push a
  milestone or hit a blocker. Update the labels as things change.
- **When delivering:** put `Closes #<n>` in the body of a commit of the delivery. When CI merges the delivery it
  closes the issue itself, with a comment naming the delivery (GitHub's own keyword handling does not fire for CI's
  push). Tick the task in its epic.
- **Attack plans and research ideas are issues too** (`area: research`), with the full reasoning and numbers. Do not
  leave them only in a local file.

## 2. Agent ID: make yourself identifiable

Many agents run at once, and several Codex conversations start with the same words, so the user cannot otherwise
tell which conversation owns a droplet folder, a branch or a running build. At the start of every session:

1. **Pick an agent ID:** your kind plus four random hex digits, e.g. `codex-7f3a` or `claude-b21e`
   (`printf 'codex-%04x\n' $RANDOM`). Keep it for the whole conversation.
2. **Make it visible:** start your first reply with `Agent ID: codex-7f3a`. If your interface lets you name the
   conversation, put the ID at the start of the title, e.g. `codex-7f3a — lower refined cover`.
3. **Sign everything you create with it:**
   - droplet folders: `~/<agent-id>-<topic>`, e.g. `~/codex-7f3a-refined-cover`, with the `job.pid` of any long job
     inside (§12);
   - commits: an `Agent-ID: codex-7f3a` trailer at the end of the commit message body;
   - issue comments: start with `[codex-7f3a]`;
   - branches keep the scheme of §3 (the ID goes in the commit body, not necessarily in the name).
4. **Write it down when you hand over:** give your ID in every status note or hand-over file.

`scripts/droplet_status.sh` lists droplet builds by folder, so a signed folder tells the user whom to ask.

## 3. Ground rules

- **Never commit on `master`**, locally or on GitHub, and never push to it. Only CI moves `master` (§7, §8). The
  local `master` is a read-only mirror of `origin/master`, fast-forwarded by `scripts/sync_master.sh`.
- **Never work in the main checkout** `/Users/alingalatan/workspaces/grothe`. It stays on `master`, clean, and is only
  fast-forwarded (if you find yourself there, see §4). Every agent works in its own worktree, on its own branch:

  | agent | branch | worktree |
  |---|---|---|
  | Codex instance | `codex/<topic>` | `/Users/alingalatan/workspaces/grothe-codex-<topic>` |
  | Claude session | `claude/<topic>` | `/Users/alingalatan/workspaces/grothe-claude-<topic>` |
  | Claude worker (sub-agent) | `claude/<topic>` | `/Users/alingalatan/workspaces/grothe/.claude/worktrees/<topic>` |

- **Say who made it:** branches start with `codex/` or `claude/`; delivery branches are `ready/codex-<topic>` or
  `ready/claude-<topic>`; every commit subject starts with `[codex]` or `[claude]`, e.g.
  `[codex] Lower: joint image compatibility`. CI's merge commits read `Merge ready/<name> (CI auto-merge)`.
- **Never force-push and never rewrite pushed history.** Never use `git stash` in a shared checkout, and never
  `reset --hard`, `clean` or `checkout --` files you did not create.
- **Sync before you work and before every push:** `scripts/sync_master.sh` fetches, prunes and fast-forwards the
  local `master`. It refuses to touch a checkout with local changes.

## 4. If you find yourself in the main checkout

Run `pwd; git rev-parse --show-toplevel; git branch --show-current; git status --short`.
If the toplevel is `/Users/alingalatan/workspaces/grothe`:

1. If the uncommitted changes there are **not yours**, touch nothing. Move to your own worktree (§5) and report
   "NOT MINE" to the user.
2. If they are **yours**: stop your builds (by process group, §12); commit everything on your own branch (never
   stash, reset or discard); run `git worktree add <path> <branch>` and continue there. Only if
   `git status --short` in the main checkout is then empty, run
   `git -C /Users/alingalatan/workspaces/grothe switch master`. Report what you did.

## 5. Starting work (laptop)

```sh
/Users/alingalatan/workspaces/grothe/scripts/sync_master.sh --build    # fetch; refresh the local master build
git -C /Users/alingalatan/workspaces/grothe worktree add -b codex/<topic> \
    /Users/alingalatan/workspaces/grothe-codex-<topic> origin/master
# give the worktree master's compiled build (links the shared packages, clones the snapshot)
/Users/alingalatan/workspaces/grothe/scripts/clone_master_build.sh /Users/alingalatan/workspaces/grothe-codex-<topic>
```

Resuming an existing worktree: sync, then combine your branch with master (§6) before continuing.

**What to build on the laptop.** Only the modules you change and the modules that import them:
`lake build Grothe.X.Y Grothe.X.Z`. **Never `lake build` or `lake build Grothe`:** the root includes the 15 node-cap
rows (`CapRowKK`) and their assembly `CapNodes`, about 21 CPU-hours cold. Those are verified by CI only (§8, §10),
and nothing but the root imports them, so you never need them locally. For a full check of your branch, push it
(§8) or run `scripts/cloud.sh check` (§11).

**The local master build (shared by every agent on the laptop).** Start every worktree from it instead of an empty
build: Lake then compiles only what your branch changes.
- **Where:** `/Users/alingalatan/workspaces/grothe/.lake/master-cache`, a consistent snapshot of a *successful*
  master build of every module except the node-cap rows and `CapNodes`. Its `built-commit` file names the master
  commit. It is produced in the dedicated worktree `/Users/alingalatan/workspaces/grothe-master-build` (detached):
  never edit, build in or remove that worktree, and never clone its live `.lake/build`.
- **Use it:** `scripts/clone_master_build.sh <worktree>` links the shared packages and clones the snapshot with
  `cp -c` (APFS copy-on-write: instant, no extra disk until files diverge). An older snapshot is fine.
- **Refresh** a worktree whose build is far behind: `scripts/clone_master_build.sh --replace <worktree>`.
- **Check it:** `scripts/sync_master.sh --status` (which master the snapshot holds; whether its build job runs).
- **Keep it current:** `scripts/sync_master.sh --build` starts the one master build job (`scripts/master_build_job.sh`:
  background, niced, incremental) unless the snapshot is current or the job already runs. Each round builds one
  master commit, publishes the snapshot (swapped in by rename), and starts another round if master moved.
- **Why not download CI's build?** CI builds on Linux. Every module that imports a precompiled library
  (`GrotheKernel`, `GrotheCapsKernel`) records the hash of the compiled library file (`.so` on Linux, `.dylib` on
  macOS), so Lake would rebuild them on the Mac anyway. A downloaded Linux build saves nothing that matters.
- **Never write into the main checkout's `.lake/`:** no `lake build` there, no copying files back, no plain
  `cp`/`rsync` of a build (about 2 GB per copy).

## 6. Before EVERY push: combine with a fresh master

Master moves several times an hour: other agents deliver, and the user merges by hand. A branch pushed on top of an
old master wastes a CI run and usually conflicts. So before **every** push (a work branch, a `ready/` delivery, and
especially a re-push after a CI failure or a conflict):

1. **Sync:** `scripts/sync_master.sh`.
2. **Evaluate the delta:** `git log --oneline HEAD..origin/master` and `git diff --stat HEAD...origin/master`. Decide
   whether your work must change because of it: a better bound, renamed or moved lemmas, a new hypothesis interface,
   work that duplicates yours, changed data, regenerated files. Adapt your work so it is the best version relative to
   master, not just mergeable.
3. **Combine:** never pushed: `git rebase origin/master`; already pushed: `git merge origin/master` (no rebase, no
   force-push).
4. **Resolve every conflict by understanding both sides**, never by taking "ours" or "theirs" blindly:
   - after **every** merge run `python3 tools/gen_root_imports.py` (not only `--check`): it regenerates the roots
     and re-sorts the union-merged lists, which a merge can leave unsorted (CI also does this after its own merge
     of a `ready/` branch);
   - generated files are regenerated, never hand-merged: `python3 tools/gen_root_imports.py` rewrites `Grothe.lean`,
     `GrotheKernel.lean` and `GrotheCapsKernel.lean` (every module under their folders, except those listed in
     `data/root-imports-exclude.txt`);
   - sorted one-entry-per-line lists (`scratch/Axioms.lean`, `data/axioms/*.txt`, `data/root-imports-exclude.txt`)
     are union-merged by git (`.gitattributes`); keep them sorted and duplicate-free (CI checks);
   - shared scripts: take master's version and re-apply only your intended change;
   - `README.md` needs a hand merge: describe the combined state.
5. **Quick local checks only (seconds to minutes):** `python3 tools/gen_root_imports.py --check`, the script tests
   (`python3 scripts/test_*.py`) if you touched scripts, and the Lean modules you are editing anyway while you work.
   Do not repeat CI's full check before pushing (§7): a red check costs one more push, a duplicate check costs a
   full build every time.

If master moved again meanwhile, repeat from 1. Report the master commit you combined with.

## 7. Delivering work: the checklist

Deliver when the user says the work should go into master.

1. **Commit everything** on your branch, so the tree is clean. Research-only files belong in `handoff/`
   (git-ignored), not in the repository.
2. **Combine with a fresh master** (§6, all five steps).
3. **Lean coverage** (CI checks all of it; get it right, but do not pre-run CI's check):
   - no `sorry`, no warnings;
   - every headline theorem has a `#print axioms` line in `scratch/Axioms.lean`, and is in
     `data/axioms/required.txt` if it is a main result;
   - every new `native_decide` fact is in `data/axioms/native.txt`;
   - a new module is imported by the generated root (run `python3 tools/gen_root_imports.py`). There is one build
     target, `Grothe`; only generated research modules that no proof uses yet go in `data/root-imports-exclude.txt`.
4. **Documentation:** never write counts of the axiom report or of native facts into documents (they conflict
   with every concurrent delivery; the lists in `data/axioms/` and `scratch/Axioms.lean` are the record). If a
   bound, a hypothesis or the axiom report changed, update `README.md`,
   `docs/overview.tex` and `docs/LEAN_DETAILS.md` in the same delivery. **Never build or commit `OVERVIEW.pdf`:**
   CI rebuilds it from `docs/overview.tex` on master (`.github/workflows/overview.yml`), and merges never conflict on it
   (`merge=ours` in `.gitattributes`).
5. **Deliver: push only the `ready/` branch,** `git push origin HEAD:ready/<agent>-<topic>` (`<agent>` = `codex` or
   `claude`). That one check is the test and the guard. Do not also push your work branch at the same moment, and
   do not run `scripts/cloud.sh check`, a droplet build or a full local build first: each would check the same
   tree again. A delivery that changes `.github/workflows/` goes through a pull request instead (§9).
   - CI merges it into the **current** master and checks the **merged** tree. Only if everything is green does it
     fast-forward `master` to exactly that checked merge and delete the `ready/` branch. Then push your work branch
     too if you keep working on it (§14 otherwise).
   - If the check fails, master is untouched. Read the log, fix, commit, combine with master again (§6), and push
     to the **same** `ready/` branch: the new push supersedes the failed run. A red delivery check is normal and
     cheap; do not be afraid of it.
   - If master moved while CI was checking, CI re-dispatches the delivery against the new master by itself (a
     notice, not a failure). Do nothing.
   - Several `ready/` branches may be checked at the same time; the first green one moves master.
6. **Watch your branches until they are merged or deleted.** `AGENT_ID=<your id> scripts/sync_master.sh` ends
   with an audit of your remote branches: red checks, `ready/` branches that are green but not merged, conflicts
   with the current master, branches already in master. Deal with every line: a red or conflicting branch is
   merged with `origin/master`, fixed and pushed again (the same name); a green `ready/` branch that does not
   merge has a conflict (fix it the same way) or changes `.github/workflows/` (open a PR); a stale branch is
   deleted. A delivery is yours until it is on master. When a `ready/` branch does not merge, CI says so on the
   issues its commits reference (`Refs`/`Closes #n`), naming the conflicting files and the owners.
   - **The janitor** (an agent the user names; currently `claude-b9ee`) audits all `ready/` branches about once an
     hour. When one has conflicted with master for over an hour with no new push, it merges `origin/master` into it
     (never a rebase or force-push), resolves the conflicts that are mechanical (independent changes on both sides,
     generated files, lists, documentation describing both), signs the merge commit with its own `Agent-ID`, and
     pushes the same `ready/` branch; that check is the test, as for any delivery. Conflicts of decisions (one side
     deletes, reverts or rewrites what the other changes; different bounds or hypotheses) it does not resolve: it
     reports them on the issue for the owner or the user. An owner who finds a janitor merge on its branch merges
     `origin/ready/<name>` into its work branch before continuing.
7. **After the merge:** `scripts/sync_master.sh`, then either continue on the branch (§6 before the next delivery)
   or, if you are done, clean up completely (§14).

Report to the user: the `ready/` branch name, the CI run, and the resulting master commit.

## 8. CI: the proof check (`.github/workflows/lean.yml`)

**Every run gives one result for its commit: green iff the proofs check.** A ✗ always means a real failure; a cache
miss only makes the run take longer (it stays "pending"). The workflow runs on every pushed branch except `cloud/**`
(§11), in three jobs:

1. **route** (GitHub-hosted, seconds): for `ready/` it merges the branch into the current master first. It decides
   - whether anything Lean-relevant changed (the `LEAN_PATHS` list in the workflow: Lean sources and roots, the
     lakefile and toolchain, `scratch/Axioms.lean`, `data/axioms/`, the root generator, the check scripts and their
     tests, the workflows). If not, the build is skipped and the run is green; documentation-only deliveries still
     merge. A branch commit already contained in master is skipped too (master's own check covers it);
   - where to build: it computes the node caps' source digest (`scripts/caps_stamp.py --digest`, part of the cache
     key) and looks for a verified build cache with that digest, of this branch or of master.
2. **build:** on GitHub if such a cache exists (it restores it; `lake build Grothe` then replays the node caps in
   seconds), otherwise **the same job on the droplet** (self-hosted runner, labels `self-hosted, heavy`). The droplet
   builds in its persistent workspace: hours if the cap rows really changed, minutes otherwise. Then, on either
   runner: `lake build Grothe` (everything, node caps included), the generated-roots check, the grep for `sorry` /
   `axiom` / `implemented_by` / `extern` / `unsafe` / `Task.spawn`, and the single axiom report
   (`scripts/check_axioms.py`). On the droplet it then marks the caps as verified (`.lake/build/caps-closure.sha`) and
   saves the build as a cache. On master it saves the new master cache (§10).
   On GitHub the build **fails fast**: at the first failed module (`✖`) it is stopped and the check fails
   (`scripts/lake_failfast.sh`), so fix that error and push again; the droplet builds on (its work is kept).
3. **finish** (GitHub-hosted, after a green build): on master it prunes old master caches; on `ready/` it recreates
   the checked merge, verifies that its tree is identical to the checked one, fast-forwards `master`, marks the
   commit with the status "Lean proof check (verified before merge)", closes the `Closes #n` issues and dispatches
   master's own check (which saves the master cache).

Also:
- **Superseded runs are cancelled automatically:** a new push to a branch cancels that branch's older GitHub-hosted
  check (one concurrency group per branch). Master's checks are never cancelled by a newer one starting (a long first
  build would be lost); instead, when a master check goes green it cancels the still-running checks of older master
  commits, whose trees it contains. What counts is the newest master commit's own result. Droplet checks are never cancelled either (a killed build leaves orphaned processes); they queue on the
  single runner.
- **Merged branches are cleaned automatically** (`.github/workflows/cancel-merged.yml`): when a pull request is merged
  or a branch is deleted, its running checks are cancelled and its build caches deleted. Merged pull-request branches
  are deleted automatically (repository setting).
- **Never use `[skip ci]` on a delivery**: the delivery check is what verifies and merges it. **Never cancel another
  agent's CI run** (`gh run cancel` acts with the user's account); ask its owner or the user.
- **Force the droplet** for a pushed branch: `gh workflow run lean.yml --ref <branch> -f mode=caps`.
- **The runner** is installed with `scripts/droplet_runner_setup.sh` (from the laptop; see its header for
  stop/remove). It shares Mathlib with other droplet work through `~/grothe-caps/.lake/packages`; never delete that.
- **At most 2 CI jobs per agent at a time.** An agent (one agent ID) may have at most two jobs queued or running in
  GitHub Actions: the proof checks of its own branches (work branches and `ready/` deliveries) and its cloud jobs,
  each cloud shard counting as one. Before you push a branch or start a cloud job, run
  `scripts/ci_active.sh <agent-id> <your branches...>`: it lists your active jobs and exits 1 when there is no room.
  `scripts/cloud.sh` enforces the limit for cloud jobs (set `AGENT_ID`). Master's own check (after your delivery
  merges) does not count. If you are at the limit, wait for a job to finish; a re-push of the same branch replaces
  its running check and does not add one.
- **Cost:** the repository is private, so CI minutes are billed. Push work branches when it matters, not after every
  small commit.

## 9. Pull requests

- **Agents open a pull request only for deliveries that change `.github/workflows/`**: GitHub refuses CI's push of
  those unless the repository secret `MERGE_TOKEN` exists (a fine-grained token for this repository with *Contents*
  and *Workflows* read and write); CI says so and does not retry. Every other delivery goes through `ready/` alone.
- **`ready/` branches are merged by CI only**, never by hand: a `ready/` push may still be work in progress whose
  check is the test.
- **Agents never merge a pull request.** The user merges, ideally when the branch is up to date with master and its
  latest check is green; then the merged result is the tree CI checked. A merge is a push to master, so master's
  check runs afterwards.

## 10. Build caches: who writes, who reads

| cache | written only by | read by |
|---|---|---|
| GitHub master cache, key `lake-build-v3-<toolchain+manifest>-<caps digest>-<sha>` | the green check of master (on the droplet when the caps changed) | every CI run, cloud jobs |
| GitHub branch cache, same key plus `-run<id>` | droplet checks of that branch, and green `ready/` checks | later checks of that branch (e.g. a `ready/` re-check after master moved); deleted with the branch |
| droplet runner workspace (`~/actions-runner/_work`) | the runner only, one job at a time | nobody else; never copy into it or out of it |
| laptop snapshot `.lake/master-cache` (main checkout) | `scripts/master_build_job.sh` (§5) | laptop worktrees through `scripts/clone_master_build.sh` |
| tree handoff: artifact `lean-build-tree-<tree hash>`, kept 1 day | a green check of a branch (work or `ready/`) whose checked commit contains the current master | master's check, when master's tree is exactly that tree |

- **Tree handoff:** a branch's caches are invisible to master's runs, so a green branch check whose commit contains
  the current master also uploads its build as an artifact named after its tree. When master then becomes exactly
  that tree (CI's fast-forward of a `ready/` delivery, or a hand merge of an up-to-date pull request), master's check
  downloads that build instead of the older master cache: its `lake build` only replays, also when the node caps
  changed (no second droplet run). Only artifacts of `lean.yml` runs are accepted.

- **Correctness:** Lake reuses a compiled file only if the hashes of its source, its dependencies and the toolchain
  match, so a stale cache costs time, never correctness. The caps marker (`.lake/build/caps-closure.sha`) additionally
  ties the cached node caps to their source files; the digest in the cache key lets the route find the right cache.
- **Trust:** a cached `native_decide` result is not re-executed. So only CI writes GitHub caches: master's green
  check, droplet checks and green `ready/` checks for their own branch. Never publish a private build to GitHub.
- **Changing the node caps:** a change in their import closure (`scripts/caps_stamp.py --list`) makes the next check
  run on the droplet; it builds the caps once for exactly the tree that will be merged. After the merge, master's
  check also runs on the droplet (master has no cache for the new caps yet) and finds them already built in the same
  workspace. Never run a separate manual caps verification, and avoid touching that closure casually.
- **Step by step, when a delivery changes the node caps** (e.g. a new cap row):
  1. You push `ready/<agent>-<topic>` (push only that; a work branch pushed first costs one extra droplet run).
  2. The route finds no GitHub cache for the new caps digest and sends the build job to the **droplet**. It builds
     only what changed (the new row and what imports it; hours if a row really changed), runs every check, marks the
     caps as verified, and **uploads `.lake/build` to GitHub's cache itself** (for this branch). The check shows
     "pending" meanwhile. Nothing is copied by hand.
  3. When green, CI moves master and dispatches master's check. With the tree handoff that check downloads exactly
     this build and runs on GitHub in minutes; without it (master moved meanwhile) it goes to the droplet, whose
     workspace already holds the new caps, so it takes minutes too. Either way it saves the new **master cache**,
     and every later run is GitHub-hosted again.
  4. GitHub caches are visible only to their own branch and to master. So a second branch with the same new caps
     (e.g. `ready/` after a work branch) goes to the droplet once more: minutes, because the workspace is warm.
- **Retention:** GitHub deletes cache entries unused for 7 days; a weekly job (`keepalive`) restores the master cache
  to keep it alive. Master keeps its newest two caches.

## 11. Cloud jobs: builds, checks and computations on GitHub Actions

Use GitHub Actions as a compute cloud instead of the laptop (shared by every agent) or the droplet (one heavy job at
a time). Every job runs a **pushed** commit, so it is reproducible, and its results come back as files.

```sh
scripts/cloud.sh lean Grothe.UpperChaos.HardyArcPart0 Grothe.UpperChaos.HardyArcPart1   # build modules
scripts/cloud.sh --shards 2 lean M0 M1 M2 M3                # modules dealt over 2 parallel jobs (e.g. native_decide facts)
scripts/cloud.sh check                                      # the full proof check of the branch, without merging
scripts/cloud.sh --shards 2 script tools/sweep.py --grid 64 # a committed .py/.sh/.cpp, 2 shards (SHARD, NSHARDS)
scripts/cloud.sh --runner droplet script tools/big.py       # script jobs needing > 15 GB or > 6 h
scripts/cloud.sh list; scripts/cloud.sh fetch <run-id>      # recent runs; download results later
```

- **Cloud jobs are for experiments, not for "does my branch build?".** If you want to know whether work you mean to
  deliver is green, push it as `ready/<agent>-<topic>` instead: that one check builds and checks it, and merges it
  only if green (a red `ready/` check merges nothing; fix and push again). Use `cloud/` for script jobs, sweeps and
  builds of unfinished modules that are not meant to land yet.
- **What runs:** the tip of the branch on GitHub (`--ref`; default: your current branch, which must be pushed and
  up to date). For quick experiments push a scratch branch `cloud/<agent-id>-<topic>`: the proof check skips
  `cloud/**`. Delete it when done (§14).
- **Lean jobs** (`lean`, `check`) run on GitHub-hosted runners (measured: 4 vCPUs, AMD EPYC, 15 GB RAM, 85 GB free
  disk; at most 6 hours per job) and start from the master cache, so only what your branch changes is built. `lean`
  deals the modules round-robin over the shards (at most 2 at a time, the per-agent limit of §8): split long `native_decide` checks into separate modules and run them
  in parallel. `check` needs a verified cache for the branch's node caps; if they changed, push the branch instead
  (§8).
- **Script jobs** run a script committed in the branch (never an inline command): `.py` with `python3` (packages in
  `tools/cloud-requirements.txt`), `.sh` with `bash`, `.cpp` compiled with `g++ -O2`. Each shard gets `SHARD`,
  `NSHARDS` and `OUT`; write results to `$OUT`. Inputs of committed data still live in `data/` (§13).
- **Results:** `handoff/cloud/<id>/<shard>/` (`log.txt`, `summary.json`, and the files written to `$OUT`); artifacts
  stay on GitHub for 7 days. `cloud.sh` exits 0 iff every shard succeeded.
- **Trust:** cloud jobs only read the master cache, never write one. A cloud `check` is advice; only the delivery
  check (§7) merges. Never use it as a pre-check before delivering: push the `ready/` branch instead.
- **Speed:** Lean compiles each module on one thread after its imports, so wall time follows the longest dependency
  chain, not the core count; more cores or shards help only where many modules are independent.
- **Droplet** (`--runner droplet`): script jobs only, in a throwaway directory, never in the runner's workspace. It
  queues behind the runner's other jobs (proof checks included).
- **Cost:** every job-minute is billed beyond the free quota, and shards multiply minutes. Prefer few, purposeful
  jobs; never poll in loops that re-dispatch.

## 12. Shared machines

- **Laptop:** 8 cores, shared by every agent. At most one heavy job at a time across all agents; no full builds (§5).
  Kill only your own processes, by pid or process group. Never `pkill -f` or `killall`: they kill other agents' work.
- **Starting and stopping long jobs (builds, scans): always in their own process group.** Killing a `lake` process
  does not kill its `lean` children; an orphaned `lean` keeps writing the same `.olean` as a restarted build. Start
  every long job like this, on the laptop or the droplet (`setsid` does not exist on macOS; `set -m` works on both):
  ```sh
  cd <your directory>
  bash -c 'set -m; nohup bash -c "lake build X" > build.log 2>&1 & echo $! > job.pid'
  ```
  `job.pid` holds the process-group id.
  - wait: `while kill -0 "$(cat job.pid)" 2>/dev/null; do sleep 30; done`; never wait with `pgrep -f "<pattern>"`
    (it matches its own command line and never ends);
  - stop the job with all its children and nothing else: `kill -- -"$(cat job.pid)"`; check that it is gone with
    `pgrep -g "$(cat job.pid)"` (prints nothing);
  - never stop a job you did not start; ask its owner or the user.
- **Droplet** (`ssh yo`, Linux, 31 GB RAM, small disk): for heavy computations (scripts, scans) in your own signed
  folder `~/<agent-id>-<topic>` (§2). Heavy **Lean** builds (the node caps, full builds) are not run in private
  folders: push the branch and CI runs them on the droplet's runner (§8). Light Lean builds (a few modules) may run in
  your folder, linking only the shared Mathlib packages (`~/grothe-caps/.lake/packages`; symlink, never hardlink).
- **Before a heavy job on the droplet:** run `scripts/droplet_status.sh` (from the laptop, read-only: load, memory,
  disk, the CI runner, every running Lean build by folder = owner, orphaned processes, the biggest build folders).
  If another agent's heavy job or a CI check runs there, wait. Keep at least 3 GB of disk free (`df -h ~`).

## 13. Lean conventions

- No `sorry`, `axiom`, `implemented_by`, `extern` or `unsafe` (CI rejects them). The build must be warning-free.
- **Inputs of committed data live in the repository.** Anything used to *generate* a committed file (search outputs,
  recipe JSON, certificate data, generator arguments) goes in `data/` (or `handoff/` if it is research-only), never
  only in a session scratchpad, `/tmp` or `/private/tmp`: macOS clears `/private/tmp` on every reboot, and that is
  how the cap recipes were once lost. A generated `.lean` file must be reproducible byte for byte from `data/` with
  its generator; never edit a generated file by hand (change its inputs and regenerate).
- **`native_decide`:** no `Task.spawn` and no other threading over shared data inside code evaluated by
  `native_decide` (a parallel check once crashed with a malloc double free: memory corruption in trusted code). To
  parallelise, split the check into several facts in separate modules; Lake runs them as separate processes.
- Every `native_decide` fact is listed in `data/axioms/native.txt` (read by `scripts/check_axioms.py`) and covered by
  `scratch/Axioms.lean`.
- The repository proves only the current best bounds, written as if designed from the start: no history, no
  superseded certificates, no "v2" naming. Research material goes in `handoff/` (git-ignored).
- Bounds and hypotheses are stated in `README.md`, `docs/overview.tex` (CI builds `OVERVIEW.pdf` from it) and
  `docs/LEAN_DETAILS.md` (§7, step 4).
- The node caps (`CapRowKK`, `CapNodes`) are part of `Grothe` and verified by CI (§8, §10). The cap checker
  (`GrotheCapsKernel/`) is its own precompiled library on purpose (a change to a precompiled library invalidates every
  module that imports it): never import other kernel modules into it.

## 14. Cleaning up: leave nothing behind

Build folders are big (a droplet build is 1–3 GB, a worktree clone diverges as you build), and the machines are
shared: disks have run full more than once and stopped everyone's work. Clean up what you created as soon as it is
no longer needed.

**When your work is merged, abandoned or handed over:**
1. **Local worktree:** `git worktree remove <path>` (this also deletes its build clone and untracked logs). If it
   refuses because of local changes, commit or push them first, or ask the user. Never `--force` over uncommitted
   work you have not looked at.
2. **Local branches:** `git branch -d <branch>` for every merged branch you created. Delete an unmerged one (`-D`)
   only once its content is delivered or deliberately abandoned, and say so in the issue.
3. **Remote branches:** delete your merged branches on GitHub (`git push origin --delete <branch>`). CI deletes the
   `ready/` branches it merges, and GitHub deletes merged pull-request branches. Do not keep backup branches
   (`…-before-…`, `…-pre-rebase`) once a rebase or merge is verified.
4. **Droplet:** stop your jobs (`kill -- -"$(cat job.pid)"`), then delete your signed folder
   (`ssh yo 'rm -rf ~/<agent-id>-<topic>'`) once its results are committed (inputs in `data/`, research results in
   `handoff/`, §13).
5. **Scratch files:** delete logs, `job.pid` files, exported data, snapshots, zips and throwaway modules you created
   outside the tracked files, in the worktree before removing it and on the droplet. Keep only the newest of
   anything you keep.
6. **Issue:** say in the issue that you cleaned up, and remove your `owner:` and `status:` labels if you stop.

**Never delete what is not yours:** another agent's worktree, branch or droplet folder; the laptop's shared master
build (`.lake/master-cache` in the main checkout, and the worktree `grothe-master-build`); the runner (`~/actions-runner`);
the shared Mathlib packages (`~/grothe-caps/.lake/packages`). If something looks stale but is not yours, list it for
the user.

**Check periodically:** `AGENT_ID=<your id> scripts/sync_master.sh` (the branch audit), `git worktree list`, `git branch -vv`, `git branch -r`, `scripts/droplet_status.sh` and
`df -h`. Leave the machines at least as clean as you found them.
