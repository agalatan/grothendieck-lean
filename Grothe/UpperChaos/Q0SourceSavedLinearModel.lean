import Grothe.UpperChaos.Q0ConditionalSourceVector
import Grothe.UpperChaos.Q0SourceExceptionPayload
import Mathlib.Data.Rat.BigOperators
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Exact saved-row comparison with the sparse conditional model

The exceptional payload is decoded as rational scalars at its original
canonical storage ranks. Its discrepancy from the three-mode linear model is
computed on the existing five-mode support. The equality below accounts for
all selected modes: only the stored approximation and the model vanish outside
that support. The true Gaussian coefficients are still bounded by the analytic
remainder. Physical ratio and parameter enclosures remain explicit inputs.
Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0SourceSavedLinearModel

open Q0SourceExceptionCenters Q0ExceptionSupport ConditionalNodeIndices
open ZeroProfilePhaseStability Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourceExceptionGeometry Q0SourceExceptionPayload

/-- The exact rational scalar used by the existing complex payload lookup. -/
def storedScalar (row : Row) (p : ℕ × ℕ) : ℚ :=
  if h : Q0ConditionalPairRankCheck.rank p.1 p.2 < row.words.length then
    center row ⟨Q0ConditionalPairRankCheck.rank p.1 p.2, h⟩
  else 0

/-- Rational form of the constant and two linear model coordinates. -/
def linearCenterQ (r : ℚ) (p : ℕ × ℕ) : ℚ :=
  (if p = (0, 0) then 1 else 0) + (r / 2) *
    ((if p = (1, 0) then 1 else 0) - (if p = (0, 1) then 1 else 0))

/-- One coupled squared error, calculated with exact rational arithmetic.
The support is the established five-mode set, with its original storage ranks. -/
def modelErrorSq (row : Row) (r : ℚ) : ℚ :=
  ∑ p ∈ lowModes, (linearCenterQ r p - storedScalar row p) ^ 2

/-- The exact least-squares parameter of the decoded two linear coordinates.
This is a rational saved-data quantity, not the actual physical profile ratio. -/
def fitParameter (row : Row) : ℚ :=
  storedScalar row (1, 0) - storedScalar row (0, 1)

theorem modelErrorSq_nonneg (row : Row) (r : ℚ) : 0 ≤ modelErrorSq row r := by
  unfold modelErrorSq
  exact Finset.sum_nonneg fun _ _ => sq_nonneg _

/-- Exact residual at the saved row's fitted parameter. The same five support
coordinates are used, including both degree-two coordinates. -/
theorem modelErrorSq_fitParameter (row : Row) :
    modelErrorSq row (fitParameter row) =
      (1 - storedScalar row (0, 0)) ^ 2 +
        (storedScalar row (1, 0) + storedScalar row (0, 1)) ^ 2 / 2 +
        storedScalar row (0, 2) ^ 2 + storedScalar row (1, 1) ^ 2 := by
  norm_num [modelErrorSq, lowModes, linearCenterQ, fitParameter]
  ring

/-- Every other scalar model parameter adds this exact nonnegative cost.
The fitting identity does not certify a physical parameter enclosure. -/
theorem modelErrorSq_eq_fit_add (row : Row) (r : ℚ) :
    modelErrorSq row r = modelErrorSq row (fitParameter row) +
      (r - fitParameter row) ^ 2 / 2 := by
  norm_num [modelErrorSq, lowModes, linearCenterQ, fitParameter]
  ring

theorem storedScalar_cast (row : Row) (p : ℕ × ℕ) :
    (storedScalar row p : ℂ) = storedModeCenter row p := by
  by_cases h : Q0ConditionalPairRankCheck.rank p.1 p.2 < row.words.length
  · simp only [storedScalar, storedModeCenter, dite_eq_left h]
  · simp only [storedScalar, storedModeCenter, dite_eq_right h, Rat.cast_zero]

