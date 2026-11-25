# The degree-5 programme above the cubic bound: the capped game at higher targets, the ceiling of degree 5, and 1.403

Research note of 25 November 2026 (Bucharest time) by a research worker of claude-b9ee, for issue #702 (part of #453).
Author only: nobody else has replayed or re-derived anything here.

**Nothing in this note is a bound on K_G^ℂ.** The degree-5 design (ledger 4.17, 4.41–4.49) was made for the target
500/701, that is K > 1.402. Lean now proves K > 1.4020221627 with the cubic identity-tail witness, so that target is
obsolete. This note computes (1) what the present capped game can give at higher targets, exactly; (2) what any
degree-5 game can give, in the model and with the losses that a certificate of the present type cannot avoid; (3)
what degrees 7 and 9 add; and (4) answers the question "can we reach 1.403?".

**Labels** as in [`../../../README.md`](../../../README.md): **P**, **C**, **N**, **open**; "exact" means rational
arithmetic on stated inputs. A model norm is the payoff of explicit pairs: it bounds the norm of a game from
**below**, so 1/N bounds what that game can certify from **above**. A search over games ends at a local optimum, and the
reciprocal of the payoff found against one game is an **upper** estimate of what that game certifies; it says nothing
about other games. Only the linear program over the pool of pairs (written LB below) bounds every game of a family,
within the response families of the pool and the accuracy of the stored pair coefficients. A
floating-point law program on a grid gives a **lower** estimate of a law-layer supremum.

**Where the numbers come from.** Every number is printed by a script in
[`../../code/degree5-retarget/`](../../code/degree5-retarget/README.md) (written CODE below); `bash CODE/replay.sh`
replays the exact part and rebuilds every table from the committed result files. "Ledger x.y" is
[`../../STATUS.md`](../../STATUS.md); "K x.y" is [`../../../conjecture-K/STATUS.md`](../../../conjecture-K/STATUS.md);
"IT x.y" is [`../../../identity-tail/STATUS.md`](../../../identity-tail/STATUS.md). DSGN is
[`../degree5-design-2026-11-25/DESIGN.md`](../degree5-design-2026-11-25/DESIGN.md), D\* its design (ledger 4.44),
H0–H9 the hypotheses of its assembly theorem (ledger 4.45).

Units: a game value or row bound V is compared with the target value 1/K\*; a **room** is a difference of such
values. Near K = 1.4027, a change of 10⁻⁴ in K is a change of 5.08·10⁻⁵ in V.

---

## 1. The capped game (1, −39/50, 779/10000) at higher targets

Source: `CODE/exact/retarget_exact.py`, output `CODE/exact/retarget_exact.log` (exact rational arithmetic; about 8
seconds). Inputs: the 26 certified row constants of ledger 4.42 (**C**, author only), the 21 pieces of D\*, the funded
parts of ledger 4.44, and the verifiers of ledger 4.18a, 4.18c, 4.18d, 4.18e and 4.18f, imported or copied with the
target as the only change. Each copy is first checked against the endpoint that its verifier certifies at 500/701.
The design has no identity tail, so its target is the plain value 500/701; the conversion B = (1 − ν)B̂ + ν of the
cubic witness ([`docs/CONSTANTS.md`](../../../../docs/CONSTANTS.md)) has no counterpart here.

### 1.1 The envelope: this design of the capped game cannot give more than 1/B₅ = 1.4027346…

The maximum over the 21 pieces of D\* of the row bounds is

    B₅ = 0.7128931980346…   (ends of piece 13, row 0.845 on [0.842337, 0.847521]),    1/B₅ = 1.4027346631…,

and it equals the maximum on [0.81, 0.886227] of the lower envelope of all 26 rows, so no other assignment of these
rows lowers it. **With zero cost in every sector, this design (these 26 row constants) proves K > x only for x < 1/B₅**
(1402734/10⁶ < 1/B₅ < 1402735/10⁶: six-decimal floor 1.402734, outward six-decimal ceiling 1.402735, which is the one
to quote as a ceiling; exact given the row constants, **C**, author only). The model norm of the game is
0.7128677, 1/N = 1.402785 (ledger 1.10, **N**; 0.7128679 in §2.1), so the law layer and the interval covers cost
2.5·10⁻⁵ of value at the binding rows. That no certificate for this game, of any design, proves more than 1.402785
rests on the numerical pair behind that norm (**N**), not on the exact envelope.
**1.403 is out of reach of this design of the capped game** by 1.35·10⁻⁴ of value on these rows (exact), and of the
game itself by 1.09·10⁻⁴ if the numerical pair behind its model norm is accepted (**N**).

### 1.2 The rooms of D\* at the targets 1.4021, 1.4023, 1.4025, 1.4027

Rooms in units of 10⁻⁴; in brackets the room left after the funded part η_h of ledger 4.44 (pieces 1–11: the whole
gain of the zero-content pairs at the upper end of the piece). All exact.

