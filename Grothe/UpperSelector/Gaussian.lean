import Grothe.UpperSix.Haagerup.ChaosRealise
import Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform

/-!
# Gaussian moments of the angular selector

The random angle of an angular selector depends on the centered squared length of a
standard complex Gaussian. For a pair with correlation `r`, an orthogonal change of
coordinates turns the sum of the two squared lengths into a weighted sum of independent
squared lengths. Its characteristic function is a geometric atom in `r ^ 2`. The norms
of its leading coefficient and common ratio add to one, including at frequency zero.
-/

open MeasureTheory Complex GaussianFourier
open scoped Real

set_option warningAsError true

namespace Haagerup.AngularSelector

/-- Characteristic function of the squared length of one standard complex Gaussian. -/
theorem normSq_char (t : ℝ) :
    (∫ z : ℂ, exp (I * t * (normSq z : ℂ)) ∂gaussC) = (1 - I * t)⁻¹ := by
  let f := fun z : ℂ ↦ exp (I * t * (normSq z : ℂ))
  let b : ℂ := 1 - I * t
  have hb : 0 < b.re := by simp [b]
  have hfi : Integrable f gaussC := by
    refine (integrable_const (1 : ℝ)).mono' (by dsimp [f]; fun_prop) (ae_of_all _ fun z ↦ ?_)
    simp [f, Complex.norm_exp]
  have hgi : Integrable (fun z : ℂ ↦ (Real.pi : ℂ)⁻¹ * exp (-b * (‖z‖ : ℂ) ^ 2)) := by
    apply Integrable.const_mul
    simpa using (integrable_cexp_neg_mul_sq_norm_add (V := ℂ) hb 0 0)
  have hw (z : ℂ) :
      ((Real.pi⁻¹ * Real.exp (-normSq z) : ℝ) : ℂ) * f z =
        (Real.pi : ℂ)⁻¹ * exp (-b * (‖z‖ : ℂ) ^ 2) := by
    simp only [Complex.ofReal_mul, Complex.ofReal_inv, Complex.ofReal_exp, Complex.ofReal_neg,
      f, mul_assoc, ← exp_add]
    congr 2
    rw [normSq_eq_norm_sq, Complex.ofReal_pow]
    dsimp [b]
    ring
  have hwint :
      (∫ z : ℂ, f z ∂gaussC) = ∫ z : ℂ, (Real.pi : ℂ)⁻¹ * exp (-b * (‖z‖ : ℂ) ^ 2) := by
    apply Complex.ext
    · simp only [← RCLike.re_to_complex]
      rw [← integral_re hfi, ← integral_re hgi]
      simp only [RCLike.re_to_complex]
      rw [integral_gaussC_eq_volume (fun z ↦ (f z).re) (by dsimp [f]; fun_prop)]
      apply integral_congr_ae
      filter_upwards [] with z
      rw [← hw]
      simp only [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
    · simp only [← RCLike.im_to_complex]
      rw [← integral_im hfi, ← integral_im hgi]
      simp only [RCLike.im_to_complex]
      rw [integral_gaussC_eq_volume (fun z ↦ (f z).im) (by dsimp [f]; fun_prop)]
      apply integral_congr_ae
      filter_upwards [] with z
      rw [← hw]
      simp only [Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im, zero_mul, add_zero]
  change (∫ z : ℂ, f z ∂gaussC) = b⁻¹
  rw [hwint, integral_const_mul, integral_cexp_neg_mul_sq_norm (V := ℂ) hb]
  have hp : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  simp [Complex.finrank_real_complex, div_eq_mul_inv, hp]

/-- Real orthogonal coordinates diagonalize the quadratic sum in a Mehler pair. -/
private theorem coupled_normSq_char_aux {a b : ℝ} (hab : a ^ 2 + b ^ 2 = 1) (t : ℝ) :
    (∫ u : ℂ × ℂ, exp (I * t * (normSq u.1 +
      normSq (((a ^ 2 - b ^ 2 : ℝ) : ℂ) * u.1 + ((2 * a * b : ℝ) : ℂ) * u.2) : ℝ)) ∂mu2) =
      (1 - I * (t * (2 * a ^ 2) : ℝ))⁻¹ * (1 - I * (t * (2 * b ^ 2) : ℝ))⁻¹ := by
  let rot (p : ℂ × ℂ) : ℂ × ℂ := ((a : ℂ) * p.1 - (b : ℂ) * p.2,
    (b : ℂ) * p.1 + (a : ℂ) * p.2)
  let F (u : ℂ × ℂ) := exp (I * t * (normSq u.1 +
    normSq (((a ^ 2 - b ^ 2 : ℝ) : ℂ) * u.1 + ((2 * a * b : ℝ) : ℂ) * u.2) : ℝ))
  have hrot : mu2.map rot = mu2 := by
    simpa [rot, sub_eq_add_neg] using (map_orth_mu2 (a := a) (b := -b) (by nlinarith))
  have hmap : (∫ u, F u ∂mu2) = ∫ u, F (rot u) ∂mu2 := by
    calc
      _ = ∫ u, F u ∂(mu2.map rot) := by rw [hrot]
      _ = _ := integral_map (by dsimp [rot]; fun_prop) (by dsimp [F]; fun_prop)
  have hcast : (a : ℂ) ^ 2 + (b : ℂ) ^ 2 = 1 := by exact_mod_cast hab
  have hcoord (z w : ℂ) :
      ((a ^ 2 - b ^ 2 : ℝ) : ℂ) * (a * z - b * w) + ((2 * a * b : ℝ) : ℂ) * (b * z + a * w)
        = a * z + b * w := by
    push_cast
    linear_combination (a * z + b * w) * hcast
  have hsum (z w : ℂ) :
      normSq ((a : ℂ) * z - b * w) + normSq ((a : ℂ) * z + b * w) =
        2 * a ^ 2 * normSq z + 2 * b ^ 2 * normSq w := by
    simp [normSq_sub, normSq_add, normSq_mul, normSq_ofReal]
    ring
  let X (v : ℝ) (z : ℂ) := exp (I * v * (normSq z : ℂ))
  have hsep (u : ℂ × ℂ) : F (rot u) = X (t * (2 * a ^ 2)) u.1 * X (t * (2 * b ^ 2)) u.2 := by
    dsimp [F, rot, X]
    rw [hcoord, hsum, ← exp_add]
    push_cast
    ring_nf
  change (∫ u, F u ∂mu2) = _
  rw [hmap]
  simp_rw [hsep]
  rw [integral_prod_mul, normSq_char, normSq_char]

/-- Exact characteristic function of the centered squared - length sum in the actual Mehler pair. -/
theorem selectorCharacteristic {r : ℝ} (hrlo : -1 ≤ r) (hrhi : r ≤ 1) (t : ℝ) :
    (∫ u : ℂ × ℂ, exp (I * t * ((normSq u.1 + normSq (mY (r : ℂ) u) - 2 : ℝ) : ℂ)) ∂mu2) =
      exp (-2 * I * t) / ((1 - I * t) ^ 2 + (t : ℂ) ^ 2 * (r : ℂ) ^ 2) := by
  let a := √((1 + r)/2)
  let b := √((1 - r)/2)
  have ha : a ^ 2 = (1 + r)/2 := Real.sq_sqrt (by linarith)
  have hb : b ^ 2 = (1 - r)/2 := Real.sq_sqrt (by linarith)
  have hab : a ^ 2 + b ^ 2 = 1 := by rw [ha, hb]; ring
  have hd : a ^ 2 - b ^ 2 = r := by rw [ha, hb]; ring
  have hc : (2 * a * b) ^ 2 = 1 - r ^ 2 := by
    calc
      _ = 4 * a ^ 2 * b ^ 2 := by ring
      _ = _ := by rw [ha, hb]; ring
  have hs : sig (r : ℂ) = ((2 * a * b : ℝ) : ℂ) := by
    simp only [sig, Complex.norm_real, Real.norm_eq_abs, sq_abs]
    rw [← hc, Real.sqrt_sq (by dsimp [a, b]; positivity)]
  have hm (u : ℂ × ℂ) : mY (r : ℂ) u =
      (((a ^ 2 - b ^ 2 : ℝ) : ℂ) * u.1 + ((2 * a * b : ℝ) : ℂ) * u.2) := by rw [mY, hs, hd]
  have center (u : ℂ × ℂ) :
      exp (I * t * ((normSq u.1 + normSq (mY (r : ℂ) u) - 2 : ℝ) : ℂ)) =
      exp (-2 * I * t) * exp (I * t * ((normSq u.1 + normSq (mY (r : ℂ) u) : ℝ) : ℂ)) := by
    rw [← exp_add]
    congr 1
    push_cast
    ring
  simp_rw [center, hm]
  rw [integral_const_mul, coupled_normSq_char_aux hab, ha, hb]
  have heq : (1 - I * ((t * (2 * ((1 + r)/2)) : ℝ) : ℂ)) * (1 - I * ((t * (2 * ((1 - r)/2)) : ℝ) : ℂ))
      = (1 - I * t) ^ 2 + (t:ℂ) ^ 2 * (r:ℂ) ^ 2 := by
    push_cast
    ring_nf
    simp
  rw [← mul_inv, heq, div_eq_mul_inv]

/-- Leading complex Fourier moment of a single selector. -/
noncomputable def geometricFirst (t : ℝ) : ℂ := exp (-2 * I * t) / (1 - I * t) ^ 2

/-- Successive selector moments have this common ratio. -/
noncomputable def geometricRatio (t : ℝ) : ℂ := -(t : ℂ) ^ 2 / (1 - I * t) ^ 2

private lemma norm_denominator (t : ℝ) : ‖(1 - I * t) ^ 2‖ = 1 + t ^ 2 := by
  rw [norm_pow, ← normSq_eq_norm_sq]
  simp [normSq_apply, pow_two]

theorem norm_geometricFirst (t : ℝ) : ‖geometricFirst t‖ = (1 + t ^ 2)⁻¹ := by
  rw [geometricFirst, norm_div, norm_denominator]
  simp [norm_exp]

theorem norm_geometricRatio (t : ℝ) : ‖geometricRatio t‖ = t ^ 2 / (1 + t ^ 2) := by
  rw [geometricRatio, norm_div, norm_neg, norm_pow, norm_denominator]
  simp

theorem norm_geometricRatio_lt_one (t : ℝ) : ‖geometricRatio t‖ < 1 := by
  rw [norm_geometricRatio]
  have hp : 0 < 1 + t ^ 2 := by positivity
  rw [div_lt_one hp]
  linarith

theorem norm_geometricFirst_eq (t : ℝ) : ‖geometricFirst t‖ = 1 - ‖geometricRatio t‖ := by
  rw [norm_geometricFirst, norm_geometricRatio]
  field_simp [show 1 + t ^ 2 ≠ 0 by positivity]
  ring

/-- The characteristic function is a normalized geometric atom in the squared correlation. -/
theorem selectorCharacteristic_geometric {r : ℝ} (hrlo : -1 ≤ r) (hrhi : r ≤ 1) (t : ℝ) :
    (∫ u : ℂ × ℂ, exp (I * t * ((normSq u.1 + normSq (mY (r : ℂ) u) - 2 : ℝ) : ℂ)) ∂mu2) =
      geometricFirst t / (1 - geometricRatio t * (r : ℂ) ^ 2) := by
  rw [selectorCharacteristic hrlo hrhi, geometricFirst, geometricRatio, div_div]
  congr 1
  have hne : 1 - I * (t : ℂ) ≠ 0 := by
    intro h
    have h' := congrArg Complex.re h
    simp at h'
  field_simp [hne]
  ring

end Haagerup.AngularSelector
