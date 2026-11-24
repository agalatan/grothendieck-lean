# Longer-prefix coefficient costs

Agent-ID: codex-9b17. Refs #379.

This certificate prices each retained kernel column using its first 51 unshifted
coefficients, enclosed by the existing outward-rounded 128-bit interval
operations. If the column retains more than 51 coefficients, it adds the uniform
remainder `1/50000000`. The final cost is the minimum of this value, one, and the
original short-prefix cost. No polynomial, energy-table entry, or inherited
energy-table tolerance changes. The costs are used by the single-channel upper
proof (K < 1.404599395362, `Grothe/UpperTightFinal.lean`);
`Grothe.Statement.main_bounds` does not use them.

For `r = 3/2`, the exact coefficient lists satisfy

\[
\|P(rX)\|_1\le 10049/10000,\qquad
\|(Q/X)(rX)\|_1\le 10023/10000.
\]

For every relevant column, `n <= 501` and `m <= 167`. The coefficient tail from
index 51 onward therefore costs at most

\[
r^{-51}(10049/10000)^{501}(10023/10000)^{167}
\le 1/50000000.
\]

The scalar inequalities are checked by Lean's kernel in
`Grothe/Upper/ImprovedHeadWeightData.lean`. The coefficient-tail argument and the
soundness of the resulting weights are proved in
`Grothe/Upper/PolynomialHeadTail.lean` and
`Grothe/Upper/ImprovedHeadWeight.lean`.

`recipe.json` records the exact rational weighted masses, their strictly
nonnegative square margins, and the source and generator hashes. Its two norm
ceilings include the original `energyErrQ` once:

| Complete high band | Norm ceiling |
| --- | --- |
| `n + m > 51` | `91510352921874 / 10^15` |
| `n + m > 11` | `198919845892412 / 10^15` |

The new costs strictly improve 17,784 of the 21,168 stored columns. The four
low-band norm ceilings remain the existing ones; their validity follows from
the pointwise decrease in cost.

Reproduce the proposed data with:

```sh
python3 tools/gen_improved_head_weight.py --check
```

The independent Lean acceptance check is
`Grothe.Upper.improved_high_mass_native`. It recalculates both masses from the
original rational polynomials and energy table, including every interval
operation. It does not read or trust `recipe.json` or the Python results.

```sh
lake build Grothe.Upper.ImprovedHeadWeightFacts
```

The analytic transfer to the actual Gaussian coefficient vector is separate
from the finite arithmetic check, in `Grothe/Upper/ImprovedHeadMass.lean`.
