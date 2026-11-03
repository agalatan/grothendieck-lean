import Grothe.UpperChaos.Q0RegularSourceRowData
import Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource
import Grothe.UpperChaos.Q0SourceProfileRatio
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! One actual regular source row, with its original decoded binary64 centers.
All selected Gaussian coefficients are included, also beyond the stored cutoff.
The exact sparse fit, actual profile enclosure, and original-address binding
leave no numerical premises in the two error conclusions.
Uncompiled proof draft; Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0RegularSourceRow

open Q0RegularSourceRowData Q0GaussAddressScan Q0GaussOrdinalEquiv
open Q0GaussProductionMass Q0SourceExceptionCenters Q0SourceSavedLinearModel
open Q0SourceExceptionGeometry Q0SourceProfileRatio ConditionalNodeIndices
open Q0ConditionalSourceVector ZeroProfilePhaseStability

set_option maxRecDepth 8192
set_option maxHeartbeats 4000000

/-- Original source panel 135, Gauss rule index 2, in the order-six rule. -/
def address : Address :=
  ⟨⟨135, by decide +kernel⟩, ⟨2, by decide +kernel⟩⟩

theorem address_ordinal : (fromAddress address).val = 3818 := by
  decide +kernel

theorem address_regular : ¬ exceptionalPanel address.1.val := by
  norm_num [address, exceptionalPanel]

theorem row_valid : validRow row = true := by decide +kernel

theorem metadata_valid : Q0ConditionalMetadataCheck.valid metadata = true := by
  decide +kernel

theorem row_matches : matchesMetadata row metadata = true := by decide +kernel

private theorem metadata_mem_chunk :
    metadata ∈ Q0ConditionalMetadataGroup003.rows5 := by decide +kernel

private theorem metadata_mem_group :
    metadata ∈ Q0ConditionalMetadataGroup003.rows := by
  have h := metadata_mem_chunk
  simp only [Q0ConditionalMetadataGroup003.rows, List.mem_append]
  tauto

private theorem metadata_mem_all : metadata ∈ Q0ConditionalMetadataAll.rows := by
  have h := metadata_mem_group
  simp only [Q0ConditionalMetadataAll.rows, List.mem_append]
  tauto

/-- This literal metadata is the unique original row for the actual address. -/
theorem metadata_eq_rowAt : metadata = Q0ConditionalMetadataAll.rowAt address := by
  apply (Q0ConditionalMetadataAll.unique_row_for_address address).unique
  · exact ⟨metadata_mem_all, by simpa only [metadata] using address_ordinal.symm⟩
  · exact ⟨(Q0ConditionalMetadataAll.rowAt_spec address).1,
      (Q0ConditionalMetadataAll.rowAt_spec address).2.1⟩

theorem row_matches_source :
    matchesMetadata row (Q0ConditionalMetadataAll.rowAt address) = true := by
  rw [← metadata_eq_rowAt]
  exact row_matches

/-- The actual physical panel endpoints, not approximate node coordinates. -/
def profileRow : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get address.1).lo, (sourcePanels.get address.1).hi, false⟩

theorem profile_checked : rowAbsOK profileRow (1 / 10 ^ 15 : ℚ) = true := by
  decide +kernel

private theorem panel_lower_checked :
    (13 : ℚ) ≤ (sourcePanels.get address.1).lo := by decide +kernel

theorem fit_checked : |fitParameter row| < (1 / 10 ^ 15 : ℚ) := by
  decide +kernel

/-- The saved row is exactly the fitted three-mode linear model. -/
theorem model_error_checked : modelErrorSq row (fitParameter row) = 0 := by
  decide +kernel

noncomputable section

/-- Original binary64 values, with the original canonical-rank zero completion. -/
def center (p : ℕ × ℕ) : ℂ := storedModeCenter row p

/-- Completion at the actual row cutoff changes none of the selected centers. -/
theorem center_completion (p : ℕ × ℕ) (hp : p ∈ modes) :
    Q0ConditionalSourceError.completedCenter (fun _ => center) address p = center p := by
  rcases p with ⟨c, d⟩
  have hb := storage_bounds hp
  have h := storedModeCenter_completion row (Q0ConditionalMetadataAll.rowAt address)
    (Q0SourceExceptionPayload.original_metadata_valid address) row_matches_source
    c d hb.1 hb.2.1 hb.2.2.1 hb.2.2.2
  have hcut := (matchesMetadata_sound _ _ row_matches_source).2.2.2
  simpa only [Q0ConditionalSourceError.completedCenter,
    Q0ConditionalRetainedModes.retainedModes, Finset.mem_filter, hp, true_and,
    Q0ExceptionSupport.completed, hcut, center] using h

/-- The exact rational residual is the full 31,877-mode model discrepancy. -/
theorem model_error_sq_eq_zero :
    (∑ p ∈ modes, ‖linearCenter (fitParameter row : ℝ) p - center p‖ ^ 2) = 0 := by
  have h := modelErrorSq_sound row (Q0ConditionalMetadataAll.rowAt address)
    row_valid (Q0SourceExceptionPayload.original_metadata_valid address)
    row_matches_source (fitParameter row)
  simpa only [center, model_error_checked, Rat.cast_zero] using h

theorem source_ge_thirteen : (13 : ℝ) ≤ sourceNode address := by
  have h : (13 : ℝ) ≤ ((sourcePanels.get address.1).lo : ℝ) := by
    exact_mod_cast panel_lower_checked
  exact h.trans (source_node_mem_panel address).1

