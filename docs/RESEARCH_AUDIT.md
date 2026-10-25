# Research audit and coupled-image tools

This branch consolidates the rank-one cap campaign, fresh response-class
obstructions, and coupled-image continuation. Research snapshots and their
replay data live under `handoff/research-third-decimal/`; the maintained Lean
ingredients live in `Grothe/Research/`. The initial audit changes no bound;
the subsequent cover and Hardy-budget refinements below improve both endpoints.

## Current lower continuation: fused law nodes and complete coverage

The strict endpoint is `1.401697049825`, under unchanged `NodeCaps`. The
complete 10,762-box certificate has cap `356710460411/500000000000`, or
`0.713420920822`. It retains two pure-row law nodes and adds three mixed-source
Young nodes. Their single new batch uses original rows 14 and 15 with fixed
theta `177107909/800000000` and kurtosis range `x <= 4/5`. The source tables,
witness and heavy cap closure are unchanged.

The accepted global gain over `1.401696986171` is `0.000000063654`. Exact fusion
and whole-half-line majorant checks supply local bounds; legal interpolation
brackets, 241 binary splits and 280 repricings turn them into a complete cover.
The preserved 10,521-box baseline and the original node/group prefixes are pinned.
51 appended aliases expose existing source nodes. The old cap-9750
region is improved by keeping its law scale and kurtosis, rather than its
uniform row cap. Pruning removes unnecessary branches and unused new nodes.

`tools/needle_fused_global.py --verify` replays the complete forest from durable
inputs. `tools/needle_mixed_nodes.py` rechecks the full mixed source and budget;
its corruption controls reject source, budget, range and majorant changes.
`tools/needle_unshifted_lean.py --check` independently verifies the old canonical
map, all node proofs, every final bound and the guillotine partition, then
reproduces both generated Lean files. Historical LP or fusion records are not
acceptance inputs.

The lower endpoint retains 14 native facts and the same Gaussian hypothesis.
The research cap `0.71342` remains unmet by 939 boxes; accepted B has zero
failures. This is a small global improvement, not an optimality theorem or a
Gaussian norm floor. The current reflected-check records are in
`data/lower-unshifted/verification/`; full default coverage is separate branch CI.

The bounded coupled asymmetric upper experiment did not pass its `0.711950`
discovery gate. Its common-price midpoint calculation is below that threshold,
but its new integral errors are not certified; no exclusion theorem or upper
endpoint follows. The later Rice/Bessel and Schwinger derivation handles the
incumbent's nonconstant radial profile. Numerical normalization checks agree,
but directed integration of the correction moments is still needed. These
research outputs remain under `handoff/research-third-decimal/`.

## Combined upper continuation and validation

Master `46e2a48` contributes the selected-spectrum comparison: explicit shared
error pieces, spectral supports and Gaussian norm caps yield the comparison
`13311891/15625000000000`. The native band-mass check bounds the eighteen
selected energy radii. This replaces the old global energy-comparison interface
in the concrete theorem with `ComparisonInputs`. Its identification with the
Gaussian truncation and norm enclosures remains external, as do energy-table
accuracy and the Hardy input.

Combining that comparison with the forced linear coefficient's deduction from
the same Hardy budget gives tail `30488839/1000000000000000`, residual
`455308278509/500000000000000000`, and upper endpoint
`500000000000000000/355973699864771491 < 1.404598149218`.
No stronger Hardy input is used. The raw rounder, energies, preprocessors and
contour certificate remain fixed. Both the raw contour-tail assembly and this
derived ledger have exact arithmetic checks. The lower endpoint's premise is
unaffected. Combined fresh checks and axiom reports are retained in
`data/upper-preprocess/verification/`.

