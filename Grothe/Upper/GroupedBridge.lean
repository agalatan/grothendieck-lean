import Grothe.Upper.PolynomialBridge
import Grothe.Upper.ComparisonGroups

/-!
# The sharp upper bound from the grouped comparison

Under the explicit Gaussian inputs, `K_G^ℂ ≤ 500000000000000000/355973699884132991 < 1.404598149141` (`fresh_upper`,
`upper_value_lt`). The quadratic comparison error is grouped by Taylor order: within a group the bands are
disjoint, so the component norms combine in quadrature (`groupedCompareQ`).
-/

namespace Grothe

open Upper GrotheKernel Finset

noncomputable section

def groupedHeadResidualQ : ℚ := groupedCompareQ + headCapQ + energyErrQ

/-- The finite-head estimate with a sharper selected-spectrum comparison. -/
theorem grouped_head_residual_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX)
    (hcompare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤
      (groupedCompareQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (groupedHeadResidualQ : ℝ) := by
  have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
    E EX hE.parity (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ) comparisonWeight
    (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, EX p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0| := by
    refine sum_congr rfl fun j hj => ?_
    rw [show kernelCoeff EX j = ∑ p ∈ headIdx 501,
      EX p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero EX hE.parityX
        (by have := mem_range.1 hj; omega)]
  rw [heq] at hloc
  have h := hloc.trans (add_le_add (Grothe.head_le hE) hcompare)
  change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
    ≤ (headCapQ : ℝ) + energyErrQ + groupedCompareQ at h
  calc _ ≤ (headCapQ : ℝ) + energyErrQ + groupedCompareQ := h
    _ = (groupedHeadResidualQ : ℝ) := by norm_num [groupedHeadResidualQ]; ring

/-- **The sharp upper bound** from the structural inputs and the grouped comparison. -/
theorem fresh_upper (E EX : ℕ × ℕ → ℝ) (hE : DirectHyps E EX)
    (hcompare : ∑ p ∈ headIdx 501, comparisonWeight p * |E p - EX p| ≤
      (groupedCompareQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699884132991) := by
  have hs := summable_kernelCoeff hE.summable
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 455288917009 / 500000000000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h := add_le_add (grouped_head_residual_le hE hcompare) (tail_le hE)
    have e : (groupedHeadResidualQ : ℝ) + tailQ =
        455288917009 / 500000000000000000 := by
      norm_num [groupedHeadResidualQ, groupedCompareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer (kernelCoeff E) hs hE.valid (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- The exact upper endpoint is below the stated decimal. -/
theorem upper_value_lt :
    (500000000000000000 / 355973699884132991 : ℝ) < 1.404598149141 := by norm_num


end
end Grothe
