# Archived upper-bound variants

Agent-ID: codex-aa04. User-directed archive, tracked in issue #202.

The active repository focuses on the conditional target
**$K_G^{\mathbb C}<1.404598149141$**. This folder preserves the other upper-bound
developments without importing them into the current `Grothe` build.

## Contents and proof status at the snapshot

| Development | Preserved status |
|---|---|
| Haagerup canonical endpoint (1.404909132791) | Unconditional Lean theorem, with kernel-checked arithmetic and historical CI receipts. |
| HJM mixture and scalar-tail refinements | Analytic foundations, finite certificates and conditional assembly; the actual origin head table and final tail bindings were unfinished. |
| Relaxed fourteen-, thirteen- and twelve-band variants | Conditional weaker endpoints; their Gaussian and energy-table assumptions were not discharged. |
| Earlier comparison experiments | Historical scripts and documentation, with their original scope and numerical assumptions. |

Archiving is not proof completion, retraction of the accepted theorems, or a new
verification of the historical receipts. In particular, it does not prove the
active target unconditionally.

`tree/` contains moved files at their original repository-relative paths:
Lean modules, exact data, generators, tests, standalone proof documents and
verification records. `snapshot/` preserves the original versions of shared
documents, configuration, roots, audit policies and scripts that were edited
for the migration. Original bytes, including generated sources and receipts,
are unchanged. `manifest.json` records every file's original path, size and
SHA-256 hash, as well as the source commit and retained shared dependencies.
`retired-audit-entries.json` records the declarations removed from active reports.

The source snapshot is commit
`8efcb93e` (the full hash is recorded in `manifest.json`). Historical receipts
may refer to earlier commits; their stated scope remains unchanged.

## Inspecting and replaying

From the current repository root, check archive integrity and the active import
boundary without invoking Lean:

```sh
python3 archive/weaker-upper-bounds/check_archive.py --source
```

The files retain their original Lean module names and generator paths. This is
a source archive, not an independent Lake package: shared Gaussian and interval
dependencies remain in the active repository and can evolve. For an exact
historical replay, create a separate checkout of the pinned source commit:

```sh
git worktree add --detach /absolute/path/to/upper-archive-replay \
  8efcb93e
```

Run the preserved documentation's commands from that checkout, subject to the
repository's build and compute rules. Do not copy archived files over a live
worktree. Original relative links and commands inside preserved documents refer
to the historical repository layout, not to this folder's partial `tree/`.

## Shared mathematics retained in the active tree

The sharp proof still uses `Grothe.UpperChaos.Realise2`, which imports the Gaussian
phase identity, and the actual Gaussian integral work imports the phase-Laplace
representation and its Fubini and boundedness lemmas. Those modules, their
dependencies, and the general phase-response geometry remain active. They are
shared mathematics, not alternative numerical upper-bound endpoints.

The lower-bound development is unaffected. The active upper proof still needs
its fourteen finite Gaussian band estimates and the energy-table discrepancy
bound `6847009/(5·10^17)`.

Shared preprocessing data and generators remain active where the sharp proof uses
them. Their byte-pinned historical ledger fields are preserved for reproducibility;
they do not select the active endpoint. Copies are also included in `snapshot/`.

`CapturedSourceBound.lean` retains the generic disjoint-projection source bound
verbatim from the archived second-band module. Fresh master uses it in
`NineCapturedSources.lean`; that module now imports this shared lemma directly.
