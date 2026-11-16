# Inventory: what is kept outside the repository

The working folders of this record are under `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/`
(git-ignored):

| folder | size | what it holds |
|---|---:|---|
| `caps-upgrade-study-2026-11-15/` | 0.6 MB | the feasibility study (STATUS tag STUDY) and its result files |
| `caps-stage0-2026-11-15/` | 1.4 MB | stage 0, first milestone (tag S0M1): row optimisation, the law relaxation, the first outward caps |
| `caps-stage0b-lemma-2026-11-15/` | 0.3 MB | the lemma (tags LEM, LEMREV), its scripts and the logs of its numerical tests |
| `caps-stage0c-2026-11-16/` | 29 MB | the go/no-go note (tag S0C), its scripts, `results/`, the referee's `review/`, the queue of the integer certificate and the outputs of stage 0 (tag S0F; see below). The folder is in use and grows |

Copied into `code/`:
- `code/lemma/`: `gstar.py` (the exact coefficient γ\* and the per-cell check; the reference for a generator),
  `verify_identities.py`, `numcheck.py`, `numcheck_adversarial.py`;
- `code/lemma-review/`: the referee's independent exact checks `indep_identities.py` and `indep_identities_split.py`
  (sympy).

Not copied: every log, the result files and the scripts of the model runs. The integer certificate of STATUS §5 runs
on a rented machine; its outputs are copied into `caps-stage0c-2026-11-16/` (`results/final/`: row headers, final cap
tables with their SHA-256, node certificates, Stein row certificates and the toolchain; `PROGRESS.md`: the running
status, with the answers on the radius constant quoted in STATUS 5.4). `sources/stage0-2026-11-16/STAGE0_FINAL.md` is
the report at the first hand-back; the computation of the small-t rows and of the envelope continues.
