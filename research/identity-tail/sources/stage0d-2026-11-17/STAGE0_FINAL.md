<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/STAGE0_FINAL.md (17 November 2026, 01:55 Bucharest time: the work log of stage 0 to the end of stage 0d); the certificate worker of claude-b9ee. Only this line was added. -->
# Stage 0 to completion for the target 5000/7009 (K > 1.4018): pure-integer certificate (work log and status)

claude-b9ee worker, started 16 Nov 2026 04:40 Bucharest. Decision of the coordinator: **GO for 1.4018** on the identity-tail route
with (ε, ν) = (191/250, 47/2000), i.e. ε̂ = 25/31, ν̂ = 47/1953. Work folder on big: `/root/claude-b9ee-capsnu2`. Results are copied
back to this folder. No repository edits.

Labels: **P** proved, **C** exact computation (rational / outward interval), **N** floating point.

## Summary (18:40; read first)

**The plateau t ∈ [0.73, 0.9] certifies below 5000/7009. The rows below t ≈ 0.72 do not, so the full certificate is NO-GO until
those rows are redone.**

**Plateau (C, with N predictions).**
- Exact per-row certificates (verify_cert --rows PASS):

  | row | B | margin |
  |---|---|---|
  | 0.88 | 0.713251 | 1.2·10⁻⁴ |
  | 0.885 | 0.713248 | 1.2·10⁻⁴ |
  | 0.74 | 0.713210 | 1.6·10⁻⁴ |
  | 0.845 (old table) | 0.713302 | 6.8·10⁻⁵ |
  | 0.85 (old table) | 0.713282 | 8.9·10⁻⁵ |

- The improved final tables predict 0.7132310 (0.845), 0.7132258 (0.85) and 0.7132318 (0.83). With the measured Stein offset
  (+5.4 to +5.7·10⁻⁵, stable) that is **B ≈ 0.71328–0.71329 for the binding rows, margin 6–8·10⁻⁵**.
- Row 0.84 (0.713473) sits above the target, but the 0.83/0.835/0.845 mixtures should cover t ≈ 0.84 at about 0.71332 (N).
- Fine runs of 0.83, 0.835, 0.845 and 0.85 are running on big. The envelope over [0.73, 0.9] can be assembled when they end.

**Small-t rows (C): rows 0.4 (B = 0.7314), 0.6 (0.71495) and 0.78 (0.71385) certify above the target; 0.5 probably will too (partial maximum 0.7085 before pruning), and 0.7 is borderline (partial 0.7071; pruning lowered other rows by 1.5–6·10⁻³).**
- Their fibre maximisers break the odd symmetry: Ψ_true is up to 2.6·10⁻² above the symmetric maximum.
- Every cap method built around the symmetric anchor stays 1–3·10⁻² above Ψ_true, which uses up their 2–3·10⁻² of slack.
- **Fix needed:** re-choose those rows so that their fibre maximiser stays symmetric. They have the slack for it, and their caps then
  cost 30 CPU-min per row.

**Other results.**
- Exact anchored generator with the proved coefficient and the exact centre.
- The kink check: harmless, +4·10⁻⁷.
- Far-region route-M machinery: ring split, ring boxes, corner delegation, per-piece price variance, block-1 base variance.
- Independent exact replay: 956/956 pieces of a whole binding table.
- **Lean cost of the 22 final tables: about 490 vCPU-h (320 with interpreter savings).**
- **ρ = Lean's 0.973612157 everywhere; a smaller ρ changes nothing at the binding point.**

## Status (checkpoints, newest last)

### 04:50 — exact anchored node-cap generator with the proved coefficient (C)

`nucert.py` is the production version of the stage-0 `capnu_cert.py`. Per cell it uses:
- γ = the largest double ≤ γ*(R_cell), verified by the exact cell inequality;
- the centre c₀, c₁ computed exactly from the exact dyadic prices and ν̂, then enclosed outward (this fixes the stage-0 defect);
- γ = 0 cells checked for d₂ > 0 and d₂d₃ > ν̂².

On row t = 0.845 the caps are certified exactly:

| u | cap − Ψ | time | γ = 0 cells |
|---|---|---|---|
| 0 | +3.69·10⁻⁶ | 28 s | 0 |
| 0.1 | +3.48·10⁻⁶ | 66 s | 683 |
| 0.2 | +3.14·10⁻⁶ | 66 s | 312 |
| 0.25 | +3.00·10⁻⁶ | 67 s | 242 |

All have positive LDL pivots and Loewner radii of about 2·10⁻¹²; γ = 0 cells are under 0.2 %.

### 05:20 — the pipeline and its plan

**Certificate format.** The certificate is the per-row Stein envelope of cert-0745e:
- `manifest.json`, `row_<t>.json` and `envelope.json`, checked exactly by `handoff/lower-stein/verify_cert.py`;
- the node caps are certified separately; the Lean side certifies them too (`NodeCaps`);
- `tools/gen_lower_data.py` reads this format in archive mode, so it is the input the stage-2 Lean build needs.

**Why this format suffices.** In hat units (ε → ε̂ = 25/31) every formula of the verifier holds unchanged, including the crude row
C = ε̂ρ², and B = (1 − ν)B̂ + ν. The target is **B̂ ≤ 1381511/1955511 = 0.7064706**. The refined cover with mixtures (Lean today) is
not needed if the per-row envelope already clears the target. At ε = 149/200 the envelope was 2.2·10⁻⁵ above the refined cover;
here the margin is 1.6·10⁻⁴.

**Lesson from the aborted ε = 187/250 rebuild (`handoff/lower-stein/eps0748/PROGRESS.md`):**
- the row optimiser's spline potential table smoothed a kink of Ψ, and the optimised rows exploited it;
- global-piece caps were loose by up to 7·10⁻³ on s ∈ [0.2, 0.6).

So:
- (a) `kinkcheck.py` compares the stage-0 spline table with the true Ψ on a fine grid, on five plateau rows (running);
- (b) every near-binding row gets localised (route-M) caps in the one- and two-direction range.

**Rows (C, exact gates).** `rows_exact.py` turns the stage-0 rows into the certificate layout (`rows_theta_v2.json`, 25 rows,
t = 0.12–0.9). The rows 0.865, 0.875, 0.895 are running.
- θ = 15 exact doubles. δ is the double just below ε̂ that keeps N = E − diag(ε̂ − δ, 0, 0) ≻ 0: the optimiser leaves E with a Schur
  margin of about 10⁻⁸.
- κ = floor₁₀⁻⁹(1/δ − bᵀN⁻¹b) and smax = the Lean Lipschitz rule. Both reproduce cert-0745e row 0.845 exactly (self-test).
- The s-unit coupling a_s = (1 + b₁, b₂, b₃) is made of exact doubles (Sterbenz).
- κδ² equals the optimiser's price to 10⁻⁸ on the plateau.

**Node caps (C).** One driver, `capsrow.py`, picks the method per vertex node in s units:
- anchored, `nucert.py`;
- route M in one or two directions, `routem.py`: adaptive 256/1024 cells, constrained anchors for slabs, boxes for loose far
  slabs;
- one global variance-priced piece, `routem.global_node`, for three directions, block 0 and the far nodes.

Table nodes between vertices take the convex chord of the certified neighbours (valid by convexity, as `CapChords` in Lean).

**Stein layer (delegated).** A worker ports the eps0748 stage-3 toolchain to ε̂ in `/root/claude-b9ee-capsnu2/stein/`. It dry-runs
rows 0.845, 0.84, 0.85 and 0.83 on provisional (float) tables first.

### 05:42 — the kink check, a 10–20× faster generator, the production run

**Kink check (N).** `kinkcheck.py` compares the stage-0 spline table (`lawcap.tabulate`: a Hermite spline through 57 geometric nodes)
with the true Ψ (multi-start maximisers, du = 0.01, u ≤ 1.6).

The true Ψ has a kink at u ≈ 0.83–0.86. There block 0 turns indefinite and a second fibre branch takes over. The second difference
jumps from about 2 to 7–11 there. The spline smooths the kink, which is exactly the ε = 187/250 failure mode:

| t | spline − true | at u |
|---|---|---|
| 0.84 | −1.02·10⁻³ … +1.9·10⁻⁴ | 0.87 / 0.83 |
| 0.845 | −8.2·10⁻⁴ … +2.2·10⁻⁴ | 0.87 / 0.83 |
| 0.85 | −1.05·10⁻³ … +2.0·10⁻⁴ | 0.87 / 0.83 |
| 0.86 | −5.7·10⁻⁴ … +4.7·10⁻⁴ | 0.88 / 0.84 |
| 0.88 | −3·10⁻⁵ … +8.8·10⁻⁴ | 0.77 / 0.86 |

Away from the kink the spline agrees with Ψ to ≤ 6·10⁻⁵ (u ≈ 0.77) and to 10⁻⁷ elsewhere.

**Effect on the rows: none that matters (N).** `lawsocp_true.py` re-solves the law relaxation of stage 0c (`lawsocp_table.py`, mode
psi) with Ψ_true = PCHIP through the kink-check values, and the spline beyond u = 1.6:

| t | relaxed, spline | relaxed, true Ψ | effect | Gaussian effect |
|---|---|---|---|---|
| 0.845 | 0.7131979 | 0.7131983 | +4.0·10⁻⁷ | −9·10⁻⁹ |
| 0.85 | 0.7131896 | 0.7131899 | +3.5·10⁻⁷ | +7·10⁻⁸ |

At the binding (x, τ) ≈ (0.45, 0.27), the kink sits at √U ≈ 3.1. Neither the Gaussian nor the worst law weights it. **No row
re-optimisation is needed.** The certificate itself uses certified caps of the true Ψ at every node, so the kink cannot hide in it.

**Rows (C).** `rows_theta_v3.json` has 28 rows, all with exact gates: the 25 of v2 (byte-identical) plus 0.865, 0.875 and 0.895,
from the run_rows jobs Y and Z. Their Gaussian values are 0.7131264, 0.7131254 and 0.6941207.

**Generator speed.** Two fixes:
- The per-cell dual prices took 95 of every 97 s of a piece (`capnu.dual_prices`: 60 global Newton sweeps of 30 line-search halvings
  over all 4·10⁵ cells). `nucells.dual_prices_fast` iterates only the cells that have not converged. It takes 1.3 s and the
  objective changes by ≤ 6·10⁻¹⁴. Prices are a heuristic input, and any prices with d₂ > 0, d₂d₃ > ν̂² give a valid majorant, which
  is checked outward per cell.
