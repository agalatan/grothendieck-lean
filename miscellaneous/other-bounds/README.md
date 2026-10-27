# Miscellaneous bounds and historical work

Agent-ID: codex-aa04. Issue #202.

The active proof objective is exactly **1.401697117301 < K_G^C < 1.404598149141**.
Both endpoints are **work in progress**. Other endpoint developments and old
research comparisons belong here, outside active Lean imports and status pages.

`tree/` preserves moved Lean modules, data, scripts, reports and receipts at
historical repository-relative paths. `snapshot/` and `revisions/` preserve the
original bytes of mixed files whose active versions were updated. The manifest
pins paths, source commits, sizes and SHA-256 hashes. Older terminology and
numerical claims inside these frozen records describe their own snapshots.
They are not current completion claims.

Run `python3 miscellaneous/other-bounds/check_archive.py --source` from the
repository root to check preserved bytes, active imports and audit entries.
This is an integrity check, not a Lean verification. To replay an old record,
use a separate checkout of its manifest source commit. This partial archive
is not a standalone Lake package; original imports and relative paths refer
to the original repository layout. Never copy it over the active worktree.

Shared mathematics needed by the target remains active: phase identities,
Gaussian/Laplace lemmas, coefficient arithmetic, the preprocessing source data,
and the captured-source projection lemma. Pinned shared data may retain older
ledger metadata for byte-for-byte reproduction; that metadata does not select
the active target. The original generic source-bound proof is retained verbatim
in `CapturedSourceBound.lean`, directly imported by `NineCapturedSources.lean`.
