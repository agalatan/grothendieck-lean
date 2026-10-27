# Node caps in Lean: roadmap and hand-over

This is the single entry point for anyone (Codex or Claude) continuing the node caps. Read `AGENTS.md` first.

## Goal

The lower bound is `lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401697117301 < K`, in the active `Grothe` build. `CapsRest` is the vertex caps of **rows 12–15** (t = 0.84, 0.845,
0.85, 0.855), plus any excluded-node caps of the other rows; the exclusion
lists are empty. Rows 0–11 and 16–18 have 60 existing native range facts.
Track A isolates their computation from the analytic proof layer. CI replays
the verified build when a cache for the current computation sources exists;
otherwise the check runs on the droplet's runner (`AGENTS.md` §8).
The lower endpoint is work in progress until `CapsRest` is proved in Lean
and the final assembled tree passes CI. These are our numerical obligations,
not accepted external inputs.

## Tracks

| track | owner (23 Oct) | branch | status file |
|---|---|---|---|
| A. Decouple the heavy facts from the lower chain | Codex | `codex/caps-decouple` | `docs/CAPS_STATUS.md` (computation split and verified build cache) |
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
That theorem composes the same refined-cover result as the default target,
using `nodeCaps_of_vertexCaps (vertexCaps_of_capsRest h)`; its endpoint is
`RefinedCoverData.refinedL`. `NodeCaps.lean` holds the common cap definition
without importing the Gaussian reduction.

The current cache provenance boundary is computed by `scripts/caps_stamp.py`.
Its direct extras and computation imports are described in `CAPS_STATUS.md`. Changes confined
to the analytic or lower-proof layer outside that set leave the computation
hash unchanged. This is not a complete dependency or artifact manifest;
Lake checks ordinary proof dependencies, while the explicit `GrotheCaps`
replay and caps audit check final assembly against the current proof layer.

The numerical checker is the independent precompiled `GrotheCapsKernel`
library, retaining the `GrotheKernel` Lean namespace. Its root is hashed
because every importer loads the library's shared object. Other checkers
remain outside that library.

The combined split and workflow change uses one runner `caps` build of
the combined candidate. The runner builds both targets and checks both
axiom reports before marking and saving its verified branch cache. Ordinary
CI then replays that cache. This workflow delivery uses a pull request after
the combined branch is green; the user merges it. The master `warm` run
reuses the runner's persistent build and refreshes the canonical master
cache. Do not run a separate manual droplet verification.

The scratch-branch comment probe in `Grothe/LowerAnalytic/Bridge.lean` leaves
the 54-file digest unchanged. A comment in `CapRangeDefs.lean` changes it;
the negative-control edit is restored and neither scratch edit is delivered.
No marker is written from the probe. A read-only digest or unchanged theorem
text is not verification; successful runner and ordinary CI checks remain
the acceptance evidence.

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
  - Start every job as a process group (`AGENTS.md` §12) and stop it with `kill -- -PGID`.
  - Never kill another agent's job.
  - Keep at least 3 GB free.
- **Generated files** are reproducible from `data/` byte for byte; never hand-edit them.
- **Verifying the node caps:**
  ```sh
  lake build Grothe && lake env lean scratch/Axioms.lean | python3 scripts/check_axioms.py
  ```
  This runs automatically: when the caps changed, CI runs the check on the droplet's runner. After the build and
  the report pass, it records `.lake/build/caps-closure.sha` with `scripts/caps_stamp.py --mark-cache` and saves
  the verified build cache. Never run it on the laptop (about 21 CPU-hours).
  Do not launch a separate manual droplet verification.
- **Delivery:** normally through `ready/<agent>-<topic>` (`AGENTS.md` §7); workflow changes use a pull request
  after the combined branch is green, merged by the user (§9). Changed cap sources route the check to the runner
  automatically, and later checks, master's included, reuse that verified build.
