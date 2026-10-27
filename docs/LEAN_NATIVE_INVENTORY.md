# Native source inventory

This inventory covers the named native facts allowed for the single `Grothe`
target, plus the four anonymous table diagnostics below. The current allowlist
is `data/axioms/native.txt` (cap ranges, Hardy facts and others). The default report is
`scratch/Axioms.lean`, with its required declarations in `data/axioms/required.txt`. Normal `ready/*` delivery CI builds and audits
the combined tree before merging it.

The lower chain uses the refined 10,909-box cover. Its finite checks comprise
five row chunks, three mixed-batch chunks, one law-node fact and five refined-cover
facts. The superseded four box chunks and partition fact are removed from both
the library and allowlist. `certRefinedPartition` checks coverage with
`treeCoverOK`; it does not assert disjointness. `treeCoverOK_sound` proves the
coverage property needed by the lower-bound reduction. The retired partition
checker's unused straddler scan is absent; no runtime improvement is claimed.

`lower_bound_of_capsRest` now reaches `1.401697117301` by the refined-cover theorem,
with the same `CapsRest` and unchanged shared `NodeCaps` definition. All 60 range
facts are retained. The generated localized-piece facts outside this supported
target are a separate campaign, not additional allowlisted endpoint inputs.

Indirect report coverage in the inventory is source-traced. Historical times are module build times and do
not measure individual native evaluations or the current implementation. The scalar
sixteenth-power module's earlier verification records are under
`data/scalar-tail-refinement/verification/`.

