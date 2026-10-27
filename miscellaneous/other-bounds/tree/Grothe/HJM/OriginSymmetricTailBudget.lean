import Grothe.HJM.OriginTailBudget

/-!
# Symmetric numerical targets for the concrete origin-tail certificate

Agent-ID: codex-aa04. Numerical energy bounds remain explicit inputs.
The stronger Wallis suffix allows a larger symmetric residual-energy budget.
Thus the integral certificate only needs total energies ≤12.7 and visible
energies ≥11.5; the assembly ledger itself is unchanged.
-/

open MeasureTheory Set Finset

namespace Grothe.HJM

noncomputable section

theorem origin_symmetric_tail_arithmetic :
    2 * Real.sqrt ((6 / 5 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) +
      (6 / 5) / (2 * (120 : ℝ) + 1) ^ 2 ≤ (2613 / 10000000 : ℝ) := by
  have hs : Real.sqrt ((6 / 5 : ℝ) * (1 / (48 * (120 : ℝ) ^ 3))) ≤
      120282 / 1000000000 := by
    apply Real.sqrt_le_iff.mpr
    norm_num
  nlinarith

theorem origin_symmetric_tail_cap_lt_budget :
    (397752354801503847 / 10 ^ 21 : ℚ) * (2613 / 10000000) < originTailBudget := by
  decide +kernel

theorem origin_tail_of_symmetric_residual_caps
    (hL : Origin.leftTailEnergy 120 ≤ (6 / 5 : ℝ))
    (hR : Origin.rightTailEnergy 120 ≤ (6 / 5 : ℝ)) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ) := by
  have h := Origin.coeff_tail_le_of_residual_caps 120 (by norm_num) (6 / 5) (6 / 5) hL hR
  have hsqrt : Real.sqrt ((6 / 5 : ℝ) * (6 / 5)) = 6 / 5 := by
    rw [← pow_two, Real.sqrt_sq (by norm_num)]
  rw [hsqrt] at h
  have htail : (∑' n, |Origin.coeff (n + 120)|) ≤ (2613 / 10000000 : ℝ) := by
    exact h.trans (by nlinarith [origin_symmetric_tail_arithmetic])
  change |wt 5| * (∑' n, |Origin.coeff (n + 120)|) ≤ (originTailBudget : ℝ)
  have hb : (((397752354801503847 / 10 ^ 21 : ℚ) *
      (2613 / 10000000) : ℚ) : ℝ) ≤ (originTailBudget : ℝ) :=
    Rat.cast_le.mpr origin_symmetric_tail_cap_lt_budget.le
  calc
    _ ≤ |wt 5| * (2613 / 10000000 : ℝ) := mul_le_mul_of_nonneg_left htail (abs_nonneg _)
    _ ≤ _ := by
      rw [wt_five]
      norm_num only [Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] at hb ⊢
      exact hb

/-- Concrete numerical certificate interface, with four common rational targets. -/
theorem origin_tail_of_symmetric_energy_caps
    (hCL : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.fEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hCR : (∫ s in Ioi (0 : ℝ), Real.exp (-s) * ‖Origin.gEnergyAmplitude s‖ ^ 2) ≤
      (127 / 10 : ℝ))
    (hVL : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.leftEnergyTerm n)
    (hVR : (23 / 2 : ℝ) ≤ ∑ n ∈ range 120, Origin.rightEnergyTerm n) :
    |wt 5| * ∑' n, |hc 5 (n + 120)| ≤ (originTailBudget : ℝ) := by
  apply origin_tail_of_symmetric_residual_caps
  · have h := Origin.leftTailEnergy_le_of_visible 120 _ _ hCL hVL
    norm_num at h ⊢
    exact h
  · have h := Origin.rightTailEnergy_le_of_visible 120 _ _ hCR hVR
    norm_num at h ⊢
    exact h

end

end Grothe.HJM
