import Grothe.UpperChaos.PhaseMoments
import Grothe.UpperChaos.ExponentialTail

/-! # Complex Gaussian radial cutoffs

A squared-radius cutoff of a standard complex Gaussian becomes a real
exponential integral. Its positive-rate monomial moments have an exact finite
expression. These statements do not assert a numerical bound for the phase.

Agent-ID: codex-239c -/

namespace Grothe.UpperChaos.RadialCutoff
open MeasureTheory Real Set Grothe.LowerAnalytic Grothe.UpperChaos
noncomputable section

/-- Cut off the squared radius of a standard complex Gaussian. -/
theorem gaussC_radial_cutoff (L : ℝ) (hL : 0 ≤ L) (g : ℝ → ℝ) (hg : Measurable g) :
    (∫ z : ℂ in {z | L < ‖z‖ ^ 2}, g (‖z‖ ^ 2) ∂gaussC) =
      ∫ s : ℝ in Ioi L, exp (-s) * g s := by
  let f : ℝ → ℝ := (Ioi (√L)).indicator (fun r => g (r ^ 2))
  have hf : Measurable f := (hg.comp (by fun_prop)).indicator measurableSet_Ioi
  have hs : {z : ℂ | L < ‖z‖ ^ 2} = {z : ℂ | √L < ‖z‖} := by
    ext z
    exact (Real.sqrt_lt hL (norm_nonneg z)).symm
  have hm : MeasurableSet {z : ℂ | √L < ‖z‖} :=
    (isOpen_lt continuous_const continuous_norm).measurableSet
  have hleft : (∫ z : ℂ in {z | L < ‖z‖ ^ 2}, g (‖z‖ ^ 2) ∂gaussC) =
      ∫ z : ℂ, f ‖z‖ ∂gaussC := by
    rw [hs, ← integral_indicator hm]
    apply integral_congr_ae
    filter_upwards with z
    simp [f, Set.indicator_apply]
  have hcut : (∫ r : ℝ in Ioi 0, r * exp (-r ^ 2) * f r) =
      ∫ r : ℝ in Ioi (√L), r * exp (-r ^ 2) * g (r ^ 2) := by
    have hpoint (r : ℝ) : r * exp (-r ^ 2) * f r =
        (Ioi (√L)).indicator (fun r => r * exp (-r ^ 2) * g (r ^ 2)) r := by
      simp [f, Set.indicator_mul_right]
    simp_rw [hpoint, setIntegral_indicator measurableSet_Ioi]
    rw [inter_eq_right.mpr (Ioi_subset_Ioi (sqrt_nonneg L))]
  have hsub : (∫ r : ℝ in Ioi (√L), (2 * r) * (exp (-(r ^ 2)) * g (r ^ 2))) =
      ∫ s : ℝ in Ioi L, exp (-s) * g s := by
    have h := integral_comp_rpow_Ioi_of_pos' (g := fun s : ℝ => exp (-s) * g s)
      (p := 2) (by norm_num) hL
    simpa only [show (2 : ℝ)⁻¹ = 1 / 2 by norm_num, ← Real.sqrt_eq_rpow,
      show (2 : ℝ) - 1 = 1 by norm_num, Real.rpow_one, Real.rpow_two, smul_eq_mul] using h
  rw [hleft, integral_gaussC_radial f hf, hcut, ← hsub, ← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro r hr
  ring

/-- Specialization to a polynomial moment under a positive Gaussian tilt.
This also requires the separately checked `ExponentialTail.exp_moment_tail`. -/
theorem gaussC_radial_exp_tail (n : ℕ) (L a : ℝ) (hL : 0 ≤ L) (ha : 0 < a) :
    (∫ z : ℂ in {z | L < ‖z‖ ^ 2},
      ‖z‖ ^ (2 * n) * exp (-(a - 1) * ‖z‖ ^ 2) ∂gaussC) =
      exp (-(a * L)) * ∑ k ∈ Finset.range (n + 1),
        ((n.choose k : ℝ) * L ^ (n - k)) * ((k.factorial : ℝ) / a ^ (k + 1)) := by
  have h := gaussC_radial_cutoff L hL (fun s => s ^ n * exp (-(a - 1) * s)) (by fun_prop)
  simp only [← pow_mul] at h
  have htilt : (∫ s : ℝ in Ioi L, exp (-s) * (s ^ n * exp (-(a - 1) * s))) =
      ∫ s : ℝ in Ioi L, s ^ n * exp (-(a * s)) := by
    apply setIntegral_congr_fun measurableSet_Ioi
    intro s hs
    calc
      _ = s ^ n * (exp (-s) * exp (-(a - 1) * s)) := by ring
      _ = _ := by rw [← exp_add]; congr 2; ring
  rw [h, htilt, Grothe.UpperChaos.ExponentialTail.exp_moment_tail n L ha]

end

end Grothe.UpperChaos.RadialCutoff
