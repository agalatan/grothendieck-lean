import Grothe.UpperChaos.Q0SourceProfileRatio
import Grothe.UpperChaos.Q0SourcePanelOrderAll
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Actual profile bounds on the exceptional source panels

Three centered interval calculations cover the original exceptional panel
blocks. The interval endpoints are taken directly from the actual source
panel list. The resulting physical profile bound discharges the remaining
inputs of the decoded saved-row comparison, for every exceptional source node.
The conclusion controls all selected Gaussian coefficients, including those
outside the stored cutoff. Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0SourceExceptionProfile

open Q0GaussAddressScan Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourcePanelOrder Q0SourceExceptionGeometry Q0SourceProfileRatio
open Q0SourceExceptionPayload ConditionalNodeIndices

set_option maxRecDepth 8192
set_option maxHeartbeats 4000000

/-- A common exact cap for the scaled physical profile on all three blocks. -/
def profileBound : ℚ := 1 / (2 * 10 ^ 14)

/-- The entire first exceptional block, using its actual source endpoints. -/
def block0 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨146, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨274, by decide +kernel⟩).hi, false⟩

/-- The entire second exceptional block, using its actual source endpoints. -/
def block1 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨557, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨684, by decide +kernel⟩).hi, false⟩

/-- The entire third exceptional block, using its actual source endpoints. -/
def block2 : ProfileRootScreen.Row :=
  ⟨(sourcePanels.get ⟨964, by decide +kernel⟩).lo,
    (sourcePanels.get ⟨1087, by decide +kernel⟩).hi, false⟩

/-- Exact centered interval arithmetic on the first original panel block. -/
theorem block0_checked : rowAbsOK block0 profileBound = true := by
  decide +kernel

/-- Exact centered interval arithmetic on the second original panel block. -/
theorem block1_checked : rowAbsOK block1 profileBound = true := by
  decide +kernel

/-- Exact centered interval arithmetic on the third original panel block. -/
theorem block2_checked : rowAbsOK block2 profileBound = true := by
  decide +kernel

private theorem panel_upper_mono (i j : Fin sourcePanels.length)
    (hij : i.val ≤ j.val) :
    (sourcePanels.get i).hi ≤ (sourcePanels.get j).hi := by
  rcases eq_or_lt_of_le hij with heq | hlt
  · have h : i = j := Fin.ext heq
    subst j
    exact le_rfl
  · have hs := panel_hi_le_of_index_lt i j hlt
    have hj : (sourcePanels.get j).lo ≤ (sourcePanels.get j).hi := by
      exact_mod_cast (source_panel_lt j).le
    exact hs.trans hj

/-- An actual node in an indexed panel block lies between its outer endpoints. -/
private theorem source_node_mem_block (a : Address)
    (first last : Fin sourcePanels.length)
    (hfirst : first.val ≤ a.1.val) (hlast : a.1.val ≤ last.val) :
    sourceNode a ∈ Set.Icc ((sourcePanels.get first).lo : ℝ)
      ((sourcePanels.get last).hi : ℝ) := by
  have hlo : ((sourcePanels.get first).lo : ℝ) ≤
      ((sourcePanels.get a.1).lo : ℝ) := by
    exact_mod_cast panel_lower_mono first a.1 hfirst
  have hhi : ((sourcePanels.get a.1).hi : ℝ) ≤
      ((sourcePanels.get last).hi : ℝ) := by
    exact_mod_cast panel_upper_mono a.1 last hlast
  exact ⟨hlo.trans (source_node_mem_panel a).1,
    (source_node_mem_panel a).2.trans hhi⟩

/-- Every exceptional actual source node satisfies the checked physical cap.
No interval-membership or numerical enclosure premise is supplied by a caller. -/
theorem source_scaled_profile_abs_le (a : Address)
    (ha : exceptionalPanel a.1.val) :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      (profileBound : ℝ) := by
  rcases ha with ha | ha | ha
  · have hn := source_node_mem_block a
      ⟨146, by decide +kernel⟩ ⟨274, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block0 (sourceNode a) profileBound
      hn.1 hn.2 block0_checked
  · have hn := source_node_mem_block a
      ⟨557, by decide +kernel⟩ ⟨684, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block1 (sourceNode a) profileBound
      hn.1 hn.2 block1_checked
  · have hn := source_node_mem_block a
      ⟨964, by decide +kernel⟩ ⟨1087, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block2 (sourceNode a) profileBound
      hn.1 hn.2 block2_checked

/-- Whole selected-vector error for the actual Gaussian response and the
same decoded source row. All physical and saved-data estimates are discharged. -/
theorem source_actual_error_sq_lt (a : Address)
    (ha : exceptionalPanel a.1.val) :
    (∑ p ∈ modes, ‖F0ConditionalNode.coefficient (sourceNode a) p -
      sourceCenter a ha p‖ ^ 2) < (3 / 10 ^ 15 : ℝ) ^ 2 := by
  have h := source_actual_error_sq_le_of_profile a ha (profileBound : ℝ)
    (source_scaled_profile_abs_le a ha)
  exact h.trans_lt (by norm_num [profileBound])

end Grothe.UpperChaos.Q0SourceExceptionProfile

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0SourceExceptionProfile.block0_checked,
      ``Grothe.UpperChaos.Q0SourceExceptionProfile.block1_checked,
      ``Grothe.UpperChaos.Q0SourceExceptionProfile.block2_checked,
      ``Grothe.UpperChaos.Q0SourceExceptionProfile.source_scaled_profile_abs_le,
      ``Grothe.UpperChaos.Q0SourceExceptionProfile.source_actual_error_sq_lt] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
