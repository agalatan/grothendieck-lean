import Grothe.HJM.OriginUnweightedWitnessMass

/-!
# Approximation error for unweighted finite witness tests

The actual response approximation and exact 64-mode witness mass bound the
joint correlation error. Moment and endpoint bounds remain separate inputs.
-/

open MeasureTheory Finset Grothe.LowerAnalytic
open scoped ComplexConjugate InnerProductSpace

namespace Grothe.HJM.Origin

noncomputable section

/-- The finite test lives in the original normalized charge-one basis. -/
def unweightedTestVector (x : ℕ → ℂ) (N : ℕ) : Lp ℂ 2 gaussC :=
  ∑ n ∈ range N, x n • chargeOneMode n

/-- Its squared Hilbert norm is exactly its finite test mass. -/
theorem unweightedTestVector_norm_sq (x : ℕ → ℂ) (N : ℕ) :
    ‖unweightedTestVector x N‖ ^ 2 = unweightedTestMass x N := by
  rw [unweightedTestVector, @InnerProductSpace.norm_sq_eq_re_inner ℂ]
  rw [show (inner ℂ (∑ n ∈ range N, x n • chargeOneMode n)
      (∑ n ∈ range N, x n • chargeOneMode n)) =
      ∑ n ∈ range N, conj (x n) * x n from
        orthonormal_chargeOneMode.inner_sum x x (range N)]
  simp [unweightedTestMass, Complex.sq_norm, Complex.normSq_apply]

/-- Conjugate linearity on the first argument matches the signed test. -/
theorem unweightedTestCorrelation_eq_inner (x : ℕ → ℂ)
    (R : Lp ℂ 2 gaussC) (N : ℕ) :
    unweightedTestCorrelation x R N = ⟪unweightedTestVector x N, R⟫_ℂ := by
  simp only [unweightedTestVector, sum_inner, inner_smul_left,
    chargeOneCoeff, unweightedTestCorrelation]

/-- The common endpoint subtraction cancels before applying Cauchy--Schwarz.
This controls all finite test modes jointly, with no modewise error sum. -/
theorem unweightedTestCorrelation_error (x : ℕ → ℂ)
    (F V U : Lp ℂ 2 gaussC) (N : ℕ) (δ : ℝ) (hclose : ‖F - V‖ ≤ δ) :
    |(unweightedTestCorrelation x (F - U) N).re -
      (unweightedTestCorrelation x (V - U) N).re| ≤ ‖unweightedTestVector x N‖ * δ := by
  rw [unweightedTestCorrelation_eq_inner, unweightedTestCorrelation_eq_inner]
  have he : ⟪unweightedTestVector x N, F - U⟫_ℂ -
      ⟪unweightedTestVector x N, V - U⟫_ℂ =
      ⟪unweightedTestVector x N, F - V⟫_ℂ := by
    simp only [inner_sub_right]
    ring
  rw [← Complex.sub_re, he]
  exact (Complex.abs_re_le_norm _).trans
    ((norm_inner_le_norm _ _).trans
      (mul_le_mul_of_nonneg_left hclose (norm_nonneg _)))

/-- If the test mass is at most one, the full correlation error is at most
the actual shared L² response error. -/
theorem unweightedTestCorrelation_error_of_mass_le_one (x : ℕ → ℂ)
    (F V U : Lp ℂ 2 gaussC) (N : ℕ) (δ : ℝ)
    (hmass : unweightedTestMass x N ≤ 1) (hclose : ‖F - V‖ ≤ δ) :
    |(unweightedTestCorrelation x (F - U) N).re -
      (unweightedTestCorrelation x (V - U) N).re| ≤ δ := by
  have hn : ‖unweightedTestVector x N‖ ≤ 1 := by
    have hsq : ‖unweightedTestVector x N‖ ^ 2 ≤ (1 : ℝ) := by
      rwa [unweightedTestVector_norm_sq]
    nlinarith [norm_nonneg (unweightedTestVector x N)]
  have hδ : 0 ≤ δ := (norm_nonneg (F - V)).trans hclose
  exact (unweightedTestCorrelation_error x F V U N δ hclose).trans
    (by simpa only [one_mul] using mul_le_mul_of_nonneg_right hn hδ)

