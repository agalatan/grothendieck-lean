# Stage 0 (`#751` / `#849`) Sector Resolution Verifier (`S0RG`)

Zero-float, zero-`assert` Python 3 standard-library certificate generator, verifier, and adversarial control suite for [`../../sources/stage0-retained-gram-gemini-4c4c/PROOF.md`](../../sources/stage0-retained-gram-gemini-4c4c/PROOF.md) (Issue `#849`, refs `#751`, `#453`).

## Files

- `verify.py`: pure Python 3 stdlib verifier (`python3 -IB` and `python3 -IB -O`, zero `float` literals/calls, zero `assert` statements, zero external packages, zero C++/MPFR compilation). Performs:
  1. AST self-audit of `verify.py` and `test_controls.py` for forbidden `float` or `assert` nodes, plus `< 300,000` byte checks on all package files.
  2. Exact symbolic (`Fraction` over $\mathbb{Q}[n, h, b, y, z]$) and concrete $\mathbb{Q}[i]$-tensor verification of **Theorem 1** (the 4-channel Pythagorean slice-Gram decomposition of `ctC` in `Grothe/LowerAnalytic/GramTensor.lean`, including $4\lVert C_{--}\rVert_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0$, all three sharp spectral chaos bounds $25 u_2 \ge 9 u_4$, $8 u_2 \ge 3 v_4$, $14 u_2 \ge 3\chi$, equality at $e_{2,1}(y_1)$, and exact rational 5-scalar counterexamples showing $C_{--} \succeq 0$ is strictly stronger than the 5-scalar `Gram.lean` cone) and **Theorem 3** (the exact 4-term SOS polynomial identity).
  3. SHA-256 provenance verification against `research/higher-degree/code/degree5-stage0/results/b/{gC,g83,g84,gA}/rows_all.lines` (parsed via `json.loads(..., parse_float=Decimal)`) and $\le \frac{1}{2}\cdot 10^{-10}$ rationalisation checks on all 9 benchmark rows.
  4. Full from-scratch zero-float outward-rounded `Jet2` shifted-polar re-integration (zero `erf`/`erfc`, zero trigonometric calls) across all 9 benchmark rows, certifying $\kappa_D > 0$, all 14 real & imaginary complex Hessian concavity margins $> 0$, all 4 SOS multipliers $\lambda_1, \dots, \lambda_4 > 0$, and the Stage 0 sharing caps (`< 0` on `gC` $0.80$; `< 7/20 = 0.35` on `g83` $0.80, 0.85$, `g84` $0.70, 0.80, 0.84, 0.85$, and `gA` $0.80$; `< 7/10 < 1` on `gA` $0.85$).
- `test_controls.py`: 17-check adversarial corruption and mathematical negative-control suite verifying rejection of `float`/`assert` AST injections, omission of $C_{--} \succeq 0$ (both algebraically on `(9/16, 1, 9/16, 3/4, 3/4)` and analytically on `gA` $0.80$), omission of the two retained universal cubic $h$-defenders (`g84` $0.80$ violates `< 7/20`, `g84` $0.84$ violates `< 1`), SHA-256 and rationalisation tampering, shifted-polar ellipse singularity violations, and false tight caps.
- `make_cert.py`: deterministic generator producing `cert_stage0_gram.json` from the Stage 0 `rows_all.lines` inputs.
- `cert_stage0_gram.json`: SHA-256 provenance, exact rationalised row parameters, per-row mesh parameters, and outward-rounded integer-scaled ($S = 10^{15}$) interval brackets.

## Usage

From the repository root:

```bash
python3 -IB research/higher-degree/code/stage0-retained-gram-gemini-4c4c/verify.py
python3 -IB -O research/higher-degree/code/stage0-retained-gram-gemini-4c4c/verify.py --quiet
python3 -IB research/higher-degree/code/stage0-retained-gram-gemini-4c4c/test_controls.py
python3 -IB -O research/higher-degree/code/stage0-retained-gram-gemini-4c4c/test_controls.py
```
