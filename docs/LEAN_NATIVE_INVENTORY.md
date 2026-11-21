# Native source inventory

This inventory describes the native facts (`native_decide`) allowed for the single `Grothe` target: those of the lower
bound by family and module pattern, and the evidence recorded for upper-bound facts. The complete allowlist is
`data/axioms/native.txt`, read by `scripts/check_axioms.py`. The default report is `scratch/Axioms.lean`, with its
required declarations in `data/axioms/required.txt`; CI checks it on every pushed branch, and on the merged tree before
a pull request lands.

The proof-check workflow also audits two focused upper-only reports against their own scoped native
allowlists (neither falls back to `data/axioms/native.txt`):

* **Eighteen-channel mixture (`--upper-mixture`)**: `scratch/UpperMixtureAxioms.lean` audited against
  `data/axioms/modes/upper-mixture.native.txt`. It covers the eight cell-head residue groups
  (`HeadWitnessFacts.group00_checked`–`group07_checked`), the aggregate signed head
  (`HeadWitnessFacts.head_checked`), the root tables (`RootData.roots64_eq`, `roots128_eq`), the
  GT first-energy floor (`LinearTail.first_energy_checked`), the eighteen adaptive contour checks
  (`WideFacts.first_gt_region`, `first_gt_circle`, `TailFacts.channel01`–`channel17`), the
  unweighted GT band-mass and support checks (`GTComparison.mass_checked`, `table_within`), and the
  shared GT energy-table, phase-cover, phase-moment, port, and ellipse facts (`GTClosed.table_error`).
  It explicitly excludes lower-bound, six-channel `Haagerup.*`, and retired single-channel head/Hardy/comparison
  native facts. [Eighteen-channel allowlist](../data/axioms/modes/upper-mixture.native.txt) ·
  [Certificate notes](UPPER_CERTIFICATE.md).
