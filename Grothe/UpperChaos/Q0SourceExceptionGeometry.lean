import Grothe.UpperChaos.Q0GaussProductionMass
import Grothe.UpperChaos.Q0SourcePanelOrderAll
import Grothe.UpperChaos.Q0SourceExceptionIndex
import Lean.Util.CollectAxioms
import Lean.Elab.Command

/-! Geometry of the three whole source-panel blocks excluded from the
near-zero profile evaluator. This is not an error or weight-mass bound.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourceExceptionGeometry

open Grothe.UpperChaos.Q0GaussOrdinalEquiv
open Grothe.UpperChaos.Q0GaussAddressScan
open Grothe.UpperChaos.Q0GaussProductionMass
open Grothe.UpperChaos.Q0SourcePanelOrder

/-- Lower endpoints increase with actual source panel positions. -/
theorem panel_lower_mono (i j : Fin sourcePanels.length) (hij : i.val ≤ j.val) :
    (sourcePanels.get i).lo ≤ (sourcePanels.get j).lo := by
  rcases eq_or_lt_of_le hij with heq | hlt
  · have h : i = j := Fin.ext heq
    subst j
    exact le_rfl
  · have hs := panel_hi_le_of_index_lt i j hlt
    have hi : (sourcePanels.get i).lo ≤ (sourcePanels.get i).hi := by
      have h := source_panel_lt i
      exact_mod_cast h.le
    exact hi.trans hs

/-- The first panel of each exceptional block starts beyond radius 13. -/
theorem exception_starts :
    (13 : ℚ) ≤ (sourcePanels.get ⟨146, by decide +kernel⟩).lo ∧
    (13 : ℚ) ≤ (sourcePanels.get ⟨557, by decide +kernel⟩).lo ∧
    (13 : ℚ) ≤ (sourcePanels.get ⟨964, by decide +kernel⟩).lo := by
  decide +kernel

/-- Every actual node in the exceptional panel blocks lies beyond 13. -/
theorem exception_source_ge_13 (a : Address) (ha : exceptionalPanel a.1.val) :
    (13 : ℝ) ≤ sourceNode a := by
  have hn := (source_node_mem_panel a).1
  rcases ha with ha | ha | ha
  · have hm := panel_lower_mono ⟨146, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast exception_starts.1.trans hm
    exact hr.trans hn
  · have hm := panel_lower_mono ⟨557, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast exception_starts.2.1.trans hm
    exact hr.trans hn
  · have hm := panel_lower_mono ⟨964, by decide +kernel⟩ a.1 ha.1
    have hr : (13 : ℝ) ≤ ((sourcePanels.get a.1).lo : ℝ) := by
      exact_mod_cast exception_starts.2.2.trans hm
    exact hr.trans hn

end Grothe.UpperChaos.Q0SourceExceptionGeometry

open Lean Elab Command
run_cmd do
  let dependencies ← Lean.collectAxioms
    ``Grothe.UpperChaos.Q0SourceExceptionGeometry.exception_source_ge_13
  for dependency in dependencies do
    unless (#[`propext, `Classical.choice, `Quot.sound] : Array Name).contains dependency do
      throwError m!"source exception geometry uses unexpected axiom {dependency}"
