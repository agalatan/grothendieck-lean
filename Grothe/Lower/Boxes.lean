import Grothe.Lower.Mixed
import Grothe.LowerAnalytic.Rows

/-!
# The boxes of the common-law certificate

The domain `[0, 9/10] × [0, ρ] × [0, 31/4]` of `(t, τ, x)` is partitioned into closed *boxes*
`[t₋,t₊] × [τ₋,τ₊] × [x₋,x₊]`, certified by a coverage tree of axis cuts (`treeCoverOK`, `treeCoverOK_sound`), and
every box is bounded by `B`.  A box is bounded in one of two ways.

* *Cap boxes* use only the certified caps of two rows (`RowBound`): each row, and the crude row
  `(0, 0, ερ²)`, gives the scalar inequality `V ≤ t² − 2ℓt + C − ε‖Qh + (β/ε)v‖²` (`RowOf`), and
  the mixture of two of them is a quadratic in `t` (`capVal`).
* The other boxes carry one *component*, or two components mixed with a weight before the gate
  completion.  A component (`CompRef`) is a mixture `(1−θ, θ)` of two rows `i, j` (a single row is
  `(i, i, 0)`) together with four certified `τ`-nodes of its potential (`NRef`, `nodeOf`): two
  enclosing a scale `s₀` and two enclosing `s₁`, each a Stein node of a source row rescaled to
  `τ = σ/δ`, the zero node of a row, or an exact node certificate of a batch for the same potential
  (`samePot`) whose range `x ≤ x_*` contains the box (`x₊ ≤ x_*`, checked for every reference, so
  for both scales of the chords and both components of a mixture).  The chords at `s₀`, `s₁` are chorded again at `τ₋`, `τ₊` (`rechord`, convexity in
  `τ` twice), which gives polynomials `L₋, L₊` in `x` with `E F(τ±√U) − pad ≤ L±(x)`; with the
  fixed first gate coordinate,

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

/-- A reference to a certified `τ`-node: the zero node of row `i`, the Stein node `(cell, node)`
of row `i` (rescaled to `τ = σ/δ`), or the witness `k` of batch `b`. -/
inductive NRef where
  | zero (i : ℕ)
  | src (i ci ni : ℕ)
  | bat (b k : ℕ)

/-- A component: the mixture `(i, j, θ)` of two rows (a single row `i` is `(i, i, 0)`), the chord
scales `s₀ ≤ s₁`, and four node references `[n₀, n₁, n₂, n₃]` with `τ(n₀) ≤ s₀ ≤ τ(n₁)` and
`τ(n₂) ≤ s₁ ≤ τ(n₃)`. -/
structure CompRef where
  i : ℕ
  j : ℕ
  θ : ℚ
  s0 : ℚ
  s1 : ℚ
  refs : List NRef

/-- The kind of a box: a cap box `(i, j, θ)` (scalar rows, `0` the crude row), one component, or
two components mixed with weight `θ` before the gate completion. -/
inductive BoxKind where
  | cap (i j : ℕ) (θ : ℚ)
  | one (c : CompRef)
  | two (θ : ℚ) (c0 c1 : CompRef)

structure Box where
  tl : ℚ
  tu : ℚ
  sl : ℚ
  su : ℚ
  xl : ℚ
  xu : ℚ
  kind : BoxKind

/-- `z,i`, `s,i,cell,node` or `b,batch,k`. -/
def parseNRef (s : String) : NRef :=
  match s.splitOn "," with
  | ["z", i] => .zero i.toNat!
  | ["s", i, c, n] => .src i.toNat! c.toNat! n.toNat!
  | ["b", b, k] => .bat b.toNat! k.toNat!
  | _ => .zero 0

/-- `i,j,θ,s₀,s₁;ref;ref;ref;ref`. -/
def parseComp (s : String) : CompRef :=
  match splitL s ";" with
  | g :: refs =>
    match g.splitOn "," with
    | [i, j, θ, s0, s1] => ⟨i.toNat!, j.toNat!, parseQ θ, parseQ s0, parseQ s1, refs.map parseNRef⟩
    | _ => ⟨0, 0, 0, 0, 0, []⟩
  | [] => ⟨0, 0, 0, 0, 0, []⟩

def dfltBox : Box := ⟨0, 0, 0, 0, 0, 0, .one ⟨0, 0, 0, 0, 0, []⟩⟩

