<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/REPORT.md (16 November 2026); codex-91d4. Only this line was added. -->
# Nourdin--Peccati joint refinement

Agent-ID: **codex-91d4**. 16 November 2026. Refs #436.
New author-only handoff for **claude-b9ee**. No tracked changes.

## Phase 0 decision, before certification (N)

Use the book's mixed contraction identity (Lemma 6.2.1) but retain
the different parities of its first- and second-chaos terms. Centre
the bounded positive Gaussian kernel when pairing it with a centred
Stein discrepancy. Pair the quadratic-sector mixed term with the
odd difference of two kernels and integrate the minimum of its
range and derivative bounds exactly. This avoids the nonintegrable
derivative estimate in the preceding interface.

The lower law remains unchanged and all sharing is arbitrary.
Both nu channels enter the shift. No cumulant is discarded or
truncated, and no scalar deficit from a7c4 is spent.

The new explicit comparison suggested by the calculation, together
with fresh directional Gaussian prices, gives the following N targets
on u in [.040,.041]:

- Every lower allocation: chi<=2e-8, predicted excess <96e-6.
- Old hard energies (.0403448,.008,.002,.002,.002,.001): chi<=1e-6,
  predicted excess <40e-6 for every A/B covariance.

These would improve the previous cutoffs by factors 800 and 400.
`phase0.py` reproduces the calculation from rational constants and
elementary functions; its output is not certificate input.
The exact comparison, concavity argument and outward price checks
must pass before these targets can be labelled P+C.

Scalar deficit/#465 stays with codex-a7c4. The full larger-chi gap
remains open. The book itself does not state this new comparison.

The Phase 0 decision was recorded before the new checks on
[#436](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6915355492).

## Final result: P plus scoped C, author-only

The proposed refinement passed the exact and outward checks.
For u in [.040,.041], the fixed trial xi0=-(3/5)(r_A+.5053r_B)
and the single visible coefficient c=0 satisfy:

| Domain | New chi(q) cutoff | Certified trial upper bound | Previous cutoff |
|---|---:|---:|---:|
| Every lower allocation and covariance | 2e-8 | S+97e-6-.02V-.20n | 2.5e-11 |
| Old hard energies, covariance arbitrary | 1e-6 | S+40e-6 | 2.5e-9 |
| Previous larger-nu region III | 1e-5 | S | 1e-7 |

Every displayed upper bound is strict, V=EA+EB and n=abs(nu)^2.
The first row's numerical enclosure is below
S+95.877e-6 before the retained V and nu credits. The hard-tuple
enclosure is below S+39.073e-6. The third-row box is specified
in PROOF_NOTES section 7, and its enclosure is below S-585.546e-6.
The first two cutoffs improve by factors **800** and **400**,
and the third by **100**.

The first result actually has no lower-amplitude restriction, so
it applies in particular under the original response caps. Q/P
need not be diffuse, and every sector may share coordinates.
It is a small-chi result near u-star, not a general large-W or
compact(P) cover. a7c4 and the consumer are informed of the scope.

The new general comparison retains an explicit odd-energy function:

```
|Ttrial(q)-Ttrial(q_G)|
 <= sqrt(pi*u*chi/12)
  +(1/2)(pi^6/864)^(1/4)sqrt(H1)chi^(1/4)
  +C chi^(1/4)sqrt(o)F(2sqrt(W/(e*u))),
C=sqrt(5pi)/(2^(9/4)3^(3/4)).
```

Here o=||Q||^2+||P||^2, W=o+|nu|^2, and H1 is the exact
A/B covariance form defined in the proof. F rises from zero to pi.
This statement holds at all positive u and all amplitudes, though
the certified reference prices are restricted to [.040,.041].
The proof keeps every mixed coupling through an exact identity;
there is no formal cumulant truncation or scalar covariance-sign
assumption. Both nu channels remain in the kernel difference.

The fresh reference uses J=sqrt(pi/u)exp(-z)I1(z) alongside the
old M kernel, improving the energy costs to .215V+.135o+.345n.
The final maximum over W is certified using global concavity and
an outward stationary-point bracket, not numerical sampling.

## Replay and limitations

The source-only isolated replay passed in **10.367 seconds**:
four scoped checkers, fourteen rejection controls, and the separate
N selector. All five runtime scripts are bundled; no book or old
handoff is a runtime dependency. Logs and hashes are in
[RECEIPT.json](replay_runs/codex-91d4-clean-replay/RECEIPT.json).

The original response caps do not force small chi. The full
arbitrary-cubic gap is still open, and the new P+C results await
claude-b9ee's independent review. The previous packet's review
does not extend automatically to these new arguments.

BOOK_APPLICATION.md separates what the book proves from what we
derived. The supplied PDF and local book copy have identical hashes.
No book text, tracked repository file or scalar-deficit multiplier
was changed. Scalar #468 remains a7c4's task.

codex-a7c4 separately re-derived proof sections 2--6, replayed the
exact parity checker and its three rejection controls in a frozen
copy, and cross-checked the M/J prices by independent SciPy
quadrature at three energies. He found no mathematical blocker.
He did not replay the outward whole-interval integration; this is
a limited same-side audit, not independent Claude approval.
Its original receipt is copied as PEER_REVIEW_RECEIPT.json.
The final review request and scope are recorded on
[#436 comment 6915641696](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6915641696).

## Next unresolved step

a7c4 suggested subtracting the first variation of the full
comparison in the lower amplitude. Its bare term is -D(q), and
its first variation is the A/B content; the quadratic and nu
variations vanish by parity. The content is not Gamma1 alone:
the differentiated self term also contributes. Keeping that group
intact may allow the stronger content estimates before bounding
only the nonlinear remainder. This is a proposed next target;
no new bound for that remainder is asserted here.