| piece | row | η_h | 1.402 | 1.4021 | 1.4023 | 1.4025 | 1.4027 |
|---|---|---|---|---|---|---|---|
| 1 [0.6490, 0.6700] | 0.740 | 10.374 | 83.445 [73.071] | 82.936 [72.562] | 81.919 [71.545] | 80.902 [70.528] | 79.885 [69.511] |
| 2 [0.6700, 0.6900] | 0.760 | 8.477 | 55.987 [47.510] | 55.479 [47.002] | 54.461 [45.984] | 53.444 [44.967] | 52.428 [43.951] |
| 3 [0.6900, 0.7100] | 0.760 | 8.749 | 66.643 [57.894] | 66.135 [57.386] | 65.117 [56.368] | 64.100 [55.351] | 63.084 [54.335] |
| 4 [0.7100, 0.7300] | 0.780 | 6.794 | 41.301 [34.507] | 40.792 [33.998] | 39.775 [32.981] | 38.758 [31.964] | 37.742 [30.947] |
| 5 [0.7300, 0.7500] | 0.790 | 5.933 | 33.748 [27.816] | 33.240 [27.307] | 32.223 [26.290] | 31.206 [25.273] | 30.189 [24.256] |
| 6 [0.7500, 0.7700] | 0.800 | 5.069 | 26.430 [21.361] | 25.921 [20.853] | 24.904 [19.835] | 23.887 [18.818] | 22.870 [17.802] |
| 7 [0.7700, 0.7900] | 0.810 | 4.219 | 19.357 [15.139] | 18.849 [14.630] | 17.831 [13.613] | 16.814 [12.596] | 15.798 [11.579] |
| 8 [0.7900, 0.8100] | 0.820 | 3.394 | 12.639 [9.245] | 12.130 [8.736] | 11.113 [7.719] | 10.096 [6.702] | 9.080 [5.685] |
| 9 [0.8100, 0.8143] | 0.810 | 4.368 | 11.563 [7.195] | 11.054 [6.686] | 10.037 [5.669] | 9.020 [4.652] | 8.003 [3.635] |
| 10 [0.8143, 0.8248] | 0.820 | 3.469 | 7.403 [3.934] | 6.894 [3.425] | 5.877 [2.408] | 4.860 [1.391] | 3.843 [0.374] |
| 11 [0.8248, 0.8349] | 0.830 | 2.630 | 4.735 [2.105] | 4.226 [1.596] | 3.209 [0.579] | 2.192 [−0.438] | 1.175 [−1.455] |
| 12 [0.8349, 0.8423] | 0.840 | 0 | 3.998 | 3.489 | 2.472 | 1.455 | 0.439 |
| 13 [0.8423, 0.8475] | 0.845 | 0 | 3.736 | 3.227 | 2.210 | 1.193 | 0.176 |
| 14 [0.8475, 0.8524] | 0.850 | 0 | 3.736 | 3.227 | 2.210 | 1.193 | 0.176 |
| 15 [0.8524, 0.8574] | 0.855 | 0 | 3.857 | 3.348 | 2.331 | 1.314 | 0.297 |
| 16 [0.8574, 0.8630] | 0.860 | 0 | 4.381 | 3.872 | 2.855 | 1.838 | 0.821 |
| 17 [0.8630, 0.8667] | 0.865 | 0 | 5.392 | 4.883 | 3.866 | 2.849 | 1.832 |
| 18 [0.8667, 0.8724] | 0.870 | 0 | 6.368 | 5.859 | 4.842 | 3.825 | 2.809 |
| 19 [0.8724, 0.8786] | 0.875 | 0 | 8.437 | 7.928 | 6.911 | 5.894 | 4.877 |
| 20 [0.8786, 0.8841] | 0.880 | 0 | 11.099 | 10.590 | 9.573 | 8.556 | 7.540 |
| 21 [0.8841, 0.8862] | 0.886 | 0 | 13.896 | 13.387 | 12.370 | 11.353 | 10.336 |

| target | smallest room (pieces 13, 14; rows 0.845, 0.85) | part of the room at 1.402 | smallest room left after funding (piece 11, row 0.83) |
|---|---|---|---|
| 1.402 | 3.7356·10⁻⁴ | 100 % | 2.1047·10⁻⁴ |
| 1.4021 | 3.2269·10⁻⁴ | 86 % | 1.5960·10⁻⁴ |
| 1.4023 | 2.2097·10⁻⁴ | 59 % | 5.7878·10⁻⁵ |
| 1.4025 | 1.1928·10⁻⁴ | 32 % | none: −4.3813·10⁻⁵ (piece 11) |
| 1.4027 | 1.7617·10⁻⁵ | 4.7 % | none: −1.4548·10⁻⁴ (piece 11) |

The funded part η_h is the gain F(ηtγ) − F(ν₅) of the zero-content pairs (ledger 4.44); it does not depend on the
target, so on the pieces 9–11 it takes 44 %, 59 % and 82 % of the room at 1.4023 (38 %, 47 %, 56 % at 1.402), and
**from 1.4025 on the funded allocation of ledger 4.44 has no room on piece 11**: there the A/B sector would have a
negative allowance. (The funding with only the forced lower bound, 1.7320·10⁻⁴ on piece 11, is refuted as an
allocation in ledger 4.44; even that smaller part leaves 4.6·10⁻⁵ at 1.4025 and nothing at 1.4027.)

### 1.3 Where the hypothesis-free ranges stop

Small t (radius 2287/2500; the largest grid point at which the inequality of each verifier holds with the new target,
the next grid point failing it):

| target | 4.18a direct | 4.18c buffer | 4.18e Parseval | 4.18e mass | 4.18f spectral | width of H2: (end of 4.18f, 0.649) |
|---|---|---|---|---|---|---|
| 1.402 | 0.250885 | 0.25282 | 0.34554022 | 0.35859076 | 0.36495 | 0.28405 |
| 1.4021 | 0.250775 | 0.25271 | 0.34535633 | 0.35842487 | 0.36478 | 0.28422 |
| 1.4023 | 0.250555 | 0.25249 | 0.34498834 | 0.35809294 | 0.36443 | 0.28457 |
| 1.4025 | 0.250335 | 0.25227 | 0.34462006 | 0.35776078 | 0.36409 | 0.28491 |
| 1.4027 | 0.250115 | 0.25205 | 0.34425149 | 0.35742842 | 0.36375 | 0.28525 |

The first row reproduces the five certified endpoints. For 4.18f the verifier's adaptive box proof is run with the
target replaced, the boxes starting at the 4.18e mass cutoff rounded down to three decimals (0.358; 0.357 for 1.4025
and 1.4027), and the endpoint found by bisection on the 10⁻⁵ grid: it is the largest endpoint found with a failing
neighbour, not a proved maximum of that method. **The ranges move by 1.2·10⁻³ at most between 1.402 and 1.4027**: they
are limited by the method (the coefficient of t², the radius), not by the target.

Large t (ledger 4.18d; the smallest 8-decimal t from which the row's payoff is below the target up to √π/2, the
previous grid point failing with the lower bound of √π/2; the rows are those of the verifiers, not retuned, and their
absorption conditions do not involve the target):

