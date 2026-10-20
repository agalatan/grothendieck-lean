import Grothe.Lower.Mixed
import Grothe.LowerAnalytic.Rows

/-!
# The boxes of the common-law certificate

The interval `[0, 9/10]` of `t` is covered by consecutive *regions*; each region `[t₋, t₊]` is
partitioned dyadically into *boxes* `[t₋,t₊] × [τ₋,τ₊] × [x₋,x₊]` of `(t, τ, x)`
(`coverOK`, `cover_sound`), and every box is bounded by `B`.  A box carries a fixed mixture
`(1−θ, θ)` of two rows `i, j` and is bounded in one of two ways.

* *Cap boxes* use only the certified caps of the rows (`RowBound`): each row, and the crude row
  `(0, 0, ερ²)`, gives the scalar inequality `V ≤ t² − 2ℓt + C − ε‖Qh + (β/ε)v‖²` (`RowOf`), and
  the mixture of two of them is a quadratic in `t` (`capVal`).
* The other boxes use four certified `τ`-nodes: two enclosing `τ₋` and two enclosing `τ₊`, either
  Stein nodes of the two source rows rescaled to `τ = σ/δ` (a *source box*) or new exact node
  certificates of the mixed table (a *joint box*, or a *joint-mixture box* mixing two batches).
  The chords at `τ₋`, `τ₊` give polynomials `L₋, L₊` in `x` with `E F_λ(τ±√U) − pad ≤ L±(x)`; by
  convexity in `τ` and the fixed first gate coordinate,

  `V ≤ max_t (t² − 2ℓ̄t) + 2β̄²/ε + max_{x̂} max_{τ∈[τ₋,τ₊]} [chord(L₋(x̂), L₊(x̂))(τ) − Dτ²] + pad`

  with `D = δ̄ + gatePrice(N̄, ḡ)` (`boxVal`, `vslab_bound`).

`boxBound` evaluates a box from the data and `box_sound` is its soundness.
-/

open MeasureTheory

namespace Grothe.Lower

open LowerAnalytic

/-! ### Virtual rows and scalar rows -/

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

/-- A scalar row `(ℓ, β, C)`. -/
structure EnvRow where
  ell : ℚ
  beta : ℚ
  C : ℚ

/-- The scalar row of a certified row: `C = 2β²/ε + cap + capPad`. -/
def Row.env (r : Row) : EnvRow := ⟨r.ell, r.beta, 2 * r.beta ^ 2 / ε + r.cap + capPad⟩

/-- The crude row `(0, 0, ερ²)`. -/
def crudeRow : EnvRow := ⟨0, 0, ε * ρ ^ 2⟩

/-- The scalar rows of a cap box: index `0` is the crude row, `k + 1` the row `k`. -/
def envRowAt (rows : List Row) : ℕ → Option EnvRow
  | 0 => some crudeRow
  | k + 1 => rows[k]?.map Row.env

/-! ### Box evaluation -/

/-- `max_{t∈[tl,tu]} (t² − 2ℓt)`. -/
def tPart (ell tl tu : ℚ) : ℚ := quadMax 0 (-2 * ell) 1 tl tu

/-- `max_{τ∈[sl,su]} [chord(L₋(x̂), L₊(x̂))(τ) − Dτ²]`. -/
def xPart (Lm Lp : MPoly) (D sl su xh : ℚ) : ℚ := chordMax (Lm.Jq 0 1 xh) (Lp.Jq 0 1 xh) D sl su

/-- The bound of a box. -/
def boxVal (ell beta D : ℚ) (Lm Lp : MPoly) (tl tu sl su xl xu : ℚ) : ℚ :=
  tPart ell tl tu + 2 * beta ^ 2 / ε + max (xPart Lm Lp D sl su xl) (xPart Lm Lp D sl su xu)
    + capPad

/-- The bound of a cap box: the maximum on `[tl, tu]` of the mixture
`(1−θ)Fₐ(t) + θF_b(t) − (2/ε)θ(1−θ)(βₐ − β_b)²` of `F(t) = t² − 2ℓt + C`. -/
def capVal (a b : EnvRow) (θ tl tu : ℚ) : ℚ :=
  quadMax ((1 - θ) * a.C + θ * b.C - 2 * (1 - θ) * θ * (a.beta - b.beta) ^ 2 / ε)
    (-2 * ((1 - θ) * a.ell + θ * b.ell)) 1 tl tu