/-- Checked whole-panel arithmetic bounds the actual scaled physical profile. -/
theorem scaled_profile_abs_le :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode address)| ≤
      (1 / 10 ^ 15 : ℝ) := by
  have hn := source_node_mem_panel address
  exact row_scaled_profile_abs_le profileRow (sourceNode address) (1 / 10 ^ 15)
    hn.1 hn.2 profile_checked

theorem ratio_abs_le :
    |signedProfileRatio (sourceNode address)| ≤ (1 / (3 * 10 ^ 15) : ℝ) := by
  have h := ratio_abs_le_of_scaled_profile (sourceNode address) (1 / 10 ^ 15)
    source_ge_thirteen scaled_profile_abs_le
  norm_num at h ⊢
  exact h

theorem parameter_error_le :
    |signedProfileRatio (sourceNode address) - (fitParameter row : ℝ)| ≤
      (4 / (3 * 10 ^ 15) : ℝ) := by
  have hf : |(fitParameter row : ℝ)| ≤ (1 / 10 ^ 15 : ℝ) := by
    exact_mod_cast fit_checked.le
  have h := (abs_sub (signedProfileRatio (sourceNode address))
    (fitParameter row : ℝ)).trans (add_le_add ratio_abs_le hf)
  norm_num at h ⊢
  exact h

theorem linear_bounds : LinearRowBounds address center (fitParameter row : ℝ)
    (1 / (3 * 10 ^ 15)) (4 / (3 * 10 ^ 15)) 0 := by
  refine ⟨by norm_num, by norm_num, le_rfl, ratio_abs_le, parameter_error_le, ?_⟩
  rw [model_error_sq_eq_zero]
  norm_num

private theorem actual_error_sq_le_budget :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode address) p - center p‖ ^ 2) ≤
      (5 * (1 / (3 * 10 ^ 15) : ℝ) ^ 2 + 4 / (3 * 10 ^ 15)) ^ 2 := by
  simpa only [add_zero] using linear_row_error_sq_le address center
    (fitParameter row : ℝ) (1 / (3 * 10 ^ 15)) (4 / (3 * 10 ^ 15)) 0 linear_bounds

/-- Actual selected Gaussian coefficient error for one regular source row. -/
theorem actual_error_sq_lt :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode address) p - center p‖ ^ 2) <
      (2 / 10 ^ 15 : ℝ) ^ 2 :=
  actual_error_sq_le_budget.trans_lt (by norm_num)

/-- Coupled finite-Laplace-to-saved error, including every completed zero mode. -/
theorem finite_error_sq_lt :
    (∑ p ∈ modes,
      ‖Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p - center p‖ ^ 2) <
        (7 / 10 ^ 15 : ℝ) ^ 2 := by
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le modes
    (fun p => Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p -
      F0ConditionalNode.coefficient (sourceNode address) p)
    (fun p => center p - F0ConditionalNode.coefficient (sourceNode address) p)
    (5 / 10 ^ 15) (5 * (1 / (3 * 10 ^ 15) : ℝ) ^ 2 + 4 / (3 * 10 ^ 15))
    (by norm_num) (by norm_num)
    (by simpa only [norm_sub_rev] using
      Q0ConditionalFiniteLaplaceSource.actual_finite_error_sq_le address modes)
    (by simpa only [norm_sub_rev] using actual_error_sq_le_budget)
  have h' : (∑ p ∈ modes,
      ‖Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p - center p‖ ^ 2) ≤
      ((5 / 10 ^ 15 : ℝ) +
        (5 * (1 / (3 * 10 ^ 15) : ℝ) ^ 2 + 4 / (3 * 10 ^ 15))) ^ 2 := by
    simpa only [sub_sub_sub_cancel_right] using h
  exact h'.trans_lt (by norm_num)

/-- Exact single-row instance of the regular finite-source numerical premise. -/
theorem finite_completed_error_sq_le :
    (∑ p ∈ modes,
      ‖Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p -
        Q0ConditionalSourceError.completedCenter (fun _ => center) address p‖ ^ 2) ≤
          (19 / 10 ^ 11 : ℝ) ^ 2 := by
  have heq : (∑ p ∈ modes,
      ‖Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p -
        Q0ConditionalSourceError.completedCenter (fun _ => center) address p‖ ^ 2) =
      ∑ p ∈ modes,
        ‖Q0ConditionalFiniteLaplaceSource.finiteCoefficient address p - center p‖ ^ 2 := by
    apply Finset.sum_congr rfl
    intro p hp
    rw [center_completion p hp]
  rw [heq]
  exact finite_error_sq_lt.le.trans (by norm_num)

end
end Grothe.UpperChaos.Q0RegularSourceRow

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0RegularSourceRow.address_regular,
      ``Grothe.UpperChaos.Q0RegularSourceRow.metadata_eq_rowAt,
      ``Grothe.UpperChaos.Q0RegularSourceRow.center_completion,
      ``Grothe.UpperChaos.Q0RegularSourceRow.scaled_profile_abs_le,
      ``Grothe.UpperChaos.Q0RegularSourceRow.actual_error_sq_lt,
      ``Grothe.UpperChaos.Q0RegularSourceRow.finite_error_sq_lt,
      ``Grothe.UpperChaos.Q0RegularSourceRow.finite_completed_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
