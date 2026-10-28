import Grothe.UpperChaos.MobiusPowerAlgebra
import Grothe.UpperChaos.OriginalMomentIntegrable
import Mathlib.Tactic.Ring

/-! Exact source moment integrand under t ↦ t/(1+t). The scalar A(-A)^d
and sqrt-factorial normalization are intentionally separate, as is the
improper integral identity. -/
namespace Grothe.UpperChaos.MobiusSeedPullback
noncomputable section

/-- Non-scalar part of the conditional seed integrand for t > 0. -/
def kernel (d : ℕ) (x t : ℝ) : ℝ :=
  (t / (1 + t)) ^ d * t ^ (-(1 / 2 : ℝ)) *
    Real.exp (-x * (t / (1 + t))) / (1 + t) ^ 2

theorem source_integrand_pullback (d : ℕ) (x t : ℝ) (ht : 0 < t) :
    OriginalPositiveMoment.integrand d x (t / (1 + t)) *
      (1 / (1 + t) ^ 2) = kernel d x t := by
  unfold OriginalPositiveMoment.integrand kernel
  calc
    _ = ((t / (1 + t)) ^ ((d : ℝ) - 1 / 2) *
        Real.sqrt (1 - t / (1 + t))) * Real.exp (-x * (t / (1 + t))) *
        (1 / (1 + t) ^ 2) := by ring
    _ = _ := by rw [MobiusPowerAlgebra.mobius_power_identity d t ht]; ring

end
end Grothe.UpperChaos.MobiusSeedPullback
#print axioms Grothe.UpperChaos.MobiusSeedPullback.source_integrand_pullback
