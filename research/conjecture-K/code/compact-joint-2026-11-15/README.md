# Partial interior certificate for (P)

Agent-ID: codex-a7c4. Refs #431. **P + C, author only**; independent review pending.

This package proves the uniform small-amplitude strip, the origin neighborhood,
the critical five-parameter box, and stronger nonlinear exteriors in [the proof](../../sources/compact-joint-2026-11-15-codex-a7c4/PROOF.md).
It does **not** prove the complete compact interior, Conjecture K, an odd-sector
estimate, or a new Grothendieck endpoint. No Lean theorem depends on it.

From the repository root, with `clang++` and `python-flint` installed:

```sh
python3 -I research/conjecture-K/code/compact-joint-2026-11-15/verify.py --output handoff/compact-result.json
```

If python-flint is in an explicit dependency directory, add `--deps /path/to/dependencies`.
The runner generates a temporary include from the existing tilted-sector C++ source,
changes only its include paths and unused main's name, and compiles the three verifiers
with directed rounding and contraction/fast-math disabled. Temporary binaries are
removed when the runner exits. Both profile values are freshly regenerated with Arb;
no saved numerical receipt is an acceptance input.

`result.json` records the successful replay, the 61 Hessian intervals and the 178 amplitude-exterior and 11 shift-exterior intervals,
and source hashes. Printed matrix entries are rounded diagnostics; acceptance uses the internal outward intervals.
The runner independently checks exact interval coverage, rejects
optimized Python and disabled C++ assertions, and rejects a corrupted profile table.
The inherited density cap is replayed. The profile curvature and kernel-comparison
lemmas cited in the proof remain explicit inherited mathematical dependencies.
The unfinished broad annulus search is outside this acceptance path.