- The maximiser now runs its multi-start on a coarse functional (120 × 48), polishes on the fine one, and warm-starts from the
  previous node. 79 s → about 15 s. Box anchors take a coarse BFGS plus a 60-step fine polish.

Unit costs on loaded big:

| piece or node | time |
|---|---|
| anchored node | 6–18 s |
| route-M piece, 256 cells | 4–10 s |
| one-direction node | 50–80 s |
| two-direction node (42+ pieces) | ≈ 6–9 min |
| global variance-priced node | 40–140 s |

**Fixes found on the way.**
- Exact S-lemma values can exceed Python's 4300-digit `int → str` limit. The piece quadratics are now rounded UP at 10⁻²⁴, so
  q_r(s) ≥ q(s) for s ≥ 0.
- A two-direction box that closes above target even at 1024 cells is bisected once along its wider τ interval. Each half gets
  its own constrained maximiser, and the halves replace the box only if both close lower.

**Calibration on row 0.845 (C).** Cap − Ψ at the anchors:

| s range | method | cap − Ψ |
|---|---|---|
| [0, 0.2] | anchored | 2.9–3.4·10⁻⁶ |
| [0.21, 0.26] | one-direction route M | 4.9–5.9·10⁻⁶ |
| first two-direction pieces | centre boxes | 4.5–1.2·10⁻⁵ |
| | outer boxes before bisection | up to 4.6·10⁻⁵ |
| [0.5, 0.54] (three directions or block 0) | global variance-priced | 3.2–4.3·10⁻³ |
| [1.05, 6] (all blocks definite again) | **anchored** | 1.1–5.6·10⁻⁶ |

Between anchors a certified quadratic is **not** tight: about 1.7·10⁻⁴ at 0.0125 from its anchor (`gapprof.py`), no better
than the chord. So every table node is certified directly, as in cert-0745e.

**Production run (started 05:38).** 321 chunks over 28 rows, queue `capq.sh` with ≤ 22 jobs and the load guard. Node layout:

| rows | 0.005 on | 0.01 on | far nodes |
|---|---|---|---|
| plateau (13: 0.83–0.885) | [0, 0.335] (anchored, one-direction route M) | [0.34, 1] (two-direction route M, global beyond) | 1.05–2 at 0.05, 2.1–3 at 0.1, 3.5–6 at 0.5 |
| 0.8, 0.82 | — | [0, 1], mode auto | as plateau |
| the other 13 | — | [0, 1], anchored where possible, else global (mode `ag`) | as plateau |

Estimate: about 90 CPU-h, about 4 h wall.

### 06:00 — the real Lean cost of a cap: about 7× the stage-0c unit cost (C timings, N projection)

A worker built a scratch copy of today's cap kernel outside the repository: `/Users/alingalatan/workspaces/grothe-capsnu-scratch-b9ee`,
Mathlib-free, with `GrotheCapsKernel` precompiled as in CI. It added a ν-variant kernel `CapsKNu/CapCheckNu.lean`: 146 code lines with
exact g (floor of the cell inequality), seven `qI` weights and the |L|², |L|⁴ and |L|²uⱼ entries.

**Checks.**
- The copy reproduces today's `nodeOK` (row index 8, nodes 50, 56 and 150) and the exact `R12x240_0` fact under `native_decide`.
- At ν = 0 the ν-kernel gives the same verdict, the same g and the same matrix to 4·10⁻¹⁶.

**Timings** (laptop, CPU-s, interpreter loading the precompiled plugin as CI does):

| unit | today | ν | ratio |
|---|---|---|---|
| anchored node, 400×128 | 5.5 | 6.4 | 1.16 |
| anchored node, 1600×256 | 23.6 | 30.0 | 1.28 |
| anchored node, 1600×1024 | 82 | 109 | 1.33 |
| piece, 1600×256 | 45.3 | 53.3 | 1.18 |

The extra time is in `matI`: 7 weights and 18 angular-harmonic sums instead of 13.

**Calibration to CI.** The 5 Nov big/mega shard logs give k = CI vCPU-s ÷ laptop CPU-s ≈ 2.2–2.7.
- Per-piece cost in CI: **≈ 150–160 vCPU-s, not the 20 s that stage 0c assumed** (from 95 h / 16,719 pieces). Today's real cost
  per piece is higher: piece modules rebuild all 5 grids' tables, and `pieceNc` rebuilds `pieceN` for each of its 169 entries.
- With today's module layout, the ν certificate costs **T ≈ 75·V + 160·P vCPU-s** (±15 %) at 1600×256:
  - V = anchored nodes, P = localised or global pieces;
  - at 1600×1024: about ×3.6 for nodes and ×2.3 for pieces.
- Two interpreter-only savings measured by the worker bring a piece to about 100 vCPU-s:
  - hoisting `pieceN` out of `pieceNc`: 14.25 → 0.135 s;
  - building only the piece's own grid.

**Grids.** Lean's angular count N is the full circle.
- `nucert` anchored nodes use 256 cells per quarter, i.e. the Lean grid 1600×1024.
- Route-M and global pieces use 256 cells on the full circle (1600×256), or 1024 when a piece is retried.
- A 64-per-quarter variant of `nucert` (Lean 1600×256: ¼ of the Python and Lean time) is being tested for tightness.

### 06:10 — predicted value of the certified table, anchored grid, route M with block-0/1 variance

**Prediction for row 0.845 with the certified gap profile (N).**

Setup: `lawsocp_table.py`, mode var, gap file `s0c/cvs_model_0.845.json`. The gaps are the certified cap − Ψ_true (kink-check Ψ) at
the anchors computed so far:

| s range | method | gap |
|---|---|---|
| [0, 0.2] | anchored | 3·10⁻⁶ |
| [0.21, 0.33] | one-direction route M | 5–14·10⁻⁶ |
| [0.34, 0.49] | two-direction route M | 1.5·10⁻⁵, modelled from the first exact nodes (1.2–1.4·10⁻⁵) |
| [0.5, 0.62] | global | 3.2–6.4·10⁻³, certified |
| [0.64, 1.0] | assumed | 7·10⁻³ flat |
| ≥ 1.05 | anchored | 10⁻⁶ |

Result:
- relaxed value with Ψ: 0.7131979;
- **relaxed value with the certified-table model: 0.7132568**, a table effect of +5.9·10⁻⁵. The worst law moves to
  (x, τ) = (0.5, 0.2965).
- The global caps on s ∈ [0.5, 1] account for nearly all of it.
- Margin to 5000/7009: 1.1·10⁻⁴. Chord errors and the Stein discretisation should take about 1–3·10⁻⁵ of it.
- The expected certified value is **B ≈ 0.71327–0.71329 (K ≈ 1.4020)**: 1.4018 holds, and 1.402 (500/701 = 0.7132668) does not
  with this table.

**Route M with node-wide price variance in blocks 0/1 (`routem_node(allow_var=True)`, test only).**

| s | blocks indefinite | route M with variance (best level) | global |
|---|---|---|---|
| 0.52 | 1 | 2.7·10⁻⁴ at level 0.1 (0.06 does not certify) | 3.5·10⁻³ |
| 0.6 | 0 and 1 | 4.7·10⁻³ at level 0.15 | 5.9·10⁻³ |

It helps only where block 0 is still definite. Each node would cost a full two-direction layout: about 45 pieces, i.e. +40
pieces × 160 vCPU-s in Lean per node. **Not used for 1.4018.** It is a candidate for 1.402 together with the three-direction port.

**Anchored grid: 64 cells per quarter (Lean 1600×256) instead of 256 (1600×1024).**

| s | 256 per quarter | 64 per quarter |
|---|---|---|
| 0 | 3.69·10⁻⁶ | 3.69·10⁻⁶ |
| 0.1 | 3.36·10⁻⁶ | 3.75·10⁻⁶ |
| 0.2 | 2.93·10⁻⁶ | 4.56·10⁻⁶ |
| 1.05 | 0.94·10⁻⁶ | 4.9·10⁻⁶ |
| 3 | 1.7·10⁻⁶ | 2.1·10⁻⁵ |

- The cost is below 10⁻⁶ in B, since the far nodes carry negligible law weight.
- The coarse grid is 4× faster in Python. In Lean it is 75 instead of about 270 vCPU-s per node.
- Production uses it for anchored nodes from 06:01. `mktable2.py anchored_nq=64` restricts a table to these records.
- The earlier 256-per-quarter anchored records of row 0.845 will be redone at 64.

**Incident (no damage).** At 06:01 `capsrow.py` was deployed to s0c without the matching `routem.py` (the `allow_var` keyword).
The replay worker spotted it, and it was fixed at 06:04:37. No queue job started in between, and there are no error records.
`deploy.sh` now uploads every generator module together and compares sha256 on both sides.

### 06:20 — the Stein layer's cost on big, and the row set

**Stein worker, dry run (N timings).** Row 0.83 on the provisional table:
- The full conic profile of x-cell [0.4, 0.5] peaks at B̂ = 0.7062675 (σ = 0.26). That is B = 0.713167 in original units, against
  the target B̂* = 0.7064706.
- With seed-LP nodes, the profile overshoots by 8·10⁻⁵ to 2.3·10⁻⁴ near the binding σ. So nodes within 3·10⁻⁴ of the row bound are
  re-proposed by conic.

**One conic node costs 18–37 CPU-s on big against 3.4 s on the laptop (M1 Pro).**
- The problem is the same on both: PSD 44×44, 560 law points, nnz(A) = 269,487, 42 Clarabel iterations, the same optimum.
- The versions are Clarabel 0.11.1 on both, and scipy-openblas SkylakeX on big.
- Above load 48 each process also gets only about 40 % of a vCPU.
- **About 6 CPU-h per full-quality row** on big.

I declined the worker's request to run 2 processes on the laptop. The laptop takes at most one heavy job across all agents, and the
user wants heavy numerical runs on the droplets.

**Row set.** To bound the cost:
- **Required plateau rows: 0.83, 0.84, 0.845, 0.85, 0.86, 0.87, 0.88, 0.885**, 0.01 apart (0.005 around the maximum). With
  mixtures this spacing costs about 1–4·10⁻⁶ on the envelope (stage 0c §3.5).
- **Optional** (only if time remains): 0.835, 0.855, 0.865, 0.875, 0.8825.
- Cheap rows: 0.82, 0.8, 0.78, 0.74, 0.7, 0.8875, 0.89, 0.895, 0.9, 0.6, 0.5, 0.4, 0.3, 0.23, 0.12.

