import Grothe.Lower.Rows

/-!
# Mixed potentials: common-law node bounds, chords in `τ`, and the mixed node tables

With one law `U` and one scale `τ` for all rows (`SharedReduction` in `Support.lean`), the
potential of a mixture of two rows with weights `(1−θ, θ)` is

  `F_λ(s) = (1−θ) Ψᵢ(δᵢ s) + θ Ψⱼ(δⱼ s)`,

convex and known through the node caps of its components.  A `TNode` is a certified
`τ`-node `(τ, P)` with `E Φ(τ√U) ≤ P.J 0 1 x` for the row's or the mixture's potential, either a
Stein node of a source row rescaled to `τ = σ/δ` (`rowTNode`) or one of the exact node
certificates for the mixed table, with Stein or spectral cuts (`JBatch`, `checkBatch`,
`batch_sound`); `capAt`/`capsHold_mix` build the node caps of `F_λ` from those of its components.
-/

open MeasureTheory

namespace Grothe.Lower

/-! ### Convexity -/

lemma convexOn_scale {f : ℝ → ℝ} (hf : ConvexOn ℝ (Set.Ici 0) f) (δ : ℝ) (hδ : 0 ≤ δ) :
    ConvexOn ℝ (Set.Ici 0) fun s => f (δ * s) := by
  refine ⟨convex_Ici 0, fun s hs t ht a b ha hb hab => ?_⟩
  have := hf.2 (Set.mem_Ici.2 (mul_nonneg hδ (Set.mem_Ici.1 hs)))
    (Set.mem_Ici.2 (mul_nonneg hδ (Set.mem_Ici.1 ht))) ha hb hab
  simp only [smul_eq_mul] at this ⊢
  convert this using 2
  ring

lemma convexOn_mix {f g : ℝ → ℝ} (hf : ConvexOn ℝ (Set.Ici 0) f) (hg : ConvexOn ℝ (Set.Ici 0) g)
    (w0 w1 : ℝ) (hw0 : 0 ≤ w0) (hw1 : 0 ≤ w1) :
    ConvexOn ℝ (Set.Ici 0) fun s => w0 * f s + w1 * g s := by
  refine ⟨convex_Ici 0, fun s hs t ht a b ha hb hab => ?_⟩
  have h1 := hf.2 hs ht ha hb hab
  have h2 := hg.2 hs ht ha hb hab
  simp only [smul_eq_mul] at h1 h2 ⊢
  nlinarith [mul_le_mul_of_nonneg_left h1 hw0, mul_le_mul_of_nonneg_left h2 hw1]

/-! ### The node caps of a mixed potential -/

