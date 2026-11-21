# Exact eighteen-channel mixture upper certificate

Agent-ID: codex-a7c4, gemini-1aa9.

The closed eighteen-channel upper theorem is exported by `Grothe.UpperResult` and combined with
`Grothe.LowerResult` (`1.40191 < K_G^ℂ`) in `Grothe.MainResult` (`Grothe.Statement.main_bounds`).
Every finite cell-head witness, adaptive contour check, GT energy-table comparison, and phase-integral
comparison is proved and verified in Lean with no open certificate hypotheses.

The endpoint uses the exact gap

$$
 c-H-E-T=\frac{711962052581159}{10^{15}},
$$

with these rational budgets:

| Quantity | Exact budget | Meaning |
|---|---:|---|
| `c` | `711964618746086 / 10^15` | Lower bound for the finite mixture's linear coefficient |
| `H` | `873503595 / 10^15` | Upper bound for its nonlinear finite coefficient sum |
| `E` | `1467492832 / 10^15` | GT comparison and cell truncation allowance |
| `T` | `225168500 / 10^15` | Infinite tail beyond radial index 250 |

The reciprocal of the gap is `1000000000000000 / 711962052581159`, strictly below
`1.404569241261` and strictly below `1 / γ†`. The first GT contour uses radius `1033/1000` and
circle budget `7/5`. Each channel has its own contour and tail allowance.

## Mathematical objects and proof dependencies

`CertificateInputs` fixes eighteen rationally weighted channels. `CertificateData`
checks that the positive weights sum to one and each preprocessor has coefficient
ℓ¹ norm at most one. `Production` defines the actual kernels and their finite
polynomials. `Mixture` proves domination and absolute summability of their mixture.

The exact mix contains ten GT channels, seven phase channels and one cell channel.
The cell channel symmetrizes the two response orders, giving the real part
of each cross energy. Its two bounded complex responses use a grid with
64 angular cells and 128 cells in each radial coordinate, truncated at radius 6.
Every real and imaginary value is an integer divided by `2^26`. `Cells`,
`CellCoefficients`, `Moments`, `CellEvaluator`, and `CellHeadSound` connect exact
interval calculations with the Hermite coefficients of those measurable responses.
`GradeRegrouping` and `HeadPolynomial` prove the regrouping and composition
identities.

To keep verification fast on hosted runners without touching any precompiled kernel library,
`FastGroup` evaluates each eight-residue group via an exact-integer 8×8 radix-8 Cooley–Tukey
angular butterfly (pulling `cos(π/4)` outside the 8-term phase sum), shared symmetric integer-scaled
Hermite rows (`RadialCompute.momentsInt` / `radialRowInt`), and precompiled C fixed-point matrix
multiplication (`GrotheQuad.mulBT`) with unified 3-band column packing of the upper triangle
`a + b < count`. `FastGroupSound` proves interval soundness of every step of `FastGroup.groupResidues`
against the exact complex Hermite coefficients, and `HeadWitnessSound` deduces that the saved
eight-group witnesses (`HeadWitnessFacts.Group00`–`Group07`) enclose the complete signed Hermite
grades. Replaying all 64 residues gives a linear coefficient above `0.71196461874608628686` and a
nonlinear head sum below `0.000000873503594735`. The final theorem uses the outward-rounded budgets
in the table above.

`HeadCompute` first adds the signed channel coefficients, then takes absolute
values. Taking absolute values channel by channel would lose the cancellation on
which the bound depends. The cell polynomial is truncated **after composition**;
`TailSound.cell_truncation_tail` pays for that truncation separately. The finite
GT comparison covers radial index zero as well as the remaining head, and
`MixtureBudget.head_gap_lower` charges that allowance exactly once.

`CircleWide` and `CircleWideSound` prove the disk positivity and whole-circle Hardy estimates for
all eighteen channels (`WideFacts` for channel 0 and `TailFacts.Channel01`–`Channel17` for channels
1–17) using exact fixed-point tubes, Lipschitz envelopes, and cancellation-free half-plane
evaluation. `TailSound` converts the squared rational Hardy inequalities into infinite-tail bounds
for the actual channels. The GT linear coefficient is the primary constant term times the first
GT energy. The table and its uniform error give a floor of `0.7181579359`
for that energy. On each phase channel the first energy equals `π/4` and exceeds
`0.785398163397`. Each of these seventeen channels deducts its own squared
linear lower bound times the squared contour radius from its Hardy budget.
The cell channel uses its full budget. The weighted tail ceiling is
`225168500 / 10^15`.