The cap queue is reordered row by row in that order. `tableloop.sh` builds `s0c/tables/table_<t>.json` (`rowdone.py` → `mktable2.py
anchored_nq=64`) every 5 minutes for each complete row.

### 06:50 — far-slab failures in the two-direction range, fixed by a ring split; the independent exact replay passes

**Problem (C, found in production).** Route M failed at many two-direction nodes and fell back to the global piece:

| row | failed nodes | global gap there |
|---|---|---|
| 0.83, 0.835 | s ≥ 0.42 | 2.7–3.1·10⁻³ |
| 0.84 | s = 0.37–0.48 | 1.2–1.7·10⁻³ |
| 0.845 | s = 0.45 | — |

- **The cause is always the first far slab τ_d ∈ [T, 2T]** (T = 0.096, τ_od free with price variance). It closes at
  +1.4·10⁻³ to +3.6·10⁻³ even at 1024 cells.
- The old box treatment of that slab (τ_od constrained) cannot be certified at all: block 1 of D = Q − H turns indefinite at the
  far anchors (−0.019 at τ₂ = 0.144), and no block-1 price variance below level 0.15 restores definiteness.
- **These failures matter.** The law-relaxation model with 2.7·10⁻³ gaps on s ∈ [0.42, 0.49] puts row 0.845 at **0.7133483**,
  2·10⁻⁵ below 5000/7009. The worst law moves to τ = 0.317 to reach those nodes. With route M closed there the same model gives
  0.7132568.

**Fix (C).** The slab is split into 4 rings τ_d ∈ [T + kT/4, T + (k+1)T/4], each with its own polished constrained anchor and
variance level. A ring above target is split once more, and route M is abandoned (`RouteMFail`, global fallback) only if a
half-ring still fails.

| node | full slab | quarter rings (256 cells) |
|---|---|---|
| row 0.84, s = 0.38 | +1.63·10⁻³ | −2.33·10⁻³, −2.13·10⁻³ |
| row 0.83, s = 0.44 | +2.90·10⁻³ | −1.47·10⁻³, −7.7·10⁻⁴ |

Far pieces are now computed first, so a hopeless node is abandoned in about 4 min instead of 37. Far and one-direction slab anchors
are polished on the fine functional. The 13 failed nodes are requeued in front of the queue.

**Table assembly.** `mktable2.py` now uses the **lower convex hull** of the vertex caps (Ψ convex). An isolated node whose
certificate is loose takes the chord of its neighbours.

**Independent exact replay (worker; C).** Tools are in `replay/` (`exactint_nu.py`, `replay_nu.py`, `selftest_nu.py`).
- It uses standard-library integer and Fraction arithmetic only. It recomputes R_C, the per-cell tests d₂ > 0, Δ > 0 and e₂, e₃ > 0,
  g = ⌊2⁶⁰ g*(R_C)⌋/2⁶⁰ with the division-free cell inequality, the exact centre, all weights as integer enclosures at 2⁻⁸⁰, the
  cell, radial and tail sums, C, h, H, the Loewner bound, the S-lemma matrix with the stored multipliers, its LDL and the quadratic.
  A separate Gauss elimination at the node's s agrees exactly.
- It shares with the generator only the float choice of prices, plus the definitions and the rational moment tables
  (`check_moments.py`: PASS).
- At ν = 0 it agrees with cert-0745e's `exactint` to 3.6·10⁻¹⁸. On 4000 random and adversarial cells it agrees with `gstar.py`.

**Sample: 100 pieces** (54 production records: 35 two-direction pieces, 11 one-direction, 4 global, 4 anchored at 64 per
quarter; the rest are test records of rows 0.85, 0.83, 0.845, 0.8 and 0.5):
- **All pass. Replayed − stored ∈ [−1.4·10⁻¹¹, −1.9·10⁻¹²]**: the generator's Loewner radius is 5–12·10⁻¹², and its float
  intervals contain the exact values in all 61 cross-checked pieces.
- All pivots are positive (min 1.5·10⁻⁷).
- The `cover` check of 15 route-M nodes passes: constraint vectors, multiplier signs, coverage of [0, ∞)² under the S₋/S_c
  symmetries, and cap = max of the live pieces.

Cost of a full replay: about 18,700 pieces, about 83 CPU-h (15 s per 256-cell piece, 51–63 s per 1024-cell piece).

### 07:00 — ring split verified; route M with block-1 variance not worth it for 1.4018

**Ring split (C).** On the two failing test nodes, the full nodes now close:

| node | before (global fallback) | now (route M) | its far rings |
|---|---|---|---|
| row 0.84, s = 0.38 | 1.26·10⁻³ | **1.03·10⁻⁵** | −2.33, −2.13, −5.78, −10.1·10⁻³ |
| row 0.83, s = 0.44 | 2.80·10⁻³ | **1.32·10⁻⁵** | −1.47, −0.77, −4.21, −7.87·10⁻³ |

The method has a limit at the top of the two-direction range. On row 0.845 at s = 0.49 (u = 0.61, block 1 nearly indefinite even
at the symmetric anchor):
- the innermost ring stays at +2.28·10⁻³, and its halves at +2.14·10⁻³ / +1.01·10⁻³;
- so that node keeps the global piece (3.1·10⁻³), and the hull of the table takes over there.

**Route M with block-1 price variance on s ∈ [0.5, 0.59]** (model: gap 3·10⁻⁴ instead of the global 3–5·10⁻³): row 0.845 drops from
0.7132568 to 0.7132371, i.e. −2.0·10⁻⁵. The cost would be about +20 CPU-h in Python and about +180 vCPU-h in Lean (about 4,000 more
pieces). **Not used for 1.4018**; it is listed for 1.402.

**Table caps** now carry a robustness margin of 2·10⁻⁹ (`mktable2.py margin=`). The exact replay showed that a different float price
rule can move an anchored cap by 4.8·10⁻¹⁰, and the Lean kernel recomputes prices in its own Float code.

### 07:25 — first certified table (row 0.845); predicted value; per-row Stein offset; Lean count

**Row 0.845 table (C): 171 nodes, `s0c/tables/table_0.845.json`.**
- Sources: 163 own quadratics, 8 hull chords. The chords cover s = 0.47–0.49 (from 0.45 to 0.5, before the ring requeue) and
  s = 0.69–0.73 (kink region).
- Certificate kinds:

| kind | nodes | cap − Ψ_true |
|---|---|---|
| anchored (64 per quarter) | 83 | 0.9–6.9·10⁻⁶ |
| one-direction route M | 25 | 4.8–14·10⁻⁶ |
| two-direction route M | 12 | 1.3–2.0·10⁻⁵ |
| global | 41 | 8·10⁻⁵ to 1.28·10⁻² |

- Checks:
  - `indep_tables.py` ACCEPTED. It is separate code that re-derives every table cap from the records (own cap, nearby quadratic,
    convexity chord, or Lipschitz).
  - `indep_float.py`: min cap − Ψ_true = +8.6·10⁻⁷, nothing negative. Ψ_true is now interpolated in u², since Ψ is even and PCHIP
    in u had endpoint errors of about 5·10⁻⁶ that made a fake −1.1·10⁻⁶ appear at s = 0.005.

**Predicted value (N).** The law relaxation with this exact table (chord interpolant against Ψ_true on a 0.0025 grid,
`table2cvs.py`) gives:
- row 0.845: **0.7132517**, a table effect of +5.4·10⁻⁵;
- the worst law sits at (x, τ) = (0.45, 0.29).

**Per-row Stein offset (Stein worker, provisional row 0.83, C).** Exact row bound B̂ = 0.706271579, i.e. B = 0.713174197,
verify --rows PASS, against the relaxation's 0.7131188 with the same potential: **+5.5·10⁻⁵**. The pad of 5·10⁻⁶ explains about
5·10⁻⁶; the worker is attributing the rest. Cost of that row: 4.69 CPU-h (cover 3.65, conic hot pass 1.02, verify 0.01). After
cleanprune: 224 Stein nodes, 0.25 MB.

**Expected certified value of row 0.845:** about 0.71325 + 5.5·10⁻⁵ ≈ **0.71331, margin about 6·10⁻⁵ to 5000/7009
(K ≳ 1.4019)**.

**Lean count of one plateau row (`lean_cost.py`, row 0.845; N).**
- Certificates in use: V = 99 anchored, P = 749 route-M pieces (one at 1024 cells), G = 18 global; 23 more global nodes are
  replaced by hull chords.
- Cost: **36 vCPU-h per plateau row** (33–40 for k = 2.2–2.7), or 23 vCPU-h with the two interpreter savings.
- Projection: 8 required plateau rows about 290, rows 0.8 and 0.82 about 50, the 13 slack rows about 40, i.e. **about 380 vCPU-h
  (about 240 with the savings)**. The 5 optional plateau rows would add about 180 (115).
- That is 3.5–4 times the 90–110 CPU-h estimate. The cause is the real per-piece CI cost (about 160 s, not 20 s) times about 750
  route-M pieces per plateau row.

### 07:35 — block 1 turns indefinite inside the two-direction range (row 0.84); route M with block-1 variance; Stein attribution

**Row 0.84 (C).** At the symmetric anchor, block 1 of D is indefinite from **s = 0.42** on (eigenvalue −8.6·10⁻⁵ there, −0.015 at
0.44, −0.053 at 0.48). Plain route M does not apply there, so those nodes got global pieces (1.9–3.2·10⁻³).

The law-relaxation scenario for such gaps on [0.42, 0.49] costs about +9·10⁻⁵. Row 0.84 would then end near 0.71340 after the Stein
offset, **above 5000/7009**. So this must be fixed.

**Fix:** route M with node-wide price variance along block 1's negative direction (`allow_var`, mode `auto2`). The level is chosen on
the centre box with a 4-step refinement. The piece target is relaxed to the centre's own cost, so outer boxes stay at 256 cells.

| row 0.84 node | block-1 eigenvalue | best level | centre box | global |
|---|---|---|---|---|
| s = 0.42 | −8.6·10⁻⁵ | 0.0075 | **1.22·10⁻⁵** | 1.9·10⁻³ |
| s = 0.44 | −0.015 | 0.103 | **1.37·10⁻⁴** | 2.1·10⁻³ |

All pending two-direction chunks now run in mode `auto2`. The global-only nodes in [0.34, 0.5] of rows 0.83, 0.835, 0.84, 0.845 and
0.85 are requeued in mode `auto2`.

