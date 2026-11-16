<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/remotenumerics/REPORT.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended filepath: codex-c7e2-round2/remotenumerics/REPORT.md -->
# Full circular cubic radius search

15 November 2026. Exploratory numerics only; no claim of a global
maximum or a rigorous upper bound is made.

The full `H_(2,1)(C^n)` search found no counterexample to

\[
\mathbb E|q|\le\frac{\sqrt\pi}{2}\sqrt{\mathbb E|q|^2}.
\]

The largest validated pure-cubic value was about `0.8218` at `n=8`,
compared with the proposed bound `0.88622692545`. A fixed Gaussian bath
raises the value towards the bound; the validated values remained below
it. The tensor selected by optimization changes substantially as the
Gaussian bath grows.

## Search and independent validation

The exact orthonormal Wick basis is

\[
B_{ijk}(z)=\frac{z_i z_j\bar z_k-\delta_{ik}z_j-\delta_{jk}z_i}
                   {\sqrt{1+\delta_{ij}}},\qquad i\le j.
\]

There are `n^2(n+1)/2` complex coefficients. Coefficients were normalized
in Euclidean norm, so the true Gaussian variance is exactly one,
independently of the empirical Gram matrix. Both coefficients and
directions were unrestricted complex values. Starts included the equal
sum of diagonal Wick polynomials, a radial trace tensor, and random
complex vectors. L-BFGS optimized the normalized coefficient vector using
the analytic gradient.

Training used scrambled Sobol designs. The refined pure-cubic runs used
`2^19` points for `n=2` and `2^18` points for `n=3,4,6,8`, with 8--12
starts and an iteration cap of 150. Four candidates selected by the
training objective were each evaluated on an independently scrambled
`2^20`-point design. Values in the following table are the largest of
those independent evaluations, rounded to avoid suggesting a certificate.

| Complex dimension | Basis dimension | Validated radius | Fourth excess of selected tensor |
|---:|---:|---:|---:|
| 2 | 6 | 0.74422 | 18.9257 |
| 3 | 18 | 0.77436 | 10.5152 |
| 4 | 40 | 0.78917 | 7.5017 |
| 6 | 126 | 0.81201 | about 4.3 |
| 8 | 288 | 0.82181 | 3.0809 |

The fourth excess in the table is calculated from tensor contractions,
not from empirical fourth moments (except the deliberately rounded
`n=6` entry). Floating arithmetic is used, so these are not interval
certificates. `tensor_invariants.py` documents the contraction formula.

Some runs reached their iteration limit. The optimization parameterization
has a redundant radial direction. An optimizer success flag alone does
not certify a small intrinsic sphere gradient or a local maximum. The
script now records the intrinsic gradient norm for future runs. None of
the conclusions here relies on stationary-point certification.

## Fixed Gaussian bath

For each unit-variance cubic `q`, the additional objective was

\[
\mathbb E\left|\sqrt{s}\,q+\sqrt{1-s}\,W\right|,
\qquad W\sim\mathrm{CN}(0,1)\text{ independent},
\]

at fixed `s`, so optimization cannot escape by sending the cubic share
to zero. The Gaussian was integrated analytically with the Rice mean;
the gradient was analytic as well. Training used `2^18` points and
independent validation used `2^20` points.

| Dimension | Cubic variance share `s` | Validated radius | Core fourth excess | Trace fraction |
|---:|---:|---:|---:|---:|
| 4 | 0.5 | 0.85324 | 4.4440 | 0.108 |
| 8 | 0.5 | 0.86569 | 2.3304 | 0.100 |
| 8 | 0.1 | 0.88520 | about 2.075 | about 0.0044 |

The core fourth excess refers to `q`; the fourth excess after the bath is
`s^2 delta(q)`. Entries within a row can refer to candidates differing by
the tiny raw-versus-controlled validation ordering; the significant
structural comparison is unchanged.

