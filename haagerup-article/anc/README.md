# Ancillary files: the Lean proof

This folder is a standalone Lean 4 package that proves the article's theorem, with no hypotheses:

```lean
theorem Haagerup.isBound_cert :
    Haagerup.Statement.IsBound (140457588 / 100000000 : ℝ)
theorem Haagerup.constant_lt_inv_gammaDagger :
    Haagerup.Statement.complexGrothendieckConstant < 1 / Haagerup.Statement.gammaDagger
```

that is, `K_G^ℂ ≤ 1.40457588 < 1/γ† = 1.4045759346…`.

- `IsBound K` says `V(A) ≤ K · C(A)` for every finite complex matrix `A`, where `C(A)` is the optimum over unimodular
  scalars and `V(A)` the optimum over unit vectors of `ℂ^ι`, for every finite type `ι`.
- `complexGrothendieckConstant` is the infimum of all such `K`.
- `gammaDagger` is Haagerup's integral `∫₀^{π/2} cos² t / √(1 + sin² t) dt`.

All of these are defined in `Grothe/UpperSix/Haagerup/Statement.lean`.

The certificate data (cell maps, Fourier tables, sum-of-squares witnesses, overlap tables, channel parameters) are
Lean literals in `Grothe/UpperSix/Haagerup/Data/` and `Grothe/UpperSix/Haagerup/Parameters.lean`. Lean checks them;
there are no other data files and no external verifier.

## Build

Lean and Mathlib versions are pinned in `lean-toolchain` and `lake-manifest.json` (Mathlib `v4.34.1`).

```sh
lake exe cache get      # Mathlib's compiled files
lake build              # about 30 minutes on 4 cores
lake env lean Axioms.lean
```

## What to trust

The axiom report lists `propext`, `Classical.choice` and `Quot.sound`. It also lists the finite computations checked
with `native_decide`, which the compiled evaluator runs instead of the kernel; they are named in `native.txt`.

| computation | facts |
|---|---|
| norm bounds of the two cell maps | `tcell_sos_ok`, `tig_sos_ok` |
| their overlap tables | `tcell_rows_ok`, `tig_mu_ok` |
| the head sum of the six channels | `head_sum_ok` |
| the Hardy-space contour estimates, per channel | `reg0_ok`…`reg5_ok`, `mean0_ok`…`mean5_ok` |

Every other step, including the rational comparisons of the tails and the weights, is checked by the kernel.

## Files

| proof | source |
|---|---|
| the matrix optima, admissible bounds, the constant and γ† | `Grothe/UpperSix/Haagerup/Statement.lean` |
| convex transfer from the signed head and the six tail estimates | `Grothe/UpperSix/Haagerup/Transfer.lean` |
| cell maps, Hermite energies and finite interval enclosures | `Grothe/UpperSix/Haagerup/CellHermite.lean`, `CellOverlap.lean`, `CellOverlapCore.lean` |
| disk positivity, circle means and infinite tails | `Grothe/UpperSix/Haagerup/SchurHardy.lean`, `ContourChecks/` |
| the six channels, weights, 251 head coefficients and the budget | `Grothe/UpperSix/Haagerup/CertCheck.lean` |
| the strict comparison with `1/γ†` | `Grothe/UpperSix/Haagerup/GammaDagger.lean`, `Grothe/UpperSix/Haagerup.lean` |
| the interval and table checkers | `Grothe/UpperSix/HaagerupKernel/` |

## Provenance

These files are copied byte for byte from the folder `Grothe/UpperSix/` of
<https://github.com/agalatan/grothendieck-lean>, where the same theorems also give the upper bound of
`Grothe.Statement.main_bounds`. The repository's CI job `haagerup-article.yml` fails if the two copies differ.
