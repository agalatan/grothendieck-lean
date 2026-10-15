import Grothe.Lower.Mixed
import Grothe.Lower.Envelope
import Grothe.LowerAnalytic.Rows

/-!
# The central boxes of the common-law certificate

On the slab `t ∈ [tLo, tHi]` the cap is certified on boxes `[t₋,t₊] × [τ₋,τ₊] × [x₋,x₊]`
of `(t, τ, x)`, each with a fixed mixture `(1−θ, θ)` of two rows `i, j` and four certified
`τ`-nodes: two enclosing `τ₋` and two enclosing `τ₊`, either Stein nodes of the two source rows
rescaled to `τ = σ/δ` (a *source box*) or new exact node certificates of the mixed table (a
*joint box*).  The chords at `τ₋`, `τ₊` give polynomials `L₋, L₊` in `x` with
`E F_λ(τ±√U) − pad ≤ L±(x)`; by convexity in `τ` and the fixed first gate coordinate,

  `V ≤ max_{t} (t² − 2ℓ̄t) + 2β̄²/ε + max_{x̂∈{x₋,x₊}} max_{τ∈[τ₋,τ₊]} [chord(L₋(x̂), L₊(x̂))(τ) − Dτ²] + pad`

with `D = δ̄ + gatePrice(N̄, ḡ)` (`boxVal`, `slab_bound`).  `boxBound` evaluates a box from the
data, `coverOK` checks that the boxes form a dyadic partition of the slab (every point of the
slab lies in a box, `coverOK_sound`), and `checkOuter` runs the scalar envelope outside the slab.
-/

open MeasureTheory

namespace Grothe.Lower

/-! ### The gate form of a row -/

/-- `g = δ b`. -/
def Row.g1 (r : Row) : ℚ := r.delta * r.b1
def Row.g2 (r : Row) : ℚ := r.delta * r.b2
def Row.g3 (r : Row) : ℚ := r.delta * r.b3

/-- The retained gate expression `X*N X + 2 Re(conj X₁ (g·X))` of a row. -/
def Row.gate (r : Row) (X1 X2 X3 : ℂ) : ℝ := gateForm r.N r.g1 r.g2 r.g3 X1 X2 X3

/-- The mixed gate price `D = δ̄ + gatePrice(N̄, ḡ)`. -/
def mixPrice (ri rj : Row) (θ : ℚ) : ℚ :=
  (1 - θ) * ri.delta + θ * rj.delta + gatePrice (Sym3.mix θ ri.N rj.N)
    ((1 - θ) * ri.g1 + θ * rj.g1) ((1 - θ) * ri.g2 + θ * rj.g2) ((1 - θ) * ri.g3 + θ * rj.g3)

/-- The trailing block of the mixed `N` is positive definite. -/
def mixGateOK (ri rj : Row) (θ : ℚ) : Bool := gateOK (Sym3.mix θ ri.N rj.N)

/-- The price of a single row `(θ = 0)` dominates its stored `κδ²`. -/
def checkRowPrice (r : Row) : Bool :=
  decide (0 < r.delta) && gateOK r.N &&
    decide (r.kappa * r.delta ^ 2 ≤ r.delta + gatePrice r.N r.g1 r.g2 r.g3)

section gate

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

omit [IsProbabilityMeasure μ] in
/-- The integrated gate form is at least `gatePrice · τ²` when `|X₁|² = τ² U`. -/
lemma gate_integral_ge (N : Sym3) (g1 g2 g3 : ℚ) (hok : gateOK N = true) (X1 X2 X3 : Ω → ℂ)
    (τ : ℝ) (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x)
    (hint : Integrable (fun ω => gateForm N g1 g2 g3 (X1 ω) (X2 ω) (X3 ω)) μ) :
    (gatePrice N g1 g2 g3 : ℝ) * τ ^ 2 ≤ ∫ ω, gateForm N g1 g2 g3 (X1 ω) (X2 ω) (X3 ω) ∂μ := by
  have hpt : ∀ ω, (gatePrice N g1 g2 g3 : ℝ) * τ ^ 2 * U ω
      ≤ gateForm N g1 g2 g3 (X1 ω) (X2 ω) (X3 ω) := by
    intro ω
    have := gateForm_ge N g1 g2 g3 hok (X1 ω) (X2 ω) (X3 ω)
    rw [Complex.normSq_eq_norm_sq, hX ω] at this
    linarith
  have := integral_mono (hM.i1.const_mul _) hint hpt
  rwa [integral_const_mul, hM.m1, mul_one] at this

end gate

/-! ### Box evaluation -/

/-- `max_{t∈[tl,tu]} (t² − 2ℓt)`. -/
def tPart (ell tl tu : ℚ) : ℚ := quadMax 0 (-2 * ell) 1 tl tu

/-- `max_{τ∈[sl,su]} [L₋(x̂) + m(τ − sl) − Dτ²]`, `m` the slope of the chord of `L₋(x̂), L₊(x̂)`. -/
def xPart (Lm Lp : MPoly) (D sl su xh : ℚ) : ℚ :=
  let lo := Lm.Jq 0 1 xh
  let hi := Lp.Jq 0 1 xh
  let m := (hi - lo) / (su - sl)
  quadMax (lo - m * sl) m (-D) sl su

/-- The bound of a box. -/
def boxVal (ell beta D : ℚ) (Lm Lp : MPoly) (tl tu sl su xl xu : ℚ) : ℚ :=
  tPart ell tl tu + 2 * beta ^ 2 / ε + max (xPart Lm Lp D sl su xl) (xPart Lm Lp D sl su xu)
    + capPad

/-- The kind of a box: a source box `(i, j, θ, refs of row i, refs of row j)` or a joint box
`(batch, witness indices)`. -/
inductive BoxKind where
  | src (i j : ℕ) (θ : ℚ) (ri rj : List (Option (ℕ × ℕ)))
  | joint (b : ℕ) (ks : List ℕ)

structure Box where
  tl : ℚ
  tu : ℚ
  sl : ℚ
  su : ℚ
  xl : ℚ
  xu : ℚ
  kind : BoxKind

/-- Pairs `(cell, node)` from a flat integer list; a negative cell index is the zero node. -/
def pairRefs : List ℤ → List (Option (ℕ × ℕ))
  | a :: b :: r => (if a < 0 then none else some (a.toNat, b.toNat)) :: pairRefs r
  | _ => []

def parseRefs (s : String) : List (Option (ℕ × ℕ)) := pairRefs ((splitL s ",").map String.toInt!)

def dfltBox : Box := ⟨0, 0, 0, 0, 0, 0, .joint 0 []⟩

