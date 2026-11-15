<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/multivariate/PHASE0_MULTIVARIATE.md, 2026-11-15 12:20; Agent-ID: codex-91d4. -->
# Genuine multivariate energy-slack probes

Agent-ID: **codex-91d4**. 15 November 2026. Refs #436.

**Decision: no sampled violation of the requested energy-slack increment was found.**
The computations are **N only**: finite scrambled Sobol samples, floating point
convex optimization and numerical Rice quadrature. They do not establish a
uniform inequality, a common-response realization, or an interval certificate.
Absolute-payoff estimates from the largest-dimensional direct Sobol grids were
not reliable near the benchmark. An exact distributional reduction resolves
the two selected AB-zero examples, but does not validate every absolute estimate.

## Canonical functional and the parity control

Use the frozen `../inputs/STATUS.md` §2.10a / `ODD_CONTROL.md` §4 definition

```
Λhat(G) = inf_ξ {||ξ||² + E|L+G−ξ| + E|L−G+ξ|} − p||G||².
```

Here `L=Z(a+b|Z|²)`, `(a,b,p)=(699/1250,179/1250,2500/1891)`,
`E=q+(|Z|²−1)r_A+Z² conj(r_B)/sqrt(2)` and
`O=ZQ+conj(Z)P+νZ(|Z|²−2)/sqrt(2)`.
Write `ξ=v+cZ`, with `v` remote first chaos, and `X=L+E−v`.
Visible reflection in the second norm gives exactly

```
E|L+E+O−v−cZ| + E|L−E−O+v+cZ|
 = E[|X+(O−cZ)|+|X−(O−cZ)|].
```

The engine additionally averages over the explicit pair `Z,−Z` to reduce
sampling error. Its four norms therefore implement this canonical functional.
The swapped pairing `|L+O−cZ±(E−v)|` is a different expression and is not used.
`direct_identity_check.py` compares the canonical two norms on explicit
antithetic samples with both the engine value and its analytic gradients for
arbitrary complex coefficients. The recorded discrepancies are respectively
`8.88e−16` and `8.09e−17`. This is an algebra check, not integration certification.

## Genuine families, energy and retention

All remote cubics are explicit normalized members of `H_(2,1)`:
diagonal Hermite cubics, off-diagonal `Y_i² conj(Y_j)/sqrt(2)`, distinct triple
products, normalized sums on independent blocks, and complex random linear
combinations of the complete normalized Wick basis in two or three coordinates.
No unconditioned Gaussian is substituted for `q`.

Energy is computed from orthonormal coefficients. The cap checks use

```
u ≤ .0463,
u+E_A+E_B+W ≤ .080051,
.5u+(2/3)E_A+(4/3)E_B+E_Q+E_P+(8/7)E_ν
 ≤ (1891/2500)²(π/4−.84²).
```

Most cases use `u=.0403448`, where the numerical `σ(u)` is about `1.73e−14`.
Some random cases use `.035,.04,.043,.0463`. Every included remote linear
coordinate and one global complex visible coefficient are optimized on both
sides. For two and three remote coordinates the Q/P bases are complete. Larger
coordinate counts use explicitly listed diagonal, summed-diagonal and selected
cross channels; **the search is not exhaustive in their odd sectors**.
Directions comprise the two largest real Hessian eigenvectors after eliminating
the visible multiplier, sector-specific Q/P/ν eigenvectors, and selected
disjoint Q/P directions. Amplitudes are `.1,.4,.8,1` times the available cap.
The finite values, not Hessian predictions, are the reported tests.

For high-dimensional diffuse cubics,

```
q = sqrt(u/m) Σ_(j=1)^m X_j Y_j conj(Z_j),   m=32 or 128,
```

only one shell/odd coordinate is active, either the first factor of block 1
or a new disjoint Gaussian. The two-torus in each triple block preserving
`α+β−γ=0` removes all inactive first-chaos multipliers by convex averaging.
In the shared block, fixing the active first factor still permits simultaneous
rotation of the other two factors. Thus the reduced optimizer is the **full
retained optimizer for this family**, with one active remote coefficient and
one visible coefficient. There are up to 385 genuine remote coordinates.

## Sampled results

Times below are measured single-thread author runs; no heavy certificate was run.

