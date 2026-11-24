# Sharp Global Joint Secant Certifier & Exact Verifier (`#436`)

Agent-ID: `gemini-c1de`. Refs `#436`. Status: **P + C.** Independently checked and replayed by codex-a7c4. [independent review of the corrected #594](https://github.com/agalatan/grothendieck-lean/pull/594#issuecomment-7142979900)

This folder contains the self-contained C++ outward-rounded interval certifier,
the Python standard-library exact rational verifier, the saved machine-readable
certificate `result.json`, and 10 negative/corruption controls for the results
documented in
[`../../sources/sharp-joint-secant-gemini-c1de/PROOF.md`](../../sources/sharp-joint-secant-gemini-c1de/PROOF.md).

## Files

- `certify_joint_secant.cpp` — C++17 outward-rounded IEEE-754 interval
  certifier (compiled with `-ffp-contract=off`, `std::nextafter` in verified
  `FE_TONEAREST` mode; arithmetic enclosures for `sqrt`, `root_T`, `expneg`,
  `sincos`; startup finite-difference self-tests across all 36 second-derivative
  entries; 230 exact dyadic binary64 $w$-slabs on $[0, 8]$ covering Parts A, B,
  C, and D; exact IEEE-754 `std::hexfloat` output and outward-rounded staircase
  thresholds `rat(sm, 1000).h`).
- `verify.py` — Python 3 standard-library exact rational verifier (`python3 -I`,
  assertions required): checks peak-row constants, $Q_0 \succ 0$, the exact
  phase-invariant visible-shift + zero-mean compensating identity ($c_3 = c_4 = 0$)
  and $B_{\mathrm{re}}, B_{\mathrm{im}}, B_{7.5.6} \succ \frac{3}{5} I_3$,
  Theorem 2(b) symbolic polynomial positivity, the $w \ge 8$ analytic tail,
  `cpp_sha256` integrity, exact `float.fromhex` parsing of `result.json`,
  Parts A/B/D bounds, and the exact rational two-driver Gaussian tail
  expectation + multiscale staircase assembly.
- `result.json` — machine-readable output of `certify_joint_secant.cpp` with its
  matching `cpp_sha256`.
- `test_controls.py` — 10 negative/corruption controls verifying that tampering
  with any certified part, target $V$, `cpp_sha256`, or disabling assertions
  with `-O` causes clean rejection.

## Replay commands

Verify saved `result.json` and exact rational assembly (< 2 s):

```sh
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/verify.py
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/test_controls.py
```

Full end-to-end C++ recompilation and interval replay (~4.5 min on Apple Silicon):

```sh
python3 -I research/conjecture-K/code/sharp-joint-secant-gemini-c1de/verify.py --replay-cpp
```
