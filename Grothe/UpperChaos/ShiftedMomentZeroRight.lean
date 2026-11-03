import Grothe.UpperChaos.ShiftedDampedMoments

/-!
The one-sided shifted Wick moment. The finite-sum identity holds for all
rates; identifying it with a Gaussian integral requires a positive rate.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

theorem shiftedDampedMoment_zero_right (rate : ℝ) (μ : ℂ) (d : ℕ) :
    shiftedDampedMoment rate μ d 0 = μ ^ d / (rate : ℂ) := by
  simp [shiftedDampedMoment]

theorem integral_shifted_moment_damped_zero_right (d : ℕ) (μ : ℂ)
    {rate : ℝ} (hrate : 0 < rate) :
    (∫ z, (z + μ) ^ d *
      (Real.exp (-(rate - 1) * Complex.normSq z) : ℂ) ∂gaussC) =
      μ ^ d / (rate : ℂ) := by
  simpa [shiftedDampedMoment_zero_right] using
    integral_shifted_moment_damped d 0 μ hrate

#print axioms shiftedDampedMoment_zero_right
#print axioms integral_shifted_moment_damped_zero_right

end
end Grothe.UpperChaos
