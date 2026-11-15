import Grothe.UpperChaos.Q0CompanionBaseQuadrature
import Grothe.UpperChaos.ReciprocalDamping

/-! Shared real kernels for the two degree-one base-source integrals.
The reciprocal formulas include the change-of-variables Jacobian. They preserve
the signed companion numerator and are algebraic identities, not numerical
enclosures or a whole-domain quadrature certificate. Agent-ID: codex-aa04. -/

namespace Grothe.UpperChaos.Q0BasePairKernel

open LeanCertProductionProfile LeanCertProductionPanel Q0CompanionBaseQuadrature

noncomputable section

def common (η s k u : ℝ) : ℝ :=
  Real.exp (-(η^2 * u^2) - s - u^2 * s / (1 + k^2 * u^2)) /
    (1 + k^2 * u^2)^2

def first (η s k u : ℝ) : ℝ := 2 * s * common η s k u

def companion (η s k u : ℝ) : ℝ :=
  2 * k * (1 - u^2 * s / (1 + k^2 * u^2)) * common η s k u

theorem first_eq_production (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η 0 1 q0Coeff u s =
      (first η s (q0Kappa s) u : ℂ) := by
  rw [Q0BaseQuadrature.q0_base_quadrature_kernel η u s hu hs]
  apply congrArg Complex.ofReal
  dsimp [first, common]
  ring

theorem companion_eq_production (η u s : ℝ) (hu : 0 < u) (hs : 0 ≤ s) :
    taylorQuadratureKernel η 0 1 companionCoeff u s =
      (companion η s (q0Kappa s) u : ℂ) := by
  rw [companion_base_quadrature_kernel η u s hu hs]
  apply congrArg Complex.ofReal
  dsimp [companion, common]
  ring

def reciprocalCommon (η s k x : ℝ) : ℝ :=
  x^2 * Real.exp (-(η^2 / x^2) - s - s / (x^2 + k^2)) /
    (x^2 + k^2)^2

def reciprocalFirst (η s k x : ℝ) : ℝ := 2 * s * reciprocalCommon η s k x

def reciprocalCompanion (η s k x : ℝ) : ℝ :=
  2 * k * (1 - s / (x^2 + k^2)) * reciprocalCommon η s k x

/-- Removing damping from the shared reciprocal core costs a uniform reserve
without an inverse-coordinate model. This remains valid at the continuous
algebraic extension `x = 0`; production substitution uses positive `x`. -/
theorem reciprocal_common_error (η s k x : ℝ) :
    |reciprocalCommon η s k x - reciprocalCommon 0 s k x| ≤
      η^2 * (Real.exp (-s - s / (x^2 + k^2)) / (x^2 + k^2)^2) := by
  let A := Real.exp (-s - s / (x^2 + k^2)) / (x^2 + k^2)^2
  have hA : 0 ≤ A := div_nonneg (Real.exp_pos _).le (sq_nonneg _)
  have hzero : reciprocalCommon 0 s k x = x^2 * A := by
    dsimp [reciprocalCommon, A]
    simp only [zero_pow (by decide : 2 ≠ 0), zero_div, neg_zero, zero_sub]
    ring
  have heta : reciprocalCommon η s k x =
      x^2 * Real.exp (-(η^2 / x^2)) * A := by
    dsimp [reciprocalCommon, A]
    rw [show -(η^2 / x^2) - s - s / (x^2 + k^2) =
      -(η^2 / x^2) + (-s - s / (x^2 + k^2)) by ring, Real.exp_add]
    ring
  rw [heta, hzero]
  exact ReciprocalDamping.weighted_error η x A hA

theorem direct_common_error (η s k u : ℝ) :
    |common η s k u - common 0 s k u| ≤ η^2 * u^2 * common 0 s k u := by
  have hA : 0 ≤ common 0 s k u := div_nonneg (Real.exp_pos _).le (sq_nonneg _)
  have hid : common η s k u = Real.exp (-(η^2 * u^2)) * common 0 s k u := by
    dsimp [common]
    simp only [zero_pow (by decide : 2 ≠ 0), zero_mul, neg_zero, zero_sub]
    rw [show -(η^2 * u^2) - s - u^2 * s / (1 + k^2 * u^2) =
      -(η^2 * u^2) + (-s - u^2 * s / (1 + k^2 * u^2)) by ring, Real.exp_add]
    ring
  rw [hid]
  exact ReciprocalDamping.direct_weighted_error η u (common 0 s k u) hA

/-- A fully analytic damping reserve independent of the inverse denominator.
This bound remains valid as `x` approaches zero. -/
theorem reciprocal_common_error_uniform (η s k x : ℝ) (hs : 0 < s) :
    |reciprocalCommon η s k x - reciprocalCommon 0 s k x| ≤
      2 * η^2 / s^2 := by
  calc
    _ ≤ η^2 * (Real.exp (-s - s / (x^2 + k^2)) / (x^2 + k^2)^2) :=
      reciprocal_common_error η s k x
    _ ≤ η^2 * (2 / s^2) := mul_le_mul_of_nonneg_left
      (ReciprocalDamping.gaussian_inverse_sq_le s (x^2 + k^2) hs (by positivity))
      (sq_nonneg η)
    _ = _ := by ring

theorem reciprocal_first_error_uniform (η s k x : ℝ) (hs : 0 < s) :
    |reciprocalFirst η s k x - reciprocalFirst 0 s k x| ≤ 4 * η^2 / s := by
  have h := mul_le_mul_of_nonneg_left
    (reciprocal_common_error_uniform η s k x hs) (show 0 ≤ 2 * s by positivity)
  have hid : 2 * s * (2 * η^2 / s^2) = 4 * η^2 / s := by field_simp; ring
  rw [hid] at h
  simpa only [reciprocalFirst, ← mul_sub, abs_mul, abs_of_nonneg (show 0 ≤ 2 * s by
    positivity)] using h

theorem reciprocal_companion_error_uniform (η s k x : ℝ) (hs : 0 < s) :
    |reciprocalCompanion η s k x - reciprocalCompanion 0 s k x| ≤
      16 * |k| * η^2 / s^2 := by
  let D := x^2 + k^2
  let A := Real.exp (-s - s / D) / D^2
  have h := reciprocal_common_error η s k x
  have hg := ReciprocalDamping.gaussian_companion_factor_le s D hs (by dsimp [D]; positivity)
  calc
    _ = 2 * |k| * (|1 - s / D| *
        |reciprocalCommon η s k x - reciprocalCommon 0 s k x|) := by
      simp only [reciprocalCompanion, ← mul_sub, abs_mul,
        abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 2), D]
      ring
    _ ≤ 2 * |k| * (|1 - s / D| * (η^2 * A)) := by
      gcongr
    _ = (2 * |k| * η^2) * (|1 - s / D| * A) := by ring
    _ ≤ (2 * |k| * η^2) * (8 / s^2) :=
      mul_le_mul_of_nonneg_left hg (by positivity)
    _ = _ := by ring

