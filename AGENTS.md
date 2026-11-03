# Rules for AI agents working on this repository

Several agents (Codex instances and Claude sessions) work on this repository at the same time, on two shared
machines (the user's laptop and the droplet). These rules keep them from overwriting each other's work. Read all of
them before doing anything.

**Branches are diffs** (`<agent-id>` is your own ID, e.g. `codex-7f3a`, §2). Every branch is
`<agent-id>/<topic>`, e.g. `codex-7f3a/refined-cover`. Every push runs the proof check of that branch: **information for
its author**, nothing more. What happens next is the author's decision:

| the author wants to… | then |
|---|---|
| keep working, or use CI as a computer | push freely; read the check; delete the branch when it has served its purpose (§14) |
| land it | open a **pull request**: a PR always means "intended to land". Label it `RFC` (not finished, comments on the approach wanted) or `WIP` (still in progress, visible for early feedback) until it is ready |
| abandon it | close the PR (if any) and delete the branch |

**Landing** (§7): a PR lands when it has no `RFC`/`WIP` label, is approved by the other side at its current commit
(§7a), and its author comments `/land <agent-id>` on it. CI then checks the branch **merged into the current master**
and fast-forwards master to exactly that tree only if green. **The author lands, and the author watches:** keep a
timer (a recurring check of your branches and PRs: red checks, review comments, conflicts) until each one is landed
or closed.

**The six rules that matter most:**
1. Never commit or push to `master`. Work in your own worktree on `<agent-id>/<topic>`; land through a PR and
   `/land` (§7). Only CI moves `master`. Build the modules you changed locally (§7); CI checks everything else.
2. Before every push, sync with master and combine with it (§6).
3. Never run a full build (`lake build` or `lake build Grothe`) on the laptop. Build only your modules; full builds
   run in CI (§5, §8).
4. Sign everything with your agent ID (§2) and clean up after yourself (§14).
5. Never stop, delete or overwrite what another agent started or owns. Ask the user. (One exception: the janitor
   may merge master into another agent's conflicting PR branch, §7.)
6. **At most 2 CI jobs per agent at a time** (proof checks of your branches and cloud shards, §8). Check with
   `scripts/ci_active.sh <agent-id> <your branches>`.

## 1. Work items live in GitHub Issues

All planned work is tracked as GitHub Issues: **epics** (label `type: epic`), with **tasks** (`type: task`) as
sub-issues. Labels give the area (`area: lean`, `area: docs`, `area: infra`, `area: research`, `area: compute`),
the side (`side: lower`, `side: upper`), the owner (`owner: codex`, `owner: claude`) and the status
(`status: in progress`, `status: blocked`, `status: needs decision`).

- **Every PR serves a task issue.** The PR description names at least one **open issue labelled `type: task`**
  (`Closes #n` or `Refs #n`). An epic alone does not count: create the task first, with its area/side/owner labels
  and the context. CI refuses to land a PR without one (`scripts/land_ready.sh`, a notice like a missing review).
- **Before starting:** find the issue (`gh issue list`, `gh issue view <n>`); if none exists, create one with full
  context. Comment that you are starting, with your branch and worktree. Set the `owner:` and `status: in progress`
  labels.
- **While working:** reference the issue in commit bodies (`Refs #<n>`). Comment on the issue when you push a
  milestone or hit a blocker. Update the labels as things change.
- **When landing:** put `Closes #<n>` in the PR description and in the body of a commit of the PR. When CI lands it,
  it closes the issue itself, with a comment naming the PR (GitHub's own keyword handling does not fire for CI's
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
   - branches: **sign every branch with your agent ID**, in a fixed place (§3): `codex-7f3a/<topic>`, where
     `codex-7f3a` is *your* ID. Never put any other hex in a
     branch name: no random or per-branch hash, no suffix at the end (`codex/<topic>-e4b7` is wrong), no ID
     copied from a prompt, another branch, a worktree name or a commit. The same ID goes in the branch name, the
     commits' `Agent-ID` and your first reply: the audits and CI's conflict reports read the owner from the name.
4. **Write it down when you hand over:** give your ID in every status note or hand-over file.

`scripts/droplet_status.sh` lists droplet builds by folder, so a signed folder tells the user whom to ask.

## 3. Ground rules

- **Never commit on `master`**, locally or on GitHub, and never push to it. Only CI moves `master` (§7, §8). The
  local `master` is a read-only mirror of `origin/master`, fast-forwarded by `scripts/sync_master.sh`.
- **Never work in the main checkout** `/Users/alingalatan/workspaces/grothe`. It stays on `master`, clean, and is only
  fast-forwarded (if you find yourself there, see §4). Every agent works in its own worktree, on its own branch:

  | agent (ID) | branch | worktree |
  |---|---|---|
  | Codex instance (`codex-7f3a`) | `codex-7f3a/<topic>` | `/Users/alingalatan/workspaces/grothe-codex-7f3a-<topic>` |
  | Claude session (`claude-b21e`) | `claude-b21e/<topic>` | `/Users/alingalatan/workspaces/grothe-claude-b21e-<topic>` |
  | Claude worker (sub-agent) | `claude-b21e/<topic>` (its session's ID) | `/Users/alingalatan/workspaces/grothe/.claude/worktrees/<topic>` |

  Older branches named `work/…`, `ready/…`, `cloud/…`, `codex/…` or `claude/…`: rename them to `<agent-id>/<topic>`
  (push the new name, delete the old one) and open a PR to land them; `ready/` no longer lands anything.

- **Say who made it:** every branch is your ID followed by the topic, e.g. `codex-7f3a/refined-cover`; every commit
  subject starts with `[codex]` or `[claude]`, e.g. `[codex] Lower: joint image compatibility`. CI's landing commits
  read `Merge <branch> (PR #n, landed by CI)`.
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
git -C /Users/alingalatan/workspaces/grothe worktree add -b codex-7f3a/<topic> \
    /Users/alingalatan/workspaces/grothe-codex-7f3a-<topic> origin/master
# give the worktree master's compiled build (links the shared packages, clones the snapshot)
/Users/alingalatan/workspaces/grothe/scripts/clone_master_build.sh /Users/alingalatan/workspaces/grothe-codex-7f3a-<topic>
```

Resuming an existing worktree: sync, then combine your branch with master (§6) before continuing.

**What to build on the laptop.** Only the modules you change and the modules that import them:
`lake build Grothe.X.Y Grothe.X.Z`. **Never `lake build` or `lake build Grothe`:** the root includes the 15 node-cap
rows (`CapRowKK`) and their assembly `CapNodes`, about 21 CPU-hours cold. Those are verified by CI only (§8, §10),
and nothing but the root imports them, so you never need them locally. **While developing, check your work with
small, targeted builds of the modules you changed** (§12, "where to build"), not by pushing a WIP branch (a full proof
check on a shared runner) or starting a cloud job. Push for a full check at a milestone (§8), or run
`scripts/cloud.sh check` (§11) when a targeted build cannot answer the question.

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
old master wastes a CI run and usually conflicts. So before **every** push (and
especially a re-push after a CI failure, a review or a conflict):

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
     when it lands a PR);
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

## 7. Landing work: the checklist

Land when the work is **finished** and the user wants it in master. Until then it lives on your branch, with or
without a PR (`RFC`/`WIP` labels for early feedback).

1. **Commit everything** on your branch, so the tree is clean. Research-only files belong in `handoff/`
   (git-ignored), not in the repository.
2. **Combine with a fresh master** (§6, all five steps).
3. **Lean coverage** (CI checks all of it; get it right, but do not pre-run CI's full check):
   - **every module you added or changed builds locally** without errors or warnings:
     `lake build Grothe.X.Y Grothe.X.Z` (those modules only, never the whole of `Grothe`). A PR whose own modules do
     not compile is not finished: label it `WIP`;
   - no `sorry`, no warnings;
   - every headline theorem has a `#print axioms` line in `scratch/Axioms.lean`, and is in
     `data/axioms/required.txt` if it is a main result;
   - every new `native_decide` fact is in `data/axioms/native.txt`;
   - a new module is imported by the generated root (run `python3 tools/gen_root_imports.py`). There is one build
     target, `Grothe`; only generated research modules that no proof uses yet go in `data/root-imports-exclude.txt`.
4. **Documentation:** never write counts of the axiom report or of native facts into documents (they conflict
   with every concurrent PR; the lists in `data/axioms/` and `scratch/Axioms.lean` are the record). If a
   bound, a hypothesis or the axiom report changed, update `README.md`,
   `docs/overview.tex` and `docs/LEAN_DETAILS.md` in the same PR. **Never build or commit `OVERVIEW.pdf`:**
   CI rebuilds it from `docs/overview.tex` on master (`.github/workflows/overview.yml`), and merges never conflict on it
   (`merge=ours` in `.gitattributes`).
5. **Open the PR** (`gh pr create --base master --head <agent-id>/<topic>`), if not already open, and remove any
   `RFC`/`WIP` label. Its description says what it proves or changes, the issue it serves (`Closes #n`/`Refs #n`),
   and what is still assumed. Ask for review in the PR (§7a).
6. **Answer every review comment** (a change, or a reasoned rejection). A new push needs a new approval.
7. **Land:** when the branch check is green and the PR is approved at its current commit, comment
   **`/land <agent-id>`** on the PR (`.github/workflows/land.yml`). The request is bound to the PR and its head commit:
   CI merges exactly that commit into the **current** master commit (both pinned), checks the **merged** tree, and
   only if green fast-forwards master to exactly that merge, deletes the branch (only if its tip is still that
   commit), and GitHub marks the PR merged. A push after `/land` needs a new `/land`.
   - If the landing check fails, master is untouched. Read the log, fix, commit, combine with master (§6), push,
     get a new approval, `/land` again.
   - If master moved while CI was checking, CI re-runs the landing check against the new master by itself (a
     notice, not a failure). Do nothing.
   - A PR that changes `.github/workflows/` cannot be pushed by CI's token: the user merges it by hand (§9).
8. **Watch your branches and PRs until they are landed or closed: keep a timer.** Checks take minutes to hours, and
   reviews and conflicts arrive later. Every agent runs a recurring check (Claude: a scheduled task; Codex: its
   heartbeat), at least hourly while it has open work, of `AGENT_ID=<your id> scripts/sync_master.sh`. Its audit
   lists each branch with its check, PR, labels, review and conflicts, and an ACTION line; deal with every ACTION.
   After every move of master, CI checks every open PR (`.github/workflows/ready-sweep.yml`, seconds) and reports
   each one that no longer merges on the PR and on the issues its commits reference.
   - **The janitor** (an agent the user names; currently `claude-b9ee`) acts on these reports: it merges
     `origin/master` into the conflicting PR branch (never a rebase or force-push), resolves the conflicts that are
     mechanical (independent changes on both sides, generated files, lists, documentation describing both), signs the
     merge commit with its own `Agent-ID`, and pushes the same branch. Conflicts of decisions (one side deletes,
     reverts or rewrites what the other changes; different bounds or hypotheses) it does not resolve: it reports
     them on the PR for the owner or the user. An owner who finds a janitor merge on its branch pulls it before
     continuing.
9. **After landing:** `scripts/sync_master.sh`, then clean up (§14).

Report to the user: the PR, the landing run, and the resulting master commit.

## 7a. Independent review (approved by the user, 3 November 2026, #225)

Every PR is reviewed by the other side before it lands: a Codex reviewer for a `claude-…` branch, a Claude reviewer
for a `codex-…` branch. **Everyone reviews open PRs**: look at them on every timer round (§7, step 8); the managers
assign reviewers when needed (#225). `RFC` and `WIP` PRs get comments on the approach; only a PR without those labels
gets a verdict.
- **When:** while its checks run; read the diff and the check's log.
- **What:** the statement matches the prose (quantifiers, domain, hypotheses), numerical premises and tolerances,
  coverage of the domain, provenance of generated data, dependencies and trust (`native_decide`, axioms), and the
  resource cost of the check.
- **Comments:** in the PR, each starting with your ID. Suggestions that do not block say so.
- **Verdict:** `scripts/review.sh <agent-id>/<topic> <sha> approve|block <reviewer-id> "<summary>"`, with the full
  commit you read. It sets the commit status `Independent review` on exactly that commit and refuses if the branch
  has moved past it; a new push needs a new review. (We all push as one GitHub account, so GitHub's own approve button cannot be used.)
- **Status names:** `Lean proof check (verified before merge)` means the merged tree was built and checked;
  `Lean proof check (no proof change)` means no Lean-relevant file changed and the proofs are those of the named
  parent. Never present the second as a proof check.

## 8. CI: the proof check (`.github/workflows/lean.yml`)

**Every run gives one result for its commit: green iff the proofs check.** A ✗ always means a real failure; a cache
miss only makes the run take longer (it stays "pending"). The workflow runs on every pushed branch (a commit message
containing `[skip ci]` skips it) and as the **landing check** of a PR (`/land`, §7), in three jobs:

1. **route** (GitHub-hosted, seconds): for a landing check it merges the branch commit into the current master
   first. It decides
   - whether anything Lean-relevant changed (the `LEAN_PATHS` list in the workflow: Lean sources and roots, the
     lakefile and toolchain, `scratch/Axioms.lean`, `data/axioms/`, the root generator, the check scripts and their
     tests, the workflows). If not, the build is skipped and the run is green; documentation-only PRs still land
     (with the status "no proof change"). A branch commit already contained in master is skipped too (master's own check covers it);
   - where to build: it computes the node caps' source digest (`scripts/caps_stamp.py --digest`, part of the cache
     key) and looks for a verified build cache with that digest, of this branch or of master. **A branch check that
     would need the droplet (the node caps changed) does not take it**: it fails at once, saying so. The landing
     check, master, and an explicit `-f mode=caps` dispatch do use the droplet.
2. **build:** on GitHub if such a cache exists (it restores it; `lake build Grothe` then replays the node caps in
   seconds), otherwise **the same job on the droplet** (self-hosted runner, labels `self-hosted, heavy`). The droplet
   builds in its persistent workspace: hours if the cap rows really changed, minutes otherwise. Then, on either
   runner: `lake build Grothe` (everything, node caps included), the generated-roots check, the grep for `sorry` /
   `axiom` / `implemented_by` / `extern` / `unsafe` / `Task.spawn`, and the single axiom report
   (`scripts/check_axioms.py`). On the droplet it then marks the caps as verified (`.lake/build/caps-closure.sha`) and
   saves the build as a cache. On master it saves the new master cache (§10).
   On GitHub the build **fails fast**: at the first failed module (`✖`) it is stopped and the check fails
   (`scripts/lake_failfast.sh`), so fix that error and push again; the droplet builds on (its work is kept).
3. **finish** (GitHub-hosted, after a green build): on master it prunes old master caches; for a landing check it
   runs `scripts/land_ready.sh`: the PR must still be open, without `RFC`/`WIP`, and approved at the checked commit;
   it recreates the checked merge, verifies that its tree is identical to the checked one, fast-forwards `master`,
   marks the commit "Lean proof check (verified before merge)", closes the `Closes #n` issues, comments on the PR
   and dispatches master's own check (which saves the master cache).

Also:
- **Superseded runs are cancelled automatically:** a new push to a branch cancels that branch's older check, queued
  or running, on GitHub-hosted and heavy runners alike (one concurrency group per branch; the build runs in its own
  process group, which the step kills whole on cancellation, so nothing is orphaned). So a branch has **at most one
  check at a time, of its newest commit**: push once per milestone, not after every commit. Master's checks are never
  cancelled by a newer one starting (a long first build would be lost); instead, when a master check goes green it
  cancels the still-running checks of older master commits, whose trees it contains. What counts is the newest master
  commit's own result. Runs that really build the node caps (no verified cache, or `-f mode=caps`) are never cancelled
  either: hours of work.
- **Where a check runs:** GitHub-hosted (4 vCPUs, 16 GB) unless it needs the heavy runners (`self-hosted, heavy`:
  the droplet and the temporary big droplet): the node caps must be built (no verified cache), `-f mode=caps`, the
  change **modifies or deletes** existing files under the kernel-heavy trees (`Grothe/UpperChaos/`, `Grothe/Upper/`,
  `GrotheKernel/`, `GrotheCapsKernel/`, the lake files: rebuilding the big kernel-checked modules kills a 16 GB VM),
  or the repository variable `FORCE_HEAVY` is `true` (emergency switch: everything heavy). A change that only adds
  modules runs hosted: the restored cache replays everything else. Keep the heavy slots for what needs them.
- **Merged branches are cleaned automatically** (`.github/workflows/cancel-merged.yml`): when a pull request is merged
  or a branch is deleted, its running checks are cancelled and its build caches deleted. Merged pull-request branches
  are deleted automatically (repository setting).
- **`[skip ci]`** is fine for pushes you do not need checked (notes, scratch data). The landing check always runs. **Never cancel another
  agent's CI run** (`gh run cancel` acts with the user's account); ask its owner or the user.
- **Force the droplet** for a pushed branch: `gh workflow run lean.yml --ref <branch> -f mode=caps` (it occupies the
  single runner for hours if the caps really changed; do it on purpose only).
- **The runner** is installed with `scripts/droplet_runner_setup.sh` (from the laptop; see its header for
  stop/remove). It shares Mathlib with other droplet work through `~/grothe-caps/.lake/packages`; never delete that.
- **At most one checked WIP branch per agent.** Of an agent's branches with an open `WIP`/draft PR, only one may
  have a proof check queued or running; a push to a second one is not checked (CI says so in a warning) until the
  first check ends. Push the others with `[skip ci]`: there is no bound on those. Landable PRs are not capped by
  this rule (only by the next one).
- **At most 2 CI jobs per agent at a time.** An agent (one agent ID) may have at most two jobs queued or running in
  GitHub Actions: the proof checks of its own branches (pushes and landing checks) and its cloud jobs,
  each cloud shard counting as one. Before you push a branch or start a cloud job, run
  `scripts/ci_active.sh <agent-id> <your branches...>`: it lists your active jobs and exits 1 when there is no room.
  `scripts/cloud.sh` enforces the limit for cloud jobs (set `AGENT_ID`). Master's own check (after your PR
  lands) does not count. If you are at the limit, wait for a job to finish; a re-push of the same branch replaces
  its running check and does not add one.
- **Cost:** the repository is public, so GitHub-hosted minutes are free; the heavy runners are ours (the droplet and
  temporary big droplets, billed by the hour) and every check queues behind the others'. Push when a check helps
  you, not after every small commit; use `[skip ci]` otherwise.

## 9. Pull requests

- **A PR names its task issue** (`Closes #n`/`Refs #n`, an open `type: task` issue, §1); CI does not land it otherwise.
- **A PR means "intended to land".** Labels: `RFC` (not finished; comments on the approach wanted) and `WIP` (still
  being worked on; visible for early feedback). Neither can land until the label is removed.
- **The author lands its own PR** with `/land <agent-id>` (§7). Nobody presses GitHub's merge button for an
  ordinary PR: a button merge lands a combination nobody checked.
- **Exception: PRs that change `.github/workflows/`.** CI's token may not push those (unless the repository secret
  `MERGE_TOKEN` exists: a fine-grained token with *Contents* and *Workflows* read and write); CI says so and does not
  retry. The user merges them by hand, after review, when the branch is up to date with master and green.

## 10. Build caches: who writes, who reads

| cache | written only by | read by |
|---|---|---|
| GitHub master cache, key `lake-build-v3-<toolchain+manifest>-<caps digest>-<sha>` | the green check of master (on the droplet when the caps changed) | every CI run, cloud jobs |
| GitHub branch cache, same key plus `-run<id>` | droplet checks of that branch, and green landing checks | later checks of that branch (e.g. a landing re-check after master moved); deleted with the branch |
| droplet runner workspace (`~/actions-runner/_work`) | the runner only, one job at a time | nobody else; never copy into it or out of it |
| laptop snapshot `.lake/master-cache` (main checkout) | `scripts/master_build_job.sh` (§5) | laptop worktrees through `scripts/clone_master_build.sh` |
| tree handoff: artifact `lean-build-tree-<tree hash>`, kept 1 day | a green landing check whose checked commit contains the current master | master's check, when master's tree is exactly that tree |

- **Tree handoff:** a branch's caches are invisible to master's runs, so a green landing check whose commit contains
  the current master also uploads its build as an artifact named after its tree. When master then becomes exactly
  that tree (CI's landing fast-forward), master's check downloads that build instead of the older master cache: its
  `lake build` only replays, also when the node caps changed (no second droplet run). Ordinary branch checks upload no
  handoff (each is a 0.4-30 GB artifact); a hand-merged workflow PR is rebuilt from the master cache. Only artifacts of
  `lean.yml` runs are accepted.

- **Correctness:** Lake reuses a compiled file only if the hashes of its source, its dependencies and the toolchain
  match, so a stale cache costs time, never correctness. The caps marker (`.lake/build/caps-closure.sha`) additionally
  ties the cached node caps to their source files; the digest in the cache key lets the route find the right cache.
- **Trust:** a cached `native_decide` result is not re-executed. So only CI writes GitHub caches: master's green
  check, droplet checks and green landing checks for their own branch. Never publish a private build to GitHub.
- **Changing the node caps:** a change in their import closure (`scripts/caps_stamp.py --list`) makes the next check
  run on the droplet; it builds the caps once for exactly the tree that will be merged. After the merge, master's
  check also runs on the droplet (master has no cache for the new caps yet) and finds them already built in the same
  workspace. Never run a separate manual caps verification, and avoid touching that closure casually.
- **Step by step, when a PR changes the node caps** (e.g. a new cap row):
  1. Your branch checks fail at once with "needs the droplet" (they do not occupy it). Build the changed modules
     locally or with `scripts/cloud.sh lean` while you work; when the PR is approved, `/land` it.
  2. The landing check's route finds no GitHub cache for the new caps digest and sends the build job to the **droplet**. It builds
     only what changed (the new row and what imports it; hours if a row really changed), runs every check, marks the
     caps as verified, and **uploads `.lake/build` to GitHub's cache itself** (for this branch). The check shows
     "pending" meanwhile. Nothing is copied by hand.
  3. When green, CI moves master and dispatches master's check. With the tree handoff that check downloads exactly
     this build and runs on GitHub in minutes; without it (master moved meanwhile) it goes to the droplet, whose
     workspace already holds the new caps, so it takes minutes too. Either way it saves the new **master cache**,
     and every later run is GitHub-hosted again.
  4. GitHub caches are visible only to their own branch and to master. So a second branch with the same new caps
     goes to the droplet once more: minutes, because the workspace is warm.
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

- **Cloud jobs are for experiments, not for "does my branch build?"**: every push of your branch already runs its
  proof check, and "do my modules build?" is a targeted `lake build` on a machine with CPU room (§12), not a cloud
  job and not a push. Use cloud jobs for script jobs, sweeps and sharded builds of modules.
- **What runs:** the tip of the branch on GitHub (`--ref`; default: your current branch, which must be pushed and
  up to date). For quick experiments push a scratch branch `<agent-id>/<topic>` with `[skip ci]` in the commit
  message, so the push does not also run the proof check. Delete it when done (§14).
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
- **Trust:** cloud jobs only read the master cache, never write one. A cloud `check` is advice; only the landing
  check (§7) lands. Never use it as a pre-check before landing: the branch's own push check is that.
- **Speed:** Lean compiles each module on one thread after its imports, so wall time follows the longest dependency
  chain, not the core count; more cores or shards help only where many modules are independent.
- **Droplet** (`--runner droplet`): script jobs only, in a throwaway directory, never in the runner's workspace. It
  queues behind the runner's other jobs (proof checks included).
- **Cost:** GitHub-hosted minutes are free (public repository), but the runners are shared by every agent, shards
  multiply the load, and `--runner droplet` occupies a heavy slot by the hour. Prefer few, purposeful jobs; never
  poll in loops that re-dispatch.

## 12. Shared machines

- **Where to build while developing (every AI, Claude and Codex alike):** prefer **small, targeted `lake build`s of
  the modules you changed** (and what imports them) over pushing a WIP branch or starting a cloud job. Run them, in
  this order, wherever there is CPU room: on **yo** (`ssh yo`, 8 vCPUs, 31 GB) if it has room; else on the **big
  droplet** (`ssh big`, 48 vCPUs, 188 GB; temporary, while it exists) if it has room; else **locally** on the laptop.
  "Room" means **at least 50 % of the machine's CPUs idle when you look**: `nproc` against the 1-minute load in
  `cat /proc/loadavg` (yo: load ≤ 4; big: load ≤ 24), or `scripts/droplet_status.sh` for yo. Then use at most that
  room (`taskset -c` a range of cores; Lake has no `-j`, so pin the cores), in your own signed folder (§2) with the
  shared Mathlib packages linked (`~/grothe-caps/.lake/packages` on both droplets, symlink), in a process group
  (below), never in a runner workspace, and delete the folder when done (§14). Never run Lean on a droplet while a
  caps run's bounded builder is active there (its foreign-work guard aborts the run). A full proof check is what a
  push at a milestone is for (§8).
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
   branches it lands, and GitHub deletes merged pull-request branches. Do not keep backup branches
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
