import Grothe.UpperChaos.Q0NearZeroSourceData
import Grothe.UpperChaos.Q0NearZeroSourceProfile
import Grothe.UpperChaos.Q0NearZeroSourceRow
import Mathlib.Data.List.Nodup
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Near-zero saved rows at their actual source addresses

Agent-ID: codex-aa04.

The generated ordinal list selects 1,837 saved rows in three source blocks.
Its 1,420 regular rows are included without changing their original addresses;
the same pointwise conclusions also hold for the selected exceptional rows.
The metadata match binds ordinal, offsets and cutoff. The profile theorem is
evaluated at the actual source node, and every error sum retains all selected
canonical modes, including those zero-completed in the saved approximation.

No error conclusion is made at addresses outside the three selected ranges.
-/

namespace Grothe.UpperChaos.Q0NearZeroSource

open Q0GaussAddress Q0GaussAddressScan Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourceExceptionCenters Q0SourceSavedLinearModel ConditionalNodeIndices
open Q0NearZeroSourceProfile Q0ConditionalFiniteLaplaceSource

set_option maxRecDepth 65536
set_option maxHeartbeats 4000000

/-- Half-open ordinal intervals in the original complete source ordering. -/
def selectedOrdinal (n : ℕ) : Prop :=
  (3469 ≤ n ∧ n < 4457) ∨
    (10710 ≤ n ∧ n < 11239) ∨
      (17223 ≤ n ∧ n < 17543)

instance (n : ℕ) : Decidable (selectedOrdinal n) := by
  unfold selectedOrdinal
  infer_instance

local instance (p : ℕ) : Decidable (nearZeroPanel p) := by
  unfold nearZeroPanel
  infer_instance

def selectedIndices : List ℕ :=
  List.range' 3469 988 ++ (List.range' 10710 529 ++ List.range' 17223 320)