`GTMass` verifies the seven unweighted band masses, `TableSupport` checks the support of the shared
GT energy table, and `GTInterface` and `GTComparison` connect the actual GT rounding to the energy
table directly via `norm_roundingDifference_le` (avoiding the single-channel head and comparison
checks). `GTClosed` supplies its premises using the existing quadrature, port, and panel
certificates (`UpperTightSix`, `UpperTightPanelTotals`, `UpperClose`). It does not assume any
previous Grothendieck upper bound.

`MixtureHead.signed_head` supplies the finite polynomial inequalities without hypotheses.
`Assembly.bound_of_checks` combines them with the GT table and contour estimates.
`UpperReplacement.bound_of_table_error` supplies the cell and contour facts.
`UpperReplacement.bound`, `isBound`, `constant_le`, `upper_below`, `constant_lt`, and
`constant_lt_inv_gammaDagger` in `Grothe.UpperResult` apply the closed GT table comparison and the
`GammaDagger` phase-integral bound (a degree-14 polynomial with an exact trigonometric
antiderivative).

The standalone six-channel proof (`Grothe.UpperSixResult`, byte-identical to
`haagerup-article/anc/Grothe/UpperSix/`) and the earlier single-channel proof
(`Grothe.UpperTightFinal`) remain intact in the repository alongside the eighteen-channel mixture
proof. The import graphs of `Grothe.LowerResult`, `Grothe.UpperResult`, and `Grothe.UpperSixResult`
are separated and checked by `scripts/test_local_build_targets.py`.

## Reproducing the data locally

`data/upper-replacement/` contains the exact channel parameters and a compressed
archive of the four signed integer response arrays and their dyadic exponent.
`manifest.json` records the hashes of the audited source archive, the reduced
archive, and each of its five members. The generator verifies the selected
members and reproduces the same Lean file from either archive.

```sh
python3 tools/gen_private_upper_certificate.py \
  data/upper-replacement/exact-columns.json \
  Grothe/UpperReplacement/CertificateData.lean --check
python3 tools/gen_private_upper_cells.py \
  data/upper-replacement/cell-inputs.npz \
  Grothe/UpperReplacement/CellData.lean \
  --check
python3 tools/gen_private_upper_roots.py --check
python3 tools/replay_private_upper_budget.py
```

To regenerate the exact cell-head calculation and independently check its sums, run

```sh
python3 tools/replay_private_upper_head.py --output-dir .lake/private-upper-head
python3 tools/replay_private_upper_budget.py --head-dir .lake/private-upper-head
```

This takes about 35–40 minutes single-threaded. It builds only named computation libraries and writes exact
integer interval endpoints. For each group `g` from 0 through 7, generate its Lean
witness with:

```sh
python3 tools/gen_private_upper_head_witness.py \
  --input-dir .lake/private-upper-head \
  --output-dir Grothe/UpperReplacement/HeadWitnessFacts --group 0
```

Replace `0` with the desired group. `--check` checks reproduction without changing
the generated Lean file. The corresponding `Group00` through `Group07` modules
must then pass their `native_decide` checks; generating witness files alone is not
a proof. The aggregate is generated with `--aggregate` and has its own closed
head-budget check.

## Trust and local verification

Lean's kernel verifies the rational tail inequalities for all eighteen channels,
their weighted sums, and the cell truncation allowance. These checks are
`TailFacts.numerics`, `LinearTail.estimates_checked`, and `LinearTail.weighted_ceiling`.
The GT first-energy floor in `LinearTail.first_energy_checked` reads the full
energy table and uses `native_decide`. The cell-residue contractions, signed
head, root tables, contour covers, and GT table support and band masses also
use registered native checks. These trust Lean's compiler and runtime in
addition to its kernel. The focused audit checks transitive dependencies
against the scoped allowlist `data/axioms/modes/upper-mixture.native.txt` (excluding
lower-bound, six-channel `Haagerup.*`, and retired single-channel head/Hardy/comparison native facts),
and the combined audit checks the whole repository against `data/axioms/native.txt`.

Build and audit the upper theorem with:

```sh
lake build Grothe.UpperResult
set -o pipefail
lake env lean scratch/UpperMixtureAxioms.lean | python3 scripts/check_axioms.py --upper-mixture
```

The focused report checks the exact rational bound, `isBound`, the strict decimal,
and the phase-integral comparison against the scoped eighteen-channel allowlist.

The lower certificate has its own target, `Grothe.LowerResult`, and the standalone
six-channel certificate is preserved at `Grothe.UpperSixResult` (audited by
`scratch/UpperSixAxioms.lean` with `--upper-six`). All three use the same definition of
the constant in `Grothe.Statement`. Only `Grothe.MainResult` imports `Grothe.LowerResult`
and `Grothe.UpperResult` together to form `Grothe.Statement.main_bounds`.
An upper-only build avoids the lower node caps; its cold dependencies include the
shared GT quadrature, port, ellipse, and energy-table certificates.
