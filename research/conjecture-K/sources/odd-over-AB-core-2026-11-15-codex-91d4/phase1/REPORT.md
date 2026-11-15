<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-over-AB-core-2026-11-15/phase1/REPORT.md, 2026-11-15 11:45; Agent-ID: codex-91d4. -->
# Phase 1 result: the proposed O_U bound is false under the stated caps

Agent-ID: **codex-91d4**. 15 November 2026. [Issue #430](https://github.com/agalatan/grothendieck-lean/issues/430).
For **claude-b9ee** to review. Author-only **P+C**, not a Lean result.

The requested common-trial inequality at `kappa_O=0`,

```
J_odd(E,O) <= (1/100)||rB-(5053/10000)rA||^2 + 1/20000,
```

has a genuine shared counterexample strictly inside both specified energy
caps. The certificate gives an odd gain greater than `.00021870`, against
an allowance less than `.000116077`. In particular the excess is greater
than `.0001`. **It is not possible to prove O_U as stated from these caps.**

This corrects the proposed target selected after Phase 0. Its sampled
passes were not a universal bound; full coefficient optimization found
a different configuration. The Phase 0 scalar assembly remains a valid
conditional implication, but its odd premise is now refuted. Compact (P)
is logically separate and remains codex-a7c4's work under #431.

This is a counterexample to the inequality on the class of genuine cubics
satisfying the caps. Realizability by a single bounded common response is
not asserted. The example is not a Conjecture K or absolute L5
counterexample: its absolute payoff is numerically well below S.

## Exact witness and domain

Let Z,Y be independent standard circular complex Gaussians, T=|Z|^2 and
S_Y=|Y|^2. Use the peak constants from the task. Set

```
q  = (57/5000) Y(S_Y-2),
rA = (133/1000)Y,
rB = (21 sqrt(2)/200)Y,
O  = -i[(63/1000)Z(S_Y-1)
        +(53/10000)conj(Z)Y^2 +(7/5000)Z(T-2)].
```

Thus q is a nonzero genuine H_(2,1) cubic, Q is centered H_(1,1),
P is H_(2,0), and the task's normalized nu coefficient is
`-i(7 sqrt(2)/5000)`. All remote fields share Y. There are only two
complex Gaussian coordinates, so one finite-dimensional example refutes
the proposed every-dimension statement.

The six orthogonal sector energies are exactly

```
(q,A,B,Q,P,nu) =
(3249/12500000, 17689/1000000, 441/20000,
 3969/1000000, 2809/50000000, 49/12500000).
```

Their sum is `2201401/50000000=.04402802 < .080051`;
`u=.00025992 < .0463`; and the weighted sum is
`6802843/150000000=.0453522866667`. At t=.84 the ellipsoid cap is
approximately `.0456557978125`, with rigorous slack greater than
`.0003035`. These are exact rational checks, with a fresh rational
Machin-series enclosure of pi, in `verify_candidate_inputs.py`.

Write `rho=5053/10000`, `R=rA+rho rB`, `U=rB-rho rA`,
`xi0=-(3/5)R`, and `X=L+E-xi0`. For this witness,

```
||R||^2 = .043277821402464799...
||U||^2 = .006607661566045200...
W=||O||^2 = .0040291.
```

The exact algebraic allowance is enclosed from above by
`.000116076615660453 < .000116077`, using rational brackets for sqrt(2).

## What is certified

The functional being bounded from below is precisely

```
J_odd = inf_(c in C) {
 |c|^2 + E[|X+O-cZ|+|X-O+cZ|-2|X|] - pW }.
```

The remote trial stays fixed at xi0, exactly as required by O_U. The
visible coefficient c is one arbitrary global complex number. The
certificate handles its **entire infimum**; it does not merely evaluate
a trial value, use a numerical optimizer's success flag, or choose a
separate coefficient at each remote sample.

For any measurable support functions f+,f- with |f+|,|f-|<=1, define

```
Adual = Re E[(X+O)conj(f+) + (X-O)conj(f-)],
Kdual = E[conj(Z)(f+-f-)].
```

The complex norm's support inequality and an exact completion of the
square give

```
J_odd >= Adual - |Kdual|^2/4 - 2 E|X| - pW.       (D)
```

This is the key lower-bound direction. Piecewise constant supports are
proposed numerically, but their membership in the unit disk is checked
using outward arithmetic. No optimizer premise is accepted.

Simultaneous circular rotation reduces the integral to Y=r>=0 and
Z=x+iy, with independent densities `2r exp(-r^2)` and
`exp(-x^2-y^2)/pi`. Real even coefficients and imaginary odd coefficients
permit reflection across y=0, provided the supports are exchanged and
conjugated. This makes Kdual purely imaginary; no visible degree of
freedom is lost in (D).

On the finite box `x in [-5,5], y in [0,5], r in [0,5]`, the certificate
uses 320 x 160 x 160 cells, covering the whole box. Fresh Arb enclosures
of one-dimensional Gaussian moments through degree six evaluate the
polynomial cell means and second moments. On each cell, conditional
Cauchy-Schwarz gives `Ecell |X| <= sqrt(Ecell |X|^2)`. The supports vanish
outside the box, and a polynomial Gaussian-tail bound includes the
entire omitted baseline norm; its upper bound is below `1.368e-10`.

The cell sums and norm bounds use strict directed binary64 interval
arithmetic, with contraction/fast-math disabled. The final outward
diagnostic decimal displays for the original witness are

```
J_odd lower bound     .00021870581398379229...
O_U allowance upper   .00011607661566045215...
excess lower bound    .00010262919832334015... > 0.
```

The acceptance test compares interval endpoints with an outward enclosure
of the exact rational `1/10000`, so it does not treat rounded decimal
prints as exact lower bounds. This certifies failure of the proposed bound. The weak rational
inequalities in the opening paragraph leave room for rounding of the
displayed decimal values. Proof and precise replay instructions are in
`certification/`; input-cap checks are separate from the payoff checker.

## Numerical cross-checks and absolute payoff (N only)

The same exact candidate was evaluated by independent deterministic
radius rules and scrambled Sobol integration:

| Method | Common-trial gain | Excess over O_U allowance |
|---|---:|---:|
| Radius 64 x 64 x 144 | about .0004618053 | about .0003457287 |
| Radius 96 x 96 x 192 | .0004616987713 | .0003456221557 |
| Radius 128 x 128 x 256, bounded batches | .0004617578121 | .0003456811964 |
| Sobol 2^20, seed 9151 | .0004622906922 | .0003462140765 |
| Sobol 2^20, seed 9157 | .0004617378211 | .0003456612054 |

The rigorous lower bound is deliberately weaker than these values.
The numerical calculations are cross-checks, not inputs to (D)'s
acceptance certificate.

At the 128 radius rule, the absolute common-trial baseline is
`F_xi0(E)=1.335601406250034` and the common-trial perturbed payoff is
`1.336063164062130`, about `.03789036` below S. At the 96 rule, allowing
the full remote retained optimization gives

```
hatLambda(E)   = 1.3283964789295832
hatLambda(E+O) = 1.3285084764359953.
```

These values explain the scope: retaining the actual even-core deficit
in a direct absolute estimate may still succeed. The refuted incremental
allowance spends too little of that deficit at this core. The alternative
Phase 0 scalar allocations were not odd theorems either.

The different comparison
`hatLambda(E+O)-hatLambda(E) <= .01||U||^2+50e-6`, which permits remote
reoptimization on both sides, is **not refuted by this certified result**.
At this witness its numerical left side is about `.0001119975`, slightly
below the `.0001160766` allowance. That alternative remains open; the
fixed-common-trial proof cannot silently be transferred to it.

An even simpler Q-only example with q=P=nu=0 also fails O_U numerically
in `numerics/subset_results.json`. The nonzero-q witness above is
the one used for the main rigorous certificate.

## Status and handoff

The requested positive O_U theorem has been replaced by its certified
negation on the cap-relaxed domain. No change to compact (P), no revised
global odd theorem, and no proof of L5 is claimed. All new artifacts stay
under this `phase1/` folder, leaving the Phase 0 package and its hashes
unchanged. The new aligned-core derivative and shared-chaos tail lemmas
in `analytic/` are optional byproducts, not a proof of O_U.

The complete fresh isolated replay passed exact input checks, the
countercertificate, and all eight rejection controls in **4.06 seconds**.
See `replay-codex-91d4-final/REPLAY_RESULT.json`. Two other workers
independently re-derived the dual/moment/tail steps and replayed the
certificate; their reviews are `analytic/CERTIFICATE_REVIEW.md` and
`numerics/INDEPENDENT_CERTIFICATE_REVIEW.md`. This remains within-session
review, not claude-b9ee's external review.

The first root replay already passed the mathematical certificate but
exposed a rejection-test harness dependency on a saved coarse grid. That
dependency was removed; the final replay generates the coarse grid afresh.
The original failure receipt is retained in `replay-codex-91d4/` for
provenance. The mathematical checker and certified inequality did not change.

The unused source worktree and branch `codex-91d4/odd-ab-phase1` were
removed after handoff. Main remains clean; no owned jobs are running.
Issue #430 records the certified refutation and remains open for review
and a revised all-sector approach, with ownership/status labels released.
