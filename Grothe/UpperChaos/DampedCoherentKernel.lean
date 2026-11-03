import Grothe.UpperChaos.DampedMoments
import Grothe.UpperChaos.Gauss2

/-!
# Complex Gaussian integration with independent linear sources

Agent-ID: codex-2ca4.

The two complex linear coefficients are independent; the second need not be
the conjugate of the first. The normalized Gaussian formulas below supply the
inner integration used by the subsequently defined bipartite kernels.

These evaluations do not identify those kernels with the historical operator
`HS_{j,I}`. That identification, the Fock coefficient/Parseval argument,
polynomial insertion, and numerical tail estimates remain separate obligations.
-/

open MeasureTheory ProbabilityTheory Complex
open scoped ComplexConjugate

namespace Grothe.UpperChaos.WeightedHSMass

noncomputable section

/-- Complex Gaussian integration with two independent linear source terms.
This is the diagonal real two-dimensional Gaussian integral, not an extension
of a Mehler correlation beyond the unit disc. -/
theorem integral_cexp_complex_linear {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z : ℂ, cexp (-(rate : ℂ) * (normSq z : ℂ) + a * z + b * conj z)) =
      ((Real.pi : ℂ) / (rate : ℂ)) * cexp (a * b / (rate : ℂ)) := by
  have hrateC : (rate : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
  have hdet : 0 < (2 * rate) * (2 * rate) - (0 : ℝ) ^ 2 := by
    simpa using
      mul_pos (show (0 : ℝ) < 2 * rate by positivity)
        (show (0 : ℝ) < 2 * rate by positivity)
  have hsqrt : Real.sqrt ((2 * rate) * (2 * rate) - (0 : ℝ) ^ 2) =
      2 * rate := by
    rw [show (2 * rate) * (2 * rate) - (0 : ℝ) ^ 2 = (2 * rate) ^ 2 by ring]
    exact Real.sqrt_sq (by positivity)
  have hpoint (p : ℝ × ℝ) :
      cexp (-(rate : ℂ) * (normSq (measurableEquivRealProd.symm p) : ℂ) +
        a * measurableEquivRealProd.symm p + b * conj (measurableEquivRealProd.symm p)) =
      Gauss2.g (2 * rate) 0 (2 * rate) (a + b) ((a - b) * I) p := by
    have hz : measurableEquivRealProd.symm p = (p.1 : ℂ) + (p.2 : ℂ) * I := by
      apply Complex.ext <;> simp [measurableEquivRealProd_symm_apply]
    have hn : normSq (measurableEquivRealProd.symm p) = p.1 ^ 2 + p.2 ^ 2 := by
      simp [normSq_apply, measurableEquivRealProd_symm_apply, pow_two]
    rw [hn, hz]
    simp only [Gauss2.g, map_add, map_mul, conj_ofReal, conj_I]
    congr 1
    push_cast
    ring
  calc
    _ = ∫ p : ℝ × ℝ,
        cexp (-(rate : ℂ) * (normSq (measurableEquivRealProd.symm p) : ℂ) +
          a * measurableEquivRealProd.symm p +
            b * conj (measurableEquivRealProd.symm p)) :=
      (volume_preserving_equiv_real_prod.symm.integral_comp
        measurableEquivRealProd.symm.measurableEmbedding _).symm
    _ = ∫ p : ℝ × ℝ, Gauss2.g (2 * rate) 0 (2 * rate)
        (a + b) ((a - b) * I) p := by
      exact integral_congr_ae (Filter.Eventually.of_forall hpoint)
    _ = _ := by
      rw [Gauss2.integral_g (by positivity) hdet, hsqrt]
      have hpref : ((2 * Real.pi / (2 * rate) : ℝ) : ℂ) =
          (Real.pi : ℂ) / (rate : ℂ) := by
        rw [mul_div_mul_left _ _ (by norm_num : (2 : ℝ) ≠ 0), ofReal_div]
      rw [hpref]
      congr 1
      congr 1
      simp only [ofReal_mul, ofReal_ofNat, ofReal_zero, zero_pow (by decide : 2 ≠ 0),
        mul_zero, zero_mul, sub_zero, mul_pow, I_sq]
      field_simp
      ring

/-- The evaluated complex exponential is integrable for every pair of
complex linear sources whenever the radial rate is positive. -/
theorem integrable_cexp_complex_linear {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    Integrable (fun z : ℂ =>
      cexp (-(rate : ℂ) * (normSq z : ℂ) + a * z + b * conj z)) := by
  by_contra h
  have heq := integral_cexp_complex_linear hrate a b
  rw [integral_undef h] at heq
  have hrateC : (rate : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
  have hpiC : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  exact (mul_ne_zero (div_ne_zero hpiC hrateC) (Complex.exp_ne_zero _)) heq.symm

/-- The same integral against the repository's normalized standard complex
Gaussian, whose density is `pi^-1 * exp(-normSq z)`. -/
theorem integral_gaussC_cexp_linear {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    (∫ z : ℂ, cexp (-((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) +
      a * z + b * conj z) ∂Grothe.LowerAnalytic.gaussC) =
      (rate : ℂ)⁻¹ * cexp (a * b / (rate : ℂ)) := by
  rw [integral_gaussC_eq_volume_complex _ (by fun_prop)]
  have hpoint (z : ℂ) :
      (Real.pi⁻¹ * Real.exp (-normSq z)) •
        cexp (-((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) + a * z + b * conj z) =
      (Real.pi : ℂ)⁻¹ *
        cexp (-(rate : ℂ) * (normSq z : ℂ) + a * z + b * conj z) := by
    simp only [Complex.real_smul, ofReal_mul, ofReal_inv, ofReal_exp]
    rw [mul_assoc, ← Complex.exp_add]
    congr 1
    congr 1
    push_cast
    ring
  simp_rw [hpoint]
  rw [integral_const_mul, integral_cexp_complex_linear hrate]
  have hpiC : (Real.pi : ℂ) ≠ 0 := by exact_mod_cast Real.pi_ne_zero
  rw [← mul_assoc]
  congr 1
  rw [div_eq_mul_inv, ← mul_assoc, inv_mul_cancel₀ hpiC, one_mul]

theorem integrable_gaussC_cexp_linear {rate : ℝ} (hrate : 0 < rate) (a b : ℂ) :
    Integrable (fun z : ℂ => cexp (-((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) +
      a * z + b * conj z)) Grothe.LowerAnalytic.gaussC := by
  by_contra h
  have heq := integral_gaussC_cexp_linear hrate a b
  rw [integral_undef h] at heq
  have hrateC : (rate : ℂ) ≠ 0 := by exact_mod_cast hrate.ne'
  exact (mul_ne_zero (inv_ne_zero hrateC) (Complex.exp_ne_zero _)) heq.symm

/-- The real moment-generating function needed when taking the squared
modulus of a holomorphic kernel. -/
theorem integral_gaussC_exp_twice_re (a : ℂ) :
    (∫ z : ℂ, Real.exp (2 * (a * z).re) ∂Grothe.LowerAnalytic.gaussC) =
      Real.exp (normSq a) := by
  have h := integral_gaussC_cexp_linear (rate := 1) (by norm_num) a (conj a)
  simp only [sub_self, ofReal_zero, neg_zero, zero_mul, zero_add,
    ofReal_one, inv_one, one_mul, div_one] at h
  have hpoint (z : ℂ) : cexp (a * z + conj a * conj z) =
      (Real.exp (2 * (a * z).re) : ℂ) := by
    have he : a * z + conj a * conj z = ((2 * (a * z).re : ℝ) : ℂ) := by
      simpa only [map_mul, ofReal_mul, ofReal_ofNat] using Complex.add_conj (a * z)
    rw [he, ← ofReal_exp]
  simp_rw [hpoint] at h
  rw [integral_complex_ofReal, Complex.mul_conj, ← ofReal_exp] at h
  exact_mod_cast h

/-- Integrating one side of the bipartite four-source kernel is explicit.
With `a,b` equal to the two entries of `B*w`, this leaves the two-complex-
variable positive quadratic form `I-B^T*B`; no 4D determinant theorem is needed
for this first integration. -/
theorem integral_bipartite_kernel_inner (c a b : ℂ) :
    (∫ z : ℂ × ℂ, ‖c * cexp (a * z.1 + b * z.2)‖ ^ 2
      ∂Grothe.LowerAnalytic.gaussC.prod Grothe.LowerAnalytic.gaussC) =
      ‖c‖ ^ 2 * Real.exp (normSq a + normSq b) := by
  have hpoint (z : ℂ × ℂ) :
      ‖c * cexp (a * z.1 + b * z.2)‖ ^ 2 =
      ‖c‖ ^ 2 * (Real.exp (2 * (a * z.1).re) * Real.exp (2 * (b * z.2).re)) := by
    simp only [norm_mul, mul_pow, Complex.norm_exp, ← Real.exp_nat_mul,
      Nat.cast_ofNat, Complex.add_re, Real.exp_add]
  simp_rw [hpoint]
  rw [integral_const_mul,
    integral_prod_mul (μ := Grothe.LowerAnalytic.gaussC)
      (ν := Grothe.LowerAnalytic.gaussC)
      (fun z : ℂ => Real.exp (2 * (a * z).re))
      (fun z : ℂ => Real.exp (2 * (b * z).re)),
    integral_gaussC_exp_twice_re, integral_gaussC_exp_twice_re, Real.exp_add]

end
end Grothe.UpperChaos.WeightedHSMass
