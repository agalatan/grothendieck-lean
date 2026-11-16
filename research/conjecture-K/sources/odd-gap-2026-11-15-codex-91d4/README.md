<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/README.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Remaining odd-gap continuation

Agent-ID: **codex-91d4**. Issue **#436**. 15 November 2026.

Read `REPORT.md` for the Phase0 decision and scope. This package contains
new sufficient regions, bounded numerical diagnostics, a certified spectral
node, and two distinct short-interval approaches. Direct boxing remains
unresolved; two certified endpoints plus analytic curvature succeed on
[469/1000,471/1000]. This does not prove the universal averaged Psi premise or the full
all-sector cap. The general-driver all-sector consequence still requires
the separate pointwise A/B premise(P). The new restricted-driver assembly
uses a7c4's author-level cone certificate to discharge (P) for
r_B=kappa r_A, |kappa+4|<=3: the proved odd regions then give S+99e-6,
improving to **S+79e-6 for r_B=-2r_A**, at the same explicit trial.
Both the driver relation and regional odd restriction are essential.

## Evidence and runtime inputs

| Lane | Evidence | Entry point |
|---|---|---|
| Sector-dominant cones | New author-level P; exact scalar C; inherited remote potentials | `verify_sector_cones.py` |
| Signed energy slack and six improved regions | New author-level P; exact20-cell continuation and scalar C; inherited global profile caps/moments | `budget/verify_energy_slack.py` |
| Finite directional matrix reduction | New author-level P; exact scalars and inherited radial inputs; large-shift exterior only | `analytic-geometry/verify_directional_scalars.py` |
| Global shift-curvature envelope | Author-level P bounds the operator norm of N'' by6000 and interpolation error by750h²; scalar C only | `analytic-geometry/verify_shift_curvature.py` |
| Restricted-driver all-sector assembly | New author-level P and scalar C; inherits a7c4's author-level even cone and our proved regional odd domains | `restricted-driver-assembly/verify.py` |
| Genuine-core odd-gap diagnostics | N only, no integral enclosure | `numerics/gap_probe.py`, `controls.py`, `summarize.py` |
| Compact centered matrix diagnostics | N only; no compact shift cover | `analytic-geometry/centered_matrix_probe.py` |
| Spectral pilot | One exact shift q=47/100; author-level interval C, not a shift cover | `spectral-pilot/verify.py` |
| Optional shift-interval pilot | UNRESOLVED on [469/1000,471/1000]; no interval certificate | `spectral-pilot/verify_interval.py` |
| Optional endpoint interpolation | Fresh endpoint C plus author-level curvature P; margin7/1000 on [469/1000,471/1000] only | `spectral-interpolation/verify.py` |

The sampled matrix margins are N, whereas the node pilot accepts only its
one interval-certified matrix node. The interval extension reached its
30,000-evaluation limit in 2.36 seconds without acceptance. The separate
endpoint-interpolation method succeeds on the same short interval. None
proves the uniform centered-matrix inequality over all shifts.

## Isolated replay

From this directory, the standard-library default is:

```sh
python3 -I -B replay.py --output /tmp/codex-91d4-odd-gap-exact
```

It creates a **new** directory, copies only an explicit source/input
allowlist, runs the five exact checkers and their-O rejection controls,
and records logs, hashes, versions and `RECEIPT.json`. It refuses an
existing output directory and never writes into the original lane files.
No old ignored handoff path is imported.

The curvature checker verifies a rational envelope and conditional
interpolation margins. It performs no matrix integration and accepts no
matrix node or shift interval. See `analytic-geometry/SHIFT_CURVATURE.md`
for the author-level analytic argument.

The restricted-driver checker freshly runs the bundled core scalar
source and checks the .01 U-cost allocation, both deficit signs and a
fully shared genuine example. Its inherited even quadrature is not
rerun. See `restricted-driver-assembly/PROOF_NOTES.md` and SOURCE_MAP.json
for the exact dependencies and pending review labels. The fresh five-check
replay passed in **0.703 seconds**.

