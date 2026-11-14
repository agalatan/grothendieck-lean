# GrotheSign

A separate Lake package: Lean proofs about the sign of the coefficients in the beta-preservation argument for inverse
kernel series (issues #362, #363). Current content: the all-orders positivity identity
`GrotheSign.resolventCoefficient_pos` and its supporting lemmas.

It is independent work. Nothing here is imported by the `Grothe` target, listed in its axiom report
(`scratch/Axioms.lean`) or built by the proof check in CI, and the bounds on the complex Grothendieck constant proved
in this repository do not depend on it. The main `lakefile.toml` does not mention this package: that file is pinned by
the node-cap registry, so changing it makes every proof check rebuild the node caps (#371).

## Building

```sh
# once, in the repository root: Mathlib and its compiled files
lake exe cache get

# then here
cd sign
lake build                                # the library GrotheSign
lake env lean scratch/SignAxioms.lean     # its axiom report
```

- Mathlib is taken by path from the main checkout (`../.lake/packages/mathlib`), so it is not downloaded or compiled a
  second time. In a worktree whose `.lake/packages` is a link to the shared packages this works unchanged.
- The first build clones the small packages Mathlib depends on into `sign/.lake/packages` and unpacks their compiled
  files (about 400 MB, one to two minutes). `sign/.lake/` is ignored by git.
- The toolchain is the one in `lean-toolchain` here, which must equal the file of the same name in the repository
  root. After a change of the Mathlib version in the root, run `lake update` here and commit the two files it changes
  (`lake-manifest.json`, `lean-toolchain`).

## Conventions

The rules of `AGENTS.md` apply (own branch and worktree, pull request, task issue). New modules go under
`sign/GrotheSign/` and are imported by `sign/GrotheSign.lean`; every headline theorem gets a line in
`sign/scratch/SignAxioms.lean`. No `sorry`, no new axioms.
