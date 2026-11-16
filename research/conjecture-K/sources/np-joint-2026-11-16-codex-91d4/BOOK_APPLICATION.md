<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/BOOK_APPLICATION.md (16 November 2026); codex-91d4. Only this line was added. -->
# What the book changed in this argument

Agent-ID: **codex-91d4**. 16 November 2026. All book files remain
in the existing git-ignored resources folder. These are our notes
and derivations; no book text is reproduced.

The local digest was used as an index, then the relevant formulae
were checked against the full text and PDF. The detailed primary
locations are Lemma 5.2.4 (pp. 94--96), Lemma 6.2.1 and its proof
(pp. 120--121), Theorem 8.2.5 (pp. 151--152), and Theorems
8.4.3--8.4.4 (pp. 157--158). PDF page numbers are sixteen higher.
The digest's chapter 9 scope warning and chapter 10 limitations
were also read.

**Used successfully.** Lemma 6.2.1 supplies the exact chaos grades
of the two mixed derivative terms. Keeping those grades exposes
their different parities. The odd quadratic-sector term must pair
with a difference of kernels. This gives the explicit F function
in PROOF_NOTES.md, and improves its dependence on the odd energy.
The centering already present in the Stein identity also halves
the range bound for the self and linear-sector terms.

This route keeps all mixed cumulants and the lower non-Gaussian law;
it does not use a formal Edgeworth truncation. The book's joint
cumulant recursion confirms that zero covariance does not remove
the third/fourth mixed terms. Our bundled rational controls include
nonzero examples and reject omission of the mixed term or either
nu channel. a7c4 separately owns the more extensive ordered-Gamma
recursion and scalar remainder work (#468, following #465).

**Useful, but not an improvement by itself.** The cubic refinement
(7/45)kappa4<=Var(tau)<(2/9)kappa4 sharpens the lower end of the
comparison. Our previous upper estimate already used 2/9, so the
new lower constant does not reduce that error bound. The exact
variance and mixed contractions are retained instead of invoking
a generic vector-distance bound. The latter has the same fourth-
root dependence as the old argument for different chaos orders.

**Still open.** The |x| Stein identity expresses the scalar norm
gap as a covariance with a positive decreasing weight. It does
not prove the required covariance sign. Positivity of the usual
Stein kernel, or positivity of Cov(F^2,tau), supplies no such
implication. Nor do higher iterated Gamma operators have a sign
from the cited results. We did not assume any of these signs.
The scalar deficit remains a7c4's independent contribution and
is not spent in the new joint theorem.

**Endpoint issue resolved for this estimate.** Directly bounding
one more derivative by its supremum gives (1-t)^(-1), which is
not integrable. The range/derivative minimum is integrated exactly
instead. It is not a proof of a uniform conditional Hessian bound
at quadratic zeros and does not require such a bound.

The book therefore leads here to a stronger, explicit finite-error
comparison and larger certified small-chi regions. It does not
close the arbitrary-cubic, general-chi part of Conjecture K.
