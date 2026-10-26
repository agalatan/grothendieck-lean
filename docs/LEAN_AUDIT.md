# Lean audit and simplification

Audit date: 26 October 2026. Baseline: `origin/master` at
`4e9f32d78a198da551239bbfa9e56e713d765cae`.
Tracking: [#46](https://github.com/agalatan/grothendieck-lean/issues/46), under epic #12.
File/line references in the baseline review below refer to that commit, before the proposed fixes.
The current-state notes and follow-up ledger explicitly identify later changes.

## Current lower-chain and cache scope

The combined #13/#44 delivery retires the old lower cover and its constant-specific
corollaries. The default headline is now
`Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data`, proving
`NodeCaps → IsGrothendieckBound K → 1.401697049825 < K`. The separate
`lower_bound_of_capsRest` theorem reaches exactly this endpoint by
`lower_bound_of_refined_cover_data (nodeCaps_of_vertexCaps (vertexCaps_of_capsRest h))`.
Its `CapsRest` premise is unchanged. The exact `NodeCaps` definition has moved from
`Reduction.lean` into `LowerAnalytic/NodeCaps.lean`; it retains the padded inequality
`rowPot k s − 10⁻¹¹ ≤ c` at every stored node.

The old `Lower/Cert/Boxes0–3`, `Lower/Cert/Partition`, `RowCheck`, `Endpoint`,
`lower_bound_of_nodeCaps` and old-constant corollaries are removed. The retained
five row and three mixed-batch facts feed `LawNodeLower`; one additional law-node
fact and five refined-cover facts certify the refined 10,762-box cover. The
coverage-only checker `treeCoverOK` and theorem `treeCoverOK_sound` replace the old
partition checker. Its unused straddler scan is absent, making
[#56](https://github.com/agalatan/grothendieck-lean/issues/56) moot. This is a
soundness/maintenance change; no speedup is claimed.

Current source registries contain **588 default reports, 371 required declarations
and 83 named native facts (23 ordinary plus 60 cap ranges)**. The current inventory
is [LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md). The older counts and
coverage measurements in the baseline review describe that earlier tree only.
The baseline's retired-cover structural checks are not presented as a verification
of the refined certificate.

The cap checker now has an independent precompiled `GrotheCapsKernel` library,
and heavy range facts import its computation layer. The verified-cache marker
is `.lake/build/caps-closure.sha`, checked by `--check-cache` and written only after
a successful runner build and the single strict axiom report. Full caps verification
and shared-cache publication belong to the runner. The combined delivery's final
runner evidence is recorded in #13/#85; no new full build is claimed by this source
review. The CI comment probe uses retained `LowerAnalytic/Bridge.lean`.

The unconditional canonical theorem `Grothe.haagerup_bound` proves
`IsGrothendieckBound (1404909140/1000000000)`. Its complete finite trace and public
wrapper passed Lean, and the focused audit passed with 96 results and zero native
evaluation axioms. The proof uses exact continuation blocks and a generic append
identity, with no new numerical premise. `PowerData.lean` contains only the six
rational-data definitions; the four acceptance proofs come from the canonical
trace. The arithmetic module is `Grothe/Haagerup/CanonicalArithmetic.lean`,
retaining the `GrotheKernel` namespace. Final merged-tree validation runs through
normal `ready/*` delivery CI: the single `Grothe` target includes the node caps
and uses the single report `scratch/Axioms.lean`.

## Baseline result and limits

**No headline mathematical soundness defect or finite-coverage gap was found in
this review.** The sharp endpoints remain conditional, exactly as the explicit
Lean hypotheses require. This is source review plus independent exact-rational
coverage checks, not a fresh replay of every proof or expensive native computation.
The largest confirmed problems concern verification coverage and maintenance tools.

The baseline already proves the stronger hypothesis-free bound
`IsGrothendieckBound (1404909543/1000000000)`; the task's older `1404951/1000000`
snapshot is superseded. README, LEAN_DETAILS, the overview TeX and extracted PDF
agree on `1.404909543`.

The review used this audit's worktree, committed repository sources/data, project
issues and CI metadata. No other conversations or other agents' worktree contents
were accessed. Reserved cap/phase/Hardy/tool/workflow work was not edited.

## Findings ranked by severity

| Priority | Finding and evidence | Fix / issue |
|---|---|---|
| P1 | **Missing cap verification stamp succeeds.** `scripts/caps_stamp.py:60–62` returns success when `docs/CAPS_VERIFIED.txt` is absent, including under `--check`; CI interprets this as verified. Reproduced with a nonexistent fixture path, without removing the real stamp. | Fail closed; explicit check/digest/write modes and isolated regression checks. [#47](https://github.com/agalatan/grothendieck-lean/issues/47). |
| P1 | **Stamp-only changes bypass the CI check.** `.github/workflows/lean.yml:65` omits `docs/CAPS_VERIFIED.txt` and `scratch/AxiomsCaps.lean` from the relevant-file scope. Deleting/editing the stamp alone can take the docs-only auto-merge path. | Add trust metadata and CI-used report files to scope; coordinate with reserved PR #44. Fixing #47 alone does not fix this. [#48](https://github.com/agalatan/grothendieck-lean/issues/48). |
| P2 | **Four native examples are unlisted.** `CapTables.lean:1392,1394,1397,1403` uses native evaluation in anonymous examples. There are 82 source evaluation sites, versus 78 named allowlisted facts. No endpoint dependency on the examples was found. | Prefer kernel checks for cheap examples or separately audited tests; do not add unused facts to endpoint trust merely to balance counts. Native/closure change requires approval. [#49](https://github.com/agalatan/grothendieck-lean/issues/49). |
| P2 | **Dead-code roots are obsolete.** `scratch/DeadCode.lean:31–35` omits `lower_bound_of_nodeCaps`, `fresh_upper_rounder`, and `haagerup_bound`; the walker silently tolerates missing roots. | Add/validate current roots and document separate-cap limitations before deleting any declaration. [#50](https://github.com/agalatan/grothendieck-lean/issues/50). |
| P3 | **An unused public hypothesis remains.** `Upper/PolynomialBridge.lean:42–43` declares `DirectHyps.summableX`; constructors supply it, but no theorem consumes it. | Remove the field and adjust constructors, strengthening the table interface. Await approval for the headline-interface change. [#51](https://github.com/agalatan/grothendieck-lean/issues/51). |
| P3 | **Certificate zero padding.** `Haagerup/PowerCheck.lean:26–154` stores 129 inverse coefficients; the last nonzero index is 64. | Regenerate a 65-entry inverse and shorten affected products; 64 source lines removable, speedup unmeasured. Native input change requires approval. [#54](https://github.com/agalatan/grothendieck-lean/issues/54). |

These baseline findings did not establish that the then-current cap stamp was
invalid or that an anonymous example compromised an endpoint. That baseline
checked-in stamp matched exactly:
`fe2ea85d90646c9e01d46fd614051a61b2dd26399c585e39e620ab9d41f16eea`, 140 files.

Additional hardening: the baseline stamp script ignores `--digest` and unknown
options, reads only the first module on each import line, and silently treats
missing local imports as external (`scripts/caps_stamp.py:27–37,47–73`). All current
project import lines contain one module, so no missing baseline dependency was
found. Preserve its sorted hashing and existing roots; a future import-parser
change must reject unsupported syntax rather than silently weaken provenance.
The stamp covers source/toolchain/manifest bytes, not every verification input
(e.g. the workflow, report script and lakefile); do not describe it as a complete
reproducibility manifest.

## Headline statements and hypothesis meaning

The lower entries below reflect the refined chain in this delivery. The upper
entries retain the original audit's baseline statements; later upper improvements
and their verification are described in the follow-up ledger and current README.

`Grothe/Transfer.lean:40–58` quantifies all finite complex matrices, unimodular
scalar families and unit vectors in arbitrary finite-dimensional complex Euclidean
spaces. The scalar/vector value sets are nonempty and bounded (`:60–107`), so
Lean's total real supremum does not make the inequality vacuous. The finite-span
extension to arbitrary Hilbert spaces is explanatory mathematics; the Lean
interface itself is finite-dimensional, as README states.

| Result | Actual interface and checked meaning |
|---|---|
| `Research.RefinedLowerCheck.lower_bound_of_refined_cover_data` (`RefinedCoverResult.lean`) | `NodeCaps → IsGrothendieckBound K → 1.401697049825 < K`. `NodeCaps` is the **padded** inequality `rowPot k s − 10⁻¹¹ ≤ c` at every listed node. |
| `LowerAnalytic.lower_bound_of_capsRest` (`CapNodes.lean`) | The same refined endpoint from vertex caps of rows 12–15 plus excluded caps of other rows, through `nodeCaps_of_vertexCaps` and the refined-cover theorem. All exclusion lists are empty, so only those four rows remain. This belongs to separate target `GrotheCaps`. |
| `UpperChaos.fresh_upper_rounder` (`PhiBound.lean:70–77`) | For `X ∈ L²(mu2)` with charge-one covariance, requires `ComparisonInputs GT X`, finite-head energy closeness and the Hardy partial-sum bound; concludes the exact rational `500000000000000000/355973696735190991`. `upper_value_lt` proves the strict decimal comparison. |
| `Grothe.haagerup_bound` (`Haagerup/Power.lean:237–239`) | No analytic/certificate hypotheses; concludes `IsGrothendieckBound (1404909543/1000000000)`. Depends on its explicitly pinned native check as well as standard logical axioms. |

The lower witness is the bounded operator `P₁,₀ − (149/200)P₂,₁`
(`Witness.lean:311,432–448`). Polarization and phase rotation establish a norm
bound, not merely a real-part bound (`WitnessCap.lean:106–111,524–537`). The
finite-dimensional test approaches 1 as dimension grows (`Witness.lean:463–479`);
requiring dimensions at least 2 in the reduction leaves that argument intact.
`Lower/Transfer.lean` derives positivity before division in its generic
`transfer_lower` theorem. `RefinedCoverData.refinedL` and
`RefinedLowerCheck.refined_endpoint_lt_reciprocal` give the strict refined decimal.

`rowPot` is a concrete Gaussian-integral supremum (`FibreSup.lean:643–645`), with
an explicit zero fibre and proved upper boundedness (`:29,458–464`). The actual
row PSD premises are obtained from the row-gate checks. `NodeCaps` is a genuine
remaining numerical proposition: this review did not prove its truth.

`ComparisonInputs` (`LocalizedComparison.lean:41–46`) consists of 18 L² pieces,
exactly summing to `GT − X`, with component norm caps and spectral support. It
does not assume the final residual or Grothendieck conclusion. `energy_close`
bounds the l1 error against the stored table on `n+3m ≤ 501` by
`6847009/(5·10^17)`. `hardy` bounds every finite partial weighted square sum by
`7/4` at radius `4149/4000` (`PolynomialBridge.lean:50–55`). No construction of an
`X` satisfying all these numerical inputs was supplied or established here.

The concrete rounding, smoothing and disk bound are actual Lean definitions and
proofs (`Rounder.lean:68–78,132–182`). `PhiBound` is the proved phase cover `φ² ≤ 99/100`
(#19), which also gives `|φ| < 1` (`phi_abs_lt_one`). No claim is made here to discharge #18 or
#39–#41.

## Baseline finite coverage, rounding and parsing

The box/token counts and retired module references in this section describe the
original cover reviewed at the baseline, not the current refined lower chain.
The refined certificate has 10,762 boxes and its own complete finite checks.

Independent Python `fractions.Fraction` checks of committed source data gave:

- **19 cap lists / 4,524 nodes:** 196 nodes in each of rows 0–11 and 16–18, 396
  in each of rows 12–15. Every list is nonempty, starts at zero, has strictly
  increasing nonnegative abscissae and positive caps.
- **505 chord reductions:** every endpoint index is valid, endpoints are not
  chord targets, targets are unique, and every rational chord inequality holds.
  This leaves 4,019 vertices; 1,258 are in the unfinished four rows
  (311, 314, 315, 318). These are full interface counts, not a count of pieces
  already attempted by the separate rows-12–15 campaign.
- **21 mixed batches / 351 node certificates.**
- **8,756 distinct positive-width boxes:** 224 cap, 1,983 single-component,
  6,549 mixed-component boxes.
- **17,511 partition tokens:** 8,756 leaves and 8,755 strict interior cuts.
  Every token is consumed, and the exact multiset of leaf domains equals the
  multiset of box domains on the full root
  `[0,9/10] × [0,973612157/10^9] × [0,31/4]`.

These independent checks validate structure and indexing, not the expensive
majorant evaluations. Their corresponding Lean bridges were reviewed:

- `Cert/Parts.lean:20–32` / `RowCheck.lean:30–44` use adjoining drop/take chunks
  and prove the final suffix empty. Row starts 0/4/8/12/16, batch starts 0/7/14,
  and box starts 0/2200/4400/6600 cover the actual lengths.
- Every `CapRowKK.lean:15–45` covers `[0,49)`, `[49,98)`, `[98,147)`, then
  `[147,nodeList.length)`. `CapRows.lean:48–93` requires actual index/range
  membership, so truncated natural subtraction cannot certify a missing node.
- Chord skips are justified by independent convexity; excluded nodes remain
  explicit hypotheses (`CapHull.lean:76–124`, `CapNodes.lean:32–38`).
- Box splits include their boundaries (`Boxes.lean:350–408`); the sweep transfers
  equality to the next interval and explicitly checks the final infinite tail
  (`Sweep.lean:170–219`).
- The upper head includes odd degrees 1 through 501; the tail starts at degree
  503 (`PolynomialBridge.lean:92–95,124–131`).
- Phase-tree checks consume the whole tree, require both children and reject
  fuel exhaustion (`GrotheKernel/PhiCheck.lean:155–184`). The near/far analytic
  split uses `<60` and `≥60`; empty cells require strict inadmissibility.

**Float is present inside trusted native evaluation.** Every cap range reaches
`CapCheck.lean:115–179` to propose dyadic price numerators. However, universal
positivity/size lemmas (`CapGridOK.lean:16–41`), grid conditions (`:73–150`) and
exact rational/interval matrix tests establish soundness for whichever prices
are proposed (`:165–195`). No floating-point error enclosure is assumed. Float
can affect success and reproducibility; the native compiler/runtime remains
trusted. Persisting the chosen integer numerators could remove this operational
Float dependency, at a data-size cost. It is not a mathematical bug fix.

The shared fixed-point arithmetic rounds outward at scale `2^128`;
`Upper/IntervalSound.lean:16–90` proves the sign-sensitive operations. Recipe
parser defaults are followed by exact soundness checks; no malformed-input path
that accepts a false cap was found. Better parser diagnostics would aid data
provenance but do not substitute for those checks.

## Native trust inventory and cost

The current supported-target inventory, including individual names, source
locations, report coverage and runtime provenance, is
[LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md). It contains 83 allowlisted
native facts and separately identifies four anonymous table diagnostics.

| Facts | Count | Computation |
|---|---:|---|
| `Lower.certRows0`–`4` | 5 | Row certificate checks, four consecutive rows per chunk. |
| `Lower.certBatches0`–`2` | 3 | Mixed-batch/node checks, seven batches per chunk. |
| `Research.LawNodeCheck.certLawNodes` | 1 | Additional original-source law nodes. |
| `Research.RefinedLowerCheck.certRefinedBoxes0`–`3` | 4 | Refined box majorant/support checks. |
| `Research.RefinedLowerCheck.certRefinedPartition` | 1 | Exact coverage tree using `treeCoverOK`. |
| `LowerAnalytic.capRangeKK_j` | 60 | Fifteen rows × four node ranges; recipes, interval tables, quadratic/LDLᵀ and piece checks. |
| `LowerAnalytic.capChords_check` | 1 | Exact chord inequalities, valid independent vertex endpoints. |
| `head_check` | 1 | Stored upper-table index bounds and interval head residual through degree 501. |
| `Upper.comparison_check` | 1 | Selected weighted band masses/radii and cross/quadratic comparison budget. |
| `UpperChaos.phi_cover_check_0`–`5` | 6 | Sequential phase-term cover chunks and the analytic-far-field numerical inequality. |
| Anonymous `CapTables` examples | 4 | Nine-entry parser length, sample table validity, rejection of a wrong interval, one radial interval. |

`NATIVE` has 83 entries; `REQUIRED` has 370 declarations. All REQUIRED names are
present among 586 distinct default-report print directives. The 23 ordinary
named checks have direct default-report printers; the 60 ranges are covered
through the separate caps report. The checker rejects unlisted axioms in reported theorems;
it does **not** establish source-inventory completeness. Add a source-site audit
alongside dependency checks when addressing #49; an expected native count alone
is not a correctness proof.

No forbidden escapes (`sorry`, declared axioms, unchecked implementations,
`unsafe`, externs, kernel-check disabling) or task/thread spawning were found in
project proof/checker sources. This does not audit Lean/Mathlib internals.
Cached native results are not re-executed: master warm-run cache provenance is
part of trust, as the repository already documents.

Runtime figures are deliberately distinguished:

- Historical lower chunk **module** builds: 40–2,199 s each; 37 min aggregate
  wall time with eight processes under shared load (`NATIVE_SEQ_STATUS.md:23–42`).
- Historical caps build at `4304b22`: **239 min 41 s wall / 1,269 min CPU**;
  row modules 2,255–10,377 s, each containing four sequential native facts
  (`CAPS_STATUS.md`). These are historical measurements, not a current cache check.
- Historical upper-head module: 62 s. Phase source comment: approximately
  1.5 min, not a fresh benchmark.
- Historical Haagerup `PowerCheck.lean` build: **522.95 s wall / 509.46 s user CPU**,
  from `docs/verification/haagerup-resolvent-20261025/native-build.log`. Its source
  hash matches the audited baseline. This includes elaboration and native execution,
  not an isolated per-fact timer or a fresh audit measurement.
- Current per-fact times for comparison, chords, individual
  cap ranges and anonymous examples are **unmeasured**. The old 257 s
  `haagerup_check` timing concerns a superseded fact and is not reused.

This audit did not launch multi-hour reruns on the already-busy shared machines.
Do not merge chunk facts merely to reduce the number of axiom names: it removes
process-level parallelism without removing arithmetic. Benchmark before choosing
kernel `decide +kernel` for anything beyond small diagnostic examples.

## Baseline dead code and mathematical compaction

The counts and proposals in this section are from the original baseline. Later
deliveries are recorded below; the current dead-code roots use the refined
lower headline and validate that every selected root exists.

Static import analysis found no orphan library module: all 223 modules below
`Grothe/` and `GrotheKernel/` are reachable from aggregate imports. Twenty-seven
non-aggregate modules / 4,593 raw lines lie outside the four endpoint module
closures; most are intentional research interfaces or unfinished cap/Hardy work.
Those are **not** deletion candidates without corrected declaration reachability
and an explicit supported-result policy. The current source total is 62,086 raw
lines including the three aggregate roots; README's approximate generated versus
handwritten split is stale, and a header heuristic is not a reliable replacement.

| Proposal | Quantified scope / expected effect | Constraint |
|---|---|---|
| Reuse `tsum_of_norm_bounded`, exponent monotonicity and sum distributivity in KernelScreen/SpectralScreen | About 20 proof lines removable; 0 native facts, 0 modules, unchanged theorem types. [#55](https://github.com/agalatan/grothendieck-lean/issues/55). | Safe leaf delivery; build both and CubicPhaseScreen, then CI aggregate importers. |
| One index-polymorphic coefficient-l1 lemma | Compose:47–69, Bivariate:73–95, PowerTail:33–58 contain about 72 repeated lines; estimated net saving 30–40 plus useful shared API. [#52](https://github.com/agalatan/grothendieck-lean/issues/52). | Outside caps; wider upper rebuild fanout. Estimate, not measured reduction. |
| Abstract projection/first-moment lemma | WitnessCap:445–482 + RowGaussian:267–297: 69 current lines; estimated saving 25–40. [#52](https://github.com/agalatan/grothendieck-lean/issues/52). | Caps closure; after #13 and approval. |
| Shared row-gate extraction / range assembly | 36 repeated gate lines in three files; 105 repeated index-assembly lines in fifteen cap-row files. Potential net savings 15–20 / 60–75 respectively. | Generated/protected cap code; change generators, one approved closure batch. |
| Complex Gaussian foundation below fibre-specific Gram proofs | Lower radial specializations: 26 lines; ~75 lines of repeated upper monomial IBP inductions; six-vector Gram proof in FibreHermite:83–350 is a larger candidate. | Already substantial reuse exists: upper moments import lower foundations. Preserve variance/dimension adapters; no net saving established. [#52](https://github.com/agalatan/grothendieck-lean/issues/52). |
| Retire the old partition checker | The old cover and checker are removed; the refined certificate uses coverage-only `treeCoverOK`. The unused straddler scan is absent. [#56](https://github.com/agalatan/grothendieck-lean/issues/56) is moot. | User-authorized in the combined #13/#44 delivery; no runtime saving is claimed. |
| Trim the inverse polynomial | 64 generated zero lines; fewer zero-list operations, preserving the polynomial. The checker already skips zero multiplications. [#54](https://github.com/agalatan/grothendieck-lean/issues/54). | Native-input approval and reproducible regeneration. |

A wholesale interval-library merger would overstate duplication: `Basic.lean`
(77 lines) and `IntervalSound.lean` (212) already serve Table, Haagerup and
CapCheck. PhiCheck (186 lines) has different exact Taylor/box responsibilities.
Only factor genuinely repeated Horner/list soundness, with measured overhead;
relocating IntervalSound merely for naming would trigger an expensive cap rebuild
without mathematical benefit. See [#53](https://github.com/agalatan/grothendieck-lean/issues/53).

The baseline also identified these small documentation corrections: README:66–68 / overview.tex:185 omit the
cap padding in abbreviated prose (README:92 states it correctly);
FibrePotential:41–43 still calls rotation unfinished; Lower/Transfer:25–28 retains
an obsolete first-moment hypothesis description; Witness:429–431 uses coefficient
1 in a Wick comment although its variance-two coordinate convention and actual
WickChaos:31–53 use coefficient 2; Boxes:433 calls a sequential wrapper parallel.
The code is consistent. Batch Lean-comment edits with approved closure work.

## Original delivery plan and approval boundary

Deliver this report first as a docs-only ready branch. Then independently deliver
stamp-checker hardening (#47), current/validated dead-code roots (#50), and the
safe leaf proof simplifications (#55), with actual validation and savings recorded
in the respective issues. Every commit uses the repository prefix and issue
reference; agents deliver through CI and do not move master themselves.

No change to a headline interface, native fact/input, or caps-closure source is
included without the user's go-ahead. The original gate covered #49, #51, #54, #56 and the
closure portions of #52/#53. Preserve the same 140-file digest for safe deliveries.
Workflow #48 was reserved for PR #44; it is now included in the combined #13/#44
delivery. The user also explicitly authorized the refined-cover retargeting and
old-cover retirement described above. Wider estimates remain proposals, not
claimed delivered improvements.

## Approved follow-up: inverse-list trim (#54)

The user approved #54 only among the gated changes. The canonical inverse now
contains 65 coefficients (actual degree 64); 64 trailing zeros and 64 generated
Lean lines are removed. All other certificate fields and public theorem statements
are unchanged. The degree bounds used internally in the defect and seed proofs
are tightened to 94 and 303 coefficient slots. The documentation and overview PDF
now state the actual polynomial degree.

Exact rational comparison and an independent integer mirror give identical
zero-extended interval coefficients and acceptance results. The defect array
shrinks from 129 to 94 entries; the seed array remains 303 entries. The affected
convolutions save 128 zero-branch traversals and 93 interval additions, but no
interval multiplications. No full-certificate speedup is claimed. A fresh 192-bit
FLINT replay checks the complete head, seed, tail and endpoint; see
`docs/verification/haagerup-trim-20261026/`. Lean build/CI status is recorded
separately from that external replay. The native-fact count and cap digest remain
unchanged. All other gated proposals remain unapproved.

## Verified follow-ups

The baseline findings above remain the audit record. The following fixes have
since been checked; no headline mathematical soundness defect has been found.

- [#47](https://github.com/agalatan/grothendieck-lean/issues/47): a missing cap
  stamp now fails, and explicit exclusive check/digest/write modes reject invalid
  arguments. Isolated Python regressions pass; the 140-file digest is unchanged.
- [#50](https://github.com/agalatan/grothendieck-lean/issues/50): the dead-code
  report includes the current headline roots and rejects missing roots. Its
  limitations for the separate caps target remain explicit; no declarations were
  deleted on the strength of the report.
- [#55](https://github.com/agalatan/grothendieck-lean/issues/55): the screening
  proofs reuse standard norm bounds with unchanged theorem statements.
  [CI run 40247076838](https://github.com/agalatan/grothendieck-lean/actions/runs/40247076838)
  passed the build and verification checks.
- [#54](https://github.com/agalatan/grothendieck-lean/issues/54): the approved
  inverse trim has exact equivalence, independent replay, and fresh complete
  native/proof-build evidence from
  [run 40247044009](https://github.com/agalatan/grothendieck-lean/actions/runs/40247044009).
  The later primary-branch
  [run 40250530009](https://github.com/agalatan/grothendieck-lean/actions/runs/40250530009)
  and merged-master
  [run 40251214852](https://github.com/agalatan/grothendieck-lean/actions/runs/40251214852)
  also passed fresh complete builds, 435-record axiom reports and cap-stamp checks;
  the affected files are identical across these verified trees. Master also passed
  its generated-import/list check. No speedup is established. See the
  [verification record](verification/haagerup-trim-20261026/README.md).
- [#60](https://github.com/agalatan/grothendieck-lean/issues/60): the axiom checker
  rejects unknown/conflicting modes and incomplete or diagnostic-bearing output.
  Master `08e55bbe028d81fced0671930c0ef453c7d0d919` now loads the policies from
  `data/axioms/`; all seven effective policies exactly preserve those checked at
  `1b44a219d553801ee319a993203f773e5646174b`, including the 11 phase-response
  requirements and their empty native allowlist. All 17 Python tests also pass
  against that master checker and data snapshot. The actual 435-record report
  from [run 40247087615](https://github.com/agalatan/grothendieck-lean/actions/runs/40247087615)
  passes the strict checker (18 of 78 native facts). The later successful master
  run `40251214852` also executed and passed the strict checker on 435 records.
  Later master `c38a625` adds four explicit audit modes, 44 required declarations
  and six native facts from the separate law-node/refined-cover delivery. The
  strict parser and CLI logic are preserved; all 21 tests pass on that snapshot,
  including all 11 policies and 90 conflicting-mode pairs. These registry additions
  are separate from this audit's unchanged native-fact count.

- [#59](https://github.com/agalatan/grothendieck-lean/issues/59): one shared
  coefficient-series budget lemma replaces three repeated arguments; two
  unweighted head estimates specialize their existing weighted counterparts at
  weight one. This removes **40 net Lean lines** across four files. Serial builds
  of the 21-module targeted closure passed warning-free, including all changed
  modules and the dependent upper head, residual, resolvent-tail and Haagerup
  modules. All 64 existing declaration type/axiom fingerprints and nine definition
  value hashes match the baseline. The new lemma uses only `Classical.choice`,
  `Quot.sound` and `propext`; imports, native inputs and the cap digest are unchanged.
  Full [CI run 40252824585](https://github.com/agalatan/grothendieck-lean/actions/runs/40252824585)
  passed on `e8fd03e`, whose complete tree matches delivery `0a7a1a3`: all 9,154
  build jobs, 435 axiom records (18 of 78 native facts), generated lists, forbidden-code
  scan and cap stamp passed without Lean diagnostic warnings. The ready run
  `40252925305` also passed every verification gate; only its final push failed
  because master had advanced. The change landed through
  [PR #74](https://github.com/agalatan/grothendieck-lean/pull/74) at `bf5376b`;
  [PR #75](https://github.com/agalatan/grothendieck-lean/pull/75) subsequently merged
  the same source tree at `d7521c7`. The ready retry was cancelled;
  combined-master [run 40256701427](https://github.com/agalatan/grothendieck-lean/actions/runs/40256701427)
  was also cancelled before completion. Neither cancellation is counted as a
  successful combined-master check. Subsequent green scope-skipped runs do not
  provide that evidence either. The subsequent combined-master
  [run 40259931326](https://github.com/agalatan/grothendieck-lean/actions/runs/40259931326)
  on `3a23cdd` was also cancelled. Older combined-master
  [run 40257288744](https://github.com/agalatan/grothendieck-lean/actions/runs/40257288744)
  on `ddee32a` completed its full 9,169-job Lean build, then failed the generated
  root check. [PR #78](https://github.com/agalatan/grothendieck-lean/pull/78)
  repaired that root; the current local root check passes. The older run's later
  axiom, forbidden-code and cap-stamp gates were skipped, so it is not a full
  verification pass. Full integration evidence is supplied by branch
  [run 40260600089](https://github.com/agalatan/grothendieck-lean/actions/runs/40260600089)
  at `15f9e52`, an ancestor of current master containing #59, the later Hardy-budget
  changes and the root repair. It passed all 9,170 build jobs, generated roots/lists,
  forbidden-code scan, 493-theorem axiom report (25 of 85 native facts) and the
  unchanged 140-file cap stamp, without Lean warnings or errors. All four #59
  source files match that master snapshot exactly. This is successful verification of
  that integrated branch tree; it predates #80 and the later phase-cover delivery.
  Subsequently, master `2d1898c` passed full
  [run 40266983427](https://github.com/agalatan/grothendieck-lean/actions/runs/40266983427):
  9,176 build jobs, all verification gates, 496 reported theorems (30 of 90 native
  facts), and the same cap stamp, with no Lean diagnostics. This checks the earlier
  audit deliveries together with the later phase-cover integration; #80 was not
  yet merged into that master tree.

- [#80](https://github.com/agalatan/grothendieck-lean/issues/80): the unweighted
  band comparison specializes `weighted_compare` at constant weight one. The
  response-energy estimate then uses that comparison with one error piece
  supported on the entire selected set. This removes **35 proof lines**
  across `Upper/BandComparison.lean` and `Upper/ResponseGeometry.lean` while
  preserving all 12 declaration statements and native inputs. Both
  specializations pass warning-as-error elaboration; all 12 declaration
  type/axiom fingerprints match their baselines. The shared weighted proof and the
  `band_cross` API remain intact. Focused imports replace the blanket Mathlib
  import: Lake's imported-artifact count drops from 8,908 to 1,509 for
  `BandComparison`, and from 8,909 to 2,041 for `ResponseGeometry`. Both actual
  modules build warning-free. Eight additional explicit import lines make the
  net source reduction **27 lines**. This reduces isolated-module dependency
  loading; no full-build or native runtime improvement is claimed. Full primary
  [run 40266197230](https://github.com/agalatan/grothendieck-lean/actions/runs/40266197230)
  passed all 9,170 build jobs and verification gates on `afda7b8`, whose complete
  tree matches the ready delivery. Ready
  [run 40266229202](https://github.com/agalatan/grothendieck-lean/actions/runs/40266229202)
  passed all 9,170 build jobs, including both changed modules and their concrete
  downstream importers, plus generated roots/lists, forbidden-code scan,
  the 493-theorem axiom report (25 of 85 native facts) and cap stamp, with no Lean
  warnings. Its final push lost a race with master; automatic redispatch then
  cancelled the old run. The cancellation does not negate its completed proof
  gates. The delivery landed through
  [PR #92](https://github.com/agalatan/grothendieck-lean/pull/92) at master
  `daf21e9`; both production source files match the verified delivery exactly.
  Combined-master [run 40272617860](https://github.com/agalatan/grothendieck-lean/actions/runs/40272617860)
  subsequently passed all 9,180 build jobs and verification gates on that exact
  master: 502 reported theorems, 30 of 90 native facts, and the unchanged 140-file
  cap stamp, with no Lean warnings or errors. This verifies #80 together with the
  later Hardy assembly and the stronger phase-bound interface.

- [#89](https://github.com/agalatan/grothendieck-lean/issues/89): polynomial
  evaluation reuses the existing coefficient budget, and the paired weighted
  tail specializes the standard finite-sum/tail identity. These changes remove
  **11 proof lines**. Focused imports in `ListPoly` and `Upper/Bivariate` add five
  lines, for a **six-line net reduction** across four files. Lake's imported
  artifacts fall from 8,908 to 1,661 and from 8,909 to 2,314, respectively.
  All 65 existing declaration type/axiom fingerprints and nine definition values
  match their baselines. Actual warning-as-error builds pass for all four changed
  modules, `Upper/ResolventTail` and `Upper/Haagerup`. The full reverse closure on
  master `daf21e9` contains 27 modules, including the newly added `HardyHolo`;
  aggregate validation remains the delivery CI's responsibility. The 31 Python
  tests, generated roots/lists, 19-file native-verification manifest and unchanged
  140-file cap stamp pass. No native input, headline statement, or definition
  changes; the import counts do not establish a runtime speedup. The delivery
  landed through [PR #93](https://github.com/agalatan/grothendieck-lean/pull/93)
  at `00f8141`; all four source files also match subsequent master `ebb2fd9`.
  Full [primary run 40273781782](https://github.com/agalatan/grothendieck-lean/actions/runs/40273781782)
  passed all 9,180 build jobs and every verification gate, including 502 axiom
  records (30 of 90 native facts) and the 140-file cap stamp, with no Lean
  diagnostics. Its whole tree is identical to the ready delivery and master
  `00f8141`. [Ready run 40273802402](https://github.com/agalatan/grothendieck-lean/actions/runs/40273802402)
  also passed every proof gate before its final push lost a master race and the
  automatic retry cancelled the old run. That final race does not invalidate the
  successful primary check of the exact landed tree.

- [#88](https://github.com/agalatan/grothendieck-lean/issues/88): multiplication
  by a fixed polynomial or function is a linear map, so the span universal
  property replaces repeated zero/add/scalar induction cases. Coordinate
  recurrences follow by applying evaluation directly; tensor orthogonality
  splits its existing indicator cases. Six proof bodies in `HermiteComplete`
  and `HermiteC2` lose **33 net Lean lines**, preserving all 38 declaration
  type/axiom fingerprints, seven definition values, and all imports. Both changed
  modules and their ordinary direct importers build with warnings as errors.
  All six replacement proofs also pass isolated elaboration. No native input,
  headline interface, or cap-closure file changes. All 17 ordinary affected modules
  also build warning-free through `HardyHolo` and `LocalizedComparison`; the
  20-module static reverse closure at the #88 delivery tree additionally includes `PhiBound`, `Grothe`,
  and the separate `GrotheCaps` aggregate. Full
  [primary run 40278773502](https://github.com/agalatan/grothendieck-lean/actions/runs/40278773502)
  passed all 9,180 jobs and verification gates: 502 theorem reports, 30 of 90
  native facts, and the unchanged 140-file cap stamp, with no Lean diagnostics.
  Primary `2a68d23`, ready `151eba0`, and the
  [PR #96](https://github.com/agalatan/grothendieck-lean/pull/96) landing `d3ece0f`
  have identical whole trees. [Ready run 40278864852](https://github.com/agalatan/grothendieck-lean/actions/runs/40278864852)
  also passed every verification gate before its final push lost a master race.
  Its overall cancellation and the subsequent successful no-op retry are distinct
  from the successful full primary verification. Later master `2844901` changes
  only cache instructions/scripts; the delivered Lean sources remain identical.

The measured production Lean reduction across #54, #55 and #59 is **124 lines**:
60 proof lines and 64 generated zero-coefficient lines. No module or native fact
is removed, and no meaningful native runtime improvement is established.
The additional #80 compaction brings the net total to **151 lines**: 95 proof
lines and 64 generated coefficient lines removed, with eight explicit import
lines added. Including #89 brings the net reduction to **157 lines**: 106 proof
lines and 64 generated coefficient lines removed, with 13 import lines added.
The #88 compaction raises the delivered total to **190 lines**: 139 proof lines plus
64 generated coefficient lines removed, with 13 explicit import lines added.
Other gated proposals remain outside this audit's delivered proof compactions.
The separate user-authorized #13/#44 delivery includes the cache workflow and
refined lower-chain retirement described at the top of this document.

The original statement and coverage audit is scoped to its named baseline.
Later master `c38a625` independently strengthens the conditional selected-spectrum
upper endpoint to `500000000000000000 / 355973699864771491 < 1.404598149218`
using a deduction from the existing Hardy budget. Its four coefficient-series
source files are unchanged, and the #59 patch merged cleanly with it; the later
integrated branch run above verifies that combination. The new law-node/refined-cover
certificates are not presented as part of the earlier baseline audit.

## Delivery ledger

All branches below use the `ready/codex-lean-audit-` prefix. The listed master
commits record where each delivery landed; CI evidence is tied to its actual
checked tree rather than inferred from a later green badge.

| Branch suffix | Resulting master commit | Verification |
| --- | --- | --- |
| `report` | `09244a4` | [40244730307](https://github.com/agalatan/grothendieck-lean/actions/runs/40244730307): docs-only success. |
| `stamp` | `fa00c7b` (PR #57) | Ten isolated regression tests and the real cap digest passed; later full checks include this fix. |
| `deadcode-2` | `03e7d7e` | [40247074349](https://github.com/agalatan/grothendieck-lean/actions/runs/40247074349): scope-skipped success; separate positive/negative fixtures passed. |
| `screens` | `ba3bb6c` | [40247076838](https://github.com/agalatan/grothendieck-lean/actions/runs/40247076838): full build and verification passed. |
| `inverse` | `21485d9` (PR #62), also included in `f78cb0d` | Conflicts resolved and repushed as `beaa195`; [40247044009](https://github.com/agalatan/grothendieck-lean/actions/runs/40247044009), [40250530009](https://github.com/agalatan/grothendieck-lean/actions/runs/40250530009), and [40251214852](https://github.com/agalatan/grothendieck-lean/actions/runs/40251214852) provide full checks on identical affected inputs. |
| `axioms` | `f78cb0d` (PR #70) | Conflicts resolved while preserving the incoming phase-response policy; [40251214852](https://github.com/agalatan/grothendieck-lean/actions/runs/40251214852) passed the strict checker. Duplicate PR #65 was closed. |
| `validation-docs` | `c8dbc97` | [40252827164](https://github.com/agalatan/grothendieck-lean/actions/runs/40252827164): docs-only success. |
| `coeff-series` | `bf5376b` (PR #74), also `d7521c7` (PR #75) | [40252824585](https://github.com/agalatan/grothendieck-lean/actions/runs/40252824585): full success on the exact delivery tree; later combined-master status is qualified above. |
| `final-record` | `351b6b0` | [40261239041](https://github.com/agalatan/grothendieck-lean/actions/runs/40261239041): docs-only success. |
| `band-comparison` | `daf21e9` (PR #92) | [40266197230](https://github.com/agalatan/grothendieck-lean/actions/runs/40266197230): full success on the delivery tree; [40272617860](https://github.com/agalatan/grothendieck-lean/actions/runs/40272617860) also passed the full combined master. |
| `series-bounds` | `00f8141` (PR #93) | Changed modules and targeted dependents passed; all 65 type/axiom fingerprints and nine definition values preserved. Full [40273781782](https://github.com/agalatan/grothendieck-lean/actions/runs/40273781782) passed on the exact landed tree. |
| `hermite-span` | `d3ece0f` (PR #96) | [40278773502](https://github.com/agalatan/grothendieck-lean/actions/runs/40278773502): full success on the exact landed tree; 17 ordinary affected modules also passed local builds, with all 38 type/axiom fingerprints and seven definition values preserved. |

Open findings are [#48](https://github.com/agalatan/grothendieck-lean/issues/48)
(remaining CI scope gap), [#49](https://github.com/agalatan/grothendieck-lean/issues/49)
(anonymous native facts), [#51](https://github.com/agalatan/grothendieck-lean/issues/51)
(unused interface hypothesis), [#52](https://github.com/agalatan/grothendieck-lean/issues/52)
(remaining projection/Gaussian sharing). The old partition-computation proposal
[#56](https://github.com/agalatan/grothendieck-lean/issues/56) is moot after the
user-authorized old-cover retirement. The coefficient-series portion of #52 is delivered by
#59; its broader proposals remain open. The interval-kernel proposal
[#53](https://github.com/agalatan/grothendieck-lean/issues/53) was closed without
implementation: the existing kernel is already shared, and no measured benefit
justified a change to the native/caps layer. The proof-only Hermite-span compaction
is tracked separately in [#88](https://github.com/agalatan/grothendieck-lean/issues/88).


## One native check removed (#100)

The user's later instruction explicitly authorized removing one native check.
`Grothe.ScalarTailRefinement.power_check` now proves the same Boolean equality
with `decide +kernel`. Its finite polynomial, outward arithmetic, bound,
all theorem statements and analytic hypotheses are unchanged. The generator
template is updated with the production module. The corresponding native axiom
is removed from the allowlist, reducing its size from 90 to 89 relative to
master `e8736cf`; the theorem remains required and printed. The scalar report
checker now rejects every native dependency across all sixteen scalar results.
The cap-source digest remains unchanged. Full delivery CI is left running at
the user's request; its eventual outcome is separate from local validation.

The warning-as-error production build passed on the droplet in 192.48 seconds
wall time (whole targeted build, including dependency checks). Its sixteen-result
report passes the stricter standard-only verifier; the finite power proof itself
uses only standard axioms. All 39 script tests, generated-source checks and the unchanged
140-file cap stamp pass. These local checks do not assert that delivery CI has
finished. Direct kernel reduction was selected after the proof-producing `cbv`
trial exceeded its step budget; the failed trial is not verification evidence.
