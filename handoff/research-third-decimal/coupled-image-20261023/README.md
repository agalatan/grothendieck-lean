# Coupled-image continuation — 23 October 2026

This checkpoint contains written proofs and external exact/directed checks,
plus explicitly labeled numerical discovery. No new global endpoint is
claimed. Core majorizer lemmas are now formalized as listed in
`docs/RESEARCH_AUDIT.md`; the full obstruction and Gaussian integrations
remain external. All work was done on `codex/research-audit-20261023` in
the isolated Codex worktree. The shared main checkout and master were not
modified. Heavy numerical runs used separate directories under
`/home/agalatan/apap/codex-coupled-image-20261023/` on `ssh yo`.

Read `PROGRESS.md` in this directory first. The maintained integration and
Lean coverage summary is `docs/RESEARCH_AUDIT.md` at repository root.
The upper obstruction has a real-preprocessor proof and a separate exact
extension to complex preprocessors. In the latter, use physical phase
composition `p*F(p*p_sharp)`, not holomorphic substitution into the real
phase series.

## Exact checks, no external packages

Run these commands from the repository or portable archive root. The
complex extension imports its sibling base checker, so use ordinary Python
for that command. All certificate tools refuse optimized Python.

```sh
python3 -I tools/coupled_preprocess_mixture_certificate.py --output replay-real-mixture.json
python3 tools/coupled_preprocess_complex_certificate.py --output replay-complex-mixture.json
python3 -I tools/coupled_jump_complex_price_check.py --out replay-complex-independent.json
python3 -I tools/coupled_pair_dual_exact.py --out replay-pair.json
python3 -I tools/coupled_jump_exact.py --out replay-jump.json
```

The first certificate must return 67 accepted Bernstein leaves and maximum
depth nine, with a rational strict decimal ceiling `0.711916311229984`.
The complex extension symbolically checks the physical composition and
squared angular-price gap. Its exact positive lower coefficient is
`34254220103996142329/64000000000000000000`.

The pair and finite-jump programs check algebra and finite probability
fixtures. They do not certify Gaussian integration or a global outer cover.
The exact identities and the written proofs are both needed; passing a set
of fixture checks is not itself a proof of the general statements.

## Directed inverse-prefix check

```sh
uv run --with python-flint==0.9.0 python tools/coupled_preprocess_inverse.py \
  --bits 192 --output replay-inverse.json
```

This companion applies to the specified individual real resolvent-filter
class. Its prefix threshold lies between `0.711900642945` and
`0.711900642946`. The shared finite-price theorem covers a broader class,
including all mixtures; do not confuse the two conclusions.

## Proof notes and independent audits

- `preprocess/MIXTURE_PREPROCESSOR_OBSTRUCTION.md`: real charged preprocessor,
  arbitrary even complex multiplier, all mixtures.
- `preprocess/COMPLEX_PREPROCESSOR_EXTENSION.md`: complex physical charged
  preprocessors; same ceiling and multiplier/mixture extension.
- `preprocess/PREPROCESSING_INVERSE_OBSTRUCTION.md`: residual exactification
  and removal of individual self-response reciprocal-affine neutral filters.
- `pair/COUPLED_NEGATIVE_IMAGE_DUAL.md`: reconstructed canonical dual,
  globally valid finite updates, complete negative projection fields,
  conditional Gaussian smoothing and curvature bounds.
- `pair/REMOTE_HARD_FIELD.md`: conditioned actual radial-cubic visible
  image, two radial variables plus an angle, and the failed monotonicity
  shortcut that must not be used.
- `jump/FINITE_JUMP_CERTIFICATE.md`: zero-safe finite jumps and necessary
  image closure for near maximizers without assuming attainment.
- `jump/INDEPENDENT_UPPER_AUDIT.md` and `INDEPENDENT_PAIR_AUDIT.md`:
  independent derivations and scope checks.

## Numerical discovery — droplet only for substantial runs

Pinned numerical environment: Python 3.12.3, numpy 2.3.5, scipy 1.17.1.
The graded saddle and conditioned helpers use the sibling
`fresh_lower_frozen_response_gram.py` only for its frozen contact function;
its source SHA-256 is
`15a863df1e06635370165f3fa922ca019bd036a1652869168e10d7c6d4ba7ef0`.
The archive supplies that file. Its unrelated older sampling functions are
not called by the new tools.

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python tools/coupled_image_saddle.py \
  --fit-power 19 --eval-power 21 --seed 3 --out saddle-replay.json
```

The final tool uses scrambled 52-bit Sobol cell midpoints and refuses
nonfinite normal samples and JSON values. The saved seed-one/two runs used
the earlier sampler and were checked to contain no nonfinite values. A
first seed-three run (remote PID 1484503) hit an exact zero, produced NaNs,
and was rejected; its numerical results are not included or used.
The valid midpoint replacement is remote PID 1485502. Earlier valid PIDs
were 1478825 and 1482921. All these root-owned jobs finished normally; no
other session's process was killed.

`experiments/saddle-19-21-seed3-midpoint.json` includes the source hash and
the calibrated square-root-fourth-defect `0.66` example. Optimizing fixed
negative images supplies no global cap on the all-response norm. The
independent grade-three Gaussian W is a graded limit, not a finite cubic
realization. Analytic majorizer constants do not turn sampled gradients
into certified decrements.

The optimizer discovery for the upper functional is also supplied in
`preprocess/mixture-degree7-discovery.json`. The exact checker, rather than
the optimizer, establishes the theorem. The archive SHA-256 manifest
covers all supplied notes, scripts, ledgers and experiment data.

## Conditioned lower calculation and concrete certificate target

`coupled_image_conditioned.py` integrates W analytically using the exact
Rice/Bessel profile. Its remaining two Gauss-Laguerre rules and angular
trapezoid rule still have no directed error bounds. The final large-argument
Bessel fallback is a floating asymptotic expansion, recorded in its output;
one earlier high-order line-search trial hit a SciPy `ive` nonfinite value
and was rejected without a result file.

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python tools/coupled_image_conditioned.py \
  --outer 128 --remote 128 --angular 256 --binding-defect .66 \
  --out conditioned-replay.json
```

Saved orders 32,64,128 use the same final source hash. Their extra optimized
fixed-dual correction converges near `3.35635e-5`. The helper retains the
complete model's projections, mean modulus, positive/negative image defects
and their algebraic identity.

For the next directed integration, use the following **fixed decimal trial**
instead of relying on optimizer attainment or an exactly certified contact:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python tools/coupled_image_conditioned.py \
  --outer 128 --remote 128 --angular 256 --binding-defect .66 \
  --ell .85657016728 --beta .14769517854546685 --variance .0282998738034 \
  --optimize none --out fixed-field-replay.json
```

This freezes the visible cubic coefficient close to `-0.280365804827`.
The directed target is the sign bound `a_C <= -.006`, with explicit compact
radial tails supplied in `pair/REMOTE_HARD_FIELD.md`. A converged floating
value near `-.00639397` motivates that target but does not certify it.
Once it is proved, the density-L1 transfer bound
`delta_m=min(2,2sqrt(5/m),35/m)` and the analytic `K_m` curvature bound give
an explicit fixed dual correction for an actual finite cubic buffer. That
would still not supply the missing uniform tensor estimate or outer cover.
