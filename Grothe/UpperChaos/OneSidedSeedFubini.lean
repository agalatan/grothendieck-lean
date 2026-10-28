import Grothe.Haagerup.PhaseLaplaceFubini
import Grothe.UpperChaos.ConditionalGaussianPhase
import Grothe.UpperChaos.OneSidedShiftAlgebra
import Grothe.UpperChaos.MobiusSeedImproper
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! Draft source-to-seed proof. This module has not been Lean-checked. The
one-sided shifted-Wick evaluation is an explicit hypothesis. It does not
claim a Hermite normalization, numerical enclosure, or upper bound.
Agent-ID: codex-8c4d. -/

open MeasureTheory Set Grothe.LowerAnalytic
open scoped ComplexConjugate
namespace Grothe.UpperChaos.OneSidedSeedFubini
noncomputable section

/-- The unweighted holomorphic Gaussian monomial is integrable. -/
theorem integrable_power (d : ℕ) : Integrable (fun w : ℂ => w ^ d) gaussC := by
  simpa only [pow_zero, mul_one] using integrable_monomial d 0

/-- Absolute Fubini for the unnormalized zero-row seed. -/
theorem phase_fubini (A : ℝ) (d : ℕ) :
    (∫ w : ℂ, w ^ d * Haag.ph ((A : ℂ) + w) ∂gaussC) =
      (Real.sqrt Real.pi : ℂ)⁻¹ *
        ∫ t : ℝ in Ioi 0, ∫ w : ℂ,
          w ^ d * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC := by
  exact Haag.integral_mul_ph_eq_phaseLaplace gaussC
    (by fun_prop) (by fun_prop) (integrable_power d)

/-- Exact Gaussian inner integral at each positive Laplace parameter, assuming
only the separate one-sided shifted-Wick identity. -/
theorem phaseLaplace_inner (A t : ℝ) (d : ℕ) (ht : 0 < t)
    (hzero : ∀ (rate : ℝ) (μ : ℂ) (k : ℕ),
      shiftedDampedMoment rate μ k 0 = μ ^ k / (rate : ℂ)) :
    (∫ w : ℂ, w ^ d * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC) =
      ((A * (-A) ^ d * MobiusSeedPullback.kernel d (A ^ 2) t : ℝ) : ℂ) := by
  have h := integral_affine_phaseLaplace_monomial d 0 1 1 t (A : ℂ) (by norm_num) ht
  dsimp only at h
  simp only [one_pow, one_mul, pow_zero, mul_one, sub_self, zero_mul, neg_zero,
    Real.exp_zero, Complex.ofReal_one, Complex.normSq_ofReal] at h
  rw [hzero (1 + t) _ d, hzero (1 + t) _ (d + 1)] at h
  have hreal := OneSidedShiftAlgebra.combine A t d ht
  have hcomplex := congrArg (fun y : ℝ => (y : ℂ)) hreal
  push_cast at hcomplex
  rw [h]
  push_cast
  rw [← mul_div_assoc, hcomplex]
  have hexp : -(t * (A * A) / (1 + t)) = -A ^ 2 * (t / (1 + t)) := by ring
  have hexpC := congrArg (fun y : ℝ => (y : ℂ)) hexp
  push_cast at hexpC
  rw [hexpC]
  simp only [MobiusSeedPullback.kernel]
  push_cast
  ring

#print axioms integrable_power
#print axioms phase_fubini
#print axioms phaseLaplace_inner
end
end Grothe.UpperChaos.OneSidedSeedFubini
