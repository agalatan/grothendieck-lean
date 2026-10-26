# Rules for AI agents working on this repository

Several agents (Codex instances and Claude sessions) work on this repository at the same time.
These rules keep them from overwriting each other's work. Read them before doing anything.

## 0. Work items live in GitHub Issues

All planned work is tracked as GitHub Issues: **epics** (label `type: epic`), with **tasks** (`type: task`) as
sub-issues. Labels give the area (`area: lean`, `area: docs`, `area: infra`, `area: research`, `area: compute`),
the side (`side: lower`, `side: upper`), the owner (`owner: codex`, `owner: claude`) and the status
(`status: in progress`, `status: blocked`, `status: needs decision`).

- **Before starting:**
  - Find the issue (`gh issue list`, `gh issue view <n>`). If none exists, create one with full context.
  - Comment that you are starting, with your branch and worktree.
  - Set the `owner:` and `status: in progress` labels.
- **While working:**
  - Reference the issue in commit bodies (`Refs #<n>`).
  - Comment on the issue when you push a milestone or hit a blocker.
  - Update the labels as things change.
- **When delivering:**
  - Put `Closes #<n>` in the body of a commit of the delivery. The CI auto-merge closes the issue itself, with a comment
    naming the delivery, once master moves (GitHub's own keyword handling does not fire for the workflow's push).
  - Tick the task in its epic.
- **Attack plans and research ideas are issues too** (`area: research`), with the full reasoning and numbers. Do not
  leave them only in a local file.

## 0b. Agent ID: make yourself identifiable

Many agents run at once, and several Codex conversations start with the same words. So the user cannot tell which
conversation owns a droplet folder, a branch or a running build. At the start of every session:

1. **Pick an agent ID:** your kind plus four random hex digits, e.g. `codex-7f3a` or `claude-b21e` (for example
   `printf 'codex-%04x\n' $RANDOM`). Keep it for the whole conversation.
2. **Make it visible in the conversation.**
   - Start your first reply with `Agent ID: codex-7f3a`.
   - If your interface lets you name or rename the conversation, put the ID at the start of the title,
     e.g. `codex-7f3a — lower refined cover`.
3. **Sign everything you create with it:**
   - **droplet folders:** `~/<agent-id>-<topic>`, e.g. `~/codex-7f3a-refined-cover`;
   - **long-running jobs:** keep the `job.pid` inside that folder (§5);
   - **commits:** add an `Agent-ID: codex-7f3a` trailer at the end of the commit message body;
   - **issue comments:** start with `[codex-7f3a]`;
   - branch names keep the scheme of §1. Put the ID in the body of the delivered commit, not necessarily in the name.
4. **Write it down when you hand over.** In every status note or hand-over file, give your ID, so the user can find
   your conversation by searching for it.

`scripts/droplet_status.sh` lists droplet builds by folder, so a signed folder tells the user exactly whom to ask
or stop.

## 1. Ground rules

- **Never commit on `master`**, locally or on GitHub, and never push to it. Only CI moves `master`, through the
  auto-merge in §4. Local `master` is a read-only mirror of `origin/master`, updated by `scripts/sync_master.sh`
  (fast-forward only).
- **Never work in the main checkout** `/Users/alingalatan/workspaces/grothe`. It stays on `master`, clean, and is only
  fast-forwarded. Every agent works in its own worktree, on its own branch:

  | agent | branch | worktree |
  |---|---|---|
  | Codex instance | `codex/<topic>` | `/Users/alingalatan/workspaces/grothe-codex-<topic>` |
  | Claude session | `claude/<topic>` | `/Users/alingalatan/workspaces/grothe-claude-<topic>` |
  | Claude worker (sub-agent) | `claude/<topic>` | `/Users/alingalatan/workspaces/grothe/.claude/worktrees/<topic>` |

- **Say who made it, in every branch and commit.**
  - Branches start with `codex/` or `claude/`, and delivery branches with `ready/codex-<topic>` or
    `ready/claude-<topic>`.
  - Every commit subject starts with `[codex]` or `[claude]`, e.g. `[codex] Lower: joint image compatibility`.
  - CI's auto-merge commit is `Merge ready/<name> (CI auto-merge)`, so the author shows in master's history.
  - Older branches named `work/<topic>` are Claude's.
