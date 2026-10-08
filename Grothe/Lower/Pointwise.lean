import Grothe.Lower.Chords

/-!
# Pointwise profiles: data types, the exact checker, and its soundness

A *pointwise profile* averages two source profiles `i, j` with weight `w`, possibly after a
common shift `(de, db)` of `(ℓ, β)` of both sources.  Its potential is bounded at finitely many
*nodes* `(r, cap)`:

* unshifted profiles use source nodes (lifted node caps of the two source groups, either the
  original ones or the finer dense ones), averaged by
  `(w r₁ + (1-w) r₂, w cap₁ + (1-w) cap₂ − g)` with the variance gain `g = 2w(1-w)(β₁-β₂)²/ε₀`;
* shifted profiles use, for each source, the upper endpoint of the sign-aware interval
  evaluation of a ten-monomial price family at `(de, db, r)` (`famUpper`), averaged the same way.

Chords between consecutive nodes and the slope-`2` affine tail support the convex, `2`-Lipschitz
potential; every physical polynomial of the profile dominates these supports
(`DominatesChords`, reusing the chord checker).  The residual-moment bound on
`[0, δρ] × [0, 31/4]` is certified by an explicit list of rectangles, each with a polynomial `k`:

  `Jpw(σ, x) = p₀ + ρ p₁ σ + (p₂ − 1/δ) σ² + p₄ (2 + x²) σ⁴ + p₆ (6 + 9x² + C₆ x³) σ⁶ ≤ cap`

via Bernstein coefficients at both `x`-endpoints; the rectangles cover the domain
(`coversRect`, a column-by-column sweep).  Finally the gates of the profile at `ε₀` and of its
dilation by `scale` (at `scale · ε₀`) are certified.
-/

namespace Grothe.Lower

/-! ### Rectangles and the sweep cover -/

/-- A rectangle `[slo, shi] × [xlo, xhi]` with the index `k` of its polynomial. -/
structure RBox where
  slo : ℚ
  shi : ℚ
  xlo : ℚ
  xhi : ℚ
  k : ℕ
  deriving Repr, DecidableEq

def RBox.mem (b : RBox) (σ x : ℝ) : Prop :=
  (b.slo : ℝ) ≤ σ ∧ σ ≤ b.shi ∧ (b.xlo : ℝ) ≤ x ∧ x ≤ b.xhi

def parseBox (s : String) : RBox :=
  match s.splitOn ":" with
  | [a, b, c, d, k] => ⟨parseQ a, parseQ b, parseQ c, parseQ d, k.toNat!⟩
  | _ => ⟨0, 0, 0, 0, 0⟩

def parseBoxes (s : String) : List RBox := (s.splitOn ";").map parseBox

/-- Extend the reach `r` by one active box containing `r` in its half-open `x`-range. -/
def stepReach (act : List RBox) (r : ℚ) : Option ℚ :=
  (act.find? fun bx => decide (bx.xlo ≤ r) && decide (r < bx.xhi)).map (·.xhi)

def chainCovers (act : List RBox) (xhi : ℚ) : ℕ → ℚ → Bool
  | 0, r => decide (xhi ≤ r)
  | n + 1, r => decide (xhi ≤ r) ||
      (match stepReach act r with
       | some r' => chainCovers act xhi n r'
       | none => false)

/-- The boxes active on the column `[a, b]` cover `[xlo, xhi]`. -/
def columnCovered (boxes : List RBox) (a b xlo xhi : ℚ) : Bool :=
  let act := boxes.filter fun bx => decide (bx.slo ≤ a) && decide (b ≤ bx.shi)
  chainCovers act xhi (act.length + 1) xlo

def chainEdges (boxes : List RBox) (xlo xhi : ℚ) : List ℚ → Bool
  | a :: b :: rest => decide (a < b) && columnCovered boxes a b xlo xhi &&
      chainEdges boxes xlo xhi (b :: rest)
  | _ => true

/-- The boxes cover `[ulo, uhi] × [xlo, xhi]`, checked on the columns between consecutive
`edges` (which must start at `ulo` and end at `uhi`). -/
def coversRect (boxes : List RBox) (edges : List ℚ) (ulo uhi xlo xhi : ℚ) : Bool :=
  (edges.head? == some ulo) && (edges.getLast? == some uhi) && decide (ulo < uhi) &&
  decide (xlo < xhi) && chainEdges boxes xlo xhi edges

def Covered (boxes : List RBox) (σ x : ℝ) : Prop := ∃ bx ∈ boxes, bx.mem σ x