/-- `c|tl,tu,sl,su,xl,xu|i,j,θ`, `b|tl,tu,sl,su,xl,xu|comp` or
`m|tl,tu,sl,su,xl,xu|θ|comp₀|comp₁`. -/
def parseBox (s : String) : Box :=
  match s.splitOn "|" with
  | ["c", bx, ij] =>
    match parseQs bx, ij.splitOn "," with
    | [tl, tu, sl, su, xl, xu], [i, j, θ] =>
      ⟨tl, tu, sl, su, xl, xu, .cap i.toNat! j.toNat! (parseQ θ)⟩
    | _, _ => dfltBox
  | ["b", bx, c] =>
    match parseQs bx with
    | [tl, tu, sl, su, xl, xu] => ⟨tl, tu, sl, su, xl, xu, .one (parseComp c)⟩
    | _ => dfltBox
  | ["m", bx, θ, c0, c1] =>
    match parseQs bx with
    | [tl, tu, sl, su, xl, xu] =>
      ⟨tl, tu, sl, su, xl, xu, .two (parseQ θ) (parseComp c0) (parseComp c1)⟩
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

/-- The chords at `s₀` and `s₁` of four `τ`-nodes `[n₀, n₁, n₂, n₃]`, as `τ`-nodes (each twice,
for `chords4`). -/
def rechord (tns : List TNode) (s0 s1 : ℚ) : Option (List TNode) :=
  match tns with
  | [n0, n1, n2, n3] =>
    if tchordOK n0 n1 s0 && tchordOK n2 n3 s1 then
      some [⟨s0, tchordP n0 n1 s0⟩, ⟨s1, tchordP n2 n3 s1⟩, ⟨s0, tchordP n0 n1 s0⟩,
        ⟨s1, tchordP n2 n3 s1⟩]
    else none
  | _ => none

/-- The potentials `(a, b, α)` and `(c, d, γ)` coincide: the same mixture, or both the single row
`a = c` (`α = γ = 0`), or both the single row `b = d` (`α = γ = 1`). -/
def samePot (a b : ℕ) (α : ℚ) (c d : ℕ) (γ : ℚ) : Bool :=
  (a == c && b == d && α == γ) || (α == 0 && γ == 0 && a == c) || (α == 1 && γ == 1 && b == d)

/-- The `τ`-node of a reference, provided its potential is that of the mixture `(i, j, θ)` and
its range contains `x ≤ xu`. -/
def nodeOf (rows : List Row) (batches : List JBatch) (i j : ℕ) (θ xu : ℚ) : NRef → Option TNode
  | .zero r =>
    if samePot r r 0 i j θ then
      match rows[r]? with
      | some R => rowTNode R none
      | none => none
    else none
  | .src r ci ni =>
    if samePot r r 0 i j θ then
      match rows[r]? with
      | some R => rowTNode R (some (ci, ni))
      | none => none
    else none
  | .bat b k =>
    match batches[b]? with
    | some bt =>
      if samePot bt.i bt.j bt.θ i j θ then
        match bt.tnodeX[k]? with
        | some p => if xu ≤ p.2 then some p.1 else none
        | none => none
      else none
    | none => none

