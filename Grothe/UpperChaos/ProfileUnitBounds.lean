import Grothe.UpperChaos.ProfileRootSound

/-! Bounds for the actual normalized profile on the unit interval.

The centered Horner enclosure is checked by kernel reduction and transported
to `sqrt (1 + aQ^2) * vprof` by the profile soundness theorem.
Agent-ID: codex-b7f2.
-/

namespace Grothe.UpperChaos

namespace ProfileRootScreen

/-- The single interval needed for the profile near the Gaussian origin. -/
def unitRow : Row := ⟨0, 1, false⟩

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
/-- Exact strict bounds on the fixed-point enclosure for the unit interval. -/
theorem unit_row_checked :
    3 * GrotheKernel.D < 10 * (evalRow unitRow).lo ∧
      3 * (evalRow unitRow).hi < GrotheKernel.D := by
  decide +kernel

/-- The unit-row enclosure contains the actual normalized profile. -/
theorem profile_unit_mem (s : ℝ) (h0 : 0 ≤ s) (h1 : s ≤ 1) :
    Grothe.Upper.mem
      (Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s)
      (evalRow unitRow) := by
  have h := row_horner_mem unitRow s
    (by simpa only [unitRow, Rat.cast_zero] using h0)
    (by simpa only [unitRow, Rat.cast_one] using h1)
  simpa only [centered_horner_profile] using h

end ProfileRootScreen

/-- The actual normalized profile lies strictly between `3/10` and `1/3`
throughout the unit interval. No numerical enclosure is assumed. -/
theorem profile_unit_bounds (s : ℝ) (h0 : 0 ≤ s) (h1 : s ≤ 1) :
    (3 / 10 : ℝ) < Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s ∧
      Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s < 1 / 3 := by
  let y : ℝ := Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof s
  have hm : Grothe.Upper.mem y (ProfileRootScreen.evalRow ProfileRootScreen.unitRow) :=
    ProfileRootScreen.profile_unit_mem s h0 h1
  have hlo : (3 : ℝ) * GrotheKernel.D <
      10 * ((ProfileRootScreen.evalRow ProfileRootScreen.unitRow).lo : ℝ) := by
    exact_mod_cast ProfileRootScreen.unit_row_checked.1
  have hhi : (3 : ℝ) *
      ((ProfileRootScreen.evalRow ProfileRootScreen.unitRow).hi : ℝ) < GrotheKernel.D := by
    exact_mod_cast ProfileRootScreen.unit_row_checked.2
  have hD : 0 < (GrotheKernel.D : ℝ) := Grothe.Upper.D_pos
  unfold Grothe.Upper.mem at hm
  change 3 / 10 < y ∧ y < 1 / 3
  constructor
  · by_contra h
    have ht : (10 * y - 3) * GrotheKernel.D ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
    nlinarith [hm.1]
  · by_contra h
    have ht : (1 - 3 * y) * GrotheKernel.D ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (by linarith) hD.le
    nlinarith [hm.2]

end Grothe.UpperChaos
