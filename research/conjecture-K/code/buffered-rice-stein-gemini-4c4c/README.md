# Sharp Buffered Cubic Radius on `[0, 5/8]` and Mid-`t` Remote P3 Closure (`gemini-4c4c`, Issue #784)

Self-contained zero-float, `-O`-safe pure-stdlib exact rational certificates and verifiers for [`PROOF.md`](../../sources/buffered-rice-stein-gemini-4c4c/PROOF.md) (`STATUS.md` `3.5a`, `2.12g`; `higher-degree/STATUS.md` `4.17` / `#628` `ATK P3` §5).

## Replay from the repository root

Both scripts import **only** the Python 3 standard library, perform zero floating-point operations (enforced by AST audit), and use explicit `require(...)` checks raising `ValueError` so all checks execute identically with or without `-O`:

```sh
python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py
python3 -IB -O research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py --quiet
python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py
python3 -IB -O research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py
```

## File manifest

- [`verify.py`](verify.py) — Self-contained zero-float, `-O`-safe exact `Fraction` + integer Sturm verifier certifying:
  1. **Theorem 1 (`0 <= s <= 5/8 = 0.625`):** $\mathbb{E}|Z + \sqrt{s}\,q| \le \frac{\sqrt{\pi}}{2}\sqrt{1 + s}$ for every $n \ge 1$ and every unit-variance $q \in \mathcal{H}_{2,1}(\mathbb{C}^n)$, combining `[0, 1/6] x [0, 49]` low-$s$ boxes, 13 midpoint-centered two-step Ornstein–Uhlenbeck near-Gaussian slabs on `[1/6, 5/8]` (with exact rational $\theta = u^6$ kernel antiderivatives and monotone Riemann sandwich self-checks), a 137-cell complete-monotonicity Hermite cubic + Cauchy–Schwarz Rice upper cap bank built from positive-term Bessel series, whole-half-line integer Sturm verification of Level-2 Matrix Stein models in $v = |q|^2$, 5-scalar Lean Gram LP dual verification, and curvature-compensated $s$-chord interpolation across gap-free 2D tiles.
  2. **Corollary 1a:** Exact remote-energy frontier $\|P_{2,1}^{\mathrm{rem}} k\|_2^2 \le \frac{\pi}{4} - t^2$ down to $t \ge \sqrt{2\pi/13} = 0.6952137\dots < \frac{139043}{200000} < \frac{7}{10}$.
  3. **Theorem 2:** Certified buffered Rice upper bounds $R_{\mathrm{buf}}(s_j)$ at $s_j \in \{1, \frac{17}{16}, \frac{5}{4}, \frac{3}{2}, 2, 3, \frac{9}{2}\}$ across $\chi \in [0, 42]$, closing $V(f, g) < \frac{500}{701}$ across all $t \in [0, \frac{61}{100}]$ for every unimodular pair with remote $P_{2,1} k$ (`#628` `ATK P3` §5) and certifying tightness against the Gaussian barrier at $t = \frac{618}{1000}$.
- [`test_controls.py`](test_controls.py) — Startup AST zero-float / no-`assert` / stdlib-only audit of both Python verifiers, 14 adversarial certificate corruption controls, mandatory `#628` `ATK P3` §6 rejection of false cap `0.62` at `t = 0.30`, and exact rational verification of the entire `#628` `ATK P3` §3 / §7 Gaussian remote driver family.
- [`cert_buffered_rice.json`](cert_buffered_rice.json) — Compact rational certificate (`261,984 B < 300 KB`).
- [`make_cert.py`](make_cert.py) — Offline certificate generator using `clarabel` + `scipy` (`HiGHS`) and immediate exact verification via `verify.py`.