| File | Cases / nonzero odd evaluations | Grid, seed | Seconds |
|---|---:|---|---:|
| `coarse_results.json` | 36 / 720 | `2^13`, 921 | 7.25 |
| `extra_results.json` | 40 / 832 | `2^13`, 921 | 7.67 |
| `refined_922.json` | 8 / 16 | `2^17`, 922 | 4.26 |
| `products_results.json` | 6 / 120 | `2^14`, 921 | 5.68 |
| `diffuse_blocks.json` | 12 / 240 | `2^14`, 928 | 2.66 |
| `diffuse_refined_929.json` | 5 / 10 | `2^17`, 929 | 5.45 |
| `mixture_refined.json` | 2 | `2^16`, 950 | 1.05 |
| `mixture_refined_951.json` | 2 | `2^17`, 951 | 1.15 |

These are 94 distinct coarse cores, with selected cores and directions repeated
on independent finer grids. All recorded requested residuals `Δ−σ(u)` are
negative. At `O=0` the residual is exactly `−σ(u)`, almost zero at this energy;
the negative maximum among **sampled nonzero odd vectors is not a global reserve**.

The closest coarse result is `m32_shared_A0.15_B0.085`, seed 928,
`W=8.49269061546e−6`, residual `−7.48055860e−7`. Its finer selected evaluation
is `−1.20772616e−6` (the best of two retained selected directions).

The closest refined nonzero result is `m128_disjoint_A0.15_B0.085`, seed 929,
`2^17` samples. Here

```
q = sqrt(.0403448/128) Σ X_jY_j conj(Z_j),
r_A=.15H,       r_B=.085H,       H disjoint from all triple blocks,
Q = (0.000025890154977006422 + 0.0029032385709910386 i)(|H|²−1),
P = (0.00008421031386251587 + 0.00023992285424005987 i)H²/sqrt(2),
ν = −0.0000010649057371265011 + 0.00007555833346197441 i.
```

Its coefficient energies are `u=.0403448`, `E_A=.0225`, `E_B=.007225`,
`W=8.499829048942122e−6`. The full coefficient vector and normalization are
stored in the JSON. Its requested residual is `−1.20755602399e−6`.
Its direct fixed-trial payoff with
`v=−.6(r_A+.5053r_B), c=0` is below S by `.0206910458` with the origin
control and `.0208082607` with both controls. These absolute values remain N.

Among the eight refined general multivariate cores, the closest is the complete
two-coordinate random Wick core `random_shared_7`, Q-only direction,
`W=1.47406174127e−5`, residual `−4.39635515e−6`. Its long exact floating point
configuration is in `refined_922.json`; `prepare_selections.py` deterministically
selects this and the other seven from the two fresh coarse scans.

## The conditioned near-P core is genuinely embedded

The point `(.6004,.3496,.2023)` is conditioned geometry, not three global
L² energies. For `y=2.5` or `3`, put

```
c1=.6004 sqrt(2)/[y(y²−2)],
q1=c1 H21(Y0),    r_A=.3496 Y0/y,    r_B=.2023 Y0/y,
q=q1+sqrt(u−c1²) × a normalized independent H21 sum.
```

At `Y0=y` and all fill coordinates zero this gives precisely that conditioned
point. Coordinate 1 is left unused for disjoint odd probes; the fill uses the
remaining one or six coordinates. The global core energies at y=2.5 are
`(.0403448,.0195552256,.0065480464)`, with weighted sum `.0419399456`;
at y=3 they are `(.0403448,.0135800177778,.00454725444444)`, weighted sum
`.0352887511111`. Both leave odd room. These four cores and their shared and
disjoint odd directions have no positive sampled requested residual. Full
retention changes the conditioned core, so the local point itself supplies no
global lower bound.

## Absolute-payoff noise and the exact mixture refinement

Each ordinary result records raw absolute payoff, origin control
`B(0)−2 mean|L|`, and optional zero-mean q-energy control
`−p(mean|q|²−u)`. The controls do not change the retained optimizer or paired
increment. They are variance reductions, not rigorous error bounds.
`D(q)=B(u)−2E|L+q|` and `Δ−σ+max(−D,0)` are recorded with corresponding
controls, because the existing joint assembly does not dispose of negative D.

