# Literature reassessment, 23 October 2026

This audit distinguishes external theorems, repository certificates and open research. It found no external theorem that closes the current complex-constant gap. It did find a newer real-constant paper missing from the 15 October literature register. The strongest actionable conclusion remains that better realizability information and better rounding constructions matter more than another marginal moment improvement.

## Verified contemporary references

**Complex constant.** Heilman–Jones–Malavolta, [arXiv:2609.25462v1](https://arxiv.org/abs/2609.25462v1), submitted 21 September 2026, states \(1.4<K_G^{\mathbb C}<1.404898554746\). Theorem 7.1 bounds \(\sup_n\|P_{1,0}-(37/50)P_{2,1}\|_{\infty\to1}<2857/4000\). The construction applies uniformly in complex dimension, not just to scalar profiles. Its upper construction combines six rounding branches before scalar repair. These are the repository's upstream starting points, rather than a superseding result. I inspected the primary theorem, kernel and transfer definitions, lower reduction, moment proof and code references; I did not rerun the paper's full numerical certificate in this literature subtask.

Guo–Fang–Lu, [arXiv:2609.07000v1](https://arxiv.org/abs/2609.07000v1), submitted 7 September 2026, proves the lower bound \(1.35584631827168\). Theorem 5.2 bounds their **restricted weighted criterion** above by \(1.35584697425050\), over arbitrary finite active sets and admissible positive radial weights. This is not an upper bound on \(K_G^{\mathbb C}\), nor a barrier for all Hermite multipliers. Section 5.4 explicitly identifies discarded negative projections and the loss of the joint unimodular-pair relation as sources of slack. Its diagnosis supports retaining the actual response pair, rather than returning to independently optimized profile bounds.

**Real constant: scope must be explicit.** Saha et al., [arXiv:2608.11158v2](https://arxiv.org/abs/2608.11158v2), is a real-matrix/sign theorem, despite sometimes being called simply a result on “the Grothendieck constant.” Its displayed bounds \(6\pi/11\le K_G\le\pi/(2\log(1+\sqrt2))-10^{-4}\) do not apply to \(K_G^{\mathbb C}\). Its limiting schemes are useful construction ideas, but the complex paper itself reports that direct transfer did not give its desired complex improvement.

Heilman–Jones–Malavolta, [arXiv:2610.10477v1](https://arxiv.org/abs/2610.10477v1), submitted 7 October 2026, proves \(1.773\le K_G^{\mathbb R}\le1.7799\). Theorem 2.2 gives the real Hermite-game/rounding minimax identity and attainment of the dual infimum. The corresponding complex programme is well motivated; its use requires stating charge-one functions and the bidegrees \((k+1,k)\), real-coefficient symmetrization if the games are selfadjoint, and the actual Gaussian/finite-matrix transfer. The numerical best-response step is expressly heuristic and does not certify a global oracle. This distinction is already respected by the shared-response-pool handoff and should remain explicit.

**Newer item found in this audit.** Bo Peng, [*Certified Fourier rounding for the real Grothendieck inequality*, arXiv:2610.24417v1](https://arxiv.org/abs/2610.24417v1), submitted **17 October 2026**, gives a computer-assisted real bound \(K_G^{\mathbb R}<1.77987164\). It retains a Fourier coefficient head through degree 403, combines mixed-energy and complex-density bounds on a complete circle cover, and certifies a fourth angular derivative norm for the whole tail. It is relevant as a certification template, not a new complex bound. The older assertion that the only post-1-October constant paper was 2610.10477 is now stale. Primary HTML Sections 1–5 and the reproduction contract were inspected; its interval computation was not rerun here.

Xie–Zhang, [*The König constant is one*, arXiv:2608.14817v1](https://arxiv.org/abs/2608.14817v1), proves a **real** oscillatory-form norm-one result, with strict inequality in each fixed dimension. The repository separately derives its complex charge-one adaptation. One should cite those two statements separately. Neither identifies \(K_G^{\mathbb C}\), and the failure of the alternating multiplier does not disprove Haagerup's proposed value by itself.

Targeted current searches found no later external complex-constant bound improving the HJM-C preprint. This is a search result, not a proof of bibliographic completeness.

## What the supplied older sources do and do not provide

The supplied Haagerup paper is the 26-page 1987 article. Its difficult input is the inverse-phase coefficient theorem: \(b_1=4/\pi\), \(b_5=0\), and all other higher odd inverse coefficients are nonpositive. The sign theorem is established by contour deformation and elliptic-integral estimates; it is not a numerical observation. Its physical phase kernel involves \(z|z|^{2k}\), even though the real-parameter generating series is holomorphic in a separate variable. These two functions should not be confused.

The original page 202 calls \(|\varphi(i)|^{-1}\simeq1.40458\) a more plausible candidate for the constant. The article's proved bound is \(8/(\pi(k_0+1))\), with **\(\varphi(k_0)=\pi(k_0+1)/8\)**. Some search snippets invert that factor, and the supplied Pisier survey has a reciprocal typo in its later display about \(\varphi(i)\). Numerical constants should be recomputed from the stated integral. Haagerup's actual inverse coefficient signs also show why simply repeating the real alternating-series argument cannot establish the proposed complex value.

The supplied Pisier survey is 87 pages. Sections 2–5 give the classical Gaussian, tensor-factorization and optimal-rounding framework. Its tensor statements are particularly useful for checking the repository's explanatory text: \(K_G\) compares the projective norm with the Hilbert factorization norm on \(\ell_\infty\otimes\ell_\infty\), not projective with injective there. A precise correction and an explicit Hadamard counterexample to the latter assertion are in `NORMALIZATION_CORRECTIONS.md`. Its noncommutative constant 2, little constant \(4/\pi\), and finite-dimensional constants must not be substituted for the classical complex constant.

The file named `Absolutely_Summing_Operators.pdf` contains **seven pages: title and detailed contents only**. No theorem from its chapters was available in that attachment. It points to Grothendieck's inequality at page 15, Pietsch domination at page 43, trace duality at page 125, and 2-factorable operators at page 154; it supplies no additional quantitative cubic estimate. This is an attachment limitation, not a failed attempt to read a 474-page book.

The Gaussian Hilbert Spaces ZIP contains 352 page images. All were extracted and OCRed; theorem-level reading was targeted, with key formulas checked against the images. Janson gives the exact second-quantization, conditioning and complex-hypercontractivity infrastructure in `GAUSSIAN_TOOLKIT.md`. It does not supply a sharp cubic absolute-moment upper bound that closes the present gap.

## An explicit structural lemma established in this audit

`UNIVERSAL_PREPROCESSOR_NORM.md` proves

\[
 \sup_n\gamma_2\!\left(\rho(\langle x,y\rangle)\big|_{S(\mathbb C^n)}\right)
 =\sum_k|c_k|,
 \qquad\rho(z)=\sum_kc_kz|z|^{2k},\quad\sum|c_k|<\infty.
\]

The necessity applies to arbitrary feature maps, including noninvariant and nonmeasurable ones. It follows from finite sample nuclear norms, complex spherical harmonic normalization, a finite signed Jacobi change of basis, and an explicit absolutely summable tail argument. This is a known-style harmonic factorization consequence; no novelty claim is made. It supplies a complete proof of an “if and only if” that appears informally in the older literature summaries.

Its consequence is limited but decisive: for a **fixed universal scalar correlation preprocessor**, an \(\ell_1\) budget larger than one cannot be repaired just by choosing more clever Hilbert features. It does not bar changing the rounder, mixing kernels before repair, matrix-aware preprocessing, or the project's weaker dominated-kernel transfer. The finite-dimensional counterexample in the note prevents incorrectly using the universal statement in a fixed dimension.

## Reassessed research priorities

1. **Keep the original-response attack as the principal lower track.** The missing quantity is the dimension-free cost of realizing the first, cubic and fifth moments by the same disk-valued response pair. GFL's explicit loss analysis, the repository's radial counterexamples, and the failure of many restricted families all point in this direction. A new scalar moment lemma is useful only if it separates an identified survivor that the current constraints admit.
2. **Separate proof of a structural alternative from grid certification.** Conditional expectation is a tensor projection, and orthogonality of cubic components does not grant independent Gaussian inputs. A finite-rank core plus a genuinely independent conditional Gaussian factor is a useful family; neither finite-core failure nor low influence proves all remaining tensors enter it. The missing replacement cost must be paid by a deficit of the same response.
3. **On the upper side, retain cancellation before tails and repair.** The already proved signed chirp tails show that unsigned Hermite mass can be grossly pessimistic. The October 17 real paper gives another complete derivative/circle template. But improving a certification allowance cannot bridge a construction gap of order \(10^{-4}\)–\(10^{-3}\) if the entire allowance is only order \(10^{-6}\). Use such machinery on response families whose complete signed coefficient objective first beats the present benchmark.
4. **Do not make the imaginary boundary payoff the screening objective.** Boundary oscillatory norm can be almost one while the useful kernel collapses inside the disk. A useful column must improve the complete primal coefficient score or separate the current game, with its full response definition preserved.
5. **Use the common pool as an exchange heuristic, with two separate certificate obligations.** A chosen rounding mixture needs enclosures of the combined signed head and complete tail. A chosen lower witness needs a uniform norm cap over dimensions and all responses. Finite-pool LP duality supplies neither obligation automatically.

No new numerical endpoint, complete joint-response covering theorem, Gaussian extremality theorem, or unconditional Lean Grothendieck theorem is claimed by this literature audit.
