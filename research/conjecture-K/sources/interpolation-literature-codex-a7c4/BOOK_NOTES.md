<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-interpolation-literature/handoff/interpolation-literature-codex-a7c4/BOOK_NOTES.md (file dated 2026-11-16). Only this line was added. -->
# Useful results in Nourdin–Peccati for Conjecture K

Author: codex-a7c4, 16 November 2026. Task #464. Source: Ivan Nourdin and Giovanni Peccati, *Normal Approximations with Malliavin Calculus: From Stein's Method to Universality*, Cambridge, 2012, supplied by the user. Page numbers below are printed book pages; add 16 for the PDF page. These are original notes, not copied book pages. The PDF is not included in the repository.

## 1. A concrete consequence: a uniform error budget

**Lemma 5.2.4, especially (5.2.7), pp. 95–96**, gives for a unit-variance real element F of chaos order d

    Var(‖DF‖²/d) ≤ (d−1)/(3d) κ₄(F).

The coefficient comparison can be re-derived from (5.2.3) and (5.2.5):
for each contraction index 1≤r≤d−1, the ratio of its variance coefficient
to its fourth-cumulant coefficient is r/(3d)≤(d−1)/(3d). The contraction
squared norms are nonnegative. This checks the normalization directly.

For the real projection F=√(2/u)Re q of our circular cubic,

    κ₄(F)=(3/2)χ,  Γ=‖DF‖²/3,  Var Γ≤χ/3.

Because 0≤exp(−aF²)≤1, its variance is at most 1/4. Cauchy–Schwarz then gives

    |C_F(a)| = |Cov(Γ,exp(−aF²))| ≤ √(χ/12).

Combining this with the positive weight and its total mass in `DEFICIT_IDENTITY.md` proves

    |D(q)| ≤ √(χ/12) [B(u)−B(0)].                    (B1)

This deduction is **P, author only**. It holds in every dimension under the visible-mixture hypotheses of that note. The variance comparison itself was already used, with the unnormalized Γ, in our scalar Edgeworth proof; the book confirms its normalization and provides a direct reference. The contribution here is its combination with the payoff-dependent weight.

At the peak, write L=Z(a+b|Z|²), a=699/1250, b=179/1250. The reviewed mixture identity gives E V⁻¹=a⁻², so

    B(u)−B(0) ≤ (√π/2)u E V⁻¹/² ≤ √π u/(2a).

Therefore

    |D(q)|² ≤ πχu²/(48a²).

For **0<u≤463/10000 and χ≤1/45000**, this yields **|D(q)|<10⁻⁴**. The numerical premise is checked exactly with π<22/7:

    (22/7)(1/45000)(463/10000)² / [48(699/1250)²]
      = 2358059/236404707840000 < 1/100000000.

This is a proved error estimate on a specified shape class, not merely a hypothetical e-budget. It does not establish D≥0, pay A/B and odd interactions, or improve the global Grothendieck endpoint. The existing peak remote **cap** is stronger near the maximizing energy, but a cap against S is not the same as this same-variance estimate. Bound (B1) also applies to other visible mixtures satisfying its hypotheses, without assuming that the peak certificate transfers to them.

## 2. The useful chapters and their limits

| Location | What to use | What it does not prove |
|---|---|---|
| Theorem 2.9.1, p. 53 | Integration by parts with ⟨DF,−DL⁻¹G⟩; the starting point for the deficit identity | The sign of its correlation with a nonlinear payoff |
| Lemma 5.2.4 and Theorems 5.2.6–5.2.7, pp. 95–100 | Explicit contraction/variance/fourth-cumulant constants and quantitative Gaussian approximation | Compactness or a large L¹ norm does not imply κ₄→0 |
| Theorem 6.1.1, pp. 116–117 | The full mixed Malliavin covariance matrix for a vector of sectors | Small marginal error of q does not control every mixed entry |
| Theorems 8.2.5 and 8.4.3–8.4.4, pp. 151–158 | Recursive joint-cumulant formulas and tensor contractions | A sign for every higher contraction or a global Edgeworth remainder |
| Theorem 9.2.2 and §9.3, pp. 162–164 | Conditions giving an exact first asymptotic correction | An explicit finite-χ remainder valid for every cubic |
| Theorem 10.1.1, pp. 170–172 | Density representation through the conditional Stein kernel | A bound on that kernel strong enough for Gaussian domination |
| Theorem 11.3.1, pp. 185–186 | Universality of a Gaussian limit for diagonal-free homogeneous sums | Gaussian inputs do not make a cubic output Gaussian |

### Shared drivers: keep the matrix

Theorem 6.1.1 retains entries `M_ij=⟨DF_j,−DL⁻¹F_i⟩` and compares them with the target covariance. Dropping off-diagonal entries removes the shared-driver effects needed in our all-sector problem. Its Wasserstein estimate also uses an inverse positive-definite target covariance. Such constants can diverge when an amplitude vanishes or a covariance becomes singular.

This supports the existing odd-sector strategy of replacing only the diffuse q block while retaining the actual other drivers and their mixed contractions. It does not justify replacing the whole vector by independent Gaussians. A useful next calculation is to compute the mixed cumulants that multiply the payoff derivatives, retaining their signs, instead of charging every matrix entry by its absolute norm.

### Cumulant recursions and symmetric Edgeworth cancellation

In §8.4 the book starts its recursive sequence at Λ₁(F)=F, with

    Λ_{j+1}(F)=⟨DF,−DL⁻¹Λ_j(F)⟩,
    κ_m(F)=(m−1)! EΛ_m(F).

This indexing differs by one from the convention starting at Γ₀=F. Also Λ₂=‖DF‖²/3 for third chaos, whereas our Edgeworth working note uses unnormalized Γ=‖DF‖². Account for both changes before importing constants.

For a real cubic, F is odd under global sign reversal while its Malliavin variance is even. Hence the correlation between F and 1−Γ is zero. The first correction in Theorem 9.2.2 can vanish. This does **not** supply the next signed correction with a uniform remainder: that theorem assumes convergence of a joint normalized vector and gives an asymptotic statement. Our two-integration-by-parts Edgeworth calculation does additional work. Chapter 8 can organize a sharper version, not replace its remainder estimate.

### The density formula reformulates the difficulty

Theorem 10.1.1 uses `g_F(x)=E[Γ | F=x]` and expresses the density, almost everywhere on its support, using g_F and E|F|. It neither bounds g_F by one nor makes it monotone in |x|. The existing He₃ example already disproves the monotonicity shortcut. Evaluating the formula at a singular point such as zero also requires justification; the smooth deficit kernels avoid this issue.

### Universality is not Gaussian domination

Theorem 11.3.1 starts with diagonal-free homogeneous sums whose outputs under Gaussian inputs converge to a Gaussian. It transfers that convergence to other independent standardized inputs under moment assumptions. It does not supply the initial Gaussian convergence, a one-sided finite-size absolute-moment comparison, or a theorem for arbitrary repeated-index Wick tensors without further work.

The immediate use of the book is (B1) and its explicit 10⁻⁴ region. Its longer-term use is the joint-cumulant calculus for sharpening signed remainders while preserving sharing. No theorem inspected closes the universal sign or Conjecture K.