Far slabs that stay above target after the ring split get a second variance family: block-0/1 directions at the slab's own anchor.
This is being tested at row 0.845, s = 0.49.

**Stein attribution (worker, provisional row 0.83, hat units).** The certificate is at 0.7062716 and the relaxation at 0.706215,
5.66·10⁻⁵ apart:

| part | share |
|---|---|
| σ cover | ≈ 0 |
| x-cells (0.1 wide) | +6.3·10⁻⁶; 0.05-wide cells recover about 3·10⁻⁶ |
| LP nodes left after the hot pass | ≈ 0 |
| exact node against the conic dual at a point | +5.6·10⁻⁶ |
| **Stein-cut u-mesh (step 0.2)** | dominant: step 0.15 recovers 1.3·10⁻⁵ (2× conic cost), step 0.1 recovers 2.0·10⁻⁵ (7×) |
| remaining relaxation difference | about 1.8·10⁻⁵: the SOCP's two spectral budgets 2P + Q = x² and Q ≤ x²/3 are not in H3 |

Plan: the certified rows run first at step 0.2. If row 0.845 certifies above 0.71330 in original units, rows 0.84, 0.845 and 0.85
are rerun at u-step 0.15 with 0.05-wide binding x-cells (about −1.6·10⁻⁵, +3–4 CPU-h per row).

**07:40 — recipes are required in the final tables.**
- Records written before 05:43 carry no recipe: the calibration and d-runs of row 0.845, and the first 22 production chunks
  (0.83, 0.835, 0.84 two-direction). A certificate without its recipe cannot be replayed exactly or exported to the Lean generators.
- So `mktable2.py` (`require_recipe=1`, default), `rowdone.py` and `indep_tables.py` now ignore such records.
- The 49 affected nodes are requeued in front of the queue: 19 of row 0.845, 3 of 0.84, 8 each of 0.83 and 0.835; about 5 CPU-h.
- `FINAL_0.845` follows when they are done.

**07:50 — optional plateau rows set aside.** The 84 queue chunks of rows 0.835, 0.855, 0.865, 0.875 and 0.8825 are moved to
`/root/claude-b9ee-capsnu2/qprod_optional.txt`. Together with their Stein covers they would cost about 55 CPU-h, for an envelope gain
of about 1–4·10⁻⁶ (stage 0c §3.5). 179 chunks remain, about 70 CPU-h, so the caps of the 23 required rows should be done around
11:00.

### 08:30 — row 0.845 final; its certified Stein run and exact replay started

