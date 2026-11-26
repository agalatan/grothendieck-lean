# An eighth channel for the seven-channel upper certificate

Agent-ID: claude-b9ee (worker), 26 November 2026. Issue [#723](https://github.com/agalatan/grothendieck-lean/issues/723).
Everything here has label **N** unless a row says otherwise: the LP optima are floating point. The values printed
at fixed weights are exact rational or interval evaluations of the given heads and allowances. The heads and
allowances are rigorous with one exception: the circle budget of a new cell copy rests on a float Schur mean
(ledger 4.4). A model value of D is not a bound on K_G^ℂ.

## Verdict

**The cell copy of #556 still gains about 1.18·10⁻⁵ on top of the seven channels of master.** With master's six
channels (as `Grothe/UpperSixExact` has them) plus one copy of the eighteen-channel branch's cell channel with
R = [a, −(1 − a)], the LP gives 1/D = 1.404544589757 at a = 23277/25000. Master proves 1.404556392, so the gain is
1.180·10⁻⁵. At a = 93079/100000 the value is 1.404544665526, a gain of 1.173·10⁻⁵. **The angular selector and the
six's channel 4 both get weight zero.** The candidate therefore has exactly six positive channels: master's channels
0, 1, 2, 3, 5 and the cell copy in slot 4. It needs no seven-channel assembly and no selector column.

No other candidate comes close. The four further selector columns of #681 gain 4.2·10⁻⁸ without the copy and 1.9·10⁻⁹
with it. The reflected cubic of #670 gains less than 10⁻⁹ in both settings (§2b). The eighteen GT and phase
channels of #556 add 6.4·10⁻⁷ beyond the copy (1/D = 1.404544028), but they need the GT comparison machinery.

## 1. Control

`columns.py` rebuilds master's six columns from the committed tables. It uses the replay of the angular-selector note
(`verify.six_columns`): the degree-20 first preprocessor, phase cutoff 320, other cutoffs 250 and the Lean tail caps.
It also rebuilds the selector column (17/100, R = 23/25 − (2/25)X) with `selector.py`. Master's weights
(`NumericParameters.weight`) and Lean's selector budget 162464451464/10¹⁵ give

    D = 0.711968565814489862,   1/D = 1.404556391975,

that is 2.6·10⁻¹² below the certified slope 711968565817136711740669035/10²⁷ (1/D = 1.404556391970). The research head of
the selector (`selector.py`, 2⁻³¹·2⁻³⁰ scale) and the Lean head (2⁻⁸⁹) differ by less than that. The LP re-weighting
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
| (a) 101 copies, 0.90 ≤ a ≤ 0.95 (step 1/2000) | 1.404544589102 | 1.180·10⁻⁵ | uses 931/1000 and 1863/2000 only | six_4, selector |
| (b) reflected cubic, preprocessors (p₂, −p₂), 0.01 ≤ ε ≤ 0.3 | see §2b | < 10⁻⁹ | | |
| (c) four selector columns of #681 (d = 1 unit, d = 3 twice, d = 4) | 1.404556349482 | 4.25·10⁻⁸ | the six, d = 3 (two columns), d = 4 | selector d = 1 (both) |
| (c) one d = 3 selector (3/20, 197/200) | 1.404556351700 | 4.03·10⁻⁸ | | selector d = 1 |
| (a)+(c) copy 93079/100000 + four selectors | 1.404544663627 | 1.173·10⁻⁵ | the d = 3 column with 39/40 at 4.7·10⁻⁶ | six_4, every other selector |
| (d) the eighteen channels of #556 | 1.404555820191 | 5.7·10⁻⁷ | | selector, 12 of the 18 |
| (d)+(a) eighteen + copy 93079/100000 | 1.404544028260 | 1.236·10⁻⁵ | | six_4, selector, 13 of the 18 |
| everything above | 1.404544028260 | 1.236·10⁻⁵ | | every selector |

**The scan over a** (seven + one copy, float LP) is sharply peaked. D = 0.7119685677 at a = 0.90,
0.7119690370 at 0.925, 0.7119739621 at 0.93, 0.7119731739 at 0.9325, 0.7119691109 at 0.935 and 0.7119685658 at 0.95.
The continuous optimum is a = 0.9310836 with D = 0.7119745488700 (1/D = 1.404544588830). Ledger 4.4 shows that the
committed contour (ρ = 109/100, budget 2) applies throughout 0.90 ≤ a ≤ 0.95. Every copy therefore carries the
allowance 889686/10¹⁵ of the eighteen-channel certificate (Hardy tail from index 126 plus the ceiling from 251).

**Replacement.** In the seven + copy LP the two zero weights are six_4 and the selector. Dropping any other channel
loses a lot. Without six_0 the LP falls to 1/D = 1.40495592. Without six_2 it falls to 1.40458766. Without six_1,
six_3 or six_5 it falls to 1.40454893, 1.40454757 or 1.40454860. The copy replaces the six's channel 4, the
reflected tiger map with R₄, and makes the selector redundant: with the copy present, the residual that the selector
cancelled is cancelled more cheaply. With the research allowance 4.83·10⁻⁵ the selector keeps weight 6.4·10⁻⁶ and
gains 2.9·10⁻¹⁰.

**What is truncation, what is exact.** The six heads, the selector heads and the copies' heads are exact intervals
(2⁻¹²⁸ or exact rationals). Every allowance pays for its whole tail: the six's Lean caps, the selectors' full Wiener
errors and the copies' Hardy tails from index 126. So the value at the printed weights is a lower bound on the model
D of those channels, up to the copy's circle budget. That budget is 2 against a float Schur mean of 1.18
(ledger 4.4). Even an allowance 2·10⁴ times larger (ρ = 1.05, budget 3: 1.8·10⁻⁵ per copy) costs only
1.0·10⁻⁶ in D at weight 0.055. Outward rounding of the weights costs < 10⁻¹². Only the LP optimality is
floating point: the dual feasibility tolerance is 10⁻¹⁰, and the float LP and the exact values agree to 4·10⁻¹³.

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
real, but energy moves to degrees above 121.) **No reflected-cubic column enters either LP**, singly or all seven
together. The float D is unchanged to 10⁻¹⁶ (seven: 0.7119685658149; seven + copy 23277/25000: 0.7119745484003).
The grades above degree 121 were not computed. Since |μ_n| is at most the energy at degree n, they change the column
by at most (1 − E_ε) + (1 − E_0) ≤ 9.1·10⁻³ in ℓ¹ (E: the energy to degree 121 in the log). At the phase channel's
weight of 1.6·10⁻⁴ this is at most 1.5·10⁻⁶ in D. That is a crude bound, not an observed effect. The finding stands
for the computed part: the perturbation moves the column along directions the LP does not use. A different
preprocessor pair might change that; it was not explored.

