<!-- Verbatim from the delivery content_law_finite_reduction_20261116.zip (README.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Content-law inequality: a finite-dimensional reduction

**P.** For every variance-one \(Q\in H_{2,1}(\mathbb C^n)\), every chosen unit linear coordinate \(X\), and \(m\ge1024\), there is a variance-one \(Q_*\in H_{2,1}(\mathbb C^{m+1})\) preserving the relevant marked content and law observables to \(O(m^{-1/2})\). The constants are explicit in REDUCTION.md. In particular the finite-dimensional supremum of the content-law residual differs from the unrestricted supremum by at most \(E/\sqrt m\), with \(E\) specified there.

The construction keeps \(X\), replaces the original complementary coordinates by a random Gaussian image of a complex sphere, and removes the lower spherical harmonics. The last step returns an actual Wick cubic and avoids the trace error of an uncorrected linear substitution. It also works on the example in Partial Theorem Progress where all bounded-coordinate restrictions have vanishing energy.

**P.** The same argument gives a quantitative radius reduction. For the normalized radius suprema \(\rho_d=\sup_{Q\in H_{2,1}(\mathbb C^d),\,\mathbb E|Q|^2=1}\mathbb E|Q|\),
\[
0\le \rho_\infty-\rho_m\le3/\sqrt m\qquad(m\ge2).
\]
The previous exact radius bound \(0.9359\) is used for comparison. This reduction does not improve that number by itself.

**P.** The previous uniform content-law bound \(\theta=5/3\) for block-linear cubics extends to arbitrary holomorphic-quadratic bulk on the **same** Gaussian block. It even allows the holomorphic and antiholomorphic receiver terms to share coordinates if the conditional pseudocovariance vanishes. See SHARED_BULK.md for the exact coefficient-matrix bound.

**C.** The exact replay checks constants, spherical projection factors, matrix identities and a correlated bulk example. The earlier Node verifiers in Prove Improved Bound and Partial Theorem Progress were replayed. Their stated scopes are preserved.

**Open.** No finite coefficient net has been certified for the six profiles. The quantitative reduction is a sufficient finite-dimensional certificate criterion with a margin, with a separate small-\(\chi\) check. The dimension bound is conservative. The unrestricted inequality and the degree-five envelope remain open.

## Replay

    node scripts/verify.mjs

Node 20-compatible built-ins only. See results/replay.json for the exact run. No stochastic experiment is a proof premise.

## Files

- REDUCTION.md contains the proof, the certificate interface, and the radius comparison.
- SHARED_BULK.md treats the correlated conditional-Gaussian class.
- SOURCES.md records the two result packets and the arXiv reading.
- LEDGER.md contains proposed ledger additions.
