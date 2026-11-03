import Grothe.UpperChaos.Q0GaussChoiceContext
import Grothe.UpperChaos.Q0GaussIndexedContextAll
import Grothe.UpperChaos.Q0GaussPhysicalAll
import Grothe.UpperChaos.Q0GaussAddressAll

/-! Connect each checked physical row to the selected root of its source
panel's rule. Gauss exactness and the global mass sum are separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussActualRow

open Grothe.UpperChaos.Q0GaussPhysicalCheck
open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0LegendreInteger

/-- The selected rule root satisfies the stored physical row enclosures. -/
theorem enclosures (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows)
    (block : Array Panel) (p : Panel)
    (hb : panelBlocks[r.panel / 64]? = some block)
    (hp : block[r.panel % 64]? = some p)
    (hn : 1 ≤ p.order ∧ p.order ≤ 64) (hi : r.rule < p.order) :
    let rule := Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor p.order hn
    let root := rule.root ⟨r.rule, hi⟩
    (r.physicalLower : ℝ) / 10^9 ≤ panelNode r.lo r.hi root ∧
      0 < panelWeight r.lo r.hi (p.order - 1) root ∧
      panelWeight r.lo r.hi (p.order - 1) root ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  have h0 : p.order ≠ 0 := by omega
  have hlookup : Grothe.UpperChaos.Q0GaussIndexedContext.contextAt r =
      (do let t ← Grothe.UpperChaos.Q0GaussIndexedContext.rules[p.order - 1]?; t[r.rule]?) := by
    simp [Grothe.UpperChaos.Q0GaussIndexedContext.contextAt, hb, hp, h0]
  have hselected := Grothe.UpperChaos.Q0GaussChoiceContext.selected_context
    p.order hn ⟨r.rule, hi⟩
  have hrule := hlookup.trans hselected
  exact Grothe.UpperChaos.Q0GaussSelected.physical_of_matching_lookup p.order
    (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor p.order hn) ⟨r.rule, hi⟩ r
    (Grothe.UpperChaos.Q0GaussPhysicalAll.each_valid r hr)
    (Grothe.UpperChaos.Q0GaussIndexedContext.contextAt r)
    (Grothe.UpperChaos.Q0GaussIndexedContextAll.each_context r hr) hrule


/-- Every checked row has a safe source-panel address, and the same selected
root satisfies the enclosures on the source panel itself. -/
theorem source_enclosures (r : Row) (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    ∃ (block : Array Panel) (p : Panel) (hn : 1 ≤ p.order ∧ p.order ≤ 64)
      (hi : r.rule < p.order),
      panelBlocks[r.panel / 64]? = some block ∧ block[r.panel % 64]? = some p ∧
      r.index = p.offset + r.rule ∧
      let root := (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor p.order hn).root ⟨r.rule, hi⟩
      (r.physicalLower : ℝ) / 10^9 ≤ panelNode p.lo p.hi root ∧
      0 < panelWeight p.lo p.hi (p.order - 1) root ∧
      panelWeight p.lo p.hi (p.order - 1) root ≤ (r.physicalUpperWeight : ℝ) / 10^12 := by
  obtain ⟨block, p, hb, hp, _, _, hlo, hhi, horderlo, horderhi, hrule, hindex⟩ :=
    Grothe.UpperChaos.Q0GaussAddressAll.each_source r hr
  let hn : 1 ≤ p.order ∧ p.order ≤ 64 := ⟨horderlo, horderhi⟩
  refine ⟨block, p, hn, hrule, hb, hp, hindex, ?_⟩
  simpa only [hlo, hhi] using enclosures r hr block p hb hp hn hrule

end Grothe.UpperChaos.Q0GaussActualRow
