# Antisymmetric Slice-Gram & Retained-Defender Saddle Verifier (`S0RG`, `#849`)

Zero-float, zero-`assert` Python 3 standard-library certificate generator, verifier, and adversarial control suite for [`../../sources/stage0-retained-gram-gemini-4c4c/PROOF.md`](../../sources/stage0-retained-gram-gemini-4c4c/PROOF.md) (Issue `#849`, refs `#751`, `#453`).

## Files

- `verify.py`: pure Python 3 stdlib verifier (`python3 -IB` and `python3 -IB -O`, zero `float` literals/calls, zero `assert` statements, zero external packages, zero C++/MPFR compilation). Performs:
  1. AST self-audit of `verify.py` and `test_controls.py` for forbidden `float` or `assert` nodes, plus `< 300,000` byte checks on all package files.
  2. Exact symbolic (`Fraction` over $\mathbb{Q}[n, h, b, y, z]$), concrete $\mathbb{Q}[i]$-tensor, and independent complex Gaussian Wick polynomial moment/projection verification (`CircularFourth.lean`, `GramSpectral.lean`) of **Theorem 1** (the 4-channel Pythagorean slice-Gram decomposition of `ctC` in `Grothe/LowerAnalytic/GramTensor.lean`, including $4\lVert C_{--}\rVert_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0$, all three sharp spectral chaos bounds $25 u_2 \ge 9 u_4$, $8 u_2 \ge 3 v_4$, $14 u_2 \ge 3\chi$, equality at unit $e_{2,1}(y_1)$ where $(n,h,b,y,z) = \frac{1}{4}(1,1,1,1,1)$ gives $(u_2, u_4, u_6, v_2, v_4, \chi) = (9, 25, 9, 8, 24, 42)$, and exact rational 5-scalar counterexamples showing $C_{--} \succeq 0$ is strictly stronger than the 5-scalar `Gram.lean` cone) and **Theorem 3** (the exact 4-term SOS polynomial identity for the 5-shell odd-visible $c \to 0^+$ quadratic/local diffuse-spike saddle, plus an exact 1-direction Taylor / Fenchel–Young / $(P \mp Q)/2$ Hessian normalisation check).
  3. SHA-256 provenance verification against `research/higher-degree/code/degree5-stage0/results/b/{gC,g83,g84,gA}/rows_all.lines` (parsed via `json.loads(..., parse_float=Decimal)`), unconditional pinning of all 9 distinct `(id, game, t_key, e1, eta, cap_upper)` benchmarks, mode flags (`eval_mode`, `require_sos_pos`), and stored SOS/concavity signs across all 9 rows (even under `--only-row`), and $\le \frac{1}{2}\cdot 10^{-10}$ rationalisation checks.
  4. Full from-scratch zero-float outward-rounded `Jet2` shifted-polar re-integration (zero `erf`/`erfc`, zero trigonometric calls) at $\sigma = \sigma_*$ across all 9 sample rows, certifying $\kappa_D > 0$, all 14 real & imaginary complex Hessian concavity margins $> 0$, all 4 stored & fresh SOS multipliers $\lambda_1, \dots, \lambda_4 > 0$, 5-invariant interval SOS balance, and the 5-shell odd-visible $c \to 0^+$ quadratic/local saddle caps (`< 0` on `gC` $0.80$; `< 7/20 = 0.35` on `g83` $0.80, 0.85$, `g84` sample rows $0.70, 0.80, 0.84, 0.85$, and `gA` $0.80$; `< 7/10 < 1` on `gA` $0.85$). *(Finite gate points $c \in \{0.1, 0.3, 0.6, 1\}$ and off-peak $\sigma \ne \sigma_*$ are not evaluated here; Stage 0's stop rule is not yet discharged.)*
- `test_controls.py`: 24-check adversarial corruption and mathematical negative-control suite verifying rejection of `float`/`assert` AST injections, omission of $C_{--} \succeq 0$ (both algebraically on `(9/16, 1, 9/16, 3/4, 3/4)` and analytically on `gA` $0.80$), omission of the two retained universal cubic $h$-defenders (`g84` $0.80$ violates `< 7/20`, `g84` $0.84$ violates `< 1`), nine copies of one row, swapped `g83 -> g84` `e1`/`eta` weights, loosened `cap_upper = "1"` on `gA_0.80` (even under `--only-row`), `require_sos_pos = false` (even under `--only-row`), flipped $\lambda_1$ sign in `certified.sos_lams`, corrupted Wick normal-ordering subtractions, corrupted $1/2$ factor on $\mathcal{B}(\delta h)$, SHA-256 and rationalisation tampering, shifted-polar ellipse singularity violations, and false tight caps.
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
