<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/numerics/PHASE_A_NUMERICS.md, 2026-11-15 12:50; Agent-ID: codex-91d4. -->
# Phase A one-variable numerical stress

Agent-ID: codex-91d4. Issue #436. 15 November 2026.

**Status: N only.** No interval integral, uniform bound, global optimization claim,
or proof of the proposed assembly premise is supplied here. All computations use
the genuine one-remote-variable family and the two energy caps. They do not cover
arbitrary dimension or diffuse remote chaos. No further search or certificate is
running.

The saved work comprises 23 named configurations, 62 local constrained optimizer
attempts, and 11 selected configurations evaluated on each of two finer grids.
No sampled violation was found for the actual fixed-trial absolute target, the
unrounded assembly expression, or the proposed allocation with energy slack.
The closest allocation points have essentially zero odd energy and give zero,
up to floating-point error. This evidence supports testing the averaged premises;
it does not establish any of them.

## Functional and scope

Write `T=|Z|²`, `s=|Y|²`, with independent standard proper complex Gaussians.
The six complex coefficients `(cq, alpha, beta, d, e, nu)` represent

```
q  = cq Y(s-2)/sqrt(2)
rA = alpha Y,  rB = beta Y
E  = q + (T-1)rA + Z² conjugate(rB)/sqrt(2)
O  = d Z(s-1) + e conjugate(Z)Y²/sqrt(2) + nu Z(T-2)/sqrt(2).
```

Their exact chaos energies are the six squared coefficient moduli. The weights
in the ellipsoid are `(1/2, 2/3, 4/3, 1, 1, 8/7)`. The constraints are
`|cq|² <= .0463`, total energy `<= .080051`, and weighted energy
`<= (1891/2500)² (pi/4-.84²)`.

The canonical retained functional is the original **two-norm** expression
`||v||² + E|L+G-v| + E|L-G+v| - p||G||²`. The remote trial is fixed to
`xi0=-.6(rA+.5053 rB)`. With `X=L+E-xi0` and `H=O-cZ`, visible reflection
turns its norm part into `E(|X+H|+|X-H|)`. Every saved row evaluates both
`c=0` and one globally optimized complex constant `c`. It never chooses `c`
separately at each Gaussian point. Remote reoptimization is not performed.

The proposed assembly expression is

```
M = linearAB - .31||R||² - .08||U||²
    + 2V(u+V-.0463) + Jodd(c) - D - sigma,
R=rA+.5053rB, U=rB-.5053rA,
Jodd(c)=|c|²+E(|X+H|+|X-H|-2|X|)-pW.
```

Here `u=||q||²`, `V=||rA||²+||rB||²`, `W=||O||²`,
`h=(T-.4)rA+Z²conjugate(rB)/sqrt(2)+.6*.5053rB`,
`linearAB=2 Re E[h conjugate(ph(L+q))]`,
`D=B(u)-2E|L+q|`, and `sigma=S-(B(u)-pu)`.
The implementation also checks the algebraically identical cancellation
`-D-sigma=2E|L+q|-pu-S`. **M is an evaluated candidate expression, not a
proved majorant in this package.**

The allocation diagnostic is
`R_alloc=Jodd(c)-.01||U||²-sigma+max(-D,0)`, with proposed threshold `50e-6`.
Its negative-deficit term is retained explicitly.

For `s0=|X|²`, `v=|H|²`, `r=Re(X conjugate(H))`, the additional diagnostic is

```
Psi = 2v/(sqrt(s0+v)+sqrt(s0)) - r²/(s0+v)^(3/2),
Psi = 0 if s0+v=0.
```

The saved `Mpsi` and `R_allocPsi` replace the central norm increment by
`E Psi`. The optimized-c column uses the optimizer of the exact central norm,
not an optimizer of Psi. The parent analytic lane handles the pointwise proof;
these scripts supply only sampled controls and numerical integrals.

## Results

The headline values below are from the 64-by-64 radius quadrature with 192
relative angles. Both radii use Legendre quadrature on `[0,6]`. Absolute values
and `D` use the origin control variate
`B(0)-2E_grid|L|`, which is independent of the coefficients and trial.
This removes the sampled origin bias; it is not a quadrature enclosure.

