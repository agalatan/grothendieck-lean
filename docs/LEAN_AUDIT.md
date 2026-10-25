# Lean audit and simplification

Audit date: 26 October 2026. Baseline: `origin/master` at
`4e9f32d78a198da551239bbfa9e56e713d765cae`.
Tracking: [#46](https://github.com/agalatan/grothendieck-lean/issues/46), under epic #12.
File/line references below refer to that baseline, before the proposed fixes.

## Result and limits

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

These are not claims that the current cap stamp is invalid or that an anonymous
example compromises an endpoint. The checked-in stamp matches exactly:
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

`Grothe/Transfer.lean:40–58` quantifies all finite complex matrices, unimodular
scalar families and unit vectors in arbitrary finite-dimensional complex Euclidean
spaces. The scalar/vector value sets are nonempty and bounded (`:60–107`), so
Lean's total real supremum does not make the inequality vacuous. The finite-span
extension to arbitrary Hilbert spaces is explanatory mathematics; the Lean
interface itself is finite-dimensional, as README states.

| Result | Actual interface and checked meaning |
|---|---|
| `LowerAnalytic.lower_bound_of_nodeCaps` (`Reduction.lean:47–51`) | `NodeCaps → IsGrothendieckBound K → 1.401695322458 < K`. `NodeCaps` is the **padded** inequality `rowPot k s − 10⁻¹¹ ≤ c` at every listed node, not the unpadded inequality. |
| `LowerAnalytic.lower_bound_of_capsRest` (`CapNodes.lean:32–62`) | Same endpoint from vertex caps of rows 12–15 plus excluded caps of other rows. All exclusion lists are empty, so only those four rows remain. This belongs to separate target `GrotheCaps`. |
| `UpperChaos.fresh_upper_rounder` (`PhiBound.lean:70–77`) | For `X ∈ L²(mu2)` with charge-one covariance, requires `ComparisonInputs GT X`, finite-head energy closeness and the Hardy partial-sum bound; concludes the exact rational `500000000000000000/355973696735190991`. `upper_value_lt` proves the strict decimal comparison. |
| `Grothe.haagerup_bound` (`Haagerup/Power.lean:237–239`) | No analytic/certificate hypotheses; concludes `IsGrothendieckBound (1404909543/1000000000)`. Depends on its explicitly pinned native check as well as standard logical axioms. |

The lower witness is the bounded operator `P₁,₀ − (149/200)P₂,₁`
(`Witness.lean:311,432–448`). Polarization and phase rotation establish a norm
bound, not merely a real-part bound (`WitnessCap.lean:106–111,524–537`). The
finite-dimensional test approaches 1 as dimension grows (`Witness.lean:463–479`);
requiring dimensions at least 2 in the reduction leaves that argument intact.
`Transfer.lean:47–54` derives positivity before division. Endpoint rationals in
`Lower/Endpoint.lean:15–28` give the stated strict lower decimal.

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
proofs (`Rounder.lean:68–78,132–182`). The proved `PhiBound` is `φ² ≤ 3`, not the
stronger `|φ| ≤ 1` reserved to #19. No claim is made here to discharge #18 or
#39–#41.

## Finite coverage, rounding and parsing

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

The full **82-site inventory**, including individual names, source locations,
report coverage and runtime provenance, is [LEAN_NATIVE_INVENTORY.md](LEAN_NATIVE_INVENTORY.md).

| Facts | Count | Computation |
|---|---:|---|
| `Lower.certRows0`–`4` | 5 | Row certificate checks, four consecutive rows per chunk. |
| `Lower.certBatches0`–`2` | 3 | Mixed-batch/node checks, seven batches per chunk. |
| `Lower.certBoxes0`–`3` | 4 | Box majorant/support checks, up to 2,200 boxes per chunk. |
| `Lower.certPartition` | 1 | Exact partition-tree cover. |
| `LowerAnalytic.capRangeKK_j` | 60 | Fifteen rows × four node ranges; recipes, interval tables, quadratic/LDLᵀ and piece checks. |
| `LowerAnalytic.capChords_check` | 1 | Exact chord inequalities, valid independent vertex endpoints. |
| `head_check` | 1 | Stored upper-table index bounds and interval head residual through degree 501. |
| `Upper.comparison_check` | 1 | Selected weighted band masses/radii and cross/quadratic comparison budget. |
| `HaagerupPower.check` | 1 | 1,024-term finite head, fourth-power norm, inverse defect, combined seed and signed resolvent tail. |
| `UpperChaos.phi_cover_check` | 1 | Phase terms, exact bisection cover and analytic-far-field numerical inequality. |
| Anonymous `CapTables` examples | 4 | Nine-entry parser length, sample table validity, rejection of a wrong interval, one radial interval. |

`NATIVE` has 78 entries; `REQUIRED` has 203 declarations. All REQUIRED names are
present among 424 distinct default-report print directives. Seventeen named
checks are printed directly, chords indirectly, and the 60 ranges through the
separate caps report. The checker rejects unlisted axioms in reported theorems;
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
  (`CAPS_STATUS.md:27–31`). Their source stamp still matches.
- Historical upper-head module: 62 s. Phase source comment: approximately
  1.5 min, not a fresh benchmark.
- Current per-fact times for comparison, chords, Haagerup power, individual
  cap ranges and anonymous examples are **unmeasured**. The old 257 s
  `haagerup_check` timing concerns a superseded fact and is not reused.

This audit did not launch multi-hour reruns on the already-busy shared machines.
Do not merge chunk facts merely to reduce the number of axiom names: it removes
process-level parallelism without removing arithmetic. Benchmark before choosing
kernel `decide +kernel` for anything beyond small diagnostic examples.

## Dead code and mathematical compaction

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
| Remove unused partition straddler scan | `Boxes.lean:368` evaluates a scan at 8,755 internal nodes; `partOK_sound:403` discards that premise. [#56](https://github.com/agalatan/grothendieck-lean/issues/56). | Native/closure change needs approval and replay; runtime saving unmeasured. |
| Trim the inverse polynomial | 64 generated zero lines and shorter products, preserving the polynomial. [#54](https://github.com/agalatan/grothendieck-lean/issues/54). | Native-input approval and reproducible regeneration. |

A wholesale interval-library merger would overstate duplication: `Basic.lean`
(77 lines) and `IntervalSound.lean` (212) already serve Table, Haagerup and
CapCheck. PhiCheck (186 lines) has different exact Taylor/box responsibilities.
Only factor genuinely repeated Horner/list soundness, with measured overhead;
relocating IntervalSound merely for naming would trigger an expensive cap rebuild
without mathematical benefit. See [#53](https://github.com/agalatan/grothendieck-lean/issues/53).

Small documentation corrections remain: README:66–68 / overview.tex:185 omit the
cap padding in abbreviated prose (README:92 states it correctly);
FibrePotential:41–43 still calls rotation unfinished; Lower/Transfer:25–28 retains
an obsolete first-moment hypothesis description; Witness:429–431 uses coefficient
1 in a Wick comment although its variance-two coordinate convention and actual
WickChaos:31–53 use coefficient 2; Boxes:433 calls a sequential wrapper parallel.
The code is consistent. Batch Lean-comment edits with approved closure work.

## Delivery plan and approval boundary

Deliver this report first as a docs-only ready branch. Then independently deliver
stamp-checker hardening (#47), current/validated dead-code roots (#50), and the
safe leaf proof simplifications (#55), with actual validation and savings recorded
in the respective issues. Every commit uses the repository prefix and issue
reference; only CI may move master.

No change to a headline interface, native fact/input, or caps-closure source is
included without the user's go-ahead. This includes #49, #51, #54, #56 and the
closure portions of #52/#53. Preserve the same 140-file digest for safe deliveries.
Workflow #48 stays with reserved PR #44. All wider estimates above are proposals,
not claimed delivered improvements.
