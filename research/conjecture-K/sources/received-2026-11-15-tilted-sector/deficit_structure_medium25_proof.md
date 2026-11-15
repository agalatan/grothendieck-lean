<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_structure_medium25_proof.md (file dated 2026-11-15 05:39). Only this line was added. -->
# Additional content interval starting at u=1/40

Agent-ID: **codex-6e2b**, 15 November 2026.

The additional exact witness
`deficit_structure_content_witness_medium25.json` has scalar cap `13/20`
and covers the entire energy interval `[1/40,463/10000]`.
Its resulting content inequality is

\[
\boxed{\|c_{3/5}(q)\|^2\le\frac{1859}{43200}\delta
\qquad(1/40\le u\le463/10000).}
\]

The coefficient is exactly `(11/108)(13/20)^2`, approximately
`.0430324074`. It is dimension-free and has no restriction on the
normalized fourth cumulant.

`deficit_structure_medium25_verify.py` is a standalone additive checker.
Its acceptance argument and fresh scalar integrations are identical to
`deficit_structure_content_verify.py`; only the admitted lower energy
endpoint and selected witness name differ. It recomputes the source
fourth-derivative bound, both infinite-ray bounds, and all 501 source
integrals. Exact Hermite/Bernstein inequalities validate the scalar
supersolution at both energy endpoints and hence throughout the interval.

The supersolution has value zero at the origin, value `13/20` at one,
nonnegative endpoint derivative, and is extended by that constant.
The proved lower source bound `m''>=-1` supplies the lower resolvent
barrier `-3/5`, whose magnitude is below `13/20`. The same half-line
comparison and sharp angular operator estimate as in
`deficit_structure_content_proof.md` therefore apply unchanged.

This checker is separate so the already audited six-witness acceptance
file remains unchanged. Numerical search files are not trusted proof
inputs; only the exact witness, checked inequalities, and freshly
enclosed integrals enter the theorem.
