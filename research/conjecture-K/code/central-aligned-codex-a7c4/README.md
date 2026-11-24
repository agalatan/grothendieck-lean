# Central aligned directions

Agent-ID: codex-a7c4. Refs #431. **P + C**: the full cover run was audited by claude-b9ee (`../../STATUS.md` 7.4.14).
This runner targets (P) for all real w,A,B, equivalently all triples on one
complex line through zero. Independent complex phases remain open.

The proof is in `../../sources/central-aligned-codex-a7c4/PROOF.md`.
It derives a shift-curvature estimate from convexity of the perturbed norm
and certified base/content derivatives. Four signed coefficient charts,
source interval quadrature and exact tensor interpolation cover the roots.
Midpoint quadrature encloses the exact source midpoint; the adjacent-float
control checks the case where that midpoint is not representable.
A floating selector proposes subdivisions only; it cannot accept a box.

```sh
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --smoke
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --output handoff/central-receipts
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --combine handoff/central-receipts/region-*.json --output handoff/central-result.json
python3 research/conjecture-K/code/central-aligned-codex-a7c4/test_receipts.py handoff/central-receipts
python3 research/conjecture-K/code/central-aligned-codex-a7c4/phase_radius.py handoff/central-receipts --output handoff/central-phase-radius.json
```

Large receipts are stored as small plain JSON row chunks, each at most 200 KB.
The storage adapter preserves the exact original bytes, checks all chunk hashes,
and then runs the mathematical auditor on the restored receipts. An empty
destination is required:

```sh
python3 research/conjecture-K/code/central-aligned-codex-a7c4/archive_receipts.py pack handoff/central-receipts handoff/central-archive
python3 research/conjecture-K/code/central-aligned-codex-a7c4/archive_receipts.py restore handoff/central-archive handoff/central-restored
```

These audits check receipt completeness and arithmetic. Only a fresh `verify.py`
run recomputes the outward source integrals.

Python standard library audits receipts; NumPy is used only for the floating
selector during execution. clang++ compiles the strict interval sources.
SHARD/NSHARDS partition the twenty width-1/16 shift regions. Each covers all
four signed charts and the exact amplitude chain. The cloud default uses
four worker processes; local runs default to one. Curvature is computed
once per shift region; chart jobs then share this immutable input, so the
two difficult low-shift regions can use all four workers. Each worker emits
a chart receipt only after exact validation. The assembly requires all four
distinct charts and deduplicates their common corners by taking a valid
minimum. Chart receipts cannot be accepted as full regions. All twenty distinct receipts are
required for the full aligned-plane conclusion. Root trees reject missing
children, overlaps and missing corners. An unresolved point or box fails.

The prior #444 origin, amplitude, shift and directional exteriors are explicit
reviewed dependencies. This runner does not assert that all complex directions
are equivalent to real directions. No Lean module or global endpoint changes.