lemma chainCovers_sound (act : List RBox) (xlo xhi : ℚ) (σ : ℝ) (hact : ∀ bx ∈ act, (bx.slo : ℝ) ≤ σ ∧ σ ≤ bx.shi) :
    ∀ (n : ℕ) (r : ℚ), chainCovers act xhi n r = true →
      (∀ x : ℝ, (xlo : ℝ) ≤ x → x < r → Covered act σ x) → (r = xlo ∨ Covered act σ r) →
      ∀ x : ℝ, (xlo : ℝ) ≤ x → x ≤ xhi → (xlo : ℝ) < xhi → Covered act σ x
  | 0, r, h, hinv, hr, x, hx0, hx1, hlt => by
    simp only [chainCovers, decide_eq_true_eq] at h
    have : (xhi : ℝ) ≤ r := by exact_mod_cast h
    rcases lt_or_eq_of_le (hx1.trans this) with hlt' | heq
    · exact hinv x hx0 hlt'
    · rcases hr with hr | hr
      · exfalso; rw [hr] at this; linarith
      · rw [heq]; exact hr
  | n + 1, r, h, hinv, hr, x, hx0, hx1, hlt => by
    simp only [chainCovers, Bool.or_eq_true, decide_eq_true_eq] at h
    rcases h with h | h
    · have : (xhi : ℝ) ≤ r := by exact_mod_cast h
      rcases lt_or_eq_of_le (hx1.trans this) with hlt' | heq
      · exact hinv x hx0 hlt'
      · rcases hr with hr | hr
        · exfalso; rw [hr] at this; linarith
        · rw [heq]; exact hr
    · revert h
      simp only [stepReach]
      cases hf : act.find? (fun bx => decide (bx.xlo ≤ r) && decide (r < bx.xhi)) with
      | none => intro h; simp at h
      | some bx =>
        intro h
        simp only [Option.map_some] at h
        have hmem := List.mem_of_find?_eq_some hf
        have hp := List.find?_some hf
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hp
        obtain ⟨hp1, hp2⟩ := hp
        have hsig := hact bx hmem
        refine chainCovers_sound act xlo xhi σ hact n bx.xhi h ?_ ?_ x hx0 hx1 hlt
        · intro y hy0 hy1
          by_cases hyr : y < (r : ℝ)
          · exact hinv y hy0 hyr
          · refine ⟨bx, hmem, hsig.1, hsig.2, ?_, hy1.le⟩
            have : (bx.xlo : ℝ) ≤ r := by exact_mod_cast hp1
            exact this.trans (not_lt.1 hyr)
        · right
          refine ⟨bx, hmem, hsig.1, hsig.2, ?_, le_rfl⟩
          have h1 : (bx.xlo : ℝ) ≤ r := by exact_mod_cast hp1
          have h2 : (r : ℝ) ≤ bx.xhi := by exact_mod_cast hp2.le
          exact h1.trans h2

lemma columnCovered_sound (boxes : List RBox) (a b xlo xhi : ℚ)
    (h : columnCovered boxes a b xlo xhi = true) (hx : (xlo : ℝ) < xhi) (σ x : ℝ)
    (hσ0 : (a : ℝ) ≤ σ) (hσ1 : σ ≤ b) (hx0 : (xlo : ℝ) ≤ x) (hx1 : x ≤ xhi) :
    Covered boxes σ x := by
  simp only [columnCovered] at h
  set act := boxes.filter fun bx => decide (bx.slo ≤ a) && decide (b ≤ bx.shi) with hact
  have hact' : ∀ bx ∈ act, (bx.slo : ℝ) ≤ σ ∧ σ ≤ bx.shi := by
    intro bx hbx
    rw [hact, List.mem_filter] at hbx
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hbx
    exact ⟨(by exact_mod_cast hbx.2.1 : (bx.slo : ℝ) ≤ a).trans hσ0,
      hσ1.trans (by exact_mod_cast hbx.2.2)⟩
  have hbase : ∀ y : ℝ, (xlo : ℝ) ≤ y → y < xlo → Covered act σ y :=
    fun y hy0 hy1 => absurd (lt_of_le_of_lt hy0 hy1) (lt_irrefl _)
  obtain ⟨bx, hbx, hm⟩ := chainCovers_sound act xlo xhi σ hact' _ _ h hbase (Or.inl rfl) x hx0 hx1 hx
  exact ⟨bx, List.mem_of_mem_filter hbx, hm⟩

