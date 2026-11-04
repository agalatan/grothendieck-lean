import Grothe.UpperChaos.RelaxedComparison
import Grothe.UpperChaos.ConcreteTaylorUpper
import Grothe.UpperChaos.CompositeEnergy
import Grothe.UpperChaos.Structural

/-! Retain the original fourteen actual Gaussian finite-band premises while
relaxing the selected energy-table discrepancy to 3e-8. Raw F0 error, frozen
correction, smoothing, same-output table agreement and the Hardy tail retain
separate contracts. No completed endpoint facade is asserted here.
Agent-ID: codex-7c2e. -/

set_option warningAsError true
open MeasureTheory Finset Grothe.Upper GrotheKernel

namespace Grothe.UpperChaos.RelaxedComparison
noncomputable section

open CompositeComparison

variable
    (hfirst : ∀ k, ‖projOn (firstCenterBandModes k) (firstTaylorL2 - firstCenter)‖ ≤
      (firstCapturedErrorQ k : ℝ))
    (hsecond : ∀ k, ‖projOn (secondCenterBandModes k) (secondTaylorL2 - secondCenter)‖ ≤
      (secondCapturedErrorQ k : ℝ))
    (hthird : ∀ k, ‖projOn (thirdCenterBandModes k) (thirdTaylorL2 - thirdCenter)‖ ≤
      (thirdCapturedErrorQ k : ℝ))

include hfirst hsecond hthird

/-- Only the weighted response band masses are enlarged. The actual Gaussian
piece errors and their within-order disjointness are inherited unchanged. -/
theorem weighted_comparison_of_energy_close
    (hclose : ∑ p ∈ headIdx 501, |energy response p - (energyTable p : ℝ)| ≤
      (RelaxedComparisonData.energyErrorQ : ℝ)) :
    ∑ p ∈ headIdx 501, comparisonWeight p * |energy rounding p - energy response p| ≤
      (RelaxedComparisonData.comparisonCapQ : ℝ) :=
  localized_comparison_grouped_relaxed
    (comparisonInputs_taylorCenters hfirst hsecond hthird) hclose

/-- The actual raw source certificate and the same rational output's table
agreement give the full selected head, with fourteen original Gaussian inputs. -/
theorem head_residual_of_raw_source (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ)) :
    ∑ j ∈ range 251, |kernelCoeff (energy rounding) j -
      if j = 0 then (slopeQ : ℝ) else 0| ≤ (RelaxedComparisonData.headResidualQ : ℝ) := by
  have hpG : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy rounding p = 0 :=
    energy_eq_zero_of_even (memLp_GT phiBound) (fun _ u hc => GT_rot2 hc u)
  have hpX : ∀ p : ℕ × ℕ, (p.1 + p.2) % 2 = 0 → energy response p = 0 :=
    energy_eq_zero_of_even (memLp_Xfun phiBound chargeFn_frozenCorrectionFn)
      (Xfun_rot2 phiBound chargeFn_frozenCorrectionFn)
  have hclose := CompositeComparison.energy_close_of_raw_source a0 hraw htable
  have hX : ∑ j ∈ range 251,
      |kernelCoeff (energy response) j - if j = 0 then (slopeQ : ℝ) else 0| ≤
        (headCapQ : ℝ) + (CompositeComparisonData.energyErrorQ : ℝ) := by
    have h1 := Upper.head_residual_le primaryPoly auxPoly l1_primaryPoly l1_auxPoly
      auxPoly_coeff_zero (energy response) (fun p => (energyTable p : ℝ)) hpX
      (N := 501) (K := 251) (by norm_num) (slopeQ : ℝ)
    have h2 : ∑ j ∈ range 251,
        |∑ p ∈ headIdx 501, (energyTable p : ℝ) * (termOf primaryPoly auxPoly p).coeff j -
          if j = 0 then (slopeQ : ℝ) else 0| ≤ headCapQ :=
      head_le_of_check Grothe.head_check
    unfold kernelCoeff
    linarith
  have hc := weighted_comparison_of_energy_close hfirst hsecond hthird hclose
  have hloc := Upper.head_residual_le_weighted primaryPoly auxPoly auxPoly_coeff_zero
    (energy rounding) (energy response) hpG (N := 501) (K := 251) (by norm_num)
    (slopeQ : ℝ) comparisonWeight (fun p _ => comparisonWeight_sound p)
  have heq : (∑ j ∈ range 251,
      |∑ p ∈ headIdx 501, energy response p * (termOf primaryPoly auxPoly p).coeff j -
        if j = 0 then (slopeQ : ℝ) else 0|) =
      ∑ j ∈ range 251, |kernelCoeff (energy response) j -
        if j = 0 then (slopeQ : ℝ) else 0| := by
    apply sum_congr rfl
    intro j hj
    rw [show kernelCoeff (energy response) j = ∑ p ∈ headIdx 501,
      energy response p * (termOf primaryPoly auxPoly p).coeff j from
      bivarKernel_eq_head primaryPoly auxPoly auxPoly_coeff_zero (energy response) hpX
        (by have := mem_range.mp hj; omega)]
  rw [heq] at hloc
  have hb := hloc.trans (add_le_add hX hc)
  calc
    _ ≤ (headCapQ : ℝ) + (CompositeComparisonData.energyErrorQ : ℝ) +
        (RelaxedComparisonData.comparisonCapQ : ℝ) := hb
    _ = (RelaxedComparisonData.headResidualQ : ℝ) := by
      simp only [RelaxedComparisonData.headResidualQ, RelaxedComparisonData.energyErrorQ, Rat.cast_add]

