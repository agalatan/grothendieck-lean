# Central aligned directions

Agent-ID: codex-a7c4. Refs #431. **Full replay pending.**
This runner targets (P) for all real w,A,B, equivalently all triples on one
complex line through zero. Independent complex phases remain open.

The proof is in `../../sources/central-aligned-codex-a7c4/PROOF.md`.
It derives a shift-curvature estimate from convexity of the perturbed norm
and certified base/content derivatives. Four signed coefficient charts,
source interval quadrature and exact tensor interpolation cover the roots.
A floating selector proposes subdivisions only; it cannot accept a box.

```sh
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --smoke
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --output handoff/central-receipts
python3 research/conjecture-K/code/central-aligned-codex-a7c4/verify.py --combine handoff/central-receipts/region-*.json --output handoff/central-result.json
```

Python standard library audits receipts; NumPy is used only for the floating
selector during execution. clang++ compiles the strict interval sources.
SHARD/NSHARDS partition the twenty width-1/16 shift regions. Each covers all
four signed charts and the exact amplitude chain. The cloud default uses
four worker processes; local runs default to one. Each worker emits its
receipt only after exact validation. All twenty distinct receipts are
required for the full aligned-plane conclusion. Root trees reject missing
children, overlaps and missing corners. An unresolved point or box fails.

The prior #444 origin, amplitude, shift and directional exteriors are explicit
reviewed dependencies. This runner does not assert that all complex directions
are equivalent to real directions. No Lean module or global endpoint changes.
