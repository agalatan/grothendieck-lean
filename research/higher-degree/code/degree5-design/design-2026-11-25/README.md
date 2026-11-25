# design-2026-11-25: the recomputed degree-5 design

Scripts and small result files behind
[`../../../sources/degree5-design-2026-11-25/DESIGN.md`](../../../sources/degree5-design-2026-11-25/DESIGN.md) (ledger
rows 4.41–4.45 of [`../../../STATUS.md`](../../../STATUS.md), tag DSGN): the reproduction of the conditional
certificate of ledger 4.17, its law layer with the radius 2287/2500, the A/B secant margins, the design D\* and the
constants of the assembly theorem. Game (1, −39/50, 779/10000), target 500/701.

The other files of `../` (`d5eng.py`, `sectors.py`, …) belong to the design of 16 November (tag DES) and are not used
here.

Nothing here is imported, built or checked by CI. Exact parts are rational arithmetic on the stored row constants;
the row constants themselves are outputs of interval covers (**C**, author only); everything else is floating point
(**N**): a scan bounds an infimum from above, a search bounds a supremum from below.

## Replay of the exact parts

    bash checks/replay_exact.sh        # from this folder; Python 3 standard library only; about 2 seconds

It runs, on copies in a temporary directory, the commands below and compares each output byte for byte with the
committed file. Expected: sixteen lines `IDENTICAL …`, then `ALL IDENTICAL` (`checks/replay_exact.log`).

| command (from this folder) | output | what it is |
|---|---|---|
| `python3 -I scripts/direct_bound_exact.py` | `direct_bound_exact.log` | the direct bound of ledger 4.18 (a) per game, radius and target: the end t₁ of the unconditional piece (0.250885 at ρ₀ = 2287/2500, target 1/1.402), and the t = 0 cap on λ₁ |
| `python3 -I assemble2c.py rows2c.json` in a copy of `certB_const/` (or `certB_lin/`) with `pipeline/assemble2c.py`, `envelope.py`, `gamecfg.py` beside `game.json` | `certB_*/out/assemble2c.log`, `rows2c_final.json` | the exact min-envelope of the 26 rows from the row constants `out/rec_<row>.json`: B = 0.7128931980, room 3.7356·10⁻⁴ (`certB_lin`: 0.7128932177, 3.7354·10⁻⁴) |
| `python3 -I scripts/envelope_design.py CERTDIR` | `certB_*/out/envelope_design.log`, `.json` | the same envelope with the rooms at the targets 1/1.402, 1/1.40195, 1/1.4021 (it writes into `CERTDIR/out/`: use a copy) |
| `python3 -I scripts/envelope_design.py CERTDIR tables/fin_table.design.json` | `certB_const/out/envelope_design_fin.log`, `envelope_design_fin_table.json` | the 21 pieces of D\*: contiguity from 0.649 to 886227/10⁶ and the exact room of every piece (smallest 3.7356·10⁻⁴) |
| `python3 -I scripts/assembly_constants.py tables/fin_table.json certB_const/out/envelope_design_fin_table.json tables/g078` | `ASSEMBLY_CONSTANTS.md` | the constants of D\* in the notation of the assembly theorem |
| `python3 -I scripts/margins_table.py margins` | `margins/MARGINS_TABLE.md` | the table of the stored margin scans |
| `python3 -I checks/theta_table.py` | `tables/THETA_TABLE.md` | the allowances θ_j(u, χ) of D\* per piece, from `tables/fin_table.json` (written when the computation was recorded; problem P1 embeds it) |
| `python3 -I checks/rows_table.py` | `tables/ROWS_TABLE.md` | the eighteen float rows of D\* beside the rational rows (problems P1 and P2 embed it) |
| `python3 -I checks/rows_compare.py` | `checks/rows_compare.log` | float rows of the profiles and scans against the rational rows of the certificate (written when the computation was recorded) |

## Contents

