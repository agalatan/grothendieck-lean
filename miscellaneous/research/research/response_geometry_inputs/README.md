# Archived response-geometry replay inputs

The source laws for the joint-fibre and genuine-cubic experiments live in
the already delivered `joint-fibre-20261023` and
`genuine-cubic-obstruction-20261023` bundles. They are external inputs to
the replays, rather than duplicate snapshots in the repository. Extract
the bundles and pass their directories explicitly. Missing files are
reported before any certificate computation starts. The default log
directories are script-relative, under the repository's ignored `logs/`.

The wrappers require Python with `python-flint==0.9.0` and NumPy. Their
certificate replays do not call discovery optimizers. For example, from
the repository root on the droplet, with the two bundle roots assigned:

```sh
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 -I tools/run_joint_fibre_checks.py \
  --inputs "$JOINT_BUNDLE/inputs" --logs logs/joint-fibre
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 -I tools/run_genuine_cubic_checks.py \
  --inputs "$GENUINE_BUNDLE/inputs" --data "$GENUINE_BUNDLE/data" \
  --logs logs/genuine-cubic
```

These are separate experiments with the proof scopes stated in
`docs/JOINT_FIBRE_EXPERIMENT_2026-10-23.md` and
`docs/GENUINE_CUBIC_DIAGNOSIS_2026-10-23.md`. The atomic laws certify only
the named finite relaxation constraints. In particular, the earlier 7234
law fails newer common-Stein cuts; replaying its old certificate does not
make it a genuine Gaussian cubic law or validate it for the stronger cut
bank. The genuine finite Gaussian obstruction has a separate paper proof
and Arb constant replay. None of these commands asserts a new
Grothendieck endpoint or formalizes the analytic bridge in Lean.

## Exact source bytes

The common audit, row profiles and 7234 law are identical in both bundles.
The joint-fibre algebra controls also use laws 5661, 1247 and 8701. The
following SHA-256 values identify the delivered source bytes; the
individual certificate verifiers additionally enforce their own source
bindings.

From `joint-fibre-20261023`:

```text
d293c7153b09316e77f6514c9ba121b6c6039f793b3e8373ab6759ffd27cf655  inputs/binding-audit.json
56a4bbcf744d335f7ede90f68dab8d41daf8b7544c62bfd112adca9c15e3d559  inputs/row-profiles.json
b0f521003dede3cb66cef88b17de2f2ddbcb51e6dfcb8b71beaa54de3d57178d  inputs/radial-complete-7234-exact.json
6befba109124d4fad44e0442c4eec2dec3670b2672f1e095c1bbedf8358ad4d0  inputs/radial-complete-5661-exact.json
ae090d4add17104c4782d1d402c6507dfb4561e55c8db52b43aff6d2839a3ca9  inputs/radial-complete-1247-exact.json
8fff11bb5873edb0abbb6bb0180851b4620f8546803c354b3229d14a1839fe39  inputs/radial-complete-8701-exact.json
```

From `genuine-cubic-obstruction-20261023`:

```text
c6d9531e2d63db61a69167fd0efd5efd002e06af4950ebe2b83581bc12f91da5  data/replacement-joint.law.json
2696d5751062e6064320ddc05a12fdf4f43125b89d43bacdc6ba51548cfd4484  data/replacement-joint.response.json
759daaa6540ac54fa7bdc4f0781c774e0d94efe64bfcb57e14104236a29543be  tools/verify_radial_countermodel.py
```

The missing radial checker is now tracked at
`tools/verify_radial_countermodel.py`, byte-for-byte from that bundle. It
also supplies the exact `cut`, `table` and `solve3` helpers imported by
`tools/rationalize_replacement.py`. Use `python3 -I`, without `-O` or
`-OO`, because the inherited checker uses assertions for exact checks.

The genuine-cubic wrapper reuses these tracked files, whose bytes match
the corresponding archived data files, rather than loading duplicate
copies from the bundle:

```text
4cf1b3d57ae013810096bbf735903716e16ff9379402c38752d1f4f8c2c3a9ad  tools/joint_fibre_upper_7234.json
953e8ddd550ee6393c3384ce52d07e943a69c283050aa612942b6da3685e9df0  tools/joint_fibre_moments_1600_256.json
85c9688762385affb0614c2b4b419e717dde9bef77377ddd9d307d9ab0067bff  tools/joint_uniform_nodes_7234.json
```

The last file is archived as `data/additional-node-certificate.json`.
The first two have the same basenames under the archived `data/`
directory. The response-lift experiment has its own existing
`tools/replay_response_lift_experiment.py --root <extracted-bundle>`
interface; it likewise requires the complete delivered bundle.
