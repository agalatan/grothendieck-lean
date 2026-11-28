# Oscillation-Preserving OU Cone, Enhanced `V_3(R^n)` Hierarchy, & Fifth-Chaos `V_5(R^n)` / `H_{3,2}(C^n)` Certificates (`#458`)

Self-contained exact rational certificates and zero-float Python 3 standard-library verification suite
for [`../../sources/chaos-stein-458-gemini-8732/PROOF.md`](../../sources/chaos-stein-458-gemini-8732/PROOF.md)
(tag `KCS458`; `STATUS.md` rows `3.6`, `3.7`, `3.18`, `3.21 (e1)`, `3.21 (e9)`, `3.30`;
`higher-degree/STATUS.md` rows `1.12`, `4.8`, `4.12`, `4.18a`, `4.18e`, `4.18f`).

## Certified Claims

*(Notation: for nonzero $F$, $s = s(F) := \kappa_4(F/\|F\|_2) = \mathbb{E}[F^4]/\|F\|_2^4 - 3$ is the standardized fourth cumulant, while $\kappa_4(F) = \mathbb{E}[F^4] - 3\|F\|_2^4$ is the raw fourth cumulant; for nonzero $q$, $\chi(q) := \mathbb{E}|q|^4/\|q\|_2^4 - 2$ and $u := \|q\|_2^2$. Homogeneous $L^1$ bounds $\mathbb{E}|F| \le C\|F\|_2$ and $\mathbb{E}|q| \le C\|q\|_2$ hold directly at $F = 0$ and $q = 0$.)*

1. **Part I — Oscillation-Preserving Two-Step Ornstein–Uhlenbeck Near-Gaussian Cone (`verify_ibp_cone.py`):**
   - Certifies $|R_{|x|}(F)| \le \frac{21}{20}\,\kappa_4(F)^{3/2} = 1.05\,\kappa_4(F)^{3/2}$ for unit-variance $F \in V_3(\mathbb{R}^n)$ across $\kappa_4(F) \le \frac{1}{100}$ in 1 Bernstein leaf (down from $\frac{86}{25} = 3.44$ in `KSR`).
   - **Real $V_3(\mathbb{R}^n)$ (`3.21 (e1)`):** for nonzero $F \in V_3(\mathbb{R}^n)$, $\mathbb{E}|F| \le \sqrt{\frac{2}{\pi}}\|F\|_2\big(1 - \frac{s}{48}\big)$ for $0 < s \le \frac{1}{5900}$, and $\mathbb{E}|F| < \sqrt{\frac{2}{\pi}}\|F\|_2$ for $0 < s \le \frac{1}{1475}$ (**8.30x** larger than `KSR`).
   - **Complex $H_{2,1}(\mathbb{C}^n)$ (`3.18`):** for nonzero $q \in H_{2,1}(\mathbb{C}^n)$, $\mathbb{E}|q| \le \frac{\sqrt{\pi}}{2}\sqrt{u}\big(1 - \frac{\chi}{32}\big)$, buffered PVD ($W$ independent of $q$), and exact remote Conjecture K at every energy, price, and profile ($z_1$ independent of $q$) for $0 < \chi \le \frac{1}{8300}$ (via $C_{6,\mathbb{C}} = \frac{4045313}{100000}$; $\frac{1}{8850}$ via $U(1)$ transfer), and $\mathbb{E}|q| < \frac{\sqrt{\pi}}{2}\sqrt{u}$ for $0 < \chi \le \frac{1}{2075}$ (**8.67x** larger than `KSR`).

