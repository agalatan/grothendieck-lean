# Isolated Codex worktree handoff

Worktree: `/Users/alingalatan/workspaces/grothe-codex-joint-image`.
Branch: `codex/joint-response-delivery-20261023`.
Migration base: `98f61ec`. Delivery base: `b1e3598`.

The main checkout `/Users/alingalatan/workspaces/grothe` was on
`codex/conjecture-k-attack-20261023`, with mixed uncommitted work. Its five
modified tracked files contained this task's import, documentation and axiom
audit changes. They and 27 owned new files were copied byte for byte to this
worktree. No main-checkout commit, stash, reset, branch switch or file removal
was performed. Unrelated rank-one/reassessment files and `work/` were not copied.

Three owned manuscript inserts are now tracked under `docs/research/` so the
integrator can inspect and port them without depending on ignored handoff files.
The corresponding portable common-Stein proof/replay archive is under
`deliveries/`. Its original full replay passed in an unrelated directory on the
droplet; it includes the exact source-table floor and corruption controls.

The copied Lean sources were previously built as a whole library (9,055 jobs).
Their axiom report checked 221 theorems using only the three existing pinned
numerical facts. The six new SteinFusion results themselves use standard axioms.
These statements report the pre-migration validation of byte-identical sources;
they do not claim a fresh full build in this worktree or a new endpoint.

Only `.lake/packages` is symlinked to the shared dependency cache. Project
build output is never symlinked into the main checkout. The surviving build
process inspected during migration belonged to a different worktree and was
left running.

## Integration

The delivery is rebased onto GitHub master `b1e3598` as one commit. It preserves
master's six response-geometry modules, 311 selected axiom reports, explicit
upper-rounding hypotheses and native-fact allowlist. The merged root configures
372 reports. All 15 affected modules build; the combined 116-theorem response
audit uses only standard axioms. The full default build runs in CI.

Publish the finished commit to an owned `ready/codex-` branch for the existing checked
auto-merge workflow. Do not integrate by switching or committing in the main
checkout from a Codex session. The numerical Grothendieck endpoints are unchanged.

The three TeX inserts are:

- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/binding-audit-20261023.tex`
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/joint-response-lift-20261023.tex`
- `/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/common-stein-kernel-20261023.tex`

Earlier research reports retain historical provenance paths in the main checkout.
Those paths are references, not permission for Codex to resume work there.
