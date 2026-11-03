import Grothe.UpperChaos.Q0LegendrePolynomial

/-! Ordered real brackets select all roots of the explicit recurrence.
The actual source brackets and quadrature rule still need to be bound to this
interface. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0LegendreInteger

/-- If every ordered disjoint bracket has a root, it has exactly one. -/
theorem select_ordered_unique_roots (k : ℕ) (lo hi : Fin (k + 1) → ℝ)
    (hsep : ∀ i j, i < j → hi i < lo j)
    (hexist : ∀ i, ∃ x ∈ Set.Icc (lo i) (hi i), (realPair x k).2 = 0) :
    ∃ root : Fin (k + 1) → ℝ,
      (∀ i, root i ∈ Set.Icc (lo i) (hi i) ∧ (realPair (root i) k).2 = 0) ∧
      (∀ i x, x ∈ Set.Icc (lo i) (hi i) → (realPair x k).2 = 0 → x = root i) := by
  classical
  choose root hroot using hexist
  refine ⟨root, hroot, ?_⟩
  have hdis : ∀ i j, i ≠ j → Disjoint (Set.Icc (lo i) (hi i)) (Set.Icc (lo j) (hi j)) := by
    intro i j hij
    apply Set.disjoint_left.mpr
    intro x hxi hxj
    rcases lt_or_gt_of_ne hij with h | h
    · exact (not_le_of_gt (hsep i j h)) (le_trans hxj.1 hxi.2)
    · exact (not_le_of_gt (hsep j i h)) (le_trans hxi.1 hxj.2)
  exact root_unique_in_disjoint_brackets k lo hi root (fun i => (hroot i).1)
    (fun i => (hroot i).2) hdis

/-- The same selection directly from ordered integer endpoints over a common
positive denominator. -/
theorem select_ordered_integer_roots (k : ℕ) (lo hi : Fin (k + 1) → ℤ)
    (D : ℤ) (hD : 0 < D)
    (hsep : ∀ i j, i < j → hi i < lo j)
    (hexist : ∀ i, ∃ x ∈ Set.Icc ((lo i : ℝ) / D) ((hi i : ℝ) / D),
      (realPair x k).2 = 0) :
    ∃ root : Fin (k + 1) → ℝ,
      (∀ i, root i ∈ Set.Icc ((lo i : ℝ) / D) ((hi i : ℝ) / D) ∧
        (realPair (root i) k).2 = 0) ∧
      (∀ i x, x ∈ Set.Icc ((lo i : ℝ) / D) ((hi i : ℝ) / D) →
        (realPair x k).2 = 0 → x = root i) := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  apply select_ordered_unique_roots k (fun i => (lo i : ℝ) / D) (fun i => (hi i : ℝ) / D)
  · intro i j hij
    exact div_lt_div_of_pos_right (by exact_mod_cast hsep i j hij) hDr
  · exact hexist

/-- Ordered integer bracket lists select one unique root per entry. -/
theorem select_from_ordered_brackets (k : ℕ) (brackets : List (ℤ × ℤ))
    (hcount : brackets.length = k + 1) (D : ℤ) (hD : 0 < D)
    (hordered : brackets.Pairwise (fun a b => a.2 < b.1))
    (hexist : ∀ i : Fin brackets.length,
      ∃ x ∈ Set.Icc ((((brackets.get i).1 : ℤ) : ℝ) / D) ((((brackets.get i).2 : ℤ) : ℝ) / D),
        (realPair x k).2 = 0) :
    ∃ root : Fin (k + 1) → ℝ,
      (∀ i, root i ∈ Set.Icc
          ((((brackets.get ⟨i.val, by simpa [hcount] using i.isLt⟩).1 : ℤ) : ℝ) / D)
          ((((brackets.get ⟨i.val, by simpa [hcount] using i.isLt⟩).2 : ℤ) : ℝ) / D) ∧
        (realPair (root i) k).2 = 0) ∧
      (∀ i x, x ∈ Set.Icc
          ((((brackets.get ⟨i.val, by simpa [hcount] using i.isLt⟩).1 : ℤ) : ℝ) / D)
          ((((brackets.get ⟨i.val, by simpa [hcount] using i.isLt⟩).2 : ℤ) : ℝ) / D) →
        (realPair x k).2 = 0 → x = root i) := by
  let entry (i : Fin (k + 1)) : ℤ × ℤ := brackets.get ⟨i.val, by simpa [hcount] using i.isLt⟩
  apply select_ordered_integer_roots k (fun i => (entry i).1) (fun i => (entry i).2) D hD
  · intro i j hij
    have hi : i.val < brackets.length := by simpa [hcount] using i.isLt
    have hj : j.val < brackets.length := by simpa [hcount] using j.isLt
    exact hordered.rel_getElem_of_lt hi hj hij
  · intro i
    exact hexist ⟨i.val, by simpa [hcount] using i.isLt⟩

end Grothe.UpperChaos.Q0LegendreInteger
