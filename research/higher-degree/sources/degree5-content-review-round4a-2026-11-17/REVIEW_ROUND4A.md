<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/REVIEW_ROUND4A.md (17 November 2026, 00:43); a review worker of claude-b9ee. Only this line was added. -->
# Review of `CONTENT_LEMMA_D5.md` §12 — round 4, part A (the energy band, the local bound, the split candidate)

**Subject.** `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CONTENT_LEMMA_D5.md`,
§12 (lines 1058–1417) and the corrections it made in §0 (items 9–11), §10 (items 10–11), §11.4 and §11.5. Code
`content5/code/r4_*.py`, `sec12*`; outputs `content5/out/r4_*`. Author: the content worker of claude-b9ee; the section labels
its proofs "P, mine", unreviewed.

**Reviewer.** A review worker of claude-b9ee: another session than the author's, no contact with the author. The author's
folder was read and never written, apart from this file and `content5/review-round4a/`. 16 November 2026,
18:52 – 17 November, 00:43 (Europe/Bucharest; a pause from about 19:50 to 22:13). Laptop only, one single-threaded
process at a time; `big` and `yo` not used; nothing committed, pushed or posted.

Labels **P**, **C**, **N** as in `research/README.md`. "Ratio" is ‖c_X[h]‖²/(δ·Ω̂_X[h]) for a sector X ∈ {A, B}; σ*² is the
row's benchmark energy; "possible" means: a possible response by the family (R1) at t_lo. Paths below are relative to
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/`.

---------------------------------------------------------------------------------------------------------------------

## 0. Verdict

| item | verdict | in one line |
|---|---|---|
| 1a. §12.1: below u₀ the proved bounds leave no excess | **not a proof**; a numerical observation (N), correct as one | sampled cells, γ of (S) numerical; u₀ = 0.37 and 0.54 (rows 0.80, 0.84) confirmed to ±0.01σ*² on a finer grid (§3.1) |
| 1b. §12.1: the allowance θ_room(u) | **correct, with corrections** | the derivation is right and my independent program reproduces the author's logged excesses to three digits. Three choices of the program move the number: nine weight pairs (allowance too small by up to 11 %), five values of χ (too large by 2–16 %), Γ′ from the tables (too small by 0.6–8 %). Against the reference (exact minimum over the weights, fifteen χ, exact Γ′) the published values of the rows 0.80 and 0.84 are within +3 %/−11 % and, but for one entry, below it: usable as they are (§3.3, §3.5) |
| 1b. "the largest constant", necessary and sufficient? | the exact-weights value is, within the law-layer relaxation; the published nine-weight values are sufficient lower bounds of it; for the row itself either is only sufficient | §3.4 |
| 1b. "the row constants are its minima, just above σ*²" | **correct** for the author's protocol | nine weights: 0.376 at σ*² (row 0.80; the note 0.37) and about 1.32 at 1.045σ*² (row 0.84; the note 1.33); the relaxation's minima are 0.4025 at σ*² and 1.443 at 1.06σ*² (§3.6) |
| the target curve (T) of PROBLEM_V2, θ_t·max(1, σ*²/u)^{1.8} | **sufficient, with slack** | with the exact minimum over the weights it uses at most 55 % (row 0.80) and 59 % (row 0.84) of the room, i.e. it is 8.5–11 % below the allowance in θ. On the nine weights it sits at 100–102 % of the room: an artifact of the weight grid, which I first reported as "no slack" (§3.7) |
| 2. §12.2: the two-variable margins and the worst cubic | **correct with corrections; superseded as margins** | ratios reproduced to four digits; my search (20 runs) finds nothing above 0.1595; the smallest two-variable margin is about 3.0 and 6.0, just below σ*² (the note: 3.1 and 7.1 at 0.85σ*²); the reading of the earlier 1.7 and 2.2 is right (§4.1–4.4) |
| 2. growth with the number of variables | **confirmed** | n = 3: 0.1925 by my own search and on a deterministic rule; the author's maximisers for n = 3, …, 6 re-evaluated: 0.1926, 0.2099, 0.2234, 0.2355 at 0.85σ*² (§4.5) |
| 3. §12.3: the bound (P) | **correct** (P, now reviewed) | merged vector exact, the adjoint is Wick multiplication, budget = 6.3.21; tested to 2·10⁻⁶ on 112 cases; junta equality and κ₂ = c₀ confirmed; as majorants neither 6.3.25 nor (P) can close the row 0.80 (§5) |
| 4. §12.4: the split candidate | stated as a negative result; both steps correctly stated | (C-XZ) is refuted by three variables (§6) |
| outside the list | — | (F) is evaluated with a derivative of the tables that is wrong by 1–4·10⁻² at small radii; every logged excess with (F) is too large by 0.4–2.8·10⁻⁴ gain units; conservative (§2) |
| 5. ledger | rows proposed; corrections to 4.19, 4.20 and to 4.28 of pull request #485 | §8 |

Nothing labelled P in §12 is wrong. The numbers of §12 that enter a decision need the corrections of §9; the ones
that matter most are the weights and the χ grid of the allowance, and the dependence of the largest ratio on the
number of variables.

### 0.1 Summary for the ledger (to copy)

All of it is **N**. Independent means: own row objects from the row records (profiles and their derivatives from
the definitions), own law-layer program (it reproduces the author's logged excesses to three digits when given the
author's inputs), own quadratures; pointwise A/B margin, κ_AB = 0.82, the whole stage-2 room, as in the note.

**(i) The corrected allowance** θ_room(u): exact minimum over the weights (one conic program per cell), fifteen
values of χ from 1 to 42, exact Γ′; binding χ in brackets. It is the reference; it agrees to 0.4 % with a second
minimisation of mine at ten cells and with the degree-5 worker's program at three (0.538, 0.482, 0.4025 at 0.85, 0.90,
1.00σ*² on the row 0.80; mine 0.540, 0.483, 0.4025).

| row 0.80, u/σ*² | 0.50 | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.05 | 1.075 | 1.10 | 1.15 | 1.20 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| θ_room (reference) | 2.71 [20] | 1.337 [30] | 0.848 [36] | 0.540 [42] | 0.483 [42] | 0.438 [42] | 0.4025 [42] | 0.407 [30] | 0.4115 [24] | 0.417 [20] | 0.449 [14] | 1.28 [2] | no possible law |
| nine weights, fine χ (a sufficient value) | 2.63 [24] | 1.33 [30] | 0.836 [36] | 0.507 [30] | 0.438 [36] | 0.402 [36] | 0.376 [36] | 0.389 [30] | 0.407 [24] | 0.416 [20] | 0.448 [14] | 1.28 [2] | |
| published | 2.80 | 1.33 | 0.84 | 0.49 | | | 0.36 | | | | | | |

| row 0.84, u/σ*² | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.045 | 1.05 | 1.06 | 1.075 | 1.10 | 1.12 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| θ_room (reference) | 6.32 [10] | 3.72 [12] | 2.22 [14] | 1.96 [14] | 1.75 [14] | 1.579 [16] | 1.507 [16] | 1.455 [16] | 1.448 [14] | 1.443 [12] | 1.503 [8] | 2.64 [2] | no possible law |
| nine weights, fine χ (a sufficient value) | 6.30 [10] | 3.70 [12] | 2.08 [10] | 1.83 [12] | 1.61 [12] | 1.47 [14] | 1.37 [14] | about 1.32 [14] | 1.338 [14] | | 1.50 [8] | 2.64 [2] | |
| published | | 3.7 | 2.2 | | | 1.44 | | | | | | | |

Minimum over the band: 0.4025 at σ*² (row 0.80) and 1.443 at 1.06σ*² (row 0.84); the published θ_t are 0.36 and 1.33.

**(ii) The five-χ grid, and the two other errors.** At fixed (nine) weights the grid χ ∈ {2, 8, 16, 30, 42} makes θ_room
too large wherever the binding kurtosis falls between its values: by 2–7 % up to σ*² on the row 0.80 and 2–8 % on the
row 0.84, and by 12 % and 16 % at 1.05σ*², where the binding cell sits on the edge of the response family. The nine
weight pairs {0, ½, 1}² make it too small, by 6–10 % from 0.85σ*² to just above σ*² and by 3 % or less elsewhere (the
exact minimum over the weights is one conic program per cell, by Sion's theorem). The derivative Γ′ that (F) uses in
the note (a spline of the tables) is wrong by 1–4·10⁻² at small radii, which makes every logged excess with (F) too
large by 0.4–2.8·10⁻⁴ gain units and θ_room too small by 0.6–8 %. Together: the published values of these two rows are
within +3 %/−11 % of the reference and, but for 2.80 at 0.5σ*² on the row 0.80 (reference 2.71), below it. Laws with
720 atoms instead of 360 and 85 values of λ in (R1) instead of 43 change nothing (0.0 %); 35 test identities instead
of 21 raise θ_room by 0.6–3.4 %.

**(iii) A target curve with slack.** Keep (T) as published: θ(u) = θ_t·max(1, σ*²/u)^{1.8} with θ_t = 0.36 (row 0.80) and
1.33 (row 0.84). With the exact minimum over the weights it is inside the room at every tested energy from u₀ to the
cap, using at most 55 % of the room on the row 0.80 (0.85–0.90σ*², χ = 42, and 1.025σ*², χ = 36) and 59 % on the row
0.84 (1.06σ*², χ = 12): **a slack of at least 41 % of the room, or 8.5–11 % in θ.** On the nine weights of the note the
same curve sits at 99.9 % and 102 % of the room at its worst cells; that is the coarse weight grid, and a
certificate must not take its weights from {0, ½, 1}². With 0.95·θ_t the curve keeps a quarter of the room free even on
the nine weights (largest excess 75 % and 71 %); with 0.90·θ_t, 42 % and 63 % free. Rows 0.82 and 0.845–0.855, not computed
(judgment): the same mechanisms, θ_t from the same round-3 scans, so I expect the published θ_t to lie 5–10 % below
the relaxation's minimum there as well and (T) to be sufficient; for a statement that must be safe before they are
recomputed, 0.95·θ_t. All of it N: tested cells, pointwise μ, κ_AB = 0.82, the whole room.

**(iv) The author's maximisers, re-evaluated** (row 0.80, sector A; the stored coefficient vectors as data; δ exact
from q as a polynomial; content, Ω̂ and (R1) on eight independent scrambles of 2¹⁹ Sobol points).

| u/σ*² | n | ratio: mean ± standard error | smallest, largest scramble | χ (exact) | largest t allowed by (R1) (t_lo = 0.7850) |
|---|---|---|---|---|---|
| 0.85 | 2 | 0.1595 (own search, 20 runs; deterministic rule) | — | 14.75 | 0.7995 |
| 0.85 | 3 | 0.1926 ± 0.0001 (own search over H₂,₁(ℂ³): 0.1925) | 0.1922, 0.1929 | 9.273 | 0.8044 |
| 0.85 | 4 | 0.2099 ± 0.0002 | 0.2092, 0.2105 | 7.040 | 0.8066 |
| 0.85 | 5 | 0.2234 ± 0.0001 | 0.2229, 0.2241 | 5.596 | 0.8079 |
| 0.85 | 6 | 0.2355 ± 0.0003 | 0.2343, 0.2367 | 4.503 | 0.8089 |
| 1.00 | 2 | 0.136 (largest of the shared-driver class; **not** a possible response) | — | 13.9 | 0.7813 |
| 1.00 | 3 | 0.1680 ± 0.0001 | 0.1678, 0.1685 | 9.044 | 0.7876 |
| 1.00 | 4 | 0.1846 ± 0.0002 | 0.1835, 0.1856 | 6.862 | 0.7906 |
| 1.00 | 5 | 0.1989 ± 0.0001 | 0.1983, 0.1994 | 5.360 | 0.7926 |

The author's second-sample values for the same vectors are 0.1925, 0.2104, 0.2245, 0.2365 and 0.1679, 0.1847, 0.1987;
its fitting-node values 0.1926, 0.2132, 0.2285, 0.2533 and 0.1682, 0.1870, 0.2043.

**(v) Rows 4.19, 4.20 and 4.28 of `research/higher-degree/STATUS.md`** (as in
`/Users/alingalatan/workspaces/grothe-claude-b9ee-ledger-pass2`, commit 5448b8a26).

| row | this review confirms | corrects | cannot judge |
|---|---|---|---|
| 4.19 (v) and its scope | "with one constant per row, the rows stay inside their rooms for θ ≤ 0.37 (t = 0.80) and 1.33 (t = 0.84)": on the protocol of the note (nine weights) the minimum of the allowance over the band is 0.376 at σ\*² and about 1.32 at 1.045σ\*² (fine χ, exact Γ′); the relaxation's minima are 0.4025 and 1.443, so the constants are safe. "The thresholds are the smallest allowance of each row, near u = u\*": yes, at u\* on t = 0.80 and just above it on t = 0.84. "Ω_{e\*}/Ω̂ above the threshold on t = 0.80": yes, up to 0.67 at σ\*² and 0.71 at 0.85σ\*² on two-variable cubics without bulk | "(PROBLEM_V2 §2, N, in review)" → reviewed for t = 0.80 and 0.84. Add: the excesses of (iii) and the thresholds were computed with nine weight pairs, five values of χ and a Γ′ in (F) that is wrong at small radii (item (ii)); the thresholds of these two rows survive as sufficient values, the excess figures of (iii) are upper bounds, too large by 3·10⁻⁴ from Γ′ alone and by more from the weights | the excesses of (iii) with (S) and the shares of (iv) (not recomputed); t = 0.82, 0.845–0.855; the Bessel majorant; the measured 0.78 (it is with a bulk) |
| 4.20 | the ratios at 0.5σ\*² on t = 0.80 and 0.84 (X(\|Y\|² − 1) 0.189 and 0.346, junta 0.185 and 0.407, H(X) + H(Y) 0.220 and 0.416); "these factors are margins of these families, not of the inequality" | "below the thresholds by a factor 1.7 at t = 0.80 … 3.2": these divide the row minimum, which belongs to u ≈ σ\*², by a ratio at 0.5σ\*². At 0.5σ\*² the allowance of t = 0.80 is 2.71, so the factor there is 12; the smallest energy-matched factor of two-variable cubics is about 3.0 (t = 0.80) and 6.0 (t = 0.84), just below σ\*². Also: 1.3σ\*² is above the caps (1.08–1.22σ\*²): no response there | the 34 row/rank pairs and their margin 1.96; the other rows |
| 4.28 | the values at t = 0.80 for n = 2, …, 6 at 0.85σ\*² and n = 3, 4, 5 at σ\*², to ±0.001 (item (iv)); the increments; χ of the maximisers; that the n = 2 maximisers at σ\*² violate (R1) (t = 0.80 and 0.84) and that those with n ≥ 3 at t = 0.80 satisfy it; the size of the fitting-sample bias (I find +1.6 %, +2.3 %, +7.6 % for the vectors I evaluated); finding (a) at t = 0.80 (against θ_t = 0.36: 6.3.25 above on five of my seven two-variable cubics at σ\*², 6.3.26 on two; 0.0478 and 0.0308 against 0.0416 on the first test cubic; against the reference allowance 0.4025: four and two) and at t = 0.84 (both below, by factors 1.7 and 2.4 against the published allowance 1.44; 1.57 and 2.25 against θ_t = 1.33); the growth factor 1.32 from n = 2 to n = 4 at t = 0.80 | "the independent values … 0.2232–0.2245 (n = 5) and 0.2364, 0.2365 (n = 6)": for the best vector of each I get 0.2234 ± 0.0001 and 0.2355 ± 0.0003, i.e. the author's second sample is high by 0.4–0.5 %, inside the 0.5 % it states; quote 0.223 and 0.236. "Allowance 0.49 at that energy": the reference value is 0.540; 0.49 is a sufficient value (so the margin at n = 6 is 2.3 rather than 2.1, and 2.0 rather than 1.8 at σ\*², n = 5). "Not independently reviewed" → the values at t = 0.80 are now re-evaluated independently (item (iv)); n = 2 and n = 3 also by independent searches (20 runs and 2 runs) | t = 0.82 and 0.84 for n ≥ 3; t = 0.82, 0.845–0.855 altogether; whether a search with n ≥ 4 found the maximum (I did not search there); the growth factors of the other rows; findings (b) and (c); the extrapolations in n |

---------------------------------------------------------------------------------------------------------------------

## 1. What I did, and what is independent

1. **Own row objects** (`review-round4a/scripts/rowx.py`, on `prof_jets.py` of my shared-factors review). From the row
   record alone (ℓ, β, b_A, b_B, ν₅ and the tilt): ψ(s) by a polar rule centred at the zero of L′ + sD; the tilted
   Γ_A, Γ_B **and their derivatives** by Taylor-mode differentiation of the integrand (no table is differentiated);
   B₅, cost, S₅, σ*², V_sl; k′(v) = E h′(v + uτ) and the two-variable (∂_vk, ∂_ck)(v, c). Against the author's tables
   (705 radii): ψ agrees to 1.5·10⁻⁷, the tilted Γ to 4.4·10⁻⁵ (A) and 3.2·10⁻⁵ (B); σ*² = 0.0878592 and 0.0481515
   (tables: 0.0878588, 0.0481513); S₅ to 4·10⁻⁹; V_sl(0⁺) = 6.95·10⁻³ and 2.08·10⁻³, V_sl(0.5σ*²) = 1.592·10⁻³ and
   4.932·10⁻⁴ (the author's logs: the same four digits). Rows t = 0.80 and 0.84 only.
2. **Own law-layer program** (`lawlayer.py`; cvxpy 1.8.1, CLARABEL), written from the constraints of ledger 3.4 and
   the description of §8: moments, sixth-moment cap, Stein variables with the two rotated cones, 21 test identities,
   43 rows of (R1); the bounds (F), θ·δ·Ω̂ and (S); minimum over the nine weight pairs. I read the author's code to
   learn the discretisation (grid of U, test functions, grid of λ) and did not run it. Added in the course of the
   review: a test of each cell for a possible law that cannot fail silently; the minimum over all weights, by a
   direct refinement and, after the coordinator relayed the idea from the degree-5 worker, as one conic program
   per cell (Sion). That last form is the reference of §3.5; it agrees with the direct refinement and with that
   worker's numbers to 0.4 %.
3. **Own quadratures for cubics** (`task2.py`, `task2b.py`, `task3.py`): a two-dimensional rule in (|X|², |Y|²) for
   the shared-driver class, a three-dimensional rule in (|X|, |Y|, arg Y − arg X) for H₂,₁(ℂ²), chaos projections on
   orthonormal Hermite–Laguerre bases (orthonormality defect 8·10⁻¹¹).
4. **(P) of §12.3** re-derived on paper (§5 below; working notes in `review-round4a/notes_P_derivation.md`), then
   tested numerically with code that shares nothing with `r4_local.py`.
5. The γ of the structural bound (S) (the 2-D resolvent) was **not** recomputed: the low-energy check of §3.1 takes
   the author's values from `out/r4_low_<k>.log`.

---------------------------------------------------------------------------------------------------------------------

## 2. A finding outside the list: the derivative that (F) uses

It touches every number of §§8.4, 11.4, 12.1 and 12.2 in which the law-functional bound (F) takes part, so it comes
first. It does not change a conclusion of §12; it changes digits, always to the safe side.

- (F) needs Γ′ pointwise: F_X = u·Var[Γ′ + Γ/S] + (u/2)·E[(Γ′ − Γ/S)²]. The author takes Γ′ as the derivative of a
  cubic spline through the tables (`combo.py`, `prof_derivs`). The tables are accurate to 4·10⁻⁵ and their spacing is
  0.0005–0.0025 at small radii, so that derivative is wrong by 10⁻² and more for S ≤ 0.3:

  | row 0.84, tilted Γ_A | S = 0.050 | 0.088 | 0.155 | 0.300 | 0.500 | 1.000 |
  |---|---|---|---|---|---|---|
  | Γ′, spline of the table | −0.45409 | −0.43847 | −0.31450 | +0.01356 | +0.43477 | +0.59412 |
  | Γ′, from the definition (Taylor-mode; equal to a central difference of direct values to 6 digits) | −0.44390 | −0.40748 | −0.30229 | +0.02570 | +0.43482 | +0.59704 |

  On the law grid the two versions of Γ′ + Γ/S differ by 4–8·10⁻³ in root mean square and by up to 3.7·10⁻² (values
  of size ≤ 0.96). A spline through every fourth table point does not repair it (the largest error stays
  1–3·10⁻²): the error of the table is not white noise at the finest scale.
- The convex program is a maximum over laws and collects the error where it helps. With the author's Γ′ my program
  reproduces the author's logs; with the exact Γ′ every value that involves (F) is smaller
  (`review-round4a/scripts/fcheck.py`, `logs/fcheck.log`; excess in gain units):

  | row | u/σ*² | θ | χ | author's log | mine, author's Γ′ | mine, exact Γ′ | difference, share of the room |
  |---|---|---|---|---|---|---|---|
  | 0.80 | 0.50 | 1.6 | 30 | +3.170·10⁻⁴ | +3.164·10⁻⁴ | +2.310·10⁻⁴ | 5 % |
  | 0.80 | 0.50 | 3.2 | 16 | +2.280·10⁻³ | +2.279·10⁻³ | +2.191·10⁻³ | 5 % |
  | 0.80 | 1.00 | 0.4 | 42 | +2.380·10⁻³ | +2.384·10⁻³ | +2.105·10⁻³ | 16 % |
  | 0.80 | 1.00 | 0.2 | 2 | −5.970·10⁻⁴ | −5.974·10⁻⁴ | −5.981·10⁻⁴ | 0 % (θ-branch only) |
  | 0.84 | 0.50 | 22.4 | 8 | +3.920·10⁻⁴ | +3.920·10⁻⁴ | +3.523·10⁻⁴ | 10 % |
  | 0.84 | 0.85 | 1.94 | 16 | +2.610·10⁻⁴ | +2.626·10⁻⁴ | +1.802·10⁻⁴ | 20 % |
  | 0.84 | 1.00 | 1.4 | 16 | +3.690·10⁻⁴ | +3.692·10⁻⁴ | +2.472·10⁻⁴ | 30 % |

- **Reading.** (a) The agreement of the third and fourth columns (seven of seven, three digits) is the independent
  check of the author's program: constraints, functionals, slack and deficit are the same in two implementations.
  Values with the θ-branch alone agree to 0.2 % whatever the derivative (k′ is a smoothed quantity). (b) The logged
  excesses with (F) are too large by 0.4–2.8·10⁻⁴ gain units: 5–16 % of the room at t = 0.80, 10–30 % at t = 0.84. (c) On the
  allowance the effect is small, because the excess is steep in θ: θ_room(u) rises by 0.6–8 % (§3.3). (d) It also
  enters the tables of §8.4 and §11.4 (rounds 2 and 3) and the row constants 0.37, …, 3.7; there too the corrected
  numbers can only be more favourable. I recomputed rows 0.80 and 0.84 only.
- **Required:** compute Γ′ from the definition (or differentiate a smoothing spline on a grid no finer than the
  accuracy of the tables allows), rerun the law-layer tables, and say in §3.4 that (F) needs Γ′ to about 10⁻³.

---------------------------------------------------------------------------------------------------------------------

## 3. Item 1 — §12.1, the band

### 3.1 (a) Low energies: "below u₀ the proved bounds (S), (F) leave no excess"

**Verdict: not a proof. A numerical observation on a grid (N), and as such correct on the two rows I recomputed.**

- *What the argument is.* For u ≤ u₀ the test of §8.4 is run with the two proved content bounds only: the largest,
  over the laws of the layer, of Σ_X min(F_X, γ_X(u)δ) − 4μκ_AB(D + V_sl(u)) is found to be ≤ 0. The slack V_sl(u) is a
  number per energy; it is what pays.
- *Why it is N and not P, given (S), (F) and the law layer.*
  1. It is evaluated at seven energies and five values of χ, on 360-atom laws and nine weight pairs; there is no
     cover of the rectangle (u, χ) and no dual certificate.
  2. γ_X(u) of (S) is a number from a two-dimensional resolvent (N), taken at those seven energies; and (S) itself is
     P only up to the regularity of Γ, which §3.3 of the note leaves open.
  3. The allowance uses the pointwise margin μ (N) and κ_AB = 0.82.
  4. The law-free remark for u ≤ 0.1σ*² needs D ≥ 0 (a statement of the law layer, as the section says) and a bound
     of γ(u) on (0, 0.1σ*²], where it is evaluated at 0.1σ*² only (it grows as u falls: 0.41 at 0.1σ*², 0.37 at 0.2σ*²
     on the row 0.80).
- *How u₀ is obtained.* `r4_tables.interp_cross`: the largest excess over the five χ is interpolated linearly in u
  between adjacent grid energies (step 0.1σ*²); e.g. −81 % of the room at 0.3σ*² and +32 % at 0.4σ*² give 0.37.
- *My check* (`review-round4a/scripts/task1.py low`; own program; γ interpolated from the author's logs, which I did
  not recompute; nine values of χ ∈ {2, 4, 8, 12, 16, 20, 24, 30, 42}; exact Γ′). Largest excess, share of the room:

  | row 0.80, u/σ*² | 0.30 | 0.34 | 0.36 | 0.38 | 0.40 | 0.42 | 0.45 |
  |---|---|---|---|---|---|---|---|
  | nine χ | −82 % | −39 % | −16 % | +9 % | +36 % | +63 % | +106 % |
  | the author's five χ | −82 % | −39 % | −17 % | +6 % | +29 % | +54 % | +92 % |
  | the author's five χ and Γ′ (author's table: −81 %, —, —, —, +32 %) | −81 % | | −15 % | +8 % | +32 % | | |

  | row 0.84, u/σ*² | 0.50 | 0.54 | 0.56 | 0.58 | 0.60 | 0.62 | 0.66 |
  |---|---|---|---|---|---|---|---|
  | nine χ (the five give the same: χ = 16 binds) | −45 % | −3 % | +18 % | +39 % | +61 % | +84 % | +131 % |
  | author's table | −41 % | | | | +72 % | | |

  So the excess reaches zero at 0.37σ*² (row 0.80) and 0.54σ*² (row 0.84), as stated, and the room at 0.45σ*² and
  0.63σ*² (the note: 0.45 and 0.62; the 0.62 carries the Γ′ of §2). On the row 0.80 the binding χ is 20, which is
  not on the author's grid; it moves u₀ by less than 0.005σ*². **u₀ = 0.37 and 0.54 are right to ±0.01σ*², as N
  statements, given γ and the nine weight pairs of the test.** I checked no other row. With the exact minimum over
  the weights (§3.5) the excess can only be lower, so the band can only start higher: these u₀ are safe as lower
  ends, and I did not recompute them that way.
- *Required wording.* §0 item 11 and §12.1 say "the proved bounds (S), (F) leave no excess, because the energy slack
  pays": add "N: at sampled cells; γ of (S) numerical". A proof would be a certificate of item 4 of §10 on a cover
  of [0, u₀] × [0, 42], with enclosures of γ(u).

### 3.2 (b) The allowance θ_room(u): my derivation

From §1 of the note. For a possible response q of energy u:

1. the lemma asks G_AB(q) ≤ κ_AB(D(q) + V_sl(u)) + η_AB;
2. the secant step (§3.2 of the note, given its certificate of μ): G_AB(q) ≤ (‖c_A‖² + ‖c_B‖²)/(4μ); so it suffices
   that ‖c_A‖² + ‖c_B‖² ≤ 4μκ_AB(D + V_sl(u)) + 4μη_AB;
3. each content has a proved bound F_X(λ) and the hypothetical bound θ·δ·Ω̂_X(λ), both concave functionals of the
   law λ of |q|²/u; D is linear in λ;
4. the law of a possible response lies in the convex set 𝓛(u, χ) of the law layer (moments, sixth-moment cap, Stein
   variables, test identities, (R1)).

Hence the row inequality holds at the energy u for every possible response if

    E(θ; u) := sup_χ sup_{λ ∈ 𝓛(u, χ)} [Σ_X min(F_X(λ), θδΩ̂_X(λ)) − 4μκ_AB(D(λ) + V_sl(u))]/(4μ) ≤ η_AB,

and θ_room(u) := sup{θ : E(θ; u) ≤ room}, θ₀(u) := sup{θ : E(θ; u) ≤ 0}. E is nondecreasing in θ because Ω̂ ≥ 0
((E Vk′)² ≤ u·E[Vk′²], so Ω̂ ≥ (3/4)E[Vk′²]). The inner supremum is a convex program; min(F, T) is written as a minimum
over weights and exchanged with the supremum. This is what `r4_theta.py` computes, with the minimum over nine
weight pairs, and what I re-implemented; the two programs agree (§2). The exact minimum over the weights is in §3.5.

### 3.3 The allowance recomputed

**On the author's protocol.** Own program and row objects; the same five χ ∈ {2, 8, 16, 30, 42}, nine weight pairs and
360-atom laws as the author; each value is a root of E(θ; u) = room by a safeguarded secant iteration (bracket
±0.5 %), not one linear interpolation between two evaluations a factor 2 apart (`task1.py room`, logs
`task1_room_*.log`, `room06_*.log`). This section answers "are the published numbers what the author's program
gives?"; what the relaxation itself gives is in §3.5.

| row 0.80, u/σ*² | 0.50 | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.05 | 1.10 | 1.15 | 1.20 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| the note and PROBLEM_V2 | 2.80 | 1.33 | 0.84 | 0.49 | | | 0.36 | | 0.577 (log only) | | |
| mine, the author's inputs | 2.75 | 1.29 | 0.836 | 0.501 | | | 0.367 | | 0.577 | | |
| mine, exact Γ′ in (F) | 2.82 | 1.33 | 0.853 | 0.507 | 0.465 | 0.410 | 0.383 | 0.455 | 0.577 | 1.28 | no possible law |
| mine, without (F) (the θ-branch alone) | 0.96 | 0.67 | 0.51 | 0.381 | 0.35 | 0.33 | 0.31 | 0.44 | 0.577 | 1.28 | |
| binding χ (exact Γ′) | 16 | 30 | 42 | 30 | 30 | 42 | 42 | 16 | 8 | 2 | |

| row 0.84, u/σ*² | 0.50 | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.05 | 1.10 | 1.13 |
|---|---|---|---|---|---|---|---|---|---|---|
| the note and PROBLEM_V2 | 23.95 (note) | | 3.69 | 2.19 | | | 1.44 | | | |
| mine, the author's inputs | 24.0 | 6.01 | 3.60 | 2.13 | | | 1.437 | | | |
| mine, exact Γ′ in (F) | 25.7 | 6.42 | 3.78 | 2.21 | 1.96 | 1.74 | 1.548 | 1.55 | 2.64 | no possible law |
| mine, without (F) | < 3.0 | 1.91 | 1.46 | 1.06 | 0.98 | 0.90 | 0.94 | 1.11 | 2.64 | |
| binding χ (exact Γ′) | 2 | 8 | 8 | 16 | 16 | 16 | 16 | 8 | 2 | |

- **The published values of these two rows are confirmed as the output of this protocol**: against the author's own
  inputs my roots differ by −2 % to +3 % (the interpolation); with the exact Γ′ they are 0.6–8 % higher.
- θ₀(u) is not: the note has 0.33 and 0.24 at 0.85σ*² and σ*² on the row 0.80, I find 0.37–0.38 and 0.30 (both
  inputs); 7.44 at 0.5σ*² on the row 0.84 against 7.2–7.6. The excess has a kink where the binding χ changes from 2
  to 30–42, and a two-point interpolation across it is off by 10–25 %.
- At 0.5σ*² on the row 0.84 the number has no significant digit: (F) alone gives 146 % of the room (159 % with
  the author's Γ′) and the excess is nearly flat in θ between 10 and 25. That energy is below the band (u₀ = 0.54),
  and PROBLEM_V2 rightly leaves it out.
- The table entry "> 50 ((F) suffices)" of §12.2 is printed whenever the interpolated θ_room exceeds 50
  (`r4_md.py`). At t = 0.845, u = 0.5σ*² the log has θ_room = 57.8 with a plateau of 3.92·10⁻⁴ against a room of
  3.82·10⁻⁴: there (F) alone does not suffice (103 % of the room); it is (S) that pays (§12.1 has −62 % for that
  cell). The entry should read "below the band".

### 3.4 Is θ_room(u) the largest constant? Necessary and sufficient?

**The exact-weights value is the largest constant within the relaxation; the published nine-weight values are
sufficient lower bounds of it; for the row, either is only sufficient.**

- *Within the law layer.* Let θ_room(u) be the value with the exact minimum over the weights (the first line of
  the tables of §3.5). For θ ≤ θ_room(u) every law of the layer at the energy u is inside the room when both sectors
  are taken at their bound min(F_X, θδΩ̂_X); for θ > θ_room(u) some law of the layer is outside. So θ_room(u) is
  necessary and sufficient for the implication "(F) and the hypothesis with this θ in both sectors ⇒ the row
  inequality at u" **to be provable through the law layer**. That is the sense of "the largest constant" in
  PROBLEM_V2 §2. The published numbers, and those of §3.3, are computed with nine weight pairs: they are lower
  bounds of it (sufficient values inside the relaxation), up to 11 % below it, apart from the effect of the χ grid.
- *For the row it is not necessary.* Each step of §3.2 goes one way.
  1. The extremal law of the program need not be the law of a cubic. On the two-variable shared-driver class the
     threshold of each cubic's own law, (4μκ(D + V_sl) + 4μ·room)/(δ(Ω̂_A + Ω̂_B)), is at least 0.88 at 0.85σ*² on the
     row 0.80 and 2.34 on the row 0.84 (possible members; `task2b.log`), against 0.381 and 1.06 for the θ-branch of
     the program on the nine weights: the relaxation of the laws costs a factor of about 2 there.
  2. Only the sum over the two sectors is needed; the hypothesis bounds each with the same θ.
  3. A cubic whose content is below the hypothesis gets no credit: with the true contents the class uses at most
     11 % and 10 % of the right side (§4.3).
- *What it is conditional on* (all N or assumed, and stated in the note): the pointwise margin μ — with a certified
  secant margin μ′ = rμ the θ-branch threshold scales by exactly r, and the note's own estimate is r ≈ 0.7; κ_AB = 0.82;
  the whole stage-2 room given to this lemma.

### 3.5 Three choices that move the number, and the reconciled table (for the ledger)

The published θ_room comes out of a program with three choices that move it, in different directions.

1. **The weights (the allowance comes out too small).** The program takes the minimum over the nine weight pairs
   {0, ½, 1}² of the maximum over laws. Every weight pair gives a valid upper bound of the excess; the expression is
   affine in the weights and concave in the law, so by Sion's theorem the exact value of the relaxation is

       min over all weights of max over laws  =  max over laws of [min(F_A, T_A) + min(F_B, T_B) − 4μκ(D + V_sl)],   T_X = θδΩ̂_X,

   **one conic program per cell** (`lawlayer.excess_T_sion`; `task4.py rooms`, `targets`). The minimum over weights
   sits between the grid points (my direct minimisation ends at w_A = ¼, w_B = 0.6–0.9 near σ*²; the degree-5 worker
   reports 0.40–0.47 and 0: the minimiser is not unique), and the nine weights miss it: by 6–10 % of θ_room from 0.85σ*² to σ*²
   on the row 0.80 and from 0.85σ*² to 1.05σ*² on the row 0.84; by 3 % or less at 0.5–0.7σ*² and about 1 % from 1.05σ*²
   up on the row 0.80, and by less than 1 % at 0.6–0.7σ*² and from 1.075σ*² up on the row 0.84. With the exact minimum the excess is smooth and monotone in χ; on the nine weights it jumps from cell
   to cell (row 0.80, 0.91σ*², θ = 0.427: 42, 50, 52, 54 % of the room at χ = 30, 36, 39, 42 against 65, 100, 89, 78 %).
2. **The grid of χ (too large).** On χ ∈ {2, 8, 16, 30, 42}, with the nine weights, θ_room comes out too large wherever
   the binding kurtosis falls between the grid values: by 2–7 % up to σ*² on the row 0.80 and 12 % at 1.05σ*²; by
   2–8 % up to σ*² on the row 0.84 and 16 % at 1.05σ*², where the binding cell sits on the edge of the response
   family. I used fifteen values, χ ∈ {1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 24, 30, 36, 42}, and every cell was first
   tested for a possible law by a problem that is always feasible (the largest (R1) slack over the laws of the
   layer), so that a solver failure cannot pass for "no law".
3. **Γ′ in (F) (too small)**: 0.6–8 %, §2.
4. *No effect:* 720-atom laws instead of 360 (0.0 % at four cells), 85 values of λ in (R1) instead of 43 (0.0 %).
   Thirty-five test identities instead of 21 raise θ_room by 0.6–3.4 % (a smaller layer, not an error)
   (`task4.py acc`, `logs/acc_*.log`).

**The reconciled table. Reference: the first line** (exact minimum over the weights, fifteen χ, exact Γ′; N; pointwise
μ, κ_AB = 0.82, the whole stage-2 room; roots to ±0.3 %). Binding χ in brackets.

| row 0.80, u/σ*² | 0.50 | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.05 | 1.075 | 1.10 | 1.15 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **θ_room: all weights, 15 χ, exact Γ′** | **2.71** [20] | **1.337** [30] | **0.848** [36] | **0.540** [42] | **0.483** [42] | **0.438** [42] | **0.4025** [42] | **0.407** [30] | **0.4115** [24] | **0.417** [20] | **0.449** [14] | **1.28** [2] |
| nine weights, fine χ, exact Γ′ | 2.63 [24] | 1.33 [30] | 0.836 [36] | 0.507 [30] | 0.438 [36] | 0.402 [36] | 0.376 [36] | 0.389 [30] | 0.407 [24] | 0.416 [20] | 0.448 [14] | 1.28 [2] |
| nine weights, five χ, exact Γ′ | 2.82 | 1.33 | 0.853 | 0.507 | 0.465 | 0.410 | 0.383 | | 0.455 | | 0.577 | 1.28 |
| nine weights, five χ, the author's Γ′ (its protocol, my roots) | 2.75 | 1.29 | 0.836 | 0.501 | | | 0.367 | | | | 0.577 | |
| published (the note, PROBLEM_V2) | 2.80 | 1.33 | 0.84 | 0.49 | | | 0.36 | | | | | |
| θ(u) of (T), θ_t = 0.36 | 1.254 | 0.903 | 0.684 | 0.482 | 0.435 | 0.395 | 0.360 | 0.360 | 0.360 | 0.360 | 0.360 | 0.360 |
| reference/θ(u) | 2.16 | 1.48 | 1.24 | 1.12 | 1.11 | 1.11 | 1.12 | 1.13 | 1.14 | 1.16 | 1.25 | 3.5 |

Also 0.473 [42] at 0.91σ*² and 0.420 [42] at 0.975σ*². No law of the layer is a possible response at 1.20σ*².

| row 0.84, u/σ*² | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.045 | 1.05 | 1.06 | 1.075 | 1.10 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **θ_room: all weights, 15 χ, exact Γ′** | **6.32** [10] | **3.72** [12] | **2.22** [14] | **1.96** [14] | **1.75** [14] | **1.579** [16] | **1.507** [16] | **1.455** [16] | **1.448** [14] | **1.443** [12] | **1.503** [8] | **2.64** [2] |
| nine weights, fine χ, exact Γ′ | 6.30 [10] | 3.70 [12] | 2.08 [10] | 1.83 [12] | 1.61 [12] | 1.47 [14] | 1.37 [14] | about 1.32 [14] | 1.338 [14] | | 1.50 [8] | 2.64 [2] |
| nine weights, five χ, exact Γ′ | 6.42 | 3.78 | 2.21 | 1.96 | 1.74 | 1.548 | | | 1.55 | | | 2.64 |
| nine weights, five χ, the author's Γ′ | 6.01 | 3.60 | 2.13 | | | 1.437 | | | | | | |
| published | | 3.7 | 2.2 | | | 1.44 | | | | | | |
| θ(u) of (T), θ_t = 1.33 | 3.336 | 2.527 | 1.782 | 1.608 | 1.459 | 1.330 | 1.330 | 1.330 | 1.330 | 1.330 | 1.330 | 1.330 |
| reference/θ(u) | 1.89 | 1.47 | 1.25 | 1.22 | 1.20 | 1.19 | 1.13 | 1.09 | 1.09 | 1.085 | 1.13 | 1.98 |

No law of the layer is a possible response at 1.12σ*².

- **Which computation is the reference, and how it was reconciled.** The first line. It is checked three ways.
  (a) My own minimisation over the weights by a 5 × 5 grid and three local refinements (49 conic programs per cell,
  `lawlayer.excess_T_opt`, `task4.py roomw`) at ten cells: 2.73 (a χ list without 20), 1.335, 0.848, 0.538, 0.472 (at
  0.91σ*²), 0.402 on the row 0.80; 3.715, 2.216, 1.579, 1.456 (at 1.045σ*²) on the row 0.84: within 0.4 % of the first
  line wherever the χ lists agree. (b) The degree-5 worker's program, which uses the same Sion form
  (`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-newcap-2026-11-16/thresholds/r4_theta5.py`;
  its numbers relayed by the coordinator, its code not read by me): 0.538, 0.482, 0.4025 at 0.85, 0.90, 1.00σ*² on the
  row 0.80, binding χ = 42; mine 0.540, 0.483, 0.4025, binding χ = 42. The largest difference is 0.4 %, at 0.85σ*²,
  where my root finder stopped within 0.3 % of the room; below the 1 % that would have called for a search of the
  cause. Its nine-weight values 0.506, 0.438, 0.375 agree with mine (0.507, 0.438, 0.376) too. (c) On the nine
  weights my program reproduces the author's logs (§2). My first-order estimate "+17 %" for 0.90σ*² in an interim
  message (from a 5 × 5 grid and the nine-weight slope) was an extrapolation; the root is +10 %.
- **Against the published table.** The three errors partly cancel: the published values are within +3 %/−11 % of
  the reference, and all but one are below it (2.80 against 2.71 at 0.5σ*² on the row 0.80, where the binding
  χ = 20 is not on the author's grid). So the published table can stand as a sufficient allowance, with that one
  entry lowered to 2.7.
- **The sentence asked for, on the five-χ grid:** at fixed (nine) weights it overstates θ_room by 2–7 % up to σ*² on
  the row 0.80 and 2–8 % on the row 0.84, and by 12 % and 16 % at 1.05σ*²; but the nine weights understate it by up
  to 11 %, and Γ′ by up to 8 %, so the published numbers are on the safe side all the same.

### 3.6 "The row constants are the minima of θ_room, attained just above σ*²"

**Right on both rows as statements about the author's protocol; the relaxation's minima are 8–11 % higher.**

- *Row 0.80.* The reference allowance falls from 2.71 at 0.5σ*² to **0.4025 at σ*²** (binding χ = 42) and rises above
  it: 0.407, 0.4115, 0.417, 0.449, 1.28 at 1.025, 1.05, 1.075, 1.10, 1.15σ*². The minimum is at σ*² itself: the most
  concentrated laws (χ = 36–42) are still possible there and are excluded just above (the largest χ with a
  possible law is 42, 36, 24, 20, 14, 2 at 1.00, 1.025, 1.05, 1.075, 1.10, 1.15σ*²). On the nine weights the minimum is
  0.376 (fine χ), 0.383 (five χ), 0.367 (the author's inputs); the round-3 constant is 0.37 and θ_t of PROBLEM_V2 0.36.
- *Row 0.84.* The reference allowance falls to **1.443 at 1.06σ*²** (binding χ = 12; 1.455 and 1.448 at 1.045 and
  1.05σ*²) and is 1.503 at 1.075σ*²: the minimum sits on the edge of the response family (the largest χ with a
  possible law is 30, 24, 16, 16, 12, 8, 2 at 1.00, 1.025, 1.045, 1.05, 1.06, 1.075, 1.10σ*²). On the nine weights the
  minimum is about 1.32 at 1.045σ*² (`logs/targetfu_0.84.log`); the round-3 constant is 1.33. The five-χ grid misses
  that cell (it has 1.55 at σ*² and at 1.05σ*²); round 3 found 1.33 on a finer set of cells.
- So the sentence of §11.4 "the row constants are the row minima of the threshold, attained near σ*²" stands: 0.37
  and 1.33 are the nine-weight minima to 2 %, attained at σ*² and at 1.05–1.06σ*²; the relaxation's minima are 0.4025
  and 1.443. "They grow quickly as u falls" (§12.1) is right below σ*²; above it the allowance grows too, up to the cap.

### 3.7 The target curve of PROBLEM_V2, and a recommendation

PROBLEM_V2 §2 asks for (T): ‖c[h]‖² ≤ θ(u)δΩ̂ with θ(u) = θ_t·max(1, σ*²/u)^{1.8}, θ_t = 0.36 and 1.33, and says that
θ(u) lies below the measured θ_room(u), so that (T) suffices. I put θ(u) into the law-layer test at each energy
(fifteen χ, exact Γ′). Largest excess as a share of the room, with its χ:

| row 0.80, u/σ*² | 0.50 | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.05 | 1.075 | 1.10 | 1.15 | 1.20 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **exact minimum over the weights** | −26 % [24] | +10 % [30] | +36 % [36] | **+54 %** [42] | **+54 %** [42] | +50 % [42] | +44 % [42] | **+55 %** [36] | +44 % [24] | +43 % [20] | +26 % [14] | −12 % [1] | no possible law |
| nine weights | −20 % [16] | +21 % [20] | +51 % [24] | +81 % [36] | +98 % [36] | +89 % [36] | +77 % [42] | +60 % [36] | +45 % [24] | +45 % [20] | +26 % [14] | −12 % [1] | |
| nine weights, the author's Γ′ | | | | +88 % | +105 % | +104 % | +92 % | | | | | | |
| largest χ with a possible law | 42 | 42 | 42 | 42 | 42 | 42 | 42 | 36 | 24 | 20 | 14 | 2 | none |

| row 0.84, u/σ*² | 0.60 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 | 1.025 | 1.045 | 1.05 | 1.06 | 1.075 | 1.10 | 1.12 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **exact minimum over the weights** | −33 % [8] | −5 % [10] | +18 % [12] | +20 % [12] | +20 % [12] | +17 % [12] | +36 % [14] | +51 % [14] | +55 % [14] | **+59 %** [12] | +49 % [8] | −23 % [2] | no possible law |
| nine weights | −18 % [8] | +12 % [10] | +50 % [12] | +52 % [12] | +56 % [14] | +60 % [14] | +83 % [14] | +102 % [14] | +98 % [14] | +85 % [12] | +49 % [8] | −23 % [2] | |
| nine weights, the author's Γ′ | | | | | | +75 % | +99 % | | +124 % | | | | |
| largest χ with a possible law | 42 | 42 | 42 | 42 | 42 | 30 | 24 | 16 | 16 | 12 | 8 | 2 | none |

(Nine weights, finer scans: 90, 95, 99.9, 96, 99.5 % at 0.875, 0.89, 0.91, 0.925, 0.975σ*² on the row 0.80; 87, 97, 102, 95,
85, 75 % at 1.03, 1.04, 1.045, 1.055, 1.06, 1.065σ*² on the row 0.84; `logs/targetfu_*.log`. With the exact minimum:
53 % at 0.91σ*² and 47 % at 0.975σ*² on the row 0.80.)

- **(T) as published is sufficient with slack: it uses at most 55 % of the room on the row 0.80 (0.85–0.90σ*² and
  1.025σ*²) and 59 % on the row 0.84 (1.06σ*²), on every cell tested.** In θ, the curve is 11 % below the reference
  allowance on the row 0.80 from 0.85σ*² to σ*² (the exponent 1.8 follows the allowance there) and 8.5 % below it at
  its worst cell on the row 0.84.
- **On the nine weights it looks as if it were at the limit** (99.9 % and 102 % of the room at the worst cells, and
  104–124 % at three cells with the author's Γ′). Those are upper bounds of the excess from too coarse a set of
  weights, not the state of (T); I reported them as such in two interim messages before I found the cause. They
  matter in one place: **a certificate must not take its weights from {0, ½, 1}²**.
- Above the caps nothing is possible: no law of the layer is a possible response at 1.20σ*² (row 0.80) and 1.12σ*²
  (row 0.84), in agreement with the caps 1.22 and 1.14.

**The same curve scaled down, on the nine weights** (`logs/target95_*.log`, `target90_*.log`): with 0.95·θ_t the
largest excess is 75 % of the room on the row 0.80 (0.95σ*², χ = 39) and 71 % on the row 0.84 (1.05σ*², χ = 14; 1.045σ*²
not run); with 0.90·θ_t, 58 % (0.90σ*², χ = 39) and 37 % (1.04σ*², χ = 16). I did not run the scaled curves with the
exact minimum; they can only be lower than the 55 % and 59 % of the unscaled one.

**Recommendation (N; this game; these two rows).**

- **Keep (T) as published**: θ(u) = θ_t·max(1, σ*²/u)^{1.8}, θ_t = 0.36 and 1.33. With the exact minimum over the weights
  it is inside the room at every tested energy from u₀ to the cap, **with a slack of at least 41 % of the room**
  (45 % on the row 0.80, 41 % on the row 0.84), or 8.5–11 % in θ. Tested cells: steps of 0.025–0.05σ*² (0.01–0.015
  near the worst cell of the row 0.84), fifteen values of χ; the excess is smooth in u and χ, and the other
  discretisations move θ_room by 0–3 % in the safe direction.
- The factor 0.95 now in PROBLEM_V2 ("aim 5 % lower") is not needed for sufficiency; it is harmless, and it is what
  makes the statement hold even for a certificate restricted to the nine weights (a quarter of the room free).
- These are numerical statements at tested cells, not certificates, and they inherit the pointwise μ (with a
  certified secant margin rμ the θ-branch scales by r), κ_AB = 0.82 and the use of the whole room.
- **The rows I did not compute** (my judgment, not a result). The mechanisms are generic: a minimum of the allowance
  on the edge of the response family just above σ*² (row 0.84) or at σ*² (row 0.80), a nine-weight value 8–11 % below
  the relaxation's near that minimum, and a χ grid too coarse to see the binding cell. θ_t of 0.845, 0.85, 0.855 comes
  from the same round-3 scan as 1.33, and that of 0.82 from the same as 0.37, and both of these proved to be
  nine-weight minima to 2 %. I expect the published θ_t of the four other rows to be below the relaxation's
  minimum by a similar 5–10 %, and (T) to be sufficient there as well. I would say so only as an expectation; for a
  statement that must be safe before those rows are recomputed, 0.95·θ_t.

----------------------------------------------------------------------------------------------------

## 4. Item 2 — §12.2, the margins and the worst cubic

**Verdict: the two-variable numbers are correct, with two corrections (§4.3); as margins of the inequality they do
not stand, because the largest ratio grows with the number of variables (§4.5).**

### 4.1 The worst two-variable cubic, recomputed

q = √u·X·(α(|X|² − 2)/√2 + βe^{iψ}(|Y|² − 1)), u = 0.85σ*², sector A unless said; a two-dimensional rule in (|X|², |Y|²)
with 207,936 nodes and, as a cross-check, my three-dimensional rule for general cubics (746,496 nodes), which gives
the same four digits (`review-round4a/scripts/task2.py`, `logs/task2.log`).

| | t = 0.80: mine | author | t = 0.84: mine | author |
|---|---|---|---|---|
| at the author's maximiser (0.618, 0.786, 0.39π), resp. (0.637, 0.771, 0.33π): ratio A | 0.1595 | 0.1595 | 0.3088 | 0.3086 (log), 0.3088 (§12.4) |
| the same, sector B | 0.1311 | 0.1311 | 0.2696 | 0.2694 |
| at (0.63, 0.77, 0.30π), the rounded values of the question | 0.1556 | — | 0.3084 | — |
| my own maximum over (α, β, ψ) (grid, then BFGS) | 0.1595 at (0.617, 0.787, 0.390π), χ = 14.75 | 0.1595 | 0.3088 at (0.637, 0.771, 0.327π), χ = 16.26 | 0.3086 |
| junta; X(\|Y\|² − 1) | 0.0999; 0.1121 | 0.1000; 0.1121 | 0.2289; 0.2236 | 0.2294; 0.2236 |
| best with ψ = 0; with ψ = π/2 | 0.1419; 0.1512 | 0.1419; 0.1511 | 0.2928; 0.2803 | 0.2928; 0.2804 |
| largest t allowed by (R1), against t_lo | 0.7995 against 0.7850: possible | possible | 0.8424 against 0.8348: possible | possible |

Agreement to four digits on the class; 2·10⁻³ on the junta at t = 0.84 (its heavy tail, on the author's coarser
rule).

### 4.2 An independent search over H₂,₁(ℂ²)

t = 0.80, u = 0.85σ*², sector A, all six complex coefficients. BFGS and Powell in alternation (the author: Nelder–Mead),
numerical gradients, objective on a 93,312-node rule, every endpoint re-evaluated on 746,496 nodes; sixteen random
Gaussian starts and four structured ones with noise (junta, H(X) + H(Y), X²Ȳ, all six equal).

**All twenty runs end at 0.1595**, with χ = 14.74–14.75 and the same (R1) value 0.7995; their coefficient moduli
differ (e.g. 0.51, 0.51, 0.38, 0.38, 0.31, 0.31), as unitary rotations of one cubic do (I did not fit the rotation).
Nothing exceeds the author's maximum. So in two variables the shared-driver cubic is, as far as a search can tell,
the global maximiser at this row and energy.

### 4.3 Where the smallest two-variable margin is

The summary of §12.2 takes the margin θ_room(u)/ratio on the energy grid {…, 0.7, 0.85, 1.0}·σ*² and finds its
minimum at 0.85σ*², because at σ*² the maximiser is not a possible response. Between the two grid energies the
maximiser is still possible while θ_room keeps falling. With (R1) imposed during the maximisation over the class
(`task2b.py`; 273 members; the reference allowance of §3.5):

| row 0.80, u/σ*² | 0.50 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 |
|---|---|---|---|---|---|---|
| largest ratio A in the class | 0.261 | 0.191 | 0.1595 | 0.150 | 0.143 | 0.136 |
| largest t allowed by (R1) for that cubic (t_lo = 0.7850) | 0.839 | 0.817 | 0.7995 | 0.7934 | 0.7876 | 0.7813: not possible |
| members of the class that are possible responses | all | all | 235 of 273 | 185 | 58 | none |
| θ_room(u), reference | 2.71 | 0.848 | 0.540 | 0.483 | 0.438 | 0.4025 |
| margin | 10.4 | 4.4 | 3.4 | 3.2 | 3.1 | (3.0 if counted) |
| margin on the published kind of allowance (nine weights, five χ) | 10.8 | 4.5 | 3.2 | 3.1 | 2.9 | (2.8) |

| row 0.84, u/σ*² | 0.50 | 0.70 | 0.85 | 0.90 | 0.95 | 1.00 |
|---|---|---|---|---|---|---|
| largest ratio A in the class | 0.488 | 0.366 | 0.3088 | 0.293 | 0.279 | 0.267 |
| largest t allowed by (R1) (t_lo = 0.8348) | 0.862 | 0.851 | 0.8424 | 0.8395 | 0.8365 | 0.8342: not possible |
| members that are possible responses | all | all | all | 218 of 273 | 163 | none |
| θ_room(u), reference (0.50σ*²: nine weights) | 25.7 | 3.72 | 2.22 | 1.96 | 1.75 | 1.579 |
| margin | 53 | 10.2 | 7.2 | 6.7 | 6.3 | (5.9 if counted) |

- The maximiser stops being a possible response at about 0.97σ*² (row 0.80) and 0.99σ*² (row 0.84). **The smallest
  two-variable margin is therefore about 3.0 on the row 0.80 and 6.0 on the row 0.84, just below σ*², not at
  0.85σ*²** (the note: 3.1 and 7.1 at 0.85σ*²). On the row 0.80 the note's 3.1 survives by cancellation: its allowance
  is 6–10 % too small there and its energy grid misses the binding stretch. With the published allowances
  (0.49 → 0.36) the same reading gives 2.7–2.8.
- At σ*² and above **no member of the class** is a possible response, on either row. So the statement that goes with
  the later tables, "every maximiser listed satisfies the response family", cannot hold for the two-variable entries
  at u = σ*² (0.137 on the row 0.80, 0.267 on the row 0.84): they are the unconstrained class maxima.
- (R1) for a cubic is tested by the author with ten values of λ (step 0.3), by me with fifteen and a parabola at
  the minimum; a coarser grid of λ can only make a law look possible. At 0.85σ*² both give "possible" with room to
  spare, so nothing changes there.
- A measure of how conservative the comparison "ratio against θ_room" is on this class: with the true contents
  the row inequality ‖c_A‖² + ‖c_B‖² ≤ 4μκ(D + V_sl) + 4μ·room uses at most 11 % (row 0.80) and 10 % (row 0.84) of
  its right side on the possible members, at every energy of the tables.

### 4.4 The reading of the earlier margins 1.7 and 2.2

**The author's reading is right.** Those numbers (the review of the codex-a786 package, §4.4; ledger 4.20) divide
the row constants 0.37 and 0.64 by the largest family ratio at 0.5σ*². The row constant is the minimum of the
allowance over the band and belongs to u ≈ σ*²; at 0.5σ*² the allowance is 2.71 on the row 0.80 (§3.5; 2.75–2.82 on
the author's protocol), and the energy-matched margin of the two-variable maximiser there is 10.4. The earlier numbers would be the right ones only if one constant were asked on
the whole band, which the lemma does not need. What must be corrected with them is the sentence of that review
"the binding energy is the lower end": per energy, the binding end is just below σ*² (§4.3).

### 4.5 More than two variables: the growth is confirmed

After §12 was written the author's searches went to n = 3, …, 6 variables and found larger ratios. I checked this
with code of my own (row 0.80; sector A; own profiles).

**(a) The three-variable cubic in closed form** (`review-round4a/scripts/task5.py`, `logs/task5_I.log`). For

    q = √u·[a·H(X) + X·(b₁e^{iφ₁}(|Y₁|² − 1) + b₂e^{iφ₂}(|Y₂|² − 1)) + c·Y₂²·conj(Y₁)/√2]

|q| depends on the three moduli and on the single phase ν = 2 arg Y₂ − arg Y₁ − arg X, and the content has only its
X component (the cubic is covariant under two independent phase rotations). So the ratio is a four-dimensional
integral, which I evaluate by a tensor rule (30 nodes per modulus, 24 in ν: 648,000 nodes; two Gauss–Laguerre rules
as a check). At u = 0.85σ*²:

| cubic (a, b₁, φ₁, b₂, φ₂, c), normalised | ratio A | B | χ | largest t allowed by (R1) (t_lo = 0.7850) |
|---|---|---|---|---|
| as relayed: (0.49, 0.57, 0.26π, 0.40, −0.20π, 0.52) | **0.1905** (0.1904 and 0.1905 on the two other rules; 0.1905 on a five-dimensional rule; Monte Carlo 0.195 ± 0.004) | 0.1615 | 9.65 | 0.8041: possible |
| my maximum over the six parameters (six starts, one value): (0.488, 0.573, ±0.35π, 0.405, ∓0.11π, 0.520) | **0.1925** | 0.1641 | 9.27 | 0.8043: possible |
| two variables, for comparison: (0.618, 0.786, 0.39π, 0, 0, 0) | 0.1595 | 0.1311 | 14.77 | 0.7995: possible |

- The relayed closed form gives 0.1905 (the author: 0.191). The author's optimum 0.1925 is reached, with the same
  moduli, when the cofactor phases are 0.35π and −0.11π relative to the junta coefficient: in the author's aligned
  coordinates the junta coefficient has the phase −0.08π (`out/b2_rows_n3.json`), which the relayed formula drops.
- **So three variables give at least 0.1925 on a possible response, 21 % above the two-variable maximum.** (C-XZ) of
  §12.4 is refuted, and the margins of §12.2 are two-variable numbers.

**(b) The author's stored maximisers for n = 3, …, 6, re-evaluated** (`task6.py`, `logs/task6.log`). Input: the
coefficient vectors of `out/b2_gen*.json`, as data. Mine: the profiles; δ **exactly**, from q as a polynomial in
(y, ȳ); the content, Ω̂ and (R1) on eight independent scrambles of 2¹⁹ Sobol points (mean ± standard error).

| u/σ*² | n | mine: mean ± standard error | smallest and largest of the eight scrambles | the author's second sample | the optimiser's objective on its fitting nodes | χ (exact; equal to the author's) | largest t allowed by (R1) (t_lo = 0.7850) |
|---|---|---|---|---|---|---|---|
| 0.85 | 2 | 0.1595 (own search, §4.2; deterministic rule) | — | 0.160 | | 14.75 | 0.7995 |
| 0.85 | 3 | 0.1926 ± 0.0001 | 0.1922, 0.1929 | 0.1925 | 0.1926 | 9.273 | 0.8044 |
| 0.85 | 4 | 0.2099 ± 0.0002 | 0.2092, 0.2105 | 0.2104 | 0.2132 | 7.040 | 0.8066 |
| 0.85 | 5 | 0.2234 ± 0.0001 | 0.2229, 0.2241 | 0.2245 | 0.2285 | 5.596 | 0.8079 |
| 0.85 | 6 | 0.2355 ± 0.0003 | 0.2343, 0.2367 | 0.2365 | 0.2533 | 4.503 | 0.8089 |
| 1.00 | 3 | 0.1680 ± 0.0001 | 0.1678, 0.1685 | 0.1679 | 0.1682 | 9.044 | 0.7876 |
| 1.00 | 4 | 0.1846 ± 0.0002 | 0.1835, 0.1856 | 0.1847 | 0.1870 | 6.862 | 0.7906 |
| 1.00 | 5 | 0.1989 ± 0.0001 | 0.1983, 0.1994 | 0.1987 | 0.2043 | 5.360 | 0.7926 |

- Each vector is the entry of its file with the largest second-sample value; all seven are possible responses.
  **The sequence 0.160, 0.193, 0.210, 0.223, 0.236 (n = 2, …, 6 at 0.85σ*²) and 0.168, 0.185, 0.199 (n = 3, 4, 5 at
  σ*²) is confirmed** to ±0.001 (my values are 0.0005–0.001 below the author's second sample at n = 4, 5, 6, inside the
  spread of the scrambles). The increments are 0.033, 0.017, 0.014, 0.012: they shrink,
  and nothing here decides whether the sequence stays below the allowance.
- **The fitting-node values are biased upward**, by 1.5 % at n = 4, 2–3 % at n = 5 and 7.5 % at n = 6; the numbers
  0.231, 0.253 (and 0.204 at σ*²) that went into the first version of ledger row 4.28 are of this kind and must be
  replaced. The sample estimate of χ scatters by ±8 % between scrambles at n = 6 (4.22–4.91 around the exact 4.503),
  which is why δ has to be exact.
- Against the reference allowance (§3.5): at 0.85σ*² the margin is 0.540/0.2355 = 2.3 at n = 6; at σ*²,
  0.4025/0.199 = 2.0 at n = 5 (with the published 0.49 and 0.36: 2.1 and 1.8).

**(c) My own search over all of H₂,₁(ℂ³)** (`task5.py`, part III; `logs/task5_II_III.log`). Eighteen complex
coefficients; a five-dimensional rule in the three moduli and two relative phases (172,800 nodes for the search,
2,709,504 for the endpoints); BFGS with numerical gradients; each endpoint also by Monte Carlo (3·10⁶ points in 20
batches).

| start | ratio A at the endpoint | Monte Carlo | χ | (R1) |
|---|---|---|---|---|
| the two-variable maximiser embedded, plus noise 0.15 | 0.1925 | 0.198 ± 0.004 | 9.26 | possible (0.8044) |
| random Gaussian coefficients | 0.1925 | 0.192 ± 0.003 | 9.28 | possible (0.8043) |

Both runs end at 0.1925, the author's value and the maximum of my family (a), in two different unitary frames. I
stopped the search after these two runs (two more random starts were planned) to give the machine to §3.5; so "two
of two", not a survey. The Monte Carlo error bar is 2 %, set by the heavy tail of |q|⁴; the deterministic rules agree
with each other to four digits on the closed-form cubic.

---------------------------------------------------------------------------------------------------------------------

## 5. Item 3 — §12.3, the bound (P)

**Verdict: correct.** The representation, the merged vector T, the budget and both Cauchy–Schwarz steps are right;
the equality claim on the junta is right; the Gaussian-limit sketch is right (κ₂ = c₀ is an exact identity). The
label can become "P (author; re-derived line by line by a review worker and by claude-b9ee; N test)". It is a bound
only once Ω^loc at the content direction has a certified majorant, as the section says — and on the row 0.80 no such
majorant can be below the allowance (§5.5).

### 5.1 The derivation

Conventions: y_j standard complex Gaussian coordinates; ∂_j = ∂/∂y_j, ∂̄_j = ∂/∂ȳ_j; ⟨f, g⟩ = E[f̄g]; E[∂̄_jg] = E[y_jg];
on polynomials ∂̄_j* = ȳ_j − ∂_j; N₂ = Σ_j∂̄_j*∂̄_j equals b on H_{a,b}. q ∈ H₂,₁, V = |q|², u = E V, F_j = ∂̄_jq ∈ H₂,₀
(holomorphic), c₂ = Σ|F_j|², a = Σ_j∂_jq·F_j, W_k = Σ_jF_j∂_jF_k, b = Σ_k conj(F_k)W_k.

1. **6.3.20.** q = N₂q = Σ_j(ȳ_j − ∂_j)F_j, so E[Gq] = Σ_jE[∂_j(GF_j) − G∂_jF_j] = Σ_jE[∂_jG·F_j].
2. **6.3.26.** G = ȳ_e·k(V, c₂), k(v, c) = E_τh(v + cτ). ∂_jV = q̄∂_jq + q·conj(F_j) and ∂_jc₂ = Σ_k conj(F_k)∂_jF_k
   (the F_k are holomorphic), so Σ_j∂_jG·F_j = ȳ_e[∂_vk·(q̄a + qc₂) + ∂_ck·b]. One integration by parts in τ gives
   k − c∂_vk = h. Hence E[ȳ_eqh(V)] = E[ȳ_eq(k − c₂∂_vk)] = E[ȳ_e(∂_vk·q̄·a + ∂_ck·b)]
   = ⟨y_eq∂_vk, a⟩ + Σ_k⟨y_eF_k∂_ck, W_k⟩, the statement the section starts from (∂_vk, ∂_ck real).
3. **a = P₂,₀q² + ½P₃,₁q².** ∂̄_j(q²) = 2qF_j, so N₂(q²) = Σ_j(ȳ_j − ∂_j)(2qF_j) = 2q·N₂q − 2a = 2q² − 2a, and
   N₂ = 2, 1, 0 on the components H₄,₂, H₃,₁, H₂,₀ of q².
4. **W_k = ∂̄_ka = ∂̄_ka₃,₁.** ∂̄_ka = Σ_j(∂_j∂̄_kq)F_j + ∂_jq·∂̄_kF_j = Σ_jF_j∂_jF_k, and a₂,₀ is a holomorphic polynomial.
5. **The merging is exact.** Put g_k = y_eF_k∂_ck(V, c₂). W_k ∈ H₃,₀, so
   ⟨g_k, W_k⟩ = ⟨P₃,₀g_k, ∂̄_ka₃,₁⟩ = ⟨∂̄_k*P₃,₀g_k, a₃,₁⟩. **The adjoint is ∂̄_k* = ȳ_k − ∂_k**, the creation operator of
   ȳ_k; on H₃,₀ it is the Wick multiplication f ↦ ȳ_k⋄f = P₃,₁(ȳ_kf), which is how ⋄ must be read in the section and
   how `r4_local.py` codes it: ȳ_X⋄e_{a,0}(X)e_{b,0}(Y) = e_{a,1}(X)e_{b,0}(Y). It is an isometry H₃,₀ → H₃,₁
   (‖ȳ_k⋄f‖² = ⟨f, ∂̄_k(ȳ_k⋄f)⟩ = ‖f‖², as ∂̄_kf = 0). Therefore, with no remainder,
   c_e = ⟨P₂,₀G₁, a₂,₀⟩ + ⟨T, a₃,₁⟩, G₁ = y_eq∂_vk, T = P₃,₁G₁ + Σ_kȳ_k⋄P₃,₀g_k.
6. **Cauchy–Schwarz.** ‖a₂,₀‖ = b₁ and ‖a₃,₁‖ = b₂/2:
   |c_e| ≤ ‖P₂,₀G₁‖b₁ + ½‖T‖b₂ ≤ (‖P₂,₀G₁‖² + ¼‖T‖²)^{1/2}(b₁² + b₂²)^{1/2}.
7. **The budget is 6.3.21** (the "s = A + B + 2t" of the question: δ = ‖P₂,₀q²‖² + ‖P₃,₁q²‖² + 2‖c₂ − u‖²). In two
   lines: ⟨q², N₂(N₂ − 1)q²⟩ = Σ_{j,k}‖∂̄_j∂̄_kq²‖² = 4E c₂² (as ∂̄_j∂̄_kq² = 2F_jF_k), so
   ‖P₄,₂q²‖² = 2E c₂² = 2u² + 2‖c₂ − u‖² (E c₂ = ⟨q, N₂q⟩ = u), and δ = ‖q²‖² − 2u². Hence b₁² + b₂² = δ − 2‖c₂ − u‖².

Two remarks the section could add.
- **Merged is never worse than unmerged.** (f_k)_k ↦ Σ_kȳ_k⋄f_k from ⊕_kH₃,₀ to H₃,₁ is the adjoint of g ↦ (∂̄_kg)_k,
  an isometry on H₃,₁ (Σ_k‖∂̄_kg‖² = ⟨g, N₂g⟩ = ‖g‖²); so it is a contraction and
  ½‖T‖b₂ ≤ ½‖P₃,₁G₁‖b₂ + (Σ_k‖P₃,₀g_k‖²)^{1/2}(Σ_k‖W_k‖²)^{1/2}, the Cauchy–Schwarz of K-ledger 6.3.26 with three
  separate pairings. Numerically the merged form is below it on every case (§5.2), by up to 4 %.
- The hypotheses are those of 6.3.26 (h ∈ C¹, h and h′ of polynomial growth). The tilted profiles
  h(v) = Γ(√v)/√v qualify: Γ is odd and analytic at 0.

### 5.2 Numerical test (N)

`review-round4a/scripts/task3.py`, log `logs/task3.log`; a three-dimensional rule with 209,088 nodes; ∂_vk and ∂_ck
computed as E h′(V + c₂τ) and E[τh′(V + c₂τ)] with the exact h′, no differencing.

Seven cubics of H₂,₁(ℂ²): the junta H(X), X(|Y|² − 1), H(X) + H(Y), the shared-driver cubic (0.637, 0.771, 0.33π), a
generic one with six complex coefficients, and the "worst" and "Wick + shared" cubics of PROBLEM_V2 §5; rows 0.80
and 0.84; u/σ*² ∈ {0.5, 0.7, 0.85, 1}; both sectors: 112 cases.

| check | largest error over the 112 cases |
|---|---|
| the local representation (6.3.26) against the direct content, relative to ‖c‖ | 1.6·10⁻⁶ |
| the merged pairing ⟨P₂,₀G₁, a₂,₀⟩ + ⟨T, a₃,₁⟩ against the content | 1.6·10⁻⁶ |
| the representation 6.3.23, ⟨G_e, a⟩ + ⟨G′_e, c₂ − u⟩, against the content | 3.3·10⁻⁶ |
| a₂,₀ = P₂,₀q², a₃,₁ = ½P₃,₁q², ‖a₃,₁‖² = Σ‖W_k‖², b₁² + b₂² + 2‖c₂ − u‖² = δ, E c₂ = u | 1.6·10⁻¹⁰ |
| truth ≤ "true norms" ≤ (P), and truth ≤ 6.3.25 | no violation |
| three separate pairings against the merged form with true norms | ratio 1.000–1.073: merged is never worse |

(The note reports 3·10⁻³ and 5·10⁻⁶ for the first and fourth lines; its conclusions do not need more.)

Sector A, in units of δΩ̂_A; "pairings" are ⟨P₂,₀G₁, a₂,₀⟩ and ⟨T, a₃,₁⟩ as fractions of ‖c‖:

| row, u | cubic | χ | truth | (P), true norms | (P) | three pairings | 6.3.25 | (P)/6.3.25 | pairings | budget share |
|---|---|---|---|---|---|---|---|---|---|---|
| 0.80, 0.85σ*² | junta | 42 | 0.0999 | 0.1996 | 0.2110 | 0.1996 | 0.1485 | 1.42 | −0.21, +1.21 | 0.762 |
| | X(\|Y\|² − 1) | 16 | 0.1121 | 0.4847 | 0.4951 | 0.4864 | 0.7134 | 0.69 | −0.54, +1.54 | 0.625 |
| | H(X) + H(Y) | 21 | 0.1307 | 0.4233 | 0.4234 | 0.4349 | 0.4241 | 1.00 | +0.05, +0.95 | 0.762 |
| | worst of PROBLEM_V2 (0.63, π/3) | 16.02 | 0.1577 | 0.2863 | 0.2871 | 0.2882 | 0.4465 | 0.64 | −0.11, +1.11 | 0.646 |
| | Wick + shared (0.3, i) | 35.43 | 0.1042 | 0.2108 | 0.2248 | 0.2131 | 0.2277 | 0.99 | −0.17, +1.17 | 0.746 |
| | generic | 13.03 | 0.0554 | 0.2915 | 0.2964 | 0.3067 | 0.6055 | 0.49 | +0.32, +0.68 | 0.581 |
| 0.84, 0.85σ*² | junta | 42 | 0.2289 | 0.2289 | 0.3009 | 0.2289 | 0.2980 | 1.01 | +0.01, +0.99 | 0.762 |
| | X(\|Y\|² − 1) | 16 | 0.2236 | 0.6234 | 0.6234 | 0.6234 | 0.8897 | 0.70 | −0.33, +1.33 | 0.625 |
| | H(X) + H(Y) | 21 | 0.2618 | 0.5497 | 0.5567 | 0.5602 | 0.6020 | 0.92 | +0.14, +0.86 | 0.762 |
| | worst of PROBLEM_V2 | 16.02 | 0.3087 | 0.4239 | 0.4259 | 0.4271 | 0.6493 | 0.66 | −0.02, +1.02 | 0.646 |
| | Wick + shared | 35.43 | 0.2330 | 0.2675 | 0.3320 | 0.2729 | 0.3935 | 0.84 | +0.02, +0.98 | 0.746 |
| | generic | 13.03 | 0.0918 | 0.4741 | 0.4858 | 0.4879 | 0.9373 | 0.52 | +0.23, +0.77 | 0.581 |

- The note's ranges of (P)/6.3.25 by cubic are confirmed on these two rows: junta 0.88–1.56 (note: 0.82–1.59 over six
  rows), X(|Y|² − 1) 0.69–0.72 (0.69–0.76), H(X) + H(Y) 0.90–1.02 (0.88–1.02), Wick + shared 0.80–1.03 (0.79–1.04).
- **The test table of PROBLEM_V2 §5 is reproduced**: its 30 lines (truth, (I), (II), Ω̂ per unit of δ, the budget
  share) agree with my values to the last or the last-but-one printed digit; the largest deviations are on the
  junta (Ω̂ = 0.06010 against 0.05994 at the row 0.84, 0.7σ*²; (II) = 0.02024 against 0.02030 at 0.85σ*²).
  My numbers are in `logs/task3b.log` under "per delta".

### 5.3 Equality on the junta

In one variable H₂,₀ and H₃,₁ are one-dimensional, P₃,₀ of a function of X is a multiple of e_{3,0}(X) and
X̄⋄e_{3,0} = e_{3,1}: so P₂,₀G₁ ∥ a₂,₀ and T ∥ a₃,₁, and the first inequality of step 6 is an equality exactly when the
two pairings have the same sign. Measured (pairings as fractions of ‖c‖; then "true norms"/truth):

| row | sector | u/σ*² = 0.2 | 0.35 | 0.5 | 0.7 | 0.85 | 1.0 | 1.2 |
|---|---|---|---|---|---|---|---|---|
| 0.80 | A | +0.13, +0.87 → 1.0000 | +0.04, +0.96 → 1.0000 | −0.04, +1.04 → 1.15 | −0.14, +1.14 → 1.62 | −0.21, +1.21 → 2.00 | −0.27, +1.27 → 2.39 | −0.36, +1.36 → 2.94 |
| 0.80 | B | +0.12, +0.88 → 1.0000 | +0.02, +0.98 → 1.0000 | −0.08, +1.08 → 1.35 | −0.20, +1.20 → 1.99 | −0.30, +1.30 → 2.53 | −0.38, +1.38 → 3.13 | −0.50, +1.50 → 4.01 |
| 0.84 | A | +0.20, +0.80 → 1.0000 | +0.15, +0.85 → 1.0000 | +0.10, +0.90 → 1.0000 | +0.05, +0.95 → 1.0000 | +0.01, +0.99 → 1.0000 | −0.03, +1.03 → 1.13 | −0.08, +1.08 → 1.35 |
| 0.84 | B | +0.19, +0.81 → 1.0000 | +0.14, +0.86 → 1.0000 | +0.09, +0.91 → 1.0000 | +0.02, +0.98 → 1.0000 | −0.03, +1.03 → 1.12 | −0.08, +1.08 → 1.33 | −0.14, +1.14 → 1.63 |

The claim is confirmed: equality to four digits wherever the signs agree, and an overshoot where they cancel. The
pairing with a₂,₀ changes sign near 0.4σ*² on the row 0.80 and near 0.85–0.9σ*² on the row 0.84; the section's range
"1.00–2.48, the largest at t = 0.80, σ*²" is the sector sum of my 2.39 (A) and 3.13 (B) there.

### 5.4 The Gaussian-limit sketch

- κ₂ = c₀ is exact: c₀ = E[τ₀h′(u(τ₀ + τ))] and κ₂ = E[τh′(u(τ₀ + τ))] with τ₀, τ independent Exp(1), equal by symmetry
  and both E[(G/2)h′(uG)], G ~ Gamma(2). With my quadrature the three numbers agree to all nine digits printed:
  1.20330833 (row 0.80, A), 0.53595533 (0.80, B), 1.47376013 (0.84, A), 0.64903605 (0.84, B). The section's
  "κ₂/c₀ = 1.000 ± 0.001" is the accuracy of its tables; its c₀ (1.20318, 0.53622, 1.47338, 0.64891) agree with
  mine to 1–5·10⁻⁴.
- y_e⋄q = P₃,₁(y_eq) has ‖y_e⋄q‖² = u + ‖∂_eq‖², and Σ_kȳ_k⋄(y_eF_k) = y_e⋄N₂q = y_e⋄q. In the diffuse limit, where
  (V, c₂) decouple from the low chaoses and the influences of e vanish, P₃,₁G₁ → c₀·y_e⋄q, Σ_kȳ_k⋄P₃,₀g_k → κ₂·y_e⋄q and
  P₂,₀G₁ → c₀F_e → 0. So Ω^loc_e → ¼(c₀ + κ₂)²u = c₀²u, while 6.3.25 tends to (¼ + ½)c₀²u = ¾c₀²u: the ratio 4/3 of the
  section. With the budget shares 32/42 (a spike) and 10/16 (X(|Y|² − 1)) the two bounds are in the ratio 1.016
  and 0.833: the section's 1.02 and 0.83.
- It is a sketch, as labelled: the decoupling of (V, c₂) from the low-degree parts in the limit is not written out,
  and I did not test it numerically with a bulk.

### 5.5 As majorants at the content direction: confirmed that they cannot close the row 0.80

The sufficient forms of PROBLEM_V2 §2 are Ω_{e*} ≤ θ(u)Ω̂ (from 6.3.25, "(I)") and
(1 − 2‖c₂ − u‖²/δ)·Ω^loc_{e*} ≤ θ(u)Ω̂ (from (P), "(II)"). In the units of §5.2 they read "column 6.3.25 ≤ θ(u)" and
"column (P) ≤ θ(u)". With θ(u) = θ_t·max(1, σ*²/u)^{1.8} and my seven cubics, sector A:

| row | u/σ*² | θ(u) | θ_room(u), reference (§3.5) | largest (I) | largest (II) | (I) above θ(u) on | (II) above θ(u) on |
|---|---|---|---|---|---|---|---|
| 0.80 | 0.50 | 1.254 | 2.71 | 0.843 | 0.586 | — | — |
| 0.80 | 0.70 | 0.684 | 0.848 | 0.761 | 0.526 | X(\|Y\|² − 1), generic | — |
| 0.80 | 0.85 | 0.482 | 0.540 | 0.713 | 0.495 | X(\|Y\|² − 1), generic | X(\|Y\|² − 1) (0.495; below θ_room) |
| 0.80 | 1.00 | 0.360 | 0.4025 | 0.674 | 0.471 | five of seven: X(\|Y\|² − 1), H(X) + H(Y), both shared-driver cubics, generic | two of seven: X(\|Y\|² − 1) (0.471), H(X) + H(Y) (0.406) |
| 0.84 | 0.70 | 2.53 | 3.72 | 1.045 | 0.666 | — | — |
| 0.84 | 0.85 | 1.78 | 2.22 | 0.937 | 0.623 | — | — |
| 0.84 | 1.00 | 1.33 | 1.579 | 0.853 | 0.591 | — | — |

- **Confirmed.** On the row 0.80 at σ*², per unit of δ: for the two-variable "worst" cubic (I) = 0.04779 against
  θ(u)Ω̂ = 0.36 × 0.11544 = 0.0416 (0.0465 with the reference allowance 0.4025); (II) = 0.03084 is below. For X(|Y|² − 1): 0.0622 and
  0.0435 against 0.0332. For H(X) + H(Y): 0.0446 and 0.0456 against 0.0404. So (I) fails on five of my seven cubics
  and (II) on two, the counts the author reports for its own seven. The statement "0.0478 against 0.0416" is about
  (I); **(II) does not exceed the allowance on the two-variable maximiser**, and a text that says "both exceed" must
  name the cubics (the cofactor cubic and the two juntas).
- Against the reference allowance itself (0.4025 at σ*², the most any argument through the law layer can use), (I)
  still exceeds on four of the seven (0.674, 0.545, 0.414, 0.409; H(X) + H(Y) at 0.397 no longer) and (II) on two
  (X(|Y|² − 1) at 0.471, clearly; H(X) + H(Y) at 0.406, by 1 %).
- Since truth ≤ (I), (II) are proved and these are actual cubics, no majorant of Ω_{e*} or of Ω^loc_{e*} by a
  functional that is ≤ θ_room(u)Ω̂ can exist on the row 0.80 near σ*²: the route through either representation is
  closed there, whatever the majorant; the cofactor cubic alone decides it. Below 0.7σ*² both are inside on all seven.
- On the row 0.84 both forms hold on all seven cubics, with a factor 1.6–2.4 to spare for (I) and 2.2–3.8 for (II)
  against θ(u) ("about 2" in PROBLEM_V2; the smallest, 1.56, is the generic cubic at σ*², and 1.57 on X(|Y|² − 1));
  against the reference allowance the factors at σ*² are 1.85 and 2.7.
- Not checked: the row 0.82 (the author: (I) above the allowance only at σ*² on the cofactor cubic, (II) nowhere);
  I have no row object for it.

---------------------------------------------------------------------------------------------------------------------

## 6. Item 4 — §12.4, the split candidate

**It is stated as a negative result.** "(C-split) does not survive" (with its largest values per row and its ratio
to the threshold), §0 item 11 ("proved as an inequality but never beats 6.3.25 unsplit"), §12.5 ("one candidate
tested, and it fails"). (C-XZ) is labelled "a conjecture read off the searches, not a consequence of the split".

**The two proved steps are correctly stated.** Not re-derived in detail, as agreed; I checked each against its source.
- *First step.* It is the Cauchy–Schwarz of 6.3.25 applied to the pairings of G_e = y_e·q·k′(V) and
  G′_e = y_e·q̄·k′(V) (built from the whole q, at the energy u) with the fields of S alone: a_S = P₂,₀S² + ½P₃,₁S² and
  x_S = c₂(S) − u_S ∈ H₁,₁ ⊕ H₂,₂. The budget is then δ_S by 6.3.21 for the cubic S, and the Ω_e is that of q, as written.
- *Second step.* With f = √V·k′(V) and w = √(V/u): Ω̂ = (3/2)(‖f‖² − ½⟨f, w⟩²) and E[k′(V)·M_R(V)] = ⟨f, M_R/√V⟩;
  the inverse of I − ½ww* is I + ww*, which gives θ_R = (2/(3δ))·(E[|M_R|²/V] + |E M_R|²/u). For complex M_R apply it
  to Re(e^{iφ}M_R). It is the dual form of K-ledger 6.3.30.
- (C-split) is the triangle inequality between the two; for S = q it is 6.3.25 and for C = q it is θ*(q, e) of
  6.3.30, as the section says.

**Not checked:** the numbers of its two tables (`r4_split.py` was not rerun).

**Two remarks on the support quoted for (C-XZ).**
- "Seven end within 0.5 % of it" means seven of the sixteen runs of `r4_rand.py` (three at t = 0.80, four at
  t = 0.84); the other nine end 0.75–18 % below. In my search (§4.2) all twenty runs end at the class value, so the
  low endpoints there are unconverged Nelder–Mead runs, not other local maxima. Say "seven of sixteen".
- **(C-XZ) is false as stated** once more than two variables are allowed: the author's later searches, and my own
  three-variable computation (§4.5), give cubics above the supremum of the two-variable shared-driver class. It was
  a conjecture "read off searches over two core variables", and §12.5 says so; it should now be withdrawn or
  restated for a class that contains the three-variable maximisers.

---------------------------------------------------------------------------------------------------------------------

## 7. The corrections made in §0, §10, §11.4 and §11.5

Each is in place as a dated remark and consistent with §12; four points remain.

| place | what was corrected | status |
|---|---|---|
| §0 item 9 | "(taken at u ∈ {0.85, 1}σ*²; round 4 finds the share smaller at lower energies)" | right: the shares of the allowance in §12.3 rise with u |
| §0 item 10 | the measured Ω_{e*}/Ω̂ "are not suprema over the band" | right, but the item still argues with "a constant θ" and with the row constants; it should say "θ(u) ≤ θ_room(u)", and that the comparison 0.78 against 0.37 (no room on t = 0.80–0.82) is the one at u ≈ σ*², where it stands (§5.5) |
| §0 item 11, §10 item 10 | the band, the margins 3.1–14.1 | the margins are two-variable numbers on an energy grid: see §4.3 (about 3.0 and 6.0 on the rows 0.80 and 0.84, just below σ*²) and §4.5 (three variables). "Rows 0.80 and 0.82 have room" must go |
| §10 item 1 | still "the band (u ≈ 0.8–1.05σ*², χ ≈ 2–16)" | two meanings of "band" in one table (round 2: the moderate-kurtosis cells; round 4: [u₀, cap]); rename one. Also the binding cells of the allowance are at χ = 30–42 on the row 0.80 (§3.3, §3.5), not χ ≤ 16 |
| §10 item 11 | the P statements of §12 "by me only" | (P) of §12.3: reviewed here and by claude-b9ee; the two steps of (C-split): statements checked; the Gaussian limit: checked on paper |
| §11.4 (b) | "(L_c) is false as u → 0 with one constant; needed only on the band" | right: the ratio of a smooth profile tends to that of h(v) = v, 256/63 on the junta (I recomputed: ‖c‖² = 128u³, δ = 42u², Ω̂ = 3u/4) |
| §11.4, table | "the first two rows are the row minima of the threshold, attained near σ*²" | right in substance, see §3.6; the minima are estimates (0.37 against my 0.37–0.38 at σ*² on the row 0.80; 1.33 against about 1.32 on the row 0.84, both on the nine weights; the relaxation's minima are 0.4025 and 1.443) |
| §11.5 | the energies of its table | right |
| §12.5 | "nothing between σ*² and the cap beyond the row minimum of round 3" | `out/r4_theta_5b.log` and `7b.log` do have θ_room(1.1σ*²) = 0.577 and 1.571; they are not in the tables. My values between σ*² and the cap are in §3.3 |

---------------------------------------------------------------------------------------------------------------------

## 8. Item 5 — ledger rows

Placeholder numbers (4.C…, 6.3.C…); "CONT5" is the note, "R4A" this file.

### 8.1 New rows

| ID | Statement | Scope | Status | Source |
|---|---|---|---|---|
| 4.C1 | **The content inequality of 4.19 (v) is needed on an energy band, with an allowance that depends on the energy.** For a capped row: (i) no response has u above the cap (4.19 (ii)); in the law layer no law is a possible response at 1.20σ\*² (t = 0.80) and 1.12σ\*² (t = 0.84). (ii) Below u₀ = 0.37, 0.43, 0.54, 0.58, 0.63, 0.70σ\*² (t = 0.80, …, 0.855) the law-layer test with the proved bounds (S) and (F) has no excess: the energy slack V_sl(u) pays. (iii) On [u₀, cap] it suffices that ‖c_X[h]‖² ≤ θ(u)·δ·Ω̂_X for X = A, B with θ(u) ≤ θ_room(u), where θ_room(u) is the θ at which the largest excess of the test with (F) and this hypothesis, over the laws of the layer at the energy u, equals the stage-2 room. With the exact minimum over the weights of the two bounds (one conic program per cell, by Sion's theorem), fifteen values of χ and the exact Γ′: at t = 0.80, θ_room = 2.71, 1.337, 0.848, 0.540, 0.483, 0.438, 0.4025 at u/σ\*² = 0.5, 0.6, 0.7, 0.85, 0.9, 0.95, 1 and 0.407, 0.4115, 0.417, 0.449, 1.28 at 1.025, 1.05, 1.075, 1.10, 1.15 (minimum 0.4025 at σ\*², binding χ = 42); at t = 0.84, 6.32, 3.72, 2.22, 1.96, 1.75, 1.579 at 0.6, 0.7, 0.85, 0.9, 0.95, 1 and 1.507, 1.455, 1.448, 1.443, 1.503, 2.64 at 1.025, 1.045, 1.05, 1.06, 1.075, 1.10 (minimum 1.443 at 1.06σ\*², binding χ = 12, on the edge of the response family). The values of CONT5 §12.2 and of `PROBLEM_V2.md` §2 (t = 0.80: 2.80, 1.33, 0.84, 0.49, 0.36; t = 0.84: 3.7, 2.2, 1.44 at 0.7, 0.85, 1) come from nine weight pairs {0, ½, 1}², five values of χ and a spline derivative of the tables: within +3 %/−11 % of the above and, but for 2.80 at 0.5σ\*² (2.71), below it, so they are sufficient values. The row constants 0.37, …, 3.7 of 4.19 (v) are the nine-weight minima (0.376 and about 1.32 on a fine χ grid at t = 0.80, 0.84). The target curve of `PROBLEM_V2.md`, θ_t·max(1, σ\*²/u)^{1.8} with θ_t = 0.36 and 1.33, uses at most 55 % and 59 % of the room. With one constant for all energies the inequality is false as u → 0 (the ratio tends to that of h(v) = v: 256/63 on the junta) | the capped game of 4.12; pointwise A/B margin (with a certified secant margin rμ the θ-branch scales by r), κ_AB = 0.82, the whole stage-2 room; tested cells (steps 0.025–0.05σ\*², 0.01 near the minimum of t = 0.84), no certificate. Within the law-layer relaxation θ_room(u) is the largest admissible constant; for the row it is sufficient, not necessary (the extremal laws are not laws of cubics: on the two-variable shared-driver class the true contents use at most 11 % of the allowance). Errors of the author's protocol at fixed other choices: nine weights −6…10 % near σ\*² (−3 % or less elsewhere), five χ +2…16 %, Γ′ −0.6…8 %; 720-atom laws and 85 values of λ: 0.0 % | **N**. The band and the published values: the content worker of claude-b9ee. t = 0.80 and 0.84 recomputed by a review worker with an independent program (it reproduces the logged excesses to three digits on the author's protocol; the exact-weights values agree to 0.4 % with a second minimisation and with the degree-5 worker's program at three cells). u₀ rechecked for t = 0.80, 0.84 on the nine weights (γ of (S) from the author). The other four rows not reviewed | CONT5 §12.1–12.2; R4A §3 |
| 4.C2 | **Two inputs of the law-layer tables of CONT5 that bias them to the safe side.** (a) The minimum over the weights of the two bounds is taken over {0, ½, 1}²; the exact minimum (at interior weights) lowers the excess by up to half the room at the binding cells and raises θ_room by 6–10 % near σ\*² (4.C1); the same grid is in the tests with (S) of 4.19 (iii) and in u₀. (b) (F) was evaluated with a derivative of the profile tables that is wrong by 1–4·10⁻² at small radii (a cubic spline through tables of accuracy 4·10⁻⁵ and spacing 0.0005–0.0025). The law-layer program maximises over laws and collects the error: the excesses of 4.19 (iii) and (v) and of CONT5 §§8.4, 11.4, 12.1 that involve (F) are too large by 0.4–2.8·10⁻⁴ gain units (5–16 % of the room at t = 0.80, 10–30 % at t = 0.84). With the exact Γ′ the allowances θ_room(u) rise by 0.6–8 %. Conclusions are unchanged; numbers are on the safe side | t = 0.80 and 0.84 recomputed; the other rows carry the same input. Values with the θ-branch alone are unaffected (agreement 0.2 %) | **N** (a review worker of claude-b9ee; Γ′ from the definition by Taylor-mode differentiation, equal to a central difference of direct values to six digits) | R4A §2 |
| 4.C3 (edit of 4.28, see §8.2) | the dimension growth | | | |
| 6.3.C1 | **The local representation 6.3.26 as a projected bound.** With G₁ = y_e·q·∂_vk(V, c₂) and g_k = y_e·F_k·∂_ck(V, c₂): E[ȳ_e·q·h(V)] = ⟨P₂,₀G₁, P₂,₀q²⟩ + ½⟨T, P₃,₁q²⟩, T = P₃,₁G₁ + Σ_k ȳ_k⋄P₃,₀g_k, where ȳ_k⋄ = ∂̄_k\* = ȳ_k − ∂_k is Wick multiplication, an isometry H₃,₀ → H₃,₁ (it enters because W_k = ∂̄_k(½P₃,₁q²)). Hence \|c_e\|² ≤ (‖P₂,₀G₁‖·b₁ + ½‖T‖·b₂)² ≤ (δ − 2‖c₂ − u‖²)·Ω^loc_e, Ω^loc_e = ‖P₂,₀G₁‖² + ¼‖T‖², b₁ = ‖P₂,₀q²‖, b₂ = ‖P₃,₁q²‖. The merged vector is never worse than the three separate pairings of 6.3.26 ((f_k) ↦ Σ ȳ_k⋄f_k is a contraction). For a one-variable cubic the first inequality is an equality when the two pairings have the same sign. In the diffuse limit Ω^loc_e → c₀²u, 4/3 of the limit ¾c₀²u of Ω_e of 6.3.25 (c₀ = E[V∂_vk(V, u)]/u = E[∂_ck(V, u)] exactly) | q ∈ H₂,₁, every dimension; h ∈ C¹ of polynomial growth. A bound only with a certified majorant of Ω^loc at the content direction. On two-variable cubics at the rows of higher-degree 4.19 (**N**): 0.49–1.56 times δΩ_e of 6.3.25 (above it only on the junta), budget share 0.58–0.76. **As majorants neither closes t = 0.80**: at u = σ\*², per unit of δΩ̂, 6.3.25 gives 0.41 on the two-variable maximiser, 0.67 on X(\|Y\|² − 1), 0.40 on H(X) + H(Y), and this bound 0.27, 0.47, 0.41, against θ_t = 0.36 and a reference allowance 0.4025; at t = 0.84 both are below θ(u) by factors 1.6–2.4 and 2.2–3.8 | **P** (the content worker of claude-b9ee; re-derived line by line by a review worker and by claude-b9ee); **N**: representation and merged pairing to 2·10⁻⁶ on 112 cases, the comparisons (the reviewer; they reproduce the 30 test lines of PROBLEM_V2 §5); the diffuse limit is a sketch | CONT5 §12.3; R4A §5 |
| 6.3.C2 | **Splitting a cubic at its content direction (negative).** With q = S + C, S the self-interaction part in the content coordinate, and the Stein fields split accordingly: \|c_e\| ≤ (δ_S·Ω_e)^{1/2} + (θ_R·δ·Ω̂)^{1/2}, θ_R = (2/(3δ))(E[\|M_R\|²/V] + \|E M_R\|²/u), M_R the conditional field of the rest (6.3.25 with the budget of S; the dual form of 6.3.30). It is never below 6.3.25 unsplit: 2.1–2.5 times δΩ̂ on two-variable cubics at the rows of 4.19, against 0.94–1.53 for 6.3.25. The conditioning step is profile-free (1.57 on X(\|Y\|² − 1)), and the content direction does not separate cores from cofactors (H(X) + H(Y): direction (X + Y)/√2, 87 % of the budget counts as cofactor) | q ∈ H₂,₁; the numbers on two-variable cubics, six rows | the inequality **P** (author; statements checked by a review worker, not re-derived); the numbers **N**, author only | CONT5 §12.4; R4A §6 |

### 8.2 Row 4.28 (pull request #485): what this review allows, and what must change

| in the row | verdict | replace by |
|---|---|---|
| n = 2: 0.160 at 0.85σ\*², t = 0.80 | **reproduced** (own search, 20 runs, two optimisers: 0.1595) | — |
| n = 3: 0.193 | **reproduced**: 0.1925 by my own search over all of H₂,₁(ℂ³) and as the maximum of a six-parameter family on a four-dimensional rule; the author's vector re-evaluated at 0.1926 ± 0.0001 | — |
| n = 4: 0.211; n = 5: 0.231; n = 6: 0.253 | n = 5 and 6 are the optimiser's objective on its fitting nodes | 0.210, 0.223, 0.236 (the author's vectors re-evaluated by a review worker: 0.2099 ± 0.0002, 0.2234 ± 0.0001, 0.2355 ± 0.0003) |
| σ\*², t = 0.80: 0.137, 0.168, 0.185, 0.204 | 0.204 is a fitting-node value | 0.137 (not a possible response, see below), 0.168, 0.185, 0.199 (re-evaluated: 0.1680, 0.1846, 0.1989) |
| "each added variable adds about 0.02 and no saturation is seen up to n = 6" | not what the corrected numbers show | "the increments shrink (0.033, 0.017, 0.014, 0.012 at 0.85σ\*²); whether the sequence stays below the allowance is open" |
| "every maximiser listed satisfies the response family (R1)" | **false for the n = 2 entries at u = σ\*²**: on t = 0.80 and 0.84 no member of the two-variable shared-driver class is a possible response at σ\*² (largest t allowed 0.7813 against 0.7850, 0.8342 against 0.8348) | "every maximiser with n ≥ 3 satisfies (R1) (checked by the reviewer for t = 0.80); the n = 2 entries at σ\*² are unconstrained maxima" |
| thresholds 0.37, 0.64, 1.33 | these are the row minima | add the energy-matched allowance: 0.540 at 0.85σ\*² and 0.4025 at σ\*² on t = 0.80 (4.C1; published 0.49 and 0.36), so the margin at n = 6 is 2.3 (2.1) and at σ\*², n = 5, 2.0 (1.8) |
| "the bounds 6.3.25 and 6.3.26 exceed the threshold on test cubics at t = 0.80 (… 0.0478 against 0.37·Ω̂ = 0.0427 … for the two-variable maximiser)" | **confirmed, with one precision**: 0.0478 is 6.3.25; 6.3.26 gives 0.0308 on that cubic, below. 6.3.26 exceeds on X(\|Y\|² − 1) (0.0435 against 0.0332, or 0.0372 with the reference allowance) and, by 1 %, on H(X) + H(Y) (0.0456 against 0.0404, or 0.0452) | name the bound and the cubic; see 6.3.C1 |
| "for a driver times an independent cofactor the inequality is convex in the cofactor's law …" (**P**, author only) | **not reviewed here** | — |
| status "N, one worker, not reviewed" | can become | "**N**; the values for n = 2, …, 6 at t = 0.80 re-evaluated by a review worker of claude-b9ee with independent code (own profiles, δ exact, n = 2 and 3 by its own searches); t = 0.82 and 0.84 for n ≥ 3 not re-evaluated; searches are lower bounds" |

### 8.3 Corrections to earlier rows

| row | what | correction |
|---|---|---|
| 4.19 (iii), (v) | "the rows stay inside their rooms for θ ≤ 0.37, …, 3.7; the measured Ω_{e\*}/Ω̂ is at most 0.78, …, 1.04" | the constants are the nine-weight minima over the band of θ_room(u), 7–10 % below the relaxation's minima at t = 0.80, 0.84 (4.C1); the measured ratios are at u ∈ {0.85, 1}σ\*²; add that the excesses of (iii) are upper bounds that carry 4.C2 |
| 4.20 | "below the thresholds by a factor 1.7 at t = 0.80, 2.2 at 0.82 and at least 3.2 on the other rows" | these divide the row minimum by a ratio at 0.5σ\*². Energy-matched, in two variables, the smallest margin is about 3.0 at t = 0.80 and 6.0 at t = 0.84, just below σ\*² (R4A §4.3; the note has 3.1–14.1 at 0.85σ\*²); in more variables it is smaller (4.28). Also "on the band": the band is [u₀, cap] of 4.C1, not [0.5, 1.3]σ\*²; the 34 row/rank pairs hold on [u₀, 0.5σ\*²] too, since there 77/(9(m + 3)) ≤ 2.14 is below θ_room ≥ 2.7 (t = 0.80) |
| 4.20–4.23, 4.27 | constants valid for all profiles and energies, compared with the row constants | no change of substance: an energy-free constant has to be below the minimum of θ_room, which is the row constant. Add once: "an energy-dependent bound would be compared with θ_room(u) of 4.C1" |
| 4.25, 4.26 | — | none |
| K 6.3.25, 6.3.26 | scope | add the last sentence of 6.3.C1's scope (as majorants neither closes t = 0.80) |

---------------------------------------------------------------------------------------------------------------------

## 9. Required corrections to the note

1. **Γ′ in (F)** (§2): compute it from the definition; rerun the law-layer tables of §§8.4, 11.4, 12.1, 12.2; state
   the accuracy (F) needs.
2. **The weights** (§3.5): take the exact minimum over the weights (one conic program per cell) or at least a finer
   grid; with {0, ½, 1}² every excess of rounds 2–4 that combines two bounds is an upper bound, by up to half the
   room at the binding cells, and the allowance is 6–10 % too small near σ*². A certificate must not use that grid.
   **The χ grid** (§3.5): five values are too few near the binding cells. Use at least the fifteen of this review,
   and test each cell for a possible law by a problem that is always feasible (a solver failure must not count as
   "no law").
3. **§12.1, §0 item 11:** "below u₀ the proved bounds leave no excess" is N on sampled cells, with γ of (S)
   numerical (§3.1).
4. **§12.2, summary and §0 item 11:** the smallest two-variable margins are about 3.0 (t = 0.80) and 6.0
   (t = 0.84), just below σ*², with (R1) imposed and the reference allowance (§4.3); and they are two-variable
   numbers: with three variables the ratio is 0.1925 against 0.1595 at t = 0.80, 0.85σ*² (§4.5). "Rows 0.80 and 0.82 have room" must go.
5. **§12.2 tables:** the entry "> 50 ((F) suffices)" at t = 0.845, u = 0.5σ*² is wrong ((F) alone gives 103 % of the
   room; it is (S) that pays there); θ₀(u) is off by 10–25 % where the note has it (§3.3).
6. **§12.4:** "seven end within 0.5 %" → "seven of sixteen"; (C-XZ) is refuted by three variables: withdraw it or
   restate it (§6).
7. **§12.5:** the logs do have θ_room at 1.1σ*² for t = 0.80 and 0.82; add the values between σ*² and the cap
   (§3.3, §3.5).
8. **(R1) on a cubic** is tested with ten values of λ; use a finer grid or a minimisation (§4.3). At σ*² no member
   of the two-variable class is a possible response on the rows 0.80 and 0.84: say so wherever a two-variable
   maximum at σ*² is quoted.
9. **§10:** two meanings of "band"; item 11 can record this review (§7).
10. **Later files** (outside §12, noted because the same numbers travel): quote n-variable maxima from the
    independent sample, not from the optimiser's fitting nodes (§4.5); the relayed closed form of the n = 3
    maximiser drops the phase −0.08π of its junta coefficient (0.1905 instead of 0.1925).

None of these changes a statement labelled P. Suggestions that do not block: add to §12.3 that the merged vector
is never worse than three pairings and that κ₂ = c₀ is exact (§5.1, §5.4); give the allowance with its binding χ.

---------------------------------------------------------------------------------------------------------------------

## 10. Not checked

- With the exact minimum over the weights I recomputed the allowance and the target curve (§3.5, §3.7), not the
  low-energy test (u₀), the tests with (S), or the scaled curves 0.95·θ_t and 0.90·θ_t.
- The degree-5 worker's script was not read; I compared with the three numbers relayed.
- The rows 0.82, 0.845, 0.85, 0.855: nothing of this review was computed for them (no row objects). Their u₀,
  θ_room(u), margins and searches are the author's.
- γ of the structural bound (S) (the two-dimensional resolvent): taken from the author's logs in §3.1; (S), (F), the
  caps, (R1) and the law layer as statements (rounds 1–2) were not reviewed here.
- The secant margin μ: every number uses the pointwise value of the note (0.36745 and 0.43086).
- Solver accuracy: CLARABEL returns "optimal_inaccurate" on a quarter of the solves; I accepted them, as the author
  does (the reproduction of the logs to three digits says they are good to that). No dual certificate was extracted.
  Discretisation: tested at four cells only (720 atoms, 85 values of λ, 35 test identities; §3.5).
- `r4_split.py`, `r4_ratio.py`, `r4_rand.py`, `r4_kappa.py`, `r4_t4band.py` were read but not rerun; the tables of
  §12.3 were checked on the rows 0.80 and 0.84 only, at four energies, without bulk; the tables of §12.4 not at all.
- The diffuse limit of Ω^loc: on paper only.
- Cubics with a bulk, cofactors of rank above one in two variables, and n ≥ 4 by a search of my own. For n = 4, 5, 6
  I re-evaluated the author's vectors; I did not search.
- The convexity reduction of a driver class (ledger 4.28, last sentence) and the relaxations of PROBLEM_V2 §3.
- Whether my twenty two-variable endpoints are unitary rotations of one cubic (same ratio, χ and (R1) value to the
  digits printed; the rotation was not fitted).

---------------------------------------------------------------------------------------------------------------------

## 11. Files

All under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/`.

