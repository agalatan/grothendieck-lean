# Weighted selected-spectrum comparison

The current conditional upper bound is

**K_G^C < 1.404598161566.**

The rounding, polynomial preprocessors, 21,168 stored energies, finite-head cap
and Hardy certificate are unchanged. The improvement comes from retaining coefficient costs as well as the
spectral supports of the inherited Gaussian coefficient-error enclosures.

## The inequality

Let `S = {(n,m): n+3m <= 501}`. For L2 functions `G,X`, suppose
`G-X = sum_r D_r`, where the component `D_r` has total-chaos support in its
specified band `B_r` and `||D_r||_2 <= e_r`. Let coefficient costs satisfy `0 <= w(p) <= 1`. Require

`A_r^2 >= sum_(p in S intersect B_r) w(p)^2 energy(X,p)`, with nonnegative `A_r,e_r`.

Then

`sum_(p in S) w(p) |energy(G,p)-energy(X,p)| <= 2 sum_r A_r e_r + (sum_r e_r)^2`.

The same functions and error components occur throughout; their supports may
overlap arbitrarily. No independence, new Gaussian coordinate, or signed-tail
cancellation is assumed. The quadratic error is paid once.

For each bidegree, regard the finitely many Hermite coefficients as a vector.
The elementary norm inequality gives an error at most
`w(p) (2 ||X_p|| ||(G-X)_p|| + ||(G-X)_p||^2)`. Expand the linear error into its
pieces. Support restricts its pairing with `X` to `S intersect B_r`;
Cauchy–Schwarz bounds that pairing by `A_r e_r`, using the weighted vector `w(p) X_p`. Parseval and the triangle
inequality, together with `0 <= w(p) <= 1`, bound the sum of quadratic errors by `(sum e_r)^2`.

Lean proves this algebra in `Grothe/Upper/BandComparison.lean`, constructs the
actual finite Gaussian Hermite blocks in `Grothe/UpperChaos/EnergyBlock.lean`,
and derives the selected energy comparison in
`Grothe/UpperChaos/LocalizedComparison.lean`.

## Costs of the actual coefficient map

For any finite linear coefficient map `K(E)_j = sum_p a(j,p) E(p)`,
`w(p) >= sum_(j<K) |a(j,p)|` gives
`sum_(j<K) |K(E)_j-K(EX)_j| <= sum_p w(p) |E(p)-EX(p)|`.
Lean proves this triangle inequality in `head_perturbation_weighted` and connects
it to kernel locality in `head_residual_le_weighted`.

Here `a(j,p)` is the coefficient of `X^shift P^n Q^m`. Write `Q=X R`.
The first 251 coefficients only use the first
`k = 251 - (floor(n/2)+floor(m/2)+m)` coefficients of `P^n R^m`, truncated at
zero. For `k <= 21` and the finite index range, the checker computes those
coefficients by 128-bit outward fixed-point interval arithmetic. The cost is
the smaller of one and the resulting absolute coefficient sum. All other
indices have cost one. All powers and convolutions are enclosed by the existing
proved interval routines. `headWeight_sound` proves soundness of every cost;
`comparisonWeight_bounds` proves it belongs to `[0,1]`. These are ordinary Lean
proofs, with no new native fact or analytic input. The native band-mass check
uses the costs computed from the canonical preprocessors, not supplied floats.

`tools/head_weights.py` reproduces the same integer interval arithmetic. The
squared costs enter the comparison radii. The inherited table error is charged
once, since `w(p)^2 <= 1`. The original table head and Hardy certificate remain
unchanged.

## Finite radii and exact assembly

The existing table accuracy input is
`sum_(p in S) |energy(X,p)-Ehat(p)| <= eta`, with
`eta = 6847009/500000000000000000`.
For each band choose an outward rational radius satisfying

`A_r^2 >= sum_(p in S intersect B_r) w(p)^2 Ehat(p) + eta`.

This gives the required actual-vector mass bound. `ComparisonMass.lean`
proves the passage from table accuracy to these radii. Its native fact checks
every band mass and the final rational budget independently of Python.

There are 18 error pieces. All exact values, their source roles and the
reproduction hashes are in `recipe.json`. The resulting allowance is

`C = 13311891/15625000000000 = 0.000000851961024`.

Together with the unchanged head, table error and Hardy allowances:

`delta = 458437859009/500000000000000000`,

`c-delta = 355973696735190991/500000000000000000`.

The formal transfer theorem gives

`K_G^C <= 500000000000000000/355973696735190991 < 1.404598161566`.

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
