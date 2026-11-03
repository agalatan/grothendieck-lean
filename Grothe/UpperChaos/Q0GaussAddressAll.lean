import Grothe.UpperChaos.Q0GaussAddressGroup021
import Grothe.UpperChaos.Q0GaussPhysicalAll

/-! Source panel address checks for all physical rows.
Full source schedule and mathematical Gauss-rule identity remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussAddressAll

open Grothe.UpperChaos.Q0GaussAddress

theorem checked : (Grothe.UpperChaos.Q0GaussPhysicalAll.rows).all addressOK = true := by
  simp only [Grothe.UpperChaos.Q0GaussPhysicalAll.rows, List.all_append, Grothe.UpperChaos.Q0GaussAddressGroup000.checked, Grothe.UpperChaos.Q0GaussAddressGroup001.checked, Grothe.UpperChaos.Q0GaussAddressGroup002.checked, Grothe.UpperChaos.Q0GaussAddressGroup003.checked, Grothe.UpperChaos.Q0GaussAddressGroup004.checked, Grothe.UpperChaos.Q0GaussAddressGroup005.checked, Grothe.UpperChaos.Q0GaussAddressGroup006.checked, Grothe.UpperChaos.Q0GaussAddressGroup007.checked, Grothe.UpperChaos.Q0GaussAddressGroup008.checked, Grothe.UpperChaos.Q0GaussAddressGroup009.checked, Grothe.UpperChaos.Q0GaussAddressGroup010.checked, Grothe.UpperChaos.Q0GaussAddressGroup011.checked, Grothe.UpperChaos.Q0GaussAddressGroup012.checked, Grothe.UpperChaos.Q0GaussAddressGroup013.checked, Grothe.UpperChaos.Q0GaussAddressGroup014.checked, Grothe.UpperChaos.Q0GaussAddressGroup015.checked, Grothe.UpperChaos.Q0GaussAddressGroup016.checked, Grothe.UpperChaos.Q0GaussAddressGroup017.checked, Grothe.UpperChaos.Q0GaussAddressGroup018.checked, Grothe.UpperChaos.Q0GaussAddressGroup019.checked, Grothe.UpperChaos.Q0GaussAddressGroup020.checked, Grothe.UpperChaos.Q0GaussAddressGroup021.checked, Bool.and_self]

theorem each_source (r : Grothe.UpperChaos.Q0GaussPhysicalCheck.Row)
    (hr : r ∈ Grothe.UpperChaos.Q0GaussPhysicalAll.rows) :
    ∃ block p, panelBlocks[r.panel / 64]? = some block ∧
      block[r.panel % 64]? = some p ∧
      r.panel / 64 < panelBlocks.size ∧ r.panel % 64 < block.size ∧
      r.lo = p.lo ∧ r.hi = p.hi ∧
      1 ≤ p.order ∧ p.order ≤ 64 ∧ r.rule < p.order ∧
      r.index = p.offset + r.rule := by
  exact addressOK_sound r ((List.all_eq_true.mp checked) r hr)

end Grothe.UpperChaos.Q0GaussAddressAll
