<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/PROGRESS.md (17 November 2026, 01:55 Bucharest time: the final statement of the integer certificate); the certificate worker of claude-b9ee. Only this line was added. -->
# Stage 0d — STATEMENT (17 Nov 2026; result 01:06, this text 01:55 Europe/Bucharest): the envelope is certified on all of [0, 0.9]

All values in hat units (B = 0.9765·B̂ + 0.0235). Target B̂* = 1381511/1955511 = 0.7064705849 (B = 5000/7009, K > 1.4018).
**C** = exact certificate re-verified by its exact verifier; **N** = float; **ENV** = the assembled envelope.
**Where everything is** (all under `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/`;
paths like `final/…`, `stein/…`, `s0c/…`, `replay/…` in this file are relative to `results/final_0d/`, which mirrors the droplet
folder `/root/claude-b9ee-capsnu2`):
- `results/final_0d/` — the certificate files, verifiers, tools and replay results (92 MB; 170 of 170 manifest files identical);
- `lean-data/` — the inputs of the Lean generators with their own README and checker (§6.5);
- `results/big_claude-b9ee-capsnu2_2026-11-17.tar.gz` — the complete droplet folder (70 MB). **Nothing exists only on big** (§2).

Sections 0, 2, 4, 5 (first list), 6.4–6.6, 7(d)–(g), 8, 9 and 10 are current (01:55). Sections 1, 3 and the notes after §10
are the earlier state, kept for the derivations, and are superseded where they differ. The droplet's clock is UTC
(Bucharest − 2 h).

## 0. Result

**ENV (exact; every row C): max over t ∈ [0, 9/10] of the envelope = 0.7064129749, at t ∈ [0.8365, 0.8370] (rows 0.835/0.845,
θ = 1/2). Margin to the target 5.761·10⁻⁵.** B = 0.7133123, 1/B = 1.401911.
File `final/env_final_clean.json`, sha256 **927b018bebec4826fa6db8913d0142c1b295be2372ef5c5e426f2d383b9980a5**; built and
re-checked by `final/mkfinal.sh` (three full runs, the last 01:43–01:45, identical result each time). Manifest
`final/MANIFEST_stage0d.sha256`: **170 files** (certificates, tables, bindings, caps files, verifiers, generators, price
code, replay verdicts, the lean-data checksums), its own sha256
**cf50cb1134d7b29b6ff14cc9b9947d37546f3f071198e43f905b28cb3eda756e** (the 103- and 114-file manifests of 01:06 and 01:15 were
earlier states of the same list; every certificate file in them is unchanged). **Exact rationals of every row constant used** (ℓ, β, C per row; λ and S of the mass row):
`final/ROW_CONSTANTS.txt` (sha256 791764065ab82e37…), the same numbers as the `rows` and `mass` sections of the envelope file.

| t-range in the envelope | piece | exact constant | Stein cuts | certificate file | verifier | hypotheses used |
|---|---|---|---|---|---|---|
| [0, 0.2755] | **mass row λ = 0.5**: V̂ ≤ ½t² + ½ + S − ε̂‖Qh‖² | S = 3798855002922010337121170986221578569/22939068096000000000000000000000000000 = 0.165606335315 | spectral (1078 nodes) | `stein/rows_direct/spec/cert_mass_0.5.json` | `verify_spec.py` | moments, Stein cuts. **No row reduction, no node caps** |
| [0.2755, 0.4775] | row 0.4 (ℓ = 0.392676, β = 0.030566) | row bound 0.689780757737 at t0 = 0.4 | spectral (1011 nodes) | `stein/rows_direct/spec/cert_row_0.4b.json` | `verify_spec.py` (gate header of `verify_cert`) | row reduction, node caps of `s0c/tables_v2/table_0.4.json` (119 nodes to s = 30) |
| [0.4775, 0.6405] (mixed with 0.7 from 0.6235) | row 0.6 (ℓ = 0.550619, β = 0.061509) | row bound 0.693971383018 at t0 = 0.6 | spectral (1316 nodes) | `stein/rows_direct/spec/cert_row_0.6.json` | `verify_spec.py` | row reduction, node caps of `stein/rows_small/table_0.6_ext.json` (the final table of 0.6 + 10 far nodes to s = 30) |
| [0.6405, 0.9] | rows 0.7, 0.78, 0.8, 0.82, 0.83, 0.835, 0.845, 0.85, 0.86, 0.87, 0.885, 0.8875 and mixtures | exact (ℓ, β, C) of each row in §9; bounds at t0 in `lean-data/README.md` §1 (0.7: 0.700668504, 0.78: 0.705570400, 0.835: 0.706410954, 0.845: 0.706370765) | plain | `stein/multi_C/` | `verify_cert.py` | row reduction, node caps of `s0c/tables/table_<t>.json` (to s = 6) |

Certified but not used by the envelope: rows 0.74, 0.84, 0.88, 0.89, 0.895, 0.9, and the direct row (λ = 0: D = 0.659781607073,
t ≤ 0.21607). Not certified and not needed: rows 0.05, 0.12, 0.18, 0.23, 0.3, 0.33, 0.5.

**Local maxima of the envelope (margins):** t = 0.275 (mass row / row 0.4): 2.9·10⁻³; 0.477 (0.4/0.6): 9.5·10⁻³; 0.639
(0.6/0.7): 8.5·10⁻³; 0.741 (0.7/0.78): 1.9·10⁻³; 0.803: 1.18·10⁻⁴; 0.811: 1.13·10⁻⁴; **0.837: 5.76·10⁻⁵ (the smallest)**;
0.845: 1.0·10⁻⁴; 0.871–0.887: 1.2·10⁻⁴.

**How it was checked.** `final/mkfinal.sh` re-verifies every piece from its certificate file (`verify_cert.py --rows` on the 18
cut rows of `multi_C`; `verify_spec.py` on the mass row, the direct row, rows 0.4 and 0.6), takes the row constants from those
runs (`final/recheck/`), builds the envelope (`final/finalenv.py`: per cell of width 1/2000 a row, the mass row as its tangent
row at the cell midpoint, or a two-row mixture with θ = j/20) and re-checks all 1800 cells with separate code
(`final/verify_finalenv.py`). It also verifies the **pruned** spectral certificates (`cert_*_pruned.json`: 136, 180 and 204
nodes instead of 1078, 1011, 1316) and checks that they give identical row constants: those are the files to hand to Lean.

**What is not, or was not at 01:10, independently re-checked (the honest list of my message, items 1–4, with their state at
01:55; items 5–7 added for completeness).**
1. *Node caps of row 0.4's second table and the 10 far nodes each of rows 0.4 and 0.6.* (Correction of a count in my message:
   the second table has 25 records that the first did not have: 13 three-direction records on 400×128, 2 two-direction
   quadtree records and the 10 far anchored nodes, the last twelve on 1600×256; I had written "23, all on 400×128".)
   **Now re-checked, PASS**, with the replay worker's exact tool `replay/replay_nu.py`:
   - Row 0.4, `s0c/tables_v2/table_0.4.json` (01:07, replay worker): coverage of the 13 three-direction records (410 leaves;
     new check `cover_generic3`: products of intervals in (τ₀, τ₂, τ₃) must cover ℝ × [0, ∞)², nothing assumed about v₀) and
     of the 6 two-direction ones; exact replay of all 527 bound pieces on their own grids (the 410 three-direction pieces on
     400×128: replayed − stored −1.1·10⁻¹¹ … −2.7·10⁻¹²); table check of all 119 entries through the binding, smallest slack
     2.002·10⁻⁹. Report: `replay/FINAL_REPLAY.md` §2b.
   - Row 0.6, `stein/rows_small/table_0.6_ext.json` (sha256 0cc0a353…, the table named by `cert_row_0.6.json`; 01:23, run by
     me with the replay worker's unchanged tool: `replay/final/ext_0.6/README.txt`): coverage of its 13 route-M records, exact
     replay of 258 of 258 pieces (the 10 far nodes included), table check of all 119 entries, smallest slack 2.0017·10⁻⁹.
   - **A sensitivity at the far nodes (s ≥ 7; no failure):** the generator's stored value is above the exact replay by
     1.3·10⁻⁹ (s = 16), 2.5·10⁻⁹ (20), 4.9·10⁻⁹ (25), 8.4·10⁻⁹ (30), more than the 2·10⁻⁹ margin of the tables from s = 20
     on; a checker whose enclosure is wider than the generator's could fail there. For Lean: replay one far node first
     (s = 30); if it fails, the variant with a margin of 10⁻⁷ at the far nodes is ready and verified (§6.6).
2. *`verify_spec.py` and the spectral generator have one author (the Stein worker).* **Open.** They share no arithmetic (conic
   floats against exact Bernstein pieces with the formulas of `specPolyV`), but there is no second implementation outside
   Lean. The coordinator is setting up an independent check written from the Lean definitions; the file layout it needs is
   in `final/SPEC_CERT_FORMAT.md`.
3. *Replay of the plateau tables 0.8 and 0.82.* **Done, PASS.** Row 0.8: 01:07. Row 0.82: 01:31 (1,556 of 1,556 pieces
   ok, table check of its 137 nodes, smallest slack 2.0019·10⁻⁹). With it **all 20 final tables of 18:47 are replayed in full:
   14,840 of 14,840 pieces, 0 failed, 20 table checks PASS** (`replay/FINAL_REPLAY.md`), plus the two tables to s = 30 above.
   The earlier sensitivity of three off-anchor `routem2v` entries (rows 0.835 at s = 51/100: 1.4·10⁻⁷; 0.845 at 53/100: 6.6·10⁻⁸; 0.83 at 27/50: 3.8·10⁻⁹;
   `replay/FINAL_REPLAY.md` §3a) stands: Lean must use the generator's own enclosure there, or those three entries need caps
   with a margin of 2·10⁻⁷.
4. *Rows 0.4 and 0.6 exist only as spectral rows* (a fact, not a gap): see the next paragraph.
5. The plain-cut verifier `verify_cert.py` (the 18 rows of `multi_C`) is likewise the only implementation of its check
   outside Lean; it is the tool of stage 0c, unchanged.
6. The pointwise majorant behind every cap piece (Theorem 1 of the correction lemma) is taken as proved; the replay tests it
   numerically only (`selftest_pointwise.py`).
7. Shared between generator and replay by design: the float choice of the cell prices (frozen code, §6.3) and the moment
   tables (regenerated in rational arithmetic and compared for equality by the replay worker, for both grids).

**Two rows exist only as spectral rows.** With plain cuts row 0.4 gives 0.7016–0.7104 on x ∈ [3, 6] and row 0.6 gives 0.7048,
0.7088 on x > 7.1 (exact, narrow cells): above the target. With spectral nodes their large-x cells are 1.1·10⁻² and more
below the row maximum. Diagnosis for every row: §8.

**For Lean** (details §6, §7; data in `lean-data/`, §6.5): the spectral row checker is needed for three pieces (mass row,
rows 0.4 and 0.6); rows 0.4 and 0.6 have cap tables of 119 nodes up to s = 30; row 0.4 has 13 three-direction cap records
whose 410 leaves are on the 400×128 grid; the mass row needs the three facts of §7(e) and no caps; the final row set is
14 cap rows and the mass row (§10); a verified variant with a margin of 10⁻⁷ at the far cap nodes is ready if needed (§6.6).

**History of the low end tonight, so that nobody reuses a wrong number:** my direct-row figures 0.281 (23:25), 0.265 (00:00) and
0.204 (00:08) were float models with defects (cut family, law grid cut at u = 30, x ≤ 3); the exact values are 0.21607 for the
direct row (00:18) and 0.2859 for the mass row (00:44).

### Checkpoints asked by the coordinator

- **(a) 23:28, exact, three directions (d₀, v₂, v₃), grid 400×128, generator `otree.py`, 5–7 s per piece.**

  | node | maximiser leaf, half-width 0.1 | cap − Ψ when the tree stopped | leaves |
  |---|---|---|---|
  | row 0.3, s = 0 | — | 1.36·10⁻² | 32 |
  | row 0.3, s = 0.24 | 1.52·10⁻², no variance (float test: 1.6·10⁻²) | 4.40·10⁻² | 37 |
  | row 0.3, s = 0.45 | — | 4.33·10⁻² | 30 |
  | row 0.12, s = 0 | — | 5.02·10⁻² | 36 |
  | row 0.12, s = 0.3 | 2.29·10⁻² | 1.29·10⁻¹ | 30 |

  The maximiser leaf follows the float tests; the node values do not. **Hedge (00:01, tuned generator: weighted variance with a
  level search, trees run until no bisection in any of the three directions helps; exact):** row 0.3: 4.25·10⁻² (s = 0.24,
  33 leaves), 3.67·10⁻² (s = 0.45, 29 leaves); row 0.23: 5.97·10⁻² (s = 0.4); row 0.4: 9.1·10⁻³ (s = 0.12), 1.86·10⁻² (s = 0.3).
  The limit is the price variance for the fourth and fifth negative directions. Budgets (about 2.5·10⁻² in the weighted mean):
  **row 0.3 misses by about 10⁻², row 0.23 by about 3.5·10⁻².** The generator serves rows 0.33 and 0.4 (bridge).
- **(b)** stop rule 03:00: not needed (the low rows were dropped at 00:10 in favour of the direct and mass rows).
- **(c)** 01:06: the assembly covers all of [0, 0.9] (§0), not only [0.29, 0.9].

## 1. Earlier state (22:40), kept for the record: superseded by §0 where it differs

The table of exact plateau certificates in 1a is still valid (rows 0.7: 0.700668504 and 0.78: 0.705570400 were added at 00:05;
row 0.6 and row 0.4 exist only as spectral rows, §0). The envelope `multi_A` of 1b and the model table 1c are superseded.

### 1a. Exact row certificates (C; `verify_cert --rows` PASS; value = row bound at the row's nominal t0)

| row | mode | exact row bound | used in ENV |
|---|---|---|---|
| 0.74 | cheap | 0.7063085050 | yes |
| 0.8 | coarse | 0.7064261596 | yes |
| 0.83 | fine | 0.7063454924 | yes |
| 0.835 | fine | 0.7064109539 | yes |
| 0.84 | coarse | 0.7065779829 (above target at its own point; covered by mixtures of its neighbours) | present, never the minimum |
| 0.845 | fine | 0.7063707645 | yes |
| 0.85 | fine | 0.7063607100 (finished 22:32, not yet in ENV) | next assembly |
| 0.86 | coarse | 0.7063559742 | yes |
| 0.87 | coarse | 0.7063448270 | yes |
| 0.88 | coarse | 0.7063500747 | yes |
| 0.885 | coarse | 0.7063468546 | yes |
| 0.8875 | cheap | 0.7034043150 | yes |
| 0.89 | cheap | 0.6978484498 | yes |
| 0.895 | cheap | 0.6867730650 | yes |
| 0.9 | cheap | 0.6757484498 | yes |

A row's bound is V(t) = (t − ℓ)² + c with its minimum at t = ℓ, not at t0. (My 18:40 statement "rows 0.78 and 0.6 certify above
the target" was true only at their t0; at their ℓ the old cheap certificates were below. Rows 0.4 and 0.84 were really above.)

### 1b. The assembled envelope (ENV; `mkenv` + full `verify_cert`, folder `stein/multi_A`, 22:28)

- Rows as marked in 1a. `verify_cert` on the whole folder: **VERIFIED**, 288 cells, rc = 0.
- On [0.74, 0.9]: maximum 0.7064643446 at t ∈ [0.8055, 0.8060], rows 0.8/0.83, θ = 129/200. Profile (t: value):
  0.740: 0.706230, 0.753: 0.706384, 0.766: 0.705982, 0.779: 0.705882, 0.792: 0.706129, 0.805: 0.706464, 0.818: 0.706298,
  0.831: 0.706371, 0.844: 0.706371, 0.857: 0.706363, 0.870: 0.706345, 0.883: 0.706346, 0.896: 0.684564.
- On [0, 0.9] this folder certifies only B̂ = 0.850838580 (maximum at t = 0.3015, row 0.74 against the crude row): the cells
  above the target are exactly t ∈ [0, 0.649], where no small-t row is in it yet.
- The binding plateau point moved from the model's t ≈ 0.837 to t ≈ 0.8055 (rows 0.8 and 0.83 are 0.03 apart; row 0.82 sits
  between them). The mixtures near t = 0.84 are certified here exactly, not by the model.

