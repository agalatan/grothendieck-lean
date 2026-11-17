<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-newcap-2026-11-16/PROGRESS.md (17 November 2026, 01:38, the final state of the run); the degree-5 worker of claude-b9ee. Only this line was added. -->
# Degree-5 game at the new cap on lambda_1: running status

claude-b9ee worker "d5newcap" (research worker of claude-b9ee), started 16 Nov 2026 18:11 Bucharest time.
Folder: /Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-newcap-2026-11-16/
Droplet folders: yo:~/claude-b9ee-d5newcap (cores 6-7 only); big:/root/claude-b9ee-d5newcap (cores 40-47 only, since 22:18).
Labels: P proof, C exact/interval computation with a replay, N floating point.

## HEADLINES (kept current; details and files in the status entries below)

Updated 01:38 (17 Nov), FINAL STATE OF THIS RUN. All N. theta_room(u): the reviewer's definition (largest theta for which (F) plus the hypothesis
||c_X||^2 <= theta delta Omhat_X in both sectors keeps the row inside its room at the energy u, law-layer relaxation;
sufficient, not necessary). Exact Gamma' (prof2.py). 15 values of chi from 1 to 42, cells without a possible law left out,
binding chi in brackets. ALL sector weights, exactly (r4_theta5.py: min_w max_law = max_law [min(F_A, T_A) + min(F_B, T_B) -
4 mu kappa (D + V_sl)], checked by brute force; on the published row 0.80 it gives +6 % / +10 % / +7 % at 0.85 / 0.90 /
1.0 u* over the 3 x 3 grid). "Own split": kappa_AB = 1 - kappa_h - 0.02 (quintic share in the exact one-spike model).