The trace fraction is `4 ||t||^2/(n+1)`, where
`q=sum T_ijk :z_i z_j bar z_k:` and `t_i=sum_j T_ijj`, with
`2||T||^2=1`. It measures the squared projection onto the radial trace
subspace. At `n=8`, pure-cubic optimization gave a trace fraction about
`0.260`; a 90% Gaussian bath drove it to about `0.0044`. Thus near the
Gaussian limit the search selects almost trace-free tensors with smaller
fourth cumulant. The pure-radius optimizer is structurally different.

## A stable two-coordinate family

For the refined `n=2` searches, unitary rotation aligning the trace vector
reduces every leading candidate, up to coefficients of order `10^-3`, to

\[
q=Z_1\left[\alpha(|Z_1|^2-2)+\beta(|Z_2|^2-1)\right],
\qquad 2|\alpha|^2+|\beta|^2=1.
\]

After an output phase rotation, panelled deterministic quadrature at two
different orders gave

\[
\begin{aligned}
\alpha&\simeq0.53984854674486,\\
\beta&\simeq0.17308801039842+0.62222795968297i,\\
\mathbb E|q|&\simeq0.74421834184027.
\end{aligned}
\]

The two quadrature orders agreed to about `9e-14`. This is a numerical
stability check, not a proved error enclosure. The radius expression is
the elementary two-variable integral

\[
\int_0^\infty\!\int_0^\infty
\sqrt t\,|\alpha(t-2)+\beta(s-1)|e^{-t-s}\,dt\,ds.
\]

This family is already in an easy radius class. If `Q` is any centered
complex variable independent of `Z`, weighted Cauchy--Schwarz gives

\[
\mathbb E\left|Z[\alpha(|Z|^2-2)+Q]\right|
\le\frac{\sqrt\pi}{2}
       \sqrt{\frac74|\alpha|^2+\mathbb E|Q|^2}
\le\frac{\sqrt\pi}{2}
       \sqrt{2|\alpha|^2+\mathbb E|Q|^2}.
\]

Indeed `E sqrt(T)=sqrt(pi)/2`,
`E sqrt(T)(T-2)^2=(7/4) E sqrt(T)`, and the cross term vanishes because
`EQ=0`. This is an application of the repository's weighted-sector
geometry, not a new global theorem. It shows that the stable full-basis
`n=2` candidates do not identify a new obstruction to the sharp radius
bound.

Within this two-coefficient family, the radius is concave in the real
positive semidefinite Gram matrix of the complex pair `(alpha,beta)`.
Thus an interior stationary Gram matrix is a global family maximizer.
This does not prove that every full-basis maximizer belongs to the family.

## Numerical safeguards and limits

The first runs used a quadratic control variate with the Gaussian-optimal
coefficient `sqrt(pi)/4`. It was too aggressive for heavy-tailed pure
cubics: the `n=8` training radius was about `0.841`, whereas the independent
value was about `0.819`. Those training values were rejected. The refined
pure-cubic runs removed that control variate and enlarged the design.
The fixed-bath runs retained it, always reporting an independent raw
evaluation as well.

The JSON field `iid_se_reference` is only the standard error that would
apply to independent sampling with that empirical variance. It is not a
confidence bound for a scrambled Sobol estimate. Earlier logs call the
same diagnostic `iid_se_upper`; that name should not be interpreted as a
rigorous upper bound. Tensor coefficients are saved in each `.json.npz`
file, so candidates can be checked with new sampling or certified
quadrature without rerunning optimization.

`verify_implementation.py` checks the analytic Rice gradients by centered
finite differences in double precision and checks the tensor fourth
cumulant formula on the normalized Wick monomial (`delta=42`),
`Z_1^2 bar Z_2/sqrt(2)` (`delta=10`), `Z_1 Z_2 bar Z_3` (`delta=6`),
and four independent equal Wick blocks (`delta=10.5`).

The files `full_radius_search.py`, `tensor_invariants.py`, and
`pair_family_quadrature.py` reproduce the search, exact contraction
statistics, and two-coordinate family calculation respectively. The
search does not rule out an unobserved local maximum, a larger finite
dimension, or a non-Gaussian compactification producing a counterexample.
