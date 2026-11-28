# Multi-channel bivariate smoothed-cell, phase, and tiger certificate

This directory holds the exact rational input data (`certificate.json`) used by
`tools/gen_upper_bivar.py` to generate the `Grothe/UpperBivar/` Lean modules byte
for byte (`AGENTS.md §13`).

## Mathematical summary

The certificate proves the unconditional upper bound

```text
K_G^C <= 10^30 / 711971541341811014386385764712 = 1.40455052194271506891... <= 1.404550522
```

(`Grothe.UpperBivar.bound`, `Grothe.UpperBivar.constant_le`, and the upper half of
`Grothe.Statement.main_bounds`).

It combines the established six-channel witness (`Grothe/UpperSixExact/`) with five
pruned, jointly tuned polynomial preprocessors (`10^12` rational tap scale, `10^15`
weight scale, `59` nonzero taps across the five new channels; `7` of the `11` total
mixture slots carry positive weight) acting solely on the three already-certified
maps and moment/overlap tables in `Grothe/UpperSix/Haagerup/Data/OverlapData.lean`:

1. **Reflected tiger (`tigMuList`, 1 channel):** odd degree-3 preprocessor
   `(-r(t), r(t))` with `R = [930829837991 / 10^12, -69170162009 / 10^12]` at Hardy
   radius `rho = 119603/100000` (`11` circle-mean Simpson steps), tail cap `1 / 10^15`,
   supplementing the two reflected-tiger channels (`r3Q`, `r4Q`) of `UpperSixExact`.
2. **Multi-term phase (`haagMuList 801`, 1 channel):** odd degree-81 polynomial
   `(p(t), 0)` (`P` of degree `40` in `t^2`, `14` nonzero taps) evaluated through index
   `800` (`n <= 1601`) at `rho = 25529/25000` (`80` circle-mean Simpson steps), with
   Hardy tail cap `82 / 10^15`.
3. **Bivariate smoothed cell (`tcellRows`, 3 channels):** pairs `(p(t), q(t))` with
   `q(t) = t Q(t^2)`, `Q(0) = 0`, where `P(X)` has degree `27`, `33`, `34` in `X = t^2`
   (`p(t)` up to degree `69`) and `Q(X)` has degree `15`, `15`, `17` in `X = t^2`
   (`q(t)` up to degree `35`). Because the smoothed second-coordinate covariance
   satisfies `m_01^2 + m_11^2 < 1`, higher-degree `Q(X)` with `||Q||_1 <= 1` remains
   strictly contractive on `|t| = rho > 1` while unlocking second-coordinate tensor-power
   columns `(n, m)` with `m >= 1` already present in `tcellRows` (`mem_bivarT_smoothed`).

Exact endpoint budget (`/ 10^30`):
- `headBudget = 288028401556608 / 10^15`
- weighted tail sum `= 57101580985613614235288 / 10^30`
- `residual = 288028458658188985613614235288 / 10^30`
- `1 - residual = 711971541341811014386385764712 / 10^30`

All five new disk-positivity and Hardy circle-mean bounds (`3,092` total circle-mean
Simpson steps, `154` disk-positivity steps) are verified in the Lean kernel
(`decide +kernel`) via degree-2 Taylor models (`Grothe/UpperBivar/ContourChecks/` and
64-step sub-arc chaining in `Grothe/UpperBivar/SubArc.lean`). The single `native_decide`
fact added by this certificate is `Haagerup.UpperBivar.budgets_ok`
(`Grothe/UpperBivar/Head.lean`), which checks the `2^128`-scaled interval head sum,
linear floors, and head lengths.

## Reproduction

From the repository root:

```sh
python3 tools/gen_upper_bivar.py --check
lake build Grothe.UpperResult
```
