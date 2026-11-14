import Grothe.UpperQuad.TwistFactorAnalytic
import Grothe.UpperQuad.PolynomialDilationNorm

/-!
# The finite matrix coefficients of the twisted source

The normalized source polynomial is rescaled by the positive Gaussian rate. Its Hermite
coefficients, with the index swap dictated by conjugation, give an entire matrix coefficient
family. The inverse Gaussian rate and the radial Gaussian factor occur exactly once.

Agent-ID: codex-f3dd. Refs #342.
-/

set_option warningAsError true

namespace Grothe.UpperQuad.TwistFactorization

open MvPolynomial Grothe.UpperChaos PolynomialHermite PolynomialRescale

noncomputable section

/-- The Gaussian rate after the Taylor power `j` introduces its radial damping. -/
def rate (j : ℕ) : ℝ := 1 + j * (Grothe.Upper.phaseEpsQ : ℝ)

lemma rate_pos (j : ℕ) : 0 < rate j := by
  have hε : 0 ≤ (Grothe.Upper.phaseEpsQ : ℝ) := by norm_num [Grothe.Upper.phaseEpsQ]
  unfold rate
  positivity

lemma one_le_rate (j : ℕ) : 1 ≤ rate j :=
  le_add_of_nonneg_right (mul_nonneg (Nat.cast_nonneg j) (by norm_num [Grothe.Upper.phaseEpsQ]))

/-- The degree bound before the change of Gaussian scale. -/
theorem totalDegree_normalized_source_le (j : ℕ) (r : ℂ) (c d : ℕ) :
    (((nrm c d : ℂ) • (H d c * TwistFactorPolynomial.Q r ^ j)) : CPoly).totalDegree ≤
      c + d + 35 * j := by
  apply (totalDegree_smul_le _ _).trans
  calc
    (H d c * TwistFactorPolynomial.Q r ^ j).totalDegree ≤
        (H d c).totalDegree + (TwistFactorPolynomial.Q r ^ j).totalDegree :=
      totalDegree_mul _ _
    _ ≤ (d + c) + 35 * j :=
      Nat.add_le_add (PolynomialDilationNorm.totalDegree_H_le d c)
        (TwistFactorPolynomial.totalDegree_Q_pow_le j r)
    _ = c + d + 35 * j := by omega

/-- The normalized auxiliary polynomial after the Gaussian change of scale. -/
def sourcePolynomial (j : ℕ) (r : ℂ) (c d : ℕ) : CPoly :=
  (nrm c d : ℂ) •
    rescale (Real.sqrt (rate j)) (H d c * TwistFactorPolynomial.Q r ^ j)

/-- Rescaling the raw normalized source gives exactly `sourcePolynomial`. -/
theorem rescale_normalized_source (j : ℕ) (r : ℂ) (c d : ℕ) :
    rescale (Real.sqrt (rate j))
      ((nrm c d : ℂ) • (H d c * TwistFactorPolynomial.Q r ^ j)) =
        sourcePolynomial j r c d := by
  change TwistFactorAnalytic.rescaleLinear (Real.sqrt (rate j))
    ((nrm c d : ℂ) • (H d c * TwistFactorPolynomial.Q r ^ j)) = _
  rw [map_smul]
  rfl

/-- Gaussian rescaling preserves the finite degree support of the normalized source. -/
theorem totalDegree_sourcePolynomial_le (j : ℕ) (r : ℂ) (c d : ℕ) :
    (sourcePolynomial j r c d).totalDegree ≤ c + d + 35 * j := by
  rw [← rescale_normalized_source]
  exact (totalDegree_rescale_le _ _).trans (totalDegree_normalized_source_le j r c d)

/-- The finite factorization coefficient, with its Jacobian and radial Gaussian prefactor. -/
def matrixCoefficient (j : ℕ) (r : ℂ) (c d g h : ℕ) : ℂ :=
  (rate j : ℂ)⁻¹ * Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2) *
    hermiteCoeff (sourcePolynomial j r c d) (h, g)

/-- Every matrix coefficient is complex analytic in the radial parameter. -/
theorem analyticAt_matrixCoefficient (j c d g h : ℕ) (r : ℂ) :
    AnalyticAt ℂ (fun z ↦ matrixCoefficient j z c d g h) r := by
  have hcoef := TwistFactorAnalytic.analyticAt_hermiteCoeff_smul_rescale_mul_Q_pow
    (nrm c d : ℂ) (Real.sqrt (rate j)) (H d c) j (h, g) r
  have hscalar : AnalyticAt ℂ
      (fun z : ℂ ↦ (rate j : ℂ)⁻¹ *
        Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * z ^ 2)) r := by
    fun_prop
  exact hscalar.mul hcoef

/-- The finite factorization coefficients are entire functions of the radial parameter. -/
theorem differentiable_matrixCoefficient (j c d g h : ℕ) :
    Differentiable ℂ (fun r ↦ matrixCoefficient j r c d g h) :=
  fun r ↦ (analyticAt_matrixCoefficient j c d g h r).differentiableAt

/-- Coefficients outside the source degree triangle vanish exactly. -/
theorem matrixCoefficient_eq_zero_of_degree_lt (j : ℕ) (r : ℂ) (c d g h : ℕ)
    (hdegree : c + d + 35 * j < g + h) : matrixCoefficient j r c d g h = 0 := by
  have hzero := hermiteCoeff_eq_zero_of_degree_lt (sourcePolynomial j r c d)
    (totalDegree_sourcePolynomial_le j r c d) (h, g) (by omega)
  simp only [matrixCoefficient, hzero, mul_zero]

/-- The finite coefficient row has the exact rescaled-polynomial norm. -/
theorem sum_norm_matrixCoefficient_sq (j : ℕ) (r : ℂ) (c d : ℕ) :
    ∑ pq ∈ indices (c + d + 35 * j), ‖matrixCoefficient j r c d pq.1 pq.2‖ ^ 2 =
      ‖(rate j : ℂ)⁻¹ *
        Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2)‖ ^ 2 *
          ‖polynomialLp (sourcePolynomial j r c d)‖ ^ 2 := by
  classical
  have hswap :
      (∑ pq ∈ indices (c + d + 35 * j),
        ‖hermiteCoeff (sourcePolynomial j r c d) (pq.2, pq.1)‖ ^ 2) =
      ∑ pq ∈ indices (c + d + 35 * j),
        ‖hermiteCoeff (sourcePolynomial j r c d) pq‖ ^ 2 := by
    refine Finset.sum_equiv (Equiv.prodComm ℕ ℕ) ?_ ?_
    · rintro ⟨g, h⟩
      change (g, h) ∈ indices (c + d + 35 * j) ↔ (h, g) ∈ indices (c + d + 35 * j)
      simp only [mem_indices]
      omega
    · exact fun _ _ ↦ rfl
  have hterm (pq : ℕ × ℕ) :
      ‖matrixCoefficient j r c d pq.1 pq.2‖ ^ 2 =
        ‖(rate j : ℂ)⁻¹ *
          Complex.exp (-(j : ℂ) * (Grothe.Upper.phaseEpsQ : ℂ) * r ^ 2)‖ ^ 2 *
            ‖hermiteCoeff (sourcePolynomial j r c d) (pq.2, pq.1)‖ ^ 2 := by
    rw [matrixCoefficient, norm_mul, mul_pow]
  simp_rw [hterm]
  rw [← Finset.mul_sum, hswap,
    sum_norm_hermiteCoeff_sq _ (totalDegree_sourcePolynomial_le j r c d)]

end

end Grothe.UpperQuad.TwistFactorization
