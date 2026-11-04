import Grothe.UpperChaos.RationalCovariancePolynomial
import Grothe.UpperChaos.RationalCovarianceConditional

/-!
# Actual zero and degree-one rational gate contractions

Agent-ID: codex-2ca4. Task #40.
The only certificate premise is the original `gateOK g = true`. The two
Jacobian factors and the Gaussian mass remain inside the existing rational
pair evaluator. This file adds no numerical cap and no higher-degree
compression theorem.
-/

set_option warningAsError true

namespace Grothe.UpperChaos.RationalCovarianceGateComposition

open MvPolynomial BipartitePolynomialL2 OriginalHSParameterGates
open RationalQuadraticMoments RationalCovarianceAlgebra
open RationalCovariancePolynomial RationalCovarianceConditional
open ActualGateConditionalScaling ActualSourceNormEvaluation

noncomputable section

/-- The archive relation is an identity of the actual rational parameters. -/
theorem dampingQ_add_nuQ (power : ℕ) : dampingQ power + nuQ power = 1 := by
  have hden : (1 + 21 * (power : ℚ) / 20) ≠ 0 := ne_of_gt (by positivity)
  unfold dampingQ nuQ
  field_simp [hden] <;> ring

/-- The checked covariance determinant is exactly the rational determinant. -/
theorem gate_delta_pos (g : Gate) (hg : gateOK g = true) (side : Fin 2) :
    0 < delta (dampingQ g.power) (nuQ g.power) g.r
      (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  have hreal : 0 < (delta (dampingQ g.power) (nuQ g.power) g.r
      (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) : ℝ) := by
    simpa only [delta, OriginalHSCovariance.delta, Rat.cast_add, Rat.cast_sub,
      Rat.cast_mul, Rat.cast_pow, Rat.cast_one, dampingQ_cast, nuQ_cast,
      axisWeightQ_cast] using
      (OriginalHSQuadraticForms.pair_positive g hg side).determinant
  exact_mod_cast hreal

/-- Every denominator used by the rational moment evaluator is supplied by
`gateOK`; no numerical enclosure or new positivity premise is introduced. -/
theorem gate_nonzero (g : Gate) (hg : gateOK g = true) (side : Fin 2) :
    g.r ≠ 0 ∧ axisWeightQ g (2 * side.val + 1) ≠ 0 ∧
      gateLeadingQ g side ≠ 0 ∧
      delta (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) ≠ 0 := by
  have hR : g.r ≠ 0 := by
    exact_mod_cast (OriginalHSQuadraticForms.radial_pos g hg).ne'
  have hQ : axisWeightQ g (2 * side.val + 1) ≠ 0 := by
    have h := (OriginalHSQuadraticForms.axisWeight_pos g hg (2 * side.val + 1)).ne'
    rw [← axisWeightQ_cast] at h
    exact_mod_cast h
  have hA : gateLeadingQ g side ≠ 0 := by
    exact_mod_cast (gateLeadingQ_pos g hg side).ne'
  exact ⟨hR, hQ, hA, (gate_delta_pos g hg side).ne'⟩

/-- Collect four actual source contractions without unfolding any Wick sums. -/
private theorem rationalGatePairValue_four (g : Gate) (side : Fin 2)
    (e₁ f₁ e₂ f₂ e₃ f₃ e₄ f₄ : PairPowers) :
    rationalGatePairValue g side e₁ f₁ + rationalGatePairValue g side e₂ f₂ +
      rationalGatePairValue g side e₃ f₃ + rationalGatePairValue g side e₄ f₄ =
    nuQ g.power ^ 2 * polynomialMomentValue
      (gateLeadingQ g side) (gateCrossQ g side) (gateTrailingQ g side)
      (gateConditionalP4Q g side e₁ f₁ + gateConditionalP4Q g side e₂ f₂ +
        gateConditionalP4Q g side e₃ f₃ + gateConditionalP4Q g side e₄ f₄) /
      (g.r * axisWeightQ g (2 * side.val + 1)) := by
  simp only [rationalGatePairValue, polynomialMomentValue_add]
  ring

/-- The scaled quadratic moment factors one mass. The constant insertion is
kept inside the normalized expectation. -/
private theorem scaled_quadratic (a n R P Q k u v x y : ℚ)
    (hR : R ≠ 0) (hQ : Q ≠ 0) (hA : leading a n R P ≠ 0)
    (hD : delta a n R P Q ≠ 0) :
    n ^ 2 * polynomialMomentValue (leading a n R P) (cross a n R P)
      (trailing a n R P Q)
      (C k + (C u * X 0 + C v * X 2) * (C x * X 1 + C y * X 3)) /
      (R * Q) =
    mass a n R P Q * (k +
      (u * x * trailing a n R P Q - u * y * cross a n R P -
        v * x * cross a n R P + v * y * leading a n R P) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2)) := by
  rw [polynomialMomentValue_quadratic _ _ _ _ _ _ _ _ hA
    (schur_determinant_ne_zero a n R P Q hR hQ hD)]
  rw [scaled_determinant a n R P Q hR hQ]
  unfold mass
  field_simp [hR, hQ, hD] <;> ring

