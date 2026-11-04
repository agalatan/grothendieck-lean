import Grothe.UpperChaos.Q0OrdinalCoverage
import Grothe.UpperChaos.Q0GaussScanTheory

/-! Complete panel/rule address coverage from a checked ordinal enumeration
and scanned nonoverlapping source panels. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussScheduleCoverage

open Grothe.UpperChaos.Q0GaussPhysicalCheck
open Grothe.UpperChaos.Q0GaussAddress

/-- If each row's ordinal is the source panel offset plus its rule index,
and row ordinals enumerate the scanned range, every source address has
exactly one corresponding row. -/
theorem unique_row_for_address (panels : List Panel) (rows : List Row) (n : ℕ)
    (hscan : scan panels 0 = some n) (hindices : rows.map Row.index = List.range' 0 n)
    (haddress : ∀ r ∈ rows, ∃ i : Fin panels.length,
      r.panel = i.val ∧ r.rule < (panels.get i).order ∧
      r.index = (panels.get i).offset + r.rule)
    (i : Fin panels.length) (j : ℕ) (hj : j < (panels.get i).order) :
    ∃! r, r ∈ rows ∧ r.panel = i.val ∧ r.rule = j := by
  have hp := scan_member_bounds panels 0 n hscan (panels.get i) (List.get_mem panels i)
  have hjn : (panels.get i).offset + j < n := by omega
  obtain ⟨r, ⟨hr, hindex⟩, hunique⟩ :=
    Grothe.UpperChaos.Q0OrdinalCoverage.exists_unique_of_map_range
      Row.index rows n hindices ((panels.get i).offset + j) hjn
  obtain ⟨ir, hipanel, hirule, hiindex⟩ := haddress r hr
  have heq : (panels.get ir).offset + r.rule = (panels.get i).offset + j := by omega
  obtain ⟨hiri, hrj⟩ := scanned_address_unique panels 0 n hscan ir i r.rule j hirule hj heq
  refine ⟨r, ⟨hr, ?_, hrj⟩, ?_⟩
  · simpa [hiri] using hipanel
  · intro s hs
    obtain ⟨is, hspanel, hsrule, hsindex⟩ := haddress s hs.1
    have his : is = i := Fin.ext (hspanel.symm.trans hs.2.1)
    apply hunique s
    refine ⟨hs.1, ?_⟩
    simpa [his, hs.2.2] using hsindex

end Grothe.UpperChaos.Q0GaussScheduleCoverage
