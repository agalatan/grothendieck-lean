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

  `V ≤ max_t (t² − 2ℓ̄t) + 2β̄²/ε + max_{x̂} max_{τ∈[τ₋,τ₊]} [chord(L₋(x̂), L₊(x̂))(τ) − Dτ²] + pad`

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

/-- A *virtual row*: the parameters `(ℓ, β, δ, N, g)` of a row or of a mixture of rows. -/
structure VRow where
  ell : ℚ
  beta : ℚ
  delta : ℚ
  N : Sym3
  g1 : ℚ
  g2 : ℚ
  g3 : ℚ

def Row.vrow (r : Row) : VRow := ⟨r.ell, r.beta, r.delta, r.N, r.g1, r.g2, r.g3⟩

/-- The mixture `(1−θ)a + θb` of two virtual rows (all parameters are affine). -/
def VRow.mix (θ : ℚ) (a b : VRow) : VRow :=
  ⟨(1 - θ) * a.ell + θ * b.ell, (1 - θ) * a.beta + θ * b.beta, (1 - θ) * a.delta + θ * b.delta,
   Sym3.mix θ a.N b.N, (1 - θ) * a.g1 + θ * b.g1, (1 - θ) * a.g2 + θ * b.g2,
   (1 - θ) * a.g3 + θ * b.g3⟩

/-- The pinned gate price `D = δ + gatePrice(N, g)` of a virtual row. -/
def VRow.price (a : VRow) : ℚ := a.delta + gatePrice a.N a.g1 a.g2 a.g3

/-- The gate expression of a virtual row. -/
def VRow.gate (a : VRow) (X1 X2 X3 : ℂ) : ℝ := gateForm a.N a.g1 a.g2 a.g3 X1 X2 X3

lemma VRow.gate_mix (θ : ℚ) (a b : VRow) (X1 X2 X3 : ℂ) :
    (VRow.mix θ a b).gate X1 X2 X3 = (1 - θ) * a.gate X1 X2 X3 + θ * b.gate X1 X2 X3 :=
  gateForm_mix θ a.N b.N a.g1 a.g2 a.g3 b.g1 b.g2 b.g3 X1 X2 X3

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

/-- The kind of a box: a source box `(i, j, θ, refs of row i, refs of row j)`, a joint box
`(batch, witness indices)`, or a joint-mixture box `(batch₀, batch₁, λ, indices₀, indices₁)`
mixing two batches before the gate completion. -/
inductive BoxKind where
  | src (i j : ℕ) (θ : ℚ) (ri rj : List (Option (ℕ × ℕ)))
  | joint (b : ℕ) (ks : List ℕ)
  | jmix (b0 b1 : ℕ) (lam : ℚ) (k0 k1 : List ℕ)

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

/-- `s|tl,tu,sl,su,xl,xu|i,j,θ|refsᵢ|refsⱼ`, `j|tl,tu,sl,su,xl,xu|batch|k₀,k₁,k₂,k₃` or
`m|tl,tu,sl,su,xl,xu|batch₀,batch₁,λ|k₀,k₁,k₂,k₃|k₀',k₁',k₂',k₃'`. -/
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
  | ["m", bx, bb, k0, k1] =>
    match parseQs bx, bb.splitOn "," with
    | [tl, tu, sl, su, xl, xu], [b0, b1, lam] =>
      ⟨tl, tu, sl, su, xl, xu, .jmix b0.toNat! b1.toNat! (parseQ lam)
        ((splitL k0 ",").map String.toNat!) ((splitL k1 ",").map String.toNat!)⟩
    | _, _ => dfltBox
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

/-- The final value from the virtual row and the two chord polynomials. -/
def finish (a : VRow) (Lm Lp : MPoly) (b : Box) : Option ℚ :=
  if gateOK a.N = true ∧ 0 ≤ Lm.a6 ∧ 0 ≤ Lp.a6 then
    some (boxVal a.ell a.beta a.price Lm Lp b.tl b.tu b.sl b.su b.xl b.xu)
  else none

