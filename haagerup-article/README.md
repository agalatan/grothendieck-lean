# The Haagerup article (Gemini-text variant)

The article (its TeX source and PDF, next to this file) and its Lean companion in `lean/`. The text and the Lean code
come from Gemini's paper; the folder layout, the Lake package and the CI job are those of the other variant, PR #530
(branch `claude-b9ee/haagerup-article`). The two variants are shown side by side and are alternatives.

## The article: `main.tex`, `main.pdf`

- Build with `latexmk -pdf main.tex` (pdflatex). The bibliography is inside the file.
- Appendix A is the Lean file itself: `\lstinputlisting{lean/HaagerupRefutation/Main.lean}`, so the PDF always shows
  the code that builds. Every non-ASCII character of that file has an entry in the `literate` table of the `Lean4`
  listings language in the preamble; a new symbol in the Lean file needs a new entry there, or pdflatex stops.

## `lean/`: the Lake package `HaagerupRefutation`

One file, `HaagerupRefutation/Main.lean`, imported by `HaagerupRefutation.lean`.

**What Lean proves**, with no `sorry` and no axiom other than `propext`, `Classical.choice` and `Quot.sound`
(`lean/Axioms.lean` lists the headline theorems):

- `cert_l1_and_weights_valid`, `cert_rational_margins`: the exact rational arithmetic of the certificate. The six
  weights sum to 1, the ℓ¹ norms of the preprocessor polynomials are at most 1, `haagerupUpperQ < certDLowerQ` and
  `1 / certDLowerQ < 1.40456109`.
- `haagerupDagger_pos`, `haagerupDagger_lt_upper`: `0 < γ† < 7119595 / 10^7`, where `haagerupDagger` is defined as the
  integral of `cos² t / √(1 + sin² t)` over `[0, π/2]`.
- `transferMargin_le_alternatingVal`, `convex_no_go_below_ceiling`: `D(h) ≤ W(h)` for every absolutely summable `h`,
  and the convex no-go: a convex mixture of channels whose alternating values are at most `C` has margin at most `C`.
- `complexGrothendieckConstant_le_inv_of_dominated`: the radial transfer. If `h` is a dominated radial series
  (`DominatedRadialSeries h`) and `0 < D ≤ h₀ − Σ_{k≥1} |h_k|`, then `complexGrothendieckConstant ≤ 1 / D`. The constant
  is defined in the file: the infimum of the `K ≥ 0` with `quantumNorm A ≤ K * classicalNorm A` for every complex
  matrix `A`, where `quantumNorm` is the supremum over unit vectors of every `ℂ^N`.
- `main_refutation`: `complexGrothendieckConstant ≤ 1.40456109` and `complexGrothendieckConstant < 1 / haagerupDagger`,
  **for every term of the structure `VerifiedSixChannelData`**.

**What Lean assumes.** `main_refutation` is conditional: it takes `cert : VerifiedSixChannelData` as a hypothesis, and
Lean constructs no such term. The structure holds six real sequences `h_true i`, their approximations `h_app i` and tail
bounds, with the facts the proof uses:

- `dominated`: each `h_true i` is a dominated radial series: `|Σ_k h_k Σ_{p,q} A_pq ⟨u_p,v_q⟩ |⟨u_p,v_q⟩|^{2k}| ≤ C(A)`
  for every complex matrix `A` and all vectors `u_p`, `v_q` of norm at most 1. This is the property of an actual rounding scheme; it carries the analytic content of
  Section 3 of the article;
- `head_comparison`, `hardy_tails`: the distance from `h_true i` to `h_app i` on the head, and the tails beyond degree
  501;
- `h0_enclosure`, `head_l1_encl`, `tail_enclosure`: the enclosures of the weighted head and tails.

These facts are certified outside Lean, in 256-bit Arb ball arithmetic (Appendix B of the article). Nothing in Lean
ties `h_true` to the six rounding schemes of Table 1: any family of sequences with these properties gives the bound.

## Separate target, own CI job

- It is not part of the `Grothe` target, its axiom report or the proof check in `lean.yml`, and the repository's
  `lakefile.toml` does not mention it (AGENTS.md rule 7).
- `.github/workflows/haagerup-article.yml` runs when a file under `haagerup-article/` changes, when the Lean or Mathlib
  version changes (`lean-toolchain`, `lake-manifest.json`), when the job itself changes, or by hand. It builds with
  warnings as errors, rejects `sorry`, axioms, `native_decide` and unchecked code, and accepts only `propext`,
  `Classical.choice` and `Quot.sound` in the axioms of `lean/Axioms.lean`.
- Mathlib is the repository's own: every entry of `lean/lake-manifest.json` is a path into the root's `.lake/packages`,
  and the toolchain is the root's `lean-toolchain`. Nothing is downloaded, and nothing is written into the shared
  packages.

## Build

In a checkout or worktree whose `.lake/packages` holds Mathlib (`lake exe cache get` in the root, or a symlink to the
shared packages):

```sh
cd haagerup-article/lean
lake build --wfail          # about one minute after the Mathlib import
lake env lean Axioms.lean   # the axioms of the headline theorems
```

## Rules

- No `sorry`, `axiom`, `native_decide` or unchecked code. CI checks this.
- Facts computed outside Lean enter only as fields of `VerifiedSixChannelData`, a hypothesis of `main_refutation`.
- The article says exactly what Lean checks and what is computed outside it.
