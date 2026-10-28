import Grothe.UpperChaos.OneSidedSeedFubini
import Grothe.UpperChaos.SeedPiNormalization
import Mathlib.Tactic.LinearCombination

/-! Combination of absolute Fubini, the positive-parameter inner identity,
and the Möbius seed integral. The shifted-Wick identity is explicit here
and discharged by `OneSidedHermiteSeed`.
Agent-ID: codex-8c4d. -/

open MeasureTheory Set Grothe.LowerAnalytic
namespace Grothe.UpperChaos.OneSidedSeedIntegral
noncomputable section

/-- The unnormalized holomorphic Gaussian phase seed, conditional on the
one-sided shifted-Wick moment formula. -/
theorem phase_seed_of_wick (A : ℝ) (d : ℕ)
    (hzero : ∀ (rate : ℝ) (μ : ℂ) (k : ℕ),
      shiftedDampedMoment rate μ k 0 = μ ^ k / (rate : ℂ)) :
    (∫ w : ℂ, w ^ d * Haag.ph ((A : ℂ) + w) ∂gaussC) =
      (((Real.sqrt Real.pi / 2) * A * (-A) ^ d *
        OriginalPositiveMoment.moment d (A ^ 2) : ℝ) : ℂ) := by
  rw [OneSidedSeedFubini.phase_fubini]
  have hinner :
      (∫ t : ℝ in Ioi 0, ∫ w : ℂ,
        w ^ d * Haag.phaseLaplaceKernel ((A : ℂ) + w) t ∂gaussC) =
      (((A * (-A) ^ d * ((Real.pi / 2) *
        OriginalPositiveMoment.moment d (A ^ 2)) : ℝ)) : ℂ) := by
    calc
      _ = ∫ t : ℝ in Ioi 0,
          ((A * (-A) ^ d * MobiusSeedPullback.kernel d (A ^ 2) t : ℝ) : ℂ) := by
            apply setIntegral_congr_fun measurableSet_Ioi
            intro t ht
            exact OneSidedSeedFubini.phaseLaplace_inner A t d ht hzero
      _ = _ := by
        rw [integral_complex_ofReal, integral_const_mul,
          MobiusSeedImproper.kernel_eq_moment]
  rw [hinner]
  have hn := congrArg (fun y : ℝ => (y : ℂ))
    (SeedPiNormalization.sqrt_pi_factor
      (A * (-A) ^ d * OriginalPositiveMoment.moment d (A ^ 2)))
  push_cast at hn ⊢
  linear_combination hn

#print axioms phase_seed_of_wick
end
end Grothe.UpperChaos.OneSidedSeedIntegral
