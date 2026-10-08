import Grothe.Lower.Profiles

/-!
# Global physical majorants: chord domination

A physical polynomial `p` of a source profile is a *global majorant* of the (convex,
`2`-Lipschitz) potential `Ψ` if it dominates, for every `s ≥ 0`, the piecewise-linear chord
interpolant of the lifted node caps `(rₖ, capₖ + 10⁻⁸)` on `[0, r_last]` and the affine tail
`cap_last + 2 (s − r_last)` beyond.  The certificate (`PhysCert`) lists contiguous cells
`[lo, hi]` from `0` to `tail`, each assigned to an active support line, on which `p − line ≥ 0`
is certified by Bernstein coefficients, plus a tail index for which `p − line` has nonnegative
coefficients after the shift `s = tail + y`.

`dominates_of_check` is the soundness theorem: a successful check implies `DominatesChords`,
i.e. for every `s ≥ 0` some support active at `s` lies below `p(s)`.  Consequently the analytic
hypothesis needed from the Gaussian layer reduces to "`Ψ` lies below the lifted node caps at
the nodes, is convex, and is `2`-Lipschitz" (which makes `Ψ ≤` every active support).
-/

namespace Grothe.Lower

/-- A support line `c0 + c1 s`, active on `[left, right]` (`right = none`: `[left, ∞)`). -/
structure Support where
  c0 : ℚ
  c1 : ℚ
  left : ℚ
  right : Option ℚ
  deriving Repr, DecidableEq

/-- Value of the support line. -/
noncomputable def Support.val (sp : Support) (s : ℝ) : ℝ := sp.c0 + sp.c1 * s

/-- `sp` is active at `s`. -/
def Support.Active (sp : Support) (s : ℝ) : Prop :=
  (sp.left : ℝ) ≤ s ∧ ∀ r : ℚ, sp.right = some r → s ≤ (r : ℝ)

def dfltSupport : Support := ⟨0, 0, 0, none⟩

/-- Chords between consecutive nodes and the affine tail of slope `2` from the last node. -/
def supportsOf : List (ℚ × ℚ) → List Support
  | [] => []
  | [(x, a)] => [⟨a - 2 * x, 2, x, none⟩]
  | (x, a) :: (y, b) :: rest =>
      ⟨a - (b - a) / (y - x) * x, (b - a) / (y - x), x, some y⟩ :: supportsOf ((y, b) :: rest)

/-- The chord support interpolates the two node caps. -/
lemma chord_interpolates (x a y b : ℚ) (hxy : x < y) :
    (Support.val ⟨a - (b - a) / (y - x) * x, (b - a) / (y - x), x, some y⟩ x = a) ∧
    (Support.val ⟨a - (b - a) / (y - x) * x, (b - a) / (y - x), x, some y⟩ y = b) := by
  have h : (y : ℝ) - x ≠ 0 := by
    have : (x : ℝ) < y := by exact_mod_cast hxy
    linarith
  constructor <;> (simp only [Support.val]; push_cast; field_simp; ring)

/-! ### List polynomial helpers -/

def negL : List ℚ → List ℚ
  | [] => []
  | a :: r => (-a) :: negL r

lemma evalL_negL : ∀ (p : List ℚ) (s : ℝ),
    evalL ((negL p).map ((↑) : ℚ → ℝ)) s = - evalL (p.map ((↑) : ℚ → ℝ)) s
  | [], s => by simp [negL, evalL]
  | a :: r, s => by
    simp only [negL, List.map_cons, evalL, Rat.cast_neg, evalL_negL r s]; ring

def addLq : List ℚ → List ℚ → List ℚ
  | [], m => m
  | l, [] => l
  | a :: l, b :: m => (a + b) :: addLq l m

lemma evalL_addLq : ∀ (l m : List ℚ) (s : ℝ),
    evalL ((addLq l m).map ((↑) : ℚ → ℝ)) s
      = evalL (l.map ((↑) : ℚ → ℝ)) s + evalL (m.map ((↑) : ℚ → ℝ)) s
  | [], m, s => by simp [addLq, evalL]
  | a :: l, [], s => by simp [addLq, evalL]
  | a :: l, b :: m, s => by
    simp only [addLq, List.map_cons, evalL, Rat.cast_add, evalL_addLq l m s]; ring

def scaleL (t : ℚ) : List ℚ → List ℚ
  | [] => []
  | a :: r => (t * a) :: scaleL t r

lemma evalL_scaleL (t : ℚ) : ∀ (p : List ℚ) (s : ℝ),
    evalL ((scaleL t p).map ((↑) : ℚ → ℝ)) s = t * evalL (p.map ((↑) : ℚ → ℝ)) s
  | [], s => by simp [scaleL, evalL]
  | a :: r, s => by
    simp only [scaleL, List.map_cons, evalL, Rat.cast_mul, evalL_scaleL t r s]; ring

