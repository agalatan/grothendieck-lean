# A complete lower-bound improvement from the existing law bank

Agent-ID: codex-a7c4. Task: #421. Baseline: `ff3f6203cdf251ee7bcff71d03e50c9248b0d1dc`.

Status: **C** for the exact complete-cover calculations described below; numerical
optimization is used only for proposals. The corresponding Lean reflection is a
separate obligation. No Conjecture K assumption is used.

The final accepted cap is `891774069/1250000000 = 0.7134192552`, yielding
`K_G^C >= 1250000000/891774069 > 1.401700322371`. The exact-replayed cover has
15,096 leaves and 1,230 replaced parents. The actual maximum is approximately
`0.7134192551055516`, at original parent 6240. The strict decimal endpoint improves
by `0.000000284498` over the baseline's displayed decimal.

The baseline cap was `3567097/5000000 = 0.7134194`, giving
`K_G^C >= 5000000/3567097 > 1.401700037873`. Its actual certificate maximum was
approximately `0.7134193997590335`, leaving only `2.41e-10` of rounding slack.
Changing that last rounding digit would miss the main available improvement.
There were 457 leaves above `0.7134193`, 1,345 above `0.713419`, and 2,927 above
`0.713418`, spread across many original parents.

## What changes

The accepted spectral/Gram law nodes and Gaussian source caps already contain
more information than the saved cover uses. Reoptimizing only the mixture weights
of each saved leaf often leaves its value unchanged. Reconsidering every existing
source group and the chords between its certified law nodes gives materially
better values on many of the same boxes. For example, the former worst leaf,
parent 5588, drops from approximately `0.713419399759` to `0.713410022948` in an
exactly accepted repricing, without a new law node.

For fixed `x`, a law node at scale `tau` has moment price

`J(p,x) = p0 + rho*p1 + p2 + (2+x^2)*p4 + (6+9*x^2+C6*x^3)*p6`.

The new discovery driver forms the lower convex hull of these prices within each
fixed source group, at both `x` endpoints and the midpoint of a box. Hull edges
supply candidate chords at the two scale endpoints. The original source weights
of each chord are preserved. Finite mixtures then combine row matrices, coupling
vectors and moment polynomials **before** completing the square. This is the
existing `FiniteMix` interface, not a new interchange of an infimum with a
supremum.

A floating hull or optimizer result is never an acceptance premise. Every proposed
weight is converted to a nonnegative rational simplex vector. The existing exact
component decoder checks source identity, scale bracketing and each node's `xmax`.
The box value uses exact rational quadratic maximization, including interior
scale vertices, and both `x` endpoints under the existing moment-sign theorem.
The best original recipe remains available on every subbox. Binary subdivision
therefore replaces a box by a genuine cover and never worsens its old certified
cap.

The final `certificate_check` replays all original boxes, every replacement tree,
all saved rational maxima, the global cap and the strict reciprocal comparison.
The independent law-node verifier and Lean reflection remain the checks of the
inherited analytic premises and formal numerical endpoint.

## Accepted milestones

| cap | exact-replayed leaves | replaced parents | strict decimal consequence |
| --- | ---: | ---: | ---: |
| `0.7134193` | 14,130 | 1,068 | `K_G^C > 1.401700234350` |
| `0.7134192748` | 14,622 | 1,230 | `K_G^C > 1.401700283862` |
| **`0.7134192552`** | **15,096** | **1,230** | **`K_G^C > 1.401700322371`** |

The second pass requested `0.713419`, but its complete certificate attained only
`0.7134192747192827...`; the accepted cap was rounded **up**, exactly, to ten decimal
places. It would be incorrect to report the requested target as proved. A final
pass focused on the 60 leaves still above `0.7134192`. It completed in about
90 seconds; 45 of those leaf refinements still missed that target. Its valid
attained cap is the final row of the table, not the requested `0.7134192`.

## Limits and the next mathematical step

A proposed `0.713418` target was not supported by the current search. At the point
`(t,tau,x) = (0.8512021484375, 0.24150145300585937, 0.5751953125)` in parent 6194,
the best found fixed-bank value is approximately `0.71341879277`, even after
collapsing every coordinate interval and enlarging the component pool. This is
**N**, a diagnostic of the present search, not a proved lower bound on the optimum
of the full bank, and certainly not an obstruction to Conjecture K. It does show
why blindly adding subdivisions is unproductive for that target.

