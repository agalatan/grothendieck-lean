import Grothe.UpperChaos.ShiftedDampedMoments
import Grothe.UpperChaos.AffineGaussianSquare
import Mathlib.MeasureTheory.Group.Integral

/-!
# Exact conditional Gaussian integration of the affine phase kernel

Completion of squares translates the conditional complex Gaussian by its
actual complex mean. The positive radial rate is kept unnormalized: the
shifted moment evaluator already contains its inverse mass. No rotation of
`z`, numerical integration, or quantitative approximation bound is assumed.

Agent-ID: codex-37fb
-/

open MeasureTheory ProbabilityTheory Real Grothe.LowerAnalytic Grothe.Haag
open scoped ComplexConjugate

namespace Grothe.UpperChaos

noncomputable section

/-- Every mixed monomial times the affine kernel is integrable at fixed positive rates. -/
theorem integrable_affine_phaseLaplace_monomial (p q : ℕ) (α a t : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    Integrable (fun w : ℂ => w ^ p * conj w ^ q *
      phaseLaplaceKernel (z + (a : ℂ) * w) t *
        (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)) gaussC := by
  let s : ℝ := t ^ (-(1 / 2 : ℝ))
  have hs : 0 ≤ s := Real.rpow_nonneg ht.le _
  have hkernel (w : ℂ) : ‖phaseLaplaceKernel (z + (a : ℂ) * w) t‖ ≤
      s * (‖z‖ + ‖(a : ℂ)‖ * ‖w‖) := by
    have he : Real.exp (-(‖z + (a : ℂ) * w‖ ^ 2 * t)) ≤ 1 :=
      Real.exp_le_one_iff.mpr (neg_nonpos.mpr (mul_nonneg (sq_nonneg _) ht.le))
    have hn : 0 ≤ s * Real.exp (-(‖z + (a : ℂ) * w‖ ^ 2 * t)) :=
      mul_nonneg hs (Real.exp_pos _).le
    change ‖((s * Real.exp (-(‖z + (a : ℂ) * w‖ ^ 2 * t)) : ℝ) : ℂ) *
      (z + (a : ℂ) * w)‖ ≤ _
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hn]
    calc
      s * Real.exp (-(‖z + (a : ℂ) * w‖ ^ 2 * t)) * ‖z + (a : ℂ) * w‖ ≤
          s * 1 * ‖z + (a : ℂ) * w‖ :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left he hs) (norm_nonneg _)
      _ = s * ‖z + (a : ℂ) * w‖ := by rw [mul_one]
      _ ≤ s * (‖z‖ + ‖(a : ℂ)‖ * ‖w‖) :=
        mul_le_mul_of_nonneg_left (by simpa only [norm_mul] using
          (norm_add_le z ((a : ℂ) * w))) hs
  let f : ℂ → ℂ := fun w => w ^ p * conj w ^ q *
    (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)
  let g : ℂ → ℂ := fun w => w ^ (p + 1) * conj w ^ q *
    (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)
  have hf : Integrable f gaussC := integrable_monomial_damped p q hα
  have hg : Integrable g gaussC := integrable_monomial_damped (p + 1) q hα
  have hmajor : Integrable (fun w : ℂ => s * (‖z‖ * ‖f w‖ + ‖(a : ℂ)‖ * ‖g w‖)) gaussC :=
    ((hf.norm.const_mul ‖z‖).add (hg.norm.const_mul ‖(a : ℂ)‖)).const_mul s
  refine hmajor.mono' ?_ (Filter.Eventually.of_forall fun w => ?_)
  · dsimp only [phaseLaplaceKernel]
    fun_prop
  · calc
      ‖w ^ p * conj w ^ q * phaseLaplaceKernel (z + (a : ℂ) * w) t *
          (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)‖ =
        ‖w ^ p * conj w ^ q‖ * ‖phaseLaplaceKernel (z + (a : ℂ) * w) t‖ *
          Real.exp (-(α - 1) * Complex.normSq w) := by
            rw [norm_mul, norm_mul, Complex.norm_real, Real.norm_eq_abs,
              abs_of_pos (Real.exp_pos _)]
      _ ≤ ‖w ^ p * conj w ^ q‖ * (s * (‖z‖ + ‖(a : ℂ)‖ * ‖w‖)) *
          Real.exp (-(α - 1) * Complex.normSq w) :=
        mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_left (hkernel w) (norm_nonneg _)) (Real.exp_pos _).le
      _ = s * (‖z‖ * ‖f w‖ + ‖(a : ℂ)‖ * ‖g w‖) := by
        dsimp only [f, g]
        simp only [norm_mul, norm_pow, Complex.norm_conj, Complex.norm_real,
          Real.norm_eq_abs, abs_of_pos (Real.exp_pos _), pow_succ]
        ring