/-- `s|tl,tu,sl,su,xl,xu|i,j,θ|refsᵢ|refsⱼ` or `j|tl,tu,sl,su,xl,xu|batch|k₀,k₁,k₂,k₃`. -/
def parseBox (s : String) : Box :=
  match s.splitOn "|" with
  | ["s", bx, ij, ri, rj] =>
    match parseQs bx, ij.splitOn "," with
    | [tl, tu, sl, su, xl, xu], [i, j, θ] =>
      ⟨tl, tu, sl, su, xl, xu, .src i.toNat! j.toNat! (parseQ θ) (parseRefs ri) (parseRefs rj)⟩
    | _, _ => dfltBox
  | ["j", bx, b, ks] =>
    match parseQs bx with
    | [tl, tu, sl, su, xl, xu] =>
      ⟨tl, tu, sl, su, xl, xu, .joint b.toNat! ((splitL ks ",").map String.toNat!)⟩
    | _ => dfltBox
  | _ => dfltBox

/-- Resolve a list of references, all of which must succeed. -/
def resolve {α : Type} (f : α → Option TNode) : List α → Option (List TNode)
  | [] => some []
  | a :: r =>
    match f a, resolve f r with
    | some n, some ns => some (n :: ns)
    | _, _ => none

lemma resolve_mem {α : Type} (f : α → Option TNode) :
    ∀ (l : List α) (ns : List TNode), resolve f l = some ns → ∀ n ∈ ns, ∃ a ∈ l, f a = some n
  | [], ns, h, n, hn => by
    simp only [resolve, Option.some.injEq] at h
    subst h
    simp at hn
  | a :: r, ns, h, n, hn => by
    simp only [resolve] at h
    cases hfa : f a with
    | none => simp [hfa] at h
    | some m =>
      cases hr : resolve f r with
      | none => simp [hfa, hr] at h
      | some ms =>
        simp only [hfa, hr, Option.some.injEq] at h
        subst h
        rcases List.mem_cons.1 hn with rfl | hn
        · exact ⟨a, List.mem_cons_self .., hfa⟩
        · obtain ⟨b, hb, hfb⟩ := resolve_mem f r ms hr n hn
          exact ⟨b, List.mem_cons_of_mem _ hb, hfb⟩

/-- The chords at `sl` and `su` from four `τ`-nodes `[n₀, n₁, n₂, n₃]`. -/
def chords4 (tns : List TNode) (sl su : ℚ) : Option (MPoly × MPoly) :=
  match tns with
  | [n0, n1, n2, n3] =>
    if tchordOK n0 n1 sl && tchordOK n2 n3 su then some (tchordP n0 n1 sl, tchordP n2 n3 su)
    else none
  | _ => none

/-- The final value from the mixture data and the two chord polynomials. -/
def finish (ri rj : Row) (θ : ℚ) (Lm Lp : MPoly) (b : Box) : Option ℚ :=
  if 0 ≤ θ ∧ θ ≤ 1 ∧ mixGateOK ri rj θ = true ∧ 0 ≤ Lm.a6 ∧ 0 ≤ Lp.a6 then
    some (boxVal ((1 - θ) * ri.ell + θ * rj.ell) ((1 - θ) * ri.beta + θ * rj.beta)
      (mixPrice ri rj θ) Lm Lp b.tl b.tu b.sl b.su b.xl b.xu)
  else none

/-- The bound of a box from the rows and the batches (`none` if the data are inconsistent). -/
def boxBound (rows : List Row) (batches : List JBatch) (b : Box) : Option ℚ :=
  if ¬ (0 ≤ b.sl ∧ b.sl < b.su ∧ b.tl ≤ b.tu ∧ 0 ≤ b.xl ∧ b.xl ≤ b.xu) then none else
  match b.kind with
  | .src i j θ ri rj =>
    match rows[i]?, rows[j]? with
    | some Ri, some Rj =>
      match resolve (rowTNode Ri) ri, resolve (rowTNode Rj) rj with
      | some ni, some nj =>
        match chords4 ni b.sl b.su, chords4 nj b.sl b.su with
        | some (Pim, Pip), some (Pjm, Pjp) =>
          finish Ri Rj θ (MPoly.lin (1 - θ) θ Pim Pjm) (MPoly.lin (1 - θ) θ Pip Pjp) b
        | _, _ => none
      | _, _ => none
    | _, _ => none
  | .joint bi ks =>
    match batches[bi]? with
    | some bt =>
      match rows[bt.i]?, rows[bt.j]? with
      | some Ri, some Rj =>
        match resolve (fun k => bt.tnodes[k]?) ks with
        | some ns =>
          match chords4 ns b.sl b.su with
          | some (Lm, Lp) => finish Ri Rj bt.θ Lm Lp b
          | none => none
        | none => none
      | _, _ => none
    | none => none

/-- Every box is consistent and bounded by `bound`. -/
def checkBoxes (rows : List Row) (batches : List JBatch) (boxes : List String) (bound : ℚ) :
    Bool :=
  boxes.all fun s =>
    match boxBound rows batches (parseBox s) with
    | some v => decide (v ≤ bound)
    | none => false

/-! ### Coverage -/

/-- A domain `(tl, tu, sl, su, xl, xu)`. -/
abbrev Dom := ℚ × ℚ × ℚ × ℚ × ℚ × ℚ

def Box.dom (b : Box) : Dom := (b.tl, b.tu, b.sl, b.su, b.xl, b.xu)

/-- Lower and upper end of axis `k` of a domain. -/
def Dom.lo (d : Dom) : ℕ → ℚ
  | 0 => d.1
  | 1 => d.2.2.1
  | _ => d.2.2.2.2.1
def Dom.hi (d : Dom) : ℕ → ℚ
  | 0 => d.2.1
  | 1 => d.2.2.2.1
  | _ => d.2.2.2.2.2

/-- The halves of a domain along axis `k`. -/
def Dom.left (d : Dom) (k : ℕ) (mid : ℚ) : Dom :=
  match k with
  | 0 => (d.1, mid, d.2.2.1, d.2.2.2.1, d.2.2.2.2.1, d.2.2.2.2.2)
  | 1 => (d.1, d.2.1, d.2.2.1, mid, d.2.2.2.2.1, d.2.2.2.2.2)
  | _ => (d.1, d.2.1, d.2.2.1, d.2.2.2.1, d.2.2.2.2.1, mid)
def Dom.right (d : Dom) (k : ℕ) (mid : ℚ) : Dom :=
  match k with
  | 0 => (mid, d.2.1, d.2.2.1, d.2.2.2.1, d.2.2.2.2.1, d.2.2.2.2.2)
  | 1 => (d.1, d.2.1, mid, d.2.2.2.1, d.2.2.2.2.1, d.2.2.2.2.2)
  | _ => (d.1, d.2.1, d.2.2.1, d.2.2.2.1, mid, d.2.2.2.2.2)

