<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-over-AB-core-2026-11-15/REPORT.md, 2026-11-15 11:21; Agent-ID: codex-91d4. -->
# Phase 0: use a coupled global bound; the pure shared-core comparison fails numerically

Agent-ID: **codex-91d4**. 15 November 2026. [Task #430](https://github.com/agalatan/grothendieck-lean/issues/430).
For **claude-b9ee** to review; author-only. Baseline master: `7ec0d234bae387f6a5789346b8db7b20309216ca`.

**Decision (N): do not certify a universal retained odd increment of at most
`5e-5` using only the stated energy and response-ellipsoid caps with arbitrary
sharing.** An explicit genuine shared Q/P perturbation inside those caps gives
`hatLambda(E+O)-hatLambda(E) = +0.0001241280` numerically. Thus no proposed
`kappa_O >= 0, eta_O <= 5e-5` survives this Phase 0 example. The conclusion is
numerical evidence, not an interval-certified counterexample. A rigorous
counterexample and the all-sector L5 bound are both still open.

**Recommended next statement:** a direct bound at the same remote trial as
#428, keeping the actual R/U core deficit and the coupled real Q/P/nu form.
The example is about `0.03985` below the benchmark S, so its positive odd
increment poses no numerical threat to the global target. Do not replace
the actual even-core reserve everywhere by its worst-case `49.36e-6` upper
bound. The compact premise (P) remains codex-a7c4's separate task; none of
its compact certification was duplicated here.

**Chosen proposed constants:** `kappa_O=0`, `eta_O=50e-6`, with the coupled
allowance `.01||U||^2`, `U=rB-.5053rA`, interpreted at the common remote trial
`xi0=-.6(rA+.5053rB)`. The **scalar absorption is P+C**: all 1,000 exact
energy cells give an even remainder `<49e-6` after ceding this U allowance,
so the two independent premises (P) and the new odd inequality would imply
`hatLambda(E+O)<S+99.36e-6`. The new odd inequality is **N/open**. All sampled
tests of it pass at kappa=0; kappa=.01 has a stable sampled failure.

Labels in this package: **P** means a written mathematical proof, author-only;
**C** means a replayed exact arithmetic check with its stated limited scope;
**N** means numerical evidence without a rigorous integration error bound.
No new Lean result or opposite-side review is claimed.

## 1. Genuine shared example (N payoff; P normalization; C caps)

For independent standard circular complex Gaussians Z,Y, let T=|Z|^2 and
S_Y=|Y|^2. Use the peak a,b,p from the task and

```
q  = (439/20440) Y(S_Y-2),
rA = (179/3500) Y,
rB = (439 sqrt(2)/3500) Y,
O  = i(37/1000) Z(S_Y-1) + i(7/1000) conj(Z)Y^2,
nu = 0.
```

Here q is a genuine H_(2,1) cubic, Q is centered H_(1,1), and P is H_(2,0).
Every remote field shares Y. Their squared energies, in order q,A,B,Q,P,nu,
are exactly

```
(2*439^2/20440^2, 179^2/3500^2, 2*439^2/3500^2,
 37^2/1000^2, 2*7^2/1000^2, 0).
```

Thus `u=.0009225655922`, `W=||O||^2=.001467`, total
`.0364698104902 < .080051`, and weighted energy `.0456248814356`.
At t=.84 the weighted cap is `.0456557978125`, leaving more than
`.000030916` rigorously. `check_exact_inputs.py` checks these facts with
rational arithmetic and a Machin-series enclosure of pi. The ellipsoid is
a necessary response constraint: **no realization by a single bounded
common response has been proved**.

The retained optimization includes both complex first-chaos coefficients,
`v_Z Z + v_Y Y`. All other coordinates can be removed by conditional Jensen.
The comparison is between two separately minimized functionals, not between
values at a frozen baseline multiplier.

| Independent calculation | Retained odd increment (N) |
|---|---:|
| Laguerre 64 x 64 radii, 144 phases | +0.0001229319920 |
| Radius Legendre 64 x 64, 144 phases | +0.0001241304941 |
| Radius Legendre 96 x 96, 192 phases | +0.0001241280049 |
| Scrambled Sobol 2^20, seed 812 | +0.0001247518074 |
| Scrambled Sobol 2^20, seed 191 | +0.0001247959289 |

The two finest radius rules differ by `2.49e-9`; the independent Sobol
discrepancy is about `0.67e-6`. Neither is an integration error certificate.
The optimizer residual only bounds optimization error for the discrete
objective; it does not bound quadrature or tail error.

On the finest radius rule,

```
hatLambda(E)   = 1.333983624083493
hatLambda(E+O) = 1.334107752088381
odd cost per energy = -0.0846135003
raw odd increment   = -0.0000324145522
```

The benchmark is approximately `1.37395352566`. The raw increment has the
opposite sign from the retained comparison. This is why optimizing the
baseline, shifting q by its remote first-chaos trial, and optimizing the
perturbed trial must all be represented explicitly.

## 2. What the Phase 0 searches cover (N)

These are sampled minima and selected counterexample searches, **not**
dimension-free worst-case bounds or exhaustive optimizations.

* The one-Y engine covers 67 initial named/random cores and 144 finite
  tests. A directed family adds 132 finite tests, including the individual
  Q, P, nu sectors and the full six-real-dimensional odd Hessian.
* The directed family comes from the exact conditional quadratic zero
  below. At Y=2.8 the full-amplitude pure Q test alone gives a retained
  increment about `+89.4e-6`; the simpler rational Q/P example above gives
  the more accurately replayed `+124.128e-6`.
* General genuine tensor probes in two and three remote coordinates include
  the full H_(1,1) and H_(2,0) odd spaces, dense remote cubics, arbitrary
  phases, visible retention, and all remote trial coordinates. There are
  24 initial cores and a finer independent-seed shortlist replay.
* Disjoint-block probes keep q,A,B in Y1 and Q,P in independent Y2, with
  nu free. Two 2^18 Sobol rules find positive selected local joint costs:
  about `.127-.128` at zero, `.160` over A=.24, `.115` over B=.18, and
  `.098-.099` over the rational core. The full allowed amplitudes also
  have positive costs in these probes. This is evidence for a separate
  disjoint-block theorem, not a proof of it.

At the zero core the deterministic genuine one-Y Hessian costs are
approximately `.128376` (Q), `.725214` (P), `.498770` (nu, retained).
The rational/fold local Hessian is negative but much more grid-sensitive
than the finite increment (saved minima range about `-.209` to `-.258`).
No particular limiting Hessian constant is claimed. In particular the
finite ratio `-.0846` must not be promoted to a uniform local bound.

For the directed shared fold bank, the lowest saved finite costs per odd
energy on the indicated rules are:

| Sector | Lowest selected cost (N) | Rule and limitation |
|---|---:|---|
| Q | -.157730 | 64 x 64 x 144, fold Y=2.8, tenth of available amplitude |
| P | +.532380 | 20 x 20 x 48 only; not a refined minimum |
| nu | +.478977 | 20 x 20 x 48 only; not a refined minimum |
| Joint | -.224295 | 64 x 64 x 144, fold Y=2.8, tenth amplitude |

The disjoint rational-core axis costs on two independent Sobol rules were
Q `.0983-.0994`, P `.7021-.7039`, nu `.4815-.4816`. No shared P-only or
nu-only violation was found in this bank. The Q/P counterexample suffices
to reject the proposed simultaneous pure comparison numerically, even
without nu. These tables do not supply certified lower bounds.

The prompt's near-binding (P) point `(w,A,B)=(.6004,.3496,.2023)` is a
**conditioned value**, not a cap-feasible global coefficient vector. At
odd amplitude .03 its sampled paired norm-increment ratios are about
`1.425862` (Q), `1.383221` (P), `.920510` (nu), `2.211757` (selected Q/P),
and `2.339407` (selected joint), compared with `p=1.3220518...`.
See `conditional/GEOMETRY.md` for directions and convergence. These
conditional failures alone do not imply an averaged retained failure.

## 3. Two analytic obstructions and the correct bridge (P)

The correct parity pair for the odd comparison is **L+E+O, L+E-O**.
The displayed `L+O +/- E` in the task is not the retained-functional
pair. Both coordinated authors confirmed this correction.

At conditioned coefficients

```
w=(a+b)/2, A=b, B=(a+b)/sqrt(2), Z0=-1,
```

the base X=L+w+(T-1)A+Z^2 conj(B)/sqrt(2) has the exact expansion

```
X = (26/125) zeta^2 - (179/1250)|zeta|^2
    + (179/1250) zeta |zeta|^2,       zeta=Z+1.
```

Its leading angular factor is bounded away from zero, so |X| vanishes
quadratically. Every individual Q/P/nu axis is nonzero at Z0. The true
odd norm Hessian has a positive angular mean times `1/|zeta|^2`, and Fatou
gives an infinite small-amplitude second-difference ratio. This rules out
**any finite homogeneous quadratic conditional odd majorant at every
A/B core**, including one with a finite polynomial coefficient depending
on the core. It does not rule out genuine averaging, an additive reserve,
or a globally admissible retained trial.

For a remote trial xi, put X=L+E-xi and
`F_xi(E)=||xi||^2+2 E|X|-p||E||^2`. The exact retained bridge is

```
hatLambda(E+O) <= F_xi(E) + |c|^2
                 + E[|X+O-cZ|+|X-O+cZ|-2|X|] - pW,
```

for one global complex visible coefficient c. At the minimizing remote
trial xi_E, `F_xi_E(E)=hatLambda(E)`. At the #428 fixed trial
`xi0=-(3/5)(rA+.5053 rB)`, this instead gives a direct global upper bound.
Conditionally choosing a different c at each remote sample is invalid.

The full real odd Hessian has both a Hermitian matrix and a complex
bilinear matrix. The two Q/nu kernels are different and generally nonzero
over A/B; `E Q=0` alone does not remove them. There are analogous P/nu
terms. At a disjoint odd Gaussian block, all these cross channels vanish
after integration by centering and circular chaos orthogonality, but the
diagonal A/B costs still need proof. Details are in
`analytic/NU_CHANNELS.md` and `analytic/RETAINED_BRIDGE.md`.

## 4. Phase 1 status and certification route

The algebraic retained bridges and conditional obstruction are proved in
the accompanying author notes. Exact checks certify the polynomial identity,
input caps, and conditional scalar absorption. **No global odd numerical inequality has been certified;
L5 has not been closed.** The independent (P) compact proof remains outside
this task.

The useful next numerical target is a coupled direct bound with the #428
remote trial, arbitrary remote sharing, a single global visible trial,
and an explicit portion of the R/U deficit available for the odd increment.
The scalar budget and proposed constants are recorded separately in
`analytic/COUPLED_BUDGET.md`; a proposed constant there is not a proved
odd-sector estimate.

Explicitly, let `X=L+E-xi0` and define

```
J_odd = inf_(c in C) {|c|^2
        + E[|X+O-cZ|+|X-O+cZ|-2|X|] - pW}.
(O_U):  J_odd <= .01||U||^2 + 50e-6.
```

The target allows arbitrary sharing in every dimension, with the stated
total and weighted caps, and requires no new conditional-centering
hypothesis. It is a **proposed** statement; the probes cover only finite
families. The scalar absorption uses only `u<=.0463` and `u+V<=.080051`,
so it applies a fortiori to the full response caps. No tightening of the
A coefficient is used.

`genuine/COMMON_TRIAL_NOTE.md` records 385 coarse finite configurations and
17 finer checks, with xi0 fixed and only a global visible c optimized.
All sampled (O_U) residuals are negative; the worst coarse residual is
`-8.718e-6` and the worst selected refined residual is `-1.3243e-5`.
The rational shared example has common-trial increment `220.077e-6`
against allowance `279.645e-6` on its saved rule. This differs from its
fully retained increment `124.128e-6`.

Adding `-.01W` to (O_U) fails numerically near a parallel U=0 core
`q=0, alpha=.2075, beta=.10484975`. A selected Q/P/nu vector at the
floating ellipsoid cap has positive residual `1.4071e-6`, stable under
two radius refinements. This is N, including cap feasibility at a
floating boundary; it is not a certified counterexample. We therefore
propose kappa=0, rather than carrying forward the remote-only .01 cost.

For a finite-amplitude certificate, use the exact paired norm difference
or the directional smoothed majorant in `analytic/RETAINED_BRIDGE.md`,
preserving both nu channels. Partition genuine averaged configurations,
not just a rectangular conditional box. Away from zeros, Hessian covers
and third-derivative bounds can control cells. Near quadratic zeros, use
an integrated sublevel/small-ball estimate or an explicit additive
allocation; a bounded conditional Hessian cover cannot work. Remote tails
need their genuine chaos moment bounds and a finite-amplitude exterior
argument. A certificate must include this tail and singular-region budget.

A smaller rigorous next milestone is to certify the explicit retained
counterexample on the energy relaxation. For any trial v the retained
objective J satisfies `J(v)-||grad J(v)||^2/4 <= inf J <= J(v)` by strong
convexity. Enclose the perturbed objective and gradient and the baseline
objective, using exact coefficients, outward integration and tails. A
lower gain greater than `5e-5` would rigorously exclude the pure comparison.
The present convergence tables are not that enclosure.

## 5. Ownership and coordination

All new files are in this ignored handoff folder. No tracked repository
source, Lean module, dependency pin or README was edited; no branch was
pushed and no proof-check/CI slot was used. codex-a7c4 and codex-8d2f were
sent the corrected parity, cap-feasible numerical example, retained values,
and scope warning. codex-a7c4 owns (P); codex-8d2f confirmed the consumer's
exact odd allowance `50.64e-6` and the distinction between necessary caps
and common-response realizability. Everything here remains for
claude-b9ee's review before integration.

The isolated full replay completed all 18 commands in **96.57 seconds**.
Its exact checks and numerical observations are recorded separately in
`replay-codex-91d4-full/REPLAY_SUMMARY.json`. The rational example's
finest retained increment reproduced exactly at the displayed precision.
codex-a7c4 also independently re-derived and replayed the scalar assembly;
this is same-side review only (see `REVIEW_STATUS.md`).

The unused, unpushed source worktree and branch `codex-91d4/odd-ab-core`
were removed after delivery. Main remains clean. No owned computation is
running. Issue #430 remains open for review and the unresolved Phase 1
odd inequality; ownership/progress labels were released at handoff.
