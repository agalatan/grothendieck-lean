import Grothe.LowerAnalytic.CapPieceRepair
import Grothe.LowerAnalytic.CapPieces.N14x150
import Grothe.LowerAnalytic.CapPieces.R14x150p0Repair

/-! Close the sole excluded piece of node 150 of row 14 without increasing its cap.
Agent-ID: codex-2ca4. The eight existing piece checks and original coverage are reused. -/

namespace Grothe.LowerAnalytic

/-- The actual Gaussian node cap at row 14, node 150, with no remaining piece premise. -/
theorem nodeCap_14x150_done : NodeCap 14 150 := by
  apply nodeCap_14x150
  intro j hj cs hcs
  have hj0 : j = 0 := by simpa using hj
  subst j
  have hcheck := pieceRepair_14x150p0_check
  simp only [pieceRepairOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hcheck
  obtain ⟨⟨hg, hr⟩, hok⟩ := hcheck
  obtain ⟨ds, hds, hd⟩ := pieceCap_of_pieceOneOK pieceRepair_14x150p0 0
    hg hok
  change ((pieceCons pieceNode_14x150)[0]?).map (List.map Cons.regionData) =
    ((pieceCons pieceRepair_14x150p0)[0]?).map (List.map Cons.regionData) at hr
  rw [hcs, hds] at hr
  simp only [Option.map_some, Option.some.injEq] at hr
  exact pieceCap_of_same_regionData hr hd

end Grothe.LowerAnalytic
