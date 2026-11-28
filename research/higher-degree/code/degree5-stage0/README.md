# Stage 0 of the degree-5 plan: code and small results (issue #751)

Scripts behind [`../../sources/degree5-stage0-2026-11-28/REPORT.md`](../../sources/degree5-stage0-2026-11-28/REPORT.md).
Everything is **N** (floating point). Nothing here is imported, built or checked by CI. A research worker of
claude-b9ee, 27–28 November 2026 (Bucharest time); author only.

The computations ran on the droplet `mega` (32 vCPUs, python 3.12) in `~/claude-b9ee-stage0`, with the virtual
environment of the gate run of 25–26 November (`venv-freeze.txt` of `handoff/degree5-gate-2026-11-25/`: numpy 2.5.5,
scipy 1.18.1, clarabel 0.11.1, highspy 1.16.0). The raw outputs are in the handoff archive named in the report.

## Part (a): small-t rows, folder `a/`

| file | what it does |
|---|---|
| `a/s0core.py` | the row engine (the potential Ψ₅ and its gradient by quadrature, as `../degree5-gate/pipeline/rows/lawbundle.py`), the master problem min over rows of the maximum over a pool of laws with its dual bound (no trust region), and the bundle loop |
| `a/physlaws.py` | laws of \|q\| for explicit cubics (scrambled Sobol samples of 2²² points, quantile atoms) → `phys.npz`, `phys.json` |
| `a/oracles.py` | the supremum over a class for a fixed row: the pool of explicit cubics; the plain class (one LP per (σ, ν, s), atoms refined against the LP's dual function); the enriched classes (through `enriched.py`) |
| `a/enriched.py` | the enriched classes E2 and E3 as conic programs (Clarabel) over atoms of V = \|q\|², with the constraints listed at the top of the file; run alone it prints the supremum of E√V per class (the control against the radius record) |
| `a/rows0.py` | one (game, t, class) → one JSON line: the best row found, its value in the class, the dual bound of the pool, the gap |
| `a/phys_search.py` | search for explicit cubics in ℂⁿ (plus a diffuse bulk) that are bad for a given row; every candidate is re-scored on an independent sample |
| `a/checks_a.py` | discretisation check of E2/E3 (atoms and tests doubled) and the plain class with a small-ball constraint |
| `a/run_task.sh`, `a/mk_tasks.sh`, `a/mk_band_tasks.py`, `a/games.txt` | task lists (`xargs -P`) |
| `a/prof_cell.py` | profile of one oracle point of E3 (conic solve against the quadrature of Ψ₅), for the time profile of the report |
| `a_table.py` | the tables of part (a) from the result files |
| `a_transport.py` | transport of the stored rows of one game in t (exact rationals): the largest over t of the minimum of the stored rows' scores (`python3 -I a_transport.py results/a gA`) |

```sh
cd a
../venv/bin/python physlaws.py phys.npz 22                       # the pool of explicit cubics
../venv/bin/python enriched.py                                   # control: sup E sqrt(V) per class
bash mk_tasks.sh "phys plain:2287/2500 plain:KOUL3 E2:KOUL3 E3:KOUL3" "0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55" > tasks.txt
xargs -P 30 -I{} bash -c {} < tasks.txt                          # one JSON per task in out/
python3 -I ../a_table.py out > ../results/a_tables.md
```

Classes (`rows0.py E1 ETA t CLASS`): `phys` (the pool of explicit cubics: a floor), `plain:<ρ>` (moments and a radius
input; `ρ` a rational, or `KOUL3` for the s-dependent bound of K ledger 3.7 for 114/125), `E2:<ρ>` (plus the two
first-order radial identities, the pointwise cone and the kernel second moments), `E3:<ρ>` (plus the two third-order
identities), `E0:<ρ>` (the plain class through the conic code: a control of the two oracles).

## Part (b): the gate on the band

The gate pipeline of 25–26 November is run unchanged (`../degree5-gate/pipeline/`, copied to the droplet as
`gateb/`); only the drivers are new:

| file | what it does |
|---|---|
| `b_game.sh`, `b_all.sh` | rows (`rows/rowscan.py`), band table (`thresholds/band5.py`), the exact coupled one-spike gate and the cheap gate integrals (`gate/run_gate_all.sh`) for one game / for all games |
| `b_groups.py` | the shell groups (H₁,₁, H₂,₂, H₃,₁, …) that make up the quintic share at its maximising gate point |
| `b_collect.py` | the control against the record, θ, the quintic and A/B shares, the band minima, the ratio σ\*²/ℓ² of K ledger 3.5a per row, and the radius-only bound of the quintic gain |

```sh
bash b_all.sh                                                    # in gateb/; several hours per game (report §7)
python3 -I b_collect.py GATEB ../degree5-gate > results/b_tables.md
python3 -I b_groups.py GATEB > results/b_groups.md
```

## What was actually run (28 Nov)

Not the whole task list: the runs were cut to what the verdict needs (report §7). Part (a): the classes phys, plain
2287/2500, plain 114/125, E2, E3 at t = 0.1, 0.2, 0.25, 0.3 for most games (see `results/a_tables.md` for which cells
exist), and E3 at t = 0, 0.05 for gA, g84, g83 and at t = 0.3, 0.4, 0.55 for gA (`a/tasks_final.txt`,
`a/tasks_final2.txt`). The cell gA, E3, t = 0.25 lost its result file (report §7); `results/a/gA__E3_KOUL3__0.25.json`
is rebuilt from its log by hand and marked so. Part (b): `b_all.sh` for gC, gA, gA1, gA2, g84, g83, and `b_game.sh g80
0.80 0.1364 10000/14025`; gA1 and gA2 stopped after their first rows, the band tables of all games stopped part-way. After the review of PR #817 one
gA2 point was computed on yo: `D5_E1=0.848 D5_ETA=0.2795 python run_sp2_line.py 7 sp2_7.json 0.1 <sigma*>` in a copy of
`../degree5-gate/pipeline/gate/` with `results/b/gA2/rows5.lines` (→ `results/b/gA2/sp2_7.json`).

## Results kept here

`results/a/*.json` (one file per (game, class, t)), `results/a_tables.md`, `results/phys.json` (moments and small-ball
masses of the explicit cubics), `results/checks/` (`enriched_sup.log`, `validate_class.log`, `prof_cell.log`),
`results/b/<game>/` (`rows_all.lines`, `band5.json`, `band5.out`, `sp2_<k>.json` of the one-spike model),
`results/b_tables.md`, `results/b_groups.md`. The law layer on the band rows (`mk_band_tasks.py`, table A4 of
`a_table.py`) was not run.
