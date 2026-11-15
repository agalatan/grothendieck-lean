<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/search/REPORT.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Agent-ID: codex-c7e2. 2026-11-15. -->
# Shared quadratic baths: a finite reduction and counterexample searches

Repository source: `6bb44599190397f806d2db89b25df4e6785b758e`.

No verified violation of Conjecture K was found. This report contains an exact reduction for one important weighted-Gaussian limit class, followed by numerical searches. The reduction is a theorem about the stated class, not a reduction of all cubic chaos to that class. None of the numerical optimizations supplies an upper bound.

## 1. An exact 27-parameter limit family

Let Z,X,W be independent proper standard complex Gaussians. Let (A,C) be a centered jointly complex Gaussian pair with an arbitrary real 4×4 covariance matrix. Let (B,D) be a centered jointly proper complex Gaussian pair with an arbitrary Hermitian 2×2 covariance matrix. Assume these two pairs and (Z,X,W) are mutually independent. Let G₀ be any element of H₂,₁(C²) in coordinates (Z,X). Consider

\[
 G=G_0(Z,X)+XA+ZC+\bar X B+\bar ZD+\sigma W.\tag{1}
\]

The Gaussian pairs have *assigned chaos weights*: A,C represent limits of charge-zero quadratic chaos; B,D represent limits of holomorphic quadratic chaos; W represents a diffuse charge-one cubic. They are not being asserted to be literal quadratic or cubic polynomials of the displayed finite Gaussian variables.

The parameter description is finite: six complex coefficients of G₀ (12 real parameters), a real symmetric PSD covariance of size four (10), a complex Hermitian PSD covariance of size two (4), and σ² (1), totaling 27 real parameters before symmetries and energy constraints.

**Finite cubic realizability.** Every random variable (1), jointly with Z and L=Z(a+b|Z|²), is the weak limit of genuine finite-dimensional H₂,₁ cubics with exactly the same L² energy.

To prove this, factor the real covariance of (A,C) into at most four real Gaussian directions. Realize each direction by

\[
 U_{j,N}=N^{-1/2}\sum_{k=1}^N(|Y_{jk}|^2-1),
\]

using disjoint proper Gaussian coordinates. The classical multivariate CLT gives independent real standard Gaussians in the limit. Factor the proper covariance of (B,D) into at most two proper Gaussian directions and realize these by

\[
 V_{j,N}=(2N)^{-1/2}\sum_{k=1}^N Y_{jk}^2,
\]

again on disjoint blocks. These converge to independent proper standard Gaussians. Finally realize W by a disjoint normalized sum of H(Y)=Y(|Y|²−2)/√2. The CLT applies jointly to the independent blocks. Products XA_N,ZC_N have bidegree (2,1), as do \bar X B_N,\bar ZD_N. Orthogonality gives exactly

\[
 \|G_N\|_2^2=\|G_0\|_2^2+E|A|^2+E|C|^2+E|B|^2+E|D|^2+\sigma^2.
\]

The same identity holds for the limit. Continuous mapping gives joint convergence; the uniform second-moment bound gives uniform integrability of |L±G_N|. Hence Λ(G_N)→Λ(G). In particular, **a strict violation in (1) would be a genuine counterexample to K in some finite dimension**.

**Rank compression.** Any number of independent real Gaussian quadratic baths interacting linearly with Z and X reduces to four real baths, by the real covariance of the pair (A,C). Any number of proper holomorphic Gaussian baths reduces to two proper baths, by the complex covariance of (B,D). Two real baths do not parameterize an arbitrary pair covariance; the final search therefore includes four.

## 2. Exact conditional reduction to one real integral

Conditional on Z,X, the non-finite part of (1) is a centered complex Gaussian η. Set

\[
 v=E(|XA+ZC+\bar X B+\bar ZD+\sigma W|^2\mid Z,X),
\]
\[
 \rho=E((XA+ZC+\bar X B+\bar ZD+\sigma W)^2\mid Z,X)
      =X^2EA^2+2XZ E(AC)+Z^2EC^2.
\]

