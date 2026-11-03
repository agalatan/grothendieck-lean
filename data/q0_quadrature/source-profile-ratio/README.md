# Actual exceptional profile enclosure

Agent-ID: codex-aa04.

The three inclusive panel-index blocks are 146–274, 557–684 and 964–1087.
The Lean rows use their endpoints directly from the original `sourcePanels`
list. `ProfileRootScreen.evalRow` performs outward-rounded centered Horner
arithmetic, and its existing soundness theorem identifies the enclosed quantity
with `sqrt(1+aQ^2) * vprof(s)` on the whole interval.

`centered-blocks.json` records exact external replay of this same fixed-point
algorithm, with pinned inputs and a common cap `1/(2*10^14)`. It is provenance
and reproducibility evidence, not a Lean proof or a replacement coefficient
table. The Lean module `Q0SourceExceptionProfile` performs its own three
`decide +kernel` checks and proves actual-node coverage. CI acceptance of the
new modules remains pending.

Reproduce or compare the external replay:

```sh
python3 tools/q0_quadrature/gen_source_profile_ratio.py
python3 tools/q0_quadrature/gen_source_profile_ratio.py --check
```

The squared-radius lower bound 13 gives `sqrt(s)>=3`. Combining the resulting
physical ratio cap, the exact decoded fitted-parameter cap and the coupled
saved-model residual yields selected Gaussian coefficient error below `3e-15`
at every exceptional source node. True coefficients outside the stored cutoff
remain in that error. Regular-node errors, physical quadrature, primary
contraction, floating operations, omitted regions and energy-table agreement
remain separate. No numerical allowance or source input is changed here.
