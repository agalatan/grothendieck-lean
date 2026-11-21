-- Grothe/Lower/AdaptiveSearch.lean
import Mathlib.Data.Nat.Find

/-!
# Certified adaptive binary search

The search tries a local test before splitting. Its invariant says that every
returned tree is accepted: coverage is supplied by the splitting operation, not
by a separately serialized list of cells. The completeness theorems separate
successful termination from soundness. In particular, `synthesize` uses a proof
that some depth succeeds without evaluating that depth or its tree in the proof.

Agent-ID: codex-6a2f. Refs #462.
-/

namespace Grothe.Lower.AdaptiveSearch

/-- An adaptive partition records only which cells were split. -/
inductive Tree where
  | leaf
  | split (left right : Tree)
  deriving Repr, DecidableEq

/-- Maximum number of splits along a branch. -/
def Tree.height : Tree → ℕ
  | .leaf => 0
  | .split l r => max l.height r.height + 1

variable {D : Type*}

/-- Interpret a partition using the local test and the two child constructors. -/
def valid (test : D → Bool) (left right : D → D) : Tree → D → Bool
  | .leaf, d => test d
  | .split l r, d => valid test left right l (left d) && valid test left right r (right d)

/-- First try the current cell, then adaptively subdivide if depth remains. -/
def search (test : D → Bool) (left right : D → D) : ℕ → D → Option Tree
  | 0, d => if test d then some .leaf else none
  | n + 1, d =>
    if test d then some .leaf else
      match search test left right n (left d), search test left right n (right d) with
      | some l, some r => some (.split l r)
      | _, _ => none

/-- Soundness and the depth bound are preserved by every recursive step. -/
theorem search_spec (test : D → Bool) (left right : D → D) :
    ∀ n d t, search test left right n d = some t →
      valid test left right t d = true ∧ t.height ≤ n := by
  intro n
  induction n with
  | zero =>
    intro d t h
    by_cases ht : test d = true
    · simp [search, ht] at h
      subst t
      exact ⟨ht, Nat.le_refl 0⟩
    · simp [search, ht] at h
  | succ n ih =>
    intro d t h
    by_cases ht : test d = true
    · simp [search, ht] at h
      subst t
      exact ⟨ht, Nat.zero_le _⟩
    · cases hl : search test left right n (left d) with
      | none => simp [search, ht, hl] at h
      | some l =>
        cases hr : search test left right n (right d) with
        | none => simp [search, ht, hl, hr] at h
        | some r =>
          simp [search, ht, hl, hr] at h
          subst t
          obtain ⟨hvl, hnl⟩ := ih _ _ hl
          obtain ⟨hvr, hnr⟩ := ih _ _ hr
          exact ⟨by simp [valid, hvl, hvr],
            Nat.add_le_add_right (max_le hnl hnr) 1⟩

/-- A successful run supplies an accepted tree without rerunning its checker. -/
theorem search_sound (test : D → Bool) (left right : D → D)
    {n : ℕ} {d : D} {t : Tree} (h : search test left right n d = some t) :
    valid test left right t d = true :=
  (search_spec test left right n d t h).1

/-- Any accepted finite partition guarantees success at its height or deeper.
The search can return a smaller tree by stopping at an earlier accepted cell. -/
theorem search_complete (test : D → Bool) (left right : D → D) (t : Tree) :
    ∀ d n, valid test left right t d = true → t.height ≤ n →
      ∃ result, search test left right n d = some result := by
  induction t with
  | leaf =>
    intro d n h _
    have ht : test d = true := h
    cases n <;> exact ⟨.leaf, by simp [search, ht]⟩
  | split l r ihl ihr =>
    intro d n h hn
    have hv : valid test left right l (left d) = true ∧
        valid test left right r (right d) = true := by simpa [valid] using h
    obtain ⟨hvl, hvr⟩ := hv
    cases n with
    | zero => simp [Tree.height] at hn
    | succ n =>
      by_cases ht : test d = true
      · exact ⟨.leaf, by simp [search, ht]⟩
      · have hmax : max l.height r.height ≤ n := Nat.le_of_succ_le_succ hn
        obtain ⟨l', hl'⟩ := ihl _ n hvl (Nat.le_trans (Nat.le_max_left _ _) hmax)
        obtain ⟨r', hr'⟩ := ihr _ n hvr (Nat.le_trans (Nat.le_max_right _ _) hmax)
        exact ⟨.split l' r', by simp [search, ht, hl', hr']⟩

