import Grothe.UpperChaos.GroupedRounder

/-! A quantitative actual-GT coefficient tail for 1024-point DFT aliasing.
The bound concerns the actual rounding; no sample values are certified. -/

namespace Grothe.UpperChaos.DirectSample

set_option maxRecDepth 16384
set_option maxHeartbeats 0

noncomputable section

/-- A conservative rational comparison for the Hardy tail from radial 512. -/
theorem alias_tail_numeric :
    (7 / 4 : ℝ) * (4149 / 4000 : ℝ)⁻¹ ^ (2 * (2 * 512 + 1)) ≤
      (1 / 5000000000000000 : ℝ) ^ 2 * (1 - (4149 / 4000 : ℝ)⁻¹ ^ 4) := by
  have hN : (350 * 10 ^ 30 * 4000 ^ 2050 : ℕ) ≤ 4149 ^ 2050 := by
    decide +kernel
  have hR : (350 * 10 ^ 30 * 4000 ^ 2050 : ℝ) ≤ 4149 ^ 2050 := by
    exact_mod_cast hN
  have ha : (0 : ℝ) ≤ 4000 ^ 2050 := by positivity
  have hb : (0 : ℝ) < 4149 ^ 2050 := by positivity
  have hmargin : (1 / 8 : ℝ) ≤ 1 - (4000 / 4149 : ℝ) ^ 4 := by norm_num
  rw [show 2 * (2 * 512 + 1) = 2050 by norm_num,
    show (4149 / 4000 : ℝ)⁻¹ = 4000 / 4149 by norm_num, div_pow]
  generalize (4000 : ℝ) ^ 2050 = a at hR ha ⊢
  generalize (4149 : ℝ) ^ 2050 = b at hR hb ⊢
  have hsmall : (7 / 4 : ℝ) * (a / b) ≤
      (1 / 5000000000000000 : ℝ) ^ 2 * (1 / 8) := by
    rw [← mul_div_assoc, div_le_iff₀ hb]
    norm_num at hR ⊢
    linarith
  exact hsmall.trans (mul_le_mul_of_nonneg_left hmargin (sq_nonneg _))

/-- All radial coefficients from index 512 contribute less than 2e-16.
No sampled kernel values or approximation hypotheses occur here. -/
theorem GT_alias_tail :
    ∑' n, |HardyReal.hGT phiBound (n + 512)| ≤ (1 / 5000000000000000 : ℝ) := by
  exact hardy_tail (HardyReal.hGT phiBound) (4149 / 4000 : ℝ) (by norm_num)
    (7 / 4) (HardyReal.hardy_GT phiBound) 512 (1 / 5000000000000000 : ℝ)
    (by norm_num) alias_tail_numeric

end
end Grothe.UpperChaos.DirectSample
