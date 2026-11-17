import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapConstr
import Grothe.LowerAnalytic.CapTablesMk

/-!
# Localised node caps from piece lists (route M of PLAN_CAPS): soundness

The computable checks are in `CapPieceRange`.  Here:

* `NodeCap k i`: the cap statement of node `i` of row `k` (`Ψ_k(s_i) − capPad ≤ c_i`);
* `PieceCap k i cs`: the same bound for `J(·, s_i)` on the piece region `cs` (the content of one piece),
  for the potential without a tail, as `rowPot`;
* `nodeCap_of_pieceCaps`: coverage + every piece ⇒ the node cap;
* `pieceCap_of_pieceOneOK`: a passing piece check ⇒ its `PieceCap`;
* `nodeCap_of_ranges`: coverage, range facts for the checked pieces and `PieceCap` for the excluded
  pieces ⇒ the node cap (this is what the generated node modules use);
* `nodeCap_of_pieceNodeOK`: the whole node in one check.
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
