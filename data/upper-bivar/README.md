# Multi-channel bivariate smoothed-cell, phase, and tiger certificate

This directory holds the exact rational input data (`certificate.json`) used by
`tools/gen_upper_bivar.py` to generate the `Grothe/UpperBivar/` Lean modules byte
for byte (`AGENTS.md §13`).

## Mathematical summary

The certificate proves the unconditional upper bound

```text
K_G^C <= 10^27 / 711969765819834623238463058 = 1.40455402463403481803... <= 1.404554025
```

(`Grothe.UpperBivar.bound`, `Grothe.UpperBivar.constant_le`, and the upper half of
`Grothe.Statement.main_bounds`).

It combines the established six-channel witness (`Grothe/UpperSixExact/`) with twelve
additional polynomial preprocessors acting solely on the three already-certified
maps and moment/overlap tables in `Grothe/UpperSix/Haagerup/Data/OverlapData.lean`:

1. **Reflected tiger (`tigMuList`, 2 channels):** odd preprocessors `(-r(t), r(t))`
   at steeper and shallower scales (`R = [93/100, -7/100]` at Hardy radius
   `rho = 3007/2500`, tail cap `2 / 10^15`, and `R = [988/1000, -12/1000]` at
   `rho = 10239/10000`), replacing the legacy tiger weights in the convex mixture.
2. **Multi-term phase (`haagMuList 321`, 2 channels):** degree-29 and degree-31 odd
   polynomials `(p(t), 0)` evaluated through index `320` (`n <= 641`), with Hardy
   tail caps `57009 / 10^15` and `77166 / 10^15`.
3. **Bivariate smoothed cell (`tcellRows`, 8 channels):** pairs `(p(t), q(t))` with
   `q(t) = t Q(t^2)`, `Q(0) = 0`, including five channels with degree-3 `Q(X)`
   (`q(t)` up to `t^7`). Because the smoothed second-coordinate covariance satisfies
   `m_01^2 + m_11^2 < 1`, non-monomial `Q(X)` with `||Q||_1 <= 1` remains strictly
   contractive on `|t| = rho > 1` while unlocking second-coordinate tensor-power
   columns `(n, m)` with `m >= 1` already present in `tcellRows` (`mem_bivarT_smoothed`).

All twelve new disk-positivity and Hardy circle-mean bounds are verified in the Lean
kernel (`decide +kernel`) via degree-2 Taylor models (`Grothe/UpperBivar/ContourChecks/`).
The single `native_decide` fact added by this certificate is `Haagerup.UpperBivar.budgets_ok`
(`Grothe/UpperBivar/Head.lean`), which checks the `2^128`-scaled interval head sum,
linear floors, and head lengths.

## Reproduction

From the repository root:

```sh
python3 tools/gen_upper_bivar.py --check
lake build Grothe.UpperResult
```