/-- Coefficients of `(t + Y)·r(Y)`. -/
def mulXt (t : ℚ) (r : List ℚ) : List ℚ := addLq (scaleL t r) (0 :: r)

lemma evalL_mulXt (t : ℚ) (r : List ℚ) (y : ℝ) :
    evalL ((mulXt t r).map ((↑) : ℚ → ℝ)) y = (t + y) * evalL (r.map ((↑) : ℚ → ℝ)) y := by
  simp only [mulXt, evalL_addLq, evalL_scaleL, List.map_cons, evalL, Rat.cast_zero]; ring

/-- Coefficients of `y ↦ p(t + y)` (Horner substitution). -/
def shiftL : List ℚ → ℚ → List ℚ
  | [], _ => []
  | a :: q, t => addLq [a] (mulXt t (shiftL q t))

lemma evalL_shiftL : ∀ (q : List ℚ) (t : ℚ) (y : ℝ),
    evalL ((shiftL q t).map ((↑) : ℚ → ℝ)) y = evalL (q.map ((↑) : ℚ → ℝ)) (t + y)
  | [], t, y => by simp [shiftL, evalL]
  | a :: q, t, y => by
    simp only [shiftL, evalL_addLq, evalL_mulXt, evalL_shiftL q t y, List.map_cons, List.map_nil,
      evalL]
    ring

lemma evalL_nonneg_of_nonneg : ∀ (q : List ℚ), (∀ c ∈ q, 0 ≤ c) → ∀ y : ℝ, 0 ≤ y →
    0 ≤ evalL (q.map ((↑) : ℚ → ℝ)) y
  | [], _, y, _ => by simp [evalL]
  | a :: q, hq, y, hy => by
    simp only [List.map_cons, evalL]
    have ha : (0 : ℝ) ≤ a := by exact_mod_cast hq a (List.mem_cons_self ..)
    have := evalL_nonneg_of_nonneg q (fun c hc => hq c (List.mem_cons_of_mem _ hc)) y hy
    positivity

/-- `p − line`: subtract `c0` from the constant and `c1` from the linear coefficient. -/
def gapOf (p : List ℚ) (sp : Support) : List ℚ :=
  match p with
  | [] => [-sp.c0, -sp.c1]
  | [a] => [a - sp.c0, -sp.c1]
  | a :: b :: r => (a - sp.c0) :: (b - sp.c1) :: r

lemma evalL_gapOf (p : List ℚ) (sp : Support) (s : ℝ) :
    evalL ((gapOf p sp).map ((↑) : ℚ → ℝ)) s = evalL (p.map ((↑) : ℚ → ℝ)) s - sp.val s := by
  cases p with
  | nil => simp [gapOf, evalL, Support.val]; ring
  | cons a r =>
    cases r with
    | nil => simp [gapOf, evalL, Support.val]; ring
    | cons b r => simp [gapOf, evalL, Support.val]; ring

lemma negL_gapOf_ne_nil (p : List ℚ) (sp : Support) : negL (gapOf p sp) ≠ [] := by
  cases p with
  | nil => simp [gapOf, negL]
  | cons a r => cases r <;> simp [gapOf, negL]

/-! ### The certificate and the checker -/

/-- Chord-domination certificate: contiguous cells `hi:idx;…` from `0` to `tail`, then the tail
support index. -/
structure PhysCert where
  tail : ℚ
  tailIdx : ℕ
  cells : String
  deriving Repr

def parseCell (s : String) : ℚ × ℕ :=
  match s.splitOn ":" with
  | [h, i] => (parseQ h, i.toNat!)
  | _ => (0, 0)

def parseCells (s : String) : List (ℚ × ℕ) :=
  if s = "" then [] else (s.splitOn ";").map parseCell

def checkCell (sups : List Support) (p : List ℚ) (tail lo hi : ℚ) (idx : ℕ) : Bool :=
  decide (lo < hi) && decide (hi ≤ tail) && decide (idx < sups.length) &&
  decide ((sups.getD idx dfltSupport).left ≤ lo) &&
  (match (sups.getD idx dfltSupport).right with
    | none => true
    | some r => decide (hi ≤ r)) &&
  (bernList (negL (gapOf p (sups.getD idx dfltSupport))) lo hi).all (fun b => decide (b ≤ 0))

def checkCells (sups : List Support) (p : List ℚ) (tail : ℚ) : ℚ → List (ℚ × ℕ) → Bool
  | prev, [] => prev == tail
  | prev, (hi, idx) :: rest => checkCell sups p tail prev hi idx && checkCells sups p tail hi rest

def checkTail (sups : List Support) (p : List ℚ) (c : PhysCert) : Bool :=
  decide (0 ≤ c.tail) && decide (c.tailIdx < sups.length) &&
  ((sups.getD c.tailIdx dfltSupport).right == none) &&
  decide ((sups.getD c.tailIdx dfltSupport).left ≤ c.tail) &&
  (shiftL (gapOf p (sups.getD c.tailIdx dfltSupport)) c.tail).all (fun b => decide (0 ≤ b))

