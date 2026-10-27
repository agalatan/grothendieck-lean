import Grothe.HJM.OriginPanelBudget
import Grothe.HJM.OriginPolynomialDerivativeBounds
import Grothe.HJM.OriginPhaseDerivativeNorm
import Grothe.HJM.OriginDenominator
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals

/-!
# Integrating the coarse origin-energy bound beyond 512

Agent-ID: codex-aa04. It requires only a pointwise growth bound and integrability, and spends a
very coarse rational tail allowance. It does not enclose the finite integral.
-/

open MeasureTheory Set Real

namespace Grothe.HJM.Origin

noncomputable section

/-- The exponential dominates the polynomial on the specified tail, with the
constant chosen at the left endpoint. -/
theorem one_add_pow_42_le_tail_exp (s : ℝ) (hs : 512 ≤ s) :
    (1 + s) ^ 42 ≤ (513 : ℝ) ^ 42 * Real.exp ((s - 512) / 2) := by
  have ht : 0 ≤ s - 512 := by linarith
  have hx : 0 ≤ (s - 512) / 513 := by positivity
  have hb : 0 ≤ 1 + (s - 512) / 513 := by positivity
  have hbase : 1 + (s - 512) / 513 ≤ Real.exp ((s - 512) / 513) := by
    simpa only [add_comm] using Real.add_one_le_exp ((s - 512) / 513)
  have hp : (1 + (s - 512) / 513) ^ 42 ≤ Real.exp ((s - 512) / 2) := by
    calc
      _ ≤ Real.exp ((s - 512) / 513) ^ 42 := pow_le_pow_left₀ hb hbase 42
      _ = Real.exp (42 * ((s - 512) / 513)) := by rw [Real.exp_nat_mul]; norm_num
      _ ≤ _ := Real.exp_le_exp.mpr (by nlinarith)
  have he : (1 + s) ^ 42 = (513 : ℝ) ^ 42 *
      (1 + (s - 512) / 513) ^ 42 := by
    rw [← mul_pow]
    congr 1
    ring
  rw [he]
  exact mul_le_mul_of_nonneg_left hp (by positivity)

/-- The accepted radius-eight exponential bound extends by an exact eighth
power to the tail cutoff. -/
theorem exp_neg_fivehundredtwelve_le : Real.exp (-512) ≤ (1 / 10 ^ 27 : ℝ) ^ 8 := by
  have h := pow_le_pow_left₀ (Real.exp_nonneg _) Grothe.HJM.OriginPanels.exp_neg_sixtyfour_le 8
  have he : Real.exp (-512) = Real.exp (-64) ^ 8 := by
    rw [← Real.exp_nat_mul]
    norm_num
  rw [he]
  exact h

