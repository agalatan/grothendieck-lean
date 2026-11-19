<!-- Verbatim from the delivery conjecture_k_malliavin_book_addendum.zip (malliavin_addendum/BOOK_NOTES.md), 16 November 2026; codex-a786, relayed by the user. Only this line was added. -->
# Reading the supplied book against the actual gap

Source: Ivan Nourdin and Giovanni Peccati, *Normal Approximations with
Malliavin Calculus: From Stein's Method to Universality*, Cambridge, 2012.
The supplied PDF has 256 pages. Printed page numbers below are 16 less
than the PDF page numbers in the relevant chapters.

I read the relevant sections and proof passages, not every page.
The mathematical page images for printed pp. 53, 96 and 151 were also
inspected to check the factors and symbols in the extracted text.

| Passage | Relevance and limitation |
|---|---|
| Proposition 1.5.1, pp. 15--16 | Orthogonal and alternating variance expansions explain what is lost when a projection is replaced by a whole \(L^2\) norm. The infinite alternating expansion has additional hypotheses; it was not applied to nonsmooth absolute values. |
| Theorem 2.9.1 and Proposition 2.9.3, pp. 53--54 | Integration by parts with \(-D\mathscr L^{-1}\) and the shifted derivative resolvent. They give the finite-amplitude mixed identity (21), and clarify why the degree of the variable being integrated matters. These ideas already underlie 11.29--11.30. |
| Lemma 5.2.4, pp. 95--98, especially equations (5.2.3)--(5.2.6) on p. 96 | The exact contraction formulas, before the upper bound, are the most useful passage here. They reveal the nonnegative fourth-chaos correction in (1). The subsequent generic fourth-moment normal-approximation bound is too coarse for the phase-sensitive content target. |
| Chapter 6, especially the mixed derivative/covariance estimates in §6.2 | Useful for joint vectors. Applying them only to \((\Re q,\Im q)\) still loses the correlation with a candidate linear driver. No general moderate-kurtosis content theorem follows from a multivariate CLT. |
| Definition 8.2.1 and Theorem 8.2.5, pp. 149--153 | Recursive mixed \(\Gamma\)-operators and joint cumulants. The relevant vector is \((\Re q,\Im q,\Re r,\Im r)\), not \(q\) alone. This supplies a language for phase-sensitive constraints. Keeping only the leading mixed cumulant repeats the documented failure of ledger §14, item 22. |
| Theorem 10.1.1, pp. 170--173 | The conditional scalar Stein factor determines the one-dimensional density. It does not recover how \(q\) is coupled to Gaussian coordinates. Replacing a radial relaxation by this law-only representation does not restore phase information. |
| Definition 11.2.6 and Theorem 11.3.1, pp. 184--186 | Influence and universality for homogeneous sums. They do not show that every moderate-kurtosis cubic has small influence, and their diagonal-free hypotheses cannot be silently imposed on a general Wick cubic. No such reduction is claimed. |

The new construction in this addendum is not stated in the book.
It was built after retaining the exact contraction information instead of
immediately applying its scalar normal-approximation bound.

The main practical conclusion is specific: a universal improvement of the
single Stein-budget coefficient cannot yield the needed factor 1.5--3,
because the explicit genuine complex cubic has ratio \(109/19\).
The same example has zero content. An effective proof must therefore retain
more of the joint phase information, for example in (21), or use a different
argument.
