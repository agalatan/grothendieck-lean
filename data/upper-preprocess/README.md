# Current polynomial preprocessing certificate

This directory retains the shared rounding source, preprocessors, energy table,
finite-head and Hardy inputs used by the unconditional theorem
**K_G^C < 1.404599412097**. Its exact rational Grothendieck bound is `tightValueQ`,
approximately `1.4045994120960970198586`. The endpoint is
`Grothe.Statement.upper_below_tight` in
[`Grothe/UpperTightFinal.lean`](../../Grothe/UpperTightFinal.lean).

The byte-pinned data and generators retain historical intermediate endpoint
metadata for reproducibility. The active numerical ledger is
[`Grothe/UpperTightBudget.lean`](../../Grothe/UpperTightBudget.lean).
The smaller endpoint `1.404598148840` in `Grothe/Upper/GroupedBridge.lean` remains
conditional on stronger comparison inputs, as explained below. Previous endpoint documentation is preserved
in `miscellaneous/other-bounds/snapshot/data/upper-preprocess/README.md`.

## Mathematical assembly and trust boundary

Keep the concrete disk-valued, charge-one rounding `G_T` and the truncation `X`
defined in the Lean development. Write their energy tables as `E` and `EX`.
Use the exact odd tensor-power preprocessors
`p(t) = t P(t²)` and `q(t) = t Q(t²)` from `certificate.json`.
Both coefficient l1 norms are at most one; `Q(0)=0`. The degrees are 41 and 15.
The latter zero makes the existing head locality criterion `n+3m <= 501` valid.
Neither the raw rounding nor any of the 21,168 stored energy entries changes.

For `H(t) = sum E[n,m] p(t)^n q(t)^m`, the certificate gives a coefficient-l1
residual about `c t`, with `c = 7119483103461/10000000000000`:

| contribution | current allowance | proof |
|---|---:|---|
| weighted selected-block energy comparison | `tightThreeBandCompareQ ≈ 1.49222739755738e-6` | six proved Gaussian error bounds and regrouped certified reference masses (`UpperTightSix`, `UpperTightComparison`) |
| finite head through degree 501 | `28153/1000000000000` | the exact finite certificate `Grothe.head_check` |
| stored energy-table accuracy | `6847009/500000000000000000` | `Grothe.UpperQuad.Final.hclose_final`, from the accepted energy, omitted-pair and quadrature facts |
| infinite tail after degree 501 | `303362611/10000000000000000` | the proved Hardy budget with its forced linear energy deducted (`HeadHardy`, `UpperTightBudget`) |

These give `tightResidualQ ≈ 1.5507303526753792e-6` and the rational bound
`1 / (slopeQ - tightResidualQ)`. The native finite-head checker uses exact dyadic
energy data and rational polynomial coefficients. Lean proves the polynomial
l1 constraints, locality, Gaussian comparison, table accuracy, transfer and
endpoint assembly. `UpperTightPanelTotals` checks tighter sums of the existing
accepted panel caps directly in the kernel; no new quadrature data is needed.
The resulting full quadrature radii are `(9,17,1132)/10^15`, including the
existing `10^-15` tail/gap reserve. The six Gaussian bounds combine these with
the certified inner products and exact low-band reserves `2^-41, 2^-42, 2^-45`.

The analytic Hardy argument is also formalized: the Gaussian Schur bound is in
`Grothe/UpperChaos/SchurMain.lean`, holomorphic continuation in `HardyHolo.lean`,
and the production coefficient estimate is `HardyReal.hardy_GT_tight`.
It gives the budget `B = 1737972/1000000` at radius `r = 4149/4000`. The head
allowance `H0 = tightHeadResidualQ` forces the linear coefficient to be at least
`c-H0`. `Grothe/HeadHardy.lean` removes `(c-H0)^2*r^2` from `B` and shifts the
coefficient sequence, leaving budget `(B-(c-H0)^2*r^2)/r^4` before applying
Cauchy–Schwarz to the tail. The unconditional endpoint has no remaining
Gaussian or energy-table hypothesis. Its trust boundary is the standard Lean
axioms and the existing permitted `native_decide` facts, recorded in
`data/axioms/native.txt` and checked by the axiom audit.

