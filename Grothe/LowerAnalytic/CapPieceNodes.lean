import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapConstr
import Grothe.LowerAnalytic.CapTablesMk

/-!
# The constraints of the pieces of a localised node

`pieceCons x`: the constraint lists of the pieces of a node record `x` (`CapPieceRange.lean`), the regions that the
coverage fact `pieceCoverOK` covers and the piece facts bound; `pieceGrids_adm`: the piece grids are admissible.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The constraint lists of the pieces of a node. -/
def pieceCons (x : ℕ × ℕ × List String × List String) : List (List Cons) :=
  (pieceList [] (parseDirs x.2.2.1) x.2.2.2).map fun y => y.2.2.2

lemma pieceGrids_adm : ∀ G ∈ pieceGrids, gridAdm G = true := by
  intro G hG
  simp only [pieceGrids, List.mem_cons, List.not_mem_nil, or_false] at hG
  rcases hG with rfl | rfl | rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num

noncomputable section

end

end Grothe.LowerAnalytic
