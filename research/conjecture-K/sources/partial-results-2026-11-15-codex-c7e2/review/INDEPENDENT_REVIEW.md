<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/review/INDEPENDENT_REVIEW.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-research/review/INDEPENDENT_REVIEW.md; Agent-ID: codex-c7e2. -->
# Independent in-session mathematical review

Reviewer: the proof-review worker, independently re-deriving the arguments of the remote, all-sector, and boundary workers in the same codex-c7e2 session. Baseline repository commit: `6bb44599190397f806d2db89b25df4e6785b758e`. This is not an external review or Lean verification.

The three partial results reviewed below are mathematically supported at their stated scopes. None establishes full Conjecture K, a dimension-uniform all-sector nonlinear neighbourhood, or a new Grothendieck endpoint.

## 1. Gaussian-core Hessian and fixed-block local theorem

Reviewed `all-sector/GAUSSIAN_LOCAL_STABILITY.md`, including its Section 7 corollary.

I independently derived the following.

* Integrating out the independent Gaussian bath makes the paired norm exactly `E m_v(L+tH)+E m_v(L-tH)`. Its quadratic coefficient is `E Hess m_v(L)[H,H]`; the energy penalty contributes `-p||H||²` with no bath cross term.
* Visible angular frequencies and remote Hermite orthogonality remove all cross blocks except A/B. The A/B off-diagonal cost is `E[(R_v-D_v)T(T-1)]/(2sqrt(2))`. The Q, P, and normalized visible-cubic coefficients in the note have the correct factors.
* The Laplace representation of `R_v` follows from Gaussian convolution of the norm's Laplace integral. Differentiating with respect to `T` gives exactly the displayed Gamma(3/2) ratio. It is positive and increasing in `T`.
* Exponential integration by parts yields the A/B polynomial `H`, whose quadratic coefficient is `b|alpha+beta/sqrt(2)|²`; the linear matrix has determinant `3ab+b²>0`.
* The zero-buffer matrix is a positive Laplace integral. Its displayed inner determinant reduces to `x(4-7x/2)>0` on `0<x<=1`.
* The visible-cubic polynomial `P` has the asserted one-crossing property. The zero-buffer polynomial `1-2x+3x²-15x³/8` is strictly decreasing on `[0,1]` and remains at least `1/8`.
* The single-crossing transfer is valid with the exponential measure: multiplying an integrand which crosses from negative to positive once by an increasing nonnegative function preserves a strictly positive integral. Its application is direction by direction, which proves positive definiteness without choosing a common crossing point.

The zero-buffer second derivative is justified by the paired quadratic norm majorant and integrability of `|H|²/|L|`; the visible singularity is only `T^(-1/2)`. For positive buffer, bounded norm-convolution derivatives justify differentiation directly.

For Section 7, I re-derived the remote fourth coefficient `B''(v)E|q|⁴/4`, the matched-variance expression `f(v+u)+B''(v)kappa_4(q)/4+O(u³)`, and the real third-chaos contraction formula. In a fixed finite coordinate block, strict positivity of the fourth cumulant plus compactness gives `kappa_4(q)>=c_n||q||⁴`. The quartic mixed terms are absorbed into the positive visible quadratic cost and an `O(||q||⁶)` remainder by Young's inequality. This proves the stated fixed-block local maximum.

**Scope that must remain explicit:** the perturbation uses no coordinate from the auxiliary bath W. The Hessian result is global in positive profile parameters, but only infinitesimal in perturbation size. The strict nonlinear neighbourhood is allowed to depend on the finite coordinate block. Remote directions are neutral to second order. The theorem does not license replacing an already coupled Gaussian marginal by an independent bath.

## 2. Uniform near-Gaussian remote cone

Reviewed `remote/NEAR_GAUSSIAN_REMOTE.md`. I also inspected Theorem 1.2 of Mansanarez--Poly--Swan, *Edgeworth expansion on Wiener chaos*, arXiv:2510.14002v2, in the primary HTML source. The external theorem is used as an input; its proof was not re-proved in this review.

The application at chaos order 3 and expansion order 2 is valid: symmetry removes odd Hermite terms, leaving H4 and H6. The spectral variance estimate can be absorbed into one unspecified dimension-independent constant A, avoiding any normalization issue in the external carré-du-champ convention.

The important constants independently checked are:

