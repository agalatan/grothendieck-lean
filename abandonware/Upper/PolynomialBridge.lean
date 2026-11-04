/-
ABANDONWARE: text removed from `Grothe/Upper/PolynomialBridge.lean` by the cleanup of 4 November 2026 (PR #301, task #291).
Kept for reference only: this folder is outside every Lake library, is not imported by any root
and is never built or checked. The lines below are the removed lines of the diff against master
b886bb574, verbatim (they are not a self-contained module: imports, namespaces and context are in the
original file at that commit).
-/

/-- The same hypotheses used by `fresh_upper` bound the complete finite head. -/
theorem head_residual_le {E EX : ℕ × ℕ → ℝ} (hE : DirectHyps E EX) :
      ≤ (headResidualQ : ℝ) := by
  have h := hloc.trans (add_le_add (Grothe.head_le hE) hE.compare)
  change (∑ j ∈ range 251, |kernelCoeff E j - if j = 0 then (slopeQ : ℝ) else 0|)
    ≤ (headCapQ : ℝ) + energyErrQ + compareQ at h
  calc _ ≤ (headCapQ : ℝ) + energyErrQ + compareQ := h
    _ = (headResidualQ : ℝ) := by norm_num [headResidualQ]; ring
