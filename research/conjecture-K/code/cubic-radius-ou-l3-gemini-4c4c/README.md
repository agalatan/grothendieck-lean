# Exact Zero-Float Verifiers & Certificate for $\rho_* \le \frac{114}{125} = 0.912$ (`KOUL3`, Issue #720)

- **Proof note:** [`../../sources/cubic-radius-ou-l3-gemini-4c4c/PROOF.md`](../../sources/cubic-radius-ou-l3-gemini-4c4c/PROOF.md)
- **Ledger rows:** [`../../STATUS.md`](../../STATUS.md) (`3.6`, `3.7`, `3.21`), [`../../../higher-degree/STATUS.md`](../../../higher-degree/STATUS.md) (`1.12`, `4.8`, `4.12`, `4.18`, `4.18e`, `4.18f`)

## Files

| File | Description |
|---|---|
| `cert_912.json` | Exact rational certificate (`< 300 KB`): tied 3-parameter $U(1)$-averaged OU resolvent block on $\chi \in [0, 11/2]$ (`S_cplx = 3299/625000`, `< 91196/100000`), 10 contiguous Compactly-Supported Damped Level-3 ($\varepsilon \in \{1/6, 1/25\}$) & Level-2 Stein rows on $[11/2, 42]$ (`< 114/125 = 0.912`, and `< 443/500 < \sqrt{\pi}/2` on $[25, 42]$), and all 7 downstream exact rational cutoffs |
| `verify.py` | Primary pure-stdlib zero-float verifier: sequential $1\times 1$ interval $LDL^\top$ OU resolvent cover on $V \in [0, \infty)$ + exact integer Sturm chains + all 7 downstream consequences (`--generic` skips theorem-constant pinning; integer monotonic clock) |
| `verify_bernstein.py` | Second pure-stdlib zero-float verifier: independent on all 10 Stein rows and the `4.18e` sixth-moment ray (trapezoid knot primitives + recursive Laplace `det_mat()` + integer Bernstein subdivision + symbolic $\mathbb{Q}[v, c_2][c_1, \rho, \alpha_2]$ raw Stein bracket verification), and applying $2\times 2$ Block Schur complements to the shared OU quadrature/congruence enclosures |
| `check_identities_exact.py` | Pure-stdlib zero-float symbolic & interval identity checks: real-coordinate vs Wirtinger gradient & 6-component chaos orthogonality on $H_{2,1}(\mathbb{C}^d)$, `sd_quad_coeffs_18` & folded-$[0, \pi/4]$ polynomial moments, $\operatorname{He}_3(Z)/\sqrt{6}$ 1-step OU overlap via `(G_sum, G_diff)`, traced Wick identity $q = \sum_j(\bar z_j F_j - \partial_j F_j)$ (`d = 1, 2, 3`), `(I)`–`(VII)` + `(V_eps)`–`(VII_eps)` across $\varepsilon \in \{1/6, 1/25, 1/40\}$, and zero-set regression checks at $q = z(\|z\|^2 - 2)/\sqrt{2}$, $z = \sqrt{2}$ |
| `test_controls.py` | Pure-stdlib zero-float AST zero-float self-audit + adversarial negative & corruption controls across OU resolvent, Level-2, Damped Level-3, downstream cutoffs, sign guards, and default vs `--generic` mode |
| `make_cert.py` | Standalone numerical Clarabel/HiGHS certificate generator (requires `numpy`, `scipy`, `clarabel`; dual-verifies every generated row on the spot) |

## Exact Replay (Python 3 stdlib only, zero floats)

```sh
python3 -IB -O research/conjecture-K/code/cubic-radius-ou-l3-gemini-4c4c/verify.py
python3 -IB -O research/conjecture-K/code/cubic-radius-ou-l3-gemini-4c4c/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/cubic-radius-ou-l3-gemini-4c4c/check_identities_exact.py
python3 -IB -O research/conjecture-K/code/cubic-radius-ou-l3-gemini-4c4c/test_controls.py
```