lemma chainEdges_sound (boxes : List RBox) (xlo xhi : ℚ) (hx : (xlo : ℝ) < xhi) :
    ∀ (rest : List ℚ) (a : ℚ), chainEdges boxes xlo xhi (a :: rest) = true →
    ∀ (z : ℚ), (a :: rest).getLast? = some z → a < z →
    ∀ σ x : ℝ, (a : ℝ) ≤ σ → σ ≤ z → (xlo : ℝ) ≤ x → x ≤ xhi → Covered boxes σ x := by
  intro rest
  induction rest with
  | nil =>
    intro a _h z hz haz
    simp only [List.getLast?_singleton, Option.some.injEq] at hz
    rw [← hz] at haz
    exact absurd haz (lt_irrefl _)
  | cons b rest' ih =>
    intro a h z hz haz σ x hσ0 hσ1 hx0 hx1
    rw [chainEdges] at h
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h
    obtain ⟨⟨hab, hcol⟩, hrest⟩ := h
    by_cases hσb : σ ≤ (b : ℝ)
    · exact columnCovered_sound boxes a b xlo xhi hcol hx σ x hσ0 hσb hx0 hx1
    · have hz' : (b :: rest').getLast? = some z := by
        rw [List.getLast?_cons_cons] at hz; exact hz
      have hbz : b < z := by
        have h1 : (b : ℝ) < σ := not_le.1 hσb
        have : (b : ℝ) < z := lt_of_lt_of_le h1 hσ1
        exact_mod_cast this
      exact ih b hrest z hz' hbz σ x (le_of_lt (not_le.1 hσb)) hσ1 hx0 hx1

