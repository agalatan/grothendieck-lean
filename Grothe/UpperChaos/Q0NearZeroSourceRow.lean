import Grothe.UpperChaos.Q0ConditionalFiniteLaplaceSource
import Grothe.UpperChaos.Q0SourceProfileRatio
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Reusable certificate for a near-zero source row

Agent-ID: codex-aa04.

The finite checks supply one saved row, its original metadata, a rational
fit bound and a rational coupled residual bound. A block profile certificate
supplies the physical profile bound and the lower bound on the actual source
node. The analytic proof is shared by every row. All sums use the complete
selected mode set, including modes beyond the stored cutoff.

The fixed wrapper uses profile <= 1e-10, |fit| <= 2e-11 and model residual
norm <= 2e-22. Both actual-to-saved and finite-to-saved radii are below 6e-11;
the completed-center theorem therefore fits the existing 1.9e-10 allowance.
No statement below asserts that omitted true Gaussian coefficients vanish.
-/

namespace Grothe.UpperChaos.Q0NearZeroSourceRow

open Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourceExceptionCenters Q0SourceSavedLinearModel Q0SourceProfileRatio
open ConditionalNodeIndices Q0ConditionalSourceVector ZeroProfilePhaseStability
open Q0ConditionalFiniteLaplaceSource

noncomputable section