- `REVIEW_ROUND4A.md`: this file.
- `review-round4a/scripts/`
  - `prof_jets.py`, `siglib.py`: my modules from the two earlier reviews (profiles by Taylor-mode differentiation;
    quadrature helpers). `rowx.py`, `build_rows.py`: the row objects of §1.
  - `lawlayer.py`: the law-layer program: the nine-weight test (`excess_T`, `excess_S`), the minimum over all weights
    by refinement (`excess_T_opt`) and as one conic program (`excess_T_sion`, the reference), the test for a possible
    law (`rice_slack`).
  - `task1.py`: validation against the logs (`val`), θ_room and θ₀ on the nine weights (`room`), low energies (`low`).
    `fcheck.py`: §2.
  - `task4.py`: the target curve on the nine weights (`target`), with all weights by refinement (`targetw`) and
    exactly (`targets`); θ_room with all weights by refinement (`roomw`) and exactly (`rooms`); discretisation
    errors (`acc`). `boundary.py`: an earlier form of the feasibility test, never run.
  - `task2.py`: the shared-driver class and the search over H₂,₁(ℂ²). `task2b.py`: the class with (R1) imposed.
  - `task3.py`: the bound (P), 6.3.25 and 6.3.23 on seven cubics; the junta; the Gaussian-limit constants.
  - `task5.py`: three variables (closed form, family maximum, search over H₂,₁(ℂ³)). `task6.py`: the author's
    vectors for n = 3, …, 6 re-evaluated.
  - `step.sh`: runs one step, single-threaded, only when the 1-minute load is below 8; `step2.sh`: the same without
    the wait, used from 23:31 on, after the coordinator lifted the limit (the load was its own niced build).
