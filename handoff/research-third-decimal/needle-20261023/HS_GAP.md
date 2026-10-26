# The remaining coordinate HS source boundary

The exact phase moments are restored in `phase246.json`. They do not determine the eight
historical power-1 Hilbert–Schmidt caps at target cutoffs `D=51,101`.

The present safe checkout lacks all original HS source JSONs. The older reassessment bound
48 of 56 coordinate caps to files present in its earlier environment; that is not a current
source audit. In this checkout, the following are absent:

- `handoff/upper-residual/matrix/joint_prefix_certificate.json`, including all 14 union rows,
  their 56 coordinate caps, dual variables, and source bindings;
- `handoff/upper-residual/global_norm/natural/power{1,2,3}_hs_result.json`;
- the original `rectangular_hs_result.json`, supplying four coordinates at each of `51,101`;
- the HS generator and exact omitted-input rectangle/operator specification.

The available Git history contains none of those files. The corpus inventory preserves hashes
and headings for the mixed-cutoff and sharper-comparison notes, but their text is absent.
The retained comparison summary does not contain the coordinate values or input cutoffs, so
it cannot determine the missing numerical caps.

There is a useful rigorous reuse rule. For increasing orthogonal output projections `P_D`,
a fixed operator `B`, and a fixed omitted-input projection `Q`,

\[
D\le D'\implies \|P_DBQ\|_{\mathrm{HS}}\le\|P_{D'}BQ\|_{\mathrm{HS}}.
\]

Thus a restored larger-target natural power-1 cap could conservatively replace the missing
smaller-target caps if the input projection is the same, or the desired omitted space is a
subspace of the space already bounded. Target ordering alone is insufficient when the input
rectangle changes. The joint dual must then be reevaluated with the larger prefix errors.

A possible direct regeneration also needs that specification. If `B` is multiplication by
`φ^j`, its matrix in the four-real-variable normalized Hermite basis has entries
`∫H_α H_β φ^j dγ₄`. These are damped polynomial integrals at rate `1+jε`, with factorial-square-root
normalization; their squares are rational. Parseval gives

\[
\sum_\beta|\langle H_\alpha,M_{\phi^j}H_\beta\rangle|^2
=\int |H_\alpha|^2\phi^{2j}\,d\gamma_4.
\]

The right side is rational at rate `1+2jε`. Subtracting a specified finite input rectangle
would give its exact squared HS residual; coordinate partial rectangles can instead use
one-coordinate Parseval and may introduce algebraic rate factors. This is a reconstruction
route, not an identification of the absent source's actual operator.

The next required input is the operator/input-rectangle specification and either the natural
power-1 cap file or its generator. No new HS cap or improved comparison premise is asserted.
