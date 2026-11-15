<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_cover_method.md (file dated 2026-11-13). Only this line was added. -->
# An unconditional improvement from the existing finite cover

Agent: **codex-a713**. Source checkout: `/Users/alingalatan/workspaces/grothe`, read-only HEAD **`32cfb7d8712a330e0e3cb807056314912ec28a29`**. All new artifacts are confined to `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/`. No Lean source, existing research file, Git state, Gaussian node, or law-node certificate was changed. No Lean build was run.

## Result and precise status

The final **v6** cover yields the rational cap

\[
B_{\rm new}=\frac{713420784003651}{10^{15}}=0.713420784003651.
\]

Using the existing witness-transfer theorem, this gives the strict mathematical endpoint

\[
\boxed{\quad K_G^{\mathbb C}>\frac{17521216483}{12500000000}
=1.40169731864.\quad}
\]

The exact reciprocal is approximately `1.40169731864005016580739982597`. Strictness follows from the exact positive residual

\[
1-B_{\rm new}\frac{17521216483}{12500000000}
=\frac{447366620567}{12500000000000000000000000}>0.
\]

This improves the current main theorem's `1.401697117301` by exactly

\[
\frac{201339}{10^{12}}=0.000000201339.
\]

This is an **externally checked exact rational cover**, using the already formalized row, node, Gaussian-cap and transfer inputs. It is **not yet a new Lean theorem**. Both checks passed for v6: the first checker reconstructs every box bound and checks the complete partition; the root agent's independent checker directly parses the current Lean data and implements the checker formulas without importing the discovery code. The [independent v6 replay](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_v6.json) reports PASS for all 11,107 boxes and the full partition.

The current theorem already contains the stronger implicit reciprocal `10^12/713420886479 = 1.4016971173010865297…`. Its extra `8.65·10⁻¹⁴` over the displayed decimal is pre-existing rounding room. The improvement above is different: it lowers the witness cap by exactly `102475349/10^15`, through new cover choices and boundaries.

Final artifacts:

* [Exact serialized certificate](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_certificate_v6.json), SHA-256 `693f21b4be14c4a49e1e55b6c8556b0f639fbe8ec1d1011700a39542fc89fd77`.
* [Full rational input cover](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_cover_v6.json).
* [Exact replay summary](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_replay_v6.json).
* [Independent checker](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_check.py).

## What changed

The original finite cover has 10,909 boxes and cap `0.713420886479`. Its worst box is a scalar-envelope box on

\[
t\in[1687/2000,27/32],\qquad
\tau\in[0,973612157/10^9],\qquad x\in[0,31/4].
\]

It uses envelope rows 13 and 14 with mixture weight `26423503/50000000`. Its exact upper bound is approximately `0.7134208864780055`, whereas the next largest box is only `0.7134208666533528`. This isolated scalar/law boundary was the first opportunity.

Moving the cut `t=27/32` left by `1/100000` shrinks the scalar box and extends the 110 adjacent law boxes. Their row inequalities are valid on the enlarged t-intervals. Repricing all 111 changed boxes shows that the global maximum falls to the old second-largest box. Moving the corresponding cut in the guillotine partition preserves complete coverage; this was independently checked, not assumed from a picture.

Subsequent operations use only the same certified rows and law nodes:

1. Bisect an existing box and reoptimize its existing two-component mixture separately on the children. Child law-scale interpolation retains the parent's original `scale_domain`; this prevents silently changing the chord being used.
2. Move selected local t- or x-boundaries and reprice every adjacent box. The entire new guillotine partition is checked after each accepted move. Trial τ-boundary extensions are accepted only if the original referenced nodes still bracket the required scales; none improved the maximum in the accepted boundary pass.
3. Reoptimize mixture weights after the boundary changes. Floating golden-section search proposes rational weights; the proposed weight and the retained old weight are compared using exact fractions. Floating results never certify a bound.

| Stage | Boxes | Strict endpoint | Accepted change |
|---|---:|---:|---|
| Current source | 10,909 | 1.401697117301 | Existing theorem |
| v1 | 10,909 | 1.401697156253 | One t-cut, 111 repriced boxes |
| v2 | 10,981 | 1.401697158374 | 72 bisections with new mixture weights |
| v3 | 10,981 | 1.401697313857 | 12 local moves: five t-cuts, seven x-cuts |
| v4 | 10,981 | Same as v3 | No accepted move; identical certificate |
| v5 | 10,981 | 1.401697314828 | 177 exact accepted reweights among 601 near-binding boxes |
| **v6** | **11,107** | **1.40169731864** | **126 further bisections; final bounded pass** |

Every final box bound was recomputed from the row/node inputs. All 11,107 bounds are at most `B_new`; the complete partition covers the original domain `[0,9/10]×[0,973612157/10^9]×[0,31/4]`.

## Source binding and proof dependencies

The discovery/replay script does not simply trust decimal bounds in a JSON ledger. It:

* reconstructs every original box bound and matches it exactly to the stored rational;
* serializes every current box and compares all strings with the current [RefinedCoverData.lean](/Users/alingalatan/workspaces/grothe/Grothe/Research/RefinedCoverData.lean);
* binds the inherited row headers, matrices, couplings, tables, mesh and every used source-node polynomial/scale to the current row constructor data and current Lean row files;
* checks the retained mixed-batch declaration and the unchanged law-node inputs;
* verifies the old and new partition trees, including every leaf domain, without numerical tolerances;
* records source hashes and output hashes.

