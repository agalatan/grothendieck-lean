import Grothe.UpperChaos.Q0LegendreRuleBase

/-! Generated original 640-bit root bracket checks.
Gaussian quadrature and weight semantics remain separate.
Agent-ID: codex-aa04. -/
namespace Grothe.UpperChaos.Q0LegendreRule01

open Grothe.UpperChaos.Q0LegendreInteger Grothe.UpperChaos.Q0LegendreRuleBase

theorem sign00_lower : (integerPair (-1 : ℤ) denominator 0).2 < 0 := by decide +kernel
theorem sign00_upper : 0 < (integerPair (2 : ℤ) denominator 0).2 := by decide +kernel
theorem root00 :
    ∃ x ∈ Set.Icc (((-1 : ℤ) : ℝ) / denominator) (((2 : ℤ) : ℝ) / denominator),
      (realPair x 0).2 = 0 := by
  apply root_of_integer_endpoint_signs (-1 : ℤ) (2 : ℤ) denominator
  · exact denominator_pos
  · norm_num
  · exact Or.inl ⟨le_of_lt sign00_lower, le_of_lt sign00_upper⟩

def brackets : List (ℤ × ℤ) := [
  (-1, 2)
]

theorem count : brackets.length = 1 := by decide +kernel
theorem bounded : brackets.all (fun p => decide (-denominator < p.1 ∧ p.1 < p.2 ∧ p.2 < denominator)) = true := by
  decide +kernel
theorem ordered : brackets.Pairwise (fun a b => a.2 < b.1) := by decide +kernel

theorem exists_each (i : Fin brackets.length) :
    ∃ x ∈ Set.Icc (((brackets.get i).1 : ℝ) / denominator) (((brackets.get i).2 : ℝ) / denominator), (realPair x 0).2 = 0 := by
  fin_cases i
  · simpa [brackets] using root00

def bracketAt (i : Fin 1) : ℤ × ℤ :=
  brackets.get ⟨i.val, by simpa only [count] using i.isLt⟩

theorem all_unique : ∃ root : Fin 1 → ℝ,
    (∀ i, root i ∈ Set.Icc (((bracketAt i).1 : ℝ) / denominator) (((bracketAt i).2 : ℝ) / denominator) ∧ (realPair (root i) 0).2 = 0) ∧
    (∀ i x, x ∈ Set.Icc (((bracketAt i).1 : ℝ) / denominator) (((bracketAt i).2 : ℝ) / denominator) → (realPair x 0).2 = 0 → x = root i) := by
  exact select_from_ordered_brackets 0 brackets count denominator denominator_pos ordered exists_each

end Grothe.UpperChaos.Q0LegendreRule01
