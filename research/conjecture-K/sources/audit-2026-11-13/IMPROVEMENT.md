<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/IMPROVEMENT.md (file dated 2026-11-13). Only this line was added. -->
# An actual lower-bound improvement

Agent codex-a713, 13 November 2026. This is the research continuation requested after the audit, not a revision of its conclusions.

**The new externally certified result is**

\[
\boxed{K_G^{\mathbb C}>1.401697318640.}
\]

The previous repository endpoint is 1.401697117301. The increase is exactly **0.000000201339**. This is a small improvement obtained from the existing unconditional proof, with no use of Conjecture K. It does not establish the proposed step to approximately 1.4022.

**Verification status:** the new finite computation was checked using exact rational arithmetic by two separate implementations and independently reviewed against the existing Lean definitions and theorem interfaces. It is an ordinary computer-assisted proof using the repository's established analytic results. The new endpoint has **not** been checked by Lean; the existing Lean endpoint is unchanged. No Lean sources were edited and no Lean build was run, in accordance with the original constraints.

## Exact result and certificate

The selected final certificate is [improvement_certificate_v6.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_certificate_v6.json). It contains 11,107 serialized boxes and 22,213 partition tokens covering the complete parameter domain

\[
[0,9/10]\times[0,973612157/10^9]\times[0,31/4].
\]

Every box has an exact upper bound at most

\[
B=\frac{713420784003651}{10^{15}}=0.713420784003651.
\]

The existing transfer theorem then gives

\[
K_G^{\mathbb C}\ge\frac1B
=1.4016973186400501658073998259695\ldots.
\]

For the displayed strict endpoint

\[
L=\frac{17521216483}{12500000000}=1.401697318640,
\qquad
1-LB=\frac{447366620567}{12500000000000000000000000}>0.
\]

Thus the strict inequality follows from an exact rational comparison; its final decimal digits do not depend on floating-point rounding. The gain over the old displayed endpoint is exactly \(201339/10^{12}\).

Final certificate SHA256:

```
693f21b4be14c4a49e1e55b6c8556b0f639fbe8ec1d1011700a39542fc89fd77
```

The complete exact maximum, source hashes, binding box and independent verification result are saved in [improvement_independent_v6.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_v6.json). The separate search-side replay is [improvement_replay_v6.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_replay_v6.json).

## What changed

The witness, 19 source rows and existing certified law nodes are reused. I tightened the finite cover that combines their estimates:

1. Moved the scalar/law partition interface at t=27/32 left by 1/100000, repricing all affected boxes on both sides.
2. Made 72 adaptive bisections and reoptimized the permitted mixture weights.
3. Made 12 local partition-boundary moves, including x boundaries, while maintaining the complete partition.
4. Reoptimized weights in 601 near-binding boxes, accepting 177 exact improvements.
5. Made a final 126 adaptive bisections after the changed boundaries exposed a different bottleneck.

This increased the box count from 10,909 to 11,107. All accepted bounds, including proposals made by floating-point optimization, were recomputed as exact fractions. Every saved version received a full cover replay. The final maximum is at zero-based box 3830, an unchanged original bottleneck; no global optimality of the cover is asserted.

The method and generation commands are recorded in [improvement_cover_method.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_cover_method.md). The independent proof review is [improvement_bound_review.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_bound_review.md).

## Why this implies a lower bound

The old endpoint is recorded in [RefinedCoverData.lean](/Users/alingalatan/workspaces/grothe/Grothe/Research/RefinedCoverData.lean:10) and [MainResult.lean](/Users/alingalatan/workspaces/grothe/Grothe/MainResult.lean:37). The crucial existing interface is [LawNodeLower.lean](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:47): its profile theorem accepts arbitrary cover data and a rational cap B. It does not fix the old partition or endpoint.

The proof chain is:

- Existing row and batch certificates establish the unchanged estimates. The extra law batches are the same ones already used in the current lower-bound proof.
- The new boxes and complete partition establish the finite cover condition at the smaller B. All potential compatibility, interpolation, mixture, gate and node-range conditions are checked.
- Existing Gaussian `NodeCaps` are supplied by the established main proof. They are not a Conjecture K assumption.
- [The parameterized transfer](/Users/alingalatan/workspaces/grothe/Grothe/Research/LawNodeLower.lean:118) gives \(1/B\le K\) for every Grothendieck bound K. The existing passage to the constant itself applies unchanged.
- The positive exact slack above gives the displayed strict endpoint.

The new work is the finite cover computation and its audit. The pre-existing analytic ancestry and historical Lean builds are reused, not newly rebuilt here. The formal step still required to add this endpoint to the repository is to instantiate the new serialized data and have Lean establish its cover-check equation and endpoint theorem.

## Reproduce the independent check

Run this command; it does not invoke Lean or import the optimization/export code:

```sh
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_independent_check.py --certificate /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_certificate_v6.json
```

The checker reads the current Lean row and batch constructors directly, translates their rational formulas independently, and checks every box and every partition leaf. It rejects invalid reference indices, reference arities, negative interpolation scales, incompatible potentials, inadmissible weights, failed gate conditions and inadequate bounds. It also checks source hashes before and after its run. The final run passed in approximately 3.9 seconds.

Execution note: some historical discovery runs omitted the requested `-I` flag. The launch instructions and local imports were corrected. Both final exact checks used isolated Python: the independent check above and the separate [saved-cover replay](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_isolated_replay_v6.json), which also checked serialization and unchanged certificate hashes. No search result is accepted merely because its original discovery process ran successfully.

The source checkout was read at commit `32cfb7d8712a330e0e3cb807056314912ec28a29`; read-only `git status --short` was empty after the work. All new scripts, certificates and reports are inside the authorized audit folder.

## Separate progress toward Conjecture K

These results are independent of the new lower bound above.

**Proved analytically, with exact scalar checks:** [improvement_joint_tail.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_tail.md) reduces the joint A/B finite-remainder estimate to a concrete compact region. For shell variances at most .0113, it is sufficient to prove the robust target on

\[
0\le x\le6,\qquad |\alpha|,|\beta|\le.4,
\]

with an additional diagonal reserve .0000753. The signed version needs .0000807. The proof pays the amplitude tails using energy-weighted Gaussian estimates, permits arbitrary correlation between the shell drivers, and preserves their possible dependence on the remote cubic q. The region x≥6 is closed analytically for all amplitudes. The remaining compact-region inequality is **not proved**.

**Numerical diagnostic only:** [improvement_joint_probe.jsonl](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_probe.jsonl) records exploratory finite-remainder searches. Some coarse quadrature violations disappeared on refinement around the phase singularity. These searches provide neither a counterexample nor a certificate and contribute nothing to the displayed lower bound.

**Proved conditional extension to mixed tensors:** [improvement_content_extension.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_content_extension.md) proves a dimension-free perturbation lemma at the peak row. If a cubic core p has charge one under rotation of a coordinate block, h contains only the other circle charges, and the core satisfies \(D(p)>0\), \(C(p)^2\le.225D(p)\), then

\[
\|p+h\|_2^2\le.0463,\qquad
\|h\|_2^2\le.006D(p)
\quad\Longrightarrow\quad C(p+h)^2\le.24D(p+h).
\]

The new proof derives uniform derivative bounds and uses symmetry to cancel the first variations. The core inequality is an explicit input, not re-certified in that note. This covers a quantified neighborhood with arbitrary complementary cubic shells; it does not show that every cubic is close to such a core and does not give the needed global .10 bound.

The general all-dimensional content inequality and the full assembly of K remain open. The compact joint estimate above is a more precise next proof target, but solving it alone would not prove K.