The 128-block disjoint AB-zero case had origin-corrected full absolute payoff
`+3.55404e−4` and fixed-trial payoff `+3.55601e−4` on the direct seed-929
Sobol grid; even the q-energy control left a positive estimate. These are
**unreliable estimates, not counterexamples**. The uncalibrated positive values
are preserved in the receipts rather than removed.

For these AB-zero triple-product cases, condition on the first and third
factors in each block. The remaining middle Gaussian factors give exactly

```
q | {X_j,Z_j} ~ CN(0,V),       V=(u/m) Σ |X_j|² |Z_j|²,
E V=u.
```

This is the genuine finite cubic distribution, including its random variance.
For the shared active factor its squared radius appears in one summand of V.
Pairwise sign flips in each triple block preserve q. They also preserve
the active Q/P quadratic fields and ν, so convex group averaging forces every
remote multiplier to zero. Only the global visible coefficient remains.
The Gaussian integral over q can therefore be done with the Rice formula;
the residual lower-dimensional integral is still evaluated numerically.

`mixture_refine.py` also uses the exact zero-mean variance control
`E[B(V)−pV]−S` for the remote baseline. A 65-node numerical cubic interpolation
of B is checked at eight interleaved midpoints (maximum observed discrepancy
`1.27e−11`), without claiming an interval error bound.

For the selected Q-only points, `W=.00025483397812453`:

| 128-block case | seed | `Δ−σ` | full payoff−S | fixed `ξ=0` payoff−S |
|---|---:|---:|---:|---:|
| shared | 950 | `−5.04762e−5` | `−9.33779e−5` | `−9.33778e−5` |
| shared | 951 | `−5.02847e−5` | `−9.35516e−5` | `−9.35515e−5` |
| disjoint | 950 | `−5.01295e−5` | `−9.26316e−5` | `−9.26316e−5` |
| disjoint | 951 | `−5.00775e−5` | `−9.31626e−5` | `−9.31626e−5` |

Thus the refined fixed-trial maximum among these two points is approximately
`S−9.26316e−5`; the two seeds differ by at most `5.31e−7`. This does not support
a claim that every explicit trial in the broad scan lies below S.

There is an inherited analytic negative control for disjoint AB-zero cases:
the combined theorem in `../inputs/ODD_CONTROL.md` §1 gives the raw cost
`.01(E_Q+E_P)+.22E_ν`; the exact mixture identity and concavity of the peak
benchmark B give `Λ(q)=E B(V)−pu≤B(u)−pu≤S`.
Consequently the direct zero trial is at most
`S−.01(E_Q+E_P)−.22E_ν`. For the selected pure Q case the inherited bound is
already `S−2.54834e−6`. The inherited odd theorem is recorded as reviewed P+C
in master STATUS 7.2.7; the new concavity and symmetry derivations are P,
author only, in `../analytic/GAUSSIAN_MIXTURE_CONTROL.md`. No new Lean or
interval proof is asserted here.
It independently diagnoses the high-dimensional positive absolute estimates.

## Fresh replay and provenance

Run from this folder with Python containing NumPy and SciPy:

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I replay.py --output-dir fresh-replay
```

The output directory must not exist. The driver generates every grid, result,
selection, identity control and mixture check afresh; expected case counts are
checked before it writes `RECEIPT.json`. This is a roughly 40-second, one-thread
lane on the author's laptop. The fresh author run in `replay-codex-91d4/`
completed every expected case count in **39.55 seconds**. Its commands,
exact source hashes and timings are
recorded in that receipt. All individual commands can be read from `replay.py`.
No saved numerical JSON is a prerequisite of the driver.

`prepare_selections.py` forms `combined_coarse.json` from the sorted union of
all 36+40 fresh coarse rows. The general refinement keeps the eight greatest
requested residuals and their two best finite directions. It forms
`diffuse_selected.json` using five literal case names (32/shared ABzero and
large AB; 128/shared ABzero; 128/disjoint ABzero and large AB). The mixture
check selects the two 128-block ABzero rows from the freshly refined file.

Only this folder's Python files and `../analytic/benchmark_numeric.py` are
runtime code dependencies. The general engine was adapted from the older
`gpt-odd-over-AB-core-2026-11-15/general/general_probe.py`, but contains its own
implementation and does not import or read the older handoff. `SOURCE_HASHES.json`
records this provenance and the new source hashes. Scripts do not edit tracked
repository files and do not launch Lean, CI or cloud jobs.