- **Never force-push, never rewrite pushed history.** Never use `git stash` in a shared checkout, and never
  `reset --hard`, `clean` or `checkout --` files you did not create.
- **Always sync before you work and before you deliver:** run `scripts/sync_master.sh`. It fetches, prunes, and
  fast-forwards the local `master`. It refuses to touch a checkout with local changes.

## 2. Starting work

```sh
/Users/alingalatan/workspaces/grothe/scripts/sync_master.sh   # or the copy in your worktree
git -C /Users/alingalatan/workspaces/grothe worktree add -b codex/<topic> \
    /Users/alingalatan/workspaces/grothe-codex-<topic> origin/master
mkdir -p /Users/alingalatan/workspaces/grothe-codex-<topic>/.lake
ln -s /Users/alingalatan/workspaces/grothe/.lake/packages \
    /Users/alingalatan/workspaces/grothe-codex-<topic>/.lake/packages
# start from master's compiled build instead of an empty one: an APFS clone (instant, no extra disk until
# files diverge; `cp -c` is macOS copy-on-write). Then Lake rebuilds only what differs from master.
cp -c -R /Users/alingalatan/workspaces/grothe/.lake/build \
    /Users/alingalatan/workspaces/grothe-codex-<topic>/.lake/build
```

Resuming an existing worktree: sync first, then bring your branch up to date (§3, step 3) before continuing.

**The build clone.** The main checkout's `.lake/build` is master's compiled build. It is kept current by
`scripts/sync_master.sh --build`, which starts a background, niced, incremental build of master there (one at a
time). Run it after syncing when you are about to create a worktree, or when master moved a lot. Clone it only
with `cp -c` (APFS copy-on-write): a plain `cp` or `rsync` duplicates about 1.6 GB per worktree, and disk space is
tight. An existing worktree whose build is far behind can be refreshed the same way: delete its `.lake/build`, then
clone again. Build only the modules you change (`lake build Grothe.X.Y`), and run full builds on the droplet (see
§5).

## 2b. Before EVERY push: start from a fresh master

Master moves several times an hour: other agents deliver, and the user merges by hand. A branch pushed on top of an
old master wastes a full CI build and usually conflicts. So before **every** push — a work branch, a `ready/`
delivery, and especially a re-push after a CI failure or a conflict — do this:

1. `scripts/sync_master.sh`: fetch, and fast-forward the local `master` to GitHub's.
2. **Evaluate the delta:** `git log --oneline HEAD..origin/master` and `git diff --stat HEAD...origin/master`. Read
   what changed and decide whether your work must change because of it: renamed lemmas, a new hypothesis interface,
   a better bound, duplicated work, changed data, or regenerated files.
3. **Combine with that fresh master:**
   - never pushed: `git rebase origin/master`;
   - already pushed: `git merge origin/master` (no rebase, no force-push).
4. **Fix every conflict properly.** Resolve each one by understanding both sides; never by taking "ours" or
   "theirs" blindly.
   - Regenerate generated files instead of hand-merging them (`python3 tools/gen_root_imports.py`).
   - Keep the union of sorted list files (`data/axioms/*`, `scratch/Axioms*.lean`).
   - Take master's version of shared scripts and re-apply only your intended change.
5. **Re-check what you touched:** build the changed modules and the modules that import them, and run the script
   tests (`scripts/test_*.py`) and `python3 tools/gen_root_imports.py --check`. Only then push.

If master moved again while you were doing this, repeat from 1. Report the master commit you combined with.

## 3. Delivering work: the checklist

Do this when the user says the work should go into master.

1. **Commit everything** on your branch, so the tree is clean. Research-only files belong in `handoff/` (git-ignored),
   not in the repository.
2. **Sync:** `scripts/sync_master.sh`.
3. **Look at what is new on master before combining:**
   `git log --oneline HEAD..origin/master` and `git diff --stat HEAD...origin/master`.
   Ask yourself whether your work should change because of it:
   - a better bound;
   - renamed or moved lemmas;
   - a new hypothesis interface;
   - work that duplicates yours;
   - changed data.
   Adapt your work so it is the best version relative to master, not just mergeable.