/-- The virtual row and the chord polynomials of a batch on a box. -/
def batchData (rows : List Row) (bt : JBatch) (ks : List ℕ) (sl su : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match rows[bt.i]?, rows[bt.j]? with
  | some Ri, some Rj =>
    match resolve (fun k => bt.tnodes[k]?) ks with
    | some ns =>
      match chords4 ns sl su with
      | some (Lm, Lp) => some (VRow.mix bt.θ Ri.vrow Rj.vrow, Lm, Lp)
      | none => none
    | none => none
  | _, _ => none

/-- The bound of a box from the rows and the batches (`none` if the data are inconsistent). -/
def boxBound (rows : List Row) (batches : List JBatch) (b : Box) : Option ℚ :=
  if ¬ (0 ≤ b.sl ∧ b.sl < b.su ∧ b.tl ≤ b.tu ∧ 0 ≤ b.xl ∧ b.xl ≤ b.xu) then none else
  match b.kind with
  | .src i j θ ri rj =>
    match rows[i]?, rows[j]? with
    | some Ri, some Rj =>
      if ¬ (0 ≤ θ ∧ θ ≤ 1) then none else
      match resolve (rowTNode Ri) ri, resolve (rowTNode Rj) rj with
      | some ni, some nj =>
        match chords4 ni b.sl b.su, chords4 nj b.sl b.su with
        | some (Pim, Pip), some (Pjm, Pjp) =>
          finish (VRow.mix θ Ri.vrow Rj.vrow) (MPoly.lin (1 - θ) θ Pim Pjm)
            (MPoly.lin (1 - θ) θ Pip Pjp) b
        | _, _ => none
      | _, _ => none
    | _, _ => none
  | .joint bi ks =>
    match batches[bi]? with
    | some bt =>
      match batchData rows bt ks b.sl b.su with
      | some (a, Lm, Lp) => finish a Lm Lp b
      | none => none
    | none => none
  | .jmix b0 b1 lam k0 k1 =>
    if ¬ (0 ≤ lam ∧ lam ≤ 1) then none else
    match batches[b0]?, batches[b1]? with
    | some bt0, some bt1 =>
      match batchData rows bt0 k0 b.sl b.su, batchData rows bt1 k1 b.sl b.su with
      | some (a0, Lm0, Lp0), some (a1, Lm1, Lp1) =>
        finish (VRow.mix lam a0 a1) (MPoly.lin (1 - lam) lam Lm0 Lm1)
          (MPoly.lin (1 - lam) lam Lp0 Lp1) b
      | _, _ => none
    | _, _ => none

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

/-! ### Regions of the slab -/

/-- A region `[lo, hi]` of `t` with its boxes. -/
structure Region where
  lo : ℚ
  hi : ℚ
  boxes : List String

/-- Consecutive regions from `prev` to `stop`, each with its boxes checked and covering
`[lo, hi] × [0, ρ] × [0, 31/4]`. -/
def checkRegions (rows : List Row) (batches : List JBatch) (bound : ℚ) :
    ℚ → ℚ → List Region → Bool
  | prev, stop, [] => prev == stop
  | prev, stop, r :: rest =>
    (r.lo == prev) && decide (r.lo < r.hi) && checkBoxes rows batches r.boxes bound &&
    coverOK (r.boxes.length + 1) (r.lo, r.hi, 0, ρ, 0, xMax)
      (r.boxes.map fun s => (parseBox s).dom) &&
    checkRegions rows batches bound r.hi stop rest

/-- The regions cover the slab `[lo, hi]`; no region means a degenerate slab `lo = hi`, which
the envelope covers entirely. -/
def checkSlab (rows : List Row) (batches : List JBatch) (bound lo hi : ℚ) (regs : List Region) :
    Bool :=
  if regs.isEmpty then lo == hi else checkRegions rows batches bound lo hi regs

lemma regions_sound (rows : List Row) (batches : List JBatch) (bound : ℚ) :
    ∀ (prev stop : ℚ) (regs : List Region), checkRegions rows batches bound prev stop regs = true →
    regs ≠ [] → ∀ t : ℝ, (prev : ℝ) ≤ t → t ≤ stop →
      ∃ r ∈ regs, (r.lo : ℝ) ≤ t ∧ t ≤ r.hi ∧ checkBoxes rows batches r.boxes bound = true ∧
        coverOK (r.boxes.length + 1) (r.lo, r.hi, 0, ρ, 0, xMax)
          (r.boxes.map fun s => (parseBox s).dom) = true
  | _, _, [], _, hne, _, _, _ => absurd rfl hne
  | prev, stop, r :: rest, h, _, t, hpt, ht => by
    simp only [checkRegions, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
    obtain ⟨⟨⟨⟨hlo, _⟩, hb⟩, hc⟩, hrest⟩ := h
    by_cases hth : t ≤ (r.hi : ℝ)
    · exact ⟨r, List.mem_cons_self .., by rw [hlo]; exact hpt, hth, hb, hc⟩
    · cases rest with
      | nil =>
        simp only [checkRegions, beq_iff_eq] at hrest
        exfalso
        exact hth (ht.trans (by rw [hrest]))
      | cons r' rest' =>
        obtain ⟨r'', hr'', h1, h2, h3, h4⟩ := regions_sound rows batches bound r.hi stop
          (r' :: rest') hrest (by simp) t (le_of_lt (not_le.1 hth)) ht
        exact ⟨r'', List.mem_cons_of_mem _ hr'', h1, h2, h3, h4⟩

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
    cells ≠ [] → ∀ t : ℝ, (prev : ℝ) ≤ t → t ≤ 9 / 10 → (t < lo ∨ (hi : ℝ) < t ∨ lo = hi) →
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
        have hlh' : (c.lo : ℝ) < c.hi := by exact_mod_cast hlh
        rcases hout with h | h | h
        · linarith
        · linarith
        · have : (lo : ℝ) = hi := by exact_mod_cast h
          linarith
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

/-- **Soundness of the outer envelope**: `V ≤ bound` for `t ∉ [lo, hi]` (or everywhere when the
slab is degenerate, `lo = hi`). -/
theorem outer_bound (rows : List EnvRow) (models : List EnvModel) (cells : List EnvCell)
    (bound lo hi : ℚ) (hchk : checkOuter rows models cells bound lo hi = true) (t V : ℝ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10) (hout : t < lo ∨ (hi : ℝ) < t ∨ lo = hi)
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

section vrow

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

/-- The inequality of a virtual row with the padded potential `Φ` (`E Φ(τ√U) + capPad` is the
mixed `E Ψ`), its gate square retained. -/
def VHolds (a : VRow) (Φ : ℝ → ℝ) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ)
    (τ V t : ℝ) (Qh v : E) : Prop :=
  Integrable (fun ω => Φ (τ * √(U ω))) μ ∧
  Integrable (fun ω => a.gate (X1 ω) (X2 ω) (X3 ω)) μ ∧
  V ≤ t ^ 2 - 2 * a.ell * t + 2 * a.beta ^ 2 / ε + (∫ ω, Φ (τ * √(U ω)) ∂μ + capPad)
    - a.delta * τ ^ 2 - ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
    - ε * ‖Qh + ((a.beta : ℝ) / ε) • v‖ ^ 2

/-- A row of the shared reduction is a virtual row with potential `s ↦ Ψ(δs) − capPad`. -/
lemma vholds_of_row (r : Row) {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E}
    (h : RowShared r μ U X1 X2 X3 τ V t Qh v) :
    ∃ Ψ : ℝ → ℝ, CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
      VHolds r.vrow (fun s => Ψ (r.delta * s) - capPad) μ U X1 X2 X3 τ V t Qh v := by
  obtain ⟨Ψ, hΨ, hf, hg, hV⟩ := h
  have e : (fun ω => Ψ (r.delta * (τ * √(U ω))) - capPad)
      = fun ω => Ψ (r.delta * τ * √(U ω)) - capPad := by funext ω; rw [mul_assoc]
  refine ⟨Ψ, hΨ, ?_, hg, ?_⟩
  · show Integrable (fun ω => Ψ (r.delta * (τ * √(U ω))) - capPad) μ
    rw [e]; exact hf.sub (integrable_const _)
  · have e2 : ∫ ω, (Ψ (r.delta * (τ * √(U ω))) - capPad) ∂μ
        = ∫ ω, Ψ (r.delta * τ * √(U ω)) ∂μ - capPad := by
      simp only [mul_assoc] at hf ⊢
      rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul]
    have eg : ∫ ω, r.vrow.gate (X1 ω) (X2 ω) (X3 ω) ∂μ = ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ := rfl
    show V ≤ _ - 2 * (r.vrow.ell : ℝ) * t + 2 * (r.vrow.beta : ℝ) ^ 2 / ε
      + ((∫ ω, (Ψ (r.delta * (τ * √(U ω))) - capPad) ∂μ) + capPad) - (r.vrow.delta : ℝ) * τ ^ 2
      - ∫ ω, r.vrow.gate (X1 ω) (X2 ω) (X3 ω) ∂μ - ε * ‖Qh + ((r.vrow.beta : ℝ) / ε) • v‖ ^ 2
    rw [e2, eg]
    have e3 : (r.vrow.ell : ℝ) = r.ell := rfl
    have e4 : (r.vrow.beta : ℝ) = r.beta := rfl
    have e5 : (r.vrow.delta : ℝ) = r.delta := rfl
    rw [e3, e4, e5]
    linarith

