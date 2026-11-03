import Grothe.UpperChaos.Q0GaussAddressScan
import Mathlib.Data.List.Chain

/-! Ordering relation for the exact production source panel table.
Strict gaps are allowed and are not covered by any panel.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0SourcePanelOrder

open Grothe.UpperChaos.Q0GaussAddress

/-- A later panel starts no earlier than the earlier panel ends and is
itself well-formed. The last conjunct makes the relation transitive. -/
def follows (p q : Panel) : Prop := p.hi ≤ q.lo ∧ q.lo ≤ q.hi

instance : DecidableRel follows := fun p q =>
  inferInstanceAs (Decidable (p.hi ≤ q.lo ∧ q.lo ≤ q.hi))

instance : Trans follows follows follows where
  trans := by
    intro p q r hpq hqr
    exact ⟨le_trans hpq.1 (le_trans hpq.2 hqr.1), hqr.2⟩

/-- Compose two checked adjacent-panel chains using their actual boundary. -/
theorem chain_append_known (xs ys : List Panel) (p q : Panel)
    (hx : xs.IsChain follows) (hy : ys.IsChain follows)
    (hxp : xs.getLast? = some p) (hyq : ys.head? = some q)
    (hpq : follows p q) : (xs ++ ys).IsChain follows := by
  apply List.IsChain.append hx hy
  intro x hxmem y hymem
  have hxp' : p = x := by simpa [hxp] using hxmem
  have hyq' : q = y := by simpa [hyq] using hymem
  subst x
  subst y
  exact hpq

end Grothe.UpperChaos.Q0SourcePanelOrder
