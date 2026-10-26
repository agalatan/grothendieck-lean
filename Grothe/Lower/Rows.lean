import Grothe.Lower.Gate

/-!
# Rows: data, the exact checker, and its soundness

A *row* of the certificate consists of the forcing parameters `(ℓ, β)`, the penalty parameter
`δ`, the even block `M_E` and the coupling vector `b` (which define the gate form with
`N = M_E − diag(ε − δ, 0, 0)` and `g = δ b`, `Gate.lean`), a price `κ` with
`κδ² ≤ δ + gatePrice(N, g)`, the node caps of its potential `Ψ` with the Lipschitz constant
`smax`, and a cap on `E Ψ(σ√U) − κσ²` over all admissible laws and `0 ≤ σ ≤ δρ`.  The cap is
certified on `x`-cells covering `[0, 31/4]`; on each cell the interval `[0, δρ]` of `σ` is covered
by consecutive *pieces*: moment rectangles (a polynomial majorant of `Ψ` integrated against the
moment bounds, `rect_sound`), and chords between consecutive *nodes* `σᵢ < σᵢ₊₁`: at each node a
polynomial in `v = |q|/σᵢ` majorizes `Ψ(σᵢ v)` plus a nonnegative combination of Stein cuts
(`node_sound`), which bounds `E Ψ` at `σᵢ`, and convexity in `σ` bounds it between two nodes by
the chord (`chord_sound`).

`checkRow` verifies the gate and the price, the mesh, the `x`-coverage and every cell (in
parallel); `rowBound_of_check` is the resulting statement `RowBound`.
-/

open MeasureTheory

namespace Grothe.Lower

/-- A moment rectangle in `σ` with its majorant. -/
structure Rect where
  slo : ℚ
  shi : ℚ
  P : MPoly

/-- A node: `σ`, the majorant in `v`, and the cuts `(weight, index in the bank)`. -/
structure SNode where
  sigma : ℚ
  y : MPoly
  cuts : List (ℚ × ℕ)

/-- An `x`-cell with its moment rectangles, its bank of cut vectors and its nodes. -/
structure XCell where
  xlo : ℚ
  xhi : ℚ
  rects : List Rect
  bank : List (List ℚ)
  nodes : List SNode

/-! ### The gate form of a row -/

/-- `N = M_E − diag(ε − δ, 0, 0)`. -/
def Row.N (r : Row) : Sym3 := r.E.subDiag (ε - r.delta) 0 0

/-- `g = δ b`. -/
def Row.g1 (r : Row) : ℚ := r.delta * r.b1
def Row.g2 (r : Row) : ℚ := r.delta * r.b2
def Row.g3 (r : Row) : ℚ := r.delta * r.b3

/-- The retained gate expression `X*N X + 2 Re(conj X₁ (g·X))` of a row. -/
def Row.gate (r : Row) (X1 X2 X3 : ℂ) : ℝ := gateForm r.N r.g1 r.g2 r.g3 X1 X2 X3

/-! ### Parsing -/

def parseMPoly (s : String) : MPoly :=
  match parseQs s with
  | [a, b, c, d, e] => ⟨a, b, c, d, e⟩
  | _ => ⟨0, 0, 0, 0, 0⟩

def parseRect (s : String) : Rect :=
  match s.splitOn ":" with
  | [a, b, p] => ⟨parseQ a, parseQ b, parseMPoly p⟩
  | _ => ⟨0, 0, ⟨0, 0, 0, 0, 0⟩⟩

/-- Integers over a common denominator. -/
def parseInts (den : ℚ) (s : String) : List ℚ := (splitL s ",").map fun t => (t.toInt! : ℚ) / den

def parseCuts : List String → List (ℚ × ℕ)
  | a :: b :: r => ((a.toInt! : ℚ) / 10000000000, b.toNat!) :: parseCuts r
  | _ => []

