import Grothe.Lower.Gates
import Grothe.Lower.Law

/-!
# Rows: data, the exact checker, and its soundness

A *row* of the certificate consists of the forcing parameters `(ℓ, β)`, the penalty parameter
`δ`, the even/odd blocks `(M_E, M_R)`, a coupling vector `b`, the price `κ ≤ 1/δ − bᵀN⁻¹b`
(`N = M_E − diag(ε − δ, 0, 0) ≻ 0`), the node caps of its potential `Ψ` with the Lipschitz
constant `smax`, and a cap on `E Ψ(|q|) − κσ²` over all admissible residuals.  The cap is
certified on `x`-cells covering `[0, 31/4]`; in each cell, for `σ` up to the first *node*,
by moment rectangles (a polynomial majorant of `Ψ` integrated against the moment bounds,
`rect_sound`), and beyond it by a chain of nodes `σ₁ < σ₂ < …`: at each node a polynomial in
`v = |q|/σᵢ` majorizes `Ψ(σᵢ v)` plus a nonnegative combination of Stein cuts (`node_sound`),
which bounds `E Ψ` at `σᵢ`, and convexity in `σ` bounds it between two nodes by the chord
(`chord_sound`).

`checkRow` verifies the header (gates, `κ`, `smax`), the mesh, the `x`-coverage and every cell
(in parallel); `rowBound_of_check` is the resulting statement `RowBound`.
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

structure Row where
  name : String
  ell : ℚ
  beta : ℚ
  delta : ℚ
  kappa : ℚ
  smax : ℚ
  cap : ℚ
  E : Sym3
  R : Sym2
  b1 : ℚ
  b2 : ℚ
  b3 : ℚ
  /-- `N⁻¹ b` -/
  c1 : ℚ
  c2 : ℚ
  c3 : ℚ
  gates : GateCert
  nPD : LDL3
  /-- node caps `r:c;…` -/
  nodes : String
  /-- mesh `v₁,v₂,…` -/
  mesh : String
  /-- the `x`-cells `xlo|xhi|rects|bank|nodes` -/
  cells : List String

/-! ### Parsing -/

def splitL (s sep : String) : List String := if s = "" then [] else s.splitOn sep

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

def parseCap (s : String) : ℚ × ℚ :=
  match s.splitOn ":" with
  | [a, b] => (parseQ a, parseQ b)
  | _ => (0, 0)

def Row.nodeList (r : Row) : List (ℚ × ℚ) := (splitL r.nodes ";").map parseCap
def Row.vs (r : Row) : List ℚ := parseQs r.mesh
def Row.cellList (r : Row) : List XCell := r.cells.map parseXCell

/-! ### The checker -/

/-- `P ≥ Ψ` on `[0, ∞)`. -/
def majOK (nodes : List (ℚ × ℚ)) (smax : ℚ) (P : MPoly) : Bool :=
  sweepTop 1 smax P.list (fun _ => []) [] nodes

def checkRect (nodes : List (ℚ × ℚ)) (smax kap cap xlo xhi : ℚ) (r : Rect) : Bool :=
  decide (0 ≤ r.P.a1) && decide (0 ≤ r.slo) && majOK nodes smax r.P &&
    checkJ r.P kap cap r.slo r.shi xlo xhi

/-- Consecutive certified rectangles from `prev`. -/
def rectsOK (nodes : List (ℚ × ℚ)) (smax kap cap xlo xhi : ℚ) : ℚ → List Rect → Bool
  | _, [] => true
  | prev, r :: rest => (r.slo == prev) && checkRect nodes smax kap cap xlo xhi r &&
      rectsOK nodes smax kap cap xlo xhi r.shi rest

def rectsEnd : ℚ → List Rect → ℚ
  | prev, [] => prev
  | _, r :: rest => rectsEnd r.shi rest

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

