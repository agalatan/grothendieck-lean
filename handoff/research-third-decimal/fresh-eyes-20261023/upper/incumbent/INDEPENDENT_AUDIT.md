# Independent incumbent-column audit

23 October 2026. **Review passed.** No formula, indexing, or tax defect was
found in `tools/fresh_incumbent_column.py`. The column remains conditional on
the inherited `DirectHyps` inputs. No new endpoint is asserted.

## Formula and sign

`qList` already contains the negative auxiliary preprocessor:

```
p(t)=t P(t^2),       -tau(t)=t Q(t^2),
Q(X)=-(alpha X+beta X^3).
```

Thus `Q^m` carries the required sign; another factor `(-1)^m` would be wrong.
When `n+m` is odd,

```
floor(n/2)+floor(m/2)=(n+m-1)/2.
```

The exporter's folded term is therefore exactly the radial coefficient form
of `p(t)^n (-tau(t))^m`. Since `Q(0)=0` and its linear coefficient is nonzero,
the physical minimum degree is `n+3m`. Energy entries outside `n+3m<=501`
cannot affect the head through degree 501. Truncating folded polynomials to
251 coefficients retains degrees 1 through 501. Retaining 129 coefficients
means degrees 1 through 257, with omitted stored degrees 259 through 501.

The frozen P, Q, all 21,168 energy records, and all five rational budgets were
also compared with the current two Lean source files and matched exactly.

## Independent exact physical-prefix check

`tools/fresh_incumbent_exact_prefix.py` uses only standard-library fractions.
It builds the ordinary **physical t-polynomials** and multiplies them directly;
it neither imports nor repeats the exporter's folded-polynomial calculation.

All nine odd coefficients through degree 17, using 33 relevant energy terms,
are inside the saved Arb enclosures. All even coefficients in that prefix are
exactly zero. A double-negated auxiliary sign is rejected: it changes the cubic
coefficient from approximately `4.59136e-8` to `0.1342246422`.

This checks the prefix independently. It does not claim an independent exact
fraction recomputation of all 251 coefficients or regenerate any Gaussian data.

## Tax accounting and binary64 safety

For the actual incumbent coefficients `a`, exact stored-head coefficients `c`,
and retained binary64 centers `b`, the required column discrepancy is bounded by

```
compareQ + energyErrQ + tailQ
+ sum_(k=129..250) |c_k|
+ sum_(k=0..128) |c_k-b_k|.
```

The comparison and energy errors are spent on the head through degree 501;
the actual Hardy tail covers the disjoint region beyond degree 501. The
omitted stored head and retained center errors then complete the discrepancy
to the finite column padded by zeros. No allowance is used twice. `headCapQ`
is correctly **not** added: that old residual cap is replaced by the newly
computed signed head itself.

The new independent checker reads every saved Arb midpoint/radius string as
an exact rational interval. It reconstructs the omitted-head and retained-center
upper bounds from all 251 saved intervals, treats each JSON float as its exact
binary64 fraction, and verifies that the exported tax covers this reconstruction.
It also verifies coverage of the saved total tax enclosure and the frozen-input
SHA-256. No `flint` dependency is needed for this replay.

The current exported tax is `1.102399506609465e-6`, exceeding the independently
reassembled upper bound by about `2.87291e-22`. Removing the omitted-head and
midpoint terms fails the independently reconstructed requirement.

A separate direct test with `python-flint==0.9.0` at 160 bits confirmed that
`arb(exported_float)>=tax` and that `arb(float)` represents the exact binary64
center here. The exporter's `nextafter` plus Arb-comparison loop is therefore
conservative; rational denominators are handled by directed Arb division.

The retained center head minus the exported binary64 tax gives the conditional
lower value `0.7119471533134802`, consistent with the existing headline
`0.711947153313208982`. This tiny consistency difference is not announced as a
new endpoint. New candidate tails must be priced separately.

## Portable replay

```sh
python3 -B -I tools/fresh_incumbent_exact_prefix.py \
  --out handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent/independent-exact-prefix.json
```

Inputs default to the frozen local incumbent folder. The checker needs no live
repository source and no third-party package. It rejects Python `-O` and `-OO`,
and its sign and missing-tax negative controls passed. The detailed exact
fractions, tax margin, input hashes, and prefix inclusions are recorded in
`independent-exact-prefix.json`.

Only the new audit note, checker, and replay ledger were written. The reviewed
exporter and upper-agent-owned inputs/results were not edited.