Then v≥|ρ|, and η has exactly the law

\[
 \eta=\sqrt\rho\,N+\sqrt{v-|\rho|}\,W',\tag{2}
\]

where N is real standard Gaussian and W′ is proper standard complex Gaussian, independent. Any square-root branch works because N is symmetric. Equality of the covariance and pseudocovariance proves (2).

Write m_w(y)=E|y+√w W′|. Rotational invariance allows Z=√T real, X=r exp(iθ). Formula (2) gives

\[
 F(G)=E_{T,r,\theta,N}\bigl[
 m_{v-|\rho|}(L+G_0+\sqrt\rho N)
 +m_{v-|\rho|}(L-G_0+\sqrt\rho N)\bigr].\tag{3}
\]

Thus arbitrarily many Gaussian quadratic baths require only four scalar integration variables. The proper Gaussian part is integrated analytically using the Rice mean

\[
 m_w(y)=\frac{\sqrt{\pi w}}2\bigl[(1+2x)I_{0e}(x)+2xI_{1e}(x)\bigr],
 \qquad x=|y|^2/(2w).
\]

The implementation differentiates the finite quadrature analytically, including covariance/pseudocovariance changes. One generic centered finite-difference test gave maximum gradient error 1.81×10⁻¹⁰. This is a check of the implementation, not an interval certificate.

One must not Jensen-average v at fixed L: the Rice mean at a fixed nonzero center is convex in small variance. Its expansion contains +w²/(32|L|³). Concavity of the remote potential after averaging L does not justify conditional variance replacement when v depends on Z.

## 3. Numerical results and observed structure

The searches fix a positive structured remote variance e, and use a diffuse independent Gaussian buffer of variance u−e. This prevents the optimizer from terminating immediately at the pure Gaussian benchmark. Fractions e/u=.1,.5,1 are tested near the Gaussian-optimal u, with a minimum test u=.025 at corners where the Gaussian maximizer vanishes.

### Gaussian quadratic baths

The initial model uses two real quadratic baths and two proper holomorphic baths, shared between q and the odd sectors, together with every finite coefficient of G₀. Five rows (peak and four box corners), three energy fractions and seven starts give 105 deterministic optimizations. The best candidates in every cell reduce in law to a circular Gaussian-product remote q, with vanishing visible-sector coefficients. Re-evaluation at a finer 48×48×32 polar grid gives these peak deficits:

| structured fraction | Λ−S at the selected candidate |
|---|---:|
| .1 | −0.00001807745314 |
| .5 | −0.00042545344851 |
| 1 | −0.00161665967626 |

Visible-sector Hessians at those Gaussian-product candidates were negative in all 15 tested row/fraction cells. The largest eigenvalues ranged approximately from −.293 to −.597. This is numerical local stability in the tested class, not a theorem for all parameters.

`full_bath.py` additionally uses four real baths, the complete real covariance rank of (A,C), and two proper baths. Sixty random-start optimizations over the same 15 cells completed successfully; every value was negative. The selected visible coefficients had total norm below 1.5×10⁻⁶ and the remote pseudovariance approached zero, reproducing the circular Gaussian-product structure. Its records are `full_bath_results.jsonl`. This confirms the observed structure under complete pair covariance, without proving global optimality.

### Full finite H₂,₁(C³)

`finite3.py` optimizes all 18 complex Wick coefficients at fixed remote energy, plus an independent Gaussian buffer. It includes the shared skewed finite quadratic directions X(|Y|²−1), \bar X Y²/√2, Z(|Y|²−1), and \bar ZY²/√2 simultaneously. Three rows, three fractions and eight starts gave 72 optimizations. All selected candidates stayed below S after a finer polar evaluation; the smallest refined deficit was about 8×10⁻⁵. These quadratures are not interval-enclosed, and the recorded refinements show non-negligible grid error at zero buffer.

