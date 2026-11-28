# Shifted Second-Chaos Variance Closure (`17/50 > 1/3`), All-Degree Wiener Chaos `< 1` Bounds, and Seventh-Chaos `V_7` / `H_{4,3}` OU Tower (`KADS458`, `#458`)

Self-contained exact rational certificates, dual zero-float Python 3 standard-library verifiers, exact multivariate polynomial / Gaussian Wick checkers, and `96` adversarial negative controls for [`../../sources/shifted-chaos-alldeg-458-gemini-8732/PROOF.md`](../../sources/shifted-chaos-alldeg-458-gemini-8732/PROOF.md) (`Agent-ID: gemini-8732`, issue `#458`, tag `KADS458`).

## Contents

| File | Description |
|---|---|
| `cert_shifted_q_458.json` | Exact rational spectral Stein–Hankel certificate across `16` shift knots $t \in [0, \frac{16}{5}]$ (`124` polygonal $(m_1, m_2)$ cells) + `15` supporting tangents proving $\operatorname{Var}\|t + Q\| \ge \frac{17}{50} S^2$ for all $t \in \mathbb{R}$ and $Q = \sum_{i=1}^n \lambda_i(G_i^2 - 1) + \sigma Z$ ($> \frac{1}{3} S^2$ for $S > 0$), and $\mathbb{E}\|a\operatorname{He}_3(X) + X Q_0(Y) + c Z\| \le \sqrt{\frac{99}{25\sqrt{35}}}\|F\|_2 \le \frac{4091}{5000}\|F\|_2$ ($< \frac{2}{35^{1/4}}\|F\|_2 < \frac{\sqrt{17}}{5}\|F\|_2$ for $F \ne 0$) |
| `cert_v7_458.json` | Exact rational Level-2 Malliavin–Stein OU tower certificate on real seventh Wiener chaos $V_7(\mathbb{R}^n)$ ($s \in [0, 2]$ + tail $[2, 272{,}832]$) and complex heptic chaos $H_{4,3}(\mathbb{C}^n)$ ($\chi \in [0, 1]$ + tail $[1, 94{,}966]$) |
| `verify.py` | Primary 100% Python 3 stdlib verifier (zero floats, zero `assert`s): Machin $\pi$, exact integer Sturm sequences on all intervals and infinite rays, all-degree polynomial majorant factorization in $\mathbb{Q}[b, \delta]$, 17-tangent $(m_1, m_2)$ polygon & $(m_1, m_2)$ hole bounds, supporting tangents, large-$\|t\|$ SOS tail, and $V_7 / H_{4,3}$ OU tower |
| `verify_bernstein.py` | Second independent 100% Python 3 stdlib verifier (zero floats, zero `assert`s): exact Bernstein subdivision, generic recursive Laplace `det_mat()`, and exact multivariate symbolic polynomial identity verification in $\mathbb{Q}[x][M_0, M_1, M_2]$ and $\mathbb{Q}[r][\tau_1, \tau_2, \sigma_{1,r}, \nu_r, g_{\mathrm{sq}}]$ |
| `check_identities_exact.py` | 100% Python 3 stdlib symbolic Gaussian Wick & multivariate polynomial checker over $\mathbb{Q}[G_1, G_2, G_3, Z]$ and $\mathbb{Q}[X_1, X_2, X_3]$ (verifying `Br_0, Br_1, Br_2, Br_quad`, joint moment formulas, Markov–Krein $m_3$ bounds, $L\tau_1 = 12(\tau_2 - \tau_1)$, $\sigma_{1,r}^2 \le 42\tau_1^2\tau_2$, `{F = 0}` nodal states, and brute-force Frobenius matching submultiplicativity) |
| `test_controls.py` | AST zero-float / zero-`assert` / stdlib-only self-audit across all four verification files plus `96` adversarial negative and corruption controls against both `verify.py` and `verify_bernstein.py` |
| `make_certs.py` | Offline Clarabel SDP generator for `cert_shifted_q_458.json` and `cert_v7_458.json` (`numpy`, `scipy`, `clarabel`) |
| `REPLAY.log` | Exact output transcript of the full pure-stdlib verification and control suite under `-IB -O` and `-IB` |

## Replay Commands (100% Python 3 Standard Library, Zero Floats, `-O`-Safe)

From the repository root:

```bash
python3 -IB -O research/conjecture-K/code/shifted-chaos-alldeg-458-gemini-8732/verify.py
python3 -IB -O research/conjecture-K/code/shifted-chaos-alldeg-458-gemini-8732/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/shifted-chaos-alldeg-458-gemini-8732/check_identities_exact.py
python3 -IB -O research/conjecture-K/code/shifted-chaos-alldeg-458-gemini-8732/test_controls.py
```

Offline regeneration of both JSON certificates from scratch (requires `numpy`, `scipy`, `clarabel`):

```bash
/usr/local/bin/python3 research/conjecture-K/code/shifted-chaos-alldeg-458-gemini-8732/make_certs.py
```
