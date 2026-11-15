<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/NUMERICAL_N2_N4.md (file dated 2026-11-13). Only this line was added. -->
# Independent execution: dimensions 2 and 4

Agent ID: codex-a713. Numerical work completed 2026-11-13. This file reports computations, not bounds on the global supremum.

## Completed scope

For each of n=2 and n=4, all three energies u=.02,.03,.0463 have **50 distinct starting paths** over the full complex Wick basis (dimensions 6 and 40 respectively). Every objective and gradient used the full fixed training set of 2^20 scrambled Sobol points. Coefficients use their exact Gaussian norm, not empirical normalization.

Initial normalized-coordinate L-BFGS exposed a stopping problem: parameter norms could drift, artificially reducing its coordinate gradient. Consequently every saved path was polished by normalized-retraction sphere L-BFGS with projection vector transport and the intrinsic gradient criterion ||grad_sphere R||≤1e-5. All **300/300 paths** in these two dimensions pass that criterion after independent gradient re-evaluation. The initial and polished endpoints were both preserved: **600 endpoint tensors**, representing 300 paths, not 600 independent restarts.

All 600 endpoints were independently evaluated using eight new polar-Gaussian Sobol scrambles of 2^19 points each, total 2^22 per endpoint. Before evaluation, each tensor was rotated using its training content direction. This fixed rotation preserves the exact Gaussian functional and reduces sampling variance near a Wick monomial. All content vectors were transformed back to the original coordinate frame before storage.

The largest first-validation value in each cell selected one frozen tensor. Each of these six selected tensors then received a **fresh 2^24-point holdout**, eight independent scrambles of 2^21 points each. The holdout used a phase-aligned Wick-monomial control variate with independently quadrature-computed expectations. It does not re-optimize coefficients or re-select the tensor on the holdout data. Standard errors below measure between-scramble randomized-QMC uncertainty via the delta method; they are neither deterministic bounds nor global optimization errors.

## Frozen-tensor holdout results

| n | u | R of selected tensor | Standard error | 95% halfwidth, t(7) | Exact-formula fourth excess |
|---:|---:|---:|---:|---:|---:|
|2|.02|.069142761554|.000000173829|.000000411041|41.9986036749|
|2|.03|.078579543920|.000000157389|.000000372165|41.9987481633|
|2|.0463|.087602476099|.000000862897|.000002040427|39.9678500841|
|4|.02|.069122576396|.000001846351|.000004365926|41.9438036338|
|4|.03|.078561651015|.000000855400|.000002022699|41.9548100840|
|4|.0463|.087583916156|.000002558616|.000006050166|40.0153882436|

The fourth moments use the algebraic Wick product formula evaluated in floating point, not sampled fourth moments. Complete coefficients and direction-wise contents are retained in the following machine-readable files:

* [n=2 holdout](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/holdout_cv_peak_n2_summary.json)
* [n=4 holdout](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/holdout_cv_peak_n4_summary.json)
* [n=2 all 300 validation summaries](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validation_peak_n2_polar_p19_r8_summary.json)
* [n=4 all 300 validation summaries](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validation_peak_n4_polar_p19_r8_summary.json)
* [Relative matrices and shell decompositions](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/n2_n4_structure.json)

The first-stage and holdout values differ materially. For example, the n=4 top-energy training maximum was .0895645683, first-validation selected value .0874970609, and its precise holdout is .0875839162. Dimension-dependent training maxima are therefore not reliable evidence that the true extremum grows with dimension.

## Tensor structure and comparison with known families

At u=.02 and .03 the selected n=2 tensors have more than 99.998% of their energy in one rotated Wick monomial. Their measured values are consistent with being slightly below the exact monomial ratios .0691430805504 and .0785798985064. In n=4 the corresponding shares are 99.921% and 99.936%, and the selected tensors are measurably worse than the exact monomial. The optimizer's sample preferences account for this; an empirical optimizer is not an exact extremal classification.

At u=.0463, the n=2 selected tensor has 97.3684459% Wick energy and 2.6293687% XP energy. Only 0.00218539% lies outside these two shells. After rotating to its best Wick direction and dividing by the Wick polynomial coefficient, its dominant part is

\[
X\{(|X|^2-2)+(0.05607749+0.22553039i)(|Y|^2-1)\}.
\]

The total energy normalization is recorded by the actual saved coefficients. The selected tensor is very close to the known one-driver self-interaction family. Its full tensor does have additional small shells, so a certificate restricted exactly to that family does not automatically apply to the saved tensor.

The n=4 selected top-energy tensor has 97.4495403% Wick energy, 2.4847986% XP energy and 0.0656611% energy in all other shells. In the same relative normalization its XP matrix is predominantly i times a Hermitian matrix, with approximate Hermitian eigenvalues −.1157181,.0036049,.1901061. Its real Hermitian part has Frobenius norm .03811, compared with .22258 for the imaginary Hermitian part. Thus this tensor too lies near the already identified self-interaction-plus-quadratic family, with a more distributed imaginary perturbation.

The n=2 top-energy holdout exceeds the pure Wick value .0875653042342 by .000037171865 (about 43 reported standard errors). The record's pure imaginary tau=.1 example has ratio .0875763291754, so it does not exhaust the numerically observed improvement. This does not endanger the .10 threshold in these computations.

**Proved here:** R_n(u) is nondecreasing in n, because a tensor in n variables embeds unchanged in n+1 variables, and the additional content coordinate vanishes by independence and zero mean. The observed frozen n=4 tensor values being lower than n=2 therefore demonstrate limitations of the sampled search, not a failure of that monotonicity. They provide no evidence of a strict increase of the true supremum. In particular, the n=2 candidate can be embedded in all higher dimensions, giving the same numerical lower-bound example there.

## Reproduction and process constraints

Implementation files: [batch_optimise.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/batch_optimise.py), [refine.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/refine.py), [validate.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validate.py), [holdout.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/holdout.py).

Commands used the isolated Python interpreter /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 with -I, and BLAS/OMP thread counts of one. This worker ran only one computational process at a time, coordinating its slot with the parent and certificate worker. Each invocation had a 1,350-second internal limit; actual runs here were at most 230 seconds. Initial optimization and refinement logs are named run_batch_n2_*, run_batch_n4_*, run_refine_n2_*, run_refine_n4_* inside this same audit directory. No existing research-record file was modified.
