import Grothe.UpperChaos.PhiCover
import Grothe.UpperChaos.Rounder
import Grothe.UpperChaos.PhiCoverCheck
import Grothe.UpperChaos.LocalizedComparison

/-!
# `|φ| < 1` everywhere, and the upper bound with only the numerical comparisons left

`phiT_sq_le : φ² ≤ 99/100` from the cover (`walk_sound` on the 64 cubes, `phi_cubes_ok`) on `U + V < 60`
and the far field (`far_sound`); hence `phi_abs_lt_one : |φ| < 1` (the input of the comparison argument)
and `phiBound : PhiBound`. The sharp upper bound for the concrete rounding is in
`GroupedRounder.lean`; its Hardy input is proved (`HardyReal.hardy_GT`).
-/

open GrotheKernel Grothe.Upper
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

lemma phaseEps_eq : ((phaseEpsQ : ℚ) : ℝ) = 21 / 20 := by
  simp [phaseEpsQ]

/-- `φ² = g(U, V, W)`. -/
lemma phiT_sq (u : ℂ × ℂ) :
    phiT u ^ 2 = gphi phaseTerms (‖u.1‖ ^ 2) (‖u.2‖ ^ 2) (conj u.1 * u.2).re := by
  have hD : (conj u.1 * u.2).im ^ 2 = ‖u.1‖ ^ 2 * ‖u.2‖ ^ 2 - (conj u.1 * u.2).re ^ 2 := by
    have h := Complex.normSq_apply (conj u.1 * u.2)
    rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
      Complex.normSq_eq_norm_sq] at h
    nlinarith [h]
  unfold phiT gphi
  rw [phaseEps_eq]
  have he : Real.exp (-(21 / 20) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) ^ 2
      = Real.exp (-(21 / 10) * (‖u.1‖ ^ 2 + ‖u.2‖ ^ 2)) := by
    rw [← Real.exp_nat_mul]; congr 1; push_cast; ring
  rw [mul_pow, mul_pow, hD, he]
  rfl

/-- **The phase cover**: `φ² ≤ 99/100` everywhere. -/
theorem phiT_sq_le (u : ℂ × ℂ) : phiT u ^ 2 ≤ 99 / 100 := by
  obtain ⟨hts, hfar, hcubes⟩ := phi_cubes_ok
  rw [phiT_sq]
  set U := ‖u.1‖ ^ 2
  set V := ‖u.2‖ ^ 2
  set W := (conj u.1 * u.2).re
  have hU : 0 ≤ U := by positivity
  have hV : 0 ≤ V := by positivity
  have hW2 : W ^ 2 ≤ U * V := by
    have h := Complex.normSq_apply (conj u.1 * u.2)
    rw [Complex.normSq_mul, Complex.normSq_conj, Complex.normSq_eq_norm_sq,
      Complex.normSq_eq_norm_sq] at h
    nlinarith [sq_nonneg (conj u.1 * u.2).im]
  rcases lt_or_ge (U + V) 60 with h60 | h60
  · have hroot : InBox rootBox U V W := by
      have hS : (0 : ℝ) < (2 : ℝ) ^ SC := by positivity
      have hUV : U * V ≤ 900 := by nlinarith [sq_nonneg (U - V)]
      have hWs : |W| ≤ 30 := by
        rw [abs_le]; constructor <;> nlinarith
      obtain ⟨hW1, hW2'⟩ := abs_le.1 hWs
      simp only [InBox, rootBox]
      push_cast
      refine ⟨by positivity, by nlinarith, by positivity, by nlinarith, by nlinarith, by nlinarith⟩
    obtain ⟨b, hb, hin⟩ := splitAll_cover phiSplit (by simp [phiSplit]) rootBox hroot
    obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem hb
    have hlen : (splitAll phiSplit rootBox).length = 512 := by
      rw [length_splitAll]; rfl
    have hc := hcubes i (by rw [hlen] at hi; exact hi)
    simp only [phiCubeOK, beq_iff_eq] at hc
    rw [List.getD_eq_getElem _ _ hi] at hc
    have := walk_sound hts 100 _ _ [] hc U V W hin hW2 h60
    norm_num [tN, tD] at this
    exact this
  · exact (far_sound hts hfar hU hV hW2 h60).trans (by norm_num)

/-- **`|φ| < 1` everywhere** (the multiplication by `iφ` has norm `< 1`). -/
theorem phi_abs_lt_one (u : ℂ × ℂ) : |phiT u| < 1 := by
  have h := phiT_sq_le u
  rw [← sq_lt_one_iff_abs_lt_one]
  linarith

/-- The phase cover in the form used by the rounding. -/
theorem phiBound : PhiBound := phiT_sq_le


end

end Grothe.UpperChaos
