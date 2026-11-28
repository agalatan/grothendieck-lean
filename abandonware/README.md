# abandonware

Lean modules that left the libraries and are kept because a planned or running line of work would reuse them.
Nothing here is built, imported or checked: the folder is outside the Lake libraries (`Grothe/`, `GrotheKernel/`,
`GrotheCapsKernel/`, `GrotheQuadKernel/`, `GrotheQuadExtKernel/`), CI's forbidden-code scan is limited to those
folders, and `tools/gen_root_imports.py` does not import these modules (it only drops axiom-list entries that name
declarations found here and not in the libraries).

The repository proves 1.4020221627 < K_G^ℂ ≤ 1.404554025 (`Grothe.Statement.main_bounds`; the constants are stated
exactly in [`docs/CONSTANTS.md`](../docs/CONSTANTS.md)). No module of this folder is part of that proof.

Policy (user, 4 and 15 November 2026): Lean code that `main_bounds` does not use leaves the libraries. On
28 November 2026 (#764) this archive was reduced to the modules below; everything else that was archived is in git
history only (last section).

## What is here

Each file is at its original path below `abandonware/` (`abandonware/Grothe/X/Y.lean` was `Grothe/X/Y.lean`).
[`MANIFEST.tsv`](MANIFEST.tsv) lists every file with the commit where it was last part of the build, its content
and the task that would use it.

| family | modules | content | the task that would use it |
|---|---:|---|---|
| Hilbert transfer | 3 | `TransferHilbert`, `ScalarOpt`, `VectorOpt`: every Grothendieck bound extends to unit vectors of any complex inner product space; the scalar and vector optima are attained, the vector optimum in dimension min(m, n) (`isGrothendieckBound_iff_fixed_dim`) | a lower-bound certificate of degree 5 or 7 ([`research/higher-degree`](../research/higher-degree/README.md)): transfer of the witness to finite matrices and projection of the responses |
| cubic-chaos budgets | 8 | `Lower/SteinFusion`, `Lower/Reserve`, `Lower/MomentLift`, `LowerAnalytic/FourthMoment` (E F⁴ ≤ 93 (E F²)² on the real third chaos), `JointSixth`, `JointBudget`, `MomentCone`, `MomentConeBoundary` | the row certificates of Conjecture K ([`research/conjecture-K`](../research/conjecture-K/README.md)) and of a degree-5 game, when they need fused Stein cuts or joint sixth-moment budgets |
| cubic-witness ceiling | 1 | `LowerAnalytic/ScalarCubicFamilyCeiling`: the arithmetic behind the ceiling 1.4022581233 of the witnesses P₁,₀ − zP₂,₁; the Gaussian inputs are hypotheses | the Lean part of `research/conjecture-K/STATUS.md` 12.2; its written proof is in `research/conjecture-K/sources/cubic-witness-ceiling-2026-10-23/` |
| phase Taylor bounds | 5 | `Haagerup/PhaseStability`, `PhaseTaylorAlgebra`, `PhaseTaylorSharp`, `PhaseTaylorOptimal`, `PhaseTaylorCubic`: ‖ph z − 1 − (z − Re z)‖ ≤ 2‖z − 1‖², the optimality of the coefficient 2, and the cubic refinement | a certificate for a perturbed phase channel ([`research/upper-channels`](../research/upper-channels/STATUS.md), 8.1 and 9.5) |
| packed-dyadic decoder | 4 | `UpperChaos/LegacySingleCharacterSplit`, `PackedDyadicStructural`, `PackedDyadicLegacyDelimiter`, `PackedDyadicSourceAssembly`: kernel-checked statements about the decoder of the stored Taylor centres | retiring the native fact `Grothe.UpperChaos.taylor_centers_decode_check` |

**These files are not kept compiling.** Their imports from `Grothe.*` all exist, in the libraries or in this folder,
but none was rebuilt after it left the build, and the library has changed since. To revive a module: move it back to
its path under `Grothe/`, run `python3 tools/gen_root_imports.py`, repair what changed, and connect it to the main
proof (a module that `Grothe.MainResult` does not import is removed again).

## What was removed, and where it is

[`RETIRED.txt`](RETIRED.txt) lists the declarations of the removed modules that were once in the axiom report or
the axiom lists, and the removed modules. `tools/gen_root_imports.py` reads it: if a union merge with an old branch
brings such a line back into `scratch/Axioms.lean` or `data/axioms/`, the generator drops it, as it does for the
modules still in this folder (`scripts/test_gen_root_imports.py`).

`git show <commit>:<path>` reads any of it; `git log --diff-filter=D -- <path>` finds the removal.

| material | last present at | path at that commit |
|---|---|---|
| the conditional sharper upper route `fresh_upper_rounder` (K_G^ℂ < 1.404598148840 from fourteen Gaussian error estimates that were never proved; weaker than the proved 1.404554025) and the Gaussian-comparison programme built for those estimates: 192 modules | master `bfb5961e3` | `abandonware/Grothe/UpperChaos/`, `abandonware/Grothe/Upper/GroupedBridge.lean`; the list with one reason per module is `abandonware/MANIFEST-2026-11-15.tsv` |
| comparison budgets and other general lemmas with no planned use (`PolarizedGram`, `QuadraticDual`, `LowerAnalytic/JointDefect`, `LowerAnalytic/QuarticNewton`, `UpperQuad/CentralDerivative`), the exporter `LowerAnalytic/CapExport` (its reader `tools/caps_plan.py` is gone) | master `bfb5961e3` | `abandonware/Grothe/` |
| nine files of removed lines of `Grothe/Upper/*.lean` and `Grothe/LowerAnalytic/CapTables.lean` | master `bfb5961e3` | `abandonware/Upper/`, `abandonware/LowerAnalytic/`; the modules they were cut from are in the libraries |
| the other ~2,370 modules outside the import closure of `Grothe.MainResult` on 15 November 2026 (#422): generated modules, axiom audits, superseded certificates | master `36ab13004` | `Grothe/` |
| the archive of other endpoints of 27 October 2026 (#202): the single-channel bounds by resolvent completion (K_G^ℂ ≤ 1.404909132791 without hypotheses), the reproduction of the HJM origin panels, the scalar-tail refinement, their generators and verification records, and byte copies of the documents of that day (`tree/`, `snapshot/`, `revisions/`, `manifest.json`, `check_archive.py`) | master `bfb5961e3` | `miscellaneous/other-bounds/` |
| 24 research modules of October 2026 that serve no bound (response geometry and screens for the upper side; the algebra of the response-lift, replica, spherical and quintic studies), their axiom reports, audit modes and replay tools | master `bfb5961e3` | `miscellaneous/research/` |
| the delivery `grothendieck-common-stein-reassessment-20261023.zip` (7.5 MB; its `section.tex` is the chapter `common-stein-kernel-20261023.tex` of the manuscript under `research/conjecture-K/sources/manuscript/`, its data are the source laws of the superseded row tables) | master `bfb5961e3` | `miscellaneous/deliveries/` |

The research notes of 23 October 2026 that were in `miscellaneous/` and whose conclusions were not yet recorded are
now under `research/`: `conjecture-K/sources/cubic-witness-ceiling-2026-10-23/`,
`conjecture-K/sources/response-lift-fibre-2026-10-23/`, `higher-degree/sources/quintic-projection-2026-10-23/` and
`upper-channels/sources/cubic-phase-separator-2026-10-23/` (each area's `INVENTORY.md` says what they hold).
