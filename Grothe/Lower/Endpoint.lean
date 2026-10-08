import Mathlib

/-!
# The strict endpoint comparison for the lower bound

`B = 3569353321/5000000000` is the certified operator-norm cap; `K_G^ℂ ≥ 1/B` and the exact
comparison `(1400813971/10⁹) · B < 1` give the strict lower bound `K_G^ℂ > 1.400813971`.
-/

namespace Grothe.Lower

/-- The certified operator-norm cap. -/
def Bcap : ℚ := 3569353321 / 5000000000

/-- The advertised strict lower endpoint. -/
def Llow : ℚ := 1400813971 / 1000000000

theorem one_sub_LB : 1 - Llow * Bcap = 507952309 / 5000000000000000000 := by
  norm_num [Llow, Bcap]

theorem LB_lt_one : Llow * Bcap < 1 := by norm_num [Llow, Bcap]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpoint (K : ℝ) (hK : (1 : ℝ) / Bcap ≤ K) : (Llow : ℝ) < K := by
  have hB : (0 : ℝ) < Bcap := by norm_num [Bcap]
  have h1 : (Llow : ℝ) * Bcap < 1 := by exact_mod_cast LB_lt_one
  calc (Llow : ℝ) = (Llow * Bcap) / Bcap := by field_simp
    _ < 1 / Bcap := by gcongr
    _ ≤ K := hK

end Grothe.Lower
