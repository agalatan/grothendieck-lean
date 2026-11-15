<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/REPORT.md, 2026-11-15 12:22; Agent-ID: codex-91d4. -->
# Phase 0 — odd sectors and remote-energy slack

Agent-ID: **codex-91d4**. Refs **#436**. 15 November 2026.
For **claude-b9ee** to review; handoff only, no tracked repository edits.

## Decision first

**N:** The tests support the proposed energy-slack allowance: no refined
configuration violates `Delta <= sigma(u) + 50e-6`. The measured allowance
is consistent with **eta_odd = 0**, with the trivial `O=0` configuration
giving residual zero at the benchmark-optimal energy. No tested example
requires a `theta D_plus` charge. This is evidence from specified families,
not a bound on the supremum over dimensions or tensors.

**Choose the direct absolute retained cap as the next proof target:**

```
Lambda_hat(q + A + B + O) <= S + 1e-4.
```

Keep `Delta - sigma + D_minus` as the relative diagnostic. The direct
route needs only an explicit admissible trial, preserves the actual A/B
and remote deficits, and avoids certifying a lower bound for the globally
optimized even baseline. The common trial `xi_rem=-.6(r_A+.5053 r_B)`,
with global visible coefficient zero, passes the selected numerical
preflight, including diffuse genuine cubics near the benchmark.

**P, accounting correction:** plain `(O_sigma)` does not, by itself,
assemble with the existing A/B theorem in the `D<0` branch. The exact
combined upper bound is `S + 49e-6 + eta_odd + D_minus`. A sufficient
corrected relative theorem is

```
Delta - sigma(u) + D_minus(q) <= 50e-6.
```

It would give the strict cap `S+99e-6`. This accounting was checked with
codex-a7c4 and codex-8d2f. The existing remote theorem is uniform above
`S`, not an energy-relative bound above `B(u)-pu`.

This is the requested **Phase 0 checkpoint**. No global odd theorem,
continuum integral certificate, or Phase 1 Hessian cover has been claimed.
Compact (P) and its multipliers remain with codex-a7c4.

## Functional and domain actually tested

The canonical retained functional is

```
Lambda_hat(G) = inf_xi { ||xi||^2 + E|L+G-xi| + E|L-G+xi| }
                - p||G||^2.
```

Both sides of `Delta=Lambda_hat(E+O)-Lambda_hat(E)` use their own full
actual remote first-chaos optimization and one global complex visible
coefficient. No sample-dependent visible coefficient or auxiliary
Gaussian first-chaos direction is allowed.

The exact parity reduction uses `X=L+E-xi_rem`, `H=O-cZ` and
`E(|X+H|+|X-H|)`. The earlier task text's identity that pairs `E` and
`-E` instead changes this functional. The numerical implementation was
independently audited and checked directly against the original two
norms. Agreement is below `6e-15` in the one-variable controls and
`9e-16` in the multivariate controls; signed-real-nu controls reject the
incorrect pairing. See `PROOF_NOTES.md` and
`analytic/NUMERIC_ENGINE_REVIEW.md`. No numerical data was discarded or
changed during this audit.

All genuine cubics obey the peak constants and necessary response caps:

```
u <= .0463,
u + E_A + E_B + E_Q + E_P + E_nu <= .080051,
.5u + (2/3)E_A + (4/3)E_B + E_Q + E_P + (8/7)E_nu
    <= (1891/2500)^2 (pi/4 - .84^2).
```

These are tests on the stated genuine-chaos domain, not assertions that
each polynomial is realized by bounded responses. No #433 payoff penalty
was silently added to the retained objective.

## Energy slack and the old witnesses

The benchmark helper evaluates the proper-complex Rice integral afresh.
It uses the inherited `S` interval
`[1.3739535256614, 1.3739535256616]`. The numerical maximizing energy is
`u_star=0.0403448148399`; the benchmark value is
`1.373953525661483`. Independent radial quadrature agrees within
`1.1e-13` at the listed energies, but these evaluations are still **N**.

| Remote energy u | sigma(u), in micro-units |
|---|---:|
| 0 | 2074.2451 |
| .0009225655922, old retained witness | 1974.2529 |
| .00025992, old common-trial witness | 2045.7870 |
| .035 | 32.7994 |
| .04 | .13475 |
| .0403448 | approximately 0 |
| .043 | 7.9296 |
| .0463 | 39.5622 |

The old positive increments do not challenge the energy-slack statement.
On the fine rule, the first witness has full retained increment about
`124.13e-6` and residual `Delta-sigma=-1850.12e-6`. The second has full
retained increment about `111.96e-6` and residual `-1933.83e-6`.
The previously certified common-trial excess of the second witness is
a different quantity; it must not be substituted for its separately
optimized retained increment. The old handoff and countercertificate
remain unchanged.

## Searches near the vanishing-slack energy

The one-remote-variable family varies all six complex coefficients of
`q,A,B,Q,P,nu`. There were 51 fixed-energy starts, eight free-energy
starts, 60 further finite perturbations, and a separate six-start
absolute-objective search. Starts include opposite core/shell phases,
complex phases, all odd sectors and their mixtures. Fine rechecks use
48/64 radial nodes and 96/144 relative-angle nodes.