2. **Part II — Enhanced Real Level-2+ Malliavin–Stein Hierarchy on $V_3(\mathbb{R}^n)$ & $H_{2,1}(\mathbb{C}^n)$ (`cert_v3_458.json`):**
   - **Sharp Gaussian regime on $V_3(\mathbb{R}^n)$:** for nonzero $F \in V_3(\mathbb{R}^n)$, $\mathbb{E}|F| \le \frac{19946}{25000}\|F\|_2 = 0.79784\,\|F\|_2 < \sqrt{\frac{2}{\pi}}\|F\|_2$ across **$s = \kappa_4(F/\|F\|_2) \in [5, 90]$** (and $\le \frac{3989}{5000}\|F\|_2 = 0.7978\,\|F\|_2$ on $s \in [\frac{11}{2}, 90]$, down from $s \ge 14$ in `KRS501`), transferring to **$\chi(q) \in [\frac{10}{3}, 42]$** ($\mathbb{E}|q| \le \frac{4431}{5000}\|q\|_2 < \frac{\sqrt{\pi}}{2}\|q\|_2$) for nonzero $q \in H_{2,1}(\mathbb{C}^n)$.
   - **Global third-chaos bounds:** $\mathbb{E}|F| \le \frac{1997}{2500}\|F\|_2 = 0.7988\,\|F\|_2$ across all $F \in V_3(\mathbb{R}^n)$, and $\mathbb{E}|q| \le \frac{8873}{10000}\|q\|_2 = 0.8873\,\|q\|_2$ across all $q \in H_{2,1}(\mathbb{C}^n)$, plus all 7 strictly improved downstream degree-5/7 cutoffs (`1.12`: `100000000000/110458370987 > 0.90531`, `4.12`: `50000000000/55189820429 > 0.90596`, `4.18a`: `0.323827`, `4.18e`: `0.45419761` / `0.45765271` / `0.45352867`, `4.18f`: `0.45665` pure / `0.45669` with `KNG505`).

3. **Part III — Dimension-Free Fifth-Chaos OU Tower on $V_5(\mathbb{R}^n)$ & $H_{3,2}(\mathbb{C}^n)$ (`cert_v5_458.json`):**
   - **Global real fifth-chaos bound:** $0 \le \kappa_4(F) \le 4650\|F\|_2^4$ and $\mathbb{E}|F| \le \frac{983}{1000}\|F\|_2 = 0.983\,\|F\|_2$ unconditionally across all $n \ge 1$ and all $F \in V_5(\mathbb{R}^n)$ ($F = 0$ directly, and strict $< \|F\|_2$ for $F \ne 0$ across $s = \kappa_4(F/\|F\|_2) \in [0, 4650]$, with $\le 0.82\|F\|_2$ on $s \in [0, 2]$, $\le 0.86\|F\|_2$ on $s \in [0, 15]$, and $\le 0.92\|F\|_2$ on $s \in [0, 120]$).
   - **Complex quintic chaos $H_{3,2}(\mathbb{C}^n)$ (`3.30`):** for nonzero $q \in H_{3,2}(\mathbb{C}^n)$, $\mathbb{E}|q| \le \frac{181}{200}\|q\|_2 = 0.905\,\|q\|_2$ on $\chi \in [0, \frac{4}{3}]$ ($\le \frac{9}{10}\|q\|_2$ on $[0, \frac{1}{3}]$), $\le \frac{23}{25}\|q\|_2$ on $\chi \in [0, 4]$, $\le \frac{97}{100}\|q\|_2$ on $\chi \in [0, 26]$, and $\le \frac{999{,}999}{1{,}000{,}000}\|q\|_2 < \|q\|_2$ across all $\chi \in [0, 1840]$ (hence $\mathbb{E}|q| \le \frac{999{,}999}{1{,}000{,}000}\|q\|_2$ for all $q \in H_{3,2}(\mathbb{C}^n)$ including $q = 0$; `h32_tail_B = 2100`, margin $> 1.52\cdot 10^{-6}$).

## Exact Zero-Float Replay (Python 3 Standard Library Only)

Run from the repository root under both normal (`-IB`) and optimized (`-IB -O`) modes:

```bash
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify_ibp_cone.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/check_identities_exact.py
python3 -IB -O research/conjecture-K/code/chaos-stein-458-gemini-8732/test_controls.py
```

To regenerate `cert_v3_458.json` and `cert_v5_458.json` from scratch (requires `numpy`, `scipy`, `clarabel`):

```bash
/usr/local/bin/python3 research/conjecture-K/code/chaos-stein-458-gemini-8732/make_certs.py
```