### 1c. Model predictions (N; `lawsocp_captable.py` on the final cap tables; Stein adds about +5.5·10⁻⁵)

| row | ℓ | model value at t0 | c = minimum over t | covers (model) |
|---|---|---|---|---|
| 0.78 | 0.748 | 0.705046 | 0.704041 | [0.699, 0.798] |
| 0.7 | 0.648 | 0.699383 | 0.696627 | [0.548, 0.747] |
| 0.6 | 0.551 | 0.693579 | 0.691139 | [0.427, 0.674] |
| 0.4 | 0.393 | 0.695711 | 0.695658 | [0.289, 0.497] |
| 0.3 (table not final) | — | 0.719602 | above target | nothing |
| 0.12 (table not final) | — | 0.727062 | above target | nothing |

So with rows 0.4, 0.6, 0.7, 0.78 the model covers **[0.289, 0.9]**; the overlaps are wide (0.07 and more), so the +5.5·10⁻⁵ of the
Stein covers cannot open a gap between them.

## 2. State of big and of the copies (01:55): nothing runs, nothing exists only on big

- **Running on big: nothing of mine** since 01:48 (the replay chain ended at 01:31; queues and loops are stopped). My cores:
  0–15 at the end (16–23 lent to the content worker at about 01:30, 24–47 before); none in use now.
- **Everything is copied to the laptop**, under
  `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/`:

  | what | where | size |
  |---|---|---|
  | the complete folder `/root/claude-b9ee-capsnu2` (5,599 entries, 5,360 files, 334 MB), as one archive; sha256 1365deac78cd5b252e7212aee1e92d8761d79f8de42043f3fefeff8fede1f686; `gzip -t` ok; entry count equal to the folder's; all 170 manifest files found in it with their hashes | `results/big_claude-b9ee-capsnu2_2026-11-17.tar.gz` | 70 MB |
  | the curated expanded copy (same relative paths as on big): `final/`, every file of the manifest, the Stein worker's spectral tools, certificates and working logs (`stein/rows_direct/`), the plain-cut certificate `stein/multi_C/` and tools, the replay tool and all its results (`replay/`), tables, bindings, caps files, generators, price code, moment tables; checked against the manifest on the laptop: 170 of 170 identical | `results/final_0d/` | 92 MB, 1,163 files |
  | the inputs of the Lean generators (§6.5) | `lean-data/` | 23 MB, 87 files |

  **Only in the archive, not expanded** (239 MB, 4,198 files; nothing of it is needed to re-verify or to use the certificate):
  the working folders of the plain-cut Stein covers (`stein/rows_cert` 103 MB, `stein/rows_cert_fine` 54 MB,
  `stein/rows_small/<t>*` 19 MB, `stein/rows` 18.5 MB: chunk outputs and logs), the superseded assemblies `stein/multi_A`,
  `multi_B`, the caps files of the HOLD rows, queue logs, and a second copy of `lean-data/`. `ARCHIVE_README.txt` at the top of
  the archive describes every folder; `final/SYMLINKS.txt` lists its 51 symbolic links (all pointing inside the folder).
- **The droplet folder can be destroyed.** I deleted nothing on big.
- `results/final/` in the handoff folder is the stage-0c copy of 16 Nov 18:47 (the 20 first tables); it is superseded by
  `results/final_0d/` and kept only as history.
- **Trial files, not results** (they sit next to the result in `final/`): `env_test.json`, `env_0052.json`, `env_0058.json` are
  envelopes built at 00:10–00:50 before all pieces existed (679, 137 and 67 cells above the target); `env_final.json` is the
  final envelope with the unused direct row included (same maximum). **The result is `env_final_clean.json` only.**
- The Python environment of the tools was `/root/venv` (Python 3.12.3; `final/venv_pip_freeze.txt`: numpy 2.5.5, scipy 1.18.1,
  cvxpy 1.9.3, clarabel 0.11.1, scs 3.3.2, mpmath 1.3.0). The verifiers need the standard library only.

## 3. The low end: the direct row and why the broken rows are dropped (written 23:35–00:10; outcome first)

**Outcome (01:10).** Exact: direct row D = 0.659781607073 (t ≤ 0.21607), mass row λ = 0.5 with S = 0.165606335315
(t ≤ 0.2859); both with spectral nodes on a mesh reaching u = 900. The mass row alone is used by the envelope on [0, 0.2755];
the junction to the cap rows is made by row 0.4 on its second table (no row 0.33, no row 0.3). The float figures quoted below
for the direct row (0.6275, 0.2810, 0.6715, 0.187) are superseded by these exact values; the text is kept because it has the
derivation and the reasons.

**The direct row.** Notation of `Grothe/LowerAnalytic/WitnessCap.lean` on master: h = (f+g)/2, k = (f−g)/2, t = ‖Ph‖,
Qh = P₂,₁h, q = Qk = P₂,₁k. The identity in hat units (`VhatOf`; ε̂ = 25/31, ν̂ = 47/1953):

    V̂ = t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖q‖² − 2ν̂‖k‖².

Drop −‖Pk‖². With |k| ≤ 1 and σ = ‖q‖: ε̂σ² − 2ν̂‖k‖² = E[2ε̂ Re(k̄q) − 2ν̂|k|²] − ε̂σ² ≤ E φ(|q|) − ε̂σ², where

    φ(r) = sup over 0 ≤ y ≤ 1 of (2ε̂ry − 2ν̂y²) = ε̂²r²/(2ν̂) for r ≤ 2ν̂/ε̂,  2ε̂r − 2ν̂ beyond   (convex, Lipschitz 2ε̂).

Hence V̂ ≤ t² + D − ε̂‖Qh‖², D = sup over σ ∈ [0, ρ] and over the laws of U = |q|²/σ² of E φ(σ√U) − ε̂σ²: the row
(ℓ, β, C) = (0, 0, D) with its retained square, exactly like `crudeRow` (which is the case ν̂ = 0: φ = 2ε̂r, D = ε̂ρ²).
It uses the moments (H4) and the Stein cuts (H3) of the law of |q|², nothing else: **no row reduction (H1), no fibre
potential, no node caps (H2), no pieces.** My earlier "[0, 0.0947] at radius 0.93" was the crude row t² + ε̂ρ²; it ignores the
term −2ν̂‖k‖², which is worth 2ν̂ = 0.0481.

| ρ | moments + radius only: D, covers t ≤ | moments + radius + SPECTRAL cuts (`lawsocp.py`; NOT what the exact covers check): D, covers t ≤ |
|---|---|---|
| 0.973612157 (Lean) | 0.714851, nothing (misses by 8.4·10⁻³ at t = 0) | 0.627518, **0.2810** |
| 0.95133 | 0.683922, 0.1502 | 0.627520, 0.2810 |
| 0.9387 | 0.665936, 0.2013 | 0.627518, 0.2810 |
| 0.93 | 0.653699, 0.2297 | 0.627520, 0.2810 |

(N: float SOCP of `s0c/directrow.py` on the law grid of `lawsocp.py`.) With the spectral cuts the radius is not binding: the worst
law has E√U = 0.91529 at σ = 0.914, x = 0.90, so D = ε̂·0.9153² − 2ν̂ + 3·10⁻⁵ for every ρ ≥ 0.9153. Without any cut
D = ε̂ρ² − 2ν̂ + 4.3·10⁻³ (the adversary puts a little mass near q = 0).