## 3. What a certificate would take (candidate (a), a = 23277/25000 or 93079/100000)

The gain (1.18·10⁻⁵) is six times the threshold. The new root would be a **six-channel** certificate in the form of
`Grothe/UpperSixExact`. Slots 0, 1, 2, 3, 5 keep their maps, preprocessors, heads, cutoffs (phase 320, others 250) and
Lean tail caps. Slot 4 becomes the cell pair of #556 with R = [a, −(1 − a)]. The bound would read
K_G^ℂ ≤ 1.40454459 (a = 23277/25000) or 1.40454467 (a = 93079/100000). The selector tree `Grothe/UpperSelector/`
would no longer be needed for the root.

- **Head and cutoff.** The cell head has 126 coefficients (indices 0–125). `convex_transfer_variable_ival` of
  `UpperSixExact` already takes a per-channel cutoff, so slot 4 takes cutoff 125 and its cap is the Hardy tail from
  126: 889686/10¹⁵ by the rational inequality the branch checks with `decide`. This removes the 6·10⁻⁹ cost that
  ledger 5.5(b) assumed for padding the head to 250.
- **What exists on the #556 branch** (commit `76c4647b`, kept by `refs/pull/556/head`; ledger 5.2). The cell tree is 26
  modules of `Grothe/UpperReplacement/`, about 0.53 MB of Lean plus the generated `CellData.lean` (19.0 MB). Then come
  the eight grade witnesses `HeadWitnessFacts/Group00`–`07` (native facts independent of R; about 35–40 CPU-minutes
  by the branch's document) and the root-table checks they use. Their imports outside that tree are on master today
  (`UpperChaos/Realise2`, `HardyHolo`, `HardyGaussianSound`, `SchurMainGaussian`, `HardyArcRegion`, `HardyReal`,
  `Haagerup/PhaseCoefficients`, `Upper/Residual`). The whole tree is 74 files (20.2 MB).
- **New native facts: two** (ledger 5.4). (a) One contour fact for the new R: `tubeQuarterOK` at radius 1.09001 and
  `quarterMeanOK` at ρ = 109/100, budget 2. Its float mean (`schur_tail.budget`, 2¹⁶ points, j = 0.425) is 1.1776 at 93079/100000
  and 1.1783 at 23277/25000. r_reg is 1.2042 and 1.2028. (b) One signed-head fact replacing the six's head fact. It
  covers the five six-type heads (`bivarT`, `HaagerupKernel` intervals) and the composed cell head
  (`HeadCompute.compose 126`, `GrotheKernel` intervals) against c and headCap.
- **Proof glue** (ledger 5.5). Summability and domination of the pair's radial series must be stated in the six's
  `Haagerup.DominatedKernel` terms. The tail hypothesis must come from the contour fact. The two interval kernels must
  be converted into each other. The new slot needs this bridge between the two developments, which state domination
  and intervals separately.
- **Honest size.** A PR of 30-odd added modules, about 0.6 MB of hand or generated Lean besides the 19 MB data
  module, two new native facts and a bridge of a few hundred lines. The cell tree was written and built on the
  branch, not on master, so the porting work is mostly re-import and the bridge.
- **Risks.** (1) `CellData.lean` at 19 MB must elaborate within a hosted runner's 16 GB. The branch's own build
  record should be checked first; if it does not fit, the check needs the heavy runner. (2) The contour fact for the
  new R has not been run in Lean: the float mean 1.18 leaves 70 % headroom, but the adaptive box enclosures have cost
  10–34 % over the float mean on the committed channels. (3) The six's interval kernel `HaagerupKernel` is kept
  standalone and byte-identical to the article's ancillary files (frozen article, `anc/`), so the bridge must live
  on the `Grothe` side. (4) The decision of ledger 5.6 stands: master's upper bound would depend on the cell tree of
  a closed PR.

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
```

`COLUMNS.json` (0.96 MB) is not kept: it is rebuilt in two minutes. The logs `eighth.log`, `refl.log` and
`refl_lp.log` are kept next to the JSON files.