/-- `(1−θ)‖a‖² + θ‖b‖² = ‖(1−θ)a + θb‖² + θ(1−θ)‖a − b‖²`. -/
lemma mix_norm_sq (θ : ℝ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) (a b : E) :
    (1 - θ) * ‖a‖ ^ 2 + θ * ‖b‖ ^ 2
      = ‖(1 - θ) • a + θ • b‖ ^ 2 + θ * (1 - θ) * ‖a - b‖ ^ 2 := by
  rw [norm_add_sq_real, norm_sub_sq_real, norm_smul, norm_smul, real_inner_smul_left,
    real_inner_smul_right, mul_pow, mul_pow, Real.norm_eq_abs, Real.norm_eq_abs,
    abs_of_nonneg (by linarith : (0:ℝ) ≤ 1 - θ), abs_of_nonneg hθ0]
  ring

omit [IsProbabilityMeasure μ] in
/-- **Mixing two virtual rows**, retaining the common square. -/
theorem VHolds.mix (θ : ℚ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) {a b : VRow} {Φa Φb : ℝ → ℝ}
    {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E} (hv : ‖v‖ ^ 2 = 2)
    (ha : VHolds a Φa μ U X1 X2 X3 τ V t Qh v) (hb : VHolds b Φb μ U X1 X2 X3 τ V t Qh v) :
    VHolds (VRow.mix θ a b) (fun s => (1 - θ) * Φa s + θ * Φb s) μ U X1 X2 X3 τ V t Qh v := by
  obtain ⟨hfa, hga, hVa⟩ := ha
  obtain ⟨hfb, hgb, hVb⟩ := hb
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have hθ0R : (0 : ℝ) ≤ θ := by exact_mod_cast hθ0
  have hθ1R : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
  have hw0 : (0 : ℝ) ≤ 1 - θ := by linarith
  have egate : (fun ω => (VRow.mix θ a b).gate (X1 ω) (X2 ω) (X3 ω))
      = fun ω => (1 - θ) * a.gate (X1 ω) (X2 ω) (X3 ω) + θ * b.gate (X1 ω) (X2 ω) (X3 ω) := by
    funext ω; exact VRow.gate_mix θ a b _ _ _
  refine ⟨(hfa.const_mul _).add (hfb.const_mul _), ?_, ?_⟩
  · rw [egate]; exact (hga.const_mul _).add (hgb.const_mul _)
  · have eI : ∫ ω, ((1 - (θ : ℝ)) * Φa (τ * √(U ω)) + θ * Φb (τ * √(U ω))) ∂μ
        = (1 - θ) * ∫ ω, Φa (τ * √(U ω)) ∂μ + θ * ∫ ω, Φb (τ * √(U ω)) ∂μ := by
      rw [integral_add (hfa.const_mul _) (hfb.const_mul _), integral_const_mul, integral_const_mul]
    have eG : ∫ ω, (VRow.mix θ a b).gate (X1 ω) (X2 ω) (X3 ω) ∂μ
        = (1 - θ) * ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
          + θ * ∫ ω, b.gate (X1 ω) (X2 ω) (X3 ω) ∂μ := by
      rw [egate, integral_add (hga.const_mul _) (hgb.const_mul _), integral_const_mul,
        integral_const_mul]
    have hsq := mix_norm_sq (θ : ℝ) hθ0R hθ1R (Qh + ((a.beta : ℝ) / ε) • v)
      (Qh + ((b.beta : ℝ) / ε) • v)
    have e1 : (1 - (θ : ℝ)) • (Qh + ((a.beta : ℝ) / ε) • v)
        + (θ : ℝ) • (Qh + ((b.beta : ℝ) / ε) • v)
        = Qh + (((VRow.mix θ a b).beta : ℝ) / ε) • v := by
      simp only [VRow.mix]
      push_cast
      module
    have e2 : ‖(Qh + ((a.beta : ℝ) / ε) • v) - (Qh + ((b.beta : ℝ) / ε) • v)‖ ^ 2
        = 2 * ((a.beta : ℝ) - b.beta) ^ 2 / ε ^ 2 := by
      have : (Qh + ((a.beta : ℝ) / ε) • v) - (Qh + ((b.beta : ℝ) / ε) • v)
          = (((a.beta : ℝ) - b.beta) / ε) • v := by
        rw [sub_div, sub_smul]; abel
      rw [this, norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, hv]
      field_simp
    rw [e1, e2] at hsq
    have hβ : (1 - (θ : ℝ)) * (2 * (a.beta : ℝ) ^ 2 / ε) + θ * (2 * (b.beta : ℝ) ^ 2 / ε)
        - ε * (θ * (1 - θ) * (2 * ((a.beta : ℝ) - b.beta) ^ 2 / ε ^ 2))
        = 2 * ((VRow.mix θ a b).beta : ℝ) ^ 2 / ε := by
      simp only [VRow.mix]; push_cast; field_simp; ring
    show V ≤ t ^ 2 - 2 * ((VRow.mix θ a b).ell : ℝ) * t + 2 * ((VRow.mix θ a b).beta : ℝ) ^ 2 / ε
      + ((∫ ω, ((1 - (θ : ℝ)) * Φa (τ * √(U ω)) + θ * Φb (τ * √(U ω))) ∂μ) + capPad)
      - ((VRow.mix θ a b).delta : ℝ) * τ ^ 2 - ∫ ω, (VRow.mix θ a b).gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + (((VRow.mix θ a b).beta : ℝ) / ε) • v‖ ^ 2
    rw [eI, eG]
    have hVa' := mul_le_mul_of_nonneg_left hVa hw0
    have hVb' := mul_le_mul_of_nonneg_left hVb hθ0R
    have eell : ((VRow.mix θ a b).ell : ℝ) = (1 - θ) * a.ell + θ * b.ell := by
      simp only [VRow.mix]; push_cast; ring
    have edel : ((VRow.mix θ a b).delta : ℝ) = (1 - θ) * a.delta + θ * b.delta := by
      simp only [VRow.mix]; push_cast; ring
    rw [eell, edel]
    nlinarith [hVa', hVb', hsq, hβ]

