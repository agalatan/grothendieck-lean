# Two Stein rows at one fourth moment and residual scale

The circular reduction supplies a normalized cubic Gaussian chaos to both active rows. Write U for its squared modulus. Write `s = E[U²] − 2` and `σ = δτ`. The fourth excess belongs to [0,42], and 0 ≤ τ ≤ 93/100. Rows 08 and 09 have exactly the same positive δ. Their potentials and their Stein test functions can differ. The common data are visible in `CircularSharedReduction` and in the definition of s inside `checkAntiCells_sound`.

The last row gives the original coupled endpoint from #677. The final section records the stronger endpoint obtained with transported ordinates. The other rows show the effect of the outer weights.

| scalar profile | largest cell (zero-based) | hat cap, rounded upward | reciprocal after transfer |
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

The coefficient of σ² is positive. Test the endpoints and any interior vertex. Take the minimum over all intersecting shape and scale cells. The 19 intervals in the common shape partition give 1,051 positive-length scale segments. The closed adjacent cells cover knots and the end faces. At a knot either neighboring valid pair suffices. Retaining all 1,833 nonempty closed intersections, including point intersections, preserves the stated outward cap and permits the banks to choose their bracketing cells independently at knots.

For a fixed cell and scale, the displayed expression is concave in w, since the mixed Schur gain is concave and σ² is nonnegative. The infimum over the same set of cells and scales at every weight is also concave. Its endpoint chord is therefore a valid deduction along every affine weight segment of the amplitude cover. The remaining profile, after subtracting that chord, is quadratic in the amplitude parameter. The replay takes its maximum including the interior vertex. It uses the clipped affine weight from completing the squared difference of the two row β parameters. An arbitrary fixed weight remains admissible when the two β parameters agree. On noncentral cells it uses the original row laws.

## Verification

From the repository root run `python3 -B -I research/identity-tail/code/coupled_stein_profile.py`. It reads both original Stein banks and all 38 amplitude cells, reproduces each single-row cap bound and the earlier weighted envelope, and tests the effect of dropping the shared shape or the gate at half weight. Every inequality and rounding operation uses rational arithmetic. The replay also checks all nine proposed lower prices against the closed-face rule and verifies that rounding each downward at 10⁻¹³ preserves the final cap. One nonbinding price drops by 8.8637·10⁻⁹ when all boundary faces are included. Only the displayed location of the extremum uses floating point.

An independent exact replay using ordered unions of the knot grids and endpoint interpolation gives cell 23 at amplitude approximately 0.837483666904. Its cap lies between 10⁻¹² and 3·10⁻¹² below the stated outward rounding. The final reciprocal uses `1 / ((1953/2000) cap + 47/2000)`. The Lean row assemblies expose the certified node values for the actual fourth excess. `CircularCellNodeBounds.chord` interpolates at the actual residual scale. `CoupledStein.actual_deductions` uses these common parameters in both physical rows. `Grid.worst_le` bounds the quadratic throughout each closed intersection, and `CoupledStein.approxDiscount_le` verifies all nine prices against the original rational chord banks. The integer projections round the two affine coefficients upward and the budget and curvature downward at scale 10²⁰. Twelve kernel-checked blocks cover the full table. `CoupledStein.profile` applies these prices across the amplitude envelope. The matrix transfer uses the repository’s witness node caps and an existing Grothendieck bound. The new price and envelope proofs use only Lean’s standard axioms. The analytic transfer additionally uses the existing native certificates for rows 01–07 and 10–14. The final theorem also uses the certified node caps and the six-channel upper proof to establish existence of a bound.

[Task #674](https://github.com/agalatan/grothendieck-lean/issues/674) · [Weighted gate proof #672](https://github.com/agalatan/grothendieck-lean/pull/672) · [Fourteen-row reweighting ceiling for the previous law](https://github.com/agalatan/grothendieck-lean/issues/671#issuecomment-7154313271)

## Transported ordinates and the outer row pair

For rows 08 and 09 the radius ratio $d>0$ moves a plain Stein polynomial to another physical scale. Its cut vector acquires a signed constant. The pointwise majorant and the normalized cubic moment bounds, including $\mathbb E\sqrt U\le93/100$, then bound the row expectation at that scale. Lean selects eleven ordinary polynomials from the original row data and verifies them over the whole radius axis. They supply fourteen ordinates at four scales on closed fourth-excess intervals. [Dilation](../../Grothe/Lower/CutDilation.lean) · [Expectation pricing](../../Grothe/Lower/SparseNodePricing.lean) · [Selected ordinary nodes](../../Grothe/LowerAnalytic/SparseWitnessData.lean).

Both rows first choose the same one of nineteen shape intervals. On that interval each row brackets the actual residual scale using its own two knots. The replay has 945 distinct closed scale pieces. Nine mixture prices certify a common lower deduction for the two actual expectations and their Gaussian gate. On the outer pair, rows 06 and 07 combine quadratic potential bounds with the Schur complement of their mixed gate. [Central deduction](../../Grothe/LowerAnalytic/SparseSteinRows.lean) · [Outer deduction](../../Grothe/LowerAnalytic/SparseOuterRows.lean).

The 38-cell amplitude cover has its largest value on cell 34 (zero-based), at $t=909/1024$. Rounding the hat cap upward gives $70635503391/10^{11}$. The transfer at $\nu=47/2000$ yields $200000000000000/142651138122623\le K_G^{\mathbb C}$, or $1.4020217618<K_G^{\mathbb C}$ after strict downward rounding. Removing the fourteen added ordinates while retaining the outer-pair improvement gives the previous rounded hat cap $1412721229/2000000000$. Run `python3 -IBO research/identity-tail/code/sparse_stein_dilation.py` from the repository root to reproduce both values. [Exact Lean endpoint](../../Grothe/Lower/Cert/SparseEnvelope.lean) · [Exact rational replay](code/sparse_stein_dilation.py).

Agent-ID: codex-a7c4
