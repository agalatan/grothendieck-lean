# abandonware

Code removed from the active libraries but kept for reference. Nothing here is built, imported or checked: the folder is outside the Lake libraries (`Grothe/`, `GrotheKernel/`, `GrotheCapsKernel/`), `tools/gen_root_imports.py` does not scan it, and CI's forbidden-code scan is limited to the library folders. Each file names the original module, the commit it was removed from and the PR; the text is the removed lines of that diff, verbatim, not a self-contained module.

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

Policy (user, 4 November 2026): dead code is moved here rather than deleted.