/-- Actual left 64-mode witness: the accepted mass certificate prices the
whole spatial error by the same response-error allowance. -/
theorem left_unweighted_corr64_error :
    |(unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.leftAlpha)
      fResidualLp 64).re -
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.leftAlpha)
        (OriginPanels.leftApproxLp - f 0 • Grothe.Haag.phaseLp) 64).re| ≤
      (OriginPanels.responseError : ℝ) := by
  have hmass : unweightedTestMass (unweightedRationalTest OriginWitnessData.leftAlpha) 64 ≤ 1 :=
    leftUnweightedWitness_mass.trans (by norm_num)
  simpa only [fResidualLp_eq_sub] using
    unweightedTestCorrelation_error_of_mass_le_one
      (unweightedRationalTest OriginWitnessData.leftAlpha) FLp OriginPanels.leftApproxLp
      (f 0 • Grothe.Haag.phaseLp) 64 OriginPanels.responseError hmass
      OriginPanels.leftApprox_norm_error

/-- Actual right 64-mode witness, with its own exact mass certificate. -/
theorem right_unweighted_corr64_error :
    |(unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.rightAlpha)
      gResidualLp 64).re -
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.rightAlpha)
        (OriginPanels.rightApproxLp - g 0 • Grothe.Haag.phaseLp) 64).re| ≤
      (OriginPanels.responseError : ℝ) := by
  have hmass : unweightedTestMass (unweightedRationalTest OriginWitnessData.rightAlpha) 64 ≤ 1 :=
    rightUnweightedWitness_mass.trans (by norm_num)
  simpa only [gResidualLp_eq_sub] using
    unweightedTestCorrelation_error_of_mass_le_one
      (unweightedRationalTest OriginWitnessData.rightAlpha) GLp OriginPanels.rightApproxLp
      (g 0 • Grothe.Haag.phaseLp) 64 OriginPanels.responseError hmass
      OriginPanels.rightApprox_norm_error

/-- Subtracting the phase term preserves its sign exactly. -/
theorem unweightedTestCorrelation_sub_phase (x : ℕ → ℂ)
    (V : Lp ℂ 2 gaussC) (u : ℂ) (N : ℕ) :
    unweightedTestCorrelation x (V - u • Grothe.Haag.phaseLp) N =
      unweightedTestCorrelation x V N - u *
        unweightedTestCorrelation x Grothe.Haag.phaseLp N := by
  simp only [unweightedTestCorrelation_eq_inner, inner_sub_right, inner_smul_right]

/-- A lower approximant correlation and a signed upper endpoint bound transfer
to the actual left residual correlation. E may be negative. -/
theorem left_unweighted_corr64_of_approx_and_endpoint (A E C : ℝ)
    (happrox : A ≤ (unweightedTestCorrelation
      (unweightedRationalTest OriginWitnessData.leftAlpha) OriginPanels.leftApproxLp 64).re)
    (hendpoint : (f 0 * unweightedTestCorrelation
      (unweightedRationalTest OriginWitnessData.leftAlpha) Grothe.Haag.phaseLp 64).re ≤ E)
    (harith : C + E + (OriginPanels.responseError : ℝ) ≤ A) :
    C ≤ (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.leftAlpha)
      fResidualLp 64).re := by
  have h := (abs_le.mp left_unweighted_corr64_error).1
  rw [unweightedTestCorrelation_sub_phase, Complex.sub_re] at h
  linarith

/-- Right analogue with the actual right phase and response. -/
theorem right_unweighted_corr64_of_approx_and_endpoint (A E C : ℝ)
    (happrox : A ≤ (unweightedTestCorrelation
      (unweightedRationalTest OriginWitnessData.rightAlpha) OriginPanels.rightApproxLp 64).re)
    (hendpoint : (g 0 * unweightedTestCorrelation
      (unweightedRationalTest OriginWitnessData.rightAlpha) Grothe.Haag.phaseLp 64).re ≤ E)
    (harith : C + E + (OriginPanels.responseError : ℝ) ≤ A) :
    C ≤ (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.rightAlpha)
      gResidualLp 64).re := by
  have h := (abs_le.mp right_unweighted_corr64_error).1
  rw [unweightedTestCorrelation_sub_phase, Complex.sub_re] at h
  linarith

end
end Grothe.HJM.Origin
