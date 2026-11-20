# Weighted selected-spectrum comparison

The shared GT comparison in the eighteen-channel mixture uses unit coefficient cost,
seven independently enclosed band masses and the six Gaussian estimates.
The following record describes the earlier weighted comparison. The new
proof and its exact budgets are in [the mixture certificate guide](../../docs/UPPER_CERTIFICATE.md).

The conditional target `K_G^C < 1.404598148840` built on the eighteen-piece
comparison below is archived in `abandonware/` and not built: its fourteen
original Gaussian finite-band estimates are not proved (energy-table accuracy is
proved by `Final.hclose_final`). The previous endpoint
ledger is preserved in `miscellaneous/other-bounds/snapshot/data/localized-comparison/PROOF.md`.
The pinned recipe and generator remain active because the comparisons use
the same comparison bands and table radii. Their historical endpoint metadata
is not the current grouped endpoint ledger.

## The inequality

Let `S = {(n,m): n+3m <= 501}`. For L2 functions `G,X`, suppose
`G-X = sum_r D_r`, where the component `D_r` has total-chaos support in its
specified band `B_r` and `||D_r||_2 <= e_r`. Let coefficient costs satisfy `0 <= w(p) <= 1`. Require

`A_r^2 >= sum_(p in S intersect B_r) w(p)^2 energy(X,p)`, with nonnegative `A_r,e_r`.

Then

`sum_(p in S) w(p) |energy(G,p)-energy(X,p)| <= 2 sum_r A_r e_r + sum_(r,s: B_r intersects B_s) e_r e_s`.

The same functions and error components occur throughout; their supports may
overlap arbitrarily. No independence, new Gaussian coordinate, or signed-tail
cancellation is assumed. Disjoint supports eliminate their pairwise quadratic products exactly.

For each bidegree, regard the finitely many Hermite coefficients as a vector.
The elementary norm inequality gives an error at most
`w(p) (2 ||X_p|| ||(G-X)_p|| + ||(G-X)_p||^2)`. Expand the linear error into its
pieces. Support restricts its pairing with `X` to `S intersect B_r`;
Cauchy–Schwarz bounds that pairing by `A_r e_r`, using the weighted vector `w(p) X_p`. For the quadratic term, first bound each block norm by the sum of component
norms and expand its square. A pair with disjoint degree bands vanishes at
every block. Finite Cauchy–Schwarz bounds every remaining pair by `e_r e_s`.
Thus the quadratic cost is the overlap sum above, using the existing support
and norm inputs. It is `8.5661764934464924011246176e-11`; no new Gaussian or
covariance premise is introduced.

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

The table accuracy input, proved for the production approximation by
`Final.hclose_final`, is
`sum_(p in S) |energy(X,p)-Ehat(p)| <= eta`, with
`eta = 6847009/500000000000000000`.
For each band choose an outward rational radius satisfying

`A_r^2 >= sum_(p in S intersect B_r) w(p)^2 Ehat(p) + eta`.

This gives the required actual-vector mass bound. `ComparisonMass.lean`
proves the passage from table accuracy to these radii. Its native fact checks
every band mass independently of Python. `ComparisonOverlap.lean` checks the
finite overlap budget with proof-producing `decide +kernel`; it adds no native fact.

There are 18 error pieces. All exact values, their source roles and the
reproduction hashes are in `recipe.json`. The resulting allowance is

`C = 106490963/125000000000000 = 0.000000851927704`.

The conditional endpoint assembly with the grouped comparison budget
(`Upper/GroupedBridge`, `UpperChaos/GroupedRounder`) is archived in `abandonware/`
and not built; the shared comparison above remains active.
The unconditional endpoint regroups the certified band-mass squares,
uses the six proved low-band/whole-source estimates, and deducts the forced
linear energy from the Gaussian-amplitude Hardy budget `117/100`. Its comparison allowance is
`tightThreeBandCompareQ`, approximately `1.4921263584047238e-6`, and its full
residual is `tightResidualQ`, approximately `1.5422479692227238e-6`.

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

The general theorem accepts `ComparisonInputs`: an exact error decomposition,
component norm bounds, and spectral support. The concrete Taylor specialization
proves the decomposition and support statements, and derives this interface from
the fourteen original finite-band norm bounds (`comparisonInputs_taylorCenters`).
Those original bounds are not proved. The production theorem uses the separately proved six-error
interface in `UpperTightSix` instead. Its analytic Schur/Hardy input is
`HardyReal.hardy_GT_gaussian` (the Gaussian-amplitude estimate, budget `117/100`),
with the forced linear energy deducted by `HeadHardy`.

No `head_close` hypothesis replaces the native finite-head computation.

## Replay

From the repository root, with standard-library Python:

```sh
python3 -I tools/gen_localized_comparison.py --check
```

This checks the pinned source, rational outward rounding, all selected masses,
the 18-piece budget, endpoint arithmetic and byte-for-byte generated Lean data.
With `python-flint`, the frozen preprocessing certificate is also checked by
the commands in `data/upper-preprocess/README.md`.

Focused Lean targets are `Grothe.Upper.ComparisonMass`,
`Grothe.Upper.PolynomialBridge`, and `Grothe.UpperChaos.PhiBound`.
The axiom audit is the default report (`scratch/Axioms.lean`, checked by
`scripts/check_axioms.py`). The full build and axiom allowlist run in CI; the
native band-mass fact `comparison_check` is registered in that allowlist. Heavy
builds belong on the droplet or CI.