| Largest saved fine value | c=0 | global c |
| --- | ---: | ---: |
| Actual fixed-trial value minus S | -0.00195100671613 | -0.00195100671613 |
| M | -0.00195063861398 | -0.00195063861398 |
| Mpsi | -0.00195063861398 | -0.00195063861398 |
| R_alloc | approximately 0 | approximately 0 |
| R_allocPsi | approximately 0 | approximately 0 |

The near-zero allocation maxima are approximately `-1.7e-14`, at
`u=.0403448108873` with odd energy below `5e-16`; they are not meaningful strict
negative bounds. Among the selected fine points with nonzero odd energy, the
largest `R_allocPsi` is `-0.0000979605484`, at `u=.043`.

Representative fine results, all with `c=0`:

| Configuration | Actual minus S | M | Mpsi | R_allocPsi |
| --- | ---: | ---: | ---: | ---: |
| Free-u actual search | -.00195100672 | -.00195085811 | -.00195085811 | -.00182420190 |
| Free-u assembly search | -.00195171885 | -.00195063861 | -.00195063861 | -.00182267731 |
| Fixed-u actual search, u=.035 | -.00817173667 | -.00812138997 | -.00812138997 | -.00003332955 |
| Fixed-u assembly search, u=.035 | -.00828489182 | -.00809205134 | -.00809205134 | -.00003281793 |
| Old retained witness | -.03641621556 | -.01045168976 | -.01043597604 | -.00196358985 |
| Old O_U witness | -.03788609625 | -.01600795556 | -.01600039282 | -.00163827464 |
| q=P=nu=0 old-witness variant | -.03822162039 | -.01621651533 | -.01621640954 | -.00181629344 |
| Near-P embedding at Y=2.5 | -.02202015626 | -.01444160136 | -.01419622364 | -.00353771323 |
| Nonzero-odd case at u=.043 | -.01879300439 | -.01341739719 | -.01341413598 | -.00009796055 |

The named bank additionally includes near-P embeddings at `Y=2.1,2.3,3` and
three configurations at each of `.035,.04,.0403448,.043,.0463`. On the coarse
20-radius/48-angle grid, the largest high-u (`u=.0463`) actual value minus S
was `-.0197878192`, largest Mpsi `-.0144567118`, and largest R_allocPsi
`-.0001191004`. These high-u numbers were not separately refined.

Across the selected fine points, optimizing the single visible constant lowers
the actual value and M by at most `5.87149e-6`. The largest Psi excess above
the exact central increment is `0.0002453777191`, at the near-P embedding
`Y=2.5`; its Mpsi still equals approximately `-.0141962`.

## Convergence, controls, and rejected steps

Comparing 32-radius/96-angle with 64-radius/192-angle, the largest absolute
changes over the selected bank are `1.26472e-5` for actual minus S,
`2.89357e-5` for M or Mpsi, `4.74558e-6` for exact R_alloc, and `4.48767e-6`
for R_allocPsi. These are observed differences, not error bounds. They are
separate from optimization error: the largest saved fine visible-optimizer
diagnostic `||gradient||²/4` is `1.30e-29` in double arithmetic. Strong
convexity gives this bracket for the finite weighted sum, subject to numerical
arithmetic; it does not enclose the continuum integral.

Direct controls compare the paired engine with the original two norms at five
complex configurations, with both visible choices. Their maximum difference is
`6.7e-16`; the literal M and allocation controls also agree to roundoff. Central
finite differences check all 12 coefficient derivatives for all three
objectives and both visible modes, with maximum error `5.81e-10`. A signed
real-nu control gives identical canonical values. Sampled Psi gap is nonnegative
up to a `1.12e-16` roundoff excursion.

The 62 attempts comprise 8 free-u actual, 6 free-u assembly, 6 free-u
allocation, 12 fixed-u actual, 12 fixed-u assembly, and 18 fixed-u optimized-c
allocation runs. Three fixed-u solver failures return the recorded best
feasible iterate, explicitly flagged; they are not claimed optima. Final rows
satisfy the caps to numerical tolerance (largest energy overshoot about
`2.3e-13`). An initial unbounded-coordinate SLSQP experiment produced grossly
infeasible steps. It is preserved only as
`infeasible_slsqp_diagnostic.json/.log`, labelled **REJECTED INFEASIBLE**; its
objective values are excluded from every conclusion and refinement.

See `REPLAY.md` for the complete fresh lane. Runtime imports remain inside this
new handoff. Prior handoffs are untouched.
