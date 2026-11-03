import Grothe.UpperChaos.Q0GaussAddressScan
import Grothe.UpperChaos.Q0GaussScanTheory

/-! Source panel/rule addresses and their original ordinals. These definitions
do not depend on the selected-root or physical-node proof chain.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussOrdinalEquiv

open Grothe.UpperChaos.Q0GaussAddress
open Grothe.UpperChaos.Q0GaussAddressScan

/-- Every panel included in a successful scan has a supported order. -/
theorem scan_member_order_bounds (ps : List Panel) (start finish : ℕ)
    (h : scan ps start = some finish) (p : Panel) (hp : p ∈ ps) :
    1 ≤ p.order ∧ p.order ≤ 64 := by
  induction ps generalizing start with
  | nil => simp at hp
  | cons q qs ih =>
    obtain ⟨hq, ht⟩ := scan_cons_sound q qs start finish h
    rcases List.mem_cons.mp hp with rfl | hp
    · exact ⟨hq.2.1, hq.2.2⟩
    · exact ih (start + q.order) ht hp

/-- A source address specifies a panel and one index of its own Gauss rule. -/
abbrev Address := Σ p : Fin sourcePanels.length, Fin (sourcePanels.get p).order

/-- Cumulative panel offset recovers the source ordinal of an address. -/
def fromAddress (a : Address) : Fin 21577 :=
  ⟨(sourcePanels.get a.1).offset + a.2.val, by
    have h := scan_member_bounds sourcePanels 0 21577 complete_scan
      (sourcePanels.get a.1) (List.get_mem sourcePanels a.1)
    have hj := a.2.isLt
    omega⟩

end Grothe.UpperChaos.Q0GaussOrdinalEquiv
