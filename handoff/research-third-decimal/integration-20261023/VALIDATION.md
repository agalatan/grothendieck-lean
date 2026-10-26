# Integration validation, 23 October 2026

Integration base: GitHub master `6a869c83bdd8a59661d6664b37ac1b5a2770c2a0`.
Neither existing endpoint nor an input in the cap-build closure is changed.
The shared main checkout was not used. Historical logs elsewhere in this
research archive describe their own snapshots.

## Lean

Both new `Grothe/Research/` modules were typechecked with Lean 4.34.1 and
`-DwarningAsError=true` in an owned droplet tmpfs, using read-only cached
Mathlib imports. See `lean-coverage.log`. All 13 public declarations use only
`propext`, `Classical.choice`, `Quot.sound`, and all are now required by the
central registry. After integration, this check passes:

```sh
python3 scripts/check_axioms.py --research < handoff/research-third-decimal/integration-20261023/lean-coverage.log
```

The default library, merged import graph and complete central axiom report
are delegated to Lean CI. No full local library build is claimed. No new
native facts are introduced. The separate `GrotheCaps` stamp check still
warns that no verification stamp has been recorded, as on the integration
base; this work does not claim to have built that heavy target.

## Saved exact replays

All 242 entries in `INPUTS.json` were verified against their original
SHA-256 values. From a clean Git export, the full saved suite passes all 13
checks, including the seven separate scalar countermodels:

```sh
python3 -I tools/research_replay.py --full --out /tmp/research-replays.json
python3 -I tools/rankone_source_path_tests.py
```

See `fresh-checkout-replays.json`. The second command passes 22 path,
rejection, digest and isolated-import checks. The source resolver maps known
legacy provenance paths into the executing checkout and never opens an old
checkout. Original source digest checks are preserved.

The following three commands also passed in the clean export; saved outputs
are `localized-optimized.json`, `localized-transport.json` and
`localized-converted.json` in this directory. Transport checks 27 exact
cross-implementation fixtures; the converter rechecks all nine pieces.

```sh
python3 -I tools/rankone_replay_optimize_localized.py handoff/research-third-decimal/rank-one-certification-20261023/replay/localized-row0855-s027-fminus003105.json --out /tmp/localized-optimized.json
python3 -I tools/rankone_replay_verify_transport.py --raw handoff/research-third-decimal/rank-one-certification-20261023/replay/localized-row0855-s027-fminus003105.json --bank handoff/research-third-decimal/rank-one-certification-20261023/analytic/localized-m15-r050.json --out /tmp/localized-transport.json
python3 -I tools/rankone_analytic_localized_convert.py handoff/research-third-decimal/rank-one-certification-20261023/replay/localized-row0855-s027-fminus003105.json --out /tmp/localized-converted.json
```

The numerical inputs used by the incumbent comparison remain unchanged on
the integration base:

- `Grothe/Upper/Data.lean`: `9d8d8742bcec1602da162595a8d7fdfedbf2d8d5393b5f173456434783c1fe50`.
- `Grothe/Upper/PolynomialBridge.lean`: `27e4a5b3c0cc30222d9d0d064a7c49ec37ce5d2569303df7d3f4a8a9a6073d04`.

These checks replay frozen exact data; they do not regenerate Gaussian
integrals, establish an all-dimensional cover or prove a new endpoint.
Analytic premises are retained in the linked research notes. The upstream
genuine cubic obstruction now excludes the old `1.402` target at unchanged
`epsilon=149/200`, so a global continuation must retune or change the witness.

## Documentation

README, the Lean inventory and `docs/overview.tex` describe the added proof
coverage. `OVERVIEW.pdf` was rebuilt successfully with pdflatex, with resolved
references and no overfull boxes, and its rendered pages were visually checked.
`git diff --check origin/master` passes, with only the documented whitespace
exceptions for hash-pinned inherited replay inputs.
