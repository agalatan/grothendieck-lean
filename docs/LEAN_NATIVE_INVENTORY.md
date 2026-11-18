# Native source inventory

This inventory covers the named native facts allowed for the single `Grothe`
target, plus the four anonymous table diagnostics below. The current allowlist
is `data/axioms/native.txt` (cap ranges, Hardy facts and others). The default report is
`scratch/Axioms.lean`, with its required declarations in `data/axioms/required.txt`. Normal `ready/*` delivery CI builds and audits
the combined tree before merging it.

The lower chain uses the 15,096-box finite-mixture cover. Its exact checks cover
the unchanged rows and mixed batches, the original and additional law-node banks,
the four sequential box chunks and the partition. The existing refined-box and
partition native facts now check the stronger certificate in place; the extra
law bank uses `LowerRefinementCheck.certRefinementBatches`.
`certRefinedPartition` checks coverage with `treeCoverOK`; it does not assert
disjointness. `treeCoverOK_sound` proves the coverage needed by the reduction.

`MainResult.lower_target` reaches `1.401700322371` through
`lower_bound_of_completed_refinement`, with the same Gaussian node caps.
`lower_bound_of_capsRest` retains its older `1.401697117301` interface to
preserve the heavy cap-cache source boundary; it follows from the same new cover.
The original cap range computations are unchanged. Generated localized-piece
facts outside this supported target are a separate campaign.

The current inventory covers the active target and lower proof. Archived upper
variants have separate preserved inventories under
`miscellaneous/other-bounds/snapshot/data/axioms/`; they are not active permissions.

