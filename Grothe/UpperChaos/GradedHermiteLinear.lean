import Grothe.UpperChaos.GradedHermite

/-! Canonical coefficient linearity and zero extension. Agent-ID: codex-2ca4. -/
open MeasureTheory
open scoped InnerProductSpace
namespace Grothe.UpperChaos
noncomputable section

theorem gradedHermite_extend (N M : ℕ) (hNM : N ≤ M) (a : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite N a = gradedHermite M (fun q c d => if q < N then a q c d else 0) := by
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_hvec2_gradedHermite]
  by_cases hc : i.1.1 + i.2.1 = i.1.2 + i.2.2 + 1
  · by_cases hn : i.1.2 + i.2.2 < N
    · have hm : i.1.2 + i.2.2 < M := lt_of_lt_of_le hn hNM
      simp [hc, hn, hm]
    · simp [hc, hn]
  · simp [hc]

theorem gradedHermite_add (N : ℕ) (a b : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite N (fun q c d => a q c d + b q c d) =
      gradedHermite N a + gradedHermite N b := by
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_add_right, inner_hvec2_gradedHermite, Rat.cast_add]
  split_ifs <;> simp

theorem gradedHermite_sub (N : ℕ) (a b : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite N (fun q c d => a q c d - b q c d) =
      gradedHermite N a - gradedHermite N b := by
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_sub_right, inner_hvec2_gradedHermite, Rat.cast_sub]
  split_ifs <;> simp

theorem gradedHermite_rat_mul (N : ℕ) (r : ℚ) (a : ℕ → ℕ → ℕ → ℚ) :
    gradedHermite N (fun q c d => r * a q c d) = (r : ℂ) • gradedHermite N a := by
  apply eq_of_inner_hvec2
  intro i
  simp only [inner_smul_right, inner_hvec2_gradedHermite, Rat.cast_mul]
  split_ifs <;> simp

end
end Grothe.UpperChaos
