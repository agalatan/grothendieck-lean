import Grothe.LowerAnalytic.CapRangeNuDefs
import Grothe.LowerAnalytic.CapNodeNu
import Grothe.LowerAnalytic.CapPieceNodes
import Grothe.LowerAnalytic.RowGaussian

/-!
# From the range facts with a tail to `TailNodeCaps`

The assembly of the node caps of the fibre potentials with an identity tail `0 ≤ ν < 1` (a
rational, in hat units) from the checks of `CapRangeNuDefs.lean`, for a row given by its data
(`r`, its odd block `R`, its chord data `ch`) and facts checked at a weight `eps` of the fibre
form; every soundness statement takes `eps = ε`.

* `nodeCapNu_of_rangeOK`: a range fact `rangeOKNu` gives the caps of its whole-fibre nodes;
* `pieceCapNu_of_pieceOneOK`, `nodeCapNu_of_ranges`: the coverage fact of a localised node and the
  piece facts `pieceOneOKNu` of all its pieces (from `pieceRangeOKNu`) give its cap;
* `nodeCaps_of_vertexCapsNu`: the caps of the vertex nodes of a row and the chord check
  `chordOKLow` give the caps of all its nodes, by the convexity of `s ↦ Ψ_ν(s)`;
* `tailNodeCaps_nuHat`: the node caps of every row of `rowData` are `TailNodeCaps (nuHat ν)`, the
  hypothesis of the reduction with a tail (`RowGaussian.lean`).

Every vertex node carries its table cap lowered by `capLow` (`NodeCapNu`), so that the chord nodes
follow from the chord of the lowered caps.
-/

open MeasureTheory Real Set Finset GrotheKernel Grothe.Lower

namespace Grothe.LowerAnalytic

/-- The cap statement with a tail of node `i` of the row `r` with odd block `R`, at the lowered
cap: `Ψ_ν(sᵢ) − capPad ≤ cᵢ − capLow`. -/
def NodeCapNu (nu : ℚ) (r : Row) (R : Sym2) (i : ℕ) : Prop :=
  pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) nu (r.nodeList.getD i (0, 0)).1 - capPad
    ≤ (((r.nodeList.getD i (0, 0)).2 - capLow : ℚ) : ℝ)

/-- The vertex caps with a tail of a row (every node that is not a chord node of `ch`). -/
def VertexCapsRowNu (nu : ℚ) (r : Row) (R : Sym2) (ch : List (ℕ × ℕ × ℕ)) : Prop :=
  ∀ i, i < r.nodeList.length → isChord ch i = false → NodeCapNu nu r R i

/-- The caps with a tail of a row at the nodes of `excl` (the localised nodes, certified by their
pieces). -/
def ExclCapsNu (nu : ℚ) (r : Row) (R : Sym2) (excl : List ℕ) : Prop :=
  ∀ i ∈ excl, i < r.nodeList.length → NodeCapNu nu r R i

/-- The bound of one piece with a tail: `J(y, sᵢ) − capPad ≤ cᵢ − capLow` on the piece region
`cs` of node `i`. -/
def PieceCapNu (nu : ℚ) (r : Row) (R : Sym2) (i : ℕ) (cs : List Cons) : Prop :=
  ∀ y ∈ pieceSet r.E R cs,
    Jpot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) nu y (r.nodeList.getD i (0, 0)).1 - capPad
      ≤ (((r.nodeList.getD i (0, 0)).2 - capLow : ℚ) : ℝ)

noncomputable section

