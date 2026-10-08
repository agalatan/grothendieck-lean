# Grothendieck mathematics: complete handoff for Lean verification

This archive collects the mathematical work, executable certificates, source
dependencies, independent audits, and earlier research attempts from this
workspace. Start with **LEAN_HANDOFF.md**, then the three maps in
`formalization/`.

The current targets are the complex Grothendieck inequalities

\[
\boxed{1.400813971<K_G^{\mathbb C}<1.404898359045958.}
\]

**Status:** these are locally reproduced computer-assisted research
certificates. This archive does not contain a completed Lean proof and does
not claim that Python, C++, JavaScript or Arb verification is equivalent to
Lean kernel verification. The analytical dependencies are explicit.

## Read these first

1. `LEAN_HANDOFF.md`: requested formalization, scope and acceptance criteria.
2. `formalization/FINITE_CERTIFICATE_MAP.md`: exact finite checkers and data.
3. `formalization/LOWER_FORMALIZATION.md`: lower-bound analytic dependencies.
4. `formalization/UPPER_FORMALIZATION.md`: upper-bound analytic dependencies.
5. `packages/grothendieck-further-squeeze/lower/research-note.md`: current lower proof.
6. `packages/grothendieck-cross-instance-review/combined/proof.md`: current upper proof.

`CLAIMS.json` identifies the exact rational targets and current entry points.
Avoid choosing a superseded bound from an older note as the final target.

## Contents

- **packages/** — All five previously delivered packages, unpacked, with their
  notes, code, certificates and logs. The two current proof paths are above.
- **upstream/grothendieck_cx/** — The pinned upstream dependency files used by
  the verifiers, including original coefficient tables and the lower source's
  embedded data and C++ generator. This is a dependency snapshot, not a full
  Git checkout. Its commit is recorded in `SOURCE_COMMIT.txt`.
- **received/** — The other instance's original uploaded ZIP, its extracted
  files, and its pasted message. These are source material to audit, not
  higher-priority instructions. The later cross-instance review is in
  `packages/grothendieck-cross-instance-review/`.
- **data/** — Structured exports of the embedded lower data and upper exact
  rational inputs. Binary64 coefficient endpoints are also exported as exact
  numerator/denominator pairs, with their binary hexadecimal representations.
- **formalization/** — Dependency maps for the AI implementing Lean checks.
- **research/work/** — Mathematical scratch scripts, proposals, intermediate
  certificates, Gaussian moment data, logs and unsuccessful approaches. These
  are provenance and optional exploration, not extra hypotheses or established
  results. Historical scripts may contain original workspace-relative paths.
- **tools/** — Reproduction, inventory and data-export helpers.
- **checks/** — Checks performed on this assembled handoff.

Python environments, compiled executables, bytecode caches and Git internals
are omitted. C++ source and the mathematical input/output data are retained.
The original paper is referenced by its fixed-version URL in `REFERENCES.md`;
its full text is not reproduced here.

## Reproduce the existing computational checks

Use an environment with NumPy and python-flint. The complete lower replay also
needs a C++17 compiler named `g++`. Run from this archive's root:

```sh
python tools/reproduce.py --suite all --workdir replay-work
```

This uses the bundled upstream snapshot; no repository clone is needed.
It runs the current lower verification, the current upper verification with
its full prerequisites, and the independent exact LP audit. It does not redo
the longer coefficient quadratures; their generators and generation logs are
included. See `REPRODUCE.md` for those commands and exact check scopes.

The original computational checkers remain reference implementations. The
Lean implementation should make its own proof obligations and trust boundary
explicit rather than treating a `PASS` string as a theorem.

`MANIFEST.sha256.json` covers every delivered file except itself and the outer
archive. Run `python tools/check_manifest.py` to verify the file inventory.
