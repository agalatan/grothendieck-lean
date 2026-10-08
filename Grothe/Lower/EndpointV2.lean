import Mathlib

/-!
# The strict endpoint comparison for the lower bound, version 2

`B = 7138283181/10000000000` is the version-2 certified operator-norm cap; `K_G^ℂ ≥ 1/B` and
the exact comparison `(14008970709/10¹⁰) · B < 1` give the strict lower bound
`K_G^ℂ > 1.4008970709`.
-/

namespace Grothe.Lower

/-- The version-2 certified operator-norm cap. -/
def BcapV2 : ℚ := 7138283181 / 10000000000

/-- The version-2 strict lower endpoint. -/
def LlowV2 : ℚ := 14008970709 / 10000000000

theorem LBV2_lt_one : LlowV2 * BcapV2 < 1 := by norm_num [LlowV2, BcapV2]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpointV2 (K : ℝ) (hK : (1 : ℝ) / BcapV2 ≤ K) : (LlowV2 : ℝ) < K := by
  have hB : (0 : ℝ) < BcapV2 := by norm_num [BcapV2]
  have h1 : (LlowV2 : ℝ) * BcapV2 < 1 := by exact_mod_cast LBV2_lt_one
  calc (LlowV2 : ℝ) = (LlowV2 * BcapV2) / BcapV2 := by field_simp
    _ < 1 / BcapV2 := by gcongr
    _ ≤ K := hK

end Grothe.Lower
