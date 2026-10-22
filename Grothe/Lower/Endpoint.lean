import Mathlib

/-!
# The strict endpoint comparison for the lower bound

`B = 356710999933/(5·10¹¹) = 0.713421999866` is the certified operator-norm cap of the Gaussian
witness `T = P₁,₀ − ε P₂,₁` (`ε = 149/200`); `K_G^ℂ ≥ 1/B` together with the exact comparison
`(350423732443/(25·10¹⁰)) · B < 1` (slack `3417073681/(125·10²¹)`) gives the strict lower bound
`K_G^ℂ > 1.401694929772`.
-/

namespace Grothe.Lower

/-- The certified operator-norm cap. -/
def Bcap : ℚ := 356710999933 / 500000000000

/-- The strict lower endpoint. -/
def Llow : ℚ := 350423732443 / 250000000000

theorem LB_lt_one : Llow * Bcap < 1 := by norm_num [Llow, Bcap]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpoint (K : ℝ) (hK : (1 : ℝ) / Bcap ≤ K) : (Llow : ℝ) < K := by
  have hB : (0 : ℝ) < Bcap := by norm_num [Bcap]
  have h1 : (Llow : ℝ) * Bcap < 1 := by exact_mod_cast LB_lt_one
  calc (Llow : ℝ) = (Llow * Bcap) / Bcap := by field_simp
    _ < 1 / Bcap := by gcongr
    _ ≤ K := hK

end Grothe.Lower
