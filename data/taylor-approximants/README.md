# Exact Taylor approximant inputs

The four files in `inputs/` are the original inherited coefficient data, recovered
without regeneration from `grothendieck-1404599424-lean-handoff.zip`. Every complete
SHA-256 hash agrees with the existing comparison provenance. `manifest.json`
records the member names, hashes, sizes and cutoffs. The files are kept here so
future finite certificates no longer depend on a local scratch directory.

The three approximant archives contain one-dimensional binary64 `center` and
`error` arrays. The frozen correction contains binary64 matrices `C0` through
`C100`. Only the center values define the finite vectors; stored error arrays
are not Lean proofs of Gaussian integration errors.

The coefficients multiply the **normalized** Hermite vectors `hvec2`. A matrix
entry `Cq[c,d]` belongs to the index `((q+1-c,q-d),(c,d))`, hence total degree
`2q+1` and charge one. Flat arrays concatenate the matrices in increasing `q`,
then row-major `c,d` order. These are not the coordinate-bidegree arrays of the
energy table. The second source extends to degree 151; the selected comparison
uses its prefix through degree 91. The other approximant cutoffs are 181 and 51.
The frozen correction extends to degree 201.

`tools/gen_taylor_band_data.py` checks all source hashes and decodes each selected
binary64 value with `Fraction.from_float`, preserving its exact dyadic value.
It generates `TaylorBandData.lean` and `third-center.json` for the complete third
approximant, with 6,552 coefficients through degree 51. Packed `mantissa:exponent`
records are decoded strictly in Lean to integers at common denominator 2^105.
No decimal rounding is used for coefficients. Run:

```sh
python3 tools/gen_taylor_band_data.py --check
```

`HermiteFinite.lean` proves the normalized Hermite norm identities.
`GradedHermite.lean` proves injectivity and exact support of the graded index,
allowing direct array lookup instead of a search through the coefficient list.
`TaylorBandCheck.lean` verifies parsing, array size, total energy, and four
band energies by single-threaded native checks. Rational squared comparisons
then give lower and upper norm enclosures with width 10^-30 for the bands
(0,11], (11,21], (21,31], and (31,51]. These use the unscaled third center;
the factor 1/6 belongs to the later comparison source.

The charge-one support and exact vanishing on total degrees above 51 follow
from the general indexing lemmas. No numerical support assertion is assumed.

`GradedHermiteFn` constructs the pointwise normalized polynomial and identifies
its `toLp` with the exact finite center. `ThirdCapturedTail` derives the existing
third tail comparison cap from four unscaled finite-band error hypotheses:
`[47629771,353989726,4052571868,150654124859]/10^18`. These tighter caps fit inside
six times the public finite-band caps and preserve enough captured energy for
the tail. The rounded public caps alone lose too much precision. The original
allowances are preserved in
`data/localized-comparison/inputs/taylor_comparison_result.json`.

These certificates do not establish the distance to `hpow 3`, the first or
second centers' norm certificates, the rounding discrepancy, or the stored
kernel-energy table. The remaining finite checks and Gaussian integral
enclosures remain explicit obligations.

Agent-ID: codex-2ca4
