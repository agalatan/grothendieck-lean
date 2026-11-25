# Global Raw Joint A/B Certification (`7.4`, `7.4.5`, `7.4.17`)

Agent-ID: `gemini-4c4c` · Closes `#706`, Refs `#177`

Proof document: [`../../sources/raw-joint-ab-gemini-4c4c/PROOF.md`](../../sources/raw-joint-ab-gemini-4c4c/PROOF.md)

## What this folder certifies

At all three Conjecture K profile rows (`peak`, `flank`, `upper`), for $L = z_1(a + b T)$ ($T = |z_1|^2$), $p = 1/\varepsilon$, $h(z_1; \alpha, \beta) = (T - 1)\alpha + (z_1^2/\sqrt{2})\bar{\beta}$, $S_0 = |\alpha|^2 + |\beta|^2$, and
$$r_x(\alpha, \beta) = 2\,\mathbb{E}_{z_1}\bigl[|L + x + h| - |L + x| - \operatorname{Re}(h\,\overline{\operatorname{ph}(L + x)})\bigr],$$
both global inequalities hold for **every** $(x, \alpha, \beta) \in \mathbb{C}^3$ (strictly whenever $(\alpha, \beta) \ne (0, 0)$):

1. **Target S (closing `7.4` and `7.4.5` globally with reserve $\frac{1}{100} \gg 8.07\cdot 10^{-5}$):**
   $$r_x(\alpha, \beta) \le Q_s(\alpha, \beta) - \frac{1}{100}S_0 < Q_s(\alpha, \beta) - \frac{807}{10^7}S_0 \le Q_r(\alpha, \beta) - \frac{753}{10^7}S_0.$$
2. **Target D (global common diagonal A/B cost strictly below the sharp zero-core obstructions of `7.4.9`):**
   $$r_x(\alpha, \beta) \le (p - \kappa_{\mathrm{diag}})(|\alpha|^2 + |\beta|^2), \qquad \kappa_{\mathrm{diag}} = \frac{7}{25} = 0.28 \text{ (peak)},\; \frac{3}{10} = 0.30 \text{ (flank)},\; \frac{31}{100} = 0.31 \text{ (upper)}.$$

## Files

- `certify_raw_joint_ab.cpp`: Self-contained outward-rounded C++17 (`FE_UPWARD`, `-ffp-contract=off -frounding-math`, zero `libm` transcendentals, compile-time `-DNDEBUG` rejection) certifier covering `peak`, `flank`, and `upper`.
- `result.json`: Committed exact `std::hexfloat` certificate.
- `verify.py`: Pure Python 3 standard-library (`python3 -I`, zero floats in acceptance) verifier checking `certify_raw_joint_ab.cpp`'s SHA-256, proving the $|x| \ge 29/10$ (`< 187/200 S_0`) and $\|v\|_\infty \ge 4$ (`< 47/50 S_0`) exteriors and `7.4.2` corollaries in exact `Fraction` arithmetic, auditing Parts 1–3 of `result.json`, and optionally replaying the C++ build bit-for-bit (`--replay-cpp`).
- `test_controls.py`: 21 adversarial corruption and compiler/hotspot negative controls.

## Replay

```sh
python3 -I research/conjecture-K/code/raw-joint-ab-gemini-4c4c/verify.py
python3 -I research/conjecture-K/code/raw-joint-ab-gemini-4c4c/verify.py --replay-cpp
python3 -I research/conjecture-K/code/raw-joint-ab-gemini-4c4c/test_controls.py
```
