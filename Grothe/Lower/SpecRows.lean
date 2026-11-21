import Grothe.Lower.Mixed

/-!
# Rows with spectral nodes

A row certifies, on `x`-cells covering `[0, 31/4]`, a cap on `E Ψ(σ√U) − κσ²` for every admissible
law and `0 ≤ σ ≤ δρ` (`RowBound`, `Rows.lean`).  `checkRow` covers the `σ`-range of each cell by
moment rectangles and by chords between consecutive *Stein nodes* (`checkNode`).  This file is the
same checker with *spectral nodes*: a node is either a spectral witness in the format of the
spectral batches of the mixed tables (`SWit`, checked by `checkSWit` against the row's own node
table, `Mixed.lean`), which bounds `E Ψ` at its scale through one spectral cut (`TB.specNode`, or
the general or joint cut of a cited budget), or the zero node `σ = 0`, bounded by the first cap of
the table (`TB.zero`).  Between consecutive nodes the chord in `σ` minus the price `κσ²` must stay
below the cap, exactly as between Stein nodes.

* `swit_tb`: a checked witness bounds `E Ψ(τ√U)` by the larger of its majorant's bounds at the two
  ends of the cell;
* `chord_goal`: two such bounds, of any nodes, give the goal on the chord between them;
* `SCell`, `checkSCell`, `scell_sound`: a cell of moment rectangles and spectral nodes;
* `checkSpecCells`, `rowBound_of_specCells`: the cell part of a row, with the conclusion
  `RowBound` of `checkRow` (all that a row without gates needs);
* `checkSpecRow`, `rowFacts_of_checkSpecRow`: the gate and the price of `checkRow` with spectral
  cells; `RowFacts` is what `rowOf_of_shared` uses of a checked row, and `checkRow` gives it too
  (`rowFacts_of_checkRow`).

A cell is the string `xlo#xhi#rects#nodes`, with the rectangles `slo:shi:P` and the nodes separated
by `;` (in increasing `σ`); a node is `0` (the zero node) or a witness string of a spectral batch.
-/

open MeasureTheory

namespace Grothe.Lower

/-! ### Cells with spectral nodes -/

/-- A node of a spectral cell: the zero node (`σ = 0`) or a spectral witness. -/
inductive SpNode where
  | zero
  | wit (w : SWit)

/-- The scale `σ` of a node. -/
def SpNode.sigma : SpNode → ℚ
  | .zero => 0
  | .wit w => w.tau

/-- The bound of `E Ψ(σ√U)` at a node over the `x`-cell `[xlo, xhi]`: the first cap of the table
for the zero node; for a witness the larger value of its majorant's bound at the two ends. -/
def SpNode.val (nodes : List (ℚ × ℚ)) (xlo xhi : ℚ) : SpNode → ℚ
  | .zero => (nodes.headD (0, 0)).2
  | .wit w => max (w.y.Jq 0 1 xlo) (w.y.Jq 0 1 xhi)

