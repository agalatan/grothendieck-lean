import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Rat.Cast.Defs

/-! Generic exact aggregation at a fixed rational denominator. It does not
read or certify any third-center source. Agent-ID: codex-8c4d. -/
namespace Grothe.UpperChaos.ThirdEnergyAggregation

/-- If the exact integer energy of each grade is known, the corresponding
rational coefficient energy is their sum divided by the squared denominator. -/
theorem total_of_grade_sums (N : ℕ) (a : ℕ → ℕ → ℕ → ℤ) (D : ℚ)
    (grade : ℕ → ℤ)
    (hgrade : ∀ q < N, (∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), a q c d ^ 2) = grade q) :
    (∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), ((a q c d : ℚ) / D)^2) =
      (((∑ q ∈ Finset.range N, grade q : ℤ) : ℚ) / D^2) := by
  simp_rw [div_pow, ← Int.cast_pow]
  simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Int.cast_sum]
  congr 2
  apply Finset.sum_congr rfl
  intro q hq
  exact hgrade q (Finset.mem_range.mp hq)

/-- The same bridge for a grade predicate; the predicate may represent any
finite band once source-specific degree filtering is established separately. -/
theorem band_of_grade_sums (N : ℕ) (a : ℕ → ℕ → ℕ → ℤ) (D : ℚ)
    (grade : ℕ → ℤ) (pred : ℕ → Prop) [DecidablePred pred]
    (hgrade : ∀ q < N, (∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1), a q c d ^ 2) = grade q) :
    (∑ q ∈ Finset.range N, if pred q then
      ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        ((a q c d : ℚ) / D)^2 else 0) =
      (((∑ q ∈ Finset.range N, if pred q then grade q else 0 : ℤ) : ℚ) / D^2) := by
  simp_rw [div_pow, ← Int.cast_pow]
  simp only [div_eq_mul_inv, ← Finset.sum_mul, ← Int.cast_sum]
  simp only [Int.cast_sum, Int.cast_ite, Int.cast_zero]
  rw [Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hp : pred q
  · simp only [hp, ite_true]
    simp only [← Int.cast_sum]
    rw [hgrade q (Finset.mem_range.mp hq)]
  · simp [hp]

/-- Pull a source-specific band predicate out of the inner grade sums, once
membership is known to depend only on the grade on the valid index ranges. -/
theorem band_filter_eq (N : ℕ) (a : ℕ → ℕ → ℕ → ℤ) (D : ℚ)
    (member : ℕ → ℕ → ℕ → Prop)
    (pred : ℕ → Prop) [DecidablePred pred]
    (hmember : ∀ q c d, q < N → c < q+2 → d < q+1 →
      (member q c d ↔ pred q))
    [∀ q c d, Decidable (member q c d)] :
    (∑ q ∈ Finset.range N, ∑ c ∈ Finset.range (q + 2),
      ∑ d ∈ Finset.range (q + 1),
        if member q c d then ((a q c d : ℚ) / D)^2 else 0) =
    (∑ q ∈ Finset.range N, if pred q then
      ∑ c ∈ Finset.range (q + 2), ∑ d ∈ Finset.range (q + 1),
        ((a q c d : ℚ) / D)^2 else 0) := by
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hp : pred q
  · simp only [hp, ite_true]
    apply Finset.sum_congr rfl
    intro c hc
    apply Finset.sum_congr rfl
    intro d hd
    have hm := (hmember q c d (Finset.mem_range.mp hq)
      (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)).mpr hp
    simp only [hm, ite_true]
  · simp only [hp, ite_false]
    apply Finset.sum_eq_zero
    intro c hc
    apply Finset.sum_eq_zero
    intro d hd
    have hm : ¬ member q c d := fun hm => hp ((hmember q c d (Finset.mem_range.mp hq)
      (Finset.mem_range.mp hc) (Finset.mem_range.mp hd)).mp hm)
    simp only [hm, ite_false]

#print axioms band_filter_eq
#print axioms total_of_grade_sums
#print axioms band_of_grade_sums
end Grothe.UpperChaos.ThirdEnergyAggregation