/-- Increasing the depth cannot turn a successful search into failure. -/
theorem search_mono (test : D → Bool) (left right : D → D)
    {n m : ℕ} {d : D} {t : Tree}
    (h : search test left right n d = some t) (hnm : n ≤ m) :
    ∃ result, search test left right m d = some result := by
  obtain ⟨hv, hh⟩ := search_spec test left right n d t h
  exact search_complete test left right t d m hv (Nat.le_trans hh hnm)

/-- Failure at depth `n` excludes every accepted partition of height at most
`n`, not just a particular attempted traversal. -/
theorem height_gt_of_search_none (test : D → Bool) (left right : D → D)
    {n : ℕ} {d : D} {t : Tree}
    (hfail : search test left right n d = none)
    (hvalid : valid test left right t d = true) : n < t.height := by
  apply Nat.lt_of_not_ge
  intro hheight
  obtain ⟨result, hresult⟩ := search_complete test left right t d n hvalid hheight
  simp [hfail] at hresult

/-- A success immediately after a failed depth has the smallest possible
height among all accepted partitions. -/
theorem search_height_eq_of_previous_failure (test : D → Bool) (left right : D → D)
    {n : ℕ} {d : D} {t : Tree}
    (hfail : search test left right n d = none)
    (hsuccess : search test left right (n + 1) d = some t) : t.height = n + 1 := by
  obtain ⟨hvalid, hheight⟩ := search_spec test left right (n + 1) d t hsuccess
  exact Nat.le_antisymm hheight
    (Nat.succ_le_of_lt (height_gt_of_search_none test left right hfail hvalid))

/-- All cells at a fixed subdivision depth pass the local test. -/
def Uniform (test : D → Bool) (left right : D → D) : ℕ → D → Prop
  | 0, d => test d = true
  | n + 1, d => Uniform test left right n (left d) ∧ Uniform test left right n (right d)

/-- A uniform resolution guarantee implies adaptive success; accepted ancestors
may stop the search before that resolution is reached. -/
theorem search_complete_of_uniform (test : D → Bool) (left right : D → D) :
    ∀ n d, Uniform test left right n d →
      ∃ result, search test left right n d = some result := by
  intro n
  induction n with
  | zero =>
    intro d h
    exact ⟨.leaf, by simp [search, Uniform] at h ⊢; exact h⟩
  | succ n ih =>
    intro d h
    by_cases ht : test d = true
    · exact ⟨.leaf, by simp [search, ht]⟩
    · obtain ⟨l, hl⟩ := ih (left d) h.1
      obtain ⟨r, hr⟩ := ih (right d) h.2
      exact ⟨.split l r, by simp [search, ht, hl, hr]⟩

/-- The semantic invariant: local soundness and a covering split imply the
desired property at every point of every accepted partition. No ordering,
disjointness, or separate coverage checker is needed. -/
theorem valid_sound {Point : Type*} (test : D → Bool) (left right : D → D)
    (mem : D → Point → Prop) (P : Point → Prop)
    (local_sound : ∀ d, test d = true → ∀ x, mem d x → P x)
    (split_cover : ∀ d x, mem d x → mem (left d) x ∨ mem (right d) x)
    (t : Tree) :
    ∀ d, valid test left right t d = true → ∀ x, mem d x → P x := by
  induction t with
  | leaf => exact local_sound
  | split l r ihl ihr =>
    intro d h x hx
    have hv : valid test left right l (left d) = true ∧
        valid test left right r (right d) = true := by simpa [valid] using h
    obtain ⟨hl, hr⟩ := hv
    rcases split_cover d x hx with hxl | hxr
    · exact ihl (left d) hl x hxl
    · exact ihr (right d) hr x hxr

/-- Executable construction from a successful-termination proof. The proof
justifies the unbounded search over depths; it does not enumerate a partition. -/
def synthesize (test : D → Bool) (left right : D → D) (d : D)
    (h : ∃ n t, search test left right n d = some t) :
    {t : Tree // valid test left right t d = true} := by
  have hex : ∃ n, (search test left right n d).isSome = true := by
    obtain ⟨n, t, ht⟩ := h
    exact ⟨n, by simp [ht]⟩
  let n := Nat.find hex
  have hn : (search test left right n d).isSome = true := Nat.find_spec hex
  let t := (search test left right n d).get (by simpa using hn)
  have ht : search test left right n d = some t := by
    exact (Option.some_get _).symm
  exact ⟨t, search_sound test left right ht⟩

end Grothe.Lower.AdaptiveSearch
