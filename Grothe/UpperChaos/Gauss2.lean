import Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform
import Mathlib.MeasureTheory.Integral.Prod

/-!
# The two-dimensional Gaussian integral with a complex linear term

For a real positive definite form `Z = [[a, b], [b, c]]` and complex `u, v`,

    ∫_{ℝ²} exp(−(a x₁² + 2b x₁x₂ + c x₂²)/2 + u x₁ + v x₂) dx
      = 2π / √(ac − b²) · exp((c u² − 2b u v + a v²) / (2(ac − b²))),

i.e. `(2π)^{d/2} det(Z)^{-1/2} exp(wᵀZ⁻¹w/2)` for `d = 2`. This is the Gaussian integral used by the Schur
bound of the `hardy` plan (step 3, `data/upper-preprocess/inputs/GAUSSIAN_SCHUR_TAIL_PROOF.md`): there the
quadratic part is real and the linear part complex. Proof: integrate `x₁` first (one-dimensional
`integral_cexp_quadratic`), which leaves a one-dimensional Gaussian in `x₂`.
-/

open MeasureTheory Complex
open scoped Real

namespace Grothe.UpperChaos.Gauss2

/-- The integrand. -/
noncomputable def g (a b c : ℝ) (u v : ℂ) (x : ℝ × ℝ) : ℂ :=
  cexp (-(a * x.1 ^ 2 + 2 * b * x.1 * x.2 + c * x.2 ^ 2) / 2 + u * x.1 + v * x.2)

/-- `(π / r)^{1/2}` as a complex power of a positive real is the real square root. -/
lemma cpow_half_of_pos {r : ℝ} (hr : 0 < r) :
    ((π : ℂ) / (r : ℂ)) ^ (1 / 2 : ℂ) = ((√(π / r) : ℝ) : ℂ) := by
  rw [Real.sqrt_eq_rpow, ← ofReal_div, ofReal_cpow (by positivity)]
  norm_num

/-- The inner integral over `x₁`, for fixed `x₂`. -/
lemma integral_inner {a : ℝ} (ha : 0 < a) (b c : ℝ) (u v : ℂ) (y : ℝ) :
    ∫ x : ℝ, g a b c u v (x, y) =
      ((√(2 * π / a) : ℝ) : ℂ) *
        cexp (-(c * y ^ 2) / 2 + v * y + (u - b * y) ^ 2 / (2 * a)) := by
  have hb : ((-(a : ℂ) / 2)).re < 0 := by simp; linarith
  have h := integral_cexp_quadratic hb (u - b * y) (-(c * y ^ 2) / 2 + v * y)
  have e : ∀ x : ℝ, g a b c u v (x, y) =
      cexp (-(a : ℂ) / 2 * x ^ 2 + (u - b * y) * x + (-(c * y ^ 2) / 2 + v * y)) := by
    intro x; simp only [g]; congr 1; ring
  simp_rw [e, h]
  have h2 : (π : ℂ) / -(-(a : ℂ) / 2) = (π : ℂ) / ((a / 2 : ℝ) : ℂ) := by push_cast; ring_nf
  rw [h2, cpow_half_of_pos (by positivity)]
  congr 2
  · congr 1; field_simp
  · have : (a : ℂ) ≠ 0 := by exact_mod_cast ha.ne'
    field_simp
    ring

/-- The norm of the integrand is the integrand with the real parts of `u, v` (a positive real). -/
lemma norm_g (a b c : ℝ) (u v : ℂ) (x : ℝ × ℝ) :
    ‖g a b c u v x‖ = (g a b c (u.re : ℂ) (v.re : ℂ) x).re := by
  simp only [g, Complex.norm_exp]
  rw [show (-(↑a * ↑x.1 ^ 2 + 2 * ↑b * ↑x.1 * ↑x.2 + ↑c * ↑x.2 ^ 2) / 2 + (u.re : ℂ) * ↑x.1 + (v.re : ℂ) * ↑x.2 : ℂ)
      = (((-(a * x.1 ^ 2 + 2 * b * x.1 * x.2 + c * x.2 ^ 2) / 2 + u.re * x.1 + v.re * x.2 : ℝ)) : ℂ) by push_cast; ring,
    ← Complex.ofReal_exp, Complex.ofReal_re]
  congr 1
  simp [sq, Complex.add_re, Complex.mul_re]

