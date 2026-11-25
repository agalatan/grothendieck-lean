# The degree-5 certificate: recomputed design and the assembly of K₅

Design computation of 25 November 2026 (Bucharest time) by a design worker of claude-b9ee, for issue #453; recorded
for issue #644 by a second worker of claude-b9ee, who wrote this note from the script outputs and replayed the exact
parts (§7). codex-a7c4 reviewed the note in PR #646 and found the obstruction of §5.5; nothing else here has been
checked outside claude-b9ee.

**Nothing in this note is a bound on K_G^ℂ.** It records (A) an exact reproduction of the conditional certificate of
ledger 4.17, (B) its law layer recomputed with the radius 2287/2500, (C) the A/B secant margins at finite amplitude,
(D) a design D\* of the tuned part of the certificate (exact pieces and rooms; an allocation of the room that is
refuted on eleven pieces by actual pairs; a funded allocation that passes the same numerical tests), and (E) one
conditional theorem that assembles the certificate from named hypotheses H0–H9, of which H2, H5, H6 and H8 are open.

**Labels** as in [`../../../README.md`](../../../README.md): **P** proof on paper, **C** exact or interval computation,
**N** floating point, **open**; "author only" when nobody but the author's side has re-derived or replayed it.
"exact" means rational arithmetic on stated inputs. A floating-point search gives an **upper** bound of an infimum
(a margin) and a **lower** bound of a supremum (a content ratio), never the other direction.

**Where the numbers come from.** Every number below is printed by a script in
[`../../code/degree5-design/design-2026-11-25/`](../../code/degree5-design/design-2026-11-25/README.md) (written CODE
below). `CODE/RESULTS.txt` is the concatenation of the script outputs, each block naming its source file; the section
headings below name the block. "Ledger 4.x" is [`../../STATUS.md`](../../STATUS.md); "K 3.7" is row 3.7 of
[`../../../conjecture-K/STATUS.md`](../../../conjecture-K/STATUS.md). DES, CERT2B, CAPG and CONT5 are
`../degree5-design-2026-11-16/DEGREE5_CERT_DESIGN.md` and `CERT_STAGE2B.md`, `CAPPED_GATE.md`,
`CONTENT_LEMMA_D5.md` in `../degree5-capped-2026-11-16/`. P1, P2, P3 are the problem statements in
`../degree5-attack-2026-11-25/problems/`.

The game is T = P₁,₀ − (39/50)P₂,₁ + (779/10000)P₃,₂ and the target value is 500/701 = 1/1.402 throughout, unless a
line says otherwise. Notation as in [`../../README.md`](../../README.md) and §5.1 below.

---

## 1. (A) What was reproduced exactly

Sources: `CODE/A_reproduce/assemble2b_rerun.log`, `CODE/A_reproduce/replay2b_rerun.log` (blocks A of `RESULTS.txt`).

- **The exact assembly** of the stored certificate of ledger 4.17 (29 rational rows, radius input 95133/100000,
  Stein covers on the five law rows 0.125–0.3): B₅ = 0.7128940126 at t = 0.84760, room 500/701 − B₅ = 3.7275·10⁻⁴,
  attained on the rows 0.845 and 0.85; every piece and room of the table of ledger 4.17 is reprinted (rooms from
  5.83·10⁻³ on [0, 0.1148] down to 3.73·10⁻⁴; 7.38·10⁻⁴ on the row 0.82, 1.39·10⁻³ on 0.886).
- **The full replay**: for each of the 29 rows, 10 194 node caps recomputed (295 626 in all), the plain cover
  re-verified box by box (29 covers, 1088 to 1286 boxes each), and on the rows 0.125–0.3 the Stein cover as well (5
  covers, 857 to 1026 boxes, of which 147 to 289 Stein boxes); every row constant matches the stored one; the
  small-t bound (2/5)t² + 7058083/10⁷ of ledger 4.18 (b) is active on [0, 0.063736] with room 5.8336·10⁻³. The run
  ends with `ALL PASS (1118s)`.

Label: **C, author only**. The replay program is the certificate author's own (`replay2b_all.py`); this run confirms
that the stored files reproduce, not that the program is right. The certificate stays conditional on K₅ on every
row of (0.0637, 0.886], and its Stein covers assume libm's arcsin to 4 ulp, as in ledger 4.17.

---

## 2. (B) The law layer with the radius 2287/2500

### 2.1 The direct bound (exact)

Source: `CODE/direct_bound_exact.log`, printed by `CODE/scripts/direct_bound_exact.py` (block B of `RESULTS.txt`).

With ρ₀ = 2287/2500 (K 3.7, **P + C**) the bound of ledger 4.18 (a) is

    V ≤ (9221/10000)·t² + 51107667483736967/78000000000000000        (constant term 0.655226506; 1/π < 318309887/10⁹),

and it is below the target for t ≤ t₁ on a 10⁻⁶ grid:

| target | 1/1.402 | 1/1.40195 | 1/1.4021 | 1/1.40191 |
|---|---|---|---|---|
| t₁ at ρ₀ = 2287/2500 | 0.250885 | 0.250940 | 0.250775 | 0.250984 |
| t₁ at ρ₀ = 4571/5000 (K 3.7: **P, author only + C**) | 0.252728 | 0.252783 | 0.252619 | 0.252827 |

The same script gives 0.072657 at ρ₀ = 95133/100000 and 0.198050 at 93/100 (target 1/1.402), the t = 0 caps
λ₁ ≤ 3125000000/3666488669 = 0.8523141 (ρ₀ = 2287/2500) and 0.8534332 (4571/5000), and for two other games at
ρ₀ = 2287/2500: t₁ = 0.267250 for (1, −77/100, 1/20) and 0.259475 for (1, −31/40, 16/250).

### 2.2 The rows (C, author only)

Sources: `CODE/certB_const/out/assemble2c.log`, `envelope_design.log`, `replay2c.log`, the row constants
`rec_<row>.json` and `rows2c_final.json` there; set up by `CODE/scripts/setup_certB.py`.

The 26 rational rows of ledger 4.17 from t = 0.25 up (six law rows 0.250L–0.600L, twenty tuned rows 0.700–0.886)
were given new law-layer covers with the radius input E|q| ≤ (2287/2500)‖q‖₂ in place of 95133/100000: **plain
covers only** (the Lean moment inputs and the radius), no Stein family, hence no assumption on libm's arcsin. The
node caps are those of §1 (they do not depend on the radius). The direct bound of §2.1 replaces the rows 0.125–0.2.

- **Envelope.** B = 0.7128931980 at t = 0.84752; room 3.7356·10⁻⁴ (rows 0.845 and 0.85), against 3.7275·10⁻⁴ in §1.
  At the targets 1/1.40195 and 1/1.4021 the smallest room is 3.9900·10⁻⁴ and 3.2269·10⁻⁴; 1/B = 1.402735.
- **Law rows.** In the min-envelope the direct bound is the smallest bound on [0, 0.198816]; the law rows 0.250L,
  0.300L, 0.400L, 0.500L, 0.550L, 0.600L are active up to 0.64897 with rooms 2.1592·10⁻², 2.7317·10⁻², 2.5244·10⁻²,
  2.4024·10⁻², 2.0651·10⁻², 1.3198·10⁻². These rooms are rooms of rows that assume K₅; the piece that needs **no**
  hypothesis still ends at t₁ = 0.250885.
- **Tuned rows.** Rooms from 1.0580·10⁻² (row 0.700 on [0.64897, 0.68123]) down to 3.7356·10⁻⁴; on the rows 0.84 to
  0.886 they agree with §1 to 2·10⁻⁶ (the radius does not bind there).
- **Replay.** `replay2c_all.py` re-verified every box of the 26 covers and reproduced every row constant:
  `ALL PASS (1296s)`. The node caps were not recomputed in this run (option `--caps 0`); they were in §1.

**Variant (C, author only).** With, in addition, the energy-dependent bound E|q| ≤ (√π/2)(1 + (26449/5000000)s)‖q‖₂
of K 3.7 as one chord on s ∈ [0, 609/100] (`CODE/certB_lin/`): B = 0.7128932177 at t = 0.84752, room 3.7354·10⁻⁴;
the law rows have rooms between 1.4325·10⁻² and 3.2005·10⁻²; `ALL PASS (760s)`. It changes the binding rows by 2·10⁻⁸.

### 2.3 A float law-class bound at small t does not reach further (N)

Source: `CODE/smallt/nscan_*.log`. The float law-class bound V ≤ (1 − η′)t² + N(η′) of ledger 4.35, with
ρ₀ = 2287/2500, reaches t = 0.2352 without and 0.2441 with the scalar Stein family (η′ = 0.0779; 0.2404 and 0.2362 at
η′ = 0.2, 0.3); with the linear-in-s bound 0.2376 without and 0.2464, 0.2470, 0.2476 with the Stein family
(η′ = 0.0779, 0.2, 0.3). All are below the exact 0.250885 of §2.1.

---

## 3. (C) The A/B secant margin at finite amplitude

Definitions as in P2: for a row and a tilt (σ_A, σ_B), m(w, ρ) = 𝒞(ρ) − Rem(w, ρ) (§5.1), μ₀ = min_s λ_min(C − M(s))
is the second-order (zero-amplitude) margin and μ_glob the smallest m/|ρ|² found over all (s, ρ). Everything in this
section is **N**: `CODE/scripts/margin_scan.py` (polar quadrature `72x8x256`; Nelder–Mead over the direction of ρ on a
grid of (s, |ρ|), then a free polish), one output `CODE/margins/m078*_t<row>.json` per row, tabulated by
`margins_table.py` in `CODE/margins/MARGINS_TABLE.md`. μ_glob is an upper bound of the true infimum.

