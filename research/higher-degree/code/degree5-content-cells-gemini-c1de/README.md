# First-Chaos Content per `(u, chi)` Cell — Certifier & Verifier (`P1`, Issue `#623`)

Self-contained outward-rounded C++17 certifier, LP/Remez dual certificate generator, pure-stdlib Python `Fraction` verifier, and negative/corruption control suite for Problem `P1` ([P1-content-law-on-covering-rows.md](../../sources/degree5-attack-2026-11-25/problems/P1-content-law-on-covering-rows.md)): bounding the first-chaos content $\|c[h]\|_2^2 / \delta(q)$ of an arbitrary cubic chaos element $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$ ($n \ge 1$) against its fourth cumulant $\delta(q) = \mathbb{E}[|q|^4] - 2\|q\|_2^4$, per cell of energy $u = \|q\|_2^2$ and fourth excess $\chi = \delta(q)/u^2$, under the Rice gate `(R1)` at piece lower endpoint $t_{\mathrm{lo}}$.

Full mathematical derivations and verification statistics are in [PROOF.md](../../sources/degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md).

## Files

| File | Description |
| :--- | :--- |
| `certify_content_cells.cpp` | Zero-dependency, `libm`-free IEEE-754 `FE_UPWARD` C++17 certifier: encloses the 15 2D Gaussian row profiles $(G_A, G_B)$ and vortex-centered radial derivatives $h_X'(v)$ (with guaranteed moving-vortex overlap start and closed singleton mesh seams), runs the exact dependency-free backward interval recurrence for $k_X'(v)$, verifies all `109` continuous-law `JM1` slice and `(R1)` Farkas infeasibility certificates across $U \in [0, \infty)$, and certifies the enclosed $u = 1/10^6$, $\varepsilon_1 = 39/50$ low-energy Wick junta negative controls. |
| `generate_certificates.py` | Generates `dual_certs.json` and `< 220 KB` shards `dual_certs_1.json`..`dual_certs_7.json` from the outward-rounded C++ row enclosures using Kummer + Cauchy–Schwarz rational Rice tangents, Coupled-Gram + Cone-$\mathcal{K}$ rational Stein cuts, Kantorovich exponential duality, and Remez continuous polishing. |
| `dual_certs.json`, `dual_certs_1.json`..`dual_certs_7.json` | Manifest and 7 `< 220 KB` shards containing the `109` dyadic-rational continuous-law `JM1` and `(R1)` infeasibility dual certificates across Pieces 1–17 of `fin_table_fundFull.json` plus the own-row `0.70` and $u = 1/128$ negative controls. |
| `result.json` | Machine-generated receipt from `certify_content_cells --verify-all` (containing FIPS 180-4 SHA-256 digests of `dual_certs.dat`, `certify_content_cells.cpp`, `dual_certs.json`, and all 7 shards, plus per-cell `g1_range_A` / `g1_range_B` enclosures). |
| `verify.py` | Pure Python 3 stdlib `Fraction` receipt & tail auditor (`python3 -IB verify.py` and `python3 -IB -O verify.py`, checking SHA-256 bindings, all 15 distinct `row_summaries` with ordered `PA_inf`/`PB_inf` in `[-2, 2]`, Kummer/CS Rice tangents, multiplier signs, Coupled-Gram hypotheses, `g_1` slice coverage, asymptotic $U \ge U_0$ tails, closure of the `35/35` (Piece 16) and `11/11` (Piece 17) finite active cells (`theta < 50`) plus `theta = 50` table bins at the 5 grid energies, and per-bin intersection accounting on the missing `(24, 42]` bins at `0.92 u_cap`; `--replay-cpp` recompiles `certify_content_cells.cpp` and replays the 2D Gaussian row integrals and compact-interval $[0, U_0]$ suprema from scratch). |
| `test_controls.py` | 28-check positive-fixture, mathematical negative, rounded-midpoint Taylor & mixed-sign `FE_UPWARD` magnitude regression, moving-vortex join & singleton mesh-seam regression, outward-rounded C++ console vs receipt consistency, `g_1` slice-cover, SHA-256 binding, default-mode `row_summaries` validation (`[]`, 15 duplicates, inverted `PA_inf=[1,-1]`), missing-bin partition, and targeted corruption control suite against both `verify.py` and the live C++17 binary (`python3 -IB test_controls.py` and `python3 -IB -O test_controls.py`). |

## Reproduction

Fast offline receipt, SHA-256 binding, `g_1` slice-cover, and rational $U \ge U_0$ tail audit (exact Python `Fraction` arithmetic):

```bash
python3 -IB verify.py
python3 -IB -O verify.py
python3 -IB test_controls.py
python3 -IB -O test_controls.py
```

The C++17 replay integrates each cell profile and the three low-energy control profiles once from the 2D Gaussian definitions. The canonical 109 cells use all 15 rows. To recompile and run them:

```bash
python3 -IB verify.py --replay-cpp
```