**Scalar power check (#100).** `Grothe.ScalarTailRefinement.power_check` now
uses `decide +kernel` for the same scalar sixteenth-power norm check. Its native
axiom is removed from the allowlist; the theorem remains required and directly
printed in `scratch/Axioms.lean`. All sixteen scalar-tail reports use only
standard axioms. Source and report hashes are recorded under
`data/scalar-tail-refinement/verification/`.

**Canonical upper-bound route (#138).** `Grothe.haagerup_bound` uses four
`Grothe.HaagerupCanonical` kernel checks. The focused policy requires 98 results
and permits zero native axioms. The degree-20 certificate and bounds on combined
resolvent seeds give the endpoint 1.404909132791; verification records apply to
their pinned inputs.
Large convolutions are proved in continuation blocks of at most five left
coefficients. The generic `convI_append` identity preserves the original
outward arithmetic order; recurrence and exact input-binding lemmas recover
the four checker statements without a new numerical premise.
`PowerData.lean` contains only the six definitions `pl`, `rl`, `seedPower`,
`seedCap`, `defectCap`, and `slope`. The data module has no numerical theorem;
all four acceptance proofs come from the canonical trace.

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

| Fact | Source native site | Allowlist | Report coverage | Runtime evidence |
|---|---|---|---|---|
| `Grothe.HJM.OriginUnweightedRightChecks.combinedBlock00` | `Grothe/HJM/OriginUnweightedRightCombined00.lean` | yes | Direct #print axioms in scratch/Axioms.lean | Runtime pending delivery CI; guarded signed and phase-mean checks on right cells 0–6 |
| `Grothe.HJM.OriginUnweightedRightWitness.polynomial_eq` | `Grothe/HJM/OriginUnweightedRightWitness.lean` | yes | Direct #print axioms in scratch/Axioms.lean | Runtime pending delivery CI; exact transformed 64-mode witness equality |
| `Grothe.HJM.OriginMomentRightWitnessData.rightPolynomial_eq` | `Grothe/HJM/OriginMomentRightWitnessData.lean` | yes | Direct #print axioms in scratch/Axioms.lean | Runtime pending delivery CI; exact right witness polynomial equality |
| `Grothe.HJM.OriginMomentGenerated.rightBlock13` | `Grothe/HJM/OriginMomentRightCheck13.lean` | yes | Direct #print axioms in scratch/Axioms.lean | Runtime pending delivery CI; signed Gaussian moment bounds for right cells 91–97 |
| `Grothe.HJM.Cauchy.gate_check4` | `Grothe/HJM/CauchyGateCheck.lean:20` | yes | Indirect via scratch/Axioms.lean Grothe.HJM.Cauchy.weighted_tails | GitHub-hosted module build 4.6 s (quadtree of complex interval boxes, branch 4 of HJM at radius 1.112; the kernel evaluation takes over 10 minutes) |
| `Grothe.HJM.finite67_check` | `Grothe/HJM/Finite67.lean:36` | yes | Indirect via scratch/Axioms.lean Grothe.HJM.branch5_tail | GitHub-hosted module build 9.6 s (Horner on modes up to 4987 of the HJM branch 5, 67 phase coefficients) |
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
| `Grothe.UpperChaos.thirdCenter_decode_check` | `Grothe/UpperChaos/TaylorBandCheck.lean:37` | yes | Direct #print axioms; validates strict parsing and size | [Run40481726935](https://github.com/agalatan/grothendieck-lean/actions/runs/40481726935): 4.3s whole-module build |
| `Grothe.UpperChaos.thirdCenter_energy_check` | `Grothe/UpperChaos/TaylorBandCheck.lean:47` | yes | Direct #print axioms; used by the total and projected norm enclosures | [Run40481726935](https://github.com/agalatan/grothendieck-lean/actions/runs/40481726935): 4.3s whole-module build |
| `Grothe.UpperChaos.rounding_energy_check` | `Grothe/UpperChaos/TaylorRounding.lean:44` | yes | Direct #print axioms; Actual graded integer rounding energy | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.firstCenter_band_energy_check` | `Grothe/UpperChaos/TaylorFirstBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 7.1s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.secondCenter_band_energy_check` | `Grothe/UpperChaos/TaylorSecondBandNorms.lean:30` | yes | Direct #print axioms; actual projected integer energy of the preserved center | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 5.7s whole-module compilation; run failed later in the tail adapter |
| `Grothe.UpperChaos.taylor_centers_decode_check` | `Grothe/UpperChaos/TaylorRounding.lean:54` | yes | Direct #print axioms; Strict parsing and exact retained source sizes | [Run40490363431](https://github.com/agalatan/grothendieck-lean/actions/runs/40490363431): 12s whole-module compilation; run failed later in the tail adapter |
| `Grothe.head_check` | `Grothe/Upper/Final.lean:44` | yes | Direct #print axioms in scratch/Axioms.lean | Historical module build 62 s; docs/NATIVE_SEQ_STATUS.md:25; not isolated native/current-commit measurement |
| `Grothe.UpperChaos.phi_cover_check_0` | `Grothe/UpperChaos/PhiCoverCheck0.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_1` | `Grothe/UpperChaos/PhiCoverCheck1.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_2` | `Grothe/UpperChaos/PhiCoverCheck2.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_3` | `Grothe/UpperChaos/PhiCoverCheck3.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_4` | `Grothe/UpperChaos/PhiCoverCheck4.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.phi_cover_check_5` | `Grothe/UpperChaos/PhiCoverCheck5.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.UpperChaos.hardy_arc_part_0` | `Grothe/UpperChaos/HardyArcPart0.lean:9` | yes | Indirect via scratch/Axioms.lean hardy_of_real, hardy_region_and_mean | GitHub-hosted module build 699 s alone, about 1700 s with the four parts in parallel (4 vCPUs) |
| `Grothe.UpperChaos.hardy_arc_part_1` | `Grothe/UpperChaos/HardyArcPart1.lean:9` | yes | Indirect via scratch/Axioms.lean hardy_of_real, hardy_region_and_mean | GitHub-hosted module build 1142 s alone, about 1700 s with the four parts in parallel (4 vCPUs) |
| `Grothe.UpperChaos.hardy_arc_part_2` | `Grothe/UpperChaos/HardyArcPart2.lean:9` | yes | Indirect via scratch/Axioms.lean hardy_of_real, hardy_region_and_mean | GitHub-hosted module build 800 s alone, about 1700 s with the four parts in parallel (4 vCPUs) |
| `Grothe.UpperChaos.hardy_arc_part_3` | `Grothe/UpperChaos/HardyArcPart3.lean:9` | yes | Indirect via scratch/Axioms.lean hardy_of_real, hardy_region_and_mean | GitHub-hosted module build 1114 s alone, about 1700 s with the four parts in parallel (4 vCPUs) |
| `Grothe.UpperChaos.hardy_region_check` | `Grothe/UpperChaos/HardyArcRegionCheck.lean:10` | yes | Indirect via scratch/Axioms.lean hardy_of_real, hardy_region_and_mean | GitHub-hosted module build 8.7 s |
| `Grothe.Research.LawNodeCheck.certLawNodes` | `Grothe/Research/LawNodeCheck.lean:14` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes0` | `Grothe/Research/RefinedCoverBoxes0.lean:11` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes1` | `Grothe/Research/RefinedCoverBoxes1.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes2` | `Grothe/Research/RefinedCoverBoxes2.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.RefinedLowerCheck.certRefinedBoxes3` | `Grothe/Research/RefinedCoverBoxes3.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | No new per-fact timing established here |
| `Grothe.Research.RefinedLowerCheck.certRefinedPartition` | `Grothe/Research/RefinedCoverPartition.lean:12` | yes | Direct #print axioms in scratch/Axioms.lean | Coverage-only treeCoverOK; no new timing established here |