/-- Add only the separate tail of the actual rounding kernel. The finite
source/energy errors are already included in the selected head. -/
theorem residual_of_raw_source (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ))
    (htail : ∑' n, |kernelCoeff (energy rounding) (n + 251)| ≤
      (CompositeComparisonData.rawTailQ : ℝ)) :
    |kernelCoeff (energy rounding) 0 - (slopeQ : ℝ)| +
      ∑' n, |kernelCoeff (energy rounding) (n + 1)| ≤
        (RelaxedComparisonData.residualQ : ℝ) := by
  have hs := Grothe.summable_kernelCoeff (summable_abs_energy rounding)
  rw [Grothe.residual_split (kernelCoeff (energy rounding)) hs (slopeQ : ℝ) 250]
  have hh := head_residual_of_raw_source hfirst hsecond hthird a0 hraw htable
  simpa only [RelaxedComparisonData.residualQ, Rat.cast_add] using add_le_add hh htail

/-- A conditional transfer of the actual rounding kernel, retaining every
Gaussian, raw-source, table and tail input. This is not the completed facade. -/
theorem upper_of_raw_source_and_tail (a0 : ℕ → ℕ → ℕ → ℚ)
    (hraw : ‖FixedChaosSmoothing.productionF0Head - gradedHermite 251 a0‖ ≤
      (CompositeComparisonData.rawCapQ : ℝ))
    (htable : ∑ p ∈ headIdx 501,
      |energy (FixedChaosSmoothing.retainedSmoothed a0) p - (energyTable p : ℝ)| ≤
        (CompositeComparisonData.tableCapQ : ℝ))
    (htail : ∑' n, |kernelCoeff (energy rounding) (n + 251)| ≤
      (CompositeComparisonData.rawTailQ : ℝ)) :
    IsGrothendieckBound (RelaxedComparisonData.upperQ : ℝ) := by
  have hs := Grothe.summable_kernelCoeff (summable_abs_energy rounding)
  have hv : DominatedKernel (radialKernel (kernelCoeff (energy rounding))) := by
    exact (rounding_diskKernel measurable_GT (norm_GT_le phiBound)
      (fun _ u hc => GT_rot2 hc u) (memLp_GT phiBound)
      l1_primaryPoly l1_auxPoly).dominated
  have hd : (RelaxedComparisonData.residualQ : ℝ) < (slopeQ : ℝ) := by
    exact_mod_cast (sub_pos.mp RelaxedComparisonData.denominator_pos)
  have hr := residual_of_raw_source hfirst hsecond hthird a0 hraw htable htail
  apply (Grothe.transfer (kernelCoeff (energy rounding)) hs hv hd hr).mono
  have hb := le_of_lt RelaxedComparisonData.transfer_value_lt
  simpa only [Rat.cast_sub] using hb

end
end Grothe.UpperChaos.RelaxedComparison
