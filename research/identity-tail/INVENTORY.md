# Inventory: what is kept outside the repository

The working folders of this record are under `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/`
(git-ignored):

| folder | size | what it holds |
|---|---:|---|
| `caps-upgrade-study-2026-11-15/` | 0.6 MB | the feasibility study (STATUS tag STUDY) and its result files |
| `caps-stage0-2026-11-15/` | 1.4 MB | stage 0, first milestone (tag S0M1): row optimisation, the law relaxation, the first outward caps |
| `caps-stage0b-lemma-2026-11-15/` | 0.3 MB | the lemma (tags LEM, LEMREV), its scripts and the logs of its numerical tests |
| `caps-stage0c-2026-11-16/` | 234 MB | the go/no-go note (tag S0C), its scripts, `results/`, the referee's `review/`, the queue of stage 0, and the complete integer certificate with its checks (tags S0F, S0D, S0DL, SPEC, REPLAY; see below) |

Copied into `code/`:
- `code/lemma/`: `gstar.py` (the exact coefficient γ\* and the per-cell check; the reference for a generator),
  `verify_identities.py`, `numcheck.py`, `numcheck_adversarial.py`;
- `code/lemma-review/`: the referee's independent exact checks `indep_identities.py` and `indep_identities_split.py`
  (sympy).

Not copied: every log, the result files and the scripts of the model runs.

**The integer certificate of STATUS §5** (`caps-stage0c-2026-11-16/`; nothing of it exists only on the machine where it
ran):

| path | size | what it holds |
|---|---:|---|
| `results/final_0d/` | 92 MB, 1,163 files | the certificate files, verifiers, generators, price code, tables, bindings, caps files, moment tables, the tools and all results of the replay (`replay/`); the 170 files of `final/MANIFEST_stage0d.sha256` are identical to the machine's |
| `results/final_0d/final/env_final_clean.json` | | the envelope of STATUS 5.1, SHA-256 `927b018bebec4826fa6db8913d0142c1b295be2372ef5c5e426f2d383b9980a5` |
| `lean-data/` | 23 MB, 87 files | the inputs of the Lean generator (the final row set, per row table, binding and bound records, the law certificates, the moment tables), with its own README and checker |
| `results/big_claude-b9ee-capsnu2_2026-11-17.tar.gz` | 70 MB | the complete working folder of the machine (5,599 entries, 334 MB unpacked), SHA-256 `1365deac78cd5b252e7212aee1e92d8761d79f8de42043f3fefeff8fede1f686` |
| `speccheck/` | | the independent check of the three spectral rows (tag SPEC): `speccheck.py`, `sturm_check.py`, the tests, `run_all.sh`, the logs |
| `lean-stage2/` | | the Lean worker's measurements, the coverage port and the replay harness of STATUS 6.4 |
| `results/final/` | | the stage-0c copy of 16 Nov, 18:47, superseded by `results/final_0d/` |

Copied into `sources/stage0d-2026-11-17/`: `PROGRESS.md`, `STAGE0_FINAL.md`, `SPECCHECK.md`, `FINAL_REPLAY.md` and
`LEAN_STAGE2_DESIGN.md` with a first line added; `ROW_CONSTANTS.txt`, `MANIFEST_stage0d.sha256` and `lean-data/SHA256SUMS`
unchanged. To re-verify from the copy on the laptop (standard library only; the first two take a few minutes on four
processes):

```sh
cd /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/results/final_0d
python3 -I stein/tools/verify_cert.py stein/multi_C 4 --rows /tmp/rows_cut.json            # the 18 plain-cut rows
for c in mass_0.5 row_0.4b row_0.6; do STEIN_TOOLS=$PWD/stein/tools python3 -I stein/rows_direct/spec/verify_spec.py stein/rows_direct/spec/cert_${c}_pruned.json 4; done
python3 -I final/verify_finalenv.py final/env_final_clean.json                              # the envelope from the row constants
python3 -I ../../lean-data/check_leandata.py                                                # the Lean inputs fit together
```

The replay of the node caps is described in `results/final_0d/replay/FINAL_REPLAY.md` §5, and the independent check of
the spectral rows runs with `speccheck/run_all.sh` (SPEC §§4, 6). `sources/stage0-2026-11-16/STAGE0_FINAL.md` is the
report at the first hand-back; `sources/stage0d-2026-11-17/STAGE0_FINAL.md` is the same log to the end.
