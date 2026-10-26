# One actual box certified with the repriced rank-one test

This certifies a strict improvement for **box 8150 only**, conditional on the
recorded source, response-reduction, and law-node proofs. It does not replace
the complete cover or improve the advertised Grothendieck lower endpoint.

The exact reconstruction in `result.json` gives:

* Original whole-box bound: `0.7134201892533115`.
* Old row polynomials on the new two-piece partition: `0.7134197811841173`.
* New rank-one bound, including its semiconvex cost: `0.713417810549848`.

Thus the total local gain is approximately `2.378703463496214e-6`. Its two
components are exactly separated: `4.080691941466346e-7` comes from splitting
the old certificate at an already available tau node; the remaining
`1.9706342693495793e-6` comes from the new rank-one law certificates **after**
paying their interpolation cost. The effect therefore survives comparison
against the same refined partition with the old law polynomials.

An independent uniform calculation gives a conservative positive rank-one
gain of at least `2.120228374186888e-7` throughout the entire box relative to
that old split certificate. This calculation does not rely on matching the
old and new maximizers. The law task independently reconstructed the old split
value and audited the interpolation, price, pad, and endpoint reasoning.

## Fixed data and interpolation

The existing box has mixing weights

\[
 \lambda_{12}=133952501/10^9,\qquad
 \lambda_{15}=866047499/10^9.
\]

Row 12 keeps source-node references 122 and 161. Row 15 keeps the physical tau
locations of references 555, 560, and 556, but uses the newly certified
polynomials in `law/m15-box8150-c0n5.json`, `c1n5.json`, and `c0n6.json`.
The box is split at the physical tau of reference 560.

All gate coefficients and the common pin price are unchanged. In particular,
the same exact rational price `Dbar` (approximately `0.533483556310827`) is used.
The active-row semiconvex coefficient is

\[
 A'= (c')^2/d \approx 0.18609988147774204.
\]

It is computed from the shared-completion repriced coefficient `c'`, not the
old pure-row coefficient. Its contribution to the mixed bound is
`lambda15*A'` (approximately `0.16117133691799493`). The evaluator checks these
identities and the source-table coefficient exactly.

For either source bridge with original endpoints `a<b`, let `W_a(x),W_b(x)`
be the moment bounds after mixing the unchanged row-12 law polynomial with
the corresponding new row-15 polynomial. The tau-dependent bound is

\[
 {b-\tau\over b-a}W_a(x)+{\tau-a\over b-a}W_b(x)
 -\bar D\tau^2+\lambda_{15}A'(\tau-a)(b-\tau).
\]

Writing `m=(W_b-W_a)/(b-a)`, its exact coefficients are

\[
 W_a-ma-\lambda_{15}A'ab,
 \quad m+\lambda_{15}A'(a+b),
 \quad -(\bar D+\lambda_{15}A').
\]

These are evaluated on the intersection of the bridge with the box's tau
interval. The interpolation correction always uses the **original source
bridge endpoints**, including where the box clips the bridge. Replacing those
endpoints by the clipped box endpoints without changing the endpoint caps
would incorrectly lower the interpolation cost.

## Exact maxima

For every fixed tau, the moment polynomial is

\[
 a_0+\rho a_1+a_2+a_4(2+x^2)
       +a_6(6+9x^2+C_6x^3).
\]

The inherited and new endpoint polynomials have `a1>=0` and `a6>=0`; `a4` is
allowed to be negative because the fourth moment is an equality. On a
nonnegative x interval, a cubic of the form `constant+B*x^2+C*x^3`, `C>=0`,
has no strict interior maximum: a positive stationary point can only be a
minimum. Therefore the two box x endpoints suffice at every tau.

For each of those x endpoints, the evaluator checks both tau endpoints and
the exact rational interior vertex when the quadratic is concave. The
`t^2-2*ell*t` term is convex, so its two endpoints suffice independently.
The finite evaluation uses only standard-library `Fraction`, with no root
approximation or floating point acceptance.

## Pads, attribution, and file bindings

The law-node source is `H=F-PAD`. Each row bound consequently restores one
`PAD=1e-11`. The row weights sum to one, so the final mixed bound restores
exactly one external PAD. No extra source-node or tau-bridge allowance is added.

For the uniform gain check, the exact difference of each old and new endpoint
**moment-bound polynomial** is minimized over the whole x interval. The chord
saves at least the smaller endpoint saving, while the semiconvex cost is at
most `A'*(b-a)^2/4`. Multiplying the resulting floor by `lambda15` proves a
positive pointwise gain on each bridge. The smaller bridge floor yields the
uniform whole-box gain stated above.

The evaluator reconstructs the old stored upper fraction exactly before
performing a replacement. Every new law ledger is bound to its certificate by
`input_sha256`; every law certificate pins its source selection; the source
selection's bank, node-table, and inherited-file paths and hashes must equal
the inputs used in this assembly. `result.json` records all input hashes,
rational quadratics, candidate maxima, old split controls, and gain floors.

Replay from the repository root:

```sh
python3 -I tools/rankone_box8150.py \
  --out handoff/research-third-decimal/rank-one-certification-20261023/box8150/result.json --check
```

The checker rejects `-O` and `-OO`. No repository certificate is modified.
