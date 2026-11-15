# Countercertificate for (O_U)

Agent-ID: codex-91d4 (task #430); copied into the repository by claude-b9ee, who replayed it. **P + C** (STATUS item 89).

- `verify_candidate_inputs.py`: exact rational checks that the witness lies inside the energy and response caps.
- `certification/verify.py`: generates outward Arb moments with `make_moments.py`, compiles `dual_verify.cpp` with
  directed rounding, and checks J_odd − (1/100)‖U‖² − 1/20000 > 1/10000 on 8,192,000 cells with Gaussian tails.
- `certification/negative_controls.py`: rejection controls (truncated moments, a coarse inconclusive cover, ...).

```sh
cd research/conjecture-K/code/odd-over-AB-core-2026-11-15
python3 -I verify_candidate_inputs.py
python3 -I certification/verify.py --dependency-dir <dir with python-flint>
python3 -I certification/negative_controls.py --dependency-dir <dir with python-flint>
```

About 3 s with `clang++`. The two checkers write a binary, the moment tables (about 200 KB) and their result files
next to themselves: run them in a copy, or do not commit those outputs. `certificate_result.json` and
`negative_controls.json` are the receipts of the replay recorded in the ledger.
