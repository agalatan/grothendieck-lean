import Grothe.UpperChaos.DirectSampleUpper

/-! Exact DFT sample-error ledger for the production endpoint. Joint alias, Parseval and sample enclosures are explicit premises, not
asserted numerical facts. -/

open Finset Grothe.Upper
namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- Cauchy--Schwarz on the first 251 coefficient errors; 251 < 16^2. -/
theorem first251_l1_le_sixteen (f : ℕ → ℂ) (e : ℝ) (he : 0 ≤ e)
    (hsq : ∑ j ∈ range 251, ‖f j‖ ^ 2 ≤ e ^ 2) :
    ∑ j ∈ range 251, ‖f j‖ ≤ 16 * e := by
  have hcs := sum_mul_sq_le_sq_mul_sq (range 251) (fun _ => (1 : ℝ)) (fun j => ‖f j‖)
  have hcs' : (∑ j ∈ range 251, ‖f j‖) ^ 2 ≤
      251 * (∑ j ∈ range 251, ‖f j‖ ^ 2) := by
    simpa using hcs
  have hnonneg : 0 ≤ ∑ j ∈ range 251, ‖f j‖ := sum_nonneg fun _ _ => norm_nonneg _
  nlinarith [sq_nonneg (e * 16 - ∑ j ∈ range 251, ‖f j‖)]

/-- The exact original upper endpoint from finite DFT estimates. `D` is the
exact DFT of actual samples; `A` is the certified numerical transform. The
joint alias, finite Parseval/sample-error and numerical head bounds
must be established separately. -/
theorem upper_of_DFT_ledger (D A : ℕ → ℂ)
    (haliasSum : (∑ j ∈ range 251, ‖(actualH j : ℂ) - D j‖) ≤
      (1 / 5000000000000000 : ℝ))
    (hsampleSq : ∑ j ∈ range 251, ‖D j - A j‖ ^ 2 ≤ (1 / 1000000000000 : ℝ) ^ 2)
    (hfiniteHead : ∑ j ∈ range 251,
      ‖A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0‖ ≤
      (440036497409 / 500000000000000000 : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699884132991) := by
  have hsample := first251_l1_le_sixteen (fun j => D j - A j)
    (1 / 1000000000000 : ℝ) (by norm_num) hsampleSq
  have herr : ∑ j ∈ range 251, ‖(actualH j : ℂ) - A j‖ ≤
      (80001 / 5000000000000000 : ℝ) := by
    have ht : ∑ j ∈ range 251, ‖(actualH j : ℂ) - A j‖ ≤
        (∑ j ∈ range 251, ‖(actualH j : ℂ) - D j‖) +
          (∑ j ∈ range 251, ‖D j - A j‖) := by
      rw [← sum_add_distrib]
      apply sum_le_sum
      intro j hj
      have he : ((actualH j : ℂ) - D j) + (D j - A j) = (actualH j : ℂ) - A j := by ring
      rw [← he]
      exact norm_add_le _ _
    linarith
  apply upper_of_finite_sample_bounds A (80001 / 5000000000000000 : ℝ) herr
  have hbudget : (440036497409 / 500000000000000000 : ℝ) +
      (80001 / 5000000000000000 : ℝ) = (Grothe.groupedHeadResidualQ : ℝ) := by
    norm_num [Grothe.groupedHeadResidualQ, groupedCompareQ, headCapQ, energyErrQ]
  linarith

end
end Grothe.UpperChaos.DirectSample
