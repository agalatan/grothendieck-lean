# What a sharper cubic radius would give the lower bound (estimate for #712)

*Author: a worker of `claude-b9ee`, 25 November 2026. Task
[#712](https://github.com/agalatan/grothendieck-lean/issues/712), first step: the estimate before any Lean work.
Labels as in [`../../../README.md`](../../../README.md): **C** exact rational replay, **N** floating point; everything
here is author only. Master at the time: `0a5445866`.*

## Verdict

**Replacing the Lean radius 93/100 by 2287/2500 (or by 4571/5000, 9/10, or the conjectured √π/2) leaves the lower
endpoint exactly where it is: with the committed tables the gain is 0 (exact).** The radius does not bind in the
envelope: among the rows replayed (the central rows 08/09 and the plain rows 03–14) only the cap of row 14 depends on it (exactly, by 6.62·10⁻⁷ at 2287/2500), and that
row's cells lie 6.1·10⁻⁶ and more below the top. What re-optimised row tables could gain from a sharper radius is not bounded
here; the sampled figures of (d) are the only evidence. It is not worth formalising for `main_bounds`. (Its use for the higher-degree programme, #711, is a different consumer and is
not assessed here.)

| radius r | hat cap B̂ | endpoint 1/((1 − ν)B̂ + ν) | gain over 1.4020221627 | label | re-optimised |
|---|---|---|---|---|---|
| 93/100 (control) | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 (reproduces master) | C | — |
| 2287/2500 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | stop scale, first-moment terms |
| 4571/5000 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 9/10 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 88623/100000 (√π/2 rounded up) | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 44311/50000 = 0.88622 (√π/2 rounded down) | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |

Nothing was re-optimised in these rows. The effect of re-optimised node certificates is unknown beyond the sampled
linear programmes of (d).

The nine mixture prices of the central rows, the binding cell (23) and the binding pieces are identical for every r
in the table, to the last digit.

## Where the radius enters

Two constants play the role of the radius.

**`93/100`** (`first_moment_le_93`, `Grothe/LowerAnalytic/SharpRadius.lean:117`; `norm_pres_le_93`,
`Grothe/LowerAnalytic/RowGaussian.lean:269`), used by the two central rows 08 and 09 (t = 0.835, 0.845) only:

1. as the **bound on the residual scale** τ = ‖p‖ ≤ 93/100, hence the stop scale σ ≤ δ·93/100 of the row cover:
   `RowGaussian.lean:342` (the reduction frame), `Reduction.lean:42`, `LowerBoundTight.lean:46`,
   `AntiSteinRowSound.lean:2620` and `:3128` (`hstop : r.delta * (93/100) ≤ stop`),
   `CoupledSteinData.lean:22` (`stop := row08.delta*(93/100)`);
2. as the **first-moment constraint** E√U ≤ 93/100 of the normalised law, multiplying the coefficient a₁ ≥ 0 of a
   polynomial majorant: `AntiSteinRowCheck.lean:458` (`QuadNode.val`), `:481` (moment nodes),
   `AntiSteinRowSound.lean:2703`; the transported ordinates `Grothe/Lower/SparseNodePricing.lean:56–117`,
   `Grothe/LowerAnalytic/SparseSteinRows.lean:28, 64`, `Grothe/LowerAnalytic/SparseSteinWitness.lean:42`. The antiholomorphic nodes (`checkAntiEndpoint`,
   `AntiSteinRowCheck.lean:341`) have no √U term and do not use the radius at all;
3. `WitnessCap.lean:567–618` (the projection norm ‖P₂,₁k‖ ≤ 93/100) feeds item 1.

**`Lower.ρ = 973612157/10⁹`** (`Grothe/Lower/Moment.lean:22`) is the same quantity with an older, weaker constant
(the first absolute moment of a normalised cubic, from three moments; `LowerAnalytic/Moments.lean:174`). The scalar
rows and the mass row use it in the same two ways (files under `Grothe/Lower/`): `Law.lean:42` (`Moments.mh`);
the stop δρ of the plain rows 03–07 and 10–14 in `Rows.lean:162` and of the two spectral rows 01 and 02
(t = 0.4, 0.6) in `SpecRows.lean:124`; `MassCover.lean:20`; `Support.lean:55` (τ ≤ ρ). `data/tail-rows/plain/`
holds rows 03–14, among them the plain versions of rows 08 and 09. The radius
2287/2500 could replace it as well. None of these files is in the node-cap closure (the closure has
`Grothe/Lower/RowDataTypes.lean` only from that folder), but the native row checks would have to be re-run.

## The estimate

**(a) Central rows, same node tables (C).**
[`central_replay.py`](../../code/radius-gain/central_replay.py) runs the replay of
[`CURVED_SCHUR.md`](../../CURVED_SCHUR.md) with r in place of 93/100 in the stop scale, the moment and quadratic nodes and
the transported ordinates. At r = 93/100 it reproduces master's cap and endpoint. For every other r nothing changes,
because the binding pieces of the common-law discount lie at σ ∈ [0.214, 0.265], that is τ = σ/δ ≈ 0.27 to 0.33,
between antiholomorphic nodes, while the radius acts at τ = r ≈ 0.91 and on the few majorants with a₁ > 0 (6 of 12
and 6 of 14 quadratic nodes and the moment nodes; none of them binding). As a negative control, r = 3/10 and r = 1/4
(below the binding τ) do lower the cap: to 0.70635471959 (cell 26) and to 0.70635442398, the outer ceiling of cell 14
(endpoint 1.4020229326).

**(b) Plain rows 03–14, same node tables (C).**
[`plain_rows.py`](../../code/radius-gain/plain_rows.py) re-evaluates the twelve plain rows by the rule of
`checkCell`, with r in place of ρ both as first moment and in the stop, in exact rational arithmetic: the chords
have exact maxima, and every small rectangle (a polynomial of degree 6 in the scale, at both shape endpoints) is
enclosed by Bernstein subdivision to 10⁻¹⁵.

- **Rows 03–13 (eleven chord controls).** Each binds on a chord, at τ between 0.26 and 0.51, whose nodes have
  a₁ = 0; all rectangles are proved to lie below it. At r = ρ the worst value is below the Lean cap by 8.6·10⁻¹⁷
  to 9.0·10⁻¹⁶ (the upward rounding of the cap), and for every r of the table the saving is exactly 0.
- **Row 14 (t = 0.8875).** It binds on a small rectangle, at σ = 0.0023 and x ∈ [5/2, 3], with a₁ > 0. At r = ρ its
  worst value is 1.025·10⁻⁹ below the Lean cap. Its cap does depend on the radius: the saving is 4.9568·10⁻⁷ at
  93/100, **6.6241·10⁻⁷ at 2287/2500**, 6.6893·10⁻⁷ at 4571/5000, 8.2180·10⁻⁷ at 9/10 and 9.6748·10⁻⁷ at
  88623/100000 (enclosures in `plain_rows.txt`). Row 14 enters the envelope in cells 34 to 37, which are 6.1·10⁻⁶
  and more below the top, so the endpoint does not move.

The spectral rows 01 and 02 and the mass row were not replayed; their cells are 8·10⁻⁴ and more below the top.

**(c) The envelope is a plateau.** The per-cell maxima of the current envelope are within 1.5·10⁻⁵ of the hat cap
on every cell from t = 0.798 to 0.888 (rows 05 to 14); cell 14 (rows 06/07) is 4.0·10⁻⁷ below, cells 21 to 26 less
than 4·10⁻⁷. Improving rows 08/09 alone moves the endpoint by at most 7.7·10⁻⁷ (the exact ceiling of
`CURVED_SCHUR.md`); a real gain needs all of rows 05 to 14 at once.

**(d) Sampled linear programmes for re-optimised node weights (N, an indication only).** Could new node
certificates use the sharper first moment where the committed ones chose a₁ = 0? [`node_sdp.py`](../../code/radius-gain/node_sdp.py) solves, for a row, a scale σ and a
shape x, the linear programme

    sup E Ψ_up(σ√U)  over laws with  E U = 1, E U² = 2 + x², E U³ ≤ 6 + 9x² + C₆x³,
                     E G_z(U) ≥ 0 for every cut z of the row's committed banks,  [E√U ≤ r],

on a grid of √U, with the cut banks of all shape cells of the row pooled (a Lean node uses the bank of its own
cell). The records of the droplet run ([`lp_summary.txt`](../../code/radius-gain/lp_summary.txt), `lp/sdp_*.jsonl`)
cover rows 0.82, 0.83, 0.835 and 0.845 at σ from 0.12 to 0.7377; the shapes are x ∈ {0, 0.2, 0.3, 0.4, 0.5, 0.65,
0.8, 1, 1.5, 2.5} at the smallest scales and x ∈ {0.2, 0.4, 0.65} at the others (the listing gives the shapes of
every row and scale). The table gives the **largest difference found on these samples** between the value without
and with E√U ≤ r, rounded upward:

| sampled scales | records | E√U of the optimiser without the radius | r = 0.93 | r = 0.9148 | r = 0.9142 | r = 0.9 | r = 0.88623 |
|---|---|---|---|---|---|---|---|
| σ ≤ 0.33 (where the rows bind) | 244 | 0.539 to 0.896 | 3.5·10⁻¹⁴ (solver noise) | 3.5·10⁻¹⁴ | 3.5·10⁻¹⁴ | 3.5·10⁻¹⁴ | 1.99·10⁻⁷ |
| σ = 0.6 | 12 | 0.845 to 0.926 | 0 | 9.31·10⁻⁸ | 1.02·10⁻⁷ | 1.04·10⁻⁶ | 2.11·10⁻⁶ |
| σ = 0.7377 | 12 | 0.841 to 0.925 | 0 | 1.11·10⁻⁶ | 1.18·10⁻⁶ | 3.19·10⁻⁶ | 1.08·10⁻⁵ |

**These are not upper bounds.** Each value is a finite-support lower bound of its own supremum, so a difference of
two of them is not one-sided; the bank is pooled; and shapes between the samples are not covered. Indeed at row
0.845, σ = 0.29, x = 0.45, which is outside the grid, the same programme gives a difference of 2.162·10⁻⁷ for
r = 0.88623 (codex-a7c4, review of #714), above the largest sampled 1.99·10⁻⁷. No ceiling for the endpoint follows
from these figures.

As a check of the model, at the 119 sampled points that are committed nodes the node certificate exceeds the value
of the linear programme, by 4.8·10⁻⁷ to 3.0·10⁻⁴ (weak duality; last line of `lp_summary.txt`).

What the samples show: at the sampled scales where the rows bind, the optimiser without the radius has E√U below
0.9, and the sampled differences vanish (to solver noise) for r = 93/100, 2287/2500, 4571/5000 and 9/10. This is
consistent with rows 3.5 and 5.4 of [`STATUS.md`](../../STATUS.md) (the scalar certificate with ρ = 0.9387, **N**).
Not covered: shapes and scales between the samples, cuts outside the committed banks, and the antiholomorphic
nodes of rows 08/09 (their generator is not in the repository). The programmes were not rerun for this revision
(scipy is not available on the laptop); the table is restated from the committed records.

**A heuristic reason.** The fibre potential at the binding scales is more convex than the quadratic price κσ², so the worst law
spreads U (mass near 0 and far out), which lowers E√U. An upper bound on E√U only excludes laws concentrated near
U = 1, and those are not the dangerous ones.

## What the Lean work would be (not recommended)

- **2289/2500 = 0.9156** (`cert_916.json` alone, 23 rows): the same architecture as the 23 kernel-checked rows of
  93/100 (`RadiusRowCheck.lean` 413 lines, `RadiusCheck.lean` 2,777, `AntiStein.lean` 1,961,
  `CircularTensor.lean` 5,163), but each row adds two **third-order** radial forms. Missing in Lean: the fields
  W_k = Σ_j F_j ∂_jF_k, w = Σ|W_k|², β̃; the identity E w = 24y; the cone β̃² ≤ V c₂ w; the two Stein identities
  for the tests q̄(c₂ − 1)g₃(V) and qā g₄(V); a row checker with four test functions and a 4×4 Sylvester check
  (the present one has two tests). Estimate: 5 to 7 new or rewritten modules, 4,000 to 6,000 lines, the 23 row
  modules regenerated (now 330 kB), two to four weeks of one agent. Kernel time of the new rows: not measured.
- **2287/2500 = 0.9148** needs in addition the bound E|q| ≤ (√π/2)(1 + (26449/5000000)s) on s ∈ [0, 6]
  (`../../../conjecture-K/sources/near-gaussian-505-2026-11-21-gemini-2762/PROOF.md`, Theorem 4): the
  Ornstein–Uhlenbeck resolvent identity on the real third chaos, the Wiener–Itô product formula and the V₂ ⊕ V₄
  decomposition of ‖∇F‖², bounds for two kernels defined by Gaussian integrals, dominated convergence and phase
  averaging. None of this exists in Lean or Mathlib. It is a formalisation of the size of a paper: two to three
  months, high risk. The note itself labels Theorem 4 "author only".
- **Consumers.** With a new theorem `first_moment_le_r`, the constants in the files of the list above change, the
  two antiholomorphic row tables and the 14-ordinate profile are regenerated, and nothing in the bound moves.

## Reproduction

From the repository root (standard library only for the first two; their checks are explicit `require` calls, not
`assert`, so `-O` does not disable them):

    python3 -IBO research/identity-tail/code/radius-gain/central_replay.py
    python3 -IBO research/identity-tail/code/radius-gain/plain_rows.py
    python3 research/identity-tail/code/radius-gain/node_sdp.py 0.82 0 1 OUT    # numpy, scipy
    python3 -IB research/identity-tail/code/radius-gain/summarize_lp.py research/identity-tail/code/radius-gain/lp

The outputs of the runs behind this note are in `../../code/radius-gain/`: `central_replay.txt`, `plain_rows.txt`,
`lp_summary.txt` and the records `lp/sdp_*.jsonl`. The linear programmes ran on the droplet (HiGHS, one core).

Agent-ID: claude-b9ee
