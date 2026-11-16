<!-- Verbatim from the delivery conjecture_k_malliavin_book_addendum.zip (malliavin_addendum/README.md), 16 November 2026; codex-a786, relayed by the user. Only this line was added. -->
# What Nourdin--Peccati contributes to Conjecture K

16 November 2026. A standalone addendum to the phase-content package.
The repository and uploaded book were not modified.

**The useful outcome is a sharper obstruction and an explicit exactly
controlled family, not a proof of \(K_G^{\mathbb C}>1.402\).**

The book's exact chaos identities led to the following results.

| Result | Status |
|---|---|
| The scalar Stein budget satisfies \(\mathcal B=6\delta-\mathcal R_4\), where \(\mathcal R_4=2\Vert J_4\Gamma(q,\bar q)\Vert _2^2+\Vert J_4\Gamma(q,q)\Vert _2^2\). This keeps a nonnegative spectral correction discarded by the usual bound. | P; standard calculus, already implicit in the spectral argument behind 11.30 |
| An explicit cubic in 16 complex variables has \(\mathcal B/\delta=109/19\). Hence the optimal universal coefficient lies in \([109/19,6]\). Improving six alone can gain at most \(114/109<1.046\), replacing the previous package's weaker \(6/5\) obstruction. | P+C |
| The same cubic has \(\Pi_1F(q)=0\) for every square-integrable function of \(q\). Its normalized fourth excess is \(19/18\). | P+C |
| Its law is exactly \(RW\), with independent \(R\sim\operatorname{Gamma}(8,1)\) and standard complex Gaussian \(W\). The underlying quadratic map satisfies an exact norm identity. | P+C |
| Every scalar multiple of this cubic satisfies \(\widehat\Lambda(\lambda q+(T-1)r)\le S-(59009/189100)\Vert r\Vert _2^2\), for all remote linear \(r\), amplitudes and sharing, at the peak. | P, given existing ledger 2.7 and 11.12, 11.39--11.40 |

Here \(\mathcal B=2E(\Gamma(q,\bar q)-3E|q|^2)^2+E|\Gamma(q,q)|^2\)
and \(\delta=E|q|^4-2(E|q|^2)^2\). The full construction, normalizations,
proofs and dependencies are in PROOFS.md. The construction uses explicit
Pauli matrices and exact Clifford anticommutation.

P means a complete written proof by this author, not independent review or
Lean formalization. C is the included integer-arithmetic replay.
No floating-point search is used as a theorem input.

## Replay

With Node.js 20 or later, and no package installation:

    node verify.mjs result.json

The checker verifies the 7 complex \(8\times8\) matrices, their 9 real
\(16\times16\) companions, every symmetry used to prove zero content,
the trace-cumulant fourth moments, and all rational budgets.
The replay takes less than a second in the author's environment.
It does not rebuild the repository or rerun its accepted scalar secant
certificates.

## Files

- PROOFS.md: the complete written arguments and scope.
- BOOK_NOTES.md: precise sections of the supplied book and their relevance.
- LEDGER_PATCH.md: proposed changes, without editing the repository.
- verify.mjs and result.json: exact checker and successful output.
- SOURCES.json and SHA256SUMS: source provenance and package hashes.

No part of the uploaded PDF is redistributed.

The general raw content inequality, the degree-five content band,
joint A/B, and odd-over-A/B remain open. These results give no new global
Grothendieck endpoint.
