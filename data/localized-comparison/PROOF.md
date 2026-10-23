# Selected-spectrum comparison

The current conditional upper bound is

**K_G^C < 1.404598170764.**

The rounding, polynomial preprocessors, 21,168 stored energies, finite-head cap
and Hardy certificate are unchanged. The improvement comes from retaining the
spectral supports of the inherited Gaussian coefficient-error enclosures.

## The inequality

Let `S = {(n,m): n+3m <= 501}`. For L2 functions `G,X`, suppose
`G-X = sum_r D_r`, where the component `D_r` has total-chaos support in its
specified band `B_r` and `||D_r||_2 <= e_r`. Let

`A_r^2 >= sum_(p in S intersect B_r) energy(X,p)`, with nonnegative `A_r,e_r`.

Then

`sum_(p in S) |energy(G,p)-energy(X,p)| <= 2 sum_r A_r e_r + (sum_r e_r)^2`.

The same functions and error components occur throughout; their supports may
overlap arbitrarily. No independence, new Gaussian coordinate, or signed-tail
cancellation is assumed. The quadratic error is paid once.

For each bidegree, regard the finitely many Hermite coefficients as a vector.
The elementary norm inequality gives an error at most
`2 ||X_p|| ||(G-X)_p|| + ||(G-X)_p||^2`. Expand the linear error into its
pieces. Support restricts its pairing with `X` to `S intersect B_r`;
Cauchy–Schwarz bounds that pairing by `A_r e_r`. Parseval and the triangle
inequality bound the sum of quadratic errors by `(sum e_r)^2`.

Lean proves this algebra in `Grothe/Upper/BandComparison.lean`, constructs the
actual finite Gaussian Hermite blocks in `Grothe/UpperChaos/EnergyBlock.lean`,
and derives the selected energy comparison in
`Grothe/UpperChaos/LocalizedComparison.lean`.

## Finite radii and exact assembly

The existing table accuracy input is
`sum_(p in S) |energy(X,p)-Ehat(p)| <= eta`, with
`eta = 6847009/500000000000000000`.
For each band choose an outward rational radius satisfying

`A_r^2 >= sum_(p in S intersect B_r) Ehat(p) + eta`.

This gives the required actual-vector mass bound. `ComparisonMass.lean`
proves the passage from table accuracy to these radii. Its native fact checks
every band mass and the final rational budget independently of Python.

There are 18 error pieces. All exact values, their source roles and the
reproduction hashes are in `recipe.json`. The resulting allowance is

`C = 107077907/125000000000000 = 0.000000856623256`.

Together with the unchanged head, table error and Hardy allowances:

`delta = 460768975009/500000000000000000`,

`c-delta = 355973694404074991/500000000000000000`.

The formal transfer theorem gives

`K_G^C <= 500000000000000000/355973694404074991 < 1.404598170764`.

## Inherited Gaussian inputs: what remains external

The source `inputs/taylor_comparison_result.json` supplies the previously
certified mixed-Taylor component errors and high-tail norms, for cutoffs
181, 91 and 51. Its SHA256 is
`5619546626b7588ce64a2229aa58b0d161bde613dbf9a5eaad94a3ef93461915`.
The analytic conventions and the source proof are pinned alongside it.

Write the raw Taylor function as `T = F0 + B F0 + B^2 F0/2 + B^3 F0/6` and
the raw approximation as `Xraw = F0 + v`, where `B` multiplies by `i phi`.
For Taylor power `j`, split `B^j F0-c_j` into the source's disjoint finite
degree bands and the tail above `D_j`. Divide each piece by `j!`. Include the
rounding vector `sum c_j/j! - v` as one further piece. These pieces sum
exactly to `T-Xraw`. Apply the same Gaussian smoothing operator to all of
them and to both functions. Smoothing contracts L2 and preserves total chaos
degree, so all source norm and support bounds remain valid. Low-band errors
are bounded by the source's corresponding prefix bounds; their reuse is
conservative. The rounding error is bounded by `10^-18`.

The Lean concrete theorem accepts these facts as `ComparisonInputs`: an exact
error decomposition, the component norm bounds, and spectral support. It then
proves the energy comparison. The raw Gaussian integrations, source tail
enclosures, the identification of the supplied approximation with that
decomposition, table accuracy, and the analytic Schur/Hardy input are still
external. The certificate therefore does not improve the hypothesis-free
Lean upper bound and does not assert that the old global comparison bound
alone implies the stronger endpoint. It uses more of the structure already
recorded in the inherited component certificate.

No `head_close` hypothesis replaces the native finite-head computation.

## Replay

From the repository root, with standard-library Python:

```sh
python3 -I tools/gen_localized_comparison.py --check
```

This checks the pinned source, rational outward rounding, all selected masses,
the 18-piece budget, endpoint arithmetic and byte-for-byte generated Lean data.
With `python-flint`, the current full preprocessing ledger is also checked by
the commands in `data/upper-preprocess/README.md`.

Focused Lean targets are `Grothe.Upper.ComparisonMass`,
`Grothe.Upper.PolynomialBridge`, and `Grothe.UpperChaos.PhiBound`.
The focused axiom audit is:

```sh
lake env lean scratch/AxiomsUpperComparison.lean | python3 scripts/check_axioms.py --upper-comparison
```

The full build and axiom allowlist run in CI; the new native fact is explicitly
registered in that allowlist. Heavy builds belong on the droplet or CI.
