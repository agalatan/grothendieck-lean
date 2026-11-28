# The Haagerup article

This folder holds an article and its Lean proof. The article proves that the complex Grothendieck constant is
strictly below Haagerup's value:

```
K_G^ℂ ≤ 1.40456 < 1/γ† = 1.4045759346…,      γ† = ∫₀^{π/2} cos² t / √(1 + sin² t) dt.
```

**The article and its Lean package are frozen, and independent of the rest of the repository.** Nothing outside this
folder is needed to build either of them, and they do not change when the repository's own results change.

## The article: `main.tex`, `main.pdf`

- Build with `latexmk -pdf main.tex` (pdflatex). The bibliography is inside the file.
- `figures/` holds the figures that `main.tex` includes.

## The Lean package: `anc/`

`anc/` is a self-contained Lean 4 package (the arXiv ancillary files). It depends on Mathlib only, has its own
`lakefile.toml`, `lean-toolchain` and `lake-manifest.json`, and builds from a plain copy of the folder. Its main
theorem, without hypotheses:

```lean
theorem Haagerup.constant_lt_inv_gammaDagger :
    Haagerup.Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger
```

[`anc/README.md`](anc/README.md) states the six public theorems and explains the layout, the build and the axiom
report. `anc/scripts/` contains Python scripts that reproduce figures and numbers of the article; they are not part
of the proof. The Lean code and the scripts are released under the Apache License 2.0 (`anc/LICENSE`); the text of
the article is licensed separately, through arXiv.

## The CI job

`.github/workflows/haagerup-article.yml` tests the package alone. It runs when a file under `anc/` or the workflow
changes, or by hand, and fails unless:

- no Lean file contains `sorry`, a declared axiom, `implemented_by`, `extern`, `unsafe` or unchecked code;
- the package builds with its pinned Lean and Mathlib, with warnings as errors (`lake build --wfail`);
- the six public theorems depend only on `propext`, `Classical.choice`, `Quot.sound` and the `native_decide` facts
  listed in `anc/native.txt`, and each listed fact is used (`anc/check_axioms.py`);
- the Python scripts under `anc/scripts/` compile (they are not run).

## Rules

- The article states exactly what the Lean package proves, and says exactly what Lean checks: everything, with the
  four finite computations listed in `anc/native.txt` run by Lean's compiled evaluator (`native_decide`).
- A change to the proof is a change under `anc/`: the CI job above checks it.