def checkPhysical (pts : List (ℚ × ℚ)) (p : List ℚ) (c : PhysCert) : Bool :=
  checkCells (supportsOf pts) p c.tail 0 (parseCells c.cells) && checkTail (supportsOf pts) p c

/-- `p` dominates an active support at every `s ≥ 0`. -/
def DominatesChords (pts : List (ℚ × ℚ)) (p : List ℚ) : Prop :=
  ∀ s : ℝ, 0 ≤ s → ∃ sp ∈ supportsOf pts, sp.Active s ∧ sp.val s ≤ evalL (p.map ((↑) : ℚ → ℝ)) s

/-! ### Soundness -/

lemma getD_mem_of_lt {α : Type*} (l : List α) (d : α) (i : ℕ) (hi : i < l.length) :
    l.getD i d ∈ l := by
  rw [List.getD_eq_getElem _ _ hi]; exact List.getElem_mem hi

lemma cell_sound (sups : List Support) (p : List ℚ) (tail lo hi : ℚ) (idx : ℕ)
    (h : checkCell sups p tail lo hi idx = true) (s : ℝ) (hlo : (lo : ℝ) ≤ s) (hhi : s ≤ hi) :
    ∃ sp ∈ sups, sp.Active s ∧ sp.val s ≤ evalL (p.map ((↑) : ℚ → ℝ)) s := by
  simp only [checkCell, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, and_assoc] at h
  obtain ⟨hlh, _, hidx, hleft, hright, hbern⟩ := h
  refine ⟨sups.getD idx dfltSupport, getD_mem_of_lt _ _ _ hidx, ⟨?_, ?_⟩, ?_⟩
  · exact le_trans (by exact_mod_cast hleft) hlo
  · intro r hr
    rw [hr] at hright
    simp only [decide_eq_true_eq] at hright
    exact hhi.trans (by exact_mod_cast hright)
  · have hb := evalL_le_of_bern_rat _ (negL_gapOf_ne_nil p _) lo hi s 0 hlo hhi hlh hbern
    rw [evalL_negL, evalL_gapOf] at hb
    push_cast at hb
    linarith

lemma cells_sound (sups : List Support) (p : List ℚ) (tail : ℚ) :
    ∀ (prev : ℚ) (cells : List (ℚ × ℕ)), checkCells sups p tail prev cells = true →
    ∀ s : ℝ, (prev : ℝ) ≤ s → s < tail →
      ∃ sp ∈ sups, sp.Active s ∧ sp.val s ≤ evalL (p.map ((↑) : ℚ → ℝ)) s
  | prev, [], h, s, hs, hst => by
    simp only [checkCells, beq_iff_eq] at h
    subst h
    exact absurd (lt_of_le_of_lt hs hst) (lt_irrefl _)
  | prev, (hi, idx) :: rest, h, s, hs, hst => by
    simp only [checkCells, Bool.and_eq_true] at h
    obtain ⟨hc, hr⟩ := h
    by_cases hle : s ≤ (hi : ℝ)
    · exact cell_sound sups p tail prev hi idx hc s hs hle
    · exact cells_sound sups p tail hi rest hr s (le_of_lt (not_le.1 hle)) hst

lemma tail_sound (sups : List Support) (p : List ℚ) (c : PhysCert)
    (h : checkTail sups p c = true) (s : ℝ) (hs : (c.tail : ℝ) ≤ s) :
    ∃ sp ∈ sups, sp.Active s ∧ sp.val s ≤ evalL (p.map ((↑) : ℚ → ℝ)) s := by
  simp only [checkTail, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true, beq_iff_eq,
    and_assoc] at h
  obtain ⟨_, hidx, hnone, hleft, hcoef⟩ := h
  refine ⟨sups.getD c.tailIdx dfltSupport, getD_mem_of_lt _ _ _ hidx, ⟨?_, ?_⟩, ?_⟩
  · exact le_trans (by exact_mod_cast hleft) hs
  · intro r hr; rw [hnone] at hr; exact absurd hr (by simp)
  · have h0 := evalL_nonneg_of_nonneg _ hcoef (s - c.tail) (by linarith)
    rw [evalL_shiftL, show (c.tail : ℝ) + (s - c.tail) = s by ring, evalL_gapOf] at h0
    linarith

/-- **Soundness of the chord-domination checker.** -/
theorem dominates_of_check (pts : List (ℚ × ℚ)) (p : List ℚ) (c : PhysCert)
    (h : checkPhysical pts p c = true) : DominatesChords pts p := by
  simp only [checkPhysical, Bool.and_eq_true] at h
  obtain ⟨hc, ht⟩ := h
  intro s hs
  by_cases hlt : s < (c.tail : ℝ)
  · exact cells_sound _ _ _ 0 _ hc s (by simpa using hs) hlt
  · exact tail_sound _ _ _ ht s (not_lt.1 hlt)

end Grothe.Lower
