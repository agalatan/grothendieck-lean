# An eighth channel for the seven-channel upper certificate

Agent-ID: claude-b9ee (worker), 26 November 2026. Issue [#723](https://github.com/agalatan/grothendieck-lean/issues/723).
Everything here has label **N** unless a row says otherwise: the LP optima are floating point. The values printed
at fixed weights are exact rational or interval evaluations of the given heads and allowances. The heads and
allowances are rigorous, with one qualification. The circle budget 2 of a new cell copy at ρ = 109/100 was first
taken from a float Schur mean (ledger 4.4). It is now checked by exact Bernstein positivity
(`contour_check.py`, §3), but the step from those polynomial facts to the circle bound is the derivation of
`CELL_TAIL.md` (**P + C**, author only). A model value of D is not a bound on K_G^ℂ.

## Verdict

**The cell copy of #556 still gains about 1.18·10⁻⁵ on top of the seven channels of master.** With master's six
channels (as `Grothe/UpperSixExact` has them) plus one copy of the eighteen-channel branch's cell channel with
R = [a, −(1 − a)], the LP gives 1/D = 1.404544589757 at a = 23277/25000. Master proves 1.404556392, so the gain is
1.180·10⁻⁵. At a = 93079/100000 the value is 1.404544665526, a gain of 1.173·10⁻⁵. **The angular selector and the
six's channel 4 both get weight zero.** The candidate therefore has exactly six positive channels: master's channels
0, 1, 2, 3, 5 and the cell copy in slot 4. It needs no seven-channel assembly and no selector column.

No other candidate comes close. The four further selector columns of #681 gain 4.2·10⁻⁸ without the copy and 1.9·10⁻⁹
with it. For the reflected cubic of #670, none of the seven sampled ε values gets
positive weight in the truncated LP (§2b). The eighteen GT and phase channels of #556 add 6.4·10⁻⁷ beyond the
93079/100000 copy (5.6·10⁻⁷ beyond the best copy 23277/25000; 1/D = 1.404544028), but they need the GT comparison machinery.

## 1. Control

`columns.py` rebuilds master's six columns from the committed tables. It uses the replay of the angular-selector note
(`verify.six_columns`): the degree-20 first preprocessor, phase cutoff 320, other cutoffs 250 and the Lean tail caps.
It also rebuilds the selector column (17/100, R = 23/25 − (2/25)X) with `selector.py`. Master's weights
(`Haagerup.AngularSelector.NumericWitness.weight`, declared in `Grothe/UpperSelector/NumericParameters.lean`) and Lean's selector budget 162464451464/10¹⁵ give

    D = 0.711968565814489862,   1/D = 1.404556391975,

that is 2.6·10⁻¹² below the certified slope 711968565817136711740669035/10²⁷ (1/D = 1.404556391970). This is a comparison of
the mixed value only. It does not bound the difference between the research head of the selector (`selector.py`,
scale 2⁻⁶¹) and the Lean head (scale 2⁻⁸⁹) coefficient by coefficient. Those differ by about 4.27·10⁻¹¹ already at
index 0 (202414694667121719/2⁵⁸ against 54335280867376597037396859/2⁸⁶; codex-a7c4, PR #724); both lie
within their own Wiener allowances. The LP re-weighting
of the seven gains nothing: it loses 4·10⁻¹² after rounding. The research allowance 4.83·10⁻⁵ instead of Lean's
1.62·10⁻⁴ would give 1/D = 1.404556372 (the eight-channel note's seven-channel value).

## 2. Candidates

D is the exact value at the LP weights rounded to 10⁻¹². Gain means 1.404556391970 − 1/D (master's exact slope).
The selector allowance is Lean's.

| candidate (added to master's seven) | 1/D | gain | weights /10¹² (positive) | drops to zero |
|---|---|---|---|---|
| none (LP re-weighting) | 1.404556391974 | −4·10⁻¹² | master's, to 10⁻¹⁰ | — |
| (a) cell copy a = 93079/100000 | 1.404544665526 | 1.173·10⁻⁵ | six_0 877499512940, six_1 66548218336, cell 55246993887, six_5 280435166, six_3 269087699, six_2 155751972 | six_4, selector |
| (a) cell copy a = 931/1000 | 1.404544610602 | 1.178·10⁻⁵ | | six_4, selector |
| (a) cell copy a = 9311/10000 | 1.404544595538 | 1.180·10⁻⁵ | | six_4, selector |
| (a) **cell copy a = 23277/25000** | **1.404544589757** | **1.180·10⁻⁵** | six_0 867218468355, six_1 76803977897, cell 55394070035, six_5 285433355, six_3 142219992, six_2 155830366 | six_4, selector |
| (a) cell copy at the six's own R₄ coefficient | 1.404544685501 | 1.171·10⁻⁵ | | six_4, selector |
| (a) 101 copies, 0.90 ≤ a ≤ 0.95 (step 1/2000; budget 2 of the copies other than the four exactly checked values rests on the float means of ledger 4.4) | 1.404544589102 | 1.180·10⁻⁵ | uses 931/1000 and 1863/2000 only | six_4, selector |
| (b) reflected cubic, preprocessors (p₂, −p₂), seven sampled ε in [0.01, 0.3] | unchanged (§2b) | 0 observed (zero weight in the truncated LP) | | every sample |
| (c) four selector columns of #681 (d = 1 unit, d = 3 twice, d = 4) | 1.404556349482 | 4.25·10⁻⁸ | the six, d = 3 (two columns), d = 4 | selector d = 1 (both) |
| (c) one d = 3 selector (3/20, 197/200) | 1.404556351700 | 4.03·10⁻⁸ | | selector d = 1 |
| (a)+(c) copy 93079/100000 + four selectors | 1.404544663627 | 1.173·10⁻⁵ | the d = 3 column with 39/40 at 4.7·10⁻⁶ | six_4, every other selector |
| (d) the eighteen channels of #556 | 1.404555820191 | 5.7·10⁻⁷ | | selector, 12 of the 18 |
| (d)+(a) eighteen + copy 93079/100000 | 1.404544028260 | 1.236·10⁻⁵ | | six_4, selector, 13 of the 18 |
| everything above | 1.404544028260 | 1.236·10⁻⁵ | | every selector |

**The scan over a** (seven + one copy, float LP) is sharply peaked. D = 0.7119685677 at a = 0.90,
0.7119690370 at 0.925, 0.7119739621 at 0.93, 0.7119731739 at 0.9325, 0.7119691109 at 0.935 and 0.7119685658 at 0.95.
The continuous optimum is a = 0.9310836 with D = 0.7119745488700 (1/D = 1.404544588830; float). Every copy carries
the allowance 889686/10¹⁵ of the eighteen-channel certificate (Hardy tail from index 126 with budget 2 at
ρ = 109/100, plus the ceiling from 251). That budget is checked exactly only at the four values 23277/25000,
93079/100000, 931/1000 and 1863/2000 (`contour_check.py`, §3). For the rest of the scan range 0.90 ≤ a ≤ 0.95 and
for the continuous optimum it rests on the floating-point Schur means of ledger 4.4 (label N).

**Replacement.** In the seven + copy LP the two zero weights are six_4 and the selector. Dropping any other channel
loses a lot. Without six_0 the LP falls to 1/D = 1.40495592. Without six_2 it falls to 1.40458766. Without six_1,
six_3 or six_5 it falls to 1.40454893, 1.40454757 or 1.40454860. The copy replaces the six's channel 4, the
reflected tiger map with R₄, and makes the selector redundant: with the copy present, the residual that the selector
cancelled is cancelled more cheaply. With the research allowance 4.83·10⁻⁵ the selector keeps weight 6.4·10⁻⁶ and
gains 2.9·10⁻¹⁰.

**What is truncation, what is exact.** The six heads, the selector heads and the copies' heads are exact intervals
(2⁻¹²⁸ or exact rationals). Every allowance pays for its whole tail: the six's Lean caps, the selectors' full Wiener
errors and the copies' Hardy tails from index 126. So the value at the printed weights is a lower bound on the model
D of those channels, given the copy's circle budget (§3: exact polynomial checks, derivation author-only). Even an allowance 2·10⁴ times larger (ρ = 1.05, budget 3: 1.8·10⁻⁵ per copy) costs only
1.0·10⁻⁶ in D at weight 0.055. Outward rounding of the weights costs < 10⁻¹². Only the LP optimality is
floating point: the dual feasibility tolerance is 10⁻¹⁰. Over the 24 LP rows of `eighth.json` the float objective
and the exact value at the rounded weights differ by at most 1.06·10⁻¹² (the two rows with the eighteen channels and
the copy). The next largest is 6.05·10⁻¹³ (copy with the research selector allowance). Such agreement only shows
that the rounded weights are feasible and nearly as good as the float optimum; it does not certify that the float
optimum is the LP optimum. No dual certificate was computed.

### 2b. The reflected cubic

`refl_cubic.py` computes the signed grades μ_n of G_ε(z, w) = ph(z + εw(|w|² − 2)) with preprocessors (P, −P),
for n ≤ 121. It uses a reduction that the script's docstring states: one radial Hermite coefficient function
C_{j,ℓ}(t) of ph(z + t), and one angular mode of w per charge. The kernel is then Σ μ_n (rP(r²))ⁿ, a grade series
like the cell channel's. At ε = 0 the script reproduces the phase grades to 5·10⁻¹⁴. Increasing the nodes by half
changes Σ|μ_n| by at most 2.0·10⁻⁶ (ε = 0.3; 7.8·10⁻⁸ at ε = 0.01). The column used is master's phase column plus compose(p₂, μ(ε) − μ(0)), with p₂
master's phase preprocessor. compose(p₂, exact phase grades) reproduces master's six_2 head to 10⁻¹². The
column takes six_2's allowance, which is an assumption.

| ε | Σ\|μ(ε) − μ(0)\| (n ≤ 121) | W to degree 121 | the column's own slope (no allowance) | weight in the LP, seven | weight in the LP, seven + copy |
|---|---|---|---|---|---|
| 0 | 5·10⁻¹⁴ (phase) | 0.711992110 | −0.76048 | (the phase column itself) | |
| 0.01 | 1.02·10⁻³ | 0.711990942 | −0.76006 | 0 | 0 |
| 0.05 | 1.85·10⁻² | 0.712001317 | −0.75125 | 0 | 0 |
| 0.1 | 5.74·10⁻² | 0.711968487 | −0.72981 | 0 | 0 |
| 0.2 | 1.59·10⁻¹ | 0.708032586 | −0.66832 | 0 | 0 |
| 0.3 | 2.73·10⁻¹ | 0.696356504 | −0.59360 | 0 | 0 |

(The rows ε = 0.02 and 0.15 are in `refl_lp.log`. The truncated W first rises, then falls: the ε⁴ gain of #670 is
real, but energy moves to degrees above 121.) **None of the seven sampled positive ε values gets positive weight in
the truncated LP**, singly or all seven together. The float D is unchanged to 10⁻¹⁶ (seven: 0.7119685658149; seven +
copy 23277/25000: 0.7119745484003). This says nothing about ε between the samples or about other preprocessors.

The grades above degree 121 were not computed. The analytic inequality, in the true energies, is this. |μ_n| is at
most the energy at degree n, and ‖p₂‖₁ = 1 gives ‖compose(p₂, ν)‖₁ ≤ Σ|ν_n|. So the omitted grades change the column
by at most (1 − E_ε) + (1 − E_0) in ℓ¹, where E is the true energy to degree 121. The numerical estimate of that
quantity from the quadrature energies in `refl.json` is 9.14·10⁻³ at ε = 0.3 (2 − E₀ − E₀.₃ = 0.0091377). It is
not a proved bound: the quadrature is not directed. At the phase channel's present weight of 1.6·10⁻⁴ it
corresponds to about 1.5·10⁻⁶ in D. That price at a fixed weight does not bound what re-optimising the weight of a
correctly completed reflected column could give. A different
preprocessor pair might change that; it was not explored.

## 3. What a certificate would take (candidate (a), a = 23277/25000 or 93079/100000)

The gain (1.18·10⁻⁵) is six times the threshold. The new root would be a **six-channel** certificate in the form of
`Grothe/UpperSixExact`. Slots 0, 1, 2, 3, 5 keep their maps, preprocessors, heads, cutoffs (phase 320, others 250) and
Lean tail caps. Slot 4 becomes the cell pair of #556 with R = [a, −(1 − a)]. The bound would read
K_G^ℂ ≤ 1.40454459 (a = 23277/25000) or 1.40454467 (a = 93079/100000). The selector tree `Grothe/UpperSelector/`
would no longer be needed for the root.

- **The tail of the cell copy: what is already proved, and what is new.** At a = 93079/100000, master's research
  record already contains an all-orders tail for this cell pair: Σ_{k≥126}|h_k| < 3·10⁻¹⁹ ([CELL_TAIL.md](../cell-contour/CELL_TAIL.md),
  codex-a7c4, #589, **P + C** author only). It comes from the analytic disk of radius 6/5, the Gaussian Schur bound
  |H|² ≤ 144 on |z| = 1197/1000 with j = 3/20, five Bernstein certificates (`code/cell_tail.py`) and the Lean replay
  `scratch/CellContour.lean` of the polynomial inequalities and the tail step. That replay is a scratch
  file, not part of `Grothe`. It is far below the allowance 889686/10¹⁵ charged in this note, so at that a the tail
  costs nothing. The best parameter 23277/25000 is new. There the 1197/1000 certificate fails, but
  `contour_check.py` (the same Bernstein test, parameterised) proves |H|² ≤ 144 on |z| = 119/100 with j = 1/10 inside
  the disk 6/5, giving a tail < 1.306·10⁻¹⁸. It also proves the radius-1.09 test with budget 2 exactly (R = 11/10,
  j = 17/40, 16 subintervals) at 23277/25000, 93079/100000, 931/1000 and 1863/2000, as gemini-21d5 found. So the
  copy's tail needs **no native contour fact**: it can be proved by `ring_nf; positivity`-style polynomial
  inequalities as in `CellContour.lean`, plus the specialisation of `SchurMainGaussian.norm_HholPair_sq_le` to the
  cell pair. That specialisation is the derivation of CELL_TAIL.md §2 and is not in Lean.
- **Head and cutoff.** The cell head has 126 coefficients (indices 0–125). `convex_transfer_variable_ival` of
  `UpperSixExact` already takes a per-channel cutoff, so slot 4 takes cutoff 125 and its cap is the tail from 126
  (< 1.306·10⁻¹⁸ with the contour above). This removes the 6·10⁻⁹ cost that ledger 5.5(b) assumed for padding the head
  to 250. The finite head (the 126 composed cell coefficients from the grade witnesses) and its identification with
  the kernel of the transfer theorem remain the outstanding work, together with the bridge below.
- **What exists on the #556 branch** (commit `76c4647b`, kept by `refs/pull/556/head`; ledger 5.2). The cell tree is 26
  modules of `Grothe/UpperReplacement/`, about 0.53 MB of Lean plus the generated `CellData.lean` (19.0 MB). Then come
  the eight grade witnesses `HeadWitnessFacts/Group00`–`07` (native facts independent of R; about 35–40 CPU-minutes
  by the branch's document) and the root-table checks they use. Their imports outside that tree are on master today
  (`UpperChaos/Realise2`, `HardyHolo`, `HardyGaussianSound`, `SchurMainGaussian`, `HardyArcRegion`, `HardyReal`,
  `Haagerup/PhaseCoefficients`, `Upper/Residual`). The whole tree is 74 files (20.2 MB).
- **New native facts: one** (ledger 5.4(b); the contour fact 5.4(a) is replaced by the exact polynomial
  certificates above). For the record, the float Schur means at ρ = 109/100 (`schur_tail.budget`, 2¹⁶ points,
  j = 0.425) are 1.1776 at 93079/100000 and 1.1783 at 23277/25000. The one new fact is a signed-head fact replacing the six's head fact. It
  covers the five six-type heads (`bivarT`, `HaagerupKernel` intervals) and the composed cell head
  (`HeadCompute.compose 126`, `GrotheKernel` intervals) against c and headCap.
- **Proof glue** (ledger 5.5). Summability and domination of the pair's radial series must be stated in the six's
  `Haagerup.DominatedKernel` terms. The tail hypothesis must come from the polynomial contour certificate through the Schur specialisation. The two interval kernels must
  be converted into each other. The new slot needs this bridge between the two developments, which state domination
  and intervals separately.
- **Honest size.** A PR of 30-odd added modules, about 0.6 MB of hand or generated Lean besides the 19 MB data
  module. It needs one new native fact (the mixed head), a kernel-checked polynomial contour certificate with the
  Schur specialisation, and a bridge of a few hundred lines. The cell tree was written and built on the
  branch, not on master, so the porting work is mostly re-import and the bridge.
- **Risks.** (1) `CellData.lean` at 19 MB must elaborate within a hosted runner's 16 GB. The branch's own build
  record should be checked first; if it does not fit, the check needs the heavy runner. (2) The Schur specialisation
  to the cell pair (CELL_TAIL.md §2) is a paper derivation, author-checked only, and has not been formalised. (3) Since #645 the article's ancillary package
  is decoupled from the repository, so the six's interval kernel `HaagerupKernel` may be changed; a bridge on the
  `Grothe` side still keeps the kernel library small (a change to a precompiled library rebuilds every importer). (4) Ledger 5.6 records as an open decision whether master's upper bound should depend on the cell
  tree of a closed PR; no decision has been made.

## Replay

On a machine with numpy, scipy, mpmath and python-flint 0.9 (the droplet `yo`, 4 cores, 26 November 2026), from
`research/upper-channels/code/`:

```sh
./fetch_sources.sh SRC                     # src6/, src18/ under SRC (pinned commits)
ln -s SRC/src6 src6; ln -s SRC/src18 src18
python3 channels.py out 4                  # the 24 channel vectors (< 1 min)
python3 eighth-channel/columns.py SRC out COLUMNS.json          # six + five selector columns + eighteen (2 min)
python3 eighth-channel/eighth.py SRC COLUMNS.json eighth-channel/eighth.json   # control, (a), (c), (d) (1 min)
python3 eighth-channel/refl_cubic.py eighth-channel/refl.json 121 120 0 0.01 0.02 0.05 0.1 0.15 0.2 0.3   # (b)
python3 eighth-channel/refl_lp.py SRC COLUMNS.json eighth-channel/refl.json eighth-channel/refl_lp.json
python3 eighth-channel/contour_check.py     # exact contour certificates, standard library only (< 1 s)
```

`COLUMNS.json` (0.96 MB) is not kept: it is rebuilt in two minutes. The logs `eighth.log`, `refl.log`,
`refl_lp.log` and `contour_check.log` are kept next to the JSON files.
