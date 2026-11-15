<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/README.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-round2/README.md; Agent-ID: codex-c7e2. -->
# Conjecture K: a full-cubic Gaussian neighborhood and global radius results

Research round of 15 November 2026, against
`agalatan/grothendieck-lean` commit
`6bb44599190397f806d2db89b25df4e6785b758e`.

**Full Conjecture K remains unproved.** This package contains new analytic
partial theorems, exact and interval certificates, independent mathematical
reviews, and clearly separated exploratory numerics. There is no new
Grothendieck endpoint and no Lean formalization. The repository checkout
was not modified.

## Main theorem: all sectors, arbitrary dimension

For `L=Z(a+b|Z|²)`, write

\[
F(G)=E|L+G|+E|L-G|,\quad B(v)=2E|L+\sqrt vW|,
\quad \Delta(G)=E|G|^4-2(E|G|^2)^2.
\]

For every compact positive profile set and bounded energy range `E|G|²≤M`,
there are dimension-independent positive constants `Δ*,c₁,c₂` such that

\[
\Delta(G)\le\Delta_*
\quad\Longrightarrow\quad
F(G)\le B(E|G|^2)-c_1\delta(q)-c_2\|G-q\|_2^2,
\]

where `q` is the remote projection and `δ(q)=E|q|⁴−2||q||₂⁴`.
Every visible sector and arbitrary sharing of remote drivers are allowed.
Consequently, for prices bounded below by a positive number, there is a
dimension-independent `χ*>0` such that

\[
\frac{\Delta(G)}{(E|G|^2)^2}\le\chi_*
\quad\Longrightarrow\quad
F(G)-pE|G|^2\le\sup_{v\ge0}(B(v)-pv)
\]

at **every amplitude**. One threshold works throughout the original
profile box, including its zero-optimizer corner. The threshold has not
been numerically evaluated.

Read [the complete assembly](FULL_NEAR_GAUSSIAN_K.md) and
[its independent review](review/ASSEMBLY_REVIEW.md). The principal inputs are:

- [Explicit smooth third-chaos Edgeworth estimate](variational/EXPLICIT_SMOOTH_EDGEWORTH.md), with remainder at most `6||m⁽⁶⁾||∞ κ₄(X)^(3/2)`;
- [Superlinear A/B content bounds](remote/RAW_CONTENT_BOUND.md);
- [Uniform visible quadratic cost](global/UNIFORM_NEAR_GAUSSIAN_COST.md) and [weighted decoupling](variational/WEIGHTED_GAUSSIAN_DECOUPLING.md);
- [Uniform fractional Taylor remainder](variational/TAYLOR_REMOTE_BASE.md);
- [Projection bounds](review/PROJECTION_AND_COMPACTNESS.md);
- [Prior-round all-profile Gaussian-core stability proof](round1/all-sector/GAUSSIAN_LOCAL_STABILITY.md), included here because it is a mathematical dependency.

The Gaussian-mixture representation of `L` is an established repository
input; see [the pinned foundations, §6](https://github.com/agalatan/grothendieck-lean/blob/6bb44599190397f806d2db89b25df4e6785b758e/research/conjecture-K/sources/fifth-audit-2026-11-15-codex-a7c4/FOUNDATIONS.md).

## Global results with different scopes

| Result | Exact scope | Proof |
|---|---|---|
| `(E|q|)² ≤ (1569/2000)E|q|² < (π/4)E|q|²` | Every unbuffered cubic in at most seven complex coordinates | [Trace alignment and 69,845-cell Arb certificate](remotenumerics/GLOBAL_RADIUS_DIMENSION_SEVEN.md) |
| `(E|q|)² ≤ (6π/25)E|q|²` | Every unbuffered cubic in at most two complex coordinates | [Closed-form rational calculation](root/TWO_COORDINATE_RADIUS.md) |
| Strict Gaussian radius domination at every Gaussian buffer | `q_z=X[(|X|²−2)+z(|Y|²−1)]/√(2+|z|²)`, with `|Re z|≤1/500`, `|Im z−1|≤1/500` | [Inverse-moment proof and parameter-uniform Arb certificate](global/INVERSE_MOMENT_COUNTEREXAMPLE.md) |

The last family includes the known counterexample to the stronger Laplace
comparison, at `z=i`. Its buffered radius theorem implies remote K at all
amplitudes for that family, using the Gaussian-mixture representation of
`L`. It does not prove the buffered theorem for all two-variable cubics.
The seven-coordinate result is **unbuffered**: it does not settle full K
in seven coordinates and does not force a K counterexample to have eight
coordinates.

## Replay

From this directory, with Node.js 20 or newer:

```sh
# codex-c7e2-round2: exact arithmetic checks
node replay.mjs
```

This checks the tensor enumeration and constants in the Edgeworth estimate,
the Taylor constants, and the exact two-coordinate matrix calculation.
These checks support the mathematical arguments; they do not mechanically
verify their analytic steps.

For the two main finite interval certificates, install `python-flint` in
the Python environment used by `python3`, then run:

```sh
# codex-c7e2-round2: exact and Arb checks
node replay.mjs --interval
```

The interval checks run under `python3 -O`; every acceptance condition is
an explicit exception check and remains active. The seven-coordinate
certificate uses the frozen positive rational weight file and covers all
infinite tails. The inverse-moment certificate covers the entire parameter
rectangle and all buffers, using 625 distribution cells, 1,659 adjacent
finite buffer intervals, and analytic small- and large-buffer bounds.
Fresh root replays passed. Expected total runtime is under a minute in the
original environment.

The older single-polynomial inverse certificate can also be replayed with
`python3 -O global/certify_inverse_counterexample.py`.

The auxiliary joint-sector obstructions require a checkout of the pinned
repository, a C++17 compiler, and ordinary Python (do **not** use `-O` for
these two runners):

```sh
# codex-c7e2-round2: optional repository-dependent checks
python3 joint/phase_counter.py --repo /absolute/path/to/grothendieck-lean
python3 joint/majorant_obstruction.py --repo /absolute/path/to/grothendieck-lean
```

The phase obstruction explicitly retains inherited profile bounds as
assumptions. Neither calculation is a counterexample to K or to auxiliary
inequality (P). They refute particular proposed shortcuts; see
[the precise statements](joint/PHASE_OBSTRUCTION.md).

## Remaining obstruction and exploratory work

The new full-cubic theorem excludes counterexample sequences with normalized
fourth excess tending to zero. It does not control the remaining strongly
non-Gaussian range. [Tensorization and compactness analysis](review/TENSORIZATION_OBSTRUCTION.md)
explains why copying blocks or applying a central limit theorem does not
transfer a hypothetical violation into the proved neighborhood.

[Shared-driver searches](search/REPORT.md) include weighted Gaussian baths,
finite Gamma baths, and the full three-coordinate cubic space.
[Remote searches](remotenumerics/REPORT.md) retain coefficient archives and
refinement data. These are numerical exploration, not exhaustive proofs;
their scripts require NumPy and SciPy. No robust violation was found in the
searched families. Historical numerical reports may quote the earlier
`157/200` radius bound; the final theorem, checker, and seven-coordinate
certificate use the stronger `1569/2000`.

`SHA256SUMS.json` records every packaged file except itself. Replaying a
certificate rewrites its JSON receipt, including its measured runtime,
so the receipt hash can change after replay.
