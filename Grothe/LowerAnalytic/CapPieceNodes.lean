import Grothe.LowerAnalytic.CapPieceRange
import Grothe.LowerAnalytic.CapRows

/-!
# Localised node caps from piece lists (route M of PLAN_CAPS): soundness

The computable checks are in `CapPieceRange`.  Here:

* `NodeCap k i`: the cap statement of node `i` of row `k` (`Ψ_k(s_i) − capPad ≤ c_i`);
* `PieceCap k i cs`: the same bound for `J(·, s_i)` on the piece region `cs` (the content of one piece);
* `nodeCap_of_pieceCaps`: coverage + every piece ⇒ the node cap;
* `pieceCap_of_pieceOneOK`: a passing piece check ⇒ its `PieceCap`;
* `nodeCap_of_ranges`: coverage, range facts for the checked pieces and `PieceCap` for the excluded
  pieces ⇒ the node cap (this is what the generated node modules use);
* `nodeCap_of_pieceNodeOK`: the whole node in one check.
-/

open GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The cap statement of node `i` of row `k`. -/
def NodeCap (k i : ℕ) : Prop :=
  rowPot k ((rowData.getD k row01).nodeList.getD i (0, 0)).1 - capPad
    ≤ ((rowData.getD k row01).nodeList.getD i (0, 0)).2

/-- The bound of one piece: `J(y, s_i) − capPad ≤ c_i` on the piece region `cs` of node `(k, i)`. -/
def PieceCap (k i : ℕ) (cs : List Cons) : Prop :=
  let r := rowData.getD k row01
  let nd := r.nodeList.getD i (0, 0)
  ∀ y ∈ pieceSet r.E (rowR k) cs,
    Jpot r.E (rowR k) r.ell r.beta (aFib r.b1 r.b2 r.b3) y (nd.1 : ℝ) - capPad ≤ (nd.2 : ℝ)

/-- The constraint lists of the pieces of a node. -/
def pieceCons (x : ℕ × ℕ × List String × List String) : List (List Cons) :=
  (pieceList [] (parseDirs x.2.2.1) x.2.2.2).map fun y => y.2.2.2

