import Grothe.UpperChaos.BipartitePolynomialL2
import Grothe.UpperChaos.LinearTiltedMoments
import Grothe.UpperChaos.QuadraticPolynomialMoments

/-!
# Exact conditional moments of the bipartite kernel Gram matrix

Agent-ID: codex-2ca4.

Complete WIP proof bodies; compilation remains pending.

The first source pair is integrated against its two independent standard
complex Gaussians. Every holomorphic exponent comes from f and every
antiholomorphic exponent comes from e. The resulting finite shifted moments
have means conjugate(image w), and the remaining density is exactly the
quadraticWeight associated with I-B^T B. The scalar kernel mass |c|^2 remains
explicit. Joint integrability follows from the existing polynomial L2 theorem
under the original Schur conditions. This file does not claim a finite scalar
evaluation of the remaining correlated two-variable polynomial integral.
-/

open MeasureTheory Grothe.LowerAnalytic
open scoped ComplexConjugate

namespace Grothe.UpperChaos.BipartiteKernelGramMoments

open BipartitePolynomialL2 WeightedHSMass

noncomputable section

/-- The unnormalized Gram monomial, with the actual squared kernel norm. -/
def gramIntegrand (e f : PairPowers) (c : ℂ) (p q r s : ℝ)
    (zw : PairSources) : ℂ :=
  conj (monomial e zw) * monomial f zw *
    ((‖kernel c p q r s zw‖ ^ 2 : ℝ) : ℂ)

/-- This is precisely the L2 pairing of the two actual monomial-kernel
functions; no normalization or conjugation convention is changed. -/
theorem gramIntegrand_eq_pairing (e f : PairPowers) (c : ℂ) (p q r s : ℝ)
    (zw : PairSources) :
    gramIntegrand e f c p q r s zw =
      conj (monomial e zw * kernel c p q r s zw) *
        (monomial f zw * kernel c p q r s zw) := by
  have hk : conj (kernel c p q r s zw) * kernel c p q r s zw =
      ((‖kernel c p q r s zw‖ ^ 2 : ℝ) : ℂ) := by
    simpa only [Complex.ofReal_pow] using Complex.conj_mul' (kernel c p q r s zw)
  unfold gramIntegrand
  rw [← hk]
  simp only [map_mul]
  ring

/-- The outer monomial keeps the original powers on the second source pair. -/
def outerMonomial (e f : PairPowers) (w : ℂ × ℂ) : ℂ :=
  (w.1 ^ f.2.1 * conj w.1 ^ e.2.1) *
    (w.2 ^ f.2.2 * conj w.2 ^ e.2.2)

/-- A monomial under the real linear tilt of one standard Gaussian. -/
def tiltedMonomial (u v : ℕ) (a z : ℂ) : ℂ :=
  z ^ u * conj z ^ v * (Real.exp (2 * (a * z).re) : ℂ)

theorem integrable_tiltedMonomial (u v : ℕ) (a : ℂ) :
    Integrable (tiltedMonomial u v a) gaussC := by
  unfold tiltedMonomial
  simpa only [sub_self, neg_zero, zero_mul, zero_add] using
    LinearTiltedMoments.integrable_mixed_moment u v (show (0 : ℝ) < 1 by norm_num) a

/-- The unit-rate tilted moment retains both the exponential mass and the
conjugate source shift, with no factorial or power omitted. -/
theorem integral_tiltedMonomial (u v : ℕ) (a : ℂ) :
    (∫ z, tiltedMonomial u v a z ∂gaussC) =
      (Real.exp (Complex.normSq a) : ℂ) *
        shiftedDampedMoment 1 (conj a) u v := by
  simpa only [tiltedMonomial, sub_self, neg_zero, zero_mul, zero_add,
    div_one, LinearTiltedMoments.mean, inv_one, Complex.ofReal_one, one_mul] using
    LinearTiltedMoments.integral_mixed_moment u v (show (0 : ℝ) < 1 by norm_num) a

/-- Pointwise separation of the kernel norm into the two real linear tilts. -/
theorem norm_kernel_sq_factor (c : ℂ) (p q r s : ℝ) (z w : ℂ × ℂ) :
    ‖kernel c p q r s (z, w)‖ ^ 2 =
      ‖c‖ ^ 2 *
        (Real.exp (2 * ((image p q r s w).1 * z.1).re) *
          Real.exp (2 * ((image p q r s w).2 * z.2).re)) := by
  simp only [kernel, norm_mul, mul_pow, Complex.norm_exp,
    ← Real.exp_nat_mul, Nat.cast_ofNat, coupling, Complex.add_re,
    Real.exp_add]

/-- The complete Gram integrand factors before any integration is performed. -/
theorem gramIntegrand_factor (e f : PairPowers) (c : ℂ) (p q r s : ℝ)
    (z w : ℂ × ℂ) :
    gramIntegrand e f c p q r s (z, w) =
      (((‖c‖ ^ 2 : ℝ) : ℂ) * outerMonomial e f w) *
        (tiltedMonomial f.1.1 e.1.1 (image p q r s w).1 z.1 *
          tiltedMonomial f.1.2 e.1.2 (image p q r s w).2 z.2) := by
  unfold gramIntegrand
  rw [norm_kernel_sq_factor]
  simp only [monomial, outerMonomial, tiltedMonomial, map_mul, map_pow,
    Complex.ofReal_mul]
  ring

