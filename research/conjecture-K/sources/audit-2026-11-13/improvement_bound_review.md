<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_bound_review.md (file dated 2026-11-13). Only this line was added. -->
# Independent review of the exact cover improvement

Agent codex-a713, 13 November 2026. Source-level proof audit and independent rational replays; no Lean invocation or build, and no original source modification.

## Verdict

**No coverage, source-binding or mathematical soundness gap was found for v1, v3, v5 or final v6.** Accepting the unchanged established repository theorems, the externally checked finite cover gives an ordinary computer-assisted mathematical proof of the displayed strict lower bound, without Conjecture K or any new analytic assumption. For the final version personally replayed here, v6, this is

    K_G^C > 1.40169731864.

The qualification is about verification status, not a new mathematical conjecture: **the improved endpoint has not been checked by Lean.** The new finite `checkCover = true` computation is supported by the reviewed independent Python Fraction checker and the additional checks below. No theorem instantiating the improved cover was built in this audit. The existing endpoint in `MainResult.lean` remains 1.401697117301.

## Why the existing formal proof can accept a different cover

The decisive point is that the transfer theorem is parameterized by the cover and cap. [LawNodeLower.lean:47](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:47) takes arbitrary `extraBatches`, rational B, cuts and box strings, with hypotheses that the batches and cover pass their checkers. It does not hard-code the old cover or endpoint. Its proof obtains one valid box for every point of the complete domain and applies the established box soundness theorem.

The unchanged premises have explicit sources:

- [certified_rows](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:30) assembles the existing row checks independently of any cover.
- [certified_mixed_batches](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:36) and [extended_batches_checked](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:41) do the same for the original and additional law nodes. The latter use [certLawNodes](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeCheck.lean:11).
- [MainResult.lean:27](/Users/alingalatan/workspaces/grothe/Grothe/MainResult.lean:27), together with `vertexCaps_of_capsRest` and `nodeCaps_of_vertexCaps`, supplies `NodeCaps`. This premise is already discharged in the repository; it is unrelated to Conjecture K.
- [transferInputs_of_law_nodes](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:110) and [lower_bound_of_law_nodes](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:118) give `1/B ≤ K` for every Grothendieck bound K. The separate rational comparison `L < 1/B` gives the strict endpoint via [strict_lower_bound_of_law_nodes](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:125). The existing statement bridge and existence of a finite Grothendieck bound pass this uniform reciprocal bound to the constant itself.

Thus moving a partition boundary, subdividing boxes or changing valid convex row mixtures does not require re-proving Gaussian node integrals. It requires exactly a valid new cover computation. This is the computation replayed here. The old row, law-node and analytic theorems were inspected, but their prior formal builds and their entire analytic ancestry were not rebuilt during this review.

## Formula and coverage checks

I compared [improvement_independent_check.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_check.py) against the actual Lean definitions, rather than relying on agreement with the search/export implementation. The following match:

- The constants epsilon=149/200, rho=973612157/10^9, C6=4045313/10^5, pad=10^-11 and xMax=31/4; the current row ordering is row01 through row19.
- `Row.N=E−diag(epsilon−delta,0,0)`, `g=delta*b`, affine virtual-row mixtures, the positive trailing gate block, and its Schur-complement price.
- The moment polynomial `P.Jq 0 1 x`, the nonnegative sixth-order coefficient guard, the two x endpoints, and the exact quadratic maximum over each scale interval.
- Source nodes rescaled by delta; the zero node; the four-node chord/rechord construction; potential compatibility through `samePot`; and per-node x-range checks. Joint spectral budgets use the stored `xs`, while the other budget types use xMax, as in `GBud.xcap`.
- Cap-box indexing, the crude row, and the negative convex-mixture correction in the beta term.

The partition replay starts at the exact original domain

    [0,9/10] × [0,973612157/10^9] × [0,31/4].

Every cut lies strictly inside its current axis interval. The two children share their closed cut face. Every leaf equals exactly one retained box domain, with no duplicate domain, missing leaf or extra token. These checks are stronger than the minimum needed for the Lean coverage theorem and establish complete coverage, including all boundary faces. No sampled or floating coverage argument is used.

