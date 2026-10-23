# Independent audit of the unshifted box-4302 law nodes

Audit date: 23 October 2026. Read-only audit by a second agent, independent of the node
discovery/export agent. No Gaussian integration, heavy search, core Lean edit, or certificate
replacement was performed by this audit.

**Result: PASS for the two explicit law nodes, serialization, and fixed-box arithmetic.**
The certificates use the original unshifted row potential and the existing Stein cuts. The
old shifted-source and rank-one-response assumptions are not needed by these certificates.

The integration agent subsequently confirmed that Lean `4.34.1`, with warnings treated as
errors, evaluated `checkBatch rowData unshiftedBatch` to `true` in its owned remote tmpfs
(exact child PID `1523713`, waited to completion). The checked standalone file is
`UnshiftedLawNodes.lean`, SHA-256
`d5d9a4cd4bf984de4230d11c1d8c19cf3d5671c26bd3a52b489f7fe5f2bcda7e`.
The durable record is [unshifted4302-lean-probe.json](unshifted4302-lean-probe.json), including
the command, output, exit code, and hashes of all four recorded inputs.
This is a successful evaluation, not a new reflected Lean theorem or default import. The
current endpoint cover remains unchanged.

## Exact replay commands

From the safe repository root:

```sh
python3 -B -I tools/needle_rankone_nodes.py --verify \
  handoff/research-third-decimal/needle-20261023/unshifted4302-lo.json
python3 -B -I tools/needle_rankone_nodes.py --verify \
  handoff/research-third-decimal/needle-20261023/unshifted4302-hi.json
python3 -B -I tools/needle_unshifted_export.py --check
python3 -B -I tools/needle_unshifted_box.py \
  --out handoff/research-third-decimal/needle-20261023/unshifted4302-box.json --check
```

All four commands passed. They use exact `Fraction` verification; the LP discovery is not
rerun. The two node checks report 438 common-refinement intervals and maximum degree 10.
The exporter reproduces the standalone Lean bytes exactly. The box replay reconstructs its
old bound before evaluating the new one.

The integration agent's Lean command has the form below, with its owned overlay/cache in
`LEAN_PATH`; no local full build is implied:

```sh
lean +leanprover/lean4:v4.34.1 -DwarningAsError=true UnshiftedLawNodes.lean
```

Its final output is `true` from the file's `#eval` command.

## Canonical source binding and scale

Inherited row index `14` is the canonical `row15` in `Grothe/Lower/RowData15.lean`. Independent
rational decoding verified all of the following against the Lean source, beyond checking a
matching source filename:

- `δ = 595687472386965/1125899906842624` and `smax = 1053/500`;
- all **396** cap-table abscissae and values;
- the entire Stein mesh, with only the synthetic leading zero added by the Python format;
- the entire first-cell cut bank;
- the reused node `[cell 0, node 3]`, including its polynomial, scale, weights, and bank indices;
- the two baseline polynomials at `[cell 1, node 2]` and `[cell 0, node 3]`.

The inherited input SHA-256 is
`3e7ddd38eb4d7ebeb8db0af1f14f50774c4c93a259fb9c6053c92ec760bdb44e`.

Let `σ` be a source row's scale and `τ=σ/δ` the common-law scale. The exported batch cap table
uses each original abscissa `r` as `r/δ`, without changing its height. Its Lipschitz constant is
`δ·smax = 125451781684694829/112589990684262400`. Consequently a new node at scale `τ` evaluates
the original row potential at `δτv`; no factor of `δ` is lost or applied twice.

The new common-law scales are exactly the endpoints of the box:

```text
τlo = 106123725113/512000000000
τhi = 10709733727/51200000000
```

The proposed interface `i=j=14`, `θ=0`, `spec=false` is correct. It is a pure-row batch in the
existing mixed-potential checker, with the row's original cap table transported as above.

## Padding and reused Stein laws