### Conditional stronger route

`Grothe/Upper/GroupedBridge.lean` proves the smaller rational bound
`500000000000000000/355973699960428191 < 1.404598148840` under explicit
comparison hypotheses. Its grouped comparison allowance is
`groupedCompareQ = 851922301/10^15`; its tail is `303362486/10^16`.
The wrapper `Grothe.UpperChaos.fresh_upper_rounder` takes `ComparisonInputs`
and table accuracy for a charge-one L2 truncation `X`. Those comparison inputs
require the finer component error bounds and supports; the current six-bound
assembly does not discharge that stronger interface. Table accuracy for the
production `X` is proved by `hclose_final`, and the Hardy bound is proved.
See `../localized-comparison/PROOF.md` for the comparison interface.

### Frozen contour replay metadata

`hardy_result.json` records the earlier directed verifier's **65,594 arcs**,
positive-definiteness gates, determinant bounds and exact interval coverage.
Its recorded mean-square upper bound is
`957843690104135/562949953421312 < 1.70148 < 7/4`; its raw tail cap is
`36748/10^12`. These historical replay values are not the active Lean budget
or its deducted tail above. The pinned paper proof and its original status
text in `inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md` are retained unchanged for hash
reproducibility; the analytic ingredients now have the Lean proofs cited above.

## Reproduction

Run the commands from the repository root, with Python's standard library and
`python-flint` installed. The optimizer additionally needs NumPy and SciPy; it
is not part of the proof.

```sh
mkdir -p handoff/upper-preprocess-replay
python3 -I tools/gen_localized_comparison.py --check
python3 tools/gen_upper_data.py data/upper-preprocess/certificate.json handoff/upper-preprocess-replay/Data.lean
cmp Grothe/Upper/Data.lean handoff/upper-preprocess-replay/Data.lean
python3 -I tools/verify_upper_preprocess.py data/upper-preprocess/certificate.json data/upper-preprocess/proposal.json data/upper-preprocess/hardy_result.json --check --out handoff/upper-preprocess-replay/head.json
python3 -I tools/verify_upper_hardy.py data/upper-preprocess data/upper-preprocess/proposal.json handoff/upper-preprocess-replay
lake build Grothe.Upper.PolynomialBridge Grothe.UpperChaos.PhiBound
```

The first directed command recomputes the head and checks the frozen contour
result's input hashes and exact ledger. The second command freshly recomputes
every contour arc; the frozen summary alone is not a fresh contour replay.
Its output includes elapsed time, so a fresh result is not expected to have the
same file hash as `hardy_result.json`; the exact arc partition and rational
mean-square bound are reproducible. The generator resolves its defaults from
its own location and also works from an unrelated current directory.

`certificate.json` contains all inputs needed to regenerate the committed
Lean data byte for byte. `proposal.json` stores the rational optimizer output
used by both directed checks. `hardy_result.json` records every accepted arc,
exact bound, source hash and verifier hash. The `inputs/` directory pins the
Schur proof and smoothing parameters. A sequential LP produced the proposal;
neither LP optimality nor floating point output is a certificate premise.

The dominant current allowance is the selected comparison (about 96.23% of the
residual), derived from the proved Gaussian error bounds. Further gains from a new response must account for its full signed
kernel and shared tail; a better slope or a truncated mixture score alone
does not establish an endpoint.

## Validation scope

The commands above reproduce the frozen preprocessing and contour checks and
build selected supporting modules; they do not by themselves build the current
unconditional endpoint. Full GitHub Lean CI checks `Grothe`, including
`UpperTightFinal`, `MainResult`, the axiom report and the heavy cap stamp.
Temporary targeted Lean receipts from 23 October were cleared before collection
and are not claimed as current validation. Historical verification receipts are preserved under
`miscellaneous/other-bounds/tree/data/upper-preprocess/verification/`; their original scope is unchanged.