/-- The kind of a box: a cap box `(i, j, θ)` (scalar rows, `0` the crude row), a source box
`(i, j, θ, refs of row i, refs of row j)`, a joint box `(batch, witness indices)`, or a
joint-mixture box `(batch₀, batch₁, λ, indices₀, indices₁)` mixing two batches before the gate
completion. -/
inductive BoxKind where
  | cap (i j : ℕ) (θ : ℚ)
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

/-- `c|tl,tu,sl,su,xl,xu|i,j,θ`, `s|tl,tu,sl,su,xl,xu|i,j,θ|refsᵢ|refsⱼ`,
`j|tl,tu,sl,su,xl,xu|batch|k₀,k₁,k₂,k₃` or
`m|tl,tu,sl,su,xl,xu|batch₀,batch₁,λ|k₀,k₁,k₂,k₃|k₀',k₁',k₂',k₃'`. -/
def parseBox (s : String) : Box :=
  match s.splitOn "|" with
  | ["c", bx, ij] =>
    match parseQs bx, ij.splitOn "," with
    | [tl, tu, sl, su, xl, xu], [i, j, θ] =>
      ⟨tl, tu, sl, su, xl, xu, .cap i.toNat! j.toNat! (parseQ θ)⟩
    | _, _ => dfltBox
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