The two input files named `region_result.json` and
`inherited_remote_augmented_result.json` are hash-bound, inherited
certified inputs. They are not saved N search outputs. Frozen field
definitions and rational candidate boxes are the only numerical-lane
JSON inputs copied. Fresh `initial.json` is generated before the
refinement and summary consume it; saved `initial.json`, `refined.json`,
`summary.json` and matrix result files are never copied as runtime inputs.

To regenerate the bounded diagnostics, use a Python with NumPy/SciPy:

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I -B replay.py \
  --numerics --output /tmp/codex-91d4-odd-gap-numerics
```

This runs the fixed2^14 bank and2^16 shortlist, implementation controls,
fresh summary, and the centered-matrix probe. It installs no dependencies
and forces one BLAS/OpenMP thread. Numerical completion is reported as N,
not certificate acceptance.

To include the one-node interval pilot, with clang++ available:

```sh
python3 -I -B replay.py --spectral-pilot \
  --output /tmp/codex-91d4-odd-gap-one-node
```

The default pilot has at most30000 cell evaluations and45 seconds for
its bounded engine, at q=47/100 only. `--pilot-limit 6000` reproduces
the smaller unresolved attempt. `--pilot-seconds` is bounded by55.
The wrapper rebuilds the interval executable, regenerates centering
constants and the tail, and runs its unsafe-compilation/optimizer and
impossible-target controls. No saved pilot result is an acceptance input.

To replay the separate short-interval attempt:

```sh
python3 -I -B replay.py --spectral-interval \
  --output /tmp/codex-91d4-odd-gap-short-interval
```

This copies the point-pilot sources plus only `spectral_interval.cpp` and
`verify_interval.py`, and runs the latter on [469/1000,471/1000]. It does
not run the node pilot unless `--spectral-pilot` is also supplied. The
same bounded limit/time options apply independently to each requested
pilot. The recorded interval attempt was UNRESOLVED after 30,000
evaluations and 15,044 leaves, not a timeout. Its midpoint-only dependency
widths are diagnostics, not a rigorous irreducible-width lower bound.

To replay the successful interpolation approach separately:

```sh
python3 -I -B replay.py --spectral-interpolation \
  --output /tmp/codex-91d4-odd-gap-interpolation
```

This copies only its explicit source allowlist and bundled analytic
curvature note/checker. It recomputes both endpoints .469 and .471 with
strict margin .01, checks the curvature scalar envelope6000, and subtracts
the exact chord penalty .003 to obtain margin .007 throughout the
interval. It runs ten negative controls. The analytic curvature argument
remains author-level P; the replay does not formally verify that proof.
No saved endpoint result is copied or trusted. The shared `--pilot-limit`
applies per endpoint, at most30,000; `--pilot-seconds` must be at most45
when interpolation is requested. This option runs neither other spectral
pilot unless explicitly requested.

The interval conclusion is an operator bound. Restricting a remote field
to this shift annulus does not preserve the zero mean needed to cancel
the constant Q/nu centering term. An averaged odd-cost conclusion still
needs the remaining shifts and their cross terms accounted for.

All four options may be combined. The receipt has separate exact,
numerical, node, direct shift-interval and interpolation statuses. Each wrapper can exit
successfully while recording an UNRESOLVED engine result; the driver
preserves that result and its internal return code. An UNRESOLVED pilot
remains UNRESOLVED even when all exact regional checks pass. A successful
node is recorded as ONE_NODE_PASS; successful interpolation records only
ONE_INTERVAL_PASS_VIA_INTERPOLATION. Neither becomes global PASS, and a
successful interpolation does not overwrite direct boxing's UNRESOLVED.
The driver itself also rejects-O/-OO.

## Review boundary

The new analytic statements are author-level P with internal cross-checks;
they are not Lean theorems or external-review upgrades. The checkers verify
their specified scalar premises, not every analytic argument. Inherited
profile, moment, remote-potential and benchmark inputs retain their
documented provenance. See the lane notes and `REPORT.md` for the remaining
compact-matrix and averaged-odd gaps.
