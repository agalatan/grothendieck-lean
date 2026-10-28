import Grothe.UpperChaos.Q0BaseQuadrature
import Grothe.UpperChaos.ShiftedMomentRecurrence

/-!
# Zeroth Taylor source in the companion first-grade coordinate

The normalized unit Hermite mode `(q,c,d) = (0,1,0)` is the second complex
coordinate. Its conditional moment can change sign. The outer `1 / √π` is
part of the quadrature value and is not included in the kernel below.

Agent-ID: codex-8c4d
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.Q0CompanionBaseQuadrature

open Grothe.UpperChaos.LeanCertProductionProfile

noncomputable section

def companionIndex : GradedIdx 1 :=
  ⟨⟨0, by decide⟩, ⟨⟨1, by decide⟩, ⟨0, by decide⟩⟩⟩

def companionCoeff : ℕ → ℕ → ℕ → ℚ := gradedUnitCoeff companionIndex

/-- The normalization of this unit Hermite basis function is exactly one. -/
theorem companion_pointwise (u : ℂ × ℂ) :
    gradedHermiteFn 1 companionCoeff u = u.2 := by
  rw [show gradedHermiteFn 1 companionCoeff = hfun2 (gradedIdx companionIndex) from
    gradedHermiteFn_unit companionIndex]
  simp [companionIndex, gradedIdx, gradedMode, hfun2, nrm2, fac2, H2,
    H_succ_left, H_zero_zero, A0, ev, zv]

/-- The affine `conj w` moment retains its signed cancellation. -/
theorem affine_conj_moment (r a t : ℝ) (ht : 0 < t) :
    let β := 1 + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * (r : ℂ)
    (r : ℂ) * shiftedDampedMoment β μ 0 1 +
      (a : ℂ) * shiftedDampedMoment β μ 1 1 =
      ((a * (1 - t * r ^ 2 / β) / β ^ 2 : ℝ) : ℂ) := by
  dsimp only
  have hβ : 0 < 1 + a ^ 2 * t := by positivity
  have hβC : ((1 + a ^ 2 * t : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hβ.ne'
  have h := shiftedDampedMoment_affine_step 1 a t (r : ℂ) 0 1 (by norm_num) ht
  dsimp only at h
  simp only [Nat.cast_one, zero_add, Nat.reduceSub, mul_one,
    shiftedDampedMoment_zero_zero] at h
  rw [h, shiftedDampedMoment_zero_one]
  simp only [map_mul, map_neg, Complex.conj_ofReal]
  push_cast at hβC
  push_cast
  field_simp [hβC]
  ring

/-- The actual zeroth-source conditional Wick value for the companion mode. -/
theorem companion_base_conditional_wick (s t : ℝ) (hs : 0 ≤ s) (ht : 0 < t) :
    taylorConditionalWick 0 1 companionCoeff t (Real.sqrt s : ℂ) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(t * s / (1 + q0Kappa s ^ 2 * t))) *
        (q0Kappa s * (1 - t * s / (1 + q0Kappa s ^ 2 * t)) /
          (1 + q0Kappa s ^ 2 * t) ^ 2) : ℝ) : ℂ) := by
  let z : ℂ := (Real.sqrt s : ℂ)
  have hz : Complex.normSq z = s := by
    dsimp [z]
    simpa [Complex.normSq_ofReal] using Real.mul_self_sqrt hs
  have hk : Real.sqrt (1 + (Grothe.Upper.aQ : ℝ) ^ 2) * vprof (‖z‖ ^ 2) =
      q0Kappa s := by
    simpa [z] using (q0Kappa_eq_wick_profile s hs).symm
  have hmoment := integral_affine_phaseLaplace_monomial 0 1 1 (q0Kappa s) t z
    (by norm_num) ht
  dsimp only at hmoment
  simp only [pow_zero, pow_one, one_mul, sub_self, zero_mul, neg_zero,
    Real.exp_zero, Complex.ofReal_one, mul_one, hz] at hmoment
  have hbracket := affine_conj_moment (Real.sqrt s) (q0Kappa s) t ht
  dsimp only at hbracket
  rw [Real.sq_sqrt hs] at hbracket
  change taylorConditionalWick 0 1 companionCoeff t z = _
  rw [← integral_taylorInnerSource_conditional 0 1 companionCoeff t z ht]
  simp only [taylorInnerSource, taylorPhasePower, pow_zero, mul_one,
    companion_pointwise, basePhaseArgument, hk]
  rw [hmoment, hbracket]
  push_cast
  rfl

/-- Exact regular companion kernel; the parenthesized factor preserves sign. -/
theorem companion_base_quadrature_kernel (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η 0 1 companionCoeff u s =
      ((2 * q0Kappa s * (1 - u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2)) *
        Real.exp (-(η ^ 2 * u ^ 2) - s - u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2)) /
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
  rw [taylorQuadratureKernel, taylorRegularWick_eq 0 1 companionCoeff u hu,
    companion_base_conditional_wick s (u ^ 2) hs (sq_pos_of_pos hu), hrpow]
  push_cast
  rw [← heC]
  have huC : (u : ℂ) ≠ 0 := by exact_mod_cast hu.ne'
  have hcancel : (u : ℂ) * (u : ℂ)⁻¹ = 1 := mul_inv_cancel₀ huC
  calc
    _ = ((u : ℂ) * (u : ℂ)⁻¹) *
      ((2 : ℂ) * (q0Kappa s : ℂ) *
        (1 - ((u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2) : ℝ) : ℂ)) *
        (Real.exp (-(η ^ 2 * u ^ 2)) : ℂ) * (Real.exp (-s) : ℂ) *
        (Real.exp (-(u ^ 2 * s / (1 + q0Kappa s ^ 2 * u ^ 2))) : ℂ) /
          ((1 + q0Kappa s ^ 2 * u ^ 2 : ℝ) : ℂ) ^ 2) := by push_cast; ring
    _ = _ := by rw [hcancel, one_mul]; push_cast; ring

end
end Grothe.UpperChaos.Q0CompanionBaseQuadrature
