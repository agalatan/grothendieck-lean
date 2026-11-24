# The Haagerup article

The article (its TeX source and PDF, next to this file) and, in `anc/` (the arXiv ancillary files), its Lean proof:

```lean
theorem Haagerup.isBound_cert :
    Haagerup.Statement.IsBound (140455741 / 100000000 : ℝ)
theorem Haagerup.inv_gammaDagger_gt :
    (140455741 / 100000000 : ℝ) < 1 / Haagerup.Statement.gammaDagger
theorem Haagerup.constant_lt_inv_gammaDagger :
    Haagerup.Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger
```

that is, `K_G^ℂ ≤ 1.40455741 < 1/γ†`, without hypotheses. Start with [`anc/README.md`](anc/README.md).

## The article: `main.tex`, `main.pdf`

- Build with `latexmk -pdf main.tex` (pdflatex). The bibliography is inside the file. Sections: introduction and relation to
  earlier work (1), the transfer lemma and the alternating ceiling (2), two-coordinate channels: cell maps, reflection
  and smoothing (3), the six-channel rational certificate and proof of Theorem 1.1 (4), remarks and open questions
  (5), the ancillary files (Appendix A) and the Lean proof (Appendix B).
- Open items for the author before posting: the author line and affiliation.
- `figures/make_figures.py` decodes `f_tig` and `tigMuList` directly from `anc/Grothe/UpperSix/Haagerup/Data/` and
  writes `figures/tiger_mu.pdf` (Figure 1) and `figures/tiger_phase.pdf`.
- Run `python3 figures/check_alternating.py` here to reproduce the plotted endpoint and the full alternating-sum enclosures for channels 0 and 4 using integer arithmetic.

## `anc/`: the Lean package

- **What it is.** `anc/Grothe/UpperSix/` is a byte-for-byte copy of the repository's
  [`Grothe/UpperSix/`](../Grothe/UpperSix), which the `Grothe` target also builds. The article and this package are
  frozen at `1.40455741`; they do not quote the repository's current bounds, which keep moving. The sources import
  only Mathlib. The certificate data are Lean literals in
  `Grothe/UpperSix/Haagerup/Data/` and `Parameters.lean`; there are no other data files.
- **Its own Lake package.** It has its own `lakefile.toml`, `lean-toolchain` and `lake-manifest.json`, with the same
  Lean and Mathlib as the root, so it builds from a plain copy of the folder (`lake exe cache get && lake build`, about
  30 minutes on 4 cores). The root `lakefile.toml` does not mention it (AGENTS.md rule 7).
- **Own CI job.** `.github/workflows/haagerup-article.yml` runs when a file under `haagerup-article/` or
  `Grothe/UpperSix/` changes, when the Lean or Mathlib version changes, or by hand. It fails unless:
  - `anc/Grothe/UpperSix/` equals `Grothe/UpperSix/`, and the toolchain and Mathlib pins equal the root's;
  - there is no `sorry`, `axiom` or unchecked code;
  - the package builds with warnings as errors;
  - the axioms of every theorem in `anc/Axioms.lean` are `propext`, `Classical.choice`, `Quot.sound` and the
    `native_decide` facts listed in `anc/native.txt`.
- **Changing the proof.** Change `Grothe/UpperSix/` through an ordinary PR and copy the folder into
  `anc/Grothe/UpperSix/` in the same PR: `rsync -a --delete Grothe/UpperSix/ haagerup-article/anc/Grothe/UpperSix/`.
  If the theorem's value changes, the article states the new value.

## Rules

- The article states exactly the value that the Lean package proves (`1.40455741`), and says exactly what Lean
  checks: everything, with the finite computations listed in `anc/native.txt` run by the compiled evaluator
  (`native_decide`).
- No `sorry`, `axiom`, `implemented_by`, `extern` or `unsafe`. CI checks this.