`NodeCaps` bounds `rowPot r − capPad` by the raw stored table. The Python old source and the
batch cap table use exactly those raw heights. The batch potential is therefore
`rowPot (δs) − capPad`. The fixed-box evaluator adds the unchanged external `capPad=10⁻¹¹`
once. No pad is removed from the source twice or counted again in the new node polynomial.
The discovery's separate upward adjustment of `P₀` is simply part of the checked polynomial.

The Stein cuts are functions of the normalized law `U`, with mesh variable `v=√U`. Their
validity does not depend on `τ`. Reusing their positive weights and cut vectors at a new law
scale is therefore valid. Independent decoding of both emitted witnesses verified:

- the same two positive multipliers, represented as integers over `10¹⁰`;
- exactly the original cut vectors, represented as integers over `10⁸`;
- the same mesh after dropping only its synthetic leading zero;
- the exact new `τ` and all five polynomial coefficients.

The change from the source row's `10⁷` cut-vector encoding to the batch's `10⁸` encoding is
performed by exact multiplication, not by copying the integer strings unchanged.

## Moment signs and baseline comparison

Both new polynomials have `a₁=0` and strictly positive `a₆`, as required by `TB.node`.
The signs of `a₂` and `a₄` are unrestricted because the law satisfies the exact identities
`EU=1` and `EU²=2+x²`. Only `E√U≤ρ` and `EU³≤6+9x²+C₆x³` require nonnegative coefficients.

The comparison baseline is the coefficientwise chord of the two old law-node polynomials at
their scales `σ/δ`. It is sound by convexity of the **actual original row potential**. The
piecewise cap-table interpolant itself need not be convex. The old node inequalities are
pointwise in `v` and consequently remain valid for every admissible normalized law; their
original cell's `x` interval does not restrict that pointwise fact.

Linearity of the moment-bound functional gives the difference between baseline and new
polynomial bounds as

\[
\Delta J(x)=\Delta a_0+\rho\Delta a_1+\Delta a_2+2\Delta a_4+6\Delta a_6
 +(\Delta a_4+9\Delta a_6)x^2+C_6\Delta a_6x^3.
\]

On the checked interval `0≤x≤31/256`, its verified uniform lower bounds are respectively
`6.760528945310008e-5` and `5.8534478420609e-5`. These are improvements of valid upper bounds,
not lower bounds on an actual response's objective. The new pointwise certificates are
verified independently of the baseline comparison.

## Origin and complete half-line

The node checker refines every rescaled source breakpoint with every Stein mesh point.
On the first cell, the factor `v⁴` cancels exactly before testing positivity. The origin gap is
positive, approximately `1.0100011837977382e-7`, for both nodes.

Beyond the last common breakpoint, the source is its actual affine Lipschitz tail; it is not
an extrapolated finite interpolation cell. The denominator-cleared degree-10 gap polynomial
has nonnegative Taylor coefficients at the tail start. This proves the inequality on the
entire remaining half-line. The starts are approximately `v=54.71294` and `v=54.21555`;
at both, the rescaled source argument is `τv≈11.34051` (row-potential argument `δτv=6`). The
smallest Taylor coefficients are the positive leading values `8.609073e-6` and `9.084196e-6`.

Thus these are whole-half-line majorants, including `v=0`, rather than checks on a numerical
grid or a truncated range.

## Fixed-box assembly and remaining boundary

The fixed-box replay keeps the existing gate completion, row-16 endpoint polynomials, row
parameters, and mixture weight
`θ=94403211/500000000` (row-14 weight `405596789/500000000`). Only row 14's two law polynomials
are replaced. Their scales are exactly the box endpoints, so ordinary convexity provides the
interior chord with **zero semiconvex scale allowance**.

The exact replay gives:

- old box cap `0.713421765385994…`;
- new box cap `0.7133695405035759…`;
- actual cap saving `5.2224882418071176e-5`;
- certified uniform saving floor `4.74827929863776e-5`.

This is one fixed-box certificate under the same original Gaussian `NodeCaps`. It does not
change the frozen endpoint cover or prove a new global lower endpoint. Connecting a new
batch and changed box through the finite cover interface, with any required reflected
checks, is a separate integration step.