/-- The point `(t, τ, x)` lies in the domain. -/
def Dom.mem (d : Dom) (t τ x : ℝ) : Prop :=
  (d.1 : ℝ) ≤ t ∧ t ≤ d.2.1 ∧ (d.2.2.1 : ℝ) ≤ τ ∧ τ ≤ d.2.2.2.1 ∧ (d.2.2.2.2.1 : ℝ) ≤ x ∧
    x ≤ d.2.2.2.2.2

/-- Split along axis `k` at its midpoint: no box straddles the midpoint, both halves are
nonempty, and both halves are covered recursively. -/
def splitAxis (rec : Dom → List Dom → Bool) (d : Dom) (bs : List Dom) (k : ℕ) : Bool :=
  let mid := (d.lo k + d.hi k) / 2
  !(bs.any fun b => decide (b.lo k < mid) && decide (mid < b.hi k)) &&
  (let L := bs.filter fun b => decide (b.hi k ≤ mid)
   let R := bs.filter fun b => decide (mid ≤ b.lo k)
   !L.isEmpty && !R.isEmpty && rec (d.left k mid) L && rec (d.right k mid) R)

/-- The dyadic partition check. -/
def coverOK : ℕ → Dom → List Dom → Bool
  | 0, _, _ => false
  | f + 1, d, bs =>
    match bs with
    | [b] => b == d
    | _ => splitAxis (coverOK f) d bs 0 || splitAxis (coverOK f) d bs 1 ||
        splitAxis (coverOK f) d bs 2

lemma mem_left_or_right (d : Dom) (k : ℕ) (mid : ℚ) (t τ x : ℝ) (h : d.mem t τ x) :
    (d.left k mid).mem t τ x ∨ (d.right k mid).mem t τ x := by
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := h
  match k with
  | 0 =>
    by_cases ht : t ≤ (mid : ℝ)
    · exact Or.inl ⟨h1, ht, h3, h4, h5, h6⟩
    · exact Or.inr ⟨le_of_lt (not_le.1 ht), h2, h3, h4, h5, h6⟩
  | 1 =>
    by_cases ht : τ ≤ (mid : ℝ)
    · exact Or.inl ⟨h1, h2, h3, ht, h5, h6⟩
    · exact Or.inr ⟨h1, h2, le_of_lt (not_le.1 ht), h4, h5, h6⟩
  | k + 2 =>
    by_cases ht : x ≤ (mid : ℝ)
    · exact Or.inl ⟨h1, h2, h3, h4, h5, ht⟩
    · exact Or.inr ⟨h1, h2, h3, h4, le_of_lt (not_le.1 ht), h6⟩