Historical full-file row hashes are stale because imports/comments changed. The script therefore checks the current constructors and exact numeric values directly instead of treating those historical hashes as current proof provenance.

The mathematical implication is the existing chain:

1. [MainResult.lean](/Users/alingalatan/workspaces/grothe/Grothe/MainResult.lean:26), `Grothe.Statement.capsRest`, and the existing vertex/node-cap bridge supply `NodeCaps` unconditionally.
2. [LawNodeLower.lean](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean) supplies `certified_rows` and `certified_mixed_batches`; [LawNodeCheck.lean](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeCheck.lean) supplies `certLawNodes` for the unchanged extra batches.
3. The new exact cover satisfies the same mathematical predicate `checkCover rowData (mixedBatches ++ extraBatches) B_new cuts_new boxes_new = true`. The semantics are the existing [Basic.lean](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Basic.lean), [Moment.lean](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Moment.lean), [Gate.lean](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Gate.lean), [Mixed.lean](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Mixed.lean) and [Boxes.lean](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Boxes.lean).
4. `LawNodeLower.lower_bound_of_law_nodes` gives `1/B_new ≤ K` for every Grothendieck bound `K`. Its `strict_lower_bound_of_law_nodes` variant consumes the exact rational comparison above.
5. [StatementBridges.lean](/Users/alingalatan/workspaces/grothe/Grothe/StatementBridges.lean), `isBound_iff` and `lt_constant_of_lowerAbove`, turns this into the stated bound for the complex Grothendieck constant. Existence of a Grothendieck bound is already furnished by the current upper theorem.

There is no Conjecture K premise, no new Gaussian quadrature premise, and no promotion of the exploratory tensor optimization to a proof. The improvement comes entirely from consuming the existing certified estimates more efficiently.

To formalize the new endpoint later, the remaining work is to import the new rational box/partition data, prove its finite `checkCover` fact with the existing checker, and invoke the already parameterized transfer theorem with `B_new` and `L_new`. The heavy Gaussian node-cap statements themselves are unchanged. This session did not perform that Lean consumer replay, in accordance with the user's restriction.

## Final bottleneck and stopping point

Final binding box **3830** is the original box **3736**, still using a **single component** (group 4, zero-based source row 13, nominal row 0.845). Its domain is

\[
\begin{aligned}
t&\in[1693/2000,847/1000]=[0.8465,0.847],\\
\tau&\in[32129201181/128000000000,
4144666952349/16384000000000]\\
&\approx[0.2510093842265625,0.2529703950408325],\\
x&\in[31/64,279/512]=[0.484375,0.544921875].
\end{aligned}
\]

Its four node references are `[1056,1057,343,1058]`, with original scale domain `[32129201181/128000000000,65232014519/256000000000]`. Its exact rational upper bound is stored in the final replay. The final pass reached this unchanged bottleneck and then plateaued; its remaining gain over v5 was only `3.812·10⁻⁹` in the displayed lower endpoint.

A single-component box has no mixture weight to improve using the implemented two-component search, and pure subdivision of the same separable scalar bound need not reduce its maximum. A further useful campaign would try another already certified row/component or a sharper law-scale chord at this location, with a complete new finite-cover replay. No claim is made that the present cover is globally optimal. We stopped after the requested bounded final pass rather than interpreting a local search plateau as a theorem of optimality.

## Reproduction

Run these sequentially with the absolute Python 3.12 executable in isolated mode (`-I`). The helper scripts explicitly add only their trusted audit directory for local helper imports; the cover reader explicitly adds the repository's trusted `tools` directory. They write only `improvement_*` artifacts in the audit directory. They do not invoke Lean, Git mutation, network tools or source generators that write into the repository.

**Execution provenance:** the original discovery commands and initial discovery-side replays in this subagent's tool log used direct `python3.12 script.py` calls without `-I`; they did not use an isolation bootstrap. The isolated commands below are the corrected reproduction procedure. After packaging, isolated imports of all five scripts and both supported `--help` commands passed. A complete discovery-side exact replay of the saved v6 cover also passed under absolute Python 3.12 `-I`: all 11,107 box bounds, the full partition, serialization equality, and the strict reciprocal inequality were checked in 5.45 seconds. Its report is `improvement_isolated_replay_v6.json`. The parent's independent full final replay also used absolute Python with `-I`. The optimization searches were not rerun; the final cover, certificate and independent checker hashes remained unchanged.

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_cover.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_refine.py --input v1 --steps 150 --seconds 180 --label v2
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_boundaries.py --input v2 --steps 12 --seconds 150 --label v3
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_reweight.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_refine.py --input v5 --steps 350 --seconds 100 --label v6
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_check.py --certificate improvement_certificate_v6.json
```

To replay the existing final cover on the discovery side without optimizing or regenerating any certificate:

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3.12 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_isolated_replay.py
```

The saved certificate is the primary reproducible object: replaying its rational inequalities is deterministic. The search uses floating proposals, so a different platform could propose different rational mixture weights; those proposals still require exact acceptance and can be checked independently. The supplied runs completed well inside the stated time caps.
