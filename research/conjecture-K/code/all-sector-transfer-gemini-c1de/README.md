# Retained Six-Sector Sharpening, Scaled Profile Transfer, and Central Consumer Slabs (`KAST`, Issue `#728`)

**Author:** `gemini-c1de`
**Refs:** `#728`, `#436`, `#177`
**Ledger tag:** `KAST` (`research/conjecture-K/STATUS.md` rows `7.4.10`, `7.4.16`, `7.5.3`, `7.5.13`, `8.1`, `8.10`, `8.13`, `11.47`, `11.53`)

## Contents

- [`PROOF.md`](../../sources/all-sector-transfer-gemini-c1de/PROOF.md) — Complete mathematical derivations, separation of unconditional **`P + C`**-input results (`7.4.16` `A + B` peak/transfer and `7.5.3` `(P_Psi)` cession) from `7.5.13`-conditional all-sector corollaries, exact $\lambda > 1$ visible-trial accounting, and consumer $t$-slab tables.
- `generate_certs.py` — Deterministic exact rational (`fractions.Fraction`) generator producing `all_sector_transfer_cert.json` (`< 300 KB`).
- `all_sector_transfer_cert.json` — Compact exact rational certificate bundle (`kast-v1`): 8 2D `(u, V)` covers (`peak`, `0.01||U||^2` cession, and `11.53` scaled profile covers in both `D_+` and signed `11.61` modes) plus 5 subdivided actual-response consumer $t$-slab covers (`8.1`, `8.13(ii)`, `8.13(i)`, `8.10`).
- `verify.py` — **100% zero-float, zero-`assert`** pure-stdlib Python 3 `Fraction` verifier (`math.isqrt`, `fractions.Fraction`). Re-proves Machin $\pi$, $\sqrt{\pi}$, and the `2.12a–b` Rice tangent at $u = 1/10$ from scratch, audits every strip and 2D cell, verifies `11.53` profile bounds, directly verifies Row 8 (`[21/25, 847/1000]`) of `8.13(ii)` against `central_94_125_certificate.json`, and audits all 5 consumer $t$-slab covers.
- `test_controls.py` — 17-check positive-fixture, mathematical negative-control (including forbidden signed `11.61` below $u = 2/125$ and omitted $(\lambda - 1)\frac{49}{625}|\nu|^2$ on $\lambda > 1$ six-sector transfer), and corruption control suite.

## Replay Commands

From the repository root (passes identically with and without `-O`, < 2 s):

```bash
python3 -IB research/conjecture-K/code/all-sector-transfer-gemini-c1de/verify.py
python3 -IB -O research/conjecture-K/code/all-sector-transfer-gemini-c1de/verify.py
python3 -IB research/conjecture-K/code/all-sector-transfer-gemini-c1de/test_controls.py
python3 -IB -O research/conjecture-K/code/all-sector-transfer-gemini-c1de/test_controls.py
```

To regenerate `all_sector_transfer_cert.json` from scratch:

```bash
python3 -IB research/conjecture-K/code/all-sector-transfer-gemini-c1de/generate_certs.py
```