* **Standalone six-channel (`--upper-six`)**: `scratch/UpperSixAxioms.lean` audited against
  `data/axioms/modes/upper-six.native.txt`. It covers the two cell witnesses, both overlap-table checks,
  the weighted head, and each channel's disk and circle checks. The rational tail comparisons reduce in
  the kernel. [Run the upper-only audit](../README.md#building) ·
  [Six-channel allowlist](../data/axioms/modes/upper-six.native.txt).

Archived upper variants have separate preserved inventories under
`miscellaneous/other-bounds/snapshot/data/axioms/`; they are not active permissions.

## Lower bound

Every native fact of the lower bound is one sequential exact computation; most of them sit in modules of their own, so
that Lake checks them in separate processes. All of them are in the axiom closure of `lower_target` and `main_bounds`,
which `scratch/Axioms.lean` reports. Below, `KK` is the index of a cap row in `rowData` (`00`–`13`), `SS = KK + 1` the
number of its Stein row (`01`–`14`), `i` a node of its cap table and `J` a block of consecutive nodes or pieces.

| family | facts | module | what is checked | used by |
|---|---|---|---|---|
| row checks | `Grothe.Lower.certRowSS` | `Grothe/Lower/Cert/RowSS.lean` | `checkRow rowSS` (Stein nodes) or, for the rows 0.4 and 0.6, `checkSpecRow rowSS` (spectral nodes) | `rowData_facts` |
| mass row: cells | `Grothe.Lower.certMassRow` | `Grothe/Lower/Cert/MassRow.lean` | `checkSpecCells massRow` | `mass_law_bound` |
| mass row: node caps | `Grothe.Lower.massCapsOK` | `Grothe/Lower/MassFacts.lean` | `φ_c(s/δ) ≤ c` at every node `(s, c)` of the mass row's table | `massCaps` |
| envelope | `Grothe.Lower.certEnvelope` | `Grothe/Lower/Cert/Envelope.lean` | `checkEnv rowData massS envB envCells` | `profile_bound` |
| node caps: range facts | `Grothe.LowerAnalytic.rowKKAnchorRangeJJ` | `Grothe/LowerAnalytic/CapRowKK/AnchorRangeJJ.lean` | `rangeOKNu` over consecutive whole-fibre nodes (anchored and global) | `vertexCapsRowKK`, through `nodeCapNu_of_rangeOK` |
| node caps: coverage facts | `Grothe.LowerAnalytic.pieceCover_KKx<i>` | `Grothe/LowerAnalytic/CapPieces/CKKx<i>.lean` | `pieceCoverFastOK`: the pieces of a localised node cover the fibre space up to the symmetries of the potential | `nodeCap_KKx<i>`, through `pieceCoverOK_of_fast` |
| node caps: piece facts | `Grothe.LowerAnalytic.pieceRange_KKx<i>_<J>` | `Grothe/LowerAnalytic/CapPieces/RKKx<i>_<J>.lean` | `pieceRangeOKNu` over consecutive pieces of a localised node, on one grid | `nodeCap_KKx<i>`, through `pieceOneOKNu_of_range` |
| node caps: chord facts | `Grothe.LowerAnalytic.chordsOKRowKK` | `Grothe/LowerAnalytic/CapRowKK/Assembly.lean` | `chordOKLow`: the cap of every chord node of the row is above the chord of its two vertex nodes, at the vertex caps lowered by `10⁻¹²` | `capsRowKK`, through `nodeCaps_of_vertexCapsNu` |

The generators write these modules and their lines of `data/axioms/native.txt`: `tools/gen_lower_data.py` the row
checks, the mass row's facts and the envelope; `tools/gen_tail_caps.py` the node-cap facts, which it also lists in
`data/tail-caps/native.txt` ([CAPS.md](CAPS.md)). The node-cap facts take about 340 CPU-hours in all, dominated by the
piece facts; CI replays them from a verified build cache. No per-fact timing is recorded here.

## Upper bound

**Exact production phase moments (#40(b)).** `PhaseMomentEval` integrates the
integer polynomial obtained by clearing arbitrary rational denominators.
`integral_phiT_pow_even` in `ConcretePhaseMoments` binds the result to the actual
phase for every even power, with no phase-cover premise. Three separate native
leaves, `phase_moment2_check`, `phase_moment4_check`, and `phase_moment6_check`,
compare the exact moments with rational targets. `integral_phiT_sq`,
`integral_phiT_pow_four`, and `integral_phiT_pow_six` supply the Gaussian
interpretation; `PhaseMomentNorms` gives the three Taylor-source total energies.
The second-moment module previously built in 4.8 seconds in
[run 40468150361](https://github.com/agalatan/grothendieck-lean/actions/runs/40468150361).
This is whole-module time, not isolated native evaluation. The fourth- and sixth-moment modules built in 31 s and 175 s respectively in
[run 40471192509](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509),
which passed the full build and axiom audit. This addition does
not discharge `ComparisonInputs` or `energy_close` and changes no headline bound.

**Production phase radial tail.** `phase_cutoff_factor_check` evaluates
`cutPhasePowerMoment phaseTerms phaseEpsQ 50 1` in exact rational arithmetic.
The restricted Gaussian integration theorem binds this computation directly
to the actual phase. `integral_phiT_sq_radial_tail_lt` combines it with a
kernel proof of `exp(-155) < 148⁻³¹`, giving the squared tail bound
`(5/10^15)^2`. No external radial coefficient table is imported. The numerical
module and its positive Taylor-source L² consequence passed a focused local
replay and the full build and axiom audit in
[delivery run 40581194949](https://github.com/agalatan/grothendieck-lean/actions/runs/40581194949).
The phase-tail module built in 6.8 seconds; this includes the analytic transfer
and is not an isolated timing of the native computation.

| Fact | Source native site | Allowlist | Report coverage | Runtime evidence |
|---|---|---|---|---|
| `Grothe.UpperChaos.phase_cutoff_factor_check` | `Grothe/UpperChaos/PhaseRadialTail.lean` | yes | Direct #print axioms; also used by integral_phiT_sq_radial_tail_lt | [Run 40581194949](https://github.com/agalatan/grothendieck-lean/actions/runs/40581194949): full build and axiom audit passed; 6.8 s whole-module build |
| `Grothe.Upper.comparison_check` | `Grothe/Upper/ComparisonMass.lean:65` | yes | Direct #print axioms in scratch/Axioms.lean | Unmeasured per fact at audited commit |
| `Grothe.UpperChaos.phase_moment2_check` | `Grothe/UpperChaos/PhaseMoment2.lean:20` | yes | Direct #print axioms in scratch/Axioms.lean; also used by integral_phiT_sq | [Delivery run 40468150361](https://github.com/agalatan/grothendieck-lean/actions/runs/40468150361): 4.8 s whole-module build, not isolated native evaluation |
| `Grothe.UpperChaos.phase_moment4_check` | `Grothe/UpperChaos/PhaseMoment4.lean:20` | yes | Direct #print axioms; also used by integral_phiT_pow_four and PhaseMomentNorms | [Run 40471192509](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509): 31 s whole-module build |
| `Grothe.UpperChaos.phase_moment6_check` | `Grothe/UpperChaos/PhaseMoment6.lean:20` | yes | Direct #print axioms; also used by integral_phiT_pow_six and PhaseMomentNorms | [Run 40471192509](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509): 175 s whole-module build |
| `Grothe.UpperChaos.rounding_energy_check` | `Grothe/UpperChaos/TaylorRounding.lean:44` | yes | Direct #print axioms; Actual graded integer rounding energy | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.firstCenter_band_energy_check` | `Grothe/UpperChaos/TaylorFirstBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 7.1s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.secondCenter_band_energy_check` | `Grothe/UpperChaos/TaylorSecondBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 5.7s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.taylor_centers_decode_check` | `Grothe/UpperChaos/TaylorRounding.lean:49` | yes | Direct #print axioms; First/second parsing and sizes; frozen size uses the standard source proof | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.head_check` | `Grothe/Upper/Final.lean:44` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 62 s; not isolated native/current-commit measurement |
| `Grothe.UpperChaos.phi_cover_check_0` | `Grothe/UpperChaos/PhiCoverCheck0.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_1` | `Grothe/UpperChaos/PhiCoverCheck1.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_2` | `Grothe/UpperChaos/PhiCoverCheck2.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_3` | `Grothe/UpperChaos/PhiCoverCheck3.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_4` | `Grothe/UpperChaos/PhiCoverCheck4.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_5` | `Grothe/UpperChaos/PhiCoverCheck5.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.HardyGaussianCheck.charts_checked` | `Grothe/UpperChaos/HardyGaussianFacts.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No per-fact timing established here |
| `Grothe.UpperChaos.hardy_region_check` | `Grothe/UpperChaos/HardyArcRegionCheck.lean:10` | yes | Indirect via scratch/Axioms.lean HardyGaussian.hardy_of_real, HardyReal.hardy_GT_gaussian | GitHub-hosted module build 8.7 s |