/-- A *component* of a box: a virtual row with the chord polynomials at `sl` and `su` of four
resolved `τ`-nodes. -/
def compData {α : Type} (a : VRow) (f : α → Option TNode) (refs : List α) (sl su : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match resolve f refs with
  | some ns =>
    match chords4 ns sl su with
    | some (Lm, Lp) => some (a, Lm, Lp)
    | none => none
  | none => none

/-- The mixture `(1−θ, θ)` of two components. -/
def mixData (θ : ℚ) : Option (VRow × MPoly × MPoly) → Option (VRow × MPoly × MPoly) →
    Option (VRow × MPoly × MPoly)
  | some (a, Lm, Lp), some (b, Mm, Mp) =>
    if 0 ≤ θ ∧ θ ≤ 1 then
      some (VRow.mix θ a b, MPoly.lin (1 - θ) θ Lm Mm, MPoly.lin (1 - θ) θ Lp Mp)
    else none
  | _, _ => none

/-- The component of a batch: the mixed virtual row and the batch's `τ`-nodes. -/
def batchData (rows : List Row) (bt : JBatch) (ks : List ℕ) (sl su : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match rows[bt.i]?, rows[bt.j]? with
  | some Ri, some Rj =>
    compData (VRow.mix bt.θ Ri.vrow Rj.vrow) (fun k => bt.tnodes[k]?) ks sl su
  | _, _ => none

/-- The component of a box that is not a cap box. -/
def boxData (rows : List Row) (batches : List JBatch) (b : Box) : Option (VRow × MPoly × MPoly) :=
  match b.kind with
  | .cap _ _ _ => none
  | .src i j θ ri rj =>
    match rows[i]?, rows[j]? with
    | some Ri, some Rj =>
      mixData θ (compData Ri.vrow (rowTNode Ri) ri b.sl b.su)
        (compData Rj.vrow (rowTNode Rj) rj b.sl b.su)
    | _, _ => none
  | .joint bi ks =>
    match batches[bi]? with
    | some bt => batchData rows bt ks b.sl b.su
    | none => none
  | .jmix b0 b1 lam k0 k1 =>
    match batches[b0]?, batches[b1]? with
    | some bt0, some bt1 =>
      mixData lam (batchData rows bt0 k0 b.sl b.su) (batchData rows bt1 k1 b.sl b.su)
    | _, _ => none

/-- The bound of a box from the rows and the batches (`none` if the data are inconsistent). -/
def boxBound (rows : List Row) (batches : List JBatch) (b : Box) : Option ℚ :=
  if ¬ (0 ≤ b.sl ∧ b.sl < b.su ∧ 0 ≤ b.xl) then none else
  match b.kind with
  | .cap i j θ =>
    match envRowAt rows i, envRowAt rows j with
    | some a, some c => if 0 ≤ θ ∧ θ ≤ 1 then some (capVal a c θ b.tl b.tu) else none
    | _, _ => none
  | _ =>
    match boxData rows batches b with
    | some (a, Lm, Lp) =>
      if gateOK a.N = true ∧ 0 ≤ Lm.a6 ∧ 0 ≤ Lp.a6 then
        some (boxVal a.ell a.beta a.price Lm Lp b.tl b.tu b.sl b.su b.xl b.xu)
      else none
    | none => none

/-- The box is consistent and bounded by `bound`. -/
def boxOK (rows : List Row) (batches : List JBatch) (bound : ℚ) (b : Box) : Bool :=
  match boxBound rows batches b with
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


/-! ### Regions -/

/-- A region `[lo, hi]` of `t` with its boxes. -/
structure Region where
  lo : ℚ
  hi : ℚ
  boxes : List String

/-- The boxes of a region are bounded by `bound` (in parallel) and form a dyadic partition of
`[lo, hi] × [0, ρ] × [0, 31/4]`. -/
def checkRegion (rows : List Row) (batches : List JBatch) (bound : ℚ) (r : Region) : Bool :=
  let bs := r.boxes.map parseBox
  allPar (boxOK rows batches bound) bs &&
    coverOK (bs.length + 1) (r.lo, r.hi, 0, ρ, 0, xMax) (bs.map Box.dom)

/-- The regions are consecutive, cover `[0, 9/10]`, and are checked. -/
def checkCover (rows : List Row) (batches : List JBatch) (bound : ℚ) (regs : List Region) :
    Bool :=
  chainTo Region.lo Region.hi 0 (9 / 10) regs && regs.all (checkRegion rows batches bound)

/-- **Soundness of the cover**: every admissible `(t, τ, x)` lies in a checked box. -/
theorem cover_sound (rows : List Row) (batches : List JBatch) (bound : ℚ) (regs : List Region)
    (h : checkCover rows batches bound regs = true) (t τ x : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10)
    (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ) (hx0 : 0 ≤ x) (hx1 : x ≤ xMax) :
    ∃ b : Box, boxOK rows batches bound b = true ∧ (b.tl : ℝ) ≤ t ∧ t ≤ b.tu ∧ (b.sl : ℝ) ≤ τ ∧
      τ ≤ b.su ∧ (b.xl : ℝ) ≤ x ∧ x ≤ b.xu := by
  simp only [checkCover, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨r, hr, hlo, hhi⟩ :=
    chainTo_sound Region.lo Region.hi regs 0 (9 / 10) h.1 t (by simpa using ht0)
      (by norm_num at ht1 ⊢; exact ht1)
  have hreg := h.2 r hr
  simp only [checkRegion, allPar_eq, Bool.and_eq_true, List.all_eq_true] at hreg
  obtain ⟨d, hd, hdm⟩ := coverOK_sound _ _ _ hreg.2 t τ x
    ⟨hlo, hhi, by simpa using hτ0, hτ1, by simpa using hx0, hx1⟩
  obtain ⟨b, hb, rfl⟩ := List.mem_map.1 hd
  exact ⟨b, hreg.1 b hb, hdm⟩

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
lemma chord_le_xPart (Lm Lp : MPoly) (D sl su xh : ℚ) (hslsu : sl < su) (τ : ℝ)
    (hτl : (sl : ℝ) ≤ τ) (hτu : τ ≤ su) :
    ((su : ℝ) - τ) / (su - sl) * Lm.J 0 1 xh + (τ - sl) / (su - sl) * Lp.J 0 1 xh
      - D * τ ^ 2 ≤ (xPart Lm Lp D sl su xh : ℚ) := by
  have e : ∀ P : MPoly, ((P.Jq 0 1 xh : ℚ) : ℝ) = P.J 0 1 xh := fun P => by
    have := MPoly.Jq_cast P 0 1 xh; push_cast at this; exact this
  have h := chord_le_chordMax (Lm.Jq 0 1 xh) (Lp.Jq 0 1 xh) D sl su hslsu τ hτl hτu
  rwa [e, e] at h

section vrow

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

/-- The retained-square inequality of a scalar row at `ε`. -/
def RowOf (row : EnvRow) (V t : ℝ) (Qh v : E) : Prop :=
  RowHolds (ε : ℝ) row.ell row.beta row.C V t Qh v

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
  RowHolds (ε : ℝ) a.ell a.beta (2 * (a.beta : ℝ) ^ 2 / ε + (∫ ω, Φ (τ * √(U ω)) ∂μ + capPad)
    - a.delta * τ ^ 2 - ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ) V t Qh v

/-- A row of the shared reduction is a virtual row with potential `s ↦ Ψ(δs) − capPad`. -/
lemma vholds_of_row (r : Row) {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E}
    (h : RowShared r μ U X1 X2 X3 τ V t Qh v) :
    ∃ Ψ : ℝ → ℝ, CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
      VHolds r.vrow (fun s => Ψ (r.delta * s) - capPad) μ U X1 X2 X3 τ V t Qh v := by
  obtain ⟨Ψ, hΨ, hf, hg, hV⟩ := h
  refine ⟨Ψ, hΨ, ?_, hg, ?_⟩
  · simp only [← mul_assoc]
    exact hf.sub (integrable_const _)
  simp only [RowHolds, ← mul_assoc]
  rw [integral_sub hf (integrable_const _), integral_const, probReal_univ, one_smul]
  exact hV.trans_eq (by simp only [Row.vrow, VRow.gate, Row.gate]; ring)

omit [IsProbabilityMeasure μ] in
/-- **Mixing two virtual rows**, retaining the common square. -/
theorem VHolds.mix (θ : ℚ) (hθ0 : 0 ≤ θ) (hθ1 : θ ≤ 1) {a b : VRow} {Φa Φb : ℝ → ℝ}
    {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E} (hv : ‖v‖ ^ 2 = 2)
    (ha : VHolds a Φa μ U X1 X2 X3 τ V t Qh v) (hb : VHolds b Φb μ U X1 X2 X3 τ V t Qh v) :
    VHolds (VRow.mix θ a b) (fun s => (1 - θ) * Φa s + θ * Φb s) μ U X1 X2 X3 τ V t Qh v := by
  obtain ⟨hfa, hga, hVa⟩ := ha
  obtain ⟨hfb, hgb, hVb⟩ := hb
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  have egate : (fun ω => (VRow.mix θ a b).gate (X1 ω) (X2 ω) (X3 ω))
      = fun ω => (1 - θ) * a.gate (X1 ω) (X2 ω) (X3 ω) + θ * b.gate (X1 ω) (X2 ω) (X3 ω) := by
    funext ω; exact VRow.gate_mix θ a b _ _ _
  refine ⟨(hfa.const_mul _).add (hfb.const_mul _), ?_, ?_⟩
  · rw [egate]; exact (hga.const_mul _).add (hgb.const_mul _)
  have h := RowHolds.mix hε hv hVa hVb θ (by exact_mod_cast hθ0) (by exact_mod_cast hθ1)
  rw [egate, integral_add (hfa.const_mul _) (hfb.const_mul _),
    integral_add (hga.const_mul _) (hgb.const_mul _), integral_const_mul, integral_const_mul,
    integral_const_mul, integral_const_mul]
  have eβ : (((VRow.mix θ a b).beta : ℚ) : ℝ) = (1 - θ) * a.beta + θ * b.beta := by
    simp only [VRow.mix]; push_cast; ring
  have eℓ : (((VRow.mix θ a b).ell : ℚ) : ℝ) = (1 - θ) * a.ell + θ * b.ell := by
    simp only [VRow.mix]; push_cast; ring
  have eδ : (((VRow.mix θ a b).delta : ℚ) : ℝ) = (1 - θ) * a.delta + θ * b.delta := by
    simp only [VRow.mix]; push_cast; ring
  rw [eβ, eℓ, eδ]
  convert h using 1
  field_simp
  ring

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
  have hV := RowHolds.le (by norm_num [ε]) hV
  have hG : (gatePrice a.N a.g1 a.g2 a.g3 : ℝ) * τ ^ 2 ≤ ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ :=
    gate_integral_ge a.N a.g1 a.g2 a.g3 hgate X1 X2 X3 τ hX hM hg
  have hsluR : (sl : ℝ) < su := by exact_mod_cast hslsu
  have hIle := (TB.chord hconv _ _ τ _ _ (by exact_mod_cast hsl) hsluR hτl hτu hTm hTp).integral hf
  have hd : (0 : ℝ) < su - sl := by linarith
  have hw0' : (0 : ℝ) ≤ ((su : ℝ) - τ) / (su - sl) := div_nonneg (by linarith) hd.le
  have hw1' : (0 : ℝ) ≤ (τ - sl) / (su - sl) := div_nonneg (by linarith) hd.le
  have hxe := J_combo_endpoint Lm Lp _ _ hw0' hw1' h6m h6p x xl xu (by exact_mod_cast hxl0) hxl hxu
  have hq1 := chord_le_xPart Lm Lp a.price sl su xl hslsu τ hτl hτu
  have hq2 := chord_le_xPart Lm Lp a.price sl su xu hslsu τ hτl hτu
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
  linarith only [hV, hG, htq, hIle, hxmax]

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

/-- A certified component: a convex potential `Φ` for which the virtual row `a` holds and
`L₋`, `L₊` bound `E Φ(τ√U)` at `sl` and `su`. -/
def Comp (μ : Measure Ω) (U : Ω → ℝ) (x : ℝ) (X1 X2 X3 : Ω → ℂ) (τ V t : ℝ) (Qh v : E) (sl su : ℚ)
    (d : VRow × MPoly × MPoly) : Prop :=
  ∃ Φ : ℝ → ℝ, ConvexOn ℝ (Set.Ici 0) Φ ∧ VHolds d.1 Φ μ U X1 X2 X3 τ V t Qh v ∧
    TB μ U Φ sl (d.2.1.J 0 1 x) ∧ TB μ U Φ su (d.2.2.J 0 1 x)

variable {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E} {sl su : ℚ}

omit [IsProbabilityMeasure μ] in
/-- A component from certified `τ`-nodes of a convex potential of the virtual row. -/
lemma compData_sound {α : Type} (a : VRow) (f : α → Option TNode) (refs : List α) {Φ : ℝ → ℝ}
    (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (hV : VHolds a Φ μ U X1 X2 X3 τ V t Qh v)
    (hf : ∀ r n, f r = some n → TNodeOK μ U x Φ n) (d : VRow × MPoly × MPoly)
    (h : compData a f refs sl su = some d) : Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  unfold compData at h
  cases hns : resolve f refs with
  | none => simp [hns] at h
  | some ns =>
  cases hch : chords4 ns sl su with
  | none => simp [hns, hch] at h
  | some P =>
  obtain ⟨Lm, Lp⟩ := P
  simp only [hns, hch, Option.some.injEq] at h
  subst h
  have hok : ∀ n ∈ ns, TNodeOK μ U x Φ n := fun n hn => by
    obtain ⟨r, _, hr⟩ := resolve_mem f refs ns hns n hn
    exact hf r n hr
  obtain ⟨n0, n1, n2, n3, rfl, h01, h23, rfl, rfl⟩ := chords4_some _ sl su Lm Lp hch
  exact ⟨Φ, hconv, hV, tchord_sound hconv n0 n1 sl h01 (hok n0 (by simp)) (hok n1 (by simp)),
    tchord_sound hconv n2 n3 su h23 (hok n2 (by simp)) (hok n3 (by simp))⟩

omit [IsProbabilityMeasure μ] in
/-- The mixture of two certified components is certified. -/
lemma mixData_sound (θ : ℚ) (hv : ‖v‖ ^ 2 = 2) (d0 d1 : Option (VRow × MPoly × MPoly))
    (h0 : ∀ d, d0 = some d → Comp μ U x X1 X2 X3 τ V t Qh v sl su d)
    (h1 : ∀ d, d1 = some d → Comp μ U x X1 X2 X3 τ V t Qh v sl su d) (d : VRow × MPoly × MPoly)
    (h : mixData θ d0 d1 = some d) : Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  match d0, d1, h with
  | some (a, Lm, Lp), some (b, Mm, Mp), h =>
    simp only [mixData] at h
    split_ifs at h with hθ
    simp only [Option.some.injEq] at h
    subst h
    obtain ⟨Φa, hca, hVa, hTma, hTpa⟩ := h0 _ rfl
    obtain ⟨Φb, hcb, hVb, hTmb, hTpb⟩ := h1 _ rfl
    have hθ0R : (0 : ℝ) ≤ θ := by exact_mod_cast hθ.1
    have hw0 : (0 : ℝ) ≤ 1 - θ := by
      have : (θ : ℝ) ≤ 1 := by exact_mod_cast hθ.2
      linarith
    refine ⟨fun s => (1 - θ) * Φa s + θ * Φb s, convexOn_mix hca hcb _ _ hw0 hθ0R,
      VHolds.mix θ hθ.1 hθ.2 hv hVa hVb, ?_, ?_⟩
    · show TB μ U _ sl ((MPoly.lin (1 - θ) θ Lm Mm).J 0 1 x)
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hTma hTmb
    · show TB μ U _ su ((MPoly.lin (1 - θ) θ Lp Mp).J 0 1 x)
      rw [MPoly.J_lin]; push_cast
      exact TB.mix _ _ hw0 hθ0R hTpa hTpb
  | none, _, h => simp [mixData] at h
  | some _, none, h => simp [mixData] at h

/-- The component of a source row. -/
lemma src_sound (R : Row) (hR : checkRow R = true) (hM : Moments μ U x) (hS : SteinCut μ U)
    (hred : RowShared R μ U X1 X2 X3 τ V t Qh v) (refs : List (Option (ℕ × ℕ)))
    (d : VRow × MPoly × MPoly) (h : compData R.vrow (rowTNode R) refs sl su = some d) :
    Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  obtain ⟨Ψ, hΨ, hV⟩ := vholds_of_row R hred
  have hδ : (0 : ℝ) ≤ R.delta := by exact_mod_cast (checkRow_node R hR).1.le
  exact compData_sound _ _ refs (convexOn_scale hΨ.convex _ hδ) hV
    (fun ref n hn => rowTNode_sound R hR hΨ hM hS ref n hn) d h

/-- **The component of a batch**: the virtual row of the batch holds with the mixed potential,
whose `τ`-nodes are the batch's certified nodes. -/
lemma batchData_sound (rows : List Row) (hrows : ∀ r ∈ rows, checkRow r = true) (bt : JBatch)
    (hbt : checkBatch rows bt = true) (ks : List ℕ) (hM : Moments μ U x) (hS : SteinCut μ U)
    (hv : ‖v‖ ^ 2 = 2) (hred : ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v)
    (d : VRow × MPoly × MPoly) (h : batchData rows bt ks sl su = some d) :
    Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  unfold batchData at h
  cases hRi : rows[bt.i]? with
  | none => simp [hRi] at h
  | some Ri =>
  cases hRj : rows[bt.j]? with
  | none => simp [hRi, hRj] at h
  | some Rj =>
  simp only [hRi, hRj] at h
  obtain ⟨Ψi, hΨi, hVi⟩ := vholds_of_row Ri (hred Ri (List.mem_of_getElem? hRi))
  obtain ⟨Ψj, hΨj, hVj⟩ := vholds_of_row Rj (hred Rj (List.mem_of_getElem? hRj))
  have hθ : 0 ≤ bt.θ ∧ bt.θ ≤ 1 := by
    simp only [checkBatch, hRi, hRj, checkMixTable, Bool.and_eq_true, decide_eq_true_eq] at hbt
    exact ⟨hbt.1.1.1.1.1.1.1.1.1.1.1, hbt.1.1.1.1.1.1.1.1.1.1.2⟩
  have hθ0R : (0 : ℝ) ≤ bt.θ := by exact_mod_cast hθ.1
  have hw0 : (0 : ℝ) ≤ 1 - bt.θ := by
    have : (bt.θ : ℝ) ≤ 1 := by exact_mod_cast hθ.2
    linarith
  have hδi : (0 : ℝ) ≤ Ri.delta :=
    by exact_mod_cast (checkRow_node Ri (hrows Ri (List.mem_of_getElem? hRi))).1.le
  have hδj : (0 : ℝ) ≤ Rj.delta :=
    by exact_mod_cast (checkRow_node Rj (hrows Rj (List.mem_of_getElem? hRj))).1.le
  have hok := batch_sound rows bt hbt Ri Rj hRi hRj hΨi hΨj hM hS
  exact compData_sound _ _ ks
    (convexOn_mix (convexOn_scale hΨi.convex _ hδi) (convexOn_scale hΨj.convex _ hδj) _ _ hw0
      hθ0R) (VHolds.mix bt.θ hθ.1 hθ.2 hv hVi hVj)
    (fun k n hk => hok n (List.mem_of_getElem? hk)) d h

/-- **Soundness of a box**: `V ≤ val` for every `(t, τ, x)` in the box. -/
theorem box_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (b : Box) (val : ℚ) (hb : boxBound rows batches b = some val) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ)
    (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (hred : ∀ r ∈ rows, RowShared r μ U X1 X2 X3 τ V t Qh v)
    (hscal : ∀ k a, envRowAt rows k = some a → RowOf a V t Qh v)
    (ht : (b.tl : ℝ) ≤ t ∧ t ≤ b.tu) (hτ : (b.sl : ℝ) ≤ τ ∧ τ ≤ b.su)
    (hx : (b.xl : ℝ) ≤ x ∧ x ≤ b.xu) : V ≤ val := by
  have hε : (0 : ℝ) < ε := by norm_num [ε]
  unfold boxBound at hb
  split_ifs at hb with hvalid
  obtain ⟨hsl, hslsu, hxl0⟩ := hvalid
  -- the boxes with a component
  have hcomp : ∀ d, boxData rows batches b = some d →
      Comp μ U x X1 X2 X3 τ V t Qh v b.sl b.su d := by
    intro d hd
    unfold boxData at hd
    cases hk : b.kind with
    | cap i j θ => simp [hk] at hd
    | src i j θ ri rj =>
      simp only [hk] at hd
      cases hRi : rows[i]? with
      | none => simp [hRi] at hd
      | some Ri =>
      cases hRj : rows[j]? with
      | none => simp [hRi, hRj] at hd
      | some Rj =>
      simp only [hRi, hRj] at hd
      have mi := List.mem_of_getElem? hRi
      have mj := List.mem_of_getElem? hRj
      exact mixData_sound θ hv _ _
        (src_sound Ri (hrows Ri mi) hM hS (hred Ri mi) ri) (src_sound Rj (hrows Rj mj) hM hS
          (hred Rj mj) rj) d hd
    | joint bi ks =>
      simp only [hk] at hd
      cases hbt : batches[bi]? with
      | none => simp [hbt] at hd
      | some bt =>
      simp only [hbt] at hd
      exact batchData_sound rows hrows bt (hbatches bt (List.mem_of_getElem? hbt)) ks hM hS hv
        hred d hd
    | jmix b0 b1 lam k0 k1 =>
      simp only [hk] at hd
      cases hbt0 : batches[b0]? with
      | none => simp [hbt0] at hd
      | some bt0 =>
      cases hbt1 : batches[b1]? with
      | none => simp [hbt0, hbt1] at hd
      | some bt1 =>
      simp only [hbt0, hbt1] at hd
      exact mixData_sound lam hv _ _
        (batchData_sound rows hrows bt0 (hbatches bt0 (List.mem_of_getElem? hbt0)) k0 hM hS hv
          hred)
        (batchData_sound rows hrows bt1 (hbatches bt1 (List.mem_of_getElem? hbt1)) k1 hM hS hv
          hred) d hd
  cases hk : b.kind
  case cap i j θ =>
    simp only [hk] at hb
    cases ha : envRowAt rows i with
    | none => simp [ha] at hb
    | some A =>
    cases hc : envRowAt rows j with
    | none => simp [ha, hc] at hb
    | some C =>
    simp only [ha, hc] at hb
    split_ifs at hb with hθ
    simp only [Option.some.injEq] at hb
    subst hb
    have h := (RowHolds.mix hε hv (hscal i A ha) (hscal j C hc) θ (by exact_mod_cast hθ.1)
      (by exact_mod_cast hθ.2)).le hε.le
    have hq := quadVal_le_quadMax
      ((1 - θ) * A.C + θ * C.C - 2 * (1 - θ) * θ * (A.beta - C.beta) ^ 2 / ε)
      (-2 * ((1 - θ) * A.ell + θ * C.ell)) 1 b.tl b.tu t ht.1 ht.2
    unfold capVal
    refine le_trans (le_of_le_of_eq h ?_) hq
    push_cast
    ring
  all_goals
    simp only [hk] at hb
    cases hd : boxData rows batches b with
    | none => simp [hd] at hb
    | some d =>
    obtain ⟨a, Lm, Lp⟩ := d
    simp only [hd] at hb
    split_ifs at hb with hcond
    simp only [Option.some.injEq] at hb
    subst hb
    obtain ⟨Φ, hconv, hV, hTm, hTp⟩ := hcomp _ hd
    exact vslab_bound a hcond.1 hconv X1 X2 X3 τ hX hM V t Qh v hV Lm Lp hcond.2.1 hcond.2.2
      _ _ _ _ _ _ hTm hTp hsl hslsu hτ.1 hτ.2 ht.1 ht.2 hxl0 hx.1 hx.2

end data

end Grothe.Lower
