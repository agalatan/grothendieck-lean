---
name: lean-grothe
description: How to work in this repository, the Lean 4 / Mathlib proof of bounds on the complex Grothendieck constant. Covers what is proved and where the constants are stated, the map of the tree, what may be built on which machine, the checks to run before a push, how CI, reviews and landing work, the rules for documents, and the Lean and Mathlib pitfalls that cost hours. Use whenever editing, building, reviewing or documenting anything here.
---

# Working in `grothe`

`AGENTS.md` is the rulebook and wins over this file. Read it at the start of a session. This skill is the short
version plus what the rulebook does not say.

## What the repository proves

`Grothe.Statement.main_bounds` (`Grothe/MainResult.lean`), without hypotheses:

    1.402 < K_G^ℂ ≤ 1.404556407 < 1/γ† = 1.40457593…

- Lower bound: `1402 / 1000`, strict. Witness `P₁,₀ − εP₂,₁ + ν(1 − P₁,₀ − P₂,₁)` with
  (ε, ν) = (191/250, 47/2000); certificate in `Grothe/Lower/`, analysis and node caps in `Grothe/LowerAnalytic/`.
  The bound is the exact endpoint `tight_lower_endpoint` (`1000000000 / 713266399`) rounded strictly downward.
- Upper bound: `1404556407 / 1000000000`, weak (≤). Six Gaussian rounding channels: the library `Grothe/UpperSix/`,
  the certificate `Grothe/UpperSixExact/`. `Grothe/UpperResult.lean` has exactly three theorems:
  `Grothe.UpperSix.bound` (the exact value, for every finite matrix), `constant_le` (rounded up) and
  `constant_lt_inv_gammaDagger`.
- `1/γ†` is Haagerup's proposed value; K is strictly below it.
- An older, independent single-channel upper proof (`Grothe/UpperTightFinal.lean`, K < 1.404599395362) is still built.

**`docs/CONSTANTS.md` is the page that states every constant exactly.** Read the current values from the Lean
statement or from `python3 scripts/check_constants.py --print`, never from memory or from an old note.

## Start of a session

1. Pick an agent ID (`claude-xxxx`, four hex digits), say it in the first reply, sign everything with it.
2. `scripts/sync_master.sh` (with `AGENT_ID=<id>` it also audits your branches and prints ACTION lines).
3. Never work in the main checkout. One worktree per topic:
   ```sh
   git -C /Users/alingalatan/workspaces/grothe worktree add -b <id>/<topic> \
       /Users/alingalatan/workspaces/grothe-<id>-<topic> origin/master
   scripts/clone_master_build.sh /Users/alingalatan/workspaces/grothe-<id>-<topic>   # only if you will build Lean
   ```
4. Every PR names an open issue labelled `type: task`. Create it first.

## Map

| path | what |
|---|---|
| `Grothe/Statement.lean` | definitions only (imports only Mathlib): `scalarOpt`, `vectorOpt`, `IsBound`, `complexGrothendieckConstant`, `UpperBelow`, `LowerAbove` |
| `Grothe/MainResult.lean`, `Grothe/UpperResult.lean` | the theorems |
| `Grothe/Lower/` | lower certificate: exact rational checker, rows, Stein cuts, mass row, envelope, transfer to matrices |
| `Grothe/LowerAnalytic/` | Gaussian analysis for the lower bound; the node caps (`Cap*.lean`, `CapRowKK`, `CapPieces/`, `CapNodes`) |
| `Grothe/UpperSix/`, `Grothe/UpperSixExact/` | the six-channel upper proof: the library, and the certificate of the bound |
| `Grothe/Upper/`, `Grothe/UpperChaos/`, `Grothe/UpperQuad/`, `Grothe/UpperTight*.lean` | the older single-channel upper proof |
| `GrotheKernel/`, `GrotheCapsKernel/`, `GrotheQuadKernel/`, `GrotheQuadExtKernel/` | Mathlib-free checker programs, precompiled libraries |
| `Grothe.lean`, `Grothe*Kernel.lean` | generated roots (`python3 tools/gen_root_imports.py`); never edit by hand |
| `data/` | inputs of generated modules; `data/axioms/` the lists the axiom check reads |
| `tools/` | generators and replay scripts; `scripts/` CI helpers and checks |
| `docs/` | `CONSTANTS.md`, `LEAN_DETAILS.md` (module inventory), `overview.tex` (source of `OVERVIEW.pdf`), notes |
| `research/` | ledgers of open problems (Conjecture K, higher-degree games, identity tail); nothing built; rules in `research/README.md` |
| `haagerup-article/` | the article, **frozen**, with its own Lean package under `anc/`: it never quotes the repository's current bounds |
| `sign/` | separate Lake package GrotheSign; not part of `Grothe` or of CI |
| `handoff/` (git-ignored), `miscellaneous/`, `abandonware/` | archives; never built or imported |