lemma pieceList_cons (Ts Ts' : List Tables) (ds : List (List ℚ)) (pcs : List String) :
    (pieceList Ts ds pcs).map (fun y => y.2.2.2) = (pieceList Ts' ds pcs).map (fun y => y.2.2.2) := by
  simp [pieceList, Function.comp_def]

lemma pieceGrids_adm : ∀ G ∈ pieceGrids, gridAdm G = true := by
  intro G hG
  simp only [pieceGrids, List.mem_cons, List.not_mem_nil, or_false] at hG
  rcases hG with rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num

noncomputable section

/-- **A node from its pieces** (semantic form): if the pieces cover the fibre space modulo the
symmetries and `J − capPad ≤ c` holds on every piece, then `Ψ(s) − capPad ≤ c`. -/
theorem nodeCap_of_pieceCaps (x : ℕ × ℕ × List String × List String)
    (hcov : pieceCoverOK x = true) (hp : ∀ cs ∈ pieceCons x, PieceCap x.1 x.2.1 cs) :
    NodeCap x.1 x.2.1 := by
  simp only [pieceCoverOK, Bool.and_eq_true] at hcov
  obtain ⟨-, hcov⟩ := hcov
  unfold NodeCap rowPot
  set r := rowData.getD x.1 row01
  set nd := r.nodeList.getD x.2.1 (0, 0)
  have : pot r.E (rowR x.1) r.ell r.beta (aFib r.b1 r.b2 r.b3) nd.1 ≤ nd.2 + capPad := by
    refine ciSup_le fun y => ?_
    obtain ⟨pc, hpc, hy⟩ := capCover_sound r.E (rowR x.1) hcov y
    refine Jpot_le_of_mem_symOrbit r.E (rowR x.1) r.ell r.beta _ (aFib_cj _ _ _) (aFib_ng _ _ _)
      _ _ _ (fun w hw => ?_) hy
    have := hp pc hpc w hw
    linarith
  dsimp only
  linarith

/-- **A passing piece check gives its piece bound.** -/
theorem pieceCap_of_pieceOneOK (x : ℕ × ℕ × List String × List String) (j : ℕ)
    (hg : ∀ p ∈ x.2.2.2, (parsePiece (parseDirs x.2.2.1) p).1 < pieceGrids.length)
    (h : pieceOneOK pieceTables x j = true) :
    ∃ cs, (pieceCons x)[j]? = some cs ∧ PieceCap x.1 x.2.1 cs := by
  unfold pieceOneOK at h
  cases hj : (pieceList pieceTables (parseDirs x.2.2.1) x.2.2.2)[j]? with
  | none => rw [hj] at h; exact absurd h (by simp)
  | some y =>
    rw [hj] at h
    obtain ⟨hjl, hy⟩ := List.getElem?_eq_some_iff.1 hj
    have hjl' : j < x.2.2.2.length := by simpa [pieceList] using hjl
    refine ⟨y.2.2.2, ?_, ?_⟩
    · rw [pieceCons, ← pieceList_cons pieceTables, List.getElem?_map, hj]; rfl
    · set p := x.2.2.2[j]
      have hyp : y = (pieceList pieceTables (parseDirs x.2.2.1) x.2.2.2)[j] := hy.symm
      have hgp := hg p (List.getElem_mem hjl')
      set g := (parsePiece (parseDirs x.2.2.1) p).1
      have e1 : pieceGrids.getD g (0, 0, 0) = pieceGrids[g] := List.getD_eq_getElem _ _ hgp
      have e2 : pieceTables.getD g ⟨#[], #[], #[]⟩
          = mkTables pieceGrids[g].1 pieceGrids[g].2.1 pieceGrids[g].2.2 := by
        rw [List.getD_eq_getElem _ _ (by simpa [pieceTables] using hgp)]
        simp [pieceTables]
      have hG := pieceGrids_adm _ (List.getElem_mem hgp)
      simp only [gridAdm, Bool.and_eq_true, decide_eq_true_eq] at hG
      obtain ⟨⟨⟨⟨hh, h1⟩, h8⟩, hN⟩, hN'⟩ := hG
      have hy1 : y.2.1 = pieceGrids[g] := by rw [hyp]; simp [pieceList, e1, p, g]
      have hy2 : y.2.2.1 = mkTables pieceGrids[g].1 pieceGrids[g].2.1 pieceGrids[g].2.2 := by
        rw [hyp]; simp [pieceList, ← e2, p, g]
      intro w hw
      unfold pieceCheck at h
      rw [hy1, hy2] at h
      have hNr : 0 < pieceGrids[g].1 := by
        by_contra h0
        have : pieceGrids[g].1 = 0 := by omega
        rw [this] at h1; norm_num at h1
      exact Jpot_le_of_nodeOKc _ _ _ _ _ _ _ _ _ _ (tablesOK_mk hh h1 h8 hN hN') hh (by omega) hNr h w hw

/-- **A node from its range facts**: the coverage fact, range facts covering every piece outside
`excl`, and the piece bounds of the pieces in `excl`, give the node cap. -/
theorem nodeCap_of_ranges (x : ℕ × ℕ × List String × List String) (excl : List ℕ)
    (hcov : pieceCoverOK x = true)
    (hok : ∀ j < x.2.2.2.length, j ∉ excl → pieceOneOK pieceTables x j = true)
    (hex : ∀ j ∈ excl, ∀ cs, (pieceCons x)[j]? = some cs → PieceCap x.1 x.2.1 cs) :
    NodeCap x.1 x.2.1 := by
  have hg : ∀ p ∈ x.2.2.2, (parsePiece (parseDirs x.2.2.1) p).1 < pieceGrids.length := by
    have := hcov
    simp only [pieceCoverOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at this
    exact this.1
  refine nodeCap_of_pieceCaps x hcov fun cs hcs => ?_
  obtain ⟨j, hj, rfl⟩ := List.getElem_of_mem hcs
  have hj' : j < x.2.2.2.length := by simpa [pieceCons, pieceList] using hj
  by_cases hx : j ∈ excl
  · exact hex j hx _ (List.getElem?_eq_getElem hj)
  · obtain ⟨cs, hcs', hc⟩ := pieceCap_of_pieceOneOK x j hg (hok j hj' hx)
    rw [List.getElem?_eq_getElem hj] at hcs'
    cases hcs'
    exact hc

/-- A range fact gives the piece checks of its range. -/
lemma pieceOneOK_of_range {x : ℕ × ℕ × List String × List String} {lo hi j : ℕ}
    (h : pieceRangeOK x lo hi = true) (hlo : lo ≤ j) (hhi : j < hi) :
    pieceOneOK pieceTables x j = true := by
  simp only [pieceRangeOK, List.all_eq_true, List.mem_range'_1] at h
  exact h j ⟨hlo, by omega⟩

/-- **The whole node in one check.** -/
theorem nodeCap_of_pieceNodeOK (x : ℕ × ℕ × List String × List String)
    (h : pieceNodeOK pieceTables x = true) : NodeCap x.1 x.2.1 := by
  simp only [pieceNodeOK, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨⟨hg, hcov⟩, hall⟩ := h
  have hcov' : pieceCoverOK x = true := by
    simp only [pieceCoverOK, Bool.and_eq_true, List.all_eq_true]
    exact ⟨hg, by rw [← pieceList_cons pieceTables]; exact hcov⟩
  refine nodeCap_of_ranges x [] hcov' (fun j hj _ => ?_) (by simp)
  unfold pieceOneOK
  have hjl : j < (pieceList pieceTables (parseDirs x.2.2.1) x.2.2.2).length := by
    simpa [pieceList] using hj
  rw [List.getElem?_eq_getElem hjl]
  exact hall _ (List.getElem_mem hjl)

end

end Grothe.LowerAnalytic