### 3.1 The record's tilt (2/5, 3/10)

| row tuned at | μ₀ | μ_glob | μ_glob/μ₀ | at (s, \|ρ\|) | b fitted |
|---|---|---|---|---|---|
| 0.66 | 0.0781 | −0.1095 | −1.40 | (0.58, 0.26) | 0.890 |
| 0.68 | 0.1396 | −0.0526 | −0.38 | (0.60, 0.28) | 0.876 |
| 0.70 | 0.1836 | 0.0012 | 0.01 | (0.62, 0.30) | 0.770 |
| 0.72 | 0.2238 | 0.0518 | 0.23 | (0.64, 0.32) | 0.687 |
| 0.74 | 0.2621 | 0.0996 | 0.38 | (0.66, 0.34) | 0.611 |
| 0.76 | 0.2987 | 0.1447 | 0.48 | (0.67, 0.36) | 0.538 |
| 0.78 | 0.3338 | 0.1872 | 0.56 | (0.69, 0.38) | 0.490 |
| 0.79 | 0.3508 | 0.2076 | 0.59 | (0.70, 0.39) | 0.465 |
| 0.80 | 0.3674 | 0.2273 | 0.62 | (0.71, 0.40) | 0.434 |
| 0.81 | 0.3837 | 0.2466 | 0.64 | (0.73, 0.41) | 0.418 |
| 0.82 | 0.3997 | 0.2653 | 0.66 | (0.74, 0.42) | 0.403 |
| 0.83 | 0.4154 | 0.2834 | 0.68 | (0.75, 0.44) | 0.383 |
| 0.84 | 0.4307 | 0.3011 | 0.70 | (0.76, 0.45) | 0.369 |
| 0.845 | 0.4383 | 0.3097 | 0.71 | (0.76, 0.45) | 0.363 |
| 0.85 | 0.4458 | 0.3183 | 0.71 | (0.77, 0.46) | 0.355 |
| 0.855 | 0.4488 | 0.3267 | 0.73 | (0.78, 0.47) | 0.327 |
| 0.86 | 0.4589 | 0.3350 | 0.73 | (0.78, 0.47) | 0.334 |

b is max_τ (μ₀ − env(τ))/τ over the scanned amplitudes: the smallest b for which m ≥ (μ₀ − b|ρ|)|ρ|² is consistent with
the scan.

- This confirms ledger 4.39 (0.210, 0.229, 0.247, 0.265, 0.301, 0.318 on the rows 0.79, 0.80, 0.81, 0.82, 0.84, 0.85)
  and extends it: a constant-margin secant can hold with at most 0.59 to 0.73 of μ₀ on the rows 0.79–0.86, at most
  0.56 of it on rows tuned at t′ ≤ 0.78, and with at most 0.0012 on the row 0.70; on the rows 0.68 and 0.66 the scan
  finds m < 0, so no secant inequality with a non-negative margin holds there at this tilt.
- **Caution on the rows 0.865–0.886.** `MARGINS_TABLE.md` also has lines for these rows at this tilt (ratios 0.71 to
  0.75). They were scanned on rows that are **not** the rows of the certificate: the file `CODE/margins/rows078.lines`
  has, from 0.865 up, rows whose (ℓ, β, b_A, b_B) differ from the certificate's by 5·10⁻³ to 5.5·10⁻² (b_A ≈ −0.107
  against −0.054), which also shows as a jump of μ₀ from 0.4589 to 0.3865 (`CODE/checks/rows_compare.log`). Those five
  lines are not used here. The scans at the tilt (2/5, 3/20) used the right rows (§3.2).
- The game (1, −0.77, 0.05) at this tilt: μ₀ / μ_glob = 0.3605 / 0.2401, 0.3780 / 0.2605, 0.4121 / 0.2995 on its rows
  0.79, 0.80, 0.82.

### 3.2 Where the loss comes from: σ_B

Source: `CODE/margins/tilt078_t0.79.json`, `tilt078_t0.82.json`, `tiltfine078_*.json` (`margin_tilt.py`, a coarser
scan: s ∈ {0, 0.3, …, 1.2}, |ρ| ∈ {0.1, …, 0.65}), printed at the end of `MARGINS_TABLE.md`. μ₀ / μ_glob:

| tilt (σ_A, σ_B) | row 0.79 | row 0.82 |
|---|---|---|
| (0.40, 0.00) | 0.299 / 0.299 | 0.353 / 0.353 |
| (0.40, 0.10) | 0.332 / 0.332 | 0.382 / 0.382 |
| (0.40, 0.15) | 0.341 / 0.341 | 0.390 / 0.390 |
| (0.40, 0.20) | 0.347 / 0.316 | 0.396 / 0.371 |
| (0.40, 0.25) | 0.350 / 0.265 | 0.399 / 0.321 |
| (0.40, 0.30) | 0.351 / 0.208 | 0.400 / 0.265 |
| (0.40, 0.45) | 0.179 / 0.000 | 0.228 / 0.063 |
| (0.30, 0.10) | 0.351 / 0.351 | 0.400 / 0.400 |
| (0.30, 0.15) | 0.349 / 0.349 | 0.398 / 0.398 |
| (0.20, 0.00) | 0.344 / 0.344 | 0.393 / 0.393 |
| (0.50, 0.15) | 0.293 / 0.220 | 0.342 / 0.276 |

