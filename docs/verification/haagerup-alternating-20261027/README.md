# Alternating completion: candidate verification

Agent-ID: codex-aa04. Issue: [#133](https://github.com/agalatan/grothendieck-lean/issues/133).
**Lean acceptance awaits delivery CI.** This record describes the new candidate;
the [degree-20 receipt](../haagerup-degree20-20261027/README.md) is historical
and remains unchanged. No full Lean pre-check is claimed here.

The source theorem targets
`IsGrothendieckBound (175613641599/125000000000)`, or
`K_G^ℂ ≤ 1.404909132792`, without external hypotheses. The polynomial data
are the same degree-20 P and degree-64 approximate inverse R as in the
degree-20 candidate; the radial preprocessor has degree 41.

The new completion preserves cancellation before taking coefficient norms:

| Parameter | Exact value |
|---|---:|
| Head start K | 64 |
| Difference order | 10 |
| Prefix cutoff | 165 |
| Prefix cap | 368411 / 5000000000000000 |
| Weighted polynomial-norm cap at radius 3/2 | 10000000000000 |
| Omitted finite-tail cap | 1 / 10000000000000000 |
| Completed-head cap | 736823 / 10000000000000000 |
| Infinite-remainder cap | 10169 / 10000000000000000 |
| Total normalized residual cap | 746992 / 10000000000000000 |

The weighted estimate uses the actual finite sums
`Σ_{k<64} r_k (5/3)^k` and `Σ_{j<10} (Δ^j r)_64 · 15^j`.
Together with the bounds `‖P((3/2)X)‖₁≤21/20`,
`‖R((3/2)X)‖₁≤9`, and the unit slope cap, these give a majorant below
`1.075·10^12`, hence below `10^13`. Consequently the omitted finite
coefficients cost at most `10^13/(3/2)^165 < 10^-16`.
The infinite-remainder estimate also retains the individual differences,
instead of bounding every difference by the initial coefficient.
The four public checker statements remain unchanged in name. Within them,
`coefficient_check` now proves exactly the weighted budget and the combined
infinite-remainder budget; it does not rely on separate coefficient or
tenth-difference caps.

The inverse-defect cap `10^-12` and the seed bound
`‖R P^17‖₁≤249/500` are unchanged. The resulting rational endpoint majorant
is below `1.404909132791940`, hence below the public target.

The focused axiom policy remains 96 results and zero native evaluation
axioms. The complete registry remains 597 reports, 380 required results,
and 88 native facts. This layer introduces no new external analytic premise
or native fact. These are source and policy statements; the regenerated
numerical proofs must still pass delivery CI.

The completed checks in this receipt are:

- `replay.json` and `replay.log`: 192-bit directed FLINT replay of the full
  completed polynomial, truncated prefix, inverse defect, seed, both exact
  rational budgets, and endpoint; all recorded source hashes match this tree.
- `generator-regression.json`: all 13 reproducibility and rejection checks passed.
- `script-tests.log`: all 63 verification-script tests passed.
- `layout-comparison.json`: unchanged exact arithmetic primitives and P/R inputs;
  21 trace modules, 16 independent numerical modules, 1,134 kernel arithmetic
  facts, and 891 convolution continuation steps. No CI runtime is claimed.
- `pdf-review.log`: compilation, visual inspection, and source/PDF hashes.

The lower-cap source digest is unchanged across 53 files:
`a0473ebe31b871cc1516046e045f2372935050a099b8e3c7315fab8271fcf604`.
These source and arithmetic checks do not replace Lean acceptance by the ready
workflow. No full local/cloud pre-check or manual droplet job was run.

The [CI repair receipt](ci-fix/README.md) records the subsequent generated-notation
fix and actual targeted Lean checks; the original replay above remains unchanged.
