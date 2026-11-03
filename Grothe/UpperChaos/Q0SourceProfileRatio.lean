import Grothe.UpperChaos.ProfileRootSound
import Grothe.UpperChaos.Q0SourceSavedLinearChecks
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Actual profile enclosures feed the exceptional source-node error bound.

The centered evaluator is already connected to the normalized physical profile.
Its finite endpoint check therefore bounds the actual signed phase parameter,
including at profile zeros. The saved parameter and coupled saved-model error
come from the decoded payload checks. The physical interval check and coverage
remain explicit here; no numerical Gaussian enclosure is assumed.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceProfileRatio

open GrotheKernel ProfileRootScreen Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourceExceptionGeometry Q0SourceExceptionPayload Q0SourceSavedLinearModel
open ConditionalNodeIndices ZeroProfilePhaseStability

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

/-- Exceptional source geometry supplies the radial lower bound. -/
theorem source_ratio_abs_le (a : Address) (ha : exceptionalPanel a.1.val) (B : ℝ)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) *
      vprof (sourceNode a)| ≤ B) :
    |signedProfileRatio (sourceNode a)| ≤ B / 3 :=
  ratio_abs_le_of_scaled_profile (sourceNode a) B
    (exception_source_ge_13 a ha) hprofile

/-- The fitted saved scalar has already been checked on all decoded rows.
Triangle inequality turns one physical radius into its model-parameter error. -/
theorem source_parameter_error_le
    (a : Address) (ha : exceptionalPanel a.1.val) (R : ℝ)
    (hratio : |signedProfileRatio (sourceNode a)| ≤ R) :
    |signedProfileRatio (sourceNode a) -
      (fitParameter (Q0SourceExceptionPayload.rowAt a ha) : ℝ)| ≤
        R + 1 / 10 ^ 15 := by
  have hfit : |(fitParameter (Q0SourceExceptionPayload.rowAt a ha) : ℝ)| ≤
      (1 / 10 ^ 15 : ℝ) := by
    exact_mod_cast (Q0SourceSavedLinearChecks.source_fit_checked a ha).1.le
  exact (abs_sub _ _).trans (add_le_add hratio hfit)

/-- The two physical fields of the saved-row consumer follow from a single
actual scaled-profile bound. The decoded coupled model error is already checked. -/
theorem source_linearRowBounds_of_profile
    (a : Address) (ha : exceptionalPanel a.1.val) (B : ℝ)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) *
      vprof (sourceNode a)| ≤ B) :
    Q0ConditionalSourceVector.LinearRowBounds a (sourceCenter a ha)
      (fitParameter (Q0SourceExceptionPayload.rowAt a ha) : ℝ)
      (B / 3) (B / 3 + 1 / 10 ^ 15) (1 / 10 ^ 31 : ℝ) := by
  have hr := source_ratio_abs_le a ha B hprofile
  exact Q0SourceSavedLinearChecks.source_linearRowBounds a ha
    (B / 3) (B / 3 + 1 / 10 ^ 15) hr
    (source_parameter_error_le a ha (B / 3) hr)

/-- Actual selected Gaussian coefficient error against the exact decoded row.
The only remaining input here is an enclosure of the actual physical profile. -/
theorem source_actual_error_sq_le_of_profile
    (a : Address) (ha : exceptionalPanel a.1.val) (B : ℝ)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) *
      vprof (sourceNode a)| ≤ B) :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode a) p -
      sourceCenter a ha p‖ ^ 2) ≤
        (5 * (B / 3) ^ 2 + (B / 3 + 1 / 10 ^ 15) + 1 / 10 ^ 31) ^ 2 := by
  have hr := source_ratio_abs_le a ha B hprofile
  exact Q0SourceSavedLinearChecks.source_actual_error_sq_le a ha
    (B / 3) (B / 3 + 1 / 10 ^ 15) hr
    (source_parameter_error_le a ha (B / 3) hr)

/-- A checked rational interval containing the physical source node supplies
all physical premises of the selected-vector error estimate. -/
theorem source_actual_error_sq_le_of_row
    (a : Address) (ha : exceptionalPanel a.1.val)
    (r : ProfileRootScreen.Row) (B : ℚ)
    (hlo : (r.lo : ℝ) ≤ sourceNode a) (hhi : sourceNode a ≤ (r.hi : ℝ))
    (hcheck : rowAbsOK r B = true) :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode a) p -
      sourceCenter a ha p‖ ^ 2) ≤
        (5 * ((B : ℝ) / 3) ^ 2 + ((B : ℝ) / 3 + 1 / 10 ^ 15) +
          1 / 10 ^ 31) ^ 2 :=
  source_actual_error_sq_le_of_profile a ha (B : ℝ)
    (row_scaled_profile_abs_le r (sourceNode a) B hlo hhi hcheck)

end Grothe.UpperChaos.Q0SourceProfileRatio

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceProfileRatio.row_scaled_profile_abs_le,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.ratio_abs_le_of_scaled_profile,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.source_ratio_abs_le,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.source_parameter_error_le,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.source_linearRowBounds_of_profile,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.source_actual_error_sq_le_of_profile,
      ``Grothe.UpperChaos.Q0SourceProfileRatio.source_actual_error_sq_le_of_row] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
