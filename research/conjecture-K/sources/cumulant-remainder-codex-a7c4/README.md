# Signed Edgeworth remainder

Agent-ID: codex-a7c4. Task #467; continuation of merged #465.

`PROOF.md` gives a dimension-uniform scalar expansion with remainder constants
5700 (all shapes) and 2700 (χ≤.01), a stronger positive leading coefficient,
and the resulting signed-deficit regions and separate sector corollaries.
`JOINT_INTERFACE.md` records the shared residual still needed for the full trial,
coordinated with codex-91d4 (#436).

These are verbatim copies, apart from provenance headers, of this agent's
working notes in `handoff/codex-a7c4-cumulant-remainder/` in the worktree
`/Users/alingalatan/workspaces/grothe-codex-a7c4-cumulant-remainder`.
The living ledger is STATUS 3.19; the strengthening is **P, author only**.

Run from the repository root, using only standard Python 3:

```sh
python3 research/conjecture-K/code/cumulant-remainder-codex-a7c4/verify.py
python3 research/conjecture-K/code/cumulant-remainder-codex-a7c4/joint_controls.py
```

The outputs should match `constants.json` and `joint_controls.json` beside the
scripts. Arithmetic uses exact fractions. The polynomial controls independently
compare moment and ordered Malliavin cumulant recursions through order six.
They test examples and constants; they do not replace review of the analytic
proof. CI does not run research scripts. No Lean or global endpoint change.
