# Rules for AI agents working on this repository

Several agents (Codex instances and Claude sessions) work on this repository at the same time.
These rules keep them from overwriting each other's work. Read them before doing anything.

## 1. Master and the main checkout

- Never work in, switch branches in, or commit from the **main checkout**
  `/Users/alingalatan/workspaces/grothe`.
- Never push to `master` directly, and never force-push anything.
- **Delivering work: CI auto-merge.** Every pushed branch is built and checked by CI
  (`.github/workflows/lean.yml`): the full Lean build, the sorry/axiom/`Task.spawn` grep, the axiom report and the
  caps stamp.
  - Work branches (`codex/<topic>`, `work/<topic>`) are only checked.
  - To deliver, push the finished commit to a branch named **`ready/<topic>`**:
    `git push origin HEAD:ready/<topic>`.
  - CI merges it into the **current** master, builds and checks the **merged** tree, and only if everything is green
    fast-forwards `master` to that merge and deletes `ready/<topic>`. If anything fails, master is untouched; fix
    and push `ready/<topic>` again.
  - Auto-merges run one at a time. If master moved during the build, the final push is rejected; push the ready
    branch again.
  - Do not run a full build locally just to deliver; CI does it. Do run the modules you changed.
  - Push to `ready/` only when the user (or the integrator) says the work should go into master.
- The README, `OVERVIEW.pdf` and `docs/LEAN_DETAILS.md` must describe what master proves: update them in the same
  `ready/` branch when your change alters a bound, a hypothesis or the axiom report.

## 2. Starting work

```sh
git -C /Users/alingalatan/workspaces/grothe fetch
git -C /Users/alingalatan/workspaces/grothe worktree add -b codex/<topic> \
    /Users/alingalatan/workspaces/grothe-codex-<topic> origin/master
mkdir -p /Users/alingalatan/workspaces/grothe-codex-<topic>/.lake
ln -s /Users/alingalatan/workspaces/grothe/.lake/packages \
    /Users/alingalatan/workspaces/grothe-codex-<topic>/.lake/packages
```

Disk space is tight. Do not copy `.lake/build` wholesale; it is about 1.6 GB per copy. Build only
the modules you change (`lake build Grothe.X.Y`). Run full builds on the droplet (see §4).

## 3. If you find yourself in the main checkout

Run `pwd; git rev-parse --show-toplevel; git branch --show-current; git status --short`.

If the toplevel is `/Users/alingalatan/workspaces/grothe`:

1. Decide whether the uncommitted changes there are yours.
2. If they are **not yours**, touch nothing (no commit, stash, reset or checkout). Move yourself
   to your own worktree as in §2, and report "NOT MINE".
3. If they are **yours**:
   - Stop the builds you started there, killing them by pid.
   - Commit everything on your branch: `git add -A && git commit -m "WIP: ..."`. Never stash,
     reset or discard.
   - Create your worktree from that branch: `git worktree add <path> <branch>`.
   - Only if `git status --short` in the main checkout is then empty, run
     `git -C /Users/alingalatan/workspaces/grothe switch master`.
   - Report the commit, the branch, your new path, and whether the main checkout is clean.

## 4. Shared machines

- **Laptop:** 8 cores, shared by every agent. Do not start more than one heavy build at a time.
  Kill your own processes by pid. Never use `pkill -f` or `killall`: it kills other agents' builds.
- **Waiting on a process:** wait on its pid, e.g. `while kill -0 <pid>; do sleep 30; done`.
  Never wait with `pgrep -f "<pattern>"`, because it matches its own shell command line and never ends.
- **Droplet** (`ssh yo`): use it for heavy runs, each agent in its own directory under `~`. Its
  disk is small, so check `df -h ~` first and keep at least 3 GB free. The Lean packages in
  `~/grothe-caps/.lake/packages` can be symlinked; do not hardlink into other agents' build
  directories.
- **Snapshots:** delete superseded snapshots and zips you created. Keep only the newest.

## 5. Lean conventions

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
  and `docs/LEAN_DETAILS.md` (see §1).
- The node caps (`GrotheCaps`) are not built by CI. If you change any file in their import closure, CI fails at
  the caps stamp: rebuild them on the droplet and re-stamp (README, "Node caps").