/-- A *component* of a box: a virtual row with the chord polynomials at `sl` and `su`, from four
resolved `τ`-nodes chorded at `s₀`, `s₁` and chorded again at `sl`, `su`. -/
def compData {α : Type} (a : VRow) (f : α → Option TNode) (refs : List α) (s0 s1 sl su : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match resolve f refs with
  | some ns =>
    match rechord ns s0 s1 with
    | some ms =>
      match chords4 ms sl su with
      | some (Lm, Lp) => some (a, Lm, Lp)
      | none => none
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

/-- The component of a `CompRef`: the mixed virtual row of its rows and its nodes, valid up to
`x ≤ xu`. -/
def compRefData (rows : List Row) (batches : List JBatch) (c : CompRef) (sl su xu : ℚ) :
    Option (VRow × MPoly × MPoly) :=
  match rows[c.i]?, rows[c.j]? with
  | some Ri, some Rj =>
    if 0 ≤ c.θ ∧ c.θ ≤ 1 then
      compData (VRow.mix c.θ Ri.vrow Rj.vrow) (nodeOf rows batches c.i c.j c.θ xu) c.refs c.s0
        c.s1 sl su
    else none
  | _, _ => none

/-- The component of a box that is not a cap box. -/
def boxData (rows : List Row) (batches : List JBatch) (b : Box) : Option (VRow × MPoly × MPoly) :=
  match b.kind with
  | .cap _ _ _ => none
  | .one c => compRefData rows batches c b.sl b.su b.xu
  | .two θ c0 c1 =>
    mixData θ (compRefData rows batches c0 b.sl b.su b.xu)
      (compRefData rows batches c1 b.sl b.su b.xu)

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

/-- A partition certificate: a leaf (one box, the domain itself), or a cut of axis `k` at `mid`
with the certificates of the two halves. -/
inductive PTree where
  | leaf
  | cut (k : ℕ) (mid : ℚ) (L R : PTree)

/-- The coverage check: a leaf equals the domain, and the retained boxes recursively cover
both halves of every cut. Coverage does not require a separate scan of unused straddling boxes. -/
def treeCoverOK : PTree → Dom → List Dom → Bool
  | .leaf, d, bs =>
    match bs with
    | [b] => b == d
    | _ => false
  | .cut k mid L R, d, bs =>
    treeCoverOK L (d.left k mid) (bs.filter fun b => decide (b.hi k ≤ mid)) &&
    treeCoverOK R (d.right k mid) (bs.filter fun b => decide (mid ≤ b.lo k))

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

/-- **Soundness of the coverage check**: every point of the domain lies in a retained box. -/
theorem treeCoverOK_sound : ∀ (T : PTree) (d : Dom) (bs : List Dom), treeCoverOK T d bs = true →
    ∀ t τ x : ℝ, d.mem t τ x → ∃ b ∈ bs, b.mem t τ x
  | .leaf, d, bs, h => by
    intro t τ x hm
    match bs, h with
    | [b], h =>
      simp only [treeCoverOK, beq_iff_eq] at h
      exact ⟨b, List.mem_singleton_self b, h ▸ hm⟩
    | [], h => simp [treeCoverOK] at h
    | _ :: _ :: _, h => simp [treeCoverOK] at h
  | .cut k mid L R, d, bs, h => by
    intro t τ x hm
    simp only [treeCoverOK, Bool.and_eq_true] at h
    obtain ⟨hL, hR⟩ := h
    rcases mem_left_or_right d k mid t τ x hm with hl | hr
    · obtain ⟨b, hb, hbm⟩ := treeCoverOK_sound L _ _ hL t τ x hl
      exact ⟨b, (List.mem_filter.1 hb).1, hbm⟩
    · obtain ⟨b, hb, hbm⟩ := treeCoverOK_sound R _ _ hR t τ x hr
      exact ⟨b, (List.mem_filter.1 hb).1, hbm⟩

/-- Parse a certificate in preorder: a leaf `.`, or a cut `k,mid` followed by its two subtrees. -/
def parseTree : ℕ → List String → Option (PTree × List String)
  | 0, _ => none
  | _ + 1, [] => none
  | f + 1, tok :: rest =>
    if tok = "." then some (.leaf, rest)
    else
      match tok.splitOn "," with
      | [k, m] =>
        match parseTree f rest with
        | some (L, rest1) =>
          match parseTree f rest1 with
          | some (R, rest2) => some (.cut k.toNat! (parseQ m) L R, rest2)
          | none => none
        | none => none
      | _ => none

/-- The certificate of a token list (a bare leaf if malformed). -/
def treeOf (toks : List String) : PTree :=
  match parseTree (toks.length + 1) toks with
  | some (T, []) => T
  | _ => .leaf

/-- The boxes are bounded by `bound` and cover `[0, 9/10] × [0, ρ] × [0, 31/4]`
according to the certificate `cuts`. -/
def checkCover (rows : List Row) (batches : List JBatch) (bound : ℚ) (cuts boxes : List String) :
    Bool :=
  let bs := boxes.map parseBox
  allPar (boxOK rows batches bound) bs &&
    treeCoverOK (treeOf cuts) (0, 9 / 10, 0, ρ, 0, xMax) (bs.map Box.dom)

/-- **Soundness of the cover**: every admissible `(t, τ, x)` lies in a checked box. -/
theorem cover_sound (rows : List Row) (batches : List JBatch) (bound : ℚ)
    (cuts boxes : List String) (h : checkCover rows batches bound cuts boxes = true) (t τ x : ℝ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 9 / 10) (hτ0 : 0 ≤ τ) (hτ1 : τ ≤ ρ) (hx0 : 0 ≤ x) (hx1 : x ≤ xMax) :
    ∃ b : Box, boxOK rows batches bound b = true ∧ (b.tl : ℝ) ≤ t ∧ t ≤ b.tu ∧ (b.sl : ℝ) ≤ τ ∧
      τ ≤ b.su ∧ (b.xl : ℝ) ≤ x ∧ x ≤ b.xu := by
  simp only [checkCover, allPar_eq, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨d, hd, hdm⟩ := treeCoverOK_sound _ _ _ h.2 t τ x
    ⟨by simpa using ht0, by push_cast; exact ht1, by simpa using hτ0, hτ1, by simpa using hx0, hx1⟩
  obtain ⟨b, hb, rfl⟩ := List.mem_map.1 hd
  exact ⟨b, h.1 b hb, hdm⟩

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

/-- The data of one row in the shared reduction with the potential `Ψ`: the node caps of the row
(up to `capPad`), integrability at the common scale, the integrable gate expression of the common
gate variable, and the row inequality with the retained gate square. -/
def RowSharedWith (r : Row) (Ψ : ℝ → ℝ) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ)
    (τ V t : ℝ) (Qh v : E) : Prop :=
  CapsHold (fun s => Ψ s - capPad) r.nodeList r.smax ∧
    Integrable (fun ω => Ψ (r.delta * τ * √(U ω))) μ ∧
    Integrable (fun ω => r.gate (X1 ω) (X2 ω) (X3 ω)) μ ∧
    V ≤ t ^ 2 - 2 * r.ell * t + 2 * r.beta ^ 2 / ε + ∫ ω, Ψ (r.delta * τ * √(U ω)) ∂μ
      - r.delta * τ ^ 2 - ∫ ω, r.gate (X1 ω) (X2 ω) (X3 ω) ∂μ
      - ε * ‖Qh + ((r.beta : ℝ) / ε) • v‖ ^ 2

/-- The data of one row in the shared reduction, for some potential (`RowSharedWith`). -/
def RowShared (r : Row) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ) (τ V t : ℝ)
    (Qh v : E) : Prop :=
  ∃ Ψ : ℝ → ℝ, RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v