4. **Combine with master.**
   - If your branch was never pushed: `git rebase origin/master`.
   - If it was pushed: `git merge origin/master` (no rebase, no force-push).
   - Lists that every delivery extends no longer conflict:
     - `Grothe.lean` / `GrotheKernel.lean` are **generated** (every module under `Grothe/`, `GrotheKernel/` except
       `data/root-imports-exclude.txt`): never edit them by hand; after adding a module, and after any merge, run
       `python3 tools/gen_root_imports.py` (CI fails if they are stale);
     - `scratch/Axioms.lean`, `scratch/AxiomsCaps.lean`, `data/axioms/*.txt` (native facts and required theorems,
       formerly in `scripts/check_axioms.py`) are sorted one-entry-per-line lists that git union-merges
       (`.gitattributes`); keep them sorted (CI checks order and duplicates);
     - a module that must not be built by CI (e.g. a new `GrotheCaps`-only module) goes into
       `data/root-imports-exclude.txt`;
     - `README.md` still needs a hand merge: describe the combined state.
5. **Lean coverage:**
   - Build every module you added or changed, plus the modules that import them (`lake build <Module> ...`).
   - No `sorry`, no warnings.
   - Every headline theorem has a `#print axioms` line in `scratch/Axioms.lean`, and is in `data/axioms/required.txt`
     if it is a main result.
   - Every new `native_decide` fact is in `data/axioms/native.txt`.
   - A full local build is NOT needed; CI does it.
6. **Documentation:** if a bound, a hypothesis or the axiom report changed, update `README.md`, `docs/overview.tex` +
   `OVERVIEW.pdf` and `docs/LEAN_DETAILS.md` in the same delivery.
7. **Push your branch** (`git push -u origin <branch>`). CI builds and checks it; this push merges nothing.
8. **Deliver:** `git push origin HEAD:ready/<agent>-<topic>`, with `<agent>` = `codex` or `claude`; use a new name
   each time (e.g. `ready/codex-<topic>-2`).
   - CI merges it into the **current** master, builds and checks the **merged** tree. Only if everything is green does
     it fast-forward `master` and delete the `ready/` branch.
   - If CI fails, master is untouched: fix, commit, then do §2b again (fresh master, delta, conflicts) before
     pushing a new `ready/` name.
   - If master moved while CI was building, the run re-dispatches itself automatically: it merges with the new
     master and rebuilds. You will see one failed run ("master moved") followed by a new one. Do nothing.
   - Several `ready/` branches may build at the same time; the first green one moves master.
9. **After the merge:** run `scripts/sync_master.sh`, then either keep working on the branch (go back to §2b before the
   next delivery) or, if you are done, **clean up completely** (§7).

Report to the user: the `ready/` branch name, the CI run, and the resulting master commit.

## 4. The CI workflow

- **What runs:** `.github/workflows/lean.yml` runs on every pushed branch:
  - the full Lean build;
  - the grep for `sorry` / `axiom` / `implemented_by` / `extern` / `unsafe` / `Task.spawn`;
  - the axiom report (`scripts/check_axioms.py`);
  - the caps gate: whether the cached `GrotheCaps` build is verified for the current sources
    (`scripts/caps_stamp.py --check-cache`); if so, `GrotheCaps` is built (replayed) and its axiom report checked.
- **Skipped when nothing Lean-relevant changed:** if a push (for `ready/`: the merge with master) touches only files
  outside `Grothe/`, `GrotheKernel/`, the root `.lean` files, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
  `scratch/Axioms.lean`, `scratch/AxiomsCaps.lean` (the CI axiom reports; other `scratch/` files are not built by CI), `scripts/check_axioms.py`, `scripts/caps_stamp.py` and `.github/workflows/`, the build and the checks are
  skipped and the job succeeds. Documentation-only deliveries still auto-merge.
