# Node caps in Lean: roadmap and hand-over

This is the single entry point for anyone (Codex or Claude) continuing the node caps. Read `AGENTS.md` first.

## Goal

The lower bound is `lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401695322458 < K`, in the separate
target `GrotheCaps` (see the README, "Node caps"). `CapsRest` is the vertex caps of **rows 12–15** (t = 0.84, 0.845,
0.85, 0.855), plus any excluded-node caps of the other rows; the exclusion
lists are empty. Rows 0–11 and 16–18 have 60 existing native range facts.
Track A isolates their computation from the analytic proof layer. Ordinary CI
checks the committed source stamp. A changed stamp on a `ready/` delivery
automatically dispatches the heavy separate-target build and both axiom
reports on the droplet runner (`AGENTS.md` §4).
Removing `CapsRest` would make the lower bound unconditional, apart from
the pinned `native_decide` facts.

## Tracks

| track | owner (23 Oct) | branch | status file |
|---|---|---|---|
| A. Decouple the heavy facts from the lower chain | Codex | `codex/caps-decouple` | `docs/CAPS_STATUS.md` (computation split and source stamp) |
| B. Rows 12–15: why some localised pieces fail, and how to fix them | Claude worker | `work/caps-m` | `docs/CAPS_M_STATUS.md` on that branch |
| C. Rows 12–15: the Lean pipeline (piece data, range facts, wiring) | Claude worker | `claude/caps-m-pipeline` | `docs/CAPS_M_PIPELINE.md` on that branch |

If a track's owner is unavailable, continue from its status file. Each status file states what is done, what is
running where (droplet paths and `job.pid`), and the next step.

### A. Decoupling

Track A isolates the existing 60 `capRangeKK_j` facts for rows 0–11 and
16–18. The 15 heavy row modules import only `CapRangeDefs` and
`CapRecipeData`. Computable types, rational row/gate/chord data, numerical
tables and checker definitions are separate from their soundness proofs.
`CapRows` and `CapAssembly` remain in the default `Grothe` build; `CapHull`
is a compatibility import. The 15 unchanged `vertexCapsRowKK` assembly
proofs now live in `CapNodes`, alongside `CapsRest` and the final theorem.

The stamp boundary is 53 files, down from 140: 48 local computation
modules plus directly hashed `CapNodes.lean`, `GrotheCaps.lean`,
`lean-toolchain`, `lake-manifest.json` and `lakefile.toml`. The five extras'
imports are not traversed. Changes confined to the analytic or lower-proof
layer outside that set leave the computation hash unchanged. This is a
source-verification boundary, not a complete dependency or artifact manifest;
Lake and the default build check ordinary proof dependencies separately.

Deliver through `ready/`. A stale source stamp causes CI to dispatch the
heavy job, which builds both targets and checks both axiom reports before
committing `docs/CAPS_VERIFIED.txt` onto the ready branch and repeating its
check. The heavy job checks the final `CapNodes` assembly. A read-only digest
or unchanged theorem text is not a completed verification record; acceptance
requires that successful heavy CI run and its recorded stamp.

The scratch-branch comment probe in `Grothe/Lower/RowCheck.lean` leaves
the 53-file digest unchanged. A comment in `CapRangeDefs.lean` changes it;
the negative-control edit is restored and neither scratch edit is delivered.
No stamp is written from the probe. The configured default and caps CI checks
remain the acceptance gate for the merged candidate.

The rows 12–15 localized-piece predicates are separated too:
`CapCoverDefs` and `CapConstrDefs` contain the rational coverage and
constrained-node checks, while `CapCover`, `CapConstr` and `CapPieceNodes`
retain their semantic definitions and soundness proofs. `CapPieceRange`
has a 32-module computation-only closure; generated coverage/range modules
add only their own declaration and node data (34 modules).
Rows 12–15 remain in `CapsRest`; their generated facts are not yet part of
`GrotheCaps`. Tracks B/C and their data choices remain unchanged.

**Order:** merge A before C is wired into `CapNodes`.

### B. Why pieces fail (route M)

Rows 12–15 caps are *localised* caps: each node's fibre space is split into constrained pieces, covered up to the
symmetries S_c and S_- (`CapCover.lean`), and each piece is certified by an S-lemma quadratic (`CapConstr.lean`,
`CapPieceNodes.lean`). The source data is cert-0745d/e MIDCAPS, about 11,000 pieces. Generator:
`tools/gen_cap_pieces.py`.

**Diagnostic, 23 Oct** (`data/caps-m/` on `work/caps-m`):

| node | coverage | pieces passing | failing pieces |
|---|---|---|---|
| 14:150 | OK | 8 of 9 | piece 0 |
| 14:200 | OK | 31 of 42 | 0–6, 12, 18, 24, 30 (systematic) |
| 14:280 | — | — | running (coarse grid) |

The Lean price rule does not reproduce the stored caps (about 1e-12 float slack) on those pieces.

**Next steps:**
1. Find the margin and the class of each failure.
2. Test a fine grid or re-optimised prices.
3. Compute Δcap, the smallest cap Lean certifies, and whether the cover tolerates it.

The census in `NEXT_OBLIGATION.md` (in `grothe-codex-main-recovery`) shows the cover is flat near its top, so raising
caps is risky.

**Decision for the user:**
- (i) port with per-class fixes;
- (ii) re-run the piece search with Lean's exact price rule and a margin;
- (iii) accept raised caps and re-check the lower cover.

### C. Lean pipeline for rows 12–15

This does not depend on B's choice of fix. B's choice only changes the data.

1. **Generator:** extend `tools/gen_cap_pieces.py` so that it writes, per node, a piece-data module and
   single-threaded `native_decide` range facts over pieces, in separate modules (as `tools/gen_cap_nodes.py` does
   for rows 0–11). Inputs live in `data/caps-m/` (never only in a scratchpad or `/tmp`).
2. **Soundness wrapper:** a theorem that turns "piece range facts + coverage fact" into the node cap for a node of
   rows 12–15, from `CapConstr`, `CapCover` and `CapPieceNodes`.
3. **Wiring:** turn `CapsRest` into "caps of rows 12–15 at the nodes not yet certified", so that every certified node
   of rows 12–15 shrinks the hypothesis. Do the final wiring after A has merged.

**Test:** the 8 passing pieces of 14:150 and the 31 passing pieces of 14:200, as real native facts.

## Rules that matter here

- **No `Task.spawn`** inside `native_decide` code; CI rejects it. Parallelise with separate modules.
- **Droplet:**
  - One heavy build at a time. Check with `uptime` and `pgrep -a lean` first.
  - Start every job as a process group (`AGENTS.md` §5) and stop it with `kill -- -PGID`.
  - Never kill another agent's job.
  - Keep at least 3 GB free.
- **Generated files** are reproducible from `data/` byte for byte; never hand-edit them.
- **Verifying `GrotheCaps`:**
  ```sh
  lake build GrotheCaps && lake env lean scratch/AxiomsCaps.lean | python3 scripts/check_axioms.py --caps
  ```
  This runs automatically on the droplet's CI runner (job `heavy`, modes `warm`/`caps`). In `caps` mode,
  after both targets and reports pass, the runner writes the source stamp with
  `scripts/caps_stamp.py --write "<run evidence>"`, commits it onto the ready branch and repeats its check.
  Do not launch a separate manual droplet verification for this delivery.
- **Delivery:** through `ready/<agent>-<topic>` (`AGENTS.md` §3). A change to the caps closure makes CI dispatch the
  rebuild to the droplet automatically (hours) and re-check afterwards.