The independent checker is deliberately a parser for the current generated syntax, not a general Lean parser. I separately checked that all references in the actual v1, v3 and v5 artifacts have the correct arity and nonnegative, valid indices, and that every referenced node has nonnegative scale. These supplemental guards were then added directly to the checker before the final v6 replay, including the first-node nonnegativity condition in Lean's `tchordOK`. All actual batch fronts also match Lean's spec-dependent parsing: 47 ordinary three-field witnesses, 188 spectral three-field witnesses and 121 spectral four-field witnesses. There is no malformed-front or Python-negative-index acceptance in these artifacts. The unused, incorrect `row()` parser was dead code and was removed during review; `read_rows()` is the path used in these replays.

## Replay evidence and exact endpoints

The parent checker was imported without executing its output-writing main function. I independently traversed all boxes and the partition, checked the extra reference guards above, and compared the exact resulting maximum. Parent-owned result files were not overwritten.

| Version | Boxes | Reference guards | Binding box | Displayed strict endpoint |
|---|---:|---:|---:|---:|
| v1 | 10,909 | 74,352 | 5,611 | 1.401697156253 |
| v3 | 10,981 | 74,920 | 5,984 | 1.401697313857 |
| v5 | 10,981 | 74,920 | 5,984 | 1.401697314828 |
| v6 (final) | 11,107 | 75,928 | 3,830 | 1.40169731864 |

For v1,

    B=713420866653353/10^15,
    L=1401697156253/10^12,
    1−B L=444382772633691/10^27 > 0.

The replay's exact maximum agrees with `improvement_replay_v1.json`. Its certificate SHA256 is

    c1176b6134725003cc79f6efcd124d898470cbe694628495f85f29e11d05207d.

For v3,

    B=356710393219013/500000000000000,
    L=1401697313857/10^12,
    1−B L=35250399236859/500000000000000000000000000 > 0.

The displayed gain over the old endpoint is exactly `49139/250000000000 = 0.000000196556`. Its certificate SHA256 is

    75be7c4d12d7d5994bb1b9b16873f3707ce3948b20e5b62b36cfd3c1f76b785c.

For v5,

    B=89177598242953/125000000000000,
    L=350424328707/250000000000,
    1−B L=10652281648229/31250000000000000000000000 > 0.

The displayed gain over the old endpoint is exactly `197527/10^12 = 0.000000197527`. Its certificate SHA256 is

    afd4ec1aeaabab56de45f7f17c0d77b6841a15247f2df1ba3fd7702c76ed117b.

I verified that v5 changes exactly 177 strings from v3, solely through cap-box or two-component mixture weights. All domains, partition tokens, row choices and node references are unchanged. The complete v3 and v5 replays each took about four seconds; certificate bytes were unchanged between reading and completion. For v1 and again at v5 I checked every source hash recorded in `improvement_replay_v1.json` against the live file; none differed. The current independent checker additionally pins the parsed source files before and after its run. The checker version inspected here has SHA256

    b883d43d0fdf6129b0881bbb0115c688c300dad75c6efca7c15149b77ebecda1.

For final v6,

    B=713420784003651/10^15,
    L=17521216483/12500000000,
    1−B L=447366620567/12500000000000000000000000 > 0.

The displayed gain over the existing Lean endpoint is exactly `201339/10^12 = 0.000000201339`. The final artifact adds subdivisions and reprices all boxes; I replayed the complete final cover, not only its changed boxes. Its certificate SHA256 is

    693f21b4be14c4a49e1e55b6c8556b0f639fbe8ec1d1011700a39542fc89fd77.

The strengthened checker used for final v6 has SHA256

    db3f64d22651da96f4e7f2cb16950d1ed23ee795913a7d6862db43d6ddcdece1.

The final independent replay completed in 3.87 seconds. I hashed 35 source/artifact files before and after it; all were unchanged. This set included all 19 row constructor files; the row order, row definitions and constants; the gate, moment, mixture, box and budget semantics; both batch sources; the law-node check and transfer source; MainResult; the Python checker and the final certificate. No endpoint or proof-theorem source was modified or built.

## Verification boundary

The conclusion combines previously established formal mathematics with a newly inspected exact external finite computation. Python Fraction avoids numerical rounding in the new box and partition proof, but Python execution is not a Lean proof term. Calling this an **externally verified exact cover improvement using the existing proof** is accurate. Calling it a **new Lean-verified lower endpoint** would be inaccurate until the new data and checker equation have been instantiated and checked there.

No blocker was found for the four specific artifacts above, including final v6. Other versions inherit the same mathematical transfer but require their own successful complete replay and artifact binding; this review does not automatically certify an unseen later file.
