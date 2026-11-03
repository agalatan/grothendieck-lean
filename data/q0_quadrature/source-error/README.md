# Actual source-error assembly

Agent-ID: codex-aa04.

The source-error assembly uses the selected recurrence roots, affine physical
weights and source-address indexing of the committed quadrature tables. Its
Gaussian node weight is `sourceWeight a * exp(-sourceNode a)`, once.
`provenance.json` pins all numerical inputs and the incorporated dependency
sources; hashes record provenance rather than replacing Lean proof checking.

For the exceptional panels, the finite order scan gives orders one through
four. Degree-zero polynomial exactness normalizes the same selected roots;
affine scaling gives physical weight sum equal to panel width. Thus
`Q0SourceExceptionMassClosure.exceptional_panel_normalization` removes the
`hpanel` premise of the exceptional mass and error estimates. The density
estimate and total exceptional width give discrete mass at most `2e-21`.
Bessel and the saved-vector bound give exceptional error at most `1.575e-10`.

`actual_source_error_sharp` combines regular and exceptional squared errors
on exactly `ConditionalNodeIndices.modes`, giving `2.53e-10` under the explicit
regular coefficient-enclosure hypothesis `hpoint`. It uses zero completion
only for the stored approximation. True omitted coefficients remain in the
error. `Q0ConditionalSourceReconstruction.reflected_error_le` uses the exact
actual-coefficient reconstruction and returns `(10/7) * 2.53e-10` on the full
rectangle. The phase convention is the production slice at `sqrt(s)`.

Still separate: proving the actual regular evaluator bounds; identifying
supplied centers and basis/sign normalization with the production table;
floating-point scale, underflow and contraction errors; continuous quadrature
remainders, omitted regions and infinite tails; and the final energy-table
fit. These files do not establish the upper endpoint by themselves.

Regeneration checks:

```sh
python3 tools/q0_quadrature/gen_source_error_batch.py --check
python3 tools/q0_quadrature/gen_gauss_selected_rules.py --check
python3 tools/q0_quadrature/gen_gauss_selected_choice.py --check
python3 tools/q0_quadrature/gen_gauss_selected_lookup.py --check
python3 tools/q0_quadrature/gen_node_mass.py --check
python3 tools/q0_quadrature/gen_source_exception_centers.py --check
python3 tools/q0_quadrature/gen_source_exception_width.py --check
python3 tools/q0_quadrature/gen_source_panel_order.py --check
python3 tools/q0_quadrature/gen_conditional_pair_ranks.py --check
python3 tools/gen_gauss_polynomial_certificates.py --check
```

The batch wrapper has an explicit per-generator filename manifest. It omits
only eight standalone audit modules outside this delivery's import closure;
it does not choose files based on their presence. The imported certificates
and the final consumers retain transitive audits allowing only Lean's standard
logical axioms. The generated literals are checked by Lean; Python replay does
not establish their mathematical soundness.