The multivariate bank contains **94 cores and 1,912 finite nonzero odd
tests**, followed by selected independent-seed refinements. It includes
full two- and three-variable tensors, diagonal and triple-product sums,
shared and disjoint drivers, and up to 385 remote coordinates. In large
dimensions only specified odd subspaces are searched; this is not an
exhaustive tensor optimization. Every actual remote linear direction is
retained, or removed by an exact block-torus symmetry argument in the
diffuse triple-product family.

The near-binding point `(q,r_A,r_B)=(.6004,.3496,.2023)` is embedded in
genuine cubics, rather than mistaken for a global energy tuple. Taking
`Y_1=y`, `y=2.5` or `3`, scale the first Wick coefficient to
`.6004 sqrt(2)/(y(y^2-2))` and the shell coefficients to `.3496/y` and
`.2023/y`; independent genuine cubic blocks fill the remote energy to
`u_star`. Both embeddings satisfy the caps and leave odd energy room.
Shared and disjoint odd directions are included.

Representative **N** results after refinement:

| Configuration | Odd energy W | Delta-sigma, micro-units |
|---|---:|---:|
| One-variable free-u selected point, u=.04033488372 | 2.4793e-6 | -.6163 |
| Shared random two-variable tensor, u=.0403448 | 1.4741e-5 | -4.3964 |
| 128 triple-product blocks, disjoint explicit driver, A=.15, B=.085 | 8.4998e-6 | -1.2076 |
| 128 blocks, A=B=0, shared driver, exact-mixture recheck | 2.5483e-4 | -50.2847 |
| 128 blocks, A=B=0, disjoint driver, exact-mixture recheck | about 2.55e-4 | -50.0775 |

The first row had a coarse apparent residual `+.715e-6`, which became
negative on both finer rules. Optimized odd amplitudes frequently tend
to zero; such nearly zero samples are not evidence for a positive pure
odd cost. The full coefficient records, seeds, energies and gradients
are in the lane JSON files.

## Absolute route and numerical error controls

The separate one-variable absolute search is about `.00194970` below
`S` on the 64-radius rule. On eight selected one-variable configurations,
the fully explicit common trial with visible coefficient zero stays
below `S`; its closest value is about `.00194930` below `S`.

Near-diffuse absolute values need more care. Direct Sobol estimates for
the 128-block zero-shell cases changed sign relative to `S` across
seeds, while their paired increments were stable. Even an origin and
q-energy control variate did not make those absolute estimates reliable.
Conditioning on two factors of each genuine triple product makes the
sum exactly a Gaussian variance mixture; integrating the third factors
analytically by Rice removes the troublesome noise without replacing
the cubic by an independent Gaussian surrogate. That focused check gives:

| 128-block zero-shell case | Full retained value minus S | Explicit trial minus S |
|---|---:|---:|
| Shared explicit driver | -9.35516e-5 | -9.35515e-5 |
| Disjoint explicit driver | -9.31626e-5 | -9.31626e-5 |

These are the seed-951, 2^17-sample values; the separate seed-950 check
agrees at the displayed scale. They remain **N**, not outward bounds.
The disjoint zero-shell family also supplies an analytic error control:
`analytic/GAUSSIAN_MIXTURE_CONTROL.md` proves that B is concave, whence
the genuine finite mixture has remote value at most `B(u)-pu`.
Together with the inherited disjoint odd theorem this proves the explicit
zero trial and retained value are at most `S-sigma-.01(E_Q+E_P)-.22E_nu`
on this family. This **P, author-only** deduction does not extend to
nonzero A/B shells or arbitrary shared simultaneous odd tensors.

A coarse 12-node Laguerre rule also falsely placed `G=0` above `S`.
The exact origin value exposes that error. The current engine records
the origin control variate `B(0)-2 E_grid|L|`; it cancels identically
from Delta and does not change any minimizer or gradient. Neither this
control variate nor a small optimizer gradient certifies quadrature.
All such diagnostic failures are retained in the record.

## What the decision does and does not authorize mathematically

No numerical need for `theta>0` has emerged, so no rerun of 7.4.10's
multipliers is requested at this stage. The proposed reserve remains
`eta_odd=50e-6` for the **corrected** relative statement, or `1e-4` for
the direct absolute target. A universal choice has not been certified.

The direct proof interface retains the A/B content pairings, the
negative `.31||R||^2` and `.08||U||^2` terms, the quartic energy term,
and the signed remote deficit before scalar rounding. Its exact
reduction is equation (7) of `PROOF_NOTES.md`. The missing step is a
dimension-free averaged bound for the coupled odd expression under
arbitrary sharing. The two nu channels and the failure of a conditional
homogeneous quadratic majorant remain relevant; none is removed by the
finite searches.

The optional #433 route is separately mapped in
`analytic/RESPONSE_PENALTY_MAP.md`: its full penalty belongs to the raw
actual-response row; only an explicitly unspent h-square term can
accompany the retained row. This does not alter the present target's
functional or quantifiers.

All deliverables remain author-only for claude-b9ee's review. The README
provides the isolated replay entry point, and the manifest records
source, input, result and log hashes. No Phase 0 numerical observation
is labelled C or treated as a global theorem.

The complete isolated replay passed in **79.078 seconds**, exit 0,
with every principal search and selection regenerated from Python
sources and frozen inputs. The receipt is
`replay_runs/codex-91d4-isolated-full/RECEIPT.json`. It reproduces the
reported fine residuals; the multivariate lane separately replayed in
39.55 seconds. These are reproducibility checks, not new continuum
proofs.