- **What differs for `ready/<topic>`:** the merge with master and the auto-merge. A push to master by CI does not start a
  new run (GitHub never triggers workflows from the workflow token); the merged commit is exactly the tree that was
  checked, and CI marks it with the status "Lean proof check (verified before merge)" linking to that run.
- **Deliveries that change `.github/workflows/`** cannot be pushed to master with the default workflow token (GitHub
  refuses it). They auto-merge only if the repository secret `MERGE_TOKEN` exists (a fine-grained personal access token
  for this repository with *Contents: read and write* and *Workflows: read and write*); otherwise open a pull request
  and let the user merge it. CI says so explicitly and does not retry.
- **Build cache (one, owned by master).** All runs restore `.lake/build` from the Actions cache written by the last
  **warm** run on master; no other run saves a cache (per-branch entries evicted each other in the 10 GB quota). After
  every auto-merge CI dispatches a warm run on the droplet's self-hosted runner (labels `self-hosted, heavy`): an
  incremental `lake build Grothe GrotheCaps` in a persistent workspace, both axiom reports, then the cache save. So
  GitHub-hosted runs start from master's latest build *including* the verified caps modules. Trust: a cached
  `native_decide` result is not re-executed; only our own runner on master writes the cache, and Lake reuses a file
  only if its source, dependency and toolchain hashes match; the droplet also records the caps' source hash in the cache
  (`.lake/build/caps-closure.sha`), and CI builds `GrotheCaps` only when it matches.
- **Caps changes.** If a change touches a file in the caps closure, the cached caps no longer match and CI does not try
  the hours-long build (it would time out): it dispatches a **caps** run on the droplet for that branch (for `ready/`:
  the tree merged with master) and fails with a message. The droplet builds `GrotheCaps`, runs both axiom reports, marks
  and saves a cache for that branch, and re-dispatches the check, which then passes. Nothing to do by hand; just wait.
- **The runner** is installed with `scripts/droplet_runner_setup.sh` (from the laptop; see its header for stop/remove).
  It shares Mathlib with the other droplet work via `~/grothe-caps/.lake/packages` — do not delete that directory.
- **Superseded runs are cancelled automatically.** Pushing a branch again cancels that branch's older CI run (one
  concurrency group per branch, `cancel-in-progress`); other branches and the droplet's heavy jobs are unaffected. No
  manual `gh run cancel` is needed for re-pushes.
- **Cost:** every push uses CI minutes, which the private repository pays for. Push work branches when they matter,
  not after every small commit.

## 4a. Pull requests

- **Agents open a pull request only for deliveries that change `.github/workflows/`** (the workflow token cannot push
  those). Every other delivery goes through `ready/<agent>-<topic>` alone, with no PR: CI merges it into the current
  master, checks the merged tree and moves master.
- **Agents never merge a pull request by hand.**
- **The user may merge by hand** to speed up the queue, provided the PR branch is up to date with master (no
  "out-of-date" warning on GitHub) and its latest CI run is green. Then the merged result is the tree CI checked. A
  hand merge is a normal push, so CI also runs on master afterwards.

## 4c. Lean build caches: who writes, who reads, how to bootstrap

There is **one canonical master build**: the GitHub Actions cache written by **warm** runs on master. Those runs execute
on the droplet's self-hosted runner, whose persistent workspace (`~/actions-runner/_work/…`) produces it. Everything
else reads from it or mirrors it, and nothing else writes it.

| cache | written only by | read by |
|---|---|---|
| GitHub master cache (`lake-build-v2-<toolchain+manifest>-<sha>`) | warm runs on master (droplet runner) | every CI run |
| GitHub branch cache | caps runs for that branch (droplet runner) | later CI runs of that branch |
| runner workspace (droplet) | the runner, one job at a time; it records the built commit in `.lake/build/built-commit` | nobody directly; do not copy into it or out of it by hand |
| main checkout `.lake/build` (laptop) | `scripts/sync_master.sh --build`, on a clean master only | laptop worktrees, as private `cp -c` clones |

**Correctness.** Lake reuses a compiled file only if the hashes of its source, its dependencies and the toolchain
match, so a stale cache costs time, never correctness. The caps marker (`.lake/build/caps-closure.sha`) also ties the
cached caps to their source files. **Trust.** A cached `native_decide` result is not re-executed, so only the runner,
and only for master or the branch it was asked to build, may write a shared cache. Never publish a cache from a
private build.

