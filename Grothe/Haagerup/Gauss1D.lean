import Mathlib

/-!
# One-dimensional tilted Gaussian integrals

For `b ~ N(0,1)`, `v ≥ 0` and real `c, s`, with `λ = 1 + 2vs²`, the tilt `exp(−v(c+sb)²)` turns the
standard Gaussian into `N(m, 1/λ)`, `m = −2vcs/λ` (`gaussianPDFReal_mul_tilt`), hence

* `integral_tilt0`: `E exp(−v(c+sb)²) = λ^{−1/2} exp(−vc²/λ)`;
* `integral_tilt1`: `E (c+sb) exp(−v(c+sb)²) = (c/λ) λ^{−1/2} exp(−vc²/λ)`;
* `integral_tilt2`: `E b² exp(−vb²) = (1+2v)^{−1/2} / (1+2v)`.
-/

namespace Grothe.Haag

open MeasureTheory ProbabilityTheory Real

noncomputable section

/-- `λ = 1 + 2vs²`. -/
def lam (v s : ℝ) : ℝ := 1 + 2 * v * s ^ 2

lemma lam_pos {v : ℝ} (hv : 0 ≤ v) (s : ℝ) : 0 < lam v s := by
  unfold lam; positivity

/-- The variance `1/λ` as an `ℝ≥0`. -/
def lamVar (v s : ℝ) : NNReal := Real.toNNReal (1 / lam v s)

lemma coe_lamVar {v : ℝ} (hv : 0 ≤ v) (s : ℝ) : (lamVar v s : ℝ) = 1 / lam v s :=
  Real.coe_toNNReal _ (one_div_pos.2 (lam_pos hv s)).le

lemma lamVar_ne_zero {v : ℝ} (hv : 0 ≤ v) (s : ℝ) : lamVar v s ≠ 0 := by
  intro h
  have := coe_lamVar hv s
  rw [h, NNReal.coe_zero] at this
  exact (one_div_pos.2 (lam_pos hv s)).ne' this.symm

/-- The tilted mean `m = −2vcs/λ`. -/
def tiltMean (v c s : ℝ) : ℝ := -(2 * v * c * s) / lam v s

/-- The prefactor `λ^{−1/2} exp(−vc²/λ)`. -/
def tiltConst (v c s : ℝ) : ℝ := (√(lam v s))⁻¹ * exp (-(v * c ^ 2) / lam v s)

/-- **The tilt identity** of densities. -/
lemma gaussianPDFReal_mul_tilt {v : ℝ} (hv : 0 ≤ v) (c s b : ℝ) :
    gaussianPDFReal 0 1 b * exp (-(v * (c + s * b) ^ 2))
      = tiltConst v c s * gaussianPDFReal (tiltMean v c s) (lamVar v s) b := by
  have hl := lam_pos hv s
  simp only [gaussianPDFReal, coe_lamVar hv s, NNReal.coe_one, tiltConst, tiltMean]
  have h2 : (0 : ℝ) < 2 * π := by positivity
  have e1 : √(2 * π * (1 / lam v s)) = √(2 * π) / √(lam v s) := by
    rw [mul_one_div, Real.sqrt_div h2.le]
  rw [e1]
  have hs1 : 0 < √(lam v s) := Real.sqrt_pos.2 hl
  have hs2 : 0 < √(2 * π) := Real.sqrt_pos.2 h2
  have hc : (√(lam v s))⁻¹ * (√(2 * π) / √(lam v s))⁻¹ = (√(2 * π))⁻¹ := by
    field_simp
  calc (√(2 * π * 1))⁻¹ * rexp (-(b - 0) ^ 2 / (2 * 1)) * rexp (-(v * (c + s * b) ^ 2))
      = (√(2 * π))⁻¹ * rexp (-b ^ 2 / 2 + -(v * (c + s * b) ^ 2)) := by
        rw [Real.exp_add]; simp only [mul_one, sub_zero]; ring
    _ = (√(2 * π))⁻¹ * rexp (-(v * c ^ 2) / lam v s
          + -(b - -(2 * v * c * s) / lam v s) ^ 2 / (2 * (1 / lam v s))) := by
        congr 2
        unfold lam at *
        field_simp
        ring
    _ = _ := by rw [Real.exp_add, ← hc]; ring

/-- Integrating against the tilt. -/
lemma integral_mul_tilt {v : ℝ} (hv : 0 ≤ v) (c s : ℝ) (f : ℝ → ℝ) :
    ∫ b, f b * exp (-(v * (c + s * b) ^ 2)) ∂gaussianReal 0 1
      = tiltConst v c s * ∫ b, f b ∂gaussianReal (tiltMean v c s) (lamVar v s) := by
  rw [integral_gaussianReal_eq_integral_smul one_ne_zero,
    integral_gaussianReal_eq_integral_smul (lamVar_ne_zero hv s), ← integral_const_mul]
  refine integral_congr_ae (Filter.Eventually.of_forall fun b => ?_)
  simp only [smul_eq_mul]
  rw [show gaussianPDFReal 0 1 b * (f b * rexp (-(v * (c + s * b) ^ 2)))
      = (gaussianPDFReal 0 1 b * rexp (-(v * (c + s * b) ^ 2))) * f b by ring,
    gaussianPDFReal_mul_tilt hv c s b]
  ring

lemma integral_tilt0 {v : ℝ} (hv : 0 ≤ v) (c s : ℝ) :
    ∫ b, exp (-(v * (c + s * b) ^ 2)) ∂gaussianReal 0 1 = tiltConst v c s := by
  have := integral_mul_tilt hv c s (fun _ => 1)
  simp only [one_mul, integral_const, probReal_univ, smul_eq_mul, mul_one] at this
  exact this

lemma integral_tilt1 {v : ℝ} (hv : 0 ≤ v) (c s : ℝ) :
    ∫ b, (c + s * b) * exp (-(v * (c + s * b) ^ 2)) ∂gaussianReal 0 1
      = c / lam v s * tiltConst v c s := by
  have hi : Integrable (fun b : ℝ => s * b) (gaussianReal (tiltMean v c s) (lamVar v s)) :=
    ((memLp_id_gaussianReal 1).integrable le_rfl).const_mul s
  rw [integral_mul_tilt hv c s (fun b => c + s * b), integral_add (integrable_const _) hi,
    integral_const, integral_const_mul, integral_id_gaussianReal]
  simp only [probReal_univ, smul_eq_mul, one_mul, tiltMean]
  have hl := lam_pos hv s
  unfold lam at *
  field_simp
  ring

lemma integral_sq_gaussianReal_zero (w : NNReal) : ∫ b, b ^ 2 ∂gaussianReal 0 w = w := by
  have h := variance_id_gaussianReal (μ := 0) (v := w)
  rw [variance_of_integral_eq_zero aemeasurable_id (by simp [integral_id_gaussianReal])] at h
  simpa using h

lemma integral_tilt2 {v : ℝ} (hv : 0 ≤ v) :
    ∫ b, b ^ 2 * exp (-(v * b ^ 2)) ∂gaussianReal 0 1
      = (√(1 + 2 * v))⁻¹ / (1 + 2 * v) := by
  have := integral_mul_tilt hv 0 1 (fun b => b ^ 2)
  simp only [zero_add, one_mul] at this
  rw [this]
  have hm : tiltMean v 0 1 = 0 := by simp [tiltMean]
  rw [hm, integral_sq_gaussianReal_zero, coe_lamVar hv]
  simp [tiltConst, lam]
  ring

end

end Grothe.Haag
