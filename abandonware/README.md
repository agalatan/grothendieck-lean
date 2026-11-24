# abandonware

Code removed from the active libraries but kept for reference. Nothing here is built, imported or checked: the folder is outside the Lake libraries (`Grothe/`, `GrotheKernel/`, `GrotheCapsKernel/`, `GrotheQuadKernel/`, `GrotheQuadExtKernel/`), `tools/gen_root_imports.py` does not import it (it only drops axiom-list entries that name archived declarations), and CI's forbidden-code scan is limited to the library folders. Two kinds of file live here: whole modules under `abandonware/Grothe/` (below), and removed fragments in the table that follows. Each fragment file names the original module, the commit it was removed from and the PR; the text is the removed lines of that diff, verbatim, not a self-contained module.

| archived file | original module | removed lines |
|---|---|---|
| `abandonware/Upper/Haagerup.lean` | `Grothe/Upper/Haagerup.lean` | 240 |
| `abandonware/Upper/Compose.lean` | `Grothe/Upper/Compose.lean` | 111 |
| `abandonware/Upper/Realise.lean` | `Grothe/Upper/Realise.lean` | 30 |
| `abandonware/Upper/Bivariate.lean` | `Grothe/Upper/Bivariate.lean` | 13 |
| `abandonware/Upper/ComparisonMass.lean` | `Grothe/Upper/ComparisonMass.lean` | 13 |
| `abandonware/Upper/Final.lean` | `Grothe/Upper/Final.lean` | 10 |
| `abandonware/Upper/GroupedBridge.lean` | `Grothe/Upper/GroupedBridge.lean` | 19 |
| `abandonware/Upper/PolynomialBridge.lean` | `Grothe/Upper/PolynomialBridge.lean` | 8 |
| `abandonware/LowerAnalytic/CapTables.lean` | `Grothe/LowerAnalytic/CapTables.lean` | 19 |

Policy (user, 4 and 15 November 2026): Lean code that the main theorem `main_bounds` does not use leaves the
libraries. Modules worth keeping are moved here; the rest is deleted (git history keeps it, and generated modules can be
regenerated from their generators and inputs, which are in git history: `tools/` and `data/` keep only what an
existing module was generated from).

## Whole modules: `abandonware/Grothe/` (15 November 2026, #422)

After #383 the libraries held about 2,580 modules outside the import closure of `Grothe.MainResult`. The 210 worth
keeping are here, verbatim, at their original path below `abandonware/` (`abandonware/Grothe/UpperChaos/X.lean` was
`Grothe/UpperChaos/X.lean` at master 36ab13004). [`MANIFEST-2026-11-15.tsv`](MANIFEST-2026-11-15.tsv) lists every one with
its family and the reason it is kept. The other ~2,370 were deleted: generated modules (their generators and inputs are in git history), pure axiom audits, superseded certificates and endpoints, and scaffolding.

| what | modules | content |
|---|---|---|
| the conditional sharper upper route | 3 | `fresh_upper_rounder` (`UpperChaos/GroupedRounder.lean`): K_G^ℂ ≤ 500000000000000000/355973699960428191 < 1.404598148840 from fourteen finite-band Gaussian error estimates (not proved) and the table accuracy; `GroupedComparison`, `Upper/GroupedBridge` (`fresh_upper`) |
| the Gaussian-comparison programme for those fourteen estimates (October–November) | 155 | the actual coherent and HS source-norm chain, the retained-coefficient quadrature, the unit-mode Wick compiler, generic Wick lemmas |
| phase Taylor bounds and conditional-error lemmas | 24 | `Haagerup/PhaseTaylor*`, `ZeroProfilePhase*`, `ProductionPhase*` |
| finite-dimensional optimisation and comparison budgets (15 November) | 7 | `VectorOpt`, `ScalarOpt`, `TransferHilbert`, `PolarizedGram`, `QuadraticDual`, `LowerAnalytic/JointDefect`, `QuarticNewton` |
| other general lemmas, the packed-dyadic decoder proofs, the sample ledger | 20 | see the manifest |
| tooling | 1 | `LowerAnalytic/CapExport` (piece matrices for the S-lemma search; its reader `tools/caps_plan.py` has since been deleted) |

These files are not kept compiling against the current library. For example, `GroupedRounder` uses
`HardyReal.hardy_GT_tight` (budget 1737972/10⁶), which was removed with the arc-cover Hardy path; it follows from
`HardyReal.hardy_GT_gaussian` (budget 117/100) by `le_trans`. To revive a module: move it back to its path under `Grothe/`,
run `python3 tools/gen_root_imports.py`, repair what changed, and connect it to the main proof (or it is dangling again).
