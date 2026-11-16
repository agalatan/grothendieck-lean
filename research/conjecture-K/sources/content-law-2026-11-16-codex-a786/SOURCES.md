<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (SOURCES.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# Sources and provenance

codex-a786 · 16 November 2026.

The mathematical result in this package is original work in this conversation,
with the dependencies below. Other chat history was not retrieved.

## Repository inputs

Pinned commit:
https://github.com/agalatan/grothendieck-lean/tree/b008629992e5dc6ff5672eb16c3ea72d59dcbccb

- Conjecture-K ledger, especially 6.3.20–6.3.25, 6.3.2–6.3.4, 11.31a, §§13–15:
  https://github.com/agalatan/grothendieck-lean/blob/b008629992e5dc6ff5672eb16c3ea72d59dcbccb/research/conjecture-K/STATUS.md
- Antiholomorphic Stein note, Theorem 3:
  https://github.com/agalatan/grothendieck-lean/blob/b008629992e5dc6ff5672eb16c3ea72d59dcbccb/research/conjecture-K/sources/antiholomorphic-stein-2026-11-16/NOTE.md
- Its review:
  https://github.com/agalatan/grothendieck-lean/blob/b008629992e5dc6ff5672eb16c3ea72d59dcbccb/research/conjecture-K/sources/antiholomorphic-stein-2026-11-16/REVIEW.md
- Degree-5 content-law specification, especially §§11.4–11.6:
  https://github.com/agalatan/grothendieck-lean/blob/b008629992e5dc6ff5672eb16c3ea72d59dcbccb/research/higher-degree/sources/degree5-capped-2026-11-16/CONTENT_LEMMA_D5.md
- Higher-degree ledger 4.19:
  https://github.com/agalatan/grothendieck-lean/blob/b008629992e5dc6ff5672eb16c3ea72d59dcbccb/research/higher-degree/STATUS.md

The source's row profiles were used as defined in the user's message.
The requested decimal inputs are preserved in rows.json. No unprovided
quadrature table or code is needed by the proof.

## External identities actually used

- NIST Digital Library of Mathematical Functions, Binet's formula 5.9.10:
  https://dlmf.nist.gov/5.9.E10
- DLMF §5.11(ii), positive-real Stirling remainder:
  https://dlmf.nist.gov/5.11.ii
- Gamma duplication:
  https://dlmf.nist.gov/5.5.E5

The proof derives its numerical inequality directly from Binet's integral.
It does not rely on an asymptotic remainder being small without a bound.

## Literature search, not premises

Searches located Max Fathi, “Higher-order Stein kernels for Gaussian
approximation,” arXiv:1812.02703; Chen–Chen–Liu, “An improved complex fourth moment
theorem,” arXiv:2304.08088; and Gaunt, “Stein operators for variables from the
third and fourth Wiener chaoses,” arXiv:1805.08830.

Their available abstracts concern distributional approximation or higher-order
Stein equations. Attempts to retrieve arXiv HTML/TeX and HTML mirrors failed.
I do not claim to have read their full texts or use a theorem from them.
The successful reference path for this proof was the exact Gamma affinity,
Gamma duplication, and the explicit Binet remainder.

## Replay trust

verify.mjs uses only Node's standard library and BigInt rational arithmetic.
There are no floating-point assertions, random seeds, downloaded dependencies,
or external theorem-prover calls. The exact instance tests and arithmetic are
labelled C; the inequalities quantified over all profiles are labelled P.

