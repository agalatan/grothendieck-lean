import Grothe.Lower.Bernstein

/-!
# Rectangle covers by a column sweep

A moment cover is a list of rectangles `[slo, shi] × [xlo, xhi]`, each carrying the index `k` of
a polynomial.  `coversRect boxes edges ulo uhi xlo xhi` certifies that the rectangles cover
`[ulo, uhi] × [xlo, xhi]`: on every column between consecutive `edges` (which must run from
`ulo` to `uhi`), the active rectangles chain from `xlo` to `xhi`.  `coversRect_sound` is the
real statement: every point of the domain lies in one of the rectangles.
-/

namespace Grothe.Lower

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

def parseQ (s : String) : ℚ :=
  match s.splitOn "/" with
  | [n] => (n.toInt! : ℚ)
  | [n, d] => (n.toInt! : ℚ) / (d.toNat! : ℚ)
  | _ => 0

def parseBox (s : String) : RBox :=
  match s.splitOn ":" with
  | [a, b, c, d, k] => ⟨parseQ a, parseQ b, parseQ c, parseQ d, k.toNat!⟩
  | _ => ⟨0, 0, 0, 0, 0⟩

def parseBoxes (s : String) : List RBox := if s = "" then [] else (s.splitOn ";").map parseBox

def parseEdges (s : String) : List ℚ := if s = "" then [] else (s.splitOn ";").map parseQ

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

lemma chainCovers_sound (act : List RBox) (xlo xhi : ℚ) (σ : ℝ)
    (hact : ∀ bx ∈ act, (bx.slo : ℝ) ≤ σ ∧ σ ≤ bx.shi) :
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
  obtain ⟨bx, hbx, hm⟩ :=
    chainCovers_sound act xlo xhi σ hact' _ _ h hbase (Or.inl rfl) x hx0 hx1 hx
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

end Grothe.Lower
