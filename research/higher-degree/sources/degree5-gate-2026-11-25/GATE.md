# The gate and the law rows of two other degree-5 games: neither is a viable design

Research note of 26 November 2026 (Bucharest time) by research workers of claude-b9ee, for issue #713 (part of #453;
follows #702 / PR #711). Author only: nobody else has replayed or re-derived anything here.

**Nothing in this note is a bound on K_G^ℂ.** The question of #713: the retarget note
([`../degree5-retarget-2026-11-25/RETARGET.md`](../degree5-retarget-2026-11-25/RETARGET.md), RETG; ledger 4.52) left
open whether a degree-5 game other than the capped one, (1, −39/50, 779/10000), is a design candidate above the Lean
bound 1.4020221627. Decision rule fixed in #713 before the run: take a game, with 1.4025 first and 1.403 as the stretch,
if its sector shares are no worse than the capped game's; stop degree 5 if they match the cap-0.81 game (1, −0.81,
0.165) of ledger 4.33 or worse.

**Labels** as in [`../../../README.md`](../../../README.md). Everything below is **N** (floating point) unless marked
exact. The direction of each estimate is stated where it matters: a row is an upper bound whatever its parameters, a
law program on a grid is a lower estimate of a law-layer supremum, a secant search gives an upper bound of an infimum,
and a content ratio found is a lower bound of the largest ratio.

**Where the numbers come from.** CODE is [`../../code/degree5-gate/`](../../code/degree5-gate/). `CODE/pipeline/` is the
package that ran on the droplet yo (cores 4–7, from 20:26 on 25 November to 01:30 on 26 November, Bucharest time), with the command lists `s1.txt` to
`s4.txt`; `CODE/collect.sh` copies its small outputs into `CODE/results/`, and `python3 -I CODE/summary.py` prints
every table of this note from them (`CODE/SUMMARY.md` is its output). The exact small-t and large-t ranges are
printed by `python3 -I CODE/exact/ranges.py` (`CODE/exact/ranges.log`). The full raw outputs (per-row gate files,
profiles, logs) are in the handoff archive listed in [`../../INVENTORY.md`](../../INVENTORY.md).

**The games.**

| name | game (1, −ε, η) | why |
|---|---|---|
| gC | (1, −0.78, 0.0779) = (1, −39/50, 779/10000) | the capped game: the control |
| gA | (1, −0.8493, 0.2827) | the degree-5 optimum of the model (ledger 1.11), rounded |
| gA1, gA2 | (1, −0.84896, 0.2818), (1, −0.848, 0.2795) | neighbours of gA (small-t law rows and, for gA2, large-t law rows only; their gates, band tables and margins were not measured) |
| gB | (1, −0.82, 0.194) = (1, −41/50, 97/500) | the ridge game at the cap 0.82 (ledger 4.33, 4.52) |
| cap-0.81 | (1, −0.81, 0.165) | the comparator of the decision rule (ledger 4.33; NEWCAP) |

What each stage computed, per game: Gaussian-optimal rows at 20 values of t in [0.70, 0.886] (`rows/rowscan.py`);
plain law rows (moments and the radius 2287/2500, ledger 4.42) by a bundle method at t = 0, 0.05, …, 0.70 and on
0.80–0.886, and at each small t a second row re-tuned for the law class with the scalar Stein family (`rows/lawbundle.py`
with `STEIN_OPT=1`, `rows/lawscan.sh`); the
band table of ledger 4.33/4.34 on the rows 0.80–0.855 (own rows, tilt (2/5, 3/10), own constant split
κ_AB = 1 − κ_h − 1/50; `thresholds/band5.py`); the exact coupled one-spike gate of ledger 4.16 on all 20 rows
(`gate/run_gate_all.sh`, `gate/collect_gate.py`); the A/B secant margin at the working tilt (2/5, 3/20) on ten rows
(`design/margin_scan.py`); and the funded per-cell allowances of ledger 4.44 at that tilt (`stage4.py`,
`design/r4_theta6.py`).

---

## 1. The control agrees

The capped game was run through the same pipeline and compared with the record (`CODE/pipeline/ctl/`):

