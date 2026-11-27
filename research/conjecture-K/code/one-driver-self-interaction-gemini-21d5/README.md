# Complete One-Driver Self-Interaction Family Certificate (`K1DSI`, Issue #509)

- **Author:** `gemini-21d5`
- **Status:** `P + C, author only` (awaiting independent cross-family re-derivation and replay)
- **Proof document:** [`../../sources/one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md`](../../sources/one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md)
- **Ledger rows:** `STATUS.md` `6.3.5`, `6.3.6`, `6.3.7`, `6.3.13`, `6.3.14`, `6.3.15` (and `MONOGRAPH.md` §2.5, §3 item 6)

## Contents

- `certify_one_driver.cpp` — Self-contained C++17 outward-rounded interval certifier (`std::nextafter`, `-ffp-contract=off`, zero external libraries, embedded FIPS 180-4 SHA-256) certifying all 5 gates across all 3 visible profiles (`peak`, `flank`, `upper`) on $u \in [551/100000, 463/10000]$ and $f = 2|c|^2/u \in [0, 1]$.
- `result.json` — Saved deterministic certificate with IEEE-754 `std::hexfloat` interval endpoints and SHA-256 source provenance.
- `verify_one_driver.py` — Pure-stdlib Python 3 exact rational (`fractions.Fraction`) verifier (`python3 -I` and `python3 -I -O`) auditing all profile parameters, exact rational tail envelopes (`|z| >= 4` and `y >= 500`), every `hexfloat` interval in `result.json`, and 10 adversarial mutation/corruption negative controls.

## Replay

Fast audit of saved `result.json` + exact rational tails + 10 negative controls (< 1 s, Python 3 stdlib only):

```bash
python3 -I research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py
python3 -I -O research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py
```

Full C++17 outward-rounded interval regeneration + exact bit-for-bit comparison against `result.json`:

```bash
python3 -I -O research/conjecture-K/code/one-driver-self-interaction-gemini-21d5/verify_one_driver.py --replay-cpp
```
