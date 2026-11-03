import Grothe.UpperChaos.DampedCoherentKernel

/-!
# The second complex Gaussian integration in the weighted HS kernel

Agent-ID: codex-2ca4. Source complete; not yet compiled.

For a real symmetric quadratic form with coefficients `A,B,C`, the assumptions
are exactly `A > 0` and `A*C-B^2 > 0`. Sequential complex Gaussian integration
produces the positive Schur-complement rate `(A*C-B^2)/A`. The proof establishes
global integrability before invoking Fubini; an evaluated iterated integral
alone is not used as evidence of integrability.

The final specialization evaluates `exp(normSq(B*w))` for a real two-by-two
matrix. This supplies the Gaussian mass after one side of the bipartite kernel
has been integrated. Polynomial insertion and the weighted Hermite/Fock
coefficient identity remain separate obligations.
-/

open MeasureTheory ProbabilityTheory Complex Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.WeightedHSMass

noncomputable section

private theorem cexp_real_linear (rate : ℝ) (a z : ℂ) :
    cexp (-((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) + a * z + conj a * conj z) =
      (Real.exp (-(rate - 1) * normSq z + 2 * (a * z).re) : ℂ) := by
  have hc : a * z + conj a * conj z = 2 * ((a * z).re : ℂ) := by
    simpa only [map_mul, ofReal_mul, ofReal_ofNat] using Complex.add_conj (a * z)
  have he : -((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) + a * z + conj a * conj z =
      ((-(rate - 1) * normSq z + 2 * (a * z).re : ℝ) : ℂ) := by
    calc
      _ = -((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) +
          (a * z + conj a * conj z) := by ring
      _ = -((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) + 2 * ((a * z).re : ℂ) := by rw [hc]
      _ = _ := by push_cast; ring
  rw [he, ← ofReal_exp]

/-- The real exponential tilt with an arbitrary complex linear source. -/
theorem integral_gaussC_exp_real_linear {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    (∫ z : ℂ, Real.exp (-(rate - 1) * normSq z + 2 * (a * z).re) ∂gaussC) =
      rate⁻¹ * Real.exp (normSq a / rate) := by
  have h := integral_gaussC_cexp_linear hrate a (conj a)
  simp_rw [cexp_real_linear] at h
  rw [integral_complex_ofReal, Complex.mul_conj] at h
  have hrhs : (rate : ℂ)⁻¹ * cexp ((normSq a : ℂ) / (rate : ℂ)) =
      ((rate⁻¹ * Real.exp (normSq a / rate) : ℝ) : ℂ) := by
    simp only [ofReal_mul, ofReal_inv, ofReal_exp, ofReal_div]
  rw [hrhs] at h
  exact_mod_cast h

theorem integrable_gaussC_exp_real_linear {rate : ℝ} (hrate : 0 < rate) (a : ℂ) :
    Integrable (fun z : ℂ =>
      Real.exp (-(rate - 1) * normSq z + 2 * (a * z).re)) gaussC := by
  have h := (integrable_gaussC_cexp_linear hrate a (conj a)).re
  refine h.congr (Filter.Eventually.of_forall fun z => ?_)
  change (cexp (-((rate - 1 : ℝ) : ℂ) * (normSq z : ℂ) +
    a * z + conj a * conj z)).re = _
  rw [cexp_real_linear, ofReal_re]

/-- The density relative to two independent standard complex Gaussians.
After multiplication by their densities, its quadratic form has diagonal
`A,C` and real off-diagonal `B`. -/
def quadraticWeight (A B C : ℝ) (z : ℂ × ℂ) : ℝ :=
  Real.exp (-(A - 1) * normSq z.1 - 2 * B * (z.1 * conj z.2).re -
    (C - 1) * normSq z.2)

theorem quadraticWeight_pos (A B C : ℝ) (z : ℂ × ℂ) :
    0 < quadraticWeight A B C z := Real.exp_pos _

private theorem quadraticWeight_factor (A B C : ℝ) (z w : ℂ) :
    quadraticWeight A B C (z, w) =
      Real.exp (-(C - 1) * normSq w) *
        Real.exp (-(A - 1) * normSq z + 2 * ((-(B : ℂ) * conj w) * z).re) := by
  rw [quadraticWeight, ← Real.exp_add]
  congr 1
  simp only [Complex.mul_re, Complex.mul_im, Complex.neg_re, Complex.neg_im,
    ofReal_re, ofReal_im, conj_re, conj_im]
  ring

theorem integrable_quadraticWeight_inner {A : ℝ} (hA : 0 < A)
    (B C : ℝ) (w : ℂ) :
    Integrable (fun z : ℂ => quadraticWeight A B C (z, w)) gaussC := by
  simp_rw [quadraticWeight_factor]
  exact (integrable_gaussC_exp_real_linear hA (-(B : ℂ) * conj w)).const_mul _

/-- Integrating the first complex coordinate leaves the exact Schur
complement in the second one. -/
theorem integral_quadraticWeight_inner {A : ℝ} (hA : 0 < A)
    (B C : ℝ) (w : ℂ) :
    (∫ z : ℂ, quadraticWeight A B C (z, w) ∂gaussC) =
      A⁻¹ * Real.exp (-((A * C - B ^ 2) / A - 1) * normSq w) := by
  simp_rw [quadraticWeight_factor]
  rw [integral_const_mul, integral_gaussC_exp_real_linear hA]
  have hn : normSq (-(B : ℂ) * conj w) = B ^ 2 * normSq w := by
    rw [normSq_mul, normSq_neg, normSq_ofReal, normSq_conj]
    ring
  rw [hn, mul_left_comm, ← Real.exp_add]
  congr 1
  congr 1
  field_simp [hA.ne']
  ring

/-- Positive pivots imply genuine integrability on the product space.
Nonnegativity identifies the norm in the Fubini criterion with the same
explicit inner Gaussian integral. -/
theorem integrable_quadraticWeight {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    Integrable (quadraticWeight A B C) (gaussC.prod gaussC) := by
  have hrate : 0 < (A * C - B ^ 2) / A := div_pos hdet hA
  have hm : AEStronglyMeasurable (quadraticWeight A B C) (gaussC.prod gaussC) := by
    apply Continuous.aestronglyMeasurable
    unfold quadraticWeight
    fun_prop
  refine (integrable_prod_iff' hm).2
    ⟨Filter.Eventually.of_forall (integrable_quadraticWeight_inner hA B C), ?_⟩
  have hnorm (z : ℂ × ℂ) : ‖quadraticWeight A B C z‖ = quadraticWeight A B C z := by
    rw [Real.norm_eq_abs, abs_of_pos (quadraticWeight_pos A B C z)]
  simp_rw [hnorm, integral_quadraticWeight_inner hA]
  simpa only [zero_mul, Complex.zero_re, mul_zero, add_zero] using
    (integrable_gaussC_exp_real_linear hrate (0 : ℂ)).const_mul A⁻¹

/-- The normalized positive two-complex-variable Gaussian mass.
The determinant power is `-1`, because each complex coordinate has two real
coordinates. There is no residual square root or factor of pi. -/
theorem integral_quadraticWeight {A B C : ℝ}
    (hA : 0 < A) (hdet : 0 < A * C - B ^ 2) :
    (∫ z : ℂ × ℂ, quadraticWeight A B C z ∂gaussC.prod gaussC) =
      (A * C - B ^ 2)⁻¹ := by
  rw [integral_prod_symm _ (integrable_quadraticWeight hA hdet)]
  simp_rw [integral_quadraticWeight_inner hA]
  rw [integral_const_mul]
  have hrate : 0 < (A * C - B ^ 2) / A := div_pos hdet hA
  have h := integral_gaussC_exp_real_linear hrate (0 : ℂ)
  simp only [zero_mul, Complex.zero_re, mul_zero, add_zero,
    normSq_zero, zero_div, Real.exp_zero, mul_one] at h
  rw [h]
  field_simp [hA.ne', hdet.ne']

private theorem exp_normSq_matrix_eq_quadraticWeight (p q r s : ℝ) (w : ℂ × ℂ) :
    Real.exp (normSq ((p : ℂ) * w.1 + (q : ℂ) * w.2) +
      normSq ((r : ℂ) * w.1 + (s : ℂ) * w.2)) =
      quadraticWeight (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
        (1 - q ^ 2 - s ^ 2) w := by
  unfold quadraticWeight
  congr 1
  simp only [normSq_apply, Complex.add_re, Complex.add_im,
    Complex.mul_re, Complex.mul_im, ofReal_re, ofReal_im, conj_re, conj_im]
  ring

/-- Integrability after the first half of the bipartite kernel is integrated.
The hypotheses are the first pivot and determinant of `I-B^T*B`, for
`B = [[p,q],[r,s]]`. -/
theorem integrable_exp_normSq_real_matrix (p q r s : ℝ)
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    Integrable (fun w : ℂ × ℂ =>
      Real.exp (normSq ((p : ℂ) * w.1 + (q : ℂ) * w.2) +
        normSq ((r : ℂ) * w.1 + (s : ℂ) * w.2))) (gaussC.prod gaussC) := by
  simp_rw [exp_normSq_matrix_eq_quadraticWeight]
  exact integrable_quadraticWeight hA (by simpa only [neg_sq] using hdet)

/-- The concrete mass `integral exp(normSq(B*w))` is the inverse determinant
of `I-B^T*B`. The two scalar positivity hypotheses establish convergence. -/
theorem integral_exp_normSq_real_matrix (p q r s : ℝ)
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    (∫ w : ℂ × ℂ,
      Real.exp (normSq ((p : ℂ) * w.1 + (q : ℂ) * w.2) +
        normSq ((r : ℂ) * w.1 + (s : ℂ) * w.2)) ∂gaussC.prod gaussC) =
      ((1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) - (p * q + r * s) ^ 2)⁻¹ := by
  simp_rw [exp_normSq_matrix_eq_quadraticWeight]
  simpa only [neg_sq] using integral_quadraticWeight (B := -(p * q + r * s)) hA
    (by simpa only [neg_sq] using hdet)

/-- Squared norm of the actual four-source holomorphic kernel. The two
complex pairs are independent standard Gaussians. -/
def bipartiteWeight (c : ℂ) (p q r s : ℝ) (zw : (ℂ × ℂ) × (ℂ × ℂ)) : ℝ :=
  ‖c * cexp (((p : ℂ) * zw.2.1 + (q : ℂ) * zw.2.2) * zw.1.1 +
    ((r : ℂ) * zw.2.1 + (s : ℂ) * zw.2.2) * zw.1.2)‖ ^ 2

private theorem integrable_exp_twice_re (a : ℂ) :
    Integrable (fun z : ℂ => Real.exp (2 * (a * z).re)) gaussC := by
  simpa only [sub_self, neg_zero, zero_mul, zero_add] using
    integrable_gaussC_exp_real_linear (rate := 1) (by norm_num) a

/-- Integrability of the first pair follows from two independent real
Gaussian moment-generating functions, for every fixed second pair. -/
theorem integrable_bipartiteWeight_inner (c : ℂ) (p q r s : ℝ) (w : ℂ × ℂ) :
    Integrable (fun z : ℂ × ℂ => bipartiteWeight c p q r s (z, w))
      (gaussC.prod gaussC) := by
  let a : ℂ := (p : ℂ) * w.1 + (q : ℂ) * w.2
  let b : ℂ := (r : ℂ) * w.1 + (s : ℂ) * w.2
  have hpoint (z : ℂ × ℂ) : bipartiteWeight c p q r s (z, w) =
      ‖c‖ ^ 2 * (Real.exp (2 * (a * z.1).re) * Real.exp (2 * (b * z.2).re)) := by
    simp only [bipartiteWeight, a, b, norm_mul, mul_pow, Complex.norm_exp,
      ← Real.exp_nat_mul, Nat.cast_ofNat, Complex.add_re, Real.exp_add]
  simp_rw [hpoint]
  exact ((integrable_exp_twice_re a).mul_prod
    (integrable_exp_twice_re b)).const_mul (‖c‖ ^ 2)

theorem integral_bipartiteWeight_inner (c : ℂ) (p q r s : ℝ) (w : ℂ × ℂ) :
    (∫ z : ℂ × ℂ, bipartiteWeight c p q r s (z, w) ∂gaussC.prod gaussC) =
      ‖c‖ ^ 2 * Real.exp (normSq ((p : ℂ) * w.1 + (q : ℂ) * w.2) +
        normSq ((r : ℂ) * w.1 + (s : ℂ) * w.2)) := by
  simpa only [bipartiteWeight] using
    integral_bipartite_kernel_inner c
      ((p : ℂ) * w.1 + (q : ℂ) * w.2)
      ((r : ℂ) * w.1 + (s : ℂ) * w.2)

/-- The two Schur positivity tests justify Fubini for the complete
four-complex-variable squared kernel, including the case `c = 0`. -/
theorem integrable_bipartiteWeight (c : ℂ) (p q r s : ℝ)
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    Integrable (bipartiteWeight c p q r s)
      ((gaussC.prod gaussC).prod (gaussC.prod gaussC)) := by
  have hm : AEStronglyMeasurable (bipartiteWeight c p q r s)
      ((gaussC.prod gaussC).prod (gaussC.prod gaussC)) := by
    apply Continuous.aestronglyMeasurable
    unfold bipartiteWeight
    fun_prop
  refine (integrable_prod_iff' hm).2
    ⟨Filter.Eventually.of_forall (integrable_bipartiteWeight_inner c p q r s), ?_⟩
  have hnorm (zw : (ℂ × ℂ) × (ℂ × ℂ)) :
      ‖bipartiteWeight c p q r s zw‖ = bipartiteWeight c p q r s zw := by
    rw [Real.norm_eq_abs, abs_of_nonneg (sq_nonneg _)]
  simp_rw [hnorm, integral_bipartiteWeight_inner]
  exact (integrable_exp_normSq_real_matrix p q r s hA hdet).const_mul (‖c‖ ^ 2)

/-- Exact mass of the holomorphic bipartite Gaussian kernel. The entire
four-coordinate integral is evaluated; the later Fock-series/Parseval and
polynomial-insertion arguments are not hypotheses of this theorem. -/
theorem integral_bipartiteWeight (c : ℂ) (p q r s : ℝ)
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    (∫ zw : (ℂ × ℂ) × (ℂ × ℂ), bipartiteWeight c p q r s zw
      ∂(gaussC.prod gaussC).prod (gaussC.prod gaussC)) =
      ‖c‖ ^ 2 *
        ((1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) - (p * q + r * s) ^ 2)⁻¹ := by
  rw [integral_prod_symm _ (integrable_bipartiteWeight c p q r s hA hdet)]
  simp_rw [integral_bipartiteWeight_inner]
  rw [integral_const_mul, integral_exp_normSq_real_matrix p q r s hA hdet]

end
end Grothe.UpperChaos.WeightedHSMass