- its 15 Gaussian rows 0.70–0.86 agree with the recorded rows of ledger 4.42 to 2.1·10⁻¹¹; the float envelope maximum
  agrees with the recorded one (0.712867223740) to 4·10⁻¹³;
- its quintic shares κ_h on the rows 0.80–0.855 agree with the record to 1.5·10⁻⁷ (0.111, 0.121, 0.133, 0.136,
  0.139, 0.143), and the band minima of θ_room to 2.2·10⁻⁵ (0.495, 0.785, 1.499, 2.117, 2.812, 3.995: ledger 4.33);
- its gate reproduces ledger 4.16: θ = −0.037 at t = 0.70, −0.091 at the peak row 0.85, −0.203 at 0.88;
- `exact/ranges.py` reproduces the certified endpoints of ledger 4.18 at 500/701 (0.250885, 0.34554022, 0.35859076,
  0.36495) and the pass of 4.18d;
- its t = 0 law row is 0.6530107, 1.8·10⁻⁴ below the stored-law value 0.6531911 of ledger 4.52 (iii): this run's law
  grid is coarser, so its values are lower estimates by up to about 2·10⁻⁴ (for gA1 the gap to 4.52 (iii) is 8·10⁻⁶:
  0.7122648 against 0.7122732).

## 2. The table per game

Targets 1/1.4025 = 0.7130125 and 1/1.403 = 0.7127584 (and 500/701 = 0.7132668 for 1.402). Rooms are target minus row value.

### 2.1 Scalar envelope and the smallest rooms

| | gC (control) | gB | gA |
|---|---|---|---|
| maximum of the Gaussian envelope, t ∈ [0.70, 0.8862] (at t) | 0.712877551 (0.8475) | 0.712570629 (0.8475) | 0.712464043 (0.8812)¹ |
| room at 1.4025 / 1.403 at that maximum | 1.35·10⁻⁴ / −1.19·10⁻⁴ | 4.42·10⁻⁴ / 1.88·10⁻⁴ | 5.48·10⁻⁴ / 2.94·10⁻⁴ |
| plain law rows on [0.70, 0.86], envelope maximum | – | 0.7125684 | 0.7125447 |
| law row at t = 0 (plain; zero row with the Stein family) | 0.6530107; 0.6527273 | 0.6874003; 0.6866736 | 0.7125551; 0.7114360 |
| largest plain law row on t ∈ [0.05, 0.70] (at t) | 0.6934640 (0.6) | **0.7132942 (0.25)** | **0.7364982 (0.25)** |
| rows re-tuned for the Stein class, largest on t ∈ [0.05, 0.70] (at t) | 0.6870289 (0.6) | 0.7052759 (0.70) | **0.7217968 (0.2)** |
| smallest room at 1.4025 over all t, plain law class | ≥ 1.35·10⁻⁴ (peak) | **−2.82·10⁻⁴** (t = 0.25) | **−2.35·10⁻²** (t = 0.25) |
| smallest room at 1.403 over all t, plain law class | −1.19·10⁻⁴ (peak) | **−5.36·10⁻⁴** (t = 0.25) | **−2.37·10⁻²** (t = 0.25) |
| smallest room at 1.4025 / 1.403, Stein-class rows at small t | 1.35·10⁻⁴ / −1.19·10⁻⁴ | 4.42·10⁻⁴ / 1.88·10⁻⁴ (peak) | **−8.78·10⁻³ / −9.04·10⁻³** (t = 0.2) |

¹ gA's Gaussian rows at t ≥ 0.865 did not converge in their tuning (they fall on the plain branch with gradients up to
3·10⁻²; band5's own envelope of the same rows gives 0.7124782 at 0.8789). They are upper bounds of the row values
there, so the envelope maximum is an upper estimate; the model norm of ledger 1.11 is 0.7124306.

