# Node caps in Lean: roadmap and hand-over

This is the single entry point for anyone (Codex or Claude) continuing the node caps. Read `AGENTS.md` first.

## Goal

The lower bound is `lower_bound_of_capsRest : CapsRest → IsGrothendieckBound K → 1.401695322458 < K`, in the separate
target `GrotheCaps` (see the README, "Node caps"). `CapsRest` is the vertex caps of **rows 12–15** (t = 0.84, 0.845,
0.85, 0.855). Rows 0–11 and 16–18 are certified: 60 native range facts, built by the droplet's CI runner
and replayed by CI from the verified build cache (`.lake/build/caps-closure.sha`, see `AGENTS.md` §4). Removing `CapsRest` makes the lower bound unconditional, apart from the 77 pinned native
facts.

## Tracks

| track | owner (23 Oct) | branch | status file |
|---|---|---|---|
| A. Decouple the heavy facts from the lower chain | Codex | `codex/caps-decouple` | the prompt is in the user's chat; branch commit 38b64a9 |
| B. Rows 12–15: why some localised pieces fail, and how to fix them | Claude worker | `work/caps-m` | `docs/CAPS_M_STATUS.md` on that branch |
| C. Rows 12–15: the Lean pipeline (piece data, range facts, wiring) | Claude worker | `claude/caps-m-pipeline` | `docs/CAPS_M_PIPELINE.md` on that branch |

If a track's owner is unavailable, continue from its status file. Each status file states what is done, what is
running where (droplet paths and `job.pid`), and the next step.

### A. Decoupling

The 15 `CapRowKK` modules import CapRows → CapHull → Reduction → the whole lower proof. So any lower-chain edit forces
the 4-hour droplet rebuild and invalidates the stamp. The fix:

- **Computation layer:** `rangeOK`, `nodeCheck`, chords, recipes and `rowData`, with no proofs.
- **Assembly layer:** soundness, `NodeCaps` and `lower_bound_of_capsRest`.

**Acceptance:**
- the stamp closure shrinks to the checker and data;
- a comment-only edit in `Grothe/Lower/RowCheck.lean` keeps `caps_stamp.py --check` green;
- one new droplet verification and stamp.

**Order:** do A before C is wired into `CapNodes`.

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
  This now runs automatically on the droplet's CI runner (job `heavy`, modes `warm`/`caps`), which marks and saves the
  verified build cache; no manual stamp.
- **Delivery:** through `ready/<agent>-<topic>` (`AGENTS.md` §3). A change to the caps closure makes CI dispatch the
  rebuild to the droplet automatically (hours) and re-check afterwards.