**Correction (23:50): which cuts.** `lawsocp.py` models the integration-by-parts identity with the two *separate* spectral
budgets (2P + Q = x², Q ≤ x²/3): Lean's `spec` family. `scover2.py` / `verify_cert.py` check nodes with the *plain* cuts `cutG`
only. A semidefinite model of exactly that class (`s0c/plaincut_sdp.py`: moments and M(law) ⪰ 0 for the quadratic form of
`cutG` on the certificate's mesh; N) gives:

| | plain cuts | spectral cuts |
|---|---|---|
| radius sup E√U (by x: 0.890 at 0, 0.926 at 0.9, 0.941 at 1.5, 0.9445 at 2, 0.921 at 3, 0.872 at 4, 0.670 at 6) | 0.9445 | 0.9153 |
| direct row D, covers t ≤ | 0.6715 (x ≈ 2), 0.187 | 0.6275 (x = 0.9), 0.2810 |
| row 0.4 at small x (model of its final table) | 0.6968 | 0.6955 |

On the plateau the two classes agree to 6·10⁻⁵ (measured against the exact covers), which is why this did not show earlier.

**Exact check with plain cuts (running since 23:30; expected D ≈ 0.672).** The same Stein cover as for any row, on the exact table of φ instead of a cap table
(`stein/rows_direct/`: `mkdirect.py` writes the table, `direct_row.sh` runs the chain, `verify_direct.py` is `verify_cert.py`
with the gate header replaced by the exact check caps ≥ φ; the tools need δ < ε̂, so the row is fed in the scaled variable
σ′ = 3σ/4: Ψ(s) = φ(4s/3), κ = ε̂·16/9).

**Exact check with spectral cuts (being built since 23:55, `stein/rows_direct/spec/`).** A node = a polynomial majorant plus one
spectral cut, the object of Lean's `TB.specNode` with the coefficients of `specPolyV`; the proposer is one conic programme per
node (the constraint is convex in the cut parameters); the exact check is the Bernstein-piece check of `verify_cert.stein_node`
with the spectral polynomial in place of the cut sum. Expected D ≈ 0.6276 (N).

**Why the broken rows are dropped (C against N, measured tonight).** At the broken maximiser the majorant has 3 to 5 negative
directions, mixed across blocks 0+3 and 1+2; the old quadtree vectors (v₃ from the maximiser, v₂ from the symmetric anchor) were
badly aligned (v₂ orthogonal to the direction it should control). Aligned v₂, v₃ and a third direction d₀ fix the maximiser leaf
(checkpoint (a)) but the lowest rows stay outside their budgets without more tuning. Not needed any more.

**The bridge [0.28, 0.29].** Row 0.4 (ℓ = 0.3927) needs its constant lower by 1.7·10⁻³ to reach 0.281; aligned directions
give that on its loose nodes (float: 1.1·10⁻² against 2.8·10⁻² at s = 0.3). Alternative: one new row near t = 0.33–0.36 (being
optimised). Whichever is certified first with a safe overlap is used; the other is dropped.

## 4. IF I AM INTERRUPTED: next commands (final state, 01:55)

**Nothing has to be continued; the task is complete and handed back.** To re-verify the result from the laptop copy
(standard library only; the three commands are light, but the first two take a few minutes on four processes):
```sh
cd /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/results/final_0d
python3 -I stein/tools/verify_cert.py stein/multi_C 4 --rows /tmp/rows_cut.json            # the 18 plain-cut rows
for c in mass_0.5 row_0.4b row_0.6; do STEIN_TOOLS=$PWD/stein/tools python3 -I stein/rows_direct/spec/verify_spec.py stein/rows_direct/spec/cert_${c}_pruned.json 4; done
python3 -I final/verify_finalenv.py final/env_final_clean.json                              # the envelope from the row constants
python3 -I ../../lean-data/check_leandata.py                                                # the Lean inputs fit together
```
On a machine with the folder at `/root/claude-b9ee-capsnu2` (extract the archive there) the whole assembly is one command:
`bash final/mkfinal.sh 12 0-15` (3 minutes; `final/mkfinal.log` must show `CERTIFIED t in [0.0000, 0.9000] … margin 5.761e-05`
twice and `done`). The replay of the cap pieces: `replay/FINAL_REPLAY.md` §5 (rerun recipe), `replay/final/ext_0.6/ext06.sh`.
How the pieces were produced: spectral covers `stein/rows_direct/spec/DIRECT_SPEC.md` §2; the better caps of row 0.4
`otree.py` (usage in its header); far nodes `capsrow.py … mode=anchored` at s = 7 … 30, then `exttable.py`; bindings
`bindtable.py`; the Lean inputs `final/mkleandata.py`; the far-margin variant `final/far_margin.py` (§6.6).

## 5. Formats (for `LEAN_STAGE2_DESIGN.md`)

No format of an existing file changed. Additions since 18:40 (the last five items are of 17 Nov, 00:00–01:15):

- Cap records of kind **`routem3q`** (three directions; generator `otree.py`): as `routem2q`, plus `details.v0` (a rational
  12-vector of any support, orthogonal to v2, v3 up to rounding), `details.grid` = [400, 128], `details.how`; leaves of kind
  `qbox3` whose `recipe.cons` holds up to three constraints with vectors ±v0, ±v2, ±v3 (an interval, or a half-line with
  `hi: null`; a constraint on −v0 with `hi: null` means τ₀ ≤ −lo). The leaves tile ℝ × [0, ∞)² in (τ₀, τ₂, τ₃). Only row 0.4
  has such records (13 in its table).
- **Grid of a piece:** `recipe.nq` = 128 means the grid 400×128 (moment tables `s0c/grid400/moments_400_128.json`); 256 and
  1024 mean 1600×256 and 1600×1024 as before. Only the `otree.py` pieces of row 0.4 are on 400×128.
- **Tables to s = 30:** `s0c/tables_v2/table_0.4.json` (row 0.4, second table; its records in ONE file
  `s0c/tables_v2/caps_0.4.jsonl`, binding `s0c/tables_v2/bind_0.4.json`, marker `FINAL_0.4`) and
  `s0c/tables_v2/table_0.6.json` (row 0.6, extended table; the same file as `stein/rows_small/table_0.6_ext.json`, sha256
  0cc0a353…; = `s0c/tables/table_0.6.json` + 10 far anchored nodes; its records in ONE file `s0c/tables_v2/caps_0.6.jsonl` =
  `caps_0.6.jsonl` followed by `far_0.6.jsonl`; binding `s0c/tables_v2/bind_0.6.json`, made 01:32, all 119 entries).
  Same JSON format as every table.
- **Spectral row certificates:** `stein/rows_direct/spec/cert_*.json`; format in `final/SPEC_CERT_FORMAT.md` (and
  `stein/rows_direct/spec/DIRECT_SPEC.md` of the Stein worker). Use the `*_pruned.json` files.
- **Final envelope:** `final/env_final_clean.json` = {step, target, eps, rows: {name: {ell, beta, C}}, mass: {name: {lam, S}},
  cells: [[row_i, row_j, θ, exact value]]} for the 1800 cells of [0, 9/10]; a mass row appears as [name, name, "0", value] and
  stands for its tangent row at the cell midpoint.

Additions of 16 Nov:

- Cap records of kind **`routem2q`** (quadtree; `s0c/caps_<t>.jsonl`): record fields `t, s, kind, cap, psi, psi_sym,
  cap_minus_psi, quads, details, secs`; `details = {pieces, tried, v2, v3, plist, tol}`; `details.plist` is the list of leaves,
  each `{kind: "qbox", desc, exact, value, nq, q, recipe}` with the same `recipe` as a route-M piece
  (`{y, var, nq, cons: [{v, lo, hi}, …], …}`): the region of a leaf is given by `recipe.cons` only (`v` = ±v2 or ±v3 as exact
  rationals, `lo`/`hi` rationals, an open side has no bound), `q` = the exact quadratic [q0, q1, q2] in s, `exact` its value at
  the node. The regions are axis-aligned in (τ₂, τ₃) = (v2·m, v3·m); the quadrant τ₂, τ₃ ≥ 0 is tiled and the two symmetries
  give the rest (exactly the situation the replay's generic coverage check handles). `psi` is the best J found (float,
  information only); `psi_sym` the symmetric maximum.
- Table files `s0c/tables/table_<t>.json`: unchanged; `src` may now read `quad:routem2q@<s>`.
- Stein row folders: unchanged format; new location `stein/rows_small/<t>/` for rows 0.4, 0.6, 0.7, 0.78.
- Tested and **not used**: `selfglobal.py` (records `kind: "global"`, `details.method`), written only to `s0c/sg_test.jsonl`.

## 6. FOR THE LEAN WORKER (answers to the three points of `LEAN_STAGE2_DESIGN.md`; written 23:10)

### 6.1 Which record certifies each table entry: binding files exist for all 20 final tables

`s0c/tables/bind_<t>.json` (tool `s0c/bindtable.py`, format `table-binding-1`; it will be run for every table still to come,
right after the table is made final). One file per table:

```
{format, t, table, table_sha256, caps_file, margin: "2e-9", win: "0.011", dropmirror: true,
 records: {"L<line>": {line, sha256, kind, s, cap, nq, pieces, mirror_dropped, v2, v3, coverage}},
 entries: [{i, s, cap, src, record, value, slack, chord}],  stats, problems: []}
```

- `entries[i]` is the i-th node of the table. For a `quad:` entry, `record` = `"L<line>"`: the record is line number `line`
  (0-based) of `s0c/caps_<t>.jsonl`, and `sha256` is the hash of that line without its newline. `value` is the exact maximum of
  the record's quadratics **at the entry's own s** (the entry may sit up to 0.011 from the record's anchor: a neighbour's
  certificate), and cap = ⌈value + 2·10⁻⁹⌉ at 10⁻¹² holds **exactly** for every one of the 2,468 `quad` entries (checked with
  fractions; slack 2.000–2.001·10⁻⁹ everywhere). The selection is the table builder's: per (kind, anchor) the record with
  recipes on every live piece (anchored: 64 cells per quarter) and the least value at its anchor, first in file order on ties.
  The seven lower records without recipes are never bound.
- `records[..].pieces` = indices into `details.plist` of the live pieces to check (null for `anchored`/`global`: the record's own
  `recipe` is the piece). For every (entry, piece) the tool checked q_piece(s_entry) + 2·10⁻⁹ ≤ cap with fractions.
- Counts ((entry, piece) checks, anchored and global entries counting one each): 0.4: 325, 0.6: 317, 0.7: 506, 0.74: 259,
  0.78: 417, 0.8: 1,876, 0.82: 1,818, 0.83: 1,672, 0.835: 1,259, 0.84: 1,553, 0.845: 1,316, 0.85: 1,208, 0.86: 904, 0.87: 894,
  0.88: 860, 0.885: 796, 0.8875–0.9: 97 each. Total **16,368** over 2,722 entries (2,468 `quad`: 1,567 anchored, 329 global,
  276 `routem1`, 143 `routem2`, 75 `routem2v`, 78 `routem2q`; 254 chord), 2,340 distinct records, 13,025 live pieces of which
  303 mirror pieces are dropped; 206 entries use a neighbour's record.
- **One thing you must know about chord entries.** The table builder takes a chord node's cap from the chord of the *certified
  values* of its two ends (+ 2·10⁻⁹, rounded up at 10⁻¹²), while the two end caps are rounded up separately. So the chord of the
  two **table caps** can exceed the chord node's cap by less than 10⁻¹²: this happens at 72 of the 254 chord entries (worst
  8.3·10⁻¹³; `slack` < 0 in the binding). With both end caps lowered by 10⁻¹² the chord is never above the cap (checked for every
  chord entry). If `chordOK` compares with the table caps of the ends as they are, it fails there. Cheapest remedy, with no
  change of any table (they carry Stein certificates): check the vertex nodes at cap − 10⁻¹² (their certified values are
  2·10⁻⁹ below their caps) and feed `chordOK` those lowered caps. Tell me if you need the tables changed instead.

### 6.2 Mirror pieces: dropped in the bindings; the finished tables need no re-emission

A piece whose region lies wholly in τ₂ ≤ 0 or wholly in τ₃ ≤ 0 is left out of `pieces` and listed in `mirror_dropped`, **after**
the replay's generic coverage check (`replay_nu.cover_generic`, independent code, exact) passed on the record without it. That
is the case for every record: 303 pieces in 7 tables (0.8: 93, 0.82: 50, 0.83: 67, 0.835: 30, 0.84: 26, 0.845: 32, 0.85: 5; my
criterion is the closed half-plane, so it contains your 180). Tables, `FINAL_<t>` hashes and Stein certificates do not change:
a cap is an upper bound of the remaining pieces. The cap records themselves are not rewritten (their line hashes are the
identity of a certificate). The quadtree (`routem2q`) never produces such pieces.