## Building

- **Never `lake build` or `lake build Grothe` on the laptop.** The root includes the node caps (hundreds of
  CPU-hours cold). Build only your modules: `lake build Grothe.X.Y`.
- **Before every local build, check the import closure**: if the module imports `Grothe.LowerAnalytic.CapNodes`
  (directly or through `Grothe.MainResult`), do not build it locally. `Grothe/MainResult.lean` is edited without
  a local build.
- The upper bound alone builds locally: `lake build Grothe.UpperResult`, then
  `lake env lean scratch/UpperSixAxioms.lean | python3 scripts/check_axioms.py --upper-six`.
- Where: `ssh yo` (8 vCPUs) if its load is at most 4, else the laptop; in your own folder `~/<id>-<topic>` with
  `~/grothe-caps/.lake/packages` symlinked. One heavy job at a time on the laptop, across all agents.
- Long jobs run in their own process group (`set -m; nohup … & echo $! > job.pid`); stop with
  `kill -- -"$(cat job.pid)"`. Never `pkill -f`, never `killall`, never wait with `pgrep -f`.
- `export PATH="$HOME/.elan/bin:$PATH"`. Quick experiment: `lake env lean scratch/File.lean`.
- A full check is a push (CI) at a milestone, not a local build. At most 2 CI jobs per agent
  (`scripts/ci_active.sh <id> <branches>`); `[skip ci]` for pushes that need no check.

## Never touch

- `lakefile.toml`, `lake-manifest.json`, `lean-toolchain`: pinned by the node-cap registry; any change asks for a
  rebuild of all node caps. A new target goes in its own Lake package (like `sign/`).
- The caps closure (`python3 scripts/caps_stamp.py --list`) unless that is the task; after touching it,
  `python3 scripts/caps_stamp.py --digest` must print a `sha256` line.
- `GrotheCapsKernel/` and `GrotheQuadKernel/`: frozen precompiled libraries; a change recompiles everything that
  imports them (hours to days). New quadrature kernel code goes in `GrotheQuadExtKernel/`.
- `master` (only CI moves it), other agents' branches, worktrees, droplet folders and CI runs.
- `haagerup-article/` when a bound changes; `OVERVIEW.pdf` (CI builds it).

## Before a push

```sh
scripts/sync_master.sh && git merge origin/master      # rebase only if the branch was never pushed
python3 tools/gen_root_imports.py                      # after every merge and every new module
python3 scripts/check_constants.py                     # documents quote the bounds Lean states
python3 scripts/check_md_links.py                      # relative links of the live documents
python3 scripts/test_*.py                              # if you touched scripts
```

Lean changes also need: the changed modules build without warnings; no `sorry`, `axiom`, `implemented_by`,
`extern`, `unsafe`, `Task.spawn`; every headline theorem has a `#print axioms` line in `scratch/Axioms.lean` (and is
in `data/axioms/required.txt` if it is a main result); every new `native_decide` fact is in
`data/axioms/native.txt`. Axiom report: `lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py`.

## Landing

1. PR against `master`, body names the task issue (`Closes #n`), ends with the attribution line.
2. Review by another agent family at the head commit: `scripts/review.sh <branch> <sha> approve|block <reviewer> "<summary>"`.
   Run it only inside a check that the head is still the commit you read. A push after an approval voids it.
3. The author comments `/land <id>`. CI merges into the current master, checks the merged tree, fast-forwards.
4. A PR that changes `.github/workflows/` is merged by the user by hand.
5. After landing: remove the worktree and the branches, say so on the issue.

Commit subjects start with `[claude]`/`[codex]`/`[gemini]`; bodies end with `Agent-ID: <id>`. Issue and PR comments
start with `[<id>]`. Never write a bare `@name` in a comment.

## Trust model, in one paragraph

The kernel checks everything except the `native_decide` facts: decidable statements about committed data that
compiled checker programs evaluate (interval and exact rational arithmetic), each recorded as an axiom named after
the fact and listed in `data/axioms/native.txt`. The checkers' soundness theorems are kernel-checked. No
threading inside `native_decide` code; to parallelise, split a check into facts in separate modules. Say up front
what a Lean theorem assumes; a hypothesis that carries a certified fact is acceptable only as a labelled first
version.