/-- Coarse Gaussian tail bound from pointwise polynomial growth. -/
theorem integral_energy_far_le {E : ℝ → ℂ}
    (hE : IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖E s‖ ^ 2) (Ioi 512))
    (hbound : ∀ s : ℝ, 512 ≤ s → ‖E s‖ ≤ 192043001 * (1 + s) ^ 21) :
    (∫ s in Ioi (512 : ℝ), Real.exp (-s) * ‖E s‖ ^ 2) < (1 / 10 ^ 20 : ℝ) := by
  let A : ℝ := (192043001 : ℝ) ^ 2 * (513 : ℝ) ^ 42 * Real.exp (-256)
  let f : ℝ → ℝ := fun s => Real.exp (-s) * ‖E s‖ ^ 2
  let g : ℝ → ℝ := fun s => A * Real.exp (-(1 / 2 : ℝ) * s)
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have hg : IntegrableOn g (Ioi 512) := by
    exact (integrableOn_exp_mul_Ioi (a := -(1 / 2 : ℝ)) (by norm_num) 512).const_mul A
  have hfg : ∀ᵐ s ∂(volume.restrict (Ioi (512 : ℝ))), f s ≤ g s := by
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with s hs
    have hs' : 512 ≤ s := hs.le
    have hR : 0 ≤ 1 + s := by linarith
    have hsq : ‖E s‖ ^ 2 ≤ (192043001 : ℝ) ^ 2 * (1 + s) ^ 42 := by
      have h := (sq_le_sq₀ (norm_nonneg _) (by positivity)).mpr (hbound s hs')
      simpa only [mul_pow, ← pow_mul] using h
    have hpoly := one_add_pow_42_le_tail_exp s hs'
    have hmul : (192043001 : ℝ) ^ 2 * (1 + s) ^ 42 ≤
        (192043001 : ℝ) ^ 2 * ((513 : ℝ) ^ 42 * Real.exp ((s - 512) / 2)) :=
      mul_le_mul_of_nonneg_left hpoly (by positivity)
    have he : Real.exp (-s) * Real.exp ((s - 512) / 2) =
        Real.exp (-256) * Real.exp (-(1 / 2 : ℝ) * s) := by
      rw [← Real.exp_add, ← Real.exp_add]
      congr 1
      ring
    dsimp only [f, g, A]
    calc
      _ ≤ Real.exp (-s) * ((192043001 : ℝ) ^ 2 * (1 + s) ^ 42) :=
        mul_le_mul_of_nonneg_left hsq (Real.exp_nonneg _)
      _ ≤ Real.exp (-s) * ((192043001 : ℝ) ^ 2 *
          ((513 : ℝ) ^ 42 * Real.exp ((s - 512) / 2))) :=
        mul_le_mul_of_nonneg_left hmul (Real.exp_nonneg _)
      _ = (192043001 : ℝ) ^ 2 * (513 : ℝ) ^ 42 *
          (Real.exp (-s) * Real.exp ((s - 512) / 2)) := by ring
      _ = _ := by rw [he]; ring
  have hi : (∫ s in Ioi (512 : ℝ), f s) ≤ ∫ s in Ioi (512 : ℝ), g s :=
    integral_mono_ae hE hg hfg
  have hInt : (∫ s in Ioi (512 : ℝ), g s) =
      2 * (192043001 : ℝ) ^ 2 * (513 : ℝ) ^ 42 * Real.exp (-512) := by
    dsimp [g, A]
    rw [integral_const_mul, integral_exp_mul_Ioi (a := -(1 / 2 : ℝ)) (by norm_num)]
    have he : Real.exp (-256) * Real.exp (-256) = Real.exp (-512) := by
      rw [← Real.exp_add]
      norm_num
    rw [← he]
    ring
  calc
    _ = ∫ s in Ioi (512 : ℝ), f s := rfl
    _ ≤ ∫ s in Ioi (512 : ℝ), g s := hi
    _ = _ := hInt
    _ ≤ 2 * (192043001 : ℝ) ^ 2 * (513 : ℝ) ^ 42 * (1 / 10 ^ 27 : ℝ) ^ 8 :=
      mul_le_mul_of_nonneg_left exp_neg_fivehundredtwelve_le (by positivity)
    _ < _ := by norm_num

/-- The accepted numerator bounds imply the left far-field growth estimate. -/
theorem fEnergyAmplitude_far_growth (s : ℝ) (hs : 512 ≤ s) :
    ‖fEnergyAmplitude s‖ ≤ 192043001 * (1 + s) ^ 21 := by
  have hs0 : 0 ≤ s := by linarith
  rw [fEnergyAmplitude_eq_phaseEnergyJet s (by linarith)]
  apply phaseEnergyJet_far_growth s hs
  · simpa only [eval_leftNumeratorPolynomial] using norm_leftNumerator_lower s hs0
  · exact Grothe.HJM.OriginGrowth.left_first_derivative_bound s hs0
  · exact Grothe.HJM.OriginGrowth.left_second_derivative_bound s hs0

/-- The accepted numerator bounds imply the right far-field growth estimate. -/
theorem gEnergyAmplitude_far_growth (s : ℝ) (hs : 512 ≤ s) :
    ‖gEnergyAmplitude s‖ ≤ 192043001 * (1 + s) ^ 21 := by
  have hs0 : 0 ≤ s := by linarith
  rw [gEnergyAmplitude_eq_phaseEnergyJet s (by linarith)]
  apply phaseEnergyJet_far_growth s hs
  · simpa only [eval_rightNumeratorPolynomial] using norm_rightNumerator_lower s hs0
  · exact Grothe.HJM.OriginGrowth.right_first_derivative_bound s hs0
  · exact Grothe.HJM.OriginGrowth.right_second_derivative_bound s hs0

/-- Quantitative far-tail bound for the actual left energy, given integrability. -/
theorem fEnergy_far_tail
    (hE : IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2)
      (Ioi 512)) :
    (∫ s in Ioi (512 : ℝ), Real.exp (-s) * ‖fEnergyAmplitude s‖ ^ 2) <
      (1 / 10 ^ 20 : ℝ) :=
  integral_energy_far_le hE fEnergyAmplitude_far_growth

/-- Quantitative far-tail bound for the actual right energy, given integrability. -/
theorem gEnergy_far_tail
    (hE : IntegrableOn (fun s : ℝ => Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2)
      (Ioi 512)) :
    (∫ s in Ioi (512 : ℝ), Real.exp (-s) * ‖gEnergyAmplitude s‖ ^ 2) <
      (1 / 10 ^ 20 : ℝ) :=
  integral_energy_far_le hE gEnergyAmplitude_far_growth

end

end Grothe.HJM.Origin