/-- The piecewise-linear interpolant of the caps, continued by the Lipschitz line. -/
def capAt (smax : ℚ) : List (ℚ × ℚ) → ℚ → ℚ
  | [], _ => 0
  | [n], s => n.2 + smax * (s - n.1)
  | n :: n' :: rest, s =>
    if s ≤ n'.1 then n.2 + slope n n' * (s - n.1) else capAt smax (n' :: rest) s

/-- Strictly increasing abscissae. -/
def nodesSorted : List (ℚ × ℚ) → Bool
  | [] => true
  | [_] => true
  | n :: n' :: rest => decide (n.1 < n'.1) && nodesSorted (n' :: rest)

/-- The first node is at `0`. -/
def headZero : List (ℚ × ℚ) → Bool
  | n :: _ => n.1 == 0
  | [] => false

lemma capAt_sound {Ψ : ℝ → ℝ} (smax : ℚ) (hconv : ConvexOn ℝ (Set.Ici 0) Ψ)
    (hlip : ∀ s t : ℝ, 0 ≤ s → s ≤ t → Ψ t ≤ Ψ s + smax * (t - s)) :
    ∀ (rest : List (ℚ × ℚ)) (n : ℚ × ℚ) (s : ℚ), nodesSorted (n :: rest) = true →
      (∀ m ∈ n :: rest, Ψ m.1 ≤ m.2) → 0 ≤ n.1 → n.1 ≤ s → Ψ s ≤ capAt smax (n :: rest) s
  | [], n, s, _, hc, h0, hs => by
    simp only [capAt]
    have := hlip n.1 s (by exact_mod_cast h0) (by exact_mod_cast hs)
    have hcn := hc n (by simp)
    push_cast
    linarith
  | n' :: rest, n, s, hsort, hc, h0, hs => by
    simp only [nodesSorted, Bool.and_eq_true, decide_eq_true_eq] at hsort
    obtain ⟨hlt, hsort'⟩ := hsort
    by_cases hle : s ≤ n'.1
    · rw [show capAt smax (n :: n' :: rest) s = n.2 + slope n n' * (s - n.1) by
        simp [capAt, hle]]
      have := chord_le Ψ hconv n.1 n'.1 n.2 n'.2 s (by exact_mod_cast h0) (by exact_mod_cast hlt)
        (by exact_mod_cast hs) (by exact_mod_cast hle) (hc n (by simp)) (hc n' (by simp))
      simp only [slope]
      push_cast
      linarith
    · rw [show capAt smax (n :: n' :: rest) s = capAt smax (n' :: rest) s by simp [capAt, hle]]
      exact capAt_sound smax hconv hlip rest n' s hsort'
        (fun m hm => hc m (List.mem_cons_of_mem _ hm)) (h0.trans hlt.le) (le_of_lt (not_le.1 hle))

/-- The caps of a component row at the rescaled abscissa `δ z`. -/
def rowCapAt (r : Row) (z : ℚ) : ℚ := capAt r.smax r.nodeList (r.delta * z)

lemma rowCapAt_sound (r : Row) {Ψ : ℝ → ℝ} (hΨ : CapsHold Ψ r.nodeList r.smax)
    (hsort : nodesSorted r.nodeList = true) (hhead : headZero r.nodeList = true)
    (hδ : 0 ≤ r.delta) (z : ℚ) (hz : 0 ≤ z) : Ψ (r.delta * z) ≤ rowCapAt r z := by
  unfold rowCapAt
  cases hn : r.nodeList with
  | nil => rw [hn] at hhead; simp [headZero] at hhead
  | cons n rest =>
    rw [hn] at hhead hsort
    simp only [headZero, beq_iff_eq] at hhead
    have hcaps : ∀ m ∈ n :: rest, Ψ m.1 ≤ m.2 := by rw [← hn]; exact hΨ.caps
    have := capAt_sound r.smax hΨ.convex hΨ.lip rest n (r.delta * z) hsort hcaps hhead.ge
      (by rw [hhead]; exact mul_nonneg hδ hz)
    exact_mod_cast this

/-- **The node caps of a mixture.**  For `F(s) = (1−θ)(Ψᵢ(δᵢ s) − pad) + θ(Ψⱼ(δⱼ s) − pad)`, a node
table whose caps dominate the mixed interpolants of the component caps, and a Lipschitz constant
dominating `(1−θ)δᵢ smaxᵢ + θ δⱼ smaxⱼ`. -/
lemma capsHold_mix (ri rj : Row) (θ : ℚ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) {Ψi Ψj : ℝ → ℝ} (pad : ℚ)
    (hi : CapsHold (fun s => Ψi s - pad) ri.nodeList ri.smax)
    (hj : CapsHold (fun s => Ψj s - pad) rj.nodeList rj.smax)
    (hδi : 0 < ri.delta) (hδj : 0 < rj.delta)
    (hsi : nodesSorted ri.nodeList = true) (hhi : headZero ri.nodeList = true)
    (hsj : nodesSorted rj.nodeList = true) (hhj : headZero rj.nodeList = true)
    (nodes : List (ℚ × ℚ)) (smax : ℚ)
    (hnodes : ∀ m ∈ nodes, 0 ≤ m.1 ∧ (1 - θ) * rowCapAt ri m.1 + θ * rowCapAt rj m.1 ≤ m.2)
    (hsmax : (1 - θ) * ri.delta * ri.smax + θ * rj.delta * rj.smax ≤ smax) :
    CapsHold (fun s => (1 - θ) * (Ψi (ri.delta * s) - pad) + θ * (Ψj (rj.delta * s) - pad))
      nodes smax := by
  have hθ1R : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
  have hw0 : (0 : ℝ) ≤ 1 - θ := by linarith
  have hw1 : (0 : ℝ) ≤ θ := by exact_mod_cast hθ0
  have hδiR : (0 : ℝ) ≤ ri.delta := by exact_mod_cast hδi.le
  have hδjR : (0 : ℝ) ≤ rj.delta := by exact_mod_cast hδj.le
  refine ⟨?_, ?_, ?_⟩
  · exact convexOn_mix (convexOn_scale hi.convex _ hδiR) (convexOn_scale hj.convex _ hδjR) _ _ hw0
      hw1
  · intro m hm
    obtain ⟨hm0, hmc⟩ := hnodes m hm
    have a := rowCapAt_sound ri hi hsi hhi hδi.le m.1 hm0
    have b := rowCapAt_sound rj hj hsj hhj hδj.le m.1 hm0
    have hmcR : (1 - (θ : ℝ)) * (rowCapAt ri m.1 : ℚ) + θ * (rowCapAt rj m.1 : ℚ) ≤ m.2 := by
      exact_mod_cast hmc
    nlinarith [mul_le_mul_of_nonneg_left a hw0, mul_le_mul_of_nonneg_left b hw1]
  · intro s t hs hst
    have a := hi.lip (ri.delta * s) (ri.delta * t) (mul_nonneg hδiR hs)
      (mul_le_mul_of_nonneg_left hst hδiR)
    have b := hj.lip (rj.delta * s) (rj.delta * t) (mul_nonneg hδjR hs)
      (mul_le_mul_of_nonneg_left hst hδjR)
    have hsmaxR : (1 - (θ : ℝ)) * ri.delta * ri.smax + θ * rj.delta * rj.smax ≤ smax := by
      exact_mod_cast hsmax
    have hts : 0 ≤ t - s := by linarith
    nlinarith [mul_le_mul_of_nonneg_left a hw0, mul_le_mul_of_nonneg_left b hw1,
      mul_le_mul_of_nonneg_right hsmaxR hts]

/-! ### Certified `τ`-nodes -/

/-- A certified `τ`-node: `E Φ(τ√U) ≤ P.J 0 1 x`. -/
structure TNode where
  tau : ℚ
  P : MPoly

/-- `a p + b q`. -/
def MPoly.lin (a b : ℚ) (p q : MPoly) : MPoly :=
  ⟨a * p.a0 + b * q.a0, a * p.a1 + b * q.a1, a * p.a2 + b * q.a2, a * p.a4 + b * q.a4,
   a * p.a6 + b * q.a6⟩

lemma MPoly.J_lin (a b : ℚ) (p q : MPoly) (x : ℝ) :
    (MPoly.lin a b p q).J 0 1 x = a * p.J 0 1 x + b * q.J 0 1 x := by
  simp only [MPoly.J, MPoly.lin]
  push_cast
  ring

/-- `0 ≤ τ₀ ≤ s ≤ τ₁`. -/
def tchordOK (n0 n1 : TNode) (s : ℚ) : Bool :=
  decide (0 ≤ n0.tau) && decide (n0.tau ≤ s) && decide (s ≤ n1.tau)

/-- The chord of two `τ`-nodes at `s` (the node itself when the two coincide). -/
def tchordP (n0 n1 : TNode) (s : ℚ) : MPoly :=
  if n0.tau < n1.tau then
    MPoly.lin ((n1.tau - s) / (n1.tau - n0.tau)) ((s - n0.tau) / (n1.tau - n0.tau)) n0.P n1.P
  else n0.P

section nodes

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (U : Ω → ℝ)
  (x : ℝ)

/-- The node fact of a `τ`-node for the potential `Φ`. -/
def TNodeOK (Φ : ℝ → ℝ) (n : TNode) : Prop := TB μ U Φ n.tau (n.P.J 0 1 x)

variable {μ U x}

omit [IsProbabilityMeasure μ] in
lemma tchord_sound {Φ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (n0 n1 : TNode) (s : ℚ)
    (hok : tchordOK n0 n1 s = true) (h0 : TNodeOK μ U x Φ n0) (h1 : TNodeOK μ U x Φ n1) :
    TB μ U Φ s ((tchordP n0 n1 s).J 0 1 x) := by
  simp only [tchordOK, Bool.and_eq_true, decide_eq_true_eq] at hok
  obtain ⟨⟨hn0, hs0⟩, hs1⟩ := hok
  unfold tchordP
  split_ifs with hlt
  · rw [MPoly.J_lin]
    push_cast
    exact TB.chord hconv _ _ _ _ _ (by exact_mod_cast hn0) (by exact_mod_cast hlt)
      (by exact_mod_cast hs0) (by exact_mod_cast hs1) h0 h1
  · have hs : s = n0.tau := le_antisymm (hs1.trans (not_lt.1 hlt)) hs0
    subst hs
    exact h0

end nodes

/-! ### The `τ`-nodes of a source row -/

/-- The zero node `(0, caps₀)` of a row. -/
def zeroNode (r : Row) : Option TNode :=
  match r.nodeList with
  | n :: _ => if n.1 = 0 then some ⟨0, ⟨n.2, 0, 0, 0, 0⟩⟩ else none
  | [] => none

/-- The `τ`-node of a Stein node `(cell, node)` of a row, rescaled to `τ = σ/δ`; `none` refers to
the zero node. -/
def rowTNode (r : Row) : Option (ℕ × ℕ) → Option TNode
  | none => zeroNode r
  | some (ci, ni) =>
    match r.cellList[ci]? with
    | none => none
    | some cell =>
      match cell.nodes[ni]? with
      | none => none
      | some n => some ⟨n.sigma / r.delta, n.y⟩

/-- Every Stein node of a checked row passes its node check, and the mesh is valid. -/
lemma checkRow_node (r : Row) (h : checkRow r = true) :
    0 < r.delta ∧ meshOK 0 r.vs = true ∧ ∀ c ∈ r.cellList, ∀ n ∈ c.nodes,
      checkNode r.nodeList r.smax r.vs (c.bank.map (cutPolys r.vs)) n = true := by
  simp only [checkRow, allPar_eq, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨⟨⟨hδ, -⟩, -⟩, hmesh⟩, -⟩, hcells⟩ := h
  refine ⟨hδ, hmesh, fun c hc n hn => ?_⟩
  have := hcells c hc
  simp only [checkCell, Bool.and_eq_true, List.all_eq_true] at this
  exact this.2 n hn

section rownodes

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

/-- **The `τ`-nodes of a checked row are certified** for the rescaled, padded potential
`s ↦ Ψ(δ s) − capPad`. -/
lemma rowTNode_sound (r : Row) (hr : checkRow r = true) {Ψ : ℝ → ℝ}
    (hΨ : CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax) (hM : Moments μ U x)
    (hS : SteinCut μ U) (ref : Option (ℕ × ℕ)) (tn : TNode) (h : rowTNode r ref = some tn) :
    TNodeOK μ U x (fun s => Ψ (r.delta * s) - capPad) tn := by
  obtain ⟨hδ, hmesh, hnodes⟩ := checkRow_node r hr
  have hδR : (0 : ℝ) < r.delta := by exact_mod_cast hδ
  cases ref with
  | none =>
    simp only [rowTNode, zeroNode] at h
    cases hn : r.nodeList with
    | nil => simp [hn] at h
    | cons n rest =>
      simp only [hn] at h
      split_ifs at h with h0
      · simp only [Option.some.injEq] at h
        subst h
        have hc := hΨ.caps n (by rw [hn]; simp)
        rw [h0] at hc
        unfold TNodeOK
        have e : (⟨n.2, 0, 0, 0, 0⟩ : MPoly).J 0 1 x = n.2 := by simp [MPoly.J]
        simp only [e]
        push_cast
        exact TB.zero _ (by simpa using hc)
  | some ref =>
    obtain ⟨ci, ni⟩ := ref
    simp only [rowTNode] at h
    cases hc : r.cellList[ci]? with
    | none => simp [hc] at h
    | some cell =>
      simp only [hc] at h
      cases hnn : cell.nodes[ni]? with
      | none => simp [hnn] at h
      | some n =>
        simp only [hnn, Option.some.injEq] at h
        subst h
        have hcm : cell ∈ r.cellList := List.mem_of_getElem? hc
        have hnm : n ∈ cell.nodes := List.mem_of_getElem? hnn
        obtain ⟨hfact, h1, h6, hcuts, hσ⟩ := node_sound hΨ r.vs cell.bank n (hnodes cell hcm n hnm)
        unfold TNodeOK
        refine TB.node hM hS r.vs hmesh (nodeCutList cell.bank n) hcuts n.y h1 h6 _ fun v hv => ?_
        have := hfact v hv
        have e : (r.delta : ℝ) * ((n.sigma / r.delta : ℚ) * v) = n.sigma * v := by
          push_cast
          field_simp
        simp only [e]
        linarith

end rownodes

/-! ### The mixed node tables -/

/-- A batch of exact node certificates for the mixed potential of rows `i, j` with weight `θ`:
the mixed node caps (`r:c;…`), the Lipschitz constant, the mesh (`v₁,v₂,…`) and the witnesses.
A Stein batch (`spec = false`) has witnesses `τ:y₀,y₄,y₁,y₂,y₃:μ₁,…|z₁;z₂;…` (a nonnegative
combination of cuts `cutG`; multipliers as integers over `10¹⁰`, cut vectors as integers over
`10⁸`), a spectral batch (`spec = true`) has witnesses `τ:y₀,y₄,y₁,y₂,y₃:λ,μ,t,β,ν|φ₀,φ₁,…` (one
spectral cut `specG` with the knot values `φₖ` of its test). -/
structure JBatch where
  i : ℕ
  j : ℕ
  θ : ℚ
  smax : ℚ
  nodes : String
  mesh : String
  spec : Bool
  wits : List String

def JBatch.nodeList (b : JBatch) : List (ℚ × ℚ) := (splitL b.nodes ";").map parseCap
def JBatch.vs (b : JBatch) : List ℚ := parseQs b.mesh

/-- A witness: its node (`σ = τ`, majorant, cuts `(μₖ, k)`) and its bank. -/
def parseWit (s : String) : SNode × List (List ℚ) :=
  match s.splitOn "|" with
  | [a, k] =>
    match a.splitOn ":" with
    | [t, p, m] =>
      let mus := parseInts 10000000000 m
      (⟨parseQ t, parseMPoly p, ((List.range mus.length).zip mus).map fun kw => (kw.2, kw.1)⟩,
       (splitL k ";").map (parseInts 100000000))
    | _ => (⟨0, ⟨0, 0, 0, 0, 0⟩, []⟩, [])
  | _ => (⟨0, ⟨0, 0, 0, 0, 0⟩, []⟩, [])

def JBatch.witList (b : JBatch) : List (SNode × List (List ℚ)) := b.wits.map parseWit

/-- A spectral witness: the node `τ`, the majorant, the parameters `(λ, μ, t, β, ν)` and the knot
values of the test. -/
structure SWit where
  tau : ℚ
  y : MPoly
  lam : ℚ
  mu : ℚ
  t : ℚ
  be : ℚ
  nu : ℚ
  z : List ℚ

def parseSWit (s : String) : SWit :=
  match s.splitOn "|" with
  | [a, k] =>
    match a.splitOn ":" with
    | [t, p, c] =>
      match parseQs c with
      | [l, m, tt, b, n] => ⟨parseQ t, parseMPoly p, l, m, tt, b, n, parseQs k⟩
      | _ => ⟨0, ⟨0, 0, 0, 0, 0⟩, 0, 0, 0, 0, 0, []⟩
    | _ => ⟨0, ⟨0, 0, 0, 0, 0⟩, 0, 0, 0, 0, 0, []⟩
  | _ => ⟨0, ⟨0, 0, 0, 0, 0⟩, 0, 0, 0, 0, 0, []⟩

def JBatch.switList (b : JBatch) : List SWit := b.wits.map parseSWit

/-- The `τ`-nodes of a batch. -/
def JBatch.tnodes (b : JBatch) : List TNode :=
  if b.spec then b.switList.map fun w => ⟨w.tau, w.y⟩
  else b.witList.map fun w => ⟨w.1.sigma, w.1.y⟩

/-- The spectral node check: `λ, μ > 0`, `ν ≥ 0`, the majorant has `y₄, y₃ ≥ 0`, and
`Ψ(τv) + G(v²) ≤ y(v)` for all `v ≥ 0` by the majorant sweep. -/
def checkSWit (nodes : List (ℚ × ℚ)) (smax : ℚ) (vs : List ℚ) (w : SWit) : Bool :=
  let arr := specPolys vs w.z w.lam w.mu w.t w.be w.nu
  decide (0 < w.lam) && decide (0 < w.mu) && decide (0 ≤ w.nu) && decide (0 ≤ w.y.a1) &&
    decide (0 ≤ w.y.a6) &&
    sweepTop w.tau smax w.y.list (fun k => arr.getD k []) vs nodes

lemma checkSWit_sound {Ψ : ℝ → ℝ} {nodes : List (ℚ × ℚ)} {smax : ℚ} (hΨ : CapsHold Ψ nodes smax)
    (vs : List ℚ) (w : SWit) (h : checkSWit nodes smax vs w = true) :
    0 < w.lam ∧ 0 < w.mu ∧ 0 ≤ w.nu ∧ 0 ≤ w.y.a1 ∧ 0 ≤ w.y.a6 ∧ ∀ v : ℝ, 0 ≤ v →
      Ψ (w.tau * v) + specG vs w.z w.lam w.mu w.t w.be w.nu v
        ≤ evalL (w.y.list.map ((↑) : ℚ → ℝ)) v := by
  simp only [checkSWit, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨hl, hm⟩, hn⟩, h1⟩, h6⟩, hsw⟩ := h
  refine ⟨hl, hm, hn, h1, h6, fun v hv => ?_⟩
  refine major_sound Ψ nodes smax hΨ w.tau w.y.list _ vs _ (fun u _ hk => ?_) hsw v hv
  rw [specPolys_getD]
  exact specG_cell vs w.z w.lam w.mu w.t w.be w.nu u hk

/-- The mixed potential `(1−θ)(Ψᵢ(δᵢ s) − capPad) + θ(Ψⱼ(δⱼ s) − capPad)`. -/
def mixPot (ri rj : Row) (θ : ℚ) (Ψi Ψj : ℝ → ℝ) (s : ℝ) : ℝ :=
  (1 - θ) * (Ψi (ri.delta * s) - capPad) + θ * (Ψj (rj.delta * s) - capPad)

/-- The node caps of a mixture dominate the mixed component caps, and the Lipschitz constant is
valid. -/
def checkMixTable (ri rj : Row) (θ : ℚ) (nodes : List (ℚ × ℚ)) (smax : ℚ) : Bool :=
  decide (0 ≤ θ) && decide (θ ≤ 1) && decide (0 < ri.delta) && decide (0 < rj.delta) &&
  nodesSorted ri.nodeList && headZero ri.nodeList && nodesSorted rj.nodeList &&
  headZero rj.nodeList &&
  nodes.all (fun m => decide (0 ≤ m.1) &&
    decide ((1 - θ) * rowCapAt ri m.1 + θ * rowCapAt rj m.1 ≤ m.2)) &&
  decide ((1 - θ) * ri.delta * ri.smax + θ * rj.delta * rj.smax ≤ smax)

lemma checkMixTable_sound (ri rj : Row) (θ : ℚ) (nodes : List (ℚ × ℚ)) (smax : ℚ)
    (h : checkMixTable ri rj θ nodes smax = true) {Ψi Ψj : ℝ → ℝ}
    (hi : CapsHold (fun s => Ψi s - capPad) ri.nodeList ri.smax)
    (hj : CapsHold (fun s => Ψj s - capPad) rj.nodeList rj.smax) :
    CapsHold (mixPot ri rj θ Ψi Ψj) nodes smax := by
  simp only [checkMixTable, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨hθ0, hθ1⟩, hδi⟩, hδj⟩, hsi⟩, hhi⟩, hsj⟩, hhj⟩, hnodes⟩, hsmax⟩ := h
  exact capsHold_mix ri rj θ hθ0 hθ1 capPad hi hj hδi hδj hsi hhi hsj hhj nodes smax hnodes hsmax

/-- The batch check: rows exist, the mixed table is valid, the mesh is valid, every witness
passes the Stein (or spectral) node check against the mixed table. -/
def checkBatch (rows : List Row) (b : JBatch) : Bool :=
  match rows[b.i]?, rows[b.j]? with
  | some ri, some rj =>
    checkMixTable ri rj b.θ b.nodeList b.smax && meshOK 0 b.vs &&
    if b.spec then b.switList.all (checkSWit b.nodeList b.smax b.vs)
    else b.witList.all fun w => checkNode b.nodeList b.smax b.vs (w.2.map (cutPolys b.vs)) w.1
  | _, _ => false

section batch

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

/-- **The `τ`-nodes of a checked batch are certified** for the mixed potential. -/
lemma batch_sound (rows : List Row) (b : JBatch) (h : checkBatch rows b = true) (ri rj : Row)
    (hri : rows[b.i]? = some ri) (hrj : rows[b.j]? = some rj) {Ψi Ψj : ℝ → ℝ}
    (hi : CapsHold (fun s => Ψi s - capPad) ri.nodeList ri.smax)
    (hj : CapsHold (fun s => Ψj s - capPad) rj.nodeList rj.smax) (hM : Moments μ U x)
    (hS : SteinCut μ U) : ∀ tn ∈ b.tnodes, TNodeOK μ U x (mixPot ri rj b.θ Ψi Ψj) tn := by
  simp only [checkBatch, hri, hrj, Bool.and_eq_true] at h
  obtain ⟨⟨htable, hmesh⟩, hwits⟩ := h
  have hcaps := checkMixTable_sound ri rj b.θ b.nodeList b.smax htable hi hj
  intro tn htn
  unfold JBatch.tnodes at htn
  split_ifs at htn hwits with hsp
  · obtain ⟨w, hw, rfl⟩ := List.mem_map.1 htn
    obtain ⟨hl, hm, hn, h1, h6, hfact⟩ :=
      checkSWit_sound hcaps b.vs w (List.all_eq_true.1 hwits w hw)
    exact TB.specNode hM hS b.vs w.z w.lam w.mu w.t w.be w.nu hmesh hl hm hn w.y h1 h6 _ hfact
  · obtain ⟨w, hw, rfl⟩ := List.mem_map.1 htn
    obtain ⟨hfact, h1, h6, hcuts, _⟩ :=
      node_sound hcaps b.vs w.2 w.1 (List.all_eq_true.1 hwits w hw)
    exact TB.node hM hS b.vs hmesh (nodeCutList w.2 w.1) hcuts w.1.y h1 h6 _ hfact

end batch

end Grothe.Lower
