/-
ABANDONWARE: text removed from `Grothe/Upper/GroupedBridge.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

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