def parseSNode (s : String) : SNode :=
  match s.splitOn ":" with
  | [a, p, c] => ⟨parseQ a, parseMPoly p, parseCuts (splitL c ",")⟩
  | _ => ⟨0, ⟨0, 0, 0, 0, 0⟩, []⟩

def parseXCell (s : String) : XCell :=
  match s.splitOn "|" with
  | [a, b, r, k, n] => ⟨parseQ a, parseQ b, (splitL r ";").map parseRect,
      (splitL k ";").map (parseInts 10000000), (splitL n ";").map parseSNode⟩
  | _ => ⟨0, 0, [], [], []⟩

def Row.vs (r : Row) : List ℚ := parseQs r.mesh
def Row.cellList (r : Row) : List XCell := r.cells.map parseXCell

/-! ### The checker -/

/-- `P ≥ Ψ` on `[0, ∞)`. -/
def majOK (nodes : List (ℚ × ℚ)) (smax : ℚ) (P : MPoly) : Bool :=
  sweepTop 1 smax P.list (fun _ => []) [] nodes

def checkRect (nodes : List (ℚ × ℚ)) (smax kap cap xlo xhi : ℚ) (r : Rect) : Bool :=
  decide (0 ≤ r.P.a1) && decide (0 ≤ r.slo) && majOK nodes smax r.P &&
    checkJ r.P kap cap r.slo r.shi xlo xhi

/-- The cuts of a node as `(weight, cut vector)`. -/
def nodeCutList (bank : List (List ℚ)) (n : SNode) : List (ℚ × List ℚ) :=
  n.cuts.map fun c => (c.1, bank.getD c.2 [])

/-- The polynomial pieces of the cut combination of a node, from the table of the bank. -/
def nodeCp (table : List (List (List ℚ))) (n : SNode) (k : ℕ) : List ℚ :=
  sumPoly (n.cuts.map fun c => (c.1, table.getD c.2 [])) k

