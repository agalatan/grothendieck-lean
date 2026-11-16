<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/CERT_STAGE2.md (16 November 2026); a research worker of claude-b9ee. Only this line was added. -->
# Degree-5 conditional certificate, stage 2: the capped game on all of [0, √π/2]

Worker for claude-b9ee (issue #453, milestone M1 part (a)), 16 November 2026.
- Stage 1: `CERT_STAGE1.md` (same machinery).
- Code: `cert2/`; data and logs: `cert2/out/`.
- Labels: **P** proof on paper (author only); **C** exact or interval-certified computation (author only, replayed by
  `cert2/replay2_all.py`); **N** floating point.

**Game:** T = P₁,₀ − ε₁P₂,₁ + ηP₃,₂ with **ε₁ = 39/50, η = 779/10000**, the rational point next to round 5's
λ = (1, −0.78, 0.0779083).

**Model value at this choice (N).** The re-optimised gate-free rows (`cert2/rowopt2.py`, engine `d5eng2.py`) peak
at **0.7128653 at t = 0.85**:

| t | 0.845 | 0.85 | 0.855 |
|---|---|---|---|
| row value | 0.7128582 | 0.7128653 | 0.7128335 |

- 1/0.7128653 = 1.402789. Round 5's W3 value is 0.7128677.
- The model margin to 500/701 is 4.0·10⁻⁴.

## 0. Result

**Conditional theorem (C, given K₅ at every row).** Take the 32 rows of §3 (exact rationals): 21 Gaussian-optimal
rows (t = 0 and [0.70, 0.886]) and 11 law-aware rows on [0.05, 0.6]. Suppose every row r satisfies
K₅(η₅(r)) (§1). Then every unimodular pair with t ∈ [0, √π/2] has

> **Re⟨f, Tg⟩ ≤ max_t min_r [t² − 2ℓ_r t + C_r + η₅(r)].**
> With η₅ ≡ 0 this maximum is **B₅ = 0.7128845054…** (an exact rational, `cert2/out/rows_final.json`), attained at
> t = 0.84763.

- **Room 500/701 − B₅ = 3.823·10⁻⁴.**
- Per row, the room is 500/701 minus the row's maximum on its active interval. The binding rows are:

  | t | 0.845 | 0.85 | 0.855 | 0.84 | 0.86 | 0.83 |
  |---|---|---|---|---|---|---|
  | room | 3.82·10⁻⁴ | 3.82·10⁻⁴ | 3.94·10⁻⁴ | 4.10·10⁻⁴ | 4.47·10⁻⁴ | 4.84·10⁻⁴ |

- The rows from 0.82 down to 0.70 have rooms 7.5·10⁻⁴–9.6·10⁻³, and the small-t rows 2.2·10⁻³–2.0·10⁻². The
  smallest small-t room is 2.19·10⁻³ at t ≈ 0.08–0.14.
- So **K₅ with η₅(r) ≤ room(r) at every row gives K_G^ℂ > 1.402**. The per-row allowances are listed in §3.
- **Law layer at the peak (C):** G⁺ is 6–9·10⁻⁶ above the Gaussian ideal. Stage 1 had 1.8·10⁻⁵; the radius input and
  the smaller η make the difference.
- **Small t needs its own rows.** The Gaussian-optimal rows lose about 0.09 in the law layer at t ≲ 0.3: the moment
  and radius inputs allow a nearly constant |q|. They leave [0.116, 0.516] uncovered. Rows optimised for the
  moment+radius value (§4) close it with room ≥ 2.2·10⁻³.
- **The crude row is not available** (§2). The provable form misses by 5.2·10⁻⁵ at t = 0, so t ≈ 0 also rests on K₅,
  with room 5.75·10⁻³.


---------------------------------------------------------------------------------------------------------------------

## 1. Inputs and the statement

**Law inputs.** For U = |q|²/‖q‖² of every remote circular cubic q:
- Lean: E U = 1, m = E U² ∈ [2, 44], E U³ ≤ 9m − 12 + C₆(m − 2)^{3/2};
- new: **E√U ≤ ρ = 9513293/10⁷** (ledger 3.7, verified P + C). It replaces the Lean first-moment bound 0.973612157.

No Stein cuts are used.

**Hypothesis K₅(η₅(r)) at row r** (stage 1 §1, with the new ε₁, η). For all G₃ ∈ H₂,₁ and G₅ ∈ H₃,₂ with remote
residual q:

  Λ₅(G₃, G₅) ≤ sup_{ν∈ℝ}[E_w Ψ₅(|q|; ν) − ν²/η] − ‖q‖²/ε₁ + η₅(r).

**Conclusion (C, given K₅ at every row).**
- For all unimodular f, g: Re⟨f, Tg⟩ ≤ max_t min_r [t² − 2ℓ_r t + C_r + η₅(r)], with C_r = 2β_r²/ε₁ + G⁺_r.
- This is below 500/701 whenever **η₅(r) ≤ room(r)** for every row r. Here room(r) = 500/701 − (largest value of row r
  on its active interval in the envelope); the table in §3 lists it.
- Then K_G^ℂ > 1.402 by the transfer R0.

---------------------------------------------------------------------------------------------------------------------

## 2. The crude row: not available unconditionally

The suggested crude row V ≤ t² + ε₁ρ² (0.705921 at t = 0, slack 7.3·10⁻³) drops the quintic terms
η(‖Rh‖² − ‖Rk‖²). The elementary argument (P) keeps them:
- V = ⟨h, Th⟩ − ⟨k, Tk⟩ ≤ t² + η‖Rh‖² + ε₁‖Qk‖²;
- ‖Rh‖² ≤ ‖h‖² − t²;
- ‖Qk‖ ≤ ρ (radius bound, |k| ≤ 1) and ‖Qk‖ ≤ ‖k‖;
- ‖h‖² + ‖k‖² ≤ 1.

So **V ≤ t² + ε₁ρ² + η(1 − ρ² − t²)₊**. At t = 0 this is 0.705921 + 0.007398 = 0.713319, which is
**5.2·10⁻⁵ above 500/701**, and it grows with t. It covers no t.
- The bound is not sharp: equality needs k ∈ H₂,₁ with |k| ≤ 1, which is impossible.
- But I have no quantitative replacement.
- **So every t, including t = 0, is covered by gate-free rows conditional on K₅.** The rows at small t have rooms of
  order 10⁻³–10⁻² (§3).

---------------------------------------------------------------------------------------------------------------------

## 3. Rows, certified values, room per row

Columns:
- "Gaussian row" is the row's value at its own t with the Gaussian law (d5eng2, N).
- "certified row" is t² − 2ℓt + C with C = 2β²/ε₁ + G⁺ (C).
- "law gap" is (float moment+radius LP) − Gaussian / certified G⁺ − Gaussian.
- "active on" and "max there" come from the exact envelope.
- **room** = 500/701 − max there.

Rows marked "law" are law-aware (`lawrow.py`). A row's own t need not lie in its active interval.

| t | row | ℓ | β | b_A | b_B | Gaussian row at t (N) | certified row at t (C) | law gap: float LP / certified | active on | max there | **room** |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.000 | Gauss | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.6128538 | 0.7060184 | 9.3e-02 / 9.3e-02 | [0.0000, 0.0388] | 0.7075206 | **5.75e-03** |
| 0.050 | law | 0.01344 | 0.00538 | -0.00002 | -0.00003 | 0.6143744 | 0.7082163 | 9.4e-02 / 9.4e-02 | [0.0388, 0.0758] | 0.7107692 | **2.50e-03** |
| 0.100 | law | 0.09095 | 0.00528 | -0.00047 | -0.00031 | 0.6151645 | 0.7106219 | 9.5e-02 / 9.5e-02 | [0.0758, 0.1141] | 0.7110754 | **2.19e-03** |
| 0.125 | law | 0.12924 | 0.00514 | -0.00087 | -0.00055 | 0.6174171 | 0.7108637 | 9.3e-02 / 9.3e-02 | [0.1141, 0.1399] | 0.7110754 | **2.19e-03** |
| 0.150 | law | 0.16709 | 0.00492 | -0.00145 | -0.00092 | 0.6207715 | 0.7105152 | 9.0e-02 / 9.0e-02 | [0.1399, 0.1738] | 0.7109601 | **2.31e-03** |
| 0.200 | law | 0.22432 | 0.00381 | -0.00320 | -0.00210 | 0.6271471 | 0.7083018 | 8.1e-02 / 8.1e-02 | [0.1738, 0.2205] | 0.7102675 | **3.00e-03** |
| 0.250 | law | 0.28902 | 0.00194 | -0.00541 | -0.00366 | 0.6370955 | 0.7045499 | 6.7e-02 / 6.7e-02 | [0.2205, 0.2752] | 0.7077252 | **5.54e-03** |
| 0.300 | law | 0.34886 | -0.00011 | -0.00820 | -0.00564 | 0.6484053 | 0.7001807 | 5.2e-02 / 5.2e-02 | [0.2752, 0.3518] | 0.7032183 | **1.00e-02** |
| 0.400 | law | 0.42703 | -0.00051 | -0.01554 | -0.01086 | 0.6630059 | 0.6928816 | 3.0e-02 / 3.0e-02 | [0.3518, 0.4585] | 0.6978027 | **1.55e-02** |
| 0.500 | law | 0.49951 | 0.01054 | -0.02344 | -0.01588 | 0.6770988 | 0.6914552 | 1.4e-02 / 1.4e-02 | [0.4585, 0.5272] | 0.6931395 | **2.01e-02** |
| 0.550 | law | 0.52057 | 0.02114 | -0.02838 | -0.01869 | 0.6806262 | 0.6930437 | 1.2e-02 / 1.2e-02 | [0.5272, 0.5686] | 0.6944867 | **1.88e-02** |
| 0.600 | law | 0.56013 | 0.03529 | -0.03252 | -0.02049 | 0.6877614 | 0.6960039 | 8.2e-03 / 8.2e-03 | [0.5686, 0.6470] | 0.7019640 | **1.13e-02** |
| 0.700 | Gauss | 0.62452 | 0.07905 | -0.03519 | -0.02016 | 0.6999095 | 0.7071549 | 7.1e-03 / 7.2e-03 | [0.6470, 0.6715] | 0.7036613 | **9.61e-03** |
| 0.720 | Gauss | 0.65077 | 0.08697 | -0.03726 | -0.02116 | 0.7028078 | 0.7080257 | 5.1e-03 / 5.2e-03 | [0.6715, 0.6989] | 0.7055452 | **7.72e-03** |
| 0.740 | Gauss | 0.67812 | 0.09540 | -0.03938 | -0.02218 | 0.7054321 | 0.7089446 | 3.4e-03 / 3.5e-03 | [0.6989, 0.7256] | 0.7073689 | **5.90e-03** |
| 0.760 | Gauss | 0.70664 | 0.10431 | -0.04155 | -0.02320 | 0.7077414 | 0.7098570 | 2.0e-03 / 2.1e-03 | [0.7256, 0.7520] | 0.7090683 | **4.20e-03** |
| 0.780 | Gauss | 0.73635 | 0.11374 | -0.04378 | -0.02423 | 0.7096865 | 0.7107283 | 9.8e-04 / 1.0e-03 | [0.7520, 0.7721] | 0.7100998 | **3.17e-03** |
| 0.790 | Gauss | 0.75170 | 0.11864 | -0.04493 | -0.02476 | 0.7105064 | 0.7111511 | 5.6e-04 / 6.4e-04 | [0.7721, 0.7850] | 0.7107964 | **2.47e-03** |
| 0.800 | Gauss | 0.76739 | 0.12368 | -0.04609 | -0.02529 | 0.7112165 | 0.7115480 | 2.7e-04 / 3.3e-04 | [0.7850, 0.7988] | 0.7114733 | **1.79e-03** |
| 0.810 | Gauss | 0.78338 | 0.12884 | -0.04725 | -0.02583 | 0.7118089 | 0.7119431 | 8.8e-05 / 1.3e-04 | [0.7988, 0.8117] | 0.7120339 | **1.23e-03** |
| 0.820 | Gauss | 0.79976 | 0.13414 | -0.04845 | -0.02638 | 0.7122769 | 0.7123022 | -1.2e-05 / 2.5e-05 | [0.8117, 0.8247] | 0.7125151 | **7.52e-04** |
| 0.830 | Gauss | 0.81654 | 0.13958 | -0.04967 | -0.02692 | 0.7126143 | 0.7126296 | -2.1e-05 / 1.5e-05 | [0.8247, 0.8348] | 0.7127828 | **4.84e-04** |
| 0.840 | Gauss | 0.83367 | 0.14515 | -0.05091 | -0.02750 | 0.7128139 | 0.7128215 | -4.8e-06 / 7.5e-06 | [0.8348, 0.8424] | 0.7128572 | **4.10e-04** |
| 0.845 | Gauss | 0.84240 | 0.14799 | -0.05155 | -0.02778 | 0.7128574 | 0.7128639 | nan / 6.5e-06 | [0.8424, 0.8476] | 0.7128845 | **3.82e-04** |
| 0.850 | Gauss | 0.85120 | 0.15086 | -0.05219 | -0.02806 | 0.7128645 | 0.7128732 | nan / 8.7e-06 | [0.8476, 0.8523] | 0.7128845 | **3.82e-04** |
| 0.855 | Gauss | 0.86014 | 0.15378 | -0.05283 | -0.02836 | 0.7128328 | 0.7128386 | 2.4e-06 / 5.8e-06 | [0.8523, 0.8574] | 0.7128730 | **3.94e-04** |
| 0.860 | Gauss | 0.86917 | 0.15671 | -0.05349 | -0.02864 | 0.7127623 | 0.7127644 | -9.5e-06 / 2.0e-06 | [0.8574, 0.8625] | 0.7128200 | **4.47e-04** |
| 0.865 | Gauss | 0.87833 | 0.15971 | -0.05416 | -0.02896 | 0.7126502 | 0.7126517 | -1.5e-05 / 1.5e-06 | [0.8625, 0.8675] | 0.7127249 | **5.42e-04** |
| 0.870 | Gauss | 0.88759 | 0.16273 | -0.05482 | -0.02925 | 0.7124950 | 0.7124971 | -2.4e-05 / 2.1e-06 | [0.8675, 0.8725] | 0.7125912 | **6.76e-04** |
| 0.875 | Gauss | 0.89697 | 0.16579 | -0.05551 | -0.02957 | 0.7122983 | 0.7122992 | -4.2e-05 / 8.9e-07 | [0.8725, 0.8777] | 0.7124156 | **8.51e-04** |
| 0.880 | Gauss | 0.90648 | 0.16889 | -0.05621 | -0.02986 | 0.7120559 | 0.7120611 | -3.1e-05 / 5.2e-06 | [0.8777, 0.8826] | 0.7121870 | **1.08e-03** |
| 0.886 | Gauss | 0.91717 | 0.17268 | -0.05769 | -0.03161 | 0.7117033 | 0.7117065 | -1.3e-05 / 3.2e-06 | [0.8826, 0.8862] | 0.7119305 | **1.34e-03** |

B = max_t min_r = 27129396822815539230963989585421447896314746957735377038010878258868477385959721490681/38055809344680649354230577259357025368226862054401638400000000000000000000000000000000 = 0.7128845054 at t = 0.84763; 500/701 - B = 3.8226e-04

Inactive rows were certified too but are not used: the Gaussian-optimal rows at t = 0.1 and 0.2, superseded. Their
records are in `cert2/out/rows_cert_all.json`.

---------------------------------------------------------------------------------------------------------------------

## 4. Method (as in stage 1, with four changes)

- **Caps** (`cert2/caps2.py`, `psi5.cpp` unchanged).
  - ν-nodes: fine at step 0.004 on [−0.004, 0.036], coarse out to ±0.08 ≥ η.
  - Nodes whose L + νe₃₂ nearly vanishes on a circle (ν < 0, or t ≈ 0 rows) use tolerance 10⁻⁷ and depth 7. They
    stay rigorous, only less sharp.
- **Law layer** (`cert2/law2.py`, `cover2.py`): ε₁, η and the radius input ρ = 0.9513293. Everything else as in
  stage 1:
  - majorants checked exactly against the cap chords plus a Lipschitz tail;
  - the Lean moment bound J;
  - convexity in ν;
  - exact Bernstein bounds;
  - the outer regions σ ≥ Lip·ρ/κ and |ν| ≥ η by P-arguments.
- **Majorant tail** (`law2.py`, P + C).
  - Stage 1 required the Taylor coefficients of p − (c_N + Lip(s − s_N)) at s_N = 6 to be nonnegative. That forces
    a₆ ≥ 0.0056|a₄|. At large m (x up to √42) J then cannot use a negative a₄; the small-t boxes at m ≈ 44 were loose
    by 0.06 (float LP 0.681 against box 0.741).
  - Stage 2 treats the Lipschitz tail as extra caps at s_N + w, with w on a 0.02/0.1 mesh up to 24, and applies the
    same exact segment test. A Taylor test at s_N + 24 closes the ray.
  - The majorant LP works in powers of s/6. The verifier still accepts the stage-1 tail form.
- **Targets** (`cert2/lpfloat2.py`). Each row's cover first computes the float moment+radius LP supremum from its
  own caps (N). Boxes above that value + 3·10⁻⁶ are refined. Boxes keep their own valid bounds when refinement
  stalls.
- **Law-aware rows for small t** (`cert2/lawrow.py`, N). With the moment+radius inputs, the Gaussian-optimal rows of
  `rowopt2.py` lose 0.09 in the law layer at t ≈ 0.1–0.2.
  - The worst laws keep |q| almost constant (E√U at the radius cap ρ), with a speck at U ≈ 40 that keeps m ≈ 4.
  - The certified Gaussian-optimal rows at t = 0.1 and 0.2 then cover nothing in [0.116, 0.516].
  - So rows at t ∈ {0.05, 0.1, 0.125, 0.15, 0.2, 0.25, 0.3, 0.4, 0.5, 0.55, 0.6} are re-optimised against the float
    moment+radius LP value. They take larger ℓ (e.g. ℓ = 0.224 at t = 0.2, against 0.157).
  - The LP-level row value drops from 0.7120 to 0.7081 at t = 0.2, and from 0.7073 to 0.6927 at t = 0.4.
  - The x-refinement of the cover is tightened for t < 0.7 (`--stall-x 1/32`): J is steep in x there through
    a₆C₆x³σ⁶.
- **Envelope** (`cert2/envelope.py`, exact). min_r of the parabolas, maximised over [0, 886227/10⁶]; the right end
  is > √π/2 and safe by convexity.

---------------------------------------------------------------------------------------------------------------------

## 5. Replay checker (`cert2/replay2_all.py`)

One script, over every row:
1. recomputes **every** node cap with psi5 and compares it with the stored cap;
2. re-verifies the tiling, every majorant and every exact box bound;
3. rebuilds C_r and the exact envelope, with the room per row.

**Run.** `replay2_all.py rows_final.json 22` on big, over all 32 active rows.
- psi5 recomputed every one of the 10194 node caps per row, and each new upper end plus the tail is ≤ the stored cap.
- Every box (tiling, both majorants, exact Bernstein bound) was re-verified.
- Every C_r was rebuilt exactly, and the exact envelope recomputed.
- **Result: 32/32 rows PASS**: 326,208 caps recomputed and about 38,000 boxes re-verified, with every C_r matching.
  - The run was split in two after the coordinator capped processes at 16: rows 0–0.78 on 22 processes
    (`out/replay2_all_part1.log`), rows 0.79–0.886 on 16 processes (`out/replay2_all_part2.log`, "ALL PASS").
  - The exact envelope recomputed from the verified C_r gives B₅ = 0.7128845054… at t = 0.847627; the fraction is in
    `out/rows_final.json` via `envelope.py`.
  - Wall time about 30 minutes.

**What the replay does and does not check.**
- The cap recomputation reruns the same interval code, so it guards against corrupted or stale data, not against a
  bug in `psi5.cpp`.
- That code's independent checks are stage 1's: the closed form at s = 0 and mpmath quadrature at four nodes.
- The analytic inputs are P (author only): the row R1–R2, the GL error bound, the majorant tests, J and the endpoint
  lemma, the outer regions, and K₅'s q-only reduction. The law inputs are the Lean family plus ledger 3.7.
- The float steps (row optimisation, LP targets) only choose the data; nothing certified depends on them.

---------------------------------------------------------------------------------------------------------------------

## 6. Costs and files

**Costs** (big, shared, load 30–60 of 48 cores; mine ≤ 24 processes).
- Per row:
  - caps: 10.2·10³ nodes (ν-grid of stage 2), 31–75 s wall on 8 processes, about 5–10 CPU-minutes;
  - float LP target: about 2 CPU-minutes;
  - cover: 1100–1300 boxes, 50–150 s wall on 8 processes, about 7–20 CPU-minutes.
  - In total about 15–30 CPU-minutes per row.
- Row optimisation: Gaussian rows about 20–25 CPU-minutes each (`rowopt2.py`); law-aware rows about 17 CPU-minutes
  each (`lawrow.py`).
- Stage 2 used about 30 CPU-hours, with 4 hours of wall time on big.

**Files** (all under `degree5-cert/`):
- `cert2/`: `psi5.cpp`, `glconsts.h`, `gen_consts.py`, `caps2.py`, `law2.py`, `cover2.py`, `lpfloat2.py`,
  `run_rows2.py`, `rowopt2.py`, `d5eng2.py`, `lawrow.py`, `assemble2.py`, `assemble_law.py`, `combine.py`,
  `select_active.py`, `summarize2.py`, `envelope.py`, `replay2_all.py`.
- `cert2/out/`:
  - caps and covers per row (`caps_<t>[L].json`, `cover_<t>[L].json`);
  - the rows `rows_final.json`, with the full set in `rows_cert_all.json`;
  - the row optimisations: `rows_capped.json`, `rows_law.json`, `ro_*.log`, `lr_*.log`;
  - the runs `rr_*.log`, the table `final_table.md` and the replay logs `replay2_all_part1.log`,
    `replay2_all_part2.log`.
