import Mathlib

/-!
# The strict endpoint comparison for the lower bound

`B = 3567129/(5·10⁶) = 0.7134258` is the certified operator-norm cap of the Gaussian witness
`T = P₁,₀ − ε P₂,₁` (`ε = 149/200`); `K_G^ℂ ≥ 1/B` together with the exact comparison
`(1401687463503/10¹²) · B < 1` (slack `2007113/(5·10¹⁸)`) gives the strict lower bound
`K_G^ℂ > 1.401687463503`.
-/

namespace Grothe.Lower

/-- The certified operator-norm cap. -/
def Bcap : ℚ := 3567129 / 5000000

/-- The strict lower endpoint. -/
def Llow : ℚ := 1401687463503 / 1000000000000

theorem LB_lt_one : Llow * Bcap < 1 := by norm_num [Llow, Bcap]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpoint (K : ℝ) (hK : (1 : ℝ) / Bcap ≤ K) : (Llow : ℝ) < K := by
  have hB : (0 : ℝ) < Bcap := by norm_num [Bcap]
  have h1 : (Llow : ℝ) * Bcap < 1 := by exact_mod_cast LB_lt_one
  calc (Llow : ℝ) = (Llow * Bcap) / Bcap := by field_simp
    _ < 1 / Bcap := by gcongr
    _ ≤ K := hK

end Grothe.Lower