The prior branch state passed the full default build in
[CI run 39959562283](https://github.com/agalatan/grothendieck-lean/actions/runs/39959562283).
That result applies to its frozen sources; the current merged certificate has
an explicit targeted-build receipt gap and requires its own full branch CI run.

## Earlier upper continuation and validation


`Grothe.fresh_upper` now gives the exact bound
`500000000000000000/355973579786182891 < 1.404598623023` under exactly
the same `DirectHyps`. The concrete `fresh_upper_rounder` has the same
three numerical hypotheses and truncation conditions. The existing finite
head bounds the linear coefficient from below; deducting its known weighted
square from the Hardy budget reduces the tail cap to `3.04888432e-8`.
No source integral, energy entry, preprocessor or numerical premise is changed.
The gain is about `1.235e-8` in the upper endpoint. See
[the derivation and validation](../handoff/research-third-decimal/needle-20261023/UPPER.md).

The historical frozen incumbent exports retain their original source hashes,
tail budgets and proof scope. New exports read the smaller canonical tail cap.
The earlier refined global lower cover had 9,057 boxes and cap `0.713421765375`.
It retains the certified rows, mixed batches, witness and `NodeCaps`, and
gave the strict endpoint `1.401695390488`. Only 43 parent boxes need new
subdivision/mixture choices, producing 344 children; the remaining source/law proofs are reused.
The complete partition and every final box have separate Lean checks. The
endpoint continuation before the latest rebase passed the full Lean build and axiom audit in
[CI run 39901871873](https://github.com/agalatan/grothendieck-lean/actions/runs/39901871873):
345 reported theorems, using 22 of the 82 allowed native facts. The lower
endpoint's dependency set reuses eight old row/batch checks and adds five
cover checks. Upstream has since verified the separate heavy `GrotheCaps`
target's 60 range facts. Its stamp matches this branch's unchanged 140-file
closure; the four remaining rows still require `CapsRest`.

The second, fourth and sixth moments of the actual damped phase have also
been recovered as exact rationals directly from `Upper/Data.lean`. All three
equal the retained comparison inputs. This restores missing numerical
provenance, without discharging the other comparison premises; see
[MOMENTS.md](../handoff/research-third-decimal/needle-20261023/MOMENTS.md) and
[the remaining source gap](../handoff/research-third-decimal/needle-20261023/HS_GAP.md).

Nearby Stein scale nodes expose a further lower-bound route. Two new nodes
using only the original row-14 source and Stein bank lower the exact cap of
box 4302 to `0.7133695405035759`. The standalone Lean `checkBatch` evaluates
to `true`, and an independent audit checks scaling, padding, moments and
the whole half-line. This is a fixed-box improvement, not another global
endpoint. See [the next campaign](../handoff/research-third-decimal/needle-20261023/UNSHIFTED_NEXT.md).

## Integration with current master

The current campaign includes GitHub master `46e2a48`. The earlier `197b82f`
spectral exchange contribution, its two spectral-error
lemmas and canonical signed-head exporter are retained. Both lemmas use only
the standard axioms; the directed exporter pays one coefficient-l1 error
allowance for every admissible spectral price. Its tied-branch phase oracle
is exploratory and changes neither endpoint. The earlier durable cap-recipe
inputs and generation rules are also adopted. These changes do not alter the
lower endpoint hypotheses or source cap data.
The new law-node inputs also live in `data/` and reproduce the generated Lean
files byte for byte. The heavy cap verification stamp still matches.

The preceding rebase was onto GitHub master `9fc3f3d`. Its degree-thirteen
preprocessor and fourth-power tail proof improve the independent,
hypothesis-free upper bound to `1.404951`. The combined tree retains that
result, the new response/Stein/replica and spectral interfaces, and the
verified cap stamp. At that rebase the sharper conditional endpoints were
`1.401695390488` and `1.404598623023`, with unchanged hypotheses and unchanged
endpoint proof sources. The combined axiom registry contains 208 required
theorems and 82 allowed native facts; the targeted saved reports and their
union pass the registry checks. Those replays are separate from the fresh
combined CI build triggered by pushing the rebased branch.

The integrations below record earlier bases; their build logs and numerical
values retain their historical scope.

The endpoint continuation also merges master `5f4b0f4`. Its degree-seven
Haagerup preprocessor improves the independent, hypothesis-free bound to
`1.405364`. The combined README and overview retain that upstream result
alongside the sharper conditional endpoints; the three numerical hypotheses
of the sharper upper theorem are unchanged. The other incoming changes are
CI and collaboration workflow updates.

The final sync additionally includes master `b4b0e55`: holomorphic Gaussian
kernel definitions in `UpperChaos/HardyKernel.lean` and the external tighter
phase-cover script. These support the future proof of `hardy`; they do not
discharge that hypothesis or alter either sharp endpoint. Its status notes
are updated to the combined bound and exact phase-moment recovery.

The work was reviewed and rebased onto GitHub master `6a869c8`. Its changes
relative to the original research base `98f61ec` matter as follows:

- The concrete upper rounder is now defined and structurally justified in
  Lean. `Grothe.UpperChaos.fresh_upper_rounder` takes the three numerical
  inputs `compare`, `energy_close`, `hardy`, with explicit `MemLp X` and
  charge-one conditions for the truncation. Validity, summability and parity
  are derived. The generic `DirectHyps` table theorem still exists.
- The phase cover proves `phiT² ≤ 3`, sufficient for disk-valuedness. It
  does not discharge the stronger external estimates entering `compare`.
  The coupled concrete rounder is outside the separable class excluded by
  this branch's finite-price theorem.
- At that integration base the scalar row/mixed data, parameter cover,
  numerical upper inputs and endpoints matched the original research base. The exact local box-8150 improvement is therefore
  still applicable, with its original analytic premises and local scope.
- Upstream separates the expensive cap ranges into `GrotheCaps`. The
  `CapsRest` interface retains rows 12–15. No `CAPS_VERIFIED.txt` was present
  at this integration base; the stamp checker warns that the full target
  has not been verified. The default lower headline still assumes
  `NodeCaps`. This branch does not claim to have run that heavy target.
- At that integration base the lower certificate used 13 sequential native chunks. Historical
  build/axiom counts in the research snapshots are not validation of this
  rebased tree. The subsequent refined cover adds five native facts, replacing
  the old five cover checks in the new endpoint's dependency set; its eight
  row/batch checks are reused.
- The fixed cubic witness at `ε = 149/200` cannot reach `1.402`: upstream
  constructs a genuine finite Gaussian response with pairing `> 0.71329 >
  500/701`. The Lean module `DiffuseCubicObstruction` checks the finite
  pairing arithmetic under its Gaussian integral bounds; the construction
  and those bounds have external proofs and directed certificates. Joint
  constraints cannot remove this genuine response.
- `ScalarCubicFamilyCeiling` formalizes the conditional arithmetic of the
  scalar-cubic architecture ceiling `< 1.4022581233`, for all complex
  multipliers and scalar/vector norms taken over all Gaussian dimensions.
  This does not bound every smaller fixed-dimensional game. Its Gaussian realization and integration inputs
  remain external. Reaching `1.402` with a real parameter requires retuning within
  the necessary window `0.745928 < ε < 0.766838`; the window alone is not a
  sufficient certificate. This is a witness-family limit, not an upper
  bound on the Grothendieck constant.
- Upstream now proves that multiplication by a common bounded response
  compresses between orthonormal banks to a contraction matrix
  (`ResponseCompression`). Its joint row repricing complements this
  branch's finite common-image descent. Gaussian bank orthogonality,
  projected response extraction and integrated prices still need their
  actual analytic justification.

The authoritative interfaces for this comparison are the actual Lean
declarations and the updated upstream README and Lean inventory. Upstream's
exact neutral-chirp closure transports any realizable base kernel. Our
uniform phase-mixture obstruction excludes its scalar-phase-base subclass,
not closures of arbitrary coupled rounders. Upstream's separate two-bank
cancellation ceiling also has a different scope; neither result generally
subsumes the other.

## What is in Lean

`Grothe/Research/CoupledMajorizer.lean` proves seven public facts:

- the complex Young modulus majorizer, including its zero-safe allowance;
- its exact-price form away from zero;
- the finite-amplitude two-image update with the same `d,e` and correct
  opposite signs;
- finite weighted assembly;
- exact diagonal square completion, finite descent and strict descent.

`Grothe/Research/SemiconvexChord.lean` contains six arithmetic facts from the
rank-one campaign: the lifted chord correction, profile square, same-second-
moment expectation assembly, gate reassembly, mesh allowance and exact
rational mesh value. Gaussian convexity and response extraction are not
assumed to follow from these arithmetic facts.

Both modules are imported by `Grothe.lean`, reported in
`scratch/Axioms.lean`, and their core facts are required by the central axiom
checker. All 13 public declarations typecheck on Lean 4.34.1 with warnings
treated as errors and use only `propext`, `Classical.choice`, `Quot.sound`.
The targeted check ran in an owned droplet tmpfs directory using cached
Mathlib imports, without disk-writing builds. Its log is
`handoff/research-third-decimal/integration-20261023/lean-coverage.log`.

The global saddle exchange, Gaussian projection/integration bounds, density
transfer, and full phase-mixture obstruction remain paper proofs with
external exact/directed checks. They are not newly formalized endpoint
theorems. The full default library and central axiom report are for the
repository's Lean CI; the local validation described here is targeted.

## Research entry points

- [Rank-one local certificate](../handoff/research-third-decimal/rank-one-certification-20261023/PROGRESS.md):
  exact box cap `0.713417810549848`, with source/reduction premises retained.
- [Fresh assessment](../handoff/research-third-decimal/fresh-eyes-20261023/ASSESSMENT.md):
  raw rounding obstructions, scalar moment/tail barriers and signed pools.
- [Coupled-image progress](../handoff/research-third-decimal/coupled-image-20261023/PROGRESS.md):
  exact separable phase-mixture ceiling `D < 0.711916311229984`, including
  complex scalar charged preprocessors; complete missing response fields;
  analytic curvature and finite-cubic density error `≤ 35/m`.
- [Initial assessment](../handoff/research-third-decimal/reassessment-20261023/ASSESSMENT.md):
  the earlier audit and conditional arithmetic refinements, with historical
  validation clearly distinguished.

The conditioned field near `-0.00639397` and extra fixed-dual correction near
`3.35635e-5` are discovery quadrature, not directed enclosures or global
caps. The next numerical proof target is `a_C ≤ -0.006` for the frozen
visible trial. A uniform tensor estimate and outer cover are still missing.
This is a local proof-development target, not a route to `1.402` at unchanged
`ε = 149/200`. For modest gains within this witness, the next complete-cover
campaign first adds nearby unshifted Stein nodes at the remaining blockers.
Reaching `1.402` requires retuning the witness and combining
the common-response compression and complete projected fields. Gate costs
must use the actual chaos projections; raw conditional fields can add a
false penalty. A free common projector can collapse fields to rank one, so
field Gram data alone do not replace Gaussian grading.

## Replay

The saved finite replays use standard-library Python; directed Arb scripts
add `python-flint==0.9.0`. Substantial discovery runs belong on the droplet.
The immutable inputs are included and hashed in
`handoff/research-third-decimal/integration-20261023/INPUTS.json`.
Run `python3 -I tools/research_replay.py --full` for the saved exact suite,
including the seven scalar countermodels. This runs no Lean build or
Gaussian discovery search.
The clean-export replay report is
`handoff/research-third-decimal/integration-20261023/fresh-checkout-replays.json`.
The clone-local source resolver also passes 22 path, rejection, digest and
isolated-import checks. The localized optimizer, exact transport (27
fixtures) and analytic converter were replayed against the exported inputs;
their outputs are stored beside that report. Frozen legacy absolute paths
are mapped only to known checkout-local `handoff/` paths, and their original
SHA checks remain enforced.
The directory READMEs provide the complete commands and proof scope. Quick
coupled checks from repository root are:

```sh
python3 -I tools/coupled_preprocess_mixture_certificate.py --output /tmp/real-price.json
python3 tools/coupled_preprocess_complex_certificate.py --output /tmp/complex-price.json
python3 -I tools/coupled_jump_complex_price_check.py --out /tmp/complex-independent.json
python3 -I tools/coupled_pair_dual_exact.py --out /tmp/coupled-pair.json
python3 -I tools/coupled_jump_exact.py --out /tmp/finite-jump.json
```

The real price replay must certify 67 Bernstein leaves at maximum depth 9.
The complex extension additionally verifies physical phase composition and
an exact polynomial factorization. All full residual coefficients are paid;
the numerical discovery optimizer is not trusted by the certificate.

No supplied books or PDFs, generated Lean binaries, caches, or unrelated
worktree files are included in the commit. Original frozen ledgers retain
their historical hashes; updated integration status is recorded separately.
The older upper-reassessment regeneration scripts still require external
source integration datasets named in their notes. Their saved results and
conditional proof source are retained; those external Gaussian computations
are not represented as fresh-clone replays here.
