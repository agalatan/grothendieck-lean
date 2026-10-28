import Grothe.UpperChaos.FixedChaosSymmetricPower
import Grothe.UpperChaos.BandedContraction

/-! The two-sided symmetric-power action is the actual smoothed finite
Hermite approximant. Agent-ID: codex-7c2e -/

open MeasureTheory Finset
open scoped InnerProductSpace Matrix Matrix.Norms.Frobenius

namespace Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries
noncomputable section

theorem tdeg_gradedMode (q : ℕ) (c : Fin (q + 2)) (d : Fin (q + 1)) :
    tdeg (gradedMode q c d) = 2 * q + 1 := by
  have hc := c.isLt
  have hd := d.isLt
  simp only [tdeg, gradedMode]
  omega

private theorem inner_smooth_gradedHermite_sum (j : Idx2) (N : ℕ)
    (a : ℕ → ℕ → ℕ → ℚ) :
    ⟪hvec2 j, smoothOp (gradedHermite N a)⟫_ℂ =
      ∑ q : Fin N, ∑ c : Fin (q.val + 2), ∑ d : Fin (q.val + 1),
        (gradedHermiteCoeff a (gradedMode q c d) : ℂ) *
          actualEntry j (gradedMode q c d) := by
  rw [gradedHermite, hermiteFinite, map_sum, inner_sum]
  simp only [map_smul, inner_smul_right]
  exact sum_gradedSupport N (fun i => (gradedHermiteCoeff a i : ℂ) * actualEntry j i)

/-- Degree preservation removes every other grade before any numerical work. -/
theorem inner_smooth_gradedHermite_grade (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (q : Fin N) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    ⟪hvec2 (gradedMode q c d), smoothOp (gradedHermite N a)⟫_ℂ =
      ∑ e : Fin (q.val + 2), ∑ f : Fin (q.val + 1),
        (a q e f : ℂ) * actualEntry (gradedMode q c d) (gradedMode q e f) := by
  rw [inner_smooth_gradedHermite_sum, Finset.sum_eq_single q]
  · apply Finset.sum_congr rfl
    intro e _
    apply Finset.sum_congr rfl
    intro f _
    have hc : gradedHermiteCoeff a (gradedMode q e f) = a q e f :=
      gradedHermiteCoeff_gradedIdx a ⟨q, e, f⟩
    rw [hc]
  · intro r _ hr
    apply Finset.sum_eq_zero
    intro e _
    apply Finset.sum_eq_zero
    intro f _
    have hqr : (r : ℕ) ≠ (q : ℕ) := fun he => hr (Fin.ext he)
    have hdeg : tdeg (gradedMode r e f) ≠ tdeg (gradedMode q c d) := by
      rw [tdeg_gradedMode, tdeg_gradedMode]
      omega
    rw [actualEntry, inner_smoothOp_hvec2_eq_zero hdeg, mul_zero]
  · simp

def gradeCoefficientMatrix (q : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Matrix (Fin (q + 2)) (Fin (q + 1)) ℝ := fun c d => (a q c d : ℝ)

def symmetricMatrix (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  symmetricEntry n

def smoothedGradeMatrix (q : ℕ) (a : ℕ → ℕ → ℕ → ℚ) :
    Matrix (Fin (q + 2)) (Fin (q + 1)) ℝ :=
  (symmetricMatrix (q + 1) * gradeCoefficientMatrix q a) * (symmetricMatrix q)ᵀ

/-- Exact normalized matrix multiplication for every grade of a real rational
finite Hermite approximant, bound to the actual smoothing operator. -/
theorem inner_smooth_gradedHermite_eq_matrix (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ)
    (q : Fin N) (c : Fin (q.val + 2)) (d : Fin (q.val + 1)) :
    ⟪hvec2 (gradedMode q c d), smoothOp (gradedHermite N a)⟫_ℂ =
      ((smoothedGradeMatrix q a c d : ℝ) : ℂ) := by
  have hcastq (r : ℚ) : ((r : ℝ) : ℂ) = (r : ℂ) :=
    map_ratCast Complex.ofRealHom r
  rw [inner_smooth_gradedHermite_grade]
  simp_rw [actualEntry_gradedMode]
  simp only [smoothedGradeMatrix, Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_mul]
  simp only [symmetricMatrix, gradeCoefficientMatrix, Complex.ofReal_sum,
    Complex.ofReal_mul, hcastq]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro f _
  apply Finset.sum_congr rfl
  intro e _
  ring

def actualGradeMatrix (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q : Fin N) :
    Matrix (Fin (q.val + 2)) (Fin (q.val + 1)) ℝ := fun c d =>
  Complex.re ⟪hvec2 (gradedMode q c d), smoothOp (gradedHermite N a)⟫_ℂ

theorem actualGradeMatrix_eq (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q : Fin N) :
    actualGradeMatrix N a q = smoothedGradeMatrix q a := by
  ext c d
  simp only [actualGradeMatrix, inner_smooth_gradedHermite_eq_matrix, Complex.ofReal_re]

/-- The existing aggregate contraction estimate now applies to the actual
smoothed coefficients, without a numerical matrix-identification premise. -/
theorem actualGradeMatrix_approx_error (N : ℕ) (a : ℕ → ℕ → ℕ → ℚ) (q : Fin N)
    (S : Matrix (Fin (q.val + 2)) (Fin (q.val + 2)) ℝ)
    (T : Matrix (Fin (q.val + 1)) (Fin (q.val + 1)) ℝ) :
    ‖actualGradeMatrix N a q - (S * gradeCoefficientMatrix q a) * T‖ ≤
      (‖symmetricMatrix (q.val + 1) - S‖ * ‖gradeCoefficientMatrix q a‖) *
        ‖(symmetricMatrix q.val)ᵀ‖ +
      (‖S‖ * ‖gradeCoefficientMatrix q a‖) * ‖(symmetricMatrix q.val)ᵀ - T‖ := by
  rw [actualGradeMatrix_eq, smoothedGradeMatrix]
  exact BandedContraction.frobenius_two_sided _ _ _ _ _

end
end Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries

/-- info: 'Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualGradeMatrix_approx_error' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs (whitespace := lax) in
#print axioms Grothe.UpperChaos.FixedChaosSmoothing.PolynomialEntries.actualGradeMatrix_approx_error
