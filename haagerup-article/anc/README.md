# The Lean proof

This folder is a Lean 4 package that proves the theorem of the article: the complex Grothendieck constant is strictly
below Haagerup's value `1/γ†`. The package is self-contained. It depends on Mathlib and on nothing else; the
theorems have no hypotheses; the certificate data are Lean literals inside the package, and no external program or
data file takes part in the proof.

## What is proved

The definitions are in [`Haagerup/Statement.lean`](Haagerup/Statement.lean), which imports only Mathlib and can be
read alone:

- `scalarOpt A` (`C(A)`): the supremum of `|∑ᵢⱼ aᵢⱼ conj(εᵢ) δⱼ|` over unimodular complex scalars `εᵢ`, `δⱼ`, for a
  finite complex matrix `A`;
- `vectorOpt A` (`V(A)`): the supremum of `|∑ᵢⱼ aᵢⱼ ⟪xᵢ, yⱼ⟫|` over unit vectors `xᵢ`, `yⱼ` of `ℂ^ι`, for every finite
  type `ι`;
- `IsBound K`: `V(A) ≤ K · C(A)` for every finite complex matrix `A`;
- `complexGrothendieckConstant` (`K_G^ℂ`): the infimum of all `K` with `IsBound K`;
- `gammaDagger` (`γ†`): Haagerup's integral `∫₀^{π/2} cos² t / √(1 + sin² t) dt`.

The six public theorems (namespace `Haagerup`; the first is in `Haagerup/CertCheck.lean`, the others in
[`Haagerup.lean`](Haagerup.lean)):

```lean
theorem isBound_cert : Statement.IsBound (1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ)))

theorem certificate_value :
    1 / ((cCertQ : ℝ) - (deltaCertQ : ℝ)) = 10 ^ 24 / 711968053274152967940951

theorem isBound : Statement.IsBound (140456 / 100000 : ℝ)

theorem constant_le : Statement.complexGrothendieckConstant ≤ 140456 / 100000

theorem inv_gammaDagger_gt : (140456 / 100000 : ℝ) < 1 / Statement.gammaDagger

theorem constant_lt_inv_gammaDagger :
    Statement.complexGrothendieckConstant < 1 / Statement.gammaDagger
```

In words: the six-channel certificate proves the bound `1/(c − δ)`, where `c = cCertQ` and `δ = deltaCertQ` are the
rational numbers of `Haagerup/Parameters.lean`; this number is `10²⁴/711968053274152967940951 = 1.4045574031…`;
rounded up, `K_G^ℂ ≤ 1.40456`; and `1.40456 < 1/γ† = 1.4045759346…`. The last theorem is the main theorem of the
article.

## Build