**Bootstrap (every agent, at the start of work):**
- **Laptop:**
  1. Run `scripts/sync_master.sh --build`.
  2. Create your worktree.
  3. `cp -c -R /Users/alingalatan/workspaces/grothe/.lake/build <worktree>/.lake/build` (§2).

  Lake then rebuilds only what your branch changes.
- **Droplet:** do not run heavy builds (`GrotheCaps`, the certificate chunks, full builds) in a private folder.
  Dispatch them to the runner: `gh workflow run lean.yml --ref <your pushed branch> -f mode=caps`. The runner builds in
  its warm workspace, checks both axiom reports, and saves a cache for your branch that your next CI runs reuse.
  Light builds (a few modules) may run in a private signed folder (§0b) that links only the shared Mathlib packages
  (`~/grothe-caps/.lake/packages`).
- **Never run a separate manual caps verification.** If your change touches the caps closure, push it (a `ready/`
  delivery or a dispatched caps run). CI's caps run builds the caps for exactly the tree that will be merged, saves
  them as the branch cache, and after the merge the master warm run finds them already built in the same workspace.
  So one build serves the validation, the branch check and the new master cache.

## 4b. If you find yourself in the main checkout

Run `pwd; git rev-parse --show-toplevel; git branch --show-current; git status --short`.
If the toplevel is `/Users/alingalatan/workspaces/grothe`:

1. If the uncommitted changes there are **not yours**, touch nothing. Move to your own worktree (§2) and report
   "NOT MINE".
2. If they are **yours**:
   - Stop your builds (by pid).
   - Commit everything on your own branch (never stash, reset or discard).
   - Run `git worktree add <path> <branch>` and continue there.
   - Only if `git status --short` in the main checkout is then empty, run
     `git -C /Users/alingalatan/workspaces/grothe switch master`.
   - Report what you did.

## 5. Shared machines

- **Laptop:** 8 cores, shared by every agent. Do not start more than one heavy build at a time.
  Kill your own processes by pid. Never use `pkill -f` or `killall`: it kills other agents' builds.
- **Waiting on a process:** wait on its pid, e.g. `while kill -0 <pid>; do sleep 30; done`.
  Never wait with `pgrep -f "<pattern>"`, because it matches its own shell command line and never ends.
- **Starting and stopping long jobs (builds, scans): always in their own process group.** Killing a `lake` process
  does not kill its `lean` children; an orphaned `lean` keeps writing the same `.olean` as a restarted build. Start
  every long job like this, on the laptop or the droplet (`setsid` does not exist on macOS; `set -m` works on both):
  ```sh
  cd <your directory>
  bash -c 'set -m; nohup bash -c "lake build X" > build.log 2>&1 & echo $! > job.pid'
  ```
  `job.pid` holds the process-group id. To wait: `while kill -0 "$(cat job.pid)" 2>/dev/null; do sleep 30; done`.
  To stop the job with ALL its children and nothing else: `kill -- -"$(cat job.pid)"`. Check that it is gone with
  `pgrep -g "$(cat job.pid)"` (prints nothing). Never stop a job you did not start; ask its owner or the user.
- **Droplet** (`ssh yo`): use it for heavy runs, each agent in its own directory under `~`. Its
  disk is small, so check `df -h ~` first and keep at least 3 GB free. The Lean packages in
  `~/grothe-caps/.lake/packages` can be symlinked; do not hardlink into other agents' build
  directories.
- **Droplet status:** `scripts/droplet_status.sh` (from the laptop, read-only) shows load, memory, disk, the CI runner,
  every running Lean build by directory (= owner) with its age, orphaned `lean` processes and the biggest build
  directories. Check it before starting a heavy job: if another agent's heavy build (or the runner's warm/caps job)
  is running, wait.
- **Cleanup policy:** when your work is merged or abandoned, delete your own droplet build directory
  (`~/<your dir>/.lake/build`, or the whole directory). Never delete another agent's directory, the runner's
  workspace (`~/actions-runner`), or the shared Mathlib packages (`~/grothe-caps/.lake/packages`).
