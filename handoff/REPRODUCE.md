# Existing computational checks and exact-data exports

These are the reference computational checks to compare against a future Lean
development. They are not a Lean formalization.

## Requirements

Current proof replay uses Python 3, NumPy, python-flint, and a C++17 compiler
available as `g++`. The Python packages used here are recorded in
`environment-reference.json`. SciPy is only needed by historical optimization
or proposal scripts, not by the current upper/lower verifiers. Node.js is
optional for replaying the other instance's BigInt checker; an independent
Python Fraction checker is also included.

From the bundle root:

```sh
python tools/check_manifest.py
python tools/reproduce.py --suite lower --workdir replay-work
python tools/reproduce.py --suite upper --workdir replay-work
python tools/reproduce.py --suite lp --workdir replay-work
```

`--suite all` runs these three suites in that order. Keep assertions enabled.
The lower driver creates and compiles its C++ residual program in the supplied
work directory. The mathematical inputs come from this bundle, not from an
external checkout or the original author's filesystem.

The original computational checkers may regenerate small deterministic JSON
summaries next to their scripts and create Python bytecode caches. For an
unchanged-manifest comparison, run the hash checker before replay, or work in
an extracted copy.

## Coefficient quadrature

The full upper replay reruns the source prerequisites and three Dirichlet
energy integrals. It **does not** regenerate the coefficient tables. Their
generation logs and exact source/table hashes are supplied.

To regenerate the added modes 120–239 on each radial side:

```sh
python packages/grothendieck-cross-instance-review/combined/generate_added_origin.py --source-dir upstream/grothendieck_cx --jobs 4 --output replay-work/added-origin.npz
python packages/grothendieck-cross-instance-review/combined/verify_combined.py --source-dir upstream/grothendieck_cx --added-table replay-work/added-origin.npz
```

This took about 13 minutes in the original run. The generator has a resumable
per-mode cache with a parameter/source manifest. The two original tables and
their generator programs are bundled in the upstream snapshot; their prior
successful regeneration logs are in
`packages/grothendieck-refinement/logs/`.

## The exact rational exports

`data/lower-source-profiles.json` is the parsed `DATA` object from the pinned
lower source. The separate `data/upper-rational-inputs.json` exports the
source scalar rows, corrected third-row sign, phase polynomials, weights,
mass, energy caps and common preprocessor as rational objects.

Each file in `data/npz-exact-rationals/` records its source NPZ hash and every
array's dtype and shape. Flattened values use C order. For a binary64 endpoint,
`numerator/denominator` is its exact mathematical value and `binary64_hex`
records Python's exact hexadecimal representation. Decimal strings from a log
are not substituted for the stored endpoint.

The new script `tools/check_data_exports.py` checks these exports against the
bundled NPZ tables and source data. It validates conversion and identity only.
In particular, rationalizing an interval endpoint does not prove that the
interval contains the actual coefficient integral. See the formalization maps
for that remaining obligation.

## Other-instance and historical material

Its original ZIP is preserved under `received/original-upload.zip`, with an
extracted copy alongside it. The other instance's scripts expect the upstream
repository beside `further-refinement/`. If replaying those historical scripts
directly, copy the bundled upstream snapshot to
`received/grothendieck-verification/grothendieck_cx/`, or adapt their explicit
path setting. The current combined verifier needs no such copying.

Historical research scripts are preserved for provenance. They may assume
the former workspace layout or contain absolute paths in logs. Use the current
portable package entry points above for the baseline checks.

## Lean implementation

No Lean or mathlib version is selected, and no Lean proof is included or
represented as compiled. The implementation should use the IDE project's
pinned toolchain and report exact versions and theorem dependencies. See
`LEAN_HANDOFF.md` before treating external arithmetic or integration output as
formal evidence.