| row | 1.402 | 1.4021 | 1.4023 | 1.4025 | 1.4027 |
|---|---|---|---|---|---|
| coupled tangent (PR #661) | 0.88425210 | 0.88431581 | 0.88444323 | 0.88457065 | 0.88469808 |
| split tangent | 0.88477644 | 0.88482322 | 0.88491677 | 0.88501031 | 0.88510385 |
| plain tangent | 0.88527103 | 0.88530225 | 0.88536468 | 0.88542710 | 0.88548951 |

The statement for small remote cubic energy u on [0.81, √π/2] (verifier of 4.18d, row 0.845 on [0.81, 0.86] and row
0.860 on [0.86, 0.886227]) holds for u ≤ 6.07·10⁻⁴, 5.71·10⁻⁴, 5.00·10⁻⁴, 4.29·10⁻⁴, 3.58·10⁻⁴ at the five targets on
the first interval (the published 3/5000 = 6·10⁻⁴ holds at 1.402 only), and for u ≤ 6.64·10⁻⁴, 6.27·10⁻⁴, 5.53·10⁻⁴,
4.79·10⁻⁴, 4.05·10⁻⁴ on the second.

Label of §1.1–1.3: exact, **C**, author only for what rests on the row constants; the end ranges inherit **P + C**
from ledger 4.18 for the method and are **C**, author only for the new endpoints.

### 1.4 What the open hypotheses must deliver at each target

- **H2** (V ≤ 1/K\* on (t₁, t_s) with no sector hypothesis): the uncovered interval is (0.36495, 0.649) at 1.402 and
  (0.36375, 0.649) at 1.4027; its width grows from 0.28405 to 0.28525. The target changes nothing of substance: the
  diffuse value of the tail row of ledger 4.49 is 0.011 to 0.080 below 500/701 on this range, against a change of
  3.6·10⁻⁴ of the target value.
- **H5** (the A/B secant inequality) does not involve the target.
- **H6, H7** (the content law per cell and its law program): the allowances θ_j(u, χ) shrink with the room.
  §1.5 recomputes them.
- **H8** (the other sectors): what the zero-content pairs force is independent of the target, so its share of the
  room grows as in §1.2, and on piece 11 it exceeds the room from 1.4025 on. At those targets H8 cannot be met by
  funding; it would need the comparator at the pair's own quintic coefficient (repair (a) of DSGN §5.6), for which no
  content ratios were searched, or another row on [0.8248, 0.8349].

### 1.5 The allowances and factors of the funded design at each target (N)

Source: `CODE/theta/` (`FACTORS.md`, from `thetas.json` and `cells.json`). The allowance program of the design
(`r4_theta6.py`, one conic program per cell) was re-run on each piece with the room left at each target: 82 runs,
and 11 control runs that repeat the funded allocation at 1.402 on the pieces 1–11 and reproduce the design's factors
(ten of eleven to all digits, the eleventh to 5.8·10⁻⁴, inside the program's tolerance 10⁻²). The content ratios are
those of the design run (the c = 4 three-cluster family in 13 variables and the stored maximisers in 4 to 6
variables); they do not depend on the target. Factor = smallest allowance/ratio over the cells of a piece.

| piece | row | 1.402 | 1.4021 | 1.4023 | 1.4025 | 1.4027 |
|---|---|---|---|---|---|---|
| 1 | 0.740 | 2.76 | 2.76 | 2.74 | 2.73 | 2.72 |
| 2 | 0.760 | 2.78 | 2.77 | 2.74 | 2.72 | 2.69 |
| 3 | 0.760 | 2.97 | 2.96 | 2.95 | 2.93 | 2.92 |
| 4 | 0.780 | 2.98 | 2.96 | 2.93 | 2.90 | 2.87 |
| 5 | 0.790 | 3.05 | 3.03 | 3.00 | 2.96 | 2.93 |
| 6 | 0.800 | 3.13 | 3.11 | 3.07 | 3.03 | 2.99 |
| 7 | 0.810 | 3.20 | 3.18 | 3.13 | 3.08 | 3.02 |
| 8 | 0.820 | 3.23 | 3.20 | 3.13 | 3.07 | 3.01 |
| 9 | 0.810 | 3.18 | 3.13 | 3.05 | 2.97 | 2.89 |
| 10 | 0.820 | 3.18 | 3.12 | 3.03 | 2.93 | 2.82 |
| 11 | 0.830 | 3.46 | 3.38 | 3.22 | no room | no room |
| 12 | 0.840 | 4.24 | 4.11 | 3.91 | 3.67 | 3.43 |
| 13 | 0.845 | 5.10 | 4.91 | 4.54 | 4.18 | 3.84 |
| 14 | 0.850 | 5.84 | 5.62 | 5.20 | 4.78 | 4.37 |
| 15 | 0.855 | 7.29 | 6.96 | 6.30 | 5.72 | 5.10 |
| 16 | 0.860 | 10.28 | 9.70 | 8.60 | 7.55 | 6.60 |
| 17 | 0.865 | 22.33 | 20.36 | 16.68 | 13.54 | 11.15 |
| 18–21 | 0.870–0.886 | ≥ 32.8 | ≥ 32.8 | ≥ 32.8 | ≥ 32.6 | ≥ 22.9 |

(The column 1.402 on the pieces 12–21 is the design's own.) **The factors hardly move**: the allowance of a cell is
set mostly by the deficit of the laws of that cell, of which the room is a small part, so the smallest factor is 2.76,
2.76, 2.74 at 1.402, 1.4021, 1.4023, and on the pieces that still have room it is 2.72 and 2.69 at 1.4025 and 1.4027.
What ends the funded design is piece 11, where the funding takes the whole room from 1.4025 on (§1.2). As in ledger
4.44, **a factor above 1 proves nothing**: the ratios are lower bounds of the largest ratio from cubics in at most 13
variables (ledger 4.28 has growth up to n = 25), and the allowances are float programs inside a sufficient relaxation.

**Summary of §1.** For the capped game the target can be raised to 1.4023 at no visible cost in the numerical tests
(rooms 59 % of the present ones, factors unchanged, H2 and H5 unchanged), to 1.4025–1.4027 only with a new row on
[0.8248, 0.8349] or another treatment of H8 there, and never beyond 1/B₅ < 1.402735. The gain over the Lean bound
1.4020221627 would be 2.8·10⁻⁴ at 1.4023 and at most 7.1·10⁻⁴.

---

## 2. The ceiling of degree 5

### 2.1 The model value of the best game at each cubic weight (N)

Source: `CODE/ceiling/eps_profile.py`, result `eps_profile_K2.json` (26 minutes on two cores); table `CODE/LADDER.md`.
Games (1, −ε, b) without tail and (1, −ε, b) with an identity tail ν; for each ε on a list, a cutting plane over b
(and ν) against one shared pool of 549 explicit pairs. Oracles: the graded models W3 and Z2 (alternating best
responses, scored on the 96 × 96 × 64 grid), the exact preprocessed phase h∘ρ and the plain phase; these are the
families that bind at degree 5 in ledger 1.2, 1.3, 1.10 (Z3 and W3 + W5 stay below there; they were not re-run here).

**What "ideal" means.** U is the largest oracle payoff at the best game found; LB is the value of the linear program
over the pool, a lower bound of the model norm of *every* game of that line (fixed ε), within these response
families and up to the quadrature error of the pair coefficients (about 10⁻⁶; the grid reads about 10⁻⁶ high, ledger
1.10). So 1/LB is the largest K that any certificate for a game of that line could prove if the law layer and every
sector cost nothing and no further response binds; richer responses can only lower it. The gaps U − LB are below
10⁻⁶. The Gaussian-ideal row envelope of a game (the diffuse value that the design's rows are tuned to) agrees with
this norm to 2·10⁻⁶ (ledger 4.2; §2.3 below).

| ε | b (no tail) | N | 1/N | b, ν (tail) | N | 1/N |
|---|---|---|---|---|---|---|
| 0.74 | −0.0292 | 0.7133031 | 1.401929 | −0.0403, +0.0117 | 0.7132783 | 1.401977 |
| 0.752 | 0.0000 | 0.7131590 | 1.402212 | −0.0059, +0.0105 | 0.7131405 | 1.402248 |
| 0.76 | 0.0232 | 0.7130692 | 1.402388 | 0.0154, +0.0102 | 0.7130549 | 1.402416 |
| 0.77 | 0.0497 | 0.7129645 | 1.402594 | 0.0450, +0.0072 | 0.7129544 | 1.402614 |
| 0.78 | 0.0786 | 0.7128677 | 1.402785 | 0.0753, +0.0051 | 0.7128614 | 1.402797 |
| 0.79 | 0.1073 | 0.7127792 | 1.402959 | 0.1026, +0.0052 | 0.7127755 | 1.402966 |
| 0.80 | 0.1364 | 0.7126990 | 1.403117 | 0.1331, +0.0022 | 0.7126974 | 1.403120 |
| 0.81 | 0.1638 | 0.7126266 | 1.403259 | 0.1634, +0.0021 | 0.7126263 | 1.403260 |
| 0.82 | 0.1940 | 0.7125628 | 1.403385 | 0.1939, −0.0015 | 0.7125633 | 1.403384 |
| 0.83 | 0.2241 | 0.7125078 | 1.403493 | 0.2251, −0.0022 | 0.7125071 | 1.403495 |
| 0.84 | 0.2552 | 0.7124618 | 1.403584 | 0.2562, −0.0041 | 0.7124592 | 1.403589 |
| 0.85 | 0.2846 | 0.7124311 | 1.403645 | 0.2882, −0.0052 | 0.7124190 | 1.403668 |
| 0.86 | 0.3150 | 0.7125709 | 1.403369 | 0.3218, −0.0084 | 0.7123858 | 1.403734 |
| 0.87 | 0.3542 | 0.7130302 | 1.402465 | 0.3634, −0.0213 | 0.7124018 | 1.403702 |
| 0.88 | 0.4066 | 0.7139780 | 1.400603 | 0.4092, −0.0458 | 0.7125663 | 1.403378 |
| free | ε = 0.8493, b = 0.2827 | 0.7124306 | **1.403646** | ε = 0.8650, b = 0.3414, ν = −0.0162 | 0.7123833 | **1.403739** |

- **The ceiling.** Without tail the pool bounds every degree-5 game by LB = 0.7124304: **no degree-5 game certifies
  more than 1.403646** in this model (ledger 1.2 has 1.403648 by Richardson extrapolation; `docs/overview.tex` has
  the [P, C] ceiling 1.4036705 for degree ≤ 5). With an identity tail LB = 0.7123823: **1.403741** (ledger 1.3:
  1.40374; the best tail game saved has 1.403739). Both bounds have a short certificate in the stored score model:
  positive weights on three pool rows (four with a tail) cancel the free coefficients and give constants
  above 0.7124304398 and 0.7123823506 for every game, with no bounds on its coefficients (codex-a7c4, review of PR #711;
  `CODE/ceiling/pool_certificate.py`, exact Fractions on the stored decimals). What stays numerical is that the stored
  coefficients are those of unimodular pairs. The tail buys 4.7·10⁻⁵ of value at the optimum and at most 2.5·10⁻⁵ for ε ≤ 0.84 (below 10⁻⁵ from 0.78 to 0.84).
- **Sensitivity.** From ε = 0.78 to 0.82 the value falls by 7.6·10⁻⁵ per 0.01 of ε (1.5·10⁻⁴ in K), from 0.82 to 0.85
  by 4.4·10⁻⁵ per 0.01; the optimum is flat (0.84: 3.1·10⁻⁵ above the minimum). Past the optimum the plain phase binds
  and the value without tail rises steeply (0.86: 1.4·10⁻⁴ above). The best b follows b ≈ 2.94(ε − 0.752) to 0.006.
- **Against the cubic.** The pure cubic ceiling is 1.4022581233 ([P, C], K 12.2; model 0.7131355, the line ε = 0.752
  above gives 0.7131590 at its ε). The cubic with an identity tail has model norm 0.713021, 1/N = 1.402483, at
  (0.7681, 0.0235) (K §10, IT 3.1, **N**); the witness of the Lean bound, (191/250, 47/2000), has Gaussian rows at
  0.7131427 (1.402244) and a certifiable cap of 1.40212–1.40214 in its model (IT 3.1), of which Lean proves
  1.4020221627. So **the whole gain of degree 5 over the cubic family is 5.9·10⁻⁴ of value without tail (0.7130210 −
  0.7124306; 1.403646 against 1.402483) and 6.4·10⁻⁴ with it**, and the capped game (1, −39/50, 779/10000) uses
  1.5·10⁻⁴ of it (1.402785 against 1.402483).

### 2.2 What a certificate of the present type cannot avoid

**(a) The t = 0 test (exact; ledger 4.12).** Two statements must be kept apart. *The true test:* every row bound at
t = 0 is at least λ₁ρ\*², with ρ\* the unknown radius of the cubic chaos, so λ₁ρ\*² ≤ 1/K\* is necessary; a proved
ρ\* ≤ ρ₀ with λ₁ρ₀² ≤ 1/K\* is **sufficient** for it, and a failure with ρ₀ says nothing about ρ\*. *The ρ₀-relaxed law
layer:* a certificate whose t = 0 row is bounded over the law class with E√U ≤ ρ₀ (ledger 4.17, 4.42) has, by Jensen
(Ψ₅(s; ν) ≥ 2s), a row bound of at least λ₁ρ₀², so λ₁ρ₀² ≤ 1/K\* is **necessary for that certificate**. "Cap", "passes"
and "fails" below are in this second sense: they exclude a game for a certificate that charges ρ₀, not for every
certificate. With ρ₀ = 2287/2500 (K 3.7, **P + C**): λ₁ ≤ 0.85189 at 1.4027, 0.85171 at
1.403, 0.85140 at 1.4035, 0.85134 at 1.4036 (`CODE/exact/retarget_exact.log`, block 4). The optimum without tail
(ε = 0.8493) passes; the optimum with tail (ε = 0.865) does not, and for ν < 0 the remote-only pair scores at least
ερ\*², so the cap is no weaker for those games. **Under this cap the tail is worth 2.3·10⁻⁵ of K** (ε = 0.85:
1.403668 against 1.403645). With the radius 93/100 the cap is 0.8241 at 1.403.

**(b) A hypothesis-free start (exact given the games; `CODE/exact/ridge_direct.log`).** The direct bound of ledger
4.18 (a), V ≤ (1 − η)t² + ερ₀² + η²/(πε), holds for every game. Along the ridge of best games, at ρ₀ = 2287/2500:

| ε | η | ερ₀² | bound at t = 0 | reach at 1.4023 | at 1.4027 | at 1.403 |
|---|---|---|---|---|---|---|
| 0.78 | 0.0786 | 0.652750 | 0.655271 | 0.2505 | 0.2501 | 0.2497 |
| 0.80 | 0.1364 | 0.669487 | 0.676890 | 0.2048 | 0.2042 | 0.2037 |
| 0.81 | 0.1638 | 0.677856 | 0.688400 | 0.1719 | 0.1712 | 0.1706 |
| 0.82 | 0.1940 | 0.686224 | 0.700834 | 0.1234 | 0.1224 | 0.1216 |
| 0.83 | 0.2241 | 0.694593 | 0.713853 | none | none | none |
| 0.85 | 0.2846 | 0.711330 | 0.741662 | none | none | none |

**From ε = 0.83 on, this Gaussian-buffer estimate is above every target at t = 0**, so it gives those games no
hypothesis-free start. It is an upper estimate of the payoff: that it exceeds the target does not show that no
hypothesis-free bound exists, only that this one does not provide it. The other proofs of ledger 4.18 (b)–(f) and
4.46 are written for the capped game and were not re-derived for these games here. As things stand their small t
needs either law rows with a sector hypothesis from t = 0, or a sharper direct treatment of the clipped quintic payoff. Item (c) estimates such a law row at t = 0.

**(c) The law layer at the binding rows (N; `CODE/ceiling/LAW_ROWS.md`).** The row bound with zero sector cost (K₅ with zero allowance assumed), in the Gaussian ideal and in the plain law
class of ledger 4.42 (moments and the radius 2287/2500; no Stein family, no energy-dependent radius), by a float
program on grids (`CODE/ceiling/law_rows.py`): a **lower** estimate of the law-layer supremum.

| game (ε, η) | t | Gaussian ideal | law layer ≥ (payoff of a stored law) | below 1/1.403 = 0.7127584 by | direct bound at t = 0 for this game |
|---|---|---|---|---|---|
| (39/50, 779/10000), the capped game | 0 | 0.6128536 | 0.6531911 | 0.0596 | 0.655227 |
| (41/50, 97/500), the ridge game | 0 | 0.6442822 | 0.6874115 | 0.0253 | 0.700834 |
| (0.84896, 0.2818), the game of ledger 1.2 | 0 | 0.6670361 | 0.7122732 | 4.85·10⁻⁴ | 0.740234 |
| (0.8492868465, 0.2826657528), the optimum saved in §2.1 | 0 | — | 0.7125517 (the law of the line above, repriced) | **2.07·10⁻⁴** | 0.740680 |
| (0.848, 0.2795) | 0 | — | 0.7114554 (the same law, repriced) | 1.30·10⁻³ | 0.738980 |
| (39/50, 779/10000), row 0.845 | 0.845 | 0.7128559 | 0.7128580 | — | certified constant of the row: 0.7128737 |

**These are different games and must not be mixed.** At t = 0 the row parameters vanish, so the response integral of
a law does not depend on the game and the same stored law (σ = 0.775, ν = −0.024) can be repriced exactly: it pays
σ²(1/ε − 1/ε′) + ν²(1/η − 1/η′) more for the game (ε′, η′) (codex-a7c4, review of PR #711; `CODE/ceiling/law_table.py`
prints the lines). The t = 0 row moves by 0.83 per unit of ε: the 3.3·10⁻⁴ of ε between the game of ledger 1.2 and the
saved optimum cost 2.8·10⁻⁴ of value there, while their model norms differ by 10⁻⁷ (0.7124305 and 0.7124306 on the pool).

Each value is the payoff of an explicit law, stored with its atoms; `CODE/ceiling/law_table.py` replays the payoff and
the constraints of each. (The first version of this table had 0.7132886 for the optimum: the refinement step of the
program paired the response of one ν with the penalty of another. Found by codex-a7c4 and gemini-21d5 in the review
of PR #711; the program now asserts one column of Ψ per ν.)

- **At t = 0 the games near the optimum are not excluded and not shown to pass, and the saved optimum is bound
  there, not at the peak.** The law found keeps 12 % of its mass at q = 0 (the phantom atom of ledger 4.18 (b),
  4.35). For the saved optimum (ε = 0.8492868) it pays 0.7125517, above that game's model norm 0.7124306: **in this
  law relaxation the saved optimum certifies at most 1/0.7125517 = 1.403407, with at most 2.07·10⁻⁴ of room at 1.403
  and 4.61·10⁻⁴ at 1.4025**, before any sector cost. For (0.84896, 0.2818) the same row leaves at most 4.85·10⁻⁴ and
  for (0.848, 0.2795) at most 1.30·10⁻³ (its model norm on the pool is 0.7124399, 9·10⁻⁶ above the optimum's). All
  are lower estimates of a supremum over the plain law class (grids in σ, ν, E U² and U; a law optimised for one game
  and repriced for another; codex-a7c4's independent search found 0.7122738 for the first). So a design candidate
  near the optimum has ε at or below about 0.849, chosen with its t = 0 row; the capped game has 0.06 there and the
  ridge game 0.025. For all of them near the optimum the direct bound gives no hypothesis-free start (b), and the sector
  hypothesis is needed where its pure-cost premises fail for the capped game (ledger 4.16).
- **At the peak** the control reproduces the capped game's row 0.845: the law program is 2.1·10⁻⁶ above the Gaussian
  value and the certified constant 1.6·10⁻⁵ above the program (the interval covers). The loss of the law layer and
  its covers at the peak is taken from the exact certificate of the capped game: **2.5·10⁻⁵ on the envelope against
  the model norm**. For the uncapped game the record has a law gap of 1.5·10⁻⁵ at the peak with moments only (4.3).
- **Not computed**: the peak rows of the ridge game and of the games near the optimum in the law layer, any row of
  theirs between t = 0 and the peak, and a law optimised for each repriced game (which could only pay more).

### 2.3 Degree 5 with the unavoidable losses

Each line is one game with its own parameters. "1/N" is the reciprocal of the largest payoff of the pool of §2.1
against that game; "at the peak" subtracts the 2.5·10⁻⁵ measured on the capped game (an estimate for the others);
"t = 0 allows" is the reciprocal of the t = 0 payoff of §2.2 (c); the realistic value is the smaller of the two.

| game (ε, η) | ideal 1/N (**N**) | ρ₀-relaxed t = 0 test (exact) | start given by the direct bound 4.18 (a) at 1.403 (exact) | at the peak (estimate) | t = 0 allows at most (**N**) | realistic value | room at 1.403 | room at 1.4025 |
|---|---|---|---|---|---|---|---|---|
| (39/50, 779/10000), capped | 1.402785 | passes | t ≤ 0.2497 | 1/B₅ = 1.4027346 (exact, its design) | 1.5309 | below 1.402735 | none | 1.19·10⁻⁴ |
| (41/50, 97/500), ridge | 1.403385 | passes | t ≤ 0.1216 | 1.40334 | 1.4547 | 1.40334 | 1.7·10⁻⁴ | 4.2·10⁻⁴ |
| (0.848, 0.2795) | 1.403627 | passes | none | 1.40358 | 1.40557 | 1.40358 | 2.9·10⁻⁴ | 5.5·10⁻⁴ |
| (0.84896, 0.2818), ledger 1.2 | 1.403646 | passes | none | 1.40360 | 1.40396 | 1.40360 | 3.0·10⁻⁴ | 5.6·10⁻⁴ |
| (0.8492868, 0.2826658), saved optimum | 1.403646 | passes | none | 1.40360 | **1.403407** | **1.40341** | **≤ 2.07·10⁻⁴** | ≤ 4.61·10⁻⁴ |
| with tail at ε = 0.85 (η = 0.2882, ν = −0.0052) | 1.403668 | passes | none | 1.40362 | not computed | — | ≤ 3.1·10⁻⁴ | ≤ 5.7·10⁻⁴ |
| with tail, saved optimum ε = 0.865 | 1.403739 | fails (0.72389) | none | — | — | — | — | — |
| degree 7 at ε = 0.85 (§3.2) | 1.403702 | passes | not computed | 1.40365 | not computed | — | ≤ 3.3·10⁻⁴ | ≤ 5.9·10⁻⁴ |

For the games other than the capped one the rooms are upper estimates in a second way too: only the peak and t = 0
were looked at. **For a certificate of the present type the realistic ceiling of degree 5 is about 1.4036, reached
by games with ε between about 0.848 and 0.849 (room 2.9 to 3.0·10⁻⁴ at 1.403, 5.5 to 5.6·10⁻⁴ at 1.4025); the saved
optimum itself is limited to 1.40341 by its t = 0 row. Nothing computed here excludes a game of that range as a
design candidate.**

---

## 3. Degree 7 and beyond

### 3.1 The record

| degree | game | N | 1/N | ledger |
|---|---|---|---|---|
| 7 | (1, −0.906596, 0.541570, −0.242531) | 0.7121936 | 1.404113 | 1.4 (**N**) |
| 7 + tail | (1, −0.90861, 0.55426, −0.26737), ν = +0.00923 | 0.7121878 | 1.404124 | 1.5 (**N**) |
| 9 | λ₉ = (1, −0.93600, 0.72057, −0.59202, 0.23468) | ≥ 0.71214069 (**P + C**, author only); 0.71216039 (**N**) | < 1.404218; 1.404178 | 1.6, 2.6 |

Ideally, 1.403 leaves a room of 3.28·10⁻⁴ at degree 5 (3.75·10⁻⁴ with tail), 5.65·10⁻⁴ at degree 7 and 5.98·10⁻⁴ at
degree 9 (`CODE/LADDER.md`). With the model room of the present design at 1.402 (3.99·10⁻⁴, which is not known to
be enough), the targets would be 1.40286 at degree 5 (1.40295 with tail), 1.40333 at degree 7 and 1.40339 at degree 9.

### 3.2 Degree 7 under the t = 0 test (N for the games, exact for the test)

The t = 0 test of §2.2 (a) applies to degree 7 as to degree 5: a degree-7 row at t = 0 that drops the non-positive
terms (ledger 4.38 (i)) is bounded below by a₁ρ². The degree-7 optimum has λ₁ = −0.9066: it passes at 1.403 only if ρ\* ≤ √((1/1.403)/0.906596) = 0.88668, that is
within 4.5·10⁻⁴ of the conjectured sharp radius √π/2 = 0.886227 (K 3.6, open); the best proved radius is 0.9142
(K 3.7). So `CODE/ceiling/eps_profile.py` was run with `KDEG=3` at fixed ε (result `eps_profile_K3.json`, 18 minutes
on two cores; oracles W3, Z2, h∘ρ, plain phase; W5 and W3 + W5, which end within 1.3·10⁻⁶ of W3 at the degree-7
optimum in ledger 1.4, were not run, and richer responses can only lower these values):

| ε | degree 7: (b, c) | N | 1/N | degree 5 at the same ε: 1/N | radius needed at 1.403 |
|---|---|---|---|---|---|
| 0.78 | (0.0420, 0.0983) | 0.7128395 | 1.402840 | 1.402785 | 0.95593 |
| 0.82 | (0.1962, −0.0063) | 0.7125628 | 1.403385 | 1.403385 | 0.93232 |
| 0.85 | (0.3119, −0.0825) | 0.7124020 | 1.403702 | 1.403645 (1.403668 with tail) | 0.91572 |
| 0.88 | (0.4286, −0.1550) | 0.7122766 | 1.403949 | 1.400603 (1.403378 with tail) | 0.89997 |
| free: 0.9067 | (0.5450, −0.2523) | 0.7121933 | 1.404113 | — | 0.88661 |

(Every game and value is selected on the final shared pool: among the games visited, the one with the smallest
max(largest oracle payoff when visited, largest payoff over the final pool); `CODE/ceiling/rescore.py`, after the
reviews of PR #711. Only the free problem without tail changed: its first incumbent, visited at 0.7121927, pays
0.7122040 against a pair found later, and the game of iteration 9 is selected instead, with 0.7121933. That problem
did not converge (gap 3.8·10⁻⁶): the pool bounds every degree-7 game without tail by LB = 0.7121895, 1/LB = 1.404121;
ledger 1.4 has 1.404113. With a tail the values change by at most 2·10⁻⁶ at fixed ε; the free optimum with tail is
0.7121876, 1.404125, as ledger 1.5.) **For a certificate whose law layer charges ρ₀ = 2287/2500 (ε ≤ 0.8517 at 1.403, §2.2 (a)), degree 7 is
worth 1.4037, not 1.4041**: at ε = 0.85 it gains 2.9·10⁻⁵ of value over degree 5 (1.7·10⁻⁵ over degree 5 with tail),
and at ε = 0.82 nothing. The step from degree 5 to degree 7 recorded in ledger 1.9 (2.4·10⁻⁴) is bought entirely with
cubic weight above 0.85: in such a certificate it needs a proved radius of 0.900 for ε = 0.88 (1.40395) and 0.8866 for the optimum; the true
test needs the same of ρ\* itself.

*Degree 9 has its own condition.* There the necessary inequality of ledger 4.38 keeps the ninth-degree projection
(the term −a₄‖P₅,₄f‖²): by Parseval ρ\*² ≤ (B + a₄)/(a₁ + a₄), which for λ₉ of ledger 1.6 (a₁ = 0.936, a₄ = 0.23468) and
B = 1/1.403 is ρ\* ≤ 0.89961 (the ledger's 0.899374 is for B = 250/351); a certificate that drops the ninth-degree
term at t = 0 needs the stronger √(B/a₁) = 0.87263. Both thresholds are below the best proved upper bound of the
radius (0.9142), so the proved bound gives neither. This is for the one degree-9 coefficient vector λ₉; no other
degree-9 game was tested.

**So for a certificate of this type that charges ρ₀ = 2287/2500, degree 7 does not make 1.403 easier**: in the stored
score model every degree-7 game with ε ≤ (1/1.403)/ρ₀² = 0.85171 has norm above 0.7123933909 without tail and
0.7123931399 with one, that is at most 1.403719 and 1.403720 (exact weights on three and four pool rows that cancel
the free higher coefficients, the weighted cubic coefficient being positive; codex-a7c4, review of PR #711;
`CODE/ceiling/pool_certificate.py`), against 1.403646 and 1.403741 for degree 5 without that cap: a room of at most
3.6·10⁻⁴ at 1.403. For the tested λ₉ the same holds; other degree-9 games were not examined.

---

## 4. Answer and recommendation

### 4.1 Can we reach 1.403?

**With the capped game: no.** Its design gives at most 1/B₅ < 1.402735 (exact from the row constants, **C**, author
only); that no other design of the same game does better than 1.402785 rests on a numerical pair (**N**).

**With a degree-5 game: not excluded, not supported; my judgement is that it is unlikely, and one computation
would decide whether it deserves a design.** The evidence, with its level:

1. *The ceiling* (**N**, one-sided: the pool bounds every game from below within its response families; [P, C] for
   the bound 1.4036705 without tail): 1.403646 without tail and 1.403741 with one, for every game (pool certificate, §2.1);
   1.40367 with a tail inside the ρ₀-relaxed cap. The room at 1.403 for the law layer and **all** sectors on **all** t
   is 3.28·10⁻⁴ in the model and about 3.0·10⁻⁴ after the law-layer loss measured on the capped game (an estimate).
2. *A game just below the optimum is a possible design candidate; the saved optimum is not the one.* All pass the
   ρ₀-relaxed t = 0 test (exact). The t = 0 row in the plain law class moves by 0.83 per unit of ε (**N**, lower
   estimates, §2.2 (c)): it leaves at most 2.07·10⁻⁴ at 1.403 for the saved optimum (ε = 0.8492868), which that row
   limits to 1.40341; at most 4.85·10⁻⁴ for (0.84896, 0.2818); at most 1.30·10⁻³ for (0.848, 0.2795), whose peak
   leaves 2.9·10⁻⁴. No row is shown to pass.
3. *What could still fail for it.* (i) No bound computed here gives it a hypothesis-free start (§2.2 (b)): the range of small t that
   is proved up to 0.365 for the capped game starts from nothing, with a room of at most 4.85·10⁻⁴ at t = 0 for (0.84896, 0.2818), instead
   of 0.06, and the sector hypothesis is needed exactly where its pure-cost premises fail for the capped game
   (ledger 4.16). (ii) Its sector costs are not measured. At the cap 0.81 (**N**, ledger 4.33) the band minimum of
   the content allowance is 0.42–0.44 of the capped game's, the quintic shells take 0.31 of the deficit at t = 0.80
   against 0.11 and the two-variable ratios are 8–10 % larger; nothing is measured above 0.82. (iii) H2 on the middle
   range of t is open for every game.
4. *The room is smaller than the one in which the costs are not yet controlled.* The present design has
   3.74·10⁻⁴ at 1.402 (exact), with H2, H5, H6 and H8 open, H7 numerical and two allocations refuted (ledger 4.44,
   4.45); there the zero-content pairs force 1.7 to 4.1·10⁻⁴ of the room for the other sectors on the pieces 1–11
   (necessary lower bounds; the funded allocation sets 2.6 to 10.4·10⁻⁴ aside), and the content law has a numerical
   factor of 2.7 in at most 13 variables with ratios that grow with the number of variables.

So 1.403 at degree 5 asks for the sector costs of a game that is probably harder, on a longer range of t, to fit
into 3.0·10⁻⁴, when 3.7·10⁻⁴ is not yet known to suffice for the easier game. That is a judgement from **N** evidence
in both directions, not a theorem: no number computed here shows that a game just below the optimum fails. At 1.4025 the same game has
5.6·10⁻⁴ (1.5 times the present room).

**The computation that would decide viability**: the gate of ledger 4.16 for a game just below the optimum (the coupled one-spike
sector model on Gaussian-optimal rows for t from 0 to 0.886: the sharing constant θ, the shares of the quintic and
A/B shells, the zero-core scalar) together with float law rows on the same values of t at ρ₀ = 2287/2500. If θ ≤ 0
on the peak band and the law rows leave room on [0, 0.65], that game is a candidate with target 1.4025 to 1.403;
if the shares are those of the cap 0.81 or worse, it is not. Cost: rows and law layer about 10 CPU-hours (29 rows at
20 minutes), the gate about as much again with the scripts of `../degree5-capped-2026-11-16/` adapted to the game:
a day of four cores on yo, or two hours on a 48-core machine. It needs no certificate and no new mathematics.

**With degree 7 or 9: no advantage before a sharper radius** (§3.2; **N** for the games, exact for the test). In a
certificate that charges the proved radius the degree-7 value is 1.4037; its ideal 1.4041 needs a radius 0.8866 and
1.40395 needs 0.900. The ideal
rooms at 1.403 (5.65·10⁻⁴ at degree 7, 5.98·10⁻⁴ at degree 9) are 1.4 to 1.5 times the present model room (ideal values of single games, λ₉ being the only degree-9 vector tested); the
sector structure of those games (18 sectors at degree 5; three- and four-grade responses at degree 9, ledger 2.4,
2.6) is not designed.

### 4.2 What degree 5 can realistically aim at

The table reads the same data as targets: the largest K\* that leaves the model room of the present design
(3.99·10⁻⁴), and twice that room (what the halved allowance of ledger 4.33 suggests for ε ≥ 0.81).

| game | 1/N | K\* at the present room | K\* at twice that room |
|---|---|---|---|
| cubic + tail, best (0.7681, 0.0235) | 1.402483 | 1.40170 | 1.40092 |
| (1, −0.78, 0.0786) (the capped game) | 1.402785 | 1.40200 | 1.40122 |
| (1, −0.80, 0.1364) | 1.403117 | 1.40233 | 1.40155 |
| (1, −0.82, 0.1940) | 1.403385 | 1.40260 | 1.40181 |
| (1, −0.85, 0.2846) | 1.403645 | 1.40286 | 1.40207 |
| degree 5 + tail, saved optimum | 1.403739 | 1.40295 | 1.40217 |
| degree 7, ε = 0.85 | 1.403702 | 1.40292 | 1.40213 |
| degree 7, free (needs a radius 0.8866) | 1.404113 | 1.40333 | 1.40254 |

The Lean bound is 1.4020221627. **On these two assumptions a degree-5 certificate
lands between 1.4012 and 1.4029**: at best 9·10⁻⁴ above the Lean bound, and below it if the costs are those that
ledger 4.33 suggests for the stronger games. Neither assumption is a measurement of the costs of those games.

### 4.3 Recommendation

1. **Drop the capped game as the vehicle.** Its whole range above the Lean bound is 7.1·10⁻⁴ (to 1/B₅ < 1.402735,
   with zero cost), and the cubic family itself has 4.6·10⁻⁴ of unused model room above the Lean bound (1.402483).
2. **Do not fix a target yet; run the gate for two games first**: a game just below the optimum, with ε between
   0.848 and 0.849 chosen together with its t = 0 row (not the saved optimum, which that row limits to 1.40341), and
   the ridge game (1, −41/50, 97/500). The first has the larger rooms (2.9 to 3.0·10⁻⁴ at 1.403, 5.5 to 5.6·10⁻⁴ at
   1.4025, after the estimated law-layer loss) and no hypothesis-free start from the bounds computed; the ridge game has 1.7·10⁻⁴, 4.2·10⁻⁴,
   5.3·10⁻⁴, a proved start on t ≤ 0.12 and 0.025 of room at t = 0. The gate (§4.1) decides between them: if the
   optimum's sector shares on the peak band are no worse than the capped game's and its small-t law rows have room,
   it is the game, with 1.4025 as the first target and 1.403 as the stretch; if they are those of the cap 0.81 or
   worse, neither game has an advantage over the cubic witness and the degree-5 programme should stop.
   **1.403 should not be announced as the target before that computation.**
3. **The lemmas to prove first are those that do not depend on the game or the target**, because every variant
   needs them and §1 shows that the target hardly changes them:
   - *the radius of the cubic chaos* (K 3.6, 3.7): it sets the cap on λ₁ at every degree; 0.900 opens degree 7 at
     ε = 0.88 (1.40395), √π/2 opens everything; it also lowers every small-t law row (the 12 % atom at q = 0 exists
     because the class allows E√U up to ρ₀);
   - *the symmetrised spiked radius* (ledger 4.48, problem P7): ‖P₁,₀h‖² + ‖P₂,₁k‖² ≤ r₁² is a statement about pairs,
     not about a game, and it is what H2 lacks on the 0.284 of t that no method covers;
   - *the A/B secant inequality H5* (problem P2): target-free; one statement per row of a game;
   - *the content law H6 in every dimension* (problem P1): its numerical factor is the same 2.7 at every target, so
     the question is the growth with the number of variables (ledger 4.28), not the room.
4. **Lean, now, regardless of the answer** (statements that hold for every game (1, −ε, η) or every pair):
   - the transfer H0 for a game Σ_{k≤K} λ_k P_{k+1,k} with λ₀ = 1 (vector value → 1; K_G^ℂ ≥ 1/N), for every K;
   - the projection P₃,₂, the Wick polynomial e₃,₂ and its moments, with the Parseval facts the rows use;
   - the gate-free row inequality H3 with (ε, η) as parameters;
   - the direct bound of ledger 4.18 (a) with (ε, η, ρ₀) as parameters, and the elliptic lift
     ‖P₂,₁k‖² + (431/500)²t² ≤ ρ\*² of ledger 4.18e, which is about pairs only;
   - the radius 2287/2500 itself (K 3.7), which every use above takes as an input.
   **To wait**: every row constant, node cap and cover (they are per game and target), the endpoint arithmetic of
   ledger 4.18c, 4.18d and 4.18f (stated for (39/50, 779/10000) and 500/701; §1.3 shows how they move), and the
   sector layer.

### 4.4 What was not done

- The row envelope of a game other than the capped one was not built over all t; §2.2 (c) has the rows at t = 0 of
  three games and one peak row of the capped game. A complete float design of the game (1, −41/50, 97/500) (rows on 29
  values of t, law layer, margins, allowances and ratios as DSGN) is about 10 CPU-hours for the rows, margins and
  allowances and 2–3 hours on four cores for the ratio searches; its certified covers are about 65 CPU-hours
  (pipeline README): 16 hours on four cores of yo, or under 2 hours on a 48-core machine.
- Tail games were not run through the row engine (the row with a tail is ledger 4.49, a different potential).
- The pools have no Z3, W5 or multi-spike oracles; at degree 5 the record finds them below W3 (ledger 1.2, 1.10), at
  degree 7 within 1.3·10⁻⁶ (ledger 1.4). They can only lower the values of §2.1 and §3.2.
- The hypothesis-free end ranges were re-evaluated, not re-optimised, at the new targets.
