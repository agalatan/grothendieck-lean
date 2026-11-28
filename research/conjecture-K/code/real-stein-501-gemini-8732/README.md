# Real Level-2 Malliavin–Stein Certificate for `V_3(R^n)` & `H_{2,1}(C^n)` (`#501`, `#506`, `#458`)

Self-contained exact rational certificate and dual zero-float Python 3 standard-library verification suite
for [`../../sources/real-stein-501-gemini-8732/PROOF.md`](../../sources/real-stein-501-gemini-8732/PROOF.md)
(tag `KRS501`; `STATUS.md` rows `3.6`, `3.7`, `3.21`, `3.21 (e1)`, `3.21 (e9)`; `higher-degree/STATUS.md` rows `1.12`, `4.8`, `4.12`, `4.18a`, `4.18e`, `4.18f`).

## Certified Claims

1. **Global Real Third-Chaos Bound (Closes `#501` and `#506`):**
   For every $n \ge 1$ and every $F \in V_3(\mathbb{R}^n)$,
   $$\mathbb{E}|F| \le \frac{3999}{5000}\,\|F\|_2 = 0.7998\,\|F\|_2 < \frac{4}{5}\,\|F\|_2 < \sqrt{\frac{17}{25}}\,\|F\|_2.$$
2. **High-Kurtosis Sharp Gaussian Regime (`#458`):**
   For every $n \ge 1$ and every nonzero $F \in V_3(\mathbb{R}^n)$ with $\kappa_4(F) \in [14, 90]$,
   $$\mathbb{E}|F| \le \frac{3989}{5000}\,\|F\|_2 = 0.7978\,\|F\|_2 < \sqrt{\frac{2}{\pi}}\,\|F\|_2.$$
3. **Complex Cubic Radius via $U(1)$ Phase Averaging (`STATUS.md` `3.6`, `3.7`):**
   For every $n \ge 1$ and every $q \in H_{2,1}(\mathbb{C}^n)$,
   $$\mathbb{E}|q| \le \frac{2221}{2500}\,\|q\|_2 = 0.8884\,\|q\|_2,$$
   and whenever $\chi(q) \in [\frac{28}{3}, 42]$,
   $$\mathbb{E}|q| \le \frac{4431}{5000}\,\|q\|_2 = 0.8862\,\|q\|_2 < \frac{\sqrt{\pi}}{2}\,\|q\|_2.$$
4. **Downstream Degree-5 & Degree-7 Thresholds (`higher-degree/STATUS.md`):**
   - `1.12` (`deg7_1403_cap`): `6250000000/6920775923 > 0.90307`
   - `4.12` (`deg5_1402_cap`): `3125000000/3457921541 > 0.90372`
   - `4.18a` direct Gaussian-buffer cutoff: `160633/500000 = 0.321266`
   - `4.18e` elliptic lift cutoffs: `45041147/100000000 = 0.45041147` (Parseval), `45406137/100000000 = 0.45406137` (sixth-moment clipping), `45016597/100000000 = 0.45016597` (Lean mass)
   - `4.18f` 24-spectral-mass cutoffs: `45287/100000 = 0.45287` (pure $\rho_0$ only) and `11331/25000 = 0.45324` (with reviewed `KNG505` slope `26449/5000000`).

## Exact Zero-Float Replay (Python 3 Standard Library Only)

Run from the repository root under both normal (`-IB`) and optimized (`-IB -O`) modes:

```bash
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/verify.py
python3 -IB -O research/conjecture-K/code/real-stein-501-gemini-8732/verify.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/verify_bernstein.py
python3 -IB -O research/conjecture-K/code/real-stein-501-gemini-8732/verify_bernstein.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/check_identities_exact.py
python3 -IB research/conjecture-K/code/real-stein-501-gemini-8732/test_controls.py
```

To regenerate `cert_real_501.json` from scratch (requires `numpy`, `scipy`, `clarabel`):

```bash
/usr/local/bin/python3 research/conjecture-K/code/real-stein-501-gemini-8732/make_cert.py
```
