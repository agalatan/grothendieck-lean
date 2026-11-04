import Grothe.UpperChaos.Q0LegendreInteger

/-! Ordered disjoint brackets make their selected roots distinct. This feeds
finite Gauss exactness using the same root selection as the weight checks.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0LegendreInteger

/-- One point selected in each strictly ordered bracket is injective. -/
theorem injective_of_ordered_brackets {n : ℕ} (lo hi : Fin n → ℝ)
    (hsep : ∀ i j, i < j → hi i < lo j) (root : Fin n → ℝ)
    (hroot : ∀ i, root i ∈ Set.Icc (lo i) (hi i)) : Function.Injective root := by
  intro i j heq
  by_contra hne
  rcases lt_or_gt_of_ne hne with hij | hji
  · have h := hsep i j hij
    have hi := (hroot i).2
    have hj := (hroot j).1
    linarith
  · have h := hsep j i hji
    have hj := (hroot j).2
    have hi := (hroot i).1
    linarith


/-- The same fact for an ordered list of integer brackets over a positive
common denominator. -/
theorem injective_of_ordered_integer_brackets (n : ℕ) (brackets : List (ℤ × ℤ))
    (hcount : brackets.length = n) (D : ℤ) (hD : 0 < D)
    (hordered : brackets.Pairwise (fun a b => a.2 < b.1)) (root : Fin n → ℝ)
    (hroot : ∀ i, root i ∈ Set.Icc
      ((((brackets.get ⟨i.val, by simp [hcount, i.isLt]⟩).1 : ℤ) : ℝ) / D)
      ((((brackets.get ⟨i.val, by simp [hcount, i.isLt]⟩).2 : ℤ) : ℝ) / D)) :
    Function.Injective root := by
  let entry (i : Fin n) : ℤ × ℤ := brackets.get ⟨i.val, by simp [hcount, i.isLt]⟩
  apply injective_of_ordered_brackets (fun i => (entry i).1 / (D : ℝ))
    (fun i => (entry i).2 / (D : ℝ))
  · intro i j hij
    have hi : i.val < brackets.length := by simp [hcount, i.isLt]
    have hj : j.val < brackets.length := by simp [hcount, j.isLt]
    have hpair := hordered.rel_getElem_of_lt hi hj hij
    have hDr : (0 : ℝ) < D := by exact_mod_cast hD
    exact div_lt_div_of_pos_right (by exact_mod_cast hpair) hDr
  · exact hroot

end Grothe.UpperChaos.Q0LegendreInteger