omit [IsProbabilityMeasure μ] in
set_option maxHeartbeats 800000 in
/-- **The box bound of a virtual row.**  From its inequality, the pinned gate price and certified
chord polynomials at `τ₋`, `τ₊`. -/
theorem vslab_bound (a : VRow) (hgate : gateOK a.N = true) {Φ : ℝ → ℝ}
    (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (V t : ℝ) (Qh v : E)
    (hV : VHolds a Φ μ U X1 X2 X3 τ V t Qh v) (Lm Lp : MPoly) (h6m : 0 ≤ Lm.a6)
    (h6p : 0 ≤ Lp.a6) (tl tu sl su xl xu : ℚ) (hTm : TB μ U Φ sl (Lm.J 0 1 x))
    (hTp : TB μ U Φ su (Lp.J 0 1 x)) (hsl : 0 ≤ sl) (hslsu : sl < su) (hτl : (sl : ℝ) ≤ τ)
    (hτu : τ ≤ su) (htl : (tl : ℝ) ≤ t) (htu : t ≤ tu) (hxl0 : 0 ≤ xl) (hxl : (xl : ℝ) ≤ x)
    (hxu : x ≤ xu) :
    V ≤ (boxVal a.ell a.beta a.price Lm Lp tl tu sl su xl xu : ℚ) := by
  obtain ⟨hf, hg, hV⟩ := hV
  have hG : (gatePrice a.N a.g1 a.g2 a.g3 : ℝ) * τ ^ 2 ≤ ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ :=
    gate_integral_ge a.N a.g1 a.g2 a.g3 hgate X1 X2 X3 τ hX hM hg
  have hsluR : (sl : ℝ) < su := by exact_mod_cast hslsu
  have hT := TB.chord hconv _ _ τ _ _ (by exact_mod_cast hsl) hsluR hτl hτu hTm hTp
  have hIle := hT.integral hf
  have hd : (0 : ℝ) < su - sl := by linarith
  have hw0' : (0 : ℝ) ≤ ((su : ℝ) - τ) / (su - sl) := div_nonneg (by linarith) hd.le
  have hw1' : (0 : ℝ) ≤ (τ - sl) / (su - sl) := div_nonneg (by linarith) hd.le
  have hxe := J_combo_endpoint Lm Lp _ _ hw0' hw1' h6m h6p x xl xu (by exact_mod_cast hxl0) hxl hxu
  have hq1 := chord_quad_le Lm Lp a.price sl su xl hslsu τ hτl hτu
  have hq2 := chord_quad_le Lm Lp a.price sl su xu hslsu τ hτl hτu
  have hxmax : ((su : ℝ) - τ) / (su - sl) * Lm.J 0 1 x + (τ - sl) / (su - sl) * Lp.J 0 1 x
      - (a.price : ℝ) * τ ^ 2
      ≤ max ((xPart Lm Lp a.price sl su xl : ℚ) : ℝ) ((xPart Lm Lp a.price sl su xu : ℚ) : ℝ) := by
    rcases le_max_iff.1 hxe with h | h
    · exact le_max_of_le_left (by linarith)
    · exact le_max_of_le_right (by linarith)
  have htq := quadVal_le_quadMax 0 (-2 * a.ell) 1 tl tu t htl htu
  have hprice : (a.price : ℝ) = a.delta + gatePrice a.N a.g1 a.g2 a.g3 := by
    simp only [VRow.price]; push_cast; ring
  simp only [boxVal, tPart]
  push_cast at htq ⊢
  rw [hprice] at hxmax
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have hn : 0 ≤ (ε : ℝ) * ‖Qh + ((a.beta : ℝ) / ε) • v‖ ^ 2 := mul_nonneg hε.le (sq_nonneg _)
  linarith only [hV, hG, htq, hIle, hxmax, hn]

end vrow

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

/-- **A batch on a box**: the virtual row of the batch satisfies its inequality with the mixed
potential, which is convex and has the certified chord polynomials. -/
lemma batch_sound_box (rows : List Row) (hrows : ∀ r ∈ rows, checkRow r = true) (bt : JBatch)
    (hbt : checkBatch rows bt = true) (ks : List ℕ) (sl su : ℚ) (a : VRow) (Lm Lp : MPoly)
    (hdata : batchData rows bt ks sl su = some (a, Lm, Lp)) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2)
    (hred : ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v) :
    ∃ Φ : ℝ → ℝ, ConvexOn ℝ (Set.Ici 0) Φ ∧ VHolds a Φ μ U X1 X2 X3 τ V t Qh v ∧
      TB μ U Φ sl (Lm.J 0 1 x) ∧ TB μ U Φ su (Lp.J 0 1 x) := by
  unfold batchData at hdata
  cases hRi : rows[bt.i]? with
  | none => simp [hRi] at hdata
  | some Ri =>
  cases hRj : rows[bt.j]? with
  | none => simp [hRi, hRj] at hdata
  | some Rj =>
  simp only [hRi, hRj] at hdata
  cases hns : resolve (fun k => bt.tnodes[k]?) ks with
  | none => simp [hns] at hdata
  | some ns =>
  simp only [hns] at hdata
  cases hch : chords4 ns sl su with
  | none => simp [hch] at hdata
  | some P =>
  obtain ⟨Lm', Lp'⟩ := P
  simp only [hch, Option.some.injEq, Prod.mk.injEq] at hdata
  obtain ⟨rfl, rfl, rfl⟩ := hdata
  have hRic := hrows Ri (List.mem_of_getElem? hRi)
  have hRjc := hrows Rj (List.mem_of_getElem? hRj)
  obtain ⟨Ψi, hΨi, hVi⟩ := vholds_of_row Ri (hred Ri (List.mem_of_getElem? hRi))
  obtain ⟨Ψj, hΨj, hVj⟩ := vholds_of_row Rj (hred Rj (List.mem_of_getElem? hRj))
  have hok := batch_sound rows bt hbt Ri Rj hRi hRj hΨi hΨj hM hS
  have hθ : 0 ≤ bt.θ ∧ bt.θ ≤ 1 := by
    simp only [checkBatch, hRi, hRj, checkMixTable, Bool.and_eq_true, decide_eq_true_eq] at hbt
    exact ⟨hbt.1.1.1.1.1.1.1.1.1.1.1, hbt.1.1.1.1.1.1.1.1.1.1.2⟩
  have hθ0R : (0 : ℝ) ≤ bt.θ := by exact_mod_cast hθ.1
  have hθ1R : (bt.θ : ℝ) ≤ 1 := by exact_mod_cast hθ.2
  have hw0 : (0 : ℝ) ≤ 1 - bt.θ := by linarith
  have hδi : (0 : ℝ) ≤ Ri.delta := by exact_mod_cast (rowBound_of_check Ri hRic).1.delta_pos.le
  have hδj : (0 : ℝ) ≤ Rj.delta := by exact_mod_cast (rowBound_of_check Rj hRjc).1.delta_pos.le
  have hconv : ConvexOn ℝ (Set.Ici 0) (mixPot Ri Rj bt.θ Ψi Ψj) :=
    convexOn_mix (convexOn_scale hΨi.convex _ hδi) (convexOn_scale hΨj.convex _ hδj) _ _ hw0 hθ0R
  obtain ⟨n0, n1, n2, n3, rfl, h01, h23, rfl, rfl⟩ := chords4_some ns sl su Lm' Lp' hch
  have hmem : ∀ n ∈ [n0, n1, n2, n3], TNodeOK μ U x (mixPot Ri Rj bt.θ Ψi Ψj) n := by
    intro n hn
    obtain ⟨k, _, hk⟩ := resolve_mem _ ks _ hns n hn
    exact hok n (List.mem_of_getElem? hk)
  refine ⟨mixPot Ri Rj bt.θ Ψi Ψj, hconv, VHolds.mix bt.θ hθ.1 hθ.2 hv hVi hVj,
    tchord_sound hconv n0 n1 sl h01 (hmem n0 (by simp)) (hmem n1 (by simp)),
    tchord_sound hconv n2 n3 su h23 (hmem n2 (by simp)) (hmem n3 (by simp))⟩

