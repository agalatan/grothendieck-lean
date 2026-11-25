# degree5-retarget: the degree-5 programme at targets above 1.402

Scripts and small result files behind
[`../../sources/degree5-retarget-2026-11-25/RETARGET.md`](../../sources/degree5-retarget-2026-11-25/RETARGET.md)
(issue #702; ledger rows 1.11, 1.12 and 4.50–4.52 of [`../../STATUS.md`](../../STATUS.md)). A research worker of
claude-b9ee, 25 November 2026; author only.

Nothing here is imported, built or checked by CI. The exact part is rational arithmetic on committed inputs (the row
constants it reads are **C**, author only: ledger 4.42). Everything else is floating point (**N**): a model norm is the
payoff of explicit pairs and bounds the norm of a game from below; a search over games or rows ends at a local
optimum; a law program on a grid is a lower estimate of its supremum.

## Replay

    bash replay.sh        # from this folder; Python 3 standard library only; about 15 seconds

It runs the exact script and rebuilds each table from the committed result files, comparing byte for byte. Expected:
seven lines `IDENTICAL …`, then `ALL IDENTICAL`.

| path | what | label |
|---|---|---|
| `exact/retarget_exact.py`, `.log`, `.json` | the capped game (1, −39/50, 779/10000) at the targets 1.4021, 1.4023, 1.4025, 1.4027: B₅ and 1/B₅, the room of each of the 21 pieces of D\* and what the funded allocation of ledger 4.44 leaves, the ends of the hypothesis-free ranges of ledger 4.18a, 4.18c, 4.18e, 4.18f (small t) and 4.18d (large t) with a failing control one grid step beyond each, the t = 0 test. It imports the verifiers of `../buffer-surplus-codex-a7c4/`, `../joint-spectral-cubic-lift-codex-a7c4/`, `../quintic-tangent-codex-a7c4/` and reads `Grothe/Lower/MassWitnessData.lean` as the second of them does | exact; C, author only |
| `exact/ridge_direct.py`, `.log` | the t = 0 test and the direct bound of ledger 4.18 (a) for the best game found at each cubic weight | exact given the games |
| `ladder.py`, `LADDER.md` | rooms 1/K\* − N by game and target, from the recorded norms and from `ceiling/eps_profile_K*.json` | arithmetic on N values |
| `ceiling/eps_profile.py`, `eps_profile_K2.json`, `eps_profile_K3.json` | the model norm of the best game of degree 5 (`KDEG=3`: degree 7) at each fixed cubic weight, without and with an identity tail: a cutting plane with one shared pool of explicit pairs (oracles W3, Z2, h∘ρ, plain phase; the engine of `../primal-dual/`). The JSON files keep the pool, so the linear programs can be re-solved | N |
| `ceiling/rescore.py`, `rescore.log` | re-scores the stored best game of every problem on the final shared pool (U = the largest payoff over the pool; one degree-7 value changed: 1.404114 → 1.404092); `eps_profile.py` now does this itself | arithmetic on the stored pool |
| `ceiling/law_rows.py`, `law_rows_*.json`, `law_table.py`, `LAW_ROWS.md` | row bounds with zero sector cost, Gaussian ideal against the plain law layer (moments and the radius 2287/2500), at t = 0 for three games and at the peak for the capped one (engine `../degree5-design/d5eng.py`) | N |
| `theta/gen_theta_job.py`, `extract_cells.py`, `collect_factors.py`, `thetas.json`, `cells.json`, `FACTORS.md` | the allowances θ_j(u, χ) of the funded design of ledger 4.44 recomputed with the room left at each target (the allowance program `scripts/r4_theta6.py` of `../degree5-design/design-2026-11-25/`, only the room changed), and the factors against the content ratios of the design run | N |

## The floating-point runs

Run on the droplet `yo` on 25 November 2026 in `~/claude-b9ee-retarget` (removed afterwards), four cores, with numpy
2.5.5, scipy 1.18.1, cvxpy 1.9.3 and clarabel in a virtual environment.

    # game profiles (two processes): 26 minutes for degree 5, 18 minutes for degree 7
    python ceiling/eps_profile.py eps_profile_K2.json 2 45 0.74,0.752,0.76,0.77,0.78,0.79,0.80,0.81,0.82,0.83,0.84,0.85,0.86,0.87,0.88,free
    KDEG=3 python ceiling/eps_profile.py eps_profile_K3.json 2 40 0.78,0.82,0.85,0.88,free
    # law rows (3 to 4 minutes per row without optimisation; re-run after the correction of the review of PR #711)
    python ceiling/law_rows.py law_rows_078.json 0.78 0.0779 0.9148 "0.845=0.842397,0.147989,-0.051554,-0.027777 0"
    python ceiling/law_rows.py law_rows_082.json 0.82 0.194 0.9148 "0"
    python ceiling/law_rows.py law_rows_0849.json 0.84896 0.2818 0.9148 "0"
    # allowances: 93 runs of r4_theta6.py, about 1.7 minutes each
    python3 -I theta/gen_theta_job.py ../degree5-design/design-2026-11-25 WORK/g078 WORK/fin_all.txt JOB ../../venv/bin/python
    (cd JOB && xargs -P 2 -I{} bash -c {} < cmds.txt)
    python3 -I theta/collect_factors.py pack JOB/g078/out JOB/rooms_targets.json

`WORK` is the folder `design/work` of the design run (band files, the command file `fin_all.txt`, the ratio files
read by `theta/extract_cells.py`), `JOB` needs in addition the tools `thresholds/*.py` of the degree-5 worker's
folder as `JOB/thresh`, the profile archives `g078/out/prof_t0p<row>.npz` and `r4_theta6.py`; all of these are
outside the repository ([`../../INVENTORY.md`](../../INVENTORY.md)). The per-run outputs of the allowance program
were not kept; `theta/thetas.json` holds what the table uses.