| path | what | label |
|---|---|---|
| `RESULTS.txt` | the script outputs concatenated by `scripts/collect_results.sh`, each block naming its source; the note cites its blocks | as each block says |
| `A_reproduce/` | logs of the exact assembly and of the full replay of ledger 4.17 (295 626 node caps, 29 plain and 5 Stein covers; `ALL PASS (1118s)`) | C, author only |
| `direct_bound_exact.log` | see above | exact |
| `certB_const/` | the law layer with ρ₀ = 2287/2500: `game.json`, the rows `rows2c.json`, the 26 certified row constants `out/rec_<row>.json` (exact rationals), `out/rows2c_final.json`, the assembly, envelope and replay logs (`replay2c.log`: `ALL PASS (1296s)`, node caps not recomputed in that run), and the exact rooms of D\* | C, author only |
| `certB_lin/` | the variant with the energy-dependent radius bound as a chord table (`rho_table_lin.json`); `ALL PASS (760s)` | C, author only |
| `COVERS.sha256` | SHA-256, size and path of the 52 cover files (32 MB) behind the row constants; they are outside the repository | |
| `pipeline/` | the cover pipeline of the two `certB_*` folders, identical in both (stage 2c of the working folder of 16–17 November: `psi5.cpp`, `caps2.py`, `law2.py`, `cover2.py`, `cover2s.py`, `stein2.py`, `run_row2c.py`, `sched2c.py`, `assemble2c.py`, `envelope.py`, `replay2c_all.py`, `gamecfg.py`, …; its own `README.md` describes a full run) | |
| `scripts/setup_certB.py`, `certB_run.sh`, `certB_run2.sh` | how the two `certB_*` runs were set up and launched | |
| `smallt/` | float law-class bounds at small t with ρ₀ = 2287/2500 (`nscan_*.log`, the command lines) | N |
| `margins/` | `m078_t*.json` (tilt (2/5, 3/10)), `m078b_t*.json` (tilt (2/5, 3/20)), `m078c_t*.json` (tilt (3/10, 1/10)), `m077*_t*.json` (game (1, −0.77, 0.05)), `tilt078_*`, `tiltfine078_*` (tilt grids), the rows scanned (`rows078.lines`, `rows077.lines`), the command lines, `MARGINS_TABLE.md` | N |
| `tables/` | `fin_table.md`, `fin_table.json` (candidates, allowances θ_j(u, χ), ratios and factors of D\*), `fin_table.design.json` (the 21 pieces), `finT_table.*` (tilt (3/10, 1/10)), `half_table.txt` (half of the room), `g078b_table.txt`, `g077b_table.txt` (three narrow pieces, two games), `table_g078*.md`, `table_g077.md` (three margin models at the record's tilt), `g078/rows_all.lines`, `g078hi/rows_all.lines` (the float tuned rows), `THETA_TABLE.md`, `ROWS_TABLE.md` | N; rooms exact |
| `ASSEMBLY_CONSTANTS.md` | the table of D\* | rooms exact, C_j C (author only), the rest N |
| `scripts/` | the design worker's scripts (below) | |
| `checks/` | `replay_exact.sh`, `rows_compare.py`, `theta_table.py`, `rows_table.py` and their logs | |

## The floating-point scripts

They were run on a droplet, with numpy, scipy, cvxpy and clarabel in a virtual environment; the command files
(`margins/cmds*.txt`, `scripts/gen_final.sh`, `gen_tiltT.sh`, `gen077b.py`, `gen078b.py`, `smallt/cmds.txt`) keep the
droplet's paths.

| script | what | cost | needs |
|---|---|---|---|
| `scripts/margin_scan.py ROWS.lines t OUT.json sA,sB E1` | μ₀, the table min over directions of m/τ² on a grid of (s, τ), μ_glob, the fitted b for one row | about 5 to 6 minutes per row on one core (field `secs` of each output) | numpy, scipy only: `python3 scripts/margin_scan.py margins/rows078.lines 0.79 OUT.json 0.4,0.15 0.78` reruns one scan |
| `scripts/margin_tilt.py` | μ₀ and μ_glob of one row on a grid of tilts (coarser scan) | not timed in the stored outputs | numpy, scipy |
| `scripts/r4_theta6.py` | the allowance θ(u, χ): one conic program per cell and per trial θ, with the margin model `const:MU` or `lin:MU0:B:MUG` | 30 to 45 s per energy in the logs of piece 1 | cvxpy, clarabel, and the modules `rowlib`, `lawstein`, `rice`, `t4lib` of [`../../degree5-content/`](../../degree5-content/README.md) plus `combo` and the band files of the working folder (`THRESH_DIR`; INVENTORY) |
| `scripts/ratio_cluster.py` | the largest content ratio in the c = 4 three-cluster family (13 variables), per bin of χ, possible responses only | 2 to 3 minutes per energy and bin in the logs of piece 1 | numpy, scipy, a profile file |
| `scripts/reeval_tilt.py` | the stored maximisers in 4 to 6 variables re-evaluated at another profile, tilt and energy | not timed here | the content study's evaluator and records (`THRESH_DIR`; INVENTORY) |
| `scripts/design_final.py`, `final_table.py`, `build_table.py`, `cells_table.py`, `half_table.py`, `allow_cases.py`, `runq.py` | candidates and command lines; tables from the outputs of the three programs above | seconds | the per-case outputs under `work/` of the working folder (INVENTORY) |

Raw outputs (per-case JSON files and logs of the conic programs and searches, the cover files, the larger tables)
are outside the repository: [`../../../INVENTORY.md`](../../../INVENTORY.md).
