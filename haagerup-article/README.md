# The Haagerup article

The article (its TeX source and PDF, next to this file) and its Lean companion in `lean/`.

## `lean/`: the Lake package `HaagerupRefutation`

- **Separate target.** It is not part of the `Grothe` target, its axiom report or the proof check in `lean.yml`, and
  the repository's `lakefile.toml` does not mention it (AGENTS.md rule 7).
- **Own CI job.** `.github/workflows/haagerup-article.yml` runs only when a file under `haagerup-article/` changes,
  when the Lean or Mathlib version changes (`lean-toolchain`, `lake-manifest.json`), or by hand.
- **Mathlib.** It uses the repository's own Mathlib: every entry of `lean/lake-manifest.json` is a path into the
  root's `.lake/packages`, and the toolchain is the root's `lean-toolchain`.
- **Build.** In a checkout or worktree whose `.lake/packages` holds Mathlib (`lake exe cache get` in the root, or
  `scripts/clone_master_build.sh`): `cd haagerup-article/lean && lake build`. For the axioms:
  `lake env lean Axioms.lean`.
- **Files.** `HaagerupRefutation/CertData.lean` holds the exact rational data of the certificate (6 channels) and the
  arithmetic of its budget.

## Rules

- No `sorry`, `axiom`, `native_decide` or unchecked code. CI checks this, and accepts only `propext`,
  `Classical.choice` and `Quot.sound` in the axioms of every theorem listed in `lean/Axioms.lean`.
- The externally computed facts (interval-arithmetic enclosures of the channel coefficients and tails) enter only as
  explicit hypotheses of the headline theorem. Each hypothesis is a statement about a concretely defined object, and
  none restates the conclusion.
- The article says exactly what Lean checks and what is computed outside it.