## Documents

- State a bound as Lean states it: decimal plus exact rational, strict or weak as in the theorem. Say what a
  number is the first time it appears. `docs/CONSTANTS.md` lists the older numbers and what each one is.
- When a bound, a hypothesis or the axiom report changes: `docs/CONSTANTS.md`, `docs/overview.tex`,
  `docs/LEAN_DETAILS.md` in the same PR, until `scripts/check_constants.py` passes.
- `README.md` is not edited by ordinary PRs (a wrong number is corrected in place).
- Never write counts of axioms or of native facts. Documents describe the current state: no errata, no "v2".
- On Haagerup: "K is strictly below Haagerup's value 1/γ†, resolving this conjecture of Haagerup". Never
  "refutes"; credit Haagerup only. Heilman–Jones–Malavolta and Guo–Fang–Lu are prior work that the repository cites.
- Generated `.lean` files are reproducible byte for byte from `data/` with their generator; change the inputs,
  never the output. Inputs never live only in `/tmp` or a scratchpad.
- Research ledgers (`research/*/STATUS.md`) are books of the current state, edited in place; history goes under
  `sources/`. Before writing "the only open step", enumerate the ledger's open problems.

## Lean conventions

- Matrices are `Fin m → Fin n → ℂ` (never `Matrix`: `rw` motives fail under implicit transparency).
- Inner product is Mathlib's (conjugate-linear in the first slot). Scalar case: `conj (ε i) * δ j`.
- Decimal literals such as `0.7117964083067696` are exact rationals; `norm_num` handles them.
- The repository proves only the current best bounds, written as if designed from the start: no superseded
  certificates, no history names. Modules that the main proof does not use are not landed.

## Mathlib and Lean pitfalls (toolchain `v4.34.1`)

- `add_le_add_left h a` has the swapped convention; use `add_le_add le_rfl h`.
- `RCLike.inner_apply' : ⟪x, y⟫ = conj x * y`; `PiLp.inner_apply`; `WithLp.toLp 2 f` builds Euclidean vectors
  (`PiLp.toLp_apply`, `PiLp.norm_single`, `EuclideanSpace.inner_single_left`).
- Series: `Summable.tsum_eq_zero_add`, `Summable.sum_add_tsum_nat_add`, `Summable.tsum_finsetSum`,
  `Summable.tsum_le_tsum`, `summable_nat_add_iff`, `Real.tsum_le_of_sum_le` (no summability needed),
  `summable_of_sum_range_le`, `tsum_mul_left/right`, `Summable.of_norm_bounded`.
- `Real.sqrt_le_left (hy : 0 ≤ y) : √x ≤ y ↔ x ≤ y^2`; `Real.pi_lt_d20`, `Real.pi_gt_d20`.
- Integrals: `MeasureTheory.integral_finsetSum`, `integrable_finsetSum`, `integral_const_mul`,
  `integral_mono_of_nonneg`, `Integrable.mono'`, `probReal_univ`.
- Big powers: keep `(10^12)^k` unexpanded; move Nat facts with `Nat.cast_le.mpr` then
  `rw [Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]`; `generalize` the power before `nlinarith`.
  `exact_mod_cast`/`norm_num` on `10^1620` exceeds the recursion depth. Make such definitions `@[irreducible]`
  and expose a `_def` lemma so unification never unfolds them.
- `set` in long proofs causes `whnf` timeouts; use `generalize` or `obtain ⟨B, hB⟩ : ∃ B, ∀ k, B k = …`.
  `set_option maxHeartbeats N in` goes before the docstring.
- `simp only [foo]` already runs simprocs; a second `simp only` can fail with "no progress". After `fin_cases i`,
  use `change _ ≤ <expected>` to evaluate `![…] ⟨4, _⟩`.
- `native_decide` runs compiled `List ℤ`/`ℚ` code fast; kernel `decide` (`decide +kernel`) only for small data.
  A precompiled library is used by `native_decide` only through `lake build`, not through `lake env lean`.
- Lake has no `-j`: pin cores with `taskset -c` on Linux. Wall time follows the longest import chain.
- Killing `lake` does not kill its `lean` children; use the process group.
- zsh: quote globs (`git grep -n pat -- '*.md'`, `grep --include='*.lean'`).
