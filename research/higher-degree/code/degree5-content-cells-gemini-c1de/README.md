# First-Chaos Content per `(u, chi)` Cell — Certifier & Verifier (`P1`, Issue `#623`)

Self-contained outward-rounded C++17 certifier, LP/Remez dual certificate generator, pure-stdlib Python `Fraction` verifier, and negative/corruption control suite for Problem `P1` ([P1-content-law-on-covering-rows.md](../../sources/degree5-attack-2026-11-25/problems/P1-content-law-on-covering-rows.md)): bounding the first-chaos content $\|c[h]\|_2^2 / \delta(q)$ of an arbitrary cubic chaos element $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ ($n \ge 1$) against its fourth cumulant $\delta(q) = \mathbb{E}[|q|^4] - 2\|q\|_2^4$, per cell of energy $u = \|q\|_2^2$ and fourth excess $\chi = \delta(q)/u^2$, under the Rice gate `(R1)` at piece lower endpoint $t_{\mathrm{lo}}$.

Full mathematical derivations and verification statistics are in [PROOF.md](../../sources/degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).

## Files

| File | Description |
| :--- | :--- |
| `certify_content_cells.cpp` | Zero-dependency, `libm`-free IEEE-754 `FE_UPWARD` C++17 certifier: encloses the 15 2D Gaussian row profiles $(G_A, G_B)$ and vortex-centered radial derivatives $h_X'(v)$, runs the exact dependency-free backward interval recurrence for $k_X'(v)$, verifies all `109` continuous-law `JM1` slice and `(R1)` Farkas infeasibility certificates across $U \in [0, \infty)$, and certifies the $u = 10^{-6}$ low-energy Wick junta negative controls. |
| `generate_certificates.py` | Generates `dual_certs.json` and `< 220 KB` shards `dual_certs_1.json`..`dual_certs_7.json` from the outward-rounded C++ row enclosures using Kummer + Cauchy–Schwarz rational Rice tangents, Coupled-Gram + Cone-$\mathcal{K}$ rational Stein cuts, Kantorovich exponential duality, and Remez continuous polishing. |
| `dual_certs.json`, `dual_certs_1.json`..`dual_certs_7.json` | Manifest and 7 `< 220 KB` shards containing the `109` dyadic-rational continuous-law `JM1` and `(R1)` infeasibility dual certificates across Pieces 1–17 of `fin_table_fundFull.json` plus the own-row `0.70` and $u = 1/128$ negative controls. |
| `result.json` | Machine-generated receipt from `certify_content_cells --verify-all`. |
| `verify.py` | Pure Python 3 stdlib `Fraction` verifier (`python3 -IB verify.py` and `python3 -IB -O verify.py`; `--replay-cpp` recompiles and replays the C++17 binary from scratch). |
| `test_controls.py` | 18-check positive-fixture, mathematical negative, and targeted corruption control suite against both `verify.py` (preserving `< 220 KB` shards and asserting specific error diagnostics) and the live C++17 binary (`python3 -IB test_controls.py` and `python3 -IB -O test_controls.py`). |

## Reproduction

Fast offline audit (exact Python `Fraction` arithmetic on all Kummer + Cauchy–Schwarz Rice tangents, algebraic witnesses, multiplier signs, Coupled-Gram hypotheses, asymptotic $U^3$ tails, and continuous $\chi$-coverage):

```bash
python3 -IB verify.py
python3 -IB -O verify.py
python3 -IB test_controls.py
python3 -IB -O test_controls.py
```

Full C++17 recompilation and replay from the 2D Gaussian integral definitions:

```bash
python3 -IB verify.py --replay-cpp
```