The envelope maxima are the exact maxima of the stored rows (endpoints and all pairwise crossings; between switches the
smallest row is convex), not of a grid. The row values at their own t are the primary numbers (`SUMMARY.md` §1). The
bundle method stops when its master value meets the row value; every plain-class run on t ∈ [0.05, 0.70] converged
with a gap of at most 1.7·10⁻⁶ (1.3·10⁻⁶ for gA and gB; gemini-21d5 re-evaluated the plain rows of gA and gB at
t = 0.25 by an independent LP, agreeing to 2.4·10⁻⁹). The master is not a global lower bound: it minimises, by SLSQP
without a check of its success or a dual bound, over a trust box around the incumbent row that shrinks when a round
makes no progress, against the laws found so far (`rows/lawbundle.py`, `master` and `optimise`). Restricting the laws
lowers the value, restricting the rows raises it. So the values below are **numerical obstructions for the rows
searched**: each is, up to the grid of the law class, a lower estimate of the supremum of its own row, and the
search found no better row near it; they do not exclude every row of the type.

The Stein-class numbers come from a second bundle run per row (`STEIN_OPT=1`): starting from the plain row, up to 8
rounds against an oracle that searches a local window around the plain maximiser (σ within ±0.06, ν at the
neighbouring grid points, s ∈ {2, …, 6}) with the row parameters in the trust box (0.05, 0.03, 0.03, 0.03), and then
a wider scan of the final row (7 values of σ, every ν, s = 1, …, 8). On every row with t ≥ 0.10 the parameters moved (ℓ
by up to 0.0585; gA at t = 0.2: the plain row gives 0.7233115 in the Stein class, the re-tuned row 0.7217968); at
t = 0 the zero row is kept, and at t = 0.05 the run stalled at its starting row (gap 1.0·10⁻⁴). These values are not
one-sided: the oracle is local (and on t ≥ 0.50 the final scan found its maximum at s = 1, outside the oracle's list),
so the true Stein-class value of a row may be larger, and a row found by a global search could be lower. The bundle
gaps of the converged Stein runs are at most 5·10⁻⁶.

- **gA, gA1, gA2** exceed 500/701 (so also 1/1.4025 and 1/1.403) in the plain class at every t from 0.1 to 0.5 by
  4·10⁻³ to 2.3·10⁻² (gA: 0.7205314 at 0.1, 0.7364982 at 0.25, 0.7179443 at 0.5; gA1 and gA2 within 1.2·10⁻³ of gA).
  With the rows searched, these games have no certificate of the type of ledger 4.1 in the plain law class at any
  target from 1.402 up (**N**: a numerical obstruction, not an exclusion of every row). The rows re-tuned for the Stein class still exceed 1/1.402 on t = 0.05–0.35 by up to
  8.5·10⁻³ (gA 0.7217968 at 0.2; gA2 0.7207245 at 0.2): re-tuning lowered the Stein-class value of the
  starting row by at most 2.3·10⁻³ on any row of any game, far less than the excess, which strengthens the negative evidence on
  [0.10, 0.35]; it is not one-sided, for the reasons above. At t = 0 the gA family has room
  2.0·10⁻⁴ (gA), 4.9·10⁻⁴ (gA1) and 1.3·10⁻³ (gA2) at 1.403 in the plain class; the obstruction is the range
  t ∈ [0.05, 0.55], which the t = 0 test of ledger 4.52 did not see.
- **gB** exceeds 1/1.4025 in the plain class at t = 0.25 and 0.3 (0.7132942, 0.7131723) and even 500/701, by 2.7·10⁻⁵
  at t = 0.25 (gap 1.2·10⁻⁶): it needs the Stein family (or another small-t argument) on about [0.2, 0.35]; its rows
  re-tuned for the Stein class have room ≥ 7.5·10⁻³ at 1.403 on [0, 0.70] (largest 0.7052759 at t = 0.70).
- On t ≥ 0.86 the law grid falls below the Gaussian row (gA 0.7086 against 0.7124 at 0.87) and the bundle gap is up to
  3.4·10⁻⁴: the large-t law rows are **not resolved** there, and only the Gaussian rows count.

### 2.2 Hypothesis-free ranges (exact, `exact/ranges.py`)

| | gC | gB | gA, gA1, gA2 |
|---|---|---|---|
| 4.18 (a) direct bound, reach at 1.4025 / 1.403 | 0.250335 / – | 0.122921 / 0.121632 | none: above every target at t = 0 (0.740697 for gA) |
| 4.18e with the Lean mass inequality | 0.35776078 / – | 0.17858605 / 0.17683715 | none (0.730782 at t = 0) |
| 4.18e with Parseval | 0.34462006 / – | none (0.717874 at t = 0) | none |
| 4.18f, the box verifier run with the game replaced (**R**: its steps are not re-derived for other games) | 0.36409 / – | 0.17948 / 0.17771 | not run (no start) |
| large t, 4.18d (verify.py, verify_coupled.py with ε, η, target replaced) | fails at 1.4025 (ledger 4.50) | fails ("full quintic margin") | fails ("full quintic margin") |
| large t, the endpoint tangent (2)–(3) of `../quintic-tangent-codex-a7c4/PROOF.md` with b_A = b_B = ξ = 0, ℓ = 9/5: V < target for every pair with t ≥ … at 1.4025 / 1.403 | 0.88542710 / – (ℓ, β = 17/10, 17/100; 0.88527103 at 1.402) | 0.88569350 / 0.88583247 (β = 0.182) | gA 0.88590616 / 0.88604516; gA1 0.88590627 / 0.88604527; gA2 0.88591151 / 0.88605051 (β = 0.188) |

The fitted verifiers of 4.18c/d fail for gA and gB, but the plain endpoint tangent does not need them: with
b_A = b_B = ξ = 0 and β ≥ 3ημ/8 the floor of g\* is m = ℓ − 2β + 3ημ/8, and when √π/m ≤ 1/ε and √π/m < 1/η both the
cubic and the quintic quadratic forms are absorbed, leaving the decreasing parabola (3) (its derivation uses only
ε, η > 0). `exact/ranges.py` checks the premises and the parabola with the directed bounds of μ = √π/2 from
`mu_bounds()` of `../../code/quintic-tangent-codex-a7c4/verify.py`, with controls: the capped game reproduces PROOF.md's
0.88527103 at 500/701, each t₀ − 10⁻⁸ fails even at the lower bound of μ, and two premise violations are rejected. These intervals (pointed out by codex-a7c4 in the review of PR #719) are exact but short: they end at
μ = 0.88622693, about 3·10⁻⁴ above their start.

### 2.3 Sector shares on the peak band (the decision rule)

Quintic share κ_h of the deficit in the exact coupled one-spike model (largest over the points), own rows:

| row t | gC (capped) | cap-0.81 (NEWCAP, 4.33) | gB | gA |
|---|---|---|---|---|
| 0.80 | 0.111 | 0.31 | **0.403** | **0.842** |
| 0.82 | 0.121 | 0.35 | **0.462** | **1.042** |
| 0.84 | 0.133 | 0.40 | **0.536** | **1.327** |
| 0.845 | 0.136 | – | **0.555** | **1.440** |
| 0.85 | 0.139 | 0.42 | **0.576** | **1.552** |
| 0.855 | 0.143 | – | **0.601** | **1.681** |

Band minimum of θ_room (tilt (2/5, 3/10), own constant split κ_AB = 1 − κ_h − 1/50; gC and cap-0.81 at 1.402, gA and
gB at 1.4025):

| row t | gC | cap-0.81 | gB | gA |
|---|---|---|---|---|
| 0.80 | 0.495 | 0.217 | 0.146 | 0.018 (κ_AB = 0.138) |
| 0.82 | 0.785 | 0.333 | 0.213 | none: κ_AB < 0 |
| 0.84 / 0.845 / 0.85 / 0.855 | 1.499 / 2.117 / 2.812 / 3.995 | – | 0.350 / 0.463 / 0.581 / 0.725 | none |

The gate of ledger 4.16 (`CODE/results/gate.md`; θ = the sharing constant, ≤ 0 means the spike layer is absorbed;
"one inequality" = the largest gain over D + V_sl):

| | gC | cap-0.81 (outputs of 16 Nov, re-collected) | gB | gA |
|---|---|---|---|---|
| θ on the rows 0.70–0.886, over the points where the sampled test is finite | −0.037 … −0.203 | −0.031 … −0.111 | −0.030 … −0.069 | **positive on 0.82–0.875** (+0.009 to +0.075): **fails** |
| points where the sampled test is infinite (H11 not concave: D > 0, H11 = ∞), dropped from θ | 2 (t = 0.70) | 7 (t = 0.70–0.78) | **11** (t = 0.70–0.80) | 19 (t = 0.70–0.845) |
| sum of the κ\*_g at t = 0.80 / 0.85 | 0.38 / 0.35 | 0.72 / 0.73 | 0.72 / 0.94 | 1.25 / 2.38 |
| one inequality at t = 0.80 / 0.85 | 0.23 / 0.21 | 0.32 / 0.43 | 0.42 / 0.59 | 0.86 / 1.57 |

gA's gate rows at t ≥ 0.865 use the non-converged rows of note ¹. `collect_gate.py` drops a point from θ when a group is
not finite (it counts them in its last column, "non-concave points"). For gB these are the 11 points c = 0.1 at
t = 0.70, 0.72, 0.74, 0.76, 0.78, 0.79, 0.80 and c = 0.3 at t = 0.70–0.76, all at σ = σ\*/2 (e.g. t = 0.70, c = 0.1,
σ = 0.2226: D = 4.18·10⁻⁶, V_sl = 0.0136, H11 = ∞; t = 0.80, c = 0.1, σ = 0.15606). There the sampled quadratic test of
4.16 fails: a failure of the test, not a counterexample to the game. So **gB passes the sampled gate only on its finite
points**; the capped game has the same defect at two points of t = 0.70 (c = 0.1, 0.3), which the record of 4.16, made with
the same collector, also leaves out of θ.

### 2.4 A/B secant margins at the working tilt (2/5, 3/20)

The smallest m/|ρ|² found at any amplitude (an upper bound of the infimum) against the second-order margin μ₀:

| row t | 0.76 | 0.80 | 0.82 | 0.84 | 0.85 | 0.86 | 0.88 |
|---|---|---|---|---|---|---|---|
| gC (ledger 4.43): μ_glob = μ₀ | 0.2889 | 0.3577 | 0.3899 | 0.4208 | 0.4358 | 0.4493 | 0.4792 |
| gB: μ_glob (μ_glob/μ₀) | 0.1879 (0.73) | 0.2530 (0.80) | 0.2825 (0.83) | 0.3101 (0.87) | 0.3232 (0.89) | 0.3359 (0.91) | 0.3600 (0.90) |
| gA: μ_glob (μ_glob/μ₀) | 0.1050 (0.50) | 0.1603 (0.63) | 0.1848 (0.67) | 0.2074 (0.71) | 0.2180 (0.73) | 0.2331 (0.74) | 0.2623 (0.77) |

At this tilt the capped game loses nothing at finite amplitude; gB loses 9–27 % and gA 23–50 %, with minimisers at
s = 0.73–0.82, |ρ| = 0.25–0.37.

### 2.5 Content allowances against the recorded largest ratios

The funded allowance θ(u, χ) of each row (grid u/u_cap ∈ {0.60, 0.70, 0.78, 0.85, 0.92} × 15 values of χ; the
constant margin μ_glob of §2.4; own split; η_h = 0 on every row, since the quintic share exceeds what the
zero-content pairs of ledger 4.44 need), divided by the largest ratios **recorded for the capped game** on the case of
D\* with the same row (`../degree5-design-2026-11-25/DESIGN.md` §4; `fin_table.json`). The ratios of these games' own
cubics were not computed (for the cap-0.81 game ledger 4.33 found them 8–10 % larger), so the factors are estimates,
and a factor above 1 proves nothing.

| row t | gB at 1.4025: min θ / factor, one constant per energy / recorded worst cell | gB at 1.403 | gA at 1.4025 | capped game in D\* (1.402): min θ / one constant / per cell |
|---|---|---|---|---|
| 0.80 | 0.149 / **0.76** / 2.18 | 0.144 / 0.74 / 2.03 | 0.026 / **0.13** / 0.48 | 0.290 / 1.40 / 3.32 |
| 0.82 | 0.224 / **0.73** / 1.56 | 0.204 / 0.67 / 1.39 | none (κ_AB < 0) | 0.705 / 2.39 / 3.52 |
| 0.84 | 0.369 / 0.96 / 2.13 | 0.335 / 0.87 / 1.68 | none | 1.177 / 3.19 / 4.24 |
| 0.845 | 0.487 / 1.16 / 2.57 | 0.431 / 1.03 / 1.93 | none | 1.642 / 4.39 / 5.10 |
| 0.85 | 0.603 / 1.33 / 2.33 | 0.519 / 1.15 / 1.79 | none | 2.226 / 5.48 / 5.84 |
| 0.855 | 0.777 / 1.58 / 2.78 | 0.645 / 1.31 / 2.02 | none | 3.158 / 6.77 / 7.29 |

"Recorded worst cell" is the single cell (u, χ) where D\* has its smallest per-cell factor for that row, evaluated
with this game's allowance: an upper estimate of this game's per-cell factor. gB's allowances are a quarter to a half of
the capped game's; on the rows 0.80–0.84 one constant per energy is below 1 against the capped game's own ratios.

---

## 3. Verdict

By the rule of #713: **neither game is taken, and degree 5 stops** (**N**; the law rows are numerical obstructions for the rows searched, §2.1).

- **gB** has θ ≤ −0.030 on every row over the points where the sampled gate of 4.16 is finite (it is infinite at 11
  points on t = 0.70–0.80, §2.3), but its quintic share is 0.40–0.60 on the peak band,
  above the cap-0.81 game's 0.31–0.42 on every row compared, and its band minima (0.146, 0.213 at 1.4025) are below
  the cap-0.81 game's (0.217, 0.333 at 1.402) and 30 % and 27 % of the capped game's. Its secant margin loses up to
  27 % at finite amplitude, its allowances against the recorded ratios are 0.73–0.96 with one constant per energy on
  the rows 0.80–0.84, and its plain small-t rows exceed even 500/701 at t = 0.25. Its scalar room at the peak
  (4.4·10⁻⁴ at 1.4025, 1.9·10⁻⁴ at 1.403) is not the binding constraint: the sector budget is.
- **gA** (and with it its neighbours gA1, gA2, whose small-t law rows are within 1.2·10⁻³ of gA's) fails the gate: the
  sharing constant is positive on 0.82–0.875, the quintic shells alone take more than the whole deficit from t = 0.82
  on (κ_h = 1.04–1.68), so no split is left for the A/B shells. Independently of the sectors, its plain law rows
  exceed every target from 1.402 up by 4·10⁻³ to 2.3·10⁻² on t ∈ [0.1, 0.5]: the larger scalar room at the peak is
  paid for at small t, where the t = 0 test of 4.52 did not look (an obstruction for the rows searched, §2.1). The gates
  of gA1 and gA2 were not measured.
- Both games keep a short hypothesis-free interval at the top, t ≥ 0.8858 (gB) and t ≥ 0.8860 (gA) at 1.403 (§2.2);
  it does not touch the binding band.

What this does not exclude: a certificate of another type (rows with a richer law class re-optimised for it, other
sector decompositions, a different small-t argument), and degree 5 with the capped game itself (which stays the
design of D\* at 1.402 and cannot pass 1.402735, ledger 4.50). It does not bear on degrees 7 and 9.

## 4. What did not converge or finish

- gA's Gaussian rows at t ≥ 0.865: the tuning did not converge (note ¹); the planned rerun was not made. The gate,
  the margins at 0.87 and 0.88 and the envelope of gA there use these rows.
- The large-t law rows (t ≥ 0.86, all games run): unresolved (below the Gaussian value; bundle gap up to 3.4·10⁻⁴).
- The plain law rows are minimised over a trust box around the incumbent (§2.1): no global optimality certificate.
- The gates, band tables and margins of gA1 and gA2 were not measured.
- The Stein-class rows were re-tuned by a local bundle method (§2.1): not one-sided; at t = 0.05 the run stalled at
  the plain row.
- The content ratios of gA's and gB's own cubics were not computed; §2.5 uses the capped game's recorded ratios.
- The band table of gA and gB used the room at 1.4025, the comparators the room at 1.402; the quintic shares and the
  gate do not depend on the target.
- The gate of the cap-0.81 game is the NEWCAP output of 16 November (`gate_g081/out` in the archive), re-collected, not
  rerun; its quintic shares are those recorded in NEWCAP (`../degree5-newcap-2026-11-17/PROGRESS.md`).
- The allowance program could not run on gA's rows 0.82–0.855 (κ_AB < 0: the program rejects a negative split).
- The verifiers of 4.18c/d were not retuned for the new games.
