# Rules for AI agents working on this repository

Several agents (Codex instances and Claude sessions) work on this repository at the same time.
These rules keep them from overwriting each other's work. Read them before doing anything.

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
   - Usual conflicts:
     - import lists in `Grothe.lean` / `GrotheKernel.lean`: keep both sides;
     - `scratch/Axioms.lean`: keep both sides;
     - `scripts/check_axioms.py` (NATIVE / REQUIRED): take the union;
     - `README.md`: describe the combined state.
5. **Lean coverage:**
   - Build every module you added or changed, plus the modules that import them (`lake build <Module> ...`).
   - No `sorry`, no warnings.
   - Every headline theorem has a `#print axioms` line in `scratch/Axioms.lean`, and is in REQUIRED if it is a main
     result.
   - Every new `native_decide` fact is in NATIVE.
   - A full local build is NOT needed; CI does it.
6. **Documentation:** if a bound, a hypothesis or the axiom report changed, update `README.md`, `docs/overview.tex` +
   `OVERVIEW.pdf` and `docs/LEAN_DETAILS.md` in the same delivery.
7. **Push your branch** (`git push -u origin <branch>`). CI builds and checks it; this push merges nothing.
8. **Deliver:** `git push origin HEAD:ready/<agent>-<topic>`, with `<agent>` = `codex` or `claude`; use a new name
   each time (e.g. `ready/codex-<topic>-2`).
   - CI merges it into the **current** master, builds and checks the **merged** tree. Only if everything is green does
     it fast-forward `master` and delete the `ready/` branch.
   - If CI fails, master is untouched: fix, commit, and push a new `ready/` name.
   - If the final push was rejected because master moved, push the same commit again under a new `ready/` name.
   - Auto-merges run one at a time.
9. **After the merge:** run `scripts/sync_master.sh`, then `git branch -d <branch>` and `git worktree remove <path>` if
   you are done, or keep working on the branch (go back to step 3 before the next delivery).

Report to the user: the `ready/` branch name, the CI run, and the resulting master commit.

## 4. The CI workflow

- **What runs:** `.github/workflows/lean.yml` runs on every pushed branch:
  - the full Lean build;
  - the grep for `sorry` / `axiom` / `implemented_by` / `extern` / `unsafe` / `Task.spawn`;
  - the axiom report (`scripts/check_axioms.py`);
  - the caps stamp (`scripts/caps_stamp.py --check`).
- **What differs for `ready/<topic>`:** the merge with master and the auto-merge.
- **Cost:** every push uses CI minutes, which the private repository pays for. Push work branches when they matter,
  not after every small commit.

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
- **Droplet** (`ssh yo`): use it for heavy runs, each agent in its own directory under `~`. Its
  disk is small, so check `df -h ~` first and keep at least 3 GB free. The Lean packages in
  `~/grothe-caps/.lake/packages` can be symlinked; do not hardlink into other agents' build
  directories.
- **Snapshots:** delete superseded snapshots and zips you created. Keep only the newest.

## 6. Lean conventions

- No `sorry`, `axiom`, `implemented_by`, `extern` or `unsafe` (CI rejects them). The build must
  be warning-free.
- **`native_decide`:** no `Task.spawn`, and no other threading over shared data, inside code
  evaluated by `native_decide`. A parallel check crashed with a malloc double free, which means
  memory corruption in trusted code. To parallelise, split the check into several facts in
  separate modules; lake runs them as separate processes.
- Every `native_decide` fact must be listed in `scripts/check_axioms.py` and covered by
  `scratch/Axioms.lean`.
- The repository proves only the current best bounds, written as if designed from the start. No
  history, no superseded certificates, no "v2" naming. Research material goes in `handoff/`, which
  is git-ignored.
- Bounds and hypotheses are stated in `README.md`, `OVERVIEW.pdf` (source `docs/overview.tex`)
  and `docs/LEAN_DETAILS.md` (see §3, step 6).
- The node caps (`GrotheCaps`) are not built by CI. If you change any file in their import closure, CI fails at
  the caps stamp: rebuild them on the droplet and re-stamp (README, "Node caps").
