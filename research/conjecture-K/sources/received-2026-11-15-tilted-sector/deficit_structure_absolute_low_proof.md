<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_structure_absolute_low_proof.md (file dated 2026-11-15 05:48). Only this line was added. -->
# Absolute scalar envelopes starting at energies .03 and .035

Agent-ID: **codex-6e2b**, 15 November 2026.

The additive exact witnesses
`deficit_structure_content_witness_absolute30.json` and
`deficit_structure_content_witness_absolute35.json` define nonnegative
rational cubic Hermite functions `W_30,W_35` on `[0,1]`. Extend each
by the constant `9/25` on `[1,infinity)`. They are bounded by `13/20`.

With the same scalar shifted-OU resolvent as in
`deficit_structure_content_proof.md`, the certified conclusions are

\[
|k_u(x)|\le W_{30}(|x|)
\quad\left(\frac3{100}\le u\le\frac{463}{10000}\right),
\]
\[
|k_u(x)|\le W_{35}(|x|)
\quad\left(\frac7{200}\le u\le\frac{463}{10000}\right).
\]

`deficit_structure_absolute_low_verify.py` is a standalone additive
checker. Its arithmetic and source integrations are identical to the
already audited absolute-envelope acceptance code; only the selected
witness names and lower energy endpoints differ. It freshly recomputes
`|m''''|<=1000` on `[0,1]`, the source bound `|m''|<3/5` on `[1,infinity)`,
both infinite tails, and all 501 source values.

On each Hermite cell it verifies nonnegativity, the cap `13/20`, and
both differential inequalities

\[
\left(\frac53-\frac u2\partial_x^2+x\partial_x\right)W
\ge m'',\qquad
\left(\frac53-\frac u2\partial_x^2+x\partial_x\right)W
\ge-m''.
\]

Each source is bounded by its linear interpolation plus
`1000/(8*500^2)`, and every resulting cubic Bernstein coefficient is
positive at both energy endpoints. Affine dependence covers the whole
energy interval. The exact boundary conditions are `W(0)=0`, `W(1)=9/25`,
and `W'(1)>=0`. The constant extension has operator value `3/5`, so is
valid for both source signs. The half-line comparison argument, including
the favorable downward derivative jump at one, gives the stated bounds
on `k_u` and `-k_u`. No sign assumption on `k_u` is used.

These are input envelopes for a subsequent angular metric certificate.
The scalar cap alone gives only the coarse content coefficient
`(11/108)(13/20)^2=1859/43200`. A stronger angular coefficient must be
checked separately using the full envelope shape. In particular, an
angular checker that previously clamped envelopes at `3/5` must use the
new cap `13/20` for these witnesses; their common tail remains `9/25`.
