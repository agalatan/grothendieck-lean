import Mathlib

/-!
# The strict endpoint comparison for the lower bound

`B = 2855097757/(4·10⁹)` is the certified operator-norm cap of the Gaussian witness
`T = P₁,₀ − ε P₂,₁` (`ε = 7400323787/10¹⁰`); `K_G^ℂ ≥ 1/B` together with the exact comparison
`(7005014084/(5·10⁹)) · B < 1` gives the strict lower bound `K_G^ℂ > 1.4010028168`.
-/

namespace Grothe.Lower

/-- The certified operator-norm cap. -/
def Bcap : ℚ := 2855097757 / 4000000000

/-- The strict lower endpoint. -/
def Llow : ℚ := 7005014084 / 5000000000

theorem LB_lt_one : Llow * Bcap < 1 := by norm_num [Llow, Bcap]

/-- The exact slack of the comparison. -/
theorem LB_slack : 1 - Llow * Bcap = 254547603 / 5000000000000000000 := by
  norm_num [Llow, Bcap]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpoint (K : ℝ) (hK : (1 : ℝ) / Bcap ≤ K) : (Llow : ℝ) < K := by
  have hB : (0 : ℝ) < Bcap := by norm_num [Bcap]
  have h1 : (Llow : ℝ) * Bcap < 1 := by exact_mod_cast LB_lt_one
  calc (Llow : ℝ) = (Llow * Bcap) / Bcap := by field_simp
    _ < 1 / Bcap := by gcongr
    _ ≤ K := hK

end Grothe.Lower