/-- Every first-pair conditional integral is absolutely integrable even
before Schur positivity is imposed on the full source space. -/
theorem integrable_gramIntegrand_inner (e f : PairPowers) (c : ℂ)
    (p q r s : ℝ) (w : ℂ × ℂ) :
    Integrable (fun z : ℂ × ℂ => gramIntegrand e f c p q r s (z, w))
      (gaussC.prod gaussC) := by
  simp_rw [gramIntegrand_factor]
  exact ((integrable_tiltedMonomial f.1.1 e.1.1 (image p q r s w).1).mul_prod
    (integrable_tiltedMonomial f.1.2 e.1.2 (image p q r s w).2)).const_mul _

/-- After the first pair is integrated, its exponential mass is precisely
the residual density for I-B^T B, relative to the original outer Gaussians. -/
theorem exp_image_sq_eq_quadraticWeight (p q r s : ℝ) (w : ℂ × ℂ) :
    Real.exp (Complex.normSq (image p q r s w).1 +
      Complex.normSq (image p q r s w).2) =
      quadraticWeight (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
        (1 - q ^ 2 - s ^ 2) w := by
  unfold quadraticWeight image
  congr 1
  simp only [Complex.normSq_apply, Complex.add_re, Complex.add_im,
    Complex.mul_re, Complex.mul_im, Complex.ofReal_re, Complex.ofReal_im,
    Complex.conj_re, Complex.conj_im]
  ring

/-- The actual finite polynomial remaining in w and conjugate w. The shift
orders are (f,e), since e indexes the conjugated Gram factor. -/
def conditionalPolynomial (e f : PairPowers) (p q r s : ℝ) (w : ℂ × ℂ) : ℂ :=
  outerMonomial e f w *
    shiftedDampedMoment 1 (conj (image p q r s w).1) f.1.1 e.1.1 *
      shiftedDampedMoment 1 (conj (image p q r s w).2) f.1.2 e.1.2

/-- Exact conditional Gram evaluation for every pair of monomial indices.
The scalar kernel mass, both finite shifted moments, and the residual
correlated Gaussian are all explicit. -/
theorem integral_gramIntegrand_inner (e f : PairPowers) (c : ℂ)
    (p q r s : ℝ) (w : ℂ × ℂ) :
    (∫ z : ℂ × ℂ, gramIntegrand e f c p q r s (z, w)
      ∂gaussC.prod gaussC) =
      ((‖c‖ ^ 2 : ℝ) : ℂ) * conditionalPolynomial e f p q r s w *
        (quadraticWeight (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
          (1 - q ^ 2 - s ^ 2) w : ℂ) := by
  have he :
      (Real.exp (Complex.normSq (image p q r s w).1) : ℂ) *
          (Real.exp (Complex.normSq (image p q r s w).2) : ℂ) =
        (quadraticWeight (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
          (1 - q ^ 2 - s ^ 2) w : ℂ) := by
    rw [← Complex.ofReal_mul, ← Real.exp_add, exp_image_sq_eq_quadraticWeight]
  simp_rw [gramIntegrand_factor]
  rw [integral_const_mul, integral_prod_mul,
    integral_tiltedMonomial f.1.1 e.1.1, integral_tiltedMonomial f.1.2 e.1.2]
  calc
    _ = ((‖c‖ ^ 2 : ℝ) : ℂ) * conditionalPolynomial e f p q r s w *
        ((Real.exp (Complex.normSq (image p q r s w).1) : ℂ) *
          (Real.exp (Complex.normSq (image p q r s w).2) : ℂ)) := by
      unfold conditionalPolynomial
      ring
    _ = _ := by rw [he]

/-- The existing L2 theorem justifies joint Gram integrability at precisely
the original first-pivot and determinant conditions, also when c is zero. -/
theorem integrable_gramIntegrand (e f : PairPowers) (c : ℂ) {p q r s : ℝ}
    (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    Integrable (gramIntegrand e f c p q r s) pairMeasure := by
  have hi := (memLp_monomial_kernel e c hA hdet).star.integrable_mul
    (memLp_monomial_kernel f c hA hdet)
  refine hi.congr (Filter.Eventually.of_forall fun zw => ?_)
  change conj (monomial e zw * kernel c p q r s zw) *
    (monomial f zw * kernel c p q r s zw) = gramIntegrand e f c p q r s zw
  exact (gramIntegrand_eq_pairing e f c p q r s zw).symm

/-- Fubini turns the full actual Gram entry into a correlated two-variable
polynomial moment. No physical/source interchange or moment identity is a
hypothesis; the remaining outer integral is the next finite-evaluation step. -/
theorem integral_gramIntegrand_eq_conditional (e f : PairPowers) (c : ℂ)
    {p q r s : ℝ} (hA : 0 < 1 - p ^ 2 - r ^ 2)
    (hdet : 0 < (1 - p ^ 2 - r ^ 2) * (1 - q ^ 2 - s ^ 2) -
      (p * q + r * s) ^ 2) :
    (∫ zw, gramIntegrand e f c p q r s zw ∂pairMeasure) =
      ((‖c‖ ^ 2 : ℝ) : ℂ) *
        ∫ w : ℂ × ℂ, conditionalPolynomial e f p q r s w *
          (quadraticWeight (1 - p ^ 2 - r ^ 2) (-(p * q + r * s))
            (1 - q ^ 2 - s ^ 2) w : ℂ) ∂gaussC.prod gaussC := by
  rw [integral_prod_symm _ (integrable_gramIntegrand e f c hA hdet)]
  simp_rw [integral_gramIntegrand_inner, mul_assoc]
  rw [integral_const_mul]

end
end Grothe.UpperChaos.BipartiteKernelGramMoments
