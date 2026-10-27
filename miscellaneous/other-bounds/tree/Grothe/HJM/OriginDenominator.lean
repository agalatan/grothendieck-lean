import Grothe.HJM.OriginNonvanishing

/-!
# Uniform denominator margins for the origin responses

Agent-ID: codex-aa04.

The polynomial nonvanishing certificate and the constant imaginary parts of
the two affine factors give a common rational lower bound on both phase
denominators. This is uniform on the entire radial half-line, including zero;
it can be used in derivative and interval estimates without a compact-domain
minimum or an additional numerical certificate.
-/

namespace Grothe.HJM.Origin

open scoped ComplexConjugate

private lemma left_affine_norm_lower (s : ℝ) :
    (1 : ℝ) / 150 < ‖(s : ℂ) + (OriginData.delta : ℂ) * A‖ := by
  calc
    (1 : ℝ) / 150 < |((s : ℂ) + (OriginData.delta : ℂ) * A).im| := by
      norm_num [A, OriginData.delta, OriginData.aReal, OriginData.aImag]
    _ ≤ _ := Complex.abs_im_le_norm _

private lemma right_affine_norm_lower (s : ℝ) :
    (1 : ℝ) / 150 < ‖(s : ℂ) + (OriginData.delta : ℂ) * B‖ := by
  calc
    (1 : ℝ) / 150 < |((s : ℂ) + (OriginData.delta : ℂ) * B).im| := by
      norm_num [B, OriginData.delta, OriginData.bReal, OriginData.bImag]
    _ ≤ _ := Complex.abs_im_le_norm _

/-- A common exact rational margin for the left phase denominator. -/
theorem norm_leftNumerator_lower (s : ℝ) (hs : 0 ≤ s) :
    (1 : ℝ) / 250 < ‖leftNumerator s‖ := by
  have hp := norm_P_lower s hs
  have ha := left_affine_norm_lower s
  rw [leftNumerator, norm_mul]
  calc
    (1 : ℝ) / 250 = (3 / 5) * (1 / 150) := by norm_num
    _ < ‖P s‖ * (1 / 150) := mul_lt_mul_of_pos_right hp (by norm_num)
    _ < _ := mul_lt_mul_of_pos_left ha (lt_trans (by norm_num) hp)

/-- The unit-modulus prefactor and conjugation preserve the right margin. -/
theorem norm_rightNumerator_lower (s : ℝ) (hs : 0 ≤ s) :
    (1 : ℝ) / 250 < ‖rightNumerator s‖ := by
  have hp := norm_P_lower s hs
  have hb := right_affine_norm_lower s
  simp only [rightNumerator, norm_mul, norm_C, Complex.norm_conj, one_mul]
  calc
    (1 : ℝ) / 250 = (3 / 5) * (1 / 150) := by norm_num
    _ < ‖P s‖ * (1 / 150) := mul_lt_mul_of_pos_right hp (by norm_num)
    _ < _ := mul_lt_mul_of_pos_left hb (lt_trans (by norm_num) hp)

/-- Every reciprocal left phase denominator is bounded uniformly by 250. -/
theorem inv_norm_leftNumerator_le (s : ℝ) (hs : 0 ≤ s) :
    (‖leftNumerator s‖)⁻¹ ≤ 250 := by
  have h := (norm_leftNumerator_lower s hs).le
  have hn : 0 < ‖leftNumerator s‖ := lt_trans (by norm_num) (norm_leftNumerator_lower s hs)
  apply (inv_le_iff_one_le_mul₀ hn).2
  nlinarith

/-- Every reciprocal right phase denominator obeys the same bound. -/
theorem inv_norm_rightNumerator_le (s : ℝ) (hs : 0 ≤ s) :
    (‖rightNumerator s‖)⁻¹ ≤ 250 := by
  have h := (norm_rightNumerator_lower s hs).le
  have hn : 0 < ‖rightNumerator s‖ := lt_trans (by norm_num) (norm_rightNumerator_lower s hs)
  apply (inv_le_iff_one_le_mul₀ hn).2
  nlinarith

end Grothe.HJM.Origin