/-- Conditional centering of the phase kernel for an arbitrary measurable source.
The equality is a change of variables, with the original Gaussian density included. -/
theorem integral_affine_phaseLaplace_tilt (P : ℂ → ℂ) (hP : Measurable P)
    (α a t : ℝ) (z : ℂ) (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    (∫ w, P w * phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
        ∫ v, P (v + μ) * (z + (a : ℂ) * (v + μ)) *
          (Real.exp (-(β - 1) * Complex.normSq v) : ℂ) ∂gaussC := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  let c : ℂ := ((t ^ (-(1 / 2 : ℝ)) *
    Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ)
  let G : ℂ → ℂ := fun w => P w * phaseLaplaceKernel (z + (a : ℂ) * w) t *
    (Real.exp (-(α - 1) * Complex.normSq w) : ℂ)
  let H : ℂ → ℂ := fun v => P (v + μ) * (z + (a : ℂ) * (v + μ)) *
    (Real.exp (-(β - 1) * Complex.normSq v) : ℂ)
  change (∫ w, G w ∂gaussC) = c * ∫ v, H v ∂gaussC
  have hG : Measurable G := by
    dsimp only [G, phaseLaplaceKernel]
    fun_prop
  have hH : Measurable H := by
    dsimp only [H]
    fun_prop
  have hpoint (v : ℂ) :
      (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) =
        c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) := by
    have hleft : Real.exp (-Complex.normSq (v + μ)) *
        Real.exp (-(Complex.normSq (z + (a : ℂ) * (v + μ)) * t)) *
        Real.exp (-(α - 1) * Complex.normSq (v + μ)) =
          Real.exp (-α * Complex.normSq (v + μ) -
            t * Complex.normSq (z + (a : ℂ) * (v + μ))) := by
      rw [← Real.exp_add, ← Real.exp_add]
      congr 1
      ring
    have hcenter := affine_gaussian_shift_exp_factor α a t z v hα ht
    change Real.exp (-α * Complex.normSq (v + μ) -
      t * Complex.normSq (z + (a : ℂ) * (v + μ))) =
        Real.exp (-(α * t * Complex.normSq z / β)) * Real.exp (-β * Complex.normSq v)
      at hcenter
    have hright : Real.exp (-β * Complex.normSq v) =
        Real.exp (-Complex.normSq v) *
          Real.exp (-(β - 1) * Complex.normSq v) := by
      rw [← Real.exp_add]
      congr 1
      ring
    calc
      (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) =
          (((π⁻¹ * t ^ (-(1 / 2 : ℝ)) *
            (Real.exp (-Complex.normSq (v + μ)) *
              Real.exp (-(Complex.normSq (z + (a : ℂ) * (v + μ)) * t)) *
              Real.exp (-(α - 1) * Complex.normSq (v + μ)))) : ℝ) : ℂ) *
              (P (v + μ) * (z + (a : ℂ) * (v + μ))) := by
        dsimp only [G, phaseLaplaceKernel]
        simp only [Complex.real_smul, Complex.ofReal_mul, ← Complex.normSq_eq_norm_sq]
        ring
      _ = c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) := by
        rw [hleft, hcenter, hright]
        dsimp only [c, H]
        simp only [Complex.real_smul, Complex.ofReal_mul]
        ring
  calc
    (∫ w, G w ∂gaussC) =
        ∫ w : ℂ, (π⁻¹ * Real.exp (-Complex.normSq w)) • G w :=
      integral_gaussC_eq_volume_complex G hG
    _ = ∫ v : ℂ, (π⁻¹ * Real.exp (-Complex.normSq (v + μ))) • G (v + μ) :=
      (integral_add_right_eq_self (μ := (volume : Measure ℂ))
        (fun w : ℂ => (π⁻¹ * Real.exp (-Complex.normSq w)) • G w) μ).symm
    _ = ∫ v : ℂ, c * ((π⁻¹ * Real.exp (-Complex.normSq v)) • H v) :=
      integral_congr_ae (Filter.Eventually.of_forall hpoint)
    _ = c * ∫ v : ℂ, (π⁻¹ * Real.exp (-Complex.normSq v)) • H v := by
      rw [integral_const_mul]
    _ = c * ∫ v, H v ∂gaussC := by
      rw [← integral_gaussC_eq_volume_complex H hH]

/-- Exact finite conditional moment of a mixed monomial times the affine phase kernel. -/
theorem integral_affine_phaseLaplace_monomial (p q : ℕ) (α a t : ℝ) (z : ℂ)
    (hα : 0 < α) (ht : 0 < t) :
    let β : ℝ := α + a ^ 2 * t
    let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
    (∫ w, w ^ p * conj w ^ q * phaseLaplaceKernel (z + (a : ℂ) * w) t *
      (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
      ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
        (z * shiftedDampedMoment β μ p q +
          (a : ℂ) * shiftedDampedMoment β μ (p + 1) q) := by
  let β : ℝ := α + a ^ 2 * t
  let μ : ℂ := -((a * t / β : ℝ) : ℂ) * z
  have hβ : 0 < β := add_pos_of_pos_of_nonneg hα (mul_nonneg (sq_nonneg a) ht.le)
  let F (r s : ℕ) (v : ℂ) : ℂ := (v + μ) ^ r * conj (v + μ) ^ s *
    (Real.exp (-(β - 1) * Complex.normSq v) : ℂ)
  have hF (r s : ℕ) : Integrable (F r s) gaussC :=
    integrable_shifted_monomial_damped r s μ hβ
  have hFint (r s : ℕ) : (∫ v, F r s v ∂gaussC) = shiftedDampedMoment β μ r s :=
    integral_shifted_moment_damped r s μ hβ
  have hpoly : (fun v : ℂ => (v + μ) ^ p * conj (v + μ) ^ q *
      (z + (a : ℂ) * (v + μ)) * (Real.exp (-(β - 1) * Complex.normSq v) : ℂ)) =
        fun v => z * F p q v + (a : ℂ) * F (p + 1) q v := by
    funext v
    dsimp only [F]
    rw [pow_succ]
    ring
  have hinner :
      (∫ v, (v + μ) ^ p * conj (v + μ) ^ q * (z + (a : ℂ) * (v + μ)) *
        (Real.exp (-(β - 1) * Complex.normSq v) : ℂ) ∂gaussC) =
      z * shiftedDampedMoment β μ p q + (a : ℂ) * shiftedDampedMoment β μ (p + 1) q := by
    rw [hpoly, integral_add ((hF p q).const_mul z) ((hF (p + 1) q).const_mul (a : ℂ)),
      integral_const_mul, integral_const_mul, hFint p q, hFint (p + 1) q]
  have h := integral_affine_phaseLaplace_tilt (fun w : ℂ => w ^ p * conj w ^ q)
    (by fun_prop) α a t z hα ht
  change (∫ w, w ^ p * conj w ^ q * phaseLaplaceKernel (z + (a : ℂ) * w) t *
    (Real.exp (-(α - 1) * Complex.normSq w) : ℂ) ∂gaussC) =
    ((t ^ (-(1 / 2 : ℝ)) * Real.exp (-(α * t * Complex.normSq z / β)) : ℝ) : ℂ) *
      ∫ v, (v + μ) ^ p * conj (v + μ) ^ q * (z + (a : ℂ) * (v + μ)) *
        (Real.exp (-(β - 1) * Complex.normSq v) : ℂ) ∂gaussC at h
  rw [hinner] at h
  exact h

end
end Grothe.UpperChaos
