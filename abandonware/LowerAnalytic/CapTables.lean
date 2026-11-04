/-
ABANDONWARE: text removed from `Grothe/LowerAnalytic/CapTables.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

lemma mul_bounds {x y a b c d : ℝ} (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a * c) (a * d)) (min (b * c) (b * d)) ≤ x * y ∧
      x * y ≤ max (max (a * c) (a * d)) (max (b * c) (b * d)) := by
  have h1 : min (a * y) (b * y) ≤ x * y ∧ x * y ≤ max (a * y) (b * y) := by
    rcases le_total 0 y with hy0 | hy0
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_right hx.1 hy0),
        (mul_le_mul_of_nonneg_right hx.2 hy0).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_right hx.2 hy0),
        (mul_le_mul_of_nonpos_right hx.1 hy0).trans (le_max_left _ _)⟩
  have h2 : ∀ e : ℝ, min (e * c) (e * d) ≤ e * y ∧ e * y ≤ max (e * c) (e * d) := by
    intro e
    rcases le_total 0 e with he | he
    · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left hy.1 he),
        (mul_le_mul_of_nonneg_left hy.2 he).trans (le_max_right _ _)⟩
    · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left hy.2 he),
        (mul_le_mul_of_nonpos_left hy.1 he).trans (le_max_left _ _)⟩
  exact ⟨(min_le_min (h2 a).1 (h2 b).1).trans h1.1, h1.2.trans (max_le_max (h2 a).2 (h2 b).2)⟩

  have := mul_bounds hx hy