theorem linearCenterQ_cast (r : ℚ) (p : ℕ × ℕ) :
    (linearCenterQ r p : ℂ) = linearCenter (r : ℝ) p := by
  simp [linearCenterQ, linearCenter, apply_ite]

/-- The five support modes are all included in the actual contraction selection. -/
theorem lowModes_subset_modes : lowModes ⊆ modes := by
  intro p hp
  have h := (mem_lowModes p.1 p.2).mp hp
  apply (mem_modes p.1 p.2).mpr
  constructor <;> omega

private theorem linearCenter_zero_outside_lowModes
    (r : ℝ) (p : ℕ × ℕ) (hp : p ∉ lowModes) : linearCenter r p = 0 := by
  have h00 : p ≠ (0, 0) := by
    intro h
    apply hp
    simp [h, lowModes]
  have h10 : p ≠ (1, 0) := by
    intro h
    apply hp
    simp [h, lowModes]
  have h01 : p ≠ (0, 1) := by
    intro h
    apply hp
    simp [h, lowModes]
  simp [linearCenter, h00, h10, h01]

/-- The actual decoded payload is zero-completed outside its saved cutoff.
This conclusion concerns only the approximation, not the true coefficient. -/
theorem storedModeCenter_zero_outside_lowModes
    (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hvalid : validRow row = true)
    (hm : Q0ConditionalMetadataCheck.valid metadata = true)
    (hmatch : matchesMetadata row metadata = true)
    (p : ℕ × ℕ) (hp : p ∈ modes) (hout : p ∉ lowModes) :
    storedModeCenter row p = 0 := by
  have hb := storage_bounds hp
  have hcut : ¬ p.1 + p.2 ≤ row.cutoff := by
    intro h
    exact hout ((mem_lowModes p.1 p.2).mpr
      ⟨hb.2.2.1, h.trans (validRow_cutoff_le_two row hvalid)⟩)
  have hr : ¬ Q0ConditionalPairRankCheck.rank p.1 p.2 < row.words.length := by
    intro h
    exact hcut ((retained_iff_cutoff row metadata hm hmatch p.1 p.2
      hb.1 hb.2.1 hb.2.2.1 hb.2.2.2).mp h)
  simp only [storedModeCenter, dite_eq_right hr]

/-- The full selected model-to-payload error reduces exactly to the five
support modes, without an entry-count estimate or omitted-coordinate premise. -/
theorem model_sum_eq_lowModes
    (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hvalid : validRow row = true)
    (hm : Q0ConditionalMetadataCheck.valid metadata = true)
    (hmatch : matchesMetadata row metadata = true) (r : ℝ) :
    (∑ p ∈ modes, ‖linearCenter r p - storedModeCenter row p‖ ^ 2) =
      ∑ p ∈ lowModes, ‖linearCenter r p - storedModeCenter row p‖ ^ 2 := by
  classical
  symm
  apply Finset.sum_subset lowModes_subset_modes
  intro p hp hout
  rw [linearCenter_zero_outside_lowModes r p hout,
    storedModeCenter_zero_outside_lowModes row metadata hvalid hm hmatch p hp hout]
  norm_num

/-- Exact rational replay agrees with the coupled complex squared norm on
all five support coordinates. -/
theorem modelErrorSq_cast (row : Row) (r : ℚ) :
    (modelErrorSq row r : ℝ) =
      ∑ p ∈ lowModes, ‖linearCenter (r : ℝ) p - storedModeCenter row p‖ ^ 2 := by
  rw [modelErrorSq, Rat.cast_sum]
  apply Finset.sum_congr rfl
  intro p _
  rw [Rat.cast_pow, ← linearCenterQ_cast r p, ← storedScalar_cast row p,
    ← Rat.cast_sub (α := ℂ) (linearCenterQ r p) (storedScalar row p),
    Complex.norm_ratCast, sq_abs]

