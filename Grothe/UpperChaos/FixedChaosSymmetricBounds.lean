import Grothe.UpperChaos.FixedChaosGradedAction

/-! Entry certificates control the aggregate error of the actual graded
smoothing action. Agent-ID: codex-7c2e -/

open MeasureTheory Finset
open scoped InnerProductSpace Matrix Matrix.Norms.Frobenius

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries
noncomputable section

def holomorphicMode (n : ℕ) (c : Fin (n + 1)) : Idx2 := ((n - c.val, 0), (c.val, 0))

theorem actualEntry_holomorphic (n : ℕ) (c e : Fin (n + 1)) :
    actualEntry (holomorphicMode n c) (holomorphicMode n e) =
      ((symmetricEntry n c e : ℝ) : ℂ) := by
  have hz : normalizedMoment2 (0, 0) (0, 0) = 1 := by
    norm_num [normalizedMoment2, nrm, matrixMoment2]
  simpa only [holomorphicMode, symmetricEntry, hz, mul_one] using
    actualEntry_eq_normalizedMoment2 (holomorphicMode n c) (holomorphicMode n e)

theorem norm_actualEntry_le_one (j i : Idx2) : ‖actualEntry j i‖ ≤ 1 := by
  have h := norm_inner_le_norm (𝕜 := ℂ) (hvec2 j) (smoothOp (hvec2 i))
  have hs := norm_smoothOp_le (hvec2 i)
  rw [orthonormal_hvec2.norm_eq_one i] at hs
  rw [orthonormal_hvec2.norm_eq_one j, one_mul] at h
  exact h.trans hs

theorem norm_symmetricEntry_le_one (n : ℕ) (c e : Fin (n + 1)) :
    ‖symmetricEntry n c e‖ ≤ 1 := by
  have h := norm_actualEntry_le_one (holomorphicMode n c) (holomorphicMode n e)
  simpa only [actualEntry_holomorphic, Complex.norm_real] using h

private theorem matrix_norm_le_of_entry_bounds (n : ℕ)
    (A : Matrix (Fin n) (Fin n) ℝ) (δ : ℝ) (hδ : 0 ≤ δ)
    (hA : ∀ c e, ‖A c e‖ ≤ δ) : ‖A‖ ≤ (n : ℝ) * δ := by
  rw [Matrix.frobenius_norm_def, ← Real.sqrt_eq_rpow]
  simp only [Real.rpow_two]
  apply Real.sqrt_le_iff.mpr
  refine ⟨by positivity, ?_⟩
  calc
    _ ≤ ∑ _c : Fin n, ∑ _e : Fin n, δ ^ 2 := by
      apply Finset.sum_le_sum
      intro c _
      apply Finset.sum_le_sum
      intro e _
      exact pow_le_pow_left₀ (norm_nonneg _) (hA c e) 2
    _ = _ := by simp; ring

theorem norm_symmetricMatrix_le (n : ℕ) :
    ‖symmetricMatrix n‖ ≤ (n + 1 : ℝ) := by
  have h := matrix_norm_le_of_entry_bounds (n + 1) (symmetricMatrix n) 1
    (by norm_num) (norm_symmetricEntry_le_one n)
  simpa using h

theorem symmetricMatrix_error_le (n : ℕ)
    (S : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) (δ : ℝ) (hδ : 0 ≤ δ)
    (hS : ∀ c e, ‖symmetricEntry n c e - S c e‖ ≤ δ) :
    ‖symmetricMatrix n - S‖ ≤ (n + 1 : ℝ) * δ := by
  have h := matrix_norm_le_of_entry_bounds (n + 1) (symmetricMatrix n - S) δ hδ hS
  simpa using h

/-- Uniform entry errors compose into one relative grade error, without a
four-index matrix certificate or an unproved symmetric-power norm premise. -/
theorem actualGradeMatrix_error_of_entries (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q : Fin N)
    (S : Matrix (Fin (q.val + 2)) (Fin (q.val + 2)) ℝ)
    (T : Matrix (Fin (q.val + 1)) (Fin (q.val + 1)) ℝ)
    (δl δr : ℝ) (hl0 : 0 ≤ δl) (hr0 : 0 ≤ δr)
    (hl : ∀ c e, ‖symmetricEntry (q.val + 1) c e - S c e‖ ≤ δl)
    (hr : ∀ c e, ‖symmetricEntry q.val c e - T c e‖ ≤ δr) :
    ‖actualGradeMatrix N a q - (S * gradeCoefficientMatrix q a) * Tᵀ‖ ≤
      ((q.val + 2 : ℝ) * (q.val + 1 : ℝ) * (δl + δr + δl * δr)) *
        ‖gradeCoefficientMatrix q a‖ := by
  have hdl := symmetricMatrix_error_le (q.val + 1) S δl hl0 hl
  have hdr := symmetricMatrix_error_le q.val T δr hr0 hr
  have hml := norm_symmetricMatrix_le (q.val + 1)
  have hmr := norm_symmetricMatrix_le q.val
  have hS : ‖S‖ ≤ (q.val + 2 : ℝ) * (1 + δl) := by
    have ht := norm_sub_le (symmetricMatrix (q.val + 1))
      (symmetricMatrix (q.val + 1) - S)
    rw [sub_sub_cancel] at ht
    push_cast at hdl hml
    nlinarith
  have hT : ‖(symmetricMatrix q.val)ᵀ - Tᵀ‖ ≤ (q.val + 1 : ℝ) * δr := by
    simpa only [← Matrix.transpose_sub, Matrix.frobenius_norm_transpose] using hdr
  rw [actualGradeMatrix_eq, smoothedGradeMatrix]
  have h := BandedContraction.frobenius_two_sided_of_caps
    (symmetricMatrix (q.val + 1)) S (gradeCoefficientMatrix q a)
    (symmetricMatrix q.val)ᵀ Tᵀ
    ((q.val + 2 : ℝ) * δl) ((q.val + 1 : ℝ) * δr)
    ((q.val + 2 : ℝ) * (1 + δl)) (q.val + 1 : ℝ)
    ‖gradeCoefficientMatrix q a‖
    (by positivity) (by positivity) (by positivity) (by positivity) (norm_nonneg _)
    (by convert hdl using 1; push_cast; ring) hT hS
    (by simpa only [Matrix.frobenius_norm_transpose] using hmr) le_rfl
  convert h using 1
  ring

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualGradeMatrix_error_of_entries' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualGradeMatrix_error_of_entries
