# Fixed-cubic witness audit and improved shoulder rows

Status: no global proof of `K_G^C > 1.402` is established here. A new unconditional exterior reduction is proved and exactly replayed: at the single fixed epsilon `299/400`, all actual unimodular responses with `t <= 1633/2000` or `t >= 433/500` have value below `713263/1000000 < 500/701`. Only the central interval `[.8165,.866]` remains. See `EXTERIOR_PROOF.md` and `certify_exterior_7475.py`; the replay is portable and needs only the frozen exact `inherited_rows.json` plus Python's standard library. The separate new shoulder computations below certify Gaussian benchmarks and exact conditional consumer budgets. Every universal all-sector inequality below remains open.

The remaining central interval now has a complete ten-row conditional consumer, documented in `CENTRAL_TEN_ROWS.md`. All ten Gaussian benchmarks are certified; each requested all-sector error is exactly `1/40000`. The minimum central consumer reserve is `69664580403/13099937500000000 > 1/200000`. If those ten explicit inequalities are proved, the existing exterior theorem immediately gives `K_G^C >= 1000000/713263 > 1.402`. The universal all-sector inequalities themselves are not proved by the benchmark replay.

## Current source state

GitHub master was read through the connector at commit `1fdb667315156057c49358bbe74a34ac6c869d12` (15 November 2026, 22:18 UTC), merging PR452. PR447 is merged at `e9b0a458d06e67e9a1eee1168e98f34ef577b3a0` and does not change the numerical lower endpoint. The local full-text audit used `/workspace/scratch/f307e93b3610/codex-c7e2-grothendieck`, with the newer master STATUS obtained separately.

The current proved Lean lower bound is

\[
 K_G^{\mathbb C}\ge\frac{1250000000}{891774069}>1.401700322371,
\]

not the earlier 1.401685 value. The target 1.402 requires a witness norm strictly below `500/701`.

At epsilon `1891/2500`, closing the central (P) and odd premises only establishes the needed all-sector inequality for one row. That row covers `t in [.84,.851]`. The tested transfer of the existing epsilon `.745` production rows still leaves `[0,.418]`, `[.618,.664]`, `[.696,.84]`, and `[.851,.863]`. These are failures of the transferred envelope, not evidence that any actual response violates the target.

The fixed cubic family has a certified recorded ceiling below 1.4022581233 (Gaussian construction external; generic cancellation arithmetic archived in Lean). A fresh numerical saddle calculation in the repository attains the model reciprocal 1.402258123278 near epsilon .7563721594. Thus a new operator is not forced by the target 1.402. It is forced by a target of 1.4045: the repository records degree-five and degree-seven family ceilings 1.4036705 and 1.4044895. An identity tail gives a numerical, uncertified model value about 1.402483.

## Meaning of the new inequalities

Fix epsilon `e=1891/2500`. For unimodular responses `f,g`, put `h=(f+g)/2`, `k=(f-g)/2`, rotate `P10 h=tZ`, and put `G=e P21 k`. For each row `(ell,beta)`, define `L=Z(ell+beta(T-2))` and

\[
\widehat\Lambda(G)=\inf_{\xi\in H_{1,0}}
\left(\|\xi\|_2^2+\mathbb E|L+G-\xi|+\mathbb E|L-G+\xi|\right)
-\|G\|_2^2/e.
\]

The inherited, proved row inequality is

\[
\operatorname{Re}\langle f,(P_{1,0}-eP_{2,1})g\rangle
\le t^2-2\ell t+2\beta^2/e+\widehat\Lambda(G).
\]

Consequently each following bound, if proved for all actual responses in the indicated interval, would settle that interval strictly below `500/701`.

| t interval | ell | beta | S upper (certified) | requested all-sector error | cap reserve |
|---|---:|---:|---:|---:|---:|
| [.81,.83] | .8157145 | .13489 | 1.330001610 | .00034 | > .0000009306 |
| [.83,.84] | .835 | .1402446 | 1.358309611 | .00015 | > .0000014716 |
| [.851,.86] | .8579534 | .1465599 | 1.392331071 | .00017 | > .0000065486 |
| [.856,.863] | .8684666 | .1494296 | 1.408031355 | .00027 | > .0000034926 |

