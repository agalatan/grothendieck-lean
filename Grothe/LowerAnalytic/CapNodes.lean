import Grothe.LowerAnalytic.CapRows
import Grothe.LowerAnalytic.CapRecipeData

/-!
# The certified rows of the node caps

`capRowsDone`: the rows whose vertex caps are certified inside Lean, each with its recipes and
grid; `capRows_check` (by `native_decide`, the nodes checked in parallel) runs `rowOK` on all of
them.  Consequently the lower bound needs only the vertex caps of the remaining rows
(`lower_bound_of_capsRest`).
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The two grids: 400 rings × 128 angular cells and 1600 × 256 on `[0, 8]`. -/
def capGrids : List (ℕ × ℕ × ℚ) := [(400, 128, 1 / 50), (1600, 256, 1 / 200)]

/-- The certified rows: `(row index, recipes, excluded nodes)`. -/
def capRowsDone : List (ℕ × List (ℕ × ℕ × String) × List ℕ) := capRowsData

/-- **The finite computation** (by `native_decide`): the row checks of the certified rows. -/
theorem capRows_check :
    capRowsDone.all (fun x => rowOK x.1 (parseRecs x.2.1) capGrids x.2.2) = true := by
  native_decide

/-- **The remaining cap hypothesis**: the vertex caps of the rows not certified in Lean, and the caps
at the excluded nodes of the certified rows. -/
def CapsRest : Prop :=
  (∀ k, k < rowData.length → k ∉ capRowsDone.map Prod.fst → VertexCapsRow k) ∧
    ∀ x ∈ capRowsDone, ExclCaps x.1 x.2.2

theorem vertexCaps_of_capsRest (h : CapsRest) : VertexCaps := fun k hk => by
  by_cases hd : k ∈ capRowsDone.map Prod.fst
  · obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hd
    exact vertexCapsRow_of_rowOK (List.all_eq_true.1 capRows_check x hx) (h.2 x hx)
  · exact h.1 k hk hd

/-- **The lower bound from the remaining caps**: `Llow < K` for every Grothendieck bound `K`. -/
theorem lower_bound_of_capsRest (h : CapsRest) {K : ℝ} (hK : IsGrothendieckBound K) :
    (Llow : ℝ) < K :=
  lower_bound_of_vertexCaps (vertexCaps_of_capsRest h) hK

end Grothe.LowerAnalytic