/-- Direct zero insertion, with all algebraic side conditions derived from the
same actual certificate used by the analytic pair binding. -/
theorem rationalGatePairValue_zero_of_gateOK (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) :
    rationalGatePairValue g side 0 0 =
      mass (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  obtain ⟨hR, hQ, hA, hD⟩ := gate_nonzero g hg side
  exact RationalCovarianceAlgebra.rationalGatePairValue_zero g side hR hQ hA hD

/-- Physical outer degree one is n*(x+v), in PairPowers order ((y,u),(x,v)). -/
theorem rationalGatePairValue_outer_degreeOne (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) :
    nuQ g.power ^ 2 *
      (rationalGatePairValue g side oneX oneX +
        rationalGatePairValue g side oneX oneV +
        rationalGatePairValue g side oneV oneX +
        rationalGatePairValue g side oneV oneV) =
      mass (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) *
      chiPlus (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  let a := dampingQ g.power
  let n := nuQ g.power
  let R := g.r
  let P := axisWeightQ g (2 * side.val)
  let Q := axisWeightQ g (2 * side.val + 1)
  obtain ⟨hR, hQ, hA, hD⟩ := gate_nonzero g hg side
  have hs : a + n = 1 := dampingQ_add_nuQ g.power
  have hp : gateConditionalP4Q g side oneX oneX +
      gateConditionalP4Q g side oneX oneV +
      gateConditionalP4Q g side oneV oneX +
      gateConditionalP4Q g side oneV oneV =
      (X 0 + X 2) * (X 1 + X 3) :=
    outer_covariance_polynomial R P a n
  have hquad := scaled_quadratic a n R P Q 0 1 1 1 1 hR hQ hA hD
  simp only [map_zero, map_one, zero_add, one_mul] at hquad
  have hsum : rationalGatePairValue g side oneX oneX +
      rationalGatePairValue g side oneX oneV +
      rationalGatePairValue g side oneV oneX +
      rationalGatePairValue g side oneV oneV =
      mass a n R P Q *
        ((leading a n R P + trailing a n R P Q - 2 * cross a n R P) /
          (leading a n R P * trailing a n R P Q - cross a n R P ^ 2)) := by
    rw [rationalGatePairValue_four, hp]
    change n ^ 2 * polynomialMomentValue (leading a n R P) (cross a n R P)
      (trailing a n R P Q) ((X 0 + X 2) * (X 1 + X 3)) / (R * Q) = _
    rw [hquad]
    ring
  rw [hsum]
  change n ^ 2 * (mass a n R P Q *
    ((leading a n R P + trailing a n R P Q - 2 * cross a n R P) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2))) =
    mass a n R P Q * chiPlus a n R P Q
  rw [← chiPlus_schur a n R P Q hs hR hQ hD]
  ring

/-- Physical inner degree one is n*(y+u). The conditional R+P contribution
survives the integration and is part of chiMinus. -/
theorem rationalGatePairValue_inner_degreeOne (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) :
    nuQ g.power ^ 2 *
      (rationalGatePairValue g side oneY oneY +
        rationalGatePairValue g side oneY oneU +
        rationalGatePairValue g side oneU oneY +
        rationalGatePairValue g side oneU oneU) =
      mass (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) *
      chiMinus (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  let a := dampingQ g.power
  let n := nuQ g.power
  let R := g.r
  let P := axisWeightQ g (2 * side.val)
  let Q := axisWeightQ g (2 * side.val + 1)
  obtain ⟨hR, hQ, hA, hD⟩ := gate_nonzero g hg side
  have hs : a + n = 1 := dampingQ_add_nuQ g.power
  have hp : gateConditionalP4Q g side oneY oneY +
      gateConditionalP4Q g side oneY oneU +
      gateConditionalP4Q g side oneU oneY +
      gateConditionalP4Q g side oneU oneU =
      C (R + P) +
        (C (-a * R + n * P) * X 0 + C (n * R - a * P) * X 2) *
        (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3) :=
    inner_covariance_polynomial R P a n
  have hquad := scaled_quadratic a n R P Q (R + P)
    (-a * R + n * P) (n * R - a * P)
    (-a * R + n * P) (n * R - a * P) hR hQ hA hD
  have hsum : rationalGatePairValue g side oneY oneY +
      rationalGatePairValue g side oneY oneU +
      rationalGatePairValue g side oneU oneY +
      rationalGatePairValue g side oneU oneU =
      mass a n R P Q * (R + P +
        ((-a * R + n * P) ^ 2 * trailing a n R P Q +
          (n * R - a * P) ^ 2 * leading a n R P -
          2 * (-a * R + n * P) * (n * R - a * P) * cross a n R P) /
        (leading a n R P * trailing a n R P Q - cross a n R P ^ 2)) := by
    rw [rationalGatePairValue_four, hp]
    change n ^ 2 * polynomialMomentValue (leading a n R P) (cross a n R P)
      (trailing a n R P Q)
      (C (R + P) +
        (C (-a * R + n * P) * X 0 + C (n * R - a * P) * X 2) *
        (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3)) /
      (R * Q) = _
    rw [hquad]
    ring
  rw [hsum]
  change n ^ 2 * (mass a n R P Q * (R + P +
      ((-a * R + n * P) ^ 2 * trailing a n R P Q +
        (n * R - a * P) ^ 2 * leading a n R P -
        2 * (-a * R + n * P) * (n * R - a * P) * cross a n R P) /
      (leading a n R P * trailing a n R P Q - cross a n R P ^ 2))) =
    mass a n R P Q * chiMinus a n R P Q
  rw [← chiMinus_schur a n R P Q hs hR hQ hD]
  ring

/-- The intrinsic inserted polynomial is n+n^2*(y+u)*(x+v).
This ground-versus-quadratic contraction is not an opposite-charge cross-Gram. -/
theorem rationalGatePairValue_ground_mixed (g : Gate) (hg : gateOK g = true)
    (side : Fin 2) :
    nuQ g.power * rationalGatePairValue g side 0 0 + nuQ g.power ^ 2 *
      (rationalGatePairValue g side 0 (oneY + oneX) +
        rationalGatePairValue g side 0 (oneY + oneV) +
        rationalGatePairValue g side 0 (oneU + oneX) +
        rationalGatePairValue g side 0 (oneU + oneV)) =
      mass (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) *
      lambda (dampingQ g.power) (nuQ g.power) g.r
        (axisWeightQ g (2 * side.val)) (axisWeightQ g (2 * side.val + 1)) := by
  let a := dampingQ g.power
  let n := nuQ g.power
  let R := g.r
  let P := axisWeightQ g (2 * side.val)
  let Q := axisWeightQ g (2 * side.val + 1)
  obtain ⟨hR, hQ, hA, hD⟩ := gate_nonzero g hg side
  have hs : a + n = 1 := dampingQ_add_nuQ g.power
  have hp : gateConditionalP4Q g side 0 (oneY + oneX) +
      gateConditionalP4Q g side 0 (oneY + oneV) +
      gateConditionalP4Q g side 0 (oneU + oneX) +
      gateConditionalP4Q g side 0 (oneU + oneV) =
      (X 0 + X 2) *
        (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3) :=
    mixed_covariance_polynomial R P a n
  have hquad := scaled_quadratic a n R P Q 0 1 1
    (-a * R + n * P) (n * R - a * P) hR hQ hA hD
  simp only [map_zero, map_one, zero_add, one_mul] at hquad
  have hsum : rationalGatePairValue g side 0 (oneY + oneX) +
      rationalGatePairValue g side 0 (oneY + oneV) +
      rationalGatePairValue g side 0 (oneU + oneX) +
      rationalGatePairValue g side 0 (oneU + oneV) =
      mass a n R P Q *
        (((-a * R + n * P) * (trailing a n R P Q - cross a n R P) +
          (n * R - a * P) * (leading a n R P - cross a n R P)) /
        (leading a n R P * trailing a n R P Q - cross a n R P ^ 2)) := by
    rw [rationalGatePairValue_four, hp]
    change n ^ 2 * polynomialMomentValue (leading a n R P) (cross a n R P)
      (trailing a n R P Q)
      ((X 0 + X 2) *
        (C (-a * R + n * P) * X 1 + C (n * R - a * P) * X 3)) /
      (R * Q) = _
    rw [hquad]
    ring
  rw [rationalGatePairValue_zero_of_gateOK g hg side, hsum]
  change n * mass a n R P Q + n ^ 2 * (mass a n R P Q *
    (((-a * R + n * P) * (trailing a n R P Q - cross a n R P) +
      (n * R - a * P) * (leading a n R P - cross a n R P)) /
    (leading a n R P * trailing a n R P Q - cross a n R P ^ 2))) =
    mass a n R P Q * lambda a n R P Q
  rw [← lambda_schur a n R P Q hs hR hQ hD]
  ring

open Lean Elab Command
run_cmd do
  for target in #[``dampingQ_add_nuQ, ``gate_delta_pos, ``gate_nonzero,
      ``rationalGatePairValue_zero_of_gateOK, ``rationalGatePairValue_outer_degreeOne,
      ``rationalGatePairValue_inner_degreeOne, ``rationalGatePairValue_ground_mixed] do
    for ax in ← Lean.collectAxioms target do
      unless #[`propext, `Classical.choice, `Quot.sound].contains ax do
        throwError m!"{target} has forbidden axiom {ax}"

end
end Grothe.UpperChaos.RationalCovarianceGateComposition
