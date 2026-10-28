import Grothe.UpperChaos.GroupedRounder

/-! Direct head and sample enclosures for the production GT rounding.
The analytic sample and alias bounds are explicit hypotheses; this module
does not prove a numerical certificate. -/

open MeasureTheory Finset Grothe.Upper GrotheKernel
open scoped ComplexConjugate
namespace Grothe.UpperChaos.DirectSample
noncomputable section

/-- The actual GT coefficient sequence, not the stored truncation energies. -/
abbrev actualH : ℕ → ℝ := HardyReal.hGT phiBound

/-- A direct head bound suffices for the sharp upper endpoint.
The Hardy tail and its linear deduction are proved for the actual GT kernel. -/
theorem upper_of_actual_head
    (hhead : ∑ j ∈ range 251, |actualH j - if j = 0 then (slopeQ : ℝ) else 0| ≤
      (Grothe.groupedHeadResidualQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699960428191) := by
  have hs := HardyReal.summable_hGT phiBound
  have hv : DominatedKernel (radialKernel actualH) := by
    exact (rounding_diskKernel measurable_GT (norm_GT_le phiBound)
      (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound) l1_primaryPoly l1_auxPoly).dominated
  have hz : |actualH 0 - (slopeQ : ℝ)| ≤
      ∑ j ∈ range 251, |actualH j - if j = 0 then (slopeQ : ℝ) else 0| := by
    simpa using (single_le_sum (fun j (_ : j ∈ range 251) =>
      abs_nonneg (actualH j - if j = 0 then (slopeQ : ℝ) else 0))
      (show 0 ∈ range 251 by simp))
  have hless : (Grothe.groupedHeadResidualQ : ℝ) ≤ (headResidualQ : ℝ) := by
    have hc : (groupedCompareQ : ℝ) ≤ (compareQ : ℝ) := by
      exact_mod_cast groupedCompareQ_le_compareQ
    simp only [Grothe.groupedHeadResidualQ, headResidualQ, Rat.cast_add] at ⊢
    linarith
  have hlinear : (linearLowerQ : ℝ) ≤ actualH 0 := by
    have hh := (abs_le.mp (hz.trans (hhead.trans hless))).1
    norm_num [linearLowerQ] at ⊢
    linarith
  have hhardy := HardyReal.hardy_GT_tight phiBound
  have hb := hardy_budget_after_linear actualH (4149 / 4000 : ℝ) (1737972 / 1000000)
    (linearLowerQ : ℝ) (by norm_num)
    (by norm_num [linearLowerQ, headResidualQ, compareQ, headCapQ, energyErrQ, slopeQ])
    hlinear hhardy
  have hb' : ∀ J, ∑ n ∈ range J, actualH (n + 1) ^ 2 *
      (4149 / 4000 : ℝ) ^ (2 * (2 * n + 1)) ≤ (shiftedBudgetQ : ℝ) := by
    intro J
    simpa only [shiftedBudgetQ, Rat.cast_div, Rat.cast_sub, Rat.cast_pow, Rat.cast_ofNat,
      Rat.cast_mul] using hb J
  have htail : ∑' n, |actualH (n + 251)| ≤ (tailQ : ℝ) := by
    have h := hardy_tail (fun n => actualH (n + 1)) (4149 / 4000 : ℝ)
      (by norm_num) (shiftedBudgetQ : ℝ) hb' 250 (tailQ : ℝ)
      (by norm_num [tailQ]) tail_numeric
    simpa only [Nat.add_assoc, show 250 + 1 = 251 by norm_num] using h
  have hres : |actualH 0 - (slopeQ : ℝ)| + ∑' n, |actualH (n + 1)| ≤
      455212621809 / 500000000000000000 := by
    rw [residual_split actualH hs (slopeQ : ℝ) 250]
    have h := add_le_add hhead htail
    have he : (Grothe.groupedHeadResidualQ : ℝ) + tailQ =
        455212621809 / 500000000000000000 := by
      norm_num [Grothe.groupedHeadResidualQ, groupedCompareQ, headCapQ, energyErrQ, tailQ]
    linarith
  refine (transfer actualH hs hv (by norm_num [slopeQ]) hres).mono (le_of_eq ?_)
  norm_num [slopeQ]

/-- A finite family of complex coefficient estimates and a single total
alias/estimation budget are sufficient. The true coefficients are real. -/
theorem upper_of_finite_sample_bounds (A : ℕ → ℂ) (ε : ℝ)
    (herror : ∑ j ∈ range 251, ‖(actualH j : ℂ) - A j‖ ≤ ε)
    (hledger : (∑ j ∈ range 251,
      ‖A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0‖) + ε ≤
        (Grothe.groupedHeadResidualQ : ℝ)) :
    IsGrothendieckBound (500000000000000000 / 355973699960428191) := by
  apply upper_of_actual_head
  calc
    _ ≤ ∑ j ∈ range 251, (‖(actualH j : ℂ) - A j‖ +
        ‖A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0‖) := by
      apply sum_le_sum
      intro j hj
      have ht := norm_add_le ((actualH j : ℂ) - A j)
        (A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0)
      have he : ((actualH j : ℂ) - A j) +
          (A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0) =
          ((actualH j - if j = 0 then (slopeQ : ℝ) else 0 : ℝ) : ℂ) := by
        split_ifs <;> push_cast <;> ring
      rw [he, Complex.norm_real, Real.norm_eq_abs] at ht
      exact ht
    _ = (∑ j ∈ range 251, ‖(actualH j : ℂ) - A j‖) +
      ∑ j ∈ range 251, ‖A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0‖ := sum_add_distrib
    _ ≤ ε + ∑ j ∈ range 251,
      ‖A j - if j = 0 then ((slopeQ : ℝ) : ℂ) else 0‖ := add_le_add herror le_rfl
    _ ≤ (Grothe.groupedHeadResidualQ : ℝ) := by linarith

end
end Grothe.UpperChaos.DirectSample
