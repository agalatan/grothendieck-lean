# Exact mixture upper certificate

Agent-ID: codex-a7c4.

`Grothe.UpperResult` combines the signed cell head, the eighteen contour estimates
and the production GT quadrature certificates. The build and audit commands below
check the endpoint and its transitive axioms. [Hosted verification record](https://github.com/agalatan/grothendieck-lean/pull/534)

The endpoint uses the exact gap

\[
 c-H-E-T=\frac{711962052581159}{10^{15}},
\]

with these rational budgets:

| Quantity | Exact budget | Meaning |
|---|---:|---|
| `c` | `711964618746086 / 10^15` | Lower bound for the finite mixture's linear coefficient |
| `H` | `873503595 / 10^15` | Upper bound for its nonlinear finite coefficient sum |
| `E` | `1467492832 / 10^15` | GT comparison and cell truncation allowance |
| `T` | `225168500 / 10^15` | Infinite tail beyond radial index 250 |

The reciprocal of the gap is `1000000000000000 / 711962052581159`, strictly below
`1.404569241261`. The first GT contour uses radius `1033/1000` and circle
budget `7/5`. Each channel has its own contour and tail allowance.

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
identities. `HeadWitnessSound` proves that the saved finite intervals enclose the
actual signed Hermite grades. Replaying all 64 residues gives a linear
coefficient above `0.71196461874608628686` and a nonlinear head sum below
`0.000000873503594735`. The final theorem uses the outward-rounded budgets
in the table above.

`HeadCompute` first adds the signed channel coefficients, then takes absolute
values. Taking absolute values channel by channel would lose the cancellation on
which the bound depends. The cell polynomial is truncated **after composition**;
`TailSound.cell_truncation_tail` pays for that truncation separately. The finite
GT comparison covers radial index zero as well as the remaining head, and
`MixtureBudget.head_gap_lower` charges that allowance exactly once.

`CircleWideSound` proves the whole-circle estimate from the adaptive covers and
the disk positivity checks. `TailSound` converts the squared rational Hardy
inequalities into infinite-tail bounds for the actual channels.
The GT linear coefficient is the primary constant term times the first
GT energy. The table and its uniform error give a floor of 0.7181579359
for that energy. On each phase channel the first energy equals π/4 and exceeds
0.785398163397. Each of these seventeen channels deducts its own squared
linear lower bound times the squared contour radius from its Hardy budget.
The cell channel uses its full budget. The weighted tail ceiling is
`225168500/10^15`.

`UpperTightRemainders` retains the three public quadrature remainder proofs verbatim.
`GTMass` verifies the seven unweighted band masses. `GTInterface` and
`GTComparison` connect the actual GT rounding to the energy table. `GTClosed` supplies its premises using the
existing quadrature, port, and panel certificates. It does not assume a previous
Grothendieck upper bound. Those shared certificates remain part of the proof.

`MixtureHead.signed_head` supplies the finite polynomial inequalities without hypotheses.
`Assembly.bound_of_checks` combines them with the GT table and contour estimates.
`UpperReplacement.bound_of_table_error` supplies the cell and contour facts.
`UpperReplacement.bound` in `Grothe.UpperResult` applies the closed GT table comparison.
`GammaDagger` defines the phase integral and bounds it using a degree-14
polynomial with an exact trigonometric antiderivative. The endpoint also states
`constant_lt_inv_gammaDagger`, comparing the complex constant with its reciprocal.

The earlier single-rounder head, adjusted Hardy budget, weighted three-band transfer and
looser port error endpoints are retired. The active proof still uses the
underlying Gaussian integrals, interval arithmetic and certified energy table.
The old source is available in the branch history. The two numerical endpoints
have separate import graphs, checked in `scripts/test_local_build_targets.py`.

The arXiv article uses its own six-channel proof and frozen bound. Its Lean sources and data are independent of the eighteen-channel endpoint. [Six-channel bridge](../Grothe/UpperSixResult.lean) · [Article proof](../haagerup-article/anc/README.md).

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

This can take hours. It builds only named computation libraries and writes exact
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
addition to its kernel. The endpoint audit checks transitive dependencies
against `data/axioms/modes/upper-mixture.native.txt`.

Build and audit the upper theorem locally with

```sh
lake build Grothe.UpperResult
set -o pipefail
lake env lean scratch/UpperMixtureAxioms.lean | python3 scripts/check_axioms.py --upper-mixture
```

The focused report checks the exact rational bound, the strict decimal and
the phase-integral comparison against the eighteen-channel native allowlist.

The lower certificate has its own target, `Grothe.LowerResult`. Both sides use
the same definition of the constant in `Grothe.Statement`, together with
finite-dimensional transfer, Gaussian integration and interval arithmetic. Only
`Grothe.MainResult` imports both numerical proofs to form the two-sided theorem.
An upper-only build avoids the lower node caps. Its cold dependencies include the
twelve grade blocks and the even-energy check for the GT energy table.

For a published WIP branch, `scripts/cloud.sh --no-wait --timeout 360 lean Grothe.UpperResult`
builds the upper target and audits its axioms on a GitHub-hosted runner.
The job restores the verified repository build cache from GitHub.