- `review-round4a/logs/`: one log per step, each with a `.meta` line of start time, load and exit code.
  - §2: `fcheck`. §3.1: `task1_low_*`. §3.3: `task1_val_*`, `task1_room_*`, `room06_*`.
  - §3.5: `rooms_*` (the reference table), `roomw_*` (refinement), `roomfine_*` (nine weights, fine χ), `acc_*`.
  - §3.7: `targets_*` (exact weights), `targetw_*`, `target_*`, `targetfu_*`, `target95_*`, `target90_*` (nine weights).
  - §4: `task2`, `task2b`, `task5_I`, `task5_II_III`, `task6`. §5: `task3` (first run, five cubics), `task3b`.
  - `task5_II_III` ends with exit 143: I stopped it myself after two runs of part III. The queue shells of three
    earlier chains were also stopped by me (to reorder the steps); no step was lost.
- `review-round4a/data/`: `rowx_0.80.npz`, `rowx_0.84.npz` (row objects) and one JSON per step.
- `review-round4a/notes_P_derivation.md`: my working notes for §5.1 (same content, shorter).
  `review-round4a/sec3_new.md`: the text of §3.5–3.7 as merged into this file (a staging copy; this file is the
  record).

Inputs read, not modified: the note and `content5/code`, `content5/out`; the profile tables
`/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/profiles/band_row_<t>.json` (row
records; table values only for the comparisons of §1 and §2);
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/content-problem-v2-2026-11-16/content-problem-v2/PROBLEM_V2.md`;
pull request #485 (read with `gh`, nothing posted); rows 4.19, 4.20, 4.28 of
`/Users/alingalatan/workspaces/grothe-claude-b9ee-ledger-pass2/research/higher-degree/STATUS.md` (commit 5448b8a26).
