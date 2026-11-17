# The covering rows of the low pieces t = 0.70–0.78

What a reader needs in order to test the content law on the rows below the band (`../../../STATUS.md` 4.31 and 4.32).
Everything here is numerical (**N**), from the degree-5 worker of claude-b9ee (17 November 2026), and has not been
reviewed. Nothing here is imported, built or checked by CI.

## What a file holds

`band_row_<t>.json` belongs to the piece [t − 0.005, t + 0.005] of the capped game (1, −39/50, 779/10000) and to the
row that covers it best in STATUS 4.31: a row tuned at t′ > t and used on the piece. The format extends that of
`../profiles/`, whose README (`../README.md`) defines ψ, Γ_A, Γ_B, Γ_0, the tilt and the ratio.

| key | content |
|---|---|
| `t`, `piece`, `t_lo` | the piece, and its lower end, at which the response family (R1) and the cap are imposed |
| `covering_row`, `row` | t′ and the parameters (ℓ, β, b_A, b_B, ν₅) of the covering row, with `row.t` = t′ and `row.sig` = √u\* |
| `game`, `tilt`, `ustar`, `S5` | the game (e₁ = 0.78, η = 0.0779), the tilt (0.4, 0.3), u\* and the benchmark of the covering row |
| `S`, `psi`, `GA`, `GB`, `G0` | the tables on 705 amplitudes in [0, 6], as in `../profiles/` |
| `dpsi`, `dGA`, `dGB`, `dG0` | their derivatives, computed from the definitions. Do not differentiate a spline through the tables: at small radii that derivative is wrong by 1–4·10⁻² (STATUS 4.29) |
| `ucap`, `room`, `law_gap`, `mu` | the response cap at t_lo; the room (500/701 minus the row on the piece, minus its law gap, minus 1.5·10⁻⁵ set aside for losses); the law gap; the pointwise A/B margin of the tilt |
| `kappa_AB_of_chi`, `kappa_AB_constant_own` | the χ-dependent split of STATUS 4.34 used here, and the constant split of the row for comparison |
| `allowance` | θ_room(u) at 17 or 18 energies from 0.30 to 0.985 of the cap, each with u/u\*, u/cap, the binding χ, the number of values of χ with a possible law, and the weights of (F) in the two sectors; `null` where no law is a possible response |
| `band_minimum`, `theta_needed` | the smallest θ_room of the table, with its energy and binding χ |
| `definition` | the definition of θ_room used, as written by the generator |

| file | piece | covering row | room | band minimum of θ_room (u/u\*, u/cap, binding χ) |
|---|---|---|---|---|
| `band_row_0.70.json` | [0.695, 0.705] | 0.79 | 7.06·10⁻⁴ | 0.2190 (1.612, 0.779, 42) |
| `band_row_0.72.json` | [0.715, 0.725] | 0.79 | 2.57·10⁻³ | 0.2587 (1.500, 0.809, 36) |
| `band_row_0.74.json` | [0.735, 0.745] | 0.80 | 1.95·10⁻³ | 0.3141 (1.455, 0.800, 42) |
| `band_row_0.76.json` | [0.755, 0.765] | 0.81 | 1.32·10⁻³ | 0.4000 (1.492, 0.840, 30) |
| `band_row_0.78.json` | [0.775, 0.785] | 0.82 | 7.70·10⁻⁴ | 0.5232 (1.448, 0.840, 30) |

At t = 0.72 the row tuned at 0.80 gives a slightly larger band minimum, 0.264, with a room of 2.6·10⁻⁴ only; the file
holds the row 0.79 (`../../../sources/degree5-newcap-2026-11-17/SCOPE_TABLE.txt`).

## Evaluating a profile

As for `../profiles/`: G_A = GA + 0.4·G0, G_B = GB + 0.3·G0 and h(v) = G(√v)/√v, with u\* = `ustar` of the covering row.
A cubic of energy u ≤ `ucap` is compared with `theta_room` at that energy; the energies of the table are fractions of
the cap, not of u\*.

## Provenance

Written by `thresholds/export_low.py games/g078big ../profiles_low 0.70,0.72,0.74,0.76,0.78` (with `D5_E1=0.78`
`D5_ETA=0.0779`) in the worker's folder, and copied here unedited. The rows tuned at t itself
(`band_row_<t>_own.json`), the scope run and the generator stay in that folder (`../../../INVENTORY.md`). The same
five files are the ones that the problem statement `../../../sources/content-problem-v2-2026-11-16/PROBLEM_V3.md`
lists under kit/profiles_low/, and the searches of STATUS 4.32 ran on them.