/-- A rational five-mode calculation equals the error over every selected
canonical mode for a row matched to the actual source metadata. -/
theorem modelErrorSq_sound
    (row : Row) (metadata : Q0ConditionalMetadataCheck.Row)
    (hvalid : validRow row = true)
    (hm : Q0ConditionalMetadataCheck.valid metadata = true)
    (hmatch : matchesMetadata row metadata = true) (r : ℚ) :
    (∑ p ∈ modes, ‖linearCenter (r : ℝ) p - storedModeCenter row p‖ ^ 2) =
      (modelErrorSq row r : ℝ) := by
  rw [model_sum_eq_lowModes row metadata hvalid hm hmatch]
  exact (modelErrorSq_cast row r).symm

/-- Bind the exact five-mode calculation to the decoded exceptional row at
this actual source address, retaining its ordinal, cutoff and storage ranks. -/
theorem source_model_error_eq
    (a : Address) (ha : exceptionalPanel a.1.val) (r : ℚ) :
    (∑ p ∈ modes, ‖linearCenter (r : ℝ) p - sourceCenter a ha p‖ ^ 2) =
      (modelErrorSq (Q0SourceExceptionPayload.rowAt a ha) r : ℝ) := by
  exact modelErrorSq_sound (Q0SourceExceptionPayload.rowAt a ha)
    (Q0ConditionalMetadataAll.rowAt a) (rowAt_valid a ha)
    (original_metadata_valid a) (rowAt_matches a ha) r

/-- Construct the existing whole-vector row interface from actual physical
parameter enclosures and a rational calculation of the decoded saved row.
No per-entry tolerance is used as a vector radius. -/
theorem source_linearRowBounds
    (a : Address) (ha : exceptionalPanel a.1.val)
    (r ε : ℚ) (ρ η : ℝ) (hρ : 0 ≤ ρ) (hη : 0 ≤ η) (hε : 0 ≤ ε)
    (hratio : |signedProfileRatio (sourceNode a)| ≤ ρ)
    (hparameter : |signedProfileRatio (sourceNode a) - (r : ℝ)| ≤ η)
    (hmodel : modelErrorSq (Q0SourceExceptionPayload.rowAt a ha) r ≤ ε ^ 2) :
    Q0ConditionalSourceVector.LinearRowBounds a (sourceCenter a ha)
      (r : ℝ) ρ η (ε : ℝ) := by
  refine ⟨hρ, hη, ?_, hratio, hparameter, ?_⟩
  · exact_mod_cast hε
  · rw [source_model_error_eq]
    exact_mod_cast hmodel

/-- The resulting estimate concerns the actual Gaussian coefficients against
the decoded source payload. Physical ratio and parameter estimates and the
exact rational saved-row budget remain explicit certificate inputs. -/
theorem source_actual_error_sq_le
    (a : Address) (ha : exceptionalPanel a.1.val)
    (r ε : ℚ) (ρ η : ℝ) (hρ : 0 ≤ ρ) (hη : 0 ≤ η) (hε : 0 ≤ ε)
    (hratio : |signedProfileRatio (sourceNode a)| ≤ ρ)
    (hparameter : |signedProfileRatio (sourceNode a) - (r : ℝ)| ≤ η)
    (hmodel : modelErrorSq (Q0SourceExceptionPayload.rowAt a ha) r ≤ ε ^ 2) :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode a) p -
      sourceCenter a ha p‖ ^ 2) ≤ (5 * ρ ^ 2 + η + (ε : ℝ)) ^ 2 :=
  Q0ConditionalSourceVector.linear_row_error_sq_le a (sourceCenter a ha)
    (r : ℝ) ρ η (ε : ℝ)
    (source_linearRowBounds a ha r ε ρ η hρ hη hε hratio hparameter hmodel)

end Grothe.UpperChaos.Q0SourceSavedLinearModel

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceSavedLinearModel.modelErrorSq_nonneg,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.modelErrorSq_fitParameter,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.modelErrorSq_eq_fit_add,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.model_sum_eq_lowModes,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.modelErrorSq_sound,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.source_model_error_eq,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.source_linearRowBounds,
      ``Grothe.UpperChaos.Q0SourceSavedLinearModel.source_actual_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
