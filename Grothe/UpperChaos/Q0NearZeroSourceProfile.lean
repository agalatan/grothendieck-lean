import Grothe.UpperChaos.Q0NearZeroProfileIntervals
import Grothe.UpperChaos.Q0SourceProfileRatio
import Grothe.UpperChaos.Q0SourceExceptionGeometry
import Grothe.UpperChaos.Q0SourcePanelOrderAll
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-!
# Actual profile bounds on the near-zero source panels

Three centered interval calculations cover the inclusive source-panel blocks
102–318, 521–720 and 933–1118. Their endpoints come directly from the actual
source panel list. Every actual quadrature address in these blocks has squared
radius at least 13 and scaled physical profile of absolute value at most
1 / 10^10. These conclusions do not assume saved-row coefficient enclosures.
Agent-ID: codex-aa04.
-/

namespace Grothe.UpperChaos.Q0NearZeroSourceProfile

open Q0GaussAddressScan Q0GaussOrdinalEquiv Q0GaussProductionMass
open Q0SourcePanelOrder Q0SourceExceptionGeometry Q0SourceProfileRatio

set_option maxRecDepth 8192
set_option maxHeartbeats 4000000

/-- The three inclusive near-zero blocks in the actual source panel list. -/
def nearZeroPanel (p : ℕ) : Prop :=
  (102 ≤ p ∧ p ≤ 318) ∨
    (521 ≤ p ∧ p ≤ 720) ∨
      (933 ≤ p ∧ p ≤ 1118)

/-- Upper endpoints increase with actual source panel positions. -/
theorem panel_upper_mono (i j : Fin sourcePanels.length)
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

/-- Any actual node in an indexed block lies between its outer endpoints.
The statement is generic and does not require membership in `nearZeroPanel`. -/
theorem source_node_mem_block (a : Address)
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

/-- Every actual source node in these blocks has squared radius at least 13. -/
theorem source_ge_13 (a : Address) (ha : nearZeroPanel a.1.val) :
    (13 : ℝ) ≤ sourceNode a := by
  have hn := (source_node_mem_panel a).1
  rcases ha with ha | ha | ha
  · have hm := panel_lower_mono ⟨102, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast block_starts.1.trans hm
    exact hr.trans hn
  · have hm := panel_lower_mono ⟨521, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast block_starts.2.1.trans hm
    exact hr.trans hn
  · have hm := panel_lower_mono ⟨933, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast block_starts.2.2.trans hm
    exact hr.trans hn

/-- Every actual source node in these blocks satisfies the checked profile cap.
Both interval membership and the interval arithmetic checks are discharged. -/
theorem source_scaled_profile_abs_le (a : Address)
    (ha : nearZeroPanel a.1.val) :
    |Real.sqrt (1 + (Upper.aQ : ℝ) ^ 2) * vprof (sourceNode a)| ≤
      (profileBound : ℝ) := by
  rcases ha with ha | ha | ha
  · have hn := source_node_mem_block a
      ⟨102, by decide +kernel⟩ ⟨318, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block0 (sourceNode a) profileBound
      hn.1 hn.2 block0_checked
  · have hn := source_node_mem_block a
      ⟨521, by decide +kernel⟩ ⟨720, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block1 (sourceNode a) profileBound
      hn.1 hn.2 block1_checked
  · have hn := source_node_mem_block a
      ⟨933, by decide +kernel⟩ ⟨1118, by decide +kernel⟩ ha.1 ha.2
    exact row_scaled_profile_abs_le block2 (sourceNode a) profileBound
      hn.1 hn.2 block2_checked

end Grothe.UpperChaos.Q0NearZeroSourceProfile

open Lean Elab Command
run_cmd do
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  for target in #[``Grothe.UpperChaos.Q0NearZeroSourceProfile.block0_checked,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.block1_checked,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.block2_checked,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.block_starts,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.panel_upper_mono,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.source_node_mem_block,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.source_ge_13,
      ``Grothe.UpperChaos.Q0NearZeroSourceProfile.source_scaled_profile_abs_le] do
    for dependency in (← Lean.collectAxioms target) do
      unless allowed.contains dependency do
        throwError m!"{target} uses unexpected axiom {dependency}"