**THE SCOPE (the main finding): the content lemma is needed on every tuned row of the certificate, t from about 0.65 to
0.886, and its binding rows are the LOWEST ones.** Present game (1, -0.78, 0.0779); everything applied together (best covering
row, chi-dependent split, exact weights, (R1) and cap at the lower end of the piece, the covering row's law gap with B(s)
counted in the room); pieces [t - 0.005, t + 0.005]:
| piece t | cap | best row t' | room (law gap) | mu | BAND MINIMUM of theta_room | at u (in u*(t'); in cap) | chi | own row instead |
| 0.80 | 0.0966 | 0.82 | 1.36e-3 (0) | 0.400 | **0.721** | 0.0819 (1.20; 0.85) | 30 | 0.554 |
| 0.78 | 0.1177 | 0.82 | 7.7e-4 (0) | 0.400 | **0.523** | 0.0989 (1.45; 0.84) | 30 | 0.350 |
| 0.76 | 0.1387 | 0.81 | 1.32e-3 (2.5e-5) | 0.384 | **0.400** | 0.1165 (1.49; 0.84) | 30 | 0.233 |
| 0.74 | 0.1598 | 0.80 | 1.95e-3 (1.0e-4) | 0.367 | **0.314** | 0.1278 (1.455; 0.80) | 42 | 0.160 |
| 0.72 | 0.1808 | 0.79 | 2.57e-3 (2.9e-4) | 0.351 | **0.259** (0.264 with the row of 0.80, room 2.6e-4) | 0.1463 (1.50; 0.81) | 36 | 0.114 |
| 0.70 | 0.2019 | 0.79 | 7.1e-4 (2.9e-4) | 0.351 | **0.219** (0.212 with the row of 0.78, room 3.2e-3) | 0.1572 (1.61; 0.78) | 42 | 0.085 |
| 0.68 | 0.2229 | 0.78 | 1.1e-3 (6.0e-4) | 0.334 | **0.186** (0.170 with the row of 0.76) | about 0.77 cap | 42 | 0.060 |
| 0.66 | 0.2439 | 0.76 | 4.3e-3 (1.4e-3) | 0.299 | **0.154** (0.135 with the row of 0.74) | about 0.77 cap | 42 | 0.039 |
THE PUBLISHED CERTIFICATE AS IT STANDS (rows active below their label, certified rooms of 4.17; same split and weights):
row 0.80 on [0.785, 0.7988]: 0.478 (1.06 u*, chi 24); 0.79 on [0.7721, 0.785]: 0.381; 0.78 on [0.752, 0.7721]: 0.288;
0.76 on [0.7256, 0.752]: 0.190; 0.74 on [0.6989, 0.7256]: 0.140; 0.72 on [0.6715, 0.6989]: 0.104; 0.70 on [0.647, 0.6715]:
**0.080** (1.09 u*, chi 42). Below t = 0.647 the law rows of item 10 take over (the switch point is a choice of the
certificate; the untilted A/B margin of a tuned row changes sign at t' = 0.70; tilted it is 0.184 at 0.70, 0.097 at 0.66).
RATIOS AGAINST THESE ALLOWANCES (lower bounds on the largest ratio; sector A; at u = 0.82 of the piece's cap unless said):
| t | cover | band minimum | two-variable class: all / possible | factor | the study's 6-variable maximiser, re-evaluated (not re-optimised) | factor |
| 0.80 | 0.82 | 0.721 | 0.1595 / 0.0971 | 4.5 / 7.4 | 0.2363, possible | 3.05 |
| 0.78 | 0.82 | 0.523 | 0.1325 / 0.0795 | 3.9 / 6.6 | 0.2044, possible | 2.56 |
| 0.76 | 0.81 | 0.400 | 0.1102 / 0.0652 | 3.6 / 6.1 | 0.1761, possible | 2.27 |
| 0.74 | 0.80 | 0.314 | 0.0934 / 0.0548 | 3.4 / 5.7 | 0.1536, possible | 2.0 |
| 0.72 | 0.79 | 0.259 | 0.0805 / 0.0463 | 3.2 / 5.6 | 0.1352, possible | 1.9 |
| 0.70 | 0.79 (0.78) | 0.219 (0.212) | 0.0702 / 0.0392 (row 0.78) | 3.0 / 5.4 | 0.1314 at 0.76 cap, possible (0.1231 at 0.82 cap is not possible) | 1.7 |
With the rows tuned at t itself the six-variable factor is 2.45 (0.80), 1.9 (0.78), 1.5 (0.76), 1.2 (0.74), 1.02 (0.72) and
BELOW 1 at t = 0.70 (ratio 0.1014 at 0.76 cap against the allowance 0.085). On the PUBLISHED pieces with their certified rooms
it is 2.4 (row 0.80), 2.1 (0.79), 1.76 (0.78), 1.41 (0.76), 1.22 (0.74), 1.09 (0.72) and **1.00 (row 0.70 on [0.647, 0.6715]:
allowance 0.080, ratio 0.0802, a possible response)**. So the sufficient condition has no margin left at the low end of the
published certificate, with a cubic that was not even optimised for that row; the covers restore a factor 1.7-3.
(`thresholds/reeval_max.py`, logs `thresholds/games/reeval_all.log`, `reeval_pub.log`; the cubic: content5 b2_gen5_5_u0.85_n6_free.json,
found on the row 0.80 at 0.85 u*, ratio there 0.2365, mine 0.2370 with the exact profile; seven and eight variables add 5-7 %.)
Files: `thresholds/games/g078big/out/shift5_*.json`, table by `thresholds/scope_final.py`; profiles for the content worker:
`profiles_low/` (written 01:25: covers and own rows for t = 0.70 ... 0.78, with exact derivatives and the allowance by energy).

OTHER RESULTS:
(a) Re-optimising for margin at the cap (1, -0.81, 0.165), margin 6.4e-4, roughly HALVES the low-row allowance (factor
0.57-0.66 at equal kappa on the 3 x 3 grid, 0.44-0.55 with own splits: its quintic shells take 0.31 of the deficit at
t = 0.80 against 0.11) and its two-variable ratio is 8-10 % larger. It is not the game for the content route.
(b) The best game at margin >= 3e-4 is the ridge game (1, -0.77, 0.05) (margin 3.03e-4): +12 % at the band minimum of the
row 0.80 (0.556 against 0.495, own splits, own rows), +10 % on the row 0.82 (0.861 against 0.785). Not a doubling.
Lowering gamma off the ridge, (0.78, 0.057), gains nothing (0.492, 0.772). (0.76, 0.02) has margin 2.0e-4.
Own rows, own constant splits, all weights (band minimum; 0.85 / 0.90 / 1.0 u*):
| game | row 0.80 | row 0.82 | 0.84 | 0.845 | 0.85 | 0.855 |
| present | 0.495 at 0.925 u* (36); 0.578 / 0.516 / 0.553 | 0.785 at u* (16); 1.025 / 0.914 / 0.785 | 1.499 at 1.05 u* (14) | 2.117 at 1.025 u* (8) | 2.812 at 1.025 u* (12) | 3.995 at 1.05 u* (8) |
| (0.77, 0.05) | 0.556 at 0.975 u* (20); 0.670 / 0.596 / 0.575 | 0.861 at 1.025 u* (12); 1.173 / 1.038 / 0.866 | 1.618 at 1.075 u* (8) | 2.227 at 1.025 u* (10) | 2.948 at 1.05 u* (6) | running |
(c) Levers that do not depend on the game, present game, row 0.80: published minimum 0.375-0.40 (3 x 3 / all weights, at u*)
-> pieces around the row with the new radius 0.459 (kappa 0.82) -> own constant split 0.495 -> chi-dependent split 0.569
(+15 %; row 0.82: 0.785 -> 0.883, +12.5 %) -> covered by the row tuned at 0.82: 0.721.
(d) Small t of the present game with the radius 0.93 (B(s)): direct bound V <= (1 - 0.0779) t^2 + 0.677136, i.e.
V < 500/701 for t <= 0.198 without sector hypothesis (N; published with 0.9513: 0.1365).
(e) Stage 2c (conditional certificate pipeline with the game in one file): end-to-end test on big ALL PASS (23:33);
about 65 CPU-hours for a full run; NOT started, no game fixed (`cert2c/README.md`).
big: cores 24-31 and 40-47 in use for the scope computations (coordinator, 00:36 and 01:08).

## WHAT I WOULD DO NEXT (in this order)

1. **Port the certificate worker's spectral Stein law model to the degree-5 direct bound** (the model that kept the phantom
   mass at q = 0 at 0.2-0.4 % for the identity tail's mass row; `handoff/research-third-decimal/caps-stage0c-2026-11-16/`,
   PROGRESS.md section 7). With the scalar Stein family the cap-free bound V <= (1 - eta')t^2 + N(eta') reaches t = 0.198
   and the mass coupling (eta' = eta + lam) adds nothing, because the worst law keeps 3.7-6 % of mass at q = 0. My estimate
   with cuts holding that mass at 0.3 %: N about 0.677 + 0.003 lam, reach about 0.28-0.29 at lam = 0.5. One day.
2. Many-variable searches in rice mode on the covers of `profiles_low/` (content worker; energies 0.6-0.9 of the cap), and
   the re-evaluation of its maximisers with 7-13 variables on the covers when the files arrive (`thresholds/reeval_max.py`).
3. A certificate designed around the covers: rows used 0.06-0.09 below their tuning point, their law gaps closed by Stein
   covers; the rooms here are float (Gaussian rows, float law gap without the Stein family, 1.5e-5 assumed for losses).
4. Optimise the cover beyond the tuned family: finer t' and pieces, parameters chosen for the allowance, the tilt per row.
5. The chi-dependent split: measure the quintic share on two-variable families (not only the one-spike path) and state the
   quintic lemma it needs.
6. The game (1, -0.77, 0.05) with covers (expected +12 % on every line of the scope table; margin 3.0e-4).
7. Rows 0.83 and t >= 0.86 on all weights; the switch point t_s and item 10 on (0.198, t_s).

## STATE OF THE MACHINES AT THE END (01:38)

- Nothing of mine runs on the laptop, on yo or on big.
- **Nothing is left only on big or on yo**: complete copies are in `big_copy/` (631 files, 11 MB) and `yo_copy/` (746 files,
  12 MB; without the venv), checked by a dry-run rsync that reports no difference.
- NOT deleted (I do not remove folders recursively): `big:/root/claude-b9ee-d5newcap` (11 MB), `yo:~/claude-b9ee-d5newcap`
  (14 MB plus a 501 MB venv). For the lead or the user to remove.

## REQUEST TO THE CONTENT WORKER (written 00:20, 17 Nov; the coordinator relays it)

Please make available on the laptop (for instance in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/out/`, or
tell the coordinator the path) the JSON records of your best maximisers with n = 7 to 13 variables on the rows 0.80 and 0.82,
at u/u* = 0.85 and 1.0 (and 0.90 if you have it), modes free and rice: the files written by b2_gen7.py on big
(`/root/claude-b9ee-content6/out/b2_gen7_<k>_u<f>_n<n>_<mode>.json` or their successors), with the fields `labels`, `coef`,
`k`, `ufrac`, `ratio_check`. One record per (row, energy, n) is enough: the best one.
What I do with them (`thresholds/reeval_max.py`: your `b2_gen7.Gen7.fine`, copied unchanged, quasi-Monte-Carlo 2^20, seed 37):
the ratio of the SAME cubic at the same fraction of u*, or at a given absolute energy, under (i) the row tuned at 0.82 at
the energies 1.1-1.3 u*(0.82) that occur when it covers t = 0.80, (ii) the game (1, -0.77, 0.05), rows 0.80 and 0.82,
(iii) the rows tuned at 0.74-0.78 of the present game. A re-evaluated cubic is a lower bound on that configuration's
largest ratio, not its maximum; a search started from it would be yours to run.

## IF I AM INTERRUPTED: next commands (final: nothing is running; how to redo each result)

All paths relative to this folder; python = /usr/local/bin/python3; game from the environment (D5_E1, D5_ETA); one process.
- Profiles with exact derivatives and margins of a row: `thresholds/prof2.py` (via `prep_row.py NAME E1 ETA t`).
- Allowance: `thresholds/r4_theta5.py k energies|band` in a game folder (all weights, 15 chi, binding chi; KAPPA_AB or
  KAPPA_CHI; BAND_ROWS = the band file); per game `band5.py NAME E1 ETA rows` -> `thresholds/games/NAME/band5.json`
  (table: `band_table.py` reads band4.json: point it at band5.json by hand or read the json).
- A piece covered by another row: `thresholds/shift5.py NAME E1 ETA a b t'-list chi` with LAW_GAP_FILE (from `lawgap.py`)
  -> `out/shift5_*`; THE SCOPE TABLE: `python3 thresholds/scope_final.py thresholds/games/g078big/out`.
- Profiles for the content worker: `cd thresholds && D5_E1=0.78 D5_ETA=0.0779 python3 export_low.py games/g078big
  ../profiles_low 0.70,0.72,0.74,0.76,0.78`.
- Ratios: `ratio4_band.py NAME E1 ETA BANDFILE energies` (two-variable class), `reeval_max.py NAME E1 ETA BANDFILE
  b2data/<records>.json energies` (stored many-variable maximisers; `reeval_all.sh`, `reeval_pub.sh`).
- Quintic share: `gate/kappa_h.py`, along the spike family `gate/kappa_chi.py`; chi-dependent split on own rows:
  `thresholds/chi_split5.py NAME E1 ETA t-list` (after band5.py).
- Small t: `smallt/explore/nscan.py` (ST_E1, ST_ETA, ST_RHO, ST_RHO_TABLE): N(eta') and the reach.
- Stage 2c: `cert2c/README.md` (test passed; nothing to run until a game and its rows are fixed).
- Data: `thresholds/games/` (laptop runs; g078big = the scope run copied from big), `big_copy/`, `yo_copy/` (complete copies
  of the two remote folders), `profiles_low/`, `profiles/` (the 19:38 profiles of (0.81, 0.165): made with the old
  quadrature and WITHOUT exact derivatives; superseded, do not use).

## Status (newest first; times are Bucharest time from `date`)

- 01:38 (17 Nov) FINAL ENTRY. Stored maximisers re-evaluated (laptop, seconds each): see HEADLINES. Everything on big and
  yo copied into `big_copy/`, `yo_copy/`. Final report handed back.
- 01:30 (17 Nov) THIRD INTERIM OF THE NIGHT SENT (ratios on covers, mass coupling, (a) on all weights).
  TWO-VARIABLE RATIO ON THE COVERS (big, `games/scope_logs/stage4.txt_*.log`; copy in `thresholds/games/g078big/out/ratio_*`),
  at u = 0.82 cap, all cubics / possible responses, and allowance / ratio:
  | t | cover | ratio | band minimum | factor | own row: ratio; minimum; factor |
  | 0.80 | 0.82 | 0.1595 / 0.0971 | 0.721 | 4.5 / 7.4 | 0.1508 / 0.0915; 0.554; 3.7 / 6.1 |
  | 0.78 | 0.82 | 0.1325 / 0.0795 | 0.523 | 3.9 / 6.6 | 0.1180 / 0.0700; 0.350; 3.0 / 5.0 |
  | 0.76 | 0.81 | 0.1102 / 0.0652 | 0.400 | 3.6 / 6.1 | 0.0949 / 0.0559; 0.233; 2.5 / 4.2 |
  | 0.74 | 0.80 | 0.0934 / 0.0548 | 0.314 | 3.4 / 5.7 | 0.0777 / 0.0446; 0.160; 2.1 / 3.6 |
  | 0.72 | 0.79 | 0.0805 / 0.0463 | 0.259 | 3.2 / 5.6 | 0.0645 / 0.0354; 0.114; 1.8 / 3.2 |
  | 0.70 | 0.78 | 0.0702 / 0.0392 | 0.212 | 3.0 / 5.4 | 0.0540 / 0.0277; 0.085; 1.6 / 3.1 |
  | 0.68 | 0.76 | 0.0597 / 0.0318 | 0.170 | 2.8 / 5.3 | |
  | 0.66 | 0.74 | 0.0511 / 0.0255 | 0.135 | 2.6 / 5.3 | |
  MASS COUPLING OF THE DIRECT BOUND (yo, `games/nscan_078_mass_{a,b}.log`; present game, B(s), scalar Stein family; N):
  eta' = eta + lam; lam = 0: N 0.677136, reach 0.1979; 0.1: 0.680834, 0.1986; 0.2: 0.685202, 0.1971; 0.3: 0.689947, 0.1936;
  0.4: 0.695481, 0.1846; 0.5: 0.702570, 0.1592; 0.6-0.8: N above the target. The coupling is SMALL_T.md's Step 2 already;
  it adds nothing with the scalar Stein family (phantom mass 3.7-6 % at q = 0); with cuts holding that mass at 0.2-0.4 %
  the family would reach about 0.28-0.29 (estimate, not computed).
  (a) ON ALL WEIGHTS, own splits: (0.81, 0.165) row 0.80 (own 0.670): band minimum 0.217 at 0.90 u* (42); 0.239 / 0.217 /
  0.299; row 0.82 (own 0.631): 0.333 at 0.95 u* (36); 0.390 / 0.352 / 0.394: 0.42-0.44 of the present game's band minima.
  NEXT: stored maximisers (n <= 6, local files) re-evaluated on the cover profiles (big); then the final report.
- 01:26 (17 Nov) SCOPE TABLE SENT 01:20; PROFILES FOR THE LOW ROWS WRITTEN AND ANNOUNCED 01:26:
  `profiles_low/band_row_{0.70,0.72,0.74,0.76,0.78}.json` (the cover) and `..._own.json` (the row tuned at t), kit format
  plus exact derivatives, piece, t_lo, ucap, room, law gap, mu, kappa_AB(chi), allowance by energy (17-19 energies from 0.30
  or 0.40 of the cap to 0.98 of it), band minimum, definition; `profiles_low/SCOPE_TABLE.txt` = the table. Generator:
  `thresholds/export_low.py games/g078big ../profiles_low 0.70,...` (with D5_E1=0.78 D5_ETA=0.0779).
  Final scope values after the higher covers (see HEADLINES for the table): t = 0.80: 0.721 (row 0.82; row 0.83: 0.706);
  0.78: 0.523; 0.76: 0.400; 0.74: 0.314; 0.72: 0.259 (row 0.79; row 0.80: 0.264 with 2.6e-4 of room); 0.70: 0.219 (row 0.79,
  room 7.1e-4; row 0.78: 0.212); 0.68: 0.186 (row 0.78; row 0.76: 0.170); 0.66: 0.154 (row 0.76; row 0.74: 0.135).
  (0.77, 0.05): row 0.855 (room 2.9e-4, own 0.897): band minimum 4.285 at 1.05 u* (chi 8). Its two-variable ratios are
  2.5-3 % BELOW the present game's (row 0.80: 0.1551 / 0.1472 / 0.1336 at 0.85 / 0.90 / 1.0 u*; row 0.82: 0.2061 / 0.1958 /
  0.1780).
  Coordinator 01:20: also evaluate the "mass coupling" lam (1 - t^2 - ||k||^2) for the direct small-t bound. NOTE: SMALL_T.md
  section 1, Step 2 already has it (eta' = eta + lam; 4.18 used eta' = 3/5). Scan with the new radius running on yo
  (`games/nscan_078_mass_{a,b}.log`: eta' = 0.1779 ... 0.8779, Stein family on, B(s)).
  RUNNING: big cores 24-31: two-variable ratios on 16 covers (`games/scope/run4.log`, `job4.pid`); laptop: (0.81, 0.165) all
  weights (`games/fq_lap.log`).
- 01:09 (17 Nov) THE SCOPE TABLE IS FILLING (big; cores 40-47 added 01:08 by the coordinator: second pool `job3b.pid`,
  `run3b.log`, the last 15 jobs; first pool `job3.pid`). EVERYTHING APPLIED TOGETHER: best covering row, chi-dependent split,
  the covering row's law gap counted in the room, all weights, 15 chi, (R1) and cap at the lower end of the piece. So far:
  | piece t | cap | covers: row t' -> band minimum (room) | best |
  | 0.78 | 0.1177 | 0.78 -> 0.350 (2.5e-3), 0.79 -> 0.404, 0.80 -> 0.461, 0.81 -> 0.509 (2.1e-3), 0.82 -> 0.523 (7.7e-4) | **0.523**, row 0.82, at u = 0.0989 = 1.45 u*(0.82) = 0.84 cap, chi 30 |
  | 0.76 | 0.1387 | 0.76 -> 0.233 (3.5e-3), 0.79 -> 0.350, 0.80 -> 0.382, 0.81 -> 0.400 (1.3e-3) | **0.400**, row 0.81, at u = 0.1165 = 1.49 u*(0.81) = 0.84 cap, chi 30 |
  | 0.74 | 0.1598 | 0.74 -> 0.160 (4.7e-3), 0.76 -> 0.217, 0.78 -> 0.273, 0.79 -> 0.298, 0.80 -> 0.314 (2.0e-3) | **0.314**, row 0.80, at u = 0.1278 = 1.455 u*(0.80) = 0.80 cap, chi 42 |
  | 0.72 | 0.1808 | 0.79 -> 0.259 (2.6e-3), others running | >= 0.259 |
  The best cover is always the highest-tuned row that still has room; at low t the room is a larger share of theta_room
  (the own row of 0.74 loses 5 % when its law gap 2.5e-3 is counted, although the chi split adds 11 %).
  Two-variable ratio on covers (all cubics / possible responses), present game: piece 0.74, row 0.80, at u/cap = 0.76 /
  0.80 / 0.84: 0.1005 / 0.0957 / 0.0913 (possible 0.059 / 0.056 / 0.054); own row 0.74 at 0.75 / 0.79 / 0.83 cap: 0.0848 /
  0.0806 / 0.0768 (possible 0.049 / 0.047 / 0.044); piece 0.76, row 0.81, at 0.78 / 0.82 / 0.86 cap: 0.1155 / 0.1102 /
  0.1053 (possible 0.068 / 0.065 / 0.062). So a higher-tuned cover has a ratio about 19 % larger than the own row at the
  same energy, against an allowance twice as large. Allowance / two-variable ratio at the binding energy: 3.3 (t = 0.74,
  cover 0.80; own row 2.0), 3.6 (t = 0.76, cover 0.81).
  Upper rows, all weights, own splits: present game 0.84: min 1.499 at 1.05 u* (14); 0.845 (room 3.7e-4, own 0.844): 2.117 at
  1.025 u* (8), 3.064 / 2.676 / 2.141; 0.85 (room 3.7e-4, own 0.841): 2.812 at 1.025 u* (12), 4.310 / 3.727 / 2.939.
  (0.77, 0.05): 0.84: 1.618 at 1.075 u* (8); 0.845 (room 2.8e-4, own 0.901): 2.227 at 1.025 u* (10), 3.310 / 2.893 / 2.328.
  NEXT: `scope_final.py` on big when both pools end; rsync `big:/root/claude-b9ee-d5newcap/thresholds/games/g078/` to
  `thresholds/games/g078big/`; `export_low.py` -> `profiles_low/`; stage 4 on big (`job4.pid`): two-variable ratios on covers.
- 00:59 (17 Nov) Running and new facts.
  BIG, cores 24-31: the final scope stage restarted 00:58 (`games/scope/job3.pid`, `run3.log`): 45 jobs, each one piece x
  one covering row with the chi-dependent split (the spike-family curve of the row 0.80 used for every row except 0.82,
  which has its own; the two differ by at most 1.2 % in kappa_AB), the covering row's law gap counted in the room
  (`games/g078/out/lawgap.json`), all weights, 15 chi, energies above 0.68 of the piece's cap; the 7 published pieces with
  their certified rooms last. Expected end about 01:25. Then `scope_final.py` (the table) and `export_low.py` (profiles_low/).
  Law gap of every covering row with B(s) (float LP, no Stein family), present game: 9.3e-3 (0.66), 7.3e-3 (0.68), 5.45e-3
  (0.70), 3.83e-3 (0.72), 2.48e-3 (0.74), 1.41e-3 (0.76), 6.0e-4 (0.78), 2.9e-4 (0.79), 1.0e-4 (0.80), 2.5e-5 (0.81), 0 (0.82).
  Margins of the tuned rows, present game: untilted mu = -0.089 (0.66), -0.044 (0.68), -0.002 (0.70), 0.039 (0.72), 0.079
  (0.74), 0.117 (0.76), 0.153 (0.78), 0.189 (0.80), 0.223 (0.82); tilt (0.4, 0.3): 0.097, 0.142, 0.184, 0.224, 0.262,
  0.299, 0.334, 0.367, 0.400. Quintic share: 0.062, 0.067, 0.073, 0.079, 0.086, 0.093, 0.102, 0.111, 0.121.
  **The untilted A/B pure-cost margin changes sign at t' = 0.70**: rows tuned below 0.70 are outside the gate's premise
  (CAPPED_GATE section 6 item 6); with the tilt the margin stays positive down to 0.66 at least.
  More covers (constant own split 0.869, Gaussian rooms: superseded by the run on big): piece 0.74 by the rows of 0.76 /
  0.78 / 0.80: 0.215 / 0.253 / 0.278 (the last at u = 0.127 = 1.45 u*(0.80), chi 42; room 2.05e-3); piece 0.76 by 0.80 /
  0.81: 0.342 / 0.352.
  Present game, row 0.84, all weights, own split 0.847 (piece [0.835, 0.8425], room 4.0e-4, mu 0.431): band minimum 1.499 at
  1.05 u* (chi 14); 2.296 (14) / 2.030 (14) / 1.641 (16) at 0.85 / 0.90 / 1.0 u*. (0.77, 0.05), row 0.84: 1.618 at 1.075 u*.
  SMALL t OF THE PRESENT GAME WITH THE NEW RADIUS (N, primal SDP, `yo: games/nscan_078_tabN.log`): the direct bound
  V <= (1 - 0.0779) t^2 + N has N = 0.677136 with B(s) (lambda_1 rho^2 = 0.674622; s = 5.0, sigma = 0.7252, phantom mass
  0.037): room 3.61e-2, so V < 500/701 for t <= 0.198 without any sector hypothesis (published with 0.9513: t <= 0.1365).
- 00:47 (17 Nov) SCOPE INTERIM SENT 00:45; coordinator's reply (00:46): (1) finish THE SCOPE TABLE: one line per piece
  t = 0.66 ... 0.80 with everything that helps applied together (best covering row, chi-dependent split, exact weights, (R1),
  law gap counted in the room; published pieces with certified rooms), energy and chi where it binds, cap, and the lowest t
  at which the lemma is needed; (2) export the covering rows' profiles for t = 0.70 ... 0.78 to `profiles_low/` in the kit's
  format with theta_room at the table energies; (3) then rows 0.84-0.855 and the two-variable ratio on the best covers.
  RUNNING ON BIG cores 24-31 (`/root/claude-b9ee-d5newcap/thresholds/games/scope/`): `job.pid` = stage 1 (rows 0.66 ... 0.82:
  exact profiles, quintic share) then stage 2 (quintic share along the spike family per row = chi-dependent split; law gap
  with B(s) per row); `job3.pid` = stage 3, starts when the first ends: 38 jobs "piece x covering row" (pieces 0.66 ... 0.80,
  covers up to 0.08 above; `shift5.py ... chi` with LAW_GAP_FILE; tag _f<t'>) and the 7 published pieces with their certified
  rooms (tag _pub). Logs `run.log`, `run3.log`, per job `../scope_logs/`. Stop: `kill -- -$(cat job.pid)`, same for job3.
  AFTER IT: `rsync -a big:/root/claude-b9ee-d5newcap/thresholds/games/g078/ thresholds/games/g078big/`; table:
  `python3 thresholds/scope_table.py thresholds/games/g078big/out`; profiles:
  `cd thresholds && D5_E1=0.78 D5_ETA=0.0779 python3 export_low.py games/g078big ../profiles_low 0.70,0.72,0.74,0.76,0.78`.
  Law-layer gap with the radius input B(s) (float LP, moments + radius, no Stein family), present game: +1.0e-4 (t' = 0.80),
  +6.0e-4 (0.78), +1.41e-3 (0.76), +2.48e-3 (0.74), +3.83e-3 (0.72), +5.45e-3 (0.70); with 0.9513 it was 2.7e-4 ... 7.1e-3.
  More scope numbers since 00:39 (constant own splits, Gaussian rooms, i.e. BEFORE the law gap and the chi split):
  piece 0.76 by the row of 0.78: 0.287; by 0.80: 0.342 (u = 0.114 = 1.30 u*(0.80), chi 36); piece 0.74 by its own row: 0.168
  (0.875 u*, chi 42). Two-variable ratio, row 0.72 own: 0.0695 / 0.0657 / 0.0591 at 0.85 / 0.90 / 1.0 u* (possible responses
  only: 0.039 / 0.036 / 0.032); row 0.76 own: 0.1008 / 0.0954 / 0.0861 (possible: 0.060 / 0.056 / 0.050); row 0.80 at
  0.90 / 0.925 u* on the piece [0.795, 0.805]: 0.1511 / 0.1472 (possible: 0.092 / 0.089).
- 00:39 (17 Nov) SCOPE QUESTION FIRST (coordinator 00:27 and 00:36: big cores 24-31 granted now for it, 40-47 from 01:35).
  RUNNING ON BIG, cores 24-31: `/root/claude-b9ee-d5newcap/thresholds/scope_run.py 24-31 games/scope/stage1.txt
  games/scope/stage2.txt` (process group in `/root/claude-b9ee-d5newcap/thresholds/games/scope/job.pid`; stop with
  `kill -- -$(cat job.pid)`; log `games/scope/run.log`, per-job logs `games/scope_logs/`). Stage 1: exact profiles and
  quintic shares of the present game's rows tuned at 0.66 ... 0.82. Stage 2: the pieces [t - 0.005, t + 0.005], t = 0.78,
  0.76, 0.74, 0.72, 0.70, 0.68, 0.66, each covered by its own row and by the rows tuned 0.01-0.08 above (own splits, all
  weights, 15 chi, scan from 0.80 u*(t') to the cap of the piece), and the PUBLISHED pieces of 4.17 with their certified
  rooms (rows 0.70 ... 0.80; tag _pub). Results: `games/g078/out/shift5_<a>_<b>.json` there (to be copied back).
  Same work in part on the laptop (overloaded tonight: load 23, one energy took 670 s) and on yo.
  FIRST SCOPE RESULTS (present game, all weights, 15 chi, own splits):
  | piece | covered by the row tuned at | room | band minimum of theta_room | at u (in u*(t'), in cap) | chi |
  | [0.795, 0.805] | 0.80 (own) | 1.68e-3 | 0.495 | 0.0813 (0.925, 0.84) | 36 |
  | [0.795, 0.805] | 0.82 | 1.36e-3 | 0.617 | 0.0853 (1.25, 0.88) | 20 |
  | [0.795, 0.805] | 0.83 | 3.5e-4 | 0.603 | 0.0845 (1.45, 0.87) | 24 |
  | [0.775, 0.785] | 0.78 (own) | 3.10e-3 | 0.321 (scan from 0.90 u*; may be lower) | 0.0963 (0.90, 0.82) | 42 |
  | [0.775, 0.785] | 0.80 | 2.79e-3 | 0.420 | 0.0967 (1.10, 0.82) | 36 |
  | [0.775, 0.785] | 0.82 | 7.7e-4 | 0.451 | 0.0990 (1.45, 0.84) | 30 |
  | [0.755, 0.765] | 0.76 (own; own split 0.886) | 4.95e-3 | 0.238 | 0.875 u*(0.76) | 42 |
  | [0.715, 0.725] | 0.72 (own; own split 0.901) | 9.73e-3 | 0.128 | 0.875 u*(0.72) | 42 |
  **So the allowance keeps falling below t = 0.80**: best cover 0.62 at t = 0.80, 0.45 at 0.78; own rows 0.24 at 0.76 and
  0.13 at 0.72. The large rooms there do not help: the room carries about 15 % of theta_room, the rest is the deficit term.
  Rows of the present game added: t = 0.66 ... 0.78 (`thresholds/games/g078/rows_all.lines`): rooms at their own t
  1.98e-2 (0.66), 1.65e-2, 1.34e-2 (0.70), 1.05e-2, 7.8e-3 (0.74), 5.5e-3, 3.6e-3 (0.78), 2.8e-3 (0.79), 2.05e-3 (0.80).
  (3) THE chi-DEPENDENT SPLIT, DONE PROPERLY (yo, `games/g078b`, chi_split5.py; all weights): quintic share along the
  one-spike family, present game, t = 0.80: 0.111 (chi 0.004), 0.058 (0.34), 0.043 (1.1), 0.036 (2.6), 0.029 (5.4),
  0.024 (10), 0.020 (17), 0.017 (28), 0.015 (42); kappa_AB(chi) = 1 - share - 0.02 = 0.922 (chi 1) ... 0.965 (chi 42).
  Row 0.80: band minimum 0.569 at 0.925 u* (chi 36) against 0.495 with the constant own split: **+15 %**; at 0.85 / 0.90 /
  1.0 u*: 0.671 / 0.598 / 0.604. Row 0.82: 0.883 at u* (chi 16) against 0.785: **+12.5 %**; 1.197 / 1.062 / 0.883.
  Against the study's 0.82 the gain is 24 % (0.459 -> 0.569) on the row 0.80. It needs a quintic lemma whose constant
  falls with the concentration (the one-spike family is one path through the cubics).
  (0.77, 0.05), all weights: row 0.82: band minimum 0.861 at 1.025 u* (chi 12); 1.173 (20) / 1.038 (20) / 0.866 (16);
  row 0.84 (piece [0.835, 0.8425], room 3.1e-4, own 0.902): 1.618 at 1.075 u* (chi 8); 2.534 / 2.225 / 1.804.
- 00:18 (17 Nov) ALL-WEIGHTS RERUN, interim message (1) + first part of (2) SENT at 00:18. Coordinator's sixth message
  (00:03): minimise over all sector weights. Done exactly (r4_theta5.py, see HEADLINES; brute-force check at theta = 0.482,
  0.90 u*, published row 0.80: smallest excess over a 9 x 3 weight grid 1.791e-3 at chi 42 against the room 1.790e-3).
  Drivers: `band5.py`, `shift5.py`, `chi_split5.py` (files band5*.json, out/r4_theta5_*, out/shift5_*). The 3 x 3 results
  (band4*.json, out/r4_theta4_*, shift4_*) are kept but superseded. A solver failure in the possible-law pre-test crashed
  one yo run (g077); the pre-test now keeps the cell when the solver fails.
  Mistake of mine to record: twice tonight a `pgrep -f` inside an ssh one-liner matched the remote shell itself (its command
  line contains the pattern) and I killed that shell; only my own ssh session died, no job of anyone was touched. I now
  select my processes by exact argv fields or by pid files.
  RUNNING: laptop queue (`thresholds/games/queue_lap.txt`, log `games/fq_lap.log`): (0.81, 0.165) all weights; shifted
  rows for the pieces at t = 0.82, 0.78, 0.74, 0.70, 0.76, 0.72; rows 0.84-0.855 of the present game; two-variable ratios on
  shifted configurations; one stored maximiser re-evaluated. yo core 7: (0.77, 0.05) row 0.82, then rows tuned at 0.76 and
  0.72 of the present game on their own pieces (g078L), its two-variable ratio, its upper rows. yo core 6: the
  chi-dependent split on the present game (chi_split5.py g078b), then the small-t constant of the present game with B(s).
- 00:00 (17 Nov) COORDINATOR'S FIFTH MESSAGE (23:57): free big cores 40-47 until 01:35. Nothing of mine was running there:
  the stage-2c end-to-end test had finished at 23:33 (`/root/claude-b9ee-d5newcap/cert2c_test/out/launch.log`: "STAGE 2C:
  ALL PASS"). Test facts (game (0.81, 0.165), rows 0.8475 Gaussian and 0.1250L Stein, 8 cores): rows 3796 s wall (Gaussian
  row 595 s on 4 processes = 0.66 CPU-h; Stein row 3791 s on 4 processes = 4.2 CPU-h: 12,654 node caps, 1766 plain boxes,
  1060 Stein-cover boxes of which 102 Stein); assembly; replay 692 s on 8 processes (400 node caps per row recomputed, all
  boxes re-verified, row constants reproduced: C = 1.4305246991 and 0.7271944520). Certified G+ - float = 1.3e-5 at 0.8475.
  Cost estimate for a full run of about 37 rows with 8 Stein rows: 29 x 0.66 + 8 x 4.2 = 53 CPU-h for the rows, plus the
  replay with every node cap (about 12 CPU-h), about 65 CPU-hours, 1.5-2 h wall on 44 cores. NOT to be started (no game).
  RESULTS since 23:43 are in the HEADLINES above ((a) on the fine chi grid, (b), first shifted row). Files:
  `thresholds/games/g078/band4.json` (present game), yo `games/g077/band4.json`, `games/g078_g057/band4.json`,
  `thresholds/games/g078/out/shift4_0.795_0.805.json`, logs `thresholds/games/fq_lap.log`, yo `fq_{6,7}.log`.
  Two-variable content ratio (families + shared-driver class), sector A, at 0.7 / 0.85 / 1.0 u*: present game row 0.80:
  0.1914 / 0.1595 / 0.1367, row 0.82: 0.2549 / 0.2133 / 0.1834; (0.81, 0.165) row 0.80: 0.2109 / 0.1727 / 0.1458, row 0.82:
  0.2870 / 0.2365 / 0.2004 (at u* the maximiser is not a possible response by (R1) in all four).
  RUNNING: laptop queue (`thresholds/games/queue_lap.txt`): shifted rows for t = 0.80 (row 0.83), 0.78, 0.74, 0.70, 0.82,
  0.76, 0.72 of the present game, two-variable ratios on the shifted configurations, upper rows 0.84-0.855, re-evaluation
  of a stored maximiser; yo core 6: (0.78, 0.057) row 0.82, then the chi-dependent split on the present game's rows 0.80,
  0.82 (`chi_split.py g078b`); yo core 7: rows tuned at 0.76 and 0.72 of the present game on their own pieces (g078L),
  then the upper rows of (0.77, 0.05) and its two-variable ratio.
- 23:43 COORDINATOR'S FOURTH MESSAGE (23:33): order of work, an interim message after each:
  (1) the game that maximises the smallest allowance over the band on its lowest content rows at margin >= 3e-4, 15 chi,
  each game's own kappa split; per candidate (lambda_1, gamma), margin, and per row 0.80-0.855 the band minimum of
  theta_room with its energy and binding chi; the number to beat is twice the largest content ratio (row 0.80 of the present
  game: 0.2474 at 0.85 u*, 0.2206 at u*, seven variables; 0.253 with eight); can the stored maximisers be re-evaluated under
  another game's profiles; (2) shifted rows: t = 0.80, 0.82 covered by rows tuned at 0.82-0.83, and the lowest t at which
  the content law is needed; (3) the chi-dependent kappa split, estimated on the present game's rows 0.80, 0.82.
  The present game is the reference in every table. No stage-2c certificate.
  **LINE ASKED FOR: a split kappa_AB(chi) + kappa_h(chi) <= 1 that depends on the concentration.** In the exact one-spike
  model the quintic shells take their largest share of D + V_sl at SMALL concentration (c = 0.1) and the A/B shells at
  LARGE (c = 1): new game, t = 0.80: quintic 0.31 / 0.15 / 0.06 / 0.03, A/B 0.01 / 0.07 / 0.13 / 0.22 at c = 0.1 / 0.3 /
  0.6 / 1 (chi = 42 c^4 = 0.004 / 0.34 / 5.4 / 42); present game, t = 0.85: quintic 0.139 at c = 0.1, 0.027 at c = 1. The
  A/B test binds at chi = 12-42, where the quintic share is 0.03-0.06, so a chi-dependent split would give the A/B shells
  kappa_AB about 0.92-0.95 instead of 0.82 (study), 0.869 (present game's own constant split) or 0.67 (new game's own).
  First estimate from theta_0/theta_room (theta_0 scales with kappa_AB): present game +6-7 % over its own constant split,
  +12-13 % over 0.82; new game about +35 %. Being measured properly: `thresholds/chi_split.py` (gate/kappa_chi.py: the share
  along the spike family at nine values of c; then r4_theta4.py with kappa_AB(chi)). It needs a quintic lemma whose constant
  falls with the concentration, which does not exist.
  NEW TOOLS: `thresholds/r4_theta4.py` (same test as r4_theta3, 10 times faster: one parametrised conic program per cell,
  early exit over the weight pairs; "band" mode scans the energies up to the cap and refines at the minimum; checked against
  r4_theta3: 0.2846 / 0.2577 / 0.3478 against 0.287 / 0.254 / 0.348 on (0.81, 0.165), row 0.80), `band4.py` (per game: every
  content row's band minimum with its energy and binding chi, own kappa split), `shift4.py` (a piece covered by the row tuned
  at another t'), `chi_split.py`, `reeval_max.py` (the content worker's stored maximisers under another game's profile, with
  its own evaluator copied to `thresholds/b2copy/`).
  FACTS SO FAR: margins (float rows): (0.77, 0.05) 3.04e-4 (the ridge game at the constraint), (0.76, 0.02) 2.0e-4 (not
  admissible), (0.78, 0.0779) 4.0e-4. Fine chi grid, new game (0.81, 0.165), kappa_AB 0.82: row 0.80: 0.287 (chi 42) /
  0.254 (42) / 0.348 (12) at 0.85 / 0.90 / 1.0 u*; row 0.82: 0.518 (42) / 0.470 (42) / 0.500 (16).
  Two-variable content ratio of the present game's row 0.80 with my exact profiles: 0.1914 / 0.1595 / 0.1367 at 0.7 / 0.85 /
  1.0 u* (the study's 0.191 / 0.160 / 0.137); the new game's at 0.7 u*: 0.2109 (10 % larger).
  Reach of a tuned row (room left >= 3e-4): present game: the row of 0.84 covers t >= 0.820, of 0.83 t >= 0.793, of 0.82
  t >= 0.767, of 0.80 t >= 0.714; new game: 0.817, 0.799, 0.779, 0.738. So no certificate can avoid rows tuned below 0.84
  for t < 0.81-0.82; what the shifted rows gain in allowance is being computed.
  RUNNING: laptop queue `thresholds/games/queue_lap.txt` (log `games/fq_lap.log`): band4 of the present game (rows 0.80,
  0.82), shifted rows, chi split, upper rows, re-evaluation; yo core 7: band4 of g077 = (0.77, 0.05); yo core 6: band4 of
  g078_g057 = (0.78, 0.057) (queues `queue_{6,7}.txt`, logs `fq_{6,7}.log` in `~/claude-b9ee-d5newcap/thresholds/games`).
- 23:24 COORDINATOR'S THIRD MESSAGE (23:10): fine chi grid (15 values, 1 to 42), every cell tested for a possible law, binding
  chi with each number; the question is BY WHAT FACTOR the allowance on rows 0.80, 0.82 changes at u/u* = 0.85, 0.90, 1.0
  for (a) the max-margin game, (b) the game with the largest low-row allowance at margin >= 3e-4; and whether rows 0.80 and
  0.82 can be dropped (covered by other rows). Interim answer (a) SENT at 23:23 (SendMessage to main), coarse chi grid:
  | row 0.80, theta_room | 0.85 u* | 0.925 u* | u* |   | row 0.82 | 0.85 u* | 0.925 u* | u* |
  | present game, kappa_AB 0.82 | 0.501 | 0.442 | 0.641 |   | present | 0.950 | 0.812 | 0.733 |
  | (1, -0.81, 0.165), 0.82 | 0.287 | 0.279 | 0.425 |   | new | 0.518 | 0.451 | 0.500 |
  | factor | 0.57 | 0.63 | 0.66 |   | factor | 0.55 | 0.56 | 0.68 |
  | present, own kappa_AB 0.869 | 0.529 | 0.465 | 0.666 |
  | new, own kappa_AB 0.670 | 0.234 | 0.231 | 0.369 |  factor 0.44 | 0.50 | 0.55
  (same pieces [t +- 0.005] for both games; exact Gamma'; quintic share kappa_h = 0.111 present, 0.310 new at t = 0.80.)
  New tools: `thresholds/r4_theta3.py` (15 chi, possible-law test per cell, binding chi, cheap level crossing),
  `thresholds/allow3.py NAME E1 ETA rows energies` (per game, OWN=1 adds the game's own kappa_AB), `thresholds/shift3.py
  NAME E1 ETA a b t'-list energies` (a piece [a, b] covered by the row tuned at t': room there and allowance).
  Check: r4_theta3 on the published row 0.80 at 0.85 u*: 0.507, binding chi 30 (all 15 cells possible).
  Detuning probe stopped (first result: +1 % at equal absolute energy for 1e-4 of row value along the softest direction).
  RUNNING: laptop `allow3.py g081` (pid `thresholds/job_allow3_lap.pid`, log `thresholds/games/allow3_lap.log`);
  yo core 6: ratio of g081, then allow3 of g082 = (0.82, 0.1944) and g076 = (0.76, 0.02); yo core 7: ratio of g078, then
  allow3 of g078, g077 = (0.77, 0.05), then the small-t constant and the law gap of the present game with B(s)
  (queues `thresholds/games/queue_{6,7}.txt` on yo, logs `allow3_{6,7}.log`, `fq_{6,7}.log` there).
  NEXT: shifted rows (shift3.py) for the pieces [0.795, 0.805] and [0.815, 0.825] in g081, g078; the 15-chi table.
- 23:00 Three results and the running jobs.
  (1) REGRESSION WITH EXACT DERIVATIVES = THE REVIEWER'S NUMBERS. Old game, row 0.80, the content worker's mu, t_lo, room:
  theta_room = 2.818, 1.331, 0.853, 0.507, 0.383 at u/u* = 0.5, 0.6, 0.7, 0.85, 1.0 (reviewer: 2.82, 1.33, 0.853, 0.507,
  0.383). File `thresholds/games/old_exact/out/r4_theta_5_exact.json`. (The crossing is now refined by regula falsi; the
  content worker interpolated once.)
  (2) NEW GAME (1, -81/100, 33/200), row 0.80, exact derivatives, rows 0.01 apart (piece [0.795, 0.805]), kappa_AB = 0.82:
  theta_room = 0.945 (0.5 u*), 0.424 (0.7), 0.287 (0.85), 0.279 (0.925). Old game on the same row grid: 2.73 (0.5), 0.837
  (0.7); the rest is running.
  (3) **THE QUINTIC SHELLS TAKE TWO TO THREE TIMES MORE OF THE DEFICIT IN THE NEW GAME, so kappa_AB = 0.82 is not available
  to it.** Exact coupled one-spike model (gate outputs, 16 points per row), share of D + V_sl taken by all shells other
  than A/B, largest over the points (always at c = 0.1, sigma*): 0.18 (t = 0.70), 0.25 (0.76), 0.31 (0.80), 0.35 (0.82),
  0.40 (0.84), 0.42 (0.85), 0.455 (0.86), 0.525 (0.88); old game 0.139 at 0.85 (the study: at most 0.16). With a constant
  split kappa_AB + kappa_h <= 1 the A/B shells of the new game get kappa_AB <= 0.69 (0.80), 0.65 (0.82), 0.58 (0.85)
  instead of 0.82. The two shares peak at opposite ends: quintic 0.31 / 0.15 / 0.06 / 0.03 and A/B 0.01 / 0.07 / 0.13 /
  0.22 at c = 0.1 / 0.3 / 0.6 / 1 (t = 0.80); their sum is at most 0.32 (0.80), 0.43 (0.85). A split that depends on the
  concentration of the cubic would give the A/B shells about 0.95 where their test binds (chi = 30-42): a lever for BOTH games.
  Tools: `gate/kappa_h.py`, `thresholds/game_extra.py` (allowance with the game's own kappa_AB = 1 - kappa_h - 0.02).
  RUNNING (all with exact derivatives):
  - yo core 6: editable queue `thresholds/games/queue_6.txt` (runner pid in `thresholds/job_fq6.pid`, log
    `thresholds/games/fq_6.log`): g081 (full), its kappa_h and ratio, then g080, g081_g13, g079 (row 0.80 only);
  - yo core 7: `queue_7.txt`: g078 (full), its kappa_h and ratio, then g077, g0805, g080_g10;
  - laptop: `thresholds/detune.py g081t080 ...` (pid `thresholds/job_detune_lap.pid`, log
    `thresholds/variants/detune_g081t080.log`): does detuning the row 0.80 raise its allowance? First probe: a detuning that
    lowers u* by 4 % moves the allowance by +7 % at 0.85 u* and -5 % at 0.925 u* (the cap moves relative to u*).
  - big: stage-2c test still in its Stein cover (row 0.1250L: 978 boxes accepted after 22 min); Gaussian row 0.8475 done in
    595 s wall on 4 processes, certified G+ - float = 1.3e-5.
- 22:50 **COORDINATOR'S NOTE ON Gamma' (spline derivative) ADDRESSED: exact derivatives now, everything before 22:45 is
  superseded.** My copies of the content worker's programs had the same defect (combo.prof_derivs took Gamma' from the cubic
  spline through the profile table). Fix: `thresholds/prof2.py` computes Gamma_A, Gamma_B, Gamma_0, psi AND their s-derivatives
  from the defining integrals (d ph(A)/ds = i ph(A) Im(conj(ph A) D)/|A|), with an accurate quadrature (the only singular
  points are the zeros of A+ on the real axis; a C-infinity partition of unity puts a polar grid at each zero). `rowlib.Row`
  interpolates the exact derivative tables, `combo.prof_derivs` uses them and REFUSES tables without them (SPLINE_DERIV=1
  reproduces the study's numbers for regressions). The margins mu come from the same quadrature (no more grid artefacts).
  Checks written by prof2.py into `thresholds/games/<name>/out/prof2_<k>.log` for every row, at s = 0.02, 0.088, 0.25, 0.6:
  exact derivative against a central difference of direct values (h = 1e-4) and against a finer quadrature.
  Old game, row 0.84 (`thresholds/games/old_exact/`): largest difference 1.7e-7; values agree with the finer quadrature to
  3e-10. At S = 0.088: Gamma_A' = -1.49041856 (central difference -1.49041851), Gamma_0' = 2.70735102 (2.70735099), so the
  tilted Gamma_A' + 0.4 Gamma_0' = -0.40748: the reviewer's exact -0.4075. The spline derivative of the study's table is off
  by -5.2e-2 (Gamma_A') and +5.4e-2 (Gamma_0') there, i.e. -0.4379 for the tilted profile (the reviewer quotes -0.4385).
  mu of the old game from the new quadrature: 0.43086 (0.84), 0.36745 (0.80), the content worker's values to all digits.
  Stage 2b/2c law layer: NO spline derivative anywhere. It uses only interval node caps of Psi5 (values), joined by chords
  (an upper bound, Psi5 is convex in s), a Lipschitz bound beyond the last node, and analytic or piecewise-linear test
  functions for the Stein family; the float LPs only propose boxes, every box is re-verified exactly.
  Definition used for theta_room(u) (the reviewer's): the largest theta for which (F) plus the hypothesis
  ||c_X||^2 <= theta delta Omhat_X in both sectors keeps the row inside its room at the energy u, within the law-layer
  relaxation (moments, Stein family, response cap, (R1) at t_lo): sufficient for the row, not necessary.
  FIRST LOOK with the old (spline) derivative, binding energy 0.85 u*, rows 0.01 apart (N; these numbers are on the safe side
  by up to 8 % and are being recomputed): old game (1, -0.78, 0.0779): theta_room = 0.521 (t = 0.80), 0.964 (0.82);
  (1, -0.81, 0.165): 0.261, 0.484. **The new game halves the allowance on both low rows.**
  Restarted 22:48 with exact derivatives: yo core 6 g081, g080, g079, g081_g13; core 7 g078, g0805, g081_g10, g080_g10.
- 22:30 ALLOWANCES: tool ready and regressed; first numbers; three machines working.
  `thresholds/r4_theta2.py` (the content worker's r4_theta.py, row data from a file) reproduces on the OLD game at t = 0.80
  theta_room = 0.487 (0.85 u*), 0.360 (u*) and theta_0 = 0.331, 0.240: exactly the numbers of CONTENT_LEMMA_D5 12.1.
  FIRST NUMBERS FOR (1, -81/100, 33/200), row t = 0.80 (N): theta_room = 0.915 at 0.5 u*, 0.394 at 0.7 u* (old game: 2.80,
  0.842): **the allowance of the low row is about HALF of the old game's.** The rest of the table (0.85 u*, u*, row 0.82,
  eleven other games) is running: see "IF I AM INTERRUPTED" point 2.
  Float law layer with B(s) at the low rows of the 0.81 game: gap -1.4e-5 (0.80), +2e-6 (0.82): no law-layer loss there.
  Stage-2c end-to-end test started on big 22:18 (cores 40-47); node caps of both test rows done in 94 s and 132 s wall
  (4 processes each).
  Small-ball certificates (objective eta (1 - r/r0)_+^2 ALONE, relaxation N, exact check): useless, bounds 0.06 (s in [0,1])
  to 0.153-0.165 (s large) against the trivial eta = 0.165: without the radius term in the objective the class allows much
  mass near 0. A certified direct bound from N needs the coupled objective g_sigma at sigma-nodes: scripts written
  (`smallt/l3/nodes_l3.py`, `assemble_l3c.py`), not run yet.
  Gate tables of the 0.81 game are complete (`collect_gate.py`): every point of the exact model loses on 0.80-0.886; the
  zero-core odd scalar crosses 1 at t = 0.8225 (1.0037 at 0.82, 0.9895 at 0.83); untilted A/B ratio 0.863 (0.80) ... 0.772
  (0.886).
- 22:16 RESUMED after the usage-limit stop (19:50-22:10). Coordinator's second message read (allowances theta_room(u) on
  the low rows are now the priority; big cores 40-47 allowed for stage-2c preparation and tests).
  State found: all yo jobs ended normally and yo is idle: model gate (13 spike rows + cheap integrals for 18 rows), law rows of
  the working game (t = 0 ... 0.65) and of the comparison games, small-ball certificates (4 files). The laptop threshold runs
  finished for t = 0.84, 0.845, 0.85, 0.855 (both tilts). NOT started: the stage-2c end-to-end test, the certified small-t
  nodes, thresholds of 0.80 and 0.82.
  **Thresholds of the working game (1, -81/100, 33/200), law-layer test of CONTENT_LEMMA_D5 11.4 (b), N:**
  | t | theta, tilt (0.4, 0.3) | theta, tilt (0.3, 0.3) | old game (1, -39/50, 779/10000) |
  | 0.84 | 0.90 | 0.94 | 1.33 |   | 0.845 | 1.39 | 1.46 | 1.88 |   | 0.85 | 1.78 | 1.83 | 2.5 |   | 0.855 | 2.60 | 2.68 | 3.7 |
  **So the higher cap LOWERS the thresholds by about 30 % although the room grows by 60 %**: the pointwise A/B margin mu
  falls from 0.43-0.45 to 0.31-0.33 (tilt (0.4, 0.3)), and the contents grow. This is the trade the coordinator asks about;
  next: theta_room(u) on t = 0.80, 0.82 for a family of games (lambda_1 from 0.78 to 0.81, gamma at and below its optimum).
- 19:38 **PROFILES FOR THE CONTENT WORKER ARE WRITTEN: profiles/band_row_{0.80,0.82,0.84,0.845,0.85,0.855}.json**, the kit's
  format (t, row, game, tilt, ustar, S5, theta_needed, S, psi, GA, GB, G0; 705 amplitudes), for the working game
  (1, -81/100, 33/200). theta_needed is null until the threshold runs finish (laptop, started 19:36); the files will be
  rewritten with it. Generator: thresholds/ (prof.py, tilt.py of the kit with the game from D5_E1, D5_ETA; rows5.lines).
  Pointwise A/B margins of the new rows (N, fine z-grid 128 x 768; the coarse grid gave 5 % artefacts at |q| = 0.02-0.07):
  | t | untilted mu (worst ratio) | tilt (0.4, 0.3) | tilt (0.3, 0.3) |
  | 0.80 | 0.165 (0.866) | 0.256 at |q| = 1.0 | 0.314 |   | 0.82 | 0.190 (0.846) | 0.284 at 1.0 | 0.340 |
  | 0.84 | 0.224 (0.819) | 0.308 at 1.05 | 0.371 |  | 0.845 | 0.231 (0.813) | 0.316 at 1.05 | 0.377 |
  | 0.85 | 0.237 (0.808) | 0.321 at 1.1 | 0.383 |   | 0.855 | 0.243 (0.803) | 0.327 at 1.1 | 0.389 |
  (old game at 0.85: 0.273 untilted, 0.446 tilted.) The study's tilt (0.4, 0.3) now has its minimum far out (|q| about 1);
  (0.3, 0.3) has a larger margin. Thresholds are being computed for both tilts.
  Gate so far (N): exact coupled one-spike model at t = 0.84, 0.85: every point loses; theta = -0.060, -0.066 (junta,
  1.1 sigma*), least negative excess -1.7e-6, -1.0e-6 (c = 0.1, sigma*); shares of the deficit at c = 0.1: H22 0.24,
  H11 0.09, H31 0.07; A/B up to 0.21 on the junta. Zero-core odd scalar: 0.962 at 0.85, below 1 for t >= 0.83 (0.9895),
  above 1 for t <= 0.82 (1.0037 at 0.82, 1.033 at 0.80, 1.206 at 0.70); the old game crossed at 0.807.
- 19:30 Gaussian rows of the working game (1, -81/100, 33/200) DONE (N): rows/B/gB_all.lines, 23 rows t = 0.70 ... 0.886
  (the stage-2 grid plus 0.8425, 0.8475, 0.8525, which cut the chord loss between rows at the peak from 9e-6 to 2e-6).
  The peak did not move: row 0.8475 = 0.7126260; float envelope max 0.7126281 at t = 0.8487; room 6.39e-4.
  Room per row (Gaussian ideal of the law layer, N): 0.80 1.41e-3 | 0.81 1.08e-3 | 0.82 8.4e-4 | 0.83 6.8e-4 | 0.84 6.6e-4 |
  0.8425 6.5e-4 | 0.845 6.4e-4 | 0.8475 6.4e-4 | 0.85 6.4e-4 | 0.8525 6.4e-4 | 0.855 6.5e-4 | 0.86 6.7e-4 | 0.865 7.3e-4 |
  0.87 8.1e-4 | 0.875 9.1e-4 | 0.88 1.03e-3 | 0.886 1.21e-3.  Small-t Stein rows (N): 0.05 9.8e-3 | 0.075 8.7e-3 | 0.1 8.2e-3 |
  0.125 8.2e-3 | 0.15 8.3e-3 | 0.2 8.9e-3 | 0.25 1.15e-2 (rows 0.3-0.65 running).
  lambda_1 = 0.82 with B(s): thinnest small-t row +1.6e-4 at t = 0.1 (9.6e-4 at 0.075; plain cover -7.7e-4): not robust.
  Running: model gate (yo core 7), band profiles for the content worker (laptop -> profiles/), law rows 0.4-0.65 (yo core 6).
- 19:15 **WORKING GAME FIXED for rho = 0.93 (s-dependent B(s)): T = P10 - (81/100) P21 + (33/200) P32.**
  Comparison (N; small t with moments + B(s) + scalar Stein family, rows re-optimised against that class):
  | lambda_1 | gamma | N (rows) | margin to 500/701 | t = 0 slack (rho .93) | direct small-t bound: room at t = 0, covers t <= | thinnest small-t row |
  | 161/200 (A) | 3/20 | 0.7126611 | 6.06e-4 | 1.70e-2 | 1.17e-2, 0.117 | pending (expected > 1e-2) |
  | 81/100 | 33/200 | 0.7126262 | 6.41e-4 | 1.27e-2 | 6.8e-3, 0.090 | 8.4e-3 at t = 0.125 (0: 1.29e-2, 0.075: 9.4e-3, 0.1: 8.6e-3, 0.15: 8.8e-3, 0.2: 1.09e-2) |
  | 41/50 | 0.1944 | 0.7125624 | 7.04e-4 | 4.05e-3 | FAILS by 3.0e-3 (phantom atom 4 %) | pending (expected about 0) |
  0.81 has a thinnest small-t room above the old game's 5.8e-3 and a direct bound; 0.82 has neither with this law class.
  Plain covers (moments + radius, no Stein) are NOT enough for 0.81 on t = 0.1-0.25 (rooms 4.6e-3, 2.2e-3, 6e-4, -3e-4 at
  0.1, 0.125, 0.15, 0.2): those rows need Stein covers.  gamma: the row engine is flat on 0.1635-0.165 (2e-7), so 33/200.
  With the relaxation N as law class (objective-specific certificates, not yet built) 0.82 would get a direct bound
  again: N(eta) about 0.7096-0.7101 at s = 6.4 (room 3.2-3.7e-3, covers t <= 0.065); the small-ball excess of that class is
  <= 4e-4 at eta' = eta, 1.2e-3 at eta' = 0.35, 4.8e-3 at 0.5 (float duals, not tightly converged).
  Fallback for rho = 0.9359: A = (1, -161/200, 3/20), margin 6.06e-4 (0.81 at 0.9359: no direct bound, thin rows 1.4e-3).
  Running: Gaussian rows of the working game (yo core 7), its law rows (yo core 6, laptop).
- 19:02 COORDINATOR'S REDIRECT RECEIVED (radius 0.93 proved and reviewed; s-dependent bound B(s); re-decide the game among
  161/200, 0.81, 0.82; prefer robust small t; profiles/ for the content worker). Done so far:
  * replayed the reviewer's verifier on cert_N_final.json (yo): 23 rows pass, max 0.9299970680 < 93/100; exact endpoint
    bounds in radius/rowbounds_N.json; radius/rho_table_N.json = B(s) as chords of the row endpoints (rounded up, 7 dec.).
  * my float tools take B(s) (rows/lawbundle.py, smallt/explore/nfun.py). Direct small-t constant with moments + B(s) +
    scalar Stein family (N): lambda_1 = 0.81 -> N(eta) = 0.706443, room 6.8e-3, covers t <= 0.090 (constant 0.93: 0.707400,
    0.084). 0.82 and 0.805 running (constant 0.93: 0.82 FAILS by 4.0e-3; the phantom atom is 4.15 % at rho = 0.93).
  * **The right fix exists (N): the antiholomorphic relaxation N of the radius certificate, used with the objective
    g_sigma itself instead of |q|, has NO phantom atom.** With the radius worker's dual SOCP and the objective swapped
    (smallt/explore/radrel/, a 2-line hook): at lambda_1 = 0.81, s = 6.4, eta' = eta the bound is 2 sigma * 0.93019,
    i.e. N(eta) = lambda_1 B^2 = 0.70085 (room 1.24e-2) with no small-ball term. A radius cut alone cannot do this (a
    better radius only makes room for a bigger atom); it needs one dual certificate per (sigma, s-interval) with the
    objective g_sigma: same verifier format, piecewise polynomial in r. eta' scan and lambda_1 = 0.82 running (laptop).
  * yo core 6: small-t law rows with B(s) for 0.81, 0.82, 0.805 (thinnest row). Gaussian rows of A are done
    (rows near the peak: 0.845 0.7126570, 0.85 0.7126587; file yo:rows/out/gA_rows.lines).
- 18:48 Candidate working game A = (1, -161/200, 3/20): the row engine gives N = 0.7126611 at gamma = 0.150 (scan
  0.146..0.154, minimum at 0.1497), margin 6.06e-4, 1/N = 1.403191. Game B = (1, -0.81, 0.1645) at small t (N, rows
  re-optimised against each law class): plain covers (moments + radius) FAIL at t = 0.075-0.1 (room -1.4e-3, -4.3e-3);
  with the Stein family the rooms are 3.8e-3 (t = 0), 3.3e-3 (0.025), 1.5e-3 (0.075), 1.4e-3 (0.1). So B has no direct
  small-t bound and thin small-t rows; A is being computed (yo: Gaussian rows on core 7, law rows on core 6).
  Stage 2c code is being written in cert2c/ (one game.json for the game, the radius and the nu-grid).
  NOTE: Clarabel's default is multi-threaded; my copies now pass max_threads=1 (one laptop test ran 2.4 cores for
  about 100 s before I saw it and stopped it).
- 18:33 TASK 1 done at N level (cutting planes + checks, files game/results/). Caps 0.80 / 0.81 / 0.82, no tail:
  (1, -0.80, 0.135) N = 0.7126986, margin 5.68e-4; (1, -0.81, 0.16445) N = 0.7126265, margin 6.40e-4;
  (1, -0.82, 0.19437) N = 0.7125629, margin 7.04e-4. Identity tails add at most 1.3e-6 (inside the gaps). Only W3
  driver pairs bind (t = 0.8475-0.8477); Z2/plain phase/h o rho/Z3 (4 seeds)/W3+W5 below.
  **FINDING (N): the direct small-t bound FAILS at lambda_1 = 0.81.** With moments + radius 0.9359 + scalar Stein family
  the law class again contains a phantom atom at |q| = 0 of mass about 3 % (= 1 - (0.9359/0.9513)^2: the Stein family
  only knows the old radius). N(eta') is then about lambda_1 rho^2 + 0.0295 eta', smallest at eta' = eta:
  0.81 -> 0.714344 > 500/701 (no bound at all); 0.805 -> 0.709537, covers t <= 0.066; 0.80 -> 0.704714, covers t <= 0.099.
  So the t = 0 slack must exceed about 0.03 eta = 4.9e-3; 0.81 has 3.78e-3. Candidate working game: lambda_1 = 161/200.
  Fast row tools written and validated on the old game: rows/rowfast.py (Gaussian rows, BFGS with envelope gradient,
  12 s per row instead of 20 min) and rows/lawbundle.py (law-aware rows, bundle method, 15 s per row).
- 18:14 Read the sources (STATUS, PD45, CERT_STAGE2/2B, CAPPED_GATE, SMALL_T, CONTENT_LEMMA_D5 sections 1, 8.4, 11.4) and
  the code (primal-dual/, degree5-cert/cert2, cert2b). Created this folder. Task 1 (the game) is starting.

## Tasks

1. The game at caps 0.80, 0.81, 0.82 (with and without identity tail): DONE (N); choice of the working game in progress
2. Rows for the working game: not started
3. Gate: not started
4. Small t: not started
5. Stage 2c certificate (prepare only; nothing on big until told): not started
6. Content-band thresholds: not started