### 6.3 The grid of the small-t rows

**Measured (C).** `s0c/regrid.py` re-certifies stored leaves on another grid with the same anchors, variance vectors and
constraints (only the cell means, prices, exact integration and S-lemma multipliers are recomputed; no search). On 400×128
(moment tables built in 5 s by `tools/moments_full.py 400 128`; `s0c/grid400/moments_400_128.json`, sha256 35ec3519…f02d95):

| | records, leaves | all certified | change of the record's cap | worst single leaf (not binding) | seconds per piece |
|---|---|---|---|---|---|
| row 0.6 | 4, 62 | yes | +3.1·10⁻⁵ … +4.3·10⁻⁵ | +3.0·10⁻³ | 1.4 |
| row 0.78 | 4, 66 | yes | −7.6·10⁻⁶ … +3.8·10⁻⁵ | +7.4·10⁻⁴ | 1.3 |
| row 0.4 | 4, 51 | yes | +2.8·10⁻⁵ … +1.4·10⁻⁴ | +2.8·10⁻³ | 1.3 |
| reference: row 0.6 on 1600×256 | 1, 9 | identical to the stored values (difference 0) | 0 | 0 | 6.0 |

(409,600 → 51,200 cells is a factor 8 by my count, not 16.) So (a) is **yes**: about 30 CPU-minutes for all used leaves, and
the caps lose 3·10⁻⁵ to 1.4·10⁻⁴, far inside the margins of those rows. (b) Nothing blocks it for the leaves and the global
pieces; for anchored nodes `nucert.CertTablesQ` reads `moments_1600_<4·nqq>.json` by name and needs the radial count as a
parameter (two lines, not done).