**Finite inputs of the signed mixture.** `HeadWitnessFacts.Group00` through
`Group07` each replay eight angular residues. `HeadWitnessFacts.head_checked`
checks the signed finite head. `TailFacts.Channel01` through `Channel17` and
the separate `WideFacts` checks cover all eighteen disks and circles.
`GTMass` checks all seven unweighted mass ceilings, `TableSupport` checks
the stored bidegrees, and `LinearTailFacts` checks the bounds used to
deduct linear energy on the GT and phase channels. `RootChecks` identifies the
stored roots of unity with their certified enclosures. The exact source
and verification record are in [the mixture certificate guide](UPPER_CERTIFICATE.md).

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
| `Grothe.Lower.certBatches0` | `Grothe/Lower/Cert/Batches0.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 337 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certBatches1` | `Grothe/Lower/Cert/Batches1.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 344 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certBatches2` | `Grothe/Lower/Cert/Batches2.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 395 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certRows0` | `Grothe/Lower/Cert/Rows0.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 967 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certRows1` | `Grothe/Lower/Cert/Rows1.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 1108 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certRows2` | `Grothe/Lower/Cert/Rows2.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 557 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certRows3` | `Grothe/Lower/Cert/Rows3.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 1220 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.Lower.certRows4` | `Grothe/Lower/Cert/Rows4.lean:7` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 392 s; docs/NATIVE_SEQ_STATUS.md; not isolated native/current-commit measurement |
| `Grothe.LowerAnalytic.capChords_check` | `Grothe/LowerAnalytic/CapAssembly.lean:64` | yes | Direct #print axioms in scratch/Axioms.lean; also used by nodeCaps_of_vertexCaps | Unmeasured per fact at audited commit |
| `Grothe.LowerAnalytic.capRange00_0` | `Grothe/LowerAnalytic/CapRow00.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2255 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange00_1` | `Grothe/LowerAnalytic/CapRow00.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2255 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange00_2` | `Grothe/LowerAnalytic/CapRow00.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2255 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange00_3` | `Grothe/LowerAnalytic/CapRow00.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2255 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange01_0` | `Grothe/LowerAnalytic/CapRow01.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2322 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange01_1` | `Grothe/LowerAnalytic/CapRow01.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2322 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange01_2` | `Grothe/LowerAnalytic/CapRow01.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2322 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange01_3` | `Grothe/LowerAnalytic/CapRow01.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2322 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange02_0` | `Grothe/LowerAnalytic/CapRow02.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2355 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange02_1` | `Grothe/LowerAnalytic/CapRow02.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2355 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange02_2` | `Grothe/LowerAnalytic/CapRow02.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2355 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange02_3` | `Grothe/LowerAnalytic/CapRow02.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2355 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange03_0` | `Grothe/LowerAnalytic/CapRow03.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2594 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange03_1` | `Grothe/LowerAnalytic/CapRow03.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2594 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange03_2` | `Grothe/LowerAnalytic/CapRow03.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2594 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange03_3` | `Grothe/LowerAnalytic/CapRow03.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2594 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange04_0` | `Grothe/LowerAnalytic/CapRow04.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2727 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange04_1` | `Grothe/LowerAnalytic/CapRow04.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2727 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange04_2` | `Grothe/LowerAnalytic/CapRow04.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2727 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange04_3` | `Grothe/LowerAnalytic/CapRow04.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2727 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange05_0` | `Grothe/LowerAnalytic/CapRow05.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2807 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange05_1` | `Grothe/LowerAnalytic/CapRow05.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2807 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange05_2` | `Grothe/LowerAnalytic/CapRow05.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2807 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange05_3` | `Grothe/LowerAnalytic/CapRow05.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 2807 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange06_0` | `Grothe/LowerAnalytic/CapRow06.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3593 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange06_1` | `Grothe/LowerAnalytic/CapRow06.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3593 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange06_2` | `Grothe/LowerAnalytic/CapRow06.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3593 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange06_3` | `Grothe/LowerAnalytic/CapRow06.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3593 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange07_0` | `Grothe/LowerAnalytic/CapRow07.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3029 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange07_1` | `Grothe/LowerAnalytic/CapRow07.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3029 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange07_2` | `Grothe/LowerAnalytic/CapRow07.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3029 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange07_3` | `Grothe/LowerAnalytic/CapRow07.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 3029 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange08_0` | `Grothe/LowerAnalytic/CapRow08.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 6005 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange08_1` | `Grothe/LowerAnalytic/CapRow08.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 6005 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange08_2` | `Grothe/LowerAnalytic/CapRow08.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 6005 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange08_3` | `Grothe/LowerAnalytic/CapRow08.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 6005 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange09_0` | `Grothe/LowerAnalytic/CapRow09.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9940 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange09_1` | `Grothe/LowerAnalytic/CapRow09.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9940 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange09_2` | `Grothe/LowerAnalytic/CapRow09.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9940 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange09_3` | `Grothe/LowerAnalytic/CapRow09.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9940 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange10_0` | `Grothe/LowerAnalytic/CapRow10.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9782 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange10_1` | `Grothe/LowerAnalytic/CapRow10.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9782 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange10_2` | `Grothe/LowerAnalytic/CapRow10.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9782 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange10_3` | `Grothe/LowerAnalytic/CapRow10.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9782 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange11_0` | `Grothe/LowerAnalytic/CapRow11.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9409 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange11_1` | `Grothe/LowerAnalytic/CapRow11.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9409 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange11_2` | `Grothe/LowerAnalytic/CapRow11.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9409 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange11_3` | `Grothe/LowerAnalytic/CapRow11.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9409 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange16_0` | `Grothe/LowerAnalytic/CapRow16.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9884 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange16_1` | `Grothe/LowerAnalytic/CapRow16.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9884 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange16_2` | `Grothe/LowerAnalytic/CapRow16.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9884 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange16_3` | `Grothe/LowerAnalytic/CapRow16.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 9884 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange17_0` | `Grothe/LowerAnalytic/CapRow17.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10377 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange17_1` | `Grothe/LowerAnalytic/CapRow17.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10377 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange17_2` | `Grothe/LowerAnalytic/CapRow17.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10377 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange17_3` | `Grothe/LowerAnalytic/CapRow17.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10377 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange18_0` | `Grothe/LowerAnalytic/CapRow18.lean:18` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10069 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange18_1` | `Grothe/LowerAnalytic/CapRow18.lean:24` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10069 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange18_2` | `Grothe/LowerAnalytic/CapRow18.lean:30` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10069 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `Grothe.LowerAnalytic.capRange18_3` | `Grothe/LowerAnalytic/CapRow18.lean:36` | yes | Indirect via scratch/Axioms.lean lower_bound_of_capsRest and vertexCaps_of_capsRest | Unmeasured per range; historical four-range row module 10069 s; docs/CAPS_STATUS.md (historical 4304b22) |
| `anonymous example at Grothe/LowerAnalytic/CapTables.lean:1203` | `Grothe/LowerAnalytic/CapTables.lean:1203` | NO | Not allowlisted or reported; anonymous example, no named endpoint dependency established | Unmeasured per fact at audited commit |
| `anonymous example at Grothe/LowerAnalytic/CapTables.lean:1205` | `Grothe/LowerAnalytic/CapTables.lean:1205` | NO | Not allowlisted or reported; anonymous example, no named endpoint dependency established | Unmeasured per fact at audited commit |
| `anonymous example at Grothe/LowerAnalytic/CapTables.lean:1208` | `Grothe/LowerAnalytic/CapTables.lean:1208` | NO | Not allowlisted or reported; anonymous example, no named endpoint dependency established | Unmeasured per fact at audited commit |
| `anonymous example at Grothe/LowerAnalytic/CapTables.lean:1211` | `Grothe/LowerAnalytic/CapTables.lean:1214` | NO | Not allowlisted or reported; anonymous example, no named endpoint dependency established | Unmeasured per fact at audited commit |
| `Grothe.Upper.comparison_check` | `Grothe/Upper/ComparisonMass.lean:65` | yes | Direct #print axioms in scratch/Axioms.lean | Unmeasured per fact at audited commit |
| `Grothe.UpperChaos.phase_moment2_check` | `Grothe/UpperChaos/PhaseMoment2.lean:20` | yes | Direct #print axioms in scratch/Axioms.lean; also used by integral_phiT_sq | [Delivery run 40468150361](https://github.com/agalatan/grothendieck-lean/actions/runs/40468150361): 4.8 s whole-module build, not isolated native evaluation |
| `Grothe.UpperChaos.phase_moment4_check` | `Grothe/UpperChaos/PhaseMoment4.lean:20` | yes | Direct #print axioms; also used by integral_phiT_pow_four and PhaseMomentNorms | [Run 40471192509](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509): 31 s whole-module build |
| `Grothe.UpperChaos.phase_moment6_check` | `Grothe/UpperChaos/PhaseMoment6.lean:20` | yes | Direct #print axioms; also used by integral_phiT_pow_six and PhaseMomentNorms | [Run 40471192509](https://github.com/agalatan/grothendieck-lean/actions/runs/40471192509): 175 s whole-module build |
| `Grothe.UpperChaos.rounding_energy_check` | `Grothe/UpperChaos/TaylorRounding.lean:44` | yes | Direct #print axioms; Actual graded integer rounding energy | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.firstCenter_band_energy_check` | `Grothe/UpperChaos/TaylorFirstBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 7.1s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.secondCenter_band_energy_check` | `Grothe/UpperChaos/TaylorSecondBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 5.7s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.taylor_centers_decode_check` | `Grothe/UpperChaos/TaylorRounding.lean:49` | yes | Direct #print axioms; First/second parsing and sizes; frozen size uses the standard source proof | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.head_check` | `Grothe/Upper/Final.lean:44` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 62 s; docs/NATIVE_SEQ_STATUS.md:25; not isolated native/current-commit measurement |
| `Grothe.UpperChaos.phi_cover_check_0` | `Grothe/UpperChaos/PhiCoverCheck0.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_1` | `Grothe/UpperChaos/PhiCoverCheck1.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_2` | `Grothe/UpperChaos/PhiCoverCheck2.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_3` | `Grothe/UpperChaos/PhiCoverCheck3.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_4` | `Grothe/UpperChaos/PhiCoverCheck4.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_5` | `Grothe/UpperChaos/PhiCoverCheck5.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.LawNodeCheck.certLawNodes` | `Grothe/Research/LawNodeCheck.lean:14` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.LowerRefinementCheck.certRefinementBatches` | `Grothe/Research/LowerRefinementCheck.lean` | yes | Direct #print axioms in scratch/Axioms.lean and scratch/LowerRefinementAxioms.lean | Exact checkBatch replay of the additional law bank; local whole-module build 62 s |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes0` | `Grothe/Research/RefinedCoverBoxes0.lean:11` | yes | Direct #print axioms in scratch/Axioms.lean | Local Lean 4.34.1 whole-module build: 9.3 s; indexed decoding with proved equality to the original checker |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes1` | `Grothe/Research/RefinedCoverBoxes1.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | Local Lean 4.34.1 whole-module build: 10 s; indexed decoding with proved equality to the original checker |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes2` | `Grothe/Research/RefinedCoverBoxes2.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | Local Lean 4.34.1 whole-module build: 14 s; indexed decoding with proved equality to the original checker |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes3` | `Grothe/Research/RefinedCoverBoxes3.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | Local Lean 4.34.1 whole-module build: 12 s; indexed decoding with proved equality to the original checker |
| `Grothe.Research.RefinedLowerCheck.certRefinedPartition` | `Grothe/Research/RefinedCoverPartition.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | Local Lean 4.34.1 whole-module build: 3.1 s; indexed decoding with proved equality to the original checker |