/-- A saved row already has the actual source cutoff, on every selected mode. -/
theorem completed_storedModeCenter
    (a : Address) (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hmetadata : metadata = Q0ConditionalMetadataAll.rowAt a)
    (hmatch : matchesMetadata row metadata = true)
    (p : ℕ × ℕ) (hp : p ∈ modes) :
    Q0ConditionalSourceError.completedCenter (fun _ => storedModeCenter row) a p =
      storedModeCenter row p := by
  have hmatch' : matchesMetadata row (Q0ConditionalMetadataAll.rowAt a) = true := by
    simpa only [hmetadata] using hmatch
  rcases p with ⟨c, d⟩
  have hb := storage_bounds hp
  have h := storedModeCenter_completion row (Q0ConditionalMetadataAll.rowAt a)
    (Q0SourceExceptionPayload.original_metadata_valid a) hmatch'
    c d hb.1 hb.2.1 hb.2.2.1 hb.2.2.2
  have hcut := (matchesMetadata_sound _ _ hmatch').2.2.2
  simpa only [Q0ConditionalSourceError.completedCenter,
    Q0ConditionalRetainedModes.retainedModes, Finset.mem_filter, hp, true_and,
    Q0ExceptionSupport.completed, hcut] using h

/-- Rational row certificates construct the existing coupled analytic interface.
The residual is one squared vector norm, not a per-coordinate error allowance. -/
theorem linear_bounds_of_certificates
    (a : Address) (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hmetadata : metadata = Q0ConditionalMetadataAll.rowAt a)
    (hvalid : validRow row = true)
    (hmatch : matchesMetadata row metadata = true)
    (B F E : ℚ) (hE : 0 ≤ E)
    (hsource : (13 : ℝ) ≤ sourceNode a)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      (B : ℝ))
    (hfit : |fitParameter row| ≤ F)
    (hmodel : modelErrorSq row (fitParameter row) ≤ E ^ 2) :
    LinearRowBounds a (storedModeCenter row) (fitParameter row : ℝ)
      ((B : ℝ) / 3) ((B : ℝ) / 3 + (F : ℝ)) (E : ℝ) := by
  have hmatch' : matchesMetadata row (Q0ConditionalMetadataAll.rowAt a) = true := by
    simpa only [hmetadata] using hmatch
  have hB : (0 : ℝ) ≤ (B : ℝ) := (abs_nonneg _).trans hprofile
  have hfitR : |(fitParameter row : ℝ)| ≤ (F : ℝ) := by
    have hc : ((|fitParameter row| : ℚ) : ℝ) ≤ (F : ℝ) := Rat.cast_le.mpr hfit
    simpa only [Rat.cast_abs] using hc
  have hF : (0 : ℝ) ≤ (F : ℝ) := (abs_nonneg _).trans hfitR
  have hER : (0 : ℝ) ≤ (E : ℝ) := Rat.cast_nonneg.mpr hE
  have hratio := ratio_abs_le_of_scaled_profile (sourceNode a) (B : ℝ)
    hsource hprofile
  have hparameter : |signedProfileRatio (sourceNode a) - (fitParameter row : ℝ)| ≤
      (B : ℝ) / 3 + (F : ℝ) :=
    (abs_sub _ _).trans (add_le_add hratio hfitR)
  refine ⟨div_nonneg hB (by norm_num),
    add_nonneg (div_nonneg hB (by norm_num)) hF, hER, hratio, hparameter, ?_⟩
  rw [modelErrorSq_sound row (Q0ConditionalMetadataAll.rowAt a) hvalid
    (Q0SourceExceptionPayload.original_metadata_valid a) hmatch' (fitParameter row)]
  have hc : (modelErrorSq row (fitParameter row) : ℝ) ≤ ((E ^ 2 : ℚ) : ℝ) :=
    Rat.cast_le.mpr hmodel
  simpa only [Rat.cast_pow] using hc

/-- Shared actual-to-saved radius for the fixed near-zero block certificates. -/
def gaussianRadius : ℝ :=
  5 * ((1 / 10 ^ 10 : ℝ) / 3) ^ 2 +
    ((1 / 10 ^ 10 : ℝ) / 3 + 2 / 10 ^ 11) + 2 / 10 ^ 22

theorem gaussianRadius_nonneg : 0 ≤ gaussianRadius := by
  norm_num [gaussianRadius]

theorem gaussianRadius_sq_lt : gaussianRadius ^ 2 < (6 / 10 ^ 11 : ℝ) ^ 2 := by
  norm_num [gaussianRadius]

theorem finiteRadius_sq_lt :
    ((5 / 10 ^ 15 : ℝ) + gaussianRadius) ^ 2 < (6 / 10 ^ 11 : ℝ) ^ 2 := by
  norm_num [gaussianRadius]

section FixedCaps

variable (a : Address) (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hmetadata : metadata = Q0ConditionalMetadataAll.rowAt a)
    (hvalid : validRow row = true)
    (hmatch : matchesMetadata row metadata = true)
    (hsource : (13 : ℝ) ≤ sourceNode a)
    (hprofile : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      (1 / 10 ^ 10 : ℝ))
    (hfit : |fitParameter row| ≤ (2 / 10 ^ 11 : ℚ))
    (hmodel : modelErrorSq row (fitParameter row) ≤ (2 / 10 ^ 22 : ℚ) ^ 2)

include metadata hmetadata hvalid hmatch hsource hprofile hfit hmodel

/-- The analytic remainder is charged once for the full selected vector. -/
theorem actual_error_sq_le_budget :
    (∑ p ∈ modes,
      ‖F0ConditionalNode.coefficient (sourceNode a) p - storedModeCenter row p‖ ^ 2) ≤
        gaussianRadius ^ 2 := by
  have hp : |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      ((1 / 10 ^ 10 : ℚ) : ℝ) := by
    simpa only [Rat.cast_div, Rat.cast_pow, Rat.cast_one, Rat.cast_ofNat] using hprofile
  have hb := linear_bounds_of_certificates a row metadata hmetadata hvalid hmatch
    (1 / 10 ^ 10) (2 / 10 ^ 11) (2 / 10 ^ 22) (by norm_num)
    hsource hp hfit hmodel
  have h := linear_row_error_sq_le a (storedModeCenter row) (fitParameter row : ℝ)
    (((1 / 10 ^ 10 : ℚ) : ℝ) / 3)
    (((1 / 10 ^ 10 : ℚ) : ℝ) / 3 + ((2 / 10 ^ 11 : ℚ) : ℝ))
    ((2 / 10 ^ 22 : ℚ) : ℝ) hb
  simpa only [gaussianRadius, Rat.cast_div, Rat.cast_pow, Rat.cast_one, Rat.cast_ofNat] using h

/-- Actual selected Gaussian coefficients versus the complete saved row. -/
theorem actual_error_sq_lt :
    (∑ p ∈ modes,
      ‖F0ConditionalNode.coefficient (sourceNode a) p - storedModeCenter row p‖ ^ 2) <
        (6 / 10 ^ 11 : ℝ) ^ 2 :=
  (actual_error_sq_le_budget a row metadata hmetadata hvalid hmatch
    hsource hprofile hfit hmodel).trans_lt gaussianRadius_sq_lt

/-- The reverse comparison pays the existing actual-to-finite radius once. -/
theorem finite_error_sq_lt :
    (∑ p ∈ modes,
      ‖finiteCoefficient a p - storedModeCenter row p‖ ^ 2) <
        (6 / 10 ^ 11 : ℝ) ^ 2 := by
  have hactual := actual_error_sq_le_budget a row metadata hmetadata hvalid hmatch
    hsource hprofile hfit hmodel
  have h := Q0FiniteVectorError.sum_norm_sub_sq_le modes
    (fun p => finiteCoefficient a p - F0ConditionalNode.coefficient (sourceNode a) p)
    (fun p => storedModeCenter row p - F0ConditionalNode.coefficient (sourceNode a) p)
    (5 / 10 ^ 15) gaussianRadius (by norm_num) gaussianRadius_nonneg
    (by simpa only [norm_sub_rev] using actual_finite_error_sq_le a modes)
    (by simpa only [norm_sub_rev] using hactual)
  have hfinite : (∑ p ∈ modes, ‖finiteCoefficient a p - storedModeCenter row p‖ ^ 2) ≤
      ((5 / 10 ^ 15 : ℝ) + gaussianRadius) ^ 2 := by
    simpa only [sub_sub_sub_cancel_right] using h
  exact hfinite.trans_lt finiteRadius_sq_lt

/-- The completed saved approximation meets the regular finite-source allowance.
Every selected mode remains in the error sum, including completed zero modes. -/
theorem finite_completed_error_sq_le :
    (∑ p ∈ modes,
      ‖finiteCoefficient a p -
        Q0ConditionalSourceError.completedCenter
          (fun _ => storedModeCenter row) a p‖ ^ 2) ≤
        (19 / 10 ^ 11 : ℝ) ^ 2 := by
  have heq : (∑ p ∈ modes,
      ‖finiteCoefficient a p -
        Q0ConditionalSourceError.completedCenter
          (fun _ => storedModeCenter row) a p‖ ^ 2) =
      ∑ p ∈ modes, ‖finiteCoefficient a p - storedModeCenter row p‖ ^ 2 := by
    apply Finset.sum_congr rfl
    intro p hp
    rw [completed_storedModeCenter a row metadata hmetadata hmatch p hp]
  rw [heq]
  exact (finite_error_sq_lt a row metadata hmetadata hvalid hmatch
    hsource hprofile hfit hmodel).le.trans (by norm_num)

end FixedCaps
end
end Grothe.UpperChaos.Q0NearZeroSourceRow

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0NearZeroSourceRow.completed_storedModeCenter,
      ``Grothe.UpperChaos.Q0NearZeroSourceRow.linear_bounds_of_certificates,
      ``Grothe.UpperChaos.Q0NearZeroSourceRow.actual_error_sq_lt,
      ``Grothe.UpperChaos.Q0NearZeroSourceRow.finite_error_sq_lt,
      ``Grothe.UpperChaos.Q0NearZeroSourceRow.finite_completed_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
