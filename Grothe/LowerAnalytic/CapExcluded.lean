import Grothe.LowerAnalytic.CapRows
import Grothe.LowerAnalytic.CapRecipeData

/-! The certified-row recipes currently exclude no nodes.
Agent-ID: codex-2ca4. This discharges the exclusion-cap component independently of rows 12–15. -/

namespace Grothe.LowerAnalytic

theorem capExcl_eq_nil (k : ℕ) : capExcl k = [] := by
  simp only [capExcl, capRowsData, List.lookup_cons, List.lookup_nil]
  repeat' split
  all_goals rfl

theorem exclCaps_capExcl (k : ℕ) : ExclCaps k (capExcl k) := by
  rw [capExcl_eq_nil]
  simp [ExclCaps]

end Grothe.LowerAnalytic
