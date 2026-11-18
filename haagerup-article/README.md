# The Haagerup article

The article (its TeX source and PDF, next to this file) and its Lean companion in `lean/`.

## The article: `main.tex`, `main.pdf`

- Build with `latexmk -pdf main.tex` (pdflatex). The bibliography is inside the file. The figures in `figures/` are
  made by `figures/make_figures.py` from the certificate data, which is not in the repository yet.
- Every number has a `% SRC:` comment naming its source; `[DER]` marks arithmetic done in the draft. **Before arXiv,
  strip all comments**, for example with `arxiv_latex_cleaner`: the comments name internal files.
- Open items for the author (rendered in red):
  - the author line;
  - the author's own account in Section 9, "How this result was found", which has `% TODO(author)` comments;
  - where the certificate and its scripts are published (Section 7.3), with pinned versions of python-flint,
    FLINT and numpy (Section 7.6);
  - Remark 3.3 (an Abel-limit justification, not used by any proof) and Conjecture 3.5 (the one-coordinate ceiling,
    supported only numerically);
  - the per-mode split in Section 3.4 and the Monte Carlo convention test in Section 7.5, which were run on an
    earlier pair, not on the certified one;
  - bibliography details: FLINT and python-flint versions, the journal reference for Braverman–Makarychev–
    Makarychev–Naor, Guo–Fang–Lu, the Lean repository, Grothendieck 1953, König 2001, and the pages of Pisier 1978.

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
- **Files.**
  - `HaagerupRefutation/CertData.lean`: the exact rational data of the certificate (weights and parameters of the
    six channels, the rational bounds of the budget) and exact checks of the budget arithmetic.
  - `HaagerupRefutation/HaagerupConstant.lean`: `haagerupDagger = ∫₀^{π/2} cos² t / √(1 + sin² t) dt` and
    `0 < haagerupDagger < 0.7119595`.
  - `HaagerupRefutation/ConvexTransfer.lean`: `classicalNorm`, `quantumNorm`, `complexGrothendieckConstant`; the
    tensor-power lemma, `DominatedRadialSeries`, the transfer theorem
    `complexGrothendieckConstant_le_inv_of_dominated`, closure under convex combinations, and the head/tail margin.
  - `HaagerupRefutation/Main.lean`: the hypothesis structure `VerifiedSixChannelData` and the two conditional
    theorems.
- **What Lean proves, and what it assumes.** For every `cert : VerifiedSixChannelData`,
  `complexGrothendieckConstant ≤ 1.4045611` (`complexGrothendieckConstant_le_of_certificate`) and
  `complexGrothendieckConstant < 1 / haagerupDagger`
  (`complexGrothendieckConstant_lt_inv_haagerupDagger_of_certificate`), using only `propext`, `Classical.choice` and
  `Quot.sound`. The assumptions are the fields of `cert`, which are not checked in Lean: six real sequences
  `h_true i` that are dominated radial series (each channel's kernel series is realised by a disk-valued rounding
  scheme), approximations `h_app i` within the allowances `chHeadErr i` on `0..250`, tail bounds `tail_err i`, and
  the numerical enclosures of `h₀`, of the head `ℓ¹` norm and of the weighted tails. Nothing in Lean ties `h_true` to
  the channels of the article; those facts are established outside Lean.

## Rules

- No `sorry`, `axiom`, `native_decide` or unchecked code. CI checks this, and accepts only `propext`,
  `Classical.choice` and `Quot.sound` in the axioms of every theorem listed in `lean/Axioms.lean`.
- The externally computed facts (interval-arithmetic enclosures of the channel coefficients and tails) enter only as
  explicit hypotheses of the headline theorem. Each hypothesis is a statement about a concretely defined object, and
  none restates the conclusion.
- The article says exactly what Lean checks and what is computed outside it.
