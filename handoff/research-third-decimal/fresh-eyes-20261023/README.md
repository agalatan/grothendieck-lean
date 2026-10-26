# Fresh-eyes research package — 23 October 2026

Start with `ASSESSMENT.md` in this directory. The maintained integration and
Lean coverage summary is `docs/RESEARCH_AUDIT.md` at repository root. The
global Grothendieck endpoints have not changed; upstream now has the narrower
concrete upper interface described in that summary.

## Proof notes

- `upper/BILINEAR_HANKEL_OBSTRUCTION.md`: arbitrary two-map, one-coordinate
  alternating-functional ceiling.
- `ONE_COORDINATE_GAP.md`: strict raw-score gap for ordinary one-coordinate
  responses, mixtures and scalar linear OU contractions.
- `upper/neutral/NEUTRAL_GAUSSIAN_OBSTRUCTION.md`: strict raw-score gap with
  neutral Gaussian or globally even ordinary Gaussian auxiliaries. Actual
  finite quadratic neutral drivers are included when the stated symmetries
  hold. No nonlinear final preprocessing is included.
- `lower/EVEN_REAL_GAUSSIAN_EXTENSION_AUDIT.md`: independent audit of that
  extension.
- `barriers/RADIAL_SPECTRAL_TAIL_REPAIR.md`: seven exact repaired laws passing
  the old 671 cuts and degree-six scalar PSD tests; later failures retained.
- `barriers/MOMENT_EXTENSION.md`: infinite scalar moment-hierarchy projection
  theorem, with positive first moment and without upper growth bounds.
- `lower/FULL_HESSIAN_AND_FLAT_SECTOR.md`: exact fixed-image Hessian reduction,
  approximate flat sector, conditioned discovery experiments and limitations.

New paper proofs plus exact/directed external computations are distinct from
Lean formalization. The obstruction and moment-hierarchy arguments here
remain external; the separate integration summary lists the core majorizer
and semiconvex arithmetic lemmas that are now in Lean.

## Portable replay

Run commands from the extracted archive root. The `uv` commands require
network access only if their pinned dependencies are not already cached.
Fraction-based exact checks use the Python standard library. New data and
tools have SHA-256 hashes in the archive manifest.

```sh
python3 -I tools/fresh_lower_exact.py
python3 -I tools/fresh_barrier_moment_extension.py --out /tmp/moment-extension.json
python3 -I tools/fresh_barrier_negative_tests.py --out /tmp/barrier-negative.json
python3 -B -I tools/fresh_barrier_verify_repairs.py \
  handoff/research-third-decimal/fresh-eyes-20261023/barriers/repair-*-law-exact.json \
  --out /tmp/exact-repairs.json
uv run --with python-flint==0.9.0 python tools/fresh_upper_hankel_certificate.py \
  --mesh 50 --bits 160 --output /tmp/hankel.json
uv run --with python-flint==0.9.0 python tools/fresh_one_coordinate_gap.py \
  --out /tmp/one-coordinate-gap.json
uv run --with python-flint==0.9.0 python -O tools/fresh_upper_neutral_certificate.py \
  --mesh 1200 --bits 192 --output /tmp/neutral.json
```

The fraction checkers and one-coordinate gap checker refuse `-O/-OO` rather
than disabling proof assertions. The Hankel, neutral and incumbent Arb
checkers use explicit exceptions and work under optimization mode.
The finite-law checker imports the adjacent frozen verifier, and each saved
law contains its source tables and old cut functions. It does not need the
original shared checkout. The lower discovery scripts similarly use an
adjacent hash-pinned frozen fixture; see `lower/PROVENANCE.md`.

## Discovery experiments

The full-Hessian and conditioned quadrature commands are in the lower proof
note. Their dependencies are NumPy/SciPy, and their results are not interval
certificates. Portable replays from `/tmp` with Python isolated mode passed.

The quadratic-phase response engine and its calibrations are described in
`upper/quadratic/README.md`. The 557-column old pool is frozen in
`pool/inherited-chirp-pool128.json`. All freshly priced columns have **unpaid
infinite tails**, so finite-pool scores are optimistic diagnostics.

```sh
uv run --with numpy --with scipy python tools/fresh_pool_asymmetric.py \
  --out /tmp/asymmetric-pool.json
uv run --with numpy --with scipy python tools/fresh_replay_priced_pool.py \
  --out /tmp/priced-pool.json
```

`barriers/HIGHER_GRADE_PRICING.md` records the bounded grade-five/seven
campaign. No optimizer run proves family optimality. Source paths in older
provenance and discovery JSON are historical references; executable replay
dependencies are frozen locally.

## Actual incumbent and tail-aware pricing

`upper/incumbent/INCUMBENT_POOL.md` explains the frozen exact Lean inputs,
Arb coefficient export, once-only conditional tax and scaled LP. Its
`INDEPENDENT_AUDIT.md` records a separate standard-library rational prefix
and full tax reconstruction. These retain the inherited DirectHyps premises.

```sh
python3 -I tools/fresh_incumbent_exact_prefix.py --out /tmp/incumbent-exact.json
uv run --with python-flint==0.9.0 python -O tools/fresh_incumbent_column.py \
  --frozen handoff/research-third-decimal/fresh-eyes-20261023/upper/incumbent/frozen-inputs.json \
  --bits 192 --output /tmp/incumbent-arb
uv run --with numpy --with scipy python tools/fresh_incumbent_pool.py
uv run --with numpy --with scipy python tools/fresh_replay_incumbent_pricing.py \
  --out /tmp/incumbent-priced.json
uv run --with numpy --with scipy python tools/fresh_parseval_pool.py \
  --out /tmp/parseval-pool.json
```

`pool/PARSEVAL_POOL.md` supplies the analytic complement-energy inequality.
Its self-kernel energies and individual tail charges are floating estimates,
so this is discovery rather than a certified improved endpoint. The prior
optimistic mixture's estimated tail cost exceeds its gain. Individual charges
can also lose signed cancellation in the whole mixture.
