# Uncapped & Off-Peak Six-Sector Pointwise Closures (`KUOS`, Issue #826)

Agent-ID: `gemini-c1de`. Closes `#826`, Refs `#436`, `#177`.

This directory contains the self-contained C++17 outward-rounded (`FE_UPWARD`) interval certifier, exact `std::hexfloat` JSON certificates, pure-stdlib zero-float rational verifier, and 23-check AST/corruption/compiler control suite for `research/conjecture-K/sources/uncapped-offpeak-six-sector-gemini-c1de/PROOF.md`:

1. **Energy-cap-free (zero-quartic) global pointwise six-sector closures $F_{\mathrm{joint}}^{(0, i)}(c^*) \le 0$ on all of $\mathbb{C}^6$** (with purely quadratic even budget $B_P^{(0, i)}(A, B) = p_i S_r - (\frac{1}{4} + c_{\mathrm{iso}, i})|R|^2 - c_{\mathrm{iso}, i}|U|^2$, $s_A = 1/2$, and zero quartic $S_r^2$ or $|q|^2 S_r$ terms) at three rows:
   - **`peak`** (`STATUS.md` §0): $(a, b) = (699/1250, 179/1250)$, $p = 2500/1891$, $\rho = 5053/10000$, $c_{\mathrm{iso}} = 6/25$, $\alpha_\nu = -7/25$, $k_{\mathrm{comp}} = -11/20$ (`cert_peak.json`).
   - **`row7`** (`STATUS.md` 8.13(ii) Row 7, $t \in [831/1000, 21/25] = [0.831, 0.840]$): $(a, b) = (5514887/10^7, 1395547/10^7)$, $p = 125/94$, $\rho = 5067/10000$, $c_{\mathrm{iso}} = 23/100$, $\alpha_\nu = -27/100$, $k_{\mathrm{comp}} = -59/100$ (`cert_row7.json`).
   - **`row6`** (`STATUS.md` 8.13(ii) Row 6, $t \in [411/500, 831/1000] = [0.822, 0.831]$): $(a, b) = (679519/1250000, 673221/5000000)$, $p = 125/94$, $\rho = 1273/2500$, $c_{\mathrm{iso}} = 11/50$, $\alpha_\nu = -29/100$, $k_{\mathrm{comp}} = -63/100$ (`cert_row6.json`).
2. **Energy-cap-free Peak six-sector corollaries across arbitrary $(V, W) \in [0, \infty)^2$** (verified in 220-bit zero-float rational arithmetic in `verify.py` against SHA-256-pinned `profile-caps.json` and `moment-boxes.json`, with zero `11.61` exempt-box dependency):
   - Zero-content cubics (`11.31`, `11.31a`, `11.60`): $\widehat{\Lambda}(G) \le \Lambda(q) - \frac{6}{25}(1 + \rho_0^2)V$ for all $(u, V, W) \in [0, \infty)^3$.
   - Low remote energy: $\widehat{\Lambda}(G) < S$ strictly for all $(V, W) \in [0, \infty)^2$ across $0 \le u \le 23/1000 = 0.023$ ($0 \le u \le 11/500 = 0.022$ on $V \ge 0.080051 - u$ from `3.3` alone without moment boxes).
   - Full Peak response band $0 \le u \le 463/10000 = 0.0463$: $\widehat{\Lambda}(G) < S$ strictly for all $V \ge 1/16 = 0.0625, W \ge 0$ (`11.61` on $[11/500, 463/10000]$ only, zero exempt boxes), and for all $V \ge 181/2500 = 0.0724, W \ge 0$ without `11.61`.
   - High remote energy: $\widehat{\Lambda}(G) < S$ strictly for all $u \ge 121/200 = 0.605$ and all $(V, W) \in [0, \infty)^2$.
3. **Exact lower-central obstructions on Rows 1–4 of `8.13(ii)`** (`cert_obstructions.json` + `verify.py`, cross-checked against SHA-256-pinned `central_94_125_certificate.json`):
   - Rows 1 & 2 (`[0.7515, 0.780]`): zero-core $z_1 Q$ quadratic coefficient $J_1(a_i, b_i) > 125/94$.
   - Rows 3 & 4 (`[0.780, 0.812]`): at exact dyadic shift $w_0 = 29/64 = 0.453125$ and unit vector $u = (4/5, 3/5, 0)$ ($\nu = 0$), $\langle u, \mathcal{O}_{\mathrm{sec,im}}^{(i)}(29/64) u\rangle > 125/94 + 0.028$.

## Files

- `certify_uncapped_offpeak.cpp` — Self-contained C++17 `FE_UPWARD` interval certifier (`#ifdef NDEBUG` `#error` guard; `-O2 -ffp-contract=off -frounding-math -std=c++17 -pthread -Wall -Wextra -Werror`).
- `cert_peak.json`, `cert_row7.json`, `cert_row6.json` — Exact `std::hexfloat` certificates (`< 300 KB` each) for Parts 1 (`[3, 12]`, 144 slabs), 2 (`[0, 3]`, 248 decoupled Smooth-Split $H_{5,\delta}$ / `KJSEC` Theorem 2(a) origin-strip slabs), and 3 (`[0, 3]`, 120 adaptive `Box5` bulk slabs).
- `cert_obstructions.json` — Shifted-polar `Jet2` interval enclosure of $M_{0,\mathrm{im}}^{[0,25]}(29/64)$ on Rows 3 and 4 of `8.13(ii)`.
- `verify.py` — Pure Python 3 stdlib verifier (zero `float`, zero `assert`, `parse_float=Fraction`; identical under `-IB` and `-IB -O`).
- `test_controls.py` — Static `ast` zero-float/zero-`assert` audit, subprocess `-IB` vs `-IB -O` parity check, and 21 mathematical, certificate-corruption, `-DNDEBUG`, and live C++ false-hotspot controls.

## Replay Commands

From the repository root:

```bash
# 1. Primary zero-float rational audit (< 3 s, stdlib only, both modes):
python3 -IB research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/verify.py
python3 -IB -O research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/verify.py

# 2. Static AST zero-float/zero-assert audit + 23 adversarial controls (~6 s, both modes):
python3 -IB research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/test_controls.py
python3 -IB -O research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/test_controls.py

# 3. Full C++17 regeneration from source + zero-float audit:
python3 -IB -O research/conjecture-K/code/uncapped-offpeak-six-sector-gemini-c1de/verify.py --replay-cpp
```