private theorem reciprocal_argument (s k x : ℝ) (hx : x ≠ 0) :
    (x⁻¹)^2 * s / (1 + k^2 * (x⁻¹)^2) = s / (x^2 + k^2) := by
  have hd : x^2 + k^2 ≠ 0 :=
    (add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero hx) (sq_nonneg k)).ne'
  have hb : 1 + k^2 * (x⁻¹)^2 ≠ 0 := by positivity
  field_simp [hx, hd, hb]

theorem reciprocal_common (η s k x : ℝ) (hx : x ≠ 0) :
    (x⁻¹)^2 * common η s k (x⁻¹) = reciprocalCommon η s k x := by
  have hd : x^2 + k^2 ≠ 0 :=
    (add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero hx) (sq_nonneg k)).ne'
  have hb : 1 + k^2 * (x⁻¹)^2 ≠ 0 := by positivity
  have he : -(η^2 * (x⁻¹)^2) - s - (x⁻¹)^2 * s / (1 + k^2 * (x⁻¹)^2) =
      -(η^2 / x^2) - s - s / (x^2 + k^2) := by
    rw [reciprocal_argument s k x hx]
    simp only [div_eq_mul_inv, inv_pow]
  dsimp only [common, reciprocalCommon]
  rw [he]
  field_simp [hx, hd, hb]

theorem reciprocal_first (η s k x : ℝ) (hx : x ≠ 0) :
    (x⁻¹)^2 * first η s k (x⁻¹) = reciprocalFirst η s k x := by
  calc
    _ = 2 * s * ((x⁻¹)^2 * common η s k (x⁻¹)) := by unfold first; ring
    _ = _ := by rw [reciprocal_common η s k x hx]; rfl

theorem reciprocal_companion (η s k x : ℝ) (hx : x ≠ 0) :
    (x⁻¹)^2 * companion η s k (x⁻¹) = reciprocalCompanion η s k x := by
  calc
    _ = 2 * k * (1 - (x⁻¹)^2 * s / (1 + k^2 * (x⁻¹)^2)) *
        ((x⁻¹)^2 * common η s k (x⁻¹)) := by unfold companion; ring
    _ = _ := by
      rw [reciprocal_argument s k x hx, reciprocal_common η s k x hx]
      rfl

end
end Grothe.UpperChaos.Q0BasePairKernel
