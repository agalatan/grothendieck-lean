import Grothe.UpperChaos.Q0GaussScheduleCoverage
import Grothe.UpperChaos.Q0GaussPanelFlatten
import Grothe.UpperChaos.Q0GaussAddressAll
import Grothe.UpperChaos.Q0GaussOrdinal

/-! Link saved physical rows to the scanned source-panel schedule. The
production Gauss-node identity and analytic remainder remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussFullSchedule

open Grothe.UpperChaos.Q0GaussPhysicalCheck
open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan

theorem row_address (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    ∃ i : Fin sourcePanels.length,
      r.panel = i.val ∧ r.rule < (sourcePanels.get i).order ∧
      r.index = (sourcePanels.get i).offset + r.rule := by
  obtain ⟨block, p, hb, hp, _, _, _, _, _, _, hrule, hord⟩ :=
    Grothe.UpperChaos.Q0GaussAddressAll.each_source r hr
  have hlookup := Grothe.UpperChaos.Q0GaussPanelFlatten.source_lookup r.panel block p hb hp
  obtain ⟨hi, heq⟩ := List.getElem?_eq_some_iff.mp hlookup
  refine ⟨⟨r.panel, hi⟩, rfl, ?_, ?_⟩
  · change r.rule < sourcePanels[r.panel].order
    rw [heq]
    exact hrule
  · change r.index = sourcePanels[r.panel].offset + r.rule
    rw [heq]
    exact hord

theorem unique_row_for_source_address (i : Fin sourcePanels.length) (j : ℕ)
    (hj : j < (sourcePanels.get i).order) :
    ∃! r : Row, r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows ∧
      r.panel = i.val ∧ r.rule = j := by
  exact Grothe.UpperChaos.Q0GaussScheduleCoverage.unique_row_for_address
    sourcePanels Grothe.UpperChaos.Q0GaussPhysicalAll.rows 21577 complete_scan
    Grothe.UpperChaos.Q0GaussOrdinal.indices row_address i j hj

end Grothe.UpperChaos.Q0GaussFullSchedule
