import Grothe.UpperChaos.Q0LegendreRootInjective

/-! Interior roots from exact integer endpoints on a positive common scale.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0LegendreInteger

theorem interior_of_integer_bracket (lo hi D : ℤ) (hD : 0 < D)
    (hlo : -D < lo) (hhi : hi < D) {x : ℝ}
    (hx : x ∈ Set.Icc ((lo : ℝ) / D) ((hi : ℝ) / D)) : |x| < 1 := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have hloR : -(D : ℝ) < lo := by exact_mod_cast hlo
  have hhiR : (hi : ℝ) < D := by exact_mod_cast hhi
  have hleft : (-1 : ℝ) < (lo : ℝ) / D := by
    apply (lt_div_iff₀ hDr).2
    linarith
  have hright : (hi : ℝ) / D < 1 := by
    apply (div_lt_iff₀ hDr).2
    linarith
  exact abs_lt.mpr ⟨lt_of_lt_of_le hleft hx.1, lt_of_le_of_lt hx.2 hright⟩

end Grothe.UpperChaos.Q0LegendreInteger
