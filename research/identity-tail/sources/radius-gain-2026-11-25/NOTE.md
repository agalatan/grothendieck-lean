# What a sharper cubic radius would give the lower bound (estimate for #712)

*Author: a worker of `claude-b9ee`, 25 November 2026. Task
[#712](https://github.com/agalatan/grothendieck-lean/issues/712), first step: the estimate before any Lean work.
Labels as in [`../../../README.md`](../../../README.md): **C** exact rational replay, **N** floating point; everything
here is author only. Master at the time: `0a5445866`.*

## Verdict

**Replacing the Lean radius 93/100 by 2287/2500 (or by 4571/5000, 9/10, or the conjectured √π/2) leaves the lower
endpoint exactly where it is: gain 0.** The radius is not a binding constraint anywhere in the certificate. It is not
worth formalising for `main_bounds`. (Its use for the higher-degree programme, #711, is a different consumer and is
not assessed here.)

| radius r | hat cap B̂ | endpoint 1/((1 − ν)B̂ + ν) | gain over 1.4020221627 | label | re-optimised |
|---|---|---|---|---|---|
| 93/100 (control) | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 (reproduces master) | C | — |
| 2287/2500 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | stop scale, first-moment terms |
| 4571/5000 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 9/10 | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 88623/100000 (√π/2 rounded up) | 8829435313/12500000000 | 25000000000000/17831387166289 | 0 | C | the same |
| 2287/2500, 4571/5000 or 9/10, node weights re-optimised over the committed plain cut banks | — | — | 0 at the binding scales; for 88623/100000 at most 4·10⁻⁷ (see (d)) | N | node certificates of rows 0.82 to 0.845 |

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
   `SparseSteinRows.lean:28, 64`, `SparseSteinWitness.lean:42`. The antiholomorphic nodes (`checkAntiEndpoint`,
   `AntiSteinRowCheck.lean:341`) have no √U term and do not use the radius at all;
3. `WitnessCap.lean:567–618` (the projection norm ‖P₂,₁k‖ ≤ 93/100) feeds item 1.

**`Lower.ρ = 973612157/10⁹`** (`Grothe/Lower/Moment.lean:22`) is the same quantity with an older, weaker constant
(the first absolute moment of a normalised cubic, from three moments; `LowerAnalytic/Moments.lean:174`). The scalar
rows 01–07 and 10–14 and the mass row use it in the same two ways: `Law.lean:42` (`Moments.mh`),
`Rows.lean:162` and `SpecRows.lean:124` (stop δρ), `MassCover.lean:20`, `Support.lean:55` (τ ≤ ρ). The radius
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

**(b) Scalar rows, same node tables (C for the chords, N for the small rectangles).**
[`plain_rows.py`](../../code/radius-gain/plain_rows.py) re-evaluates the twelve plain rows by the rule of
`checkCell`, with r in place of ρ both as first moment and in the stop. At r = ρ it reproduces the twelve Lean caps
to within their upward rounding (10⁻¹⁵). The binding chord of every row lies at τ between 0.26 and 0.51 and its
nodes have a₁ = 0; lowering r to any value in the table changes no cap. The one exception is row 14 (t = 0.8875),
which binds on a small-scale rectangle with a tiny a₁: its cap would fall by 6.8·10⁻⁷ at r = 2287/2500, but its
cells of the envelope are 6·10⁻⁶ and more below the top.

**(c) The envelope is a plateau.** The per-cell maxima of the current envelope are within 1.5·10⁻⁵ of the hat cap
on every cell from t = 0.798 to 0.888 (rows 05 to 14); cell 14 (rows 06/07) is 4.0·10⁻⁷ below, cells 21 to 26 less
than 4·10⁻⁷. An improvement of one or two rows moves the endpoint by at most 7.7·10⁻⁷ (the ceiling of
`CURVED_SCHUR.md`); a real gain needs all of rows 05 to 14 at once.

**(d) Re-optimised node certificates (N).** Could new node certificates use the sharper first moment where the
committed ones chose a₁ = 0? [`node_sdp.py`](../../code/radius-gain/node_sdp.py) solves, for a row, a scale σ and a
shape x, the linear programme

    sup E Ψ_up(σ√U)  over laws with  E U = 1, E U² = 2 + x², E U³ ≤ 6 + 9x² + C₆x³,
                     E G_z(U) ≥ 0 for every cut z of the row's committed banks,  [E√U ≤ r],

which is the dual of "re-optimise the weights of a node over the committed cut bank". The droplet run
([`lp_summary.txt`](../../code/radius-gain/lp_summary.txt); σ from 0.12 to 0.7377, x from 0 to 2.5 for σ ≤ 0.21 and
x ∈ {0.2, 0.4, 0.65} above, rows 0.82, 0.83, 0.835, 0.845) gives:

| scales | E√U of the optimiser without the radius | saving in the node value, r = 0.93 | r = 0.9148, 0.9142 | r = 0.9 | r = 0.88623 |
|---|---|---|---|---|---|
| binding, σ ≤ 0.31 | 0.54 to 0.896 | 0 | 0 | 0 | at most 2.0·10⁻⁷ |
| σ = 0.6 (not binding) | 0.85 to 0.926 | 0 | at most 1.0·10⁻⁷ | at most 1.0·10⁻⁶ | at most 2.1·10⁻⁶ |
| σ = 0.7377 (the new stop; not binding) | 0.84 to 0.925 | 0 | at most 1.2·10⁻⁶ | at most 3.2·10⁻⁶ | at most 1.1·10⁻⁵ |

As a check of the model, at the 119 grid points that are committed nodes the node certificate exceeds the value
of the linear programme, by 4.8·10⁻⁷ to 3.0·10⁻⁴ (weak duality; last line of `lp_summary.txt`).

So at the scales where the rows bind the extremal law has E√U below 0.9, about as spread as the Gaussian one
(√π/2 = 0.88623), and the constraint E√U ≤ r is slack for 2287/2500 and 4571/5000. Even the conjectured sharp
radius would lower a node value by at most 2·10⁻⁷ there, which is at most 4·10⁻⁷ in the endpoint if every row
gained it. This agrees with rows 3.5 and 5.4 of [`STATUS.md`](../../STATUS.md), which found the same for the scalar
certificate with ρ = 0.9387 (**N**). Not covered: the antiholomorphic nodes of rows 08/09 were not re-optimised
(their generator is not in the repository); the linear programme with the plain cuts is the proxy for them. The
programme uses measures on a grid and only the cuts of the committed banks, not every cut of the mesh.

**Why.** The fibre potential at the binding scales is more convex than the quadratic price κσ², so the worst law
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

From the repository root (standard library only for the first two):

    python3 -IBO research/identity-tail/code/radius-gain/central_replay.py
    python3 -IBO research/identity-tail/code/radius-gain/plain_rows.py
    python3 research/identity-tail/code/radius-gain/node_sdp.py 0.82 0 1 OUT    # numpy, scipy
    python3 research/identity-tail/code/radius-gain/summarize_lp.py OUT

The outputs of the runs behind this note are in `../../code/radius-gain/`: `central_replay.txt`, `plain_rows.txt`,
`lp_summary.txt` and the records `lp/sdp_*.jsonl`. The linear programmes ran on the droplet (HiGHS, one core).

Agent-ID: claude-b9ee