def checkNode (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (table : List (List (List ℚ)))
    (n : SNode) : Bool :=
  let arr := (List.range (vs.length + 1)).map (nodeCp table n)
  decide (0 ≤ n.y.a1) && decide (0 ≤ n.y.a6) &&
    n.cuts.all (fun c => decide (0 ≤ c.1) && decide (c.2 < table.length)) &&
    sweepTop n.sigma smax n.y.list (fun k => arr.getD k []) vs nodes

/-- The cap of `E Ψ` at a node over the `x`-cell. -/
def nodeW (n : SNode) (xlo xhi : ℚ) : ℚ := max (n.y.Jq 0 1 xlo) (n.y.Jq 0 1 xhi)

/-- The chord of two node caps minus `κσ²` is at most the cap. -/
def chordOK (kap cap xlo xhi : ℚ) (p n : SNode) : Bool :=
  decide (p.sigma < n.sigma) &&
    decide (chordMax (nodeW p xlo xhi) (nodeW n xlo xhi) kap p.sigma n.sigma ≤ cap)

/-- A piece of the `σ`-cover of a cell: a moment rectangle or the chord of two nodes. -/
inductive Piece where
  | rect (r : Rect)
  | chord (p n : SNode)

def Piece.lo : Piece → ℚ
  | .rect r => r.slo
  | .chord p _ => p.sigma

def Piece.hi : Piece → ℚ
  | .rect r => r.shi
  | .chord _ n => n.sigma

/-- The rectangles followed by the chords of consecutive nodes. -/
def XCell.pieces (c : XCell) : List Piece :=
  c.rects.map .rect ++ (c.nodes.zip c.nodes.tail).map fun pn => .chord pn.1 pn.2

def checkPiece (nodes : List (ℚ × ℚ)) (smax kap cap xlo xhi : ℚ) : Piece → Bool
  | .rect r => checkRect nodes smax kap cap xlo xhi r
  | .chord p n => chordOK kap cap xlo xhi p n

/-- The cell check: the pieces cover `[0, stop]`, and every piece and every node is certified. -/
def checkCell (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (kap cap stop : ℚ) (c : XCell) :
    Bool :=
  decide (0 ≤ c.xlo) && chainTo Piece.lo Piece.hi 0 stop c.pieces &&
    c.pieces.all (checkPiece nodes smax kap cap c.xlo c.xhi) &&
    c.nodes.all (checkNode nodes smax vs (c.bank.map (cutPolys vs)))

/-- The row check: the trailing gate block is positive definite and the price is covered by the
pinned gate price, `κδ² ≤ δ + gatePrice(N, g)`; the mesh is valid, the `x`-cells cover
`[0, 31/4]`, and every cell is certified up to `δρ` (the cells in parallel). -/
def checkRow (r : Row) : Bool :=
  decide (0 < r.delta) && gateOK r.N &&
    decide (r.kappa * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3) &&
    meshOK 0 r.vs && chainTo XCell.xlo XCell.xhi 0 xMax r.cellList &&
    allPar (checkCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ)) r.cellList

/-! ### Soundness -/

lemma checkJ_a6 (p : MPoly) (kap cap slo shi xlo xhi : ℚ)
    (h : checkJ p kap cap slo shi xlo xhi = true) : 0 ≤ p.a6 := by
  simp only [checkJ, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h.1.1.1.1

lemma nodeCp_eq (vs : List ℚ) (bank : List (List ℚ)) (n : SNode) (k : ℕ)
    (h : ∀ c ∈ n.cuts, c.2 < bank.length) :
    nodeCp (bank.map (cutPolys vs)) n k
      = sumPoly ((nodeCutList bank n).map fun c => (c.1, cutPolys vs c.2)) k := by
  simp only [nodeCp, nodeCutList, List.map_map]
  congr 1
  refine List.map_congr_left fun c hc => ?_
  have hlt := h c hc
  simp only [Function.comp_apply]
  rw [List.getD_eq_getElem _ _ (by simpa using hlt), List.getD_eq_getElem _ _ hlt,
    List.getElem_map]

/-- The pointwise inequality certified at a node. -/
def NodeFact (Ψ : ℝ → ℝ) (vs : List ℚ) (bank : List (List ℚ)) (n : SNode) : Prop :=
  ∀ v : ℝ, 0 ≤ v →
    Ψ (n.sigma * v) + cutSum vs (nodeCutList bank n) v ≤ evalL (n.y.list.map ((↑) : ℚ → ℝ)) v

lemma node_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ} (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (bank : List (List ℚ)) (n : SNode)
    (h : checkNode nodes smax vs (bank.map (cutPolys vs)) n = true) :
    NodeFact Ψ vs bank n ∧ 0 ≤ n.y.a1 ∧ 0 ≤ n.y.a6 ∧ (∀ c ∈ nodeCutList bank n, 0 ≤ c.1) ∧
      0 < n.sigma := by
  simp only [checkNode, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true,
    List.length_map] at h
  obtain ⟨⟨⟨h1, h6⟩, hc⟩, hsw⟩ := h
  refine ⟨fun v hv => ?_, h1, h6, ?_, ?_⟩
  · refine major_sound Ψ nodes smax hΨ n.sigma n.y.list _ vs _ (fun w _ hk => ?_) hsw v hv
    have hlt : pickIdx vs w < vs.length + 1 := Nat.lt_succ_of_le (pickIdx_le vs w)
    rw [List.getD_eq_getElem?_getD, List.getElem?_map, List.getElem?_range hlt]
    show _ = evalL ((nodeCp (bank.map (cutPolys vs)) n (pickIdx vs w)).map ((↑) : ℚ → ℝ)) w
    rw [nodeCp_eq vs bank n _ fun c hc' => (hc c hc').2]
    exact cutSum_cell vs _ w hk
  · intro c hc'
    obtain ⟨d, hd, rfl⟩ := List.mem_map.1 hc'
    exact (hc d hd).1
  · simp only [sweepTop, Bool.and_eq_true, decide_eq_true_eq] at hsw
    exact hsw.1.1

section real

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ} {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ}

