# Two Stein rows at one fourth moment and residual scale

The circular reduction supplies a normalized cubic Gaussian chaos to both active rows. Its squared modulus is (U). Write `s = E[U²] − 2` and `σ = δτ`. The fourth excess belongs to [0,42], and 0 ≤ τ ≤ 93/100. Rows 08 and 09 have exactly the same positive δ. Their potentials and their Stein test functions can differ. The common data are visible in `CircularSharedReduction` and in the definition of s inside `checkAntiCells_sound`.

The signed research replay gives the following candidate on the existing identity-tail witness. The end-to-end Lean theorem is pending.

| scalar profile | largest cell (zero-based) | hat cap, rounded upward | exact transferred candidate |
|---|---|---|---|
| Row08 quadratic and weighted gate of #672 | 23 | 176590771/250000000 | 500000000000/356631775763 |
| Both Stein laws with the previous outer weights | 29 | 706362761/1000000000 | 2000000000000/1426526472233 |
| Both Stein laws with affine outer weights | 23 | 1412721229/2000000000 | 4000000000000/2853044560237 |

## The common parameters

For each admissible s, choose one of the stored fourth-excess cells containing s in each table. Between its consecutive scale knots the expectation of the padded potential is at most the affine chord through the two stored node bounds. This follows by pointwise convexity in σ and integration. Write the resulting chord as `L_i(σ)`. The padding convention is important here. The table bounds the expectation of the potential after subtracting `capPad`; the completed row intercept already restores that padding. Write `c_i` and `κ_i` for the tightened cap and its quadratic coefficient. The two law deductions on the same (s,σ) are at least

    d_i = c_i − L_i(σ) + κ_i σ².

For row09 weight w and row08 weight 1−w, the gate supplies an additional `G(w)τ²` by `WeightedSchur.pair_surplus`. This is a different term in the original row inequality. Each interval of the common σ partition therefore gives a lower bound on the combined deduction by minimizing

    (1−w)c₈ + w c₉ − (1−w)L₈(σ) − w L₉(σ)
        + [(1−w)κ₈ + w κ₉ + G(w)/δ²] σ².

The coefficient of σ² is positive. Test the endpoints and any interior vertex. Take the minimum over all intersecting shape and scale cells. The 19 intervals in the common shape partition give 1,051 positive-length scale segments. The closed adjacent cells cover knots and the end faces. At a knot either neighboring valid pair suffices. Retaining all 1,833 nonempty closed intersections, including point intersections, gives the same exact maximum and permits the banks to choose their bracketing cells independently at knots.

For a fixed cell and scale, the displayed expression is concave in w, since the mixed Schur gain is concave and σ² is nonnegative. The infimum over the same set of cells and scales at every weight is also concave. Its endpoint chord is therefore a valid deduction along every affine weight segment of the amplitude cover. The remaining profile, after subtracting that chord, is quadratic in the amplitude parameter. The replay takes its maximum including the interior vertex. It uses the clipped affine weight from completing the squared difference of the two row β parameters. An arbitrary fixed weight remains admissible when the two β parameters agree. On noncentral cells it uses the original row laws.

## Verification

From the repository root run `python3 -B -I research/identity-tail/code/coupled_stein_profile.py`. It reads both original Stein banks and all 38 amplitude cells, reproduces each single-row cap bound and the earlier weighted envelope, and tests the effect of dropping the shared shape or the gate at half weight. Every inequality and rounding operation uses rational arithmetic. The replay also checks all nine proposed lower prices against the closed-face rule and verifies that rounding each downward at 10⁻¹³ preserves the final cap. One nonbinding price drops by 8.8637·10⁻⁹ when all boundary faces are included. Only the displayed location of the extremum uses floating point.

An independent exact replay using ordered unions of the knot grids and endpoint interpolation gives cell 23 at amplitude approximately 0.837483666904. Its cap lies between 10⁻¹² and 3·10⁻¹² below the stated outward rounding. The final reciprocal uses `1 / ((1953/2000) cap + 47/2000)`. The Lean row assemblies now export `circularCellNodes_row08` and `circularCellNodes_row09`; each node bound uses the actual fourth excess. `CircularCellNodeBounds.chord` retains the scale. `CoupledStein.discount_chord_le` prices any pair of covering chords, and `Grothe.Lower.CoupledStein.profile_bound` kernel-checks the entire amplitude envelope **assuming** its nine lower discount enclosures. The shared-coordinate theorem `CoupledStein.actual_deductions` supplies the two physical rows at every interpolated weight. The compiled witness transfer `Grothe.Statement.coupledSteinEndpoint_le_of_prices` takes `PricesHold`, the usual node-cap theorem, and existence of a Grothendieck bound. `PricesHold` consists of the nine explicit rational comparisons; its kernel proofs are tracked in #674. The new knot bounds, chord comparisons, analytic deductions and conditional amplitude envelope use only `propext`, `Classical.choice`, and `Quot.sound`. The witness transfer additionally inherits the fourteen existing `certRow01` through `certRow14` native row facts.

[Task #674](https://github.com/agalatan/grothendieck-lean/issues/674) · [Weighted gate proof #672](https://github.com/agalatan/grothendieck-lean/pull/672) · [Fourteen-row reweighting ceiling for the previous law](https://github.com/agalatan/grothendieck-lean/issues/671#issuecomment-7154313271)

Agent-ID: codex-a7c4