/-- The inequality of a virtual row with the padded potential `Φ` (`E Φ(τ√U) + capPad` is the
mixed `E Ψ`), its gate square retained. -/
def VHolds (a : VRow) (Φ : ℝ → ℝ) (μ : Measure Ω) (U : Ω → ℝ) (X1 X2 X3 : Ω → ℂ)
    (τ V t : ℝ) (Qh v : E) : Prop :=
  Integrable (fun ω => Φ (τ * √(U ω))) μ ∧
  Integrable (fun ω => a.gate (X1 ω) (X2 ω) (X3 ω)) μ ∧
  RowHolds (ε : ℝ) a.ell a.beta (2 * (a.beta : ℝ) ^ 2 / ε + (∫ ω, Φ (τ * √(U ω)) ∂μ + capPad)
    - a.delta * τ ^ 2 - ∫ ω, a.gate (X1 ω) (X2 ω) (X3 ω) ∂μ) V t Qh v

/-- A row of the shared reduction is a virtual row with potential `s ↦ Ψ(δs) − capPad`. -/
lemma vholds_of_row (r : Row) {Ψ : ℝ → ℝ} {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E}
    (h : RowSharedWith r Ψ μ U X1 X2 X3 τ V t Qh v) :
    VHolds r.vrow (fun s => Ψ (r.delta * s) - capPad) μ U X1 X2 X3 τ V t Qh v := by
  obtain ⟨-, hf, hg, hV⟩ := h
  refine ⟨?_, hg, ?_⟩
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

/-- The mixed potential of a single row. -/
lemma mixPot_zero (ri rj : Row) (Ψi Ψj : ℝ → ℝ) :
    mixPot ri rj 0 Ψi Ψj = fun s => Ψi (ri.delta * s) - capPad := by
  funext s; simp [mixPot]

lemma mixPot_one (ri rj : Row) (Ψi Ψj : ℝ → ℝ) :
    mixPot ri rj 1 Ψi Ψj = fun s => Ψj (rj.delta * s) - capPad := by
  funext s; simp [mixPot]

