import Grothe.UpperChaos.ActualSourceNormEvaluation
import Mathlib.Tactic

/-!
# Rational low moments and covariance scalars

Agent-ID: codex-2ca4. Task #40.
The low moments include their Gaussian mass. The actual zero pair contraction
is bound to the existing rational evaluator with explicit algebraic denominator
hypotheses. No higher-degree compressor or numerical enclosure is asserted.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RationalCovarianceAlgebra

open RationalQuadraticMoments

theorem moment_zero (A B C : ℚ) (hA : A ≠ 0)
    (hD : A * C - B ^ 2 ≠ 0) :
    momentValue A B C 0 0 0 0 = 1 / (A * C - B ^ 2) := by
  norm_num [momentValue, wickCoeff, Finset.sum_range_succ] <;>
    field_simp [hA, hD]

theorem moment_first_variance (A B C : ℚ) (hA : A ≠ 0)
    (hD : A * C - B ^ 2 ≠ 0) :
    momentValue A B C 1 1 0 0 = C / (A * C - B ^ 2) ^ 2 := by
  norm_num [momentValue, wickCoeff, Finset.sum_range_succ]
  field_simp [hA, hD]
  ring

theorem moment_second_variance (A B C : ℚ) (hA : A ≠ 0)
    (hD : A * C - B ^ 2 ≠ 0) :
    momentValue A B C 0 0 1 1 = A / (A * C - B ^ 2) ^ 2 := by
  norm_num [momentValue, wickCoeff, Finset.sum_range_succ] <;>
    field_simp [hA, hD]

theorem moment_cross (A B C : ℚ) (hA : A ≠ 0)
    (hD : A * C - B ^ 2 ≠ 0) :
    momentValue A B C 1 0 0 1 = -B / (A * C - B ^ 2) ^ 2 := by
  norm_num [momentValue, wickCoeff, Finset.sum_range_succ] <;>
    field_simp [hA, hD]

theorem moment_cross_reverse (A B C : ℚ) (hA : A ≠ 0)
    (hD : A * C - B ^ 2 ≠ 0) :
    momentValue A B C 0 1 1 0 = -B / (A * C - B ^ 2) ^ 2 := by
  norm_num [momentValue, wickCoeff, Finset.sum_range_succ] <;>
    field_simp [hA, hD]

def delta (a n R P Q : ℚ) : ℚ :=
  1 - a ^ 2 * (R ^ 2 + P * Q) - n ^ 2 * R * (P + Q) +
    (a ^ 2 - n ^ 2) ^ 2 * R ^ 2 * P * Q

def leading (a n R P : ℚ) : ℚ := 1 / R - a ^ 2 * R - n ^ 2 * P
def cross (a n R P : ℚ) : ℚ := a * n * (R + P)
def trailing (a n R P Q : ℚ) : ℚ := 1 / Q - n ^ 2 * R - a ^ 2 * P

theorem scaled_determinant (a n R P Q : ℚ) (hR : R ≠ 0) (hQ : Q ≠ 0) :
    leading a n R P * trailing a n R P Q - cross a n R P ^ 2 =
      delta a n R P Q / (R * Q) := by
  unfold leading trailing cross delta
  field_simp [hR, hQ]
  ring

theorem schur_determinant_ne_zero (a n R P Q : ℚ)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hD : delta a n R P Q ≠ 0) :
    leading a n R P * trailing a n R P Q - cross a n R P ^ 2 ≠ 0 := by
  rw [scaled_determinant a n R P Q hR hQ]
  exact div_ne_zero hD (mul_ne_zero hR hQ)

def mass (a n R P Q : ℚ) : ℚ := n ^ 2 / delta a n R P Q
def chiPlus (a n R P Q : ℚ) : ℚ :=
  n ^ 2 * (R + Q - R * Q * (R + P)) / delta a n R P Q
def chiMinus (a n R P Q : ℚ) : ℚ :=
  n ^ 2 * (R + P - R * P * (R + Q)) / delta a n R P Q
def lambda (a n R P Q : ℚ) : ℚ :=
  n * (1 - a * (R ^ 2 + P * Q) + (a - n) * R ^ 2 * P * Q) /
    delta a n R P Q

