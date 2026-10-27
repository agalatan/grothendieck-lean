import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Elementary real bounds for the centered conditional Gaussian kernel

The profile bound treats `β` as an arbitrary positive real number. The only
exponential estimate is the degree-two term of Mathlib's exponential series.
The optional power-tail integral is a direct improper-integral specialization.

Agent-ID: codex-44c5
-/

open MeasureTheory Set

namespace Grothe.UpperChaos

/-- The quadratic exponential profile has the elementary global bound two. -/
theorem sq_mul_exp_neg_le_two {y : ℝ} (hy : 0 ≤ y) :
    y ^ 2 * Real.exp (-y) ≤ 2 := by
  have hpow := Real.pow_div_factorial_le_exp y hy 2
  norm_num at hpow
  have hm : (y ^ 2 / 2) * Real.exp (-y) ≤ 1 := by
    calc
      _ ≤ Real.exp y * Real.exp (-y) :=
        mul_le_mul_of_nonneg_right hpow (Real.exp_pos _).le
      _ = 1 := by rw [← Real.exp_add]; simp
  nlinarith

/-- A positive conditional Gaussian profile decays quadratically in the auxiliary parameter. -/
theorem conditional_gaussian_profile_le (r α t β : ℝ)
    (hr : 0 < r) (hα : 0 < α) (ht : 0 < t) (hβ : 0 < β) :
    r * α / β ^ 2 * Real.exp (-(α * r ^ 2 * t / β)) ≤
      2 / (α * r ^ 3 * t ^ 2) := by
  let y : ℝ := α * r ^ 2 * t / β
  have hy : 0 ≤ y := by dsimp only [y]; positivity
  have hprofile := sq_mul_exp_neg_le_two hy
  have hcoefficient : r * α / β ^ 2 = y ^ 2 / (α * r ^ 3 * t ^ 2) := by
    dsimp only [y]
    field_simp [hr.ne', hα.ne', ht.ne', hβ.ne']
  change r * α / β ^ 2 * Real.exp (-y) ≤ 2 / (α * r ^ 3 * t ^ 2)
  calc
    _ = (y ^ 2 / (α * r ^ 3 * t ^ 2)) * Real.exp (-y) := by rw [hcoefficient]
    _ = (y ^ 2 * Real.exp (-y)) / (α * r ^ 3 * t ^ 2) := by ring
    _ ≤ 2 / (α * r ^ 3 * t ^ 2) :=
      div_le_div_of_nonneg_right hprofile (by positivity)

/-- Combining the Laplace half-power with the quadratic profile gives `t^(-5/2)`. -/
theorem rpow_neg_half_div_sq {t : ℝ} (ht : 0 < t) :
    t ^ (-1 / 2 : ℝ) / t ^ 2 = t ^ (-5 / 2 : ℝ) := by
  have h := Real.rpow_sub ht (-1 / 2 : ℝ) (2 : ℝ)
  have hexponent : (-1 / 2 : ℝ) - 2 = -5 / 2 := by norm_num
  rw [hexponent] at h
  simpa only [Real.rpow_ofNat] using h.symm

/-- Pointwise power-tail bound for the full conditional base kernel profile. -/
theorem conditional_gaussian_laplace_profile_le (r α t β : ℝ)
    (hr : 0 < r) (hα : 0 < α) (ht : 0 < t) (hβ : 0 < β) :
    t ^ (-1 / 2 : ℝ) * Real.exp (-(α * r ^ 2 * t / β)) * α * r / β ^ 2 ≤
      (2 / (α * r ^ 3)) * t ^ (-5 / 2 : ℝ) := by
  have hprofile := mul_le_mul_of_nonneg_left
    (conditional_gaussian_profile_le r α t β hr hα ht hβ)
    (Real.rpow_nonneg ht.le (-1 / 2 : ℝ))
  calc
    _ = t ^ (-1 / 2 : ℝ) *
        (r * α / β ^ 2 * Real.exp (-(α * r ^ 2 * t / β))) := by ring
    _ ≤ t ^ (-1 / 2 : ℝ) * (2 / (α * r ^ 3 * t ^ 2)) := hprofile
    _ = (2 / (α * r ^ 3)) * (t ^ (-1 / 2 : ℝ) / t ^ 2) := by
      field_simp [hr.ne', hα.ne', ht.ne']
    _ = _ := by rw [rpow_neg_half_div_sq ht]

/-- A lower radial cutoff gives a uniform tail majorant independent of `r` and `β`. -/
theorem conditional_gaussian_laplace_profile_le_uniform (r r₀ α t β : ℝ)
    (hr₀ : 0 < r₀) (hrr₀ : r₀ ≤ r) (hα : 0 < α) (ht : 0 < t) (hβ : 0 < β) :
    t ^ (-1 / 2 : ℝ) * Real.exp (-(α * r ^ 2 * t / β)) * α * r / β ^ 2 ≤
      (2 / (α * r₀ ^ 3)) * t ^ (-5 / 2 : ℝ) := by
  have hr : 0 < r := hr₀.trans_le hrr₀
  have hden : α * r₀ ^ 3 ≤ α * r ^ 3 :=
    mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hr₀.le hrr₀ 3) hα.le
  have hcoef : 2 / (α * r ^ 3) ≤ 2 / (α * r₀ ^ 3) :=
    div_le_div_of_nonneg_left (by norm_num) (by positivity) hden
  exact (conditional_gaussian_laplace_profile_le r α t β hr hα ht hβ).trans
    (mul_le_mul_of_nonneg_right hcoef (Real.rpow_nonneg ht.le _))