/-- Potentials identified by `samePot` coincide. -/
lemma samePot_sound (rows : List Row) (Ψ : Row → ℝ → ℝ) {a b c d : ℕ} {α γ : ℚ}
    (h : samePot a b α c d γ = true) {Ra Rb Rc Rd : Row} (ha : rows[a]? = some Ra)
    (hb : rows[b]? = some Rb) (hc : rows[c]? = some Rc) (hd : rows[d]? = some Rd) :
    mixPot Ra Rb α (Ψ Ra) (Ψ Rb) = mixPot Rc Rd γ (Ψ Rc) (Ψ Rd) := by
  simp only [samePot, Bool.or_eq_true, Bool.and_eq_true, beq_iff_eq] at h
  rcases h with (⟨⟨hac, hbd⟩, hag⟩ | ⟨⟨ha0, hg0⟩, hac⟩) | ⟨⟨ha1, hg1⟩, hbd⟩
  · subst hac hbd hag; rw [ha] at hc; rw [hb] at hd; cases hc; cases hd; rfl
  · subst ha0 hg0 hac; rw [ha] at hc; cases hc; rw [mixPot_zero, mixPot_zero]
  · subst ha1 hg1 hbd; rw [hb] at hd; cases hd; rw [mixPot_one, mixPot_one]

section data

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ] {U : Ω → ℝ}
  {x : ℝ}

omit [IsProbabilityMeasure μ] in
lemma TNodeOK.congr {Φ Φ' : ℝ → ℝ} (e : Φ = Φ') {n : TNode} (h : TNodeOK μ U x Φ n) :
    TNodeOK μ U x Φ' n := e ▸ h

/-- **The nodes of a component are certified** for the mixed potential of its rows: a Stein or
zero node of a row, or a witness of a batch, each for the same potential. -/
lemma nodeOf_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (Ψ : Row → ℝ → ℝ) (hΨ : ∀ r ∈ rows, CapsHold (fun s => Ψ r s - capPad) r.nodeList r.smax)
    (hM : Moments μ U x) (hS : SteinCut μ U) (i j : ℕ) (θ xu : ℚ) (hxu : x ≤ xu) {Ri Rj : Row}
    (hRi : rows[i]? = some Ri) (hRj : rows[j]? = some Rj) (ref : NRef) (n : TNode)
    (h : nodeOf rows batches i j θ xu ref = some n) :
    TNodeOK μ U x (mixPot Ri Rj θ (Ψ Ri) (Ψ Rj)) n := by
  cases ref with
  | zero r =>
    simp only [nodeOf] at h
    split_ifs at h with hsp
    cases hR : rows[r]? with
    | none => simp [hR] at h
    | some R =>
      simp only [hR] at h
      have hm := List.mem_of_getElem? hR
      exact (rowTNode_sound R (hrows R hm) (hΨ R hm) hM hS none n h).congr
        ((mixPot_zero R R (Ψ R) (Ψ R)).symm.trans (samePot_sound rows Ψ hsp hR hR hRi hRj))
  | src r ci ni =>
    simp only [nodeOf] at h
    split_ifs at h with hsp
    cases hR : rows[r]? with
    | none => simp [hR] at h
    | some R =>
      simp only [hR] at h
      have hm := List.mem_of_getElem? hR
      exact (rowTNode_sound R (hrows R hm) (hΨ R hm) hM hS (some (ci, ni)) n h).congr
        ((mixPot_zero R R (Ψ R) (Ψ R)).symm.trans (samePot_sound rows Ψ hsp hR hR hRi hRj))
  | bat b k =>
    simp only [nodeOf] at h
    cases hbt : batches[b]? with
    | none => simp [hbt] at h
    | some bt =>
      simp only [hbt] at h
      split_ifs at h with hsp
      cases hp : bt.tnodeX[k]? with
      | none => simp [hp] at h
      | some p =>
      simp only [hp] at h
      split_ifs at h with hxp
      simp only [Option.some.injEq] at h
      subst h
      have hb := hbatches bt (List.mem_of_getElem? hbt)
      cases hRa : rows[bt.i]? with
      | none => simp [checkBatch, hRa] at hb
      | some Ra =>
      cases hRb : rows[bt.j]? with
      | none => simp [checkBatch, hRa, hRb] at hb
      | some Rb =>
      exact (batch_sound rows bt hb Ra Rb hRa hRb (hΨ Ra (List.mem_of_getElem? hRa))
        (hΨ Rb (List.mem_of_getElem? hRb)) hM hS p (List.mem_of_getElem? hp)
        (hxu.trans (by exact_mod_cast hxp))).congr
        (samePot_sound rows Ψ hsp hRa hRb hRi hRj)

