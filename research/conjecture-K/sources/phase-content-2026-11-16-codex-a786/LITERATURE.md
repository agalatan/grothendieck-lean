<!-- Verbatim from the delivery conjecture_k_phase_content_codex_a786.zip (phase_content/LITERATURE.md), 16 November 2026; codex-a786, relayed by the user. -->
# Literature and reference trail

This investigation used the current public repository and public papers.
No previous conversations or earlier private handoffs were queried.
The entries distinguish full-text sections actually read from abstracts or
HTML retrieval failures. The mathematical results of this delivery are
self-contained except for the explicitly listed repository inputs.

## Papers read in HTML

1. **Huiping Chen, Yong Chen, Yong Liu, Berry–Esséen bound for complex
   Wiener–Itô integral**, arXiv:2407.05353v1.
   [HTML](https://arxiv.org/html/2407.05353v1).
   Read the complex product formula, Theorem 3.1, Corollaries 3.3 and 3.5,
   the contraction comparison in Lemma 3.7, and the ensuing proof machinery.
   The paper retains both ordinary and reversed-conjugate contractions.
   It supports using complex tensor structure rather than a radius law
   alone. Its Gaussian approximation estimates do not give the needed
   signed content/deficit inequality at moderate kurtosis. No constant
   from this paper is imported into the new certificate.

2. **Simon Campese, Fourth Moment Theorems for complex Gaussian
   approximation**, arXiv:1511.00547.
   [HTML rendering](https://ar5iv.labs.arxiv.org/html/1511.00547).
   Followed the reference from the Chen–Chen–Liu paper. Read the complex
   chaos decomposition and §§4.1–4.9, including the spectral carré-du-champ
   inequality and its proof. This clarified the two complex covariance
   channels. Replacing both by a scalar fourth-moment budget still discards
   exactly the projection information exploited here.

3. **Paul Mansanarez, Guillaume Poly, Yvik Swan, Edgeworth expansion on
   Wiener chaos**, arXiv:2510.14002v2.
   [HTML](https://arxiv.org/html/2510.14002v2).
   Read the main theorem, comparison with prior Edgeworth work, the
   Ornstein–Uhlenbeck and resolvent preliminaries, and the remainder strategy.
   This is relevant to the existing small-cumulant ledger results, especially
   3.19. An asymptotic expansion by itself supplies neither a useful
   moderate-kurtosis constant nor control of the joint coordinate/output
   phase. The delivery does not repeat a qualitative near-Gaussian result.

4. **Ronan Herry, Dominique Malicet, Guillaume Poly, Superconvergence
   phenomenon in Wiener chaoses**, arXiv:2303.02628v3.
   [HTML](https://arxiv.org/html/2303.02628v3).
   Followed the density-regularity references from the Gaussian approximation
   literature. Read Theorems 1–4 and 8, the discussion of explicit constants,
   and §6.2's scalar-to-vector discretization argument. The results justify
   strong regularity along Gaussian convergence, but the authors explicitly
   leave useful quantitative thresholds to further work. This cannot be
   substituted for a numerical threshold in the present task.

5. **Guillaume Poly, Regularization along central convergence on second
   and third Wiener chaoses**, arXiv:1905.02784.
   [HTML rendering](https://ar5iv.labs.arxiv.org/html/1905.02784).
   Read the second-chaos Laplace/symmetric-polynomial proof and the
   third-chaos theorem with its sharp-gradient spectral reformulation.
   The third-chaos threshold is expressly nonquantitative. The spectral
   perspective is interesting for a future general decomposition, but it
   does not close the moderate-kurtosis region as stated. No numerical
   constant from this paper is used.

6. **Ehsan Azmoodeh, Giovanni Peccati, Xiaochuan Yang,
   Malliavin–Stein method: a survey of some recent developments**, 2021.
   [Journal HTML](https://www.vmsta.org/journal/VMSTA/article/214/text).
   Read the Gaussian/Markov-chaos overview and the spectral and iterated
   carré-du-champ discussion. Used to follow references and distinguish
   a general normal-approximation estimate from the particular first-chaos
   projection needed here. It is background, not an additional theorem
   input.

7. **Mathematical research with GPT-5: a Malliavin–Stein experiment**,
   arXiv:2509.03065v1.
   [HTML](https://arxiv.org/html/2509.03065v1).
   Read the Gaussian two-chaos theorem and its contraction/parity proof,
   including the fourth-cumulant decomposition. Its opposite-parity
   hypothesis is essential. It cannot be applied to a sum of degrees
   1, 3 and 5 merely because those grades are orthogonal.

8. **Heilman–Jones–Malavolta primal/dual Grothendieck paper**,
   arXiv:2610.10477v1.
   [HTML](https://arxiv.org/html/2610.10477v1).
   Read the introduction, projection-game examples, Example 3.1 and the
   Gaussian polynomial formulation around Theorem 3.2. The sharp real
   Hermite \(L^1/L^2\) assertion in Example 3.1 is not accompanied there by
   the proof needed to settle this repository's radius problem. It was
   not adopted as an established input; this agrees with ledger 3.6.

## References followed but not available as full HTML

The searches also identified Chen–Liu 1408.1817, Chen 1412.1877,
Malicet–Nourdin–Peccati–Poly 1503.02154, Biermé–Bonami–Nourdin–Peccati
1109.1546, and the newer complex Gaussian approximation papers 2304.08088,
2609.07066 and 2610.04532. Several arXiv/ar5iv HTML version URLs failed.
Their accessible abstracts were useful for locating themes and references,
but they are not represented here as papers read in full and supply no
load-bearing claim.

HTML attempts for 2609.07000, 2609.25462 and 2603.30039 also failed.
No PDF fallback was used.

## Repository evidence and decision

Read the requested Conjecture-K README, MONOGRAPH and STATUS, including
the false statements and unsuccessful approaches, higher-degree STATUS §4,
and issue #453 with its latest available comments. Read the source notes
behind 11.29–11.31, 11.39–11.40 and 11.49–11.50, plus the fluctuation
formalization for normalization.

The most relevant issue comments were:

- [Content gap and phase obstruction](https://github.com/agalatan/grothendieck-lean/issues/453#issuecomment-6910626188).
- [Latest small-t update and radius-input correction](https://github.com/agalatan/grothendieck-lean/issues/453#issuecomment-6911118407).

The latter distinguishes the still-open small-t interval from the
moderate-t content band, and notes a floating arcsine assumption in its
own small-t computation. That computation and the slightly underestimated
radius used by an earlier stage are not inputs here.

The resulting decision was to retain discrete coordinate phase information
before applying an \(L^2\) projection bound. This yields new rigorously
covered coefficient classes and explicit neighborhoods. A phase-sensitive
estimate covering all cubics remains open; no literature theorem found in
this reading was treated as supplying it.
