import Grothe.Upper.PolynomialBridge

/-!
An exact endpoint implication with the current stored head and preprocessing.

The additional comparison premise is stronger than `DirectHyps.compare`.
`reassessment_comparison_upper.py` independently replays the finite rational
joint-prefix certificate yielding its cap, conditional on the inherited HS,
moment, coefficient and Gaussian analytic enclosures. This module does not
discharge those analytic or numerical enclosure premises.
-/

namespace Grothe.Reassessment20261023

open Upper GrotheKernel Finset

def improvedCompareQ : ℚ := 1017321032757 / 1000000000000000000

/-- The existing finite head and Hardy tail, with the stronger same-T/X
comparison input, imply a strictly improved conditional upper bound. -/
theorem improved_upper (E EX : ℕ × ℕ → ℝ) (hE : DirectHyps E EX)
    (hcompare : ∑' p, |E p - EX p| ≤ (improvedCompareQ : ℝ)) :
    IsGrothendieckBound (40000000000000000 / 28477888065186929) := by
  have hs := summable_kernelCoeff hE.summable
  have hd := summable_abs_sub hE.summable hE.summableX
  have e : ∀ n, kernelCoeff E n - kernelCoeff EX n =
      kernelCoeff (fun p => E p - EX p) n :=
    fun n => (kernelCoeff_sub hE.summable hE.summableX n).symm
  have hsd : Summable fun n => |kernelCoeff E n - kernelCoeff EX n| := by
    simpa only [e] using summable_kernelCoeff hd
  have hc : ∑' n, |kernelCoeff E n - kernelCoeff EX n| ≤ (improvedCompareQ : ℝ) := by
    simp only [e]
    exact (tsum_abs_bivarKernel_le _ _ l1_primaryPoly l1_auxPoly _ hd).trans hcompare
  have hcf : ∑ n ∈ range 251, |kernelCoeff E n - kernelCoeff EX n|
      ≤ (improvedCompareQ : ℝ) :=
    (hsd.sum_le_tsum (range 251) fun n _ => abs_nonneg _).trans hc
  have hh : ∑ j ∈ range 251,
      |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|
      ≤ (improvedCompareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) := by
    calc _ ≤ ∑ j ∈ range 251, (|kernelCoeff E j - kernelCoeff EX j| +
        |kernelCoeff EX j - if j = 0 then (slopeQ : ℝ) else 0|) :=
          sum_le_sum fun j _ => abs_sub_le _ _ _
      _ = _ := sum_add_distrib
      _ ≤ _ := add_le_add hcf (Grothe.head_le hE)
  have hr : |kernelCoeff E 0 - (slopeQ : ℝ)| + ∑' n, |kernelCoeff E (n + 1)|
      ≤ 1152962726775 / 1000000000000000000 := by
    rw [residual_split (kernelCoeff E) hs (slopeQ : ℝ) 250]
    have h := add_le_add hh (Grothe.tail_le hE)
    have eq : (improvedCompareQ : ℝ) + ((headCapQ : ℝ) + energyErrQ) + tailQ
        = 1152962726775 / 1000000000000000000 := by
      norm_num [improvedCompareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer (kernelCoeff E) hs hE.valid (by norm_num [slopeQ]) hr).mono (le_of_eq ?_)
  norm_num [slopeQ]

theorem improved_value_lt :
    (40000000000000000 / 28477888065186929 : ℝ) < 1.404598540048 := by
  norm_num

#print axioms improved_upper
#print axioms improved_value_lt

end Grothe.Reassessment20261023