* For `F=sqrt(2/u) Re q`, `kappa_4(F)=3chi/2` and `kappa_6(F)=(5/2)[E|q|⁶/u³-6-9chi]`. The inherited complex sixth-cumulant upper bound therefore gives `kappa_6(F)<56 kappa_4(F)^(3/2)`.
* Distributional integration by parts for `h_R=min(|x|,R)` gives precisely the two Hermite pairings in the note. For `R>=3`, the fourth pairing is at most `-sqrt(2/pi)` and the sixth lies between zero and `3sqrt(2/pi)`. The sign of the sixth pairing is essential: a one-sided sixth-cumulant bound suffices.
* At `R=kappa^(-1/4)` and `kappa<=1/81`, the sixth moment is below 16, so the unbounded tail is at most `16 kappa^(5/4)`. The TV error is also of order `kappa^(5/4)` after multiplying by `||h_R||_infinity`.
* The stated threshold implies `E|F|<=sqrt(2/pi)(1-kappa/48)`, hence the complex deficit coefficient is `chi/32`.
* Adding an independent diffuse cubic buffer changes the unnormalized fourth excess to `delta+42v²/N`. For every fixed positive buffer variance the limiting normalized excess lies strictly inside the same threshold, even if the original cubic lies on its boundary. The CLT passage is justified by uniform L2 bounds.
* Conditioning over the independent visible Gaussian mixture gives `D(q)>=sqrt(pi)delta E(V+u)^(-3/2)/32=(-B''(u))delta/8`.

**Scope that must remain explicit:** this is a genuine dimension-independent positive cone, but its threshold is not numerically evaluated because the external TV constant has not been evaluated. It controls remote cubics only. The Gaussian-mixture representation and the complex sixth-cumulant estimate are inherited mathematical inputs. There is no global content bound or arbitrary visible-sector assembly here.

## 3. Retained anisotropic regional estimate

Reviewed `boundary/ANISOTROPIC_REGION.md` and read all of `boundary/verify_anisotropic.py`. I independently replayed the exact script successfully; the replay output is `boundary/review_anisotropic_result.json`.

I independently checked the scalar support-function proof of

`|1+z|+|1-z|<=2+(Re z)²/2+(Im z)²`,

including the identity `(t-c)²+t²(1-c²)` for the dual deficit. I then re-expanded the visible harmonics for the retained trial `xi=-(2/5)r_A-(7/100)r_B`. The formulas for all three A/B matrix entries, the remote coefficient, and the Q/P/normalized-visible-cubic coefficients agree with the note. The only surviving squared-harmonic cross term involves the A/B covariance; remote cubic/linear orthogonality and `EQ=0` remove the others. Arbitrary remote sharing is therefore allowed.

The verifier's integral bounds are valid because its polynomial minorants and majorants differ from `1/(x+c)` by explicit squares of the required signs. No unverified assertion about Laguerre roots is needed. Rational Gamma moments, alternating arctangent remainders, integer square-root enclosures, and the 2x2 determinant tests give the stated outward constants. The benchmark lower enclosure remains an explicit inherited input.

I also reviewed and replayed the final extension adding the visible trial `-(2/7)nu Z` to xi. The trial uses the full first chaos allowed in the retained functional. It is orthogonal to the remote trial; `EQ=0` eliminates its Q cross term, and visible angular frequencies eliminate its other cross terms. With `lambda=-2/7`, the normalized visible-cubic coefficient is bounded by `(1+I1)lambda²-sqrt(2)(I2-2I1)lambda+(I3-4I2+4I1)/2-p`. The exact verifier certifies it below `-249/500`; the raw coefficient remains `-33/100`. Thus the final retained theorem, including its arbitrary-amplitude q=0 corollary, is covered by this review.

**Provenance correction:** the scalar inequality and the raw anisotropic full-sector expansion already occur in `sources/manuscript/legacy/ch40-gpt-global-local-K.tex`, lines 290 onward. They must not be presented as newly discovered. The new retained-trial application does improve the currently indexed isotropic retained regional bound: its A/B coefficient is negative, `-11/40`, rather than `43/250`, and its remote/P coefficients are smaller. No global novelty claim about the scalar inequality is justified.

This bound remains too weak near the pure remote optimum. The numerical searches were not used in any accepted proof and were not independently rerun in this review.

## 4. Supplementary origin strip for (P)

In a subsequent independent pass, I rederived the sharp one-sided constant 16/27 and checked its use in `joint/origin-strip/radial_new.cpp`. On cells with `eta.h<1`, the enclosure bounds the true `s M(T)/r`, so `H+(16/27)eta.h P` is a valid Loewner majorant for every `s<=1/256`. The cell fixes one coefficient pair before integrating. Its trace heuristic affects efficiency only.

Under angular reflection, T, eta, and the chosen coefficients are even, while the omitted real/imaginary mixed entries are odd. The two retained 2x2 blocks therefore cover every complex A,B direction. The original potential separately bounds the omitted tail; the cubic majorant is not extrapolated there. Shift interpolation concerns the true remainder, so changing majorants between cells causes no differentiability issue.

The supplied 17 endpoint certificates, their exact matrix/coverage audit, and the inherited curvature and tail bounds support `|w|<=1/8`, `sqrt(|A|²+|B|²)<=1/256`. The all-shift extension additionally uses the inherited larger-shift certificates. I did not independently rerun the heavy integrations. The root agent separately replayed the exact endpoint audit and source-hash checks. No blocking gap was found in this supplementary argument.

## Verdict

No blocking mathematical flaw was found in the three stated partial results. Their limitations are substantive and must appear in any summary. The Gaussian-core theorem and the near-Gaussian remote cone are complementary local results, not an assembly into global K. The retained regional inequality is an improvement of an explicit region, not a proof beyond it.
