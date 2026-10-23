import Grothe.LowerAnalytic.CapConstr
import Grothe.LowerAnalytic.CapRows

/-!
# Localised node caps from piece lists (route M of PLAN_CAPS)

A *piece node* is `(k, i, dirs, pieces)`: node `i` of row `k`, the directions `d₀, d₂, d₃` and the
encoded pieces `g;recipe;constraints` (`parsePiece`, grid `g` of `pieceGrids`).  `pieceNodeOK`
runs the coverage check and the constrained node check of every piece (in parallel tasks);
`capOfPieceNode` turns a passing check into the cap of the node.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The grids of the pieces: `400 × 128`, `1600 × 256`, `1600 × 1024` on `[0, 8]`. -/
def pieceGrids : List (ℕ × ℕ × ℚ) := [(400, 128, 1 / 50), (1600, 256, 1 / 200), (1600, 1024, 1 / 200)]

/-- The pieces of a node with their grids and tables. -/
def pieceList (Ts : List Tables) (ds : List (List ℚ)) (pcs : List String) :
    List (Recipe × (ℕ × ℕ × ℚ) × Tables × List Cons) :=
  pcs.map fun p =>
    let x := parsePiece ds p
    (x.2.1, pieceGrids.getD x.1 (0, 0, 0), Ts.getD x.1 ⟨#[], #[], #[]⟩, x.2.2)

/-- **The check of a piece node** (the pieces in parallel). -/
def pieceNodeOK (Ts : List Tables) (x : ℕ × ℕ × List String × List String) : Bool :=
  let r := rowData.getD x.1 row01
  let nd := r.nodeList.getD x.2.1 (0, 0)
  let ds := parseDirs x.2.2.1
  let P := pieceList Ts ds x.2.2.2
  x.2.2.2.all (fun p => decide ((parsePiece ds p).1 < pieceGrids.length)) &&
    capCoverOK ds (P.map fun y => y.2.2.2) &&
    ((P.map fun y => Task.spawn fun _ =>
      nodeOKc r (rowR x.1) nd.1 nd.2 y.1 y.2.1.1 y.2.1.2.1 y.2.1.2.2 y.2.2.1 y.2.2.2).all
      fun t => t.get)

/-- The cap statement of node `i` of row `k`. -/
def NodeCap (k i : ℕ) : Prop :=
  rowPot k ((rowData.getD k row01).nodeList.getD i (0, 0)).1 - capPad
    ≤ ((rowData.getD k row01).nodeList.getD i (0, 0)).2

lemma pieceGrids_adm : ∀ G ∈ pieceGrids, gridAdm G = true := by
  intro G hG
  simp only [pieceGrids, List.mem_cons, List.not_mem_nil, or_false] at hG
  rcases hG with rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num

/-- **Soundness of the piece-node check.** -/
theorem nodeCap_of_pieceNodeOK (x : ℕ × ℕ × List String × List String)
    (h : pieceNodeOK (pieceGrids.map fun G => mkTables G.1 G.2.1 G.2.2) x = true) :
    NodeCap x.1 x.2.1 := by
  simp only [pieceNodeOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq, List.all_map,
    Function.comp_def, Task.spawn] at h
  obtain ⟨⟨hg, hcov⟩, hall⟩ := h
  unfold NodeCap rowPot
  refine pot_le_of_pieces _ _ _ _ _ _ (fun y hy => ?_) (fun y hy => ?_) hcov (fun y hy => hall y hy)
  all_goals
    obtain ⟨p, hp, rfl⟩ := List.mem_map.1 hy
    have hgp := hg p hp
    set g := (parsePiece (parseDirs x.2.2.1) p).1
    have e1 : pieceGrids.getD g (0, 0, 0) = pieceGrids[g] := List.getD_eq_getElem _ _ hgp
    have hG := pieceGrids_adm _ (List.getElem_mem hgp)
    simp only [gridAdm, Bool.and_eq_true, decide_eq_true_eq] at hG
    obtain ⟨⟨⟨⟨hh, h1⟩, h8⟩, hN⟩, hN'⟩ := hG
  · have e2 : (pieceGrids.map fun G => mkTables G.1 G.2.1 G.2.2).getD g ⟨#[], #[], #[]⟩
        = mkTables pieceGrids[g].1 pieceGrids[g].2.1 pieceGrids[g].2.2 := by
      rw [List.getD_eq_getElem _ _ (by simpa using hgp), List.getElem_map]
    rw [e1, e2]
    exact tablesOK_mk hh h1 h8 hN hN'
  · rw [e1]
    refine ⟨hh, by omega, ?_⟩
    by_contra h0
    have : pieceGrids[g].1 = 0 := by omega
    rw [this] at h1; norm_num at h1

end Grothe.LowerAnalytic
