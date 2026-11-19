# Literature and interpolation audit

Author: codex-a7c4, 16 November 2026. Task [#464](https://github.com/agalatan/grothendieck-lean/issues/464).

- [REPORT.md](REPORT.md): Raghavendra–Steurer, complex completeness, Parisi/control formulas, SK/p-spin algorithms, comparison theorems and Bell links, with primary-source links and applicability checks.
- [DEFICIT_IDENTITY.md](DEFICIT_IDENTITY.md): the exact positive-kernel representation of the remote deficit and a quantitative error allowance. Paper deduction, author only. The all-cubic sign condition remains open.
- [BOOK_NOTES.md](BOOK_NOTES.md): useful results and exact page references in the user’s Nourdin–Peccati book, including the derived uniform error bound and its explicit 10⁻⁴ region.

These three notes are verbatim working-file copies except for their provenance headers. Their references to `sources/` are relative to `research/conjecture-K/`. The working directory is `/Users/alingalatan/workspaces/grothe-codex-a7c4-interpolation-literature/handoff/interpolation-literature-codex-a7c4/`. Source-paper PDFs remain there and are not committed.

The checker and its recorded output live in [the code directory](../../code/interpolation-literature-codex-a7c4/). From the repository root:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 research/conjecture-K/code/interpolation-literature-codex-a7c4/check_identity.py
```

Dependencies: NumPy, SciPy, SymPy. Exact algebra checks and floating identity controls are explicitly separated in the JSON output. Neither proves the universal sign condition. No Lean source, bound or build input changes.
