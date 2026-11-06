import Grothe.UpperChaos.ProfileRootSound
import Grothe.UpperChaos.ZeroProfilePhaseStability

/-!
# Physical profile and signed-ratio bounds from interval certificates

The centered profile evaluator bounds the physical profile on every point of a rational
interval. Beyond squared radius 13 this gives the signed-ratio bound, without importing the
saved coefficient rows or the source-node reconstruction.

Agent-ID: codex-2f3d. Refs #334, #41.
-/

namespace Grothe.UpperChaos.Q0SourceProfileRatio

open GrotheKernel ProfileRootScreen ZeroProfilePhaseStability

/-- A rational absolute bound for the centered fixed-point profile interval.
The row's `inner` flag is irrelevant to this check. -/
def rowAbsOK (r : ProfileRootScreen.Row) (B : ℚ) : Bool :=
  decide (-B * (D : ℚ) ≤ ((evalRow r).lo : ℚ) ∧
    ((evalRow r).hi : ℚ) ≤ B * (D : ℚ))

private theorem abs_le_of_interval_mem (x : ℝ) (I : Ival) (B : ℚ)
    (hx : Grothe.Upper.mem x I)
    (hlo : -B * (D : ℚ) ≤ (I.lo : ℚ))
    (hhi : (I.hi : ℚ) ≤ B * (D : ℚ)) : |x| ≤ (B : ℝ) := by
  have hl : -(B : ℝ) * (D : ℝ) ≤ (I.lo : ℝ) := by exact_mod_cast hlo
  have hu : (I.hi : ℝ) ≤ (B : ℝ) * (D : ℝ) := by exact_mod_cast hhi
  exact abs_le.mpr
    ⟨le_of_mul_le_mul_right (hl.trans hx.1) Grothe.Upper.D_pos,
      le_of_mul_le_mul_right (hx.2.trans hu) Grothe.Upper.D_pos⟩

/-- The interval calculation bounds the actual scaled profile on the whole
specified rational interval, using the proved centered-profile identity. -/
theorem row_scaled_profile_abs_le
    (r : ProfileRootScreen.Row) (s : ℝ) (B : ℚ)
    (hlo : (r.lo : ℝ) ≤ s) (hhi : s ≤ (r.hi : ℝ))
    (hcheck : rowAbsOK r B = true) :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| ≤ (B : ℝ) := by
  have hc : -B * (D : ℚ) ≤ ((evalRow r).lo : ℚ) ∧
      ((evalRow r).hi : ℚ) ≤ B * (D : ℚ) := by
    exact of_decide_eq_true hcheck
  have hm : Grothe.Upper.mem
      (Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s) (evalRow r) := by
    simpa only [centered_horner_profile] using row_horner_mem r s hlo hhi
  exact abs_le_of_interval_mem _ _ B hm hc.1 hc.2

/-- Beyond squared radius 13, the square-root denominator is at least 3.
This estimate needs no sign or nonzero assumption on the profile. -/
theorem ratio_abs_le_of_scaled_profile (s B : ℝ) (hs : 13 ≤ s)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| ≤ B) :
    |signedProfileRatio s| ≤ B / 3 := by
  have hs0 : 0 < s := by linarith
  have hB : 0 ≤ B := (abs_nonneg _).trans hprofile
  have hsqrt : (3 : ℝ) ≤ Real.sqrt s := by
    calc
      (3 : ℝ) = Real.sqrt ((3 : ℝ) ^ 2) := (Real.sqrt_sq (by norm_num)).symm
      _ ≤ Real.sqrt s := Real.sqrt_le_sqrt (by nlinarith)
  rw [signedProfileRatio, abs_div, abs_of_nonneg (Real.sqrt_nonneg s)]
  apply (div_le_iff₀ (Real.sqrt_pos.2 hs0)).mpr
  calc
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof s| ≤ B := hprofile
    _ = B / 3 * 3 := by ring
    _ ≤ B / 3 * Real.sqrt s :=
      mul_le_mul_of_nonneg_left hsqrt (div_nonneg hB (by norm_num))

end Grothe.UpperChaos.Q0SourceProfileRatio