omit [IsProbabilityMeasure μ] in
lemma finish_sound (a : VRow) (Lm Lp : MPoly) (b : Box) (val : ℚ)
    (h : finish a Lm Lp b = some val) (hsl : 0 ≤ b.sl) (hslsu : b.sl < b.su) (hxl0 : 0 ≤ b.xl)
    {Φ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (V t : ℝ) (Qh v : E)
    (hV : VHolds a Φ μ U X1 X2 X3 τ V t Qh v) (hTm : TB μ U Φ b.sl (Lm.J 0 1 x))
    (hTp : TB μ U Φ b.su (Lp.J 0 1 x)) (ht : (b.tl : ℝ) ≤ t ∧ t ≤ b.tu)
    (hτ : (b.sl : ℝ) ≤ τ ∧ τ ≤ b.su) (hx : (b.xl : ℝ) ≤ x ∧ x ≤ b.xu) : V ≤ val := by
  unfold finish at h
  split_ifs at h with hcond
  simp only [Option.some.injEq] at h
  subst h
  obtain ⟨hgate, h6m, h6p⟩ := hcond
  exact vslab_bound a hgate hconv X1 X2 X3 τ hX hM V t Qh v hV Lm Lp h6m h6p _ _ _ _ _ _ hTm hTp
    hsl hslsu hτ.1 hτ.2 ht.1 ht.2 hxl0 hx.1 hx.2

/-- **Soundness of a box**: `V ≤ val` for every `(t, τ, x)` in the box. -/
theorem box_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (b : Box) (val : ℚ) (hb : boxBound rows batches b = some val) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ)
    (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hred : ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v)
    (ht : (b.tl : ℝ) ≤ t ∧ t ≤ b.tu) (hτ : (b.sl : ℝ) ≤ τ ∧ τ ≤ b.su)
    (hx : (b.xl : ℝ) ≤ x ∧ x ≤ b.xu) : V ≤ val := by
  unfold boxBound at hb
  split_ifs at hb with hvalid
  obtain ⟨hsl, hslsu, _, hxl0, _⟩ := hvalid
  cases hk : b.kind with
  | src i j θ ri rj =>
    simp only [hk] at hb
    cases hRi : rows[i]? with
    | none => simp [hRi] at hb
    | some Ri =>
    cases hRj : rows[j]? with
    | none => simp [hRi, hRj] at hb
    | some Rj =>
    simp only [hRi, hRj] at hb
    split_ifs at hb with hθ
    cases hni : resolve (rowTNode Ri) ri with
    | none => simp [hni] at hb
    | some ni =>
    cases hnj : resolve (rowTNode Rj) rj with
    | none => simp [hni, hnj] at hb
    | some nj =>
    simp only [hni, hnj] at hb
    cases hci : chords4 ni b.sl b.su with
    | none => simp [hci] at hb
    | some Pi =>
    cases hcj : chords4 nj b.sl b.su with
    | none => simp [hci, hcj] at hb
    | some Pj =>
    obtain ⟨Pim, Pip⟩ := Pi
    obtain ⟨Pjm, Pjp⟩ := Pj
    simp only [hci, hcj] at hb
    have hRic := hrows Ri (List.mem_of_getElem? hRi)
    have hRjc := hrows Rj (List.mem_of_getElem? hRj)
    obtain ⟨Ψi, hΨi, hVi⟩ := vholds_of_row Ri (hred Ri (List.mem_of_getElem? hRi))
    obtain ⟨Ψj, hΨj, hVj⟩ := vholds_of_row Rj (hred Rj (List.mem_of_getElem? hRj))
    have hchi := src_chords Ri hRic hΨi hM hS ri ni hni b.sl b.su Pim Pip hci
    have hchj := src_chords Rj hRjc hΨj hM hS rj nj hnj b.sl b.su Pjm Pjp hcj
    obtain ⟨hθ0, hθ1⟩ := hθ
    have hθ0R : (0 : ℝ) ≤ θ := by exact_mod_cast hθ0
    have hθ1R : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ1
    have hw0 : (0 : ℝ) ≤ 1 - θ := by linarith
    have hδi : (0 : ℝ) ≤ Ri.delta := by exact_mod_cast (rowBound_of_check Ri hRic).1.delta_pos.le
    have hδj : (0 : ℝ) ≤ Rj.delta := by exact_mod_cast (rowBound_of_check Rj hRjc).1.delta_pos.le
    have hconv : ConvexOn ℝ (Set.Ici 0) (mixPot Ri Rj θ Ψi Ψj) :=
      convexOn_mix (convexOn_scale hΨi.convex _ hδi) (convexOn_scale hΨj.convex _ hδj) _ _ hw0
        hθ0R
    have hTm : TB μ U (mixPot Ri Rj θ Ψi Ψj) b.sl ((MPoly.lin (1 - θ) θ Pim Pjm).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hchi.1 hchj.1
    have hTp : TB μ U (mixPot Ri Rj θ Ψi Ψj) b.su ((MPoly.lin (1 - θ) θ Pip Pjp).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hchi.2 hchj.2
    exact finish_sound _ _ _ b val hb hsl hslsu hxl0 hconv X1 X2 X3 τ hX hM V t Qh v
      (VHolds.mix θ hθ0 hθ1 hv hVi hVj) hTm hTp ht hτ hx
  | joint bi ks =>
    simp only [hk] at hb
    cases hbt : batches[bi]? with
    | none => simp [hbt] at hb
    | some bt =>
    simp only [hbt] at hb
    cases hdata : batchData rows bt ks b.sl b.su with
    | none => simp [hdata] at hb
    | some P =>
    obtain ⟨a, Lm, Lp⟩ := P
    simp only [hdata] at hb
    obtain ⟨Φ, hconv, hV, hTm, hTp⟩ := batch_sound_box rows hrows bt
      (hbatches bt (List.mem_of_getElem? hbt)) ks b.sl b.su a Lm Lp hdata X1 X2 X3 τ hM hS V t Qh v
      hv hred
    exact finish_sound a Lm Lp b val hb hsl hslsu hxl0 hconv X1 X2 X3 τ hX hM V t Qh v hV hTm hTp
      ht hτ hx
  | jmix b0 b1 lam k0 k1 =>
    simp only [hk] at hb
    split_ifs at hb with hlam
    cases hbt0 : batches[b0]? with
    | none => simp [hbt0] at hb
    | some bt0 =>
    cases hbt1 : batches[b1]? with
    | none => simp [hbt0, hbt1] at hb
    | some bt1 =>
    simp only [hbt0, hbt1] at hb
    cases hd0 : batchData rows bt0 k0 b.sl b.su with
    | none => simp [hd0] at hb
    | some P0 =>
    cases hd1 : batchData rows bt1 k1 b.sl b.su with
    | none => simp [hd0, hd1] at hb
    | some P1 =>
    obtain ⟨a0, Lm0, Lp0⟩ := P0
    obtain ⟨a1, Lm1, Lp1⟩ := P1
    simp only [hd0, hd1] at hb
    obtain ⟨Φ0, hc0, hV0, hTm0, hTp0⟩ := batch_sound_box rows hrows bt0
      (hbatches bt0 (List.mem_of_getElem? hbt0)) k0 b.sl b.su a0 Lm0 Lp0 hd0 X1 X2 X3 τ hM hS V t
      Qh v hv hred
    obtain ⟨Φ1, hc1, hV1, hTm1, hTp1⟩ := batch_sound_box rows hrows bt1
      (hbatches bt1 (List.mem_of_getElem? hbt1)) k1 b.sl b.su a1 Lm1 Lp1 hd1 X1 X2 X3 τ hM hS V t
      Qh v hv hred
    obtain ⟨hl0, hl1⟩ := hlam
    have hl0R : (0 : ℝ) ≤ lam := by exact_mod_cast hl0
    have hl1R : (lam : ℝ) ≤ 1 := by exact_mod_cast hl1
    have hw0 : (0 : ℝ) ≤ 1 - lam := by linarith
    have hconv : ConvexOn ℝ (Set.Ici 0) fun s => (1 - (lam : ℝ)) * Φ0 s + lam * Φ1 s :=
      convexOn_mix hc0 hc1 _ _ hw0 hl0R
    have hTm : TB μ U (fun s => (1 - (lam : ℝ)) * Φ0 s + lam * Φ1 s) b.sl
        ((MPoly.lin (1 - lam) lam Lm0 Lm1).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hl0R hTm0 hTm1
    have hTp : TB μ U (fun s => (1 - (lam : ℝ)) * Φ0 s + lam * Φ1 s) b.su
        ((MPoly.lin (1 - lam) lam Lp0 Lp1).J 0 1 x) := by
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hl0R hTp0 hTp1
    exact finish_sound _ _ _ b val hb hsl hslsu hxl0 hconv X1 X2 X3 τ hX hM V t Qh v
      (VHolds.mix lam hl0 hl1 hv hV0 hV1) hTm hTp ht hτ hx

end data

end Grothe.Lower