/-- The check of a node of a cell that ends at `xhi`: the table starts at `0` (zero node); the
witness has a positive scale, passes `checkSWit` against the table, and a joint witness is
certified on the whole cell (`xhi ≤ x_*`). -/
def SpNode.ok (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (xhi : ℚ) : SpNode → Bool
  | .zero => headZero nodes
  | .wit w => decide (0 < w.tau) && checkSWit nodes smax vs w && decide (xhi ≤ w.bud.xcap)

/-- A piece of the `σ`-cover of a spectral cell: a moment rectangle or the chord of two nodes. -/
inductive SpPiece where
  | rect (r : Rect)
  | chord (p n : SpNode)

/-- The lower end of a piece. -/
def SpPiece.lo : SpPiece → ℚ
  | .rect r => r.slo
  | .chord p _ => p.sigma

/-- The upper end of a piece. -/
def SpPiece.hi : SpPiece → ℚ
  | .rect r => r.shi
  | .chord _ n => n.sigma

/-- An `x`-cell with its moment rectangles and its nodes (in increasing `σ`). -/
structure SCell where
  xlo : ℚ
  xhi : ℚ
  rects : List Rect
  nodes : List SpNode

/-- The rectangles followed by the chords of consecutive nodes. -/
def SCell.pieces (c : SCell) : List SpPiece :=
  c.rects.map .rect ++ (c.nodes.zip c.nodes.tail).map fun pn => .chord pn.1 pn.2

/-- The chord of two node bounds minus `κσ²` is at most the cap. -/
def spChordOK (nodes : List (ℚ × ℚ)) (kap cap xlo xhi : ℚ) (p n : SpNode) : Bool :=
  decide (p.sigma < n.sigma) &&
    decide (chordMax (p.val nodes xlo xhi) (n.val nodes xlo xhi) kap p.sigma n.sigma ≤ cap)

/-- The check of one piece. -/
def checkSpPiece (nodes : List (ℚ × ℚ)) (smax kap cap xlo xhi : ℚ) : SpPiece → Bool
  | .rect r => checkRect nodes smax kap cap xlo xhi r
  | .chord p n => spChordOK nodes kap cap xlo xhi p n

/-- **The cell check with spectral nodes**: the pieces cover `[0, stop]`, and every piece and
every node is certified. -/
def checkSCell (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (kap cap stop : ℚ) (c : SCell) :
    Bool :=
  decide (0 ≤ c.xlo) && chainTo SpPiece.lo SpPiece.hi 0 stop c.pieces &&
    c.pieces.all (checkSpPiece nodes smax kap cap c.xlo c.xhi) &&
    c.nodes.all (SpNode.ok nodes smax vs c.xhi)

/-! ### Parsing -/

/-- A node: `0` for the zero node, otherwise a spectral witness (`parseSWit`). -/
def parseSpNode (s : String) : SpNode := if s = "0" then .zero else .wit (parseSWit s)

/-- A cell `xlo#xhi#rects#nodes` (rectangles and nodes separated by `;`). -/
def parseSCell (s : String) : SCell :=
  match s.splitOn "#" with
  | [a, b, r, n] =>
    ⟨parseQ a, parseQ b, (splitL r ";").map parseRect, (splitL n ";").map parseSpNode⟩
  | _ => ⟨0, 0, [], []⟩

/-- The cells of a row with spectral nodes. -/
def Row.scellList (r : Row) : List SCell := r.cells.map parseSCell

/-! ### The row checks -/

/-- **The cell part of a row with spectral nodes**: the mesh is valid, the `x`-cells cover
`[0, 31/4]`, and every cell is certified up to `δρ`. -/
def checkSpecCells (r : Row) : Bool :=
  meshOK 0 r.vs && chainTo SCell.xlo SCell.xhi 0 xMax r.scellList &&
    allPar (checkSCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ)) r.scellList

/-- **The row check with spectral nodes**: the gate and the price of `checkRow`, and the cells with
spectral nodes. -/
def checkSpecRow (r : Row) : Bool :=
  decide (0 < r.delta) && gateOK r.N &&
    decide (r.kappa * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3) && checkSpecCells r

/-! ### Soundness -/

section real

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ} {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ}

