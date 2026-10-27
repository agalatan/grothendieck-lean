import Grothe.HJM.OriginResponse
import Grothe.HJM.OriginNonvanishingData
import Grothe.Lower.Poly

/-!
# A finite polynomial proof of nonvanishing of the HJM origin numerator

Agent-ID: codex-aa04.

The exact polynomial `Re(P)^2 + Im(P)^2 - 37/100` is nonnegative on nine
intervals covering `[0,32]`. Its shift by `32` has nonnegative coefficients,
which covers the entire remaining half-line. The existing rational Bernstein
checker and Taylor-shift soundness supply the real-variable implications.
All finite checks below are kernel reductions; there is no numerical integral
or new native fact in this proof.
-/

namespace Grothe.HJM.Origin

open Grothe.Lower Grothe.Upper

set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

private theorem gap_panel_0_1 :
    posCert OriginNonvanishingData.gap 0 1 = true := by decide +kernel

private theorem gap_panel_1_2 :
    posCert OriginNonvanishingData.gap 1 2 = true := by decide +kernel

private theorem gap_panel_2_4 :
    posCert OriginNonvanishingData.gap 2 4 = true := by decide +kernel

private theorem gap_panel_4_8 :
    posCert OriginNonvanishingData.gap 4 8 = true := by decide +kernel

private theorem gap_panel_8_16 :
    posCert OriginNonvanishingData.gap 8 16 = true := by decide +kernel

private theorem gap_panel_16_24 :
    posCert OriginNonvanishingData.gap 16 24 = true := by decide +kernel

private theorem gap_panel_24_28 :
    posCert OriginNonvanishingData.gap 24 28 = true := by decide +kernel

private theorem gap_panel_28_30 :
    posCert OriginNonvanishingData.gap 28 30 = true := by decide +kernel

private theorem gap_panel_30_32 :
    posCert OriginNonvanishingData.gap 30 32 = true := by decide +kernel

private theorem gap_tail :
    taylorNonneg OriginNonvanishingData.gap 32 = true := by decide +kernel

private theorem gap_nonneg (s : ℝ) (hs : 0 ≤ s) :
    0 ≤ evalL (OriginNonvanishingData.gap.map ((↑) : ℚ → ℝ)) s := by
  by_cases h1 : s ≤ 1
  · exact posCert_sound _ 0 1 gap_panel_0_1 s (by norm_num; exact hs)
      (by norm_num; exact h1)
  by_cases h2 : s ≤ 2
  · exact posCert_sound _ 1 2 gap_panel_1_2 s (by norm_num; linarith)
      (by norm_num; exact h2)
  by_cases h4 : s ≤ 4
  · exact posCert_sound _ 2 4 gap_panel_2_4 s (by norm_num; linarith)
      (by norm_num; exact h4)
  by_cases h8 : s ≤ 8
  · exact posCert_sound _ 4 8 gap_panel_4_8 s (by norm_num; linarith)
      (by norm_num; exact h8)
  by_cases h16 : s ≤ 16
  · exact posCert_sound _ 8 16 gap_panel_8_16 s (by norm_num; linarith)
      (by norm_num; exact h16)
  by_cases h24 : s ≤ 24
  · exact posCert_sound _ 16 24 gap_panel_16_24 s (by norm_num; linarith)
      (by norm_num; exact h24)
  by_cases h28 : s ≤ 28
  · exact posCert_sound _ 24 28 gap_panel_24_28 s (by norm_num; linarith)
      (by norm_num; exact h28)
  by_cases h30 : s ≤ 30
  · exact posCert_sound _ 28 30 gap_panel_28_30 s (by norm_num; linarith)
      (by norm_num; exact h30)
  by_cases h32 : s ≤ 32
  · exact posCert_sound _ 30 32 gap_panel_30_32 s (by norm_num; linarith)
      (by norm_num; exact h32)
  exact taylor_sound _ 32 gap_tail s (by norm_num; linarith)

private theorem gap_eval (s : ℝ) :
    evalL (OriginNonvanishingData.gap.map ((↑) : ℚ → ℝ)) s =
      (ofListQ OriginData.pReal).eval s ^ 2 +
      (ofListQ OriginData.pImag).eval s ^ 2 - 37 / 100 := by
  norm_num [OriginNonvanishingData.gap, OriginData.pReal, OriginData.pImag,
    ofListQ, evalL]
  ring

/-- A rational squared-norm margin for every nonnegative radial parameter. -/
theorem norm_P_sq_lower (s : ℝ) (hs : 0 ≤ s) : (37 : ℝ) / 100 ≤ ‖P s‖ ^ 2 := by
  have h := gap_nonneg s hs
  rw [gap_eval] at h
  have hn : ‖P s‖ ^ 2 = (ofListQ OriginData.pReal).eval s ^ 2 +
      (ofListQ OriginData.pImag).eval s ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]
    simp [P, pow_two]
  rw [hn]
  linarith

/-- The original HJM nonvanishing margin, with a stronger squared-norm certificate. -/
theorem norm_P_lower (s : ℝ) (hs : 0 ≤ s) : (3 : ℝ) / 5 < ‖P s‖ := by
  have h := norm_P_sq_lower s hs
  nlinarith [norm_nonneg (P s)]

/-- The radial phase denominator never vanishes on the full half-line. -/
theorem P_ne_zero (s : ℝ) (hs : 0 ≤ s) : P s ≠ 0 := by
  intro h
  have hn := norm_P_lower s hs
  norm_num [h] at hn

end Grothe.HJM.Origin