/-- **Soundness of the sweep cover.** -/
theorem coversRect_sound (boxes : List RBox) (edges : List ℚ) (ulo uhi xlo xhi : ℚ)
    (h : coversRect boxes edges ulo uhi xlo xhi = true) (σ x : ℝ)
    (hσ0 : (ulo : ℝ) ≤ σ) (hσ1 : σ ≤ uhi) (hx0 : (xlo : ℝ) ≤ x) (hx1 : x ≤ xhi) :
    Covered boxes σ x := by
  simp only [coversRect, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨hhead, hlast⟩, huu⟩, hxx⟩, hchain⟩ := h
  have hcons : edges = ulo :: edges.tail :=
    List.eq_cons_of_mem_head? (by rw [hhead]; exact Option.mem_def.2 rfl)
  rw [hcons] at hchain hlast
  exact chainEdges_sound boxes xlo xhi (by exact_mod_cast hxx) edges.tail ulo hchain uhi hlast
    huu σ x hσ0 hσ1 hx0 hx1

/-! ### Interval evaluation of a price family -/

/-- The ten monomials `1, de, db, r, de², de·db, db², de·r, db·r, r²`. -/
def monos (de db r : ℚ) : List ℚ :=
  [1, de, db, r, de * de, de * db, db * db, de * r, db * r, r * r]

/-- Sign-aware upper endpoint of `Σ cₖ mₖ` for coefficient intervals `cₖ ∈ [lo, hi]`. -/
def famUpper (c : List (ℚ × ℚ)) (de db r : ℚ) : ℚ :=
  (List.zipWith (fun (iv : ℚ × ℚ) (m : ℚ) => max (iv.1 * m) (iv.2 * m)) c (monos de db r)).sum

/-- Any real coefficient vector inside the intervals evaluates below `famUpper`. -/
lemma famUpper_sound_aux : ∀ (c : List (ℚ × ℚ)) (cr : List ℝ) (m : List ℚ),
    List.Forall₂ (fun (iv : ℚ × ℚ) (x : ℝ) => (iv.1 : ℝ) ≤ x ∧ x ≤ iv.2) c cr →
    (List.zipWith (· * ·) cr (m.map ((↑) : ℚ → ℝ))).sum
      ≤ ((List.zipWith (fun (iv : ℚ × ℚ) (m : ℚ) => max (iv.1 * m) (iv.2 * m)) c m).sum : ℚ)
  | [], [], m, _ => by simp
  | [], _ :: _, _, h => by cases h
  | _ :: _, [], _, h => by cases h
  | iv :: c, x :: cr, [], _ => by simp
  | iv :: c, x :: cr, mm :: m, h => by
    cases h with
    | cons hx hrest =>
      simp only [List.zipWith_cons_cons, List.map_cons, List.sum_cons, Rat.cast_add, Rat.cast_max,
        Rat.cast_mul]
      have ih := famUpper_sound_aux c cr m hrest
      have hterm : x * (mm : ℝ) ≤ max ((iv.1 : ℝ) * mm) ((iv.2 : ℝ) * mm) := by
        rcases le_or_gt 0 (mm : ℝ) with hm | hm
        · exact (mul_le_mul_of_nonneg_right hx.2 hm).trans (le_max_right _ _)
        · exact (mul_le_mul_of_nonpos_right hx.1 hm.le).trans (le_max_left _ _)
      linarith

theorem famUpper_sound (c : List (ℚ × ℚ)) (cr : List ℝ)
    (h : List.Forall₂ (fun (iv : ℚ × ℚ) (x : ℝ) => (iv.1 : ℝ) ≤ x ∧ x ≤ iv.2) c cr)
    (de db r : ℚ) :
    (List.zipWith (· * ·) cr ((monos de db r).map ((↑) : ℚ → ℝ))).sum ≤ (famUpper c de db r : ℚ) :=
  famUpper_sound_aux c cr (monos de db r) h

/-! ### Records -/

structure PwRecord where
  id : String
  i : ℕ
  j : ℕ
  w : ℚ
  de : ℚ
  db : ℚ
  ell : ℚ
  beta : ℚ
  delta : ℚ
  E : Sym3
  R : Sym2
  gain : ℚ
  cap : ℚ
  /-- `0`: source nodes, `1`: dense nodes, `2`: shifted (price families) -/
  kind : ℕ
  /-- averaged nodes `r:cap;…` -/
  nodes : String
  /-- node provenance: `ia:ib;…` (kinds 0, 1) or `ra:capa:ka:rb:capb:kb;…` (kind 2) -/
  nodeSrc : String
  tail : ℚ
  /-- chord certificate cells `hi:idx;…` shared by all polynomials -/
  cells : String
  polys : List (List ℚ)
  /-- rectangles `slo:shi:xlo:xhi:k;…` -/
  boxes : String
  edges : List ℚ
  gates : GateCert
  scale : ℚ
  sgates : GateCert
  deriving Repr

/-- Context: source profiles, lifted source node caps, lifted dense node caps, price families. -/
structure PwCtx where
  src : List SrcProfile
  srcNodes : List (List (ℚ × ℚ))
  dense : List (List (ℚ × ℚ))
  fam : List (List (List (ℚ × ℚ)))

def PwCtx.srcP (C : PwCtx) (i : ℕ) : SrcProfile := C.src.getD i ⟨"", 0, 0, 0, ⟨0, 0, 0, 0, 0, 0⟩, ⟨0, 0, 0⟩⟩

/-- The node list a profile of the given kind averages. -/
def PwCtx.pts (C : PwCtx) (kind i : ℕ) : List (ℚ × ℚ) :=
  if kind = 0 then C.srcNodes.getD i [] else C.dense.getD i []

def parseNode (s : String) : ℚ × ℚ :=
  match s.splitOn ":" with
  | [a, b] => (parseQ a, parseQ b)
  | _ => (0, 0)

def parseNodes (s : String) : List (ℚ × ℚ) := (s.splitOn ";").map parseNode

def nodesSorted : List (ℚ × ℚ) → Bool
  | a :: b :: rest => decide (a.1 < b.1) && nodesSorted (b :: rest)
  | _ => true

/-- A node is justified by its provenance entry. -/
def NodeOK (C : PwCtx) (r : PwRecord) (n : ℚ × ℚ) : Prop :=
  (r.kind ≠ 2 ∧ ∃ a ∈ C.pts r.kind r.i, ∃ b ∈ C.pts r.kind r.j,
      n = (r.w * a.1 + (1 - r.w) * b.1, r.w * a.2 + (1 - r.w) * b.2 - r.gain)) ∨
  (r.kind = 2 ∧ ∃ (ra ca rb cb : ℚ) (ka kb : ℕ),
      ka < (C.fam.getD r.i []).length ∧ kb < (C.fam.getD r.j []).length ∧
      famUpper ((C.fam.getD r.i []).getD ka []) r.de r.db ra ≤ ca ∧
      famUpper ((C.fam.getD r.j []).getD kb []) r.de r.db rb ≤ cb ∧
      n = (r.w * ra + (1 - r.w) * rb, r.w * ca + (1 - r.w) * cb - r.gain))

def checkNode (C : PwCtx) (r : PwRecord) (n : ℚ × ℚ) (src : String) : Bool :=
  let parts := src.splitOn ":"
  if r.kind = 2 then
    let ra := parseQ (parts.getD 0 ""); let ca := parseQ (parts.getD 1 "")
    let ka := (parts.getD 2 "").toNat!
    let rb := parseQ (parts.getD 3 ""); let cb := parseQ (parts.getD 4 "")
    let kb := (parts.getD 5 "").toNat!
    decide (ka < (C.fam.getD r.i []).length) && decide (kb < (C.fam.getD r.j []).length) &&
    decide (famUpper ((C.fam.getD r.i []).getD ka []) r.de r.db ra ≤ ca) &&
    decide (famUpper ((C.fam.getD r.j []).getD kb []) r.de r.db rb ≤ cb) &&
    (n == (r.w * ra + (1 - r.w) * rb, r.w * ca + (1 - r.w) * cb - r.gain))
  else
    let ia := (parts.getD 0 "").toNat!; let ib := (parts.getD 1 "").toNat!
    let pi := C.pts r.kind r.i; let pj := C.pts r.kind r.j
    decide (ia < pi.length) && decide (ib < pj.length) &&
    (let a := pi.getD ia (0, 0); let b := pj.getD ib (0, 0)
     n == (r.w * a.1 + (1 - r.w) * b.1, r.w * a.2 + (1 - r.w) * b.2 - r.gain))

lemma nodeOK_of_check (C : PwCtx) (r : PwRecord) (n : ℚ × ℚ) (src : String)
    (h : checkNode C r n src = true) : NodeOK C r n := by
  unfold checkNode at h
  split_ifs at h with hk
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨⟨⟨hka, hkb⟩, hca⟩, hcb⟩, hn⟩ := h
    exact Or.inr ⟨hk, _, _, _, _, _, _, hka, hkb, hca, hcb, hn⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
    obtain ⟨⟨hia, hib⟩, hn⟩ := h
    exact Or.inl ⟨hk, _, getD_mem_of_lt _ _ _ hia, _, getD_mem_of_lt _ _ _ hib, hn⟩

/-! ### The rectangle polynomial -/

/-- Coefficients (in `σ`) of `Jpw` at a fixed `x`. -/
def pwCoeffs (p : List ℚ) (delta x : ℚ) : List ℚ :=
  [coeffL p 0, ρ * coeffL p 1, coeffL p 2 - 1 / delta, 0, coeffL p 4 * (2 + x ^ 2), 0,
   coeffL p 6 * (6 + 9 * x ^ 2 + C6 * x ^ 3)]

/-- `Jpw(σ, x) = p₀ + ρp₁σ + (p₂ − 1/δ)σ² + p₄(2+x²)σ⁴ + p₆(6+9x²+C₆x³)σ⁶`. -/
noncomputable def Jpw (p : List ℚ) (delta : ℚ) (σ x : ℝ) : ℝ :=
  (coeffL p 0 : ℚ) + ρ * (coeffL p 1 : ℚ) * σ + ((coeffL p 2 : ℚ) - 1 / (delta : ℝ)) * σ ^ 2
    + (coeffL p 4 : ℚ) * (2 + x ^ 2) * σ ^ 4 + (coeffL p 6 : ℚ) * (6 + 9 * x ^ 2 + C6 * x ^ 3) * σ ^ 6

lemma Jpw_eq_evalL (p : List ℚ) (delta : ℚ) (σ : ℝ) (x : ℚ) :
    Jpw p delta σ x = evalL ((pwCoeffs p delta x).map ((↑) : ℚ → ℝ)) σ := by
  simp only [Jpw, pwCoeffs, List.map_cons, List.map_nil, evalL]
  push_cast
  ring

def checkRBox (r : PwRecord) (bx : RBox) : Bool :=
  let p := r.polys.getD bx.k []
  decide (0 ≤ bx.slo) && decide (bx.slo < bx.shi) && decide (0 ≤ bx.xlo) &&
  decide (bx.xlo < bx.xhi) && decide (bx.k < r.polys.length) && polyValid p &&
  (bernList (pwCoeffs p r.delta bx.xlo) bx.slo bx.shi).all (fun b => decide (b ≤ r.cap)) &&
  (bernList (pwCoeffs p r.delta bx.xhi) bx.slo bx.shi).all (fun b => decide (b ≤ r.cap))

lemma rboxJ_le (p : List ℚ) (delta cap lo hi xlo xhi : ℚ) (hs : lo < hi) (hx0 : 0 ≤ xlo)
    (hp : PolyValid p)
    (hblo : ∀ b ∈ bernList (pwCoeffs p delta xlo) lo hi, b ≤ cap)
    (hbhi : ∀ b ∈ bernList (pwCoeffs p delta xhi) lo hi, b ≤ cap)
    (σ x : ℝ) (hσ0 : (lo : ℝ) ≤ σ) (hσ1 : σ ≤ hi) (hx1 : (xlo : ℝ) ≤ x) (hx2 : x ≤ xhi) :
    Jpw p delta σ x ≤ cap := by
  have hend : ∀ x0 : ℚ, (∀ b ∈ bernList (pwCoeffs p delta x0) lo hi, b ≤ cap) →
      Jpw p delta σ x0 ≤ cap := by
    intro x0 hb
    rw [Jpw_eq_evalL]
    exact evalL_le_of_bern_rat _ (by simp [pwCoeffs]) lo hi σ cap hσ0 hσ1 hs hb
  have hlo := hend xlo hblo
  have hhi := hend xhi hbhi
  have hA6 : (0 : ℝ) ≤ (coeffL p 6 : ℚ) := by exact_mod_cast hp.2.2.2.2
  have hC6 : (0 : ℝ) ≤ (C6 : ℚ) := by norm_num [C6]
  set a : ℝ := (coeffL p 4 : ℚ) * σ ^ 4 + 9 * (coeffL p 6 : ℚ) * σ ^ 6 with ha
  set b : ℝ := (coeffL p 6 : ℚ) * (C6 : ℚ) * σ ^ 6 with hb
  set K : ℝ := (coeffL p 0 : ℚ) + ρ * (coeffL p 1 : ℚ) * σ
    + ((coeffL p 2 : ℚ) - 1 / (delta : ℝ)) * σ ^ 2 + 2 * (coeffL p 4 : ℚ) * σ ^ 4
    + 6 * (coeffL p 6 : ℚ) * σ ^ 6 with hK
  have hJ : ∀ y : ℝ, Jpw p delta σ y = K + (a * y ^ 2 + b * y ^ 3) := by
    intro y; simp only [Jpw, hK, ha, hb]; ring
  have hb0 : 0 ≤ b := by rw [hb]; exact mul_nonneg (mul_nonneg hA6 hC6) (by positivity)
  have hx0' : (0 : ℝ) ≤ xlo := by exact_mod_cast hx0
  have := cubic_endpoint_le a b x xlo xhi hb0 hx0' hx1 hx2
  rw [hJ x]
  rcases le_max_iff.1 this with h | h
  · rw [hJ] at hlo; linarith
  · rw [hJ] at hhi; linarith

lemma rbox_sound (r : PwRecord) (bx : RBox) (h : checkRBox r bx = true) (σ x : ℝ)
    (hmem : bx.mem σ x) :
    bx.k < r.polys.length ∧ PolyValid (r.polys.getD bx.k []) ∧
      Jpw (r.polys.getD bx.k []) r.delta σ x ≤ r.cap := by
  simp only [checkRBox, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, and_assoc] at h
  obtain ⟨hs0, hs, hx0, hxx, hk, hp, hblo, hbhi⟩ := h
  obtain ⟨hm1, hm2, hm3, hm4⟩ := hmem
  exact ⟨hk, (polyValid_iff _).1 hp,
    rboxJ_le _ _ _ _ _ _ _ hs hx0 ((polyValid_iff _).1 hp) hblo hbhi σ x hm1 hm2 hm3 hm4⟩

/-! ### The checker -/

/-- Parsed nodes of a record. -/
def pwNodes (r : PwRecord) : List (ℚ × ℚ) := parseNodes r.nodes
/-- Parsed rectangles of a record. -/
def pwBoxes (r : PwRecord) : List RBox := parseBoxes r.boxes
/-- The chord certificate of a record (its last support is the affine tail). -/
def pwCert (r : PwRecord) : PhysCert := ⟨r.tail, (pwNodes r).length - 1, r.cells⟩

def checkPwParams (C : PwCtx) (r : PwRecord) : Bool :=
  let pi := C.srcP r.i
  let pj := C.srcP r.j
  decide (r.i < C.src.length) && decide (r.j < C.src.length) && (r.i != r.j) &&
  decide (0 < r.w) && decide (r.w < 1) &&
  ((r.kind == 2) || (r.de == 0 && r.db == 0)) &&
  decide (0 ≤ pi.beta + r.db) && decide (2 * (pi.beta + r.db) ≤ pi.ell + r.de) &&
  decide (0 ≤ pj.beta + r.db) && decide (2 * (pj.beta + r.db) ≤ pj.ell + r.de) &&
  (r.ell == r.w * pi.ell + (1 - r.w) * pj.ell + r.de) &&
  (r.beta == r.w * pi.beta + (1 - r.w) * pj.beta + r.db) &&
  (r.E == Sym3.avg r.w pi.E pj.E) && (r.R == Sym2.avg r.w pi.R pj.R) &&
  (r.gain == 2 * r.w * (1 - r.w) * (pi.beta - pj.beta) ^ 2 / ε₀) &&
  decide (0 < r.delta) && decide (r.delta < ε₀) &&
  decide (0 ≤ r.beta) && decide (2 * r.beta ≤ r.ell) &&
  checkGates ε₀ r.E r.R r.delta r.gates &&
  decide (1 ≤ r.scale) && decide (r.scale * ε₀ ≤ ε) &&
  checkGates (r.scale * ε₀) (r.E.scale r.scale) (r.R.scale r.scale) (r.scale * r.delta) r.sgates

def checkPwNodes (C : PwCtx) (r : PwRecord) : Bool :=
  let srcs := r.nodeSrc.splitOn ";"
  ((pwNodes r).length == srcs.length) && ((pwNodes r).head?.map Prod.fst == some 0) &&
  nodesSorted (pwNodes r) &&
  (List.zip (pwNodes r) srcs).all (fun ns => checkNode C r ns.1 ns.2)

def checkPwPolys (r : PwRecord) : Bool :=
  r.polys.all (fun p => polyValid p && checkPhysical (pwNodes r) p (pwCert r))

def checkPwBoxes (r : PwRecord) : Bool :=
  (pwBoxes r).all (checkRBox r) && coversRect (pwBoxes r) r.edges 0 (r.delta * ρ) 0 (31 / 4)

def checkPw (C : PwCtx) (r : PwRecord) : Bool :=
  checkPwParams C r && checkPwNodes C r && checkPwPolys r && checkPwBoxes r

/-- Everything the checker certifies about a pointwise profile. -/
structure PwSound (C : PwCtx) (r : PwRecord) : Prop where
  idx : r.i < C.src.length ∧ r.j < C.src.length ∧ r.i ≠ r.j
  w_pos : 0 < r.w
  w_lt : r.w < 1
  shift_zero : r.kind ≠ 2 → r.de = 0 ∧ r.db = 0
  shifted_src_i : 0 ≤ (C.srcP r.i).beta + r.db ∧ 2 * ((C.srcP r.i).beta + r.db) ≤ (C.srcP r.i).ell + r.de
  shifted_src_j : 0 ≤ (C.srcP r.j).beta + r.db ∧ 2 * ((C.srcP r.j).beta + r.db) ≤ (C.srcP r.j).ell + r.de
  ell_eq : r.ell = r.w * (C.srcP r.i).ell + (1 - r.w) * (C.srcP r.j).ell + r.de
  beta_eq : r.beta = r.w * (C.srcP r.i).beta + (1 - r.w) * (C.srcP r.j).beta + r.db
  E_eq : r.E = Sym3.avg r.w (C.srcP r.i).E (C.srcP r.j).E
  R_eq : r.R = Sym2.avg r.w (C.srcP r.i).R (C.srcP r.j).R
  gain_eq : r.gain = 2 * r.w * (1 - r.w) * ((C.srcP r.i).beta - (C.srcP r.j).beta) ^ 2 / ε₀
  delta_pos : 0 < r.delta
  delta_lt : r.delta < ε₀
  beta_nonneg : 0 ≤ r.beta
  ell_ge : 2 * r.beta ≤ r.ell
  gates : GateProp ε₀ r.E r.R r.delta
  scale_ge : 1 ≤ r.scale
  scale_le : r.scale * ε₀ ≤ ε
  sgates : GateProp (r.scale * ε₀) (r.E.scale r.scale) (r.R.scale r.scale) (r.scale * r.delta)
  nodes_first : (pwNodes r).head?.map Prod.fst = some 0
  nodes_sorted : nodesSorted (pwNodes r) = true
  nodes_ok : ∀ n ∈ pwNodes r, NodeOK C r n
  polys_valid : ∀ p ∈ r.polys, PolyValid p
  chords : ∀ p ∈ r.polys, DominatesChords (pwNodes r) p
  /-- Every point of `[0, δρ] × [0, 31/4]` lies in a certified rectangle whose polynomial is
  at most the cap there. -/
  cover : ∀ σ x : ℝ, 0 ≤ σ → σ ≤ r.delta * ρ → 0 ≤ x → x ≤ 31 / 4 →
    ∃ bx ∈ pwBoxes r, bx.mem σ x ∧ bx.k < r.polys.length ∧
      PolyValid (r.polys.getD bx.k []) ∧ Jpw (r.polys.getD bx.k []) r.delta σ x ≤ r.cap

lemma zip_mem_of_lt {α β : Type*} (l : List α) (m : List β) (hlen : l.length = m.length)
    (a : α) (ha : a ∈ l) : ∃ b ∈ m, (a, b) ∈ List.zip l m := by
  obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem ha
  have hi' : i < m.length := hlen ▸ hi
  refine ⟨m[i], List.getElem_mem hi', ?_⟩
  exact List.mem_iff_getElem.2 ⟨i, by rw [List.length_zip]; exact lt_min hi hi', by simp⟩

lemma pwNodes_sound (C : PwCtx) (r : PwRecord) (h : checkPwNodes C r = true) :
    (pwNodes r).head?.map Prod.fst = some 0 ∧ nodesSorted (pwNodes r) = true ∧
      ∀ n ∈ pwNodes r, NodeOK C r n := by
  simp only [checkPwNodes, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨hlen, hfirst⟩, hsorted⟩, hnodes⟩ := h
  refine ⟨hfirst, hsorted, fun n hn => ?_⟩
  obtain ⟨src, _, hmem⟩ := zip_mem_of_lt (pwNodes r) (r.nodeSrc.splitOn ";") hlen n hn
  have hc := hnodes (n, src) hmem
  exact nodeOK_of_check C r n src hc

lemma pwPolys_sound (r : PwRecord) (h : checkPwPolys r = true) :
    ∀ p ∈ r.polys, PolyValid p ∧ DominatesChords (pwNodes r) p := by
  simp only [checkPwPolys, List.all_eq_true, Bool.and_eq_true] at h
  intro p hp
  obtain ⟨h1, h2⟩ := h p hp
  exact ⟨(polyValid_iff _).1 h1, dominates_of_check _ _ _ h2⟩

lemma pwBoxes_sound (r : PwRecord) (h : checkPwBoxes r = true) :
    ∀ σ x : ℝ, 0 ≤ σ → σ ≤ r.delta * ρ → 0 ≤ x → x ≤ 31 / 4 →
    ∃ bx ∈ pwBoxes r, bx.mem σ x ∧ bx.k < r.polys.length ∧
      PolyValid (r.polys.getD bx.k []) ∧ Jpw (r.polys.getD bx.k []) r.delta σ x ≤ r.cap := by
  simp only [checkPwBoxes, Bool.and_eq_true, List.all_eq_true] at h
  obtain ⟨hboxes, hcover⟩ := h
  intro σ x hσ0 hσ1 hx0 hx1
  have hσ0' : ((0 : ℚ) : ℝ) ≤ σ := by exact_mod_cast hσ0
  have hσ1' : σ ≤ ((r.delta * ρ : ℚ) : ℝ) := by push_cast; exact hσ1
  have hx0' : ((0 : ℚ) : ℝ) ≤ x := by exact_mod_cast hx0
  have hx1' : x ≤ ((31 / 4 : ℚ) : ℝ) := by push_cast; exact hx1
  obtain ⟨bx, hbx, hmem⟩ := coversRect_sound _ _ _ _ _ _ hcover σ x hσ0' hσ1' hx0' hx1'
  obtain ⟨hk, hpv, hJ⟩ := rbox_sound r bx (hboxes bx hbx) σ x hmem
  exact ⟨bx, hbx, hmem, hk, hpv, hJ⟩

/-- **Soundness of the pointwise-profile checker.** -/
theorem pwSound_of_check (C : PwCtx) (r : PwRecord) (h : checkPw C r = true) : PwSound C r := by
  simp only [checkPw, Bool.and_eq_true] at h
  obtain ⟨⟨⟨hpar, hnod⟩, hpol⟩, hbox⟩ := h
  simp only [checkPwParams, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq, beq_iff_eq,
    bne_iff_ne, ne_eq, and_assoc] at hpar
  obtain ⟨hi, hj, hij, hw0, hw1, hshift, hsi1, hsi2, hsj1, hsj2, hell, hbeta, hE, hR, hgain,
    hd0, hd1, hb0, hb1, hg, hs0, hs1, hsg⟩ := hpar
  obtain ⟨hfirst, hsorted, hnodes⟩ := pwNodes_sound C r hnod
  have hpolys := pwPolys_sound r hpol
  exact ⟨⟨hi, hj, hij⟩, hw0, hw1,
    (fun hk => by rcases hshift with hk' | hz; exact absurd hk' hk; exact hz),
    ⟨hsi1, hsi2⟩, ⟨hsj1, hsj2⟩, hell, hbeta, hE, hR, hgain, hd0, hd1, hb0, hb1,
    gateProp_of_check _ _ _ _ _ hg, hs0, hs1, gateProp_of_check _ _ _ _ _ hsg,
    hfirst, hsorted, hnodes, fun p hp => (hpolys p hp).1, fun p hp => (hpolys p hp).2,
    pwBoxes_sound r hbox⟩

end Grothe.Lower
