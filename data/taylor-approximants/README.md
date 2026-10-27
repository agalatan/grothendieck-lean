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
No decimal rounding is used. It generates `TaylorBandData.lean` and
`third-band11.json` for the third approximant's first band (degrees 1 through 11,
112 coefficients). Run:

```sh
python3 tools/gen_taylor_band_data.py --check
```

`HermiteFinite.lean` proves the finite Hermite coefficient and projection norm
identities. `TaylorBandCheck.lean` checks the exact sum of squares and identifies
it with the norm of the concrete vector `thirdBand11`; rational squared
comparisons give lower and upper norm enclosures around
`2.121377361367546457321314e-6`. The support certificate is kernel-checked.
The large coefficient sum is one single-threaded native equality.

This is a norm certificate for one recovered finite center. It does not certify
its approximation error to `hpow 3`, the other bands, the rounding discrepancy,
or the stored kernel-energy table. Completing those steps still requires the
remaining finite checks and Gaussian integral enclosures.

Agent-ID: codex-2ca4
