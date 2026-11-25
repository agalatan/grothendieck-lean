import Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic
import Mathlib.LinearAlgebra.Complex.FiniteDimensional
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.Analysis.SpecialFunctions.PolarCoord
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Algebra.MvPolynomial.PDeriv

set_option warningAsError true

/-!
# Complex Gaussian measure, planar Gaussian integrals, and Hermite Hilbert bases

Self-contained foundation for the complex Gaussian chaos expansion on `ℂ` and `ℂ × ℂ`:
* 2D Gaussian integrals with complex and real linear terms (`Gauss2.integral_g`, `Gauss2.integral_gR`);
* Standard complex Gaussian `gaussC` on `ℂ` and `mu2 = gaussC ⊗ gaussC` on `ℂ × ℂ`, their
  characteristic functions, polar representation, rotation invariance, and monomial moments;
* Complex Hermite polynomials `H p q` on `ℂ` and tensor Hermite basis `hermiteBasis2` on `L²(mu2)`.
-/

namespace Haagerup

open MeasureTheory ProbabilityTheory Complex Real Set MvPolynomial Finset
open scoped Real ComplexConjugate InnerProductSpace NNReal ENNReal Nat

noncomputable section

/-! ### 1. Two-dimensional Gaussian integrals (`Gauss2`) -/

namespace Gauss2

def g (a b c : ℝ) (u v : ℂ) (x : ℝ × ℝ) : ℂ :=
  cexp (-(a * x.1 ^ 2 + 2 * b * x.1 * x.2 + c * x.2 ^ 2) / 2 + u * x.1 + v * x.2)

lemma cpow_half_of_pos {r : ℝ} (hr : 0 < r) :
    ((π : ℂ) / (r : ℂ)) ^ (1 / 2 : ℂ) = ((√(π / r) : ℝ) : ℂ) := by
  rw [Real.sqrt_eq_rpow, ← ofReal_div, ofReal_cpow (by positivity)]
  norm_num

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

lemma norm_g (a b c : ℝ) (u v : ℂ) (x : ℝ × ℝ) :
    ‖g a b c u v x‖ = (g a b c (u.re : ℂ) (v.re : ℂ) x).re := by
  simp only [g, Complex.norm_exp]
  rw [show (-(↑a * ↑x.1 ^ 2 + 2 * ↑b * ↑x.1 * ↑x.2 + ↑c * ↑x.2 ^ 2) / 2 +
        (u.re : ℂ) * ↑x.1 + (v.re : ℂ) * ↑x.2 : ℂ)
      = (((-(a * x.1 ^ 2 + 2 * b * x.1 * x.2 + c * x.2 ^ 2) / 2 +
        u.re * x.1 + v.re * x.2 : ℝ)) : ℂ) by push_cast; ring,
    ← Complex.ofReal_exp, Complex.ofReal_re]
  congr 1
  simp [sq, Complex.add_re, Complex.mul_re]

lemma integrable_inner {a : ℝ} (ha : 0 < a) (b c : ℝ) (u v : ℂ) (y : ℝ) :
    Integrable (fun x : ℝ => g a b c u v (x, y)) := by
  have hb : ((-(a : ℂ) / 2)).re < 0 := by simp; linarith
  have h := integrable_cexp_quadratic' hb (u - b * y) (-(c * y ^ 2) / 2 + v * y)
  refine h.congr (Filter.Eventually.of_forall fun x => ?_)
  simp only [g]; congr 1; ring

lemma integral_inner' {a : ℝ} (ha : 0 < a) (b c : ℝ) (u v : ℂ) (y : ℝ) :
    ∫ x : ℝ, g a b c u v (x, y) =
      ((√(2 * π / a) : ℝ) : ℂ) *
        cexp (-(((a * c - b ^ 2) / (2 * a) : ℝ) : ℂ) * y ^ 2 +
          (v - u * b / a) * y + u ^ 2 / (2 * a)) := by
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
    Continuous.aestronglyMeasurable (by unfold g; fun_prop)
  refine (integrable_prod_iff' hm).2 ⟨Filter.Eventually.of_forall (integrable_inner ha b c u v), ?_⟩
  have hre : ∀ y : ℝ, ∫ x : ℝ, ‖g a b c u v (x, y)‖ =
      (∫ x : ℝ, g a b c (u.re : ℂ) (v.re : ℂ) (x, y)).re := by
    intro y
    simp_rw [norm_g]
    exact integral_re (integrable_inner ha b c _ _ y)
  simp_rw [hre]
  exact (integrable_outer ha hdet _ _).re

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

def gR (a b c u v : ℝ) (x : ℝ × ℝ) : ℝ :=
  Real.exp (-(a * x.1 ^ 2 + 2 * b * x.1 * x.2 + c * x.2 ^ 2) / 2 + u * x.1 + v * x.2)

lemma g_ofReal (a b c u v : ℝ) (x : ℝ × ℝ) : g a b c (u : ℂ) (v : ℂ) x = (gR a b c u v x : ℂ) := by
  simp only [g, gR, Complex.ofReal_exp]; push_cast; ring_nf

lemma integrable_gR {a b c : ℝ} (ha : 0 < a) (hdet : 0 < a * c - b ^ 2) (u v : ℝ) :
    Integrable (gR a b c u v) (volume : Measure (ℝ × ℝ)) := by
  have h := (integrable_g ha hdet (u : ℂ) (v : ℂ)).re
  refine h.congr (Filter.Eventually.of_forall fun x => ?_)
  simp [g_ofReal]

theorem integral_gR {a b c : ℝ} (ha : 0 < a) (hdet : 0 < a * c - b ^ 2) (u v : ℝ) :
    ∫ x : ℝ × ℝ, gR a b c u v x =
      2 * π / √(a * c - b ^ 2) *
        Real.exp ((c * u ^ 2 - 2 * b * u * v + a * v ^ 2) / (2 * (a * c - b ^ 2))) := by
  have h := integral_g ha hdet (u : ℂ) (v : ℂ)
  simp_rw [g_ofReal, integral_complex_ofReal] at h
  have h2 := congrArg Complex.re h
  rw [Complex.ofReal_re] at h2
  rw [h2, show ((c : ℂ) * (u : ℂ) ^ 2 - 2 * b * u * v + a * v ^ 2) / (2 * (a * c - b ^ 2))
      = (((c * u ^ 2 - 2 * b * u * v + a * v ^ 2) / (2 * (a * c - b ^ 2)) : ℝ) : ℂ) by
        push_cast; ring,
    ← Complex.ofReal_exp, ← Complex.ofReal_mul, Complex.ofReal_re]

end Gauss2

/-! ### 2. Standard complex Gaussian `gaussC`, characteristic function, polar coordinates -/

abbrev gauss2 : Measure (ℝ × ℝ) := (gaussianReal 0 1).prod (gaussianReal 0 1)

def stdGaussian (d : ℕ) : Measure (Fin d → ℝ) := Measure.pi fun _ => gaussianReal 0 1

instance (d : ℕ) : IsProbabilityMeasure (stdGaussian d) := by unfold stdGaussian; infer_instance

lemma gaussianPDFReal_mul (x y : ℝ) :
    gaussianPDFReal 0 1 x * gaussianPDFReal 0 1 y = (2 * π)⁻¹ * Real.exp (-(x ^ 2 + y ^ 2) / 2) := by
  simp only [gaussianPDFReal_def, NNReal.coe_one, mul_one, sub_zero]
  have h : (√(2 * π))⁻¹ * (√(2 * π))⁻¹ = (2 * π)⁻¹ := by
    rw [← mul_inv, Real.mul_self_sqrt (by positivity)]
  rw [← h, show -(x ^ 2 + y ^ 2) / 2 = -x ^ 2 / 2 + -y ^ 2 / 2 by ring, Real.exp_add]; ring

lemma integral_gauss2_eq (F : ℝ × ℝ → ℝ) :
    ∫ p, F p ∂gauss2 = ∫ p : ℝ × ℝ, gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2 * F p := by
  rw [gauss2, gaussianReal_of_var_ne_zero 0 one_ne_zero,
    MeasureTheory.prod_withDensity (measurable_gaussianPDF 0 1) (measurable_gaussianPDF 0 1),
    integral_withDensity_eq_integral_toReal_smul (by fun_prop)
      (Filter.Eventually.of_forall fun _ => ENNReal.mul_lt_top gaussianPDF_lt_top gaussianPDF_lt_top),
    ← Measure.volume_eq_prod]
  congr 1; ext p
  rw [ENNReal.toReal_mul, toReal_gaussianPDF, toReal_gaussianPDF, smul_eq_mul]

def toC (x : Fin 2 → ℝ) : ℂ := ((x 0 : ℂ) + (x 1 : ℂ) * Complex.I) / ((√2 : ℝ) : ℂ)

lemma continuous_toC : Continuous toC := by unfold toC; fun_prop

lemma measurable_toC : Measurable toC := continuous_toC.measurable

def gaussC : Measure ℂ := (stdGaussian 2).map toC

instance : IsProbabilityMeasure gaussC :=
  ⟨by rw [gaussC, Measure.map_apply measurable_toC MeasurableSet.univ, Set.preimage_univ, measure_univ]⟩

abbrev mu2 : Measure (ℂ × ℂ) := gaussC.prod gaussC

def toC' (p : ℝ × ℝ) : ℂ := ((p.1 : ℂ) + (p.2 : ℂ) * Complex.I) / ((√2 : ℝ) : ℂ)

lemma measurable_toC' : Measurable toC' := by unfold toC'; fun_prop

lemma gaussC_eq_map_gauss2 : gaussC = gauss2.map toC' := by
  have e : gauss2 = (stdGaussian 2).map MeasurableEquiv.finTwoArrow :=
    (measurePreserving_finTwoArrow (gaussianReal 0 1)).map_eq.symm
  rw [gaussC, e, Measure.map_map measurable_toC' MeasurableEquiv.finTwoArrow.measurable]
  congr 1

lemma dual_complex_apply (L : StrongDual ℝ ℂ) (z : ℂ) :
    L z = z.re * L 1 + z.im * L Complex.I := by
  conv_lhs => rw [← Complex.re_add_im z]
  rw [map_add, show (z.re : ℂ) = z.re • (1 : ℂ) by simp,
    show (z.im : ℂ) * Complex.I = z.im • Complex.I by simp, map_smul, map_smul,
    smul_eq_mul, smul_eq_mul]

private def toCL : (Fin 2 → ℝ) →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := toC
      map_add' := fun x y => by simp [toC]; ring
      map_smul' := fun a x => by simp [toC]; ring }

private lemma charFunDual_real (L : StrongDual ℝ ℝ) :
    charFunDual (gaussianReal 0 1) L = Complex.exp (-((L 1 : ℝ) : ℂ) ^ 2 / 2) := by
  rw [charFunDual_eq_charFun_map_one, gaussianReal_map_continuousLinearMap, charFun_gaussianReal]
  simp [Real.toNNReal_of_nonneg (sq_nonneg (L 1)), neg_div]

lemma charFunDual_gaussC (L : StrongDual ℝ ℂ) :
    charFunDual gaussC L = Complex.exp (-(((L 1) ^ 2 + (L Complex.I) ^ 2 : ℝ) : ℂ) / 4) := by
  change charFunDual ((stdGaussian 2).map toCL) L = _
  rw [charFunDual_map, stdGaussian, charFunDual_pi, Fin.prod_univ_two,
    charFunDual_real, charFunDual_real, ← Complex.exp_add]
  have hs : (2 : ℝ)⁻¹ * √2 = (√2)⁻¹ := by
    field_simp
    nlinarith [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]
  have h0 : (L.comp toCL |>.comp (.single ℝ (fun _ : Fin 2 => ℝ) 0)) 1 = L 1 / √2 := by
    change L (toC (Pi.single 0 1)) = _
    rw [dual_complex_apply]
    simp [toC, div_eq_mul_inv, mul_comm, hs]
  have h1 : (L.comp toCL |>.comp (.single ℝ (fun _ : Fin 2 => ℝ) 1)) 1 = L Complex.I / √2 := by
    change L (toC (Pi.single 1 1)) = _
    rw [dual_complex_apply]
    simp [toC, div_eq_mul_inv, mul_comm, hs]
  rw [h0, h1]
  congr 1
  have hs2 : (((√2 : ℝ) : ℂ) ^ 2) = 2 := by
    exact_mod_cast Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)
  push_cast
  rw [div_pow, div_pow, hs2]
  ring

def sig (ρ : ℂ) : ℂ := ((√(1 - ‖ρ‖ ^ 2) : ℝ) : ℂ)

private def mehlerL (ρ : ℂ) : ℂ × ℂ →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun u => ρ * u.1 + sig ρ * u.2
      map_add' := fun u v => by simp; ring
      map_smul' := fun a u => by simp; ring }

theorem map_mehlerY {ρ : ℂ} (hρ : ‖ρ‖ ≤ 1) :
    mu2.map (fun u => ρ * u.1 + sig ρ * u.2) = gaussC := by
  change mu2.map (mehlerL ρ) = gaussC
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, show mu2 = gaussC.prod gaussC from rfl, charFunDual_prod,
    charFunDual_gaussC, charFunDual_gaussC, charFunDual_gaussC, ← Complex.exp_add]
  have hσ : (sig ρ).re ^ 2 = 1 - ‖ρ‖ ^ 2 := by
    simp only [sig, Complex.ofReal_re]
    rw [Real.sq_sqrt (by nlinarith [norm_nonneg ρ])]
  have hn : ‖ρ‖ ^ 2 = ρ.re ^ 2 + ρ.im ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, Complex.normSq_apply]; ring
  simp only [ContinuousLinearMap.comp_apply, mehlerL,
    LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk,
    ContinuousLinearMap.inl_apply, ContinuousLinearMap.inr_apply,
    mul_one, mul_zero, zero_add, add_zero]
  congr 1
  have he : (L ρ) ^ 2 + (L (ρ * Complex.I)) ^ 2 +
      ((L (sig ρ)) ^ 2 + (L (sig ρ * Complex.I)) ^ 2) = (L 1) ^ 2 + (L Complex.I) ^ 2 := by
    calc
      _ = (ρ.re ^ 2 + ρ.im ^ 2 + (sig ρ).re ^ 2) * ((L 1) ^ 2 + (L Complex.I) ^ 2) := by
        rw [dual_complex_apply L ρ, dual_complex_apply L (ρ * Complex.I),
          dual_complex_apply L (sig ρ), dual_complex_apply L (sig ρ * Complex.I)]
        simp [sig]; ring
      _ = _ := by rw [hσ, hn]; ring
  have heC : (L ρ : ℂ) ^ 2 + (L (ρ * Complex.I) : ℂ) ^ 2 +
      ((L (sig ρ) : ℂ) ^ 2 + (L (sig ρ * Complex.I) : ℂ) ^ 2) =
      (L 1 : ℂ) ^ 2 + (L Complex.I : ℂ) ^ 2 := by exact_mod_cast he
  push_cast
  linear_combination -(1 / 4 : ℂ) * heC

