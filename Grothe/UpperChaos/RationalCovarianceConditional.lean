import Grothe.UpperChaos.ActualGateConditionalScaling

/-!
# Actual degree-one conditional source polynomials

Agent-ID: codex-2ca4. Task #40.
These finite identities specialize the production Wick polynomial; they do
not assume a covariance model or introduce any additional Gaussian mass.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RationalCovarianceConditional

open MvPolynomial BipartitePolynomialL2 ActualGateConditionalScaling

noncomputable section

def oneY : PairPowers := ((1, 0), (0, 0))
def oneU : PairPowers := ((0, 1), (0, 0))
def oneX : PairPowers := ((0, 0), (1, 0))
def oneV : PairPowers := ((0, 0), (0, 1))

theorem outer_covariance_polynomial (R P a n : ℚ) :
    varianceConditionalP4Q R P a n oneX oneX +
      varianceConditionalP4Q R P a n oneX oneV +
      varianceConditionalP4Q R P a n oneV oneX +
      varianceConditionalP4Q R P a n oneV oneV =
        (X 0 + X 2) * (X 1 + X 3) := by
  simp [varianceConditionalP4Q, outerQ, varianceWickQ,
    oneX, oneV]
  ring

/-- The constant R+P is the conditional variance and cannot be discarded. -/
theorem inner_covariance_polynomial (R P a n : ℚ) :
    varianceConditionalP4Q R P a n oneY oneY +
      varianceConditionalP4Q R P a n oneY oneU +
      varianceConditionalP4Q R P a n oneU oneY +
      varianceConditionalP4Q R P a n oneU oneU =
        C (R + P) +
          (C (-a * R + n * P) * X 0 + C (n * R - a * P) * X 2) *
          (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3) := by
  simp [varianceConditionalP4Q, outerQ, varianceWickQ, linearQ, conjugateLinearQ,
    oneY, oneU, Finset.sum_range_succ, map_add, map_mul, map_neg, map_sub]
  ring

/-- This is the ground-versus-quadratic contraction, not an opposite-charge
Hermitian cross-Gram entry. The intrinsic inserted constant n is added later. -/
theorem mixed_covariance_polynomial (R P a n : ℚ) :
    varianceConditionalP4Q R P a n 0 (oneY + oneX) +
      varianceConditionalP4Q R P a n 0 (oneY + oneV) +
      varianceConditionalP4Q R P a n 0 (oneU + oneX) +
      varianceConditionalP4Q R P a n 0 (oneU + oneV) =
        (X 0 + X 2) *
          (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3) := by
  simp [varianceConditionalP4Q, outerQ, varianceWickQ, linearQ, conjugateLinearQ,
    oneY, oneU, oneX, oneV, map_add, map_mul, map_neg, map_sub]
  ring

open Lean Elab Command
run_cmd do
  for target in #[``outer_covariance_polynomial, ``inner_covariance_polynomial,
      ``mixed_covariance_polynomial] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.RationalCovarianceConditional