All terminating decimals in the parameter/target columns denote exact rationals. The bound requested is `LambdaHat <= S_upper + error`, not merely the remote bound. For example, the second row requests precisely `LambdaHat <= 1358459611/1000000000`.

The exact reserve for the second row is `4877134233/3313977500000000`. Its maximal allowance after the displayed S upper bound is `501973759233/3313977500000000`. This doubles the former proposal's allowance of about .00007368. The first row's allowance improves from about .00021268 to more than .00034093.

The response-energy domains follow from the inherited Rice tangent and weighted Gram inequality. Throughout each row interval, respectively:

| t interval | remote u upper | total cubic energy upper |
|---|---:|---:|
| [.81,.83] | .075946174 | .129951707 |
| [.83,.84] | .056158935 | .096855562 |
| [.851,.86] | .035382334 | .061365690 |
| [.856,.863] | .030435524 | .052804153 |

The caps are outward rational roundings. The six-sector weighted energy constraint must also be retained:

\[
D=u/2+2E_A/3+4E_B/3+E_Q+E_P+8E_\nu/7
\le e^2(\pi/4-t^2).
\]

No independence of the remote coefficients is permitted. The first two energy domains exceed the central peak box, so a peak theorem alone does not imply these new premises.

## Certification and replay

Run `python certify_shoulders.py` in this directory with Python-flint 0.9.0. The accepted output is `certified_shoulders.json`; the complete run transcript is `certify_shoulders.log`.

The script encloses the Rice benchmark

\[
S=\sup_{v\ge0}\{2\mathbb E|Z(a+bT)+\sqrt v W|-v/e\}
\]

using Arb/Acb analytic integration at 100-bit precision on 256 intervals covering `[0,64]`, with explicit nonnegative Gaussian tails. Integration by parts eliminates the I1 term, and the finite-endpoint term is restored. Each maximizing variance is bracketed by rigorously opposite derivative signs. Concavity follows from the radial decreasing density of `Z(a+bT)` for positive `a,b`, radial convolution, and the heat identity; this is the same argument as the repository's rows-and-regions NOTES section 4. A tangent bound then gives the asserted S upper endpoint. The remaining endpoint comparison is exact rational arithmetic; convexity of the row quadratic covers every t in the interval, including its boundaries.

The search that proposed the rows is deliberately separate: `shoulder_search.py` and `shoulder_search.json` are floating-point only. They also suggest considerably looser sufficient all-sector errors on lower shoulders: about .01249 on [.696,.72], .00770 on [.72,.75], .00388 on [.75,.78], and .00199 on [.78,.80]. Those rows and their S values have not been interval-certified here and lie outside the main Conjecture-K profile box at the left end.

## A potentially useful response penalty

The repository already derives the weighted-Gram constraint retaining the two squares discarded by the usual row proof. For retained LambdaHat, only the h-square remains available. For every positive rational lambda,

\[
e\|P_{2,1}h+(\sqrt2\beta/e)H\|_2^2\ge
\lambda\left[D/e^2-(\pi/4-t^2)\right]
+\frac{e\lambda}{2(3e+4\lambda)}(t-4\beta/e)^2.
\]

Its positive part may be subtracted from the retained row. This is compatible with arbitrary shared remote coefficients and can be much larger than the approximately 1e-4 budget. The current production cover does not retain D, so this is not a free reduction of already-certified scalar caps. A new all-sector support estimate coupled to D is required. The larger full penalty includes the first-chaos square and must not be subtracted again from LambdaHat.

## Principal source paths

- `research/conjecture-K/STATUS.md`, rows 2.12b-d, 7.5.6, 8.1, 8.5-8.8, 12.1-12.2 and section 10.
- `research/conjecture-K/MONOGRAPH.md`, sections 1.2, 1.6, 1.7.
- `research/conjecture-K/sources/rows-and-regions-2026-11-15-codex-8d2f/REPORT.md` and `NOTES.md`.
- `research/conjecture-K/sources/response-penalty-2026-11-15-codex-9b17/PROOF.md` and `ALLOCATION.md`.
- `docs/overview.tex`, “Limits of the witness method”.
