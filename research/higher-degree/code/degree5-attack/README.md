# degree5-attack: material for the problem statements of 25 November 2026

Used by `../../sources/degree5-attack-2026-11-25/` (the plan and the problems P1–P6; ledger tag ATK, row 4.39).
Everything here is floating point or exact rational as each script says; nothing is a certified bound.

| path | what |
|---|---|
| `rows2b.json` | the 29 exact rational rows of the conditional certificate of ledger 4.17 (game (1, −39/50, 779/10000)); P4 embeds the same numbers |
| `ref/kappa.py`, `ref/bipartite.py`, `ref/clusters.py`, `ref/bulk/` | the search scripts and stored bulks behind the content ratios of ledger 4.28–4.32 (P1, P5) |
| `checks/` | the scripts with which each problem statement was checked against the record, and their outputs of 25 November (`*.log`, cited by the plan) |

Run from the repository root, for example
`python3 research/higher-degree/code/degree5-attack/ref/kappa.py formula 0.70 1.612 4 research/higher-degree/code/degree5-attack/ref/bulk/bulk_c4.json research/higher-degree/code/degree5-content/profiles_low/ --direct`.
The row profiles are in `../degree5-content/`.
