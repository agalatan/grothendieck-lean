# Signed-resolvent Haagerup certificate: verification

The public theorem is `Grothe.haagerup_bound`, with no hypotheses and endpoint
1404909543/1000000000 = 1.404909543. The complete written proof is in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/HAAGERUP_POWER.md`
and the manuscript fragment in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/haagerup-power.tex`.

- `kernel-build.log`: the four mathlib-free arithmetic modules and their shared library built in this task's own droplet directory.
- `native-build.log`: the complete sequential numerical certificate and final matrix assembly, with the compiled kernel loaded explicitly.
- `lean-build.log`: warning-free targeted builds of the generic signed-tail theory, Gaussian identity dependencies and final endpoint.
- `axioms.log`, `audit.log`: the strict focused audit covers 43 results. It permits only standard Lean axioms and the certificate's own single native fact.
- `public-replay.log`, `public-replay.json`: an isolated independent replay at 192-bit ball precision. It checks every finite-head and combined-seed coefficient, the exact rational inverse defect and power norm, the directed infinite-tail budget, and the final endpoint. Numerical parameters are bound to byte-identical generated Lean data.
- `negative-certificate.log`: corrupting the inverse or understating either residual cap is rejected even after regenerating matching Lean source, so rejection tests actual numerical inequalities.
- `negative-audit.log`: missing results, foreign numerical facts, Lean errors and incompatible audit modes are rejected.

Canonical data live in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/data/haagerup-resolvent/certificate.json`;
`/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/gen_haagerup_power.py --check`
checks exact regeneration. Acceptance uses no floating optimizer.

The overview and full TeX proof compile and were visually inspected.
The lower node-cap import closure and its verified stamp are unchanged.
The complete repository build and audit are performed by delivery CI.

From the worktree root, verify the artifact manifest with:

```sh
shasum -a 256 -c /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/verification/haagerup-resolvent-20261025/SHA256SUMS
```

The manifest binds the certificate, generators, specific proof sources and
validation logs; shared headline documents and the global audit registry are
excluded so unrelated future repository work does not invalidate it.