private def rotCL (c : ℂ) : ℂ →L[ℝ] ℂ :=
  LinearMap.toContinuousLinearMap
    { toFun := fun z => c * z
      map_add' := fun x y => by ring
      map_smul' := fun r x => by simp; ring }

theorem map_rot_gaussC (c : ℂ) (hc : ‖c‖ = 1) : gaussC.map (fun z => c * z) = gaussC := by
  change gaussC.map (rotCL c) = gaussC
  apply Measure.ext_of_charFunDual
  ext L
  rw [charFunDual_map, charFunDual_gaussC, charFunDual_gaussC]
  simp only [ContinuousLinearMap.comp_apply, rotCL,
    LinearMap.coe_toContinuousLinearMap', LinearMap.coe_mk, AddHom.coe_mk, mul_one]
  have hn : c.re ^ 2 + c.im ^ 2 = 1 := by
    have h0 : Complex.normSq c = 1 := by rw [Complex.normSq_eq_norm_sq, hc, one_pow]
    rw [Complex.normSq_apply] at h0; linarith
  have he : (L c) ^ 2 + (L (c * Complex.I)) ^ 2 = (L 1) ^ 2 + (L Complex.I) ^ 2 := by
    rw [dual_complex_apply L c, dual_complex_apply L (c * Complex.I)]
    simp only [Complex.mul_re, Complex.mul_im, Complex.I_re, Complex.I_im, mul_zero, mul_one,
      zero_sub, add_zero]
    linear_combination ((L 1) ^ 2 + (L Complex.I) ^ 2) * hn
  congr 1; push_cast
  have heC : (L c : ℂ) ^ 2 + (L (c * Complex.I) : ℂ) ^ 2 =
      (L 1 : ℂ) ^ 2 + (L Complex.I : ℂ) ^ 2 := by exact_mod_cast he
  linear_combination -(1 / 4 : ℂ) * heC

theorem integral_rot_gaussC {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] (c : ℂ)
    (hc : ‖c‖ = 1) (f : ℂ → E) : ∫ z, f (c * z) ∂gaussC = ∫ z, f z ∂gaussC := by
  have hc0 : c ≠ 0 := by rintro rfl; simp at hc
  let e : ℂ ≃ᵐ ℂ :=
    { toFun := fun z => c * z, invFun := fun z => c⁻¹ * z,
      left_inv := fun z => by simp [hc0], right_inv := fun z => by simp [hc0],
      measurable_toFun := measurable_const.mul measurable_id,
      measurable_invFun := measurable_const.mul measurable_id }
  have := integral_map_equiv e f (μ := gaussC)
  rw [show (⇑e) = fun z => c * z from rfl, map_rot_gaussC c hc] at this
  exact this.symm

lemma integral_eq_zero_of_rot (G : ℂ → ℂ) (c : ℂ) (hc : ‖c‖ = 1) (hG : ∀ z, G (c * z) = -G z) :
    ∫ z, G z ∂gaussC = 0 := by
  have h := integral_rot_gaussC c hc G
  simp_rw [hG, integral_neg] at h
  have : (2 : ℂ) * ∫ z, G z ∂gaussC = 0 := by linear_combination -h
  exact (mul_eq_zero.1 this).resolve_left two_ne_zero

/-! ### 3. Polar coordinates and Gaussian moments -/

theorem integral_gaussC_eq_volume (F : ℂ → ℝ) (hF : Measurable F) :
    ∫ z, F z ∂gaussC = ∫ z : ℂ, (π⁻¹ * Real.exp (-Complex.normSq z)) * F z := by
  rw [gaussC_eq_map_gauss2, integral_map measurable_toC'.aemeasurable hF.aestronglyMeasurable,
    integral_gauss2_eq]
  have e2 : ∫ p : ℝ × ℝ, gaussianPDFReal 0 1 p.1 * gaussianPDFReal 0 1 p.2 * F (toC' p)
      = ∫ z : ℂ, gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im * F (toC' (z.re, z.im)) := by
    rw [← Complex.volume_preserving_equiv_real_prod.symm.integral_comp
      Complex.measurableEquivRealProd.symm.measurableEmbedding]
    rfl
  rw [e2]
  have e3 := Measure.integral_comp_smul (μ := (volume : Measure ℂ))
    (fun z : ℂ => gaussianPDFReal 0 1 z.re * gaussianPDFReal 0 1 z.im * F (toC' (z.re, z.im))) √2
  rw [Complex.finrank_real_complex] at e3
  have hs : (√2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  rw [hs] at e3
  have e4 : ∀ w : ℂ, gaussianPDFReal 0 1 ((√2 : ℝ) • w).re * gaussianPDFReal 0 1 ((√2 : ℝ) • w).im
      * F (toC' (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im))
      = (2 * π)⁻¹ * Real.exp (-Complex.normSq w) * F w := by
    intro w
    have h2 : (√2 : ℝ) ≠ 0 := by positivity
    have ht : toC' (((√2 : ℝ) • w).re, ((√2 : ℝ) • w).im) = w := by
      unfold toC'
      apply Complex.ext <;> simp [Complex.div_re, Complex.div_im, Complex.normSq_ofReal] <;>
        field_simp <;> rw [hs] <;> ring
    rw [ht, gaussianPDFReal_mul]
    congr 2
    simp only [Complex.smul_re, Complex.smul_im, smul_eq_mul, Complex.normSq_apply]
    rw [mul_pow, mul_pow, hs]; ring_nf
  simp_rw [e4] at e3
  have e5 : ∫ z : ℂ, π⁻¹ * Real.exp (-Complex.normSq z) * F z
      = 2 * ∫ w : ℂ, (2 * π)⁻¹ * Real.exp (-Complex.normSq w) * F w := by
    rw [← integral_const_mul]
    congr 1; funext w; field_simp
  rw [e5, e3, smul_eq_mul]
  norm_num; ring

theorem integral_gaussC_polar (F : ℂ → ℝ) (hF : Measurable F) :
    ∫ z, F z ∂gaussC = ∫ p in Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * Real.exp (-p.1 ^ 2)) * F (Complex.polarCoord.symm p) := by
  have hT : polarCoord.target = Ioi (0 : ℝ) ×ˢ Ioo (-π) π := rfl
  rw [integral_gaussC_eq_volume F hF, ← Complex.integral_comp_polarCoord_symm, hT]
  congr 1; funext p
  rw [smul_eq_mul, Complex.normSq_eq_norm_sq, Complex.norm_polarCoord_symm, sq_abs]
  ring

lemma norm_polarCoord_symm_of_mem {p : ℝ × ℝ} (hp : p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π) :
    ‖Complex.polarCoord.symm p‖ = p.1 := by
  rw [Complex.norm_polarCoord_symm, abs_of_pos hp.1]

lemma integral_gaussC_radial (f : ℝ → ℝ) (hf : Measurable f) :
    ∫ z, f ‖z‖ ∂gaussC = 2 * ∫ r in Ioi (0 : ℝ), r * Real.exp (-r ^ 2) * f r := by
  rw [integral_gaussC_polar (fun z => f ‖z‖) (hf.comp measurable_norm)]
  have hp : ∀ p ∈ Ioi (0 : ℝ) ×ˢ Ioo (-π) π,
      p.1 * (π⁻¹ * Real.exp (-p.1 ^ 2)) * f ‖Complex.polarCoord.symm p‖
        = (π⁻¹ * (p.1 * Real.exp (-p.1 ^ 2) * f p.1)) * (1 : ℝ) := by
    intro p hp
    rw [norm_polarCoord_symm_of_mem hp]; ring
  have hprod := setIntegral_prod_mul (μ := volume) (ν := volume)
    (fun r : ℝ => π⁻¹ * (r * Real.exp (-r ^ 2) * f r)) (fun _ : ℝ => (1 : ℝ))
    (Ioi 0) (Ioo (-π) π)
  beta_reduce at hprod
  rw [setIntegral_congr_fun (measurableSet_Ioi.prod measurableSet_Ioo) hp,
    Measure.volume_eq_prod, hprod, integral_const_mul]
  have hangle : ∫ _θ in Ioo (-π) π, (1 : ℝ) = 2 * π := by
    simp only [integral_const, smul_eq_mul, mul_one, Measure.real,
      Measure.restrict_apply_univ, Real.volume_Ioo]
    rw [ENNReal.toReal_ofReal (by linarith [Real.pi_pos])]; ring
  rw [hangle]; field_simp

lemma integrable_pow_gaussian (k : ℕ) : Integrable (fun t : ℝ => t ^ k) (gaussianReal 0 1) := by
  have h : Integrable (fun x : ℝ => |x| ^ k) (gaussianReal 0 1) := by
    simpa only [Real.norm_eq_abs, id_eq] using
      (memLp_id_gaussianReal (μ := 0) (v := 1) (k : ℝ≥0)).integrable_norm_pow'
  refine h.mono' (by fun_prop) (Filter.Eventually.of_forall fun t => ?_)
  rw [Real.norm_eq_abs, abs_pow]

lemma integrable_eval {d : ℕ} (p : MvPolynomial (Fin d) ℝ) :
    Integrable (fun x => MvPolynomial.eval x p) (stdGaussian d) := by
  induction p using MvPolynomial.induction_on' with
  | monomial s a =>
    have h : Integrable (fun x : Fin d → ℝ => ∏ j, x j ^ s j) (stdGaussian d) :=
      Integrable.fintype_prod (f := fun j (t : ℝ) => t ^ s j) fun _ => integrable_pow_gaussian _
    refine (h.const_mul a).congr (Filter.Eventually.of_forall fun x => ?_)
    simp only [MvPolynomial.eval_monomial, Finsupp.prod_fintype _ _ (fun _ => pow_zero _)]
  | add p q hp hq =>
    simp only [map_add]; exact hp.add hq

private lemma continuous_mvEval {σ R : Type*} [CommSemiring R] [TopologicalSpace R]
    [IsTopologicalSemiring R] (p : MvPolynomial σ R) :
    Continuous fun x : σ → R => MvPolynomial.eval x p := by
  induction p using MvPolynomial.induction_on with
  | C _ => simp_rw [eval_C]; exact continuous_const
  | add _ _ hp hq => simp_rw [map_add]; exact hp.add hq
  | mul_X _ i hp => simp_rw [map_mul, eval_X]; exact hp.mul (continuous_apply i)

lemma memLp_eval {d : ℕ} (p : MvPolynomial (Fin d) ℝ) :
    MemLp (fun x => MvPolynomial.eval x p) 2 (stdGaussian d) := by
  rw [memLp_two_iff_integrable_sq (continuous_mvEval p).aestronglyMeasurable]
  exact (integrable_eval (p * p)).congr (Filter.Eventually.of_forall fun _ => by
    simp only [map_mul]; ring)

lemma integrable_norm_pow (n : ℕ) : Integrable (fun z : ℂ => ‖z‖ ^ n) gaussC := by
  set Pn : MvPolynomial (Fin 2) ℝ :=
    MvPolynomial.C (1 / 2) * (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2)
  have hPn : ∀ x : Fin 2 → ℝ, MvPolynomial.eval x Pn = Complex.normSq (toC x) := fun x => by
    unfold toC
    rw [Complex.normSq_div, Complex.normSq_ofReal, Real.mul_self_sqrt (by norm_num)]
    simp [Pn, Complex.normSq_apply]; ring
  have hsq : Integrable (fun z => Complex.normSq z ^ n) gaussC := by
    rw [gaussC]
    refine (integrable_map_measure (g := fun z => Complex.normSq z ^ n)
      (by fun_prop : Continuous fun z => Complex.normSq z ^ n).aestronglyMeasurable
      measurable_toC.aemeasurable).2 ?_
    exact (integrable_eval (Pn ^ n)).congr (Filter.Eventually.of_forall fun x => by simp [hPn])
  refine ((integrable_const (1 : ℝ)).add hsq).mono'
    (continuous_norm.pow n).aestronglyMeasurable (Filter.Eventually.of_forall fun z => ?_)
  simp only [Pi.add_apply]
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity), Complex.normSq_eq_norm_sq, ← pow_mul]
  rcases le_total ‖z‖ 1 with h | h
  · have : ‖z‖ ^ n ≤ 1 := pow_le_one₀ (norm_nonneg z) h
    have : 0 ≤ ‖z‖ ^ (2 * n) := by positivity
    linarith
  · have : ‖z‖ ^ n ≤ ‖z‖ ^ (2 * n) := pow_le_pow_right₀ h (by omega)
    linarith

lemma integrable_monomial (a b : ℕ) : Integrable (fun z : ℂ => z ^ a * conj z ^ b) gaussC := by
  refine (integrable_norm_pow (a + b)).mono' (by fun_prop)
    (Filter.Eventually.of_forall fun z => ?_)
  rw [norm_mul, norm_pow, norm_pow, Complex.norm_conj, pow_add]

theorem integral_normSq_pow_eq (n : ℕ) :
    ∫ z : ℂ, Complex.normSq z ^ n ∂gaussC = n.factorial := by
  have heq : ∀ z : ℂ, Complex.normSq z ^ n = ‖z‖ ^ (2 * n) := fun z => by
    rw [Complex.normSq_eq_norm_sq, ← pow_mul]
  simp_rw [heq]
  rw [integral_gaussC_radial (fun r => r ^ (2 * n)) (by fun_prop),
    ← Real.Gamma_nat_eq_factorial n, Real.Gamma_eq_integral (by positivity)]
  conv_rhs => rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num)]
  rw [← integral_const_mul]
  refine setIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
  have hp : (r ^ (2 : ℝ)) ^ ((n : ℝ) + 1 - 1) = r ^ (2 * n) := by
    rw [← rpow_mul hr.le, show (2 : ℝ) * ((n : ℝ) + 1 - 1) = ((2 * n : ℕ) : ℝ) by push_cast; ring]
    exact rpow_natCast _ _
  rw [hp]; norm_num [smul_eq_mul]; ring

theorem integral_norm_odd_pow (n : ℕ) :
    ∫ z : ℂ, ‖z‖ ^ (2 * n + 1) ∂gaussC = Real.Gamma ((n : ℝ) + 3 / 2) := by
  rw [integral_gaussC_radial (fun r => r ^ (2 * n + 1)) (by fun_prop),
    Real.Gamma_eq_integral (by positivity)]
  conv_rhs => rw [← integral_comp_rpow_Ioi_of_pos (show (0 : ℝ) < 2 by norm_num)]
  rw [← integral_const_mul]
  refine setIntegral_congr_fun measurableSet_Ioi fun r hr => ?_
  have hp : (r ^ (2 : ℝ)) ^ ((n : ℝ) + 3 / 2 - 1) = r ^ (2 * n + 1) := by
    rw [← rpow_mul hr.le,
      show (2 : ℝ) * ((n : ℝ) + 3 / 2 - 1) = ((2 * n + 1 : ℕ) : ℝ) by push_cast; ring]
    exact rpow_natCast _ _
  rw [hp]; norm_num [smul_eq_mul]; ring

private lemma integral_moment_lt {a b : ℕ} (hab : b < a) :
    ∫ z, z ^ a * conj z ^ b ∂gaussC = 0 := by
  obtain ⟨k, rfl⟩ : ∃ k, a = b + (k + 1) := ⟨a - b - 1, by omega⟩
  set c : ℂ := Complex.exp (((π / ((k : ℝ) + 1) : ℝ) : ℂ) * Complex.I) with hc_def
  have hc : ‖c‖ = 1 := Complex.norm_exp_ofReal_mul_I _
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc]; simp
  have hck : c ^ (k + 1) = -1 := by
    rw [hc_def, ← Complex.exp_nat_mul]
    have : ((k + 1 : ℕ) : ℂ) * (((π / ((k : ℝ) + 1) : ℝ) : ℂ) * Complex.I) = π * Complex.I := by
      push_cast; field_simp
    rw [this, Complex.exp_pi_mul_I]
  have hcb : conj c ^ b * c ^ b = 1 := by rw [← mul_pow, hcc, one_pow]
  refine integral_eq_zero_of_rot _ c hc fun z => ?_
  rw [map_mul, mul_pow, mul_pow]
  linear_combination (c ^ (k + 1) * (z ^ (b + (k + 1)) * conj z ^ b)) * hcb
    + (z ^ (b + (k + 1)) * conj z ^ b) * hck

theorem integral_moment (a b : ℕ) :
    ∫ z, z ^ a * conj z ^ b ∂gaussC = if a = b then (a.factorial : ℂ) else 0 := by
  rcases lt_trichotomy a b with h | rfl | h
  · have : ∫ z, z ^ a * conj z ^ b ∂gaussC = conj (∫ z, z ^ b * conj z ^ a ∂gaussC) := by
      rw [← integral_conj]; congr 1; ext z; simp [mul_comm]
    rw [this, integral_moment_lt h, map_zero]; simp [h.ne]
  · simp only [↓reduceIte]
    have h : ∀ z : ℂ, z ^ a * conj z ^ a = ((Complex.normSq z ^ a : ℝ) : ℂ) := fun z => by
      rw [← mul_pow, Complex.mul_conj]; push_cast; rfl
    simp_rw [h]
    rw [integral_complex_ofReal, integral_normSq_pow_eq]; norm_cast
  · rw [integral_moment_lt h]; simp [h.ne']

/-! ### 4. Polynomial completeness in Gaussian `L²` -/

section Completeness

private lemma integrable_exp_abs_mul_gaussianReal (c : ℝ) :
    Integrable (fun t : ℝ => Real.exp (c * |t|)) (gaussianReal 0 1) := by
  refine ((integrable_exp_mul_gaussianReal c).add (integrable_exp_mul_gaussianReal (-c))).mono'
    (by fun_prop) (Filter.Eventually.of_forall fun t => ?_)
  simp only [Pi.add_apply]
  rw [Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
  rcases le_total 0 t with h | h
  · rw [abs_of_nonneg h]; linarith [Real.exp_pos (-c * t)]
  · rw [abs_of_nonpos h, show c * -t = -c * t by ring]; linarith [Real.exp_pos (c * t)]

private lemma integrable_exp_sum_abs {d : ℕ} (c : Fin d → ℝ) :
    Integrable (fun x : Fin d → ℝ => Real.exp (∑ i, c i * |x i|)) (stdGaussian d) := by
  simp_rw [Real.exp_sum]
  exact Integrable.fintype_prod (f := fun i t => Real.exp (c i * |t|))
    fun i => integrable_exp_abs_mul_gaussianReal (c i)

private lemma memLp_exp_sum_abs {d : ℕ} (c : Fin d → ℝ) :
    MemLp (fun x : Fin d → ℝ => Real.exp (∑ i, c i * |x i|)) 2 (stdGaussian d) := by
  refine (memLp_two_iff_integrable_sq (Continuous.aestronglyMeasurable (by fun_prop))).2 ?_
  refine (integrable_exp_sum_abs (fun i => 2 * c i)).congr (Filter.Eventually.of_forall fun x => ?_)
  simp only; rw [sq, ← Real.exp_add, ← Finset.sum_add_distrib]
  congr 1; exact Finset.sum_congr rfl fun _ _ => by ring

private def coefL {d : ℕ} (L : StrongDual ℝ (Fin d → ℝ)) (i : Fin d) : ℝ := L (Pi.single i 1)

private lemma L_eq_sum {d : ℕ} (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) :
    L x = ∑ i, x i * coefL L i := by
  conv_lhs => rw [show x = ∑ i, x i • (Pi.single i 1 : Fin d → ℝ) by
    ext j; simp [Finset.sum_apply, Pi.single_apply]]
  simp [map_sum, coefL]

private lemma abs_L_le {d : ℕ} (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) :
    |L x| ≤ ∑ i, |coefL L i| * |x i| := by
  rw [L_eq_sum]
  refine (Finset.abs_sum_le_sum_abs _ _).trans (le_of_eq (Finset.sum_congr rfl fun _ _ => ?_))
  rw [abs_mul, mul_comm]

private def polyL {d : ℕ} (L : StrongDual ℝ (Fin d → ℝ)) : MvPolynomial (Fin d) ℝ :=
  ∑ i, C (coefL L i) * X i

private lemma eval_polyL {d : ℕ} (L : StrongDual ℝ (Fin d → ℝ)) (x : Fin d → ℝ) :
    eval x (polyL L) = L x := by
  simp [polyL, L_eq_sum, mul_comm]

private theorem integral_exp_mul_eq_zero {d : ℕ} {f : (Fin d → ℝ) → ℝ}
    (hf : MemLp f 2 (stdGaussian d))
    (h : ∀ P : MvPolynomial (Fin d) ℝ, ∫ x, f x * eval x P ∂(stdGaussian d) = 0)
    (L : StrongDual ℝ (Fin d → ℝ)) :
    ∫ x, Complex.exp (L x * Complex.I) * (f x : ℂ) ∂(stdGaussian d) = 0 := by
  set S : ℕ → (Fin d → ℝ) → ℂ :=
    fun N x => (∑ n ∈ range N, (L x * Complex.I) ^ n / n !) * (f x : ℂ) with hS
  have hSN : ∀ N, ∫ x, S N x ∂(stdGaussian d) = 0 := fun N => by
    have hterm : ∀ n, ∫ x, (L x * Complex.I) ^ n / n ! * (f x : ℂ) ∂(stdGaussian d) = 0 := by
      intro n
      have : ∀ x, (L x * Complex.I) ^ n / n ! * (f x : ℂ)
          = (Complex.I ^ n / n !) * ((f x * eval x (polyL L ^ n) : ℝ) : ℂ) := fun x => by
        rw [map_pow, eval_polyL]; push_cast; ring
      simp_rw [this]
      rw [integral_const_mul, integral_complex_ofReal, h, Complex.ofReal_zero, mul_zero]
    simp only [hS, Finset.sum_mul]
    rw [integral_finsetSum]
    · exact Finset.sum_eq_zero fun n _ => hterm n
    · intro n _
      have hi := Complex.ofRealCLM.integrable_comp (hf.integrable_mul (memLp_eval (polyL L ^ n)))
      refine (hi.const_mul (Complex.I ^ n / n !)).congr (Filter.Eventually.of_forall fun x => ?_)
      simp only [Complex.ofRealCLM_apply, Pi.mul_apply, map_pow, eval_polyL]; push_cast; ring
  have hbound := (hf.integrable_mul (memLp_exp_sum_abs (fun i => |coefL L i|))).norm
  have hlim : Filter.Tendsto (fun N => ∫ x, S N x ∂(stdGaussian d)) Filter.atTop
      (nhds (∫ x, Complex.exp (L x * Complex.I) * (f x : ℂ) ∂(stdGaussian d))) := by
    refine tendsto_integral_of_dominated_convergence
      (fun x => ‖f x * Real.exp (∑ i, |coefL L i| * |x i|)‖) (fun _ => ?_) hbound
      (fun N => Filter.Eventually.of_forall fun x => ?_) (Filter.Eventually.of_forall fun x => ?_)
    · have hm : AEStronglyMeasurable (fun x => (f x : ℂ)) (stdGaussian d) :=
        Complex.continuous_ofReal.comp_aestronglyMeasurable hf.aestronglyMeasurable
      exact (Continuous.aestronglyMeasurable (by fun_prop)).mul hm
    · simp only [hS, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
      rw [mul_comm]
      refine mul_le_mul_of_nonneg_left ?_ (abs_nonneg _)
      calc ‖∑ n ∈ range N, (L x * Complex.I) ^ n / (n ! : ℂ)‖ ≤ ∑ n ∈ range N, |L x| ^ n / n ! := by
            refine (norm_sum_le _ _).trans (le_of_eq (Finset.sum_congr rfl fun n _ => ?_))
            rw [norm_div, norm_pow, norm_mul, Complex.norm_I, mul_one, Complex.norm_real,
              Real.norm_eq_abs, Complex.norm_natCast]
        _ ≤ Real.exp |L x| := Real.sum_le_exp_of_nonneg (abs_nonneg _) N
        _ ≤ Real.exp (∑ i, |coefL L i| * |x i|) := Real.exp_le_exp.2 (abs_L_le L x)
    · have := (NormedSpace.expSeries_div_hasSum_exp (L x * Complex.I)).tendsto_sum_nat
      rw [← Complex.exp_eq_exp_ℂ] at this
      exact this.mul_const _
  simp_rw [hSN] at hlim
  exact tendsto_nhds_unique hlim tendsto_const_nhds

theorem poly_complete {d : ℕ} {f : (Fin d → ℝ) → ℝ} (hf : MemLp f 2 (stdGaussian d))
    (h : ∀ P : MvPolynomial (Fin d) ℝ, ∫ x, f x * eval x P ∂(stdGaussian d) = 0) :
    f =ᵐ[stdGaussian d] 0 := by
  have hf1 : Integrable f (stdGaussian d) := hf.integrable one_le_two
  set γ := stdGaussian d
  set fp : (Fin d → ℝ) → ℝ≥0∞ := fun x => ENNReal.ofReal (f x)
  set fm : (Fin d → ℝ) → ℝ≥0∞ := fun x => ENNReal.ofReal (-f x)
  have hfpm : AEMeasurable fp γ := hf1.aemeasurable.ennreal_ofReal
  have hfmm : AEMeasurable fm γ := hf1.neg.aemeasurable.ennreal_ofReal
  have hfpi : ∫⁻ x, fp x ∂γ ≠ ∞ := by
    refine ne_of_lt (lt_of_le_of_lt (lintegral_mono fun x => ?_) hf1.hasFiniteIntegral)
    rw [Real.enorm_eq_ofReal_abs]; exact ENNReal.ofReal_le_ofReal (le_abs_self _)
  have hfmi : ∫⁻ x, fm x ∂γ ≠ ∞ := by
    refine ne_of_lt (lt_of_le_of_lt (lintegral_mono fun x => ?_) hf1.hasFiniteIntegral)
    rw [Real.enorm_eq_ofReal_abs]; exact ENNReal.ofReal_le_ofReal (neg_le_abs _)
  have : IsFiniteMeasure (γ.withDensity fp) := isFiniteMeasure_withDensity hfpi
  have : IsFiniteMeasure (γ.withDensity fm) := isFiniteMeasure_withDensity hfmi
  have hchar : charFunDual (γ.withDensity fp) = charFunDual (γ.withDensity fm) := by
    ext L
    rw [charFunDual_apply, charFunDual_apply,
      integral_withDensity_eq_integral_toReal_smul₀ hfpm
        (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top),
      integral_withDensity_eq_integral_toReal_smul₀ hfmm
        (Filter.Eventually.of_forall fun _ => ENNReal.ofReal_lt_top), ← sub_eq_zero]
    have hp : Integrable (fun x => (fp x).toReal • Complex.exp (L x * Complex.I)) γ := by
      refine hf1.norm.mono' ?_ (Filter.Eventually.of_forall fun x => ?_)
      · exact (hfpm.ennreal_toReal.aestronglyMeasurable).smul
          (Continuous.aestronglyMeasurable (by fun_prop))
      · rw [norm_smul, Complex.norm_exp_ofReal_mul_I, mul_one, Real.norm_eq_abs, Real.norm_eq_abs]
        simp only [fp, ENNReal.toReal_ofReal']
        rw [abs_of_nonneg (le_max_right _ _)]
        exact max_le (le_abs_self _) (abs_nonneg _)
    have hm : Integrable (fun x => (fm x).toReal • Complex.exp (L x * Complex.I)) γ := by
      refine hf1.norm.mono' ?_ (Filter.Eventually.of_forall fun x => ?_)
      · exact (hfmm.ennreal_toReal.aestronglyMeasurable).smul
          (Continuous.aestronglyMeasurable (by fun_prop))
      · rw [norm_smul, Complex.norm_exp_ofReal_mul_I, mul_one, Real.norm_eq_abs, Real.norm_eq_abs]
        simp only [fm, ENNReal.toReal_ofReal']
        rw [abs_of_nonneg (le_max_right _ _)]
        exact max_le (neg_le_abs _) (abs_nonneg _)
    rw [← integral_sub hp hm, ← integral_exp_mul_eq_zero hf h L]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    simp only [fp, fm, ENNReal.toReal_ofReal', Complex.real_smul, ← sub_mul]
    rw [mul_comm]; congr 1
    rw [← Complex.ofReal_sub, max_zero_sub_max_neg_zero_eq_self]
  have heq := Measure.ext_of_charFunDual hchar
  rw [withDensity_eq_iff hfpm hfmm hfpi] at heq
  filter_upwards [heq] with x hx
  simp only [fp, fm, Pi.zero_apply] at hx ⊢
  rcases le_total (f x) 0 with h0 | h0
  · rw [ENNReal.ofReal_of_nonpos h0, eq_comm, ENNReal.ofReal_eq_zero] at hx; linarith
  · rw [ENNReal.ofReal_of_nonpos (by linarith : -f x ≤ 0), ENNReal.ofReal_eq_zero] at hx; linarith

end Completeness

/-! ### 5. Complex Hermite polynomials on `ℂ` -/

abbrev CPoly := MvPolynomial (Fin 2) ℂ

def zv (z : ℂ) : Fin 2 → ℂ := ![z, conj z]

def ev (z : ℂ) (P : CPoly) : ℂ := eval (zv z) P

lemma ev_monomial (z : ℂ) (s : Fin 2 →₀ ℕ) (c : ℂ) :
    ev z (monomial s c) = c * (z ^ s 0 * conj z ^ s 1) := by
  simp [ev, eval_monomial, Finsupp.prod_fintype, Fin.prod_univ_two, zv]

lemma continuous_ev (P : CPoly) : Continuous fun z => ev z P := by
  unfold ev zv
  exact (continuous_mvEval P).comp (by
    refine continuous_pi fun i => ?_
    fin_cases i <;> simp <;> fun_prop)

lemma integrable_ev (P : CPoly) : Integrable (fun z => ev z P) gaussC := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c => simp_rw [ev_monomial]; exact (integrable_monomial (s 0) (s 1)).const_mul c
  | add _ _ hP hQ => simp_rw [ev, map_add]; exact hP.add hQ

def Ef : CPoly →ₗ[ℂ] ℂ where
  toFun P := ∫ z, ev z P ∂gaussC
  map_add' P Q := by simp_rw [ev, map_add]; exact integral_add (integrable_ev P) (integrable_ev Q)
  map_smul' c P := by
    simp_rw [ev, smul_eval, RingHom.id_apply, smul_eq_mul]; exact integral_const_mul c _

lemma Ef_apply (P : CPoly) : Ef P = ∫ z, ev z P ∂gaussC := rfl

lemma Ef_monomial (s : Fin 2 →₀ ℕ) (c : ℂ) :
    Ef (monomial s c) = c * if s 0 = s 1 then ((s 0).factorial : ℂ) else 0 := by
  rw [Ef_apply]; simp_rw [ev_monomial]; rw [integral_const_mul, integral_moment]

lemma Ef_one : Ef 1 = 1 := by
  have : (1 : CPoly) = monomial 0 1 := rfl
  rw [this, Ef_monomial]; simp

theorem Ef_X0_mul (P : CPoly) : Ef (X 0 * P) = Ef (pderiv 1 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, Ef_monomial, Ef_monomial]
    have e0 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 + 1 := by simp [add_comm]
    have e1 : ((Finsupp.single 0 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 := by simp
    have f0 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 := by simp
    have f1 : ((s - Finsupp.single 1 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 - 1 := by simp
    rw [e0, e1, f0, f1]
    generalize s 0 = a; generalize s 1 = b
    cases b with
    | zero => simp
    | succ k =>
      by_cases h : a = k
      · subst h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

theorem Ef_X1_mul (P : CPoly) : Ef (X 1 * P) = Ef (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on' with
  | monomial s c =>
    rw [X, monomial_mul_monomial, one_mul, pderiv_monomial, Ef_monomial, Ef_monomial]
    have e0 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 := by simp
    have e1 : ((Finsupp.single 1 1 + s : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 + 1 := by simp [add_comm]
    have f0 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 0 = s 0 - 1 := by simp
    have f1 : ((s - Finsupp.single 0 1 : Fin 2 →₀ ℕ) : Fin 2 → ℕ) 1 = s 1 := by simp
    rw [e0, e1, f0, f1]
    generalize s 1 = b; generalize s 0 = a
    cases a with
    | zero => simp
    | succ k =>
      by_cases h : k = b
      · subst h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | add _ _ hP hQ => simp only [mul_add, map_add, hP, hQ]

def conjP : CPoly →+* CPoly :=
  (MvPolynomial.map (starRingEnd ℂ)).comp (rename (Equiv.swap (0 : Fin 2) 1)).toRingHom

lemma conjP_X (i : Fin 2) : conjP (X i) = X (Equiv.swap (0 : Fin 2) 1 i) := by simp [conjP]

lemma conjP_C (a : ℂ) : conjP (C a) = C (conj a) := by simp [conjP]

lemma ev_conjP (z : ℂ) (P : CPoly) : ev z (conjP P) = conj (ev z P) := by
  induction P using MvPolynomial.induction_on with
  | C a => simp [conjP_C, ev]
  | add _ _ hP hQ => simp [ev, map_add] at *; rw [hP, hQ]
  | mul_X P i hP =>
    rw [map_mul, conjP_X]
    simp only [ev, map_mul, eval_X] at *; rw [hP]
    fin_cases i <;> simp [zv]

lemma pderiv_comm (P : CPoly) : pderiv 0 (pderiv 1 P) = pderiv 1 (pderiv 0 P) := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp
  | add _ _ hP hQ => simp [hP, hQ]
  | mul_X _ k hP => fin_cases k <;> simp [Derivation.leibniz, pderiv_X, hP] <;> ring

lemma pderiv_conjP (i : Fin 2) (P : CPoly) :
    pderiv i (conjP P) = conjP (pderiv (Equiv.swap (0 : Fin 2) 1 i) P) := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp [conjP_C]
  | add _ _ hP hQ => simp [hP, hQ]
  | mul_X _ k hP =>
    simp only [map_mul, conjP_X, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> fin_cases k <;> simp [pderiv_X]

def ip (f g : CPoly) : ℂ := Ef (conjP f * g)

lemma ip_eq_integral (f g : CPoly) : ip f g = ∫ z, conj (ev z f) * ev z g ∂gaussC := by
  rw [ip, Ef_apply]
  refine integral_congr_ae (Filter.Eventually.of_forall fun z => ?_)
  show eval (zv z) (conjP f * g) = conj (ev z f) * ev z g
  rw [map_mul, ← ev_conjP]; rfl

def A0 (f : CPoly) : CPoly := X 0 * f - pderiv 1 f
def A1 (f : CPoly) : CPoly := X 1 * f - pderiv 0 f

lemma A0_smul (n : ℕ) (f : CPoly) : A0 (n • f) = n • A0 f := by
  simp [A0, nsmul_eq_mul, mul_sub]; ring

lemma A1_smul (n : ℕ) (f : CPoly) : A1 (n • f) = n • A1 f := by
  simp [A1, nsmul_eq_mul, mul_sub]; ring

lemma Ef_A0 (f : CPoly) : Ef (A0 f) = 0 := by rw [A0, map_sub, Ef_X0_mul, sub_self]
lemma Ef_A1 (f : CPoly) : Ef (A1 f) = 0 := by rw [A1, map_sub, Ef_X1_mul, sub_self]

theorem ip_A0 (f g : CPoly) : ip (A0 f) g = ip f (pderiv 0 g) := by
  have hc : conjP (A0 f) = X 1 * conjP f - pderiv 0 (conjP f) := by
    rw [A0, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl
  rw [ip, ip, hc, sub_mul, map_sub, mul_assoc, Ef_X1_mul, Derivation.leibniz, map_add]
  simp [smul_eq_mul, mul_comm]

theorem ip_A1 (f g : CPoly) : ip (A1 f) g = ip f (pderiv 1 g) := by
  have hc : conjP (A1 f) = X 0 * conjP f - pderiv 1 (conjP f) := by
    rw [A1, map_sub, map_mul, conjP_X, pderiv_conjP]; rfl
  rw [ip, ip, hc, sub_mul, map_sub, mul_assoc, Ef_X0_mul, Derivation.leibniz, map_add]
  simp [smul_eq_mul, mul_comm]

lemma pderiv0_A0 (f : CPoly) : pderiv 0 (A0 f) = f + A0 (pderiv 0 f) := by
  simp [A0, Derivation.leibniz, pderiv_X, pderiv_comm]; ring

lemma pderiv0_A1 (f : CPoly) : pderiv 0 (A1 f) = A1 (pderiv 0 f) := by
  simp [A1, Derivation.leibniz, pderiv_X]

lemma pderiv1_A0 (f : CPoly) : pderiv 1 (A0 f) = A0 (pderiv 1 f) := by
  simp [A0, Derivation.leibniz, pderiv_X]

lemma pderiv1_A1 (f : CPoly) : pderiv 1 (A1 f) = f + A1 (pderiv 1 f) := by
  simp [A1, Derivation.leibniz, pderiv_X, ← pderiv_comm]; ring

def H (p q : ℕ) : CPoly := A0^[p] (A1^[q] 1)

lemma H_succ_left (p q : ℕ) : H (p + 1) q = A0 (H p q) := by
  simp [H, Function.iterate_succ_apply']

lemma H_zero_succ (q : ℕ) : H 0 (q + 1) = A1 (H 0 q) := by
  simp [H, Function.iterate_succ_apply']

lemma H_zero_zero : H 0 0 = 1 := rfl

lemma A1_A0 (f : CPoly) : A1 (A0 f) = A0 (A1 f) := by
  simp only [A1, A0, map_sub, Derivation.leibniz, smul_eq_mul, pderiv_X_self, pderiv_comm]
  simp; ring

lemma A1_H (p q : ℕ) : A1 (H p q) = H p (q + 1) := by
  induction p with
  | zero => rw [H_zero_succ]
  | succ _ ih => rw [H_succ_left, A1_A0, ih, H_succ_left]

lemma pderiv0_H_zero (q : ℕ) : pderiv 0 (H 0 q) = 0 := by
  unfold H; dsimp only [Function.iterate_zero, id_eq]
  induction q with
  | zero => simp
  | succ _ ih => rw [Function.iterate_succ_apply', pderiv0_A1, ih]; simp [A1]

lemma pderiv1_A1_iter (q : ℕ) : pderiv 1 (A1^[q + 1] 1) = (q + 1) • A1^[q] 1 := by
  induction q with
  | zero => simp [A1, pderiv_X]
  | succ _ ih =>
    rw [Function.iterate_succ_apply', pderiv1_A1, ih, A1_smul, ← Function.iterate_succ_apply' A1]
    simp only [add_smul, one_smul]; abel

lemma pderiv0_H_succ (p q : ℕ) : pderiv 0 (H (p + 1) q) = (p + 1) • H p q := by
  induction p with
  | zero => rw [H_succ_left, pderiv0_A0, pderiv0_H_zero]; simp [A0]
  | succ _ ih =>
    rw [H_succ_left, pderiv0_A0, ih, A0_smul, ← H_succ_left]
    simp only [add_smul, one_smul]; abel

lemma pderiv1_H (p q : ℕ) : pderiv 1 (H p q) = A0^[p] (pderiv 1 (A1^[q] 1)) := by
  induction p with
  | zero => rfl
  | succ _ ih => rw [H_succ_left, pderiv1_A0, ih, Function.iterate_succ_apply']

lemma A0_iter_smul (p n : ℕ) (f : CPoly) : A0^[p] (n • f) = n • A0^[p] f := by
  induction p with
  | zero => rfl
  | succ _ ih => rw [Function.iterate_succ_apply', Function.iterate_succ_apply', ih, A0_smul]

lemma A0_iter_zero (p : ℕ) : A0^[p] (0 : CPoly) = 0 := by
  induction p with
  | zero => rfl
  | succ _ ih => rw [Function.iterate_succ_apply', ih]; simp [A0]

lemma pderiv1_H_zero (p : ℕ) : pderiv 1 (H p 0) = 0 := by rw [pderiv1_H]; simp [A0_iter_zero]

lemma pderiv1_H_succ (p q : ℕ) : pderiv 1 (H p (q + 1)) = (q + 1) • H p q := by
  rw [pderiv1_H, pderiv1_A1_iter, A0_iter_smul]; rfl

private lemma ip_zero (f : CPoly) : ip f 0 = 0 := by simp [ip]
private lemma ip_nsmul (f g : CPoly) (n : ℕ) : ip f (n • g) = n * ip f g := by
  rw [ip, ip, mul_smul_comm, map_nsmul, nsmul_eq_mul]

private lemma Ef_H (r s : ℕ) : Ef (H r s) = if r = 0 ∧ s = 0 then 1 else 0 := by
  cases r with
  | succ _ => rw [H_succ_left, Ef_A0]; simp
  | zero =>
    cases s with
    | zero => rw [H_zero_zero, Ef_one]; simp
    | succ _ => rw [H_zero_succ, Ef_A1]; simp

theorem ip_H (p q r s : ℕ) :
    ip (H p q) (H r s) = if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) else 0 := by
  induction p generalizing r with
  | succ p ih =>
    rw [H_succ_left, ip_A0]
    cases r with
    | zero => rw [pderiv0_H_zero, ip_zero]; simp
    | succ r =>
      rw [pderiv0_H_succ, ip_nsmul, ih]
      by_cases h : p = r ∧ q = s
      · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]; ring
      · simp [h]
  | zero =>
    induction q generalizing r s with
    | succ q ih =>
      rw [H_zero_succ, ip_A1]
      cases s with
      | zero => rw [pderiv1_H_zero, ip_zero]; simp
      | succ s =>
        rw [pderiv1_H_succ, ip_nsmul, ih]
        by_cases h : 0 = r ∧ q = s
        · obtain ⟨rfl, rfl⟩ := h; simp [Nat.factorial_succ]
        · simp [h]
    | zero =>
      rw [H_zero_zero, ip, map_one, one_mul, Ef_H]
      by_cases h : r = 0 ∧ s = 0
      · obtain ⟨rfl, rfl⟩ := h; simp
      · have h' : ¬(0 = r ∧ 0 = s) := by omega
        simp [h, h']

theorem integral_hermite (p q r s : ℕ) :
    ∫ z, conj (ev z (H p q)) * ev z (H r s) ∂gaussC
      = if p = r ∧ q = s then ((p.factorial * q.factorial : ℕ) : ℂ) else 0 := by
  rw [← ip_eq_integral, ip_H]

/-! ### 6. Completeness and Hilbert basis on `ℂ` and `ℂ × ℂ` -/

private def spanH : Submodule ℂ CPoly :=
  Submodule.span ℂ (Set.range fun pq : ℕ × ℕ => H pq.1 pq.2)

private lemma H_mem (p q : ℕ) : H p q ∈ spanH := Submodule.subset_span ⟨(p, q), rfl⟩

private lemma X0_mul_mem {v : CPoly} (hv : v ∈ spanH) : X 0 * v ∈ spanH := by
  refine (Submodule.span_le.2 ?_ : spanH ≤ spanH.comap (LinearMap.mul ℂ _ (X 0))) hv
  rintro _ ⟨⟨p, q⟩, rfl⟩
  change X 0 * H p q ∈ spanH
  have : X 0 * H p q = A0 (H p q) + pderiv 1 (H p q) := by simp [A0]
  rw [this, ← H_succ_left]
  refine spanH.add_mem (H_mem _ _) ?_
  cases q with
  | zero => rw [pderiv1_H_zero]; exact spanH.zero_mem
  | succ _ => rw [pderiv1_H_succ]; exact spanH.smul_of_tower_mem _ (H_mem _ _)

private lemma X1_mul_mem {v : CPoly} (hv : v ∈ spanH) : X 1 * v ∈ spanH := by
  refine (Submodule.span_le.2 ?_ : spanH ≤ spanH.comap (LinearMap.mul ℂ _ (X 1))) hv
  rintro _ ⟨⟨p, q⟩, rfl⟩
  change X 1 * H p q ∈ spanH
  have : X 1 * H p q = A1 (H p q) + pderiv 0 (H p q) := by simp [A1]
  rw [this, A1_H]
  refine spanH.add_mem (H_mem _ _) ?_
  cases p with
  | zero => rw [pderiv0_H_zero]; exact spanH.zero_mem
  | succ _ => rw [pderiv0_H_succ]; exact spanH.smul_of_tower_mem _ (H_mem _ _)

theorem mem_span_H (P : CPoly) : P ∈ spanH := by
  induction P using MvPolynomial.induction_on with
  | C a => rw [← mul_one (C a), C_mul', ← H_zero_zero]; exact spanH.smul_mem a (H_mem 0 0)
  | add _ _ hP hQ => exact spanH.add_mem hP hQ
  | mul_X _ i hP => rw [mul_comm]; fin_cases i; exacts [X0_mul_mem hP, X1_mul_mem hP]

lemma memLp_ev (P : CPoly) : MemLp (fun z => ev z P) 2 gaussC := by
  refine (memLp_two_iff_integrable_sq_norm (continuous_ev P).aestronglyMeasurable).2 ?_
  refine ((integrable_ev (conjP P * P)).norm).congr (Filter.Eventually.of_forall fun z => ?_)
  simp only [ev, map_mul]
  rw [← ev, ← ev, ev_conjP, norm_mul, Complex.norm_conj, sq]

lemma memLp_conj_ev (P : CPoly) : MemLp (fun z => conj (ev z P)) 2 gaussC := by
  refine (memLp_ev (conjP P)).congr_norm
    (Complex.continuous_conj.comp (continuous_ev P)).aestronglyMeasurable
    (Filter.Eventually.of_forall fun z => ?_)
  simp only [ev_conjP]

private def realPoly : MvPolynomial (Fin 2) ℝ →ₐ[ℝ] CPoly :=
  aeval ![C ((√2 : ℝ) : ℂ)⁻¹ * (X 0 + X 1), C (-Complex.I * ((√2 : ℝ) : ℂ)⁻¹) * (X 0 - X 1)]

private lemma ev_toC_realPoly (x : Fin 2 → ℝ) (P : MvPolynomial (Fin 2) ℝ) :
    ev (toC x) (realPoly P) = (eval x P : ℂ) := by
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by rw [Complex.ofReal_ne_zero]; positivity
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  induction P using MvPolynomial.induction_on with
  | C _ => simp [realPoly, ev]
  | add _ _ hP hQ => simp only [map_add, ev] at *; rw [hP, hQ]; push_cast; ring
  | mul_X _ i hP =>
    simp only [map_mul, ev] at *; rw [hP]; push_cast; congr 1
    fin_cases i
    · simp [realPoly, zv, toC]; field_simp
      linear_combination (-(x 0 : ℂ)) * hs
    · simp [realPoly, zv, toC]; field_simp
      linear_combination (-(x 1 : ℂ)) * hs + (-2 * (x 1 : ℂ)) * Complex.I_sq

private def fromC (z : ℂ) : Fin 2 → ℝ := ![√2 * z.re, √2 * z.im]

private lemma fromC_toC (x : Fin 2 → ℝ) : fromC (toC x) = x := by
  have h2 : (√2 : ℝ) ≠ 0 := by positivity
  ext i; fin_cases i <;> simp [fromC, toC, Complex.div_re, Complex.div_im] <;> field_simp <;>
    rw [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)] <;> ring

private lemma toC_fromC (z : ℂ) : toC (fromC z) = z := by
  have hs : ((√2 : ℝ) : ℂ) * ((√2 : ℝ) : ℂ) = 2 := by
    rw [← Complex.ofReal_mul, Real.mul_self_sqrt (by norm_num)]; norm_num
  have h2 : ((√2 : ℝ) : ℂ) ≠ 0 := by rw [Complex.ofReal_ne_zero]; positivity
  simp only [toC, fromC, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one]
  push_cast; field_simp; exact Complex.re_add_im z

private lemma measurableEmbedding_toC : MeasurableEmbedding toC := by
  refine MeasurableEmbedding.of_measurable_inverse measurable_toC ?_ (by unfold fromC; fun_prop)
    fromC_toC
  rw [Set.range_eq_univ.2 fun z => ⟨fromC z, toC_fromC z⟩]; exact MeasurableSet.univ

theorem hermite_complete {f : ℂ → ℂ} (hf : MemLp f 2 gaussC)
    (h : ∀ p q, ∫ z, conj (ev z (H p q)) * f z ∂gaussC = 0) : f =ᵐ[gaussC] 0 := by
  have hspan : ∀ P : CPoly, ∫ z, conj (ev z P) * f z ∂gaussC = 0 := fun P => by
    have hP := mem_span_H P
    induction hP using Submodule.span_induction with
    | mem _ hv => obtain ⟨⟨p, q⟩, rfl⟩ := hv; exact h p q
    | zero => simp [ev]
    | add u v _ _ hu hv =>
      have e : ∀ z, conj (ev z (u + v)) * f z = conj (ev z u) * f z + conj (ev z v) * f z :=
        fun _ => by simp [ev, add_mul]
      simp_rw [e]
      have hu_i : Integrable (fun z => conj (ev z u) * f z) gaussC :=
        (memLp_conj_ev u).integrable_mul hf
      have hv_i : Integrable (fun z => conj (ev z v) * f z) gaussC :=
        (memLp_conj_ev v).integrable_mul hf
      rw [integral_add hu_i hv_i, hu, hv, add_zero]
    | smul c v _ hv =>
      have e : ∀ z, conj (ev z (c • v)) * f z = conj c * (conj (ev z v) * f z) :=
        fun _ => by simp [ev, smul_eval, mul_assoc]
      simp_rw [e]; rw [integral_const_mul, hv, mul_zero]
  set g : (Fin 2 → ℝ) → ℂ := f ∘ toC with hg_def
  have hg : MemLp g 2 (stdGaussian 2) :=
    (memLp_map_measure_iff hf.aestronglyMeasurable measurable_toC.aemeasurable).1 hf
  have horth : ∀ P : MvPolynomial (Fin 2) ℝ,
      ∫ x, ((eval x P : ℝ) : ℂ) * g x ∂(stdGaussian 2) = 0 := fun P => by
    have hp := hspan (realPoly P)
    have hm : AEStronglyMeasurable (fun z => conj (ev z (realPoly P)) * f z) gaussC :=
      (Complex.continuous_conj.comp (continuous_ev _)).aestronglyMeasurable.mul
        hf.aestronglyMeasurable
    rw [gaussC] at hp hm
    rw [integral_map measurable_toC.aemeasurable hm] at hp
    rw [← hp]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    simp only [hg_def, Function.comp, ev_toC_realPoly, Complex.conj_ofReal]
  have hint : ∀ P : MvPolynomial (Fin 2) ℝ,
      Integrable (fun x => ((eval x P : ℝ) : ℂ) * g x) (stdGaussian 2) := fun P =>
    ((Complex.ofRealCLM.comp_memLp' (memLp_eval P)).integrable_mul hg).congr
      (Filter.Eventually.of_forall fun _ => by simp)
  have hre : (fun x => (g x).re) =ᵐ[stdGaussian 2] 0 := by
    refine poly_complete (by simpa using hg.re) fun P => ?_
    have := congrArg Complex.re (horth P)
    have e := integral_re (hint P)
    simp only [RCLike.re_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_re, mul_comm] using this
  have him : (fun x => (g x).im) =ᵐ[stdGaussian 2] 0 := by
    refine poly_complete (by simpa using hg.im) fun P => ?_
    have := congrArg Complex.im (horth P)
    have e := integral_im (hint P)
    simp only [RCLike.im_to_complex] at e
    rw [← e] at this
    simpa [Complex.mul_im, mul_comm] using this
  have hg0 : ∀ᵐ x ∂(stdGaussian 2), f (toC x) = 0 := by
    filter_upwards [hre, him] with x h1 h2; exact Complex.ext h1 h2
  exact measurableEmbedding_toC.ae_map_iff.2 hg0

def nrm (p q : ℕ) : ℝ := (√((p.factorial * q.factorial : ℕ) : ℝ))⁻¹

lemma nrm_sq_mul (p q : ℕ) : nrm p q * nrm p q * ((p.factorial * q.factorial : ℕ) : ℝ) = 1 := by
  have h : (0 : ℝ) < ((p.factorial * q.factorial : ℕ) : ℝ) := by
    have := Nat.factorial_pos p; have := Nat.factorial_pos q; positivity
  rw [nrm, ← mul_inv, Real.mul_self_sqrt h.le, inv_mul_cancel₀ h.ne']

def hfun (i : ℕ × ℕ) (z : ℂ) : ℂ := (nrm i.1 i.2 : ℂ) * ev z (H i.1 i.2)

lemma memLp_hfun (i : ℕ × ℕ) : MemLp (hfun i) 2 gaussC := (memLp_ev _).const_mul _

def hvec (i : ℕ × ℕ) : Lp ℂ 2 gaussC := (memLp_hfun i).toLp _

lemma inner_toLp {α : Type*} [MeasurableSpace α] {μ : Measure α} {F G : α → ℂ}
    (hF : MemLp F 2 μ) (hG : MemLp G 2 μ) :
    ⟪hF.toLp F, hG.toLp G⟫_ℂ = ∫ x, conj (F x) * G x ∂μ := by
  rw [L2.inner_def]
  refine integral_congr_ae ?_
  filter_upwards [hF.coeFn_toLp, hG.coeFn_toLp] with _ h1 h2
  rw [h1, h2, RCLike.inner_apply, mul_comm]

/-! ### 7. Product completeness, `H2`, `hermiteBasis2`, and charge selection -/

section ProductL2

private lemma norm_toLp_sq {α : Type*} [MeasurableSpace α] {μ : Measure α} {f : α → ℂ}
    (hf : MemLp f 2 μ) : ‖hf.toLp f‖ ^ 2 = ∫ x, ‖f x‖ ^ 2 ∂μ := by
  calc
    ‖hf.toLp f‖ ^ 2 = RCLike.re ⟪hf.toLp f, hf.toLp f⟫_ℂ := norm_sq_eq_re_inner (𝕜 := ℂ) _
    _ = ∫ x, RCLike.re ⟪hf.toLp f x, hf.toLp f x⟫_ℂ ∂μ := by
      rw [L2.inner_def]; exact (integral_re (L2.integrable_inner (𝕜 := ℂ) _ _)).symm
    _ = _ := by
      refine integral_congr_ae ?_
      filter_upwards [hf.coeFn_toLp] with _ hx
      rw [hx, ← norm_sq_eq_re_inner]

lemma memLp_prod_mul {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν] {f : α → ℂ} {g : β → ℂ}
    (hf : MemLp f 2 μ) (hg : MemLp g 2 ν) :
    MemLp (fun u : α × β => f u.1 * g u.2) 2 (μ.prod ν) := by
  refine (memLp_two_iff_integrable_sq_norm
    (hf.aestronglyMeasurable.comp_fst.mul hg.aestronglyMeasurable.comp_snd)).2 ?_
  have h := (hf.integrable_norm_pow (by decide : 2 ≠ 0)).mul_prod
    (hg.integrable_norm_pow (by decide : 2 ≠ 0))
  simpa only [Pi.mul_apply, norm_mul, mul_pow] using h

private lemma ae_memLp_fibre {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    {F : α × β → ℂ} (hF : MemLp F 2 (μ.prod ν)) :
    ∀ᵐ x ∂μ, MemLp (fun y => F (x, y)) 2 ν := by
  filter_upwards [hF.aestronglyMeasurable.prodMk_left,
    (hF.integrable_norm_pow (by decide : 2 ≠ 0)).prod_right_ae] with _ hm hi
  exact (memLp_two_iff_integrable_sq_norm hm).2 hi

private lemma memLp_integral_conj_mul {α β : Type*} [MeasurableSpace α] [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    {F : α × β → ℂ} {g : β → ℂ} (hF : MemLp F 2 (μ.prod ν)) (hg : MemLp g 2 ν) :
    MemLp (fun x => ∫ y, conj (g y) * F (x, y) ∂ν) 2 μ := by
  have hm : AEStronglyMeasurable (fun x => ∫ y, conj (g y) * F (x, y) ∂ν) μ :=
    (hg.aestronglyMeasurable.star.comp_snd.mul hF.aestronglyMeasurable).integral_prod_right'
  refine (memLp_two_iff_integrable_sq_norm hm).2 ?_
  refine ((hF.integrable_norm_pow (by decide : 2 ≠ 0)).integral_prod_left.const_mul
    (∫ y, ‖g y‖ ^ 2 ∂ν)).mono' (hm.norm.pow 2) ?_
  filter_upwards [ae_memLp_fibre hF] with x hx
  rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  have h := pow_le_pow_left₀ (norm_nonneg ⟪hg.toLp g, hx.toLp (fun y => F (x, y))⟫_ℂ)
    (norm_inner_le_norm (𝕜 := ℂ) (hg.toLp g) (hx.toLp (fun y => F (x, y)))) 2
  simpa only [inner_toLp, mul_pow, norm_toLp_sq] using h

theorem complete_prod {α β ι κ : Type*} [MeasurableSpace α] [MeasurableSpace β] [Countable κ]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (b : ι → α → ℂ) (c : κ → β → ℂ)
    (hb : ∀ i, MemLp (b i) 2 μ) (hc : ∀ j, MemLp (c j) 2 ν)
    (hcomplete_b : ∀ {f : α → ℂ}, MemLp f 2 μ →
      (∀ i, ∫ x, conj (b i x) * f x ∂μ = 0) → f =ᵐ[μ] 0)
    (hcomplete_c : ∀ {g : β → ℂ}, MemLp g 2 ν →
      (∀ j, ∫ y, conj (c j y) * g y ∂ν = 0) → g =ᵐ[ν] 0)
    {F : α × β → ℂ} (hF : MemLp F 2 (μ.prod ν))
    (h : ∀ i j, ∫ u, conj (b i u.1 * c j u.2) * F u ∂μ.prod ν = 0) :
    F =ᵐ[μ.prod ν] 0 := by
  have hcoeff : ∀ j, (fun x => ∫ y, conj (c j y) * F (x, y) ∂ν) =ᵐ[μ] 0 := fun j => by
    refine hcomplete_b (memLp_integral_conj_mul hF (hc j)) fun i => ?_
    have hi : Integrable (fun u : α × β => conj (b i u.1 * c j u.2) * F u) (μ.prod ν) :=
      ((memLp_prod_mul (hb i) (hc j)).star.integrable_mul hF).congr
        (Filter.Eventually.of_forall fun _ => rfl)
    have hz := h i j
    rw [integral_prod _ hi] at hz
    rw [← hz]
    refine integral_congr_ae (Filter.Eventually.of_forall fun x => ?_)
    dsimp only
    rw [← integral_const_mul]
    exact integral_congr_ae (Filter.Eventually.of_forall fun _ => by simp only [map_mul, mul_assoc])
  have hfibres : ∀ᵐ x ∂μ, (fun y => F (x, y)) =ᵐ[ν] 0 := by
    filter_upwards [ae_memLp_fibre hF, ae_all_iff.2 hcoeff] with _ hx hz
    exact hcomplete_c hx hz
  have hsq := hF.integrable_norm_pow (by decide : 2 ≠ 0)
  have hzero : ∫ u, ‖F u‖ ^ 2 ∂μ.prod ν = 0 := by
    rw [integral_prod _ hsq]
    refine integral_eq_zero_of_ae ?_
    filter_upwards [hfibres] with _ hx
    refine integral_eq_zero_of_ae ?_
    filter_upwards [hx] with _ hy; simp [hy]
  have hz := (integral_eq_zero_iff_of_nonneg (fun u => sq_nonneg ‖F u‖) hsq).1 hzero
  filter_upwards [hz] with _ hu; simpa using hu

end ProductL2

abbrev Idx2 := (ℕ × ℕ) × (ℕ × ℕ)

def H2 (i : Idx2) (u : ℂ × ℂ) : ℂ := ev u.1 (H i.1.1 i.1.2) * ev u.2 (H i.2.1 i.2.2)

def fac2 (i : Idx2) : ℕ := i.1.1.factorial * i.1.2.factorial * (i.2.1.factorial * i.2.2.factorial)

lemma memLp_H2 (i : Idx2) : MemLp (H2 i) 2 mu2 := by
  unfold H2
  exact memLp_prod_mul (f := fun z => ev z (H i.1.1 i.1.2)) (g := fun z => ev z (H i.2.1 i.2.2))
    (memLp_ev _) (memLp_ev _)

theorem integral_hermite2 (i j : Idx2) :
    ∫ u, conj (H2 i u) * H2 j u ∂mu2 = if i = j then (fac2 i : ℂ) else 0 := by
  have : ∀ u : ℂ × ℂ, conj (H2 i u) * H2 j u
      = (conj (ev u.1 (H i.1.1 i.1.2)) * ev u.1 (H j.1.1 j.1.2))
        * (conj (ev u.2 (H i.2.1 i.2.2)) * ev u.2 (H j.2.1 j.2.2)) := fun _ => by
    simp only [H2, map_mul]; ring
  simp_rw [this]
  rw [integral_prod_mul (f := fun z => conj (ev z (H i.1.1 i.1.2)) * ev z (H j.1.1 j.1.2))
    (g := fun z => conj (ev z (H i.2.1 i.2.2)) * ev z (H j.2.1 j.2.2)),
    integral_hermite, integral_hermite]
  split_ifs <;> simp_all [Prod.ext_iff, fac2]

theorem hermite2_complete {F : ℂ × ℂ → ℂ} (hF : MemLp F 2 mu2)
    (h : ∀ i, ∫ u, conj (H2 i u) * F u ∂mu2 = 0) : F =ᵐ[mu2] 0 := by
  let b (i : ℕ × ℕ) (z : ℂ) := ev z (H i.1 i.2)
  exact complete_prod b b (fun _ => memLp_ev _) (fun _ => memLp_ev _)
    (fun hf hi => hermite_complete hf fun p q => hi (p, q))
    (fun hf hi => hermite_complete hf fun p q => hi (p, q)) hF
    (fun i j => h (i, j))

def nrm2 (i : Idx2) : ℝ := (√(fac2 i : ℝ))⁻¹

lemma fac2_pos (i : Idx2) : (0 : ℝ) < fac2 i := by
  unfold fac2
  have := Nat.factorial_pos i.1.1; have := Nat.factorial_pos i.1.2
  have := Nat.factorial_pos i.2.1; have := Nat.factorial_pos i.2.2
  positivity

lemma nrm2_pos (i : Idx2) : 0 < nrm2 i := by unfold nrm2; have := fac2_pos i; positivity

def hfun2 (i : Idx2) (u : ℂ × ℂ) : ℂ := (nrm2 i : ℂ) * H2 i u

lemma memLp_hfun2 (i : Idx2) : MemLp (hfun2 i) 2 mu2 := (memLp_H2 i).const_mul _

def hvec2 (i : Idx2) : Lp ℂ 2 mu2 := (memLp_hfun2 i).toLp _

lemma inner_hvec2 (i j : Idx2) : ⟪hvec2 i, hvec2 j⟫_ℂ = if i = j then 1 else 0 := by
  rw [hvec2, hvec2, inner_toLp]
  simp only [hfun2, map_mul, Complex.conj_ofReal]
  have : ∀ u, (nrm2 i : ℂ) * conj (H2 i u) * ((nrm2 j : ℂ) * H2 j u)
      = ((nrm2 i : ℂ) * nrm2 j) * (conj (H2 i u) * H2 j u) := fun _ => by ring
  simp_rw [this]
  rw [integral_const_mul, integral_hermite2]
  by_cases h : i = j
  · subst h; simp only [↓reduceIte]
    have h1 : nrm2 i * nrm2 i * (fac2 i : ℝ) = 1 := by
      rw [nrm2, ← mul_inv, Real.mul_self_sqrt (fac2_pos i).le, inv_mul_cancel₀ (fac2_pos i).ne']
    exact_mod_cast h1
  · simp [h]

theorem orthonormal_hvec2 : Orthonormal ℂ hvec2 := orthonormal_iff_ite.2 inner_hvec2

lemma inner_hvec2_left (i : Idx2) (G : Lp ℂ 2 mu2) :
    ⟪hvec2 i, G⟫_ℂ = (nrm2 i : ℂ) * ∫ u, conj (H2 i u) * G u ∂mu2 := by
  rw [L2.inner_def, ← integral_const_mul]
  refine integral_congr_ae ?_
  filter_upwards [(memLp_hfun2 i).coeFn_toLp] with u hu
  simp only [hvec2] at *
  rw [hu, RCLike.inner_apply]; simp [hfun2, Complex.conj_ofReal]; ring

theorem span_hvec2_perp : (Submodule.span ℂ (Set.range hvec2))ᗮ = ⊥ := by
  refine (Submodule.eq_bot_iff _).2 fun G hG => ?_
  have h0 : ∀ i, ∫ u, conj (H2 i u) * G u ∂mu2 = 0 := fun i => by
    have := Submodule.inner_right_of_mem_orthogonal
      (Submodule.subset_span ⟨i, rfl⟩ : hvec2 i ∈ Submodule.span ℂ (Set.range hvec2)) hG
    rw [inner_hvec2_left] at this
    exact (mul_eq_zero.1 this).resolve_left (by exact_mod_cast (nrm2_pos i).ne')
  exact Lp.eq_zero_iff_ae_eq_zero.2 (hermite2_complete (Lp.memLp G) h0)

def hermiteBasis2 : HilbertBasis Idx2 ℂ (Lp ℂ 2 mu2) :=
  HilbertBasis.mkOfOrthogonalEqBot orthonormal_hvec2 span_hvec2_perp

@[simp] lemma hermiteBasis2_apply (i : Idx2) : hermiteBasis2 i = hvec2 i := by simp [hermiteBasis2]

theorem hasSum_energy2 (G : Lp ℂ 2 mu2) :
    HasSum (fun i => ‖⟪hvec2 i, G⟫_ℂ‖ ^ 2) (‖G‖ ^ 2) := by
  have h := lp.hasSum_norm (p := 2) (by norm_num) (hermiteBasis2.repr G)
  simp only [ENNReal.toReal_ofNat, Real.rpow_two, HilbertBasis.repr_apply_apply,
    hermiteBasis2_apply, LinearIsometryEquiv.norm_map] at h
  exact_mod_cast h

/-! ### 8. Rotation action on `CPoly` and charge selection -/

def rotP (c : ℂ) : CPoly →ₐ[ℂ] CPoly := aeval ![C c * X 0, C (conj c) * X 1]

lemma ev_rotP (c z : ℂ) (P : CPoly) : ev z (rotP c P) = ev (c * z) P := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp [ev, rotP]
  | add _ _ hP hQ => simp only [map_add, ev] at *; rw [hP, hQ]
  | mul_X _ i hP => simp only [map_mul, ev] at *; rw [hP]; fin_cases i <;> simp [rotP, zv]

private lemma pderiv_rotP (c : ℂ) (j : Fin 2) (P : CPoly) :
    pderiv j (rotP c P) = rotP c (pderiv 0 P) * pderiv j (C c * X 0)
      + rotP c (pderiv 1 P) * pderiv j (C (conj c) * X 1) := by
  induction P using MvPolynomial.induction_on with
  | C _ => simp [rotP]
  | add _ _ hP hQ => simp only [map_add, hP, hQ]; ring
  | mul_X _ i hP =>
    simp only [map_mul, Derivation.leibniz, smul_eq_mul, map_add, hP]
    fin_cases i <;> fin_cases j <;> simp [rotP, pderiv_X] <;> ring

private lemma A0_C_mul (k : ℂ) (g : CPoly) : A0 (C k * g) = C k * A0 g := by
  simp only [A0, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

private lemma A1_C_mul (k : ℂ) (g : CPoly) : A1 (C k * g) = C k * A1 g := by
  simp only [A1, Derivation.leibniz, smul_eq_mul, pderiv_C, mul_zero, add_zero]; ring

private lemma rotP_A0 {c : ℂ} (hc : conj c * c = 1) (f : CPoly) :
    rotP c (A0 f) = C c * A0 (rotP c f) := by
  have h1 : pderiv 1 (rotP c f) = C (conj c) * rotP c (pderiv 1 f) := by
    rw [pderiv_rotP]; simp [pderiv_X]; ring
  have hX : rotP c (X 0) = C c * X 0 := by simp [rotP]
  have hcc : C c * C (conj c) = (1 : CPoly) := by rw [← map_mul, mul_comm, hc, map_one]
  rw [A0, A0, map_sub, map_mul, h1, hX]
  linear_combination (rotP c (pderiv 1 f)) * hcc

private lemma rotP_A1 {c : ℂ} (hc : conj c * c = 1) (f : CPoly) :
    rotP c (A1 f) = C (conj c) * A1 (rotP c f) := by
  have h0 : pderiv 0 (rotP c f) = C c * rotP c (pderiv 0 f) := by
    rw [pderiv_rotP]; simp [pderiv_X]; ring
  have hX : rotP c (X 1) = C (conj c) * X 1 := by simp [rotP]
  have hcc : C (conj c) * C c = (1 : CPoly) := by rw [← map_mul, hc, map_one]
  rw [A1, A1, map_sub, map_mul, h0, hX]
  linear_combination (rotP c (pderiv 0 f)) * hcc

lemma rotP_H {c : ℂ} (hc : conj c * c = 1) (p q : ℕ) :
    rotP c (H p q) = C (c ^ p * conj c ^ q) * H p q := by
  induction p with
  | zero =>
    induction q with
    | zero => simp [H_zero_zero]
    | succ _ ih =>
      rw [H_zero_succ, rotP_A1 hc, ih, A1_C_mul, ← mul_assoc, ← map_mul, ← H_zero_succ]
      congr 2; ring
  | succ _ ih =>
    rw [H_succ_left, rotP_A0 hc, ih, A0_C_mul, ← mul_assoc, ← map_mul, ← H_succ_left]
    congr 2; ring

lemma ev_mul_H {c : ℂ} (hc : conj c * c = 1) (z : ℂ) (p q : ℕ) :
    ev (c * z) (H p q) = c ^ p * conj c ^ q * ev z (H p q) := by
  rw [← ev_rotP, rotP_H hc]; simp [ev]

lemma exists_charge_witness {p q : ℕ} (hpq : p ≠ q + 1) :
    ∃ c : ℂ, ‖c‖ = 1 ∧ conj (c ^ p * conj c ^ q) * c ≠ 1 := by
  set k : ℤ := (q : ℤ) + 1 - p with hk
  have hk0 : (k : ℂ) ≠ 0 := by rw [Int.cast_ne_zero]; omega
  set c : ℂ := Complex.exp (((Real.pi : ℂ) / k) * Complex.I) with hcdef
  have hc1 : ‖c‖ = 1 := by
    rw [hcdef, show ((Real.pi : ℂ) / k) * Complex.I = ((Real.pi / k : ℝ) : ℂ) * Complex.I by
      push_cast; ring]
    exact Complex.norm_exp_ofReal_mul_I _
  have hc0 : c ≠ 0 := Complex.exp_ne_zero _
  have hci : conj c = c⁻¹ := by
    refine eq_inv_of_mul_eq_one_left ?_
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc1]; simp
  refine ⟨c, hc1, ?_⟩
  have hpow : conj (c ^ p * conj c ^ q) * c = c ^ k := by
    rw [map_mul, map_pow, map_pow, Complex.conj_conj, hci, hk, zpow_sub₀ hc0, zpow_add₀ hc0,
      zpow_natCast, zpow_natCast, zpow_one, inv_pow]
    field_simp
  rw [hpow, hcdef, ← Complex.exp_int_mul,
    show (k : ℂ) * ((Real.pi : ℂ) / k * Complex.I) = Real.pi * Complex.I by field_simp,
    Complex.exp_pi_mul_I]
  norm_num

def rot2 (c : ℂ) (u : ℂ × ℂ) : ℂ × ℂ := (c * u.1, c * u.2)

lemma map_rot2 {c : ℂ} (hc : ‖c‖ = 1) : mu2.map (rot2 c) = mu2 := by
  have : rot2 c = Prod.map (fun z => c * z) (fun z => c * z) := rfl
  rw [this, ← Measure.map_prod_map _ _ (by fun_prop) (by fun_prop), map_rot_gaussC c hc]

lemma H2_rot2 {c : ℂ} (hcc : conj c * c = 1) (i : Idx2) (u : ℂ × ℂ) :
    H2 i (rot2 c u) = c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2) * H2 i u := by
  simp only [H2, rot2, ev_mul_H hcc, pow_add]; ring

theorem integral_H2_charge_one {g : ℂ × ℂ → ℂ} (hg : MemLp g 2 mu2)
    (hch : ∀ c u, ‖c‖ = 1 → g (rot2 c u) = c * g u) {i : Idx2}
    (hi : i.1.1 + i.2.1 ≠ i.1.2 + i.2.2 + 1) : ∫ u, conj (H2 i u) * g u ∂mu2 = 0 := by
  obtain ⟨c, hc1, hcne⟩ := exists_charge_witness hi
  have hcc : conj c * c = 1 := by
    rw [← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq, hc1]; simp
  have hF : AEStronglyMeasurable (fun u => conj (H2 i u) * g u) (mu2.map (rot2 c)) := by
    rw [map_rot2 hc1]
    exact ((memLp_H2 i).aestronglyMeasurable.star).mul hg.aestronglyMeasurable
  have hrot := integral_map (by unfold rot2; fun_prop : AEMeasurable (rot2 c) mu2) hF
  rw [map_rot2 hc1] at hrot
  have e : ∀ u, conj (H2 i (rot2 c u)) * g (rot2 c u)
      = (conj (c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2)) * c) * (conj (H2 i u) * g u) :=
    fun u => by rw [H2_rot2 hcc, hch c u hc1]; simp only [map_mul]; ring
  simp_rw [e, integral_const_mul] at hrot
  have h2 : (conj (c ^ (i.1.1 + i.2.1) * conj c ^ (i.1.2 + i.2.2)) * c - 1)
      * ∫ u, conj (H2 i u) * g u ∂mu2 = 0 := by rw [sub_mul, ← hrot, one_mul, sub_self]
  exact (mul_eq_zero.1 h2).resolve_left (sub_ne_zero.2 hcne)

end

end Haagerup