Two additional five-coefficient LP majorants were also exactly accepted on the
entire radial half-line while reusing existing spectral/Gram witnesses. They had
951 source/cut intervals and included the unbounded tail. Neither improved the
tested pointwise envelope, so neither was added to the production law bank.
Passing the law checker is insufficient: a new node must improve an active
component and then lower the maximum of a **complete** cover.

A further gain should therefore target the active spectral/Gram witness itself,
or source potentials, and measure its improvement at the remaining active
points before expanding a global cover. The frozen-cut LP and full-bank
repricing distinguish those mathematical gains from merely spending more
subdivision work on an unchanged envelope.

## Discovery provenance

The input cover was `data/lower-refinement/cover.json` at
`ff3f6203cdf251ee7bcff71d03e50c9248b0d1dc`, SHA-256
`454dffbed66e79e72f3a4b742e7b418328bdf85e069ac6696df8ee3f79b27267`.
Discovery used Python 3.12.3, NumPy 2.3.5 and SciPy 1.17.1, with
`OPENBLAS_NUM_THREADS=1`. The successful stages were:

1. Target `0.7134193`, at most six extra subdivisions along a branch: 457 affected
   leaves, no misses; 161 seconds in the initial prototype.
2. Target `0.713419`, at most two extra subdivisions: 991 affected leaves,
   attained cap `0.7134192748`; 153 seconds.
3. Target `0.7134192`, at most four extra subdivisions: 60 affected leaves,
   attained cap `0.7134192552`; 90 seconds.

The first stage used an exploratory implementation with 12 individually ranked
candidate components and optimizer objective scale `1e5`. The maintained driver
uses 20 candidates, scale `1e3`, cached hulls, and exact normalization of all
rounded weights. Thus the commands below reproduce the staged search strategy;
they need not regenerate identical proposed weights across implementations or
optimizer versions. The committed rational certificate, rather than a successful
floating solver run, is the acceptance artifact. Its final SHA-256 is
`385f81c9a484107a488b94e47e8dd21ad0e5ceea00adf83abf34d1a3df615ce1`.
This is the compact production serialization, with its decimal `lower` field;
the discovery output has the same rational data in a different JSON layout.

```sh
git show ff3f6203cdf251ee7bcff71d03e50c9248b0d1dc:data/lower-refinement/cover.json > handoff/lower-baseline.json
OPENBLAS_NUM_THREADS=1 python3 -B tools/refine_lower_existing_bank.py \
  --input handoff/lower-baseline.json --target 7134193/10000000 \
  --max-depth 6 --output handoff/lower-stage1.json
OPENBLAS_NUM_THREADS=1 python3 -B tools/refine_lower_existing_bank.py \
  --input handoff/lower-stage1.json --target 713419/1000000 \
  --max-depth 2 --output handoff/lower-stage2.json
OPENBLAS_NUM_THREADS=1 python3 -B tools/refine_lower_existing_bank.py \
  --input handoff/lower-stage2.json --target 7134192/10000000 \
  --max-depth 4 --output handoff/lower-stage3.json
```

The original bank's 21 added law nodes, all original source hashes, and the fixed
`epsilon=149/200` witness are unchanged in the final artifact. The two rejected
LP probes are discovery diagnostics only and are absent from that artifact.

## Reproduction

`tools/refine_lower_existing_bank.py` is a bounded discovery driver. It uses
NumPy/SciPy for proposals and the existing rational checker for acceptance. Its
output always states the attained cap, including when the requested target is
missed or the proposal search is interrupted. Replay the accepted production
certificate with `python3 -B -S tools/verify_lower_refinement.py`. To explore a
further target, run single-threaded, for example:

```sh
OPENBLAS_NUM_THREADS=1 python3 -B tools/refine_lower_existing_bank.py \
  --input data/lower-refinement/cover.json \
  --target 7134192/10000000 --max-depth 4 \
  --output handoff/lower-cover-candidate.json
python3 -B -S tools/verify_lower_refinement.py handoff/lower-cover-candidate.json
```

A candidate is promoted through the existing cover exporter and the four
`RefinedCoverBoxes` checks, partition check, and `RefinedCoverResult` endpoint.
Neither the witness epsilon nor any source hash, law-node witness, Gaussian cap,
analytic hypothesis or heavy node-cap module needs to change.
