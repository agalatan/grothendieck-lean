# Free-Homothety Peak Transfer & End-to-End Consumer Closures (`KHOM`, Issue `#760`)

Agent-ID: `gemini-c1de`
Refs: `#760`, `#436`, `#177`

## Overview

This directory contains the self-contained zero-float, zero-`assert` Python 3 standard-library exact rational verifier (`verify.py`), 18-check AST and corruption control suite (`test_controls.py`), certificate generator (`generate_certs.py`), and compact rational certificate (`homothety_consumers_cert.json`, `< 300 KB`) for Issue `#760` (`STATUS.md` tag `KHOM`).

## Verification Commands

Both `verify.py` and `test_controls.py` use Python 3 standard library only (`fractions.Fraction`, `hashlib`, `json`, `math.{comb,factorial,isqrt}`, `os`, `sys`), with zero floating-point literals, zero `float(...)` calls, and zero `assert` statements (audited statically via `ast` in Control 1 of `test_controls.py`), running identically under `python3 -IB` and `python3 -IB -O`:

```bash
python3 -IB research/conjecture-K/code/homothety-consumers-gemini-c1de/verify.py
python3 -IB -O research/conjecture-K/code/homothety-consumers-gemini-c1de/verify.py

python3 -IB research/conjecture-K/code/homothety-consumers-gemini-c1de/test_controls.py
python3 -IB -O research/conjecture-K/code/homothety-consumers-gemini-c1de/test_controls.py
```

To regenerate `homothety_consumers_cert.json` from scratch:

```bash
python3 -IB research/conjecture-K/code/homothety-consumers-gemini-c1de/generate_certs.py
```

## What `verify.py` Proves and Checks

1. **Self-Contained Algebraic Benchmark Upper Polynomial $B_{\mathrm{hi}}(u_0) \ge B_0(u_0)$ & `2.7` Jensen Remote Bound:**
   - Encloses $\pi$, $\sqrt{\pi}$, and the peak positive deficit Laplace moments $M_D[0..7] > 0$ (`KRAW` §5.2, **`P + C`**) in 220-bit outward dyadic-rational interval arithmetic (`RatIval`), checking the exact partial-fraction identities in $\mathbb{Q}[T]$.
   - Constructs the degree-7 Hermite interpolant $U_7(y)$ of $\sqrt{1 + y}$ at double nodes $0, (\frac{17}{16})^2 - 1, (\frac{5}{4})^2 - 1, (\frac{13}{8})^2 - 1$ and proves $U_7(y) \ge \sqrt{1 + y}$ for all $y \ge 0$ algebraically in $\mathbb{Q}[y]$ via exact polynomial division $U_7(y)^2 - (1 + y) = y^2 \prod_{j=1}^3 (y - y_j)^2 Q_6(y)$ and an explicit Cholesky sum-of-squares decomposition of $Q_6(y)$.
   - Integrates against $d\mu_D(s) \ge 0$ to obtain $B_0(u) \le B_{\mathrm{hi}}(u)$ on $[0, \infty)$ (tight to $1.09 \times 10^{-7}$ at $u_*$), and combines `2.7` Jensen concavity $\Lambda_{p_0}(q_0) \le b_{\mathrm{hi},0} + (b_{\mathrm{hi},1} - p_0)u_0$ with `7.2.11` and `3.3`.
2. **Complete Bypass of `11.61`'s `[1/1000, 3/2000]` Exempt Box (`mode == 2` on $u_0 < \frac{3}{2000}$):**
   - Enforces pure `11.30` content mode ($\kappa = 0$, $C^2 \le \frac{84}{25}u_0^2$) on every strip with $u_{\mathrm{lo}} < \frac{3}{2000}$, preserving the peak retained headlines `< 29.36e-6` (`29.3522e-6` with `D_+` `11.61` on $[\frac{3}{2000}, \frac{463}{10000}]$) and `< 27.00e-6` (`26.9985e-6` with signed `11.61` on $[\frac{2}{125}, \frac{463}{10000}]$) with zero reliance on `11.61`'s `author only` exempt-box re-certification.
3. **End-to-End 1,773-Cell Full-Range (`t \in [0, \sqrt{\pi}/2]`) Closure of Consumer `8.5` (`\varepsilon = 149/200`, Pure `P + C`):**
   - Combines SHA-256-pinned `inherited_rows.json` (19 scalar rows + Lean `93/100` crude row) on $[0, \frac{\sqrt{\pi}}{2}] \setminus [\frac{21}{25}, \frac{1711}{2000}]$ with Track A's free-homothety all-sector cover `c85_149_200` on $[\frac{839}{1000}, \frac{8556}{10000}] \supset [\frac{21}{25}, \frac{1711}{2000}]$, proving $\|P_{1,0} - \frac{149}{200}P_{2,1}\|_{\infty \to 1} < \frac{100000}{140171} \implies K_G^{\mathbb{C}} > 1.40171$ across all 1,773 cells of $[0, \frac{\sqrt{\pi}}{2}]$ with **zero open premises**.
4. **Track A (Pure `P + C`) & Track B (`3.5a` + `3.3a`) Free-Homothety Multi-Witness Consumer Covers:**
   - **Track A (`Pure P + C`):** `8.1`/`8.7` (`\varepsilon = 1891/2500`) on `[21/25, R_HI]` (`[0.8400, \sqrt{\pi}/2]`); `8.13(ii)` (`\varepsilon = 94/125`) on `[21/25, 8645/10000]` (closing **100% of Rows 8–13** `[0.8400, 0.8630]` and overlapping `8.12(ii)`'s exterior); `8.13(i)` (`\varepsilon = 3/4`) on `[21/25, 429/500]` (`[0.8400, 0.8580]`, closing Rows 5–7 and halves of Rows 4 & 8); `8.10` (`\varepsilon = 299/400`) on `[21/25, 8498/10000]`.
   - **Track B (`3.5a` buffered-Rice + `3.3a` peak deficit):** closes **`[1679/2000, R_HI] = [0.8395, \sqrt{\pi}/2]`** gap-free below `500/701` on **all three `1.402` witnesses** (`\varepsilon = 1891/2500`, `\varepsilon = 94/125`, and `\varepsilon = 3/4` — closing **100% of Rows 5–9** of `8.13(i)`), plus `[1679/2000, 8499/10000] \cup [1731/2000, R_HI]` below `713263/10^6` on `8.10` (`\varepsilon = 299/400`).