/-- **Soundness of the range check with a tail**: the caps of the row at the whole-fibre nodes of
`[lo, hi)`. -/
theorem nodeCapNu_of_rangeOK {eps nu : ℚ} (heps : eps = Grothe.Lower.ε) (hν0 : 0 ≤ nu) (hν1 : nu < 1)
    {r : Row} {R : Sym2} {ch : List (ℕ × ℕ × ℕ)} {recs : List (ℕ × ℕ × Bool × Recipe)}
    {grids : List (ℕ × ℕ × ℚ)} {excl : List ℕ} {lo hi : ℕ}
    (hok : rangeOKNu eps nu r R ch recs grids excl lo hi = true) (hex : ExclCapsNu nu r R excl)
    {i : ℕ} (hlo : lo ≤ i) (hhi : i < hi) (hi : i < r.nodeList.length)
    (hc : isChord ch i = false) : NodeCapNu nu r R i := by
  simp only [rangeOKNu, Bool.and_eq_true, List.all_eq_true] at hok
  obtain ⟨hadm, hall⟩ := hok
  by_cases hx : i ∈ excl
  · exact hex i hx hi
  have hx' : excl.contains i = false := by simp [hx]
  have := hall i (List.mem_range'_1.2 ⟨hlo, by omega⟩)
  simp only [nodeCheckNu, hc, hx', Bool.false_or] at this
  revert this
  cases hl : recs.lookup i with
  | none => simp
  | some x =>
    obtain ⟨g, gauss, rc⟩ := x
    simp only [Bool.and_eq_true, decide_eq_true_eq]
    rintro ⟨hg, hchk⟩
    have e1 : grids.getD g (0, 0, 0) = grids[g] := List.getD_eq_getElem _ _ hg
    have e2 : (List.map (fun G => mkTables G.1 G.2.1 G.2.2) grids).getD g ⟨#[], #[], #[]⟩
        = mkTables grids[g].1 grids[g].2.1 grids[g].2.2 := by
      rw [List.getD_eq_getElem _ _ (by simpa using hg), List.getElem_map]
    rw [e1, e2] at hchk
    have hG := hadm _ (List.getElem_mem hg)
    simp only [gridAdm, Bool.and_eq_true, decide_eq_true_eq] at hG
    obtain ⟨⟨⟨⟨hh, h1⟩, h8⟩, hN⟩, hN'⟩ := hG
    have hNr : 0 < grids[g].1 := by
      by_contra h0
      have : grids[g].1 = 0 := by omega
      rw [this] at h1; norm_num at h1
    exact pot_le_of_nodeOKNu heps _ _ nu hν0 hν1 _ _ rc gauss _ _ _ _
      (tablesOK_mk hh h1 h8 hN hN') hh (by omega) hNr hchk

/-- **A node from its pieces** (semantic form): if the pieces cover the fibre space modulo the
symmetries and the piece bound holds on every piece, the node cap holds. -/
theorem nodeCapNu_of_pieceCaps (nu : ℚ) (r : Row) (R : Sym2)
    (x : ℕ × ℕ × List String × List String) (hcov : pieceCoverOK x = true)
    (hp : ∀ cs ∈ pieceCons x, PieceCapNu nu r R x.2.1 cs) : NodeCapNu nu r R x.2.1 := by
  simp only [pieceCoverOK, Bool.and_eq_true] at hcov
  exact pot_le_of_pieceBoundsNu r R nu _ _ _ _ hcov.2 hp

/-- The constraint list of piece `j` of a node. -/
lemma pieceCons_getElem? (x : ℕ × ℕ × List String × List String) (j : ℕ) :
    (pieceCons x)[j]? = (x.2.2.2[j]?).map fun p => (parsePiece (parseDirs x.2.2.1) p).2.2 := by
  simp only [pieceCons, pieceList, List.getElem?_map, Option.map_map]
  rfl

/-- **A passing piece check with a tail gives its piece bound.** -/
theorem pieceCapNu_of_pieceOneOK {eps nu : ℚ} (heps : eps = Grothe.Lower.ε) (hν0 : 0 ≤ nu) (hν1 : nu < 1)
    (r : Row) (R : Sym2) (x : ℕ × ℕ × List String × List String) (j : ℕ)
    (hg : ∀ p ∈ x.2.2.2, (parsePiece (parseDirs x.2.2.1) p).1 < pieceGrids.length)
    (h : pieceOneOKNu eps nu r R x j = true) :
    ∃ cs, (pieceCons x)[j]? = some cs ∧ PieceCapNu nu r R x.2.1 cs := by
  unfold pieceOneOKNu at h
  cases hj : x.2.2.2[j]? with
  | none => rw [hj] at h; exact absurd h (by simp)
  | some p =>
    rw [hj] at h
    obtain ⟨hjl, hp⟩ := List.getElem?_eq_some_iff.1 hj
    have hgp : (parsePiece (parseDirs x.2.2.1) p).1 < pieceGrids.length :=
      hg p (hp ▸ List.getElem_mem hjl)
    refine ⟨(parsePiece (parseDirs x.2.2.1) p).2.2, by rw [pieceCons_getElem?, hj]; rfl, ?_⟩
    dsimp only at h
    generalize parsePiece (parseDirs x.2.2.1) p = y at h hgp ⊢
    have e1 : pieceGrids.getD y.1 (0, 0, 0) = pieceGrids[y.1] := List.getD_eq_getElem _ _ hgp
    have e2 : (pieceThunks.getD y.1 (Thunk.pure ⟨#[], #[], #[]⟩)).get
        = mkTables pieceGrids[y.1].1 pieceGrids[y.1].2.1 pieceGrids[y.1].2.2 := by
      have hl : y.1 < pieceThunks.length := by simpa [pieceThunks] using hgp
      rw [List.getD_eq_getElem _ _ hl]
      simp only [pieceThunks, List.getElem_map]
      rfl
    rw [e1, e2] at h
    have hG := pieceGrids_adm _ (List.getElem_mem hgp)
    simp only [gridAdm, Bool.and_eq_true, decide_eq_true_eq] at hG
    obtain ⟨⟨⟨⟨hh, h1⟩, h8⟩, hN⟩, hN'⟩ := hG
    have hNr : 0 < pieceGrids[y.1].1 := by
      by_contra h0
      have : pieceGrids[y.1].1 = 0 := by omega
      rw [this] at h1; norm_num at h1
    intro w hw
    exact Jpot_le_of_nodeOKcNu heps _ _ nu hν0 hν1 _ _ _ true _ _ _ _ _
      (tablesOK_mk hh h1 h8 hN hN') hh (by omega) hNr h w hw

/-- **A localised node from its facts**: the coverage fact and the piece checks of all its pieces
give the node cap. -/
theorem nodeCapNu_of_ranges {eps nu : ℚ} (heps : eps = Grothe.Lower.ε) (hν0 : 0 ≤ nu) (hν1 : nu < 1)
    (r : Row) (R : Sym2) (x : ℕ × ℕ × List String × List String) (hcov : pieceCoverOK x = true)
    (hok : ∀ j < x.2.2.2.length, pieceOneOKNu eps nu r R x j = true) :
    NodeCapNu nu r R x.2.1 := by
  have hg : ∀ p ∈ x.2.2.2, (parsePiece (parseDirs x.2.2.1) p).1 < pieceGrids.length := by
    have := hcov
    simp only [pieceCoverOK, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at this
    exact this.1
  refine nodeCapNu_of_pieceCaps nu r R x hcov fun cs hcs => ?_
  obtain ⟨j, hj, rfl⟩ := List.getElem_of_mem hcs
  have hj' : j < x.2.2.2.length := by simpa [pieceCons, pieceList] using hj
  obtain ⟨cs, hcs', hc⟩ := pieceCapNu_of_pieceOneOK heps hν0 hν1 r R x j hg (hok j hj')
  rw [List.getElem?_eq_getElem hj] at hcs'
  cases hcs'
  exact hc

/-- A range fact gives the piece checks of its range. -/
lemma pieceOneOKNu_of_range {eps nu : ℚ} {r : Row} {R : Sym2}
    {x : ℕ × ℕ × List String × List String} {lo hi j : ℕ}
    (h : pieceRangeOKNu eps nu r R x lo hi = true) (hlo : lo ≤ j) (hhi : j < hi) :
    pieceOneOKNu eps nu r R x j = true := by
  simp only [pieceRangeOKNu, List.all_eq_true, List.mem_range'_1] at h
  exact h j ⟨hlo, by omega⟩

/-! ### The chord nodes and the assembly -/

/-- `Ψ_ν − capPad` of a row with positive semidefinite blocks is convex on `[0, ∞)`, for every
tail. -/
lemma pot_sub_convexOn (ν : ℝ) (r : Row) (R : Sym2) (hE : r.E.psdOK = true)
    (hR : R.psdOK = true) :
    ConvexOn ℝ (Ici 0) (fun s => pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) ν s - capPad) := by
  have hc := pot_convexOn r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) ν hE hR
  refine ⟨convex_Ici 0, fun x _ y _ u v hu hv huv => ?_⟩
  have h := hc.2 (mem_univ x) (mem_univ y) hu hv huv
  simp only [smul_eq_mul] at h ⊢
  have : u * (capPad : ℝ) + v * capPad = capPad := by rw [← add_mul, huv, one_mul]
  linarith

/-- **The convex-hull step with a tail**: the caps of the vertex nodes of a row (at the lowered
caps) and the chord check against the lowered caps give the caps of all its nodes. -/
theorem nodeCaps_of_vertexCapsNu {nu : ℚ} {r : Row} {R : Sym2} {ch : List (ℕ × ℕ × ℕ)}
    (hE : r.E.psdOK = true) (hR : R.psdOK = true) (hch : chordOKLow r.nodeList ch = true)
    (h : VertexCapsRowNu nu r R ch) :
    ∀ m ∈ r.nodeList, pot r.E R r.ell r.beta (aFib r.b1 r.b2 r.b3) nu m.1 - capPad ≤ m.2 := by
  intro m hm
  have hconv := pot_sub_convexOn (nu : ℝ) r R hE hR
  unfold VertexCapsRowNu NodeCapNu at h
  have hlow : (0 : ℝ) ≤ ((capLow : ℚ) : ℝ) := by norm_num [capLow]
  generalize r.nodeList = ns at hm hch h
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.1 hm
  rw [← List.getD_eq_getElem _ (0, 0) hi]
  cases hc : isChord ch i with
  | false =>
    have := h i hi hc
    push_cast at this
    linarith
  | true =>
    obtain ⟨t, ht, hti⟩ := List.any_eq_true.1 hc
    have hti : t.1 = i := by simpa using hti
    have hn := List.all_eq_true.1 hch t ht
    simp only [chordNodeOKLow, Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at hn
    obtain ⟨⟨⟨⟨⟨⟨⟨hil, hjl⟩, hiv⟩, hjv⟩, h0⟩, h1⟩, h2⟩, hchd⟩ := hn
    rw [hti] at h1 h2 hchd
    have ha := h t.2.1 hil hiv
    have hb := h t.2.2 hjl hjv
    push_cast at ha hb
    have h0' : (0 : ℝ) ≤ ((ns.getD t.2.1 (0, 0)).1 : ℝ) := by exact_mod_cast h0
    have h1' : ((ns.getD t.2.1 (0, 0)).1 : ℝ) < (ns.getD i (0, 0)).1 := by exact_mod_cast h1
    have h2' : ((ns.getD i (0, 0)).1 : ℝ) < (ns.getD t.2.2 (0, 0)).1 := by exact_mod_cast h2
    have hch' : ((ns.getD t.2.1 (0, 0)).2 : ℝ)
        + ((ns.getD t.2.2 (0, 0)).2 - (ns.getD t.2.1 (0, 0)).2)
          / ((ns.getD t.2.2 (0, 0)).1 - (ns.getD t.2.1 (0, 0)).1)
          * ((ns.getD i (0, 0)).1 - (ns.getD t.2.1 (0, 0)).1) - (capLow : ℚ)
        ≤ (ns.getD i (0, 0)).2 := by
      exact_mod_cast hchd
    refine (chord_le _ hconv ((ns.getD t.2.1 (0, 0)).1 : ℝ) ((ns.getD t.2.2 (0, 0)).1 : ℝ) _ _
      ((ns.getD i (0, 0)).1 : ℝ) h0' (h1'.trans h2') h1'.le h2'.le ha hb).trans ?_
    convert hch' using 1
    ring

/-- **The node caps of the reduction with a tail**: for a tail `ν` whose hat value `nuHat ν` is
the rational `nu`, the node caps with the tail `nu` of every row of `rowData` (with its odd block
`rowR k`) are `TailNodeCaps (nuHat ν)`, the hypothesis of `sharedReduction_frame`. -/
theorem tailNodeCaps_nuHat {ν : ℝ} {nu : ℚ} (hν : nuHat ν = (nu : ℝ))
    (h : ∀ k, k < rowData.length → ∀ m ∈ (rowData.getD k row01).nodeList,
      pot (rowData.getD k row01).E (rowR k) (rowData.getD k row01).ell (rowData.getD k row01).beta
        (aFib (rowData.getD k row01).b1 (rowData.getD k row01).b2 (rowData.getD k row01).b3) nu
          m.1 - capPad ≤ m.2) :
    TailNodeCaps (nuHat ν) := by
  rw [hν]
  exact h

end

end Grothe.LowerAnalytic
