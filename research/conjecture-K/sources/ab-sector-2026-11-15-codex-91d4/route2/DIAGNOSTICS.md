<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/route2/DIAGNOSTICS.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# Exploratory routes and remaining losses

Agent-ID: codex-91d4. Refs #426. **Everything numerical in this note is N-only.** The calculations help choose further proof work. They are not continuum certificates, lower bounds on an optimal relaxation, or counterexamples to a true content theorem.

## Stronger deficit duals

`deficit_probe.py` repeats the old sampled spectral SOCP at two difficult `(u,χ)` pairs, adds the pointwise Stein-matrix PSD multipliers, and adds many piecewise-affine knots. Three exchange rounds add sampled violating points. The original search source and data are bundled under `inputs/deficit_search/`; the original files were not modified.

| `(u,χ)` | original sampled deficit lower bound | richer PSD sampled bound |
|---|---:|---:|
| `(.0463,3)` | `.000863599` | `.000892262` |
| `(.0275,12.29)` | `.001446256` | `.001557894` |

Some residuals remained negative on the validation grid, and some solver statuses were `optimal_inaccurate`. The displayed values therefore remain candidate objective values, not certified deficits. Their improvement is too small to justify an exact acceptance effort for the original `.15` A target using only the previous supremum-based content envelope.

## Content profiles and simple moment relaxations

The A worker evaluated the signed scalar resolvent rather than its absolute angular majorant. Sampled coefficients in `C_A²≤coefficient·δ` are about `.0378963` at `u=.0275` and `.0314331` at `u=.0463`. The latter still exceeds the coefficient about `.0206` required at the saved `χ=3` deficit bottleneck. The energy-dependent second-chaos resolvent also improves the old `3δ^(3/2)` coefficient numerically, but that branch does not dominate at this bottleneck.

A different law relaxation pairs a unit Gaussian probe `Y` with `q`. Its marginal `T=|Y|²` is exponential. If the radial A profile is `q h(|q|²)`, the first-chaos orthogonality allows subtraction of any constant `k`:

    C_A ≤ E[sqrt(T)|q| |h(|q|²)−k|].

Moment dualization using `E|q|²=u` and `E|q|⁴=u²(2+χ)` produces sampled squared bounds `.000172201` at `(.0275,12.29)` and `.000256400` at `(.0463,3)`. It is promising at the former point but worse than the certified δ envelope at the latter. See `a_content/moment_probe.py`.

`mixed_moment_probe.py` additionally tested `E[T|q|²]≤4u` and the reviewed sixth-moment upper bound. The mixed moment follows from multiplication by a normalized Gaussian coordinate in the complex Hermite basis, including arbitrary sharing. In these tested optimizations both additional multipliers were zero. Allowing the coefficient of the exact second moment to be negative made only a small improvement at `χ=1`; it did not remove the `χ=3` loss. The fourth-moment multiplier was kept nonnegative in this particular test, so this is not a test of every sixth-moment dual.

For B, `b_content/b_cs_probe.py` exhibits the loss in a plain Cauchy–Schwarz law envelope on the Gaussian-plus-Wick limiting family. At `u=.0463,χ=3`, its sampled CS bound is about `.000321776`, while actual sampled B content is about `.0000162501`; the desired deficit allowance is about `.0000999746`. The Gaussian component is a limiting comparison law, not an asserted finite-dimensional genuine cubic in this diagnostic. Finite-dimensional and source-tail errors are not certified here. This illustrates why further Gaussian-chaos information can matter much more than refining quadrature.

## Coupling content and deficit in one dual

The root prototypes `coupled_probe.py`, `coupled_stein_probe.py`, and `coupled_stein_sixth_probe.py` keep the norm objective alongside content. The last is the useful version; the first two record why moment-only or fourth-moment-only coupling remains weak.

For `C=C_A`, use

    C²=max_(0≤σ≤1/50) (2σC−σ²).

The restriction uses the reviewed uniform bound `C_A≤1/50`. For each sampled `σ`, the LP majorizes the integrand with multipliers for the exact second/fourth moments, the sixth-moment upper bound, and an exponential-probe marginal. The profile is reconstructed modulo a linear term, which the free subtraction absorbs.

The final version also adds `γu²G(|q|²/u)` to the norm profile, where the sampled richer spectral dual satisfies the analytic Stein-cut template `EG≥0`. This is the correct direction for an upper bound on `+γF`. The LP's second- and fourth-moment multipliers are free; its sixth-moment multiplier is nonnegative. Keeping the sixth moment is essential in these samples.

At `γ=.15`, six values of `σ` between zero and `.02` gave:

| `(u,χ)` | largest sampled candidate allowance for `C_A²−.15D` |
|---|---:|
| `(.0463,3)` | approximately `4.70·10⁻⁵`, at `σ=.015` |
| `(.0275,12.29)` | approximately `−1.12·10⁻⁴`, at `σ=.01` |

The desired allowance is `6·10⁻⁶`. Coupling helps substantially at medium energy, while this fixed dual still misses at high energy. Jointly optimizing the spectral cut and the content majorant could improve it; no impossibility is asserted.

A separate worker checked the algebra, scaling, row order, moment signs and linear subtraction in `coupled_stein_sixth_probe.py`. That is an internal inspection of an N experiment. There is **no** continuous cover in `σ`, probe radius, or cubic radius; Gaussian quadrature and finite-radius truncation are not directed certificates, and the stored spectral search has unresolved numerical residuals. Even the largest sampled allowance is not a valid global upper bound.

## Suggested next mathematical work

The certified results are in the proof notes, separate from these diagnostics. Further work should retain the correlation between content and the norm deficit, or use genuine-chaos contractions beyond a uniform Hessian supremum. For the secant, a larger certified Hessian ball would reduce the cost of the remaining five-parameter cover. A full compact computation with the present `.28`/δ content inputs would still leave the proposed joint budget unclosed.