/-- A checked node bounds `E Ψ(σ√U)` at its scale by its cap over the `x`-cell. -/
lemma node_tb (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (bank : List (List ℚ)) (n : SNode)
    (h : checkNode nodes smax vs (bank.map (cutPolys vs)) n = true) (xlo xhi : ℚ)
    (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) :
    TB μ U Ψ n.sigma (nodeW n xlo xhi : ℚ) ∧ 0 < n.sigma := by
  obtain ⟨hfact, h1, h6, hc, hσ⟩ := node_sound hΨ vs bank n h
  refine ⟨(TB.node hM hS vs hvs _ hc n.y h1 h6 _ hfact).mono ?_, hσ⟩
  have e : ((nodeW n xlo xhi : ℚ) : ℝ) = max (n.y.J 0 1 xlo) (n.y.J 0 1 xhi) := by
    simp [nodeW, MPoly.Jq_cast]
  rw [e]
  exact n.y.J_endpoint 0 1 x xlo xhi h6 hx0 hx1 hx2

/-- The bound to be certified at scale `σ`. -/
def Goal (μ : Measure Ω) (U : Ω → ℝ) (Ψ : ℝ → ℝ) (kap cap : ℚ) (σ : ℝ) : Prop :=
  Integrable (fun ω => Ψ (σ * √(U ω))) μ → ∫ ω, Ψ (σ * √(U ω)) ∂μ - kap * σ ^ 2 ≤ cap

lemma rect_sound (hM : Moments μ U x) (hΨ : CapsHold Ψ nodes smax) (kap cap xlo xhi : ℚ)
    (r : Rect) (h : checkRect nodes smax kap cap xlo xhi r = true) (hx1 : (xlo : ℝ) ≤ x)
    (hx2 : x ≤ xhi) (σ : ℝ) (h1 : (r.slo : ℝ) ≤ σ) (h2 : σ ≤ r.shi) : Goal μ U Ψ kap cap σ := by
  simp only [checkRect, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨ha1, hs0⟩, hmaj⟩, hJ⟩ := h
  intro hf
  have hσ : 0 ≤ σ := le_trans (by exact_mod_cast hs0) h1
  have hle : ∀ ω, Ψ (σ * √(U ω)) ≤ evalL (r.P.list.map ((↑) : ℚ → ℝ)) (σ * √(U ω)) := by
    intro ω
    have := major_sound Ψ nodes smax hΨ 1 r.P.list (fun _ => []) [] (fun _ => 0)
      (by intro v _ _; simp [evalL]) hmaj (σ * √(U ω)) (mul_nonneg hσ (Real.sqrt_nonneg _))
    simpa using this
  exact (rect_integral μ hM r.P ha1 (checkJ_a6 _ _ _ _ _ _ _ hJ) kap σ hσ _ hf hle).trans
    (checkJ_sound _ _ _ _ _ _ _ hJ σ x h1 h2 hx1 hx2)

lemma chord_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (bank : List (List ℚ)) (kap cap xlo xhi : ℚ)
    (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) (p n : SNode)
    (hp : checkNode nodes smax vs (bank.map (cutPolys vs)) p = true)
    (hn : checkNode nodes smax vs (bank.map (cutPolys vs)) n = true)
    (hch : chordOK kap cap xlo xhi p n = true) (σ : ℝ) (h1 : (p.sigma : ℝ) ≤ σ)
    (h2 : σ ≤ n.sigma) : Goal μ U Ψ kap cap σ := by
  obtain ⟨hTp, hpσ⟩ := node_tb μ hM hS hΨ vs hvs bank p hp xlo xhi hx0 hx1 hx2
  obtain ⟨hTn, -⟩ := node_tb μ hM hS hΨ vs hvs bank n hn xlo xhi hx0 hx1 hx2
  simp only [chordOK, Bool.and_eq_true, decide_eq_true_eq] at hch
  obtain ⟨hlt, hq⟩ := hch
  intro hf
  have hI := (TB.chord hΨ.convex _ _ σ _ _ (by exact_mod_cast hpσ.le) (by exact_mod_cast hlt) h1
    h2 hTp hTn).integral hf
  have hc := chord_le_chordMax (nodeW p xlo xhi) (nodeW n xlo xhi) kap p.sigma n.sigma hlt σ h1 h2
  have hq' : ((chordMax (nodeW p xlo xhi) (nodeW n xlo xhi) kap p.sigma n.sigma : ℚ) : ℝ)
      ≤ cap := by exact_mod_cast hq
  linarith

lemma cell_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (kap cap stop : ℚ) (c : XCell)
    (h : checkCell nodes smax vs kap cap stop c = true) (hx1 : (c.xlo : ℝ) ≤ x)
    (hx2 : x ≤ c.xhi) (σ : ℝ) (h0 : 0 ≤ σ) (h1 : σ ≤ stop) : Goal μ U Ψ kap cap σ := by
  simp only [checkCell, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨hx0, hchain⟩, hpieces⟩, hnodes⟩ := h
  obtain ⟨pc, hpc, hlo, hhi⟩ :=
    chainTo_sound Piece.lo Piece.hi c.pieces 0 stop hchain σ (by simpa using h0) h1
  have hok := hpieces pc hpc
  simp only [XCell.pieces, List.mem_append, List.mem_map] at hpc
  rcases hpc with ⟨r, -, rfl⟩ | ⟨⟨p, n⟩, hpn, rfl⟩
  · exact rect_sound μ hM hΨ kap cap c.xlo c.xhi r hok hx1 hx2 σ hlo hhi
  · obtain ⟨hp, hn⟩ := List.of_mem_zip hpn
    exact chord_sound μ hM hS hΨ vs hvs c.bank kap cap c.xlo c.xhi hx0 hx1 hx2 p n
      (hnodes p hp) (hnodes n (List.mem_of_mem_tail hn)) hok σ hlo hhi

end real

/-- **What the row check certifies**: for every law of the normalized residual satisfying the
moment bounds and the Stein cuts, every potential with the node caps of the row and every
`0 ≤ σ ≤ δρ`, the integrated potential minus the price `κσ²` is at most the cap. -/
def RowBound (r : Row) : Prop :=
  ∀ (Ω : Type) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (U : Ω → ℝ)
    (x : ℝ) (Ψ : ℝ → ℝ) (σ : ℝ), Moments μ U x → SteinCut μ U →
    CapsHold Ψ r.nodeList r.smax → 0 ≤ σ → σ ≤ r.delta * ρ →
    Integrable (fun ω => Ψ (σ * √(U ω))) μ →
    ∫ ω, Ψ (σ * √(U ω)) ∂μ - r.kappa * σ ^ 2 ≤ r.cap

theorem rowBound_of_check (r : Row) (h : checkRow r = true) : RowBound r := by
  simp only [checkRow, allPar_eq, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨-, hmesh⟩, hchain⟩, hcells⟩ := h
  intro Ω _ μ _ U x Ψ σ hM hS hΨ h0 h1 hf
  obtain ⟨c, hc, hc1, hc2⟩ :=
    chainTo_sound XCell.xlo XCell.xhi r.cellList 0 xMax hchain x (by simpa using hM.x0) hM.x1
  exact cell_sound μ hM hS hΨ r.vs hmesh r.kappa r.cap (r.delta * ρ) c (hcells c hc) hc1 hc2 σ h0
    (by push_cast; exact h1) hf

end Grothe.Lower