### Finite high-dimensional Gamma baths

`gamma_bath.py` uses two independent genuine quadratic baths

\[
 U_N=N^{-1/2}\sum_{j=1}^N(|Y_j|^2-1),\qquad
 U'_N=N^{-1/2}\sum_{j=1}^N(|Y'_j|^2-1),
\]

and optimizes q=cH(X)+X(c_1U_N+c_2U'_N), all finite visible sectors on (Z,X), and Z(d_1U_N+d_2U'_N). Every coefficient is complex. At N=64 this is a genuine cubic in 130 complex coordinates, apart from the explicitly declared diffuse buffer, which can itself be approximated by finite cubics as above.

N=1,2,4,16,64, two profiles, three energy fractions and five starts gave 150 optimizations. No positive candidate occurred. Unlike Gaussian baths, the finite baths have skewness 2/√N and produce a nonzero optimized A-sector; amplitudes reached approximately .07 in a high-energy corner. The odd coefficients generally decayed toward zero. Thus this search did exercise shared-driver gains, rather than relying entirely on phase symmetries forcing zero content. Selected candidates for N=1,4,64 were re-evaluated on finer grids; the output is `gamma_refinement.json`.

At the peak and structured fraction .1, an additional smooth-buffer replay with 64 visible radial nodes, 40 remote radial nodes and 40 phase nodes gives:

| bath size N | Λ−S for the selected finite-bath candidate |
|---|---:|
| 1 | −0.000054506700203 |
| 4 | −0.000028326718561 |
| 64 | −0.000018744119393 |
| Gaussian-bath limit candidate | −0.000018077453140 |

Increasing each Gamma quadrature from 12 to 20 nodes changed the first three values by at most 1.34×10⁻¹³, 8.44×10⁻¹⁵ and 2.23×10⁻¹⁶ respectively. This is convergence evidence for these candidates only, not an error enclosure or proof of their optimality. The finite-N deficit relative to the limit is consistent with a positive constant divided by N; this asymptotic sign has not been proved.

### A rejected numerical shortcut

An initial low-resolution Sobol search with a quadratic control variate produced apparent positive excesses as large as .01. Independent larger Sobol samples reversed their signs, with deficits around .02. The optimization was fitting poorly resolved high-moment tails. Those records are retained as `collective_results.jsonl`, but they supply **no evidence against K** and are superseded by the exact conditional-law integration. This failure motivates keeping integration error and optimization error separate.

## 4. Reproduction and limits

Run with `OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1`. Dependencies are NumPy and SciPy.

* `python conditional.py 20 12`: two-real/two-proper bath search.
* `python full_bath.py`: complete four-real/two-proper covariance search.
* `python finite3.py 10 12`: full finite C³ search.
* `python gamma_bath.py`: finite Gamma baths through ambient dimension130.

Each search writes a JSONL record for every completed start, including coefficients, profile, fixed energy, buffer variance and optimizer status. The files `conditional_refinement.json`, `conditional_hessians.json`, `finite3_refinement.json`, and `gamma_refinement.json` contain the selected independent checks. `refine_gamma.py` performs an additional chunked, smooth-buffer replay with 64 visible radial nodes, 40 remote radial nodes, 40 angular nodes, and 12 or 20 nodes for each Gamma bath; its results are `gamma_smooth_refinement.json`. The functions in the scripts permit finer re-evaluation of any stored coefficient vector. Floating output is exploratory throughout.

The significant mathematical output is the exact finite-dimensional covariance reduction and finite-cubic realizability of (1). The optimizer structure suggests separating skewness-driven A-content from Gaussian quadratic-bath fluctuations; it does not prove that every optimizer has this structure. General cubic chaos, multiple distinguished remote coordinates, and global exclusion of all parameters in (1) remain open.