/-- The auxiliary power-tail majorant is integrable above every positive cutoff. -/
theorem integrableOn_rpow_neg_five_halves_Ioi {T : ℝ} (hT : 0 < T) :
    IntegrableOn (fun t : ℝ => t ^ (-5 / 2 : ℝ)) (Ioi T) :=
  integrableOn_Ioi_rpow_of_lt (by norm_num) hT

/-- Exact integral of the `t^(-5/2)` power-tail majorant. -/
theorem integral_rpow_neg_five_halves_Ioi {T : ℝ} (hT : 0 < T) :
    (∫ t : ℝ in Ioi T, t ^ (-5 / 2 : ℝ)) = (2 / 3 : ℝ) * T ^ (-3 / 2 : ℝ) := by
  have h := integral_Ioi_rpow_of_lt (a := (-5 / 2 : ℝ)) (by norm_num) hT
  have hexponent : (-5 / 2 : ℝ) + 1 = -3 / 2 := by norm_num
  rw [hexponent] at h
  rw [h]
  ring

/-- The profile is integrable above a positive cutoff for every measurable positive rate. -/
theorem integrableOn_conditional_gaussian_laplace_profile
    (β : ℝ → ℝ) (hβmeas : Measurable β) (r r₀ α T : ℝ)
    (hr₀ : 0 < r₀) (hrr₀ : r₀ ≤ r) (hα : 0 < α) (hT : 0 < T)
    (hβpos : ∀ t ∈ Ioi T, 0 < β t) :
    IntegrableOn (fun t : ℝ => t ^ (-1 / 2 : ℝ) *
      Real.exp (-(α * r ^ 2 * t / β t)) * α * r / (β t) ^ 2) (Ioi T) := by
  let f : ℝ → ℝ := fun t => t ^ (-1 / 2 : ℝ) *
    Real.exp (-(α * r ^ 2 * t / β t)) * α * r / (β t) ^ 2
  let C : ℝ := 2 / (α * r₀ ^ 3)
  have hmajor : IntegrableOn (fun t : ℝ => C * t ^ (-5 / 2 : ℝ)) (Ioi T) :=
    (integrableOn_rpow_neg_five_halves_Ioi hT).const_mul C
  have hfmeas : Measurable f := by
    dsimp only [f]
    fun_prop
  have hr : 0 < r := hr₀.trans_le hrr₀
  refine hmajor.mono' hfmeas.aestronglyMeasurable ?_
  filter_upwards [ae_restrict_mem measurableSet_Ioi] with t ht
  have htpos : 0 < t := hT.trans ht
  have hnonneg : 0 ≤ f t := by
    dsimp only [f]
    positivity
  rw [Real.norm_eq_abs, abs_of_nonneg hnonneg]
  exact conditional_gaussian_laplace_profile_le_uniform r r₀ α t (β t)
    hr₀ hrr₀ hα htpos (hβpos t ht)

/-- Uniform integrated tail of the conditional profile, with arbitrary measurable positive rate. -/
theorem integral_conditional_gaussian_laplace_profile_tail_le
    (β : ℝ → ℝ) (hβmeas : Measurable β) (r r₀ α T : ℝ)
    (hr₀ : 0 < r₀) (hrr₀ : r₀ ≤ r) (hα : 0 < α) (hT : 0 < T)
    (hβpos : ∀ t ∈ Ioi T, 0 < β t) :
    (∫ t : ℝ in Ioi T, t ^ (-1 / 2 : ℝ) *
      Real.exp (-(α * r ^ 2 * t / β t)) * α * r / (β t) ^ 2) ≤
        (2 / (α * r₀ ^ 3)) * (2 / 3 : ℝ) * T ^ (-3 / 2 : ℝ) := by
  have hf := integrableOn_conditional_gaussian_laplace_profile β hβmeas
    r r₀ α T hr₀ hrr₀ hα hT hβpos
  have hg : IntegrableOn
      (fun t : ℝ => (2 / (α * r₀ ^ 3)) * t ^ (-5 / 2 : ℝ)) (Ioi T) :=
    (integrableOn_rpow_neg_five_halves_Ioi hT).const_mul _
  calc
    _ ≤ ∫ t : ℝ in Ioi T, (2 / (α * r₀ ^ 3)) * t ^ (-5 / 2 : ℝ) := by
      apply setIntegral_mono_on hf hg measurableSet_Ioi
      intro t ht
      exact conditional_gaussian_laplace_profile_le_uniform r r₀ α t (β t)
        hr₀ hrr₀ hα (hT.trans ht) (hβpos t ht)
    _ = _ := by
      rw [integral_const_mul, integral_rpow_neg_five_halves_Ioi hT]
      ring

end Grothe.UpperChaos