lemma splitAxis_sound (rec : Dom → List Dom → Bool)
    (hrec : ∀ d bs, rec d bs = true → ∀ t τ x : ℝ, d.mem t τ x → ∃ b ∈ bs, b.mem t τ x)
    (d : Dom) (bs : List Dom) (k : ℕ) (h : splitAxis rec d bs k = true) (t τ x : ℝ)
    (hm : d.mem t τ x) : ∃ b ∈ bs, b.mem t τ x := by
  simp only [splitAxis, Bool.and_eq_true, Bool.not_eq_true', List.isEmpty_eq_false_iff] at h
  obtain ⟨_, ⟨⟨_, _⟩, hL⟩, hR⟩ := h
  rcases mem_left_or_right d k _ t τ x hm with hl | hr
  · obtain ⟨b, hb, hbm⟩ := hrec _ _ hL t τ x hl
    exact ⟨b, (List.mem_filter.1 hb).1, hbm⟩
  · obtain ⟨b, hb, hbm⟩ := hrec _ _ hR t τ x hr
    exact ⟨b, (List.mem_filter.1 hb).1, hbm⟩

/-- **Soundness of the coverage check**: every point of the domain lies in a box. -/
theorem coverOK_sound : ∀ (f : ℕ) (d : Dom) (bs : List Dom), coverOK f d bs = true →
    ∀ t τ x : ℝ, d.mem t τ x → ∃ b ∈ bs, b.mem t τ x
  | 0, _, _, h => by simp [coverOK] at h
  | f + 1, d, bs, h => by
    intro t τ x hm
    match bs, h with
    | [b], h =>
      simp only [coverOK, beq_iff_eq] at h
      exact ⟨b, List.mem_singleton_self b, h ▸ hm⟩
    | [], h => simp [coverOK, splitAxis] at h
    | b :: b' :: rest, h =>
      simp only [coverOK, Bool.or_eq_true] at h
      rcases h with (h | h) | h <;>
        exact splitAxis_sound (coverOK f) (coverOK_sound f) d (b :: b' :: rest) _ h t τ x hm

/-! ### The scalar envelope outside the slab -/

/-- Like `checkEnvCells`, but the cells inside `[lo, hi]` are not checked. -/
def checkCellsOut (rows : List EnvRow) (models : List EnvModel) (bound lo hi : ℚ) :
    ℚ → List EnvCell → Bool
  | prev, [] => prev == 9 / 10
  | prev, c :: rest =>
    (c.lo == prev) && decide (c.lo < c.hi) && decide (c.hi ≤ 9 / 10) &&
    decide (c.model < models.length) &&
    ((decide (lo ≤ c.lo) && decide (c.hi ≤ hi)) ||
     (let q := modelQuad rows (models.getD c.model ⟨0, 0, 0⟩)
      decide (quadMax q.1 q.2.1 q.2.2 c.lo c.hi ≤ bound))) &&
    checkCellsOut rows models bound lo hi c.hi rest

def checkOuter (rows : List EnvRow) (models : List EnvModel) (cells : List EnvCell)
    (bound lo hi : ℚ) : Bool :=
  models.all (checkModel rows) && checkCellsOut rows models bound lo hi 0 cells

lemma cellsOut_sound (rows : List EnvRow) (models : List EnvModel) (bound lo hi : ℚ) :
    ∀ (prev : ℚ) (cells : List EnvCell), checkCellsOut rows models bound lo hi prev cells = true →
    cells ≠ [] → ∀ t : ℝ, (prev : ℝ) ≤ t → t ≤ 9 / 10 → (t < lo ∨ (hi : ℝ) < t) →
      ∃ c ∈ cells, (c.lo : ℝ) ≤ t ∧ t ≤ c.hi ∧ c.model < models.length ∧
        (let q := modelQuad rows (models.getD c.model ⟨0, 0, 0⟩)
         quadMax q.1 q.2.1 q.2.2 c.lo c.hi ≤ bound)
  | _, [], _, hne, _, _, _, _ => absurd rfl hne
  | prev, c :: rest, h, _, t, hpt, ht, hout => by
    simp only [checkCellsOut, Bool.and_eq_true, Bool.or_eq_true, beq_iff_eq,
      decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨⟨hlo, hlh⟩, hhi⟩, hm⟩, hq⟩, hrest⟩ := h
    by_cases hth : t ≤ (c.hi : ℝ)
    · refine ⟨c, List.mem_cons_self .., by rw [hlo]; exact hpt, hth, hm, ?_⟩
      rcases hq with ⟨hl, hh⟩ | hq
      · exfalso
        have hl' : (lo : ℝ) ≤ c.lo := by exact_mod_cast hl
        have hh' : (c.hi : ℝ) ≤ hi := by exact_mod_cast hh
        have hpt' : (c.lo : ℝ) ≤ t := by rw [hlo]; exact hpt
        rcases hout with h | h <;> linarith
      · exact hq
    · cases rest with
      | nil =>
        simp only [checkCellsOut, beq_iff_eq] at hrest
        exfalso
        have : (c.hi : ℝ) = 9 / 10 := by rw [hrest]; norm_num
        exact hth (ht.trans this.ge)
      | cons c' rest' =>
        obtain ⟨c'', hc'', h1, h2, h3, h4⟩ :=
          cellsOut_sound rows models bound lo hi c.hi (c' :: rest') hrest (by simp) t
            (le_of_lt (not_le.1 hth)) ht hout
        exact ⟨c'', List.mem_cons_of_mem _ hc'', h1, h2, h3, h4⟩

/-- **Soundness of the outer envelope**: `V ≤ bound` for `t ∉ [lo, hi]`. -/
theorem outer_bound (rows : List EnvRow) (models : List EnvModel) (cells : List EnvCell)
    (bound lo hi : ℚ) (hchk : checkOuter rows models cells bound lo hi = true) (t V : ℝ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10) (hout : t < lo ∨ (hi : ℝ) < t)
    (hmix : ∀ i j : ℕ, i < rows.length → j < rows.length → ∀ θ : ℝ, 0 ≤ θ → θ ≤ 1 →
      V ≤ (1 - θ) * F (rows.getD i dfltRow) t + θ * F (rows.getD j dfltRow) t
        - (2 / (ε : ℝ)) * θ * (1 - θ) *
            ((rows.getD i dfltRow).beta - (rows.getD j dfltRow).beta) ^ 2) :
    V ≤ bound := by
  simp only [checkOuter, Bool.and_eq_true, List.all_eq_true] at hchk
  obtain ⟨hmodels, hcells⟩ := hchk
  have hne : cells ≠ [] := by
    intro hnil
    rw [hnil] at hcells
    simp only [checkCellsOut, beq_iff_eq] at hcells
    norm_num at hcells
  obtain ⟨c, _, hlo, hhi, hm, hq⟩ := cellsOut_sound rows models bound lo hi 0 cells hcells hne t
    (by simpa using ht0) ht1 hout
  set m := models.getD c.model ⟨0, 0, 0⟩ with hm_def
  have hmodel := hmodels m (getD_mem_of_lt _ _ _ hm)
  simp only [checkModel, Bool.and_eq_true, decide_eq_true_eq] at hmodel
  obtain ⟨⟨⟨hi', hj⟩, hθ0⟩, hθ1⟩ := hmodel
  have h1 := hmix m.i m.j hi' hj m.θ (by exact_mod_cast hθ0) (by exact_mod_cast hθ1)
  rw [← modelQuad_eval] at h1
  have h2 := quadVal_le_quadMax (modelQuad rows m).1 (modelQuad rows m).2.1
    (modelQuad rows m).2.2 c.lo c.hi t hlo hhi
  have h3 : ((quadMax (modelQuad rows m).1 (modelQuad rows m).2.1 (modelQuad rows m).2.2
      c.lo c.hi : ℚ) : ℝ) ≤ bound := by exact_mod_cast hq
  linarith

/-! ### Soundness of the box bound -/

/-- The `x`-endpoint lemma for a nonnegative combination of two node polynomials. -/
lemma J_combo_endpoint (P Q : MPoly) (w0 w1 : ℝ) (hw0 : 0 ≤ w0) (hw1 : 0 ≤ w1) (h6P : 0 ≤ P.a6)
    (h6Q : 0 ≤ Q.a6) (x xlo xhi : ℝ) (hx0 : 0 ≤ xlo) (h1 : xlo ≤ x) (h2 : x ≤ xhi) :
    w0 * P.J 0 1 x + w1 * Q.J 0 1 x
      ≤ max (w0 * P.J 0 1 xlo + w1 * Q.J 0 1 xlo) (w0 * P.J 0 1 xhi + w1 * Q.J 0 1 xhi) := by
  have hC6 : (0 : ℝ) ≤ (C6 : ℚ) := by norm_num [C6]
  have hP : (0 : ℝ) ≤ P.a6 := by exact_mod_cast h6P
  have hQ : (0 : ℝ) ≤ Q.a6 := by exact_mod_cast h6Q
  obtain ⟨a, ha⟩ : ∃ a : ℝ, a = w0 * (P.a4 + 9 * P.a6) + w1 * (Q.a4 + 9 * Q.a6) := ⟨_, rfl⟩
  obtain ⟨b, hb⟩ : ∃ b : ℝ, b = (C6 : ℚ) * (w0 * P.a6 + w1 * Q.a6) := ⟨_, rfl⟩
  obtain ⟨K, hK⟩ : ∃ K : ℝ, K = w0 * (P.a0 + ρ * P.a1 + P.a2 + 2 * P.a4 + 6 * P.a6)
      + w1 * (Q.a0 + ρ * Q.a1 + Q.a2 + 2 * Q.a4 + 6 * Q.a6) := ⟨_, rfl⟩
  have hJ : ∀ y : ℝ, w0 * P.J 0 1 y + w1 * Q.J 0 1 y = K + (a * y ^ 2 + b * y ^ 3) := by
    intro y; simp only [MPoly.J, hK, ha, hb]; push_cast; ring
  have hb0 : 0 ≤ b := by
    rw [hb]; exact mul_nonneg hC6 (add_nonneg (mul_nonneg hw0 hP) (mul_nonneg hw1 hQ))
  have := cubic_endpoint_le a b x xlo xhi hb0 hx0 h1 h2
  rw [hJ x, hJ, hJ]
  rcases le_max_iff.1 this with h | h
  · exact le_max_of_le_left (by linarith)
  · exact le_max_of_le_right (by linarith)

/-- The chord in `τ` minus the price is at most `xPart`. -/
lemma chord_quad_le (Lm Lp : MPoly) (D sl su xh : ℚ) (hslsu : sl < su) (τ : ℝ)
    (hτl : (sl : ℝ) ≤ τ) (hτu : τ ≤ su) :
    ((su : ℝ) - τ) / (su - sl) * Lm.J 0 1 xh + (τ - sl) / (su - sl) * Lp.J 0 1 xh
      - D * τ ^ 2 ≤ (xPart Lm Lp D sl su xh : ℚ) := by
  have hd : (0 : ℝ) < su - sl := by
    have : (sl : ℝ) < su := by exact_mod_cast hslsu
    linarith
  have hdq : (su : ℚ) - sl ≠ 0 := by
    have : sl ≠ su := hslsu.ne
    intro h; apply this; linarith
  simp only [xPart]
  have hq := quadVal_le_quadMax (Lm.Jq 0 1 xh - (Lp.Jq 0 1 xh - Lm.Jq 0 1 xh) / (su - sl) * sl)
    ((Lp.Jq 0 1 xh - Lm.Jq 0 1 xh) / (su - sl)) (-D) sl su τ hτl hτu
  have e : ((Lm.Jq 0 1 xh - (Lp.Jq 0 1 xh - Lm.Jq 0 1 xh) / (su - sl) * sl : ℚ) : ℝ)
      + ((Lp.Jq 0 1 xh - Lm.Jq 0 1 xh) / (su - sl) : ℚ) * τ + ((-D : ℚ) : ℝ) * τ ^ 2
      = ((su : ℝ) - τ) / (su - sl) * Lm.J 0 1 xh + (τ - sl) / (su - sl) * Lp.J 0 1 xh
        - D * τ ^ 2 := by
    have e1 : ((Lm.Jq 0 1 xh : ℚ) : ℝ) = Lm.J 0 1 xh := by
      have := MPoly.Jq_cast Lm 0 1 xh; push_cast at this; exact this
    have e2 : ((Lp.Jq 0 1 xh : ℚ) : ℝ) = Lp.J 0 1 xh := by
      have := MPoly.Jq_cast Lp 0 1 xh; push_cast at this; exact this
    push_cast
    rw [e1, e2]
    field_simp
    ring
  rw [e] at hq
  exact hq

section slab

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

set_option maxHeartbeats 800000 in
/-- **The box bound.**  From the two row inequalities with the common law, scale and gate
variable, the mixed gate price and certified chord polynomials at `τ₋`, `τ₊`. -/
theorem slab_bound (Ri Rj : Row) (θ : ℚ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1)
    (hgate : mixGateOK Ri Rj θ = true) {Ψi Ψj : ℝ → ℝ}
    (hci : ConvexOn ℝ (Set.Ici 0) fun s => Ψi s - capPad)
    (hcj : ConvexOn ℝ (Set.Ici 0) fun s => Ψj s - capPad)
    (hδi : 0 ≤ Ri.delta) (hδj : 0 ≤ Rj.delta)
    (X1 X2 X3 : Ω → ℂ) (τ : ℝ) (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x)
    (hfi : Integrable (fun ω => Ψi (Ri.delta * τ * √(U ω))) μ)
    (hfj : Integrable (fun ω => Ψj (Rj.delta * τ * √(U ω))) μ)
    (hgi : Integrable (fun ω => Ri.gate (X1 ω) (X2 ω) (X3 ω)) μ)
    (hgj : Integrable (fun ω => Rj.gate (X1 ω) (X2 ω) (X3 ω)) μ)
    (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2)
    (hVi : V ≤ t ^ 2 - 2 * Ri.ell * t + 2 * Ri.beta ^ 2 / ε + ∫ ω, Ψi (Ri.delta * τ * √(U ω)) ∂μ
      - Ri.delta * τ ^ 2 - ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + ((Ri.beta : ℝ) / ε) • v‖ ^ 2)
    (hVj : V ≤ t ^ 2 - 2 * Rj.ell * t + 2 * Rj.beta ^ 2 / ε + ∫ ω, Ψj (Rj.delta * τ * √(U ω)) ∂μ
      - Rj.delta * τ ^ 2 - ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + ((Rj.beta : ℝ) / ε) • v‖ ^ 2)
    (Lm Lp : MPoly) (h6m : 0 ≤ Lm.a6) (h6p : 0 ≤ Lp.a6) (tl tu sl su xl xu : ℚ)
    (hTm : TB μ U (mixPot Ri Rj θ Ψi Ψj) sl (Lm.J 0 1 x))
    (hTp : TB μ U (mixPot Ri Rj θ Ψi Ψj) su (Lp.J 0 1 x))
    (hsl : 0 ≤ sl) (hslsu : sl < su) (hτl : (sl : ℝ) ≤ τ) (hτu : τ ≤ su) (htl : (tl : ℝ) ≤ t)
    (htu : t ≤ tu) (hxl0 : 0 ≤ xl) (hxl : (xl : ℝ) ≤ x) (hxu : x ≤ xu) :
    V ≤ (boxVal ((1 - θ) * Ri.ell + θ * Rj.ell) ((1 - θ) * Ri.beta + θ * Rj.beta)
      (mixPrice Ri Rj θ) Lm Lp tl tu sl su xl xu : ℚ) := by
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have hθ0R : (0 : ℝ) ≤ θ := by exact_mod_cast hθ0
  have hθ1R : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
  have hw0 : (0 : ℝ) ≤ 1 - θ := by linarith
  have hδiR : (0 : ℝ) ≤ Ri.delta := by exact_mod_cast hδi
  have hδjR : (0 : ℝ) ≤ Rj.delta := by exact_mod_cast hδj
  -- the retained-square mixing of the two row inequalities
  obtain ⟨Ci, hCi⟩ : ∃ C : ℝ, C = 2 * Ri.beta ^ 2 / ε + ∫ ω, Ψi (Ri.delta * τ * √(U ω)) ∂μ
      - Ri.delta * τ ^ 2 - ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ := ⟨_, rfl⟩
  obtain ⟨Cj, hCj⟩ : ∃ C : ℝ, C = 2 * Rj.beta ^ 2 / ε + ∫ ω, Ψj (Rj.delta * τ * √(U ω)) ∂μ
      - Rj.delta * τ ^ 2 - ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ := ⟨_, rfl⟩
  have hRi : LowerAnalytic.RowHolds (ε : ℝ) Ri.ell Ri.beta Ci V t Qh v := by
    unfold LowerAnalytic.RowHolds; rw [hCi]; linarith
  have hRj : LowerAnalytic.RowHolds (ε : ℝ) Rj.ell Rj.beta Cj V t Qh v := by
    unfold LowerAnalytic.RowHolds; rw [hCj]; linarith
  have hmix := LowerAnalytic.rowHolds_mix (ε : ℝ) _ _ _ _ _ _ V t hε Qh v hv hRi hRj θ hθ0R hθ1R
  -- the mixed gate form and its price
  have hgmix : (mixPrice Ri Rj θ : ℝ) * τ ^ 2
      ≤ ((1 - θ) * Ri.delta + θ * Rj.delta) * τ ^ 2
        + ((1 - θ) * ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
          + θ * ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ) := by
    have hint : Integrable (fun ω => gateForm (Sym3.mix θ Ri.N Rj.N)
        ((1 - θ) * Ri.g1 + θ * Rj.g1) ((1 - θ) * Ri.g2 + θ * Rj.g2)
        ((1 - θ) * Ri.g3 + θ * Rj.g3) (X1 ω) (X2 ω) (X3 ω)) μ := by
      have e : (fun ω => gateForm (Sym3.mix θ Ri.N Rj.N)
          ((1 - θ) * Ri.g1 + θ * Rj.g1) ((1 - θ) * Ri.g2 + θ * Rj.g2)
          ((1 - θ) * Ri.g3 + θ * Rj.g3) (X1 ω) (X2 ω) (X3 ω))
          = fun ω => (1 - θ) * Ri.gate (X1 ω) (X2 ω) (X3 ω) + θ * Rj.gate (X1 ω) (X2 ω) (X3 ω) := by
        funext ω; rw [gateForm_mix]; rfl
      rw [e]
      exact (hgi.const_mul _).add (hgj.const_mul _)
    have h := gate_integral_ge _ _ _ _ hgate X1 X2 X3 τ hX hM hint
    have e : ∫ ω, gateForm (Sym3.mix θ Ri.N Rj.N)
        ((1 - θ) * Ri.g1 + θ * Rj.g1) ((1 - θ) * Ri.g2 + θ * Rj.g2)
        ((1 - θ) * Ri.g3 + θ * Rj.g3) (X1 ω) (X2 ω) (X3 ω) ∂μ
        = (1 - θ) * ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
          + θ * ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ := by
      rw [← integral_const_mul, ← integral_const_mul, ← integral_add (hgi.const_mul _)
        (hgj.const_mul _)]
      congr 1
      funext ω
      rw [gateForm_mix]
      rfl
    rw [e] at h
    simp only [mixPrice]
    push_cast
    linarith
  -- the mixed potential: its integral and the chord bound
  have hfi' : Integrable (fun ω => Ψi (Ri.delta * (τ * √(U ω))) - capPad) μ := by
    have e : (fun ω => Ψi (Ri.delta * (τ * √(U ω))) - capPad)
        = fun ω => Ψi (Ri.delta * τ * √(U ω)) - capPad := by funext ω; rw [mul_assoc]
    rw [e]; exact hfi.sub (integrable_const _)
  have hfj' : Integrable (fun ω => Ψj (Rj.delta * (τ * √(U ω))) - capPad) μ := by
    have e : (fun ω => Ψj (Rj.delta * (τ * √(U ω))) - capPad)
        = fun ω => Ψj (Rj.delta * τ * √(U ω)) - capPad := by funext ω; rw [mul_assoc]
    rw [e]; exact hfj.sub (integrable_const _)
  have hfmix : Integrable (fun ω => mixPot Ri Rj θ Ψi Ψj (τ * √(U ω))) μ :=
    (hfi'.const_mul _).add (hfj'.const_mul _)
  have hImix : ∫ ω, mixPot Ri Rj θ Ψi Ψj (τ * √(U ω)) ∂μ
      = (1 - θ) * (∫ ω, Ψi (Ri.delta * τ * √(U ω)) ∂μ - capPad)
        + θ * (∫ ω, Ψj (Rj.delta * τ * √(U ω)) ∂μ - capPad) := by
    unfold mixPot
    rw [integral_add (hfi'.const_mul _) (hfj'.const_mul _), integral_const_mul, integral_const_mul,
      integral_sub (by simpa only [mul_assoc] using hfi) (integrable_const _),
      integral_sub (by simpa only [mul_assoc] using hfj) (integrable_const _), integral_const,
      probReal_univ, one_smul]
    simp only [mul_assoc]
  have hconv : ConvexOn ℝ (Set.Ici 0) (mixPot Ri Rj θ Ψi Ψj) :=
    convexOn_mix (convexOn_scale hci _ hδiR) (convexOn_scale hcj _ hδjR) _ _ hw0 hθ0R
  have hsluR : (sl : ℝ) < su := by exact_mod_cast hslsu
  have hT := TB.chord hconv _ _ τ _ _ (by exact_mod_cast hsl) hsluR hτl hτu hTm hTp
  have hIle := hT.integral hfmix
  -- the `x`-endpoint and the `τ`-quadratic
  have hd : (0 : ℝ) < su - sl := by linarith
  have hw0' : (0 : ℝ) ≤ ((su : ℝ) - τ) / (su - sl) := div_nonneg (by linarith) hd.le
  have hw1' : (0 : ℝ) ≤ (τ - sl) / (su - sl) := div_nonneg (by linarith) hd.le
  have hxe := J_combo_endpoint Lm Lp _ _ hw0' hw1' h6m h6p x xl xu (by exact_mod_cast hxl0) hxl hxu
  have hq1 := chord_quad_le Lm Lp (mixPrice Ri Rj θ) sl su xl hslsu τ hτl hτu
  have hq2 := chord_quad_le Lm Lp (mixPrice Ri Rj θ) sl su xu hslsu τ hτl hτu
  have hxmax : ((su : ℝ) - τ) / (su - sl) * Lm.J 0 1 x + (τ - sl) / (su - sl) * Lp.J 0 1 x
      - (mixPrice Ri Rj θ : ℝ) * τ ^ 2
      ≤ max ((xPart Lm Lp (mixPrice Ri Rj θ) sl su xl : ℚ) : ℝ)
          ((xPart Lm Lp (mixPrice Ri Rj θ) sl su xu : ℚ) : ℝ) := by
    rcases le_max_iff.1 hxe with h | h
    · exact le_max_of_le_left (by linarith)
    · exact le_max_of_le_right (by linarith)
  -- the `t`-quadratic
  have htq := quadVal_le_quadMax 0 (-2 * ((1 - θ) * Ri.ell + θ * Rj.ell)) 1 tl tu t htl htu
  -- assembly
  have hb : (1 - (θ : ℝ)) * (2 * Ri.beta ^ 2 / ε) + θ * (2 * Rj.beta ^ 2 / ε)
      - (2 / (ε : ℝ)) * θ * (1 - θ) * (Ri.beta - Rj.beta) ^ 2
      = 2 * ((1 - θ) * Ri.beta + θ * Rj.beta) ^ 2 / ε := by
    field_simp
    ring
  rw [hCi, hCj] at hmix
  have key : (1 - (θ : ℝ)) * (t ^ 2 - 2 * Ri.ell * t + (2 * Ri.beta ^ 2 / ε
        + ∫ ω, Ψi (Ri.delta * τ * √(U ω)) ∂μ - Ri.delta * τ ^ 2
        - ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ))
      + θ * (t ^ 2 - 2 * Rj.ell * t + (2 * Rj.beta ^ 2 / ε
        + ∫ ω, Ψj (Rj.delta * τ * √(U ω)) ∂μ - Rj.delta * τ ^ 2
        - ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ))
      - (2 / (ε : ℝ)) * θ * (1 - θ) * (Ri.beta - Rj.beta) ^ 2
      = t ^ 2 - 2 * ((1 - θ) * Ri.ell + θ * Rj.ell) * t
        + ((1 - (θ : ℝ)) * (2 * Ri.beta ^ 2 / ε) + θ * (2 * Rj.beta ^ 2 / ε)
          - (2 / (ε : ℝ)) * θ * (1 - θ) * (Ri.beta - Rj.beta) ^ 2)
        + ((1 - θ) * (∫ ω, Ψi (Ri.delta * τ * √(U ω)) ∂μ - capPad)
          + θ * (∫ ω, Ψj (Rj.delta * τ * √(U ω)) ∂μ - capPad)) + capPad
        - ((1 - θ) * Ri.delta + θ * Rj.delta) * τ ^ 2
        - ((1 - θ) * ∫ ω, Ri.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
          + θ * ∫ ω, Rj.gate (X1 ω) (X2 ω) (X3 ω) ∂μ) := by ring
  have hfinal : V ≤ t ^ 2 - 2 * ((1 - θ) * Ri.ell + θ * Rj.ell) * t
      + 2 * ((1 - θ) * Ri.beta + θ * Rj.beta) ^ 2 / ε
      + (∫ ω, mixPot Ri Rj θ Ψi Ψj (τ * √(U ω)) ∂μ) + capPad
      - (mixPrice Ri Rj θ : ℝ) * τ ^ 2 := by
    rw [hImix]
    linarith only [hmix, hgmix, hb, key]
  simp only [boxVal, tPart]
  push_cast at htq ⊢
  linarith only [hfinal, htq, hIle, hxmax]

end slab

/-! ### From the data to the bound -/

lemma chords4_some (tns : List TNode) (sl su : ℚ) (Pm Pp : MPoly)
    (h : chords4 tns sl su = some (Pm, Pp)) :
    ∃ n0 n1 n2 n3, tns = [n0, n1, n2, n3] ∧ tchordOK n0 n1 sl = true ∧ tchordOK n2 n3 su = true ∧
      Pm = tchordP n0 n1 sl ∧ Pp = tchordP n2 n3 su := by
  match tns, h with
  | [n0, n1, n2, n3], h =>
    simp only [chords4] at h
    split_ifs at h with hok
    simp only [Option.some.injEq, Prod.mk.injEq] at h
    simp only [Bool.and_eq_true] at hok
    exact ⟨n0, n1, n2, n3, rfl, hok.1, hok.2, h.1.symm, h.2.symm⟩
  | [], h => simp [chords4] at h
  | [_], h => simp [chords4] at h
  | [_, _], h => simp [chords4] at h
  | [_, _, _], h => simp [chords4] at h
  | _ :: _ :: _ :: _ :: _ :: _, h => simp [chords4] at h

section data

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

/-- The data of one row in the shared reduction: a potential with the node caps of the row (up to
`capPad`), integrable at the common scale, the integrable gate expression of the common gate
variable, and the row inequality with the retained gate square. -/
def RowShared (r : Row) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ) (τ V t : ℝ)
    (Qh v : E) : Prop :=
  ∃ Ψ : ℝ → ℝ, CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
    Integrable (fun ω => Ψ (r.delta * τ * √(U ω))) μ ∧
    Integrable (fun ω => r.gate (X1 ω) (X2 ω) (X3 ω)) μ ∧
    V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Ψ (r.delta * τ * √(U ω)) ∂μ
      - r.delta * τ ^ 2 - ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2

/-- The chord polynomials of a source row at `sl` and `su` from its resolved `τ`-nodes. -/
lemma src_chords (R : Row) (hR : checkRow R = true) {Ψ : ℝ → ℝ}
    (hΨ : CapsHold (fun s => Ψ s - capPad) R.nodeList R.smax) (hM : Moments μ U x)
    (hS : SteinCut μ U) (refs : List (Option (ℕ × ℕ))) (ns : List TNode)
    (hres : resolve (rowTNode R) refs = some ns) (sl su : ℚ) (Pm Pp : MPoly)
    (hch : chords4 ns sl su = some (Pm, Pp)) :
    TB μ U (fun s => Ψ (R.delta * s) - capPad) sl (Pm.J 0 1 x) ∧
    TB μ U (fun s => Ψ (R.delta * s) - capPad) su (Pp.J 0 1 x) := by
  have hδ : (0 : ℝ) ≤ R.delta := by exact_mod_cast (rowBound_of_check R hR).1.delta_pos.le
  have hconv : ConvexOn ℝ (Set.Ici 0) fun s => Ψ (R.delta * s) - capPad :=
    convexOn_scale hΨ.convex _ hδ
  have hok : ∀ n ∈ ns, TNodeOK μ U x (fun s => Ψ (R.delta * s) - capPad) n := by
    intro n hn
    obtain ⟨ref, _, href⟩ := resolve_mem _ refs ns hres n hn
    exact rowTNode_sound R hR hΨ hM hS ref n href
  obtain ⟨n0, n1, n2, n3, rfl, h01, h23, rfl, rfl⟩ := chords4_some ns sl su Pm Pp hch
  exact ⟨tchord_sound hconv n0 n1 sl h01 (hok n0 (by simp)) (hok n1 (by simp)),
    tchord_sound hconv n2 n3 su h23 (hok n2 (by simp)) (hok n3 (by simp))⟩

/-- **Soundness of a box**: `V ≤ val` for every `(t, τ, x)` in the box. -/
theorem box_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (b : Box) (val : ℚ) (hb : boxBound rows batches b = some val) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ)
    (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hred : ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v)
    (ht : (b.tl : ℝ) ≤ t ∧ t ≤ b.tu) (hτ : (b.sl : ℝ) ≤ τ ∧ τ ≤ b.su)
    (hx : (b.xl : ℝ) ≤ x ∧ x ≤ b.xu) : V ≤ val := by
  obtain ⟨tl, tu, sl, su, xl, xu, kind⟩ := b
  simp only at ht hτ hx
  unfold boxBound at hb
  split_ifs at hb with hvalid
  obtain ⟨hsl, hslsu, _, hxl0, _⟩ := hvalid
  cases kind with
  | src i j θ ri rj =>
    simp only at hb
    cases hRi : rows[i]? with
    | none => simp [hRi] at hb
    | some Ri =>
    cases hRj : rows[j]? with
    | none => simp [hRi, hRj] at hb
    | some Rj =>
    simp only [hRi, hRj] at hb
    cases hni : resolve (rowTNode Ri) ri with
    | none => simp [hni] at hb
    | some ni =>
    cases hnj : resolve (rowTNode Rj) rj with
    | none => simp [hni, hnj] at hb
    | some nj =>
    simp only [hni, hnj] at hb
    cases hci : chords4 ni sl su with
    | none => simp [hci] at hb
    | some Pi =>
    cases hcj : chords4 nj sl su with
    | none => simp [hci, hcj] at hb
    | some Pj =>
    obtain ⟨Pim, Pip⟩ := Pi
    obtain ⟨Pjm, Pjp⟩ := Pj
    simp only [hci, hcj] at hb
    have hRic := hrows Ri (List.mem_of_getElem? hRi)
    have hRjc := hrows Rj (List.mem_of_getElem? hRj)
    obtain ⟨Ψi, hΨi, hfi, hgi, hVi⟩ := hred Ri (List.mem_of_getElem? hRi)
    obtain ⟨Ψj, hΨj, hfj, hgj, hVj⟩ := hred Rj (List.mem_of_getElem? hRj)
    have hchi := src_chords Ri hRic hΨi hM hS ri ni hni sl su Pim Pip hci
    have hchj := src_chords Rj hRjc hΨj hM hS rj nj hnj sl su Pjm Pjp hcj
    unfold finish at hb
    split_ifs at hb with hcond
    simp only [Option.some.injEq] at hb
    subst hb
    obtain ⟨hθ0, hθ1, hgate, h6m, h6p⟩ := hcond
    have hθ0R : (0 : ℝ) ≤ θ := by exact_mod_cast hθ0
    have hθ1R : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
    have hw0 : (0 : ℝ) ≤ 1 - θ := by linarith
    have hTm : TB μ U (mixPot Ri Rj θ Ψi Ψj) sl ((MPoly.lin (1 - θ) θ Pim Pjm).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hchi.1 hchj.1
    have hTp : TB μ U (mixPot Ri Rj θ Ψi Ψj) su ((MPoly.lin (1 - θ) θ Pip Pjp).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hchi.2 hchj.2
    exact slab_bound Ri Rj θ hθ0 hθ1 hgate hΨi.convex hΨj.convex
      (rowBound_of_check Ri hRic).1.delta_pos.le (rowBound_of_check Rj hRjc).1.delta_pos.le
      X1 X2 X3 τ hX hM hfi hfj hgi hgj V t Qh v hv hVi hVj _ _ h6m h6p tl tu sl su xl xu hTm hTp
      hsl hslsu hτ.1 hτ.2 ht.1 ht.2 hxl0 hx.1 hx.2
  | joint bi ks =>
    simp only at hb
    cases hbt : batches[bi]? with
    | none => simp [hbt] at hb
    | some bt =>
    simp only [hbt] at hb
    cases hRi : rows[bt.i]? with
    | none => simp [hRi] at hb
    | some Ri =>
    cases hRj : rows[bt.j]? with
    | none => simp [hRi, hRj] at hb
    | some Rj =>
    simp only [hRi, hRj] at hb
    cases hns : resolve (fun k => bt.tnodes[k]?) ks with
    | none => simp [hns] at hb
    | some ns =>
    simp only [hns] at hb
    cases hch : chords4 ns sl su with
    | none => simp [hch] at hb
    | some P =>
    obtain ⟨Lm, Lp⟩ := P
    simp only [hch] at hb
    have hRic := hrows Ri (List.mem_of_getElem? hRi)
    have hRjc := hrows Rj (List.mem_of_getElem? hRj)
    obtain ⟨Ψi, hΨi, hfi, hgi, hVi⟩ := hred Ri (List.mem_of_getElem? hRi)
    obtain ⟨Ψj, hΨj, hfj, hgj, hVj⟩ := hred Rj (List.mem_of_getElem? hRj)
    have hok := batch_sound rows bt (hbatches bt (List.mem_of_getElem? hbt)) Ri Rj hRi hRj hΨi hΨj
      hM hS
    unfold finish at hb
    split_ifs at hb with hcond
    simp only [Option.some.injEq] at hb
    subst hb
    obtain ⟨hθ0, hθ1, hgate, h6m, h6p⟩ := hcond
    have hθ0R : (0 : ℝ) ≤ bt.θ := by exact_mod_cast hθ0
    have hθ1R : (bt.θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
    have hw0 : (0 : ℝ) ≤ 1 - bt.θ := by linarith
    have hδi : (0 : ℝ) ≤ Ri.delta := by
      exact_mod_cast (rowBound_of_check Ri hRic).1.delta_pos.le
    have hδj : (0 : ℝ) ≤ Rj.delta := by
      exact_mod_cast (rowBound_of_check Rj hRjc).1.delta_pos.le
    have hconv : ConvexOn ℝ (Set.Ici 0) (mixPot Ri Rj bt.θ Ψi Ψj) :=
      convexOn_mix (convexOn_scale hΨi.convex _ hδi) (convexOn_scale hΨj.convex _ hδj) _ _ hw0
        hθ0R
    obtain ⟨n0, n1, n2, n3, rfl, h01, h23, rfl, rfl⟩ := chords4_some ns sl su Lm Lp hch
    have hmem : ∀ n ∈ [n0, n1, n2, n3], TNodeOK μ U x (mixPot Ri Rj bt.θ Ψi Ψj) n := by
      intro n hn
      obtain ⟨k, _, hk⟩ := resolve_mem _ ks _ hns n hn
      exact hok n (List.mem_of_getElem? hk)
    have hTm := tchord_sound hconv n0 n1 sl h01 (hmem n0 (by simp)) (hmem n1 (by simp))
    have hTp := tchord_sound hconv n2 n3 su h23 (hmem n2 (by simp)) (hmem n3 (by simp))
    exact slab_bound Ri Rj bt.θ hθ0 hθ1 hgate hΨi.convex hΨj.convex
      (rowBound_of_check Ri hRic).1.delta_pos.le (rowBound_of_check Rj hRjc).1.delta_pos.le
      X1 X2 X3 τ hX hM hfi hfj hgi hgj V t Qh v hv hVi hVj _ _ h6m h6p tl tu sl su xl xu hTm hTp
      hsl hslsu hτ.1 hτ.2 ht.1 ht.2 hxl0 hx.1 hx.2

end data

end Grothe.Lower
