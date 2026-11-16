<!-- Verbatim from the delivery content_law_shared_trace_and_phase_obstruction_20261116.zip (README.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# Shared-matrix content bounds and a phase obstruction

16 November 2026. Read-only research; no repository files, branches, issues or comments changed.

**The unrestricted content-law inequality remains open.** This packet proves a stronger result for a family of genuine, nonzero-content complex cubic chaoses, and rules out a class of attempted proofs on another important family.

## New results

| Result | Status |
|---|---|
| A shared matrix block \(Q_d=Y^*GY-\operatorname{tr}G\), with independent standard complex Gaussian entries of \(G\) and \(Y\), satisfies the requested inequality with \(\theta=173/594<3/10\) for every \(d\ge3\). It holds for **every real continuous polynomial-growth profile**, hence both specified profiles at every energy. | **P** |
| Arbitrarily many independent such blocks, arbitrary amplitudes, and arbitrary independent finite bulk \(\sum_b\overline Z_bF_b(U)\) retain the same constant. There is no factor depending on the block count. | **P** |
| Each block may also contain \(\sqrt\lambda\sum_{a,b}\overline Z_{ab}Y_aY_b\), sharing every \(Y\) coordinate, for every \(\lambda\ge0\). The same constants survive. | **P + C** |
| Dimension \(2\) has \(\theta=6/11<3/5\). Sharper dimension-dependent constants decay as \(d^{-2}\), with a matching-order lower bound from \(h(v)=v\). | **P + C** |
| For \(q=XP_m\), no number or degree of tangent-divergence controls, followed by the specified unrestricted law-norm Cauchy–Schwarz step, can produce \(\theta<6/e^2>4/5\). The missing operation is averaging between different sign branches. | **P**; elementary constant comparisons **C** |

The fully shared Hermitian-basis family in the input “Prove content law” packet required \(d\ge8\) to get below \(37/100\). The present proof reaches \(173/594\) at \(d=3\), extends to sums, and allows additional holomorphic terms sharing the block. Its key step is restricting content to the trace coordinate **before** estimating the signed pairing.

For a single block without the extra holomorphic term:

| \(d\) | Proved upper coefficient | Lower coefficient forced by \(h(v)=v\) |
|---:|---:|---:|
| 2 | \(6/11\) | \(16/33\) |
| 3 | \(173/594\) | \(8/33\) |
| 4 | \(175/888\) | \(16/111\) |
| 5 | \(1361/10080\) | \(2/21\) |
| 8 | \(257/4932\) | \(16/411\) |

Every active block of dimension at least \(3\) is below **all six** supplied content thresholds; dimensions at least \(2\) cover the last five. This is a statement about these cubic classes. The row budgets themselves are numerical targets, and **no unrestricted degree-5 row or improved Grothendieck bound is claimed**.

## Exact replay

From this extracted folder, using Node.js 20 or later:

    node scripts/verify.mjs

No packages or network are required. The checker uses BigInt rational arithmetic. It verifies the symbolic identities and positivity certificates for every \(d\) and every \(\lambda\ge0\), then independently checks Gaussian Wick moments and first-chaos contents on eight genuine cubic models, including a shared model in 60 complex Gaussian coordinates. It also checks 48 polynomial-profile instances, all six profile regularity conditions, and the rational constants in the obstruction. It writes results/replay.json.

The replay took a few seconds in the delivery environment. The written analytic proofs establish the quantified functional statements; the finite Wick instances are cross-checks, not a proof by testing.

## Contents and dependencies

- PROOFS.md: the matrix-block theorem, same-law deficit, multiple-block proof and scalar estimates.
- SHARED_HOLOMORPHIC.md: the continuum extension with shared holomorphic terms.
- TANGENT_OBSTRUCTION.md: the quantitative obstruction and the nonlocal reflection that escapes it.
- LEDGER_PATCH.md: proposed additions and precise links to existing ledger rows.
- LITERATURE.md: papers read, references followed and what transfers to this problem.
- AUDIT.md: the trust boundary, scope and replay of the two input packets.
- scripts/verify.mjs, rows.json, results/replay.json: standalone exact replay.
- source_manifest.json: hashes of the named input results and research sources.

Repository dependencies are **6.3.23** (signed content representation, specialized directly here) and **11.31a** (symmetry). The law norm is the one in **6.3.25**, but its projected Cauchy–Schwarz estimate is not used. **Higher-degree 4.19** supplies the application and the still-open general target. All new constants are rational or explicitly bounded by rational arithmetic; no numerical optimization is a proof premise.

The most useful next step is a phase-conditioned analogue of the signed pairing for general, nonradial conditional variances. The obstruction shows that adding more local tangent controls alone cannot supply it.