/-- **A checked spectral witness bounds `E Ψ(τ√U)`** at its scale by the larger value of its
majorant's bound at the two ends of the `x`-cell, for every kind of cited budget (a joint witness
for `x ≤ x_*`). -/
lemma swit_tb (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (w : SWit) (h : checkSWit nodes smax vs w = true)
    (hxc : x ≤ w.bud.xcap) (xlo xhi : ℚ) (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) :
    TB μ U Ψ w.tau (max (w.y.Jq 0 1 xlo) (w.y.Jq 0 1 xhi) : ℚ) := by
  obtain ⟨hl, hm, hn, h1, h6, hfact⟩ := checkSWit_sound hΨ vs w h
  have hT : TB μ U Ψ w.tau (w.y.J 0 1 x) := by
    rcases hfact with ⟨-, hfact⟩ | ⟨hok, hfact⟩ | ⟨g, j, hgj, hok, hfact⟩
    · exact TB.specNode hM hS vs w.z w.lam w.mu w.t w.be w.nu hvs hl hm hn w.y h1 h6 _ hfact
    · exact TB.gspecNode hM hS vs w.z w.lam w.mu w.t w.be w.nu w.bud hvs hl hm hn hok w.y h1 h6 _
        hfact
    · have hx : x ≤ j.xs := by simpa only [hgj, GBud.xcap] using hxc
      exact TB.jspecNode hM hS vs w.z w.lam w.mu w.t w.be w.nu g j hvs hl hm hn hok hx w.y h1 h6
        _ hfact
  refine hT.mono ?_
  have e : ((max (w.y.Jq 0 1 xlo) (w.y.Jq 0 1 xhi) : ℚ) : ℝ)
      = max (w.y.J 0 1 xlo) (w.y.J 0 1 xhi) := by
    simp [MPoly.Jq_cast]
  rw [e]
  exact w.y.J_endpoint 0 1 x xlo xhi h6 hx0 hx1 hx2

/-- A checked node of a spectral cell bounds `E Ψ(σ√U)` at its scale by its value over the cell,
and its scale is nonnegative. -/
lemma spNode_tb (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (xlo xhi : ℚ) (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x)
    (hx2 : x ≤ xhi) (n : SpNode) (h : n.ok nodes smax vs xhi = true) :
    TB μ U Ψ n.sigma (n.val nodes xlo xhi : ℚ) ∧ 0 ≤ n.sigma := by
  cases n with
  | zero =>
    refine ⟨?_, le_refl _⟩
    cases nodes with
    | nil => nomatch h
    | cons m rest =>
      simp only [SpNode.ok, headZero, beq_iff_eq] at h
      have hc := h ▸ hΨ.caps m (List.mem_cons_self ..)
      simp only [SpNode.sigma, SpNode.val, List.headD_cons, Rat.cast_zero]
      exact TB.zero _ (by exact_mod_cast hc)
  | wit w =>
    simp only [SpNode.ok, Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨hτ, hc⟩, hxc⟩ := h
    exact ⟨swit_tb μ hM hS hΨ vs hvs w hc (hx2.trans (by exact_mod_cast hxc)) xlo xhi hx0 hx1 hx2,
      hτ.le⟩

omit [IsProbabilityMeasure μ] in
/-- **The chord of two node bounds pays the price**: bounds of `E Ψ` at `0 ≤ s₀ < s₁` by `v₀, v₁`
give the goal at every `σ ∈ [s₀, s₁]` when the chord minus `κσ²` stays below the cap. -/
lemma chord_goal (hconv : ConvexOn ℝ (Set.Ici 0) Ψ) (kap cap s0 s1 v0 v1 : ℚ) (h0 : 0 ≤ s0)
    (hlt : s0 < s1) (hT0 : TB μ U Ψ s0 v0) (hT1 : TB μ U Ψ s1 v1)
    (hq : chordMax v0 v1 kap s0 s1 ≤ cap) (σ : ℝ) (h1 : (s0 : ℝ) ≤ σ) (h2 : σ ≤ s1) :
    Goal μ U Ψ kap cap σ := by
  intro hf
  have hI := (TB.chord hconv _ _ σ _ _ (by exact_mod_cast h0) (by exact_mod_cast hlt) h1 h2 hT0
    hT1).integral hf
  have hc := chord_le_chordMax v0 v1 kap s0 s1 hlt σ h1 h2
  have hq' : ((chordMax v0 v1 kap s0 s1 : ℚ) : ℝ) ≤ cap := by exact_mod_cast hq
  linarith

/-- **Soundness of the cell check with spectral nodes.** -/
lemma scell_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (kap cap stop : ℚ) (c : SCell)
    (h : checkSCell nodes smax vs kap cap stop c = true) (hx1 : (c.xlo : ℝ) ≤ x)
    (hx2 : x ≤ c.xhi) (σ : ℝ) (h0 : 0 ≤ σ) (h1 : σ ≤ stop) : Goal μ U Ψ kap cap σ := by
  simp only [checkSCell, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨hx0, hchain⟩, hpieces⟩, hnodes⟩ := h
  obtain ⟨pc, hpc, hlo, hhi⟩ :=
    chainTo_sound SpPiece.lo SpPiece.hi c.pieces 0 stop hchain σ (by exact_mod_cast h0) h1
  have hok := hpieces pc hpc
  simp only [SCell.pieces, List.mem_append, List.mem_map] at hpc
  rcases hpc with ⟨r, -, rfl⟩ | ⟨⟨p, n⟩, hpn, rfl⟩
  · exact rect_sound μ hM hΨ kap cap c.xlo c.xhi r hok hx1 hx2 σ hlo hhi
  · obtain ⟨hp, hn⟩ := List.of_mem_zip hpn
    obtain ⟨hTp, hp0⟩ := spNode_tb μ hM hS hΨ vs hvs c.xlo c.xhi hx0 hx1 hx2 p (hnodes p hp)
    obtain ⟨hTn, -⟩ := spNode_tb μ hM hS hΨ vs hvs c.xlo c.xhi hx0 hx1 hx2 n
      (hnodes n (List.mem_of_mem_tail hn))
    simp only [checkSpPiece, spChordOK, Bool.and_eq_true, decide_eq_true_eq] at hok
    exact chord_goal μ hΨ.convex kap cap _ _ _ _ hp0 hok.1 hTp hTn hok.2 σ hlo hhi

end real

/-- **What the cell part with spectral nodes certifies**: the statement `RowBound` of
`checkRow`. -/
theorem rowBound_of_specCells (r : Row) (h : checkSpecCells r = true) : RowBound r := by
  simp only [checkSpecCells, allPar_eq, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨⟨hmesh, hchain⟩, hcells⟩ := h
  intro Ω _ μ _ U x Ψ σ hM hS hΨ h0 h1 hf
  obtain ⟨c, hc, hc1, hc2⟩ :=
    chainTo_sound SCell.xlo SCell.xhi r.scellList 0 xMax hchain x (by exact_mod_cast hM.x0) hM.x1
  exact scell_sound μ hM hS hΨ r.vs hmesh r.kappa r.cap (r.delta * ρ) c (hcells c hc) hc1 hc2 σ h0
    (by exact_mod_cast h1) hf

/-- What the consumers of a checked row use (`rowOf_of_shared`): the gate, the price and the row
bound. -/
def RowFacts (r : Row) : Prop :=
  0 < r.delta ∧ gateOK r.N = true ∧
    r.kappa * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3 ∧ RowBound r

/-- The row check with Stein nodes gives `RowFacts`. -/
theorem rowFacts_of_checkRow (r : Row) (h : checkRow r = true) : RowFacts r := by
  have hb := rowBound_of_check r h
  simp only [checkRow, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨hδ, hok⟩, hκ⟩, -⟩, -⟩, -⟩ := h
  exact ⟨hδ, hok, hκ, hb⟩

/-- **The row check with spectral nodes gives `RowFacts`.** -/
theorem rowFacts_of_checkSpecRow (r : Row) (h : checkSpecRow r = true) : RowFacts r := by
  simp only [checkSpecRow, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨hδ, hok⟩, hκ⟩, hc⟩ := h
  exact ⟨hδ, hok, hκ, rowBound_of_specCells r hc⟩

end Grothe.Lower