theorem selectedOrdinal_iff_mem (n : ℕ) :
    selectedOrdinal n ↔ n ∈ selectedIndices := by
  simp only [selectedOrdinal, selectedIndices, List.mem_append, List.mem_range'_1]

/-- The three disjoint ranges give a unique saved row, without a quadratic
decidable duplicate scan over the generated payload. -/
theorem selectedIndices_nodup : selectedIndices.Nodup := by
  have h12 : List.Disjoint (List.range' 3469 988)
      (List.range' 10710 529 ++ List.range' 17223 320) := by
    apply List.disjoint_left.mpr
    intro n hn hm
    simp only [List.mem_range'_1, List.mem_append] at hn hm
    omega
  have h23 : List.Disjoint (List.range' 10710 529) (List.range' 17223 320) := by
    apply List.disjoint_left.mpr
    intro n hn hm
    simp only [List.mem_range'_1] at hn hm
    omega
  exact List.nodup_append'.mpr ⟨List.nodup_range' _,
    List.nodup_append'.mpr ⟨List.nodup_range' _, List.nodup_range' _, h23⟩, h12⟩

/-- A panel either belongs to a checked physical profile block or its entire
half-open ordinal interval is disjoint from every selected ordinal range. -/
def panelGeometryOK (p : Fin sourcePanels.length) : Bool :=
  decide (nearZeroPanel p.val ∨
    (((sourcePanels.get p).offset + (sourcePanels.get p).order ≤ 3469 ∨
        4457 ≤ (sourcePanels.get p).offset) ∧
      ((sourcePanels.get p).offset + (sourcePanels.get p).order ≤ 10710 ∨
        11239 ≤ (sourcePanels.get p).offset) ∧
      ((sourcePanels.get p).offset + (sourcePanels.get p).order ≤ 17223 ∨
        17543 ≤ (sourcePanels.get p).offset)))

/-- Only the original finite integer panel/rule geometry is checked here. -/
theorem panel_geometry_checked :
    (List.finRange sourcePanels.length).all panelGeometryOK = true := by
  decide +kernel

/-- Every selected actual source address lies in a checked profile block. -/
theorem source_panel_selected (a : Address)
    (ha : selectedOrdinal (fromAddress a).val) : nearZeroPanel a.1.val := by
  have hp := (List.all_eq_true.mp panel_geometry_checked) a.1 (List.mem_finRange a.1)
  have hg : nearZeroPanel a.1.val ∨
      (((sourcePanels.get a.1).offset + (sourcePanels.get a.1).order ≤ 3469 ∨
          4457 ≤ (sourcePanels.get a.1).offset) ∧
        ((sourcePanels.get a.1).offset + (sourcePanels.get a.1).order ≤ 10710 ∨
          11239 ≤ (sourcePanels.get a.1).offset) ∧
        ((sourcePanels.get a.1).offset + (sourcePanels.get a.1).order ≤ 17223 ∨
          17543 ≤ (sourcePanels.get a.1).offset)) := of_decide_eq_true hp
  rcases hg with hg | hg
  · exact hg
  · have hj := a.2.isLt
    change selectedOrdinal ((sourcePanels.get a.1).offset + a.2.val) at ha
    simp only [selectedOrdinal] at ha
    omega

/-- Coverage and uniqueness refer to original ordinals, not a renumbered table. -/
theorem unique_row (n : ℕ) (hn : selectedOrdinal n) :
    ∃! r : Row, r ∈ Q0NearZeroSourceData.rows ∧ r.ordinal = n := by
  have hindices : Q0NearZeroSourceData.rows.map Row.ordinal = selectedIndices := by
    simpa only [selectedIndices, List.append_assoc] using Q0NearZeroSourceData.ordinals
  have hm : n ∈ Q0NearZeroSourceData.rows.map Row.ordinal := by
    rw [hindices]
    exact (selectedOrdinal_iff_mem n).mp hn
  obtain ⟨r, hr, heq⟩ := List.mem_map.mp hm
  have hnodup : (Q0NearZeroSourceData.rows.map Row.ordinal).Nodup := by
    rw [hindices]
    exact selectedIndices_nodup
  refine ⟨r, ⟨hr, heq⟩, ?_⟩
  intro other ho
  exact List.inj_on_of_nodup_map hnodup ho.1 hr (ho.2.trans heq.symm)

noncomputable section

def rowAt (a : Address) (ha : selectedOrdinal (fromAddress a).val) : Row :=
  Classical.choose (unique_row (fromAddress a).val ha).exists

theorem rowAt_spec (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    rowAt a ha ∈ Q0NearZeroSourceData.rows ∧
      (rowAt a ha).ordinal = (fromAddress a).val :=
  Classical.choose_spec (unique_row (fromAddress a).val ha).exists

theorem rowAt_valid (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    validRow (rowAt a ha) = true :=
  (List.all_eq_true.mp Q0NearZeroSourceData.all_valid) _ (rowAt_spec a ha).1

theorem rowAt_fit (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    |fitParameter (rowAt a ha)| ≤ (2 / 10 ^ 11 : ℚ) ∧
      modelErrorSq (rowAt a ha) (fitParameter (rowAt a ha)) ≤
        (2 / 10 ^ 22 : ℚ) ^ 2 :=
  Q0NearZeroSourceCheck.rowOK_sound (rowAt a ha)
    ((List.all_eq_true.mp Q0NearZeroSourceData.all_fit) _ (rowAt_spec a ha).1)

/-- The metadata witness must equal the unique original row for this address. -/
theorem rowAt_matches (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    matchesMetadata (rowAt a ha) (Q0ConditionalMetadataAll.rowAt a) = true := by
  obtain ⟨m, hm, hmatch⟩ := Q0NearZeroSourceData.each_row_source
    (rowAt a ha) (rowAt_spec a ha).1
  have hi : m.index = (fromAddress a).val :=
    (matchesMetadata_sound _ _ hmatch).1.symm.trans (rowAt_spec a ha).2
  have heq : m = Q0ConditionalMetadataAll.rowAt a :=
    (Q0ConditionalMetadataAll.unique_row_for_address a).unique
      ⟨hm, hi⟩ ⟨(Q0ConditionalMetadataAll.rowAt_spec a).1,
        (Q0ConditionalMetadataAll.rowAt_spec a).2.1⟩
  simpa only [heq] using hmatch

/-- Saved approximation at selected original addresses, with a total-function
default elsewhere. No approximation claim is made about that default. -/
def savedCenter (a : Address) (p : ℕ × ℕ) : ℂ :=
  if ha : selectedOrdinal (fromAddress a).val then
    storedModeCenter (rowAt a ha) p
  else 0

theorem savedCenter_eq (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    savedCenter a = storedModeCenter (rowAt a ha) := by
  funext p
  simp only [savedCenter, dite_eq_left ha]

theorem source_profile_abs_le (a : Address)
    (ha : selectedOrdinal (fromAddress a).val) :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      (1 / 10 ^ 10 : ℝ) := by
  simpa only [profileBound, Rat.cast_div, Rat.cast_pow, Rat.cast_one, Rat.cast_ofNat]
    using source_scaled_profile_abs_le a (source_panel_selected a ha)

/-- Actual selected Gaussian coefficients versus the decoded saved centers. -/
theorem actual_error_sq_lt (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    (∑ p ∈ modes,
      ‖F0ConditionalNode.coefficient (sourceNode a) p - savedCenter a p‖ ^ 2) <
        (6 / 10 ^ 11 : ℝ) ^ 2 := by
  have hf := rowAt_fit a ha
  simpa only [savedCenter_eq a ha] using
    Q0NearZeroSourceRow.actual_error_sq_lt a (rowAt a ha)
      (Q0ConditionalMetadataAll.rowAt a) rfl (rowAt_valid a ha) (rowAt_matches a ha)
      (source_ge_13 a (source_panel_selected a ha)) (source_profile_abs_le a ha)
      hf.1 hf.2

/-- One coupled finite-Laplace-to-saved bound on every selected mode. -/
theorem finite_error_sq_lt (a : Address) (ha : selectedOrdinal (fromAddress a).val) :
    (∑ p ∈ modes, ‖finiteCoefficient a p - savedCenter a p‖ ^ 2) <
      (6 / 10 ^ 11 : ℝ) ^ 2 := by
  have hf := rowAt_fit a ha
  simpa only [savedCenter_eq a ha] using
    Q0NearZeroSourceRow.finite_error_sq_lt a (rowAt a ha)
      (Q0ConditionalMetadataAll.rowAt a) rfl (rowAt_valid a ha) (rowAt_matches a ha)
      (source_ge_13 a (source_panel_selected a ha)) (source_profile_abs_le a ha)
      hf.1 hf.2

/-- The original cutoff completion leaves the selected saved vector unchanged. -/
theorem savedCenter_completion (a : Address)
    (ha : selectedOrdinal (fromAddress a).val) (p : ℕ × ℕ) (hp : p ∈ modes) :
    Q0ConditionalSourceError.completedCenter savedCenter a p = savedCenter a p := by
  simpa only [Q0ConditionalSourceError.completedCenter, savedCenter_eq a ha] using
    Q0NearZeroSourceRow.completed_storedModeCenter a (rowAt a ha)
      (Q0ConditionalMetadataAll.rowAt a) rfl (rowAt_matches a ha) p hp

/-- Concrete near-zero rows discharge the regular finite-source row allowance.
Regular consumers may restrict these addresses without changing the proof. -/
theorem finite_completed_error_sq_le (a : Address)
    (ha : selectedOrdinal (fromAddress a).val) :
    (∑ p ∈ modes,
      ‖finiteCoefficient a p -
        Q0ConditionalSourceError.completedCenter savedCenter a p‖ ^ 2) ≤
        (19 / 10 ^ 11 : ℝ) ^ 2 := by
  have hf := rowAt_fit a ha
  simpa only [Q0ConditionalSourceError.completedCenter, savedCenter_eq a ha] using
    Q0NearZeroSourceRow.finite_completed_error_sq_le a (rowAt a ha)
      (Q0ConditionalMetadataAll.rowAt a) rfl (rowAt_valid a ha) (rowAt_matches a ha)
      (source_ge_13 a (source_panel_selected a ha)) (source_profile_abs_le a ha)
      hf.1 hf.2

end
end Grothe.UpperChaos.Q0NearZeroSource

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0NearZeroSource.source_panel_selected,
      ``Grothe.UpperChaos.Q0NearZeroSource.unique_row,
      ``Grothe.UpperChaos.Q0NearZeroSource.rowAt_matches,
      ``Grothe.UpperChaos.Q0NearZeroSource.actual_error_sq_lt,
      ``Grothe.UpperChaos.Q0NearZeroSource.finite_error_sq_lt,
      ``Grothe.UpperChaos.Q0NearZeroSource.savedCenter_completion,
      ``Grothe.UpperChaos.Q0NearZeroSource.finite_completed_error_sq_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
