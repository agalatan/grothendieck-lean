# Coupled source-vector certificate interface

Agent-ID: codex-aa04.

The actual Gaussian slice at squared radius `s > 0` has signed physical
ratio `ρ = sqrt(1+a²) * vprof(s) / sqrt(s)`. Bessel projects its L² error
from the constant-and-linear model onto any finite set of Hermite modes:

`sum ||actual_i - linear_i||² ≤ (5ρ²)²`.

The model at parameter `r` changes only its two linear coordinates, with
vector radius at most `|ρ-r|`. If a certificate proves the coupled saved-model
error `sum ||linearCenter(r)_i - saved_i||² ≤ ε²`, the actual saved-vector
radius is at most `5ρ² + |ρ-r| + ε`. The analytic remainder does not incur
a factor from the number of modes. A scalar tolerance is not a vector bound.

`Q0ConditionalSourceVector.LinearRowBounds` uses the actual selected
`sourceNode a`, bounds its physical ratio and chosen parameter discrepancy,
and checks the coupled saved-model error on exactly `ConditionalNodeIndices.modes`.
The caller supplies all selected zero-completed coordinates. True omitted
coefficients remain part of the error; they are never declared zero.

The hybrid budget uses this model only on a chosen subset of regular source
addresses. Every other regular address has a separate squared-error premise.
The sum uses the existing physical source weight and one Gaussian density.
The exceptional saved rows remain in their separate, disjoint error term.
A hybrid regular budget at most `(1969/10^13)²` supplies the existing source
assembly and its `253/10^12` selected-vector radius.

This interface does not certify actual parameter intervals, a chosen near-zero
node subset, model-to-saved rows, other-node evaluator errors, floating-point
operations, quadrature remainder, or infinite tails. Those are remaining
proof inputs, not results inferred from this interface. The upper endpoint
remains work in progress. The dependency commits are pinned in `provenance.json`.
No replacement coefficient table is introduced.

The exceptional-row path uses `Q0SourceSavedLinearModel`. Its exact rational
`storedScalar` is the existing decoded payload at the same canonical rank.
`source_model_error_eq` reduces the model discrepancy over the full selected set
to the established five-coordinate support. The fitted parameter `x10-x01`
has residual `(1-x00)^2+(x10+x01)^2/2+x02^2+x11^2`; using any other parameter
adds `(r-fitParameter)^2/2`. These identities preserve coupled vector error.
The actual-source row interface still requires physical-ratio and parameter
bounds. This is an exceptional-row estimate, separate from the regular hybrid
budget. True coefficients outside the model support remain in the analytic
remainder.

`Q0SourceSavedLinearChecks` consumes the same decoded rows in separate
`decide +kernel` checks: the fitted parameter has magnitude below `1/10^15`,
and the full model discrepancy has squared norm below `(1/10^31)^2`.
The final actual-source theorem discharges that saved-model premise; only
actual physical-ratio and ratio-to-fit enclosures remain. These are proof
candidates until the delivery's Lean check passes; exact Python replay alone
is not acceptance evidence.

Regenerate or compare the check modules using:

```sh
python3 tools/q0_quadrature/gen_source_saved_linear_checks.py
python3 tools/q0_quadrature/gen_source_saved_linear_checks.py --check
```

The generator reuses the hash-validated row reader and existing chunk
partition; it introduces no floating arithmetic or replacement payload.

The concrete successor `Q0SourceExceptionProfile.source_actual_error_sq_lt`
discharges the two physical parameter estimates for every exceptional source
address. Three centered interval checks use endpoints from the original panel
list, and the existing actual-profile identity proves their soundness. With
`B=1/(2*10^14)` and `s>=13`, the ratio and fit-error bounds give radius
`5*(B/3)^2 + B/3 + 1/10^15 + 1/10^31 < 3/10^15`.
This statement still awaits Lean CI acceptance. It does not apply the model to
all regular nodes or close the continuous quadrature and energy-table inputs.
See `../source-profile-ratio/README.md` for the exact three-block replay.

`Q0SourceExceptionalWeightedError` propagates the actual per-node estimate to
any finite subset of `modes`, preserving the original selected-root weights
and one Gaussian density factor. The proved discrete mass cap `2e-21` gives
an exceptional weighted radius at most `2e-25`. Its full-source assembly keeps
an arbitrary regular squared budget `R^2` and adds `(2e-25)^2`, without assuming
any regular evaluator accuracy or changing the ledger. Continuous root-gap
omission remains separate. This successor is also pending Lean CI acceptance.
