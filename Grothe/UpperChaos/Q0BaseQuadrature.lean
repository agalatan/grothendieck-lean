import Grothe.UpperChaos.ConditionalGaussianBase
import Grothe.UpperChaos.LeanCertProductionProfile
import Grothe.UpperChaos.LeanCertProductionPanel
import Grothe.UpperChaos.TaylorQuadrature

/-!
# Zeroth Taylor source in the first Hermite coordinate

The first-coordinate conditional base integral has an exact affine
cancellation. This gives a small regular quadrature kernel without expanding
the phase polynomial. The outer `1 / √π` belongs to `taylorQuadratureValue`,
not to the kernel below. No numerical enclosure is asserted.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0BaseQuadrature

open Grothe.UpperChaos.LeanCertProductionPanel
open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

/-- The exact base-source conditional Wick expression at a real squared
radius; the factor `s` arises from the first Hermite coordinate. -/
theorem q0_base_conditional_wick (s t : ℝ) (hs : 0 ≤ s) (ht : 0 < t) :
    taylorConditionalWick 0 1 q0Coeff t (Real.sqrt s : ℂ) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(t * s / (1 + q0Kappa s ^ 2 * t))) *
        s / (1 + q0Kappa s ^ 2 * t) ^ 2 : ℝ) : ℂ) := by
  let z : ℂ := (Real.sqrt s : ℂ)
  have hz : Complex.normSq z = s := by
    dsimp [z]
    simpa [Complex.normSq_ofReal] using Real.mul_self_sqrt hs
  have hk : Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2) =
      q0Kappa s := by
    simpa [z] using (q0Kappa_eq_wick_profile s hs).symm
  have hbase :
      (∫ w : ℂ, Haag.phaseLaplaceKernel (z + (q0Kappa s : ℂ) * w) t ∂gaussC) =
        ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(t * s / (1 + q0Kappa s ^ 2 * t))) : ℝ) : ℂ) *
          z / ((1 + q0Kappa s ^ 2 * t : ℝ) : ℂ) ^ 2 := by
    have h := integral_affine_phaseLaplace_base 1 (q0Kappa s) t z (by norm_num) ht
    simpa only [sub_self, zero_mul, neg_zero, Real.exp_zero, Complex.ofReal_one,
      mul_one, one_mul, hz] using h
  change taylorConditionalWick 0 1 q0Coeff t z = _
  rw [← integral_taylorInnerSource_conditional 0 1 q0Coeff t z ht]
  simp only [taylorInnerSource, taylorPhasePower, pow_zero, mul_one, q0_pointwise,
    basePhaseArgument, hk]
  rw [integral_const_mul, hbase]
  have hzz : conj z * z = (s : ℂ) := by
    dsimp [z]
    rw [Complex.conj_ofReal, ← Complex.ofReal_mul, Real.mul_self_sqrt hs]
  calc
    _ = ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(t * s / (1 + q0Kappa s ^ 2 * t))) : ℝ) : ℂ) *
        (conj z * z) / ((1 + q0Kappa s ^ 2 * t : ℝ) : ℂ) ^ 2 := by ring
    _ = _ := by rw [hzz]; push_cast; ring

/-- Exact regular kernel for `j=0`, `q0`, valid on the positive auxiliary
axis and the nonnegative squared-radius axis. -/
theorem q0_base_quadrature_kernel (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η 0 1 q0Coeff u s =
      ((2 * s * Real.exp (-(η ^ 2 * u ^ 2) - s -
          u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2)) /
        (1 + q0Kappa s ^ 2 * u ^ 2) ^ 2 : ℝ) : ℂ) := by
  have hrpow : (u ^ 2) ^ (-(1 / 2 : ℝ)) = u⁻¹ := by
    rw [Real.rpow_neg (sq_nonneg u), ← Real.sqrt_eq_rpow,
      Real.sqrt_sq_eq_abs, abs_of_pos hu]
  have he : Real.exp (-(η ^ 2 * u ^ 2)) * Real.exp (-s) *
      Real.exp (-(u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2))) =
      Real.exp (-(η ^ 2 * u ^ 2) - s - u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2)) := by
    rw [← Real.exp_add, ← Real.exp_add]
    congr 1
  have heC := congrArg (fun x : ℝ => (x : ℂ)) he
  push_cast at heC
  rw [taylorQuadratureKernel, taylorRegularWick_eq 0 1 q0Coeff u hu,
    q0_base_conditional_wick s (u ^ 2) hs (sq_pos_of_pos hu), hrpow]
  push_cast
  rw [← heC]
  have huC : (u : ℂ) ≠ 0 := by exact_mod_cast hu.ne'
  have hcancel : (u : ℂ) * (u : ℂ)⁻¹ = 1 := mul_inv_cancel₀ huC
  calc
    _ = ((u : ℂ) * (u : ℂ)⁻¹) *
        ((2 : ℂ) * (s : ℂ) * (Real.exp (-(η ^ 2 * u ^ 2)) : ℂ) *
          (Real.exp (-s) : ℂ) *
          (Real.exp (-(u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2))) : ℂ) /
          ((1 + q0Kappa s ^ 2 * u ^ 2 : ℝ) : ℂ) ^ 2) := by
      push_cast
      simp only [div_eq_mul_inv]
      ring
    _ = _ := by rw [hcancel, one_mul]; push_cast; ring

end
end Grothe.UpperChaos.Q0BaseQuadrature
