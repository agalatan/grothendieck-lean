import Grothe.UpperChaos.ProductionSmoothingRounding

/-! Aggregate L² accuracy of the computable production smoothing matrices.
Agent-ID: codex-7c2e -/

open MeasureTheory Finset
open scoped InnerProductSpace Matrix Matrix.Norms.Frobenius

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

def productionSavedMatrixQ (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℚ :=
  productionSavedEntryQ n

def gradeCoefficientMatrixQ (q : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Matrix (Fin (q + 2)) (Fin (q + 1)) ℚ := fun c d => a q c d

def productionSmoothedCoeff (a : ℕ → ℕ → ℕ → ℚ) (q c d : ℕ) : ℚ :=
  if hc : c < q + 2 then
    if hd : d < q + 1 then
      ((productionSavedMatrixQ (q + 1) * gradeCoefficientMatrixQ q a) *
        (productionSavedMatrixQ q)ᵀ) ⟨c, hc⟩ ⟨d, hd⟩
    else 0
  else 0

noncomputable section

theorem gradeCoefficientMatrix_productionSmoothed (q : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    gradeCoefficientMatrix q (productionSmoothedCoeff a) =
      (productionSavedMatrix (q + 1) * gradeCoefficientMatrix q a) *
        (productionSavedMatrix q)ᵀ := by
  ext c d
  change (productionSmoothedCoeff a q c d : ℝ) = _
  rw [productionSmoothedCoeff, dite_eq_left c.isLt, dite_eq_left d.isLt]
  simp only [Matrix.mul_apply, Matrix.transpose_apply]
  simp only [Rat.cast_sum, Rat.cast_mul, productionSavedMatrixQ, productionSavedMatrix,
    gradeCoefficientMatrixQ, gradeCoefficientMatrix]

private theorem actualEntry_eq_zero_of_off_support (N : ℕ) (j i : Idx2)
    (hi : i ∈ gradedSupport N) (hj : j ∉ gradedSupport N) : actualEntry j i = 0 := by
  have hi' := mem_gradedSupport_iff.mp hi
  by_cases hh : j.1.1 + j.2.1 = i.1.1 + i.2.1
  · have ha : j.1.2 + j.2.2 ≠ i.1.2 + i.2.2 := by
      intro ha
      apply hj
      apply mem_gradedSupport_iff.mpr
      constructor <;> omega
    rw [actualEntry_eq_real_recurrence, matrixRecurrence_eq_matrixMoment2,
      matrixMoment2_eq_sum m00 m01 m11 j.1.2 j.2.2 i.1.2 i.2.2]
    simp only [matrixMoment2Sum, ite_eq_right ha, mul_zero, Complex.ofReal_zero]
  · rw [actualEntry_eq_real_recurrence, matrixRecurrence_eq_matrixMoment2,
      matrixMoment2_eq_sum m00 m01 m11 j.1.1 j.2.1 i.1.1 i.2.1]
    simp only [matrixMoment2Sum, ite_eq_right hh, zero_mul, mul_zero, Complex.ofReal_zero]

theorem inner_smooth_gradedHermite_off_support (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (j : Idx2) (hj : j ∉ gradedSupport N) :
    ⟪hvec2 j, smoothOp (gradedHermite N a)⟫_ℂ = 0 := by
  rw [gradedHermite, hermiteFinite, map_sum, inner_sum]
  apply Finset.sum_eq_zero
  intro i hi
  simp only [map_smul, inner_smul_right]
  change (gradedHermiteCoeff a i : ℂ) * actualEntry j i = 0
  rw [actualEntry_eq_zero_of_off_support N j i hi hj, mul_zero]

private theorem inner_gradedMode_gradedHermite (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (q : Fin N) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    ⟪hvec2 (gradedMode q c d), gradedHermite N a⟫_ℂ = (a q c d : ℂ) := by
  have hi : gradedMode q c d ∈ gradedSupport N :=
    Finset.mem_map.mpr ⟨(⟨q, c, d⟩ : GradedIdx N), Finset.mem_univ _, rfl⟩
  rw [gradedHermite, inner_hvec2_hermiteFinite, ite_eq_left hi]
  exact congrArg (fun r : ℚ => (r : ℂ))
    (gradedHermiteCoeff_gradedIdx a (⟨q, c, d⟩ : GradedIdx N))

private theorem frobenius_norm_sq {m n : Type*} [Fintype m] [Fintype n]
    (A : Matrix m n ℝ) : ‖A‖ ^ 2 = ∑ c, ∑ d, (A c d) ^ 2 := by
  rw [Matrix.frobenius_norm_def, ← Real.sqrt_eq_rpow, Real.sq_sqrt (by positivity)]
  simp only [Real.rpow_two, Real.norm_eq_abs, sq_abs]

/-- Parseval reduces the full error, including all supported grades, to the
Frobenius errors of the actual coefficient matrices. -/
theorem norm_smooth_gradedHermite_sub_sq (N : ℕ) (a b : ℕ → ℕ → ℕ → ℚ) :
    ‖smoothOp (gradedHermite N a) - gradedHermite N b‖ ^ 2 =
      ∑ q : Fin N, ‖actualGradeMatrix N a q - gradeCoefficientMatrix q b‖ ^ 2 := by
  let Z := smoothOp (gradedHermite N a) - gradedHermite N b
  have hz (i : Idx2) (hi : i ∉ gradedSupport N) : ⟪hvec2 i, Z⟫_ℂ = 0 := by
    dsimp only [Z]
    rw [inner_sub_right, inner_smooth_gradedHermite_off_support N a i hi]
    simp only [gradedHermite, inner_hvec2_hermiteFinite, ite_eq_right hi, sub_self]
  calc
    _ = ∑ i ∈ gradedSupport N, ‖⟪hvec2 i, Z⟫_ℂ‖ ^ 2 := by
      exact (hasSum_energy2 Z).tsum_eq.symm.trans
        (tsum_eq_sum (fun i hi => by rw [hz i hi, norm_zero, zero_pow (by decide)]))
    _ = _ := by
      rw [sum_gradedSupport]
      apply Finset.sum_congr rfl
      intro q _
      rw [frobenius_norm_sq]
      apply Finset.sum_congr rfl
      intro c _
      apply Finset.sum_congr rfl
      intro d _
      have hcast (r : ℚ) : ((r : ℝ) : ℂ) = (r : ℂ) := map_ratCast Complex.ofRealHom r
      simp only [Z, inner_sub_right, inner_smooth_gradedHermite_eq_matrix,
        inner_gradedMode_gradedHermite, actualGradeMatrix_eq, Matrix.sub_apply,
        gradeCoefficientMatrix, ← hcast, ← Complex.ofReal_sub, Complex.norm_real,
        Real.norm_eq_abs, sq_abs]

theorem norm_gradedHermite_eq_sum_grade_sq (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    ‖gradedHermite N a‖ ^ 2 = ∑ q : Fin N, ‖gradeCoefficientMatrix q a‖ ^ 2 := by
  rw [gradedHermite, norm_hermiteFinite_sq, sum_gradedSupport]
  apply Finset.sum_congr rfl
  intro q _
  rw [frobenius_norm_sq]
  apply Finset.sum_congr rfl
  intro c _
  apply Finset.sum_congr rfl
  intro d _
  rw [show gradedHermiteCoeff a (gradedMode q c d) = a q c d from
    gradedHermiteCoeff_gradedIdx a (⟨q, c, d⟩ : GradedIdx N)]
  rfl

/-- A concrete relative L² error for the entire smoothed finite response.
The error is not multiplied by the number of grades or coefficients. -/
theorem production_smoothing_error (N : ℕ) (hN : N ≤ 251)
    (a : ℕ → ℕ → ℕ → ℚ) :
    ‖smoothOp (gradedHermite N a) - gradedHermite N (productionSmoothedCoeff a)‖ ≤
      (4 / 1000000000000000 : ℝ) * ‖gradedHermite N a‖ := by
  have h := BandedContraction.sum_sq_error_of_block_ratios
    (Finset.univ : Finset (Fin N))
    (fun q => ‖actualGradeMatrix N a q - gradeCoefficientMatrix q (productionSmoothedCoeff a)‖)
    (fun q => ‖gradeCoefficientMatrix q a‖) (4 / 1000000000000000 : ℝ)
    (by norm_num) (fun _ _ => norm_nonneg _) (fun _ _ => norm_nonneg _) (by
      intro q _
      rw [gradeCoefficientMatrix_productionSmoothed]
      exact production_grade_error N a q (by omega))
  rw [← norm_smooth_gradedHermite_sub_sq, ← norm_gradedHermite_eq_sum_grade_sq] at h
  nlinarith [norm_nonneg (smoothOp (gradedHermite N a) -
    gradedHermite N (productionSmoothedCoeff a)), norm_nonneg (gradedHermite N a)]

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_smoothing_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.production_smoothing_error