lemma integrable_inner {a : ℝ} (ha : 0 < a) (b c : ℝ) (u v : ℂ) (y : ℝ) :
    Integrable (fun x : ℝ => g a b c u v (x, y)) := by
  have hb : ((-(a : ℂ) / 2)).re < 0 := by simp; linarith
  have h := integrable_cexp_quadratic' hb (u - b * y) (-(c * y ^ 2) / 2 + v * y)
  refine h.congr (Filter.Eventually.of_forall fun x => ?_)
  simp only [g]; congr 1; ring

/-- The inner integral, rewritten as a one-dimensional Gaussian in `x₂`. -/
lemma integral_inner' {a : ℝ} (ha : 0 < a) (b c : ℝ) (u v : ℂ) (y : ℝ) :
    ∫ x : ℝ, g a b c u v (x, y) =
      ((√(2 * π / a) : ℝ) : ℂ) *
        cexp (-(((a * c - b ^ 2) / (2 * a) : ℝ) : ℂ) * y ^ 2 + (v - u * b / a) * y + u ^ 2 / (2 * a)) := by
  rw [integral_inner ha]
  congr 2
  have : (a : ℂ) ≠ 0 := by exact_mod_cast ha.ne'
  push_cast
  field_simp
  ring

lemma integrable_outer {a b c : ℝ} (ha : 0 < a) (hdet : 0 < a * c - b ^ 2) (u v : ℂ) :
    Integrable (fun y : ℝ => ∫ x : ℝ, g a b c u v (x, y)) := by
  simp_rw [integral_inner' ha]
  have hb : (-(((a * c - b ^ 2) / (2 * a) : ℝ) : ℂ)).re < 0 := by
    simp only [neg_re, ofReal_re, Left.neg_neg_iff]; positivity
  exact (integrable_cexp_quadratic' hb _ _).const_mul _

lemma integrable_g {a b c : ℝ} (ha : 0 < a) (hdet : 0 < a * c - b ^ 2) (u v : ℂ) :
    Integrable (g a b c u v) (volume : Measure (ℝ × ℝ)) := by
  rw [Measure.volume_eq_prod]
  have hm : AEStronglyMeasurable (g a b c u v) (volume.prod volume) :=
    (Continuous.aestronglyMeasurable (by unfold g; fun_prop))
  refine (integrable_prod_iff' hm).2 ⟨Filter.Eventually.of_forall (integrable_inner ha b c u v), ?_⟩
  have hre : ∀ y : ℝ, ∫ x : ℝ, ‖g a b c u v (x, y)‖ = (∫ x : ℝ, g a b c (u.re : ℂ) (v.re : ℂ) (x, y)).re := by
    intro y
    simp_rw [norm_g]
    exact integral_re (integrable_inner ha b c _ _ y)
  simp_rw [hre]
  exact (integrable_outer ha hdet _ _).re

/-- **The two-dimensional Gaussian integral.** -/
theorem integral_g {a b c : ℝ} (ha : 0 < a) (hdet : 0 < a * c - b ^ 2) (u v : ℂ) :
    ∫ x : ℝ × ℝ, g a b c u v x =
      ((2 * π / √(a * c - b ^ 2) : ℝ) : ℂ) *
        cexp ((c * u ^ 2 - 2 * b * u * v + a * v ^ 2) / (2 * (a * c - b ^ 2))) := by
  have hint := integrable_g ha hdet u v
  rw [Measure.volume_eq_prod] at hint ⊢
  rw [integral_prod_symm _ hint]
  simp_rw [integral_inner' ha]
  rw [integral_const_mul]
  have hb : (-(((a * c - b ^ 2) / (2 * a) : ℝ) : ℂ)).re < 0 := by
    simp only [neg_re, ofReal_re, Left.neg_neg_iff]; positivity
  rw [integral_cexp_quadratic hb, neg_neg, cpow_half_of_pos (by positivity), ← mul_assoc, ← ofReal_mul]
  have hs : √(2 * π / a) * √(π / ((a * c - b ^ 2) / (2 * a))) = 2 * π / √(a * c - b ^ 2) := by
    rw [← Real.sqrt_mul (by positivity), show 2 * π / a * (π / ((a * c - b ^ 2) / (2 * a)))
        = (2 * π) ^ 2 / (a * c - b ^ 2) by field_simp,
      Real.sqrt_div' _ hdet.le, Real.sqrt_sq (by positivity)]
  rw [hs]
  congr 2
  have : (a : ℂ) ≠ 0 := by exact_mod_cast ha.ne'
  have : ((a * c - b ^ 2 : ℝ) : ℂ) ≠ 0 := by exact_mod_cast hdet.ne'
  push_cast at this ⊢
  field_simp
  ring

end Grothe.UpperChaos.Gauss2
