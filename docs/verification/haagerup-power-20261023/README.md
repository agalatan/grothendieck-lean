# Finite-power Haagerup certificate: verification

The public theorem is `Grothe.haagerup_bound`, with no hypotheses and upper
endpoint `1404951/1000000`. The complete written proof is in
`/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/HAAGERUP_POWER.md`.

- `native-build.log`: the closed numerical Lean module compiled successfully
  on the droplet with Lean 4.34.1, in six minutes. Evaluation is sequential.
- `lean-build.log`: source hashes, toolchain and warning-free final generic,
  Gaussian identity and endpoint module builds. The source hashes match this
  worktree. Existing dependency oleans were reused only after checking their
  source hashes; the changed sources were rebuilt in this task's own cache.
- `axioms.log` and `audit.log`: all 28 public theorems in the new route pass
  the strict `--haagerup-power` audit. The endpoint uses standard axioms plus
  its own native finite check, with no other certificate fact.
- `public-replay.log` and `public-replay.json`: an independent replay using
  python-flint 0.9.0 at 192-bit precision. It binds every parameter to the
  Lean source, computes the complete finite polynomial, verifies the
  fourth-power budget exactly and encloses the infinite weighted suffix.
- `negative-certificate.log`: inconsistent source data and understated power,
  finite residual or infinite tail budgets are rejected.
- `negative-audit.log`: missing results, foreign numerical facts, Lean errors
  and mixed audit modes are rejected.

The updated overview PDF and the standalone TeX section also compile
without warnings. The overview's nine pages were rendered and inspected.
The node-cap import closure is unchanged; its pre-existing stamp warning is
unchanged. A full repository build is performed by the delivery CI.

From the worktree root, verify the pinned artifact files with:

```sh
shasum -a 256 -c /Users/alingalatan/workspaces/grothe-codex-joint-image/docs/verification/haagerup-power-20261023/SHA256SUMS
```

The manifest excludes shared headline files and the global audit registry,
so later unrelated repository updates do not invalidate this proof artifact.
