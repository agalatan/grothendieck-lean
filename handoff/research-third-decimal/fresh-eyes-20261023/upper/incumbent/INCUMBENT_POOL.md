# Reuse the actual incumbent in the signed coefficient pool

23 October 2026. Two distinct statuses are retained:

* Column: `CONDITIONAL_INHERITED_TABLES_AND_TAIL`.
* Mixture LP: `FLOATING_LP_WITH_CONDITIONAL_INCUMBENT_TAX_NEW_TAILS_UNPAID`.

No new Grothendieck endpoint is claimed.

## Frozen incumbent column

`frozen-inputs.json` contains all 21,168 existing dyadic energies, exact primary
and auxiliary preprocessors, the original five rational budgets, and hashes of
the two Lean source files from which they were extracted. No energy integration
was repeated. Replays need only this JSON, not the live source tree or original
untracked archive files.

`fresh_incumbent_column.py` uses Arb polynomial arithmetic to compute the 251
combined coefficients through degree 501, with

    H(t)=∑_k c_k t^(2k+1).

It independently encloses the stored-table residual by
9.887980318584077×10⁻⁸, below the existing native-checked cap 9.888×10⁻⁸.
`incumbent-column.json` exports the first 129 binary64 coefficient centres,
through degree 257, with their numerical error included in a conditional tax.
All 251 centres and Arb enclosures are also retained.

The tax is charged **once**, linearly in this column's mixture weight:

    compareQ                   = 1.065637497×10⁻⁶,
    energyErrQ                 = 1.3694018×10⁻¹¹,
    actual Hardy tail >501     = 3.6748×10⁻⁸,
    stored coefficients259:501 < 3.155772074525×10⁻¹³,
    retained centre error      < 1.425716821907×10⁻¹⁷.

The total is less than 1.102399506610×10⁻⁶. The field
`conditional_tax_upper_float` is rounded upward with `math.nextafter`, then
checked by Arb to dominate the full interval, so ordinary Python LP consumers
do not require flint.

Only retained-coordinate numerical error is added: omitted stored coefficients
are bounded directly by their Arb absolute enclosures. No omitted coefficient
or rounding term is charged twice. Actual coefficients beyond 501 use the
actual rounding's Hardy bound, not the truncated energy table's tail.

This gives the incumbent-only conditional score at least
0.71194715331348019938. It agrees with the existing Lean headline score
0.711947153313208982; their 2.72×10⁻¹³ difference is unused finite-cap rounding
slack, not a claimed new endpoint.

The meaning of "conditional" is unchanged. `DirectHyps.compare`,
`energy_close`, `hardy`, rounding validity, summability and parity are inherited
analytic premises. This extraction proves the finite polynomial consequences
and records their provenance; it does not discharge those premises.

## Pool result and numerical conditioning

The pool contains 557 inherited chirp columns, 19 initial asymmetric columns,
one priced asymmetric column, four higher-grade columns, and the incumbent:
582 columns with 129 signed coefficients each. The 24 new columns have **unpaid
infinite tails**. Existing chirp coefficients and tail charges remain inherited
floating inputs.

The unscaled mixture/slack LP is unsafe for this almost-linear incumbent:
HiGHS drops matrix entries below its default small-matrix threshold, so its
incumbent-only objective can disagree with the directly evaluated score by
more than 10⁻⁸. A scaled primal formulation also showed solver failures at tight
tolerances. Do not use a successful solver status as the score check.

The replay instead solves the equivalent bounded-multiplier dual. With anchor
A equal to the incumbent-only score and L=10⁸, minimize δ subject to

    L c_i,tail · λ − δ ≤ L(A−c_i,0+tax_i),   |λ_j|≤1.

Its objective represents A+δ/L. The inequality duals recover mixture weights.
Every result is checked afterward using the actual signed mixture objective
as a primal value and `max_i(c_i·(1,λ)−tax_i)` as a dual value. This does not
assume that a solver's reported objective is correct.

L=10⁶ and L=10⁸ give identical directly evaluated scores. An additional
per-price-row normalization is recorded in the result as a conditioning check.
The primary primal/dual bracket is 4.45×10⁻¹⁶ wide.

The scores are:

    old557                    0.7118917280420627,
    incumbent only            0.7119471533134802,
    incumbent + old557        0.7119471537111869,
    incumbent + old557 + new24 0.7119471537111869.

All 24 new weights are zero. Their best reduced price under the incumbent-plus-
old dual is at most −9.98314469×10⁻⁷. The active displayed weights are incumbent
0.9999988146698785 and old column403 0.000001180650171880225, with other weights
totalling below 5×10⁻⁹. Full weights and duals are saved; the tiny gain over the
incumbent is only a floating-pool proposal, not a new certified score.

`incumbent-pool-heads.npz` contains `heads`, `charges`, `dual`,
`incumbent_old_dual`, and `names`, ready for further column pricing.

## Portable replay

From the repository root, regenerate the incumbent from the bundled frozen
inputs without reading any live Lean or external archive file:

    uv run --with python-flint==0.9.0 python tools/fresh_incumbent_column.py \
      --frozen handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent/frozen-inputs.json \
      --output handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent

Then replay the frozen pool:

    uv run --with numpy --with scipy python tools/fresh_incumbent_pool.py

The latter defaults `--repo` to its own repository, and reads/writes only under
that repository's `handoff/research-third-decimal/fresh-eyes-20261023` prefix.
Optional `--repo`, `--base`, and `--out` arguments relocate the bundle. Original
absolute source paths are provenance metadata and are not runtime dependencies.
