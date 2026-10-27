import Grothe.HJM.OriginUnweightedTail
import Grothe.HJM.OriginVisibleEnergy

/-!
# Finite projection certificates for unweighted residual suffixes

Agent-ID: codex-aa04. Every total-norm,
finite-test-mass and signed-correlation numerical claim is an explicit
hypothesis. This module does not assert that a numerical replay is a proof.
-/

open MeasureTheory Set Finset Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.HJM.Origin

noncomputable section

/-- Mass and signed correlation of a finite test in the original orthonormal
charge-one grading. -/
def unweightedTestMass (x : ℕ → ℂ) (N : ℕ) : ℝ :=
  ∑ n ∈ range N, ‖x n‖ ^ 2

def unweightedTestCorrelation (x : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ) : ℂ :=
  ∑ n ∈ range N, conj (x n) * chargeOneCoeff R n

lemma unweightedTestMass_nonneg (x : ℕ → ℂ) (N : ℕ) :
    0 ≤ unweightedTestMass x N := by
  exact sum_nonneg fun _ _ => sq_nonneg _

/-- Finite Cauchy--Schwarz is applied to the actual signed correlation. -/
theorem unweightedTestCorrelation_le_sqrt
    (x : ℕ → ℂ) (R : Lp ℂ 2 gaussC) (N : ℕ) :
    (unweightedTestCorrelation x R N).re ≤ Real.sqrt (unweightedTestMass x N) *
      Real.sqrt (∑ n ∈ range N, ‖chargeOneCoeff R n‖ ^ 2) := by
  calc
    _ ≤ ‖unweightedTestCorrelation x R N‖ := Complex.re_le_norm _
    _ ≤ ∑ n ∈ range N, ‖conj (x n) * chargeOneCoeff R n‖ := norm_sum_le _ _
    _ = ∑ n ∈ range N, ‖x n‖ * ‖chargeOneCoeff R n‖ := by
      apply sum_congr rfl
      intro n _
      simp only [norm_mul, Complex.norm_conj]
    _ ≤ _ := by
      simpa only [unweightedTestMass] using
        Real.sum_mul_le_sqrt_mul_sqrt (range N) (fun n => ‖x n‖)
          (fun n => ‖chargeOneCoeff R n‖)

/-- For `N ≤ M`, a norm cap and one signed finite test bound the entire
unweighted coefficient suffix from M. Orthonormal Bessel applies to the
actual charge-one coefficients; no completeness assumption is needed. -/
theorem unweightedTail_le_of_finite_test
    (R : Lp ℂ 2 gaussC) (x : ℕ → ℂ) (N M : ℕ) (hNM : N ≤ M)
    (B C T : ℝ) (hB : 0 < B) (hC : 0 ≤ C)
    (hmass : unweightedTestMass x N ≤ B)
    (hcorr : C ≤ (unweightedTestCorrelation x R N).re)
    (htotal : ‖R‖ ^ 2 ≤ T) :
    (∑' j : ℕ, ‖chargeOneCoeff R (j + M)‖ ^ 2) ≤ T - C ^ 2 / B := by
  let V : ℝ := ∑ n ∈ range N, ‖chargeOneCoeff R n‖ ^ 2
  have hV : 0 ≤ V := by
    dsimp only [V]
    exact sum_nonneg fun _ _ => sq_nonneg _
  have hc := hcorr.trans (unweightedTestCorrelation_le_sqrt x R N)
  have hC2 : C ^ 2 ≤ unweightedTestMass x N * V := by
    have hsq := (sq_le_sq₀ hC
      (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))).mpr hc
    simpa only [V, mul_pow, Real.sq_sqrt (unweightedTestMass_nonneg x N),
      Real.sq_sqrt hV] using hsq
  have hvisible : C ^ 2 / B ≤ V := by
    apply (div_le_iff₀ hB).2
    exact hC2.trans (mul_le_mul_of_nonneg_right hmass hV)
  have hprefix : V ≤ ∑ n ∈ range M, ‖chargeOneCoeff R n‖ ^ 2 := by
    dsimp only [V]
    exact sum_le_sum_of_subset_of_nonneg (range_mono hNM) (fun _ _ _ => sq_nonneg _)
  have hsum : Summable (fun n : ℕ => ‖chargeOneCoeff R n‖ ^ 2) :=
    chargeOneCoeff_summable_sq R
  have htot : (∑' n : ℕ, ‖chargeOneCoeff R n‖ ^ 2) ≤ T :=
    (chargeOneCoeff_tsum_sq_le R).trans htotal
  exact tail_cap_of_visible M hsum.hasSum htot (hvisible.trans hprefix)

/-- The effective unweighted test derived from the original rational 120-mode
witness. Restricting this vector to 64 modes is a finite projection; omitted
modes remain in the suffix estimate. -/
def unweightedRationalTest (xs : List (ℚ × ℚ)) (n : ℕ) : ℂ :=
  ((Real.sqrt ((n : ℝ) + 1) / (2 * (n : ℝ) + 1) : ℝ) : ℂ) * rationalAlpha xs n

/-- The conservative 64-mode left targets are sufficient for the relaxed
unweighted suffix cap. The numerical bounds are all hypotheses. -/
theorem leftUnweightedTail_of_64_targets
    (htotal : ‖fResidualLp‖ ^ 2 ≤ (46593520 / 10 ^ 8 : ℝ))
    (hmass : unweightedTestMass (unweightedRationalTest OriginWitnessData.leftAlpha) 64 ≤
      (46592860 / 10 ^ 8 : ℝ))
    (hcorr : (46592855 / 10 ^ 8 : ℝ) ≤
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.leftAlpha)
        fResidualLp 64).re) :
    leftUnweightedTail 120 ≤ (53 / 20000 : ℝ) ^ 2 := by
  have h := unweightedTail_le_of_finite_test fResidualLp
    (unweightedRationalTest OriginWitnessData.leftAlpha) 64 120 (by norm_num)
    (46592860 / 10 ^ 8) (46592855 / 10 ^ 8) (46593520 / 10 ^ 8)
    (by norm_num) (by norm_num) hmass hcorr htotal
  change (∑' j : ℕ, ‖chargeOneCoeff fResidualLp (j + 120)‖ ^ 2) ≤ _
  refine h.trans ?_
  norm_num

/-- The corresponding conservative right targets retain all omitted modes in
the suffix and require the same three actual certificate inputs. -/
theorem rightUnweightedTail_of_64_targets
    (htotal : ‖gResidualLp‖ ^ 2 ≤ (46577720 / 10 ^ 8 : ℝ))
    (hmass : unweightedTestMass (unweightedRationalTest OriginWitnessData.rightAlpha) 64 ≤
      (46577055 / 10 ^ 8 : ℝ))
    (hcorr : (46577050 / 10 ^ 8 : ℝ) ≤
      (unweightedTestCorrelation (unweightedRationalTest OriginWitnessData.rightAlpha)
        gResidualLp 64).re) :
    rightUnweightedTail 120 ≤ (53 / 20000 : ℝ) ^ 2 := by
  have h := unweightedTail_le_of_finite_test gResidualLp
    (unweightedRationalTest OriginWitnessData.rightAlpha) 64 120 (by norm_num)
    (46577055 / 10 ^ 8) (46577050 / 10 ^ 8) (46577720 / 10 ^ 8)
    (by norm_num) (by norm_num) hmass hcorr htotal
  change (∑' j : ℕ, ‖chargeOneCoeff gResidualLp (j + 120)‖ ^ 2) ≤ _
  refine h.trans ?_
  norm_num

end
end Grothe.HJM.Origin