theorem zero_mass (a n R P Q : ℚ)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hA : leading a n R P ≠ 0)
    (hD : delta a n R P Q ≠ 0) :
    n ^ 2 * momentValue (leading a n R P) (cross a n R P)
      (trailing a n R P Q) 0 0 0 0 / (R * Q) = mass a n R P Q := by
  rw [moment_zero _ _ _ hA (schur_determinant_ne_zero a n R P Q hR hQ hD),
    scaled_determinant a n R P Q hR hQ]
  unfold mass
  field_simp [hR, hQ, hD]

/-- Normalized outer covariance of n*(x+v). -/
theorem chiPlus_schur (a n R P Q : ℚ) (hs : a + n = 1)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hD : delta a n R P Q ≠ 0) :
    n ^ 2 * (leading a n R P + trailing a n R P Q - 2 * cross a n R P) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2) =
      chiPlus a n R P Q := by
  rw [scaled_determinant a n R P Q hR hQ]
  have ha : a = 1 - n := by linarith
  subst a
  unfold leading trailing cross chiPlus
  field_simp [hR, hQ, hD]
  ring

/-- The conditional variance R+P is essential for the inner covariance. -/
theorem chiMinus_schur (a n R P Q : ℚ) (hs : a + n = 1)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hD : delta a n R P Q ≠ 0) :
    n ^ 2 * (R + P +
      ((-a * R + n * P) ^ 2 * trailing a n R P Q +
        (n * R - a * P) ^ 2 * leading a n R P -
        2 * (-a * R + n * P) * (n * R - a * P) * cross a n R P) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2)) =
      chiMinus a n R P Q := by
  rw [scaled_determinant a n R P Q hR hQ]
  have ha : a = 1 - n := by linarith
  subst a
  unfold leading trailing cross chiMinus
  field_simp [hR, hQ, hD]
  unfold delta
  ring

/-- The extra n is the intrinsic (1,1) Gaussian contraction, not another mass. -/
theorem lambda_schur (a n R P Q : ℚ) (hs : a + n = 1)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hD : delta a n R P Q ≠ 0) :
    n + n ^ 2 *
      ((-a * R + n * P) * (trailing a n R P Q - cross a n R P) +
        (n * R - a * P) * (leading a n R P - cross a n R P)) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2) =
      lambda a n R P Q := by
  rw [scaled_determinant a n R P Q hR hQ]
  have ha : a = 1 - n := by linarith
  subst a
  unfold leading trailing cross lambda
  field_simp [hR, hQ, hD]
  unfold delta
  ring

/-- Direct zero-order binding to the landed rational pair evaluator.
The hypotheses are algebraic and do not assert a Gaussian integral without gateOK. -/
theorem rationalGatePairValue_zero (g : OriginalHSParameterGates.Gate) (side : Fin 2)
    (hR : g.r ≠ 0) (hQ : axisWeightQ g (2 * side.val + 1) ≠ 0)
    (hA : gateLeadingQ g side ≠ 0)
    (hD : delta (dampingQ g.power) (nuQ g.power) g.r
      (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) ≠ 0) :
    ActualSourceNormEvaluation.rationalGatePairValue g side 0 0 =
      mass (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  have hp : ActualGateConditionalScaling.gateConditionalP4Q g side 0 0 = 1 := by
    simp [ActualGateConditionalScaling.gateConditionalP4Q,
      ActualGateConditionalScaling.varianceConditionalP4Q,
      ActualGateConditionalScaling.outerQ, ActualGateConditionalScaling.varianceWickQ]
  rw [ActualSourceNormEvaluation.rationalGatePairValue, hp]
  change nuQ g.power ^ 2 * polynomialMomentValue (gateLeadingQ g side)
      (gateCrossQ g side) (gateTrailingQ g side) (MvPolynomial.monomial 0 1) /
      (g.r * axisWeightQ g (2 * side.val + 1)) = _
  rw [polynomialMomentValue_monomial]
  simpa only [Finsupp.coe_zero, Pi.zero_apply, one_mul, leading, cross, trailing,
    gateLeadingQ, gateCrossQ, gateTrailingQ] using
    zero_mass (dampingQ g.power) (nuQ g.power) g.r
      (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1))
      hR hQ hA hD

open Lean Elab Command
run_cmd do
  for target in #[``moment_zero, ``moment_first_variance, ``moment_second_variance,
      ``moment_cross, ``moment_cross_reverse, ``scaled_determinant,
      ``schur_determinant_ne_zero, ``zero_mass, ``chiPlus_schur,
      ``chiMinus_schur, ``lambda_schur, ``rationalGatePairValue_zero] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end Grothe.UpperChaos.RationalCovarianceAlgebra