**Decision.**
1. **Rows 0.4, 0.6, 0.7, 0.78 stay on 1600×256.** Their tables are final and their Stein covers have been running since 22:19.
   The real size is far below the estimate of your §6: the four tables use **952 leaves** (1,260 certificates' pieces when
   anchored and global records count one each; 1,565 (entry, piece) checks), not 5,000–13,900. That is about 8 vCPU-h at your 22 s per piece
   (56 at today's 160 s). Changing their grid would change every cap by 10⁻⁵–10⁻⁴, hence the tables, hence four new Stein
   covers (2.5 hours of big) to save about 7 vCPU-h. If you want them on 400×128 all the same, say so: it is one `regrid.py`
   pass plus the Stein reruns, and can be done at any time before the Lean rows are generated.
2. **Every quadtree row produced from now on (the low end, §3) is generated on 400×128 from the start**, pieces and tables.
   Those rows are the ones where leaf counts can become large.
3. Each piece names its grid in `recipe.nq` (angular count; radial count = 1600 for 256 and 1024, 400 for 128), so a row may mix.

**(c) Price code: frozen as of 23:10.** No function below changes without a note in this section first.

| what | function | file (same bytes on the laptop and on big) | sha256 |
|---|---|---|---|
| dual prices (12 damped Newton steps, 24 halvings, tol 10⁻¹³), and g ≤ γ*(R), centres c₀, c₁ | `nucells.dual_prices_fast`, `nucells.nu_cell_data` | `caps-stage0c-2026-11-16/nucells.py` | e3215b70dc8f3122956dd83374358eb4e609356a117b7c1278b195b3b442cd4f |
| cell means of route-M, global and quadtree pieces (2×2 Gauss points, unweighted; variance term e = Σ\|B·f\|²) | `midnu.SetupNu.moments` | `caps-stage0-2026-11-15/midnu.py` | 396cb7588d8aa881fe5b42aef27122816da0563dc74d5c3d366ddbf0a06b8951 |
| cell means of anchored nodes (table means) | `capnu.CapRow.cell_moments` | `caps-stage0-2026-11-15/capnu.py` | 1480a265b83844bb401a14298a76b3f2519cbe2cacb21b874e85003247f3039a |
| the call sequence for pieces: moments → `dual_prices_fast` → repair `d₂d₃ − ν² ≤ 10⁻⁹ν²` ⟹ d₂, d₃ += 2ν → `nu_cell_data` | `midnu_x.SetupNuX.integrate_nu` | `caps-stage0c-2026-11-16/midnu_x.py` | fc7fc00da092f143bd035ed2a7b17ad7abdee6a53438f4155c91a3f2f3917951 |
| the call sequence for anchored nodes: `cell_moments` → `dual_prices_fast` | `nucert.py` (line 91) | `caps-stage0c-2026-11-16/nucert.py` | 43d63cb90c15d79d291db5f85ffa3e27fb091c22848b9ea8d352b3f011ba427d |

`qtree.py` was changed tonight (which pieces are tried, and along which vectors the variance lies); it never touches the price
code, and the pieces of the four final tables were produced before those changes. Variance vectors of new quadtree pieces may
have any support (not block by block): they are data of `recipe.var`, as before.

### 6.4 Directions: nothing in the final tables leaves v₂ (block 2) and v₃ (block 3). One question before I go further

All 20 final tables constrain only ±v₂ and ±v₃ of their node. For the low end (t < 0.29) two directions are not enough
(§3: 3 to 5 negative directions at the maximiser). I am testing, in float only so far, leaves that are **products of three
intervals**: τ₂ ≥ 0 and τ₃ ≥ 0 as now, plus a third direction d₀ orthogonal to v₂ and v₃ with *mixed* support (blocks 0+3 or
1+2), tiled over the whole line. Your §6 says `capCoverOK` knows d₀ "of any support". **Please confirm:** is `capCover_sound`
valid as it stands for ds = [d₀, v₂, v₃] with an arbitrary nonzero d₀ (the cover being checked on ℝ × [0, ∞)² with no symmetry
used for d₀)? If d₀ must lie in block 0, say so. I produce no such row before the answer. I will not constrain a block-1
direction or two directions inside one odd block without asking first.

**Outcome (17 Nov).** The coordinator confirmed from the Lean source that `capCoverOK` takes ds = [d₀, d₂, d₃] with d₀ of any
support and no new lemma. The certificate has **13 such records, all in row 0.4** (kind `routem3q`, 410 leaves `qbox3`, grid
400 × 128): one d₀, one v₂ (block 2), one v₃ (block 3) per node; every leaf has exactly three constraints, on +v₀ or −v₀, +v₂,
+v₃; v₀ lives on blocks 0 and 3 in 11 records, on blocks 0, 1, 3 in one (s = 63/100) and on all four blocks in one
(s = 18/25); nothing uses orthogonality of v₀ to v₂, v₃ (it holds up to 7.5·10⁻⁷). No other row has a third direction.
The exact format, with the counts of each constraint type: `lean-data/README.md` §2.

### 6.5 `lean-data/`: the inputs of the generator in one folder (17 Nov 01:40)

`/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0c-2026-11-16/lean-data/` (23 MB, 87 files;
`README.md` with every file's sha256 and the formats; `SHA256SUMS` sha256 e7ab01760532e6472e12b7a62a48b9d04d242a0a5260030a1503c2f85cbe6a40):

- `rows/row_set.json`: **the final row set**, 14 cap rows (proposed numbering 0 … 13 in increasing t: 0.4, 0.6, 0.7, 0.78,
  0.8, 0.82, 0.83, 0.835, 0.845, 0.85, 0.86, 0.87, 0.885, 0.8875) and the mass row (in the place of the crude row), each
  with its exact constants, θ, files, hashes and counts; `rows/env_final_clean.json`, `rows/ROW_CONSTANTS.txt`.
- `tail-caps/<t>/{table.json, bind.json, records.jsonl, index.json}` per cap row, laid out as `LEAN_STAGE2_DESIGN.md` §15
  expects: `records.jsonl` holds exactly the bound lines of the caps file (bytes unchanged, each matching the binding's
  sha256). Rows 0.4 and 0.6 are there with their tables to s = 30.
- `law/plain/row_<t>.json` (12 rows), `law/spectral/cert_*_pruned.json` (mass row, rows 0.4, 0.6), the two verifiers and
  `law/SPEC_CERT_FORMAT.md`; `moments/` (the three moment tables, 400 × 128 included).
- `check_leandata.py` (standard library): verifies the checksums, **re-derives every table cap from the bound records with
  exact fractions**, compares the tables inside the law certificates with the cap tables, recomputes the envelope. PASS on
  big and on the laptop copy.
- Totals of the final row set: 2,012 table entries (1,774 quad, 238 chord), 153 neighbour entries, 1,677 bound records
  (1,082 anchored, 163 global, 206 `routem1`, 119 `routem2`, 40 `routem2v`, 54 `routem2q`, 13 `routem3q`), 10,932 bound
  route-M pieces (277 mirror pieces dropped), 13,618 (entry, piece) checks, 71 tight chords. Grids of the bound pieces:
  410 on 400 × 128 (the `routem3q` leaves), 114 on 1600 × 1024, everything else on 1600 × 256; **no anchored or global record
  is on 400 × 128**. (The numbers of §6.1 are for the 20 tables of 18:47: 206 neighbour entries there; the six unused rows
  and the first tables of rows 0.4 and 0.6 are not in `lean-data/`.)

### 6.6 Far cap nodes: a verified variant with margin 10⁻⁷ is ready, in case Lean's check of a far node fails

`results/final_0d/final/alt_far_margin/` (on big `final/alt_far_margin/`; script `final/far_margin.py`, exact, standard library,
no solver; built and verified in 50 s at 01:47). For rows 0.4 and 0.6: tables with the ten far caps (s = 7 … 30) raised by
9.8·10⁻⁸ (margin 10⁻⁷ instead of 2·10⁻⁹), bindings, full and pruned law certificates with y0 raised by 9.8·10⁻⁸ at every
node (`verify_spec.py` PASS: row bounds 0.689780855737 and 0.693971481018, i.e. 9.8·10⁻⁸ above the certificate's), replay
table checks PASS, envelope `env_alt.json` with the **same maximum 0.7064129749 and margin 5.761·10⁻⁵**. It is **not the
certificate of record** (the certificate is valid as it is: the exact replay is below every far cap by 2·10⁻⁹ and more);
switch to it only if the kernel's own enclosure at s ≥ 20 turns out wider than the generator's. Advice to the Lean worker:
replay the s = 30 record of row 0.4 or 0.6 first.

## 7. DIRECT ROW: what Lean must prove (written 23:40 against `Grothe/LowerAnalytic/WitnessCap.lean` and `Grothe/Lower/` on master)

Status of the numbers: the constant D is **N (float model) until the exact cover of §3 ends**; the statement and its proof
steps below do not depend on its value.

Notation of master: for a unimodular pair, `hOf`, `kOf` (h = (f+g)/2, k = (f−g)/2), `tOf` = ‖P₁,₀h‖, `QhOf`, `QkOf`, `PkOf`,
`VhatOf`, and `VOf_eq_hat : VOf n e ν f g = (1 − ν) * VhatOf n e ν f g + ν` with
V̂ = t² − ε̂‖Qh‖² − ‖Pk‖² + ε̂‖Qk‖² − 2ν̂‖k‖² (the docstring of the file; ε̂ = `epsHat e ν` = 25/31, ν̂ = `nuHat ν` = 47/1953).

### (a) The pointwise inequality — NEW, elementary (my estimate: 60–100 lines)

Define φ : ℝ → ℝ, φ(r) = ε̂²r²/(2ν̂) for r ≤ 2ν̂/ε̂ and 2ε̂r − 2ν̂ for r ≥ 2ν̂/ε̂ (the two formulas agree at the joint).

1. Scalar fact: for 0 ≤ y ≤ 1 and r ≥ 0, 2ε̂ry − 2ν̂y² ≤ φ(r). (φ(r) − (2ε̂ry − 2ν̂y²) = 2ν̂(y − ε̂r/(2ν̂))² in the first case
   and 2(1 − y)(ε̂r − ν̂(1 + y)) ≥ 0 in the second, since ε̂r ≥ 2ν̂ ≥ ν̂(1 + y).)
2. Hypotheses on k and q: only `norm_kOf_le` (‖k x‖ ≤ 1 a.e., proved on master for a unimodular pair) and q = `QkOf n f g`
   = P₂,₁k. Then, with σ = ‖q‖,

       ε̂σ² − 2ν̂‖k‖²  =  ∫ (2ε̂ Re(conj(k x) · q x) − 2ν̂‖k x‖²) dγ − ε̂σ²  ≤  ∫ φ(‖q x‖) dγ − ε̂σ².

   The equality is `re_inner_starProjection` (Re⟪k, P₂,₁k⟫ = ‖P₂,₁k‖², the same step as the private lemma
   `norm_sq_starProjection_le_integral` of the crude row) and ‖k‖² = ∫‖k x‖²; the inequality is fact 1 pointwise with
   y = ‖k x‖, r = ‖q x‖ and Re(conj(a)b) ≤ ‖a‖‖b‖. Integrability: φ(r) ≤ 2ε̂r and q ∈ L².
3. With the identity: V̂ ≤ t² − ε̂‖Qh‖² + (∫ φ(‖q x‖) dγ − ε̂σ²) (the term −‖Pk‖² is dropped, as in `rowOf_crude`).

### (b) The law-layer bound ∫ φ(‖q x‖) dγ − ε̂σ² ≤ D — EXISTING row machinery, with a table of φ instead of a cap table

- **The law.** For σ > 0, U(x) = ‖q x‖²/σ². This is exactly the law used today for the crude-row input: in
  `norm_starProjection_H21_le_rho`, w = P₂,₁c with |c| ≤ 1 is written through `exists_wick_repr` as w/‖w‖ = a + ib a.e. with
  `Chaos3 a`, `Circular Jstd a b`, ∫a² = 1/2, and `gaussian_moments` (`LowerAnalytic/Bridge.lean`) gives
  `Moments (stdGaussian d) (fun x => eval x (radU a b)) x`. For the same (a, b), `gaussian_gramInputs`
  (`LowerAnalytic/GramBudget.lean`) gives `GramInputs`, and `steinCut_of_inputs` (`Lower/Stein.lean`) gives `SteinCut`.
  So **`Moments` and `SteinCut` of this law are Lean theorems today**; what is new is only to expose them for
  w = `QkOf n f g` (today the lemma returns the single consequence ‖w‖ ≤ ρ).
- **Which inputs the certificate uses (corrected 23:50).** `Moments`: m1 (E U = 1), m2 (E U² = 2 + x², 0 ≤ x ≤ 31/4), m3
  (E U³ ≤ 6 + 9x² + C₆x³), mh (E√U ≤ ρ = 973612157/10⁹; a node's multiplier y₄ ≥ 0 multiplies it). `SteinCut`, two variants:
  * **plain variant** (exact cover running): the field `cut` only (`cutG`, Stein nodes, `TB.node`), i.e. a row exactly like
    today's rows. N: D ≈ 0.6715, t ≤ 0.187.
  * **spectral variant** (exact cover being built): the field `spec` (`specG`), one spectral cut per σ-node, `TB.specNode`.
    N: D = 0.6275, t ≤ 0.2810; the radius is then not binding (worst law E√U = 0.9153).
  Neither uses `gspec`, `jspec`, a Gram budget or a joint sixth-moment certificate.
- **Spectral nodes in Lean today.** `Grothe/Lower/Mixed.lean` already checks them: a `JBatch` with `spec = true` is checked by
  `checkBatch` through `checkSWit b.nodeList b.smax b.vs` (a majorant y plus one spectral cut (z, λ, μ, t, β, ν) against a node
  table), and `batch_sound` turns each into a `TNodeOK` (E Φ(τ√U) ≤ y.J 0 1 x) through `TB.specNode` (lines 475–510). There it
  serves the mixed tables of two rows. For the direct row the same witness check applies to the table of φ; what does not
  exist is a *row* built from such nodes (below).
- **The bound.** `RowBound r` (`Lower/Rows.lean`) says: for every law with `Moments` and `SteinCut`, every Ψ with
  `CapsHold Ψ r.nodeList r.smax` and every 0 ≤ σ′ ≤ r.delta·ρ, ∫Ψ(σ′√U) − r.kappa·σ′² ≤ r.cap. `rowBound_of_check` derives it
  from `checkRow r = true`, and its proof uses only the mesh, the chain of x-cells and the cell checks (the gate part of
  `checkRow` is discarded there with `-`). The direct row is such an r with **delta = 3/4, kappa = 358422939/250000000
  (≤ ε̂·16/9), smax = 2151/1000, nodeList = the table of Ψ(s) = φ(4s/3)** (40 nodes; `stein/rows_direct/table_direct.json`) and
  the cells my cover produces. Taking σ′ = 3σ/4 ≤ (3/4)ρ (σ ≤ ρ is `normQk_le_rho`): ∫φ(σ√U) − κ(9/16)σ² ≤ r.cap and
  κ·9/16 ≤ ε̂, so ∫φ(σ√U) − ε̂σ² ≤ r.cap =: D. (The scaling by 3/4 is only because my Python tools want δ < ε̂; Lean could
  equally take delta = 1, kappa = ε̂ with the table of φ itself, but then needs its own cells.)
- **New Lean in (b), spectral variant in addition:** a row-level check and soundness lemma for "cells of spectral nodes":
  per x-cell a list of σ′-nodes from 0 to ≥ δρ, each a witness accepted by `checkSWit` on the φ-table (bound `y.J 0 1 x`, the
  x-endpoint rule as `checkNode` rows have it), consecutive nodes joined by `TB.chord`, the price −κσ′² on each chord
  (`chord_sound`/`cell_sound` of `Rows.lean` do exactly this for cut nodes), the node at σ′ = 0 by `TB.zero`. This is checker
  code and a soundness proof of the size of `cell_sound`; no new analysis. Sizes of the certificate: to be filled in when the
  cover exists (expected: about 30 x-cells × 20 σ-nodes, majorants of degree 6 in v, one cut with 42 knot values per node,
  Bernstein pieces of degree ≤ 10).
- **New Lean in (b), both variants:** (i) `CapsHold Ψ nodes smax` for the explicit Ψ: convex on [0, ∞) (φ is a supremum of affine functions
  of r, or piecewise with matching slopes), `Ψ n.1 ≤ n.2` at the 40 table nodes (rational arithmetic), slope ≤ 200/93 ≤ smax;
  (ii) a row-bound lemma that does not ask for the gates: either state `rowBound_of_check` for the cell part of `checkRow`
  (its proof already is that), or give the direct row dummy gate data; (iii) the change of variables U ↔ ‖q x‖²/σ² and the case
  σ = 0. No new analysis.

### (c) How the row enters the cover and the mixtures

- (a) + (b) give, for every unimodular pair and every v, `RowHolds ε̂ 0 0 D V̂ t Qh v`, i.e. V̂ ≤ t² + D − ε̂‖Qh‖²: **the retained
  square is there** (it is the −ε̂‖Qh‖² of the identity, untouched), exactly as in `rowOf_crude`, which proves
  `RowOf crudeRow (VOf n ε 0 f g) (tOf n f g) (QhOf n f g) v` with `crudeRow : EnvRow := ⟨0, 0, ε * ρ ^ 2⟩`
  (`Lower/Boxes.lean`; `RowOf` unfolds to `RowHolds`). So the direct row is the row (ℓ, β, C) = (0, 0, D) and
  `RowHolds.mix` applies to it as to any row.
- In the cover, the crude row is the scalar row of index 0 of a cap box (`Boxes.lean`: "index 0 is the crude row, k + 1 the
  row k"). **The direct row takes that place**: either `crudeRow` becomes ⟨0, 0, D⟩ for the tail witness, with `rowOf_crude`
  replaced by the lemma above, or the cover takes its row 0 as a parameter. D < ε̂ρ², so nothing that used the crude row gets
  worse. At ν̂ = 0 the same proof returns the crude row (φ = 2ε̂r, D = ε̂ρ²).
- My envelope tools treat it the same way: a row named `direct` with (ℓ, β, C) = (0, 0, D) next to (in place of) `crude`.

### (d) The exact spectral direct row (C, 00:18) and its size

- **D = 37836938032836364712295235172753329/57347670240000000000000000000000000 = 0.659781607073** (`verify_spec.py` PASS;
  Stein worker; `stein/rows_direct/spec/cert_direct_spec_A.json`, 1.1 MB). So V̂ ≤ t² + D − ε̂‖Qh‖² and the row covers
  **t ≤ 0.21607**. The maximum sits in the x-cell [2.65, 2.70], σ′ ∈ [0.7025, 0.7035]; the pointwise conic value there is
  0.6597614 (the cover loses 2.0·10⁻⁵).
- Size, for the Lean cost: **51 x-cells, 608 spectral nodes** (12 values of σ′ per cell from 0.66 to 0.731, plus the zero node
  `TB.zero`); every node = a majorant y (5 rationals on 10⁻¹²) plus **one** spectral cut (z with 82 knot values, λ, μ, t, β, ν,
  all on 10⁻⁷); the check of a node is about 135 Bernstein pieces of degree ≤ 10. Mesh: 83 knots, the last at u = 900 (the mesh
  of the cut rows stops at u = 56.25; at x ≈ 3 the worst law has atoms far beyond, and the long mesh lowers D from 0.6648 to
  0.6597). Table: 65 nodes (the 40 of `table_direct.json` plus 25 from s = 6.5 to 30, needed because the node check wants
  r_last/σ′ ≥ v_K). Python: 3.7 minutes for the cover on 12 processes, 14 s for the verifier.
- Lean objects: each node is an instance of `TB.specNode` (`Lower/Law.lean`) with the cell polynomials `specPolyV` /
  `specPolys` (`Lower/Cuts.lean`; the generator uses these formulas literally); the witness check exists as `checkSWit`
  (`Lower/Mixed.lean`, used by `checkBatch` when `spec = true`, soundness `batch_sound`); chords in σ′ are `TB.chord`.
  **Not in Lean today:** a row whose cells are lists of such nodes (today `checkRow`/`checkCell` take cut nodes, and
  `checkBatch` serves mixed tables of two rows): the row-level check and its soundness (the analogue of `cell_sound`,
  `rowBound_of_check`), plus the items of (a) and (b).

### (e) Mass-coupling rows: the same tool with 2ν̂ replaced by 2ν̂ + λ (C for λ = 1/2 since 00:44)

**Exact (C): S(1/2) = 3798855002922010337121170986221578569/22939068096000000000000000000000000000 = 0.165606335315**
(`stein/rows_direct/spec/cert_mass_0.5.json`, `verify_spec.py` PASS; 49 x-cells, 1078 nodes, 136 after pruning; maximum in the
x-cell [2.10, 2.15], σ′ ∈ [0.685, 0.69]; cover loss 1.5·10⁻⁵). The row V̂ ≤ ½t² + ½ + S − ε̂‖Qh‖² is below the target for
t ≤ 0.285881 and is the only piece of the envelope on [0, 0.2755]. Other λ are not needed (N, coarse: reach 0.2807 at
λ = 0.45, 0.2851 at 0.55; no exact cover was made for them), so **λ = 1/2 alone is the certificate**.

Idea of the coordinator. New facts for Lean, complete list:

1. **E|k|² ≤ 1 − t².** From `normSq_hOf_add_normSq_kOf` (‖h‖² + ‖k‖² = 1 for a unimodular pair) and t = ‖P₁,₀h‖ ≤ ‖h‖
   (a projection). [Optional sharpening, not used: ‖h‖² ≥ t² + ‖Qh‖², which would turn the retained square into
   −(ε̂ + λ)‖Qh‖².]
2. **The pointwise inequality with c = 2ν̂ + λ** (λ ≥ 0): for 0 ≤ y ≤ 1, r ≥ 0: 2ε̂ry − cy² ≤ φ_λ(r), φ_λ(r) = ε̂²r²/c for
   r ≤ c/ε̂ and 2ε̂r − c beyond; the proof of (a) with 2ν̂ → c. Then
   ε̂σ² − 2ν̂‖k‖² ≤ ε̂σ² − c‖k‖² + λ(1 − t²) ≤ ∫φ_λ(‖q x‖)dγ − ε̂σ² + λ(1 − t²).
3. **The law-layer bound** ∫φ_λ(σ√U) − ε̂σ² ≤ S(λ): the spectral cover of (b), (d) on the table of φ_λ.

Consequence: V̂ ≤ (1 − λ)t² + λ + S(λ) − ε̂‖Qh‖². **No new row form:** for λ > 0 and any ℓ ≥ 0,
(1 − λ)t² ≤ t² − 2ℓt + ℓ²/λ (a square), so this is the ordinary row `RowHolds ε̂ ℓ 0 (λ + S(λ) + ℓ²/λ)`, tangent at t = ℓ/λ,
with the retained square untouched; it mixes like any row.

Earlier float scan, superseded by the exact value above (N, spectral model on a coarse (x, σ) grid, up to 6·10⁻³ too low;
its S(0.5) = 0.16455 against the exact 0.165606): S(λ) = 0.65902, 0.55907, 0.45926, 0.35979, 0.26101, 0.16455,
0.07705, 0.01687, −0.01006 for λ = 0, 0.1, …, 0.8; best bound 0.6888 at t = 0.22, 0.6958 at 0.25, 0.7038 at 0.28, 0.7067 at
0.29 (all with λ = 0.5); target 0.70647. The Stein cuts keep the worst law away from q = 0 up to λ ≈ 0.5 (mass near q = 0:
0.2–0.4 %), which is why this works here and not in a model without cuts.

### (f) Tested and DROPPED (N only): semi-direct rows with a first-chaos multiplier and a hinge potential

**Outcome (00:40, N): the hinge decoupling reaches only t ≈ 0.244, worse than the mass row (0.2859). Not pursued; nothing of
it is in the certificate.** (`s0c/semihinge.py`, results `s0c/semihinge_T.jsonl`.) The description is kept so that the idea
is not retried in this form:

t = Re⟪h, λ₁⟫ ≤ E[√(1 − |k|²)·|λ₁|] for λ₁ = Ph/‖Ph‖ (|λ₁|² ~ Exp(1)); with a multiplier ℓ ≥ 0 and the elementary decoupling
g_ℓ(w, r) ≤ g_ℓ(w, r₀) + 2ε̂(r − r₀)₊, g_ℓ(w, r) = max over 0 ≤ y ≤ 1 of 2ε̂ry − 2ν̂y² + 2ℓw√(1 − y²):
V̂ ≤ t² − 2ℓt + G_ℓ(r₀) + T(r₀) − ε̂‖Qh‖², with G_ℓ(r₀) = ∫₀^∞ g_ℓ(w, r₀)·2w e^{−w²}dw explicit and T(r₀) the law-layer bound of
the hinge 2ε̂(r − r₀)₊. A heuristic said these would reach t ≈ 0.32–0.35; the float scan gave 0.244 (the decoupling by a
hinge loses too much). Lean would also have needed the law of |λ₁| for a general integrand (today it has E|λ₁| only:
`integral_norm_linL`).

### (g) The pieces of the certified envelope and what each needs in Lean (01:15)

| piece | cuts | Lean row checker | cap table | cap pieces | other new Lean |
|---|---|---|---|---|---|
| mass row λ = 0.5, t ∈ [0, 0.2755] | spectral: 136 nodes (pruned), 28,799 Bernstein pieces of degree ≤ 10 | NEW: row of spectral nodes (d) | explicit: table of φ_c(4s/3), 136 nodes to s = 30, checked against the formula | none | facts 1–3 of (e); `CapsHold` for φ_c; no `SharedReduction` |
| row 0.4, [0.2755, 0.4775] | spectral: 180 nodes (pruned), 34,955 pieces | the same new checker (with the usual gates and `rowOf_of_shared`) | `s0c/tables_v2/table_0.4.json`, 119 nodes to s = 30 | 73 records, 473 live pieces, 528 (entry, piece) checks; 13 records with three directions (d₀, v₂, v₃) on the 400×128 grid | none (`capCoverOK` takes d₀ as it is) |
| row 0.6, [0.4775, 0.6405] | spectral: 204 nodes (pruned), 39,444 pieces | the same | `stein/rows_small/table_0.6_ext.json`, 119 nodes to s = 30 | `s0c/tables_v2/bind_0.6.json` (71 records, 200 live pieces, 327 checks; the 10 far anchored nodes included) | none |
| rows 0.7 … 0.8875, [0.6405, 0.9] | plain (cut nodes, as today) | today's `checkRow` | `s0c/tables/table_<t>.json`, to s = 6 | `bind_<t>.json` (§6.1) | none |

- The direct row (λ = 0) is certified (79 nodes pruned) but **not needed**: the mass row covers [0, 0.2755] by itself.
- Rows 0.4 and 0.6 cannot use today's cut-node `checkRow`: with plain cuts their large-x cells are above the target (§8).
- Far cap nodes (s ≥ 7): give them a margin of 10⁻⁷ instead of 2·10⁻⁹ (the replay found the generator's value up to 8·10⁻⁹
  above the exact one at s = 30; §0).
- What-ifs (N, Stein worker): a radius 0.93 instead of Lean's 0.9736 would move the mass row's reach from 0.2859 to 0.2871 and
  the direct row's from 0.216 to 0.237; 0.9387 and 0.95133 change nothing (with the spectral cuts the worst law has
  E√U = 0.940). The sixth-moment constant is what binds the direct row (C₆ halved: D ≈ 0.6305). Spectral nodes on the binding
  plateau rows would add at most 4·10⁻⁵ of margin (0.835: 0.706370 against 0.706411; 0.845: 0.706334 against 0.706371).

### What it buys, and what stays open (labels)

- **C: spectral direct row D = 0.659781607073, t ≤ 0.21607.** N: plain variant about 0.17–0.19; mass-coupling rows about
  0.27–0.29 (e); semi-direct rows (f).
- This row **does not use `SharedReduction`** (the hypothesis `ReductionHyp`): for t ≤ t_d the scalar cap would rest on proved
  facts only. It replaces the five strongly broken rows (0.05–0.3) and their tens of thousands of pieces.
- Open until certified: the junction t ∈ [0.28, 0.29] with the lowest cap row (bridge, §3).

## 8. DIAGNOSIS of the large-x problem, for every row (written 00:42; row 0.6 and the outcome updated 01:20)

**What the exposure is.** In an x-cell the law class allows atoms up to about u_max(x) = (6 + 9x² + C₆x³)/(2 + x²): 107 at x = 3,
196 at x = 5, 312 at x = 31/4. The cut mesh of every row cover ends at u = 56.25 (v_K = 7.5), so for x ≳ 2.5 the cuts vanish
where such atoms sit. The cap tables end at s = 6 and continue with the Lipschitz line of slope smax (2.2–2.3; the potentials'
slope there is 1.85): this bites when σ√u > 6, i.e. u > 58 at σ = 0.785, 144 at σ = 0.5, 900 at σ = 0.2. **Both exist for every
row**; they make a cover *loose* at large x, never wrong: every certificate is an exact upper bound over all x ∈ [0, 31/4].

**Does it hurt a certified row? No.** `verify_cert` checks every x-cell of every row exactly, so the PASS of `multi_C` (18 rows)
includes all their large-x cells. Where the large-x cells sit against the row's maximum (exact cell values of the covers before
pruning; the pruned certificates keep every cell just below the row bound by construction, so they do not show this):

| row | maximum at x < 3 (x-cell, σ) | maximum at x ≥ 3 (x-cell, σ) | large x minus small x | s reached at large x (σ√u_max) |
|---|---|---|---|---|
| 0.4 (**fails with plain cuts**) | 0.698924 ([0.6, 0.8], 0.54–0.56) | 0.710418 ([4, 4.5], 0.70–0.72), narrow cells, conic nodes | **+1.15·10⁻²** | about 9–10 |
| 0.6 (**fails with plain cuts**) | 0.696334 ([0, 0.1], 0.44–0.46) | 0.694976 on [5, 5.5]; **0.704808 and 0.708796 on the two cells above x = 7.1** (σ 0.64–0.72), narrow cells | **+1.25·10⁻²** | about 9–13 |
| 0.7 | 0.700669 ([0.1, 0.2], 0.40–0.42) | 0.696741 ([7.1, 7.75], 0.74–0.76) | −3.9·10⁻³ | about 13 |
| 0.74 | 0.706729 ([0.6, 0.8], 0.40–0.42) | 0.701863 ([3, 4], 0.34–0.36) | −4.9·10⁻³ | about 4 |
| 0.78 | 0.705590 ([0.2, 0.3], 0.38–0.40) | 0.701232 ([3, 4], 0.30–0.32) | −4.4·10⁻³ | about 3.5 |
| 0.8 | 0.706723 ([0.1, 0.2], 0.36–0.38) | 0.702821 ([3, 4], 0.23–0.24) | −3.9·10⁻³ | about 2.7 |
| 0.82 | 0.706778 ([0.2, 0.3], 0.30–0.32) | 0.704720 ([3, 4], 0.16–0.17) | −2.1·10⁻³ | about 2 |
| 0.83 … 0.885 (plateau) | row bound 0.70634–0.70641 at x ∈ [0.4, 0.8], σ 0.22–0.25 | final certified large-x cells below the row bound; their maxima sit at σ ≤ 0.11 | certified below | below 2 |
| 0.8875 … 0.9 | moment rows (no cuts), maximum at σ ≤ 0.03 | the same | 0 | below 1 |

(The values of rows 0.74–0.82 are from their first, coarse stage; the final exact row bounds are lower, 0.7063–0.7065.)
Reading: from row 0.74 up the large-x maximum sits at small σ, where σ√u stays below 6: **no table exposure, and they pass
with 2–5·10⁻³ to spare** before the hot pass. Row 0.7 has its large-x maximum at large σ (s up to 13, beyond the table and
the mesh) and still passes, by 3.9·10⁻³ (its certificate in `multi_C` is exact for every x-cell). **Rows 0.4 and 0.6 fail
with plain cuts**: the lower the row, the larger σ at its large-x maximum and the smaller its room. The plateau is not
affected.

**Which certified pieces need a cap table beyond s = 6:** rows 0.4 and 0.6 (tables of 119 nodes to s = 30: the spectral nodes
on the long mesh need r_last/σ ≥ v_K = 30) and the mass row (its own explicit table to s = 30, no caps). All rows from 0.7 up
use their tables to s = 6 with the Lipschitz line beyond.

**Why my models did not see it.** `lawsocp.py` (used by the row optimiser and for every "N" above) has a law grid ending at
u = 30 and was scanned for x ≤ 3: a heavy tail cannot exist there. So the low rows were optimised blind to large x.

**Outcome (00:45–01:05).** The cause is the plain cut family, not the row: with one spectral cut per node row 0.4's large-x
values drop from 0.7016–0.7104 to 0.6857–0.6667 already on the old mesh and table (N), and to 0.683–0.660 with the mesh to
u = 900 and the table to s = 30 (mesh and table add 3–7·10⁻³). Rows 0.4 and 0.6 were therefore covered entirely with spectral
nodes on tables extended by far cap nodes (s = 7 … 30: anchored, 8 s each, cap − Ψ below 8·10⁻⁵): exact row bounds
0.689780757737 and 0.693971383018, every cell with x ≥ 2.5 at least 7·10⁻³ below the row maximum. The rows above 0.7 keep
their plain covers (certified, with room at large x, table above).

## 9. Exact row constants of the envelope (for the ledger)

Verbatim copy of `final/ROW_CONSTANTS.txt` (sha256 791764065ab82e375bd4b935c53d34bbfe5d7007848761c9e9ff798f0ec4559f), written by
`final/rowconst.py` from `final/env_final_clean.json`; the constants are those of the re-verification runs in `final/recheck/`.
A row (ℓ, β, C) states V̂ ≤ t² − 2ℓt + C − ε̂‖Qh + (β/ε̂)v‖²; its "row bound at t0" quoted elsewhere is t0² − 2ℓt0 + C.
Row 0.8875 is a moment row (ℓ = 2 is its own parametrisation, not a typing error).

```
Exact row constants of the final envelope env_final_clean.json (identity-tail certificate, hat units; eps = 25/31).
A row (ell, beta, C) states  V_hat <= t^2 - 2 ell t + C - eps ||Qh + (beta/eps) v||^2.   Taken from the re-verification run of mkfinal.sh (final/recheck/).

mass_0.5 (mass row: V_hat <= (1 - lam) t^2 + lam + S - eps ||Qh||^2)
  lam = 1/2
  S = 3798855002922010337121170986221578569/22939068096000000000000000000000000000
    = 0.165606335315097

row 0.4
  ell = 1768453555918749/4503599627370496
      = 0.392675571152245
  beta = 8810092125453731/288230376151711744
       = 0.030566147271086
  C = 310633289344112630944675353059204035968855775134943611241152139/368083280700055575184840288999833600000000000000000000000000000
    = 0.843921214659141

row 0.6
  ell = 4959536006155405/9007199254740992
      = 0.550619106549122
  beta = 8864414030666069/144115188075855872
       = 0.061509228479098
  C = 23336337576416784556720800695301630759111673208568995695733011/23460341649092933292920633951256576000000000000000000000000000
    = 0.994714310877014

row 0.7
  ell = 2916275633470357/4503599627370496
      = 0.647543270886421
  beta = 1580025690718937/18014398509481984
       = 0.087709045066772
  C = 19506474228644704763779142642050472996115508137782913022787490382508452141632028715115106139359/17459690692231018576817065278664447539910874907898207744819200000000000000000000000000000000000
    = 1.117229083406640

row 0.78
  ell = 105312176902205/140737488355328
      = 0.748288022849444
  beta = 8540189688126175/72057594037927936
       = 0.118518940330300
  C = 97729779227843593252839847773593762544008484043662019983883863884905384013005146252191890855699/77287308202417344655722020135282877495000952847010122170368000000000000000000000000000000000000
    = 1.264499715423999

row 0.8
  ell = 6993805552906821/9007199254740992
      = 0.776468395458843
  beta = 4617439073646881/36028797018963968
       = 0.128159679359166
  C = 585942521127931334186788929610370509785280137013889093691748733096625158450726066427085668088888607357341836001/447702818245999569615774248545742706357118732382977853416048571203473899520000000000000000000000000000000000000
    = 1.308775592308139

row 0.82
  ell = 908080405582305/1125899906842624
      = 0.806537419590740
  beta = 1249251048673655/9007199254740992
       = 0.138694727777461
  C = 38353267368800090129233573047096060693590732539442097684300615545843247194526911870767613420678268000991561/28266526939688355726077294998512492685035970369000556650907566080000000000000000000000000000000000000000000
    = 1.356843996103008

row 0.83
  ell = 7404131726631543/9007199254740992
      = 0.822023752026395
  beta = 5198077355840171/36028797018963968
       = 0.144275629105910
  C = 85603296950276949576482961522753021966882125916610978280955764942213431484765733108407086388830075174551121/61941383609476122116989481592423428040418612434462341786196954313780101120000000000000000000000000000000000
    = 1.382004920813246

row 0.835
  ell = 3735601868816997/4503599627370496
      = 0.829470241118679
  beta = 1325091374272803/9007199254740992
       = 0.147114695344986
  C = 1731680539571722638982994068184962829265217066051442263896029182001611718048980181793525224821704858744525073090415746189512674709581873/1241881080778197733644247539212721758733845737458977657284828845596120207191387363222818772348619980800000000000000000000000000000000000
    = 1.394401256589401

row 0.845
  ell = 7608680524445607/9007199254740992
      = 0.844733230525652
  beta = 1377713210121295/9007199254740992
       = 0.152956892720690
  C = 2588800680858395297587393684108128307969330921842009441583528022906963967926440763630307447485120945153/1823169784162413799684982017801353500973689321624558894006075362639872000000000000000000000000000000000
    = 1.419944924135369

row 0.85
  ell = 7661960949743369/9007199254740992
      = 0.850648546018392
  beta = 5620369065073259/36028797018963968
       = 0.155996578573382
  C = 34306503191290361932897249867060443257545509985054619273094840723508820441953493883219808545957094570719270256479351632686101079102463/23991178420518108549349030648553701774477938289664320781030092288500842659724057577207626493415391232000000000000000000000000000000000
    = 1.429963238568982

row 0.86
  ell = 7748926892113415/9007199254740992
      = 0.860303705176137
  beta = 5844092125352801/36028797018963968
       = 0.162206140889931
  C = 283513646429367792515833487442563308161528043698533263688579471910741498536036521653866098514575056718273544371959582432751078842993665523469/196002689561610508849820293435604014679002671544315771433040518889460592631475620638964275955737172325171200000000000000000000000000000000000
    = 1.446478347126199

row 0.87
  ell = 7836716209974733/9007199254740992
      = 0.870050277376714
  beta = 6069260823432831/36028797018963968
       = 0.168455827715764
  C = 10198397241808527878055074967766473712418281844302818157731033845551391431263181169286638778694316318879506171144239221177761/6969296840366336629025717002296269955281697195989008061691112992286923759278038084516577280000000000000000000000000000000000
    = 1.463332309615392

row 0.885
  ell = 498115196987747/562949953421312
      = 0.884830336978387
  beta = 6409478984572817/36028797018963968
       = 0.177898778613095
  C = 10413730104815448704107420509625147462610944706082076756269423414045005034034182305835605620517632213483359715003762232755601897239/6992499183500674337928363360773015102299370207064387810190615995774750940842869839169076433256448000000000000000000000000000000000
    = 1.489271551062519

row 0.8875
  ell = 2
      = 2.000000000000000
  beta = 6437437261199693/36028797018963968
       = 0.178674776674095
  C = 1072597073940824133245482208002303915619542538459/309485009821345068724781056000000000000000000000
    = 3.465748065019359

rows certified but not used by the envelope: 0.74, 0.84, 0.88, 0.89, 0.895, 0.9
```

Exact row bounds at t0 (the numbers quoted in §0), as rationals:
- row 0.4 at t0 = 2/5: 253896764271732256469263370365770691968855775134943611241152139/368083280700055575184840288999833600000000000000000000000000000 = 0.689780757737
- row 0.6 at t0 = 3/5: 16280805740297385230079661314766990119111673208568995695733011/23460341649092933292920633951256576000000000000000000000000000 = 0.693971383018
- direct row (not used): D = 37836938032836364712295235172753329/57347670240000000000000000000000000 = 0.659781607073
- target: B̂* = 1381511/1955511; envelope maximum 0.7064129749 (exact value: cell 1673 of `final/env_final_clean.json`).

## 10. What this certificate changes in the Lean plan (STAGE0C §7), for stage 2

1. **Rows.** Not "about 25 rows": the envelope uses **14 cap rows** (0.4, 0.6, 0.7, 0.78, 0.8, 0.82, 0.83, 0.835, 0.845, 0.85,
   0.86, 0.87, 0.885, 0.8875) **and one mass row**. The rows below 0.4 (0.05, 0.12, 0.18, 0.23, 0.3, 0.33) and row 0.5 do not
   exist in the certificate; six more rows are certified and unused (0.74, 0.84, 0.88, 0.89, 0.895, 0.9) and need not be
   generated.
2. **A new piece of analysis-free Lean, outside the caps closure (stage 1 material):** the mass row (PROGRESS §7(e): the three
   facts; no `SharedReduction`, no node caps) and a **row-level checker for cells of spectral nodes** with its soundness
   (§7(d), (g)): the nodes are `SWit` with `GBud.sep`, accepted by `checkSWit`; chords by `TB.chord`, the zero node by
   `TB.zero`. It serves three pieces (mass row, rows 0.4 and 0.6). Today's `checkRow` (cut nodes) serves the other 12 rows
   unchanged.
3. **Cut meshes.** The spectral rows use a mesh of 83 knots up to u = 900 (the cut rows keep theirs, to u = 56.25).
4. **Cap tables.** Rows 0.4 and 0.6 have 119 nodes up to s = 30 (10 far anchored nodes each; give these a margin of 10⁻⁷).
   All other tables as in §6.1 (bindings), mirror pieces dropped (§6.2).
5. **Cap pieces.** Row 0.4 has 13 three-direction records (kind `routem3q`, leaves `qbox3`, ds = [d₀, v₂, v₃]; no new lemma,
   as the coordinator confirmed) whose 410 pieces are on the grid 400×128: the kernel needs the moment table of that grid
   (`s0c/grid400/moments_400_128.json`) next to the 1600-ring tables. Nothing else is on that grid. If one grid for
   everything is preferred, §6.3 has the cost of re-certifying on 400×128 (caps lose 3·10⁻⁵ to 1.4·10⁻⁴: not affordable on
   the plateau, where the margin is 5.8·10⁻⁵; so the plateau stays on 1600 rings).
6. **Margin.** The certificate's smallest margin is 5.76·10⁻⁵ at t ≈ 0.837 (plain cut nodes of rows 0.835/0.845). Lean's own
   node check for those rows has to reproduce the cut rows of `stein/multi_C` to that accuracy; spectral nodes there would
   add at most 4·10⁻⁵ (N) and are not needed.
7. **If rows are ever re-optimised:** use a law model that sees large x and the spectral family (`gen_spec.py`'s pointwise
   programme), not `lawsocp.py` on its grid to u = 30. Every wrong float number of this night came from that model.

# Earlier note: stage 0d at 19:45 (superseded by the top of this file)

C = exact certificate; N = model. Original units B = 0.9765·B̂ + 0.0235; target 5000/7009 = 0.7133685 (B̂* = 0.7064706).

## 1. Small-t rows: the plan changed (the rows stay; the caps change)

**Re-choosing rows with a symmetric fibre maximiser is not possible for t ≲ 0.6 (N, argued and measured).** The symmetric
point is stable only if ℓ − 2β ≳ 0.5, because the gates pin the odd penalty at 1/R ≈ 1/ε̂. Rows for small t need small ℓ (the
row value grows by about (1.77 − 2t) per unit of ℓ). Today's ν = 0 certificate has the same structure (ℓ − 2β = 0.09 at t = 0.12);
its small-t rows live on price-layer caps and 0.5–1.5·10⁻² of slack.

**What the breaking is** (`diagrow.py`, `diagneg.py`): the maximiser moves into block 3 (imaginary odd coefficients) only:

| row | \|m₃\| at s = 0 | Ψ_true − symmetric maximum at s = 0 | breaking ends at s ≈ |
|---|---|---|---|
| 0.12 | 0.69 | 0.20 | 0.7 |
| 0.4 | 0.57 | 0.10 | 0.8 |
| 0.6 | 0.43 | 0.029 | 0.4 |
| 0.7 | 0.30 | 0.006 | 0.3 |
| 0.74 | 0.20 | 0.001 | 0.2 |
| 0.78 | 0 | 0 | — |

**Where the old caps lose** (cap − Ψ_true, C against N): row 0.6: 1–3·10⁻² on s ∈ [0, 0.7]; row 0.4: 4–7·10⁻²; row 0.12: up to
0.13. They are loose at every s, also where nothing breaks: the cheap mode used one symmetric price-variance piece per node.

**New cap generator `qtree.py` (C; kind `routem2q`).** The plane (τ₂, τ₃) is tiled by axis-aligned boxes in the quadrant
τ₂, τ₃ ≥ 0 (images under the two symmetries cover the rest). Each box is one exact piece anchored at the maximiser of J over the
box; a box above Ψ + tol is bisected along the direction with the larger S-lemma slack. First exact nodes:

| node | old cap − Ψ | quadtree cap − Ψ | leaves |
|---|---|---|---|
| row 0.6, s = 0.1 | 1.05·10⁻² | **5.3·10⁻⁴** | 30 |
| row 0.4, s = 0.1 | 5.8·10⁻² | **1.2·10⁻³** | 41 |
| row 0.6, s = 0.3 (three negative directions at the maximiser) | 3.0·10⁻² | 3.7·10⁻³ after 35 pieces, still falling | — |

**Model of the result (N, `lawsocp_captable.py`: law relaxation on the actual cap table, no spline).** With caps Ψ_true + 10⁻³ on
s ∈ [0, 0.6] and the old caps elsewhere:

| row | old table | improved table | margin |
|---|---|---|---|
| 0.6 | 0.713743 | 0.696533 | 1.7·10⁻² |
| 0.7 | 0.712839 | 0.705930 | 7.4·10⁻³ |

With such margins a row covers ±0.09 to ±0.16 in t, so **rows 0.12, 0.4, 0.6, 0.7 (+ 0.74, 0.78) cover [0, 0.8]**; 0.23 and 0.5
are dropped, 0.3 is a spare.

**Second finding: the cheap Stein mode is not usable for small t.** It lost 1.3·10⁻² on row 0.4 and 1.2·10⁻³ on row 0.6 against
the model of the same table. All rows now get the coarse mode with the conic hot pass.

**Running now (19:40):** 58 quadtree chunks (rows 0.7, 0.6, 0.4, 0.12 on s ∈ [0, 0.6] at 0.03 first; then s ∈ [0.63, 0.87], row
0.78 on [0.22, 0.86], row 0.3). About 30 CPU-h. The cheap Stein runs on the old tables of these rows were stopped.

## 2. Plateau

- Caps: all 24 rows final; nothing left in the cap queue of the plateau.
- Stein (C): 0.88 → 0.713251, 0.885 → 0.713248, 0.84 (coarse) → 0.713473 (above, as predicted; mixtures cover it).
  Running: 0.83, 0.845, 0.85 fine; 0.86, 0.87, 0.8 coarse. Waiting: 0.835 fine, 0.82, 0.8875–0.9.
- The mixtures near t = 0.84 are certified by `mkenv` + `verify_cert` at assembly, not by the model.

## 3. Independent re-check (replay worker, C)

- **Generic coverage check** (regions only, no layout knowledge; images under the two symmetries; exact grid-cell test): **478
  route-M records used by the 24 final tables, 0 failures.** Negative tests: a dropped piece or a foreign constraint vector is
  detected 158/158.
- **Row 0.845, final table: 151 certificates, 1167 pieces, all replayed exactly**; replayed − stored ∈ [−9.5·10⁻¹¹, −1.9·10⁻¹²];
  every table cap ≥ the bound rebuilt from the replayed quadratics (min slack 2.0·10⁻⁹).
- Running: 0.85, 0.83, 0.835 (about 21:40), then 0.84, 0.86–0.885. The quadtree records will be added when they exist.

## 4. ETA

| step | wall time |
|---|---|
| quadtree caps of the small-t rows | to about 22:30 |
| their Stein covers (coarse + hot pass, about 5 CPU-h per row) | to about 01:30 |
| plateau fine runs | to about 23:00 |
| assembly, `mkenv`, full `verify_cert`, manifest | about 1 h after the last row |

**Finish about 02:30–03:00.** Risks: the quadtree in the range s ≥ 0.3 of rows 0.4 and 0.12 (three to four negative directions
at the maximiser), and the Stein loss on small-t rows in coarse mode (not yet measured).

---

# Earlier notes (stage 0c, kept for reference)

## Interim progress of 16:30

C = exact certificate (verify_cert PASS); N = law-relaxation model. Original units: B = 0.9765·B̂ + 0.0235. Target: 0.7133685.

## Verdict so far

**On track for 1.4018 (N).** Best estimate of the final B: **0.71329–0.71332**, margin **5–8·10⁻⁵**, K ≈ 1.4019.

Certified rows are tracking the model with a constant offset:

| row | state | certified B (C) | prediction for its table (N) | difference | STAGE0C flat model |
|---|---|---|---|---|---|
| 0.845 | old table | 0.713302 | 0.7132449 | +5.7·10⁻⁵ | 0.7132025 |
| 0.85 | old table | 0.713282 | — | — | — |
| 0.88 | final | 0.713251 | 0.7131975 | +5.4·10⁻⁵ | — |
| 0.885 | final | 0.713248 | — | — | — |
| 0.78 | cheap mode | 0.713853 | — | **above target** | — |

- The +5.4 to +5.7·10⁻⁵ difference is the per-row Stein loss. It is stable on all certified rows.
- 0.845 and 0.85 have since got better tables. The predictions for the new tables are 0.7132310 and 0.7132258 (N), so
  certified values near **0.71328–0.71329** are expected. Fine reruns are in progress; the finer Stein mesh is worth about
  −1.6·10⁻⁵ (attribution test).
- Other predictions for final tables (N): 0.83 → 0.7132318, 0.86 → 0.7132114. With +5.7·10⁻⁵ both land near 0.71327–0.71329.
- **Row 0.84 comes out about 2·10⁻⁵ above the target** (0.7133320 + offset). Its block 1 turns indefinite at s = 0.42. The
  envelope then uses the 0.83/0.845 mixture near t = 0.84: the provisional mixture rose only 2.9·10⁻⁵ above the larger row, i.e.
  about 0.71332 (N). This is the binding point of the estimate.
- **Row 0.78** (cheap caps) exceeds the target, but row 0.8 should cover t ≈ 0.78 (a row's bound rises only about (t − ℓ)² away from
  its own t). The same holds for 0.8875, covered by 0.885.
- The final number comes from `mkenv` over [0, 0.9].

## Where the run is (node caps of 28 rows; queue counts from job 67 because the runner was restarted)

- **Tables final** (sha256 marker `s0c/tables/FINAL_<t>`), **21 rows**: 0.12, 0.23, 0.3, 0.4, 0.5, 0.6, 0.7, 0.74, 0.78, 0.84,
  0.845, 0.85, 0.86, 0.87, 0.88, 0.885, 0.8875, 0.89, 0.895, 0.9, and 0.83 (complete, finalising now).
- **Still computing caps:**
  - 0.8: 78 of 137 nodes done, 12 jobs running;
  - 0.82: 97 of 137 done, 8 jobs running.
  - The remaining nodes are two-direction route-M nodes, about 0.5–1 CPU-h each.
- **Optional rows 0.835, 0.855, 0.865, 0.875, 0.8825** were set aside at 07:50 to save about 55 CPU-h. "ROW 0.855: 0/171" in
  `tableloop.log` means only that no record exists. Two-row mixtures cover them in the envelope; the stage 0c estimate for rows
  0.005–0.01 apart is 1–4·10⁻⁶.
- **Stein covers** (`scover2.py` covers the (x, σ) domain of a row with exact Stein-cut nodes; `t4_cover.py` refines and re-proposes
  near-binding nodes by conic solves) turn each final table into an exact row certificate `row_<t>.json`. Status:
  - done: 0.78, 0.88, 0.885;
  - running: 0.845, 0.85 (fine), 0.84 (coarse), 0.4, 0.6, 0.74 (cheap);
  - waiting for slots or tables: 0.83, 0.86, 0.87, 0.8, 0.82 and nine cheap rows.

## Risks and patches

- **Patched during the run** (all exact and re-checked): far-slab ring split, ring boxes, corner delegation, per-piece price
  variance, block-1 variance for the two-direction range; a 2·10⁻⁹ table margin; recipes required in every final table.
- **Recomputed:** 49 nodes lacking recipes. Stopped: one stale Stein run (0.84 on a withdrawn table).
- **Exact replay:** all 956 pieces of the (old) 0.845 table pass. The `cover` check must learn the new piece kinds (ring boxes,
  delegation) before it can rerun on patched nodes.
- **What could still make it NO-GO:**
  - the t ≈ 0.84 mixture coming out above 0.71336;
  - row 0.8 failing to cover t ≈ 0.78;
  - a larger Stein loss on some row.
- **Fallbacks:** the fine mesh on 0.83/0.845 (about −1.6·10⁻⁵ each); computing optional row 0.835 to tighten t ≈ 0.84.

## ETA (wall time on big at the present concurrency: caps about 22 jobs, Stein CAP 16–20)

| step | estimate |
|---|---|
| caps of 0.8 / 0.82 | about 1–1.5 h |
| Stein, all rows (fine about 3 h, coarse about 2 h, cheap about 1–1.5 h per row; Stein is the bottleneck) | about 5–6 h |
| assembly + `mkenv` + full verify | about 1 h |
| independent re-check (verify_cert is part of it; exact replay of the binding rows' certificates) | about 1 h |

**Finish around 23:00–24:00 tonight.** More cores help the Stein stage almost linearly up to about 40 processes. Freeing 10 more
cores would save about 1.5 h. I will raise the Stein caps as the cap jobs end.

---

## Update 18:25

### Radius ρ (coordinator's questions)

1. **t ∈ [0, 0.12]** is covered by row 0.12, or its mixtures with 0.23, evaluated at smaller t: V_i(t) = C_i + t² − 2ℓ_i t, so
   V_0.12(0) = C_0.12. Its value is reported once row 0.12's cover is done. The crude row offered to `mkenv` is the verifier's
   C = ε̂ρ² = 0.76448 (hat), with Lean's ρ and without the −2ν̂ term. It never binds where rows exist, and nothing in this certificate
   relies on a crude row closing t = 0.
2. **Every place ρ enters, all with ρ = 973612157/10⁹ (Lean's value; nothing smaller is used):**
   - `verify_cert.py` H4, the first-moment cut E√U ≤ ρ in every Stein node;
   - the crude row C = ε̂ρ²;
   - the σ range of the Stein covers, σ ≤ δρ (`scover2`);
   - the law relaxation of the model (`lawsocp.py`, `lawcap.py`), which is not part of the certificate.
3. **A smaller ρ changes nothing at the binding point (N).** At row 0.845, the law relaxation with ρ = 0.9387 gives exactly the same
   values as with 0.973612157: 0.7131979 with Ψ and 0.7132310 with the certified table. The first-moment cut is inactive there.

### New risk: the cheap rows far from the plateau (C)

- Certified (cheap mode):

  | row | B̂ | B | against the target |
  |---|---|---|---|
  | **0.6** | **0.708089** | **0.714949** | above by 1.6·10⁻³ (hat) |
  | 0.74 | 0.706309 | 0.713217 | below |

- **Cause:** for row 0.6 the fibre maximiser breaks the odd symmetry strongly. At s = 0.1 the odd coefficients reach 0.53, and
  Ψ_true exceeds the symmetric maximum by 2.6·10⁻². All symmetric-anchor caps (anchored, route M, global) are therefore loose by
  1.2–2.9·10⁻² against Ψ_true (`psicheck.py`).
- **Fix under test:** one "quadrant" piece per node, {w₂·m ≥ 0, w₃·m ≥ 0} anchored at the broken maximiser. Its symmetric images
  cover R¹². If it works, rows 0.6 and 0.7, and any other row that exceeds the target, are recomputed.
- Otherwise t ≈ 0.55–0.72 needs extra rows.
- **ETA moves later**, to about 01:00–02:00. Plateau rows unaffected.

---

## Update 18:40 — verdict changed: NO-GO for the full certificate as built (small-t rows); plateau GO

- **Certified below the target** (C): 0.74, 0.88 and 0.885, plus 0.845 and 0.85 on their old tables. The binding rows' new tables
  predict about 0.71328–0.71329, a margin of 6–8·10⁻⁵ (N; fine runs going).
- **Certified above the target** (C):

  | row | B |
  |---|---|
  | 0.4 | 0.7314 |
  | 0.6 | 0.71495 |
  | 0.78 | 0.71385 |
  | 0.84 | 0.71347 (covered by mixtures) |

  Partial: 0.5 is probably above (0.7085 before pruning); 0.7 is borderline (0.7071 before pruning).
- **Cause:** small-t fibre potentials break the odd symmetry, so caps around the symmetric anchor are 1–3·10⁻² loose. A quadrant
  piece at the broken maximiser did not help.
- **Needed:** re-choose rows 0.12–0.7 (and 0.78) with symmetric fibre maximisers. They have 1–3·10⁻² of slack, and anchored caps
  then cost 30 CPU-min per row. Then rerun their caps and Stein covers and assemble.
- Details: `STAGE0_FINAL.md` (Summary at the top; sections "16:35 — BLOCKER" and "Final sections").
- **big keeps running** the plateau rows. Stop it with the commands listed there if you prefer.