omit [IsProbabilityMeasure μ] in
/-- The chords at `s₀`, `s₁` of certified nodes of a convex potential are certified nodes. -/
lemma rechord_sound {Φ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (ns ms : List TNode)
    (s0 s1 : ℚ) (h : rechord ns s0 s1 = some ms) (hok : ∀ n ∈ ns, TNodeOK μ U x Φ n) :
    ∀ m ∈ ms, TNodeOK μ U x Φ m := by
  match ns, h with
  | [n0, n1, n2, n3], h =>
    simp only [rechord] at h
    split_ifs at h with hc
    simp only [Option.some.injEq] at h
    subst h
    simp only [Bool.and_eq_true] at hc
    have h0 : TNodeOK μ U x Φ ⟨s0, tchordP n0 n1 s0⟩ :=
      tchord_sound hconv n0 n1 s0 hc.1 (hok n0 (by simp)) (hok n1 (by simp))
    have h1 : TNodeOK μ U x Φ ⟨s1, tchordP n2 n3 s1⟩ :=
      tchord_sound hconv n2 n3 s1 hc.2 (hok n2 (by simp)) (hok n3 (by simp))
    intro m hm
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hm
    rcases hm with rfl | rfl | rfl | rfl <;> assumption
  | [], h => simp [rechord] at h
  | [_], h => simp [rechord] at h
  | [_, _], h => simp [rechord] at h
  | [_, _, _], h => simp [rechord] at h
  | _ :: _ :: _ :: _ :: _ :: _, h => simp [rechord] at h

/-- A certified component: a convex potential `Φ` for which the virtual row `a` holds and
`L₋`, `L₊` bound `E Φ(τ√U)` at `sl` and `su`. -/
def Comp (μ : Measure Ω) (U : Ω → ℝ) (x : ℝ) (X1 X2 X3 : Ω → ℂ) (τ V t : ℝ) (Qh v : E) (sl su : ℚ)
    (d : VRow × MPoly × MPoly) : Prop :=
  ∃ Φ : ℝ → ℝ, ConvexOn ℝ (Set.Ici 0) Φ ∧ VHolds d.1 Φ μ U X1 X2 X3 τ V t Qh v ∧
    TB μ U Φ sl (d.2.1.J 0 1 x) ∧ TB μ U Φ su (d.2.2.J 0 1 x)

variable {X1 X2 X3 : Ω → ℂ} {τ V t : ℝ} {Qh v : E} {sl su : ℚ}

omit [IsProbabilityMeasure μ] in
/-- A component from certified `τ`-nodes of a convex potential of the virtual row. -/
lemma compData_sound {α : Type} (a : VRow) (f : α → Option TNode) (refs : List α) (s0 s1 : ℚ)
    {Φ : ℝ → ℝ} (hconv : ConvexOn ℝ (Set.Ici 0) Φ) (hV : VHolds a Φ μ U X1 X2 X3 τ V t Qh v)
    (hf : ∀ r n, f r = some n → TNodeOK μ U x Φ n) (d : VRow × MPoly × MPoly)
    (h : compData a f refs s0 s1 sl su = some d) : Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  unfold compData at h
  cases hns : resolve f refs with
  | none => simp [hns] at h
  | some ns =>
  cases hms : rechord ns s0 s1 with
  | none => simp [hns, hms] at h
  | some ms =>
  cases hch : chords4 ms sl su with
  | none => simp [hns, hms, hch] at h
  | some P =>
  obtain ⟨Lm, Lp⟩ := P
  simp only [hns, hms, hch, Option.some.injEq] at h
  subst h
  have hok : ∀ n ∈ ns, TNodeOK μ U x Φ n := fun n hn => by
    obtain ⟨r, _, hr⟩ := resolve_mem f refs ns hns n hn
    exact hf r n hr
  have hok' := rechord_sound hconv ns ms s0 s1 hms hok
  obtain ⟨n0, n1, n2, n3, rfl, h01, h23, rfl, rfl⟩ := chords4_some _ sl su Lm Lp hch
  exact ⟨Φ, hconv, hV, tchord_sound hconv n0 n1 sl h01 (hok' n0 (by simp)) (hok' n1 (by simp)),
    tchord_sound hconv n2 n3 su h23 (hok' n2 (by simp)) (hok' n3 (by simp))⟩

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

/-- **The component of a `CompRef`**: the mixed virtual row of its rows holds with the mixed
potential, whose certified nodes are those referenced. -/
lemma compRef_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (Ψ : Row → ℝ → ℝ) (hΨ : ∀ r ∈ rows, RowSharedWith r (Ψ r) μ U X1 X2 X3 τ V t Qh v)
    (hM : Moments μ U x) (hS : SteinCut μ U) (hv : ‖v‖ ^ 2 = 2) (c : CompRef) (xu : ℚ)
    (hxu : x ≤ xu) (d : VRow × MPoly × MPoly) (h : compRefData rows batches c sl su xu = some d) :
    Comp μ U x X1 X2 X3 τ V t Qh v sl su d := by
  unfold compRefData at h
  cases hRi : rows[c.i]? with
  | none => simp [hRi] at h
  | some Ri =>
  cases hRj : rows[c.j]? with
  | none => simp [hRi, hRj] at h
  | some Rj =>
  simp only [hRi, hRj] at h
  split_ifs at h with hθ
  have mi := List.mem_of_getElem? hRi
  have mj := List.mem_of_getElem? hRj
  have hcaps : ∀ r ∈ rows, CapsHold (fun s => Ψ r s - capPad) r.nodeList r.smax :=
    fun r hr => (hΨ r hr).1
  have hθ0R : (0 : ℝ) ≤ c.θ := by exact_mod_cast hθ.1
  have hw0 : (0 : ℝ) ≤ 1 - c.θ := by
    have : (c.θ : ℝ) ≤ 1 := by exact_mod_cast hθ.2
    linarith
  have hδi : (0 : ℝ) ≤ Ri.delta := by exact_mod_cast (checkRow_node Ri (hrows Ri mi)).1.le
  have hδj : (0 : ℝ) ≤ Rj.delta := by exact_mod_cast (checkRow_node Rj (hrows Rj mj)).1.le
  exact compData_sound _ _ c.refs c.s0 c.s1
    (convexOn_mix (convexOn_scale (hcaps Ri mi).convex _ hδi)
      (convexOn_scale (hcaps Rj mj).convex _ hδj) _ _ hw0 hθ0R)
    (VHolds.mix c.θ hθ.1 hθ.2 hv (vholds_of_row Ri (hΨ Ri mi)) (vholds_of_row Rj (hΨ Rj mj)))
    (fun ref n hn => nodeOf_sound rows batches hrows hbatches Ψ hcaps hM hS c.i c.j c.θ xu hxu
      hRi hRj ref n hn) d h

/-- **Soundness of a box**: `V ≤ val` for every `(t, τ, x)` in the box. -/
theorem box_sound (rows : List Row) (batches : List JBatch)
    (hrows : ∀ r ∈ rows, checkRow r = true) (hbatches : ∀ b ∈ batches, checkBatch rows b = true)
    (b : Box) (val : ℚ) (hb : boxBound rows batches b = some val) (X1 X2 X3 : Ω → ℂ) (τ : ℝ)
    (hX : ∀ ω, ‖X1 ω‖ ^ 2 = τ ^ 2 * U ω) (hM : Moments μ U x) (hS : SteinCut μ U) (V t : ℝ)
    (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (Ψ : Row → ℝ → ℝ)
    (hΨ : ∀ r ∈ rows, RowSharedWith r (Ψ r) μ U X1 X2 X3 τ V t Qh v)
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
    | one c =>
      simp only [hk] at hd
      exact compRef_sound rows batches hrows hbatches Ψ hΨ hM hS hv c b.xu hx.2 d hd
    | two θ c0 c1 =>
      simp only [hk] at hd
      exact mixData_sound θ hv _ _
        (compRef_sound rows batches hrows hbatches Ψ hΨ hM hS hv c0 b.xu hx.2)
        (compRef_sound rows batches hrows hbatches Ψ hΨ hM hS hv c1 b.xu hx.2) d hd
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
