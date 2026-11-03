import Grothe.UpperChaos.Q0GaussSelectedChoice
import Grothe.UpperChaos.Q0GaussSelectedLookup

/-! Identify the selected-root contexts with the source-indexed context
lookup. Actual physical-row assembly remains separate. Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0GaussChoiceContext

/-- At each supported order, both tables use the same checked context entries. -/
theorem context_eq (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64) :
    Grothe.UpperChaos.Q0GaussSelectedChoice.contextFor n =
      Grothe.UpperChaos.Q0GaussIndexedContext.rules[n - 1]? := by
  rcases hn with ⟨hlo, hhi⟩
  interval_cases n <;> rfl

/-- The production order/rule lookup supplies the context for the same
selected-root family. -/
theorem selected_context (n : ℕ) (hn : 1 ≤ n ∧ n ≤ 64) (i : Fin n) :
    (do let t ← Grothe.UpperChaos.Q0GaussIndexedContext.rules[n - 1]?; t[i.val]?) =
      some ((Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor n hn).lower i,
        (Grothe.UpperChaos.Q0GaussSelectedChoice.selectedFor n hn).upper i) := by
  rw [← context_eq n hn]
  exact Grothe.UpperChaos.Q0GaussSelectedChoice.selected_context n hn i

end Grothe.UpperChaos.Q0GaussChoiceContext
