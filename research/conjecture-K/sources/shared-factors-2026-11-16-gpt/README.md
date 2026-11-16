<!-- Verbatim from the delivery content_law_shared_factors_20261116.zip (README.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Content-law inequality, second round

**P + C.** The content-law inequality holds with \(\theta=5/3\) for cubics
\[
q=\sum_{j=1}^r X_j\bigl(Y^*A_jY-\operatorname{tr}A_j\bigr)+W,
\]
where the \(A_j\) may be arbitrary complex matrices on a **shared** Gaussian block \(Y\).
The independent bulk \(W=\sum_j\bar Z_j F_j(U)\) can have any finite dimension, with holomorphic quadratic \(F_j\). The written theorem is **P**. The algebra and example comparisons have an exact replay (**C**).

The coefficient \(\theta\) can be considerably smaller than \(5/3\).

| Family | Certified constant | Coverage |
|---|---:|---|
| Shared \(d\)-dimensional block with all matrices from an orthonormal Hermitian basis, \(d\ge8\) | \(37/100\) | Six rows at every energy. At \(d=8\) the explicit coefficient is \(605/1644<37/100\). |
| Seven or more independent equal-energy rank-one factors \(X_j(|Y_j|^2-1)\) | \(194/525<37/100\) | Six rows at every energy. |
| Eight or more of the same rank-one factors | \(137/400<7/20\) | Six rows at every energy, using the tighter \(7/20\) comparison for \(t=0.80\). |

These families allow independent finite bulk as above. The basis family has noncommuting matrices sharing every \(Y\) coordinate. Its content is nonzero for \(h(v)=v\). The first row's \(37/100\) comparison is to the numerical room target in the original question.

**P, every cubic in every dimension.** For a smooth radial profile define
\[
D_h^2(v)=3(2h'+4vh'')^2+
 \max\{(6h'+24vh''+8v^2h''')^2,\,(6h')^2\}.
\]
Then
\[
\|c[h]\|^2\le\tfrac{13}2\,\delta^{3/2}\,\mathbb E D_h^2(V).
\]
The proof integrates the mixed derivative in the first-chaos direction twice. It gives an explicit scalar test for a \(\chi\)-dependent coefficient using exactly the original \(\widehat\Omega\). The six phase profiles have the required smoothness and finite scalar norms. Their numerical scalar bounds remain **open**.

The same identity supplies a direct written proof of the previously recorded coefficient \(3\sqrt6/4\) for \(h(v)=v\) in ledger 6.3.12.

**P + C, radius transfer.** Using the earlier \(0.9359\) radius theorem, the \(t=0\) radius constraint in higher-degree ledger 4.12 allows cubic penalty \(81/100\) with exact room \(26502185939/7010000000000\) against \(500/701\). This is a calculation for the \(t=0\) radius constraint.

**Open.** General tensors at moderate and large \(\chi\), numerical scalar checks for the six profiles in the all-dimensional theorem, a revised degree-5 envelope with the new radius cap, and the full degree-5 certificate.

## Replay

Run from the extracted directory.

    node scripts/verify.mjs

The verifier uses Node 20-compatible built-ins, exact Gaussian-integer arithmetic for the matrix moment instances, and exact integer comparisons for all rational constants. The written proofs establish the quantified identities. See PROOFS.md and LEDGER.md. The replay log is in results/.

## Inputs

I read and replayed the exact Node verifiers in **Prove Improved Bound** (cubic_l1_rho_0_9359.zip) and **Partial Theorem Progress** (conjecture_k_content_law_codex_a786.zip). The first supplies the \(0.9359\) radius estimate via six exact radial dual certificates and Conjecture-K ledger 3.4. The second establishes sign conditioning for one Hermitian factor with decoupled finite bulk and provides the reflected-Gamma estimate. I also used the existing ledger 6.3.21 and 6.3.24 in the final scalar comparison. Repository reference b008629992e5dc6ff5672eb16c3ea72d59dcbccb.

The related arXiv reading is listed in SOURCES.md. No external asymptotic theorem is a premise of the new estimates.