The Lean version is pinned in `lean-toolchain` and Mathlib in `lake-manifest.json` (both `v4.34.1`). With
[elan](https://github.com/leanprover/elan) installed:

```sh
lake exe cache get                                     # download Mathlib's compiled files
lake build                                             # every module of the package
lake env lean Axioms.lean | python3 check_axioms.py    # the axiom report and its check
```

The build takes about one hour and 8 GB of memory. Almost all of that time is one module,
`Haagerup/Data/OverlapData.lean`, whose two `native_decide` facts run for about 50 minutes on a single core; the rest
builds in about ten minutes on 8 cores.

All files set `warningAsError`, so a successful build is free of warnings; no file contains `sorry`, a declared
axiom, `implemented_by`, `extern` or `unsafe` code.

## The axiom report: what is trusted

`Axioms.lean` asks Lean for the axioms on which each of the six theorems depends. The report contains:

- Lean's three standard axioms `propext`, `Classical.choice` and `Quot.sound`, as in Mathlib;
- for the four theorems that use the certificate, four facts proved by `native_decide`, listed in `native.txt`:

| fact | file | what the computation checks |
|---|---|---|
| `tcell_sos_ok` | `Haagerup/Data/TCellData.lean` | a sum-of-squares witness for `‖T_cell‖ ≤ 1`: the cell map of channels 0, 1, 5 takes values in the unit disk |
| `tig_sos_ok` | `Haagerup/Data/TigerData.lean` | the same for the cell map `f_tig` of channels 3, 4 |
| `tcell_rows_ok` | `Haagerup/Data/OverlapData.lean` | the table of interval enclosures of the Hermite energies of the smoothed `T_cell` is the one that the checker computes |
| `tig_mu_ok` | `Haagerup/Data/OverlapData.lean` | the table of interval enclosures of the 251 radial overlaps of `f_tig` is the one that the checker computes |

`certificate_value` and `inv_gammaDagger_gt` depend on the three standard axioms only.

A `native_decide` fact states that a Boolean program written in Lean (here: exact integer and integer-interval
arithmetic in `HaagerupKernel/CellKernel.lean`) returns `true` on the given data. Lean's compiler evaluates the
program, and the result is accepted as an axiom; the kernel does not re-check the evaluation. Trusting these four
facts therefore means trusting Lean's compiler and evaluator in addition to its kernel. What the Boolean result
implies is not trusted: the soundness of every checker (that `true` implies the mathematical statement) is proved in
Lean and checked by the kernel.

Everything else is checked by the kernel, including the other finite computations of the certificate, which are
proved by `decide +kernel`: the 251-coefficient head sum of the six-channel mixture (`head_sum_ok`,
`Haagerup/HeadCheck.lean`), the disk positivity and the circle mean of each channel (`reg0_ok`–`reg5_ok`,
`mean0_ok`–`mean5_ok`, `Haagerup/ContourChecks/`), and the rational comparisons of the tails, the weights and the
budget (`Haagerup/CertCheck.lean`).

`check_axioms.py` (Python standard library) reads the report and fails unless every theorem depends only on the three
standard axioms and the facts of `native.txt`, and every fact of `native.txt` is used.

## Layout

`Haagerup/` holds the mathematics, the certificate and the theorems; `HaagerupKernel/` holds the executable checkers,
which do not import Mathlib.

| step of the article | files |
|---|---|
| the statement: `C(A)`, `V(A)`, bounds, the constant, `γ†` | `Haagerup/Statement.lean` |
| the transfer lemma: from a dominated radial kernel with centre `c` and `ℓ¹` error `δ` to the bound `1/(c − δ)`; the Hardy tail lemma; composition of channels | `Haagerup/Transfer.lean` |
| complex Gaussian measure, complex Hermite polynomials, Mehler's formula; Gaussian realisation of a two-coordinate channel; rotated Ornstein–Uhlenbeck smoothing; Haagerup's phase channel | `Haagerup/GaussianCore.lean`, `Haagerup/ChaosRealise.lean` |
| the `64 × 64 × 36` Fourier cell maps and their sum-of-squares certificates | `Haagerup/CellMap.lean`, `HaagerupKernel/CellKernel.lean` |
| Hermite energies of the cell maps (reflected pair and smoothed channels) and their interval enclosures | `Haagerup/CellHermite.lean`, `Haagerup/CellOverlapCore.lean`, `Haagerup/CellOverlap.lean`, `Haagerup/Smoothed*.lean`, `HaagerupKernel/SmoothedStages.lean` |
| the head: the first 251 coefficients of the mixture | `Haagerup/FastHeadSound.lean`, `Haagerup/HeadCheck.lean`, `HaagerupKernel/FastHead.lean` |
| the tails: holomorphic continuation, the Gaussian Schur bound, disk positivity and circle means | `Haagerup/SchurGaussian.lean`, `Haagerup/SchurHardy.lean`, `Haagerup/TaylorHardySound.lean`, `Haagerup/ContourChecks/`, `HaagerupKernel/TaylorHardy.lean` |
| the certificate: parameters, data, and the assembly of the six channels (`isBound_cert`) | `Haagerup/Parameters.lean`, `Haagerup/Data/`, `Haagerup/CertCheck.lean` |
| the rational enclosure `0.711958633 < γ† < 0.711958683` | `Haagerup/GammaDagger.lean` |
| the theorems | `Haagerup.lean` |
| the interval type shared by the checkers | `HaagerupKernel/Basic.lean` |

Other files: `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` (the package and its pinned versions);
`Axioms.lean`, `native.txt`, `check_axioms.py` (the axiom report).

## `scripts/`

The Python scripts in `scripts/` reproduce the figures and some numbers quoted in the article from the data of this
package. They are not part of the proof: Lean does not run them, and no theorem depends on their output.
