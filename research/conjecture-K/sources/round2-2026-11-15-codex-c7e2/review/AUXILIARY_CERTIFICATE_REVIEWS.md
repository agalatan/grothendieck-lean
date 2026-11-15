<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/review/AUXILIARY_CERTIFICATE_REVIEWS.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- /workspace/scratch/f307e93b3610/codex-c7e2-round2/review/AUXILIARY_CERTIFICATE_REVIEWS.md -->
# Independent auxiliary reviews and replays

## Joint-majorant obstruction

Reviewed `joint/majorant_obstruction.cpp` and its Python comparison logic, then freshly compiled and ran the C++ checker in a temporary directory. It passed all1,048,576 Cartesian source cells, omitting two cells whose radius interval included zero. Output:

    lower=0x1.2781a867489e6p-3
    target_upper=0x1.e7c506c1094bap-4
    margin_lower=0x1.9cf928361fc48p-6

The potential, previous alpha/beta bound, and new cubic bound all have the correct normalization for twice the one-sided remainder. The lower interval construction respects alpha's increase and beta's decrease, and uses only nonnegative scalar forms. Clipping eta's lower endpoint to zero is valid. The omitted source cells and tails contribute nonnegative quantities and therefore require no upper-tail control for this lower certificate.

For a looser old cap e, the old scalar bound has derivative numerator18U−16H−e(9U−4H). Since0≤H≤U, this is decreasing, so the minimum over allowable e occurs at either the actual cap or e=1. Those endpoints are already covered by the pointwise minimum in the checker.

Thus this whole elementary-majorant family cannot establish (P) at the displayed parameter point. This is not a counterexample to(P).

The related phase-obstruction algebra was also checked: the rational moduli, cross coefficient59ρ/50, beta/alignment error signs, and rank-zero quadratic expansion are correct. The logarithmically divergent imaginary-direction Hessian follows from a nonzero transverse projection on a positive angular sector and Fatou on nonnegative symmetric differences. The six phase-comparison integrals were not separately rerun in this review.

## All-buffer inverse moment for one specific cubic

Reviewed `global/INVERSE_MOMENT_COUNTEREXAMPLE.md` and `certify_inverse_counterexample.py`, then freshly ran a temporary copy of the complete120-bit Arb certificate. It passed625 conditional-distribution cells and1415 exactly adjoining buffer intervals. The smallest certified interval margin was0.011424956938686953, the small-buffer lower margin was0.00895141352304409086212463829222, and the large-buffer exact polynomial margin was302/9.

The proof's Rice formulas, convexity in squared radius, conditional Jensen inequalities, small-buffer estimate, derivative bound, and large-buffer exponential expansion were checked independently. The conditional exponential moments include every unbounded tail cell. Adaptive floating point only suggests step lengths; rational endpoints and Arb inequalities accept them. Checks remain active under optimization.

The conclusion is valid for the single polynomial X[(|X|²−2)+i(|Y|²−1)]/√3 at every independent Gaussian buffer. It shows that this known failure of a stronger Laplace-order comparison still satisfies the inverse-moment criterion. It does not prove that criterion for arbitrary cubics.

The final complex-coefficient extension was also checked and freshly replayed under `python -O`. It passed625cells and1659adjacent buffer intervals, with minimum margin0.00793660051838289 and small-buffer margin0.0029337241581528275. Both second/third moment polynomials were independently reproduced by symbolic expansion. Convexity and decrease of f_v justify replacing conditional means by parameter-uniform upper endpoints; the same endpoints conservatively bound both small-buffer terms. This proves precisely the stated closed coefficient rectangle around z=i for every buffer, not an arbitrary self-interaction family.

## Weighted quadratic-bath family

Reviewed the analytic first two sections of `search/REPORT.md`. Four real Gaussian directions and two proper complex directions do parameterize the stated pair covariances. The independent quadratic CLTs produce genuine finite H₂,₁ approximants with exactly preserved energy, and joint convergence plus uniform second moments gives convergence of the paired norm. The conditional Gaussian representation using variance v and pseudovariance rho is correct, as is the Rice mean formula.

This is an exact reduction only for the expressly stated family. The optimization records are exploratory and do not bound its global supremum or reduce arbitrary chaos to that family.

## Two-coordinate radius bound

The proof in `root/TWO_COORDINATE_RADIUS.md` was independently read and its exact Node checker replayed successfully. The unitary trace normalization is valid, the tied block has energy3|c|², and the radial/angular polynomial expressions give the displayed matrix and scalar coefficients. Its positive determinant5513/524880000 verifies the comparison with6/25. Thus the unbuffered bound(E|q|)²≤(6π/25)E|q|² holds for every two-coordinate H₂,₁ cubic. The proof does not imply the buffered inequality after adding an independent Gaussian, since that lies outside the same two-coordinate cubic class.