At σ_A = 2/5 the scans find no finite-amplitude loss for σ_B ≤ 0.15 and a growing one from σ_B = 0.20. The full scans
at the tilt **(2/5, 3/20)** on the eighteen rows 0.74–0.886 (`m078b_t*.json`; the rows 0.86–0.886 from
`CODE/tables/g078hi/rows_all.lines`, which are the certificate's rows up to 3·10⁻⁵, except 0.886: §6) give

| row | 0.74 | 0.76 | 0.78 | 0.79 | 0.80 | 0.81 | 0.82 | 0.83 | 0.84 |
|---|---|---|---|---|---|---|---|---|---|
| μ₀ = smallest m/\|ρ\|² found | 0.2522 | 0.2889 | 0.3240 | 0.3410 | 0.3577 | 0.3740 | 0.3899 | 0.4055 | 0.4208 |

| row | 0.845 | 0.85 | 0.855 | 0.86 | 0.865 | 0.87 | 0.875 | 0.88 | 0.886 |
|---|---|---|---|---|---|---|---|---|---|
| μ₀ = smallest m/\|ρ\|² found | 0.4283 | 0.4358 | 0.4398 | 0.4493 | 0.4578 | 0.4650 | 0.4721 | 0.4792 | 0.4870 |

The minimum over the scanned amplitudes of env(τ) is within 10⁻³ of μ₀ on every row (0.2529 against 0.2522, …)
except 0.855 and 0.86 (0.4437 and 0.4510 against 0.4398 and 0.4493), where the second-order value is attained at
s = 0.05 on the grid and differs from its value at s = 0 (0.4434, 0.4507) by a quadrature effect. So at this tilt the
largest constant a secant inequality can have is the second-order value, a little below the μ₀ of the record's tilt
(0.3410 against 0.3508 on the row 0.79). **This is a scan, not a bound: that the inequality holds with this constant
is open (P2).**

### 3.3 What fails with one content constant per energy, at the record's tilt

Sources: `CODE/tables/table_g078.md`, `table_g078pub.md`, `table_g078lap.md`, `table_g077.md` (`build_table.py`
from the conic programs of `r4_theta6.py` and the searches of `ratio_cluster.py`, `reeval_tilt.py`). Three margin
models: "μ" = the record's zero-amplitude margin; "glob" = the constant μ_glob of §3.1; "lin" =
max(μ₀ − b|ρ|, μ_glob)|ρ|². Because μ_glob bounds the infimum from above, the glob and lin allowances are upper bounds of
what a proved secant would give.

One constant per energy (the band minimum of the allowance, as in ledger 4.31), against the largest ratio of the
record (ledger 4.32):

| piece ← covering row | room | allowance μ / glob / lin | record ratio | factor μ / glob / lin |
|---|---|---|---|---|
| 0.80 ← 0.82 | 1.36·10⁻³ | 0.699 / 0.396 / 0.414 | 0.236 | 2.96 / 1.68 / 1.75 |
| 0.78 ← 0.82 | 7.70·10⁻⁴ | 0.520 / 0.301 / 0.305 | 0.242 | 2.15 / 1.25 / 1.26 |
| 0.76 ← 0.81 | 1.32·10⁻³ | 0.400 / 0.220 / 0.221 | 0.217 | 1.85 / 1.01 / 1.02 |
| 0.74 ← 0.80 | 1.95·10⁻³ | 0.314 / 0.169 / 0.169 | 0.196 | 1.60 / 0.86 / 0.86 |
| 0.72 ← 0.79 | 2.57·10⁻³ | 0.259 / 0.138 / 0.139 | 0.175 | 1.48 / 0.79 / 0.80 |
| 0.70 ← 0.79 | 7.06·10⁻⁴ | 0.219 / 0.117 / 0.118 | 0.179 | 1.23 / 0.65 / 0.66 |

- With the constant margin the one-constant form of the content law is contradicted by recorded cubics on the
  covered pieces t ≤ 0.74 (factors 0.86, 0.79, 0.65) and has no room at 0.76 (1.01). The linear model recovers almost
  nothing there (0.86, 0.80, 0.66).
- On rows tuned at the piece itself it is worse: 1.03, 0.73, 0.49, 0.33, 0.18 at t = 0.80, 0.78, 0.76, 0.74, 0.72
  (glob), and the row 0.70 has no usable margin at all (μ_glob = 0.001). On the published pieces of ledger 4.17 the
  glob factors are 1.30, 1.10, 0.84, 0.62, 0.45, 0.25 for the rows 0.80, 0.79, 0.78, 0.76, 0.74, 0.72.
- On the own rows 0.82, 0.84, 0.845, 0.85, 0.855 the glob factors are 1.37, 2.17, 2.80, 3.48, 4.52.
- **Per χ** (the allowance of each χ-bin against the largest ratio found in that bin, c = 4 three-cluster cubics), the
  same six covers have 3.02, 2.91, 2.57, 2.47, 2.69, 2.14 under glob, and 2.77, 2.60, 2.45, 2.36, 2.31, 1.90 against
  the stored maximisers in 4 to 6 variables: the allowance is smallest at large χ, and the cubics with the largest
  ratios have small χ (in `fin_table.md`: band minima at χ = 24 to 42 on the pieces below 0.81, largest ratios at
  χ ≈ 2).
- These factors compare a **sufficient** allowance (ledger 4.29) with **lower bounds** of the largest ratio: a factor
  below 1 refutes the sufficient form on that piece within the law-layer relaxation, not the content lemma; a
  factor above 1 proves nothing.

---

## 4. (D) The design D\*

Three things are kept apart in this section.
- **The pieces and their rooms** are exact scalar envelopes of row parabolas (given the row constants of §2.2). They
  do not depend on how a room is shared between the sectors.
- **The allocation η_h = 0** gives the whole room of every piece to the A/B sector. The allowances and factors of the
  first columns of the table below were computed under it. **It is false on pieces 1–11** (§5.5): actual pairs with
  zero content need a part of the room for the visible quintic.
- **The funded allocation** gives to the other sectors, on pieces 1–11, the part η_h,j of the room that those pairs
  account for, and recomputes the allowances with the rest (§5.6; the last columns of the table). It is not refuted
  by anything computed here; whether its η_h,j is enough is part of H8, which is open.

Two changes against the record: the tilt (σ_A, σ_B) = (2/5, 3/20) on every row, and the content law posed per cell (u, χ) instead of one
constant per energy. Sources: `CODE/tables/fin_table.md` and `fin_table.json` (`design_final.py`, `final_table.py`:
candidates, allowances, factors; **N**), `CODE/certB_const/out/envelope_design_fin.log` and
`envelope_design_fin_table.json` (`envelope_design.py`: pieces and rooms, **exact** from the row constants of §2.2),
`CODE/ASSEMBLY_CONSTANTS.md` (`assembly_constants.py`: the table below with ℓ, β, b_A, b_B, ν₅ and the rooms at three
targets).

- **Unconditional piece.** [0, t₁], t₁ = 0.250885 (§2.1).
- **Switch point.** t_s = 649/1000. Nothing in D\* covers (0.250885, 0.649): hypothesis H2 of §5.
- **Pieces.** J = 21 pieces from 0.649 to 886227/10⁶ > √π/2, contiguous (checked by `envelope_design.py`). Pieces 1–8
  have width 0.02 (0.021 for the first) and are covered by rows tuned 0.01 to 0.07 above their upper end; pieces
  9–21 are the pieces of the min-envelope of §2.2 from 0.81 up, each with its own row. Every row is a rational row of
  ledger 4.17 with the constant C_j of §2.2.
- **Rooms** (exact, given the C_j): 500/701 − max_{I_j}[t² − 2ℓ_j t + C_j], from 8.3445·10⁻³ (piece 1) down to
  3.7356·10⁻⁴ (pieces 13, 14); all positive, also at 1/1.40195 (smallest 3.9900·10⁻⁴) and 1/1.4021 (3.2269·10⁻⁴).
- **Margin.** μ_j = the second-order value of the row at the tilt (2/5, 3/20) (§3.2), used as a constant margin
  (b_j = 0 in H5).
- **Split.** κ_AB(χ) = 1 − κ_h(χ) − 1/50 with κ_h the quintic share along the one-spike family (ledger 4.34):
  κ_AB from 0.9220 at χ = 1 to 0.9651 at χ = 42 for the rows tuned at t′ ≤ 0.83 (the curve of the row 0.80; the row
  0.82 has its own, 0.9110 to 0.9609); constants 0.8472, 0.8441, 0.8406, 0.8372 on the rows 0.84, 0.845, 0.85, 0.855
  and 0.82 on the rows 0.86–0.886 (inputs of `gen_final.sh`; not recomputed here).
- **Allowance.** θ_j(u, χ) = the largest θ for which the conic program of `r4_theta6.py` keeps the row inside its room
  in the cell, with the whole room given to the A/B sector (the allocation η_h = 0), on the grid u/u_cap ∈ {0.60, 0.70, 0.78, 0.85, 0.92},
  χ ∈ {1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42} (field `theta` of each chosen case of `fin_table.json`,
  printed per piece in `CODE/tables/THETA_TABLE.md`; the value 50 means that no bound is needed in the cell, and a
  cell without a value has no possible law in the law class).
- **Per-cell factor.** The smallest quotient θ_j(u, χ)/(largest ratio found in the cell), over the c = 4 three-cluster
  family (13 variables) maximised in ten bins of χ and the stored maximisers in 4, 5 and 6 variables of the content
  study re-evaluated at this tilt, possible responses only, sector A.

| j | piece | row | C_j | room | μ_j (N) | η_h = 0: min θ_j on the grid (at u/u_cap, χ) | factor per cell | factor, one constant per energy | funded: η_h,j | min θ_j | factor per cell |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | [0.649, 0.670] | 0.74 | 1.1639184731 | 8.3445·10⁻³ | 0.2522 | 0.108 (0.70, 42) | **2.87** | 0.84 | 1.0374·10⁻³ | 0.104 | 2.76 |
| 2 | [0.670, 0.690] | 0.76 | 1.2056656335 | 5.5987·10⁻³ | 0.2889 | 0.128 (0.78, 42) | 2.99 | 0.94 | 8.4770·10⁻⁴ | 0.124 | 2.78 |
| 3 | [0.690, 0.710] | 0.76 | 1.2056656335 | 6.6643·10⁻³ | 0.2889 | 0.142 (0.78, 42) | 3.14 | 0.98 | 8.7490·10⁻⁴ | 0.137 | 2.97 |
| 4 | [0.710, 0.730] | 0.78 | 1.2506550803 | 4.1301·10⁻³ | 0.3240 | 0.183 (0.78, 42) | 3.18 | 1.11 | 6.7945·10⁻⁴ | 0.177 | 2.98 |
| 5 | [0.730, 0.750] | 0.79 | 1.2744812135 | 3.3748·10⁻³ | 0.3410 | 0.226 (0.78, 42) | 3.26 | 1.23 | 5.9326·10⁻⁴ | 0.219 | 3.05 |
| 6 | [0.750, 0.770] | 0.80 | 1.2992072747 | 2.6430·10⁻³ | 0.3577 | 0.290 (0.78, 42) | 3.32 | 1.40 | 5.0686·10⁻⁴ | 0.280 | 3.13 |
| 7 | [0.770, 0.790] | 0.81 | 1.3248331512 | 1.9357·10⁻³ | 0.3740 | 0.385 (0.85, 24) | 3.38 | 1.66 | 4.2187·10⁻⁴ | 0.368 | 3.20 |
| 8 | [0.790, 0.810] | 0.82 | 1.3515075611 | 1.2639·10⁻³ | 0.3899 | 0.501 (0.85, 30) | 3.44 | 1.97 | 3.3945·10⁻⁴ | 0.481 | 3.23 |
| 9 | [0.810, 0.814337] | 0.81 | 1.3248331512 | 1.1563·10⁻³ | 0.3740 | 0.620 (0.85, 36) | 3.54 | 2.13 | 4.3681·10⁻⁴ | 0.581 | 3.18 |
| 10 | [0.814337, 0.824827] | 0.82 | 1.3515075611 | 7.4029·10⁻⁴ | 0.3899 | 0.705 (0.92, 12) | 3.52 | 2.39 | 3.4690·10⁻⁴ | 0.649 | 3.17 |
| 11 | [0.824827, 0.834856] | 0.83 | 1.3791920640 | 4.7347·10⁻⁴ | 0.4055 | 0.929 (0.92, 14) | 3.87 | 2.88 | 2.6300·10⁻⁴ | 0.858 | 3.46 |
| 12 | [0.834856, 0.842337] | 0.84 | 1.4078042318 | 3.9982·10⁻⁴ | 0.4208 | 1.177 (0.92, 16) | 4.24 | 3.19 | 0 | 1.177 | 4.24 |
| 13 | [0.842337, 0.847521] | 0.845 | 1.4224996439 | 3.7356·10⁻⁴ | 0.4283 | 1.642 (0.92, 14) | 5.10 | 4.39 | 0 | 1.642 | 5.10 |
| 14 | [0.847521, 0.852400] | 0.85 | 1.4374261913 | 3.7356·10⁻⁴ | 0.4358 | 2.226 (0.92, 14) | 5.84 | 5.48 | 0 | 2.226 | 5.84 |
| 15 | [0.852400, 0.857393] | 0.855 | 1.4526670999 | 3.8569·10⁻⁴ | 0.4398 | 3.158 (0.92, 12) | 7.29 | 6.77 | 0 | 3.158 | 7.29 |
| 16 | [0.857393, 0.863036] | 0.86 | 1.4681516177 | 4.3808·10⁻⁴ | 0.4493 | 5.101 (0.92, 10) | 10.28 | 9.97 | 0 | 5.101 | 10.28 |
| 17 | [0.863036, 0.866656] | 0.865 | 1.4839589869 | 5.3919·10⁻⁴ | 0.4578 | 12.834 (0.92, 6) | 22.33 | 22.18 | 0 | 12.834 | 22.33 |
| 18 | [0.866656, 0.872379] | 0.87 | 1.5000094483 | 6.3681·10⁻⁴ | 0.4650 | none needed | 60.64 | 60.64 | 0 | none needed | 60.64 |
| 19 | [0.872379, 0.878570] | 0.875 | 1.5163805139 | 8.4369·10⁻⁴ | 0.4721 | none needed | 51.46 | 51.46 | 0 | none needed | 51.46 |
| 20 | [0.878570, 0.884136] | 0.88 | 1.5330803751 | 1.1099·10⁻³ | 0.4792 | none needed | 36.52 | 36.52 | 0 | none needed | 36.52 |
| 21 | [0.884136, 0.886227] | 0.886 | 1.5519938087 | 1.3896·10⁻³ | 0.4870 | none needed | 32.80 | 32.80 | 0 | none needed | 32.80 |

C_j is the decimal of an exact rational; the piece ends are rationals whose decimals are printed (exact values:
fields `piece`, `C` of `fin_table.json` and `rooms_exact` of `envelope_design_fin_table.json`). On pieces 18–21 the
program needs no content bound on the grid: the proved bound (F) alone keeps the row inside its room in the
relaxation, and the factors there are 50 divided by the largest ratio found.

**What the table shows (N).**
- **Funded allocation** (last three columns; §5.6). Posed per cell, the weakest piece is the first, [0.649, 0.67] ←
  row 0.74, with factor 2.76 (a c = 4 cluster cubic with χ = 18.3 at 0.60u_cap: ratio 0.055 against allowance 0.151);
  pieces 2–11 have 2.78 to 3.46 and pieces 12–21, which need no funding, at least 4.24.
- **Allocation η_h = 0** (false on pieces 1–11). The same quantities are 2.87 on piece 1, 2.99 to 3.44 on pieces 2–8,
  3.54, 3.52, 3.87 on pieces 9–11: funding the other sectors costs 4 to 11 % of the smallest factor of a piece.
- With one constant per energy the design has, at η_h = 0, 0.84, 0.94, 0.98, 1.11, 1.23, 1.40, 1.66, 1.97 on pieces
  1–8 (0.81, 0.91, 0.95, 1.08, 1.19, 1.35, 1.60, 1.89 funded): that form is contradicted by the cubics found on pieces
  1–3 (within the relaxation) and has no useful room below t = 0.75. The change of tilt alone does not repair the
  design; the per-cell posing is needed too.
- **The choice of rows.** For each of the pieces 1–8 two or three covering rows were compared (`fin_table.md`), and
  the chosen row is the one with the largest per-cell factor, at η_h = 0, among those with a room of at least 2·10⁻⁴ (on piece
  1 the row 0.76 has 2.46 against 2.87; on piece 2 the row 0.78 has 1.89 against 2.99; on piece 8 the row 0.81 has
  3.19 against 3.44).
- **Other tilts and games** (all at η_h = 0). At the tilt (3/10, 1/10) the pieces [0.649, 0.67] ← 0.76, [0.69, 0.71] ← 0.78 and
  [0.71, 0.73] ← 0.79 have per-cell factors 1.75, 1.95, 2.04 (`finT_table.md`), against 2.46, 2.73, 2.82 for the same
  rows at the tilt (2/5, 3/20). On three narrow pieces of the record, [0.695, 0.705] ← 0.79, [0.735, 0.745] ← 0.80,
  [0.795, 0.805] ← 0.82, the tilt (2/5, 3/20) gives 2.60, 3.14, 3.56 per cell (1.07, 1.29, 2.04 with one constant per
  energy) for the present game and 3.21, 3.61, 3.88 for the game (1, −0.77, 0.05), whose rooms are float and not
  certified (`g078b_table.txt`, `g077b_table.txt`).
- **Sensitivity to the room.** With half of the room given to the A/B sector, on pieces 1, 4 and 13 the allowances
  θ_j(u, χ) fall by 9 to 44 % over the cells printed in `half_table.txt` (largest at small χ; 12 to 15 % at χ = 42 on
  piece 1, 9 to 11 % on piece 4).

**What the factors do not show.**
- They are tested against cubics in **at most 13 variables**, in sector A only; the largest ratio found grows with the
  number of variables up to n = 25 in the record (ledger 4.28). A search bounds the largest ratio from below.
- θ_j(u, χ) is computed on a grid of 5 × 15 cells, by a floating-point conic program, with float rooms inside the
  program; no dual certificates, no cover of the (u, χ) plane, and nothing below 0.60u_cap or above 0.92u_cap.
- The margins μ_j are the largest constants H5 can have, not constants it is known to have (§3.2).
- The splits κ_AB(χ) come from one family of cubics; using them needs the quintic lemma of ledger 4.34 (part of H8),
  and §5.5 shows that outside that family the share they leave to the other sectors is too small by itself.
- The funded η_h,j is what one family of pairs accounts for. Nothing shows that it is enough for every pair.

---

## 5. (E) The assembly: one conditional theorem

The record has the pieces of the argument in four notes (DES, CERT2B, CAPG, CONT5) and no single statement. This
section states it once, with every hypothesis named, and proves the implication. **The implication (§5.3) is P,
author only** (the design worker's proof; the recording worker re-derived each displayed step of §5.3 from the
definitions of §5.1 and found no gap, which is the same side checking itself). It proves nothing about K_G^ℂ:
H2, H5, H6 and H8 are open.

### 5.1 Objects

**Game and target.** T = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ on L²(ℂⁿ, γ), 0 < η < ε₁ < 1, p₁ = 1/ε₁. Target value τ (τ = 500/701
for 1.402). For unimodular f, g: V = Re⟨f, Tg⟩, h = (f + g)/2, k = (f − g)/2, t = ‖P₁,₀h‖₂, and after a rotation
P₁,₀h = t·z (z the visible coordinate, y the remote ones). G₃ = ε₁P₂,₁k, G₅ = ηP₃,₂h, and q = the part of G₃ that
does not depend on z (q ∈ H₂,₁(y)); u = E|q|², δ = E|q|⁴ − 2u², and, **when u > 0**, χ = δ/u² and U = |q|²/u. The
fourth excess χ, the law of U, the functionals Ω̂_X, the splits κ(χ) and the allowances θ(u, χ) are defined for u > 0
only; hypotheses H6–H9 and step 3 of the proof concern pairs with u > 0, and step 4 removes the restriction.

**A row** r = (ℓ, β, b_A, b_B, ν₅; σ_A, σ_B) (real numbers; (σ_A, σ_B) is the tilt). With T = |z|², e₁₁ = T − 1,
e₂₀ = z²/√2, e₃₂ = z(T² − 6T + 6)/√12:

    L(z) = z(ℓ + β(T − 2)),      L′ = L + ν₅e₃₂,      D = 1 − b_A e₁₁ − b_B e₂₀,      C(q) = b_A q e₁₁ + b_B q̄ e₂₀,
    Ψ₅(s; ν) = E_z|L + νe₃₂ + sD| + E_z|L + νe₃₂ − sD|,      ψ(s) = Ψ₅(s; ν₅),
    k_q = p₁ − (b_A² + b_B²)/η,      Λ₅(q) = E ψ(|q|) − k_q u − ν₅²/η            (the q-only value at ν = ν₅),
    B₅(u) = E ψ(√(u·τ₁)), τ₁ ~ Exp(1),      S₅ = sup_u [B₅(u) − k_q u − ν₅²/η],      X(q) = S₅ − Λ₅(q)   (= D(q) + V_sl(u)).

**The retained functional (CONT5 §3.1).** For G₃ ∈ H₂,₁(ℂⁿ), G₅ ∈ H₃,₂(ℂⁿ) with remote residual q:

    Λ̂₅(G₃, G₅) = min_{ξ ∈ H₁,₀} { ‖ξ‖² + E|L + G₅ + (G₃ − C(q)) − ξ| + E|L + G₅ − (G₃ − C(q)) + ξ| } − ‖G₃‖²/ε₁ − ‖G₅‖²/η,
    Λ̂₅^+(G₃, G₅) = Λ̂₅(G₃, G₅) + (b_A² + b_B²)u/η.

At the q-only point (G₃ = q, G₅ = ν₅e₃₂, ξ = 0): Λ̂₅^+ ≤ Λ₅(q).

**The A/B gain.** For remote holomorphic linear forms r_A, r_B:

    G_AB(q) = sup_{r_A, r_B} [ Λ̂₅^+(q + e₁₁r_A + e₂₀ r̄_B, ν₅e₃₂) − Λ₅(q) ].

**Profiles and contents.** Γ_X(s) (X = A, B, 0) as in `../../code/degree5-content/README.md`;
G_A = Γ_A + σ_AΓ₀, G_B = Γ_B + σ_BΓ₀, h_X(v) = G_X(√v)/√v, c_X = Π₁[q·h_X(|q|²)] (first-chaos content),
k_X(v) = E h_X(v + uτ₁), Ω̂_X = (3/2)E[|q|²k_X′(|q|²)²] − (3/4)(E[|q|²k_X′(|q|²)])²/u, and the proved bound (CONT5 §3.4,
**P**, author only)

    (F)   ‖c_X‖² ≤ F_X := ( √(2u·Var a_X(|q|²)) + √(u·E[|q|⁴h_X′(|q|²)²]) )²,      a_X = h_X + v h_X′.

**The secant remainder (problem P2).** For w ∈ ℂ, ρ = (ρ_A, ρ_B) ∈ ℂ²:

    Y = L′ + w(1 − b_A e₁₁) − b_B w̄ e₂₀,      d = (e₁₁ + σ_A)ρ_A + e₂₀ ρ̄_B + σ_B ρ_B,
    Rem(w, ρ) = 2E_z[|Y + d| − |Y| − Re(d·conj ph Y)],      𝒞(ρ) = p₁|ρ|² − |σ_Aρ_A + σ_Bρ_B|²,      m = 𝒞 − Rem.

**The law class ℒ.** Laws of U = |q|²/u for q ∈ H₂,₁: E U = 1, E U² = 2 + χ ∈ [2, 44],
E U³ ≤ 6 + 9χ + (4045313/100000)χ^{3/2} (Lean), E√U ≤ ρ₀ (K 3.7), and the Stein families used by the program in
question (the scalar family of the radius proof in the certificate of ledger 4.17; the joint Stein variables of
`lawstein.py` in the allowance program; none in the covers of §2.2). The exponential law (Gaussian q) belongs to ℒ.

**Possible responses (CONT5 §8.2–8.3, P, author only).** If (f, g) is a unimodular pair with t ≥ t_lo, then the law of
|q|² satisfies, for every λ ≥ 0, E ρ_R(λ²|q|²) ≥ t_lo + λu/ε₁ (ρ_R(x) = E|Z + √x|, the Rice mean), and
u ≤ u_cap(t_lo) = 4ε₁²·0.432306903·(0.886762780 − t_lo) (the two decimals are the slope and intercept of a tangent
ρ_R(x) ≤ A + Bx, as in P1 §2.0). ℒ(t_lo) denotes the laws of ℒ with these properties.

### 5.2 Hypotheses

A design 𝒟 consists of: the game, τ, a number t₁, a switch point t_s, and for j = 1, …, J a piece I_j = [a_j, a_{j+1}]
of [t_s, 886227/10⁶] with a row r_j, a row constant C_j, numbers η_AB,j, η_h,j ≥ 0, functions κ_AB,j(χ), κ_h,j(χ) ≥ 0 with
κ_AB,j + κ_h,j ≤ 1, margin constants (μ₀,j, b_j, μ_g,j) with **0 < μ_g,j ≤ μ₀,j** and b_j ≥ 0, and an allowance
θ_j(u, χ) ∈ (0, ∞]. (With μ_g > 0 the function G_j of H7 is finite, continuous and strictly increasing from G_j(0) = 0,
so G_j⁻¹ and Φ_j exist on [0, ∞); μ_g ≤ μ₀ gives c²/(4μ₀) ≤ G_j(c) ≤ c²/(4μ_g).)

| | hypothesis | status |
|---|---|---|
| **H0** | Transfer: K_G^ℂ ≥ 1/sup_{n,f,g} V (DES R0: the vector value of T tends to 1) | **P**, author only (one line in DES; Lean has the transfer for the cubic witness, `transfer_lower`, and not the value of the degree-5 game) |
| **H1** | Radius: E\|q\| ≤ ρ₀‖q‖₂ on H₂,₁ in every dimension, ρ₀ = 2287/2500 | **P + C**, reviewed (K 3.7) |
| **H2** | Mid t: V ≤ τ for every unimodular pair with t ∈ (t₁, t_s) | **open** (problem P3). In the record this piece was to be covered by K₅ on law rows, whose sector premises fail there (ledger 4.16) |
| **H3** | Row inequality: for every pair and every row, V ≤ t² − 2ℓt + 2β²/ε₁ + Λ̂₅^+(G₃, G₅) (DES R1–R2 with the tilt step kept, CONT5 §3.1) | **P**, author only |
| **H4_j** | Law layer: the supremum over σ ≥ 0, ν ∈ ℝ and laws in ℒ of [E Ψ₅(σ√U; ν) − k_q σ² − ν²/η] is at most G⁺_j, and C_j = 2β²/ε₁ + G⁺_j | **C**, author only: §2.2 for the rows of D\* at ρ₀ = 2287/2500 (inputs: the Lean moments and H1; no Stein family, no libm assumption); ledger 4.17 and §1 at ρ = 95133/10⁵ |
| **H5_j** | Secant: m(w, ρ) ≥ max(μ₀,j − b_j\|ρ\|, μ_g,j)·\|ρ\|² for all (w, ρ) ∈ ℂ³, for the row r_j | **open** (problem P2). **N** evidence only: the constants of D\* are read off scans, which bound infima from above (§3.2) |
| **H6_j** | Content law: for every n, every q ∈ H₂,₁(ℂⁿ) with u > 0 whose law is in ℒ(a_j), and X = A, B: ‖c_X‖² ≤ θ_j(u, χ)·δ·Ω̂_X | **open** (problem P1) |
| **H7_j** | The law program: for every law in ℒ(a_j), with its energy u and fourth excess χ: min(F_A, θ_jδΩ̂_A) + min(F_B, θ_jδΩ̂_B) ≤ Φ_j(κ_AB,j(χ)·X + η_AB,j), where Φ_j(g) = (G_j⁻¹(g))², G_j(c) = sup_{x ≥ 0}[c·x − max(μ₀,j − c₃b_j x, μ_g,j)x²], c₃ = Γ(5/2) | **N**: the conic programs of `r4_theta6.py` on the grid of §4. A certificate needs dual solutions and a cover of the (u, χ) plane |
| **H8_j** | The other sectors and the additivity: for every pair with t ∈ I_j and u > 0, Λ̂₅^+(G₃, G₅) − Λ₅(q) ≤ G_AB(q) + κ_h,j(χ)·X(q) + η_h,j | **open** in general; **false** for the design D\* with η_h,j = 0 on its pieces 1–11, given H4 and H5 (§5.5). It contains CAPG §6 items 3–8 (quintic shells, odd sector, pure-cost statements), the couplings between driver groups, and the real and imaginary e₃₂ components of G₅; the record measures it in the exact coupled one-spike model only (ledger 4.16, 4.34) |
| **H9** | Possible responses: the Rice family and the cap of §5.1 | **P**, author only (CONT5 §8.2–8.3) |

Remarks.
- H8 is deliberately one statement. The record splits it into group statements, but the step from the group
  statements to H8 (how the gains of different driver groups add when they share the base point q, and how the A/B
  gain defined at G₅ = ν₅e₃₂ controls the A/B part of a general (G₃, G₅)) is not written anywhere. A proof must
  deliver H8 as stated or change this assembly.
- H6 is posed per cell (u, χ). Ledger 4.29–4.32 pose it with one constant per energy, the minimum over χ of
  θ_j(u, χ): a special case and a stronger hypothesis.
- H8 compares every pair with the q-only value at the row's fixed ν₅. Pairs whose visible quintic sits elsewhere pay
  the difference out of κ_h·X + η_h; §5.5 computes it and §5.6 gives two other forms of H8.
- H5 with b_j = 0 is the constant-margin secant (μ₀ = μ_g). The record's allowances assume it at the tilt (2/5, 3/10)
  with the second-order value, which the scans of §3.1 exclude.
- In H7 the argument κ_AB(χ)·X + η_AB of Φ_j must be non-negative for the statement to make sense; H7 asserts this
  for every law of ℒ(a_j).
- The allowance program takes E|r|³ ≤ √2·V^{3/2} where the proof below has Γ(5/2) = 1.3293 < √2; with b_j = 0, as in
  D\*, the constant does not enter.

### 5.3 The theorem and its proof

**Theorem (conditional; P, author only).** Let 𝒟 be a design such that

    (E1)  (1 − η)t₁² + ε₁ρ₀² + η²/(πε₁) ≤ τ,
    (E2)  max_{t ∈ I_j} [t² − 2ℓ_j t + C_j] + η_AB,j + η_h,j ≤ τ      for j = 1, …, J,
    (E3)  the pieces I_j cover [t_s, √π/2].

If H1–H3 and H9 hold, and H4_j–H8_j hold for every j, then V(f, g) ≤ τ for every n and every unimodular pair (f, g) on
ℂⁿ; with H0, K_G^ℂ ≥ 1/τ. (H6–H9 are assumed for pairs with u > 0 only.)

**Proof.** Fix a pair; by DES R1 it may be taken of charge one, and t ∈ [0, √π/2] (t = Re⟨h, z⟩ ≤ E|z|).

*Step 1: t ≤ t₁.* Ledger 4.18 (a) (**P**): V ≤ (1 − η)t² + ε₁ρ₀² + η²/(πε₁) for every pair, given H1. The right side
increases with t, so by (E1) V ≤ τ.

*Step 2: t₁ < t < t_s.* H2.

*Step 3: t ∈ I_j and u > 0.* Write r = r_j and drop the index j.

(3a) *The A/B gain is bounded by the content.* Let r_A, r_B be remote linear forms and put ξ = −σ_A r_A − σ_B r_B in
the definition of Λ̂₅ at G₃ = q + e₁₁r_A + e₂₀r̄_B, G₅ = ν₅e₃₂. Then G₃ − C(q) − ξ = q(1 − b_A e₁₁) − b_B q̄ e₂₀ + d(z; r), so
L + G₅ + (G₃ − C(q)) − ξ = Y(z; q(y)) + d(z; r(y)). L′ is odd in z and the rest is even, so the two norms in Λ̂₅ are
equal (CONT5 §3.1). Since e₁₁ and e₂₀ have norm one and q is remote, ‖G₃‖² = u + E|r|², and
‖ξ‖² − p₁E|r|² = −E 𝒞(r). Hence

    Λ̂₅^+(q + e₁₁r_A + e₂₀ r̄_B, ν₅e₃₂) ≤ 2E_y E_z|Y(z; q(y)) + d(z; r(y))| − k_q u − ν₅²/η − E_y 𝒞(r(y)).

By the definition of Rem, 2E_z|Y + d| = 2E_z|Y| + 2E_z Re(d·conj ph Y) + Rem(q(y), r(y)). For w = se^{iφ} the rotation
z ↦ e^{iφ}z turns Y(·; w) into e^{iφ}(L′ + sD), and z ↦ −z exchanges L′ + sD and −(L′ − sD), so 2E_z|Y(z; w)| = ψ(|w|) and
2E_yE_z|Y| = E ψ(|q|). Finally E_y 2E_z Re(d·conj ph Y) = Re⟨r_A, c_A⟩ + Re⟨r_B, c_B⟩, because r_A, r_B lie in the first
chaos (CONT5 §3.1–3.2). Subtracting Λ₅(q) = E ψ(|q|) − k_q u − ν₅²/η:

    G_AB(q) ≤ sup_{r} [ Re⟨r_A, c_A⟩ + Re⟨r_B, c_B⟩ − E_y m(q(y), r(y)) ].

r(y) = (r_A(y), r_B(y)) is a circular complex Gaussian vector in ℂ² with some covariance Σ; V_r := E|r|² = tr Σ. In
law |r|² = λ₁E₁ + λ₂E₂ with E_i independent Exp(1) and λ_i the eigenvalues of Σ; λ ↦ E(λ₁E₁ + λ₂E₂)^{3/2} is convex
and symmetric, so on {λ₁ + λ₂ = V_r} it is largest at (V_r, 0): **E|r|³ ≤ Γ(5/2)·V_r^{3/2}**. With H5 (and b ≥ 0),

    E_y m ≥ E[max(μ₀ − b|r|, μ_g)|r|²] ≥ max(μ₀V_r − c₃ b V_r^{3/2}, μ_g V_r) = M(√V_r),   M(x) := max(μ₀ − c₃bx, μ_g)x².

By Cauchy–Schwarz, Re⟨r_A, c_A⟩ + Re⟨r_B, c_B⟩ ≤ √V_r·c, c := (‖c_A‖² + ‖c_B‖²)^{1/2}. So **G_AB(q) ≤ G(c)**, with G as
in H7; G is increasing and convex, G(c) ≥ c²/(4μ₀), and G(c) ≤ c²/(4μ_g).

(3b) *The content is bounded.* By H9 the law of |q|²/u lies in ℒ(a) (t ≥ a on the piece). By (F) and H6,
‖c_X‖² ≤ min(F_X, θδΩ̂_X) for X = A, B, so c² ≤ min(F_A, θδΩ̂_A) + min(F_B, θδΩ̂_B) ≤ Φ(κ_AB(χ)X(q) + η_AB) by H7 (all
terms are functionals of the law of |q|²). Since Φ = (G⁻¹)² and G is increasing, this says
G(c) ≤ κ_AB(χ)·X(q) + η_AB. With (3a): **G_AB(q) ≤ κ_AB(χ)X(q) + η_AB**.

(3c) *All sectors.* By H8 and (3b), with κ = κ_AB(χ) + κ_h(χ) ∈ [0, 1] and η₅ = η_AB + η_h:

    Λ̂₅^+(G₃, G₅) ≤ Λ₅(q) + κ·X(q) + η₅ = (1 − κ)Λ₅(q) + κS₅ + η₅ ≤ max(Λ₅(q), S₅) + η₅.

(3d) *The law layer.* Λ₅(q) is the value of the functional of H4 at σ = √u, ν = ν₅ and the law of |q|²/u, which is in
ℒ; S₅ is the supremum over σ of its value at ν = ν₅ and the exponential law, which is in ℒ. So max(Λ₅(q), S₅) ≤ G⁺.

(3e) *The row.* By H3, (3c), (3d): V ≤ t² − 2ℓt + 2β²/ε₁ + G⁺ + η₅ = t² − 2ℓt + C_j + η₅ ≤ τ by (E2).

*Step 4: u = 0 (the density argument of codex-a7c4's review).* Steps 1–3 and (E3) give V ≤ τ for every pair with
u > 0. Let (f, g) have u = 0, in its visible frame. Take fresh independent standard Gaussians y, w, an event Γ = {|w| > R}
of probability λ, and put f_λ = f, g_λ = g off Γ and f_λ = ph(y), g_λ = −ph(y) on Γ. The pair is unimodular and of charge
one. The centred indicator of Γ is a radial function of w, with chaos components of bidegree (m, m), m ≥ 1, only; so
P₁,₀h_λ = (1 − λ)·t·z, and the coefficient of e₂₁(y) = y(|y|² − 2)/√2 in the remote cubic of the new pair is
ε₁λ·E[ph(y)·conj(e₂₁(y))] = −ε₁λμ/(2√2) ≠ 0 (no other term contains e₂₁(y)), so u_λ > 0. Hence V(f_λ, g_λ) ≤ τ. As λ → 0
the pairs converge in L² and T is bounded, so V(f, g) ≤ τ. ∎

**What each step uses from the record.** Step 1: ledger 4.18 (a). (3a): CONT5 §3.1 (tilt identity), §3.2 (the
integration of the pointwise inequality, there with a constant margin), and the third-moment bound above.
(3b): CONT5 §3.4 for (F), §3.5 and ledger 4.29 for the program, CONT5 §8 for H9. (3c): CONT5 §1. (3d)–(3e): DES R2,
R5–R7, CERT2B.

**What is new in the statement.** (i) H5 in the form with a linear loss, and the function Φ in H7 in place of
4μ·(…): with b = 0 and μ_g = μ₀ it is the record's program. (ii) θ may depend on χ. (iii) H8 is named as one
hypothesis. (iv) The room is split, η_AB + η_h ≤ room; the record's allowances give the whole room to η_AB.

### 5.4 The theorem applied to D\*

- (E1): t₁ = 0.250885 (§2.1; exact). (E3): the 21 pieces are contiguous from 649/1000 to 886227/10⁶ > √π/2 (exact).
- (E2): holds with η_AB,j + η_h,j = the room of piece j in the table of §4 (exact, given H4_j), for every way of
  sharing the room. Two ways were computed: η_h,j = 0 on every piece, which is false on pieces 1–11 (§5.5), and the
  funded allocation of §5.6.
- H5_j: b_j = 0, μ₀,j = μ_g,j = μ_j of §4 (so 0 < μ_g,j ≤ μ₀,j). H6_j, H7_j: θ_j(u, χ) of the allocation on the grid of
  §4, with the value at the next grid χ above for χ between grid points. Between the grid energies, below 0.60u_cap and above 0.92u_cap nothing is
  computed.
- H2 on (0.250885, 0.649), H5, H6, H8: open; H8 with η_h,j = 0: false on pieces 1–11, given H4 and H5.

### 5.5 Zero-content pairs: the allocation η_h = 0 of D\* is false on pieces 1–11

Found by codex-a7c4 in the review of PR #646, for piece 7 at t = 0.78, with an exact replay
(`CODE/checks/codex_a7c4_piece7_replay.py`, `.log`); re-derived step by step by the recording worker, who extended the
computation to every piece (`CODE/checks/zero_content_budget.py`, `.log`; exact rational interval arithmetic).

**The pairs.** Fix t ∈ (0, μ), μ = √π/2, and 0 < λ < 1 − t/μ. Let z, y₁, y₂, U, V be independent standard complex
Gaussians and split the uniform angle 6(arg U − arg V) mod 2π into three events of probabilities (1 − λ + t/μ)/2,
(1 − λ − t/μ)/2 and λ. Put f = g = ph(z) on the first, f = g = −ph(z) on the second and f = −g = ph(y₁²ȳ₂) on the third.
- f and g are unimodular and of charge one. A centred indicator of an event has angular frequencies (6k, −6k) in
  (U, V) with k ≠ 0, hence no component of degree below 12: in every projection of degree at most five the indicators
  act through their means.
- h = (f + g)/2 has P₁,₀h = (t/μ)·E|z|·z = t·z, so the visible mass is exactly t; and G₅ = ηP₃,₂h = ν′e₃₂ with
  ν′ = ηtγ, γ = E[|z|(T² − 6T + 6)]/(μ√12) = √3/8.
- k = (f − g)/2 gives G₃ = ελ·P₂,₁ph(y₁²ȳ₂). The function ph(y₁²ȳ₂) has the character (2, −1) in (y₁, y₂), and y₁²ȳ₂ is
  the only element of H₂,₁ with it, so G₃ = q = c·y₁²ȳ₂ with c > 0: a remote cubic with 0 < √u ≤ ελ and
  χ = E|y₁|⁸E|y₂|⁴/(E|y₁|⁴E|y₂|²)² − 2 = 10.
- Both contents vanish: q·h_X(|q|²) has the character (2, −1) and is orthogonal to the first chaos. So by step (3a) and
  H5 with a positive margin, G_AB(q) ≤ 0.

**The chain.** Let F(v) = 2μ(ℓ − β/2 + γv) − v²/η; it is 2E|L + ve₃₂| − v²/η when the radial factor
ℓ + β(T − 2) + v(T² − 6T + 6)/√12 is positive on T ≥ 0 (checked for v = ν′ and v = ν₅ on every piece), and it increases
up to v = ημγ = 0.01495. Since |X + D′| + |X − D′| ≥ 2|X| pointwise,

    Λ̂₅^+(q, ν′e₃₂) ≥ F(ν′) − k_q u,        F(ν₅) − k_q u ≤ Λ₅(q) ≤ F(ν₅) + 2‖D‖₂√u − k_q u,        S₅ ≤ G⁺ = C_j − 2β²/ε₁   (H4).

With G_AB(q) ≤ 0, H8_j for this pair would need

    F(ν′) − F(ν₅) ≤ κ_h(10)·(G⁺ − F(ν₅)) + η_h + 2‖D‖₂√u + κ_h(10)·k_q u.

The left side is the gain of moving the visible quintic from the row's ν₅ to the pair's ν′; it does not vanish as
λ → 0, and the last two terms do. On the rows of the pieces below 0.835, ν₅ (tuned for the Gaussian response at the
reference energy) is 0.0052 to 0.0103 and ν′ is 0.0113 to 0.0141.

**The numbers** (exact bounds; at the upper end of each piece, λ = 10⁻⁹; "share needed" is gain/(G⁺ − F(ν₅)), the
smallest κ_h that works with η_h = 0; κ_h(10) of D\* is 1 − κ_AB(10) − 1/50; the last column is the lower bound of
the η_h that these pairs force with the split of D\*):

| j | piece | row | ν₅ | ν′ | gain > | G⁺ − F(ν₅) < | share needed > | κ_h(10) of D\* | η_h needed > | room |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | [0.649, 0.670] | 0.74 | 0.00525 | 0.01130 | 1.0374·10⁻³ | 2.1534·10⁻² | 0.0482 | 0.0293 | 4.0643·10⁻⁴ | 8.3445·10⁻³ |
| 2 | [0.670, 0.690] | 0.76 | 0.00617 | 0.01164 | 8.4770·10⁻⁴ | 1.5844·10⁻² | 0.0535 | 0.0293 | 3.8348·10⁻⁴ | 5.5987·10⁻³ |
| 3 | [0.690, 0.710] | 0.76 | 0.00617 | 0.01197 | 8.7490·10⁻⁴ | 1.5844·10⁻² | 0.0552 | 0.0293 | 4.1068·10⁻⁴ | 6.6643·10⁻³ |
| 4 | [0.710, 0.730] | 0.78 | 0.00721 | 0.01231 | 6.7945·10⁻⁴ | 1.1036·10⁻² | 0.0616 | 0.0293 | 3.5610·10⁻⁴ | 4.1301·10⁻³ |
| 5 | [0.730, 0.750] | 0.79 | 0.00777 | 0.01265 | 5.9326·10⁻⁴ | 8.9632·10⁻³ | 0.0662 | 0.0293 | 3.3063·10⁻⁴ | 3.3748·10⁻³ |
| 6 | [0.750, 0.770] | 0.80 | 0.00836 | 0.01299 | 5.0686·10⁻⁴ | 7.1201·10⁻³ | 0.0712 | 0.0293 | 2.9824·10⁻⁴ | 2.6430·10⁻³ |
| 7 | [0.770, 0.790] | 0.81 | 0.00899 | 0.01332 | 4.2187·10⁻⁴ | 5.5383·10⁻³ | 0.0762 | 0.0293 | 2.5960·10⁻⁴ | 1.9357·10⁻³ |
| 8 | [0.790, 0.810] | 0.82 | 0.00965 | 0.01366 | 3.3945·10⁻⁴ | 4.2099·10⁻³ | 0.0806 | 0.0367 | 1.8494·10⁻⁴ | 1.2639·10⁻³ |
| 9 | [0.810, 0.814337] | 0.81 | 0.00899 | 0.01373 | 4.3681·10⁻⁴ | 5.5383·10⁻³ | 0.0789 | 0.0293 | 2.7454·10⁻⁴ | 1.1563·10⁻³ |
| 10 | [0.814337, 0.824827] | 0.82 | 0.00965 | 0.01391 | 3.4690·10⁻⁴ | 4.2099·10⁻³ | 0.0824 | 0.0367 | 1.9239·10⁻⁴ | 7.4029·10⁻⁴ |
| 11 | [0.824827, 0.834856] | 0.83 | 0.01034 | 0.01408 | 2.6300·10⁻⁴ | 3.0647·10⁻³ | 0.0858 | 0.0293 | 1.7320·10⁻⁴ | 4.7347·10⁻⁴ |
| 12–19 | 0.834856 to 0.878570 | 0.84–0.875 | | | 1.86·10⁻⁴ to 1.34·10⁻⁵ | | 0.089 to 0.102 | 0.133 to 0.160 | none | |
| 20, 21 | 0.878570 to 0.886227 | 0.88, 0.886 | | | 4.3·10⁻⁶, < 0 | | 0.068, none | 0.160 | none | |

**What is false, and what is not.**
- **False:** on each of the pieces 1–11, the conjunction of H4_j, H5_j and H8_j with the splits of D\* and η_h,j = 0
  (§5.4). H4_j is certified (author only) and the design cannot do without H5_j, so the allocation of D\* that gives
  the whole room to the A/B sector fails there: the other sectors need a part of the room of at least the last
  column (5 % of the room on piece 1, 13 % on piece 7, 24 to 37 % on pieces 9–11). The allowances θ_j and the factors
  of §4 on pieces 1–11 belong to the refuted allocation. With even the largest unassigned share over χ
  (1 − κ_AB(1) = 0.078 or 0.089, which the design does not offer at χ = 10) pieces 9 and 11 still fail.
- **Its source** is the comparator: H8 measures every pair against the q-only value at the fixed ν₅ of the row, and
  the χ-dependent split of ledger 4.34 leaves to the other sectors a share of the deficit (0.029 at χ = 10) that was
  measured along the one-spike family only. The gain F(ν′) − F(ν₅) is not small against the deficit at zero energy:
  it needs a share of 0.048 to 0.086.
- **Not affected:** the exact pieces and rooms of D\* (they are scalar envelopes of row parabolas and do not depend on
  the allocation); the implication of §5.3 (a design with other splits or with η_h > 0 can satisfy its hypotheses);
  pieces 12–21, where the constant splits leave κ_h = 0.13 to 0.16 against a needed 0.09 to 0.10; the conditional
  certificate of ledger 4.17, whose hypothesis K₅ compares with the supremum over ν of the scalar value and has no
  split (second table of `zero_content_budget.log`: on its published pieces the share needed is 0.039 to 0.102, so
  the constant split κ_AB = 0.82 of ledger 4.29 passes this test too). Affected in the same way: every allowance of
  the record computed with the χ-dependent split and the whole room (ledger 4.31, 4.32, 4.34).
- The pairs have payoff far below the target; they refute an allocation, not the certificate route.

### 5.6 Two repairs, tested numerically (N)

Both were suggested in the review. Neither is certified, and for neither is H8 proved: the tests below say only that
the pairs of §5.5 no longer contradict the design and what the content law is then allowed.

**(b) Fund the visible quintic: H8 as stated, with η_h,j > 0 on pieces 1–11.**
Scripts `CODE/checks/funded_rooms.py` (band files and command lines), `CODE/scripts/r4_theta6.py` and
`final_table.py` (unchanged), `CODE/checks/repairs_summary.py`; outputs `CODE/tables/funded/` and `CODE/tables/REPAIRS.md`.
- *fundFull* (the funded allocation of §4): η_h,j = the gain F(ν′) − F(ν₅) at the upper end of the piece (the column
  "gain" of §5.5, taken as an upper bound): 12.4 % of the room on piece 1, 21.8 % on piece 7, 37.8, 46.9 and 55.5 % on
  pieces 9, 10, 11. With it the inequality of §5.5 holds for those pairs at every t of the piece once λ is small,
  because X(q) → S₅ − F(ν₅) > 0 (1.9·10⁻² on piece 1 down to 3.0·10⁻³ on piece 11;
  `CODE/tables/nu_matched/zero_energy_deficit.log`).
- *fundMin*: η_h,j = the lower bound of §5.5 (last column): 4.9 % of the room on piece 1 up to 36.6 % on piece 11.
- The allowances θ_j(u, χ) were recomputed with the room that is left (same program, margins, splits and grid). A
  control run with η_h = 0 reproduces the allowances of §4 to the tolerance 10⁻² of the program's bisection
  (`CODE/tables/funded/control.log`), so differences below 1 % mean nothing.
- **fundFull:** the allowances fall by at most 12 to 19 % on pieces 1–8 and 26 to 30 % on pieces 9–11 (smallest
  quotient per piece 0.881, 0.862, 0.879, 0.856, 0.846, 0.843, 0.830, 0.808, 0.739, 0.708, 0.699). Smallest factor per
  cell: 2.76, 2.78, 2.97, 2.98, 3.05, 3.13, 3.20, 3.23, 3.18, 3.17, 3.46 on pieces 1–11 (2.87, 2.99, 3.14, 3.18, 3.26,
  3.32, 3.38, 3.44, 3.54, 3.52, 3.87 at η_h = 0); pieces 12–21 are unchanged (at least 4.24). The allowances per cell
  are in `CODE/tables/funded/THETA_TABLE_fundFull.md`.
- **fundMin:** 2.83, 2.90, 3.04, 3.07, 3.14, 3.21, 3.25, 3.32, 3.31, 3.34, 3.60.
- The loss is small because on these pieces the allowance is carried by the share κ_AB·X of the deficit more than by
  the room. What is not shown: that η_h,j is enough. It accounts for one family of pairs, at λ → 0; pairs that combine
  a shift of the visible quintic with content, with the other sectors or with a larger remote energy may need more.

**(a) Compare at the quintic coefficient of the pair instead of the fixed ν₅.**
For real ν let r^ν be the row r with ν in place of ν₅, and Λ₅^ν, S₅^ν, X^ν, G_AB^ν, c_X^ν, Ω̂_X^ν the objects of §5.1 for
r^ν. Two forms.
- *ν-matched.* **H8ν_j:** for every pair with t ∈ I_j and u > 0 there is ν in an interval N_j with
  Λ̂₅^+(G₃, G₅) − Λ₅^ν(q) ≤ G_AB^ν(q) + κ_h,j(χ)·X^ν(q) + η_h,j. If H5_j, H6_j, H7_j hold for every row r_j^ν, ν ∈ N_j, the
  proof of §5.3 goes through with ν in place of ν₅: step (3d) uses the supremum over ν that H4 already contains. For
  the pairs of §5.5 take ν = ν′: the left side is at most G_AB^{ν′}(q) (the point r = 0 of its supremum), so H8ν holds
  with η_h = 0 as soon as X^{ν′}(q) ≥ 0, which is the case for small λ since S₅^{ν′} − F(ν′) > 0 (1.76·10⁻² on piece 1
  down to 2.6·10⁻³ on piece 11, N; same log). **The obstruction vanishes on every piece.** The price is H5–H7 on an
  interval of ν containing at least [ν₅, ηγa_{j+1}].
- *What that costs, at the far end ν = ν′ of the interval* (scripts `CODE/checks/nu_matched.py`, the profile program
  of the working folder, `margin_scan.py`, `r4_theta6.py`; outputs `CODE/tables/nu_matched/`, summary in
  `REPAIRS.md`), on pieces 1–11, with the whole room and η_h = 0:
  - margin: the second-order value at ν′ is 0.2551, 0.2915, 0.2917, 0.3264, 0.3433, 0.3598, 0.3759, 0.3916, 0.3760,
    0.3917, 0.4071, above the value at ν₅ by 1.6 to 2.9·10⁻³, and the scans find no smaller m/|ρ|² at any amplitude (the
    smallest value found exceeds it by at most 3·10⁻⁴);
  - allowances: θ at ν′ divided by θ at ν₅, cell by cell, lies between 1.02 and 1.09 on pieces 1–8 and between 0.94
    and 1.06 on pieces 9–11 (medians 1.025 to 1.050); the smallest allowance of each piece rises (0.108 → 0.111 on
    piece 1, 0.929 → 0.973 on piece 11).
  - Not computed: the profiles change with ν, so the content ratios of the cubics change too; they were not searched
    again, so no factors are given. Only the two ends ν₅ and ν′ of the interval were computed, and nothing for ν
    outside it, although a pair's quintic coefficient is not confined to it.
- *Max form.* **H8′_j:** Λ̂₅^+(G₃, G₅) ≤ max{sup_ν Λ₅^ν(q), Λ₅(q) + G_AB(q) + κ_h,j(χ)·X(q)} + η_h,j. It is implied by H8,
  it keeps H4–H7 as they are (the first branch is at most G⁺ by H4, the second is step (3c)), and every pair with
  G₃ = q and G₅ a real multiple of e₃₂ satisfies it with η_h = 0 exactly (take ξ = 0 in Λ̂₅). So the pairs of §5.5
  do not contradict it on any piece. It is untested for pairs that combine a shift of the visible quintic with an
  A/B or other-sector gain, where the two gains would have to fit under a maximum, not a sum; no claim is made.

**What the two repairs show together.** The pairs of §5.5 refute a bookkeeping choice (fixed ν₅, no room for the
other sectors, a share of the deficit read off one family), not the pieces, the rooms or the per-cell posing. Under
either repair the content law keeps, numerically, allowances within about 30 % of those of §4, and under (b) a
smallest factor of 2.76. H8 in whichever form is used remains open, with no written proof plan.

---

## 6. Things in the material that do not fit together

Found while recording; `CODE/checks/rows_compare.log` prints the numbers.

- **Float rows against rational rows.** The profiles, the margin scans and the allowance programs use float tuned
  rows (`CODE/tables/g078/rows_all.lines`, `g078hi/rows_all.lines`); the pieces, constants C_j and rooms use the
  rational rows of ledger 4.17. On the rows 0.74–0.88 the two differ by at most 2.84·10⁻⁵ in (ℓ, β, b_A, b_B) (the
  fifth digit, not the seventh as the design worker's notes say). **On the row 0.886 the float row differs by
  1.1·10⁻⁴ in β, 7.3·10⁻⁴ in b_A and 1.4·10⁻³ in b_B**: the margin 0.4870 and the entries of piece 21 belong to a
  slightly different row. ν₅ is not part of the rational row at all (the law layer takes a supremum over ν); the
  profile uses the float row's value. A certificate must fix one set of rows.
- **The scans at the tilt (2/5, 3/10) on the rows 0.865–0.886** used other rows (§3.1). No number of D\* depends on
  them.
- **The row 0.855 at the tilt (2/5, 3/20):** μ₀ = 0.4398 is the grid value at s = 0.05, 3.6·10⁻³ below the value 0.4434 at
  s = 0 and below the smallest finite-amplitude value found; the same effect, 1.4·10⁻³, on the row 0.86. D\* uses the
  smaller numbers.
- **The splits jump at 0.84:** κ_AB is 0.922–0.965 on the rows up to 0.83 (χ-dependent) and 0.8472 on the row 0.84
  (constant). Both come from the record; the design does not reconcile them.
- **Half-room sensitivity:** the design worker's summary quotes "14 to 27 % in the cells that bind"; `half_table.txt`
  prints seven values of χ per energy and does not identify the binding cells, so only the range 9 to 44 % over the
  printed cells is recorded here.

---

## 7. Replays

`bash checks/replay_exact.sh` in CODE (Python standard library, a few seconds) recomputes, from the committed row
constants, the direct bound, both exact assemblies, the three exact envelopes (the 26 rows at the constant radius,
the variant, and the 21 pieces of D\*), the table of constants and the margins table from the stored scans, and
compares each with the committed output: all identical (`CODE/checks/replay_exact.log`; run by the recording worker
on 25 November 2026). The same script recomputes the exact table of §5.5 (`checks/zero_content_budget.py`) and the
summary of §5.6 from the stored outputs. codex-a7c4's replay for piece 7 runs from the repository root
(`checks/codex_a7c4_piece7_replay.py`; output `checks/codex_a7c4_piece7_replay.log`: required gain > 0.00041403,
available < 0.00029072).

Run for §5.6 by the recording worker on the droplet (four cores, about 45 minutes in all, folder removed afterwards):
33 runs of the allowance program (11 pieces × {η_h = 0 control, fundMin, fundFull}), and for the ν-matched rows 11
profile runs, 11 margin scans and 11 runs of the allowance program.

Not replayed by the recording worker: the node caps and the cover replays of §1 and §2.2 (interval arithmetic;
1118 s, 1296 s and 760 s of wall time in the design worker's runs; the cover files, 32 MB, are outside the repository:
`CODE/COVERS.sha256` and `../../INVENTORY.md`); every floating-point computation of §2.3, §3 and §4 (margin scans,
conic programs, ratio searches) other than the control of §5.6, whose programs need the tools of the working folder named in the inventory.

---

## 8. Judgement

- **The tuned part.** Every piece of [0.649, 0.886227] has an exact positive room. The first allocation of that room
  (everything to the A/B sector, the χ-dependent split, the comparator at the row's ν₅) is false on the eleven
  pieces below 0.835: actual pairs with zero content show it (§5.5). With the visible quintic funded from the room
  (§5.6 (b)) every piece has, against every cubic evaluated, a factor of at least 2.76 between the allowance and the
  largest ratio found; with the comparator at the pair's own quintic coefficient (§5.6 (a)) the obstruction vanishes
  and the allowances do not fall, at the price of the secant and content hypotheses on an interval of ν. Numerically
  the A/B content part does not look like the place where the programme breaks. That is all the computation
  supports: the margins are scans (upper bounds of infima), the ratios are searches in at most 13 variables (lower
  bounds of suprema, and the record shows growth with the number of variables), the allowances are float programs on
  a grid, the per-cell posing needs H6 for each (u, χ) separately, which no proof technique of the record delivers
  yet, and the share of the room that the other sectors need is known only from below.
- **1.402 is not reachable with what is proved.** Nothing covers t ∈ (0.250885, 0.649) (H2 = problem P3; PR #640
  reports that K₅ as formulated fails for actual pairs on [1/4, 5/12], so the law rows are not a route there), and
  H5 (P2), H6 (P1) and H8 are open on all 21 pieces. H8 has no written proof plan beyond the group statements, and
  §5.5 shows that its constants cannot be read off the one-spike family.
- **A smaller target removes no hypothesis.** At 1/1.40195 the rooms grow by 2.5·10⁻⁵ and t₁ by 5.5·10⁻⁵
  (`ASSEMBLY_CONSTANTS.md`); the same hypotheses are needed on the same pieces.
- **What to pose next.** P2 at the tilt (2/5, 3/20), where the claim is that the constant second-order margin holds
  globally (its Case I); P1 per (u, χ) cell with the allowances of the funded allocation (its Case I); H8 as one
  statement, in the form with η_h > 0 or in one of the forms of §5.6 (a), tested first on pairs that combine a shift of
  the visible quintic with content.