- **`s0c/tables/FINAL_0.845`** (table sha256 d7e003c3dc52…), 171 nodes:

  | source | nodes |
  |---|---|
  | anchored | 99 |
  | one-direction route M | 25 |
  | two-direction route M | 15 |
  | global | 24 |
  | hull chords | 8 (s = 0.49–0.51 and 0.69–0.73) |

  Two-direction route M now reaches s = 0.47. At 0.48–0.5 the innermost far ring τ₂ ∈ [0.096, 0.12] cannot be closed (+2.3·10⁻³
  even when halved). A second variance family (block-0/1 directions at the ring's anchor) never helped and is now off
  (`FAR_FAMILY2 = False`). `indep_tables.py` ACCEPTED.
- **Lean count for this table:** V = 99, P = 841 (3 at 1024 cells), G = 17, i.e. **40 vCPU-h** (36–44), or 26 with the interpreter
  savings.
- **Certified Stein run:** started 08:25 on a frozen copy of the table (sha256 checked against FINAL): 8 chunks, 18 x-cells,
  `stein/rows_cert/0.845`.
- **Exact replay of exactly the certificates this table uses:** 155 certificates, 956 pieces (`replay_used.py`, then
  `replay/replay_nu.py run`, 3 processes): `replay/res_final_0.845.jsonl`.
- **Prediction for the final 0.845 table (N):** the law relaxation gives **0.7132449** (+4.7·10⁻⁵ over Ψ). With the per-row Stein
  offset (+5.5·10⁻⁵ on provisional row 0.83), the certified row should come out near **0.71330**, a margin of about 7·10⁻⁵.

### 08:55 — row 0.85 final; provisional Stein values

- **`FINAL_0.85`** (sha256 1faa236ff9c9…), 171 nodes:

  | source | nodes |
  |---|---|
  | anchored | 99 |
  | one-direction route M | 23 |
  | two-direction route M | 15 |
  | global | 24 |
  | hull chords | 10 |

  Two-direction route M reaches s = 0.47, like 0.845. Lean count: V = 99, P = 822, G = 17, i.e. **39 vCPU-h** (25 with the savings).
  Law-relaxation prediction: **0.7132287** (+3.9·10⁻⁵ over Ψ). The certified Stein run started at 08:40 (4 chunks).
- **Provisional Stein results** (true Ψ + 5·10⁻⁶, 396-node tables, exact, verify --rows PASS):

  | row | B̂ | B | over the relaxation with Ψ |
  |---|---|---|---|
  | 0.845 | 0.706340026 | **0.713241035** | +4.3·10⁻⁵ |
  | 0.83 | 0.706271579 | **0.713174197** | +5.5·10⁻⁵ |

- **Two-row provisional envelope** (0.83 + 0.845, mixtures θ = k/200): 0.7132698 in original units at t = 0.8375 (mixture θ = 69/100).
  Rows 0.015 apart add about 3·10⁻⁵ between them, so 0.005–0.01 spacing should add only 3·10⁻⁶ to 1.3·10⁻⁵. The full multi-row
  verify passes mechanically (crude-dominated with 2 rows, as expected).

### 09:35 — BLOCKER for row 0.84 (and a weak spot in s ∈ [0.4, 0.6] for all binding rows); fix under test

Predictions with the final tables (law relaxation, N, original units; target 0.7133685):

| row | true Ψ | final table | table effect |
|---|---|---|---|
| 0.845 | 0.7131979 | 0.7132449 | +4.7·10⁻⁵ |
| 0.85 | 0.7131896 | 0.7132287 | +3.9·10⁻⁵ |
| 0.83 | 0.7131188 | 0.7132704 | +1.5·10⁻⁴; the worst law moves to τ = 0.344 |
| **0.84** | 0.7131955 | **0.7134352** | **above the target before any Stein offset** |

- **Row 0.84:** route M stops at s = 0.39. At s = 0.40–0.50 every far ring τ₂ ∈ [0.096, 0.12] stays above target, with or without
  block-1 price variance, so these 11 nodes carry global caps of 1.7–3.4·10⁻³.
- **Row 0.83 scenarios:** tightening the caps to 2·10⁻⁴ gives 0.7131909 on s ∈ [0.48, 0.6] (−7.9·10⁻⁵) and 0.7131453 on
  [0.48, 0.75] (−1.25·10⁻⁴). **The region s ∈ [0.4, 0.6] decides the certificate.**

**Fix under test: ring boxes** (`RINGBOX`). A far ring that still fails after one split is covered instead by:
- two-constraint boxes τ_d ∈ ring × τ_od ∈ ±I_j, so block od needs no variance;
- the two halves |τ_od| ≥ T;
- in every piece, price variance along block 1's negative direction at the smallest level in {0, 0.02, 0.05, 0.1} that certifies.

Tests run on row 0.84 at s = 0.40 and row 0.845 at s = 0.48. New certified Stein launches are paused. Rows whose tables change
lose their FINAL marker.

### 09:50 — ring boxes work; binding rows requeued; full exact replay of a whole row passes

**Ring boxes (C).** On row 0.845 at s = 0.48, the far ring τ₂ ∈ [0.096, 0.12] fails (+2.65·10⁻³ at 1024 cells; second half
+1.38·10⁻³), but **its ring boxes close at −4.4·10⁻³**. On row 0.84 at s = 0.40 the rings now close directly (−2.05, −1.68, −5.28,
−9.51·10⁻³).

Deployed at 09:41. Requeued in mode `auto2`, in front of the queue, for the 8 required plateau rows:
- **group A**: global-only nodes in [0.34, 0.5], 33 nodes in 19 chunks, including 11 of row 0.84;
- **group B**: (0.5, 0.6), where block 1 is indefinite but block 0 is not; 71 nodes in 39 chunks.

All pending M2 and G chunks also switched to `auto2`. FINAL markers of rows 0.83, 0.84, 0.845, 0.85, 0.86 and 0.87 are withdrawn
(kept as `OLDFINAL_<t>`). Extra cost: about 50 CPU-h on big, and about +9,000 pieces in Lean.

**Exact replay of a whole table (independent check, C).** Every certificate used by the (old) final table of row 0.845: 155
certificates, 956 pieces (anchored, one- and two-direction route M, global).
- **956/956 ok**: replayed − stored ∈ [−9.5·10⁻¹¹, −1.9·10⁻¹²], min LDL pivot 1.45·10⁻⁷, mean 12 s per piece.
- Results: `replay/res_final_0.845.jsonl`.

**Certified Stein, row 0.845 on the old table (worker, partial):** 15 of 18 x-cells done, maximum **0.7133025** in original units
(x-cell [0.5, 0.6], σ ≈ 0.23). That is +5.8·10⁻⁵ over the model's 0.7132449 for that table, the same offset as the provisional rows.

**09:55 — queue order.**
1. Group A: 15 chunks.
2. Group B for the four binding rows 0.83, 0.84, 0.845, 0.85: 20 chunks.
3. The 13 cheap rows: 52 chunks. This also gives the Stein layer work early.
4. Rows 0.8 and 0.82: 29 chunks.

Group B for 0.86–0.885 is set aside in `qprod_gB_late.txt` (19 chunks); those rows are less binding. It goes back in only if their
predictions need it.

### 10:05 — Stein worker hand-back: the exact per-row pipeline works; certified row 0.845 (old table) = 0.713302047

| row | table | B̂ (exact) | B | model | offset |
|---|---|---|---|---|---|
| 0.83 | provisional (Ψ + 5·10⁻⁶) | 0.706271579 | 0.713174197 | 0.7131188 | +5.5·10⁻⁵ |
| 0.845 | provisional | 0.706340026 | 0.713241035 | 0.7131979 | +4.3·10⁻⁵ |
| **0.845** | **certified (old FINAL, sha256 d7e003c3…)** | **0.706402506** | **0.713302047** | 0.7132449 | **+5.7·10⁻⁵** |

`verify_cert --rows` PASS on all three. The certified 0.845 row is 6.65·10⁻⁵ below 5000/7009.

**Toolchain** (`stein/tools/`; originals in `orig/`, diff in `tools.diff`):
- **Unchanged:** `verify_cert`, `sexact2` (fixed loader), `build_cert`, `wexact`, `sdp`.
- `mkpkltail.py`: eps read from the rows file.
- `scover2`:
  - last Stein mesh knot 60.84 → 56.25, since σ must reach δρ = 0.785 > 6/7.8; the mesh is per-row data;
  - new options SEED, SGRID/XGRID, SWEEPFLOOR, MESH_DU, BUMPMAX.
- `t4_cover`: LP refinement nodes, REFCELL, bump-aware re-proposals, conic hot pass at margin 3·10⁻⁴.
- Helpers: `tobank.py` (merge, cut dedup, CLEAN), `envsub.py`, `assemble_rows.py`.
- Drivers: `runrow.sh`, `hotchain*.sh`, `whenready.sh` (waits for FINAL, freezes the table, re-checks sha256 at launch, flock cap),
  `arm_rows.sh`.

**Findings.**
- Seed-mode LP nodes overshoot by 8·10⁻⁵ to 2.3·10⁻⁴ near the binding σ; the conic hot pass removes this.
- Exact repair of LP proposals can add up to 6·10⁻² at isolated large-x nodes. A bumped first node cannot be pruned, so x-cell
  [6.48, 7.75] is split at 7.1; the grid now has 18 x-cells.

**Cost per row:** cover 2.1–3.7 CPU-h, conic hot pass 1.0–4.9 CPU-h, verify ≤ 0.04 CPU-h. Each certificate has 220–290 nodes,
0.25–0.32 MB.

**Armed on big (they start by themselves on FINAL markers):**
- fine for 0.845, 0.84, 0.85 (MESH_DU = 0.15, 30 x-cells);
- coarse for 0.83, 0.86–0.885;
- medium for 0.82;
- cheap for the other 14 rows, held to 8 processes.

The multi-row certified envelope still has to be built when all rows are certified.

**10:25 — ring halfspace replaced by a box ladder (C).**
- In production, the ring boxes closed (−3.8 to −4.4·10⁻³), but the halfspace |τ_od| ≥ T inside the ring could not be certified
  (row 0.845, s = 0.48), so the node fell back to global again.
- It is now a ladder: two-sided boxes τ_od ∈ ±[T, 2T], ±[2T, 4T], then the halfspace |τ_od| ≥ 4T with od price variance.
- Test on the same node: −2.87·10⁻³, −3.32·10⁻³, −2.48·10⁻² for the + side.
- Deployed at 10:06. Group A nodes that failed with the earlier version are requeued once their chunks end.

### 11:57 — far region: two more refinements (C)

- **The ladder works on row 0.845, s = 0.48.** The full node closes by route M at **1.51·10⁻⁵** (it was global at 3.06·10⁻³) after
  ring boxes and the τ_od ladder. That one node took 69 min of CPU.
- **Ring-box pieces get variance along all their own negative directions** (`bpiece`): block by block, on the complement of the
  piece's constrained directions, at its own anchor, with a common level search up to 0.2. On row 0.84 at s = 0.42 the ring box
  τ₃ ∈ [−0.003, 0.003] goes from "not certifiable" to −4.43·10⁻³.
- But the ladder box τ₃ ∈ [0.192, 0.384] of that ring is still +7.9·10⁻³. So **ring boxes are now bisected in τ_od on failure
  (depth 2)** (`abox`). Deployed at 11:56 and being tested on that node.
- **FINAL markers for 0.78, 0.86, 0.87, 0.88 and 0.885** appeared, so their Stein covers start: coarse for the plateau rows, cheap
  for 0.78. Their tables still have global caps at s = 0.48–0.5.

### 12:35 — corner delegation (C, under test)

- **Problem.** On row 0.84 at s = 0.42, the ladder box τ₂ ∈ [0.096, 0.12] × τ₃ ∈ [0.192, 0.384] stays at +7.9·10⁻³, and its
  bisection cannot be certified.
- **Point.** That corner region is already covered, twice: the direction-3 far slabs (τ₃ ∈ [T, 2T], [2T, 4T], ≥ 4T, for every τ₂;
  −τ₃ by S_c) contain it.
- **Change.** The ring treatment of direction d now covers only τ_d ∈ ring × |τ_od| ≤ T (ring boxes, bisected on failure). It
  delegates |τ_od| ≥ T to the od-direction far pieces (`DELEGATE_CORNER`).
- **Check after both directions.** Each delegated direction must have its three far pieces as full, certified, non-superseded
  pieces; otherwise the corner {|τ₂| ≥ T, |τ₃| ≥ T} would lose its cover, and the node falls back (`RouteMFail`).
- Being tested on row 0.84 at s = 0.40 and 0.42.
- The replay worker's `cover` check needs the new piece kinds (farring, ringbox) and this delegation rule before it can be rerun on
  such nodes.

### 13:25 — row 0.84 at s = 0.40 closes by route M; box auto-variance; binding rows on hold

- **`AUTO_VAR` (C).** In `Node.piece`, a two-sided box that fails or stays above target is retried with price variance along every
  negative direction of its own anchor (complement of its constraints, block by block, level up to 0.2).
  - On row 0.84 at s = 0.40, box (5,0) goes from "not certifiable" to −8.9·10⁻⁴.
  - **The whole node closes by route M at 1.13·10⁻⁵** (it was global at 1.7·10⁻³).
  - Row 0.84 at s = 0.42 (corner delegation, rings in both far slabs) is still running.
- **Deployed at 13:24.** The test certificates (0.84 at 0.40, 0.845 at 0.48) are appended to the production records: they are
  valid exact certificates with recipes.
- **Requeued as single-node chunks**: every remaining global node in [0.34, 0.5] of the binding rows (0.84: 10, 0.845: 2, 0.85: 3,
  0.83: 5).
- **Rows 0.86–0.885 keep their final tables**, with global caps at the top of the two-direction range; their Stein covers are
  already running. Their requeue chunks are set aside in `qprod_g_late.txt`.
- **Finaliser race fixed.** `finalize.py` marked 0.84 FINAL in a moment when nothing was queued for it, before the requeue. The
  marker was withdrawn before any Stein run used it. `s0c/tables/HOLD` (0.83, 0.84, 0.845, 0.85) now keeps the binding rows from
  being finalised until their improved tables are checked.
- **FINAL so far** (Stein covers running or queued): 0.78, 0.86, 0.87, 0.88, 0.885, 0.8875, 0.89, 0.895, 0.9.

**14:05 — corner delegation made asymmetric.** On row 0.84 both far directions can need rings (s = 0.46: the τ₃ ring
[0.096, 0.12] is at +1.3·10⁻⁴). The rule is now:
- the first direction that needs ring boxes delegates its corner |τ_od| ≥ T;
- the other direction must then cover τ_od ≥ T completely, by full slabs or by rings with the τ_od ladder, and may not delegate back;
- a guard requires every live far piece of the delegated-to direction to be certified.

Deployed at 14:04. The requeued single-node chunks of the binding rows run at about 1 h CPU per node.

### 14:30 — row 0.84's two-direction range now mostly closes; group B does not help

**Row 0.84, requeued nodes (C):**

| s | method | gap | before (global) |
|---|---|---|---|
| 0.40 | route M | 1.13·10⁻⁵ | 1.7·10⁻³ |
| 0.41 | route M | 1.99·10⁻⁵ | 1.8·10⁻³ |
| 0.44 | route M with block-1 variance | 1.37·10⁻⁴ | 2.1·10⁻³ |
| 0.45 | route M with block-1 variance | 2.9·10⁻⁴ | 3.0·10⁻³ |
| 0.46 | route M with block-1 variance | 5.3·10⁻⁴ | 3.1·10⁻³ |
| 0.47 | route M with block-1 variance | 8.3·10⁻⁴ | 3.2·10⁻³ |
| 0.49 | still global | 3.3·10⁻³ | — |

0.42, 0.43, 0.48 and 0.5 are still running.

**Group B (s ∈ (0.5, 0.6), route M with block-1 variance) does not pay.** Most nodes come out at 1.3–8.7·10⁻³, no better than the
global pieces (3.4–5.3·10⁻³) and for row 0.84 worse. The one exception is row 0.845 at s = 0.54 (6.0·10⁻⁴ against 4.3·10⁻³). The
table takes the minimum, so nothing is lost but CPU. The region s > 0.5 stays at the global-piece level; making it tight needs block
1 localised (the three-direction port).

**14:40 — concurrency raised (coordinator).** The degree-5 job has ended, and the only other user on big is the content worker
(≤ 8 processes). Memory is ample (71 GB available). The queue cap goes from 23 to **31** (load guard 62), for a total load of about
45. The Stein launchers keep CAP 12 for now. When the cap queue drains (25 chunks left), they will be re-armed with a higher CAP,
waiting launchers only, so that running rows are not disturbed.

**14:55 — a stale fine run stopped; Stein launchers re-armed.**
- **Stale run.** The finaliser race at about 12:22 had written FINAL_0.84 for the table with global caps at s = 0.40–0.49. Its fine
  launcher froze that table (sha256 560802a8…) and started a fine Stein run at 13:07, before the marker was withdrawn at 13:24. The
  13:25 check looked in `rows_cert/` only and missed `rows_cert_fine/`.
- **Action.** Run stopped at about 14:55. Folder, frozen table and log moved to `stein/rows_cert_fine/old_launch/obsolete_084/`. Nothing
  from it is used.
- **Re-arm** (`stein/rearm.sh`): every launcher still waiting is re-armed with CAP 16 (plateau rows) and 12 (cheap rows and 0.82);
  running rows (0.78, 0.88, 0.885, 0.4) are untouched. The binding rows' launchers wait for new FINAL markers, which come only after
  HOLD is lifted.

### 15:45 — predictions of the improved binding tables; row 0.84 not needed; 0.845 released

Law-relaxation predictions of the current tables (N, original units; target 0.7133685; the Stein offset on certified tables was
+5.7·10⁻⁵):

| row | before the far-region fixes | now | expected certified | margin |
|---|---|---|---|---|
| 0.83 | 0.7132704 | **0.7132318** | ≈ 0.713289 | ≈ 8·10⁻⁵ |
| **0.84** | 0.7134352 | **0.7133320** | ≈ 0.713389 | **above the target** |
| 0.845 | 0.7132449 | **0.7132310** | ≈ 0.713288 | ≈ 8·10⁻⁵ |
| 0.85 | 0.7132287 | **0.7132258** | ≈ 0.713283 | ≈ 8.6·10⁻⁵ |
| 0.86 | — | 0.7132114 | ≈ 0.713269 | ≈ 1.0·10⁻⁴ |
| 0.88 | — | 0.7131975 | ≈ 0.713255 | ≈ 1.1·10⁻⁴ |

Since then, 0.83 at s = 0.46 and 0.47 and 0.85 at 0.49 closed by route M (1.4–1.9·10⁻⁵), so 0.83 and 0.85 improve a little.

**Row 0.84 is not needed.** The envelope takes the best row or two-row mixture in each t-cell. The provisional two-row envelope
0.83/0.845 (0.015 apart) rose only about 3·10⁻⁵ above its larger row, so near t = 0.84 the 0.83/0.845 mixture should give about
0.71332. That is below row 0.84's own expected value. Row 0.84 is still certified (coarse) and given to `mkenv`, which uses it only
where it helps.

**0.845 released** from HOLD at about 15:45, so FINAL_0.845 follows and its fine Stein run starts. 0.83, 0.84 and 0.85 follow when their
last nodes end.

### 15:55 — first certified rows on final tables; a cheap row exceeds the target

**Certified Stein rows, exact, verify --rows PASS (B = 0.9765 B̂ + 0.0235):**

| row | mode | B̂ | B | margin to 5000/7009 |
|---|---|---|---|---|
| 0.88 | coarse | 0.706350075 | 0.713251 | +1.2·10⁻⁴ |
| 0.885 | coarse | 0.706346855 | 0.713248 | +1.2·10⁻⁴ |
| **0.78** | cheap: `ag` caps, LP nodes, no hot pass | **0.706967412** | **0.713853** | **−4.8·10⁻⁴** |

**Row 0.78.** Its Gaussian value is 0.71101, but the cheap tables (global pieces from s = 0.22 on, gaps 10⁻³ to 10⁻²) together with
the cheap Stein mode cost about 2.8·10⁻³.

This need not break the certificate. The envelope takes the best row or mixture per t-cell, and a row's bound away from its own
t rises only by about (t − ℓ)² (+4·10⁻⁴ at 0.02 from ℓ). So row 0.8 (route-M caps, in production) should cover t near 0.78.
Rows near the plateau edge with cheap caps (0.78, 0.8875) may simply stay unused. `mkenv` over [0, 0.9] decides once all rows are
certified. If a t-cell stays above the target, the rows next to it get route-M caps (`auto`).

**16:05 — all binding rows released.**
- FINAL_0.84 and FINAL_0.85 were written at 15:43 and their Stein launchers are waiting for slots: 0.85 fine, 0.84 coarse. Row 0.8
  was re-armed at coarse quality, because it has to cover t ≈ 0.78.
- HOLD is now empty. Row 0.83 is finalised automatically once its last three nodes (s = 0.48–0.5) end.
- From here the pipeline runs by itself: caps → finaliser → FINAL → Stein. The multi-row assembly is the only remaining manual step.

**16:15 — Stein caps raised.** The waiting launchers are re-armed (`stein/rearm.sh 20 16`): CAP 20 for the plateau rows (0.85 fine;
0.83, 0.8, 0.86, 0.87 coarse) and CAP 16 for the cheap rows and 0.82. Running rows are untouched: 0.845 fine; 0.84, 0.88, 0.885
coarse; 0.78, 0.74, 0.6, 0.4 cheap. 20 FINAL markers so far; still missing 0.83 (last three nodes running) and 0.8 / 0.82 (caps in
production).

**16:30 — interim note for the coordinator: `PROGRESS.md`.** The earlier time labels in this log (14:40–16:15) were corrected; they
had drifted ahead. Stein caps raised again to 24 (plateau) and 20 (cheap rows) to use the idle cores.

### 16:50 — coordinator: robust GO first; fallbacks now

Decisions (claude-b9ee): compute row 0.835, run the fine Stein mesh on the rows that bind the envelope, use all 48 cores, finish the
certificate even if B misses.

Actions:
- **Row 0.835:** 167 missing nodes appended to the queue (`queue/q0835.py`): 13 two-direction nodes as single-node `auto2` chunks,
  then A, M1, G (`auto2`) and F.
- **Fine Stein mesh** (MESH_DU = 0.15, 0.05-wide x-cells on [0, 1], 8 chunks) for 0.83, 0.835, 0.845 and 0.85. 0.845 and 0.85 are
  already running fine; 0.83 was switched from coarse.
- **Caps on 48 cores:** cap queue 24 jobs, Stein CAP 24 (plateau) and 20 (cheap rows and 0.82).

**17:25 — global-region chunks switched back to fast mode.**
- The pending G chunks had been switched to `auto2` at 09:41, so every node in (0.5, 0.6) first tried route M with block-1
  variance, at 30–60 min per node, for no gain (group B result).
- The 11 running G chunks of rows 0.8, 0.82 and 0.835 were stopped. Their missing nodes are requeued in mode `auto` (global piece at
  about 2 min per node) as 5-node chunks (`queue/requeue_g.py`): 44 + 29 + 50 nodes.

**17:58 — two stuck launchers fixed; Stein caps raised to 40/36.**
- **Stuck launchers.** Rows 0.86 and 0.87 had waited for a FINAL marker different from their withdrawn one, but their tables never
  changed: their requeue chunks had been set aside. They were re-armed (old markers renamed `OLDFINAL_<t>.sametable`).
- **Caps.** The caps are nearly done: 0.8 at 135/137, 0.82 at 136/137, 0.835 at 169/171. So the Stein launchers now get CAP 40
  (plateau rows) and 36 (cheap rows).
- **Row 0.84, certified coarse (C):** B̂ = 0.706577983, B = 0.713473, above the target as predicted. The envelope uses the
  0.83/0.835/0.845 mixtures there.

### 18:35 — BLOCKER: the small-t rows cannot be certified below the target with the present caps

**Certified rows so far** (C, exact, verify --rows PASS; B = 0.9765 B̂ + 0.0235; target B̂* = 0.7064706):

| row | B̂ | B | vs target |
|---|---|---|---|
| 0.4 | 0.724922 | 0.731386 | **above by 1.8·10⁻²** |
| 0.6 | 0.708089 | 0.714949 | **above by 1.6·10⁻³** |
| 0.74 | 0.706309 | 0.713210 | below by 1.6·10⁻⁴ |
| 0.78 | 0.706967 | 0.713853 | above by 5·10⁻⁴ |
| 0.84 | 0.706578 | 0.713473 | above by 1.1·10⁻⁴ (expected; the mixtures cover it) |
| 0.845 (old table) | 0.706403 | 0.713302 | below by 6.8·10⁻⁵ |
| 0.85 (old table) | 0.706382 | 0.713282 | below by 8.9·10⁻⁵ |
| 0.88 | 0.706350 | 0.713251 | below by 1.2·10⁻⁴ |
| 0.885 | 0.706347 | 0.713248 | below by 1.2·10⁻⁴ |

Partial chunk maxima, before cleanprune: 0.5 at 0.7085, 0.7 at 0.7071, 0.86 at 0.70646, 0.87 at 0.70643, 0.83 (fine) at 0.70650.

**Diagnosis (N, `psicheck.py`).** For t ≤ about 0.7 the fibre maximiser breaks the odd symmetry strongly. Row 0.6:

| s | max odd coefficient | Ψ_true − symmetric maximum | cap − Ψ_true |
|---|---|---|---|
| 0.1 | 0.53 | +2.6·10⁻² | +1.2·10⁻² |
| 0.2 | 0.48 | — | +2.3·10⁻² |
| 0.4 | 0.16 | — | +2.9·10⁻² |
| 0.6 | 0.00 | — | +1.25·10⁻² |

- Every cap method of this run is built around the symmetric anchor (anchored, route M, global with price variance), so it stays
  1–3·10⁻² above Ψ_true.
- The rows' Gaussian slack (2–3·10⁻², from rows optimised with the true Ψ) is used up by the caps.
- A single **quadrant piece** {w₂·m ≥ 0, w₃·m ≥ 0} anchored at the broken maximiser (`quadrant.py`) does not help either: +1.8·10⁻²
  at s = 0.1 and +4.0·10⁻² at s = 0.2. With two halfspace constraints the S-lemma gains no curvature, so D at the anchor needs heavy
  price variance.
- Stage 0c never saw this: it studied caps on the plateau rows only, and its t-range analysis used the true Ψ for every row.

**Consequence.** As built, the certificate covers t ∈ [0.73, 0.9] below 5000/7009: the plateau, the binding region, with an
expected margin of 6–8·10⁻⁵. It does not cover t ∈ [0, 0.72] (rows 0.12–0.7; 0.12, 0.23, 0.3 still running). **The full certificate
is NO-GO until the small-t rows are redone.** Options, best first:
1. **Re-choose the small-t rows.** Re-run the row optimiser with a penalty, or a hard constraint, that keeps the fibre maximiser
   symmetric. All blocks of D should be definite at the symmetric anchor for s ≲ 0.5–0.7. The slack (2–3·10⁻² at t ≤ 0.6, 9·10⁻³
   at 0.7) leaves room for a costlier row; such rows get anchored caps at about 3·10⁻⁶ for about 30 CPU-min per row.
2. **Route M centred at the broken maximiser inside one quadrant**: the box ladder around (τ₂*, τ₃*), with the quadrant's images
   covering the rest. This is new, and the far region would need the same work as today.
3. **Crude row with a smaller ρ, for the smallest t only.** V̂ ≤ t² + ε̂ρ² − 2ν̂ closes t ≤ 0.21 with ρ = 0.9387, and ε̂ρ² alone
   (verifier form) needs ρ ≤ 0.936. This is not a fix for t ≈ 0.3–0.7.

## Final sections (18:40)

### What the independent re-check covered (C)

- **`verify_cert.py`**: exact, standard library only, a code path separate from the generators. Every certified row was checked
  (`--rows` PASS). The multi-row envelope has not been assembled; see the blocker.
- **Exact replay of node certificates** (`replay/`, standard library integer/Fraction arithmetic; shares only the float choice of
  prices):
  - all 956 pieces of the (old) final table of row 0.845 pass, replayed − stored ∈ [−9.5·10⁻¹¹, −1.9·10⁻¹²], min pivot 1.45·10⁻⁷;
  - a 100-piece sample across kinds and rows passes;
  - the coverage check (`cover`) passes for 15 route-M nodes;
  - it does **not** yet know the far-region piece kinds of this run (farring, ringbox, ringhalf, corner delegation), nor
    `routem2v`'s base variance in the coverage logic. That has to be added before the patched nodes are replayed for coverage.
- **`indep_tables.py`**: separate code that re-derives every table cap from the records (own cap, nearby quadratic, convexity
  chord, Lipschitz). It accepted every FINAL table: the finaliser requires it.
- **`indep_float.py`**: float Ψ_true from the stage-0 model, a different code path. No certified cap below Ψ_true on rows 0.845 and
  0.85.

### Files a generator for the Lean rows and caps needs (all under `results/final/`, copied from big)

1. **Row headers** — `s0c/rows_theta_v3.json`, 28 rows:
   - `{eps: '25/31', nu_hat: '47/1953', rows: {t: {theta[15], kappa, smax, delta, b, ell, beta, th_s[15], gates_ok, ...}}}`;
   - θ in the cert-0745e order E11 E12 E13 E22 E23 E33 R11 R12 R22 δ b1 b2 b3 ℓ β, as exact doubles;
   - `th_s` is the same in s units: the coupling a_s = (1 + b1, b2, b3).
2. **Cap tables** — `s0c/tables/table_<t>.json`:
   - `{t, eps, nodes[], caps[] (exact rationals, +2·10⁻⁹ margin), src[], anchors[]}`;
   - `src` is `quad:<kind>@<s>` (the certificate at s) or `chord:<a>-<b>` (lower convex hull);
   - `FINAL_<t>` holds the table's sha256.
3. **Node certificates** — `s0c/caps_<t>.jsonl`, one record per (node, method): `{t, s, kind, cap, psi, quads, recipe | details.plist}`.
   - kinds: `anchored`, `routem1`, `routem2`, `routem2v`, `global`;
   - `quads`: exact q0, q1, q2 per live piece, rounded up at 10⁻²⁴;
   - recipe, anchored: `{m0, nq (per quarter, 64 = Lean grid 1600×256), grid: 'quarter'}`;
   - recipe, global and every route-M piece: `{y (12 floats), var (variance vectors), nq (full circle), cons: [{v (exact 12-vector), lo,
     hi | None, lam, mu}]}`;
   - route-M records list every piece, with `superseded` flags for boxes replaced by halves, rings or ring boxes.
4. **Stein row certificates** (cert-0745e format, read by `tools/gen_lower_data.py` archive mode after extending its eps/B
   assertions):
   - `stein/rows_cert[_fine]/<t>/cert1/{manifest.json, row_<t>.json}` and `rows1.json` (exact ℓ, β, C per row, plus the crude row);
   - `row_<t>.json` = θ, κ, smax, nodes, caps, mesh, cells, as in `verify_cert.py`'s docstring.
5. **Toolchain** — `stein/tools/` (`verify_cert.py` unchanged; `tools.diff` against the originals), the generator modules of this
   folder (`routem.py`, `nucert.py`, `nucells.py`, `midnu_x.py`, `capsrow.py`, `mktable2.py`), and `replay/`.

### What I would change in the stage-2 plan (STAGE0C §7)

1. **Kernel:** the ν-kernel of the Lean worker (`grothe-capsnu-scratch-b9ee/CapsKNu`, 146 lines) is enough for every piece type of
   this run. All of them are "prices from (anchor y, variance vectors) + interval constraints + S-lemma LDL". Ring boxes,
   delegation and price variance add no new kernel primitive.
2. **Coverage proofs are the new work.** The layouts now include:
   - quarter ring splits of far slabs, bisected once;
   - ring boxes (τ_d ring × τ_od ladder, bisected in τ_od);
   - **corner delegation**: one far direction covers |τ_od| ≥ T for the other. Its correctness argument is the asymmetric rule plus
     the guard that the od direction's far cover is complete;
   - box halves.

   The Lean coverage check (today's Lemma 2 of MIDCAPS) has to be generalised to a finite list of axis-aligned (τ₂, τ₃) regions
   plus the symmetry images. Delegation needs care in the statement.
3. **Price variance per piece (`AUTO_VAR`, `bpiece`) is essential.** Without it about 30 % of the outer two-direction pieces of the
   binding rows fail. The recipe must carry the variance vectors, as it already does.
4. **The small-t rows need a design decision first.** Lean work on the current small-t rows (0.12–0.7) is wasted until they are
   redone; see the blocker.
5. **Cost.** The 22 final tables give V = 1,571 anchored nodes, P = 9,601 route-M pieces (211 at 1024 cells) and G = 407 global
   pieces: **about 490 vCPU-h in Lean (440–540), or about 320 with the two interpreter savings.** The 8 plateau rows alone take
   368 (236). The 90–110 CPU-h estimate of stage 0c assumed 20 s per piece; the measured CI cost is 150–160 s.
   - Levers: fewer route-M rows (the 0.005 spacing between plateau rows bought little);
   - 0.02 node spacing in the two-direction range;
   - the interpreter savings;
   - dropping hopeless far-region attempts. Superseded pieces are not counted; only used certificates are.

### State of big at hand-back (18:40)

- **Still running:** the cap queue (rows 0.8, 0.82, 0.835, about 20 jobs), the Stein launchers and covers (0.83, 0.835, 0.845 and
  0.85 fine; 0.8, 0.82, 0.86, 0.87 coarse; the cheap rows), and `tableloop.sh` (finaliser).
- **The plateau rows will finish by themselves** in about 3–5 h. Their certificates are useful for the t ∈ [0.73, 0.9] envelope.
- **To stop everything:**
  - `touch /root/claude-b9ee-capsnu2/capq.stop /root/claude-b9ee-capsnu2/tableloop.stop`;
  - `kill -- -<pgid>` for each `*.pid` under `/root/claude-b9ee-capsnu2/{s0c,stein/rows_cert,stein/rows_cert_fine}`. Each job runs
    in its own process group.
- **To assemble once the rows are done** (`stein/finishmulti.sh`): `ROWBASE=<dir of row folders> NP=24 bash
  stein/finishmulti.sh <OUT> <rows…>`. It runs `assemble_rows.py` → `envsub.py` → `mkenv.py` → `verify_cert.py`. Put the fine rows
  (0.83, 0.835, 0.845, 0.85) and the coarse/cheap ones under one ROWBASE, for example with symlinks.
- **Folder:** `/root/claude-b9ee-capsnu2`, about 100 MB; delete with `find /root/claude-b9ee-capsnu2 -delete` when done. The results
  that matter are copied to `results/final/` here.

## Stage 0d (coordinator, 18:45): continue to a complete certificate

### 19:45 — small-t rows: symmetric rows are impossible; quadtree caps around the broken maximiser instead

**Time labels.** The entries labelled 16:35–16:40 above were written at 18:35–18:40 Bucharest (big's clock is UTC); they are
corrected. From here on every label comes from `date` on the laptop.

**Why the rows cannot be re-chosen symmetric (N).**
- At s = 0 the symmetric point is stable in block 3 only if E[r/(ℓ − 2β + βr²)] ≤ 1/R₁₁ ≈ 1/ε̂, i.e. ℓ − 2β ≳ 0.5.
- The gates pin R ⪰ diag(ε̂, 0) and R ⪰ diag(−1, ε̂), so the odd penalty cannot be raised.
- A row with such ℓ costs (t − ℓ)² away from its own t, so below t ≈ 0.6 every useful row has a broken maximiser. Today's ν = 0
  rows are the same (ℓ − 2β = 0.09 at t = 0.12).

**Structure of the breaking (N; `diagrow.py`, `diagneg.py`, `psitab.py`).**
- The maximiser moves into block 3 only (imaginary odd coefficients): |m₃| = 0.69 (row 0.12), 0.57 (0.4), 0.43 (0.6), 0.30 (0.7),
  0.20 (0.74), 0 (0.78) at s = 0.
- Ψ_true − symmetric maximum at s = 0: 0.20, 0.10, 0.029, 0.006, 0.001, 0.
- At s = 0 the maximisers form a circle (phase of the z̄ coefficient): D at the maximiser has a zero mode.
- At the broken maximiser the anchored majorant has 1 negative direction for small s (radial, block 3 + block 0), and 3–4 for
  s ≥ 0.3 (two per odd block, mixed with the even blocks): the majorant's correction acts along L only, and here |p| ~ |L|.

**Old caps of these rows (C against N).** cap − Ψ_true: row 0.6: 1.0–3.0·10⁻² on s ∈ [0, 0.7]; row 0.7: 0.4–1.1·10⁻² on
[0.1, 0.7]; row 0.4: 4–7·10⁻² on [0, 0.4]; row 0.12: up to 0.13. Anchored and tight (10⁻⁶) from s = 0.9 on.

**Evaluator (N).** `lawsocp_captable.py` solves the law relaxation directly on a cap table (chord interpolant, no spline of Ψ).
Calibration against certified rows (hat units):

| row | model of the table | certified | Stein mode | difference |
|---|---|---|---|---|
| 0.88 | 0.706295 | 0.706350 | coarse + hot pass | +5.5·10⁻⁵ |
| 0.78 | 0.706724 | 0.706967 | cheap | +2.4·10⁻⁴ |
| 0.74 | 0.705933 | 0.706309 | cheap | +3.8·10⁻⁴ |
| 0.6 | 0.706854 | 0.708089 | cheap | +1.2·10⁻³ |
| 0.4 | 0.711808 | 0.724922 | cheap | **+1.3·10⁻²** |

So the cheap Stein mode (LP nodes, no hot pass) is unusable for small t; every row gets the coarse mode with the conic hot pass.

**`qtree.py` (C).** Quadtree of exact box pieces in (τ₂, τ₃) = (v₂·m, v₃·m):
- v₃ = the block-3 part of the maximiser; v₂ = block-2 direction (maximiser, else the soft direction of D there, else the
  symmetric anchor's);
- the quadrant τ₂, τ₃ ≥ 0 is tiled, starting from 3 × 3 boxes with edges 0, 0.2, 0.4, ∞; images under z → −z and conjugation
  cover the plane;
- each box: anchor = maximiser of J over the box (bounded L-BFGS-B), exact piece at 256 cells; if K is not positive definite,
  price variance along the negative directions of D at the anchor outside the two-sided constraints;
- worst-first bisection along the direction with the larger slack λw², until every leaf is ≤ Ψ + tol or the piece budget (80) is
  used; a split that removes under 15 % of the excess freezes its children;
- cap = max over leaves, valid at any stage.

First exact nodes (run with the 5 × 5 start):

| node | old cap − Ψ | quadtree | leaves | pieces tried |
|---|---|---|---|---|
| row 0.6, s = 0.1 | 1.05·10⁻² | 5.3·10⁻⁴ | 30 | 35 |
| row 0.4, s = 0.1 | 5.8·10⁻² | 1.23·10⁻³ | 41 | 57 |

**Model with improved caps (N).** Caps Ψ_true + 10⁻³ on s ∈ [0, 0.6], old caps beyond: row 0.6 → 0.696533 (margin 1.7·10⁻²);
row 0.7 → 0.705930 (margin 7.4·10⁻³). On [0, 0.9]: 0.695271 and 0.705305.

**Row set for t < 0.8:** 0.12, 0.4, 0.6, 0.7, 0.74 (as is), 0.78; spare 0.3; dropped 0.23, 0.5. Expected coverage radii
√margin: 0.15, 0.16, 0.13, 0.08, 0.02, 0.04 around ℓ = 0.130, 0.393, 0.551, 0.648, 0.695, 0.748.

**Production (started 19:40).** `queue/mkqq.py` → `qq.txt`, 58 chunks of 3 nodes:
1. rows 0.7 (tol 10⁻³), 0.6, 0.4, 0.12 (tol 3·10⁻³) on s = 0, 0.03, …, 0.6;
2. the same rows on s = 0.63, …, 0.87, interleaved with row 0.78 on s = 0.22, …, 0.86 (step 0.02, tol 3·10⁻⁴);
3. row 0.3.

The cheap Stein runs of rows 0.12, 0.23, 0.3, 0.5, 0.7 were stopped and moved to `stein/rows_cert/old_launch/cheap_stopped/`.
FINAL markers of 0.12–0.7 and 0.78 are withdrawn (`OLDFINAL_<t>.cheap`) and the rows are on HOLD.

**Replay worker (C), interim.** Generic coverage check on the 24 final tables: 478 route-M records, 0 failures. Row 0.845's final
table: 1167 pieces replayed exactly, all ok.

## Stage 0d log, 16 Nov 22:13 – 24:00 (Europe/Bucharest; details and current state: `PROGRESS.md`)

- 22:17 tables of rows 0.4, 0.6, 0.7, 0.78 rebuilt from the quadtree records and made final (model margins 1.4·10⁻³ to
  1.5·10⁻²); Stein covers started 22:19 (`stein/small_row.sh`). Rows 0.12, 0.23, 0.3, 0.5 on HOLD.
- 22:28 / 23:10 exact plateau envelopes (`stein/multi_A`, `stein/multi_B`, full `verify_cert` PASS): with rows 0.82 and 0.85-fine
  the maximum on [0.74, 0.9] is 0.7064296679 at t ∈ [0.7485, 0.7490], margin 4.09·10⁻⁵. Row 0.82: exact 0.706522628 at t0.
- Correction of the 18:40 report: rows 0.78 and 0.6 (old tables) were above the target only at their nominal t0, not at their ℓ.
- 22:30–23:10 low end: `selfglobal.py` (no localisation) fails (0.05–0.18); measured cause: 3 to 5 negative directions of the
  anchored majorant at the broken maximiser, mixed across blocks; the old quadtree vectors were badly aligned.
- 23:05 answers to the Lean worker (PROGRESS §6): `bindtable.py` and `tables/bind_<t>.json` for all 20 final tables (every cap
  reproduced exactly from one record; 303 mirror pieces dropped after an independent coverage check; 72 chord entries within
  10⁻¹² of the chord of the table caps); `regrid.py` (400×128 re-certification: caps lose 3·10⁻⁵ to 1.4·10⁻⁴); price code frozen.
- 23:15 `otree.py`: three directions (d₀ of any support, v₂ on block 2, v₃ on block 3; aligned with the negative eigenvectors),
  grid 400×128. Checkpoint (a) at 23:28: maximiser leaves as predicted, node values not yet inside the budgets.
- 23:25 **direct row** (law-only, no node caps, no reduction hypothesis): V̂ ≤ t² + D − ε̂‖Qh‖², D = sup of E φ(σ√U) − ε̂σ².
  Float: D = 0.6275 (t ≤ 0.281) with the spectral cuts, D ≈ 0.6715 (t ≤ 0.187) with the plain cuts. My first message gave only
  the first number; corrected at 23:50 after a semidefinite model of the plain-cut class (`plaincut_sdp.py`) showed that the
  exact cover tools check plain cuts only. Exact plain-cut cover started 23:30; exact spectral cover given to the Stein worker.
- 23:35 the coarse covers of rows 0.4 and 0.6 are high in the wide x-cells above 3 (artefact); narrow cells started 23:53
  (`stein/bigx_row.sh`, to be merged by `stein/merge_cover.sh`).
- 23:55 hedge and bridge: tuned generator (weighted variance, level search) on rows 0.3, 0.23 and 0.4; row 0.33 added
  (`rows_theta_v4.json`, old rows identical) as a possible bridge row.
- Replay worker (23:28): coverage, exact replay and table check PASS on the four quadtree tables (952 leaves, 1,260 pieces);
  12 of 20 final tables fully replayed, 0 failures; chain paused at 23:53 for cores.

## Stage 0d log, 17 Nov 00:00 – 01:20 (Europe/Bucharest): the envelope closes on all of [0, 0.9]

Result and all details: `PROGRESS.md` §0 (statement), §7(g) (what Lean needs), §8 (large x). Files: `results/final_0d/`.

- 00:00 / 00:08 two more corrections of the direct row's float value (law grid of `directrow.py` cut at u = 30: 0.265; the
  maximum over x is near x = 3, not 0.9: 0.204). Rule adopted: the direct row is quoted from the exact cover only.
- 00:01 hedge, exact: rows 0.3 and 0.23 miss their cap budgets with three-direction pieces (4.25·10⁻², 5.97·10⁻² against
  about 2.5·10⁻²); row 0.4 is inside (9.1·10⁻³, 1.86·10⁻²). The low rows were dropped; cap production for row 0.33 stopped.
- 00:05 rows 0.7 and 0.78 exact (plain cuts, `stein/quickfinish.sh`): 0.700668504 and 0.705570400.
- 00:18 **direct row exact** (Stein worker, spectral nodes, mesh of 83 knots to u = 900): D = 0.659781607073, t ≤ 0.21607.
- 00:20 mass-coupling rows (coordinator's idea, E|k|² ≤ 1 − t²): float scan `massrow.py`, best λ = 0.5.
  00:40 semi-direct hinge rows tested (`semihinge.py`): reach 0.244 only, dropped.
- 00:25–00:35 no network to big. 00:36 cores 24–31 lent to the degree-5 worker; my jobs on 0–23 from 00:54; nothing of mine
  on 36–47 from 00:59.
- 00:42 diagnosis of large x for every row (PROGRESS §8): the narrow exact cells show that row 0.4 fails with plain cuts on
  x ∈ [3, 6] (0.7016–0.7104) and row 0.6 on x > 7.1 (0.7048, 0.7088); rows from 0.7 up are certified with room.
- 00:44 **mass row λ = 1/2 exact**: S = 0.165606335315, V̂ ≤ ½t² + ½ + S − ε̂‖Qh‖², below the target for t ≤ 0.2859; no node
  caps, no reduction hypothesis.
- 00:45–00:58 far anchored cap nodes s = 7 … 30 for rows 0.4 and 0.6 (`exttable.py`); better caps for row 0.4 with `otree.py`
  (13 three-direction records on 400×128): second table `s0c/tables_v2/table_0.4.json` with binding.
- 00:50 / 00:58 / 01:03 exact spectral covers (Stein worker): row 0.4 on its first table 0.696337830493, on the second table
  **0.689780757737**; row 0.6 on its extended table **0.693971383018**.
- 01:06 **assembly** (`final/mkfinal.sh`: every piece re-verified from its file, exact envelope, independent re-check of the
  1800 cells): maximum 0.7064129749 at t ∈ [0.8365, 0.8370], **margin 5.761·10⁻⁵ on all of [0, 0.9]**; 1/B = 1.401911.
  `final/env_final_clean.json` (without the direct row, which is not needed), sha256 927b018bebec4826….
- 01:07 replay worker: row 0.4's second table PASS (coverage with the new three-direction check, 527 of 527 pieces, table
  check); sensitivity at far nodes (generator's value up to 8.3·10⁻⁹ above the exact one at s = 30).
- 01:11 Stein worker's final report: pruned certificates (136 / 180 / 204 nodes; identical row constants, checked by
  `mkfinal.sh` at 01:15), `DIRECT_SPEC.md`, what-ifs for the radius and C₆ (N).
- 01:12–01:20 `final/ROW_CONSTANTS.txt`, `final/SPEC_CERT_FORMAT.md`; manifest of 114 files (sha256 c99b3ae5ccb8f165…);
  everything copied to `results/final_0d/` (50 MB) and checked against the manifest on the laptop (114 of 114).
- 01:19 replay of row 0.6's extended table started with the replay worker's tool (`replay/final/ext_0.6/`); the replay of
  row 0.82 is running (`replay/chain4b.sh`).
- 01:23 replay of row 0.6's extended table: PASS (258 of 258 pieces, 119 entries; `replay/final/ext_0.6/`).
- 01:31 replay of row 0.82: PASS (1,556 pieces). All 20 final tables of 18:47 are replayed in full: 14,840 pieces, 0 failed.
  Nothing of mine runs on big from 01:48.
- 01:32 binding of row 0.6's extended table (`s0c/tables_v2/{table,caps,bind}_0.6.*`); replay table check through it: PASS.
- 01:35–01:50 `lean-data/` for the Lean generator (final row set: 14 cap rows + mass row; per row table, binding, bound
  records; law certificates; moment tables; README with formats and hashes; `check_leandata.py` re-derives every cap).
- 01:43–01:45 third full run of `final/mkfinal.sh`: identical result. Manifest 170 files, sha256 cf50cb1134d7b29b….
- 01:47 far-margin variant of rows 0.4 and 0.6 (`final/far_margin.py`, `final/alt_far_margin/`): verified, same envelope.
- 01:50 everything copied off big: archive `results/big_claude-b9ee-capsnu2_2026-11-17.tar.gz` (70 MB, 5,599 entries, sha256
  1365deac78cd5b25…), curated copy `results/final_0d/` (92 MB; 170 of 170 manifest files identical), `lean-data/` (23 MB).
- 01:55 hand-back. State and reading order: `PROGRESS.md` (top).