- **Snapshots:** delete superseded snapshots and zips you created. Keep only the newest.

## 6. Lean conventions

- No `sorry`, `axiom`, `implemented_by`, `extern` or `unsafe` (CI rejects them). The build must
  be warning-free.
- **Inputs of committed data live in the repository.** Anything used to *generate* a committed file (search
  outputs, recipe JSON, certificate data, generator arguments) goes in `data/` (or `handoff/` if it is research-only),
  never only in a session scratchpad, `/tmp` or `/private/tmp`: macOS clears `/private/tmp` on every reboot, and that is
  how the cap recipes were once lost. A generated `.lean` file must be reproducible byte for byte from `data/` with its
  generator; never edit a generated file by hand (change its inputs and regenerate).
- **`native_decide`:** no `Task.spawn`, and no other threading over shared data, inside code
  evaluated by `native_decide`. A parallel check crashed with a malloc double free, which means
  memory corruption in trusted code. To parallelise, split the check into several facts in
  separate modules; lake runs them as separate processes.
- Every `native_decide` fact must be listed in `data/axioms/native.txt` (read by `scripts/check_axioms.py`) and covered by
  `scratch/Axioms.lean`.
- The repository proves only the current best bounds, written as if designed from the start. No
  history, no superseded certificates, no "v2" naming. Research material goes in `handoff/`, which
  is git-ignored.
- Bounds and hypotheses are stated in `README.md`, `OVERVIEW.pdf` (source `docs/overview.tex`)
  and `docs/LEAN_DETAILS.md` (see §3, step 6).
- The node caps (`GrotheCaps`) are built on the droplet runner and replayed by CI from the cache. Changing a file in
  their import closure triggers a droplet rebuild of hours (§4) — avoid touching that closure casually. The cap checker
  (`GrotheCapsKernel/`) is its own precompiled library on purpose: never import other kernel modules into it.

## 7. Cleaning up: leave nothing behind

Lean build directories are big: each worktree build clone diverges from its source as you build, a droplet build is
1–3 GB, and the laptop and the droplet are shared. Disks have run full more than once and stopped everyone's work.
So every agent cleans up what it created, as soon as it is no longer needed.

**When your work is merged, abandoned or handed over:**
1. **Local worktree:** `git worktree remove <path>`. This also deletes its `.lake/build` clone and its untracked logs.
   If it refuses because of local changes, commit or push them first, or ask the user. Never `--force` over
   uncommitted work you have not looked at.
2. **Local branches:** `git branch -d <branch>` for every branch you created that is merged. For unmerged ones, delete
   them only once their content is delivered or deliberately abandoned, with `-D`, and say so in the issue.
3. **Remote branches:** delete your merged branches on GitHub (`git push origin --delete <branch>`), including
   `ready/` branches merged through a PR (CI deletes them only when it merges them itself). Do not keep backup
   branches (`…-before-…`, `…-pre-rebase`) once the rebase or merge is verified.
4. **Droplet:** delete your signed folder (`ssh yo 'rm -rf ~/<agent-id>-<topic>'`, §0b) once its results are committed
   (inputs in `data/`, research results in `handoff/`, §6). Stop your jobs first (`kill -- -"$(cat job.pid)"`).
5. **Scratch files:** delete logs, `job.pid` files, exported data and throwaway modules you created outside the
   repository's tracked files: in the worktree before removing it, and on the droplet.
6. **Issue:** say in the issue that you cleaned up, and remove your `owner:` and `status:` labels if you stop working
   on it.

**Never delete what is not yours:** another agent's worktree, branch or droplet folder, the main checkout's
`.lake/build` (the shared master build), the runner's workspace (`~/actions-runner`), or the shared Mathlib packages
(`~/grothe-caps/.lake/packages`). If something looks stale but is not yours, list it for the user instead.

**Check periodically:** `git worktree list`, `git branch -vv`, `git branch -r`, `scripts/droplet_status.sh` and
`df -h`. Leave the machines at least as clean as you found them.
