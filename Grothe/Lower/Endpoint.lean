import Mathlib

/-!
# The strict endpoint comparison for the lower bound

`B = 71352729/10⁸` is the certified operator-norm cap of the Gaussian witness
`T = P₁,₀ − ε P₂,₁` (`ε = 149/200`); `K_G^ℂ ≥ 1/B` together with the exact comparison
`(140148809/10⁸) · B < 1` gives the strict lower bound `K_G^ℂ > 1.40148809`.
-/

namespace Grothe.Lower

/-- The certified operator-norm cap. -/
def Bcap : ℚ := 71352729 / 100000000

/-- The strict lower endpoint. -/
def Llow : ℚ := 140148809 / 100000000

theorem LB_lt_one : Llow * Bcap < 1 := by norm_num [Llow, Bcap]

/-- From `K ≥ 1/B` to the strict decimal endpoint. -/
theorem lower_endpoint (K : ℝ) (hK : (1 : ℝ) / Bcap ≤ K) : (Llow : ℝ) < K := by
  have hB : (0 : ℝ) < Bcap := by norm_num [Bcap]
  have h1 : (Llow : ℝ) * Bcap < 1 := by exact_mod_cast LB_lt_one
  calc (Llow : ℝ) = (Llow * Bcap) / Bcap := by field_simp
    _ < 1 / Bcap := by gcongr
    _ ≤ K := hK

end Grothe.Lower
