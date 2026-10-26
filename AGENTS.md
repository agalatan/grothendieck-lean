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
```

Resuming an existing worktree: sync first, then bring your branch up to date (§3, step 3) before continuing.

Disk space is tight. Do not copy `.lake/build` wholesale; it is about 1.6 GB per copy. Build only the modules you
change (`lake build Grothe.X.Y`). Run full builds on the droplet (see §5).

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
9. **After the merge:** run `scripts/sync_master.sh`, then `git branch -d <branch>` and `git worktree remove <path>` if
   you are done, or keep working on the branch (go back to step 3 before the next delivery).

Report to the user: the `ready/` branch name, the CI run, and the resulting master commit.

## 4. The CI workflow

- **What runs:** `.github/workflows/lean.yml` runs on every pushed branch:
  - the full Lean build;
  - the grep for `sorry` / `axiom` / `implemented_by` / `extern` / `unsafe` / `Task.spawn`;
  - the axiom report (`scripts/check_axioms.py`);
  - the caps stamp (`scripts/caps_stamp.py --check`).
- **Skipped when nothing Lean-relevant changed:** if a push (for `ready/`: the merge with master) touches only files
  outside `Grothe/`, `GrotheKernel/`, the root `.lean` files, `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`,
  `scratch/Axioms.lean` (the CI axiom report; other `scratch/` files are not built by CI), `scripts/check_axioms.py`, `scripts/caps_stamp.py` and `.github/workflows/`, the build and the checks are
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
  only if its source, dependency and toolchain hashes match. The caps stamp remains an independent check.
- **Caps changes.** If a `ready/` delivery changes a file in the caps closure, its stamp check fails and CI dispatches a
  **caps** run on the droplet: it builds `GrotheCaps` for the merged tree (hours), commits the new stamp onto the ready
  branch and re-dispatches the check. Nothing to do by hand; just wait.
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
- The node caps (`GrotheCaps`) are not built by CI. If you change any file in their import closure, CI fails at
  the caps stamp: rebuild them on the droplet and re-stamp (README, "Node caps").