def chordSlope (p n : SNode) (xlo xhi : ℚ) : ℚ :=
  (nodeW n xlo xhi - nodeW p xlo xhi) / (n.sigma - p.sigma)

/-- The chord of two node caps minus `κσ²` is at most the cap. -/
def chordOK (kap cap xlo xhi : ℚ) (p n : SNode) : Bool :=
  decide (p.sigma < n.sigma) &&
    decide (quadMax (nodeW p xlo xhi - chordSlope p n xlo xhi * p.sigma) (chordSlope p n xlo xhi)
      (-kap) p.sigma n.sigma ≤ cap)

def chainOK (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (table : List (List (List ℚ)))
    (kap cap xlo xhi : ℚ) : SNode → List SNode → Bool
  | _, [] => true
  | p, n :: rest => checkNode nodes smax vs table n && chordOK kap cap xlo xhi p n &&
      chainOK nodes smax vs table kap cap xlo xhi n rest

def chainEnd : SNode → List SNode → ℚ
  | p, [] => p.sigma
  | _, n :: rest => chainEnd n rest

def checkCell (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (kap cap stop : ℚ) (c : XCell) :
    Bool :=
  decide (0 ≤ c.xlo) && !c.rects.isEmpty && rectsOK nodes smax kap cap c.xlo c.xhi 0 c.rects &&
  match c.nodes with
  | [] => decide (stop ≤ rectsEnd 0 c.rects)
  | n :: rest =>
    (n.sigma == rectsEnd 0 c.rects) && checkNode nodes smax vs (c.bank.map (cutPolys vs)) n &&
    chainOK nodes smax vs (c.bank.map (cutPolys vs)) kap cap c.xlo c.xhi n rest &&
    decide (stop ≤ chainEnd n rest)

/-- Consecutive `x`-cells from `prev`. -/
def xChain : ℚ → List XCell → Bool
  | _, [] => true
  | prev, c :: rest => (c.xlo == prev) && xChain c.xhi rest

def xEnd : ℚ → List XCell → ℚ
  | prev, [] => prev
  | _, c :: rest => xEnd c.xhi rest

/-- `N = M_E − diag(ε − δ, 0, 0)`. -/
def Row.N (r : Row) : Sym3 := r.E.subDiag (ε - r.delta) 0 0

def checkHeader (r : Row) : Bool :=
  decide (0 < r.delta) && decide (r.delta < ε) && decide (0 ≤ r.beta) &&
  decide (2 * r.beta ≤ r.ell) && checkGates ε r.E r.R r.delta r.gates && checkPD3 r.N r.nPD &&
  (r.N.m11 * r.c1 + r.N.m12 * r.c2 + r.N.m13 * r.c3 == r.b1) &&
  (r.N.m12 * r.c1 + r.N.m22 * r.c2 + r.N.m23 * r.c3 == r.b2) &&
  (r.N.m13 * r.c1 + r.N.m23 * r.c2 + r.N.m33 * r.c3 == r.b3) &&
  decide (0 < r.kappa) &&
  decide (r.kappa ≤ 1 / r.delta - (r.b1 * r.c1 + r.b2 * r.c2 + r.b3 * r.c3)) &&
  decide (2 * (|1 + r.b1| + 7358 / 10000 * |r.b2| + 707107 / 1000000 * |r.b3|) ≤ r.smax)

/-- The row check; the cells are checked in parallel. -/
def checkRow (r : Row) : Bool :=
  checkHeader r && meshOK 0 r.vs && !r.cellList.isEmpty && xChain 0 r.cellList &&
  decide (xMax ≤ xEnd 0 r.cellList) &&
  (r.cellList.map fun c => Task.spawn fun _ =>
    checkCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ) c).all Task.get

/-! ### Soundness -/

/-- The header facts of a row: the matrix gates at `ε`, `N ≻ 0`, `N c = b`,
`0 < κ ≤ 1/δ − b·c`, and the Lipschitz constant. -/
structure HeaderOK (r : Row) : Prop where
  delta_pos : 0 < r.delta
  delta_lt : r.delta < ε
  beta_nonneg : 0 ≤ r.beta
  ell_ge : 2 * r.beta ≤ r.ell
  gates : GateProp ε r.E r.R r.delta
  nPD : PD3 r.N
  solve1 : r.N.m11 * r.c1 + r.N.m12 * r.c2 + r.N.m13 * r.c3 = r.b1
  solve2 : r.N.m12 * r.c1 + r.N.m22 * r.c2 + r.N.m23 * r.c3 = r.b2
  solve3 : r.N.m13 * r.c1 + r.N.m23 * r.c2 + r.N.m33 * r.c3 = r.b3
  kappa_pos : 0 < r.kappa
  kappa_le : r.kappa ≤ 1 / r.delta - (r.b1 * r.c1 + r.b2 * r.c2 + r.b3 * r.c3)
  smax_ge : 2 * (|1 + r.b1| + 7358 / 10000 * |r.b2| + 707107 / 1000000 * |r.b3|) ≤ r.smax

theorem headerOK_of_check (r : Row) (h : checkHeader r = true) : HeaderOK r := by
  simp only [checkHeader, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩, h12⟩ := h
  exact ⟨h1, h2, h3, h4, gateProp_of_check _ _ _ _ _ h5, pd3_of_check _ _ h6, h7, h8, h9, h10,
    h11, h12⟩

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

lemma rects_sound (hM : Moments μ U x) (hΨ : CapsHold Ψ nodes smax) (kap cap xlo xhi : ℚ)
    (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) : ∀ (rects : List Rect) (prev : ℚ),
    rectsOK nodes smax kap cap xlo xhi prev rects = true → ∀ σ : ℝ, (prev : ℝ) ≤ σ →
      σ ≤ rectsEnd prev rects → rects ≠ [] → Goal μ U Ψ kap cap σ
  | [], _, _, _, _, _, hne => absurd rfl hne
  | r :: rest, prev, h, σ, h1, h2, _ => by
    simp only [rectsOK, Bool.and_eq_true, beq_iff_eq] at h
    obtain ⟨⟨hslo, hr⟩, hrest⟩ := h
    by_cases hσ : σ ≤ (r.shi : ℝ)
    · exact rect_sound μ hM hΨ kap cap xlo xhi r hr hx1 hx2 σ (by rw [hslo]; exact h1) hσ
    · have hne : rest ≠ [] := by
        rintro rfl
        exact hσ h2
      exact rects_sound hM hΨ kap cap xlo xhi hx1 hx2 rest r.shi hrest σ
        (le_of_lt (not_le.1 hσ)) h2 hne

lemma node_int (hM : Moments μ U x) (hS : SteinCut μ U) (vs : List ℚ)
    (hvs : meshOK 0 vs = true) (bank : List (List ℚ)) (n : SNode) (h1 : 0 ≤ n.y.a1)
    (h6 : 0 ≤ n.y.a6) (hc : ∀ c ∈ nodeCutList bank n, 0 ≤ c.1) (xlo xhi : ℚ) (hx0 : 0 ≤ xlo)
    (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) :
    Integrable (fun ω => evalL (n.y.list.map ((↑) : ℚ → ℝ)) (√(U ω))
      - cutSum vs (nodeCutList bank n) (√(U ω))) μ ∧
    ∫ ω, (evalL (n.y.list.map ((↑) : ℚ → ℝ)) (√(U ω))
      - cutSum vs (nodeCutList bank n) (√(U ω))) ∂μ ≤ (nodeW n xlo xhi : ℚ) := by
  obtain ⟨hi, hv⟩ := node_fn μ hM hS vs hvs n.y h1 h6 _ hc
  refine ⟨hi, hv.trans ?_⟩
  have h := n.y.J_endpoint 0 1 x xlo xhi h6 hx0 hx1 hx2
  have e : ((nodeW n xlo xhi : ℚ) : ℝ) = max (n.y.J 0 1 xlo) (n.y.J 0 1 xhi) := by
    simp [nodeW, MPoly.Jq_cast]
  rw [e]
  exact h

lemma chord_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (bank : List (List ℚ)) (kap cap xlo xhi : ℚ)
    (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) (p n : SNode)
    (hp : checkNode nodes smax vs (bank.map (cutPolys vs)) p = true)
    (hn : checkNode nodes smax vs (bank.map (cutPolys vs)) n = true)
    (hch : chordOK kap cap xlo xhi p n = true) (σ : ℝ) (h1 : (p.sigma : ℝ) ≤ σ)
    (h2 : σ ≤ n.sigma) : Goal μ U Ψ kap cap σ := by
  obtain ⟨fp, hp1, hp6, hpc, hpσ⟩ := node_sound hΨ vs bank p hp
  obtain ⟨fn, hn1, hn6, hnc, hnσ⟩ := node_sound hΨ vs bank n hn
  obtain ⟨hBp, hVp⟩ := node_int μ hM hS vs hvs bank p hp1 hp6 hpc xlo xhi hx0 hx1 hx2
  obtain ⟨hBn, hVn⟩ := node_int μ hM hS vs hvs bank n hn1 hn6 hnc xlo xhi hx0 hx1 hx2
  simp only [chordOK, Bool.and_eq_true, decide_eq_true_eq] at hch
  obtain ⟨hlt, hq⟩ := hch
  intro hf
  have hltR : (p.sigma : ℝ) < n.sigma := by exact_mod_cast hlt
  have hd : (0 : ℝ) < n.sigma - p.sigma := by linarith
  have hdne : (n.sigma : ℝ) - p.sigma ≠ 0 := hd.ne'
  obtain ⟨lam, hlam⟩ : ∃ lam : ℝ, lam = (σ - p.sigma) / (n.sigma - p.sigma) := ⟨_, rfl⟩
  have l0 : 0 ≤ lam := by rw [hlam]; exact div_nonneg (by linarith) hd.le
  have l1 : lam ≤ 1 := by rw [hlam, div_le_one hd]; linarith
  have hσ : (1 - lam) * p.sigma + lam * n.sigma = σ := by rw [hlam]; field_simp; ring
  have hpσR : (0 : ℝ) ≤ p.sigma := by exact_mod_cast hpσ.le
  have hnσR : (0 : ℝ) ≤ n.sigma := by exact_mod_cast hnσ.le
  have hle : ∀ ω, Ψ (σ * √(U ω))
      ≤ (1 - lam) * (evalL (p.y.list.map ((↑) : ℚ → ℝ)) (√(U ω))
          - cutSum vs (nodeCutList bank p) (√(U ω)))
        + lam * (evalL (n.y.list.map ((↑) : ℚ → ℝ)) (√(U ω))
          - cutSum vs (nodeCutList bank n) (√(U ω))) := by
    intro ω
    have hs := Real.sqrt_nonneg (U ω)
    have hcv := hΨ.convex.2 (Set.mem_Ici.2 (mul_nonneg hpσR hs))
      (Set.mem_Ici.2 (mul_nonneg hnσR hs)) (by linarith : 0 ≤ 1 - lam) l0
      (by ring : (1 - lam) + lam = 1)
    simp only [smul_eq_mul] at hcv
    have e : (1 - lam) * (p.sigma * √(U ω)) + lam * (n.sigma * √(U ω)) = σ * √(U ω) := by
      rw [← hσ]; ring
    rw [e] at hcv
    have a := mul_le_mul_of_nonneg_left (fp _ hs) (by linarith : 0 ≤ 1 - lam)
    have b := mul_le_mul_of_nonneg_left (fn _ hs) l0
    linarith
  have hint := chord_integral μ _ _ _ lam _ _ l0 l1 hf hBp hBn hVp hVn hle
  have hquad := quadVal_le_quadMax (nodeW p xlo xhi - chordSlope p n xlo xhi * p.sigma)
    (chordSlope p n xlo xhi) (-kap) p.sigma n.sigma σ h1 h2
  have hcap : ((quadMax (nodeW p xlo xhi - chordSlope p n xlo xhi * p.sigma)
      (chordSlope p n xlo xhi) (-kap) p.sigma n.sigma : ℚ) : ℝ) ≤ cap := by exact_mod_cast hq
  have e : (1 - lam) * ((nodeW p xlo xhi : ℚ) : ℝ) + lam * ((nodeW n xlo xhi : ℚ) : ℝ)
      = ((nodeW p xlo xhi - chordSlope p n xlo xhi * p.sigma : ℚ) : ℝ)
        + ((chordSlope p n xlo xhi : ℚ) : ℝ) * σ := by
    simp only [chordSlope]
    push_cast
    rw [hlam]
    field_simp
    ring
  simp only [Rat.cast_neg] at hquad
  linarith

lemma chain_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (bank : List (List ℚ)) (kap cap xlo xhi : ℚ)
    (hx0 : 0 ≤ xlo) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) : ∀ (rest : List SNode) (p : SNode),
    chainOK nodes smax vs (bank.map (cutPolys vs)) kap cap xlo xhi p rest = true →
    checkNode nodes smax vs (bank.map (cutPolys vs)) p = true →
    ∀ σ : ℝ, (p.sigma : ℝ) ≤ σ → σ ≤ chainEnd p rest → rest ≠ [] → Goal μ U Ψ kap cap σ := by
  intro rest
  induction rest with
  | nil => intro p _ _ σ _ _ hne; exact absurd rfl hne
  | cons n rest ih =>
    intro p h hp σ h1 h2 _
    simp only [chainOK, Bool.and_eq_true] at h
    obtain ⟨⟨hn, hch⟩, hrest⟩ := h
    by_cases hσ : σ ≤ (n.sigma : ℝ)
    · exact chord_sound μ hM hS hΨ vs hvs bank kap cap xlo xhi hx0 hx1 hx2 p n hp hn hch σ h1 hσ
    · have hne : rest ≠ [] := by
        rintro rfl
        exact hσ h2
      exact ih n hrest hn σ (le_of_lt (not_le.1 hσ)) h2 hne

lemma cell_sound (hM : Moments μ U x) (hS : SteinCut μ U) (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (hvs : meshOK 0 vs = true) (kap cap stop : ℚ) (c : XCell)
    (h : checkCell nodes smax vs kap cap stop c = true) (hx1 : (c.xlo : ℝ) ≤ x)
    (hx2 : x ≤ c.xhi) (σ : ℝ) (h0 : 0 ≤ σ) (h1 : σ ≤ stop) : Goal μ U Ψ kap cap σ := by
  simp only [checkCell, Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true',
    List.isEmpty_eq_false_iff] at h
  obtain ⟨⟨⟨hx0, hne⟩, hrects⟩, hnodes⟩ := h
  have hR := rects_sound μ hM hΨ kap cap c.xlo c.xhi hx1 hx2 c.rects 0 hrects
  by_cases hσ : σ ≤ (rectsEnd 0 c.rects : ℝ)
  · exact hR σ (by simpa using h0) hσ hne
  · cases hn : c.nodes with
    | nil =>
      rw [hn] at hnodes
      simp only [decide_eq_true_eq] at hnodes
      exact absurd (h1.trans (by exact_mod_cast hnodes)) hσ
    | cons n rest =>
      rw [hn] at hnodes
      simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at hnodes
      obtain ⟨⟨⟨hs1, hnode⟩, hchain⟩, hstop⟩ := hnodes
      have h1' : σ ≤ (chainEnd n rest : ℝ) := h1.trans (by exact_mod_cast hstop)
      have hlo : (n.sigma : ℝ) ≤ σ := by rw [hs1]; exact le_of_lt (not_le.1 hσ)
      have hne' : rest ≠ [] := by
        rintro rfl
        simp only [chainEnd] at h1'
        rw [hs1] at h1'
        exact hσ h1'
      exact chain_sound μ hM hS hΨ vs hvs c.bank kap cap c.xlo c.xhi hx0 hx1 hx2 rest n hchain
        hnode σ hlo h1' hne'

end real

lemma xChain_sound : ∀ (cells : List XCell) (prev : ℚ), xChain prev cells = true →
    ∀ x : ℝ, (prev : ℝ) ≤ x → x ≤ xEnd prev cells → cells ≠ [] →
      ∃ c ∈ cells, (c.xlo : ℝ) ≤ x ∧ x ≤ c.xhi
  | [], _, _, _, _, _, hne => absurd rfl hne
  | c :: rest, prev, h, x, h1, h2, _ => by
    simp only [xChain, Bool.and_eq_true, beq_iff_eq] at h
    obtain ⟨hlo, hrest⟩ := h
    by_cases hx : x ≤ (c.xhi : ℝ)
    · exact ⟨c, List.mem_cons_self .., by rw [hlo]; exact h1, hx⟩
    · have hne : rest ≠ [] := by
        rintro rfl
        exact hx h2
      obtain ⟨d, hd, hd1, hd2⟩ := xChain_sound rest c.xhi hrest x (le_of_lt (not_le.1 hx)) h2 hne
      exact ⟨d, List.mem_cons_of_mem _ hd, hd1, hd2⟩

/-- **What the row check certifies**: for every law of the normalized residual satisfying the
moment bounds and the Stein cuts, every potential with the node caps of the row and every
`0 ≤ σ ≤ δρ`, the integrated potential minus the price `κσ²` is at most the cap. -/
def RowBound (r : Row) : Prop :=
  ∀ (Ω : Type) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (U : Ω → ℝ)
    (x : ℝ) (Ψ : ℝ → ℝ) (σ : ℝ), Moments μ U x → SteinCut μ U →
    CapsHold Ψ r.nodeList r.smax → 0 ≤ σ → σ ≤ r.delta * ρ →
    Integrable (fun ω => Ψ (σ * √(U ω))) μ →
    ∫ ω, Ψ (σ * √(U ω)) ∂μ - r.kappa * σ ^ 2 ≤ r.cap

theorem rowBound_of_check (r : Row) (h : checkRow r = true) : HeaderOK r ∧ RowBound r := by
  simp only [checkRow, Bool.and_eq_true, decide_eq_true_eq, Bool.not_eq_true',
    List.isEmpty_eq_false_iff] at h
  obtain ⟨⟨⟨⟨⟨hhead, hmesh⟩, hne⟩, hchain⟩, hend⟩, hcells⟩ := h
  refine ⟨headerOK_of_check r hhead, ?_⟩
  intro Ω _ μ _ U x Ψ σ hM hS hΨ h0 h1 hf
  obtain ⟨c, hc, hc1, hc2⟩ := xChain_sound r.cellList 0 hchain x (by simpa using hM.x0)
    (hM.x1.trans (by exact_mod_cast hend)) hne
  have hmem : Task.spawn (fun _ =>
      checkCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ) c) ∈
      r.cellList.map fun c => Task.spawn fun _ =>
        checkCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ) c :=
    List.mem_map.2 ⟨c, hc, rfl⟩
  have hcell : checkCell r.nodeList r.smax r.vs r.kappa r.cap (r.delta * ρ) c = true :=
    List.all_eq_true.1 hcells _ hmem
  exact cell_sound μ hM hS hΨ r.vs hmesh r.kappa r.cap (r.delta * ρ) c hcell hc1 hc2 σ h0
    (by push_cast; exact h1) hf

end Grothe.Lower
